uint64_t lifs_kext_start()
{
  if (lifs_add())
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to add lifs");
    return 5;
  }
  else
  {
    lifs_register_sysctl();
    return 0;
  }
}

uint64_t lifs_kext_stop()
{
  if (vfs_fsremove(0))
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to remove lifs");
    return 5;
  }
  else
  {
    lifs_unregister_sysctl();
    return 0;
  }
}

uint64_t lifs_set_machport(uint64_t a1, unsigned char *a2)
{
  lck_rw_lock_exclusive((lck_rw_t *)&lifs_port_rwlock);
  if (*a2)
  {
    uint64_t v4 = 15;
  }
  else if (a1 == -1)
  {
    uint64_t v4 = 29;
  }
  else
  {
    uint64_t v5 = lifs_port;
    lifs_port = a1;
    if (v5) {
      ipc_port_release_send();
    }
    if (a1) {
      int v6 = proc_selfpid();
    }
    else {
      int v6 = 0;
    }
    uint64_t v4 = 0;
    lifs_port_pid = v6;
  }
  lck_rw_unlock_exclusive((lck_rw_t *)&lifs_port_rwlock);
  return v4;
}

BOOL is_machport_proc()
{
  int v0 = lifs_port_pid;
  return lifs_port_pid && v0 == proc_selfpid();
}

void lifs_req_hashtbl_init()
{
  lifs_req_hashtbl = (uint64_t)hashinit(512, 80, (u_long *)&lifs_req_hashtbl_mask);
  uint64_t v0 = lifs_num_cpus();
  int powerof2 = lifs_next_powerof2(v0, v1);
  unsigned int v3 = (lifs_req_hashtbl_mask + 1) >> 2;
  if (v3 > 2 * powerof2)
  {
    uint64_t v4 = lifs_num_cpus();
    unsigned int v3 = 2 * lifs_next_powerof2(v4, v5);
  }
  lifs_req_hashtbl_num_locks = v3;
  lifs_req_hashtbl_locks = kalloc_data();
  if (lifs_req_hashtbl_num_locks)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      lck_rw_init((lck_rw_t *)(lifs_req_hashtbl_locks + v6), (lck_grp_t *)lifs_kext_grp, 0);
      ++v7;
      v6 += 16;
    }
    while (v7 < lifs_req_hashtbl_num_locks);
  }
  lifs_req_num_locks = lifs_num_cpus();
  lifs_req_locks = kalloc_data();
  if (lifs_req_num_locks)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      lck_mtx_init((lck_mtx_t *)(lifs_req_locks + v8), (lck_grp_t *)lifs_kext_grp, 0);
      ++v9;
      v8 += 16;
    }
    while (v9 < lifs_req_num_locks);
  }
}

uint64_t lifs_req_hashtbl_deinit()
{
  if (lifs_req_hashtbl_num_locks)
  {
    uint64_t v0 = 0;
    unint64_t v1 = 0;
    do
    {
      lck_rw_destroy((lck_rw_t *)(lifs_req_hashtbl_locks + v0), (lck_grp_t *)lifs_kext_grp);
      ++v1;
      v0 += 16;
    }
    while (v1 < lifs_req_hashtbl_num_locks);
  }
  lifs_req_hashtbl_locks = 0;
  kfree_data();
  hashdestroy((void *)lifs_req_hashtbl, 80, lifs_req_hashtbl_mask);
  if (lifs_req_num_locks)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      lck_mtx_free((lck_mtx_t *)(lifs_req_locks + v2), (lck_grp_t *)lifs_kext_grp);
      ++v3;
      v2 += 16;
    }
    while (v3 < lifs_req_num_locks);
  }
  lifs_req_locks = 0;

  return kfree_data();
}

uint64_t lifs_mount_request(uint64_t a1, const char *a2, const char *a3, int a4, int a5, long long *a6, uint64_t a7)
{
  v17 = 0;
  uint64_t lifs_port = get_lifs_port(&v17);
  if (!lifs_port)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    memset(v18, 0, sizeof(v18));
    *(void *)&long long v19 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v20 = a1;
    DWORD2(v19) = 1638400;
    DWORD2(v20) = 248;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    *(void *)&long long v21 = a7;
    lifs_add_req(v18);
    int v15 = lifs_mount_send(v17, v19, a2, a3, a4, a5, a6);
    if (v15)
    {
      uint64_t lifs_port = 4;
      if (v15 != 268435463 && v15 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_mount_send() failed, err: %d\n", "lifs_mount_request", lifs_port);
      DWORD2(v19) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v18);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v18);
      return HIDWORD(v19);
    }
  }
  return lifs_port;
}

void lifs_request_init(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = OSAddAtomic64(1, &lifs_request_id);
  *(void *)(a1 + 48) = a2;
  *(_DWORD *)(a1 + 40) = a3 << 16;
  *(void *)(a1 + 64) = a4;
  *(_DWORD *)(a1 + 56) = a5;
  *(void *)(a1 + 80) = a6;
  *(void *)(a1 + 88) = a7;
  if (a3 != a3) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "lifs_request for opcode %x outside valid range", a3);
  }
}

void lifs_add_req(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  uint64_t v4 = (uint64_t *)(lifs_req_hashtbl + 8 * (lifs_req_hashtbl_mask & v3));
  int8x8_t v5 = (lck_rw_t *)(lifs_req_hashtbl_locks + 16 * (v3 % lifs_req_hashtbl_num_locks));
  lck_rw_lock_exclusive(v5);
  uint64_t v6 = *v4;
  if (*v4)
  {
    if (*(uint64_t **)(v6 + 8) != v4)
    {
      __break(0xBFFDu);
      return;
    }
    *a1 = v6;
    *(void *)(v6 + 8) = a1;
  }
  else
  {
    *a1 = 0;
  }
  *uint64_t v4 = (uint64_t)a1;
  a1[1] = v4;
  lck_rw_unlock_exclusive(v5);
  lck_mtx_lock((lck_mtx_t *)(v2 + 680));
  a1[2] = 0;
  unint64_t v7 = *(void **)(v2 + 608);
  a1[3] = v7;
  *unint64_t v7 = a1;
  *(void *)(v2 + 608) = a1 + 2;

  lck_mtx_unlock((lck_mtx_t *)(v2 + 680));
}

void lifs_remove_req(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = (lck_rw_t *)(lifs_req_hashtbl_locks + 16 * (a1[4] % lifs_req_hashtbl_num_locks));
  lck_rw_lock_exclusive(v3);
  uint64_t v4 = *a1;
  if (*a1)
  {
    if (*(uint64_t **)(v4 + 8) != a1)
    {
      __break(0xBFFDu);
      JUMPOUT(0x4830);
    }
    int8x8_t v5 = (uint64_t **)a1[1];
    if (*v5 != a1) {
      goto LABEL_20;
    }
    *(void *)(v4 + 8) = v5;
    uint64_t v6 = (uint64_t **)a1[1];
  }
  else
  {
    uint64_t v6 = (uint64_t **)a1[1];
    if (*v6 != a1) {
      goto LABEL_20;
    }
  }
  *uint64_t v6 = (uint64_t *)v4;
  lck_rw_unlock_exclusive(v3);
  lck_mtx_lock((lck_mtx_t *)(v2 + 680));
  if ((a1[5] & 4) != 0) {
    goto LABEL_14;
  }
  uint64_t v7 = a1[2];
  if (!v7)
  {
    unint64_t v9 = (uint64_t **)a1[3];
    if (*v9 == a1)
    {
      *(void *)(v2 + 608) = v9;
      goto LABEL_13;
    }
LABEL_18:
    __break(0xBFFDu);
    JUMPOUT(0x4824);
  }
  if (*(uint64_t **)(v7 + 24) != a1 + 2)
  {
LABEL_20:
    __break(0xBFFDu);
    JUMPOUT(0x4818);
  }
  uint64_t v8 = (uint64_t **)a1[3];
  if (*v8 != a1) {
    goto LABEL_18;
  }
  *(void *)(v7 + 24) = v8;
  unint64_t v9 = (uint64_t **)a1[3];
LABEL_13:
  *unint64_t v9 = (uint64_t *)v7;
LABEL_14:

  lck_mtx_unlock((lck_mtx_t *)(v2 + 680));
}

void lifs_wait_req_completion(uint64_t a1)
{
  uint64_t v2 = (lck_mtx_t *)(lifs_req_locks + 16 * (*(void *)(a1 + 32) % (uint64_t)lifs_req_num_locks));
  lck_mtx_lock(v2);
  if ((*(unsigned char *)(a1 + 40) & 1) == 0 && msleep((void *)a1, v2, 21, "lifs_wait_req_completion", 0))
  {
    *(_DWORD *)(a1 + 44) = 5;
    lifs_find_and_remove_req_byid(*(void *)(a1 + 32));
  }

  lck_mtx_unlock(v2);
}

uint64_t lifs_unmount_request(uint64_t a1, int a2, long long *a3)
{
  v10 = 0;
  uint64_t lifs_port = get_lifs_port(&v10);
  if (lifs_port)
  {
    uint64_t v7 = lifs_port;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "lifs_u_req no port\n");
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    memset(v11, 0, sizeof(v11));
    *(void *)&long long v12 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v13 = a1;
    DWORD2(v12) = 0x20000;
    DWORD2(v13) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    *(void *)&long long v14 = 0;
    lifs_add_req(v11);
    int v8 = lifs_unmount_send(v10, v12, a2, a3);
    if (v8)
    {
      uint64_t v7 = 4;
      if (v8 != 268435463 && v8 != 268451845) {
        uint64_t v7 = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_unmount_send() failed, err: %d\n", "lifs_unmount_request", v7);
      DWORD2(v12) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v11);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v11);
      return HIDWORD(v12);
    }
  }
  return v7;
}

uint64_t lifs_unmount2_request(uint64_t a1, int a2, long long *a3)
{
  v10 = 0;
  uint64_t lifs_port = get_lifs_port(&v10);
  if (lifs_port)
  {
    uint64_t v7 = lifs_port;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "lifs_u2_req no port\n");
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    memset(v11, 0, sizeof(v11));
    *(void *)&long long v12 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v13 = a1;
    DWORD2(v12) = 0x20000;
    DWORD2(v13) = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    *(void *)&long long v14 = 0;
    lifs_add_req(v11);
    int v8 = lifs_unmount2_send(v10, v12, a2, a3);
    if (v8)
    {
      uint64_t v7 = 4;
      if (v8 != 268435463 && v8 != 268451845) {
        uint64_t v7 = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_unmount2_send() failed, err: %d\n", "lifs_unmount2_request", v7);
      DWORD2(v12) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v11);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v11);
      return HIDWORD(v12);
    }
  }
  return v7;
}

uint64_t lifs_statfs_request(uint64_t a1, long long *a2, uint64_t a3)
{
  unint64_t v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 196608;
    DWORD2(v12) = 56;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_statfs_send(v9, v11, a2);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_statfs_send() failed, err: %d\n", "lifs_statfs_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_create_request(uint64_t a1, const char *a2, _OWORD *a3, _OWORD *a4, uint64_t a5)
{
  long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 0x40000;
    DWORD2(v16) = 448;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int send = lifs_create_send(v13, v15, a2, a3, a4);
    if (send)
    {
      uint64_t lifs_port = 4;
      if (send != 268435463 && send != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_create_send() failed, err: %d\n", "lifs_create_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

uint64_t lifs_clonefile_request(uint64_t a1, const char *a2, _OWORD *a3, _OWORD *a4, int a5, _OWORD *a6, uint64_t a7)
{
  long long v17 = 0;
  uint64_t lifs_port = get_lifs_port(&v17);
  if (!lifs_port)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    memset(v18, 0, sizeof(v18));
    *(void *)&long long v19 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v20 = a1;
    DWORD2(v19) = 0x40000;
    DWORD2(v20) = 448;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    *(void *)&long long v21 = a7;
    lifs_add_req(v18);
    int v15 = lifs_clonefile_send(v17, v19, a2, a3, a4, a5, a6);
    if (v15)
    {
      uint64_t lifs_port = 4;
      if (v15 != 268435463 && v15 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_clonefile_send() failed, err: %d\n", "lifs_clonefile_request", lifs_port);
      DWORD2(v19) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v18);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v18);
      return HIDWORD(v19);
    }
  }
  return lifs_port;
}

uint64_t lifs_mkdir_request(uint64_t a1, const char *a2, _OWORD *a3, _OWORD *a4, uint64_t a5)
{
  long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 327680;
    DWORD2(v16) = 448;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_mkdir_send(v13, v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_mkdir_send() failed, err: %d\n", "lifs_mkdir_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

uint64_t lifs_lookup_request(uint64_t a1, const char *a2, _OWORD *a3, int a4, uint64_t a5)
{
  long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 393216;
    DWORD2(v16) = 616;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_lookup_send(v13, v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_lookup_send() failed, err: %d\n", "lifs_lookup_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

uint64_t lifs_lookupmed_request(uint64_t a1, char *a2, long long *a3, int a4, uint64_t a5)
{
  *(void *)long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    v15[2] = 393216;
    DWORD2(v16) = 616;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_lookupmed_send(*(ipc_port **)v13, *(uint64_t *)v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_lookupmed_send() failed, err: %d\n", "lifs_lookupmed_request", lifs_port);
      v15[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return v15[3];
    }
  }
  return lifs_port;
}

uint64_t lifs_lookupsmall_request(uint64_t a1, char *a2, long long *a3, int a4, uint64_t a5)
{
  *(void *)long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    v15[2] = 393216;
    DWORD2(v16) = 616;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_lookupsmall_send(*(ipc_port **)v13, *(uint64_t *)v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_lookupsmall_send() failed, err: %d\n", "lifs_lookupsmall_request", lifs_port);
      v15[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return v15[3];
    }
  }
  return lifs_port;
}

uint64_t lifs_setattr_request(uint64_t a1, _OWORD *a2, _OWORD *a3, uint64_t a4)
{
  uint64_t v11 = 0;
  uint64_t lifs_port = get_lifs_port(&v11);
  if (!lifs_port)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    memset(v12, 0, sizeof(v12));
    *(void *)&long long v13 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v14 = a1;
    DWORD2(v13) = 917504;
    DWORD2(v14) = 200;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    *(void *)&long long v15 = a4;
    lifs_add_req(v12);
    throttle_info_update_with_type();
    int v9 = lifs_setattr_send(v11, v13, a2, a3);
    if (v9)
    {
      uint64_t lifs_port = 4;
      if (v9 != 268435463 && v9 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_setattr_send() failed, err: %d\n", "lifs_setattr_request", lifs_port);
      DWORD2(v13) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v12);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v12);
      return HIDWORD(v13);
    }
  }
  return lifs_port;
}

uint64_t lifs_getattr_request(uint64_t a1, long long *a2, uint64_t a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 983040;
    DWORD2(v12) = 184;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_getattr_send(v9, v11, a2);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_getattr_send() failed, err: %d\n", "lifs_getattr_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_getfsattr_request(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4)
{
  *(void *)long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)uint64_t v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)uint64_t v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    v15[2] = 1507328;
    DWORD2(v16) = 24;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a4;
    if (*(unsigned char *)a3 == 95)
    {
      int v9 = *(unsigned __int8 *)(a3 + 1);
      if (v9 == 83 || v9 == 79)
      {
        *((void *)&v17 + 1) = *(void *)(a4 + 16);
        int v10 = *(_DWORD *)(a4 + 8);
        v15[2] = 1507330;
        HIDWORD(v16) = v10;
      }
    }
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_getfsattr_send(*(ipc_port **)v13, *(uint64_t *)v15, a2, (char *)a3);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_getfsattr_send() failed, err: %d\n", "lifs_getfsattr_request", lifs_port);
      v15[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return v15[3];
    }
  }
  return lifs_port;
}

uint64_t lifs_setfsattr_request(uint64_t a1, long long *a2, char *a3, long long *a4, int a5, uint64_t a6)
{
  *(void *)long long v16 = 0;
  uint64_t lifs_port = get_lifs_port(v16);
  if (lifs_port)
  {
    uint64_t v13 = lifs_port;
    if (lifs_port == 5 && !*(void *)v16)
    {
      if (!strcmp(a3, "_N_SYNC"))
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: suppressing error on dead port", "lifs_setfsattr_request");
        return 0;
      }
      else
      {
        return 5;
      }
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    *(_OWORD *)uint64_t v18 = 0u;
    memset(v17, 0, sizeof(v17));
    *(void *)uint64_t v18 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v19 = a1;
    _OWORD v18[2] = 1441792;
    DWORD2(v19) = 280;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    *(void *)&long long v20 = a6;
    lifs_add_req(v17);
    throttle_info_update_with_type();
    int v14 = lifs_setfsattr_send(*(ipc_port **)v16, *(uint64_t *)v18, a2, a3, a4, a5);
    if (v14)
    {
      uint64_t v13 = 4;
      if (v14 != 268435463 && v14 != 268451845) {
        uint64_t v13 = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_setfsattr_send() failed, err: %d\n", "lifs_setfsattr_request", v13);
      v18[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v17);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v17);
      return v18[3];
    }
  }
  return v13;
}

uint64_t lifs_setfsattr_request_async(uint64_t a1, long long *a2, char *a3, long long *a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)uint64_t v22 = 0;
  uint64_t lifs_port = get_lifs_port(v22);
  if (!lifs_port)
  {
    uint64_t v18 = lifs_request_alloc_init(a1, 0x16u, a8, 280, a6, a7);
    lifs_add_req((void *)v18);
    throttle_info_update_with_type();
    int v19 = lifs_setfsattr_send(*(ipc_port **)v22, *(void *)(v18 + 32), a2, a3, a4, a5);
    if (v19 == 268451845 || v19 == 268435463)
    {
      uint64_t v17 = 4;
    }
    else
    {
      if (!v19)
      {
        release_lifs_port();
        return 0;
      }
      uint64_t v17 = 5;
    }
    *(_DWORD *)(v18 + 40) |= 1u;
    release_lifs_port();
    lifs_remove_req((uint64_t *)v18);
    lifs_request_free(v18);
    return v17;
  }
  uint64_t v17 = lifs_port;
  if (!*(void *)v22 && !strcmp(a3, "_N_SYNC"))
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: suppressing error on dead port", "lifs_setfsattr_request_async");
    return 0;
  }
  return v17;
}

uint64_t lifs_request_alloc_init(uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  if (a2 >= 0x100)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "lifs_request for opcode %x outside valid range", a2);
    return 0;
  }
  else
  {
    uint64_t v12 = kalloc_type_impl();
    lifs_request_init(v12, a1, a2, a3, a4, a5, a6);
    OSAddAtomic(1, (SInt32 *)(a1 + 812));
  }
  return v12;
}

uint64_t lifs_request_free(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  SInt32 v3 = OSAddAtomic(-1, (SInt32 *)(v2 + 812));
  lck_mtx_lock((lck_mtx_t *)(v2 + 96));
  uint64_t v4 = *(void *)(v2 + 32);
  if ((v4 & 0x1000) != 0 && v3 == 1)
  {
    *(void *)(v2 + 32) = v4 & 0xFFFFFFFFFFFFEFFFLL;
    wakeup((void *)(v2 + 812));
  }
  lck_mtx_unlock((lck_mtx_t *)(v2 + 96));
  *(void *)(a1 + 32) = -1;
  *(void *)(a1 + 64) = 3735928559;
  *(_DWORD *)(a1 + 56) = 0;

  return kfree_type_impl();
}

uint64_t lifs_getattrlistbulk_request(uint64_t a1, uint64_t a2, long long *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  long long v20 = 0;
  uint64_t lifs_port = get_lifs_port(&v20);
  if (!lifs_port)
  {
    long long v22 = 0u;
    memset(v21, 0, sizeof(v21));
    *(void *)&long long v22 = OSAddAtomic64(1, &lifs_request_id);
    uint64_t v23 = a1;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    DWORD2(v22) = 1048578;
    uint64_t v26 = a9;
    uint64_t v27 = a7;
    int v24 = 32;
    int v25 = a8;
    lifs_add_req(v21);
    throttle_info_update_with_type();
    int v18 = lifs_getattrlistbulk_send(v20, v22, a2, a3, a4, a5, a6);
    if (v18)
    {
      uint64_t lifs_port = 4;
      if (v18 != 268435463 && v18 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_getattrlistbulk_send() failed, err: %d\n", "lifs_getattrlistbulk_request", lifs_port);
      DWORD2(v22) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v21);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v21);
      return HIDWORD(v22);
    }
  }
  return lifs_port;
}

uint64_t lifs_open_request(uint64_t a1, long long *a2, int a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 0x20000;
    DWORD2(v12) = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = 0;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_open_send(v9, v11, a2, a3);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_open_send() failed, err: %d\n", "lifs_open_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_close_request(uint64_t a1, long long *a2, int a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 0x20000;
    DWORD2(v12) = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = 0;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_close_send(v9, v11, a2, a3);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_close_send() failed, err: %d\n", "lifs_close_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_rename_request(uint64_t a1, const char *a2, _OWORD *a3, _OWORD *a4, const char *a5, long long *a6, long long *a7, int a8, uint64_t a9)
{
  long long v20 = 0;
  uint64_t lifs_port = get_lifs_port(&v20);
  if (!lifs_port)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    memset(v21, 0, sizeof(v21));
    *(void *)&long long v22 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v23 = a1;
    DWORD2(v22) = 458752;
    DWORD2(v23) = 384;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    *(void *)&long long v24 = a9;
    lifs_add_req(v21);
    throttle_info_update_with_type();
    int v18 = lifs_rename_send(v20, v22, a2, a3, a4, a5, a6, a7, a8);
    if (v18)
    {
      uint64_t lifs_port = 4;
      if (v18 != 268435463 && v18 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_rename_send() failed, err: %d\n", "lifs_rename_request", lifs_port);
      DWORD2(v22) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v21);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v21);
      return HIDWORD(v22);
    }
  }
  return lifs_port;
}

uint64_t lifs_rmdir_request(uint64_t a1, long long *a2, long long *a3, const char *a4, uint64_t a5)
{
  long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 0x80000;
    DWORD2(v16) = 200;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_rmdir_send(v13, v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_rmdir_send() failed, err: %d\n", "lifs_rmdir_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

uint64_t lifs_readdir_request(uint64_t a1, int a2, uint64_t a3, long long *a4, int a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  long long v20 = 0;
  uint64_t lifs_port = get_lifs_port(&v20);
  if (!lifs_port)
  {
    long long v22 = 0u;
    memset(v21, 0, sizeof(v21));
    *(void *)&long long v22 = OSAddAtomic64(1, &lifs_request_id);
    uint64_t v23 = a1;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    DWORD2(v22) = 589826;
    uint64_t v26 = a9;
    uint64_t v27 = a7;
    int v24 = 24;
    int v25 = a8;
    lifs_add_req(v21);
    throttle_info_update_with_type();
    int v18 = lifs_readdir_send(v20, v22, a2, a3, a4, a5, a6);
    if (v18)
    {
      uint64_t lifs_port = 4;
      if (v18 != 268435463 && v18 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_readdir_send() failed, err: %d\n", "lifs_readdir_request", lifs_port);
      DWORD2(v22) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v21);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v21);
      return HIDWORD(v22);
    }
  }
  return lifs_port;
}

uint64_t lifs_symlink_request(uint64_t a1, const char *a2, const char *a3, long long *a4, long long *a5, uint64_t a6)
{
  long long v15 = 0;
  uint64_t lifs_port = get_lifs_port(&v15);
  if (!lifs_port)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    memset(v16, 0, sizeof(v16));
    *(void *)&long long v17 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v18 = a1;
    DWORD2(v17) = 655360;
    DWORD2(v18) = 448;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    *(void *)&long long v19 = a6;
    lifs_add_req(v16);
    throttle_info_update_with_type();
    int v13 = lifs_symlink_send(v15, v17, a2, a3, a4, a5);
    if (v13)
    {
      uint64_t lifs_port = 4;
      if (v13 != 268435463 && v13 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_symlink_send() failed, err: %d\n", "lifs_symlink_request", lifs_port);
      DWORD2(v17) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v16);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v16);
      return HIDWORD(v17);
    }
  }
  return lifs_port;
}

uint64_t lifs_link_request(uint64_t a1, long long *a2, const char *a3, _OWORD *a4, uint64_t a5)
{
  int v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 720896;
    DWORD2(v16) = 384;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_link_send(v13, v15, a2, a3, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_link_send() failed, err: %d\n", "lifs_link_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

uint64_t lifs_readlink_request(uint64_t a1, long long *a2, uint64_t a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 786432;
    DWORD2(v12) = 1024;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_readlink_send(v9, v11, a2);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_readlink_send() failed, err: %d\n", "lifs_readlink_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_remove_request(uint64_t a1, long long *a2, long long *a3, const char *a4, int a5, uint64_t a6)
{
  uint64_t v15 = 0;
  uint64_t lifs_port = get_lifs_port(&v15);
  if (!lifs_port)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    memset(v16, 0, sizeof(v16));
    *(void *)&long long v17 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v18 = a1;
    DWORD2(v17) = 851968;
    DWORD2(v18) = 200;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    *(void *)&long long v19 = a6;
    lifs_add_req(v16);
    throttle_info_update_with_type();
    int v13 = lifs_remove_send(v15, v17, a2, a3, a4, a5);
    if (v13)
    {
      uint64_t lifs_port = 4;
      if (v13 != 268435463 && v13 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_remove_send() failed, err: %d\n", "lifs_remove_request", lifs_port);
      DWORD2(v17) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v16);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v16);
      return HIDWORD(v17);
    }
  }
  return lifs_port;
}

uint64_t lifs_pathconf_request(uint64_t a1, long long *a2, uint64_t a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 1376256;
    DWORD2(v12) = 28;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_pathconf_send(v9, v11, a2);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_pathconf_send() failed, err: %d\n", "lifs_pathconf_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_reclaim_request(uint64_t a1, long long *a2, uint64_t a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 2752512;
    DWORD2(v12) = 16;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    int v7 = lifs_reclaim_send(v9, v11, a2);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_reclaim_send() failed, err: %d\n", "lifs_reclaim_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_reclaim_request_async(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = 0;
  uint64_t lifs_port = get_lifs_port(&v15);
  if (!lifs_port)
  {
    uint64_t v11 = lifs_request_alloc_init(a1, 0x2Au, a5, 16, a3, a4);
    lifs_add_req((void *)v11);
    int v12 = lifs_reclaim_send(v15, *(void *)(v11 + 32), a2);
    if (v12 == 268451845 || v12 == 268435463)
    {
      uint64_t lifs_port = 4;
    }
    else
    {
      if (!v12)
      {
        release_lifs_port();
        return 0;
      }
      uint64_t lifs_port = 5;
    }
    *(_DWORD *)(v11 + 40) |= 1u;
    release_lifs_port();
    lifs_remove_req((uint64_t *)v11);
    lifs_request_free(v11);
  }
  return lifs_port;
}

uint64_t lifs_access_request(uint64_t a1, long long *a2, int a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 0x20000;
    DWORD2(v12) = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = 0;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_access_send(v9, v11, a2, a3);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_access_send() failed, err: %d\n", "lifs_access_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_write_request_async(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = 0;
  uint64_t lifs_port = get_lifs_port(&v21);
  if (!lifs_port)
  {
    uint64_t v17 = lifs_request_alloc_init(a1, 0x11u, a8, 24, a6, a7);
    lifs_add_req((void *)v17);
    int v18 = lifs_write_send(v21, *(void *)(v17 + 32), a2, a3, a4, a5);
    if (v18 == 268451845 || v18 == 268435463)
    {
      uint64_t lifs_port = 4;
    }
    else
    {
      if (!v18)
      {
        release_lifs_port();
        return 0;
      }
      uint64_t lifs_port = 5;
    }
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_write_send() failed, err: %d\n", "lifs_write_request_async", lifs_port);
    *(_DWORD *)(v17 + 40) |= 1u;
    release_lifs_port();
    lifs_remove_req((uint64_t *)v17);
    lifs_request_free(v17);
  }
  return lifs_port;
}

uint64_t lifs_read_request_async(uint64_t a1, long long *a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = 0;
  uint64_t lifs_port = get_lifs_port(&v21);
  if (!lifs_port)
  {
    uint64_t v17 = lifs_request_alloc_init(a1, 0x13u, a8, 16, a6, a7);
    *(_DWORD *)(v17 + 40) |= 8u;
    *(_DWORD *)(v17 + 60) = a5;
    lifs_add_req((void *)v17);
    int send = lifs_read_send(v21, *(void *)(v17 + 32), a2, a3, a4);
    if (send == 268451845 || send == 268435463)
    {
      uint64_t lifs_port = 4;
    }
    else
    {
      if (!send)
      {
        release_lifs_port();
        return 0;
      }
      uint64_t lifs_port = 5;
    }
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_read_send() failed, err: %d\n", "lifs_read_request_async", lifs_port);
    *(_DWORD *)(v17 + 40) |= 1u;
    release_lifs_port();
    lifs_remove_req((uint64_t *)v17);
    lifs_request_free(v17);
  }
  return lifs_port;
}

uint64_t lifs_get_volume_port_request(uint64_t a1, long long *a2, uint64_t a3)
{
  int v9 = 0;
  uint64_t lifs_port = get_lifs_port(&v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)&long long v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    DWORD2(v11) = 1966080;
    DWORD2(v12) = 16;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = a3;
    lifs_add_req(v10);
    volume_port_int send = lifs_get_volume_port_send(v9, v11, a2);
    if (volume_port_send)
    {
      uint64_t lifs_port = 4;
      if (volume_port_send != 268435463 && volume_port_send != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_get_volume_port_send() failed, err: %d\n", "lifs_get_volume_port_request", lifs_port);
      DWORD2(v11) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return HIDWORD(v11);
    }
  }
  return lifs_port;
}

uint64_t lifs_blockmap_file_request(uint64_t a1, long long *a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  long long v19 = 0;
  uint64_t lifs_port = get_lifs_port(&v19);
  if (!lifs_port)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    memset(v20, 0, sizeof(v20));
    *(void *)&long long v21 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v22 = a1;
    DWORD2(v21) = 2031616;
    DWORD2(v22) = 408;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    *(void *)&long long v23 = a8;
    lifs_add_req(v20);
    int v17 = lifs_blockmap_file_send(v19, v21, a2, a3, a4, a5, a6, a7);
    if (v17)
    {
      uint64_t lifs_port = 4;
      if (v17 != 268435463 && v17 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_blockmap_file_send() failed, err: %d\n", "lifs_blockmap_file_request", lifs_port);
      DWORD2(v21) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v20);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v20);
      return HIDWORD(v21);
    }
  }
  return lifs_port;
}

uint64_t lifs_endio_request(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  int v17 = 0;
  uint64_t lifs_port = get_lifs_port(&v17);
  if (!lifs_port)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
    memset(v18, 0, sizeof(v18));
    *(void *)&long long v19 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v20 = a1;
    DWORD2(v19) = 0x20000;
    DWORD2(v20) = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    *(void *)&long long v21 = 0;
    lifs_add_req(v18);
    int v15 = lifs_endio_send(v17, v19, a2, a3, a4, a5, a6, a7);
    if (v15)
    {
      uint64_t lifs_port = 4;
      if (v15 != 268435463 && v15 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_endio_send() failed, err: %d\n", "lifs_endio_request", lifs_port);
      DWORD2(v19) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v18);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v18);
      return HIDWORD(v19);
    }
  }
  return lifs_port;
}

uint64_t lifs_endio_request_async(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v22 = 0;
  uint64_t lifs_port = get_lifs_port(&v22);
  if (!lifs_port)
  {
    uint64_t v18 = lifs_request_alloc_init(a1, 2u, 0, 0, a8, a9);
    lifs_add_req((void *)v18);
    int v19 = lifs_endio_send(v22, *(void *)(v18 + 32), a2, a3, a4, a5, a6, a7);
    if (v19 == 268451845 || v19 == 268435463)
    {
      uint64_t lifs_port = 4;
    }
    else
    {
      if (!v19)
      {
        release_lifs_port();
        return 0;
      }
      uint64_t lifs_port = 5;
    }
    *(_DWORD *)(v18 + 40) |= 1u;
    release_lifs_port();
    lifs_remove_req((uint64_t *)v18);
    lifs_request_free(v18);
  }
  return lifs_port;
}

uint64_t lifs_req_thread_start(uint64_t a1)
{
  kern_return_t v3;
  thread_t new_thread;

  new_thread = 0;
  uint64_t v2 = (lck_mtx_t *)(a1 + 664);
  lck_mtx_lock((lck_mtx_t *)(a1 + 664));
  *(_DWORD *)(a1 + 648) = 0;
  SInt32 v3 = kernel_thread_start((thread_continue_t)lifs_req_callback_thread, (void *)a1, &new_thread);
  if (v3)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to start lifs request thread for mount %p kern_return %d", (const void *)a1, v3);
    lck_mtx_unlock(v2);
    return 12;
  }
  else
  {
    msleep(new_thread, v2, 32, "lifs_req_thread_start", 0);
    lck_mtx_unlock(v2);
    thread_deallocate(new_thread);
    return 0;
  }
}

uint64_t lifs_req_callback_thread(uint64_t a1)
{
  thread_t v2 = current_thread();
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p starting for mount %p\n", "lifs_req_callback_thread", v2, (const void *)a1);
  thread_set_thread_name(v2, "lifs_req_callback");
  lck_mtx_lock((lck_mtx_t *)(a1 + 664));
  *(_DWORD *)(a1 + 648) = 1;
  wakeup(v2);
  if (*(_DWORD *)(a1 + 648) == 1)
  {
    SInt32 v3 = (uint64_t *)(a1 + 584);
    do
    {
      uint64_t v4 = *v3;
      if (*v3)
      {
        do
        {
          uint64_t v5 = *(void *)(v4 + 16);
          if (v5)
          {
            if (*(void *)(v5 + 24) != v4 + 16 || (uint64_t v6 = *(void **)(v4 + 24), *v6 != v4))
            {
LABEL_16:
              __break(0xBFFDu);
              JUMPOUT(0x79CCLL);
            }
            *(void *)(v5 + 24) = v6;
            int v7 = *(void **)(v4 + 24);
          }
          else
          {
            int v7 = *(void **)(v4 + 24);
            if (*v7 != v4) {
              goto LABEL_16;
            }
            *(void *)(a1 + 592) = v7;
          }
          *int v7 = v5;
          lck_mtx_unlock((lck_mtx_t *)(a1 + 664));
          (*(void (**)(void, void))(v4 + 80))(*(void *)(v4 + 88), *(unsigned int *)(v4 + 44));
          lifs_request_free(v4);
          lck_mtx_lock((lck_mtx_t *)(a1 + 664));
          uint64_t v4 = *v3;
        }
        while (*v3);
        if (*(_DWORD *)(a1 + 648) == 2) {
          break;
        }
      }
      msleep((void *)(a1 + 584), (lck_mtx_t *)(a1 + 664), 16, "lifs_req_callback_thread", 0);
    }
    while (*(_DWORD *)(a1 + 648) == 1);
  }
  *(_DWORD *)(a1 + 648) = 3;
  wakeup((void *)a1);
  lck_mtx_unlock((lck_mtx_t *)(a1 + 664));
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p exiting for mount %p\n", "lifs_req_callback_thread", v2, (const void *)a1);

  return thread_terminate(v2);
}

void lifs_req_thread_stop(uint64_t a1)
{
  thread_t v2 = (lck_mtx_t *)(a1 + 96);
  lck_mtx_lock((lck_mtx_t *)(a1 + 96));
  if (*(int *)(a1 + 812) >= 1)
  {
    do
    {
      *(void *)(a1 + 32) |= 0x1000uLL;
      msleep((void *)(a1 + 812), v2, 16, "lifs_req_thread_stop", 0);
    }
    while (*(int *)(a1 + 812) > 0);
  }
  lck_mtx_unlock(v2);
  lck_mtx_lock((lck_mtx_t *)(a1 + 664));
  *(_DWORD *)(a1 + 648) = 2;
  wakeup((void *)(a1 + 584));
  while (*(_DWORD *)(a1 + 648) != 3)
    msleep((void *)a1, (lck_mtx_t *)(a1 + 664), 32, "lifs_req_thread_stop", 0);

  lck_mtx_unlock((lck_mtx_t *)(a1 + 664));
}

uint64_t lifs_request_done(unint64_t a1, int a2, int a3, const void *a4, unsigned int a5, user_addr_t a6, unsigned int a7)
{
  uint64_t v7 = 3758097088;
  if ((a1 & 0x8000000000000000) != 0) {
    return 3758097090;
  }
  uint64_t v15 = lifs_find_and_remove_req_byid(a1);
  if (!v15)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: failed to find request with id %llu", "lifs_request_done", a1);
    return v7;
  }
  uint64_t v16 = v15;
  if (!a2)
  {
    int v17 = *(_DWORD *)(v15 + 40);
    if (BYTE2(v17) == a3)
    {
      if (a4)
      {
        unsigned int v18 = *(_DWORD *)(v15 + 56);
        if (v18 >= a5) {
          size_t v19 = a5;
        }
        else {
          size_t v19 = v18;
        }
        memmove(*(void **)(v15 + 64), a4, v19);
        int v17 = *(_DWORD *)(v16 + 40);
      }
      a2 = 0;
      if (!a6 || (v17 & 0xA) == 0) {
        goto LABEL_18;
      }
      unsigned int v20 = *(_DWORD *)(v16 + 60);
      if (v20 >= a7)
      {
        if ((v17 & 2) != 0) {
          int v27 = copyin(a6, *(void **)(v16 + 72), a7);
        }
        else {
          int v27 = lifs_copyin_to_upl(*(void *)(v16 + 88), a6, a7);
        }
        a2 = v27;
        goto LABEL_18;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Request ID %llx returned %u bytes for buffer sized %u", a1, a7, v20);
    }
    else
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Request ID %llx expected response via op %u but received it via %u", a1, BYTE2(v17), a3);
    }
    a2 = 5;
  }
LABEL_18:
  *(_DWORD *)(v16 + 44) = a2;
  if (*(void *)(v16 + 80))
  {
    uint64_t v21 = *(void *)(v16 + 48);
    uint64_t v22 = (lck_mtx_t *)(v21 + 664);
    lck_mtx_lock((lck_mtx_t *)(v21 + 664));
    int v23 = *(_DWORD *)(v16 + 40) | 1;
    *(void *)(v16 + 16) = 0;
    *(_DWORD *)(v16 + 40) = v23;
    uint64_t v24 = (void *)(v21 + 584);
    uint64_t v25 = *(uint64_t **)(v21 + 592);
    *(void *)(v16 + 24) = v25;
    *uint64_t v25 = v16;
    *(void *)(v21 + 592) = v16 + 16;
  }
  else
  {
    uint64_t v22 = (lck_mtx_t *)(lifs_req_locks + 16 * (a1 % lifs_req_num_locks));
    lck_mtx_lock(v22);
    *(_DWORD *)(v16 + 40) |= 1u;
    uint64_t v24 = (void *)v16;
  }
  wakeup(v24);
  lck_mtx_unlock(v22);
  return 0;
}

uint64_t lifs_find_and_remove_req_byid(uint64_t a1)
{
  uint64_t v2 = lifs_req_hashtbl + 8 * (lifs_req_hashtbl_mask & a1);
  SInt32 v3 = (lck_rw_t *)(lifs_req_hashtbl_locks + 16 * (a1 % lifs_req_hashtbl_num_locks));
  lck_rw_lock_exclusive(v3);
  do
  {
    uint64_t v2 = *(void *)v2;
    if (!v2)
    {
      lck_rw_unlock_exclusive(v3);
      return v2;
    }
  }
  while (*(void *)(v2 + 32) != a1);
  uint64_t v4 = *(void *)v2;
  if (*(void *)v2)
  {
    if (*(void *)(v4 + 8) != v2)
    {
      __break(0xBFFDu);
      JUMPOUT(0x7E44);
    }
    uint64_t v5 = *(void **)(v2 + 8);
    if (*v5 == v2)
    {
      *(void *)(v4 + 8) = v5;
      uint64_t v6 = *(uint64_t **)(v2 + 8);
      goto LABEL_10;
    }
LABEL_23:
    __break(0xBFFDu);
    JUMPOUT(0x7E2CLL);
  }
  uint64_t v6 = *(uint64_t **)(v2 + 8);
  if (*v6 != v2) {
    goto LABEL_23;
  }
LABEL_10:
  *uint64_t v6 = v4;
  lck_rw_unlock_exclusive(v3);
  uint64_t v7 = *(void *)(v2 + 48);
  lck_mtx_lock((lck_mtx_t *)(v7 + 680));
  if ((*(unsigned char *)(v2 + 40) & 4) == 0)
  {
    uint64_t v8 = *(void *)(v2 + 16);
    if (v8)
    {
      if (*(void *)(v8 + 24) != v2 + 16) {
        goto LABEL_23;
      }
      int v9 = *(void **)(v2 + 24);
      if (*v9 == v2)
      {
        *(void *)(v8 + 24) = v9;
        int v10 = *(void **)(v2 + 24);
        goto LABEL_17;
      }
LABEL_21:
      __break(0xBFFDu);
      JUMPOUT(0x7E38);
    }
    int v10 = *(void **)(v2 + 24);
    if (*v10 != v2) {
      goto LABEL_21;
    }
    *(void *)(v7 + 608) = v10;
LABEL_17:
    void *v10 = v8;
  }
  lck_mtx_unlock((lck_mtx_t *)(v7 + 680));
  return v2;
}

uint64_t lifs_getxattr_request(uint64_t a1, long long *a2, char *a3, int a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  *(void *)int v17 = 0;
  uint64_t lifs_port = get_lifs_port(v17);
  if (!lifs_port)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    *(_OWORD *)size_t v19 = 0u;
    memset(v18, 0, sizeof(v18));
    *(void *)size_t v19 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v20 = a1;
    v19[2] = 1572864;
    DWORD2(v20) = 24;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    *(void *)&long long v21 = a7;
    if (a6)
    {
      *((void *)&v21 + 1) = a5;
      v19[2] = 1572866;
      HIDWORD(v20) = a6;
    }
    lifs_add_req(v18);
    throttle_info_update_with_type();
    int v15 = lifs_getxattr_send(*(ipc_port **)v17, *(uint64_t *)v19, a2, a3, a6, a4);
    if (v15)
    {
      uint64_t lifs_port = 4;
      if (v15 != 268435463 && v15 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_getxattr_send() failed, err: %d\n", "lifs_getxattr_request", lifs_port);
      v19[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v18);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v18);
      return v19[3];
    }
  }
  return lifs_port;
}

uint64_t lifs_setxattr_request(uint64_t a1, long long *a2, char *a3, uio_t a_uio, int a5)
{
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)uint64_t v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(void *)size_t v19 = 0;
  unint64_t v10 = uio_resid(a_uio);
  int v11 = uio_offset(a_uio);
  if (v10 >= 0x400)
  {
    if (v10 >> 18)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: xattr size %zu (%s) too large", "lifs_setxattr_request", v10, a3);
      return 27;
    }
    long long v13 = (const char *)kalloc_data();
    unint64_t v12 = v10;
  }
  else
  {
    unint64_t v12 = 1024;
    long long v13 = (const char *)kalloc_data();
    if (!v10) {
      goto LABEL_7;
    }
  }
  uint64_t v14 = uiomove(v13, v10, a_uio);
  if (v14) {
    goto LABEL_15;
  }
LABEL_7:
  if (v12 > v10) {
    bzero((void *)&v13[v10], v12 - v10);
  }
  if (v12 >= 0x401 && vm_map_copyin())
  {
    uint64_t v14 = 12;
    if (!v13) {
      return v14;
    }
    goto LABEL_16;
  }
  uint64_t lifs_port = get_lifs_port(v19);
  if (!lifs_port)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    *(_OWORD *)uint64_t v22 = 0u;
    long long v20 = 0u;
    *(void *)uint64_t v22 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v23 = a1;
    int v22[2] = 0x20000;
    DWORD2(v23) = 0;
    long long v25 = 0uLL;
    *(void *)&long long v24 = 0;
    lifs_add_req(&v20);
    throttle_info_update_with_type();
    if (v12 == 1024)
    {
      int v17 = lifs_setxattr_small_send(*(ipc_port **)v19, *(uint64_t *)v22, a2, a3, v13, v10, v11, a5);
      unsigned int v18 = "small";
      if (v17) {
        goto LABEL_21;
      }
    }
    else
    {
      int v17 = lifs_setxattr_large_send(*(ipc_port **)v19, *(uint64_t *)v22, a2, a3, 0, v10, v11, a5);
      unsigned int v18 = "large";
      if (v17)
      {
LABEL_21:
        uint64_t v14 = 4;
        if (v17 != 268435463 && v17 != 268451845) {
          uint64_t v14 = 5;
        }
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_setxattr_%s_send() failed, err: %d\n", "lifs_setxattr_request", v18, v14);
        v22[2] |= 1u;
        release_lifs_port();
        lifs_remove_req((uint64_t *)&v20);
LABEL_27:
        *(void *)uint64_t v22 = -1;
        *(void *)&long long v24 = 3735928559;
        DWORD2(v23) = 0;
        if (!v13) {
          return v14;
        }
        goto LABEL_16;
      }
    }
    release_lifs_port();
    lifs_wait_req_completion((uint64_t)&v20);
    uint64_t v14 = v22[3];
    goto LABEL_27;
  }
  uint64_t v14 = lifs_port;
LABEL_15:
  if (v13) {
LABEL_16:
  }
    kfree_data();
  return v14;
}

uint64_t lifs_removexattr_request(uint64_t a1, long long *a2, char *a3)
{
  *(void *)int v9 = 0;
  uint64_t lifs_port = get_lifs_port(v9);
  if (!lifs_port)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    *(_OWORD *)int v11 = 0u;
    memset(v10, 0, sizeof(v10));
    *(void *)int v11 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v12 = a1;
    _OWORD v11[2] = 0x20000;
    DWORD2(v12) = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    *(void *)&long long v13 = 0;
    lifs_add_req(v10);
    throttle_info_update_with_type();
    int v7 = lifs_removexattr_send(*(ipc_port **)v9, *(uint64_t *)v11, a2, a3);
    if (v7)
    {
      uint64_t lifs_port = 4;
      if (v7 != 268435463 && v7 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_removexattr_send() failed, err: %d\n", "lifs_removexattr_request", lifs_port);
      v11[2] |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v10);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v10);
      return v11[3];
    }
  }
  return lifs_port;
}

uint64_t lifs_listxattr_request(uint64_t a1, long long *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  long long v13 = 0;
  uint64_t lifs_port = get_lifs_port(&v13);
  if (!lifs_port)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    memset(v14, 0, sizeof(v14));
    *(void *)&long long v15 = OSAddAtomic64(1, &lifs_request_id);
    *(void *)&long long v16 = a1;
    DWORD2(v15) = 1572864;
    DWORD2(v16) = 24;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)&long long v17 = a5;
    if (a4)
    {
      *((void *)&v17 + 1) = a3;
      DWORD2(v15) = 1572866;
      HIDWORD(v16) = a4;
    }
    lifs_add_req(v14);
    throttle_info_update_with_type();
    int v11 = lifs_listxattr_send(v13, v15, a2, a4);
    if (v11)
    {
      uint64_t lifs_port = 4;
      if (v11 != 268435463 && v11 != 268451845) {
        uint64_t lifs_port = 5;
      }
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_listxattr_send() failed, err: %d\n", "lifs_listxattr_request", lifs_port);
      DWORD2(v15) |= 1u;
      release_lifs_port();
      lifs_remove_req((uint64_t *)v14);
    }
    else
    {
      release_lifs_port();
      lifs_wait_req_completion((uint64_t)v14);
      return HIDWORD(v15);
    }
  }
  return lifs_port;
}

void lifs_request_abort_all()
{
  long long v12 = 0;
  long long v13 = 0;
  lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
  uint64_t v0 = (char *)lifs_mount_list;
  if (lifs_mount_list)
  {
    do
    {
      long long v12 = 0;
      long long v13 = &v12;
      lck_mtx_lock((lck_mtx_t *)(v0 + 680));
      uint64_t v1 = *((void *)v0 + 75);
      if (v1)
      {
        do
        {
          uint64_t v2 = *(void *)(v1 + 16);
          int v3 = *(_DWORD *)(v1 + 40);
          if ((v3 & 1) == 0)
          {
            if (v2)
            {
              if (*(void *)(v2 + 24) != v1 + 16)
              {
LABEL_25:
                __break(0xBFFDu);
                JUMPOUT(0x8728);
              }
              uint64_t v4 = *(void **)(v1 + 24);
              if (*v4 != v1)
              {
LABEL_24:
                __break(0xBFFDu);
                JUMPOUT(0x873CLL);
              }
              *(void *)(v2 + 24) = v4;
              uint64_t v5 = *(void **)(v1 + 24);
            }
            else
            {
              uint64_t v5 = *(void **)(v1 + 24);
              if (*v5 != v1) {
                goto LABEL_24;
              }
              *((void *)v0 + 76) = v5;
            }
            *uint64_t v5 = v2;
            *(_DWORD *)(v1 + 40) = v3 | 4;
            uint64_t v6 = v13;
            *(void *)(v1 + 16) = 0;
            *(void *)(v1 + 24) = v6;
            *uint64_t v6 = v1;
            long long v13 = (void *)(v1 + 16);
          }
          uint64_t v1 = v2;
        }
        while (v2);
      }
      lck_mtx_unlock((lck_mtx_t *)(v0 + 680));
      int v7 = v12;
      if (v12)
      {
        do
        {
          uint64_t v8 = (void *)v7[2];
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lmp %p req %p reqid %llu\n", "lifs_request_abort_all", v0, v7, v7[4]);
          uint64_t v9 = v7[2];
          if (v9)
          {
            if (*(void **)(v9 + 24) != v7 + 2)
            {
              __break(0xBFFDu);
              JUMPOUT(0x8734);
            }
            unint64_t v10 = (void *)v7[3];
            if ((void *)*v10 != v7) {
              goto LABEL_25;
            }
            *(void *)(v9 + 24) = v10;
            int v11 = (void *)v7[3];
          }
          else
          {
            int v11 = (void *)v7[3];
            if ((void *)*v11 != v7) {
              goto LABEL_25;
            }
            long long v13 = (void *)v7[3];
          }
          *int v11 = v9;
          lifs_request_done(v7[4], 5, 0, 0, 0, 0, 0);
          int v7 = v8;
        }
        while (v8);
      }
      uint64_t v0 = *(char **)v0;
    }
    while (v0);
  }
  lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
}

uint64_t lifs_vnop_default()
{
  return 45;
}

uint64_t lifs_vnop_write(uint64_t a1)
{
  chan = 0;
  uint64_t v2 = *(vnode **)(a1 + 8);
  int v3 = (char *)vnode_fsnode(v2);
  uint64_t v4 = *(uio **)(a1 + 16);
  user_ssize_t v5 = uio_resid(v4);
  unint64_t v6 = uio_offset(v4);
  int v7 = *(_DWORD *)(a1 + 24);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140041u, (uintptr_t)v2, v6, v5, *(unsigned int *)(a1 + 24));
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &chan);
  if (!lifs_mount_from_node)
  {
    if (!vnode_isreg(v2))
    {
      if (vnode_isdir(v2)) {
        uint64_t lifs_mount_from_node = 21;
      }
      else {
        uint64_t lifs_mount_from_node = 1;
      }
      goto LABEL_4;
    }
    if (v5 <= 0)
    {
      if (v5) {
        uint64_t lifs_mount_from_node = 22;
      }
      else {
        uint64_t lifs_mount_from_node = 0;
      }
      goto LABEL_4;
    }
    unsigned int v10 = v7 & 0xFFFFFC3F;
    lck_mtx_lock((lck_mtx_t *)((char *)chan + 96));
    if ((vfs_flags(*((mount_t *)chan + 56)) & 0x1000) != 0
      && (*(unsigned char *)(a1 + 24) & 4) == 0
      && !(*((void *)chan + 107) >> 30))
    {
      lifs_enable_lowspace_sync_write((char *)chan);
      unsigned int v10 = v7 & 0xFFFFFC3B | 4;
    }
    lck_mtx_unlock((lck_mtx_t *)((char *)chan + 96));
    int v11 = (lck_rw_t *)(v3 + 504);
    lck_rw_lock_shared((lck_rw_t *)(v3 + 504));
    unint64_t v12 = *((void *)v3 + 61);
    if ((*((unsigned char *)chan + 32) & 0x40) != 0 || (uint64_t v13 = *((void *)v3 + 62), v12 == v13))
    {
      unsigned int lck = v10;
      if (v6 + v5 > v12 || v6 > *((void *)v3 + 62) || (*(unsigned char *)(a1 + 24) & 2) != 0)
      {
        if (!lck_rw_lock_shared_to_exclusive((lck_rw_t *)(v3 + 504))) {
          lck_rw_lock_exclusive((lck_rw_t *)(v3 + 504));
        }
        lifs_set_io_lock_override(v3);
        int v35 = 1;
      }
      else
      {
        int v35 = 0;
      }
      lck_mtx_lock((lck_mtx_t *)(v3 + 112));
      off_t a_offset = *((void *)v3 + 61);
      int v14 = *((_DWORD *)v3 + 32);
      if ((*(unsigned char *)(a1 + 24) & 2) != 0)
      {
        unint64_t v6 = *((void *)v3 + 61);
        uio_setoffset(v4, a_offset);
      }
      off_t v15 = v6 + v5;
      if (__OFADD__(v6, v5) || (int64_t v16 = *((void *)chan + 103), v15 > v16) || (uint64_t)v6 >= v16)
      {
        lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
        uint64_t lifs_mount_from_node = 27;
        int v11 = (lck_rw_t *)(v3 + 504);
        if (v35) {
          goto LABEL_68;
        }
      }
      else
      {
        int v17 = (8 * v14) & 0x800 | lck;
        if (v15 <= a_offset)
        {
          uintptr_t arg4 = 0;
          uintptr_t v20 = *((void *)v3 + 61);
        }
        else
        {
          uint64_t v18 = (v15 + (1 << PAGE_SHIFT_CONST) - 1) & -(1 << PAGE_SHIFT_CONST);
          BOOL v19 = v18 <= v15;
          if (v18 >= v15) {
            uint64_t v18 = v6 + v5;
          }
          uintptr_t arg4 = v18;
          if (!v19) {
            v17 |= 0x340u;
          }
          *((void *)v3 + 61) = v15;
          uintptr_t v20 = v6 + v5;
        }
        unint64_t v21 = *((void *)v3 + 62);
        BOOL v22 = v6 > v21;
        if (v6 <= v21) {
          uintptr_t v23 = 0;
        }
        else {
          uintptr_t v23 = *((void *)v3 + 62);
        }
        if (v22) {
          v17 |= 0x380u;
        }
        int v31 = v17;
        lcka = (lck_mtx_t *)(v3 + 112);
        lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
        atomic_store(v5, (unsigned int *)v3 + 214);
        if (v15 > a_offset) {
          ubc_setsize(v2, v20);
        }
        off_t v24 = v20;
        if ((kdebug_enable & 0xFFFFFFF7) != 0)
        {
          kernel_debug_filtered(0x3140040u, a_offset, v20, v23, arg4);
          off_t v24 = v20;
        }
        unsigned int v25 = cluster_write(v2, v4, a_offset, v24, v23, arg4, v31);
        if (v25)
        {
          if (v15 > a_offset && ubc_getsize(v2) > a_offset) {
            ubc_setsize(v2, a_offset);
          }
          lck_mtx_lock(lcka);
          int v26 = v35;
          if (*((void *)v3 + 61) > (unint64_t)a_offset) {
            *((void *)v3 + 61) = a_offset;
          }
        }
        else
        {
          lck_mtx_lock(lcka);
          unint64_t v27 = uio_offset(v4);
          int v26 = v35;
          if (v27 > *((void *)v3 + 62)) {
            *((void *)v3 + 62) = v27;
          }
        }
        lck_mtx_unlock(lcka);
        atomic_store(0, (unsigned int *)v3 + 214);
        unsigned int v28 = lifs_issue_endio((uintptr_t)v3, v25, (v31 & 4) == 0);
        if (v28) {
          BOOL v29 = 1;
        }
        else {
          BOOL v29 = v25 == 0;
        }
        if (v29) {
          uint64_t lifs_mount_from_node = v28;
        }
        else {
          uint64_t lifs_mount_from_node = v25;
        }
        int v11 = (lck_rw_t *)(v3 + 504);
        if (v26)
        {
LABEL_68:
          if (!*((void *)v3 + 65)) {
            panic("\"%s: override is not set for lnode %p io_lock\" @%s:%d", "lifs_clear_io_lock_override", v3, "lifs_vnops.c", 197);
          }
          *((void *)v3 + 65) = 0;
          lck_rw_unlock_exclusive(v11);
          if (lifs_mount_from_node) {
            goto LABEL_4;
          }
LABEL_72:
          lck_mtx_lock((lck_mtx_t *)(v3 + 112));
          *((_DWORD *)v3 + 32) |= 0x10000u;
          lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
          goto LABEL_4;
        }
      }
    }
    else
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: lnode %p file_size(0x%llx) != valid_data_size(0x%llx) in non-VDL mode", "lifs_vnop_write", v3, *((void *)v3 + 61), v13);
      uint64_t lifs_mount_from_node = 5;
    }
    lck_rw_unlock_shared(v11);
    if (lifs_mount_from_node) {
      goto LABEL_4;
    }
    goto LABEL_72;
  }
LABEL_4:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140042u, (uintptr_t)v2, *((void *)v3 + 62), *((void *)v3 + 61), (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_read(uint64_t a1)
{
  uint64_t v18 = 0;
  uint64_t v2 = *(vnode **)(a1 + 8);
  int v3 = (char *)vnode_fsnode(v2);
  uint64_t v4 = *(uio **)(a1 + 16);
  user_ssize_t v5 = uio_resid(v4);
  uintptr_t v6 = *(int *)(a1 + 24);
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    off_t v7 = uio_offset(v4);
    kernel_debug_filtered(0x3140045u, (uintptr_t)v2, v7, v5, v6);
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &v18);
  if (lifs_mount_from_node)
  {
    uint64_t v9 = lifs_mount_from_node;
LABEL_5:
    uintptr_t v10 = -1;
    goto LABEL_6;
  }
  if (!vnode_isreg(v2))
  {
    if (vnode_isdir(v2)) {
      uint64_t v9 = 21;
    }
    else {
      uint64_t v9 = 1;
    }
    goto LABEL_5;
  }
  if (v5 <= 0)
  {
    if (v5) {
      uint64_t v9 = 22;
    }
    else {
      uint64_t v9 = 0;
    }
    goto LABEL_5;
  }
  off_t v13 = uio_offset(v4);
  if (v13 >= *(void *)(v18 + 824))
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  lck_rw_lock_shared((lck_rw_t *)(v3 + 504));
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  uintptr_t v10 = *((void *)v3 + 61);
  int v14 = (8 * *((_DWORD *)v3 + 32)) & 0x800 | v6;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  unsigned int v15 = cluster_read(v2, v4, v10, v14);
  unsigned int v16 = lifs_issue_endio((uintptr_t)v3, v15, 1uLL);
  lck_rw_unlock_shared((lck_rw_t *)(v3 + 504));
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v15 == 0;
  }
  if (v17) {
    uint64_t v9 = v16;
  }
  else {
    uint64_t v9 = v15;
  }
  if (!(v15 | v16))
  {
    lck_mtx_lock((lck_mtx_t *)(v3 + 112));
    *((_DWORD *)v3 + 32) |= 0x8000u;
    lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
    uint64_t v9 = 0;
  }
LABEL_6:
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    user_ssize_t v11 = uio_resid(v4);
    kernel_debug_filtered(0x3140046u, (uintptr_t)v2, v10, v11, (int)v9);
  }
  return v9;
}

uint64_t lifs_vnop_readdirattr()
{
  return 45;
}

uint64_t lifs_vnop_readdir(uint64_t a1)
{
  uint64_t v2 = *(vnode **)(a1 + 8);
  int v3 = (long long *)vnode_fsnode(v2);
  uint64_t v39 = 0;
  off_t v4 = uio_offset(*(uio_t *)(a1 + 16));
  unsigned int v5 = uio_resid(*(uio_t *)(a1 + 16));
  unsigned int v6 = v5;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314004Du, (uintptr_t)v2, v4, v5, *(int *)(a1 + 24));
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "readdir:start:vp:%p:lnode:%p:cookie:0x%llx:verifier:0x%llx\n", v2, v3, v4, *((void *)v3 + 55));
  if (vnode_vtype(v2) != VDIR)
  {
    uint64_t v9 = 0;
    int v10 = 0;
    LODWORD(v11) = 0;
    uint64_t v8 = 20;
    goto LABEL_7;
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &v39);
  if (lifs_mount_from_node)
  {
    uint64_t v8 = lifs_mount_from_node;
    uint64_t v9 = 0;
    int v10 = 0;
    LODWORD(v11) = 0;
    goto LABEL_7;
  }
  int v35 = v2;
  if (v6 >= 0x10000) {
    int v16 = 0x10000;
  }
  else {
    int v16 = v6;
  }
  if ((v6 & 0xFFFFFFF8) >= 0x18uLL) {
    unsigned int v17 = v16;
  }
  else {
    unsigned int v17 = 24;
  }
  uint64_t v18 = kalloc_data();
  uint64_t v19 = 0;
  int v20 = -5;
  if (v4) {
LABEL_23:
  }
    uint64_t v19 = *((void *)v3 + 55);
  while (1)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v21 = v18;
    uint64_t v8 = lifs_readdir_request(v39, 0, v4, v3, v17, v19, v18, v17, (uint64_t)&v36);
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "readdir:vp:%p:lifs_readdir_request:error:%d:bytesRead:%d\n", v35, v8, v37);
    if (!v8) {
      break;
    }
    if ((v8 & 0xFFFFFFFE) == 0xFFFFFC16) {
      goto LABEL_59;
    }
    BOOL v22 = v8 == -1000 && v20 == 0;
    uint64_t v9 = v21;
    uint64_t v2 = v35;
    if (v22)
    {
      int v10 = 0;
      uint64_t v8 = 0;
      LODWORD(v11) = 1;
      goto LABEL_7;
    }
    if (v8 != -1000 || !v20)
    {
      int v10 = 0;
      LODWORD(v11) = 0;
      goto LABEL_7;
    }
    *((void *)v3 + 55) = 0;
    uint64_t v23 = lifs_readdir_request(v39, 0, 0, v3, v17, 0, v21, v17, (uint64_t)&v36);
    if (v23)
    {
      uint64_t v8 = v23;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "readdir:vp:%p:error on retry:%d", v35, v23);
      int v10 = 0;
      LODWORD(v11) = 0;
      goto LABEL_75;
    }
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "readdir:vp:%p:retrying with new verifier:%llx\n", v35, v36);
    uint64_t v19 = v36;
    *((void *)v3 + 55) = v36;
    ++v20;
    uint64_t v18 = v21;
    if (v4) {
      goto LABEL_23;
    }
  }
  unsigned int v24 = v37;
  if (!v37)
  {
LABEL_59:
    int v10 = 0;
    uint64_t v8 = 0;
    LODWORD(v11) = 1;
LABEL_60:
    uint64_t v9 = v21;
    uint64_t v2 = v35;
    goto LABEL_7;
  }
  if (v37 < 0x18 || v37 > v17)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "readdir:bytesRead:%d", v37);
    int v10 = 0;
    LODWORD(v11) = 0;
    uint64_t v8 = 22;
    goto LABEL_60;
  }
  uint64_t v25 = v36;
  if (v19 && *((void *)v3 + 55) != v36)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "readdir:verifier changed without error:cookie:0x%llx:cookie_verifier:0x%llx:lnode->dir_verifier:0x%llx:reply_data.verifier:0x%llx\n", v4, v19, *((void *)v3 + 55), v36);
    uint64_t v25 = v36;
  }
  uint64_t v2 = v35;
  *((void *)v3 + 55) = v25;
  uint64_t v26 = kalloc_type_impl();
  uint64_t v11 = v21;
  int v10 = 0;
  if (!v21)
  {
    uint64_t v8 = 0;
    goto LABEL_74;
  }
  while (1)
  {
    uint64_t v27 = *(void *)v11;
    if ((*(unsigned char *)(a1 + 24) & 1) == 0)
    {
      *(_DWORD *)uint64_t v26 = v27;
      *(unsigned char *)(v26 + 6) = lifatype_to_dtype(*(unsigned __int8 *)(v11 + 20));
      size_t v28 = *(unsigned __int16 *)(v11 + 18);
      if (v28 <= 0xFF && ((v28 + 29) & 0x1FFF8u) <= (unint64_t)v24)
      {
        *(unsigned char *)(v26 + 7) = v28;
        memmove((void *)(v26 + 8), (const void *)(v11 + 21), v28);
        *(unsigned char *)(v26 + v28 + 8) = 0;
        __int16 v29 = v28 & 0xFC;
        unsigned int v30 = (v28 & 0xFC) + 12;
        *(_WORD *)(v26 + 4) = v29 + 12;
        goto LABEL_49;
      }
      uint64_t v2 = v35;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "readdir:vp:%p:invalid:entry:length:%d", v35, v28);
      LODWORD(v11) = 0;
LABEL_69:
      uint64_t v8 = 22;
      goto LABEL_74;
    }
    *(void *)uint64_t v26 = v27;
    *(void *)(v26 + 8) = *(void *)(v11 + 8);
    *(unsigned char *)(v26 + 20) = lifatype_to_dtype(*(unsigned __int8 *)(v11 + 20));
    size_t v31 = *(unsigned __int16 *)(v11 + 18);
    if (v31 > 0x3FF || ((v31 + 29) & 0x1FFF8u) > (unint64_t)v24)
    {
      uint64_t v2 = v35;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "readdir:vp:%p:invalid:entry:length:%d", v35, v31);
      LODWORD(v11) = 0;
      goto LABEL_69;
    }
    *(_WORD *)(v26 + 18) = v31;
    memmove((void *)(v26 + 21), (const void *)(v11 + 21), v31);
    *(unsigned char *)(v26 + v31 + 21) = 0;
    __int16 v32 = v31 & 0xFFF8;
    unsigned int v30 = (v31 & 0xFFF8) + 32;
    *(_WORD *)(v26 + 16) = v32 + 32;
LABEL_49:
    if (uio_resid(*(uio_t *)(a1 + 16)) < v30) {
      goto LABEL_66;
    }
    uint64_t v33 = uiomove((const char *)v26, v30, *(uio **)(a1 + 16));
    if (v33)
    {
      uint64_t v8 = v33;
      LODWORD(v11) = 0;
      goto LABEL_73;
    }
    uio_setoffset(*(uio_t *)(a1 + 16), *(void *)(v11 + 8));
    if (__OFADD__(v10, 1)) {
      lifs_vnop_readdir_cold_1();
    }
    if (*(unsigned char *)(a1 + 24))
    {
      bzero((void *)v26, 0x418uLL);
    }
    else
    {
      *(void *)(v26 + 256) = 0;
      *(_OWORD *)(v26 + 224) = 0u;
      *(_OWORD *)(v26 + 240) = 0u;
      *(_OWORD *)(v26 + 192) = 0u;
      *(_OWORD *)(v26 + 208) = 0u;
      *(_OWORD *)(v26 + 160) = 0u;
      *(_OWORD *)(v26 + 176) = 0u;
      *(_OWORD *)(v26 + 128) = 0u;
      *(_OWORD *)(v26 + 144) = 0u;
      *(_OWORD *)(v26 + 96) = 0u;
      *(_OWORD *)(v26 + 112) = 0u;
      *(_OWORD *)(v26 + 64) = 0u;
      *(_OWORD *)(v26 + 80) = 0u;
      *(_OWORD *)(v26 + 32) = 0u;
      *(_OWORD *)(v26 + 48) = 0u;
      *(_OWORD *)uint64_t v26 = 0u;
      *(_OWORD *)(v26 + 16) = 0u;
    }
    ++v10;
    if (*(void *)(v11 + 8) == -1)
    {
      uint64_t v8 = 0;
      LODWORD(v11) = 1;
      goto LABEL_73;
    }
    uint64_t v34 = *(unsigned __int16 *)(v11 + 16);
    if (!*(_WORD *)(v11 + 16))
    {
LABEL_66:
      LODWORD(v11) = 0;
      uint64_t v8 = 0;
      goto LABEL_73;
    }
    if (v34 + 24 > (unint64_t)v24) {
      break;
    }
    v24 -= v34;
    v11 += v34;
  }
  uint64_t v8 = 22;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "readdir:bytes_left:%d:de_nextrec:%d:error:%d", v24, *(unsigned __int16 *)(v11 + 16), 22);
  LODWORD(v11) = 0;
LABEL_73:
  uint64_t v2 = v35;
LABEL_74:
  kfree_type_impl();
LABEL_75:
  uint64_t v9 = v21;
LABEL_7:
  unint64_t v12 = *(int **)(a1 + 40);
  if (v12) {
    *unint64_t v12 = v10;
  }
  off_t v13 = *(_DWORD **)(a1 + 32);
  if (v13) {
    *off_t v13 = v11;
  }
  if (v9) {
    kfree_data();
  }
  off_t v14 = uio_offset(*(uio_t *)(a1 + 16));
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "readdir:finish:offset:%llx:numdirentries:%d:eof:%d:error:%d\n", v14, v10, v11, v8);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314004Eu, (uintptr_t)v2, v10, v11, (int)v8);
  }
  return v8;
}

uint64_t lifs_vnop_mkdir(void *a1)
{
  uint64_t v2 = (vnode *)a1[1];
  int v3 = (vnode_t *)a1[2];
  off_t v4 = (long long *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  unsigned int v5 = (componentname *)a1[3];
  long long v38 = 0u;
  *(_OWORD *)uint64_t v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  memset(v15, 0, sizeof(v15));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140051u, arg1, (uintptr_t)v2, (uintptr_t)v4, 0);
    }
    if (v5->cn_namelen <= 1023)
    {
      convert_vnode_attr((uint64_t)&v16, a1[4]);
      *(void *)a1[4] |= 0x380uLL;
      off_t v7 = (char *)kalloc_data();
      size_t v8 = (v5->cn_namelen + 1);
      if (v8 >= 0x401) {
        lifs_vnop_mkdir_cold_1();
      }
      uint64_t v9 = v7;
      strlcpy(v7, v5->cn_nameptr, v8);
      lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
      uint64_t lifs_mount_from_node = lifs_mkdir_request(arg1, v9, v4, &v16, (uint64_t)v15);
      if (!lifs_mount_from_node)
      {
        lifs_update_freespace(arg1, v39);
        if ((BYTE8(v16) & 1) == 0)
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to retrieve updated attrs from created directory");
          convert_vnode_attr((uint64_t)&v16, a1[4]);
          DWORD2(v17) = 2;
          *((void *)&v16 + 1) |= 1uLL;
        }
        uint64_t node = lifs_create_node(*(mount **)(arg1 + 448), v15, v2, (uint64_t)v5, (uint64_t)&v16, v3);
        if (node)
        {
          uint64_t lifs_mount_from_node = node;
          uint64_t v14 = 0;
          memset(v13, 0, sizeof(v13));
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: fail to create node [%d]", "lifs_vnop_mkdir", node);
          lifs_rmdir_request(arg1, v4, v15, v9, (uint64_t)v13);
        }
        else
        {
          vnode_fsnode(*v3);
          if (v28) {
            update_lnode_attr((uint64_t)v4, (uint64_t)&v27 + 8);
          }
          cache_purge_negatives(v2);
          cache_enter(v2, *v3, v5);
          lifs_invalidate_dirattrcache_ext((uint64_t)v4, 1);
          uint64_t lifs_mount_from_node = 0;
        }
      }
      lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
      if (v9) {
        kfree_data();
      }
    }
    else
    {
      uint64_t lifs_mount_from_node = 63;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140052u, arg1, (uintptr_t)v2, (uintptr_t)v4, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_rmdir(void *a1)
{
  uint64_t v1 = (vnode *)a1[1];
  uint64_t v2 = (vnode *)a1[2];
  uint64_t v3 = a1[3];
  off_t v4 = (long long *)vnode_fsnode(v1);
  unsigned int v5 = (long long *)vnode_fsnode(v2);
  bzero(__dst, 0x400uLL);
  uintptr_t arg1 = 0;
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  bzero(v12, 0x268uLL);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  if (!v2)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing lifs node to remove");
    return 22;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140055u, arg1, (uintptr_t)v1, (uintptr_t)v4, (uintptr_t)v2);
  }
  int v8 = *(_DWORD *)(v3 + 48);
  if (v8 > 1023)
  {
    uint64_t lifs_mount_from_node = 63;
    goto LABEL_13;
  }
  size_t v9 = (v8 + 1);
  if (v9 >= 0x401) {
    lifs_vnop_rmdir_cold_1();
  }
  strlcpy(__dst, *(const char **)(v3 + 40), v9);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(void *)&long long v25 = 0;
  lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
  if (!lifs_lookup(arg1, v4, v3, __dst, (uint64_t)v12))
  {
    uint64_t v10 = lifs_lookup_node(arg1, &v13);
    if (v10)
    {
      if (*(vnode **)(v10 + 224) == v2)
      {
        move_sillyrename_entries((uint64_t)v5, (uint64_t)v4);
        uint64_t lifs_mount_from_node = lifs_rmdir_request(arg1, v4, v5, __dst, (uint64_t)&v14);
        if (lifs_mount_from_node) {
          goto LABEL_12;
        }
        lifs_update_freespace(arg1, (unint64_t *)&v25 + 1);
        update_lnode_attr((uint64_t)v4, (uint64_t)&v14);
        cache_purge(v2);
        lifs_invalidate_dirattrcache_ext((uint64_t)v4, 1);
        if (!vnode_isrecycled(v2)) {
          vnode_recycle(v2);
        }
      }
    }
  }
  uint64_t lifs_mount_from_node = 0;
LABEL_12:
  lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
LABEL_13:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140056u, arg1, (uintptr_t)v1, (uintptr_t)v4, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_mmap(uint64_t a1)
{
  uint64_t v1 = *(vnode **)(a1 + 8);
  uintptr_t v2 = *(int *)(a1 + 16);
  uint64_t v3 = (unsigned int *)vnode_fsnode(v1);
  if (!v3)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing lifs node");
    return 22;
  }
  if (!v2)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid mmap flags");
    return 22;
  }
  uintptr_t v4 = (uintptr_t)v3;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140059u, (uintptr_t)v1, (uintptr_t)v3, v3[32], v2);
  }
  lck_mtx_lock((lck_mtx_t *)(v4 + 112));
  if (v2) {
    *(_DWORD *)(v4 + 128) |= 1u;
  }
  if ((v2 & 2) != 0) {
    *(_DWORD *)(v4 + 128) |= 3u;
  }
  lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314005Au, (uintptr_t)v1, v4, *(unsigned int *)(v4 + 128), 0);
  }
  return 0;
}

uint64_t lifs_vnop_mnomap(uint64_t a1)
{
  uint64_t v1 = *(vnode **)(a1 + 8);
  uintptr_t v2 = (unsigned int *)vnode_fsnode(v1);
  uint64_t v9 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v9);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314005Du, (uintptr_t)v1, (uintptr_t)v2, v2[32], 0);
  }
  lck_rw_lock_exclusive((lck_rw_t *)(v2 + 18));
  lck_mtx_lock((lck_mtx_t *)(v2 + 28));
  v2[32] &= 0xFFFFFFFC;
  if (v2[25]) {
    int v4 = 3;
  }
  else {
    int v4 = 0;
  }
  unsigned int v5 = v4 | (v2[23] != 0);
  if (v2[24]) {
    uintptr_t v6 = v5 | 2;
  }
  else {
    uintptr_t v6 = v5;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314005Cu, (uintptr_t)v2, (int)v2[26], v2[22], v6);
  }
  if (v2[26] && v2[22] == v6)
  {
    lck_mtx_unlock((lck_mtx_t *)(v2 + 28));
  }
  else
  {
    v2[22] = v6;
    lck_mtx_unlock((lck_mtx_t *)(v2 + 28));
    if ((*(unsigned char *)(v9 + 32) & 0x20) == 0)
    {
      uintptr_t v7 = (int)lifs_close_request(v9, (long long *)v2, v6);
      goto LABEL_18;
    }
  }
  uintptr_t v7 = 0;
LABEL_18:
  lck_rw_unlock_exclusive((lck_rw_t *)(v2 + 18));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314005Eu, (uintptr_t)v1, (uintptr_t)v2, v2[32], v7);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_remove(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = (long long *)vnode_fsnode(v2);
  unsigned int v5 = *(vnode **)(a1 + 8);
  int v6 = *(_DWORD *)(a1 + 32);
  uintptr_t v7 = (long long *)vnode_fsnode(v5);
  uintptr_t arg1 = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140061u, (uintptr_t)v5, (uintptr_t)v2, v6, 0);
  }
  uint64_t v20 = 0;
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  bzero(__dst, 0x400uLL);
  bzero(v15, 0x268uLL);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v7, &arg1);
  if (!lifs_mount_from_node)
  {
    int v9 = *(_DWORD *)(v3 + 48);
    if (v9 > 1023)
    {
      uint64_t lifs_mount_from_node = 63;
      goto LABEL_10;
    }
    size_t v10 = (v9 + 1);
    if (v10 >= 0x401) {
      lifs_vnop_remove_cold_1();
    }
    strlcpy(__dst, *(const char **)(v3 + 40), v10);
    lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
    if (!lifs_lookup(arg1, v7, v3, __dst, (uint64_t)v15))
    {
      uint64_t v12 = lifs_lookup_node(arg1, &v16);
      if (v12)
      {
        if (*(vnode **)(v12 + 224) == v2)
        {
          if (vnode_isinuse(v2, 0))
          {
            if (v6)
            {
              uint64_t lifs_mount_from_node = 16;
              goto LABEL_9;
            }
            uintptr_t v13 = arg1;
            if ((*(unsigned char *)(arg1 + 32) & 4) == 0)
            {
              uint64_t lifs_mount_from_node = lifs_sillyrename((uint64_t)v7, (uint64_t)v4, __dst, *(vfs_context_t *)(a1 + 40));
              goto LABEL_9;
            }
            v6 |= 0x8000u;
          }
          else
          {
            uintptr_t v13 = arg1;
          }
          uint64_t lifs_mount_from_node = lifs_remove_request(v13, v7, v4, __dst, v6, (uint64_t)v18);
          if (lifs_mount_from_node) {
            goto LABEL_9;
          }
          lifs_update_freespace(arg1, (unint64_t *)&v19 + 1);
          *((void *)v4 + 29) = 0;
          *((void *)v4 + 30) = 0;
          update_lnode_attr((uint64_t)v7, (uint64_t)v18);
          cache_purge(v2);
          lifs_invalidate_dirattrcache_ext((uint64_t)v7, 1);
          if (*((_DWORD *)v4 + 70) == 1) {
            vnode_recycle(v2);
          }
        }
      }
    }
    uint64_t lifs_mount_from_node = 0;
LABEL_9:
    lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
  }
LABEL_10:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140062u, arg1, (uintptr_t)v5, (uintptr_t)v7, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_rename(uint64_t a1)
{
  return lifs_vnop_dorename(*(vnode **)(a1 + 8), *(vnode **)(a1 + 16), *(vnode **)(a1 + 32), *(vnode **)(a1 + 40), *(void *)(a1 + 24), *(void *)(a1 + 48), 0, *(vfs_context **)(a1 + 56));
}

uint64_t lifs_vnop_link(void *a1)
{
  uint64_t v1 = (vnode *)a1[1];
  uintptr_t v2 = (vnode *)a1[2];
  uint64_t v3 = a1[3];
  bzero(__dst, 0x400uLL);
  int v4 = vnode_fsnode(v2);
  unsigned int v5 = (long long *)vnode_fsnode(v1);
  uintptr_t arg1 = 0;
  *(_OWORD *)uint64_t v12 = 0u;
  memset(v11, 0, sizeof(v11));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (!lifs_mount_from_node)
  {
    if (v5)
    {
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140069u, arg1, (uintptr_t)v2, (uintptr_t)v4, (uintptr_t)v5);
      }
      int v8 = *(_DWORD *)(v3 + 48);
      if (v8 <= 1023)
      {
        size_t v9 = (v8 + 1);
        if (v9 >= 0x401) {
          lifs_vnop_link_cold_1();
        }
        strlcpy(__dst, *(const char **)(v3 + 40), v9);
        lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
        uint64_t lifs_mount_from_node = lifs_link_request(arg1, v5, __dst, v4, (uint64_t)v11);
        if (!lifs_mount_from_node)
        {
          lifs_update_freespace(arg1, v12);
          update_lnode_attr((uint64_t)v5, (uint64_t)v11);
          update_lnode_attr((uint64_t)v4, (uint64_t)&v11[11] + 8);
          lifs_invalidate_dirattrcache_ext((uint64_t)v4, 1);
        }
        lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
      }
      else
      {
        uint64_t lifs_mount_from_node = 63;
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x314006Au, arg1, (uintptr_t)v4, (uintptr_t)v5, (int)lifs_mount_from_node);
      }
    }
    else
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing target node");
      return 22;
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_lookup(uintptr_t *a1)
{
  uint64_t v3 = (vnode *)a1[1];
  uintptr_t v2 = (uintptr_t *)a1[2];
  int v4 = (long long *)vnode_fsnode(v3);
  uintptr_t arg1 = 0;
  uint64_t v5 = a1[3];
  bzero(v21, 0x268uLL);
  unsigned int v6 = *(_DWORD *)(v5 + 4);
  *uintptr_t v2 = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314006Du, a1[1], a1[3], 0, 0);
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (!lifs_mount_from_node)
  {
    if (*(int *)(v5 + 48) > 1023)
    {
      uint64_t lifs_mount_from_node = 63;
      goto LABEL_36;
    }
    int v8 = (char *)kalloc_data();
    size_t v9 = (*(_DWORD *)(v5 + 48) + 1);
    if (v9 >= 0x401) {
      lifs_vnop_lookup_cold_1();
    }
    size_t v10 = v8;
    strlcpy(v8, *(const char **)(v5 + 40), v9);
    if (*v10 == 46 && *(_DWORD *)(v5 + 48) == 1)
    {
      *uintptr_t v2 = (uintptr_t)v3;
      vnode_get(v3);
      goto LABEL_11;
    }
    if ((*(unsigned char *)(v5 + 5) & 0x20) == 0)
    {
LABEL_11:
      if (!*v2)
      {
        lck_rw_lock_shared((lck_rw_t *)(arg1 + 128));
        while (1)
        {
          int v11 = cache_lookup_ext();
          int v12 = v11;
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x314006Cu, arg1, (uintptr_t)v3, *v2, v11);
          }
          if (v12 == -1)
          {
            uint64_t lifs_mount_from_node = 2 * (*v2 == 0);
LABEL_53:
            lck_rw_unlock_shared((lck_rw_t *)(arg1 + 128));
            goto LABEL_28;
          }
          if (v12 == 2)
          {
            uint64_t lifs_mount_from_node = 2;
            if ((*(_DWORD *)v5 | 2) == 3)
            {
              if ((*(unsigned char *)(v5 + 5) & 0x80) != 0) {
                uint64_t lifs_mount_from_node = 4294967294;
              }
              else {
                uint64_t lifs_mount_from_node = 2;
              }
            }
            goto LABEL_53;
          }
          uint64_t v13 = lifs_lookup(arg1, v4, v5, v10, (uint64_t)v21);
          uint64_t lifs_mount_from_node = v13;
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x314006Cu, arg1, (uintptr_t)v4, *(int *)(v5 + 48), (int)v13);
          }
          if (lifs_mount_from_node)
          {
            if (lifs_mount_from_node == 2)
            {
              int v18 = (v6 >> 14) & 1;
              if (!*(_DWORD *)v5 && (*(unsigned char *)(arg1 + 41) & 0x40) == 0)
              {
                long long v19 = *(unsigned char **)(v5 + 40);
                if (v19)
                {
                  if (*(int *)(v5 + 48) >= 3 && *v19 == 46 && v19[1] == 95) {
                    int v18 = 0;
                  }
                }
              }
              uint64_t lifs_mount_from_node = handle_enoent_from_lookup(v3, (componentname *)v5, v18);
            }
            goto LABEL_53;
          }
          uint64_t node = lifs_create_node(*(mount **)(arg1 + 448), v22, v3, v5, (uint64_t)v23, (vnode_t *)v2);
          if (!node) {
            break;
          }
          uint64_t lifs_mount_from_node = node;
          if (node != 2) {
            goto LABEL_53;
          }
          *uintptr_t v2 = 0;
        }
        vnode_fsnode((vnode_t)*v2);
        BOOL v16 = v23[6] == 1 && v23[8] > 1u;
        if ((v6 & 0x4000) != 0) {
          cache_enter(v3, (vnode_t)*v2, (componentname *)v5);
        }
        lck_rw_unlock_shared((lck_rw_t *)(arg1 + 128));
        goto LABEL_33;
      }
LABEL_24:
      BOOL v16 = 0;
LABEL_33:
      kfree_data();
      uint64_t lifs_mount_from_node = 0;
      if (v16 && *v2)
      {
        vnode_update_identity((vnode_t)*v2, v3, *(const char **)(v5 + 40), *(_DWORD *)(v5 + 48), 0, 3);
        uint64_t lifs_mount_from_node = 0;
      }
      goto LABEL_36;
    }
    vnode_t v15 = vnode_getparent(v3);
    *uintptr_t v2 = (uintptr_t)v15;
    if (v15) {
      goto LABEL_24;
    }
    uint64_t lifs_mount_from_node = 2;
LABEL_28:
    kfree_data();
  }
LABEL_36:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314006Eu, a1[1], a1[3], *v2, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_fsync(uint64_t a1)
{
  return lifs_fsync_internal(a1);
}

uint64_t lifs_vnop_symlink(void *a1)
{
  uintptr_t v2 = (vnode *)a1[1];
  uint64_t v3 = (vnode_t *)a1[2];
  int v4 = (componentname *)a1[3];
  uint64_t v5 = (const char *)a1[5];
  unsigned int v6 = (long long *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  *(_OWORD *)int v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v6, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140075u, arg1, (uintptr_t)v2, (uintptr_t)v6, 0);
    }
    if (v4->cn_namelen <= 1023)
    {
      int v8 = (char *)kalloc_data();
      size_t v9 = (char *)kalloc_data();
      convert_vnode_attr((uint64_t)v17, a1[4]);
      *(void *)a1[4] |= 0x380uLL;
      size_t v10 = (v4->cn_namelen + 1);
      if (v10 >= 0x401) {
        lifs_vnop_symlink_cold_1();
      }
      strlcpy(v9, v4->cn_nameptr, v10);
      strlcpy(v8, v5, 0x400uLL);
      lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
      uint64_t lifs_mount_from_node = lifs_symlink_request(arg1, v9, v8, v6, v17, (uint64_t)v16);
      if (!lifs_mount_from_node)
      {
        lifs_update_freespace(arg1, v18);
        uint64_t node = lifs_create_node(*(mount **)(arg1 + 448), v16, v2, (uint64_t)v4, (uint64_t)v17, v3);
        uint64_t lifs_mount_from_node = node;
        if (node)
        {
          uint64_t v15 = 0;
          memset(v14, 0, sizeof(v14));
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: fail to create node [%d]", "lifs_vnop_symlink", node);
          lifs_remove_request(arg1, v6, v16, v9, 0, (uint64_t)v14);
        }
        else
        {
          vnode_fsnode(*v3);
          update_lnode_attr((uint64_t)v6, (uint64_t)&v17[11] + 8);
          cache_enter(v2, *v3, v4);
          lifs_invalidate_dirattrcache_ext((uint64_t)v6, 1);
        }
      }
      lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
      kfree_data();
      kfree_data();
    }
    else
    {
      uint64_t lifs_mount_from_node = 63;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140076u, arg1, (uintptr_t)v2, (uintptr_t)v6, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_pathconf(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = (long long *)vnode_fsnode(v2);
  uint64_t v13 = 0;
  uintptr_t arg1 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140079u, arg1, (uintptr_t)v2, (uintptr_t)v3, 0);
    }
    lck_mtx_lock((lck_mtx_t *)(arg1 + 96));
    if ((*(unsigned char *)(arg1 + 32) & 1) != 0 || (lifs_pathconf(arg1, v3), uint64_t lifs_mount_from_node = v5, !v5))
    {
      int v6 = *(_DWORD *)(a1 + 16);
      uint64_t lifs_mount_from_node = 22;
      switch(v6)
      {
        case 4:
          __asm { BTI             j; jumptable 000000000000A9B8 case 4 }
          int v11 = *(_DWORD *)(arg1 + 460);
          goto LABEL_18;
        case 5:
        case 6:
        case 9:
        case 10:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
          break;
        case 7:
          __asm { BTI             j; jumptable 000000000000A9B8 case 7 }
          int v11 = *(_DWORD *)(arg1 + 464);
          goto LABEL_18;
        case 8:
          __asm { BTI             j; jumptable 000000000000A9B8 case 8 }
          int v11 = *(_DWORD *)(arg1 + 468);
          goto LABEL_18;
        case 11:
          __asm { BTI             j; jumptable 000000000000A9B8 case 11 }
          int v11 = *(_DWORD *)(arg1 + 472);
          goto LABEL_18;
        case 12:
          __asm { BTI             j; jumptable 000000000000A9B8 case 12 }
          int v11 = *(_DWORD *)(arg1 + 476);
          goto LABEL_18;
        case 18:
          __asm { BTI             j; jumptable 000000000000A9B8 case 18 }
          int v11 = *(_DWORD *)(arg1 + 480);
          goto LABEL_18;
        default:
          if (v6 == 26)
          {
            uint64_t lifs_mount_from_node = lifs_getfsattr_call(v3, "_N_PC_XATTR_SIZE_BITS", &v13, 8);
            if (lifs_mount_from_node) {
              break;
            }
            int v11 = v13;
          }
          else
          {
            if (v6 != 1) {
              break;
            }
            int v11 = *(_DWORD *)(arg1 + 456);
          }
LABEL_18:
          uint64_t lifs_mount_from_node = 0;
          **(_DWORD **)(a1 + 24) = v11;
          break;
      }
    }
    __asm { BTI             j; jumptable 000000000000A9B8 cases 5,6,9,10,13-17 }
    lck_mtx_unlock((lck_mtx_t *)(arg1 + 96));
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x314007Au, arg1, (uintptr_t)v2, (uintptr_t)v3, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_reclaim(uint64_t a1)
{
  uint64_t v1 = *(vnode **)(a1 + 8);
  if (!v1) {
    return 22;
  }
  uintptr_t v15 = 0;
  cache_purge(v1);
  uintptr_t v2 = (char *)vnode_fsnode(v1);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v15);
  uint64_t v4 = lifs_mount_from_node;
  if (lifs_mount_from_node == 6 || lifs_mount_from_node == 0)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      uintptr_t v6 = v15;
      int v7 = vnode_usecount();
      kernel_debug_filtered(0x314007Du, v6, (uintptr_t)v1, (uintptr_t)v2, v7);
    }
    vnode_removefsref(v1);
    int v8 = *(mount **)(v15 + 448);
    if (v8 && !vfs_isforce(*(mount_t *)(v15 + 448)) && !vnode_isvroot(v1))
    {
      if (vfs_isunmount(v8))
      {
        v14[0] = 0;
        v14[1] = 0;
        LODWORD(v4) = lifs_reclaim_request(v15, (long long *)v2, (uint64_t)v14);
        if (!v4) {
          lifs_update_freespace(v15, v14);
        }
      }
      else
      {
        uint64_t v13 = (void *)kalloc_type_impl();
        *uint64_t v13 = v15;
        LODWORD(v4) = lifs_reclaim_request_async(v15, (long long *)v2, (uint64_t)lifs_reclaim_done, (uint64_t)v13, (uint64_t)(v13 + 1));
      }
    }
    cleanup_sillyrename_entries((uint64_t)v2);
    lck_mtx_lock((lck_mtx_t *)(v2 + 112));
    *((_DWORD *)v2 + 32) |= 4u;
    lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
    lck_mtx_lock((lck_mtx_t *)(v15 + 96));
    uint64_t v9 = v15;
    if (v1 == *(vnode **)(v15 + 16))
    {
      *(void *)(v15 + 16) = 0;
    }
    else
    {
      lifs_hashremove((uint64_t)v2);
      uint64_t v9 = v15;
    }
    lck_mtx_unlock((lck_mtx_t *)(v9 + 96));
    if ((v2[129] & 8) != 0)
    {
      lck_rw_lock_exclusive((lck_rw_t *)(v2 + 824));
      lifs_purge_extents(*((void *)v2 + 102));
      lifs_deinit_extent_tree();
      lck_rw_unlock_exclusive((lck_rw_t *)(v2 + 824));
    }
    lck_rw_destroy((lck_rw_t *)(v2 + 504), (lck_grp_t *)lifs_node_grp);
    lck_mtx_destroy((lck_mtx_t *)(v2 + 112), (lck_grp_t *)lifs_node_grp);
    lck_rw_destroy((lck_rw_t *)(v2 + 576), (lck_grp_t *)lifs_node_grp);
    lck_rw_destroy((lck_rw_t *)(v2 + 824), (lck_grp_t *)lifs_node_grp);
    lck_rw_destroy((lck_rw_t *)(v2 + 72), (lck_grp_t *)lifs_node_grp);
    vnode_clearfsnode(v1);
    lifs_free_supported_xattrs((uint64_t)v2);
    kfree_type_impl();
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      uintptr_t v10 = v15;
      int v11 = vnode_usecount();
      kernel_debug_filtered(0x314007Eu, v10, (uintptr_t)v1, v11, (int)v4);
    }
    return 0;
  }
  return v4;
}

uint64_t lifs_vnop_getattrlistbulk(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = *(vnode_attr **)(a1 + 24);
  uint64_t v4 = (char *)vnode_fsnode(v2);
  uintptr_t v45 = 0;
  uint64_t v5 = *(uio **)(a1 + 32);
  off_t v6 = uio_offset(v5);
  unsigned int v7 = uio_resid(v5);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140081u, 0, (uintptr_t)v2, v6, v7);
  }
  *(_OWORD *)uintptr_t arg1 = 0u;
  *(_OWORD *)uintptr_t arg4 = 0u;
  if (vnode_vtype(v2) != VDIR)
  {
    uint64_t v10 = 0;
    uint64_t v9 = 20;
    goto LABEL_8;
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &v45);
  if (lifs_mount_from_node)
  {
    uint64_t v9 = lifs_mount_from_node;
LABEL_6:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  uintptr_t v15 = *(_DWORD **)(a1 + 64);
  if (v15) {
    *uintptr_t v15 = 0;
  }
  BOOL v16 = *(_DWORD **)(a1 + 56);
  if (v16) {
    *BOOL v16 = 0;
  }
  if (v6)
  {
    lck_rw_lock_shared((lck_rw_t *)(v4 + 576));
    *(int8x16_t *)uintptr_t arg1 = vextq_s8(*((int8x16_t *)v4 + 34), *((int8x16_t *)v4 + 34), 8uLL);
    lck_rw_unlock_shared((lck_rw_t *)(v4 + 576));
  }
  else
  {
    arg1[0] = 0;
    arg1[1] = 0;
  }
  uint64_t v17 = lifs_readdir_cached((uint64_t)v4, v45, v6, arg1, &arg1[1], a1, v3);
  uint64_t v9 = v17;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140080u, arg1[0], **(int **)(a1 + 64), **(int **)(a1 + 56), (int)v17);
  }
  if (v9 == -1000)
  {
    uint64_t v10 = 0;
    uint64_t v9 = 4294966296;
    goto LABEL_8;
  }
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_6;
  }
  off_t v42 = uio_offset(*(uio_t *)(a1 + 32));
  unsigned int v18 = uio_resid(*(uio_t *)(a1 + 32));
  if (v18 >= 0x10000) {
    int v19 = 0x10000;
  }
  else {
    int v19 = v18;
  }
  uintptr_t v40 = arg1[1];
  uint64_t v10 = kalloc_data();
  uint64_t v20 = convert_va_active_to_requested_attributes((uint64_t)v3);
  uint64_t v21 = lifs_getattrlistbulk_request(v45, arg1[0], (long long *)v4, v19, arg1[1], v20, v10, v19, (uint64_t)arg1);
  if (v21)
  {
    uint64_t v9 = v21;
    goto LABEL_8;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140080u, v45, (uintptr_t)v2, arg1[1], SLODWORD(arg4[0]));
  }
  unsigned int v22 = arg4[0];
  if ((arg4[0] & 0x80000000) != 0)
  {
    uint64_t v9 = 22;
    goto LABEL_8;
  }
  if (LODWORD(arg4[0]))
  {
    unint64_t v23 = v42;
    if (v42 && arg1[1] != v40)
    {
      uint64_t v9 = 5;
      goto LABEL_8;
    }
    int v37 = 0;
    unint64_t v25 = v42;
    uint64_t v26 = v10;
    while (1)
    {
      off_t a_offset = v25;
      uint64_t v41 = v26;
      signed int v38 = v22;
      uint64_t v27 = lifs_pack_attrlist_entry(v3, v26, v22, a1, v45, v23, v25);
      if (v27 == -2)
      {
        uint64_t v28 = v41;
        arg1[0] = *(void *)v41;
        unsigned int v30 = *(unsigned __int16 *)(v41 + 8);
        if (!*(_WORD *)(v41 + 8)) {
          goto LABEL_57;
        }
        if (*(void *)v41 == -1) {
          goto LABEL_59;
        }
      }
      else
      {
        uint64_t v9 = v27;
        uint64_t v28 = v41;
        if (v27)
        {
          if (v27 != -1) {
            goto LABEL_8;
          }
LABEL_57:
          unint64_t v25 = a_offset;
          goto LABEL_59;
        }
        BOOL v29 = __OFADD__(v37++, 1);
        unint64_t v25 = a_offset;
        if (v29) {
          lifs_vnop_getattrlistbulk_cold_1();
        }
        unsigned int v30 = *(unsigned __int16 *)(v41 + 8);
        arg1[0] = *(void *)v41;
        if (!v30 || *(void *)v41 == -1)
        {
          unint64_t v25 = a_offset + 1;
LABEL_59:
          uio_setoffset(v5, v25);
          long long v31 = *(_DWORD **)(a1 + 64);
          if (v31) {
            *v31 += v37;
          }
          long long v32 = *(_DWORD **)(a1 + 56);
          if (v32) {
            *long long v32 = arg1[0] == -1;
          }
          *((void *)v4 + 55) = arg1[1];
          lck_rw_lock_exclusive((lck_rw_t *)(v4 + 576));
          uint64_t v33 = 0;
          while (*(void *)&v4[v33 + 624] != v6)
          {
            v33 += 24;
            if (v33 == 192) {
              goto LABEL_70;
            }
          }
          uintptr_t v34 = arg1[0];
          long long v35 = (unint64_t *)&v4[v33 + 624];
          if (arg1[0] == -1)
          {
            *long long v35 = 0;
            *(void *)&v4[v33 + 632] = 0;
            *(void *)&v4[v33 + 640] = 0;
          }
          else
          {
            *long long v35 = v25;
            long long v36 = &v4[v33];
            *((void *)v36 + 79) = v34;
            *((void *)v36 + 80) = arg1[1];
          }
LABEL_70:
          lck_rw_unlock_exclusive((lck_rw_t *)(v4 + 576));
LABEL_71:
          uint64_t v9 = 0;
          goto LABEL_8;
        }
      }
      uint64_t v26 = v28 + v30;
      ++v25;
      unsigned int v22 = v38 - v30;
      unint64_t v23 = v42;
      if (v38 <= (int)v30) {
        goto LABEL_59;
      }
    }
  }
  long long v24 = *(_DWORD **)(a1 + 56);
  if (!v24) {
    goto LABEL_71;
  }
  uint64_t v9 = 0;
  *long long v24 = 1;
LABEL_8:
  int v11 = *(_DWORD **)(a1 + 56);
  if (v11 && *v11) {
    lifs_invalidate_dirattrcache((uint64_t)v4);
  }
  if (v9 == -1000)
  {
    uint64_t v9 = 0;
    **(_DWORD **)(a1 + 64) = 0;
    **(_DWORD **)(a1 + 56) = 1;
  }
  if (v10) {
    kfree_data();
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v12 = v45;
    off_t v13 = uio_offset(v5);
    kernel_debug_filtered(0x3140082u, v12, (uintptr_t)v2, (int)v9, v13);
  }
  return v9;
}

uint64_t lifs_vnop_readlink(uint64_t a1)
{
  uint64_t v18 = 0;
  uintptr_t v2 = (char *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  unint64_t v3 = uio_offset(*(uio_t *)(a1 + 16));
  uint64_t v6 = a1 + 8;
  uint64_t v4 = *(vnode **)(a1 + 8);
  uint64_t v5 = *(uio **)(v6 + 8);
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    off_t v7 = uio_offset(v5);
    user_ssize_t v8 = uio_resid(v5);
    kernel_debug_filtered(0x3140085u, (uintptr_t)v4, v7, v8, 0);
  }
  if (vnode_vtype(v4) == VDIR)
  {
    uint64_t lifs_mount_from_node = 21;
    goto LABEL_19;
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v18);
  if (!lifs_mount_from_node)
  {
    lck_mtx_lock((lck_mtx_t *)(v2 + 112));
    if (v3 >= *((void *)v2 + 37)) {
      goto LABEL_17;
    }
    uint64_t v10 = (const char *)*((void *)v2 + 74);
    if (!v10)
    {
      bzero(__s, 0x400uLL);
      lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
      uint64_t v11 = lifs_readlink_request(v18, (long long *)v2, (uint64_t)__s);
      if (v11)
      {
        uint64_t lifs_mount_from_node = v11;
        lck_mtx_lock((lck_mtx_t *)(v2 + 112));
        goto LABEL_18;
      }
      unsigned int v12 = strlen(__s);
      if (v12 >= 0x400)
      {
        lck_mtx_lock((lck_mtx_t *)(v2 + 112));
      }
      else
      {
        size_t v13 = v12 + 1;
        long long v14 = (char *)kalloc_data();
        strlcpy(v14, __s, v13);
        lck_mtx_lock((lck_mtx_t *)(v2 + 112));
        if (v14)
        {
          if (*((void *)v2 + 74))
          {
            kfree_data();
          }
          else
          {
            *((void *)v2 + 74) = v14;
            *((_DWORD *)v2 + 150) = v13;
          }
        }
      }
      uint64_t v10 = (const char *)*((void *)v2 + 74);
      if (!v10)
      {
LABEL_17:
        uint64_t lifs_mount_from_node = 0;
        goto LABEL_18;
      }
    }
    uint64_t lifs_mount_from_node = uiomove(v10, *((_DWORD *)v2 + 150) - 1, v5);
LABEL_18:
    lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
  }
LABEL_19:
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    off_t v15 = uio_offset(v5);
    user_ssize_t v16 = uio_resid(v5);
    kernel_debug_filtered(0x3140086u, (uintptr_t)v4, v15, v16, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_access(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  unint64_t v3 = vnode_mount(v2);
  uint64_t v4 = (long long *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400D1u, arg1, (uintptr_t)v2, (uintptr_t)v4, 0);
    }
    if (vfs_authopaqueaccess(v3)) {
      uint64_t lifs_mount_from_node = lifs_access_request(arg1, v4, *(_DWORD *)(a1 + 16));
    }
    else {
      uint64_t lifs_mount_from_node = 0;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400D2u, arg1, (uintptr_t)v2, (uintptr_t)v4, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_open(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  unint64_t v3 = (char *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140089u, arg1, (uintptr_t)v2, (uintptr_t)v3, *(int *)(a1 + 16));
  }
  lck_rw_lock_shared((lck_rw_t *)(v3 + 72));
  int v5 = *(_DWORD *)(a1 + 16);
  int v6 = v5 & 3;
  if ((*(unsigned char *)(arg1 + 32) & 0x20) != 0
    || (uint64_t lifs_mount_from_node = lifs_open_request(arg1, (long long *)v3, v5 & 3), !lifs_mount_from_node))
  {
    lck_mtx_lock((lck_mtx_t *)(v3 + 112));
    if ((v3[129] & 0x20) != 0)
    {
      uintptr_t arg3 = 0;
      uint64_t v15 = 0;
      uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &v15);
      if (lifs_mount_from_node) {
        goto LABEL_25;
      }
      lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
      uint64_t lifs_mount_from_node = lifs_getfsattr_call((long long *)v3, "_N_f_vdl", &arg3, 8);
      lck_mtx_lock((lck_mtx_t *)(v3 + 112));
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140088u, (uintptr_t)v3, *((void *)v3 + 61), arg3, (int)lifs_mount_from_node);
      }
      if (lifs_mount_from_node) {
        goto LABEL_25;
      }
      int v9 = *((_DWORD *)v3 + 32);
      if ((v9 & 0x2000) != 0)
      {
        *((void *)v3 + 62) = arg3;
        *((_DWORD *)v3 + 32) = v9 & 0xFFFF9FFF | 0x4000;
      }
    }
    ++*((_DWORD *)v3 + 26);
    uintptr_t v7 = *((_DWORD *)v3 + 22) | v6;
    *((_DWORD *)v3 + 22) = v7;
    if (v6 == 3)
    {
      int v8 = *((_DWORD *)v3 + 25);
      *((_DWORD *)v3 + 25) = v8 + 1;
      if (__OFADD__(v8, 1)) {
        lifs_vnop_open_cold_1();
      }
    }
    else if (v5)
    {
      int v11 = *((_DWORD *)v3 + 23);
      *((_DWORD *)v3 + 23) = v11 + 1;
      if (__OFADD__(v11, 1)) {
        lifs_vnop_open_cold_3();
      }
    }
    else
    {
      int v10 = *((_DWORD *)v3 + 24);
      *((_DWORD *)v3 + 24) = v10 + 1;
      if (__OFADD__(v10, 1)) {
        lifs_vnop_open_cold_2();
      }
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140088u, v7, *((int *)v3 + 23), *((int *)v3 + 24), *((int *)v3 + 25));
    }
    uint64_t lifs_mount_from_node = 0;
LABEL_25:
    lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  }
  lck_rw_unlock_shared((lck_rw_t *)(v3 + 72));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314008Au, arg1, (uintptr_t)v2, (uintptr_t)v3, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_create(void *a1)
{
  unint64_t v3 = (vnode *)a1[1];
  uintptr_t v2 = (vnode_t *)a1[2];
  uint64_t v4 = (long long *)vnode_fsnode(v3);
  uintptr_t arg1 = 0;
  int v5 = (componentname *)a1[3];
  *(_OWORD *)uint64_t v20 = 0u;
  memset(v19, 0, sizeof(v19));
  memset(v18, 0, sizeof(v18));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x314008Du, arg1, (uintptr_t)v3, (uintptr_t)v4, 0);
    }
    if (v5->cn_namelen <= 1023)
    {
      convert_vnode_attr((uint64_t)v19, a1[4]);
      *(void *)a1[4] |= 0x380uLL;
      uintptr_t v7 = (char *)kalloc_data();
      size_t v8 = (v5->cn_namelen + 1);
      if (v8 >= 0x401) {
        lifs_vnop_create_cold_1();
      }
      int v9 = v7;
      strlcpy(v7, v5->cn_nameptr, v8);
      lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
      uint64_t lifs_mount_from_node = lifs_create_request(arg1, v9, v4, v19, (uint64_t)v18);
      if (!lifs_mount_from_node)
      {
        lifs_update_freespace(arg1, v20);
        uint64_t node = lifs_create_node(*(mount **)(arg1 + 448), v18, v3, (uint64_t)v5, (uint64_t)v19, v2);
        uint64_t lifs_mount_from_node = node;
        if (node)
        {
          uint64_t v17 = 0;
          memset(v16, 0, sizeof(v16));
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: fail to create node [%d]", "lifs_vnop_create", node);
          lifs_remove_request(arg1, v4, v18, v9, 0, (uint64_t)v16);
        }
        else
        {
          vnode_fsnode(*v2);
          update_lnode_attr((uint64_t)v4, (uint64_t)&v19[11] + 8);
          cache_purge_negatives(v3);
          lifs_invalidate_dirattrcache_ext((uint64_t)v4, 1);
          cache_enter(v3, *v2, v5);
        }
      }
      lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
      if (v9) {
        kfree_data();
      }
    }
    else
    {
      uint64_t lifs_mount_from_node = 63;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      uintptr_t v11 = arg1;
      unsigned int v12 = *v2;
      if (v12) {
        size_t v13 = vnode_fsnode(v12);
      }
      else {
        size_t v13 = 0;
      }
      kernel_debug_filtered(0x314008Eu, v11, (uintptr_t)v12, (uintptr_t)v13, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_close(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  unint64_t v3 = (char *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  uintptr_t v4 = *(int *)(a1 + 16);
  int v29 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140091u, arg1, (uintptr_t)v2, (uintptr_t)v3, v4);
  }
  if (vnode_vtype(v2) == VREG)
  {
    lck_rw_lock_shared((lck_rw_t *)(v3 + 504));
    cluster_push_err(v2, 1028, 0, 0, &v29);
    lifs_issue_endio((uintptr_t)v3, v29, 0);
    lck_rw_unlock_shared((lck_rw_t *)(v3 + 504));
  }
  lck_rw_lock_exclusive((lck_rw_t *)(v3 + 72));
  int v6 = v4 & 3;
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  switch(v6)
  {
    case 3:
      int v13 = *((_DWORD *)v3 + 25);
      BOOL v8 = __OFSUB__(v13, 1);
      int v14 = v13 - 1;
      if (v14 < 0 == v8)
      {
        char v11 = 0;
        *((_DWORD *)v3 + 25) = v14;
        int v12 = 3;
        int v10 = 1;
        goto LABEL_16;
      }
      break;
    case 2:
      int v15 = *((_DWORD *)v3 + 24);
      BOOL v8 = __OFSUB__(v15, 1);
      int v16 = v15 - 1;
      if (v16 < 0 == v8)
      {
        int v10 = 0;
        char v11 = 0;
        *((_DWORD *)v3 + 24) = v16;
        int v12 = 2;
        goto LABEL_16;
      }
      break;
    case 1:
      int v7 = *((_DWORD *)v3 + 23);
      BOOL v8 = __OFSUB__(v7, 1);
      int v9 = v7 - 1;
      if (v9 < 0 == v8)
      {
        int v10 = 0;
        *((_DWORD *)v3 + 23) = v9;
        char v11 = 1;
        int v12 = 1;
        goto LABEL_16;
      }
      break;
  }
  int v10 = 0;
  int v12 = 0;
  char v11 = 1;
LABEL_16:
  if (*((_DWORD *)v3 + 25)) {
    int v17 = 3;
  }
  else {
    int v17 = 0;
  }
  int v18 = v17 | (*((_DWORD *)v3 + 23) != 0);
  if (*((_DWORD *)v3 + 32) & 2 | *((_DWORD *)v3 + 24)) {
    v18 |= 2u;
  }
  uintptr_t v19 = v18 | *((_DWORD *)v3 + 32) & 1u;
  *((_DWORD *)v3 + 22) = v19;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140090u, v19, *((int *)v3 + 23), *((int *)v3 + 24), *((int *)v3 + 25));
  }
  if ((*(unsigned char *)(arg1 + 32) & 0x20) == 0)
  {
    unsigned int v20 = lifs_close_request(arg1, (long long *)v3, v19);
    if (v20)
    {
      unsigned int v21 = v20;
      lck_mtx_lock((lck_mtx_t *)(v3 + 112));
      if (v10)
      {
        int v22 = *((_DWORD *)v3 + 25);
        *((_DWORD *)v3 + 25) = v22 + 1;
        if (__OFADD__(v22, 1)) {
          lifs_vnop_close_cold_1();
        }
      }
      else if (v12)
      {
        int v27 = *((_DWORD *)v3 + 23);
        *((_DWORD *)v3 + 23) = v27 + 1;
        if (__OFADD__(v27, 1)) {
          lifs_vnop_close_cold_3();
        }
      }
      else if ((v11 & 1) == 0)
      {
        int v24 = *((_DWORD *)v3 + 24);
        *((_DWORD *)v3 + 24) = v24 + 1;
        if (__OFADD__(v24, 1)) {
          lifs_vnop_close_cold_2();
        }
      }
      *((_DWORD *)v3 + 22) |= v12;
      goto LABEL_44;
    }
  }
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  int v23 = *((_DWORD *)v3 + 26) - 1;
  *((_DWORD *)v3 + 26) = v23;
  if (!v23)
  {
    *((void *)v3 + 11) = 0;
    *((void *)v3 + 12) = 0;
    if ((vfs_flags(*(mount_t *)(arg1 + 448)) & 0x1000) != 0)
    {
      if (vnode_vtype(v2) == VREG)
      {
        if ((int v25 = *((_DWORD *)v3 + 32), (v25 & 0x8000) != 0)
          && (v26 = vfs_flags(*(mount_t *)(arg1 + 448)), int v25 = *((_DWORD *)v3 + 32), (v26 & 0x10000001) == 0)
          || (v25 & 0x10000) != 0)
        {
          unsigned int v21 = 0;
          *((_DWORD *)v3 + 32) = v25 & 0xFFFC7FFF | 0x20000;
          goto LABEL_44;
        }
      }
    }
    else
    {
      invalidate_lnode_attr_locked((uint64_t)v3);
    }
  }
  unsigned int v21 = 0;
LABEL_44:
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  lck_rw_unlock_exclusive((lck_rw_t *)(v3 + 72));
  if (v29) {
    uint64_t lifs_mount_from_node = v29;
  }
  else {
    uint64_t lifs_mount_from_node = v21;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140092u, arg1, (uintptr_t)v2, (uintptr_t)v3, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_getattr(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  unint64_t v3 = *(void **)(a1 + 16);
  uintptr_t v4 = (char *)vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  uint64_t v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)uintptr_t arg3 = 0u;
  long long v28 = 0u;
  memset(v26, 0, sizeof(v26));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  uint64_t v6 = v3[1] & 0x14;
  BOOL v7 = v6 != 0;
  if (v6) {
    lck_rw_lock_shared((lck_rw_t *)(v4 + 504));
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140095u, arg1, (uintptr_t)v2, (uintptr_t)v4, v6 != 0);
  }
  lck_mtx_lock((lck_mtx_t *)(v4 + 112));
  if (*(_DWORD *)(arg1 + 552) && (*((void *)v4 + 29) || *((_DWORD *)v4 + 60)))
  {
    tv.tv_sec = 0;
    *(void *)&tv.tv_usec = 0;
    microuptime(&tv);
    uintptr_t v8 = 1000000 * (tv.tv_sec - *((void *)v4 + 29)) - *((int *)v4 + 60) + tv.tv_usec;
    uintptr_t v9 = arg1;
    if (v8 < *(int *)(arg1 + 552) && (((v3[1] & 0xE028) != 0) & (v4[130] >> 1)) == 0) {
      goto LABEL_15;
    }
    if (vfs_isrdonly(*(mount_t *)(arg1 + 448)))
    {
      uintptr_t v9 = arg1;
LABEL_15:
      lifs_pack_vap((uint64_t)v3, (uint64_t)(v4 + 248), *(mount_t *)(v9 + 448));
      uint64_t v11 = v3[1];
      if ((v11 & 0x10) != 0)
      {
        unint64_t v12 = *((void *)v4 + 61);
        if (v12 > v3[6])
        {
          v3[6] = v12;
          *v3 |= 0x10uLL;
        }
      }
      if ((v11 & 4) != 0)
      {
        unint64_t v13 = *((void *)v4 + 61);
        if (v13 > v3[4])
        {
          v3[4] = v13;
          *v3 |= 4uLL;
        }
      }
      lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140094u, arg1, (uintptr_t)v4, *((void *)v4 + 57), v8);
      }
      uintptr_t v14 = 0;
      BOOL v15 = 0;
      BOOL v7 = 0;
LABEL_42:
      uint64_t lifs_mount_from_node = 0;
      if (v6) {
        goto LABEL_43;
      }
      goto LABEL_49;
    }
  }
  lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
  if (v6 && !lck_rw_lock_shared_to_exclusive((lck_rw_t *)(v4 + 504))) {
    lck_rw_lock_exclusive((lck_rw_t *)(v4 + 504));
  }
  uint64_t v16 = lifs_getattr_request(arg1, (long long *)v4, (uint64_t)v26);
  if (!v16)
  {
    lck_mtx_lock((lck_mtx_t *)(v4 + 112));
    if (update_lnode_attr_locked((uint64_t)v4, (uint64_t)v26))
    {
      int v17 = *((_DWORD *)v4 + 32);
      if ((v17 & 0x20000) != 0) {
        *((_DWORD *)v4 + 32) = v17 & 0xFFFDFFFF;
      }
      lifs_pack_vap((uint64_t)v3, (uint64_t)(v4 + 248), *(mount_t *)(arg1 + 448));
      if (v6 && (BYTE8(v26[0]) & 0x40) != 0)
      {
        uintptr_t v18 = *((void *)v4 + 61);
        uintptr_t v14 = v18;
        if (!*((_DWORD *)v4 + 26))
        {
          uintptr_t v14 = 0;
          *((void *)v4 + 61) = 0;
        }
        uintptr_t v19 = arg3[0];
        if (arg3[0] <= v14)
        {
          if (arg3[0] < v14)
          {
            int v22 = *(void **)(a1 + 16);
            uint64_t v23 = v22[1];
            if ((v23 & 0x10) != 0)
            {
              v22[6] = v14;
              *v22 |= 0x10uLL;
            }
            if ((v23 & 4) != 0)
            {
              long long v22[4] = v14;
              *v22 |= 4uLL;
            }
          }
        }
        else
        {
          *((void *)v4 + 61) = arg3[0];
          uintptr_t v14 = v19;
        }
        BOOL v15 = v18 != v14;
        if ((*(unsigned char *)(arg1 + 32) & 0x40) == 0) {
          *((void *)v4 + 62) = v14;
        }
        if ((kdebug_enable & 0xFFFFFFF7) != 0) {
          kernel_debug_filtered(0x3140094u, (uintptr_t)v2, v18, v14, *((void *)v4 + 62));
        }
        goto LABEL_41;
      }
    }
    else
    {
      lifs_pack_vap((uint64_t)v3, (uint64_t)(v4 + 248), *(mount_t *)(arg1 + 448));
    }
    uintptr_t v14 = 0;
    BOOL v15 = 0;
LABEL_41:
    lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
    goto LABEL_42;
  }
  uint64_t lifs_mount_from_node = v16;
  uintptr_t v14 = 0;
  BOOL v15 = 0;
  if (v6)
  {
LABEL_43:
    if (v15)
    {
      lifs_set_io_lock_override(v4);
      ubc_setsize(v2, v14);
      if (!*((void *)v4 + 65)) {
        panic("\"%s: override is not set for lnode %p io_lock\" @%s:%d", "lifs_clear_io_lock_override", v4, "lifs_vnops.c", 197);
      }
      *((void *)v4 + 65) = 0;
    }
    unsigned int v20 = (lck_rw_t *)(v4 + 504);
    if (v7) {
      lck_rw_unlock_exclusive(v20);
    }
    else {
      lck_rw_unlock_shared(v20);
    }
  }
LABEL_49:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140096u, arg1, (uintptr_t)v2, (uintptr_t)v4, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_setattr(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  uintptr_t v4 = vnode_fsnode(v2);
  uintptr_t arg1 = 0;
  uint64_t v60 = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  memset(v50, 0, sizeof(v50));
  unint64_t v5 = *(void *)(v3 + 8);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  unint64_t v7 = v5 & 0x10;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140099u, arg1, (uintptr_t)v2, (uintptr_t)v4, v7 >> 4);
  }
  convert_vnode_attr((uint64_t)v50, v3);
  uint64_t v8 = v5 & 0x4010;
  if ((v5 & 0x4010) == 0)
  {
    int64_t v9 = 0;
    int64_t v10 = 0;
    uintptr_t v11 = arg1;
    goto LABEL_16;
  }
  lck_rw_lock_exclusive((lck_rw_t *)(v4 + 63));
  if ((*((unsigned char *)v4 + 129) & 8) == 0)
  {
    lifs_flush_async_io(arg1, (uint64_t)v4, 1);
LABEL_13:
    int64_t v10 = *(void *)(v3 + 48);
    uintptr_t v11 = arg1;
    if (v10 > *(void *)(arg1 + 824))
    {
      uint64_t lifs_mount_from_node = 27;
      goto LABEL_18;
    }
    int64_t v9 = v4[61];
LABEL_16:
    uint64_t lifs_mount_from_node = lifs_setattr_request(v11, v4, v50, (uint64_t)v50);
    if (lifs_mount_from_node) {
      goto LABEL_17;
    }
    lifs_update_freespace(arg1, (unint64_t *)&v59 + 1);
    lck_mtx_lock((lck_mtx_t *)(v4 + 14));
    update_lnode_attr_locked((uint64_t)v4, (uint64_t)v50);
    lifs_pack_vap(v3, (uint64_t)v50, *(mount_t *)(arg1 + 448));
    lck_mtx_unlock((lck_mtx_t *)(v4 + 14));
    if (!v7 || v10 == v9) {
      goto LABEL_17;
    }
    v4[61] = v10;
    if ((*((unsigned char *)v4 + 129) & 8) != 0)
    {
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140098u, (uintptr_t)v4, v9, v10, v4[62]);
      }
      if (v10 >= v9)
      {
        if ((*(unsigned char *)(arg1 + 40) & 0x40) == 0
          && (*(unsigned char *)(arg1 + 32) & 0x40) == 0
          && (*(unsigned char *)(v3 + 16) & 0x20) == 0)
        {
          uint64_t lifs_mount_from_node = cluster_write(v2, 0, v9, v10, v9, 0, 132);
          lifs_issue_endio((uintptr_t)v4, lifs_mount_from_node, 0);
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x3140098u, (uintptr_t)v4, v9, v10, (int)lifs_mount_from_node);
          }
          if (lifs_mount_from_node)
          {
            uint64_t v49 = 0;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            v21[0] = 0;
            long long v22 = 0u;
            long long v24 = (unint64_t)v9;
            v21[1] = 16;
            convert_vnode_attr((uint64_t)v50, (uint64_t)v21);
            if (!lifs_setattr_request(arg1, v4, v50, (uint64_t)v50))
            {
              lifs_update_freespace(arg1, (unint64_t *)&v59 + 1);
              lck_mtx_lock((lck_mtx_t *)(v4 + 14));
              update_lnode_attr_locked((uint64_t)v4, (uint64_t)v50);
              v4[61] = v51;
              lck_mtx_unlock((lck_mtx_t *)(v4 + 14));
            }
LABEL_17:
            if (!v8) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        lck_rw_lock_exclusive((lck_rw_t *)(v4 + 103));
        lifs_purge_extents(v4[102]);
        lck_rw_unlock_exclusive((lck_rw_t *)(v4 + 103));
      }
    }
    lck_mtx_lock((lck_mtx_t *)(v4 + 14));
    if (v10 <= v9)
    {
      if (v10 < v9 && v4[62] > (unint64_t)v10)
      {
        v4[62] = v10;
        if ((*(unsigned char *)(arg1 + 32) & 0x40) != 0)
        {
          int v15 = vfs_devblocksize(*(mount_t *)(arg1 + 448));
          unint64_t v16 = v4[62];
          if (v10 % (unint64_t)v15)
          {
            int v17 = vfs_devblocksize(*(mount_t *)(arg1 + 448));
            unint64_t v18 = v4[62];
            int v19 = vfs_devblocksize(*(mount_t *)(arg1 + 448));
            unint64_t v14 = v16 + v17 + v18 / v19 * v19 - v18;
            unint64_t v16 = v4[62];
          }
          else
          {
            unint64_t v14 = v4[62];
          }
          uint64_t lifs_mount_from_node = v14 > v16;
LABEL_44:
          lck_mtx_unlock((lck_mtx_t *)(v4 + 14));
          lifs_set_io_lock_override(v4);
          ubc_setsize(v2, v10);
          if (v4[65])
          {
            v4[65] = 0;
            if (lifs_mount_from_node)
            {
              uint64_t lifs_mount_from_node = cluster_write(v2, 0, v4[62], v14, v4[62], 0, 132);
              lifs_issue_endio((uintptr_t)v4, lifs_mount_from_node, 0);
              if ((kdebug_enable & 0xFFFFFFF7) != 0) {
                kernel_debug_filtered(0x3140098u, (uintptr_t)v4, v4[62], v14, (int)lifs_mount_from_node);
              }
            }
            goto LABEL_17;
          }
LABEL_52:
          panic("\"%s: override is not set for lnode %p io_lock\" @%s:%d", "lifs_clear_io_lock_override", v4, "lifs_vnops.c", 197);
        }
      }
    }
    else if ((*(unsigned char *)(arg1 + 32) & 0x40) == 0)
    {
      unint64_t v14 = 0;
      uint64_t lifs_mount_from_node = 0;
      v4[62] = v10;
      goto LABEL_44;
    }
    unint64_t v14 = 0;
    uint64_t lifs_mount_from_node = 0;
    goto LABEL_44;
  }
  if (!vnode_hasdirtyblks(v2)) {
    goto LABEL_13;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140098u, (uintptr_t)v2, (uintptr_t)v4, v7 >> 4, (v5 >> 14) & 1);
  }
  lifs_set_io_lock_override(v4);
  uint64_t v12 = VNOP_FSYNC(v2, 1, *(vfs_context_t *)(a1 + 24));
  if (!v4[65]) {
    goto LABEL_52;
  }
  uint64_t lifs_mount_from_node = v12;
  v4[65] = 0;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_18:
  lck_rw_unlock_exclusive((lck_rw_t *)(v4 + 63));
LABEL_19:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314009Au, arg1, (uintptr_t)v2, (uintptr_t)v4, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_blockmap(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = (char *)vnode_fsnode(v2);
  uintptr_t v5 = *(void *)(a1 + 16);
  unint64_t v4 = *(void *)(a1 + 24);
  int v6 = *(_DWORD *)(a1 + 56);
  LOBYTE(v7) = v6;
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    kernel_debug_filtered(0x314009Du, (uintptr_t)v2, *(void *)(a1 + 16), *(void *)(a1 + 24), v6);
    int v7 = *(_DWORD *)(a1 + 56);
  }
  uintptr_t v68 = 0;
  if ((v7 & 3) == 0)
  {
    uint64_t lifs_mount_from_node = 45;
    goto LABEL_130;
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &v68);
  if (lifs_mount_from_node) {
    goto LABEL_130;
  }
  int v9 = vfs_devblocksize(*(mount_t *)(v68 + 448));
  lck_mtx_lock_spin();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314009Cu, (uintptr_t)v2, v9, *((void *)v3 + 61), *((void *)v3 + 62));
  }
  uint64_t v10 = 496;
  if ((v6 & 1) == 0) {
    uint64_t v10 = 488;
  }
  uintptr_t v11 = *(void *)&v3[v10];
  if (v11 % v9) {
    unint64_t v12 = v9 - v11 % v9;
  }
  else {
    unint64_t v12 = 0;
  }
  unint64_t v13 = v12 + v11;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  if (v13 <= v5)
  {
    if (v6)
    {
      uintptr_t v17 = -1;
LABEL_122:
      long long v53 = *(uintptr_t **)(a1 + 32);
      if (v53) {
        *long long v53 = v17;
      }
      long long v54 = *(unint64_t **)(a1 + 40);
      if (v54)
      {
        unint64_t v55 = *(void *)(a1 + 24);
        if (v4 < v55) {
          unint64_t v55 = v4;
        }
        *long long v54 = v55;
      }
      long long v56 = *(_DWORD **)(a1 + 48);
      uint64_t lifs_mount_from_node = 0;
      if (v56) {
        *long long v56 = 0;
      }
      goto LABEL_130;
    }
    if ((v3[129] & 8) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v4 + v5 > v13) {
      unint64_t v4 = v13 - v5;
    }
    if ((v3[129] & 8) == 0)
    {
      if (v6)
      {
        unint64_t v14 = &lifs_max_read_blockmap_size;
        int v15 = &lifs_max_ssd_read_blockmap_size;
LABEL_22:
        if (*(unsigned char *)(v68 + 792)) {
          unint64_t v14 = v15;
        }
        unint64_t v16 = *v14;
        if (v4 >= v16) {
          unint64_t v4 = v16;
        }
        uintptr_t v17 = (uint64_t)v5 / v9;
        goto LABEL_122;
      }
LABEL_21:
      unint64_t v14 = &lifs_max_write_blockmap_size;
      int v15 = &lifs_max_ssd_write_blockmap_size;
      goto LABEL_22;
    }
  }
  uintptr_t v18 = *(int *)(a1 + 56);
  uintptr_t arg3_4 = v68;
  unsigned int v64 = vfs_devblocksize(*(mount_t *)(v68 + 448));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E1u, (uintptr_t)v3, v18, v5, v4);
  }
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  if (v5 + v4 <= v11) {
    unsigned int v19 = v4;
  }
  else {
    unsigned int v19 = v11 - v5;
  }
  if (v11 <= v5) {
    unsigned int v19 = v4;
  }
  unsigned int v67 = v19;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  endio_context = lifs_get_endio_context((uint64_t)v3);
  uintptr_t v65 = v18;
  if (!endio_context) {
    goto LABEL_49;
  }
  uintptr_t v21 = (uintptr_t)endio_context;
  if ((v18 & 2) == 0 || (endio_context[7] & 0x100) == 0)
  {
    unint64_t v26 = endio_context[5];
    uint64_t v25 = endio_context[6];
    if (v25 + v26 <= v5)
    {
      endio_context[6] = v5 + v67 - v26;
    }
    else if (v26 > v5)
    {
      endio_context[5] = v5;
      endio_context[6] = v26 - v5 + v25;
    }
    goto LABEL_53;
  }
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  uint64_t v22 = *(void *)v21;
  if (!*(void *)v21)
  {
    long long v24 = *(void **)(v21 + 8);
    if (*v24 == v21)
    {
      *((void *)v3 + 106) = v24;
      goto LABEL_48;
    }
LABEL_140:
    __break(0xBFFDu);
    JUMPOUT(0xD074);
  }
  if (*(void *)(v22 + 8) != v21) {
    goto LABEL_140;
  }
  long long v23 = *(void **)(v21 + 8);
  if (*v23 != v21) {
    goto LABEL_140;
  }
  *(void *)(v22 + 8) = v23;
  long long v24 = *(void **)(v21 + 8);
LABEL_48:
  *long long v24 = v22;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  kfree_type_impl();
LABEL_49:
  if (v18) {
    int v27 = 256;
  }
  else {
    int v27 = 512;
  }
  uintptr_t v21 = kalloc_type_impl();
  *(void *)(v21 + 16) = v3;
  *(void *)(v21 + 24) = current_thread();
  *(void *)(v21 + 40) = v5;
  *(void *)(v21 + 48) = v67;
  *(_DWORD *)(v21 + 56) = v27;
  *(void *)(v21 + 32) = OSAddAtomic64(1, &koio_operation_id);
  lck_mtx_lock((lck_mtx_t *)(v3 + 112));
  *(void *)uintptr_t v21 = 0;
  long long v28 = (uintptr_t *)*((void *)v3 + 106);
  *(void *)(v21 + 8) = v28;
  *long long v28 = v21;
  *((void *)v3 + 106) = v21;
  lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
LABEL_53:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E0u, v21, *(void *)(v21 + 40), *(void *)(v21 + 48), *(void *)(v21 + 32));
  }
  unsigned int lck = (lck_rw_t *)(v3 + 824);
  lck_rw_lock_exclusive((lck_rw_t *)(v3 + 824));
  extent = lifs_get_extent(*((void **)v3 + 102), v5, v67);
  if (extent)
  {
    long long v30 = extent;
    uintptr_t v31 = extent[5];
    if (v31 <= v5 || v31 >= v5 + v67) {
      goto LABEL_97;
    }
  }
  uint64_t v33 = atomic_load((unsigned int *)v3 + 214);
  lck_rw_unlock_exclusive(lck);
  BOOL v34 = v5 + v33 <= v11 && v33 > v67;
  if (!v34 || (v65 & 2) == 0) {
    uintptr_t v36 = v67;
  }
  else {
    uintptr_t v36 = v33;
  }
  int v37 = v65 & 3;
  unsigned int arg3 = (v65 & 3) != 0 && *(unsigned char *)(v21 + 64) == 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    int v38 = v36;
    kernel_debug_filtered(0x31400E5u, (uintptr_t)v3, v5, v36, v65);
    int v37 = v65 & 3;
    LODWORD(v36) = v38;
  }
  if (v65) {
    int v39 = 271;
  }
  else {
    int v39 = 527;
  }
  if (v37) {
    int v40 = v39;
  }
  else {
    int v40 = 15;
  }
  if (v37) {
    uint64_t v41 = *(void *)(v21 + 32);
  }
  else {
    uint64_t v41 = 0;
  }
  long long v92 = 0u;
  memset(arg4, 0, 24);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v77 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t lifs_mount_from_node = lifs_blockmap_file_request(arg3_4, (long long *)v3, v5, v36, arg3, v40, v41, (uint64_t)&v69);
  if (!lifs_mount_from_node)
  {
    lifs_update_freespace(arg3_4, &arg4[1]);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400E4u, (uintptr_t)v3, *(void *)(v21 + 32), arg3, SLODWORD(arg4[0]));
    }
    lck_rw_lock_exclusive(lck);
    if (SLODWORD(arg4[0]) >= 1)
    {
      uint64_t v42 = 0;
      long long v43 = &v69;
      do
      {
        if ((kdebug_enable & 0xFFFFFFF7) != 0) {
          kernel_debug_filtered(0x31400E4u, *((void *)v43 + 2), *((unsigned __int8 *)v43 + 3), *((void *)v43 + 1), *((unsigned int *)v43 + 1));
        }
        lifs_add_extent(*((void *)v3 + 102), *((void *)v43 + 2), *((_DWORD *)v43 + 1), (int *)v43);
        ++v42;
        long long v43 = (long long *)((char *)v43 + 24);
      }
      while (v42 < SLODWORD(arg4[0]));
    }
    lck_rw_unlock_exclusive(lck);
    *(unsigned char *)(v21 + 64) = 1;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E6u, (uintptr_t)v3, *(void *)(v21 + 32), arg3, (int)lifs_mount_from_node);
  }
  if (lifs_mount_from_node)
  {
    uintptr_t v17 = -1;
    goto LABEL_115;
  }
  lck_rw_lock_exclusive(lck);
  long long v30 = lifs_get_extent(*((void **)v3 + 102), v5, v67);
  if (v30)
  {
LABEL_97:
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400E0u, v30[5], v30[6], v30[4], *((unsigned __int8 *)v30 + 59));
    }
    uint64_t v44 = v30[5];
    uint64_t v45 = v30[6];
    uintptr_t v46 = v45 + v44;
    if (v45 + v44 >= v5 + v67)
    {
      if (v67 % v64) {
        unsigned int v48 = v64 - v67 % v64;
      }
      else {
        unsigned int v48 = 0;
      }
      unint64_t v4 = v48 + v67;
    }
    else
    {
      BOOL v34 = v46 > v5;
      unint64_t v47 = v46 - v5;
      if (!v34)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: extent range [%llu:%llu] doesn't overlap with range [%llu:%u]", "lifs_koio_blockmap", v44, v45, v5, v67);
        uint64_t lifs_mount_from_node = 5;
LABEL_111:
        uintptr_t v17 = -1;
LABEL_114:
        lck_rw_unlock_exclusive(lck);
        goto LABEL_115;
      }
      unint64_t v4 = v47;
    }
    uintptr_t v49 = v30[4] + v5 - v44;
    unsigned int v50 = *((_DWORD *)v30 + 14);
    if (HIBYTE(v50) == 1)
    {
      uint64_t lifs_mount_from_node = 0;
      signed int v51 = v64;
    }
    else
    {
      if ((v65 & 2) == 0)
      {
        uint64_t lifs_mount_from_node = 0;
        goto LABEL_111;
      }
      LODWORD(v69) = v50 & 0xFFFFFF | 0x1000000;
      DWORD1(v69) = v4;
      *((void *)&v69 + 1) = v49;
      *(void *)&long long v70 = 0;
      lifs_remove_extent(*((void *)v3 + 102), v5, v4);
      lifs_add_extent(*((void *)v3 + 102), v5, v4, (int *)&v69);
      uint64_t lifs_mount_from_node = 0;
      signed int v51 = v64;
    }
    uintptr_t v17 = v49 / v51;
    goto LABEL_114;
  }
  lck_rw_unlock_exclusive(lck);
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: no extent found for lnode %p offset %lld size %u", "lifs_koio_blockmap", v3, v5, v67);
  uint64_t lifs_mount_from_node = 5;
  uintptr_t v17 = -1;
LABEL_115:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E2u, (uintptr_t)v3, v17, v4, (int)lifs_mount_from_node);
  }
  if (!lifs_mount_from_node)
  {
    uint64_t v52 = 784;
    if ((v6 & 1) == 0) {
      uint64_t v52 = 788;
    }
    if (v4 >= *(unsigned int *)(v68 + v52)) {
      unint64_t v4 = *(unsigned int *)(v68 + v52);
    }
    goto LABEL_122;
  }
LABEL_130:
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    long long v57 = *(uintptr_t **)(a1 + 32);
    if (v57) {
      uintptr_t v58 = *v57;
    }
    else {
      uintptr_t v58 = -2;
    }
    long long v59 = *(uintptr_t **)(a1 + 40);
    if (v59) {
      uintptr_t v60 = *v59;
    }
    else {
      uintptr_t v60 = -2;
    }
    kernel_debug_filtered(0x314009Eu, (uintptr_t)v2, v58, v60, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_strategy(void *a1)
{
  uintptr_t v2 = (buf *)a1[1];
  uint64_t v3 = buf_vnode(v2);
  unint64_t v4 = (char *)vnode_fsnode(v3);
  uint64_t v60 = 0;
  uint64_t v5 = buf_count(v2);
  unsigned int v6 = buf_flags(v2);
  uintptr_t v7 = buf_kernel_addrperm_addr();
  if (use_new_strategy && v5 >= 0x4000)
  {
    uint64_t v8 = (buf *)a1[1];
    int v9 = buf_vnode(v8);
    uint64_t v10 = (char *)vnode_fsnode(v9);
    int32_t v11 = buf_flags(v8);
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      daddr64_t v12 = buf_blkno(v8);
      uint32_t v13 = buf_count(v8);
      kernel_debug_filtered(0x31400B5u, (uintptr_t)v9, v12, v13, v11);
    }
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    errno_t lifs_port = get_lifs_port(&v62);
    LODWORD(arg4) = lifs_port;
    if (lifs_port) {
      goto LABEL_51;
    }
    unint64_t v15 = buf_blkno(v8) << 20;
    LODWORD(v16) = buf_count(v8);
    lck_mtx_lock((lck_mtx_t *)(v10 + 112));
    unint64_t v17 = *((void *)v10 + 61);
    lck_mtx_unlock((lck_mtx_t *)(v10 + 112));
    if (v15 + v16 > v17 && v17 > v15) {
      uint64_t v16 = (v17 - v15);
    }
    else {
      uint64_t v16 = v16;
    }
    if (wrapperObjectForBuf(v8))
    {
      uint64_t ident_port = iokit_make_ident_port();
      if (v11)
      {
        unsigned int v20 = (uint64_t *)((char *)&v61 + 4);
        int v21 = lifs_read_wrapped_send(v62, (long long *)v10, v15, v16, ident_port, (_DWORD *)&v61 + 1, &arg4);
      }
      else
      {
        unsigned int v20 = &v61;
        int v21 = lifs_write_wrapped_send(v62, (long long *)v10, v15, v16, ident_port, &v61, &arg4);
      }
      int v53 = v21;
      buf_setresid(v8, v16 - *(_DWORD *)v20);
      release_lifs_port();
      errno_t lifs_port = arg4;
      if (arg4 || !v53)
      {
LABEL_51:
        buf_seterror(v8, lifs_port);
        if ((kdebug_enable & 0xFFFFFFF7) != 0)
        {
          daddr64_t v54 = buf_blkno(v8);
          uint32_t v55 = buf_count(v8);
          kernel_debug_filtered(0x31400B6u, (uintptr_t)v9, v54, v55, (int)arg4);
        }
        buf_biodone(v8);
        return arg4;
      }
      errno_t lifs_port = 5;
    }
    else
    {
      errno_t lifs_port = 12;
    }
    LODWORD(arg4) = lifs_port;
    goto LABEL_51;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    daddr64_t v22 = buf_blkno(v2);
    kernel_debug_filtered(0x31400A1u, (uintptr_t)v3, v7, v22, v6 | (unint64_t)(v5 << 32));
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &v60);
  if (lifs_mount_from_node)
  {
    uint64_t v24 = lifs_mount_from_node;
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      daddr64_t v25 = buf_blkno(v2);
      kernel_debug_filtered(0x31400A2u, (uintptr_t)v3, v7, v25, v24 | (unint64_t)(v5 << 32));
    }
    buf_seterror(v2, v24);
    buf_biodone(v2);
  }
  else
  {
    if ((v4[129] & 8) != 0)
    {
      uint64_t v49 = v60;
      unsigned int v50 = (buf *)a1[1];
      explicit = (vnode *)atomic_load_explicit((atomic_ullong *volatile)(v60 + 776), memory_order_acquire);
      if (explicit)
      {
        lifs_dev_ref(v49);
        uint64_t v52 = (void *)kalloc_type_impl();
        *uint64_t v52 = v49;
        v52[1] = v50;
        buf_setfilter();
        uint64_t v24 = buf_strategy(explicit, a1);
      }
      else
      {
        uint64_t v24 = 6;
        buf_seterror(v50, 6);
        buf_biodone(v50);
      }
      uintptr_t v35 = 0;
    }
    else
    {
      if (kdebug_enable)
      {
        buf_attr(v2);
        unsigned int v26 = buf_flags(v2);
        int v27 = bufattr_nocache();
        int thread_effective_io_policy = throttle_get_thread_effective_io_policy();
        if ((kdebug_enable & 9) != 0)
        {
          int v29 = (v26 >> 3) & 0x10 | (2 * (v26 & 3)) | (v26 >> 5) & 0x40;
          if (v27) {
            LOWORD(v29) = v29 | 0x80;
          }
          unsigned __int16 v30 = ((thread_effective_io_policy & 0xF) << 8) | 0x20;
          if (!thread_effective_io_policy) {
            unsigned __int16 v30 = 0;
          }
          uint32_t v31 = (4 * (((unsigned __int16)v29 | v30) & 0x3FFF)) | 0x3020000;
          uint64_t arg1 = buf_kernel_addrperm_addr();
          uintptr_t v32 = buf_device(v2);
          daddr64_t v33 = buf_blkno(v2);
          uint32_t v34 = buf_count(v2);
          kernel_debug(v31, arg1, v32, v33, v34, 0);
        }
      }
      uintptr_t v35 = kalloc_type_impl();
      *(void *)(v35 + 24) = v4;
      *(void *)(v35 + 32) = v2;
      *(unsigned char *)(v35 + 16) = v6 & 1;
      daddr64_t v36 = buf_blkno(v2);
      unint64_t v37 = v36 * vfs_devblocksize(*(mount_t *)(v60 + 448));
      int v38 = (lck_mtx_t *)(v4 + 112);
      lck_mtx_lock_spin();
      uint64_t v39 = 496;
      if (!*(unsigned char *)(v35 + 16)) {
        uint64_t v39 = 488;
      }
      unint64_t v40 = *(void *)&v4[v39];
      lck_mtx_unlock(v38);
      if (v40 > v37 && v37 + v5 > v40)
      {
        unsigned int v42 = v40 - v37;
        if (*(unsigned char *)(v35 + 16))
        {
          unsigned int v43 = vfs_devblocksize(*(mount_t *)(v60 + 448));
          unsigned int v44 = v42;
          if (v42 % v43)
          {
            int v45 = vfs_devblocksize(*(mount_t *)(v60 + 448));
            unsigned int v46 = vfs_devblocksize(*(mount_t *)(v60 + 448));
            unsigned int v44 = v45 + v42 / v46 * v46;
          }
          if (v44 < v5)
          {
            LODWORD(v5) = v42;
            if (v42 % vfs_devblocksize(*(mount_t *)(v60 + 448)))
            {
              int v47 = vfs_devblocksize(*(mount_t *)(v60 + 448));
              unsigned int v48 = vfs_devblocksize(*(mount_t *)(v60 + 448));
              LODWORD(v5) = v47 + v42 / v48 * v48;
            }
          }
        }
        else
        {
          LODWORD(v5) = v42;
        }
      }
      *(_DWORD *)(v35 + 40) = v5;
      *(unsigned char *)(v35 + 17) = 0;
      throttle_info_update_with_type();
      if (*(unsigned char *)(v35 + 16) || v5 < lifs_max_inline_io_size || vnode_isrecycled(v3) || vnode_ref(v3))
      {
        lifs_submit_io(v60, v35);
      }
      else
      {
        *(unsigned char *)(v35 + 17) = 1;
        lck_mtx_lock((lck_mtx_t *)(v60 + 696));
        *(void *)uintptr_t v35 = 0;
        long long v57 = *(uintptr_t **)(v60 + 624);
        *(void *)(v35 + 8) = v57;
        *long long v57 = v35;
        uintptr_t v58 = (char *)(v60 + 616);
        *(void *)(v60 + 624) = v35;
        wakeup_one(v58);
        lck_mtx_unlock((lck_mtx_t *)(v60 + 696));
      }
      uint64_t v24 = 0;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400A2u, (uintptr_t)v3, v7, v35, (int)v24);
    }
  }
  return v24;
}

uint64_t lifs_vnop_inactive(uint64_t a1)
{
  uintptr_t v2 = (char *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400A5u, *(void *)(a1 + 8), 0, 0, 0);
  }
  uint64_t v17 = 0;
  int lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v17);
  if (lifs_mount_from_node)
  {
    int v4 = lifs_mount_from_node;
    if (lifs_mount_from_node == 6)
    {
      lck_mtx_lock((lck_mtx_t *)(v2 + 112));
      int v5 = *((_DWORD *)v2 + 32);
      if ((v5 & 0x40) != 0)
      {
        *((_DWORD *)v2 + 32) = v5 & 0xFFFFFFBF;
        uint64_t v6 = *((void *)v2 + 58);
        *((void *)v2 + 58) = 0;
      }
      else
      {
        uint64_t v6 = 0;
      }
      uint64_t v9 = *((void *)v2 + 74);
      if (v9)
      {
        *((void *)v2 + 74) = 0;
        *((_DWORD *)v2 + 150) = 0;
      }
      lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
      lifs_invalidate_dirattrcache((uint64_t)v2);
      if (v6) {
        kfree_data();
      }
      if (v9) {
        kfree_data();
      }
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      uintptr_t v15 = -1;
LABEL_33:
      kernel_debug_filtered(0x31400A6u, *(void *)(a1 + 8), v4, v15, 0);
      return 0;
    }
    return 0;
  }
  lck_mtx_lock((lck_mtx_t *)(v2 + 112));
  int v7 = *((_DWORD *)v2 + 32);
  uint64_t v8 = *((void *)v2 + 74);
  if (v8)
  {
    *((void *)v2 + 74) = 0;
    *((_DWORD *)v2 + 150) = 0;
  }
  int v10 = *((_DWORD *)v2 + 113);
  lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
  lifs_invalidate_dirattrcache((uint64_t)v2);
  lck_mtx_lock((lck_mtx_t *)(v2 + 112));
  *((_OWORD *)v2 + 49) = 0u;
  *((_OWORD *)v2 + 50) = 0u;
  *((_OWORD *)v2 + 47) = 0u;
  *((_OWORD *)v2 + 48) = 0u;
  *((_OWORD *)v2 + 45) = 0u;
  *((_OWORD *)v2 + 46) = 0u;
  *((_OWORD *)v2 + 43) = 0u;
  *((_OWORD *)v2 + 44) = 0u;
  *((_OWORD *)v2 + 41) = 0u;
  *((_OWORD *)v2 + 42) = 0u;
  *((_OWORD *)v2 + 39) = 0u;
  *((_OWORD *)v2 + 40) = 0u;
  lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
  if (v8) {
    kfree_data();
  }
  if ((v7 & 0x40) != 0)
  {
    int32_t v11 = vnode_getparent(*(vnode_t *)(a1 + 8));
    if (v11)
    {
      daddr64_t v12 = v11;
      if (v10 == vnode_vid(v11))
      {
        uint32_t v13 = (long long *)vnode_fsnode(v12);
        lck_rw_lock_exclusive((lck_rw_t *)(v17 + 128));
        lck_mtx_lock((lck_mtx_t *)(v2 + 112));
        if ((v2[128] & 0x40) != 0)
        {
          uint64_t v20 = 0;
          long long v19 = 0u;
          memset(v18, 0, sizeof(v18));
          lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
          int v4 = lifs_remove_request(v17, v13, (long long *)v2, *((const char **)v2 + 58), 0, (uint64_t)v18);
          if (!v4)
          {
            lifs_update_freespace(v17, (unint64_t *)&v19 + 1);
            cache_purge(*(vnode_t *)(a1 + 8));
          }
          lck_mtx_lock((lck_mtx_t *)(v2 + 112));
          *((_DWORD *)v2 + 32) &= ~0x40u;
          uint64_t v14 = *((void *)v2 + 58);
          *((void *)v2 + 58) = 0;
          lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
        }
        else
        {
          lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
          uint64_t v14 = 0;
          int v4 = 0;
        }
        lck_rw_unlock_exclusive((lck_rw_t *)(v17 + 128));
        vnode_put(v12);
        if (v14) {
          kfree_data();
        }
        goto LABEL_16;
      }
      lck_mtx_lock((lck_mtx_t *)(v2 + 112));
      *((_DWORD *)v2 + 32) &= ~0x40u;
      *((void *)v2 + 58) = 0;
      lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
      kfree_data();
      vnode_put(v12);
    }
    else
    {
      lck_mtx_lock((lck_mtx_t *)(v2 + 112));
      *((_DWORD *)v2 + 32) &= ~0x40u;
      *((void *)v2 + 58) = 0;
      lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
      kfree_data();
    }
    int v4 = 0;
    goto LABEL_31;
  }
  int v4 = 0;
LABEL_16:
  if ((*(void *)&v7 & 0x40400) != 0) {
    vnode_recycle(*(vnode_t *)(a1 + 8));
  }
LABEL_31:
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v15 = 0;
    goto LABEL_33;
  }
  return 0;
}

uint64_t lifs_vnop_ioctl(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = *(vfs_context **)(a1 + 40);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400A9u, (uintptr_t)v2, *(void *)(a1 + 16), *(int *)(a1 + 32), 0);
  }
  uint64_t v14 = 0;
  if (!v2) {
    goto LABEL_16;
  }
  int v4 = (char *)vnode_fsnode(v2);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v4, &v14);
  if (lifs_mount_from_node) {
    goto LABEL_17;
  }
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6 == 44)
  {
    uint64_t v7 = *(void *)(a1 + 24);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400A8u, (uintptr_t)v2, (uintptr_t)v4, *(void *)v7, *(int *)(v7 + 8));
    }
    if (vnode_vtype(v2) == VREG)
    {
      lck_rw_lock_shared((lck_rw_t *)(v4 + 504));
      lck_mtx_lock((lck_mtx_t *)(v4 + 112));
      off_t v8 = *((void *)v4 + 61);
      lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
      if (*(void *)v7 >= v8)
      {
        uint64_t lifs_mount_from_node = 27;
      }
      else
      {
        int v9 = advisory_read(v2, v8, *(void *)v7, *(_DWORD *)(v7 + 8));
        uint64_t lifs_mount_from_node = lifs_issue_endio((uintptr_t)v4, v9, 1uLL);
      }
      lck_rw_unlock_shared((lck_rw_t *)(v4 + 504));
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v6 != 51)
  {
    if (v6 != 536899076)
    {
      uint64_t lifs_mount_from_node = 25;
      goto LABEL_17;
    }
    if (vnode_vtype(v2) == VDIR)
    {
      if (v2 == *(vnode **)(v14 + 16))
      {
        vnode_mount(v2);
        daddr64_t v12 = (vnode *)vfs_vnodecovered();
        uint64_t lifs_mount_from_node = VNOP_IOCTL(v12, 0x20006E04uLL, 0, 0, v3);
        vnode_put(v12);
      }
      else
      {
        lck_mtx_lock((lck_mtx_t *)(v4 + 112));
        *((_DWORD *)v4 + 32) |= 0x10u;
        lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
        uint64_t lifs_mount_from_node = 0;
      }
      goto LABEL_17;
    }
LABEL_16:
    uint64_t lifs_mount_from_node = 22;
    goto LABEL_17;
  }
  v13[0] = 0;
  v13[1] = v2;
  v13[3] = *(void *)(a1 + 40);
  int v13[2] = 1;
  uint64_t lifs_mount_from_node = lifs_fsync_internal((uint64_t)v13);
  if (!lifs_mount_from_node)
  {
    lifs_dev_ref(v14);
    explicit = (vnode *)atomic_load_explicit((atomic_ullong *volatile)(v14 + 776), memory_order_acquire);
    if (explicit) {
      uint64_t lifs_mount_from_node = VNOP_IOCTL(explicit, 0x20006416uLL, 0, 2, *(vfs_context_t *)(a1 + 40));
    }
    else {
      uint64_t lifs_mount_from_node = 0;
    }
    lifs_dev_rele(v14);
  }
LABEL_17:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400AAu, (uintptr_t)v2, *(void *)(a1 + 16), *(int *)(a1 + 32), (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_pagein(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = (char *)vnode_fsnode(v2);
  upl_t v36 = 0;
  unint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400ADu, (uintptr_t)v2, *(unsigned int *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  upl = 0;
  if (*(void *)(a1 + 16))
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: pagein called with UPL created", "lifs_vnop_pagein");
    uint64_t v6 = 5;
  }
  else
  {
    thread_t v7 = current_thread();
    if (v7 != *((thread_t *)v3 + 65)) {
      lck_rw_lock_shared((lck_rw_t *)(v3 + 504));
    }
    thread_t v34 = v7;
    if ((v4 & 0x8000000000000000) != 0
      || (unint64_t v33 = *((void *)v3 + 61), v4 >= v33)
      || (int v8 = 1 << PAGE_SHIFT_CONST, ((v4 | v5) & ((1 << PAGE_SHIFT_CONST) - 1)) != 0))
    {
      if (!ubc_create_upl(v2, v4, v5, &v36, &upl, 134217984))
      {
        ubc_upl_range_needed(v36, *(_DWORD *)(a1 + 24) >> PAGE_SHIFT_CONST, 1);
        ubc_upl_abort_range(v36, 0, v5, 12);
      }
      uint64_t v6 = 22;
    }
    else
    {
      unint64_t v9 = *((void *)v3 + 62);
      unint64_t v10 = v5 + v4;
      if (v4 < v9 && v10 > v9)
      {
        unint64_t v12 = v9 % v8;
        unint64_t v13 = v8 - v12;
        if (!v12) {
          unint64_t v13 = 0;
        }
        unint64_t v14 = v13 + v9;
        unint64_t v15 = v4 + *(unsigned int *)(a1 + 24);
        int v16 = v10 - v14;
        if (v15 < v14)
        {
          LODWORD(v5) = v14 - v4;
        }
        else
        {
          unint64_t v4 = v14;
          LODWORD(v5) = v16;
        }
        unint64_t v17 = *((void *)v3 + 61);
        if (v15 < v14) {
          unint64_t v17 = *((void *)v3 + 62);
        }
        unint64_t v33 = v17;
      }
      uint64_t v6 = 22;
      if (!ubc_create_upl(v2, v4, v5, &v36, &upl, 134217984) && v36)
      {
        ubc_upl_range_needed(v36, *(_DWORD *)(a1 + 24) >> PAGE_SHIFT_CONST, 1);
        int v18 = (int)v5 / (1 << PAGE_SHIFT_CONST);
        while (1)
        {
          uint64_t v6 = (v18 - 1);
          if (v18 < 1) {
            break;
          }
          if (upl_page_present(upl, v18 - 1))
          {
            int v18 = v6;
            break;
          }
          int v18 = v6;
          if (!v6)
          {
            ubc_upl_abort_range(v36, 0, v5, 8);
            goto LABEL_33;
          }
        }
        uint64_t v6 = 0;
        int v20 = (v18 + 1) << PAGE_SHIFT_CONST;
        if (v20)
        {
          int v21 = 0;
          upl_offset_t v22 = 0;
          uint64_t v23 = v20;
          uintptr_t v32 = v2;
          do
          {
            BOOLean_t v24 = upl_page_present(upl, v21);
            int v25 = 1 << PAGE_SHIFT_CONST;
            int v26 = 1;
            if (v24)
            {
              uint64_t v27 = v23 - v25;
              if (v23 != v25)
              {
                do
                {
                  if (!upl_page_present(upl, v21 + v26)) {
                    break;
                  }
                  ++v26;
                  v27 -= 1 << PAGE_SHIFT_CONST;
                }
                while (v27);
                int v25 = v26 << PAGE_SHIFT_CONST;
              }
              int v28 = cluster_pagein(v32, v36, v22, v4, v25, v33, *(_DWORD *)(a1 + 48));
              unsigned int v29 = lifs_issue_endio((uintptr_t)v3, v28, 1uLL);
              if (v29) {
                unsigned int v30 = v29;
              }
              else {
                unsigned int v30 = v28;
              }
              uintptr_t v2 = v32;
              if (v6) {
                BOOL v31 = 1;
              }
              else {
                BOOL v31 = v30 == 0;
              }
              if (v31) {
                uint64_t v6 = v6;
              }
              else {
                uint64_t v6 = v30;
              }
            }
            v22 += v25;
            v21 += v26;
            v23 -= v25;
            v4 += v25;
          }
          while (v23);
        }
      }
    }
LABEL_33:
    if (v34 != *((thread_t *)v3 + 65)) {
      lck_rw_unlock_shared((lck_rw_t *)(v3 + 504));
    }
    if (!v6)
    {
      lck_mtx_lock((lck_mtx_t *)(v3 + 112));
      *((_DWORD *)v3 + 32) |= 0x8000u;
      lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
    }
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400AEu, (uintptr_t)v2, *((void *)v3 + 61), *((void *)v3 + 62), (int)v6);
  }
  return v6;
}

uint64_t lifs_vnop_pageout(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = (char *)vnode_fsnode(v2);
  upl_t v32 = 0;
  uintptr_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400B1u, (uintptr_t)v2, *(unsigned int *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  upl = 0;
  if (*(void *)(a1 + 16))
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: pageout called with UPL created", "lifs_vnop_pageout");
    uint64_t v6 = 5;
    goto LABEL_31;
  }
  if ((*(_DWORD *)(a1 + 48) & 0x10) != 0) {
    int v7 = 33554464;
  }
  else {
    int v7 = 67108896;
  }
  thread_t v8 = current_thread();
  if (v8 != *((thread_t *)v3 + 65)) {
    lck_rw_lock_shared((lck_rw_t *)(v3 + 504));
  }
  if ((v4 & 0x8000000000000000) == 0
    && v4 < *((void *)v3 + 61)
    && ((v4 | v5) & ~(-1 << PAGE_SHIFT_CONST)) == 0)
  {
    BOOL v28 = v4 > *((void *)v3 + 62);
    if (v4 > *((void *)v3 + 62)
      && v8 != *((thread_t *)v3 + 65)
      && !lck_rw_lock_shared_to_exclusive((lck_rw_t *)(v3 + 504)))
    {
      lck_rw_lock_exclusive((lck_rw_t *)(v3 + 504));
    }
    unint64_t v9 = *((void *)v3 + 62);
    if (v4 > v9)
    {
      uint64_t v10 = cluster_write(v2, 0, v9, v4, *((void *)v3 + 62), 0, 900);
      uint64_t v6 = v10;
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x31400B0u, (uintptr_t)v2, *((void *)v3 + 62), v4, (int)v10);
      }
      if (v6)
      {
        if (!ubc_create_upl(v2, v4, v5, &v32, &upl, v7)) {
LABEL_45:
        }
          ubc_upl_abort_range(v32, 0, v5, 8);
LABEL_72:
        BOOL v11 = v28;
        goto LABEL_26;
      }
      uintptr_t v14 = *((void *)v3 + 61);
      if (v14 >= v4) {
        uintptr_t v14 = v4;
      }
      *((void *)v3 + 62) = v14;
    }
    uint64_t v6 = 22;
    if (!ubc_create_upl(v2, v4, v5, &v32, &upl, v7) && v32)
    {
      int v15 = (int)v5 / (1 << PAGE_SHIFT_CONST);
      while (1)
      {
        uint64_t v6 = (v15 - 1);
        if (v15 < 1) {
          break;
        }
        if (upl_page_present(upl, v15 - 1))
        {
          int v15 = v6;
          break;
        }
        int v15 = v6;
        if (!v6) {
          goto LABEL_45;
        }
      }
      int v16 = (v15 + 1) << PAGE_SHIFT_CONST;
      if (!v16) {
        goto LABEL_67;
      }
      unsigned int v29 = v2;
      unsigned int v30 = v8;
      uint64_t v6 = 0;
      int v17 = 0;
      upl_offset_t v18 = 0;
      uint64_t v19 = v16;
      do
      {
        if (upl_page_present(upl, v17))
        {
          if (!upl_dirty_page(upl, v17)) {
            panic("\"%s: page %d is NOT dirty!\" @%s:%d", "lifs_vnop_pageout", v17, "lifs_vnops.c", 538);
          }
          int v20 = 1;
          int v21 = 1 << PAGE_SHIFT_CONST;
          uint64_t v22 = v19 - (1 << PAGE_SHIFT_CONST);
          if (v19 != 1 << PAGE_SHIFT_CONST)
          {
            do
            {
              if (!upl_dirty_page(upl, v17 + v20)) {
                break;
              }
              ++v20;
              v22 -= 1 << PAGE_SHIFT_CONST;
            }
            while (v22);
            int v21 = v20 << PAGE_SHIFT_CONST;
          }
          int v23 = cluster_pageout(v29, v32, v18, v4, v21, *((void *)v3 + 61), *(_DWORD *)(a1 + 48));
          unsigned int v24 = lifs_issue_endio((uintptr_t)v3, v23, (*(_DWORD *)(a1 + 48) & 1) == 0);
          if (v24) {
            unsigned int v25 = v24;
          }
          else {
            unsigned int v25 = v23;
          }
          if (v6) {
            BOOL v26 = 1;
          }
          else {
            BOOL v26 = v25 == 0;
          }
          if (v26) {
            uint64_t v6 = v6;
          }
          else {
            uint64_t v6 = v25;
          }
        }
        else
        {
          int v20 = 1;
          int v21 = 1 << PAGE_SHIFT_CONST;
        }
        v18 += v21;
        v17 += v20;
        v19 -= v21;
        v4 += v21;
        thread_t v8 = v30;
      }
      while (v19);
      uintptr_t v2 = v29;
      if (!v6)
      {
LABEL_67:
        if (v4 <= *((void *)v3 + 62))
        {
          uint64_t v6 = 0;
        }
        else
        {
          uint64_t v6 = 0;
          uintptr_t v27 = *((void *)v3 + 61);
          if (v27 >= v4) {
            uintptr_t v27 = v4;
          }
          *((void *)v3 + 62) = v27;
        }
      }
    }
    goto LABEL_72;
  }
  if (!ubc_create_upl(v2, v4, v5, &v32, &upl, v7)) {
    ubc_upl_abort_range(v32, 0, v5, 8);
  }
  BOOL v11 = 0;
  uint64_t v6 = 22;
LABEL_26:
  if (v8 == *((thread_t *)v3 + 65)) {
    goto LABEL_29;
  }
  unint64_t v12 = (lck_rw_t *)(v3 + 504);
  if (v11)
  {
    lck_rw_unlock_exclusive(v12);
LABEL_29:
    if (v6) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  lck_rw_unlock_shared(v12);
  if (!v6)
  {
LABEL_30:
    lck_mtx_lock((lck_mtx_t *)(v3 + 112));
    *((_DWORD *)v3 + 32) |= 0x10000u;
    lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
  }
LABEL_31:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400B2u, (uintptr_t)v2, *((void *)v3 + 61), *((void *)v3 + 62), (int)v6);
  }
  return v6;
}

uint64_t lifs_vnop_blktooff(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  if (!v2) {
    return 22;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  uintptr_t v4 = vnode_mount(v2);
  int v5 = vfs_devblocksize(v4);
  uint64_t result = 0;
  **(void **)(a1 + 24) = v3 * v5;
  return result;
}

uint64_t lifs_vnop_offtoblk(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  if (!v2) {
    return 22;
  }
  uint64_t v3 = *(void *)(a1 + 16);
  uintptr_t v4 = vnode_mount(v2);
  int v5 = vfs_devblocksize(v4);
  uint64_t result = 0;
  **(void **)(a1 + 24) = v3 / v5;
  return result;
}

uint64_t lifs_vnop_allocate(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  uint64_t v3 = (char *)vnode_fsnode(v2);
  uint64_t v11 = 0;
  strcpy((char *)v19, "_O_f_preallocate");
  BYTE1(v19[4]) = unk_3B51;
  HIWORD(v19[4]) = unk_3B52;
  v19[5] = unk_3B54;
  uint64_t v20 = unk_3B58;
  char v21 = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400BDu, (uintptr_t)v3, *(unsigned int *)(a1 + 24), *(void *)(a1 + 40), *(void *)(a1 + 16));
  }
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  long long v12 = 0u;
  arg4[0] = 0;
  arg4[1] = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v3, &v11);
  if (!lifs_mount_from_node)
  {
    int v5 = *(_DWORD *)(a1 + 24);
    if ((v5 & 0x20) != 0 || *(void *)(a1 + 40))
    {
      uint64_t lifs_mount_from_node = 45;
      goto LABEL_7;
    }
    uint64_t v7 = *(void *)(a1 + 16);
    *(void *)&long long v12 = 0;
    *((void *)&v12 + 1) = v7;
    LODWORD(arg4[0]) = v5 & 0x16;
    LODWORD(v15) = 0;
    LODWORD(v17) = 232;
    uint64_t lifs_mount_from_node = lifs_setfsattr_request(v11, (long long *)v3, (char *)v19, &v12, 232, (uint64_t)&v12);
    if (!lifs_mount_from_node)
    {
      lifs_update_freespace(v11, (unint64_t *)&v17 + 1);
      thread_t v8 = *(void **)(a1 + 32);
      if (v8)
      {
        *thread_t v8 = arg4[1];
        if ((v3[129] & 8) != 0 && (int)v15 >= 1)
        {
          if (v15 > 8)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: preallocate returned invalid extents count %d", "lifs_vnop_allocate", v15);
            uint64_t lifs_mount_from_node = 0;
            goto LABEL_7;
          }
          lck_rw_lock_exclusive((lck_rw_t *)(v3 + 824));
          if ((int)v15 >= 1)
          {
            uint64_t v9 = 0;
            uint64_t v10 = v14;
            do
            {
              if ((kdebug_enable & 0xFFFFFFF7) != 0) {
                kernel_debug_filtered(0x31400BCu, *((void *)v10 + 2), *((unsigned __int8 *)v10 + 3), *((void *)v10 + 1), *((unsigned int *)v10 + 1));
              }
              lifs_add_extent(*((void *)v3 + 102), *((void *)v10 + 2), *((_DWORD *)v10 + 1), (int *)v10);
              ++v9;
              uint64_t v10 = (_OWORD *)((char *)v10 + 24);
            }
            while (v9 < (int)v15);
          }
          lck_rw_unlock_exclusive((lck_rw_t *)(v3 + 824));
        }
        lck_mtx_lock((lck_mtx_t *)(v3 + 112));
        *((_DWORD *)v3 + 32) |= 0x10000u;
        if ((vfs_flags(*(mount_t *)(v11 + 448)) & 0x1000) != 0) {
          *((_DWORD *)v3 + 32) |= 0x40000u;
        }
        lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
      }
      uint64_t lifs_mount_from_node = 0;
    }
  }
LABEL_7:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400BEu, (uintptr_t)v2, (uintptr_t)v3, (int)lifs_mount_from_node, arg4[1]);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_getxattr(uint64_t a1)
{
  uintptr_t v2 = (long long *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  uint64_t v21 = 0;
  uint64_t v3 = *(uio **)(a1 + 24);
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v4 = *(void *)(a1 + 8);
    if (v3) {
      uintptr_t v5 = 0;
    }
    else {
      uintptr_t v5 = -1;
    }
    if (v3)
    {
      off_t v6 = uio_offset(*(uio_t *)(a1 + 24));
      user_ssize_t v7 = uio_resid(v3);
    }
    else
    {
      off_t v6 = 0;
      user_ssize_t v7 = 0;
    }
    kernel_debug_filtered(0x31400C1u, v4, v5, v6, v7);
  }
  unint64_t v18 = 0;
  *(void *)n = 0;
  uint64_t v20 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v21);
  if (!lifs_mount_from_node)
  {
    if (!strcmp(*(const char **)(a1 + 16), "com.apple.ResourceFork"))
    {
      long long v15 = vfs_context_proc(*(vfs_context_t *)(a1 + 48));
      int v16 = proc_pid(v15);
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "LIFS: PID %d getxattr on '%s'", v16, "com.apple.ResourceFork");
      uint64_t lifs_mount_from_node = 93;
      goto LABEL_10;
    }
    if (v3)
    {
      user_ssize_t v10 = uio_resid(v3);
      int v11 = uio_offset(*(uio_t *)(a1 + 24));
      if (v10 > 0)
      {
        unint64_t v12 = v10 & ~(v10 >> 63);
        if (v12 > 0x40000)
        {
          unint64_t v13 = vfs_context_proc(*(vfs_context_t *)(a1 + 48));
          int v14 = proc_pid(v13);
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "LIFS: PID %d getxattr on '%s' requested size %zd", v14, *(const char **)(a1 + 16), v12);
          uint64_t lifs_mount_from_node = 27;
          goto LABEL_10;
        }
LABEL_21:
        long long v17 = (const void *)kalloc_data();
        uint64_t lifs_mount_from_node = lifs_getxattr_request(v21, v2, *(char **)(a1 + 16), v11, (uint64_t)v17, v12, (uint64_t)&v18);
        if (lifs_mount_from_node) {
          goto LABEL_32;
        }
        if (v18 == 32
          && !strcmp(*(const char **)(a1 + 16), "com.apple.FinderInfo")
          && !bcmp(v17, &empty_finfo, 0x20uLL))
        {
          uint64_t lifs_mount_from_node = 93;
          if (!v17) {
            goto LABEL_10;
          }
LABEL_33:
          kfree_data();
          goto LABEL_10;
        }
        **(void **)(a1 + 32) = v18;
        if (v3)
        {
          uint64_t lifs_mount_from_node = 34;
          if (uio_resid(v3) < 0 || v12 < v18)
          {
LABEL_32:
            if (!v17) {
              goto LABEL_10;
            }
            goto LABEL_33;
          }
          if (*(void *)n)
          {
            uint64_t lifs_mount_from_node = uiomove((const char *)v17, n[0], v3);
            if (!v17) {
              goto LABEL_10;
            }
            goto LABEL_33;
          }
        }
        uint64_t lifs_mount_from_node = 0;
        goto LABEL_32;
      }
    }
    else
    {
      int v11 = 0;
    }
    unint64_t v12 = 32 * (strcmp(*(const char **)(a1 + 16), "com.apple.FinderInfo") == 0);
    goto LABEL_21;
  }
LABEL_10:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400C2u, *(void *)(a1 + 8), **(void **)(a1 + 32), (int)lifs_mount_from_node, 0);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_setxattr(uint64_t a1)
{
  uintptr_t v2 = (long long *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  *(void *)user_ssize_t v10 = 0;
  uint64_t v3 = *(uio **)(a1 + 24);
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, v10);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v5 = *(void *)(a1 + 8);
    uintptr_t v6 = *(int *)(a1 + 32);
    user_ssize_t v7 = uio_resid(v3);
    kernel_debug_filtered(0x31400CDu, v5, (uintptr_t)v2, v6, v7);
  }
  int v8 = *(_DWORD *)(a1 + 32) & 6;
  if (v8)
  {
    if (v8 == 4)
    {
      int v8 = 2;
    }
    else
    {
      if (v8 != 2) {
        return 22;
      }
      int v8 = 1;
    }
  }
  if (strcmp(*(const char **)(a1 + 16), "com.apple.FinderInfo")) {
    goto LABEL_10;
  }
  *(_OWORD *)cp = 0u;
  long long v12 = 0u;
  if (uio_resid(v3) == 32)
  {
    uint64_t lifs_mount_from_node = uiomove(cp, 32, v3);
    if (!lifs_mount_from_node)
    {
      if (bcmp(cp, &empty_finfo, 0x20uLL))
      {
        uint64_t v3 = uio_create(1, 0, 2, 1);
        uio_addiov(v3, (user_addr_t)cp, 0x20uLL);
LABEL_10:
        uint64_t lifs_mount_from_node = lifs_setxattr_request(*(uint64_t *)v10, v2, *(char **)(a1 + 16), v3, v8);
        if (v3 != *(uio **)(a1 + 24)) {
          uio_free(v3);
        }
        goto LABEL_18;
      }
      uint64_t lifs_mount_from_node = lifs_removexattr_request(*(uint64_t *)v10, v2, *(char **)(a1 + 16));
    }
  }
  else
  {
    uint64_t lifs_mount_from_node = 34;
  }
LABEL_18:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400CEu, *(void *)(a1 + 8), (uintptr_t)v2, (int)lifs_mount_from_node, 0);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_removexattr(uint64_t a1)
{
  uintptr_t v2 = (long long *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  uint64_t v5 = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400C9u, *(void *)(a1 + 8), *(int *)(a1 + 24), 0, 0);
  }
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v5);
  if (!lifs_mount_from_node) {
    uint64_t lifs_mount_from_node = lifs_removexattr_request(v5, v2, *(char **)(a1 + 16));
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400CAu, *(void *)(a1 + 8), *(int *)(a1 + 24), (int)lifs_mount_from_node, 0);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_listxattr(uint64_t a1)
{
  uintptr_t v2 = (long long *)vnode_fsnode(*(vnode_t *)(a1 + 8));
  uint64_t v18 = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v3 = *(void *)(a1 + 8);
    user_ssize_t v4 = uio_resid(*(uio_t *)(a1 + 16));
    kernel_debug_filtered(0x31400C5u, v3, v4, *(int *)(a1 + 32), 0);
  }
  unint64_t v15 = 0;
  *(void *)n = 0;
  uint64_t v17 = 0;
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v2, &v18);
  if (!lifs_mount_from_node)
  {
    uintptr_t v6 = *(uio **)(a1 + 16);
    if (v6)
    {
      user_ssize_t v7 = uio_resid(v6);
      unint64_t v8 = v7 & ~(v7 >> 63);
      if (v8 > 0x40000)
      {
        uint64_t v9 = vfs_context_proc(*(vfs_context_t *)(a1 + 40));
        int v10 = proc_pid(v9);
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "LIFS: PID %d listxattr on requested size %zd", v10, v8);
        uint64_t lifs_mount_from_node = 27;
        goto LABEL_20;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    int v11 = (const char *)kalloc_data();
    uint64_t lifs_mount_from_node = lifs_listxattr_request(v18, v2, (uint64_t)v11, v8, (uint64_t)&v15);
    if (!lifs_mount_from_node)
    {
      **(void **)(a1 + 24) = v15;
      long long v12 = *(uio **)(a1 + 16);
      if (v12)
      {
        user_ssize_t v13 = uio_resid(v12);
        LODWORD(v12) = 34;
        if ((v13 & 0x8000000000000000) == 0 && v8 >= v15)
        {
          if (*(void *)n) {
            LODWORD(v12) = uiomove(v11, n[0], *(uio **)(a1 + 16));
          }
          else {
            LODWORD(v12) = 0;
          }
        }
      }
      if (*((void *)v2 + 76)) {
        uint64_t lifs_mount_from_node = 45;
      }
      else {
        uint64_t lifs_mount_from_node = v12;
      }
    }
    if (v11) {
      kfree_data();
    }
  }
LABEL_20:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400C6u, *(void *)(a1 + 8), **(void **)(a1 + 24), (int)lifs_mount_from_node, 0);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_select()
{
  return 1;
}

uint64_t lifs_vnop_clonefile(uint64_t a1)
{
  uintptr_t v3 = *(vnode **)(a1 + 8);
  uintptr_t v2 = *(vnode **)(a1 + 16);
  user_ssize_t v4 = *(vnode_t **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  uintptr_t v6 = (long long *)vnode_fsnode(v2);
  user_ssize_t v7 = vnode_fsnode(v3);
  uintptr_t arg1 = 0;
  unint64_t v8 = *(componentname **)(a1 + 32);
  *(_OWORD *)uint64_t v22 = 0u;
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v6, &arg1);
  if (!lifs_mount_from_node)
  {
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400DDu, arg1, (uintptr_t)v2, (uintptr_t)v3, (uintptr_t)v6);
    }
    if (v8->cn_namelen <= 1023)
    {
      if (*(_DWORD *)(v5 + 224) == 2)
      {
        uint64_t lifs_mount_from_node = 45;
      }
      else
      {
        convert_vnode_attr((uint64_t)v21, v5);
        *(void *)v5 |= 0x380uLL;
        int v10 = (char *)kalloc_data();
        size_t v11 = (v8->cn_namelen + 1);
        if (v11 >= 0x401) {
          lifs_vnop_clonefile_cold_1();
        }
        long long v12 = v10;
        strlcpy(v10, v8->cn_nameptr, v11);
        lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
        uint64_t lifs_mount_from_node = lifs_clonefile_request(arg1, v12, v6, v7, *(_DWORD *)(a1 + 48), v21, (uint64_t)v20);
        if (!lifs_mount_from_node)
        {
          lifs_update_freespace(arg1, v22);
          uint64_t lifs_mount_from_node = lifs_create_node(*(mount **)(arg1 + 448), v20, v2, (uint64_t)v8, (uint64_t)v21, v4);
          cache_purge_negatives(v2);
          lifs_invalidate_dirattrcache_ext((uint64_t)v6, 1);
          if (lifs_mount_from_node)
          {
            uint64_t v19 = 0;
            memset(v18, 0, sizeof(v18));
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: fail to create node [%d]", "lifs_vnop_clonefile", lifs_mount_from_node);
            lifs_remove_request(arg1, v6, v20, v12, 0, (uint64_t)v18);
          }
          else
          {
            vnode_fsnode(*v4);
            update_lnode_attr((uint64_t)v6, (uint64_t)&v21[11] + 8);
            cache_enter(v2, *v4, v8);
          }
        }
        lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
        if (v12) {
          kfree_data();
        }
      }
    }
    else
    {
      uint64_t lifs_mount_from_node = 63;
    }
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      uintptr_t v13 = arg1;
      int v14 = *v4;
      if (v14) {
        unint64_t v15 = vnode_fsnode(v14);
      }
      else {
        unint64_t v15 = 0;
      }
      kernel_debug_filtered(0x31400DEu, v13, (uintptr_t)v14, (uintptr_t)v15, (int)lifs_mount_from_node);
    }
  }
  return lifs_mount_from_node;
}

uint64_t lifs_vnop_renamex(uint64_t a1)
{
  return lifs_vnop_dorename(*(vnode **)(a1 + 8), *(vnode **)(a1 + 16), *(vnode **)(a1 + 32), *(vnode **)(a1 + 40), *(void *)(a1 + 24), *(void *)(a1 + 48), *(_DWORD *)(a1 + 64), *(vfs_context **)(a1 + 72));
}

uint64_t lifs_issue_endio(uintptr_t arg1, int a2, uintptr_t arg4)
{
  char v3 = arg4;
  uint64_t v6 = *(void *)(arg1 + 200);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E9u, arg1, *(unsigned int *)(arg1 + 128), a2, arg4);
  }
  if ((*(unsigned char *)(arg1 + 129) & 8) == 0)
  {
    uint64_t v7 = 0;
    uintptr_t v8 = 0;
    endio_context = 0;
    goto LABEL_28;
  }
  endio_context = lifs_get_endio_context(arg1);
  if (!endio_context) {
    goto LABEL_27;
  }
  lck_mtx_lock((lck_mtx_t *)(arg1 + 112));
  uint64_t v10 = *endio_context;
  if (*endio_context)
  {
    if (*(void **)(v10 + 8) == endio_context)
    {
      size_t v11 = (void *)endio_context[1];
      if ((void *)*v11 == endio_context)
      {
        *(void *)(v10 + 8) = v11;
        long long v12 = (void *)endio_context[1];
        goto LABEL_12;
      }
    }
LABEL_48:
    __break(0xBFFDu);
    JUMPOUT(0xF680);
  }
  long long v12 = (void *)endio_context[1];
  if ((void *)*v12 != endio_context) {
    goto LABEL_48;
  }
  *(void *)(arg1 + 848) = v12;
LABEL_12:
  *long long v12 = v10;
  lck_mtx_unlock((lck_mtx_t *)(arg1 + 112));
  if (!v6 || !*(void *)(v6 + 448))
  {
    uintptr_t v8 = 0;
    uint64_t v7 = 6;
    goto LABEL_22;
  }
  if (*((unsigned char *)endio_context + 64)) {
    *((_DWORD *)endio_context + 14) |= 0x1000u;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400E8u, endio_context[4], *((unsigned int *)endio_context + 14), endio_context[5], endio_context[6]);
  }
  if ((*((unsigned char *)endio_context + 57) & 1) != 0 && (vfs_flags(*(mount_t *)(v6 + 448)) & 0x10000001) != 0)
  {
    uint64_t v7 = 0;
    uintptr_t v8 = 1;
LABEL_22:
    kfree_type_impl();
    goto LABEL_28;
  }
  *((_DWORD *)endio_context + 15) = a2;
  if ((v3 & 1) == 0)
  {
    uint64_t v7 = lifs_endio_request(v6, (long long *)arg1, endio_context[5], endio_context[6], a2, *((_DWORD *)endio_context + 14), endio_context[4]);
LABEL_32:
    uintptr_t v8 = 0;
    goto LABEL_22;
  }
  *((_DWORD *)endio_context + 14) |= 0x400u;
  lck_mtx_lock((lck_mtx_t *)(v6 + 712));
  if ((*((unsigned char *)endio_context + 57) & 0x10) == 0 && !*((_DWORD *)endio_context + 15))
  {
    unint64_t v15 = *(uint64_t **)(v6 + 632);
    if (v15)
    {
      int v16 = 11;
      do
      {
        if (!--v16) {
          break;
        }
        if (v15[2] == endio_context[2] && !*((_DWORD *)v15 + 15))
        {
          uintptr_t v17 = v15[5];
          uintptr_t v18 = v15[6];
          uintptr_t v19 = v18 + v17;
          uintptr_t v20 = endio_context[5];
          uintptr_t v21 = endio_context[6];
          if (v18 + v17 > v21 + v20) {
            goto LABEL_47;
          }
          if ((kdebug_enable & 0xFFFFFFF7) != 0)
          {
            kernel_debug_filtered(0x31400E8u, v17, v18, v20, v21);
            uintptr_t v17 = v15[5];
            uintptr_t v18 = v15[6];
            uintptr_t v20 = endio_context[5];
            uintptr_t v19 = v18 + v17;
          }
          uint64_t v22 = endio_context[6];
          if (v19 == v20) {
            goto LABEL_46;
          }
          if (v17 == v22 + v20)
          {
            v15[5] = v20;
LABEL_46:
            v15[6] = v22 + v18;
LABEL_47:
            lck_mtx_unlock((lck_mtx_t *)(v6 + 712));
            uint64_t v7 = 0;
            goto LABEL_32;
          }
        }
        unint64_t v15 = (uint64_t *)*v15;
      }
      while (v15);
    }
  }
  uintptr_t v13 = *(void **)(v6 + 640);
  void *endio_context = 0;
  endio_context[1] = v13;
  *uintptr_t v13 = endio_context;
  *(void *)(v6 + 640) = endio_context;
  wakeup_one((caddr_t)(v6 + 632));
  lck_mtx_unlock((lck_mtx_t *)(v6 + 712));
LABEL_27:
  uint64_t v7 = 0;
  uintptr_t v8 = 0;
LABEL_28:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400EAu, arg1, (uintptr_t)endio_context, v8, (int)v7);
  }
  return v7;
}

uint64_t lifs_fsync_internal(uint64_t a1)
{
  uintptr_t v2 = *(vnode **)(a1 + 8);
  char v3 = (char *)vnode_fsnode(v2);
  uintptr_t v4 = *((void *)v3 + 25);
  arg2[0] = 0;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140071u, (uintptr_t)v2, *(int *)(a1 + 16), 1uLL, 0);
  }
  if (vfs_isrdonly(*(mount_t *)(v4 + 448)))
  {
    uint64_t v5 = 0;
    goto LABEL_66;
  }
  if (vnode_vtype(v2) == VREG)
  {
    int v6 = *(_DWORD *)(a1 + 16);
    thread_t v7 = current_thread();
    if (v7 != *((thread_t *)v3 + 65)) {
      lck_rw_lock_exclusive((lck_rw_t *)(v3 + 504));
    }
    int v8 = v6 & 5;
    uintptr_t v9 = *((unsigned int *)v3 + 32);
    if ((v9 & 0x800) != 0)
    {
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x31400EDu, v4, (uintptr_t)v3, v9, 0);
      }
      *(void *)&arg2[1] = 0;
      *(void *)&long long v32 = &arg2[1];
      lck_mtx_lock((lck_mtx_t *)(v4 + 712));
      size_t v11 = *(uint64_t **)(v4 + 632);
      if (v11)
      {
        do
        {
          uint64_t v12 = *v11;
          if ((char *)v11[2] == v3)
          {
            if (v12)
            {
              if (*(uint64_t **)(v12 + 8) != v11)
              {
LABEL_72:
                __break(0xBFFDu);
                JUMPOUT(0xFB5CLL);
              }
              uintptr_t v13 = (uint64_t **)v11[1];
              if (*v13 != v11)
              {
LABEL_71:
                __break(0xBFFDu);
                JUMPOUT(0xFB70);
              }
              *(void *)(v12 + 8) = v13;
              int v14 = (uint64_t **)v11[1];
            }
            else
            {
              int v14 = (uint64_t **)v11[1];
              if (*v14 != v11) {
                goto LABEL_71;
              }
              *(void *)(v4 + 640) = v14;
            }
            *int v14 = (uint64_t *)v12;
            *size_t v11 = 0;
            v11[1] = v32;
            *(void *)long long v32 = v11;
            *(void *)&long long v32 = v11;
          }
          size_t v11 = (uint64_t *)v12;
        }
        while (v12);
      }
      lck_mtx_unlock((lck_mtx_t *)(v4 + 712));
      unsigned int v15 = 0;
      unsigned int v10 = 0;
      while (1)
      {
        uint64_t v16 = *(void *)&arg2[1];
        if (!*(void *)&arg2[1]) {
          break;
        }
        uint64_t v17 = **(void **)&arg2[1];
        if (**(void **)&arg2[1])
        {
          if (*(void *)(v17 + 8) != *(void *)&arg2[1])
          {
            __break(0xBFFDu);
            JUMPOUT(0xFB68);
          }
          uintptr_t v18 = *(void **)(*(void *)&arg2[1] + 8);
          if (*v18 != *(void *)&arg2[1]) {
            goto LABEL_72;
          }
          *(void *)(v17 + 8) = v18;
        }
        else
        {
          if (**(void **)(*(void *)&arg2[1] + 8) != *(void *)&arg2[1]) {
            goto LABEL_72;
          }
          *(void *)&long long v32 = *(void *)(*(void *)&arg2[1] + 8);
        }
        **(void **)(v16 + 8) = v17;
        *(_DWORD *)(v16 + 56) &= ~0x400u;
        unsigned int v19 = lifs_dispatch_async_endio(v4, v16, 0);
        if (v10) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v19 == 0;
        }
        if (!v20) {
          unsigned int v10 = v19;
        }
        uint64_t v21 = v15 + 1;
        uint64_t v22 = v21 << 31 >> 31;
        if (v22 == v21)
        {
          ++v15;
          if ((v22 & 0x8000000000000000) == 0) {
            continue;
          }
        }
        lifs_fsync_internal_cold_1();
      }
      if (v8)
      {
        lck_mtx_lock((lck_mtx_t *)(v3 + 112));
        if (*((int *)v3 + 215) >= 1)
        {
          do
          {
            *((_DWORD *)v3 + 32) |= 0x1000u;
            msleep(v3 + 860, (lck_mtx_t *)(v3 + 112), 16, "lifs_flush_async_endio", 0);
          }
          while (*((int *)v3 + 215) > 0);
        }
        lck_mtx_unlock((lck_mtx_t *)(v3 + 112));
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x31400EDu, v4, (uintptr_t)v3, v15, (int)v10);
      }
    }
    else
    {
      lifs_flush_async_io(v4, (uint64_t)v3, v8 != 0);
      unsigned int v10 = 0;
    }
    BOOL v20 = v8 == 0;
    uintptr_t v23 = v8 == 0;
    int v24 = !v20;
    cluster_push_err(v2, 4 * v24, 0, 0, arg2);
    unsigned int v25 = lifs_issue_endio((uintptr_t)v3, arg2[0], v23);
    if (v25) {
      BOOL v26 = v10 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    if (v26) {
      uint64_t v5 = v25;
    }
    else {
      uint64_t v5 = v10;
    }
    if (v7 != *((thread_t *)v3 + 65)) {
      lck_rw_unlock_exclusive((lck_rw_t *)(v3 + 504));
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ((vfs_flags(*(mount_t *)(v4 + 448)) & 0x1000) != 0)
  {
    char v50 = 0;
    v49[0] = *(_OWORD *)"_N_SYNC";
    v49[1] = unk_3B91;
    if (vnode_isrecycled(v2) && !vfs_isunmount(*(mount_t *)(v4 + 448)) || (uint64_t v27 = *(int *)(a1 + 16), v27 == 2))
    {
      BOOL v28 = (long long *)kalloc_type_impl();
      *(void *)BOOL v28 = 2;
      uint64_t v29 = lifs_setfsattr_request_async(v4, (long long *)v3, (char *)v49, v28, 8, (uint64_t)lifs_setfsattr_done, (uint64_t)v28, (uint64_t)v28);
      if (v5) {
        goto LABEL_66;
      }
    }
    else
    {
      long long v48 = 0u;
      long long v47 = 0u;
      long long v46 = 0u;
      long long v45 = 0u;
      long long v44 = 0u;
      long long v43 = 0u;
      long long v42 = 0u;
      long long v41 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      *(void *)&arg2[1] = v27;
      uint64_t v29 = lifs_setfsattr_request(v4, (long long *)v3, (char *)v49, (long long *)&arg2[1], 8, (uint64_t)&arg2[1]);
      if (v5) {
        goto LABEL_66;
      }
    }
    if (v29 && v29 != 45) {
      uint64_t v5 = v29;
    }
  }
LABEL_66:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140072u, (uintptr_t)v2, arg2[0], (int)v5, 0);
  }
  return v5;
}

uint64_t lifs_copyin_to_upl(uint64_t a1, user_addr_t a2, unsigned int a3)
{
  uint64_t v5 = *(buf **)(a1 + 32);
  int v6 = (ipc_port *)buf_upl(v5);
  uint32_t v7 = buf_uploffset(v5);

  return lifs_copy_upl_data(v6, v7, a2, a3, 0);
}

uint64_t lifs_copy_upl_data(ipc_port *a1, int a2, user_addr_t a3, unsigned int a4, int a5)
{
  int v14 = a4;
  if (a5) {
    int v9 = 2;
  }
  else {
    int v9 = 8;
  }
  unsigned int v10 = uio_create(1, 0, v9, a5 ^ 1u);
  if (!v10) {
    return 12;
  }
  size_t v11 = v10;
  uio_addiov(v10, a3, a4);
  uint64_t v12 = cluster_copy_upl_data(v11, a1, a2, &v14);
  uio_free(v11);
  return v12;
}

void lifs_submit_io(uint64_t a1, uintptr_t a2)
{
  uint64_t v5 = *(void *)(a2 + 24);
  uintptr_t v4 = *(buf **)(a2 + 32);
  vnode_t v6 = buf_vnode(v4);
  uintptr_t v7 = buf_kernel_addrperm_addr();
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uint64_t v8 = *(unsigned int *)(a2 + 40);
    unsigned int v9 = buf_flags(v4);
    kernel_debug_filtered(0x31400D9u, (uintptr_t)v6, v7, a2, v9 | (unint64_t)(v8 << 32));
  }
  daddr64_t v10 = buf_blkno(v4);
  uintptr_t v11 = v10 * vfs_devblocksize(*(mount_t *)(a1 + 448));
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uint64_t v12 = 496;
    if (!*(unsigned char *)(a2 + 16)) {
      uint64_t v12 = 488;
    }
    kernel_debug_filtered(0x31400D8u, (uintptr_t)v6, v11, *(unsigned int *)(a2 + 40), *(void *)(v5 + v12));
  }
  OSAddAtomic(1, (SInt32 *)(v5 + 864));
  if (*(unsigned char *)(a2 + 16))
  {
    unsigned int request_async = lifs_read_request_async(a1, (long long *)v5, *(_DWORD *)(a2 + 40), v11, *(_DWORD *)(a2 + 40), (uint64_t)lifs_vnop_strategy_done, a2, a2 + 48);
    if (!request_async) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  vm_address_t address = 0;
  unsigned int v15 = (ipc_port *)ipc_kernel_map;
  if (vm_allocate(ipc_kernel_map, &address, *(unsigned int *)(a2 + 40), 1))
  {
LABEL_12:
    unsigned int request_async = 12;
    goto LABEL_15;
  }
  uint64_t v16 = (ipc_port *)buf_upl(v4);
  uint32_t v17 = buf_uploffset(v4);
  unsigned int v18 = lifs_copy_upl_data(v16, v17, address, *(_DWORD *)(a2 + 40), 1);
  if (v18)
  {
    unsigned int request_async = v18;
    vm_deallocate(v15, address, *(unsigned int *)(a2 + 40));
    goto LABEL_15;
  }
  if (vm_map_copyin())
  {
    vm_deallocate(v15, address, *(unsigned int *)(a2 + 40));
    goto LABEL_12;
  }
  unsigned int v20 = lifs_write_request_async(a1, (long long *)v5, v11, 0, *(_DWORD *)(a2 + 40), (uint64_t)lifs_vnop_strategy_done, a2, a2 + 48);
  if (!v20)
  {
LABEL_9:
    if ((kdebug_enable & 0xFFFFFFF7) != 0)
    {
      daddr64_t v14 = buf_blkno(v4);
      kernel_debug_filtered(0x31400DAu, (uintptr_t)v6, v7, v14, a2);
    }
    return;
  }
  unsigned int request_async = v20;
  vm_map_copy_discard();
LABEL_15:
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    daddr64_t v19 = buf_blkno(v4);
    kernel_debug_filtered(0x31400DAu, (uintptr_t)v6, v7, v19, request_async | ((unint64_t)*(unsigned int *)(a2 + 40) << 32));
  }
  OSAddAtomic(-1, (SInt32 *)(v5 + 864));
  kfree_type_impl();
  buf_seterror(v4, request_async);
  buf_biodone(v4);
}

void lifs_enable_lowspace_sync_write(char *chan)
{
  uintptr_t v2 = chan + 32;
  uint64_t v1 = *((void *)chan + 4);
  if ((v1 & 0x400) == 0)
  {
    if ((v1 & 0x100) == 0)
    {
      thread_call_enter(*((thread_call_t *)chan + 105));
      uint64_t v1 = *((void *)chan + 4);
    }
    *((void *)chan + 4) = v1 | 0x200;
    do
      msleep(v2, (lck_mtx_t *)(chan + 96), 16, "lifs_enable_lowspace_sync_write", 0);
    while ((*v2 & 0x200) != 0);
    *((void *)chan + 4) = *v2 | 0x400;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: lmp %p freespace 0x%llx sync write enabled", "lifs_enable_lowspace_sync_write", chan, *((void *)chan + 107));
  }
}

thread_t lifs_set_io_lock_override(void *a1)
{
  if (a1[65]) {
    panic("\"%s: override is already set for lnode %p io_lock\" @%s:%d", "lifs_set_io_lock_override", a1, "lifs_vnops.c", 188);
  }
  thread_t result = current_thread();
  a1[65] = result;
  return result;
}

uint64_t lifs_lookup(uint64_t a1, long long *a2, uint64_t a3, char *a4, uint64_t a5)
{
  int v5 = *(_DWORD *)(a3 + 48);
  if (v5 >= 65) {
    return lifs_lookup_request(a1, a4, a2, 0, a5);
  }
  if (v5 < 33) {
    return lifs_lookupsmall_request(a1, a4, a2, 0, a5);
  }
  return lifs_lookupmed_request(a1, a4, a2, 0, a5);
}

uint64_t lifs_sillyrename(uint64_t a1, uint64_t a2, const char *a3, vfs_context_t ctx)
{
  uint64_t v7 = *(void *)(a2 + 200);
  unsigned __int16 v8 = vfs_context_pid(ctx);
  SInt32 v9 = OSAddAtomic(1, lifs_sillyrename_number);
  bzero(v20, 0x268uLL);
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  daddr64_t v10 = (char *)kalloc_data();
  snprintf(v10, 0x400uLL, ".nfs.%08x.%04x", v9, v8);
  while (!lifs_lookupsmall_request(v7, v10, (long long *)a1, 0, (uint64_t)v20))
  {
    SInt32 v11 = OSAddAtomic(1, lifs_sillyrename_number);
    snprintf(v10, 0x400uLL, ".nfs.%08x.%04x", v11, v8);
  }
  cache_purge(*(vnode_t *)(a2 + 224));
  unsigned int v12 = lifs_rename_request(v7, a3, (_OWORD *)a2, (_OWORD *)a1, v10, invalidFH, (long long *)a1, 0x8000, (uint64_t)v18);
  if (v12)
  {
    if (v12 == 2) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    kfree_data();
  }
  else
  {
    lifs_update_freespace(v7, (unint64_t *)&v19);
    update_lnode_attr(a1, (uint64_t)&v18[11] + 8);
    lifs_invalidate_dirattrcache_ext(a1, 1);
    lck_mtx_lock((lck_mtx_t *)(a1 + 112));
    int v14 = *(_DWORD *)(a1 + 448);
    lck_mtx_unlock((lck_mtx_t *)(a1 + 112));
    lck_mtx_lock((lck_mtx_t *)(a2 + 112));
    int v15 = *(_DWORD *)(a2 + 128);
    if ((v15 & 0x40) != 0) {
      uint64_t v16 = *(void *)(a2 + 464);
    }
    else {
      uint64_t v16 = 0;
    }
    *(_DWORD *)(a2 + 128) = v15 | 0x40;
    *(void *)(a2 + 464) = v10;
    *(_DWORD *)(a2 + 452) = v14;
    lck_mtx_unlock((lck_mtx_t *)(a2 + 112));
    if (v16) {
      kfree_data();
    }
    add_sillyrename_entry(a1, (_OWORD *)a2, v10);
    return 0;
  }
  return v13;
}

uint64_t handle_enoent_from_lookup(vnode *a1, componentname *cnp, int a3)
{
  uint32_t cn_nameiop = cnp->cn_nameiop;
  if (!cnp->cn_nameiop)
  {
    if (!a3) {
      return 2;
    }
LABEL_14:
    cache_enter(a1, 0, cnp);
    return 2;
  }
  if (cn_nameiop != 3 && cn_nameiop != 1) {
    return 2;
  }
  uint32_t cn_flags = cnp->cn_flags;
  if ((cn_flags & 0x8000) != 0) {
    uint64_t v6 = 4294967294;
  }
  else {
    uint64_t v6 = 2;
  }
  if (cn_flags & 0x8000) == 0 && (a3) {
    goto LABEL_14;
  }
  return v6;
}

uint64_t lifs_vnop_dorename(vnode *a1, vnode *a2, vnode *a3, vnode *a4, uint64_t a5, uint64_t a6, int a7, vfs_context *a8)
{
  bzero(v48, 0x268uLL);
  int v14 = (long long *)vnode_fsnode(a1);
  int v15 = (long long *)vnode_fsnode(a3);
  uint64_t v16 = vnode_fsnode(a2);
  uintptr_t arg1 = 0;
  memset(v47, 0, sizeof(v47));
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v14, &arg1);
  if (lifs_mount_from_node) {
    return lifs_mount_from_node;
  }
  vp = a2;
  uint64_t v42 = a6;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140065u, arg1, (uintptr_t)v14, (uintptr_t)v16, (uintptr_t)v15);
  }
  if (*(int *)(a5 + 48) > 1023 || *(int *)(a6 + 48) > 1023)
  {
    uint64_t lifs_mount_from_node = 63;
    goto LABEL_45;
  }
  unsigned int v18 = (char *)kalloc_data();
  __dst = (char *)kalloc_data();
  size_t v19 = (*(_DWORD *)(a5 + 48) + 1);
  if (v19 >= 0x401) {
    lifs_vnop_dorename_cold_1();
  }
  strlcpy(v18, *(const char **)(a5 + 40), v19);
  size_t v20 = (*(_DWORD *)(v42 + 48) + 1);
  if (v20 >= 0x401) {
    lifs_vnop_dorename_cold_2();
  }
  strlcpy(__dst, *(const char **)(v42 + 40), v20);
  lck_rw_lock_exclusive((lck_rw_t *)(arg1 + 128));
  if (!lifs_lookup(arg1, v14, a5, v18, (uint64_t)v48))
  {
    uint64_t v21 = lifs_lookup_node(arg1, v49);
    if (v21 && *(vnode **)(v21 + 224) != a2) {
      goto LABEL_13;
    }
    int v22 = lifs_lookup(arg1, v15, v42, __dst, (uint64_t)v48);
    if (v22)
    {
      BOOL v43 = 0;
      uintptr_t v23 = 0;
    }
    else if (!a4 {
           || (v43 = v22 == 0, (uint64_t v30 = lifs_lookup_node(arg1, v49)) == 0)
    }
           || (uintptr_t v23 = a4, *(vnode **)(v30 + 224) != a4))
    {
LABEL_13:
      uint64_t lifs_mount_from_node = 4294967291;
      goto LABEL_44;
    }
    uintptr_t v24 = arg1;
    if ((*(unsigned char *)(arg1 + 32) & 4) != 0 || v23 == a2 || !v23)
    {
      if (!v23)
      {
        uint64_t v29 = (uint64_t)v16;
LABEL_30:
        uint64_t lifs_mount_from_node = lifs_rename_request(v24, v18, (_OWORD *)v29, v14, __dst, invalidFH, v15, a7, (uint64_t)v47);
        BOOL v31 = 0;
        char v33 = 1;
LABEL_31:
        if (lifs_mount_from_node) {
          goto LABEL_44;
        }
        update_lnode_attr((uint64_t)v14, (uint64_t)v47);
        update_lnode_attr((uint64_t)v15, (uint64_t)&v47[11] + 8);
        lck_mtx_lock((lck_mtx_t *)(v29 + 112));
        long long v34 = *v15;
        long long v35 = v15[1];
        long long v36 = v15[2];
        *(_OWORD *)(v29 + 184) = v15[3];
        *(_OWORD *)(v29 + 168) = v36;
        *(_OWORD *)(v29 + 152) = v35;
        *(_OWORD *)(v29 + 136) = v34;
        int v37 = *__dst;
        if (*v18 == 46)
        {
          if (v37 == 46) {
            goto LABEL_37;
          }
        }
        else if (v37 != 46)
        {
LABEL_37:
          lck_mtx_unlock((lck_mtx_t *)(v29 + 112));
          cache_purge(vp);
          if ((v33 & 1) == 0) {
            cache_purge(v31);
          }
          cache_purge_negatives(a1);
          cache_purge_negatives(a3);
          lifs_invalidate_dirattrcache_ext((uint64_t)v14, 1);
          lifs_invalidate_dirattrcache_ext((uint64_t)v15, 1);
          vnode_update_identity(vp, a3, __dst, *(_DWORD *)(v42 + 48), *(_DWORD *)(v42 + 52), 3);
          char v38 = !v43;
          if (v31 == vp) {
            char v38 = 1;
          }
          if ((v38 & 1) == 0) {
            vnode_recycle(v31);
          }
          uint64_t lifs_mount_from_node = 0;
          goto LABEL_44;
        }
        invalidate_lnode_attr_locked(v29);
        goto LABEL_37;
      }
    }
    else
    {
      unsigned int v25 = v23;
      BOOL v26 = vnode_fsnode(v23);
      int v27 = vnode_isinuse(v25, 0);
      uintptr_t v23 = v25;
      if (v27)
      {
        vtype v28 = vnode_vtype(v25);
        uintptr_t v23 = v25;
        if (v28 != VDIR)
        {
          uint64_t lifs_mount_from_node = lifs_sillyrename((uint64_t)v15, (uint64_t)v26, __dst, a8);
          uint64_t v29 = (uint64_t)v16;
          if (lifs_mount_from_node) {
            goto LABEL_44;
          }
          BOOL v43 = 0;
          uintptr_t v24 = arg1;
          goto LABEL_30;
        }
      }
    }
    BOOL v31 = v23;
    long long v32 = (long long *)vnode_fsnode(v23);
    uint64_t v29 = (uint64_t)v16;
    uint64_t lifs_mount_from_node = lifs_rename_request(arg1, v18, v16, v14, __dst, v32, v15, a7, (uint64_t)v47);
    char v33 = 0;
    goto LABEL_31;
  }
  uint64_t lifs_mount_from_node = 2;
LABEL_44:
  lck_rw_unlock_exclusive((lck_rw_t *)(arg1 + 128));
  kfree_data();
  kfree_data();
LABEL_45:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140066u, arg1, (uintptr_t)v14, (uintptr_t)v15, (int)lifs_mount_from_node);
  }
  return lifs_mount_from_node;
}

uint64_t lifs_reclaim_done(uint64_t a1, int a2)
{
  if (!a2) {
    lifs_update_freespace(*(void *)a1, (unint64_t *)(a1 + 8));
  }

  return kfree_type_impl();
}

void lifs_flush_async_io(uint64_t a1, uint64_t a2, int a3)
{
  int v14 = 0;
  int v15 = &v14;
  uint64_t v6 = (lck_mtx_t *)(a1 + 696);
  lck_mtx_lock((lck_mtx_t *)(a1 + 696));
  uint64_t v7 = *(uint64_t **)(a1 + 616);
  if (v7)
  {
    do
    {
      uint64_t v8 = *v7;
      if (v7[3] == a2)
      {
        if (v8)
        {
          if (*(uint64_t **)(v8 + 8) != v7)
          {
LABEL_28:
            __break(0xBFFDu);
            JUMPOUT(0x10A74);
          }
          SInt32 v9 = (uint64_t **)v7[1];
          if (*v9 != v7)
          {
LABEL_27:
            __break(0xBFFDu);
            JUMPOUT(0x10A88);
          }
          *(void *)(v8 + 8) = v9;
          daddr64_t v10 = (uint64_t **)v7[1];
        }
        else
        {
          daddr64_t v10 = (uint64_t **)v7[1];
          if (*v10 != v7) {
            goto LABEL_27;
          }
          *(void *)(a1 + 624) = v10;
        }
        char *v10 = (uint64_t *)v8;
        *uint64_t v7 = 0;
        v7[1] = (uint64_t)v15;
        *int v15 = v7;
        int v15 = (uint64_t **)v7;
      }
      uint64_t v7 = (uint64_t *)v8;
    }
    while (v8);
  }
  lck_mtx_unlock(v6);
  while (1)
  {
    uintptr_t v11 = (uintptr_t)v14;
    if (!v14) {
      break;
    }
    uint64_t v12 = *v14;
    if (*v14)
    {
      if (*(uint64_t **)(v12 + 8) != v14)
      {
        __break(0xBFFDu);
        JUMPOUT(0x10A80);
      }
      uint64_t v13 = (uint64_t **)v14[1];
      if (*v13 != v14) {
        goto LABEL_28;
      }
      *(void *)(v12 + 8) = v13;
    }
    else
    {
      if (*(uint64_t **)v14[1] != v14) {
        goto LABEL_28;
      }
      int v15 = (uint64_t **)v14[1];
    }
    **(void **)(v11 + 8) = v12;
    lifs_submit_io(a1, v11);
  }
  if (a3)
  {
    lck_mtx_lock((lck_mtx_t *)(a2 + 112));
    if (*(int *)(a2 + 864) >= 1)
    {
      do
      {
        *(_DWORD *)(a2 + 128) |= 0x1000u;
        msleep((void *)(a2 + 864), (lck_mtx_t *)(a2 + 112), 16, "lifs_flush_async_io", 0);
      }
      while (*(int *)(a2 + 864) > 0);
    }
    lck_mtx_unlock((lck_mtx_t *)(a2 + 112));
  }
}

uint64_t lifs_io_thread_start(uint64_t a1)
{
  kern_return_t v4;
  thread_t new_thread;

  new_thread = 0;
  uintptr_t v2 = (lck_mtx_t *)(a1 + 696);
  lck_mtx_lock((lck_mtx_t *)(a1 + 696));
  *(_DWORD *)(a1 + 652) = 0;
  if (lifs_max_io_threads)
  {
    int v3 = 0;
    while (1)
    {
      uintptr_t v4 = kernel_thread_start((thread_continue_t)lifs_io_strategy_thread, (void *)a1, &new_thread);
      if (v4) {
        break;
      }
      msleep(new_thread, v2, 32, "lifs_io_thread_start", 0);
      thread_deallocate(new_thread);
      if (++v3 >= lifs_max_io_threads) {
        goto LABEL_5;
      }
    }
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to start lifs IO thread for mount %p kern_return %d", (const void *)a1, v4);
    lck_mtx_unlock(v2);
    lifs_io_thread_stop(a1);
    return 12;
  }
  else
  {
LABEL_5:
    lck_mtx_unlock(v2);
    return 0;
  }
}

uint64_t lifs_io_strategy_thread(uint64_t a1)
{
  thread_t v2 = current_thread();
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p starting for mount %p\n", "lifs_io_strategy_thread", v2, (const void *)a1);
  thread_set_thread_name(v2, "lifs_io_strategy");
  lck_mtx_lock((lck_mtx_t *)(a1 + 696));
  ++*(unsigned char *)(a1 + 732);
  wakeup(v2);
  if (*(_DWORD *)(a1 + 652) != 2)
  {
    int v3 = (uint64_t **)(a1 + 616);
    do
    {
      uintptr_t v4 = *v3;
      if (*v3)
      {
        do
        {
          uint64_t v5 = *v4;
          if (*v4)
          {
            if (*(uint64_t **)(v5 + 8) != v4 || (uint64_t v6 = (uint64_t **)v4[1], *v6 != v4))
            {
LABEL_18:
              __break(0xBFFDu);
              JUMPOUT(0x10D64);
            }
            *(void *)(v5 + 8) = v6;
            uint64_t v7 = (uint64_t **)v4[1];
          }
          else
          {
            uint64_t v7 = (uint64_t **)v4[1];
            if (*v7 != v4) {
              goto LABEL_18;
            }
            *(void *)(a1 + 624) = v7;
          }
          *uint64_t v7 = (uint64_t *)v5;
          lck_mtx_unlock((lck_mtx_t *)(a1 + 696));
          lifs_submit_io(a1, (uintptr_t)v4);
          lck_mtx_lock((lck_mtx_t *)(a1 + 696));
          uintptr_t v4 = *(uint64_t **)(a1 + 616);
        }
        while (v4);
        if (*(_DWORD *)(a1 + 652) == 2) {
          break;
        }
      }
      msleep((void *)(a1 + 616), (lck_mtx_t *)(a1 + 696), 16, "lifs_io_strategy_thread", 0);
    }
    while (*(_DWORD *)(a1 + 652) != 2);
  }
  char v8 = *(unsigned char *)(a1 + 732) - 1;
  *(unsigned char *)(a1 + 732) = v8;
  if (!v8) {
    wakeup((void *)a1);
  }
  lck_mtx_unlock((lck_mtx_t *)(a1 + 696));
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p exiting for mount %p\n", "lifs_io_strategy_thread", v2, (const void *)a1);

  return thread_terminate(v2);
}

void lifs_io_thread_stop(uint64_t a1)
{
  thread_t v2 = (lck_mtx_t *)(a1 + 696);
  lck_mtx_lock((lck_mtx_t *)(a1 + 696));
  *(_DWORD *)(a1 + 652) = 2;
  wakeup((void *)(a1 + 616));
  while (*(unsigned char *)(a1 + 732))
    msleep((void *)a1, v2, 32, "lifs_io_thread_stop", 0);

  lck_mtx_unlock(v2);
}

uint64_t lifs_endio_thread_start(uint64_t a1)
{
  kern_return_t v3;
  thread_t new_thread;

  new_thread = 0;
  thread_t v2 = (lck_mtx_t *)(a1 + 712);
  lck_mtx_lock((lck_mtx_t *)(a1 + 712));
  *(_DWORD *)(a1 + 656) = 0;
  int v3 = kernel_thread_start((thread_continue_t)lifs_endio_thread, (void *)a1, &new_thread);
  if (v3)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to start lifs endio thread for mount %p kern_return %d", (const void *)a1, v3);
    lck_mtx_unlock(v2);
    return 12;
  }
  else
  {
    msleep(new_thread, v2, 32, "lifs_endio_thread_start", 0);
    lck_mtx_unlock(v2);
    thread_deallocate(new_thread);
    return 0;
  }
}

uint64_t lifs_endio_thread(uint64_t a1)
{
  thread_t v2 = current_thread();
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p starting for mount %p\n", "lifs_endio_thread", v2, (const void *)a1);
  thread_set_thread_name(v2, "lifs_endio");
  lck_mtx_lock((lck_mtx_t *)(a1 + 712));
  *(_DWORD *)(a1 + 656) = 1;
  wakeup(v2);
  if (*(_DWORD *)(a1 + 656) == 1)
  {
    int v3 = (uint64_t **)(a1 + 632);
    do
    {
      uintptr_t v4 = *v3;
      if (*v3)
      {
        do
        {
          uint64_t v5 = *v4;
          if (*v4)
          {
            if (*(uint64_t **)(v5 + 8) != v4 || (uint64_t v6 = (uint64_t **)v4[1], *v6 != v4))
            {
LABEL_16:
              __break(0xBFFDu);
              JUMPOUT(0x1106CLL);
            }
            *(void *)(v5 + 8) = v6;
            uint64_t v7 = (uint64_t **)v4[1];
          }
          else
          {
            uint64_t v7 = (uint64_t **)v4[1];
            if (*v7 != v4) {
              goto LABEL_16;
            }
            *(void *)(a1 + 640) = v7;
          }
          *uint64_t v7 = (uint64_t *)v5;
          lifs_dispatch_async_endio(a1, (uint64_t)v4, 1);
          lck_mtx_lock((lck_mtx_t *)(a1 + 712));
          uintptr_t v4 = *(uint64_t **)(a1 + 632);
        }
        while (v4);
        if (*(_DWORD *)(a1 + 656) == 2) {
          break;
        }
      }
      msleep((void *)(a1 + 632), (lck_mtx_t *)(a1 + 712), 16, "lifs_endio_thread", 0);
    }
    while (*(_DWORD *)(a1 + 656) == 1);
  }
  *(_DWORD *)(a1 + 656) = 3;
  wakeup((void *)a1);
  lck_mtx_unlock((lck_mtx_t *)(a1 + 712));
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: thread %p exiting for mount %p\n", "lifs_endio_thread", v2, (const void *)a1);

  return thread_terminate(v2);
}

void lifs_endio_thread_stop(uint64_t a1)
{
  thread_t v2 = (lck_mtx_t *)(a1 + 712);
  lck_mtx_lock((lck_mtx_t *)(a1 + 712));
  *(_DWORD *)(a1 + 656) = 2;
  wakeup((void *)(a1 + 632));
  while (*(_DWORD *)(a1 + 656) != 3)
    msleep((void *)a1, v2, 32, "lifs_endio_thread_stop", 0);

  lck_mtx_unlock(v2);
}

void *lifs_get_endio_context(uint64_t a1)
{
  thread_t v2 = current_thread();
  int v3 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  uintptr_t v4 = (void *)(a1 + 840);
  do
    uintptr_t v4 = (void *)*v4;
  while (v4 && (thread_t)v4[3] != v2);
  lck_mtx_unlock(v3);
  return v4;
}

void lifs_koio_done(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  int v3 = (void (*)(uint64_t, uint64_t))a2[2];
  if (v3) {
    v3(a1, a2[3]);
  }
  kfree_type_impl();

  lifs_dev_rele(v2);
}

void lifs_vnop_strategy_done(uint64_t a1, errno_t a2)
{
  uintptr_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(buf **)(a1 + 32);
  uint64_t v6 = buf_vnode(v5);
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v7 = buf_kernel_addrperm_addr();
    kernel_debug_filtered(0x31400B9u, (uintptr_t)v6, v7, *(unsigned __int8 *)(a1 + 16), *(unsigned int *)(a1 + 40));
  }
  uint32_t v8 = *(_DWORD *)(a1 + 40);
  if (*(unsigned char *)(a1 + 16))
  {
    if (!a2)
    {
      int v9 = *(_DWORD *)(a1 + 48);
      if (v9)
      {
        uint32_t v10 = v8 - v9;
        uint32_t v8 = 0;
        if (v10)
        {
          uintptr_t v11 = vnode_mount(v6);
          int v12 = vfs_devblocksize(v11);
          uintptr_t v13 = buf_blkno(v5) * v12;
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x31400B8u, v13, *(unsigned int *)(a1 + 40), *(void *)(v4 + 488), *(void *)(v4 + 496));
          }
          lck_mtx_lock((lck_mtx_t *)(v4 + 112));
          uintptr_t v14 = *(void *)(v4 + 496);
          if (v13 + *(unsigned int *)(a1 + 40) > v14 || *(void *)(v4 + 488) > v14) {
            uint32_t v10 = 0;
          }
          lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
          uint32_t v8 = v10;
        }
      }
      else
      {
        uint32_t v8 = 0;
      }
    }
  }
  else if (!a2)
  {
    lifs_update_freespace(*(void *)(v4 + 200), (unint64_t *)(a1 + 56));
    v8 -= *(_DWORD *)(a1 + 48);
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400B8u, v4, *(int *)(a1 + 48), v8, a2);
  }
  buf_seterror(v5, a2);
  buf_setresid(v5, v8);
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    uintptr_t v15 = buf_kernel_addrperm_addr();
    uint32_t v16 = buf_resid(v5);
    kernel_debug_filtered(0x31400BAu, (uintptr_t)v6, v15, v16, a2);
  }
  buf_biodone(v5);
  if (*(unsigned char *)(a1 + 17)) {
    vnode_rele(v6);
  }
  kfree_type_impl();
  OSAddAtomic(-1, (SInt32 *)(v4 + 864));
  lck_mtx_lock((lck_mtx_t *)(v4 + 112));
  if ((*(_DWORD *)(v4 + 864) & 0x80000000) != 0) {
    panic("\"%s: lnode %p async_io_inflights (%d) < 0\" @%s:%d", "lifs_vnop_strategy_done", (const void *)v4, *(_DWORD *)(v4 + 864), "lifs_vnops.c", 1731);
  }
  int v17 = *(_DWORD *)(v4 + 128);
  if ((v17 & 0x1000) != 0)
  {
    *(_DWORD *)(v4 + 128) = v17 & 0xFFFFEFFF;
    wakeup((void *)(v4 + 864));
  }

  lck_mtx_unlock((lck_mtx_t *)(v4 + 112));
}

uint64_t lifs_setfsattr_done()
{
  return kfree_type_impl();
}

uint64_t lifs_dispatch_async_endio(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uintptr_t v7 = (void *)(a1 + 816);
  OSAddAtomic(1, (SInt32 *)(a1 + 816));
  OSAddAtomic(1, (SInt32 *)(v6 + 860));
  if (a3) {
    lck_mtx_unlock((lck_mtx_t *)(a1 + 712));
  }
  uint64_t v8 = lifs_endio_request_async(a1, (long long *)v6, *(void *)(a2 + 40), *(void *)(a2 + 48), *(_DWORD *)(a2 + 60), *(_DWORD *)(a2 + 56), *(void *)(a2 + 32), (uint64_t)lifs_endio_done, a2);
  uint64_t v9 = v8;
  if (v8)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lnode %p flags 0x%x offset %llu length %llu status %u ope_id %llu error %d\n", "lifs_dispatch_async_endio", (const void *)v6, *(_DWORD *)(a2 + 56), *(void *)(a2 + 40), *(void *)(a2 + 48), *(_DWORD *)(a2 + 60), *(void *)(a2 + 32), v8);
    lifs_endio_done(a2);
  }
  else
  {
    lck_mtx_lock((lck_mtx_t *)(a1 + 96));
    if (*(int *)(a1 + 816) >= 17)
    {
      do
      {
        *(void *)(a1 + 32) |= 0x10uLL;
        msleep(v7, (lck_mtx_t *)(a1 + 96), 16, "lifs_dispatch_async_endio", 0);
      }
      while (*(int *)(a1 + 816) > 16);
    }
    lck_mtx_unlock((lck_mtx_t *)(a1 + 96));
  }
  return v9;
}

uint64_t lifs_endio_done(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(v1 + 200);
  OSAddAtomic(-1, (SInt32 *)(v2 + 816));
  lck_mtx_lock((lck_mtx_t *)(v2 + 96));
  if ((*(_DWORD *)(v2 + 816) & 0x80000000) != 0) {
    panic("\"%s: lmp %p async_endio_inflights (%d) < 0\" @%s:%d", "lifs_endio_done", (const void *)v2, *(_DWORD *)(v2 + 816), "lifs_vnops.c", 5813);
  }
  uint64_t v3 = *(void *)(v2 + 32);
  if ((v3 & 0x10) != 0)
  {
    *(void *)(v2 + 32) = v3 & 0xFFFFFFFFFFFFFFEFLL;
    wakeup((void *)(v2 + 816));
  }
  lck_mtx_unlock((lck_mtx_t *)(v2 + 96));
  OSAddAtomic(-1, (SInt32 *)(v1 + 860));
  lck_mtx_lock((lck_mtx_t *)(v1 + 112));
  if ((*(_DWORD *)(v1 + 860) & 0x80000000) != 0) {
    panic("\"%s: lnode %p async_endio_inflights (%d) < 0\" @%s:%d", "lifs_endio_done", (const void *)v1, *(_DWORD *)(v1 + 860), "lifs_vnops.c", 5828);
  }
  int v4 = *(_DWORD *)(v1 + 128);
  if ((v4 & 0x1000) != 0)
  {
    *(_DWORD *)(v1 + 128) = v4 & 0xFFFFEFFF;
    wakeup((void *)(v1 + 860));
  }
  lck_mtx_unlock((lck_mtx_t *)(v1 + 112));

  return kfree_type_impl();
}

void com_apple_filesystems_lifs::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void com_apple_filesystems_lifs::~com_apple_filesystems_lifs(IOService *this)
{
}

{
  uint64_t vars8;

  IOService::~IOService(this);

  _OSObject_typed_operator_delete(&com_apple_filesystems_lifs_ktv, this, 136);
}

void *com_apple_filesystems_lifs::getMetaClass(com_apple_filesystems_lifs *this)
{
  return &com_apple_filesystems_lifs::gMetaClass;
}

IOService *com_apple_filesystems_lifs::MetaClass::alloc(com_apple_filesystems_lifs::MetaClass *this)
{
  uint64_t v1 = (IOService *)OSObject_typed_operator_new();
  IOService::IOService(v1, &com_apple_filesystems_lifs::gMetaClass)->__vftable = (IOService_vtbl *)off_24B78;
  OSMetaClass::instanceConstructed(&com_apple_filesystems_lifs::gMetaClass);
  return v1;
}

uint64_t com_apple_filesystems_lifs::init(com_apple_filesystems_lifs *this, OSDictionary *a2)
{
}

uint64_t com_apple_filesystems_lifs::free(com_apple_filesystems_lifs *this)
{
}

uint64_t com_apple_filesystems_lifs::probe(com_apple_filesystems_lifs *this, IOService *a2, int *a3)
{
}

uint64_t com_apple_filesystems_lifs::start(com_apple_filesystems_lifs *this, IOService *a2)
{
  if (result)
  {
    if (lifs_add())
    {
      return 0;
    }
    else
    {
      lck_mtx_init((lck_mtx_t *)&lifs_containers_list_lock, (lck_grp_t *)lifs_kext_grp, 0);
      lifs_containers_list = 0;
      (*(void (**)(com_apple_filesystems_lifs *, void))(*(void *)this + 672))(this, 0);
      return 1;
    }
  }
  return result;
}

uint64_t com_apple_filesystems_lifs::stop(com_apple_filesystems_lifs *this, IOService *a2)
{
  lck_mtx_destroy((lck_mtx_t *)&lifs_containers_list_lock, (lck_grp_t *)lifs_kext_grp);
  if (lifs_remove()) {
    com_apple_filesystems_lifs::stop();
  }

  return ((uint64_t (*)(com_apple_filesystems_lifs *, IOService *))stop)(this, a2);
}

void AppleLIFSUserClient::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleLIFSUserClient::~AppleLIFSUserClient(IOUserClient *this)
{
}

{
  uint64_t vars8;

  IOUserClient::~IOUserClient(this);

  _OSObject_typed_operator_delete(&AppleLIFSUserClient_ktv, this, 288);
}

void *AppleLIFSUserClient::getMetaClass(AppleLIFSUserClient *this)
{
  return &AppleLIFSUserClient::gMetaClass;
}

IOUserClient *AppleLIFSUserClient::MetaClass::alloc(AppleLIFSUserClient::MetaClass *this)
{
  uint64_t v1 = (IOUserClient *)OSObject_typed_operator_new();
  IOUserClient::IOUserClient(v1, &AppleLIFSUserClient::gMetaClass)->__vftable = (IOUserClient_vtbl *)off_25158;
  OSMetaClass::instanceConstructed(&AppleLIFSUserClient::gMetaClass);
  return v1;
}

uint64_t AppleLIFSUserClient::methodCreateMapping(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  int v4 = (unsigned int *)a3[6];
  uint64_t v5 = (void *)a3[11];
  *(OSObject_vtbl **)((char *)&v14.__vftable + 4) = 0;
  LODWORD(v14.__vftable) = 0;
  uint64_t v6 = (IOUserClient *)current_task();
  uint64_t v8 = IOUserClient::copyObjectForPortNameInTask(v6, (task *)*v4, &v14.__vftable + 4, v7);
  if (!v8)
  {
    uint32_t v10 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)((char *)&v14.__vftable + 4), &IOWrappedMemoryDescriptor::gMetaClass);
    if (v10)
    {
      uintptr_t v11 = v10;
      MappingInTask = IOWrappedMemoryDescriptor::createMappingInTask((IOWrappedMemoryDescriptor *)v10, (task *)v6, *((void *)v4 + 1), v4[4], *((void *)v4 + 3), *((void *)v4 + 4));
      ((void (*)(OSMetaClassBase *))v11->release_0)(v11);
      if (MappingInTask)
      {
        *uint64_t v5 = ((uint64_t (*)(IOMemoryMap *))MappingInTask->getVirtualAddress)(MappingInTask);
        v5[1] = ((uint64_t (*)(IOMemoryMap *))MappingInTask->getLength)(MappingInTask);
        uint64_t v8 = IOUserClient::copyPortNameForObjectInTask(v6, (task *)MappingInTask, &v14, v13);
        if (v8) {
          ((void (*)(IOMemoryMap *))MappingInTask->release_0)(MappingInTask);
        }
        else {
          v5[2] = LODWORD(v14.__vftable);
        }
      }
      else
      {
        return 3758097096;
      }
    }
    else
    {
      (*(void (**)(void))(**(void **)((char *)&v14.__vftable + 4) + 40))(*(OSObject_vtbl **)((char *)&v14.__vftable + 4));
      return 3758096385;
    }
  }
  return v8;
}

uint64_t AppleLIFSUserClient::methodSetClientDomain(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v5 = (const char *)a3[6];
  IOLog("methodSetClientDomain entered\n", a2);
  if (!*((unsigned char *)this + 284)) {
    return 3758097089;
  }
  strlcpy((char *)this + 236, v5, 0x28uLL);
  return 0;
}

uint64_t AppleLIFSUserClient::methodGenericReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodStatfsReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodCreateReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodMkdirReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodLookupReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodRenameReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodRmdirReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodReaddirReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  int v5 = *(_DWORD *)(v4 + 8);
  if (v5 || (signed int v7 = *(_DWORD *)(v4 + 24), v7 < 1))
  {
    user_addr_t v6 = 0;
    signed int v7 = 0;
  }
  else
  {
    user_addr_t v6 = *(void *)(v4 + 32);
  }
  lifs_request_done(*(void *)v4, v5, 9, (const void *)(v4 + 16), 0x18u, v6, v7);
  return 0;
}

uint64_t AppleLIFSUserClient::methodSymlinkReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodLinkReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodReadlinkReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodRemoveReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodSetattrReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodGetattrReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodGetattrlistbulkReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  int v5 = *(_DWORD *)(v4 + 8);
  if (v5 || (signed int v7 = *(_DWORD *)(v4 + 32), v7 < 1))
  {
    user_addr_t v6 = 0;
    signed int v7 = 0;
  }
  else
  {
    user_addr_t v6 = *(void *)(v4 + 40);
  }
  lifs_request_done(*(void *)v4, v5, 16, (const void *)(v4 + 16), 0x20u, v6, v7);
  return 0;
}

uint64_t AppleLIFSUserClient::methodWriteReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodWriteWrappedReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodReadReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  int v5 = *(_DWORD *)(v4 + 8);
  if (v5 || (signed int v7 = *(_DWORD *)(v4 + 16), v7 < 1))
  {
    user_addr_t v6 = 0;
    signed int v7 = 0;
  }
  else
  {
    user_addr_t v6 = *(void *)(v4 + 24);
  }
  lifs_request_done(*(void *)v4, v5, 19, (const void *)(v4 + 16), 0x10u, v6, v7);
  return 0;
}

uint64_t AppleLIFSUserClient::methodReadWrappedReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodPathconfReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodSetFsAttrReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodGetFsAttrReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  if ((*(_DWORD *)(v4 + 16) & 0xFFFFFFFE) == 2)
  {
    user_addr_t v5 = *(void *)(v4 + 32);
    unsigned int v6 = *(_DWORD *)(v4 + 24);
    *(void *)(v4 + 32) = 0;
  }
  else
  {
    user_addr_t v5 = 0;
    unsigned int v6 = 0;
  }
  lifs_request_done(*(void *)v4, *(_DWORD *)(v4 + 8), 23, (const void *)(v4 + 16), 0x18u, v5, v6);
  return 0;
}

uint64_t AppleLIFSUserClient::methodXattrReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  int v5 = *(_DWORD *)(v4 + 8);
  if (v5)
  {
    user_addr_t v6 = 0;
    LODWORD(v7) = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(v4 + 24);
    if (v7) {
      user_addr_t v6 = *(void *)(v4 + 32);
    }
    else {
      user_addr_t v6 = 0;
    }
  }
  lifs_request_done(*(void *)v4, v5, 24, (const void *)(v4 + 16), 0x18u, v6, v7);
  return 0;
}

uint64_t AppleLIFSUserClient::methodMountReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodOpenKernelFD(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097084;
  int v5 = (int *)a3[6];
  vp = 0;
  int v6 = v5[1];
  if ((v6 & 0x40000000) != 0) {
    unsigned int v7 = v6 & 0xFFFFFFFC;
  }
  else {
    unsigned int v7 = v6 + 1;
  }
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  int v9 = *v5;
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  uint32_t v10 = (char *)lifs_containers_list;
  if (!lifs_containers_list)
  {
LABEL_9:
    IOLog("%s: no container found (pid %d pidversion %d)\n");
LABEL_10:
    lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
    int v11 = 1;
    goto LABEL_11;
  }
  while (*((_DWORD *)v10 + 6) != *((_DWORD *)this + 69) || *((_DWORD *)v10 + 7) != *((_DWORD *)this + 70))
  {
    uint32_t v10 = *(char **)v10;
    if (!v10) {
      goto LABEL_9;
    }
  }
  OSObject v14 = (uint64_t *)(v10 + 16);
  uintptr_t v13 = (uint64_t *)*((void *)v10 + 2);
  if (v13)
  {
    while ((AppleLIFSUserClient *)v13[2] != this || *((_DWORD *)v13 + 19) != v9)
    {
      uintptr_t v13 = (uint64_t *)*v13;
      if (!v13) {
        goto LABEL_20;
      }
    }
    IOLog("%s: duplicate volume found (client %p fd %d) in container %p\n");
    goto LABEL_10;
  }
LABEL_20:
  vfs_context_current();
  int v15 = vnode_getfromfd();
  if (v15)
  {
    IOLog("%s: failed to get device vnode for fd %d, err: %d\n", "methodOpenKernelFD", v9, v15);
    uint64_t v4 = 3758097088;
    goto LABEL_10;
  }
  uint32_t v16 = vnode_getname(0);
  if (!vnode_ischr(0) || !v16 || strncmp(v16, "rdisk", 5uLL))
  {
    vtype v17 = vnode_vtype(0);
    unsigned int v18 = "none";
    if (v16) {
      unsigned int v18 = v16;
    }
    IOLog("%s: invalid vnode type %d name %s for fd %d, err: %d\n", "methodOpenKernelFD", v17, v18, v9, 0);
    lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
    uint64_t v4 = 3758097090;
    int v11 = 1;
    if (!v16) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
  vnode_put(0);
  vp = lifs_open_device(++v16, v7);
  if (!vp)
  {
    uint64_t v4 = 3758097101;
    goto LABEL_34;
  }
  uint64_t v19 = IOMallocTypeImpl();
  *(void *)(v19 + 16) = this;
  *(void *)(v19 + 32) = vp;
  *(_DWORD *)(v19 + 76) = v9;
  *(_DWORD *)(v19 + 80) = v7;
  size_t v20 = (const char *)(v19 + 40);
  strlcpy((char *)(v19 + 40), v16, 0x20uLL);
  lck_mtx_init((lck_mtx_t *)(v19 + 88), (lck_grp_t *)lifs_kext_grp, 0);
  os_ref_init_count_external((os_ref_atomic_t *)(v19 + 84), 0, 1u);
  uint64_t v21 = (vfs_context *)vfs_context_kernel();
  uint64_t result = VNOP_IOCTL(vp, 0x40046418uLL, (caddr_t)(v19 + 72), 0, v21);
  if (result)
  {
    IOLog("%s: failed to get block size for device %s, err: %d\n", "methodOpenKernelFD", v20, result);
LABEL_34:
    int v11 = 1;
LABEL_40:
    lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
LABEL_41:
    vnode_putname(v16);
LABEL_11:
    if (v11)
    {
      if (vp) {
        vnode_put(vp);
      }
    }
    return v4;
  }
  uint64_t v22 = *v14;
  if (!*v14)
  {
    *(void *)uint64_t v19 = 0;
    goto LABEL_39;
  }
  if (*(uint64_t **)(v22 + 8) == v14)
  {
    *(void *)uint64_t v19 = v22;
    *(void *)(v22 + 8) = v19;
LABEL_39:
    *((void *)v10 + 2) = v19;
    *(void *)(v19 + 8) = v14;
    IOLog("%s: add volume %p client %p container %p (fd: %d device: %s fmode: 0x%x blocksize: 0x%x)\n", "methodOpenKernelFD", (const void *)v19, *(const void **)(v19 + 16), v10, *(_DWORD *)(v19 + 76), v20, *(_DWORD *)(v19 + 80), *(_DWORD *)(v19 + 72));
    int v11 = 0;
    uint64_t v4 = 0;
    vp = 0;
    goto LABEL_40;
  }
  __break(0xBFFDu);
  return result;
}

uint64_t AppleLIFSUserClient::methodCloseKernelFD(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097084;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  int v6 = (_DWORD *)a3[6];
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  uint64_t v7 = lifs_containers_list;
  if (lifs_containers_list)
  {
    while (*(_DWORD *)(v7 + 24) != *((_DWORD *)this + 69) || *(_DWORD *)(v7 + 28) != *((_DWORD *)this + 70))
    {
      uint64_t v7 = *(void *)v7;
      if (!v7) {
        goto LABEL_6;
      }
    }
    uint64_t v9 = *(void *)(v7 + 16);
    if (v9)
    {
      while (*(AppleLIFSUserClient **)(v9 + 16) != this || *(_DWORD *)(v9 + 76) != *v6)
      {
        uint64_t v9 = *(void *)v9;
        if (!v9) {
          goto LABEL_14;
        }
      }
      lifs_destroy_iouc_volume((const void *)v7, (uint64_t *)v9);
      uint64_t v4 = 0;
    }
    else
    {
LABEL_14:
      IOLog("%s: no volume found for client %p in container %p with fd %d\n");
    }
  }
  else
  {
LABEL_6:
    IOLog("%s: no container found for pid %d pidversion %d\n");
  }
  lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
  return v4;
}

uint64_t AppleLIFSUserClient::methodCreateVolumePort(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  int v5 = (_DWORD *)a3[11];
  if (!*(_WORD *)((char *)this + 285)) {
    return 3758097089;
  }
  LODWORD(v12.__vftable) = 0;
  int v6 = (IOUserClient *)current_task();
  uint64_t v8 = IOUserClient::copyPortNameForObjectInTask(v6, this, &v12, v7);
  uint64_t v10 = v8;
  int v9 = (int)v12.__vftable;
  if (v8) {
    int v9 = 0;
  }
  *int v5 = v9;
  if (v8) {
    IOLog("%s: copyPortNameForObjectInTask for task %p object %p port %d error %d\n", "methodCreateVolumePort", v6, this, 0, v8);
  }
  return v10;
}

uint64_t AppleLIFSUserClient::methodGetVolumePortReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = a3[6];
  int v5 = *(_DWORD *)(v4 + 8);
  if (!v5)
  {
    *(void *)(v4 + 24) = 0;
    int v6 = (IOUserClient *)current_task();
    int v8 = IOUserClient::copyObjectForPortNameInTask(v6, (task *)*(unsigned int *)(v4 + 16), (int)v4 + 24, v7);
    if (v8)
    {
      IOLog("%s: copyObjectForPortNameInTask for port %d returned %d\n", "methodGetVolumePortReply", *(_DWORD *)(v4 + 16), v8);
      int v5 = 5;
      *(_DWORD *)(v4 + 8) = 5;
    }
    else
    {
      int v5 = *(_DWORD *)(v4 + 8);
    }
  }
  if (lifs_request_done(*(void *)v4, v5, 30, (const void *)(v4 + 16), 0x10u, 0, 0))
  {
    uint64_t v9 = *(void *)(v4 + 24);
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 40))(v9);
    }
  }
  return 0;
}

uint64_t AppleLIFSUserClient::methodBlockmapFileReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodWriteMeta(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_write_meta((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
    if (v8)
    {
      IOLog("%s: write_meta failed with err %d (device: %s buffer: %p offset: 0x%llx length: 0x%lx)\n", "methodWriteMeta", v8, (const char *)(v7 + 40), *(const void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodWriteMetaAsync(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_write_meta_async((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
    if (v8)
    {
      IOLog("%s: write_meta_async failed with err %d (device: %s buffer: %p offset: 0x%llx length: 0x%lx)\n", "methodWriteMetaAsync", v8, (const char *)(v7 + 40), *(const void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodWriteMetaDelayed(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_write_meta_delayed((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
    if (v8)
    {
      IOLog("%s: write_meta_delayed failed with err %d (device: %s buffer: %p offset: 0x%llx length: 0x%lx)\n", "methodWriteMetaDelayed", v8, (const char *)(v7 + 40), *(const void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodWriteMetaSubBlock(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_write_meta_subblock((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40));
    if (v8)
    {
      IOLog("%s: write_meta_subblock failed with err %d (device: %s blockOffset: 0x%llx blockLength: 0x%lx buffer: %p offset: 0x%llx length: 0x%lx)\n", "methodWriteMetaSubBlock", v8, (const char *)(v7 + 40), *(void *)(v5 + 8), *(void *)(v5 + 16), *(const void **)(v5 + 24), *(void *)(v5 + 32), *(void *)(v5 + 40));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodReadMeta(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int meta = lifs_read_meta((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
    if (meta)
    {
      IOLog("%s: read_meta failed with err %d (device: %s buffer %p offset: 0x%llx length: 0x%lx)\n", "methodReadMeta", meta, (const char *)(v7 + 40), *(const void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodReadMetaWithRA(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int meta_with_ra = lifs_read_meta_with_ra((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), *(void *)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24), v5 + 32, *(_DWORD *)(v5 + 160));
    if (meta_with_ra)
    {
      IOLog("%s: read_meta_with_ra failed with err %d (device: %s buffer %p offset: 0x%llx length: 0x%lx ra_list: %p ra_count: %d)\n", "methodReadMetaWithRA", meta_with_ra, (const char *)(v7 + 40), *(const void **)(v5 + 8), *(void *)(v5 + 16), *(void *)(v5 + 24), (const void *)(v5 + 32), *(_DWORD *)(v5 + 160));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodFlushMeta(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = (int *)a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_flush_meta((vnode *)volume_by_fd[4], v5[1]);
    if (v8)
    {
      IOLog("%s: flush_meta failed with err %d (device: %s wait: %d)\n", "methodFlushMeta", v8, (const char *)(v7 + 40), v5[1]);
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodFlushMetaBlocks(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_flush_meta_blocks((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), v5 + 8, *(_DWORD *)(v5 + 136), *(_DWORD *)(v5 + 140));
    if (v8)
    {
      IOLog("%s: flush_meta_blocks failed with err %d (device: %s wait: %d)\n", "methodFlushMetaBlocks", v8, (const char *)(v7 + 40), *(_DWORD *)(v5 + 140));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodClearMetaBlocks(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_clear_meta_blocks((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), v5 + 8, *(_DWORD *)(v5 + 136), *(_DWORD *)(v5 + 140));
    if (v8)
    {
      IOLog("%s: clear_meta_blocks failed with err %d (device: %s wait: %d)\n", "methodClearMetaBlocks", v8, (const char *)(v7 + 40), *(_DWORD *)(v5 + 140));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodPurgeMetaBlocks(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097088;
  if (!*((unsigned char *)this + 286)) {
    return 3758097089;
  }
  uint64_t v5 = a3[6];
  volume_by_fd = lifs_get_volume_by_fd(this, *(_DWORD *)v5);
  if (volume_by_fd)
  {
    uint64_t v7 = (uint64_t)volume_by_fd;
    int v8 = lifs_purge_meta_blocks((vnode *)volume_by_fd[4], *((_DWORD *)volume_by_fd + 18), v5 + 8, *(_DWORD *)(v5 + 136));
    if (v8)
    {
      IOLog("%s: purge_meta_blocks failed with err %d (device: %s)\n", "methodPurgeMetaBlocks", v8, (const char *)(v7 + 40));
      uint64_t v4 = 3758097098;
    }
    else
    {
      uint64_t v4 = 0;
    }
    lifs_volume_rele(v7);
  }
  return v4;
}

uint64_t AppleLIFSUserClient::methodReclaimReply(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void **a3, IOExternalMethodArguments *a4)
{
  return 0;
}

uint64_t AppleLIFSUserClient::methodConfigureUserClient(AppleLIFSUserClient *this, AppleLIFSUserClient *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = (unsigned int *)a3[6];
  anObject = 0;
  if (!*((unsigned char *)this + 284)) {
    return 3758097089;
  }
  uint64_t v5 = (IOUserClient *)current_task();
  uint64_t v7 = IOUserClient::copyObjectForPortNameInTask(v5, (task *)*v4, &anObject, v6);
  if (v7)
  {
    uint64_t v8 = v7;
    IOLog("%s: copyObjectForPortNameInTask for port %d returned %d\n", "methodConfigureUserClient", *v4, v7);
  }
  else
  {
    uint64_t v10 = OSMetaClassBase::safeMetaCast(anObject, &AppleLIFSUserClient::gMetaClass);
    if (v10)
    {
      int v11 = v10;
      int v12 = HIDWORD(v10[34].__vftable);
      int v13 = (int)v11[35].__vftable;
      unsigned int v14 = v4[2];
      if (v12 == v4[1] && v13 == v14)
      {
        unsigned int v16 = v4[3];
        BYTE6(v11[35].__vftable) = v16 != 0;
        if (v16)
        {
          lifs_create_iouc_container(v12, v13);
          int v12 = HIDWORD(v11[34].__vftable);
          int v13 = (int)v11[35].__vftable;
          unsigned int v16 = BYTE6(v11[35].__vftable);
        }
        IOLog("%s: client %p pid: %d pidversion: %d supportKOIO: %d\n", "methodConfigureUserClient", v11, v12, v13, v16);
        uint64_t v8 = 0;
      }
      else
      {
        IOLog("%s: mismatched pid/pidversion, userClient (pid: %d pidversion: %d) configUC (pid: %d pidversion: %d)\n", "methodConfigureUserClient", v12, v13, v4[1], v14);
        uint64_t v8 = 3758097090;
      }
    }
    else
    {
      uint64_t v8 = 3758097084;
    }
  }
  if (anObject) {
    ((void (*)(OSMetaClassBase *))anObject->release_0)(anObject);
  }
  return v8;
}

uint64_t AppleLIFSUserClient::initWithTask(AppleLIFSUserClient *this, task_t task, void *a3, uint64_t a4, OSDictionary *a5)
{
  *((void *)this + 27) = task;
  *((void *)this + 28) = 0;
  *((_DWORD *)this + 58) = 0;
  *((unsigned char *)this + 286) = 0;
  uint64_t v10 = (OSBoolean *)IOUserClient::copyClientEntitlement(task, "com.apple.private.LiveFS.setmachport");
  if (v10)
  {
    *((unsigned char *)this + 284) = v10 == *kOSBooleanTrue;
    ((void (*)(OSBoolean *))v10->release_0)(v10);
  }
  else
  {
    *((unsigned char *)this + 284) = 0;
  }
  int v11 = (OSBoolean *)IOUserClient::copyClientEntitlement(task, "com.apple.developer.fskit.fsmodule");
  if (v11)
  {
    *((unsigned char *)this + 285) = v11 == *kOSBooleanTrue;
    ((void (*)(OSBoolean *))v11->release_0)(v11);
  }
  else
  {
    *((unsigned char *)this + 285) = 0;
  }
  int v12 = (OSBoolean *)IOUserClient::copyClientEntitlement(task, "com.apple.filesystems.kernelOffloadedIOClient");
  if (v12)
  {
    *((unsigned char *)this + 286) = v12 == *kOSBooleanTrue;
    ((void (*)(OSBoolean *))v12->release_0)(v12);
  }
  else
  {
    *((unsigned char *)this + 286) = 0;
  }
  int v13 = current_proc();
  *((_DWORD *)this + 69) = proc_pid(v13);
  current_proc();
  int v14 = proc_pidversion();
  *((_DWORD *)this + 70) = v14;
  int v15 = *((unsigned __int8 *)this + 286);
  if (*((unsigned char *)this + 286))
  {
    lifs_create_iouc_container(*((_DWORD *)this + 69), v14);
    int v14 = *((_DWORD *)this + 70);
    int v15 = *((unsigned __int8 *)this + 286);
  }
  IOLog("ALUC:init(pid: %d pidversion: %d), fskitd_entitled %d fsmodule_entitled %d support_koio %d\n", *((_DWORD *)this + 69), v14, *((unsigned __int8 *)this + 284), *((unsigned __int8 *)this + 285), v15);

  return ((uint64_t (*)(AppleLIFSUserClient *, task_t, void *, uint64_t, OSDictionary *))initWithTask)(this, task, a3, a4, a5);
}

void lifs_create_iouc_container(int a1, int a2)
{
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  uint64_t v4 = lifs_containers_list;
  if (!lifs_containers_list) {
    goto LABEL_7;
  }
  char v5 = 0;
  do
  {
    if (*(_DWORD *)(v4 + 24) == a1) {
      v5 |= *(_DWORD *)(v4 + 28) == a2;
    }
    uint64_t v4 = *(void *)v4;
  }
  while (v4);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    int v6 = (_DWORD *)IOMallocTypeImpl();
    v6[6] = a1;
    v6[7] = a2;
    *((void *)v6 + 2) = 0;
    uint64_t v7 = lifs_containers_list;
    if (lifs_containers_list)
    {
      if (*(uint64_t **)(lifs_containers_list + 8) != &lifs_containers_list) {
        lifs_create_iouc_container();
      }
      *(void *)int v6 = lifs_containers_list;
      *(void *)(v7 + 8) = v6;
    }
    else
    {
      *(void *)int v6 = 0;
    }
    lifs_containers_list = (uint64_t)v6;
    *((void *)v6 + 1) = &lifs_containers_list;
    IOLog("%s: new container %p added (pid %d pidversion %d)\n", "lifs_create_iouc_container", v6, a1, a2);
  }

  lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
}

OSMetaClassBase *AppleLIFSUserClient::start(AppleLIFSUserClient *this, IOService *anObject)
{
  uint64_t result = OSMetaClassBase::safeMetaCast(anObject, &com_apple_filesystems_lifs::gMetaClass);
  *((void *)this + 28) = result;
  if (result)
  {
    if (result)
    {
      (*(void (**)(void, AppleLIFSUserClient *, void, void))(**((void **)this + 28) + 704))(*((void *)this + 28), this, 0, 0);
      (*(void (**)(void))(**((void **)this + 28) + 32))(*((void *)this + 28));
      return (OSMetaClassBase *)(&dword_0 + 1);
    }
  }
  return result;
}

uint64_t AppleLIFSUserClient::stop(AppleLIFSUserClient *this, IOService *a2)
{
  if ((*(unsigned int (**)(void, AppleLIFSUserClient *))(**((void **)this + 28) + 720))(*((void *)this + 28), this))
  {
    (*(void (**)(void, AppleLIFSUserClient *, void))(**((void **)this + 28) + 712))(*((void *)this + 28), this, 0);
  }
  (*(void (**)(void))(**((void **)this + 28) + 40))(*((void *)this + 28));
  *((void *)this + 28) = 0;

  return ((uint64_t (*)(AppleLIFSUserClient *, IOService *))stop)(this, a2);
}

uint64_t AppleLIFSUserClient::clientClose(AppleLIFSUserClient *this)
{
  uint64_t v2 = (IOService *)(*(uint64_t (**)(AppleLIFSUserClient *))(*(void *)this + 880))(this);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v2 != IOService::getResourceService())
    {
      ((void (*)(IOService *, AppleLIFSUserClient *, void))v3->close)(v3, this, 0);
      (*(void (**)(AppleLIFSUserClient *, IOService *))(*(void *)this + 872))(this, v3);
      ResourceService = IOService::getResourceService();
      (*(void (**)(AppleLIFSUserClient *, IOService *))(*(void *)this + 864))(this, ResourceService);
    }
  }
  (*(void (**)(AppleLIFSUserClient *, void))(*(void *)this + 752))(this, 0);
  return 0;
}

uint64_t AppleLIFSUserClient::clientDied(AppleLIFSUserClient *this)
{
  IOLog("ALUC:clientDied(pid: %d pidversion: %d), fskitd_entitled %d fsmodule_entitled %d support_koio %d\n", *((_DWORD *)this + 69), *((_DWORD *)this + 70), *((unsigned __int8 *)this + 284), *((unsigned __int8 *)this + 285), *((unsigned __int8 *)this + 286));
  if (*((unsigned char *)this + 284))
  {
    lifs_set_machport(0, (unsigned char *)this + 236);
    lifs_request_abort_all();
    goto LABEL_18;
  }
  if (*((unsigned char *)this + 286))
  {
    int v2 = *((_DWORD *)this + 69);
    int v3 = *((_DWORD *)this + 70);
    lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
    uint64_t v4 = (void *)lifs_containers_list;
    if (!lifs_containers_list)
    {
LABEL_17:
      lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
      goto LABEL_18;
    }
    while (*((_DWORD *)v4 + 6) != v2 || *((_DWORD *)v4 + 7) != v3)
    {
      uint64_t v4 = (void *)*v4;
      if (!v4) {
        goto LABEL_17;
      }
    }
    char v5 = (uint64_t *)v4[2];
    if (v5)
    {
      do
      {
        uint64_t v6 = *v5;
        lifs_destroy_iouc_volume(v4, v5);
        char v5 = (uint64_t *)v6;
      }
      while (v6);
    }
    IOLog("%s: container %p removed (pid %d pidversion %d)\n", "lifs_destroy_iouc_container", v4, v2, v3);
    uint64_t v7 = *v4;
    if (*v4)
    {
      if (*(void **)(v7 + 8) == v4)
      {
        uint64_t v8 = (void *)v4[1];
        if ((void *)*v8 == v4)
        {
          *(void *)(v7 + 8) = v8;
          uint64_t v9 = (void *)v4[1];
LABEL_16:
          *uint64_t v9 = v7;
          IOFreeTypeImpl();
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v9 = (void *)v4[1];
      if ((void *)*v9 == v4) {
        goto LABEL_16;
      }
    }
    __break(0xBFFDu);
    JUMPOUT(0x13894);
  }
LABEL_18:
  uint64_t v10 = *(uint64_t (**)(AppleLIFSUserClient *))(*(void *)this + 1376);

  return v10(this);
}

uint64_t AppleLIFSUserClient::didTerminate(AppleLIFSUserClient *this, IOService *a2, uint64_t a3, BOOL *a4)
{
  if ((*(unsigned int (**)(void, AppleLIFSUserClient *))(**((void **)this + 28) + 720))(*((void *)this + 28), this)&& !*((_DWORD *)this + 58))
  {
    (*(void (**)(void, AppleLIFSUserClient *, void))(**((void **)this + 28) + 712))(*((void *)this + 28), this, 0);
  }

  return ((uint64_t (*)(AppleLIFSUserClient *, IOService *, uint64_t, BOOL *))didTerminate)(this, a2, a3, a4);
}

uint64_t AppleLIFSUserClient::externalMethod(SInt32 *this, uint64_t a2, IOExternalMethodArguments *a3, IOExternalMethodDispatch *a4, OSObject *a5, void *a6)
{
  if (*((void *)this + 28) && !IOService::isInactive((const IOService *)this))
  {
    if (a2 < 0x2C)
    {
      if (*((unsigned char *)this + 284) || *((unsigned char *)this + 285) || !a2 || *((unsigned char *)this + 286))
      {
        OSIncrementAtomic(this + 58);
        OSDecrementAtomic(this + 58);
        if (IOService::isInactive((const IOService *)this) && !this[58]) {
          (*(void (**)(void, SInt32 *, void))(**((void **)this + 28) + 712))(*((void *)this + 28), this, 0);
        }
      }
      else
      {
        uint64_t v10 = 3758097089;
        IOLog("ALUC:externalMethod: no entitlement for selector %d\n", a2);
      }
    }
    else
    {
      IOLog("ALUC:externalMethod: selector %d >= count %d\n", a2, 44);
      return 3758097095;
    }
  }
  else
  {
    IOLog("ALUC:externalMethod: no provider or not active\n", a2, a3, a4, a5, a6);
    return 3758097113;
  }
  return v10;
}

uint64_t AppleLIFSUserClient::registerNotificationPort(AppleLIFSUserClient *this, ipc_port *a2)
{
  IOLog("registerNotificationPort entered\n");
  if (!*((unsigned char *)this + 284)) {
    return 3758097089;
  }

  return lifs_set_machport((uint64_t)a2, (unsigned char *)this + 236);
}

uint64_t lifs_destroy_iouc_volume(const void *a1, uint64_t *a2)
{
  IOLog("%s: remove volume %p client %p container %p (fd: %d device: %s fmode: 0x%x)\n", "lifs_destroy_iouc_volume", a2, (const void *)a2[2], a1, *((_DWORD *)a2 + 19), (const char *)a2 + 40, *((_DWORD *)a2 + 20));
  lck_mtx_lock((lck_mtx_t *)(a2 + 11));
  if (*((_DWORD *)a2 + 21) >= 2u)
  {
    do
    {
      *((_DWORD *)a2 + 26) |= 1u;
      msleep((char *)a2 + 84, (lck_mtx_t *)(a2 + 11), 16, "lifs_destroy_iouc_volume", 0);
    }
    while (*((_DWORD *)a2 + 21) > 1u);
  }
  lck_mtx_unlock((lck_mtx_t *)(a2 + 11));
  lifs_close_device((vnode *)a2[4], *((_DWORD *)a2 + 20));
  int v3 = (uint64_t *)*a2;
  if (*a2)
  {
    if ((uint64_t *)v3[1] == a2)
    {
      uint64_t v4 = (uint64_t **)a2[1];
      if (*v4 == a2)
      {
        v3[1] = (uint64_t)v4;
        char v5 = (uint64_t **)a2[1];
        goto LABEL_8;
      }
    }
LABEL_11:
    __break(0xBFFDu);
    JUMPOUT(0x13CACLL);
  }
  char v5 = (uint64_t **)a2[1];
  if (*v5 != a2) {
    goto LABEL_11;
  }
LABEL_8:
  *char v5 = v3;
  lck_mtx_destroy((lck_mtx_t *)(a2 + 11), (lck_grp_t *)lifs_kext_grp);

  return IOFreeTypeImpl();
}

uint64_t *lifs_get_volume_by_fd(AppleLIFSUserClient *a1, int a2)
{
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  uint64_t v4 = lifs_containers_list;
  if (!lifs_containers_list)
  {
LABEL_5:
    lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
    IOLog("%s: no container found for pid %d pidversion %d\n");
    return 0;
  }
  while (*(_DWORD *)(v4 + 24) != *((_DWORD *)a1 + 69) || *(_DWORD *)(v4 + 28) != *((_DWORD *)a1 + 70))
  {
    uint64_t v4 = *(void *)v4;
    if (!v4) {
      goto LABEL_5;
    }
  }
  char v5 = *(uint64_t **)(v4 + 16);
  if (!v5)
  {
LABEL_12:
    lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
    IOLog("%s: no volume found for client %p in container %p with fd %d\n");
    return 0;
  }
  while ((AppleLIFSUserClient *)v5[2] != a1 || *((_DWORD *)v5 + 19) != a2)
  {
    char v5 = (uint64_t *)*v5;
    if (!v5) {
      goto LABEL_12;
    }
  }
  lck_mtx_lock((lck_mtx_t *)(v5 + 11));
  os_ref_retain_external((os_ref_atomic_t *)v5 + 21, 0);
  lck_mtx_unlock((lck_mtx_t *)(v5 + 11));
  lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
  return v5;
}

void lifs_volume_rele(uint64_t a1)
{
  int v2 = (lck_mtx_t *)(a1 + 88);
  lck_mtx_lock((lck_mtx_t *)(a1 + 88));
  if (os_ref_release_barrier_external((os_ref_atomic_t *)(a1 + 84), 0) == 1
    && (int v3 = *(_DWORD *)(a1 + 104), (v3 & 1) != 0))
  {
    *(_DWORD *)(a1 + 104) = v3 & 0xFFFFFFFE;
    lck_mtx_unlock(v2);
    wakeup((void *)(a1 + 84));
  }
  else
  {
    lck_mtx_unlock(v2);
  }
}

uint64_t lifs_attach_mount_to_iouc_volume(const void *a1, const OSMetaClassBase *a2, unint64_t *a3)
{
  atomic_store(0, a3);
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  uint64_t v6 = OSMetaClassBase::safeMetaCast(a2, &AppleLIFSUserClient::gMetaClass);
  if (!v6)
  {
    uint64_t v8 = 22;
    if (!a2) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v7 = (void *)lifs_containers_list;
  if (!lifs_containers_list)
  {
    uint64_t v8 = 2;
    if (!a2) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v8 = 2;
  do
  {
    uint64_t v9 = (const char *)(v7 + 2);
    while (1)
    {
      uint64_t v9 = *(const char **)v9;
      if (!v9) {
        break;
      }
      if (*((OSMetaClassBase **)v9 + 2) == v6)
      {
        IOLog("%s: mount %p volume %p client %p device: %s\n", "lifs_attach_mount_to_iouc_volume", a1, v9, v6, v9 + 40);
        uint64_t v8 = 0;
        *((void *)v9 + 3) = a1;
        atomic_store(*((void *)v9 + 4), a3);
        goto LABEL_12;
      }
    }
    uint64_t v7 = (void *)*v7;
  }
  while (v7);
LABEL_12:
  if (a2) {
LABEL_13:
  }
    ((void (*)(const OSMetaClassBase *))a2->release_0)(a2);
LABEL_14:
  lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
  return v8;
}

void lifs_detach_mount_from_iouc_volume(uint64_t a1)
{
  lck_mtx_lock((lck_mtx_t *)&lifs_containers_list_lock);
  int v2 = (void *)lifs_containers_list;
  if (lifs_containers_list)
  {
    do
    {
      int v3 = v2 + 2;
      while (1)
      {
        int v3 = (void *)*v3;
        if (!v3) {
          break;
        }
        if (v3[3] == a1)
        {
          v3[3] = 0;
          goto LABEL_7;
        }
      }
      int v2 = (void *)*v2;
    }
    while (v2);
  }
LABEL_7:

  lck_mtx_unlock((lck_mtx_t *)&lifs_containers_list_lock);
}

IOWrappedMemoryDescriptor *wrapperObjectForBuf(buf *a1)
{
  int v2 = buf_upl(a1);
  char v3 = buf_flags(a1);
  char v4 = v3;
  if ((v3 & 0x40) != 0 || v2)
  {
    if (v3) {
      IOOptionBits v9 = 305;
    }
    else {
      IOOptionBits v9 = 306;
    }
    uint64_t v10 = buf_upl(a1);
    UInt32 v11 = buf_count(a1);
    UInt32 v12 = buf_uploffset(a1);
    int v13 = IOMemoryDescriptor::withOptions(v10, v11, v12, 0, v9, 0);
  }
  else
  {
    uintptr_t v5 = buf_dataptr(a1);
    mach_vm_size_t v6 = buf_count(a1);
    if (v4) {
      IOOptionBits v7 = 1;
    }
    else {
      IOOptionBits v7 = 2;
    }
    if ((v4 & 0x20) != 0)
    {
      aiotask = (task *)get_aiotask();
      if (!aiotask) {
        aiotask = current_task();
      }
    }
    else
    {
      aiotask = kernel_task;
    }
    int v13 = IOMemoryDescriptor::withAddressRange(v5, v6, v7, aiotask);
  }
  int v14 = v13;
  if (!v13) {
    return 0;
  }
  int v15 = (IOWrappedMemoryDescriptor *)IOWrappedMemoryDescriptor::operator new((IOWrappedMemoryDescriptor *)stru_20.segname);
  IOWrappedMemoryDescriptor::IOWrappedMemoryDescriptor(v15);
  char v17 = (*(uint64_t (**)(uint64_t, IOMemoryDescriptor *))(*(void *)v16 + 128))(v16, v14);
  ((void (*)(IOMemoryDescriptor *))v14->release_0)(v14);
  if ((v17 & 1) == 0)
  {
    (*(void (**)(IOWrappedMemoryDescriptor *))(*(void *)v15 + 40))(v15);
    return 0;
  }
  return v15;
}

OSMetaClass *_GLOBAL__sub_I_lifs_iokit_cpp()
{
  OSMetaClass::OSMetaClass(&com_apple_filesystems_lifs::gMetaClass, "com_apple_filesystems_lifs", &IOService::gMetaClass, 0x88u)->__vftable = (OSMetaClass_vtbl *)off_250D0;
  uint64_t result = OSMetaClass::OSMetaClass(&AppleLIFSUserClient::gMetaClass, "AppleLIFSUserClient", &IOUserClient::gMetaClass, 0x120u);
  result->__vftable = (OSMetaClass_vtbl *)off_25740;
  return result;
}

void global destructor keyed to'_a()
{
  OSMetaClass::~OSMetaClass(&AppleLIFSUserClient::gMetaClass);

  OSMetaClass::~OSMetaClass(&com_apple_filesystems_lifs::gMetaClass);
}

uint64_t koio_extent_tree_RB_INSERT_COLOR(uint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  while (1)
  {
    char v3 = (void *)(v2 & 0xFFFFFFFFFFFFFFFELL);
    if ((v2 & 0xFFFFFFFFFFFFFFFELL) == 0) {
      break;
    }
    uint64_t v4 = v3[2];
    if ((v4 & 1) == 0) {
      break;
    }
    uintptr_t v5 = (unint64_t *)(v4 & 0xFFFFFFFFFFFFFFFELL);
    mach_vm_size_t v6 = *(void **)(v4 & 0xFFFFFFFFFFFFFFFELL);
    if (v6 == v3)
    {
      mach_vm_size_t v6 = (void *)v5[1];
      if (v6)
      {
        uint64_t v7 = v6[2];
        if (v7)
        {
LABEL_13:
          v6[2] = v7 & 0xFFFFFFFFFFFFFFFELL;
          v3[2] &= ~1uLL;
          v5[2] |= 1uLL;
          unint64_t v9 = v4 & 0xFFFFFFFFFFFFFFFELL;
          goto LABEL_67;
        }
      }
      uint64_t v10 = (void *)v3[1];
      if (v10 == (void *)a2)
      {
        uint64_t v16 = *(void *)a2;
        v3[1] = *(void *)a2;
        if (v16)
        {
          uint64_t v17 = v2 | 1;
          if ((*(void *)(v16 + 16) & 1) == 0) {
            uint64_t v17 = (uint64_t)v3;
          }
          *(void *)(v16 + 16) = v17;
          uint64_t v18 = v3[2];
          uint64_t v2 = *(void *)(a2 + 16);
        }
        else
        {
          uint64_t v18 = v4;
        }
        *(void *)(a2 + 16) = v18 & 0xFFFFFFFFFFFFFFFELL | v2 & 1;
        if ((v18 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v29 = v3[2];
          uint64_t v30 = (void *)(v29 & 0xFFFFFFFFFFFFFFFELL);
          if (*(void **)(v29 & 0xFFFFFFFFFFFFFFFELL) == v3) {
            *uint64_t v30 = a2;
          }
          else {
            v30[1] = a2;
          }
        }
        else
        {
          *(void *)uint64_t result = a2;
          uint64_t v29 = v3[2];
        }
        *(void *)a2 = v3;
        if (v29) {
          uint64_t v31 = a2 | 1;
        }
        else {
          uint64_t v31 = a2;
        }
        v3[2] = v31;
        unint64_t v12 = *v5;
        uint64_t v10 = *(void **)(*v5 + 8);
        unint64_t v11 = *(void *)(a2 + 16) & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v9 = (unint64_t)v3;
      }
      else
      {
        unint64_t v11 = v4 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v12 = v2 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v9 = a2;
        a2 = (unint64_t)v3;
      }
      *(void *)(a2 + 16) = v11;
      uint64_t v32 = v5[2] | 1;
      v5[2] = v32;
      *uintptr_t v5 = (unint64_t)v10;
      if (v10)
      {
        uint64_t v33 = v4 | 1;
        if ((v10[2] & 1) == 0) {
          uint64_t v33 = (uint64_t)v5;
        }
        int v10[2] = v33;
        uint64_t v32 = v5[2];
      }
      *(void *)(v12 + 16) = v32 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v12 + 16) & 1;
      if ((v32 & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        unint64_t v34 = v5[2];
        long long v35 = (void *)(v34 & 0xFFFFFFFFFFFFFFFELL);
        if (*(unint64_t **)(v34 & 0xFFFFFFFFFFFFFFFELL) == v5) {
          *long long v35 = v12;
        }
        else {
          v35[1] = v12;
        }
      }
      else
      {
        *(void *)uint64_t result = v12;
        unint64_t v34 = v5[2];
      }
      *(void *)(v12 + 8) = v5;
      if (v34) {
        uint64_t v28 = v12 | 1;
      }
      else {
        uint64_t v28 = v12;
      }
    }
    else
    {
      if (v6)
      {
        uint64_t v7 = v6[2];
        if (v7) {
          goto LABEL_13;
        }
      }
      if (*v3 == a2)
      {
        uint64_t v13 = *(void *)(a2 + 8);
        *char v3 = v13;
        if (v13)
        {
          uint64_t v14 = v2 | 1;
          if ((*(void *)(v13 + 16) & 1) == 0) {
            uint64_t v14 = (uint64_t)v3;
          }
          *(void *)(v13 + 16) = v14;
          uint64_t v15 = v3[2];
          uint64_t v2 = *(void *)(a2 + 16);
        }
        else
        {
          uint64_t v15 = v4;
        }
        *(void *)(a2 + 16) = v15 & 0xFFFFFFFFFFFFFFFELL | v2 & 1;
        if ((v15 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v19 = v3[2];
          size_t v20 = (void *)(v19 & 0xFFFFFFFFFFFFFFFELL);
          if (*(void **)(v19 & 0xFFFFFFFFFFFFFFFELL) == v3) {
            *size_t v20 = a2;
          }
          else {
            v20[1] = a2;
          }
        }
        else
        {
          *(void *)uint64_t result = a2;
          uint64_t v19 = v3[2];
        }
        *(void *)(a2 + 8) = v3;
        if (v19) {
          uint64_t v21 = a2 | 1;
        }
        else {
          uint64_t v21 = a2;
        }
        v3[2] = v21;
        unint64_t v8 = *(void *)(a2 + 16) & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v9 = (unint64_t)v3;
      }
      else
      {
        unint64_t v8 = v4 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v9 = a2;
        a2 = (unint64_t)v3;
      }
      *(void *)(a2 + 16) = v8;
      uint64_t v22 = v5[1];
      uint64_t v23 = v5[2] | 1;
      unint64_t v24 = *(void *)v22;
      v5[1] = *(void *)v22;
      v5[2] = v23;
      if (v24)
      {
        uint64_t v25 = v4 | 1;
        if ((*(void *)(v24 + 16) & 1) == 0) {
          uint64_t v25 = (uint64_t)v5;
        }
        *(void *)(v24 + 16) = v25;
        uint64_t v23 = v5[2];
      }
      *(void *)(v22 + 16) = v23 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v22 + 16) & 1;
      if ((v23 & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        unint64_t v26 = v5[2];
        int v27 = (void *)(v26 & 0xFFFFFFFFFFFFFFFELL);
        if (*(unint64_t **)(v26 & 0xFFFFFFFFFFFFFFFELL) == v5) {
          *int v27 = v22;
        }
        else {
          v27[1] = v22;
        }
      }
      else
      {
        *(void *)uint64_t result = v22;
        unint64_t v26 = v5[2];
      }
      *(void *)uint64_t v22 = v5;
      if (v26) {
        uint64_t v28 = v22 | 1;
      }
      else {
        uint64_t v28 = v22;
      }
    }
    v5[2] = v28;
LABEL_67:
    uint64_t v2 = *(void *)(v9 + 16);
    a2 = v9;
  }
  *(void *)(*(void *)result + 16) &= ~1uLL;
  return result;
}

unint64_t *koio_extent_tree_RB_REMOVE_COLOR(unint64_t *result, unint64_t a2, unint64_t a3)
{
  while (1)
  {
    unint64_t v3 = a3;
    a3 = a2;
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 16);
      if (v4) {
        break;
      }
    }
    unint64_t v5 = *result;
    if (v3 == *result) {
      goto LABEL_107;
    }
    uint64_t v6 = *(void *)a2;
    if (*(void *)a2 == v3)
    {
      uint64_t v6 = *(void *)(a2 + 8);
      uint64_t v13 = *(void *)(v6 + 16);
      if (v13)
      {
        *(void *)(v6 + 16) = v13 & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v14 = *(void *)(a2 + 16) | 1;
        uint64_t v15 = *(void **)v6;
        *(void *)(a2 + 8) = *(void *)v6;
        *(void *)(a2 + 16) = v14;
        if (v15)
        {
          if (v15[2]) {
            uint64_t v16 = a2 | 1;
          }
          else {
            uint64_t v16 = a2;
          }
          v15[2] = v16;
          uint64_t v14 = *(void *)(a2 + 16);
        }
        *(void *)(v6 + 16) = v14 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v6 + 16) & 1;
        if ((v14 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v17 = *(void *)(a2 + 16);
          uint64_t v18 = (void *)(v17 & 0xFFFFFFFFFFFFFFFELL);
          if (a2 == *(void *)(v17 & 0xFFFFFFFFFFFFFFFELL))
          {
            *uint64_t v18 = v6;
          }
          else
          {
            v18[1] = v6;
            uint64_t v15 = *(void **)(a2 + 8);
          }
        }
        else
        {
          *uint64_t result = v6;
          uint64_t v17 = *(void *)(a2 + 16);
          unint64_t v5 = v6;
        }
        *(void *)uint64_t v6 = a2;
        if (v17) {
          v6 |= 1uLL;
        }
        *(void *)(a2 + 16) = v6;
        uint64_t v6 = (uint64_t)v15;
      }
      unint64_t v22 = *(void *)v6;
      if (*(void *)v6 && (*(unsigned char *)(v22 + 16) & 1) != 0)
      {
        uint64_t v23 = *(void *)(v6 + 8);
        if (!v23) {
          goto LABEL_60;
        }
LABEL_58:
        if ((*(unsigned char *)(v23 + 16) & 1) == 0)
        {
          if (v22) {
LABEL_60:
          }
            *(void *)(v22 + 16) &= ~1uLL;
          uint64_t v30 = *(void *)(v6 + 16) | 1;
          *(void *)(v6 + 16) = v30;
          uint64_t v31 = *(void *)(v22 + 8);
          *(void *)uint64_t v6 = v31;
          if (v31)
          {
            if (*(void *)(v31 + 16)) {
              uint64_t v32 = v6 | 1;
            }
            else {
              uint64_t v32 = v6;
            }
            *(void *)(v31 + 16) = v32;
            uint64_t v30 = *(void *)(v6 + 16);
          }
          *(void *)(v22 + 16) = v30 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v22 + 16) & 1;
          if ((v30 & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            uint64_t v33 = *(void *)(v6 + 16);
            unint64_t v34 = (void *)(v33 & 0xFFFFFFFFFFFFFFFELL);
            if (v6 == *(void *)(v33 & 0xFFFFFFFFFFFFFFFELL)) {
              *unint64_t v34 = v22;
            }
            else {
              v34[1] = v22;
            }
          }
          else
          {
            *uint64_t result = v22;
            uint64_t v33 = *(void *)(v6 + 16);
            unint64_t v5 = v22;
          }
          *(void *)(v22 + 8) = v6;
          if (v33) {
            v22 |= 1uLL;
          }
          *(void *)(v6 + 16) = v22;
          uint64_t v6 = *(void *)(a2 + 8);
          uint64_t v23 = *(void *)(v6 + 8);
        }
        *(void *)(v6 + 16) = *(void *)(v6 + 16) & 0xFFFFFFFFFFFFFFFELL | *(void *)(a2 + 16) & 1;
        *(void *)(a2 + 16) &= ~1uLL;
        if (v23) {
          *(void *)(v23 + 16) &= ~1uLL;
        }
        long long v40 = *(void **)v6;
        *(void *)(a2 + 8) = *(void *)v6;
        if (v40)
        {
          if (v40[2]) {
            uint64_t v41 = a2 | 1;
          }
          else {
            uint64_t v41 = a2;
          }
          v40[2] = v41;
        }
        uint64_t v42 = *(void *)(a2 + 16);
        *(void *)(v6 + 16) = v42 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v6 + 16) & 1;
        if ((v42 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v38 = *(void *)(a2 + 16);
          BOOL v43 = (void *)(v38 & 0xFFFFFFFFFFFFFFFELL);
          if (a2 == *(void *)(v38 & 0xFFFFFFFFFFFFFFFELL)) {
            *BOOL v43 = v6;
          }
          else {
            v43[1] = v6;
          }
          uint64_t v29 = v6;
        }
        else
        {
          *uint64_t result = v6;
          uint64_t v38 = *(void *)(a2 + 16);
          uint64_t v29 = v6;
          unint64_t v5 = v6;
        }
        goto LABEL_104;
      }
      uint64_t v23 = *(void *)(v6 + 8);
      if (v23 && (*(unsigned char *)(v23 + 16) & 1) != 0) {
        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v7 = *(void *)(v6 + 16);
      if (v7)
      {
        *(void *)(v6 + 16) = v7 & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v8 = *(void *)(a2 + 16) | 1;
        *(void *)(a2 + 16) = v8;
        unint64_t v9 = *(void **)(v6 + 8);
        *(void *)a2 = v9;
        if (v9)
        {
          if (v9[2]) {
            uint64_t v10 = a2 | 1;
          }
          else {
            uint64_t v10 = a2;
          }
          int v9[2] = v10;
          uint64_t v8 = *(void *)(a2 + 16);
        }
        *(void *)(v6 + 16) = v8 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v6 + 16) & 1;
        if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v11 = *(void *)(a2 + 16);
          unint64_t v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
          if (a2 == *(void *)(v11 & 0xFFFFFFFFFFFFFFFELL))
          {
            *unint64_t v12 = v6;
            unint64_t v9 = *(void **)a2;
          }
          else
          {
            v12[1] = v6;
          }
        }
        else
        {
          *uint64_t result = v6;
          uint64_t v11 = *(void *)(a2 + 16);
          unint64_t v5 = v6;
        }
        *(void *)(v6 + 8) = a2;
        if (v11) {
          v6 |= 1uLL;
        }
        *(void *)(a2 + 16) = v6;
        uint64_t v6 = (uint64_t)v9;
      }
      uint64_t v19 = *(void **)v6;
      if (*(void *)v6)
      {
        uint64_t v20 = v19[2];
        if (v20) {
          goto LABEL_45;
        }
      }
      unint64_t v21 = *(void *)(v6 + 8);
      if (v21 && (*(unsigned char *)(v21 + 16) & 1) != 0)
      {
        if (!v19) {
          goto LABEL_47;
        }
        uint64_t v20 = v19[2];
LABEL_45:
        if (v20)
        {
          uint64_t v29 = v6;
        }
        else
        {
          unint64_t v21 = *(void *)(v6 + 8);
          if (v21) {
LABEL_47:
          }
            *(void *)(v21 + 16) &= ~1uLL;
          uint64_t v24 = *(void *)(v6 + 16) | 1;
          uint64_t v25 = *(void *)v21;
          *(void *)(v6 + 8) = *(void *)v21;
          *(void *)(v6 + 16) = v24;
          if (v25)
          {
            if (*(void *)(v25 + 16)) {
              uint64_t v26 = v6 | 1;
            }
            else {
              uint64_t v26 = v6;
            }
            *(void *)(v25 + 16) = v26;
            uint64_t v24 = *(void *)(v6 + 16);
          }
          *(void *)(v21 + 16) = v24 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v21 + 16) & 1;
          if ((v24 & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            uint64_t v27 = *(void *)(v6 + 16);
            uint64_t v28 = (void *)(v27 & 0xFFFFFFFFFFFFFFFELL);
            if (v6 == *(void *)(v27 & 0xFFFFFFFFFFFFFFFELL)) {
              *uint64_t v28 = v21;
            }
            else {
              v28[1] = v21;
            }
          }
          else
          {
            *uint64_t result = v21;
            uint64_t v27 = *(void *)(v6 + 16);
            unint64_t v5 = v21;
          }
          *(void *)unint64_t v21 = v6;
          if (v27) {
            v21 |= 1uLL;
          }
          *(void *)(v6 + 16) = v21;
          uint64_t v29 = *(void *)a2;
          uint64_t v19 = **(void ***)a2;
        }
        *(void *)(v29 + 16) = *(void *)(v29 + 16) & 0xFFFFFFFFFFFFFFFELL | *(void *)(a2 + 16) & 1;
        *(void *)(a2 + 16) &= ~1uLL;
        if (v19) {
          v19[2] &= ~1uLL;
        }
        uint64_t v6 = v29 + 8;
        uint64_t v35 = *(void *)(v29 + 8);
        *(void *)a2 = v35;
        if (v35)
        {
          if (*(void *)(v35 + 16)) {
            uint64_t v36 = a2 | 1;
          }
          else {
            uint64_t v36 = a2;
          }
          *(void *)(v35 + 16) = v36;
        }
        uint64_t v37 = *(void *)(a2 + 16);
        *(void *)(v29 + 16) = v37 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v29 + 16) & 1;
        if ((v37 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v38 = *(void *)(a2 + 16);
          long long v39 = (void *)(v38 & 0xFFFFFFFFFFFFFFFELL);
          if (a2 == *(void *)(v38 & 0xFFFFFFFFFFFFFFFELL)) {
            *long long v39 = v29;
          }
          else {
            v39[1] = v29;
          }
        }
        else
        {
          *uint64_t result = v29;
          uint64_t v38 = *(void *)(a2 + 16);
          unint64_t v5 = v29;
        }
LABEL_104:
        *(void *)uint64_t v6 = a2;
        uint64_t v44 = v29 | 1;
        if ((v38 & 1) == 0) {
          uint64_t v44 = v29;
        }
        *(void *)(a2 + 16) = v44;
        unint64_t v3 = v5;
LABEL_107:
        if (!v3) {
          return result;
        }
        uint64_t v4 = *(void *)(v3 + 16);
        break;
      }
    }
    *(void *)(v6 + 16) |= 1uLL;
    a2 = *(void *)(a2 + 16) & 0xFFFFFFFFFFFFFFFELL;
  }
  *(void *)(v3 + 16) = v4 & 0xFFFFFFFFFFFFFFFELL;
  return result;
}

void *koio_extent_tree_RB_REMOVE(unint64_t *a1, void *a2)
{
  uint64_t v4 = (void *)*a2;
  unint64_t v3 = (void *)a2[1];
  if (!*a2)
  {
    unint64_t v11 = a2[2] & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v18 = a2[2] & 1;
    if (!v3)
    {
      if (!v11)
      {
LABEL_37:
        uint64_t v19 = a1;
        goto LABEL_38;
      }
LABEL_29:
      uint64_t v19 = (void *)(v11 + 8);
      if (*(void **)v11 == a2) {
        uint64_t v19 = (void *)v11;
      }
LABEL_38:
      *uint64_t v19 = v3;
      if (v18) {
        return a2;
      }
LABEL_39:
      koio_extent_tree_RB_REMOVE_COLOR(a1, v11, (unint64_t)v3);
      return a2;
    }
LABEL_33:
    if (v3[2]) {
      uint64_t v20 = v11 | 1;
    }
    else {
      uint64_t v20 = v11;
    }
    v3[2] = v20;
    if (!v11) {
      goto LABEL_37;
    }
    goto LABEL_29;
  }
  if (!v3)
  {
    unint64_t v11 = a2[2] & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v18 = a2[2] & 1;
    unint64_t v3 = v4;
    goto LABEL_33;
  }
  do
  {
    unint64_t v5 = (unint64_t)v3;
    unint64_t v3 = (void *)*v3;
  }
  while (v3);
  unint64_t v3 = *(void **)(v5 + 8);
  uint64_t v6 = *(void *)(v5 + 16);
  uint64_t v7 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
  if (v3)
  {
    if (v3[2]) {
      unint64_t v8 = v6 | 1;
    }
    else {
      unint64_t v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
    v3[2] = v8;
  }
  unint64_t v9 = a1;
  if (v7)
  {
    unint64_t v9 = v7 + 1;
    if (*v7 == v5) {
      unint64_t v9 = (void *)(v6 & 0xFFFFFFFFFFFFFFFELL);
    }
  }
  int v10 = v6 & 1;
  *unint64_t v9 = v3;
  if ((void *)(*(void *)(v5 + 16) & 0xFFFFFFFFFFFFFFFELL) == a2) {
    unint64_t v11 = v5;
  }
  else {
    unint64_t v11 = (unint64_t)v7;
  }
  uint64_t v12 = a2[2];
  *(_OWORD *)unint64_t v5 = *(_OWORD *)a2;
  *(void *)(v5 + 16) = v12;
  uint64_t v13 = a1;
  uint64_t v14 = (void *)(a2[2] & 0xFFFFFFFFFFFFFFFELL);
  if (v14)
  {
    uint64_t v13 = v14 + 1;
    if ((void *)*v14 == a2) {
      uint64_t v13 = (void *)(a2[2] & 0xFFFFFFFFFFFFFFFELL);
    }
  }
  *uint64_t v13 = v5;
  uint64_t v15 = a2[1];
  if (*(void *)(*a2 + 16)) {
    uint64_t v16 = v5 | 1;
  }
  else {
    uint64_t v16 = v5;
  }
  *(void *)(*a2 + 16) = v16;
  if (v15)
  {
    if (*(void *)(v15 + 16)) {
      v5 |= 1uLL;
    }
    *(void *)(v15 + 16) = v5;
  }
  if (!v10) {
    goto LABEL_39;
  }
  return a2;
}

unint64_t koio_extent_tree_RB_INSERT(void *a1, void *a2)
{
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    unint64_t v3 = a2[5];
    while (1)
    {
      unint64_t v4 = (unint64_t)v2;
      unint64_t v5 = v2[5];
      uint64_t v6 = v2[6];
      if (v3 < v5 && a2[6] + v3 <= v5)
      {
        int v10 = -1;
        unint64_t v9 = (void *)v4;
      }
      else
      {
        unint64_t v7 = v6 + v5;
        if (v5 >= v3 || v7 > v3) {
          return v4;
        }
        unint64_t v9 = (void *)(v4 + 8);
        int v10 = 1;
      }
      uint64_t v2 = (void *)*v9;
      if (!v2) {
        goto LABEL_14;
      }
    }
  }
  unint64_t v4 = 0;
  int v10 = 0;
LABEL_14:
  *a2 = 0;
  a2[1] = 0;
  a2[2] = v4 | 1;
  unint64_t v11 = (void *)(v4 + 8);
  if (v10 < 0) {
    unint64_t v11 = (void *)v4;
  }
  if (v4) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = a1;
  }
  *uint64_t v12 = a2;
  koio_extent_tree_RB_INSERT_COLOR((uint64_t)a1, (unint64_t)a2);
  return 0;
}

void *koio_extent_tree_RB_FIND(void *a1, uint64_t a2)
{
  uint64_t result = (void *)*a1;
  if (result)
  {
    unint64_t v3 = *(void *)(a2 + 40);
    do
    {
      unint64_t v4 = result[5];
      if (v3 >= v4 || *(void *)(a2 + 48) + v3 > v4)
      {
        if (v4 >= v3 || result[6] + v4 > v3) {
          return result;
        }
        ++result;
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *koio_extent_tree_RB_NEXT(unint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 8);
  if (v1)
  {
    do
    {
      uint64_t result = v1;
      uint64_t v1 = (void *)*v1;
    }
    while (v1);
  }
  else
  {
    unint64_t v3 = a1;
    uint64_t result = (void *)(*(void *)(a1 + 16) & 0xFFFFFFFFFFFFFFFELL);
    if (!result || *result != v3)
    {
      do
      {
        uint64_t result = (void *)(*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL);
        if (!result) {
          break;
        }
        BOOL v4 = v3 == result[1];
        unint64_t v3 = *(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL;
      }
      while (v4);
    }
  }
  return result;
}

void *koio_extent_tree_RB_PREV(void *a1)
{
  uint64_t v1 = (void *)*a1;
  if (*a1)
  {
    do
    {
      uint64_t result = v1;
      uint64_t v1 = (void *)v1[1];
    }
    while (v1);
  }
  else
  {
    unint64_t v3 = (unint64_t)a1;
    uint64_t result = (void *)(a1[2] & 0xFFFFFFFFFFFFFFFELL);
    if (!result || result[1] != v3)
    {
      do
      {
        uint64_t result = (void *)(*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL);
        if (!result) {
          break;
        }
        BOOL v4 = v3 == *result;
        unint64_t v3 = *(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL;
      }
      while (v4);
    }
  }
  return result;
}

void *lifs_init_extent_tree(void *a1)
{
  uint64_t result = (void *)kalloc_type_impl();
  *uint64_t result = 0;
  *a1 = result;
  return result;
}

uint64_t lifs_deinit_extent_tree()
{
  return kfree_type_impl();
}

uint64_t lifs_add_extent(uint64_t a1, unint64_t a2, unsigned int a3, int *a4)
{
  unint64_t v7 = a3;
  lifs_remove_overlapping_extents(a1, a2, a2 + a3);
  uint64_t v8 = kalloc_type_impl();
  *(void *)(v8 + 40) = a2;
  *(void *)(v8 + 48) = v7;
  int v9 = *a4;
  *(_DWORD *)(v8 + 56) = *a4 & 0xFFFFFF | (*(unsigned __int8 *)(v8 + 59) << 24);
  *(_DWORD *)(v8 + 56) = v9 & 0xFFFFFF | (*((unsigned __int8 *)a4 + 3) << 24);
  *(void *)(v8 + 32) = *((void *)a4 + 1);
  uint64_t result = koio_extent_tree_RB_INSERT((void *)a1, (void *)v8);
  uint64_t v11 = *(unsigned int *)(a1 + 8) + 1;
  uint64_t v12 = v11 << 31 >> 31;
  *(_DWORD *)(a1 + 8) = v11;
  if (v12 != v11 || v12 < 0) {
    lifs_add_extent_cold_1();
  }
  if (v11 >= 2)
  {
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    unint64_t v25 = a2;
    long long v26 = v7;
    uint64_t result = (uint64_t)koio_extent_tree_RB_FIND((void *)a1, (uint64_t)v23);
    if (result)
    {
      unint64_t v13 = result;
      uint64_t v14 = koio_extent_tree_RB_PREV((void *)result);
      uint64_t v15 = v14;
      BOOL v17 = v14
         && *((_DWORD *)v14 + 14) == *(_DWORD *)(v13 + 56)
         && (uint64_t v16 = v14[6], v16 + v14[5] == *(void *)(v13 + 40))
         && v14[4] + v16 == *(void *)(v13 + 32);
      uint64_t result = (uint64_t)koio_extent_tree_RB_NEXT(v13);
      uint64_t v18 = (void *)result;
      BOOL v20 = result
         && *(_DWORD *)(result + 56) == *(_DWORD *)(v13 + 56)
         && (uint64_t v19 = *(void *)(v13 + 48), *(void *)(result + 40) == v19 + *(void *)(v13 + 40))
         && *(void *)(result + 32) == *(void *)(v13 + 32) + v19;
      int v21 = !v17;
      if (v20 || (v21 & 1) != 0)
      {
        int v22 = !v20;
        if ((v17 | v22))
        {
          if ((v21 | v22)) {
            return result;
          }
          v15[6] += *(void *)(result + 48) + *(void *)(v13 + 48);
          koio_extent_tree_RB_REMOVE((unint64_t *)a1, (void *)v13);
          --*(_DWORD *)(a1 + 8);
          kfree_type_impl();
          koio_extent_tree_RB_REMOVE((unint64_t *)a1, v18);
          --*(_DWORD *)(a1 + 8);
        }
        else
        {
          *(void *)(v13 + 48) += *(void *)(result + 48);
          koio_extent_tree_RB_REMOVE((unint64_t *)a1, (void *)result);
          --*(_DWORD *)(a1 + 8);
        }
      }
      else
      {
        v15[6] += *(void *)(v13 + 48);
        koio_extent_tree_RB_REMOVE((unint64_t *)a1, (void *)v13);
        --*(_DWORD *)(a1 + 8);
      }
      return kfree_type_impl();
    }
  }
  return result;
}

unint64_t lifs_remove_overlapping_extents(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t result = (unint64_t)lifs_find_first_overlapping_extent((void *)a1, a2, (int)a3 - (int)a2);
  if (result)
  {
    unint64_t v7 = 0;
    while (*(void *)(result + 40) < a3)
    {
      unint64_t v8 = result;
      *(void *)(result + 24) = v7;
      unint64_t result = (unint64_t)koio_extent_tree_RB_NEXT(result);
      unint64_t v7 = v8;
      if (!result)
      {
        while (1)
        {
LABEL_7:
          unint64_t v9 = v8;
          unint64_t v8 = *(void *)(v8 + 24);
          unint64_t v10 = *(void *)(v9 + 40);
          unint64_t v11 = *(void *)(v9 + 48) + v10;
          if (a2 <= v10)
          {
            if (v11 > a3) {
              goto LABEL_16;
            }
            koio_extent_tree_RB_REMOVE((unint64_t *)a1, (void *)v9);
            --*(_DWORD *)(a1 + 8);
            unint64_t result = kfree_type_impl();
          }
          else if (v11 <= a3)
          {
            if (v11 <= a2)
            {
LABEL_16:
              if (a2 <= v10 && a3 > v10)
              {
                unint64_t v19 = a3 - v10;
                koio_extent_tree_RB_REMOVE((unint64_t *)a1, (void *)v9);
                uint64_t v20 = *(void *)(v9 + 40);
                uint64_t v21 = *(void *)(v9 + 32);
                *(void *)(v9 + 48) += v20 - a3;
                *(void *)(v9 + 32) = v21 + v19;
                *(void *)(v9 + 40) = v20 + v19;
                unint64_t result = koio_extent_tree_RB_INSERT((void *)a1, (void *)v9);
              }
              goto LABEL_22;
            }
            *(void *)(v9 + 48) = a2 - v10;
          }
          else
          {
            uint64_t v12 = kalloc_type_impl();
            *(void *)(v12 + 40) = a3;
            unint64_t v13 = *(void *)(v9 + 40) - a3 + *(void *)(v9 + 48);
            *(void *)(v12 + 48) = v13;
            int v14 = *(_DWORD *)(v9 + 56);
            *(_DWORD *)(v12 + 56) = v14 & 0xFFFFFF | (*(unsigned __int8 *)(v12 + 59) << 24);
            *(_DWORD *)(v12 + 56) = v14 & 0xFFFFFF | (*(unsigned __int8 *)(v9 + 59) << 24);
            uint64_t v15 = *(void *)(v9 + 40);
            *(void *)(v12 + 32) = *(void *)(v9 + 32) - v13 + *(void *)(v9 + 48);
            *(void *)(v9 + 48) = a2 - v15;
            unint64_t result = koio_extent_tree_RB_INSERT((void *)a1, (void *)v12);
            uint64_t v16 = *(unsigned int *)(a1 + 8) + 1;
            uint64_t v17 = v16 << 31 >> 31;
            *(_DWORD *)(a1 + 8) = v16;
            if (v17 != v16 || v17 < 0) {
              lifs_remove_overlapping_extents_cold_1();
            }
          }
LABEL_22:
          if (!v8) {
            return result;
          }
        }
      }
    }
    unint64_t v8 = v7;
    if (v7) {
      goto LABEL_7;
    }
  }
  return result;
}

unint64_t lifs_remove_extent(uint64_t a1, unint64_t a2, unsigned int a3)
{
  return lifs_remove_overlapping_extents(a1, a2, a2 + a3);
}

void *lifs_get_extent(void *a1, unint64_t a2, unsigned int a3)
{
  return lifs_find_first_overlapping_extent(a1, a2, a3);
}

void *lifs_find_first_overlapping_extent(void *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  unint64_t v11 = a2;
  long long v12 = a3;
  BOOL v4 = koio_extent_tree_RB_FIND(a1, (uint64_t)v9);
  if (!v4) {
    return 0;
  }
  unint64_t v5 = v4;
  if (v4[5] <= a2) {
    return v5;
  }
  uint64_t v6 = koio_extent_tree_RB_PREV(v4);
  if (v5[6] + v5[5] <= a2) {
    return v5;
  }
  do
  {
    unint64_t v7 = v5;
    if (!v6) {
      break;
    }
    unint64_t v5 = v6;
    uint64_t v6 = koio_extent_tree_RB_PREV(v6);
  }
  while (v5[6] + v5[5] > a2);
  return v7;
}

uint64_t lifs_purge_extents(uint64_t result)
{
  if (*(_DWORD *)(result + 8))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)result;
    if (*(void *)result)
    {
      do
      {
        unint64_t v3 = v2;
        uint64_t v2 = (void *)*v2;
      }
      while (v2);
      BOOL v4 = 0;
      do
      {
        unint64_t v5 = v4;
        BOOL v4 = v3;
        v3[3] = v5;
        unint64_t v3 = koio_extent_tree_RB_NEXT((unint64_t)v3);
      }
      while (v3);
      *(void *)uint64_t v1 = 0;
      *(_DWORD *)(v1 + 8) = 0;
      uint64_t v6 = v4;
      do
      {
        unint64_t v7 = (void *)v4[3];
        unint64_t v8 = v7;
        if (v6 != v4)
        {
          unint64_t v9 = v6;
          do
          {
            uint64_t v10 = v9;
            unint64_t v9 = (void *)v9[3];
          }
          while (v9 != v4);
          v10[3] = v7;
          unint64_t v8 = v6;
        }
        unint64_t result = kfree_type_impl();
        BOOL v4 = v7;
        uint64_t v6 = v8;
      }
      while (v7);
    }
    else
    {
      *(void *)unint64_t result = 0;
      *(_DWORD *)(result + 8) = 0;
    }
  }
  return result;
}

uint64_t lifs_mount(mount *arg1, uint64_t a2, const void *a3)
{
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140005u, (uintptr_t)arg1, 0, 0, 0);
  }
  uint64_t v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long data = 0u;
  long long __dst = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  memset(v49, 0, sizeof(v49));
  uint64_t v50 = 0;
  if (!arg1)
  {
    uint64_t v12 = 22;
    goto LABEL_41;
  }
  unint64_t v5 = (char *)kalloc_type_impl();
  if (vfs_iskernelmount())
  {
    memmove(v5, a3, 0x8A8uLL);
  }
  else
  {
    uint64_t v16 = copyin((const user_addr_t)a3, v5, 0x8A8uLL);
    if (v16)
    {
      uint64_t v12 = v16;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to copy mount arguments");
      if (!v5)
      {
LABEL_41:
        if ((kdebug_enable & 0xFFFFFFF7) != 0) {
          kernel_debug_filtered(0x3140006u, (uintptr_t)arg1, (int)v12, 0, 0);
        }
        return v12;
      }
LABEL_40:
      kfree_type_impl();
      goto LABEL_41;
    }
  }
  *(void *)&long long data = arg1;
  DWORD2(data) = 2;
  *(void *)&long long v40 = "lifs";
  *((void *)&v40 + 1) = 0;
  *((void *)&v41 + 1) = lifs_vnodeop_p;
  *(void *)&long long v42 = 1;
  DWORD2(v42) = 0;
  long long v43 = 0uLL;
  LODWORD(v44) = 4;
  uint64_t v6 = (void *)kalloc_type_impl();
  uint64_t v7 = kalloc_type_impl();
  *(_OWORD *)(v7 + 136) = 0u;
  *(_OWORD *)(v7 + 152) = 0u;
  *(_OWORD *)(v7 + 168) = 0u;
  *(_OWORD *)(v7 + 184) = 0u;
  *(void *)(v7 + 200) = v6;
  lck_mtx_init((lck_mtx_t *)(v7 + 112), (lck_grp_t *)lifs_node_grp, 0);
  lck_rw_init((lck_rw_t *)(v7 + 504), (lck_grp_t *)lifs_node_grp, 0);
  lck_rw_init((lck_rw_t *)(v7 + 576), (lck_grp_t *)lifs_node_grp, 0);
  lck_rw_init((lck_rw_t *)(v7 + 824), (lck_grp_t *)lifs_node_grp, 0);
  lck_rw_init((lck_rw_t *)(v7 + 72), (lck_grp_t *)lifs_node_grp, 0);
  *(void *)&long long v41 = v7;
  v6[56] = arg1;
  *((_DWORD *)v6 + 6) = *(_DWORD *)v5;
  v6[4] = 0;
  *((_DWORD *)v6 + 138) = 1000000 * *((_DWORD *)v5 + 4);
  atomic_store(0, (unsigned int *)v6 + 182);
  int v8 = *((_DWORD *)v5 + 551);
  *((_DWORD *)v6 + 136) = v8;
  int v9 = *((_DWORD *)v5 + 552);
  *((_DWORD *)v6 + 137) = v9;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s:uid:%u:gid:%u", "lifs_mount", v8, v9);
  uint64_t v10 = throttle_info_create();
  v6[72] = v10;
  if (!v10)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "throttle_info_create() failed");
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    uint64_t v12 = 12;
    goto LABEL_14;
  }
  v6[73] = 0;
  v6[74] = v6 + 73;
  v6[75] = 0;
  v6[76] = v6 + 75;
  v6[77] = 0;
  v6[78] = v6 + 77;
  v6[79] = 0;
  v6[80] = v6 + 79;
  lck_mtx_init((lck_mtx_t *)(v6 + 83), (lck_grp_t *)lifs_mount_grp, 0);
  lck_mtx_init((lck_mtx_t *)(v6 + 85), (lck_grp_t *)lifs_mount_grp, 0);
  lck_mtx_init((lck_mtx_t *)(v6 + 87), (lck_grp_t *)lifs_mount_grp, 0);
  lck_mtx_init((lck_mtx_t *)(v6 + 89), (lck_grp_t *)lifs_mount_grp, 0);
  uint64_t v11 = lifs_req_thread_start((uint64_t)v6);
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    goto LABEL_14;
  }
  int v15 = 1;
  thread_call_t v24 = thread_call_allocate_with_options((thread_call_func_t)lifs_sync_call, v6, THREAD_CALL_PRIORITY_KERNEL, 1u);
  v6[105] = v24;
  if (!v24)
  {
    int v13 = 0;
    int v14 = 0;
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  size_t v25 = *((unsigned int *)v5 + 550);
  if (v25)
  {
    if (v25 >= 0x41)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid file handle size");
      int v13 = 0;
      int v14 = 0;
      uint64_t v12 = 22;
      goto LABEL_14;
    }
    memmove(&__dst, v5 + 2136, v25);
  }
  lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
  *uint64_t v6 = 0;
  uint64_t v27 = (void *)qword_20658;
  v6[1] = qword_20658;
  *uint64_t v27 = v6;
  qword_20658 = (uint64_t)v6;
  lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
  uint64_t v28 = lifs_mount_request((uint64_t)v6, v5 + 88, v5 + 1112, *(_DWORD *)v5, *((_DWORD *)v5 + 550), &__dst, (uint64_t)&__dst);
  if (v28)
  {
    uint64_t v12 = v28;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got error during mount request: %d", v28);
    int v14 = 0;
LABEL_54:
    int v13 = 1;
    int v15 = 1;
    goto LABEL_14;
  }
  long long v29 = __dst;
  long long v30 = v46;
  long long v31 = v48;
  *(_OWORD *)(v7 + 32) = v47;
  *(_OWORD *)(v7 + 48) = v31;
  *(_OWORD *)uint64_t v7 = v29;
  *(_OWORD *)(v7 + 16) = v30;
  update_lnode_attr(v7, (uint64_t)v49);
  *(void *)(v7 + 472) = 0;
  *(void *)(v7 + 480) = v7 + 472;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140004u, (uintptr_t)arg1, (uintptr_t)v6, __dst, 0);
  }
  uint64_t v32 = vnode_create(0, 0x58u, &data, (vnode_t *)v6 + 2);
  if (v32)
  {
    uint64_t v12 = v32;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create root vnode");
    int v14 = 0;
    goto LABEL_54;
  }
  uint64_t v33 = (vnode *)v6[2];
  *(void *)(v7 + 224) = v33;
  *(_DWORD *)(v7 + 448) = vnode_vid(v33);
  lck_mtx_init((lck_mtx_t *)(v6 + 12), (lck_grp_t *)lifs_mount_grp, 0);
  lck_mtx_init((lck_mtx_t *)(v6 + 14), (lck_grp_t *)lifs_mount_grp, 0);
  lck_rw_init((lck_rw_t *)(v6 + 16), (lck_grp_t *)lifs_rw_grp, 0);
  v6[70] = hashinit(1024, 80, v6 + 71);
  v6[18] = 0;
  v6[19] = 0;
  vfs_setowner();
  unint64_t v34 = vfs_statfs(arg1);
  init_statfs((uint64_t)v34, v5 + 88, v5 + 1112);
  v34->f_owner = *((_DWORD *)v6 + 136);
  lifs_mntfromname((uint64_t)v6, (long long *)v7);
  vfs_setfsprivate(arg1, v6);
  vfs_setfskit();
  uint64_t mountpoint = lifs_query_mountpoint((uint64_t)v6, (long long *)v7);
  if (mountpoint)
  {
    uint64_t v12 = mountpoint;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to query mountpoint");
    int v14 = 0;
    goto LABEL_54;
  }
  lifs_setup_fsid((uint64_t)v6, (uint64_t)v34);
  if ((v6[4] & 8) != 0)
  {
    uint64_t v36 = lifs_endio_thread_start((uint64_t)v6);
    if (!v36)
    {
      int v13 = 1;
      thread_call_t v37 = thread_call_allocate_with_options((thread_call_func_t)lifs_meta_sync_call, v6, THREAD_CALL_PRIORITY_KERNEL, 1u);
      v6[106] = v37;
      if (v37) {
        goto LABEL_62;
      }
      uint64_t v12 = 0;
      int v14 = 1;
LABEL_60:
      int v15 = 1;
LABEL_14:
      uint64_t v17 = (vnode *)v6[2];
      if (v17)
      {
        vnode_put(v17);
        vnode_recycle((vnode_t)v6[2]);
        uint64_t v7 = 0;
      }
      uint64_t v18 = (thread_call *)v6[106];
      if (v18)
      {
        thread_call_free(v18);
        v6[106] = 0;
      }
      unint64_t v19 = (thread_call *)v6[105];
      if (v19)
      {
        thread_call_free(v19);
        v6[105] = 0;
      }
      if (v14) {
        lifs_endio_thread_stop((uint64_t)v6);
      }
      if (v15) {
        lifs_req_thread_stop((uint64_t)v6);
      }
      uint64_t v20 = (void *)v6[72];
      if (v20) {
        throttle_info_release(v20);
      }
      if (!v13) {
        goto LABEL_38;
      }
      lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
      uint64_t v21 = *v6;
      if (*v6)
      {
        if (*(void **)(v21 + 8) == v6)
        {
          int v22 = (void *)v6[1];
          if ((void *)*v22 == v6)
          {
            *(void *)(v21 + 8) = v22;
            uint64_t v23 = (void *)v6[1];
LABEL_37:
            *uint64_t v23 = v21;
            lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
LABEL_38:
            kfree_type_impl();
            if (v7) {
              kfree_type_impl();
            }
            goto LABEL_40;
          }
        }
      }
      else
      {
        uint64_t v23 = (void *)v6[1];
        if ((void *)*v23 == v6)
        {
          qword_20658 = v6[1];
          goto LABEL_37;
        }
      }
      __break(0xBFFDu);
      JUMPOUT(0x15B78);
    }
LABEL_59:
    uint64_t v12 = v36;
    int v14 = 0;
    int v13 = 1;
    goto LABEL_60;
  }
  uint64_t v36 = lifs_io_thread_start((uint64_t)v6);
  if (v36) {
    goto LABEL_59;
  }
  atomic_store((unint64_t)lifs_open_device((const char *)v6 + 733, 1), v6 + 97);
LABEL_62:
  os_ref_init_count_external((os_ref_atomic_t *)v6 + 208, 0, 1u);
  atomic_load(v6 + 97);
  int v38 = vfs_setdevvp();
  if (v38) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to set mnt_devvp on the mount point: %d", v38);
  }
  lifs_set_ioattr((uint64_t)v6);
  kfree_type_impl();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140006u, (uintptr_t)arg1, (uintptr_t)v6, v7, *(void *)(v7 + 224));
  }
  return 0;
}

uint64_t lifs_start()
{
  return 0;
}

uint64_t lifs_unmount(mount *a1, int a2, vfs_context *a3)
{
  if (!a1) {
    return 22;
  }
  uint64_t v6 = vfs_fsprivate(a1);
  if (!v6)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NULL lifs mount");
    return 22;
  }
  uint64_t v7 = v6;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lifs_unmount (lmp %p) started", v6);
  int v8 = (long long *)vnode_fsnode((vnode_t)v7[2]);
  long long v9 = v8[3];
  long long v11 = *v8;
  long long v10 = v8[1];
  long long v28 = v8[2];
  long long v29 = v9;
  *(_OWORD *)uintptr_t arg4 = v11;
  long long v27 = v10;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140009u, (uintptr_t)a1, (uintptr_t)v7, a2, LODWORD(arg4[0]));
  }
  uint64_t v12 = vflush(a1, (vnode *)v7[2], (a2 & 0x80000u) >> 18);
  if ((a2 & 0x80000) == 0)
  {
    uint64_t v13 = v12;
    if (v12)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s (lmp %p) vflush returned err %d", "lifs_unmount", v7, v12);
      return v13;
    }
  }
  int v15 = vnode_isinuse((vnode_t)v7[2], 0);
  if ((a2 & 0x80000) == 0 && v15)
  {
    int v16 = vnode_usecount();
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s (lmp %p) is busy (usecount: %d)", "lifs_unmount", v7, v16);
    return 16;
  }
  uint64_t v17 = (thread_call *)v7[105];
  if (v17)
  {
    thread_call_cancel_wait(v17);
    thread_call_free((thread_call_t)v7[105]);
    v7[105] = 0;
  }
  lck_mtx_lock((lck_mtx_t *)(v7 + 12));
  uint64_t v18 = (thread_call *)v7[106];
  if (v18)
  {
    if ((*((unsigned char *)v7 + 33) & 8) != 0)
    {
      lck_mtx_unlock((lck_mtx_t *)(v7 + 12));
      thread_call_cancel_wait((thread_call_t)v7[106]);
      lck_mtx_lock((lck_mtx_t *)(v7 + 12));
      uint64_t v18 = (thread_call *)v7[106];
    }
    thread_call_free(v18);
    v7[106] = 0;
  }
  lck_mtx_unlock((lck_mtx_t *)(v7 + 12));
  int v19 = lifs_unmount_request((uint64_t)v7, a2, (long long *)arg4);
  if (v19 == -1)
  {
    vnode_mount((vnode_t)v7[2]);
    uint64_t v20 = (vnode *)vfs_vnodecovered();
    VNOP_IOCTL(v20, 0x20006E04uLL, 0, 0, a3);
    vnode_put(v20);
    int v19 = 0;
  }
  vnode_put((vnode_t)v7[2]);
  vflush(a1, 0, 2);
  if (v19) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "lifs_unmount_request returned err %d", v19);
  }
  else {
    lifs_unmount2_request((uint64_t)v7, a2, (long long *)arg4);
  }
  lifs_req_thread_stop((uint64_t)v7);
  if ((v7[4] & 8) != 0)
  {
    lifs_endio_thread_stop((uint64_t)v7);
    lifs_detach_mount_from_iouc_volume((uint64_t)v7);
  }
  else
  {
    lifs_io_thread_stop((uint64_t)v7);
    if (atomic_load(v7 + 97))
    {
      int v22 = (vnode *)atomic_load(v7 + 97);
      lifs_close_device(v22, 1);
    }
  }
  lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
  uint64_t v23 = *v7;
  if (!*v7)
  {
    size_t v25 = (void *)v7[1];
    if ((void *)*v25 == v7)
    {
      qword_20658 = v7[1];
      goto LABEL_35;
    }
LABEL_38:
    __break(0xBFFDu);
    JUMPOUT(0x15FF0);
  }
  if (*(void **)(v23 + 8) != v7) {
    goto LABEL_38;
  }
  thread_call_t v24 = (void *)v7[1];
  if ((void *)*v24 != v7) {
    goto LABEL_38;
  }
  *(void *)(v23 + 8) = v24;
  size_t v25 = (void *)v7[1];
LABEL_35:
  *size_t v25 = v23;
  lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
  vfs_setfsprivate(a1, 0);
  hashdestroy((void *)v7[70], 80, v7[71]);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 14), (lck_grp_t *)lifs_mount_grp);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 12), (lck_grp_t *)lifs_mount_grp);
  lck_rw_destroy((lck_rw_t *)(v7 + 16), (lck_grp_t *)lifs_rw_grp);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 83), (lck_grp_t *)lifs_mount_grp);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 85), (lck_grp_t *)lifs_mount_grp);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 87), (lck_grp_t *)lifs_mount_grp);
  lck_mtx_destroy((lck_mtx_t *)(v7 + 89), (lck_grp_t *)lifs_mount_grp);
  throttle_info_release((void *)v7[72]);
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lifs_unmount (lmp %p) done", v7);
  kfree_type_impl();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314000Au, (uintptr_t)a1, 0, 0, 0);
  }
  return 0;
}

uint64_t lifs_root(mount *a1, uintptr_t *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v4 = vfs_fsprivate(a1);
  if (!v4)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NULL lifs mount");
    return 22;
  }
  uintptr_t v5 = (uintptr_t)v4;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314000Du, (uintptr_t)a1, (uintptr_t)v4, 0, 0);
  }
  uint64_t v6 = vnode_get(*(vnode_t *)(v5 + 16));
  uint64_t v7 = v6;
  if (!v6) {
    *a2 = *(void *)(v5 + 16);
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314000Eu, (uintptr_t)a1, v5, *a2, (int)v6);
  }
  return v7;
}

uint64_t lifs_quotactl()
{
  return 45;
}

uint64_t lifs_getattr(mount *a1, uint64_t *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v4 = (vnode_t *)vfs_fsprivate(a1);
  if (!v4)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NULL lifs mount");
    return 22;
  }
  uintptr_t v5 = (uintptr_t)v4;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  uint64_t v6 = (unsigned int *)vnode_fsnode(v4[2]);
  uint64_t v7 = v6;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140011u, (uintptr_t)a1, v5, *v6, 0);
  }
  uint64_t v8 = a2[1];
  if ((v8 & 0x2000) != 0)
  {
    *((_DWORD *)a2 + 29) = *(_DWORD *)(v5 + 544);
    *a2 |= 0x2000uLL;
    if ((v8 & 0x1000) == 0)
    {
LABEL_7:
      if ((v8 & 0x100000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else if ((v8 & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *(uint64_t *)((char *)a2 + 108) = (uint64_t)vfs_statfs(a1)->f_fsid;
  uint64_t v8 = a2[1];
  *a2 |= 0x1000uLL;
  if ((v8 & 0x100000) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  if (*(unsigned char *)(v5 + 793))
  {
    *((_DWORD *)a2 + 64) = vfs_statfs(a1)->f_fssubtype;
    uint64_t v8 = a2[1];
    *a2 |= 0x100000uLL;
  }
LABEL_15:
  if ((v8 & 0xFF0) != 0)
  {
    lck_mtx_lock((lck_mtx_t *)(v5 + 96));
    if ((*(unsigned char *)(v5 + 32) & 2) != 0)
    {
      long long v10 = (long long *)(v5 + 488);
    }
    else
    {
      lck_mtx_unlock((lck_mtx_t *)(v5 + 96));
      uint64_t v9 = lifs_statfs_request(v5, (long long *)v7, (uint64_t)&v25);
      lck_mtx_lock((lck_mtx_t *)(v5 + 96));
      if (v9)
      {
        lck_mtx_unlock((lck_mtx_t *)(v5 + 96));
        goto LABEL_26;
      }
      if (vfs_isrdonly(*(mount_t *)(v5 + 448)))
      {
        uint64_t v11 = *(void *)(v5 + 32);
        if ((v11 & 2) == 0)
        {
          *(void *)(v5 + 536) = v28;
          long long v12 = v26;
          *(_OWORD *)(v5 + 488) = v25;
          *(_OWORD *)(v5 + 504) = v12;
          *(_OWORD *)(v5 + 520) = v27;
          *(void *)(v5 + 32) = v11 | 2;
        }
      }
      long long v10 = &v25;
    }
    lck_mtx_unlock((lck_mtx_t *)(v5 + 96));
    int v13 = vfs_devblocksize(a1);
    uint64_t v9 = 0;
    unint64_t v14 = *(void *)v10;
    *(_OWORD *)((char *)a2 + 92) = *(long long *)((char *)v10 + 24);
    *(uint64_t *)((char *)a2 + 76) = *((void *)v10 + 1) / (unint64_t)v13;
    uint64_t v15 = *a2;
    unint64_t v16 = *((void *)v10 + 2) / (unint64_t)v13;
    *(uint64_t *)((char *)a2 + 68) = v16;
    unint64_t v17 = v14 / v13;
    *(uint64_t *)((char *)a2 + 84) = v17 - v16;
    *(uint64_t *)((char *)a2 + 60) = v17;
    *(uint64_t *)((char *)a2 + 52) = 0x100000;
    *((_DWORD *)a2 + 12) = v13;
    *a2 = v15 | 0xFF0;
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_26:
  uint64_t v18 = a2[1];
  if ((v18 & 0x200000) == 0)
  {
    if ((v18 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_36;
  }
  if (!v7 || (uint64_t v9 = vnode_get(*((vnode_t *)v7 + 28)), v9))
  {
    int v19 = (char **)((char *)a2 + 260);
LABEL_34:
    strlcpy(*v19, "Untitled", 0x400uLL);
    uint64_t v20 = v9;
    goto LABEL_35;
  }
  int v19 = (char **)((char *)a2 + 260);
  int v24 = lifs_getfsattr_call((long long *)v7, "_S_f_vol_name", *(_DWORD **)((char *)a2 + 260), 1024);
  vnode_put(*((vnode_t *)v7 + 28));
  uint64_t v20 = 0;
  if (v24) {
    goto LABEL_34;
  }
LABEL_35:
  uint64_t v18 = a2[1];
  *a2 |= 0x200000uLL;
  uint64_t v9 = v20;
  if ((v18 & 0x4000) == 0)
  {
LABEL_28:
    if ((v18 & 0x8000) == 0) {
      goto LABEL_29;
    }
LABEL_37:
    long long v21 = *(_OWORD *)(v5 + 56);
    long long v22 = *(_OWORD *)(v5 + 72);
    a2[23] = *(void *)(v5 + 88);
    *(_OWORD *)(a2 + 21) = v22;
    *(_OWORD *)(a2 + 19) = v21;
    *a2 |= 0x8000uLL;
    if ((v18 & 0x1000000) == 0) {
      goto LABEL_40;
    }
LABEL_38:
    if (memcmp((const void *)(v5 + 794), &nullUUID, 0x10uLL))
    {
      *((_OWORD *)a2 + 17) = *(_OWORD *)(v5 + 794);
      *a2 |= 0x1000000uLL;
    }
    goto LABEL_40;
  }
LABEL_36:
  *((_DWORD *)a2 + 30) = *(_DWORD *)(v5 + 40) & 0xFFE28FFF;
  *((_DWORD *)a2 + 31) = *(_DWORD *)(v5 + 48) & 0xFFFD48C0 | 0x300;
  *((_OWORD *)a2 + 8) = xmmword_3BB0;
  a2[18] = 0;
  *a2 |= 0x4000uLL;
  if ((v18 & 0x8000) != 0) {
    goto LABEL_37;
  }
LABEL_29:
  if ((v18 & 0x1000000) != 0) {
    goto LABEL_38;
  }
LABEL_40:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140012u, (uintptr_t)a1, v5, (int)v9, 0);
  }
  return v9;
}

uint64_t lifs_sync(mount_t mp, unsigned int a2, uint64_t a3)
{
  v18[0] = *(_OWORD *)"_N_SYNC";
  v18[1] = unk_3C01;
  char v19 = 0;
  uintptr_t v6 = (int)a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140019u, (uintptr_t)mp, (int)a2, 0, 0);
  }
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  if (mp
    && (uint64_t v7 = (vnode_t *)vfs_fsprivate(mp)) != 0
    && (uint64_t v8 = (uint64_t)v7, (v9 = (long long *)vnode_fsnode(v7[2])) != 0))
  {
    long long v10 = v9;
    if (vfs_isrdonly(mp))
    {
      int v11 = 0;
      LODWORD(a3) = 0;
    }
    else
    {
      uint64_t v14 = a3;
      uint64_t v15 = a2;
      vnode_iterate(mp, 0, (int (__cdecl *)(vnode *, void *))lifs_sync_callback, &v14);
      LODWORD(a3) = HIDWORD(v15);
      if ((vfs_flags(*(mount_t *)(v8 + 448)) & 0x1000) != 0)
      {
        *(void *)&v16[0] = v6;
        int v11 = lifs_setfsattr_request(v8, v10, (char *)v18, v16, 8, (uint64_t)v16);
      }
      else
      {
        int v11 = 0;
      }
    }
  }
  else
  {
    LODWORD(a3) = 0;
    int v11 = 22;
  }
  if (a3) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (v12) {
    a3 = a3;
  }
  else {
    a3 = v11;
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314001Au, (uintptr_t)mp, v6, v11, (int)a3);
  }
  return a3;
}

uint64_t lifs_vget()
{
  return 45;
}

uint64_t lifs_fhtovp()
{
  return 45;
}

uint64_t lifs_vptofh()
{
  return 45;
}

uint64_t lifs_init(uintptr_t arg1)
{
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140001u, arg1, 0, 0, 0);
  }
  lifs_kext_grp = (uint64_t)lck_grp_alloc_init("lifs_kext", 0);
  lifs_mount_grp = (uint64_t)lck_grp_alloc_init("lifs_mount", 0);
  lifs_node_grp = (uint64_t)lck_grp_alloc_init("lifs_node", 0);
  lifs_rw_grp = (uint64_t)lck_grp_alloc_init("lifs_rw", 0);
  lck_rw_init((lck_rw_t *)&lifs_port_rwlock, (lck_grp_t *)lifs_kext_grp, 0);
  lck_mtx_init((lck_mtx_t *)&lifs_mount_list_lock, (lck_grp_t *)lifs_mount_grp, 0);
  lifs_mount_list = 0;
  qword_20658 = (uint64_t)&lifs_mount_list;
  lifs_req_hashtbl_init();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140002u, 0, 0, 0, 0);
  }
  return 0;
}

uint64_t lifs_sysctl()
{
  return 45;
}

uint64_t lifs_setattr(mount_t mp, uint64_t a2)
{
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140015u, (uintptr_t)mp, *(void *)(a2 + 8), 0, 0);
  }
  uint64_t v15 = 0;
  long long v14 = 0u;
  memset(__dst, 0, sizeof(__dst));
  if (!mp)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NULL lifs mount");
LABEL_12:
    uint64_t v7 = 22;
    goto LABEL_13;
  }
  BOOL v4 = (vnode_t *)vfs_fsprivate(mp);
  if (!v4)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "NULL lifs mount");
    goto LABEL_12;
  }
  uint64_t v5 = (uint64_t)v4;
  uintptr_t v6 = (long long *)vnode_fsnode(v4[2]);
  if ((*(unsigned char *)(a2 + 10) & 0x20) == 0)
  {
    uint64_t v7 = 45;
    goto LABEL_13;
  }
  uint64_t v8 = v6;
  char v12 = 0;
  v11[0] = *(_OWORD *)"_S_f_vol_name";
  v11[1] = unk_3BE0;
  size_t v9 = strlen(*(const char **)(a2 + 260)) + 1;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140014u, (uintptr_t)mp, *(void *)(a2 + 8) & 0x200000, v9, 0);
  }
  if (v9 > 0x100) {
    goto LABEL_12;
  }
  memmove(__dst, *(const void **)(a2 + 260), v9);
  LODWORD(v14) = v9;
  uint64_t v7 = lifs_setfsattr_request(v5, v8, (char *)v11, __dst, v9, (uint64_t)__dst);
  if (!v7)
  {
    *(void *)a2 |= 0x200000uLL;
    lifs_mntfromname(v5, v8);
  }
LABEL_13:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140016u, (uintptr_t)mp, *(void *)(a2 + 8), *(void *)a2, (int)v7);
  }
  return v7;
}

vnode_t lifs_open_device(const char *a1, int a2)
{
  unint64_t v3 = (char *)a1;
  *(_OWORD *)__str = 0u;
  memset(v10, 0, sizeof(v10));
  vnode_t vpp = 0;
  if (strncmp(a1, "/dev/", 5uLL))
  {
    if (strncmp(v3, "disk", 4uLL))
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Skipping %s", v3);
      return vpp;
    }
    uint64_t v7 = v3;
    unint64_t v3 = __str;
    snprintf(__str, 0x26uLL, "/dev/%s", v7);
  }
  BOOL v4 = (vfs_context *)vfs_context_kernel();
  errno_t v5 = vnode_open(v3, a2, 0, 0, &vpp, v4);
  if (v5)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to open block device %s, err: %d", v3, v5);
  }
  else
  {
    vnode_setmountedon(vpp);
    vnode_put(vpp);
  }
  return vpp;
}

uint64_t *lifs_get_mount_with_devvp(uint64_t a1)
{
  unint64_t result = &lifs_mount_list;
  do
  {
    unint64_t result = (uint64_t *)*result;
    if (!result) {
      break;
    }
    unint64_t v3 = atomic_load((unint64_t *)result + 97);
  }
  while (v3 != a1);
  return result;
}

void lifs_close_device(vnode *a1, int a2)
{
  lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
  if (vcount(a1))
  {
    BOOL v4 = &lifs_mount_list;
    while (1)
    {
      BOOL v4 = (uint64_t *)*v4;
      if (!v4) {
        break;
      }
      unint64_t v5 = atomic_load((unint64_t *)v4 + 97);
      if ((vnode *)v5 == a1)
      {
        atomic_store(0, (unint64_t *)v4 + 97);
        if (*((_DWORD *)v4 + 208) >= 2u)
        {
          do
          {
            lck_mtx_lock((lck_mtx_t *)(v4 + 12));
            v4[4] |= 0x80uLL;
            msleep(v4 + 104, (lck_mtx_t *)(v4 + 12), 16, "lifs_close_device", 0);
            lck_mtx_unlock((lck_mtx_t *)(v4 + 12));
          }
          while (*((_DWORD *)v4 + 208) > 1u);
        }
        lck_mtx_lock((lck_mtx_t *)(v4 + 12));
        if (v4[106] && (*((unsigned char *)v4 + 33) & 8) != 0)
        {
          lck_mtx_unlock((lck_mtx_t *)(v4 + 12));
          thread_call_cancel_wait((thread_call_t)v4[106]);
          lck_mtx_lock((lck_mtx_t *)(v4 + 12));
        }
        lck_mtx_unlock((lck_mtx_t *)(v4 + 12));
        buf_flushdirtyblks(a1, 1, 0, "lifs_close_device");
        vfs_setdevvp();
        break;
      }
    }
    vnode_clearmountedon(a1);
    vnode_getwithref(a1);
    uintptr_t v6 = (vfs_context *)vfs_context_kernel();
    vnode_close(a1, a2, v6);
  }

  lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
}

void lifs_sync_call(uint64_t a1)
{
  uint64_t v2 = *(mount **)(a1 + 448);
  uint64_t v3 = vfs_context_kernel();
  lifs_sync(v2, 1u, v3);
  BOOL v4 = (lck_mtx_t *)(a1 + 96);
  lck_mtx_lock((lck_mtx_t *)(a1 + 96));
  uint64_t v7 = *(void *)(a1 + 32);
  uintptr_t v6 = (unint64_t *)(a1 + 32);
  uint64_t v5 = v7;
  *uintptr_t v6 = v7 & 0xFFFFFFFFFFFFFEFFLL;
  if ((v7 & 0x200) != 0)
  {
    *uintptr_t v6 = v5 & 0xFFFFFFFFFFFFFCFFLL;
    wakeup(v6);
  }

  lck_mtx_unlock(v4);
}

uint64_t lifs_query_mountpoint(uint64_t a1, long long *a2)
{
  int v30 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v25 = 0;
  BOOL v4 = *(mount **)(a1 + 448);
  uint64_t v5 = vfs_statfs(v4);
  long long v33 = 0uLL;
  if (!lifs_getfsattr_call(a2, "_B_has_perm_enforcement", &v30, 4) && v30) {
    vfs_setauthopaque(v4);
  }
  if (!lifs_getfsattr_call(a2, "_B_has_access_check", &v30, 4) && v30) {
    vfs_setauthopaqueaccess(v4);
  }
  if (!lifs_getfsattr_call(a2, "_N_caps_format", &v29, 8))
  {
    char v6 = ~(_BYTE)v29;
    *(void *)(a1 + 40) = v29;
    if ((v6 & 0x18) == 0) {
      vfs_setflags(v4, 0x800000uLL);
    }
  }
  if (!lifs_getfsattr_call(a2, "_N_caps_interfaces", &v29, 8))
  {
    *(void *)(a1 + 48) = v29;
    lifs_get_supported_xattrs((uint64_t)a2);
  }
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  if (lifs_getfsattr_call(a2, "_O_vol_attributes_attr", &v22, 40))
  {
    int v7 = 0;
    int v8 = 0;
    uint64_t v24 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
  }
  else
  {
    int v8 = DWORD1(v22);
    int v7 = DWORD2(v23);
  }
  DWORD1(v22) = v8 | 0x40022000;
  DWORD2(v23) = v7 | 0x40022000;
  *(void *)(a1 + 88) = v24;
  long long v9 = v23;
  *(_OWORD *)(a1 + 56) = v22;
  *(_OWORD *)(a1 + 72) = v9;
  if (lifs_getfsattr_call(a2, "_N_mntflags", &v28, 8)) {
    goto LABEL_16;
  }
  int v12 = v28;
  if (v28)
  {
    vfs_setflags(v4, 1uLL);
    int v12 = v28;
    if ((v28 & 0x10000000) == 0)
    {
LABEL_22:
      if ((v12 & 0x2000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_40;
    }
  }
  else if ((v28 & 0x10000000) == 0)
  {
    goto LABEL_22;
  }
  vfs_setflags(v4, 0x1000uLL);
  int v12 = v28;
  if ((v28 & 0x2000) == 0)
  {
LABEL_23:
    if ((v12 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(void *)(a1 + 32) |= 4uLL;
  if ((v12 & 2) == 0)
  {
LABEL_24:
    if ((v12 & 0x40000000) == 0) {
      goto LABEL_25;
    }
LABEL_42:
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t volume_port_request = lifs_get_volume_port_request(a1, a2, (uint64_t)&v31);
    if (volume_port_request)
    {
      uint64_t v19 = volume_port_request;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_get_volume_port_request returned err %d\n", "lifs_setup_mount_for_koio", volume_port_request);
      return v19;
    }
    uint64_t v21 = lifs_attach_mount_to_iouc_volume((const void *)a1, v32, (unint64_t *)(a1 + 776));
    if (v21)
    {
      uint64_t v19 = v21;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: lifs_attach_mount_to_iouc_volume returned err %d\n", "lifs_setup_mount_for_koio", v21);
      return v19;
    }
    uint64_t v13 = *(void *)(a1 + 32) | 8;
    *(void *)(a1 + 32) = v13;
    if ((v13 & 8) != 0) {
      goto LABEL_26;
    }
    goto LABEL_16;
  }
LABEL_41:
  *(void *)(a1 + 32) |= 0x20uLL;
  if ((v12 & 0x40000000) != 0) {
    goto LABEL_42;
  }
LABEL_25:
  uint64_t v13 = *(void *)(a1 + 32);
  if ((v13 & 8) != 0)
  {
LABEL_26:
    if ((v28 & 0x20000000) != 0) {
      *(void *)(a1 + 32) = v13 | 0x40;
    }
  }
LABEL_16:
  if (!lifs_getfsattr_call(a2, "_N_f_subtype", &v27, 8))
  {
    v5->f_fssubtype = v27;
    *(unsigned char *)(a1 + 793) = 1;
  }
  int v10 = lifs_getfsattr_call(a2, "_O_f_uuid", &v33, 16);
  int v11 = (void *)(a1 + 794);
  if (v10)
  {
    *int v11 = 0;
    *(void *)(a1 + 802) = 0;
  }
  else
  {
    *(_OWORD *)int v11 = v33;
  }
  if (!lifs_getfsattr_call(a2, "_N_f_bsize", &v26, 8)
    && !lifs_getfsattr_call(a2, "_N_f_bavail", &v25, 8))
  {
    uint64_t v14 = v25 * v26;
    *(void *)(a1 + 856) = v25 * v26;
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: lmp %p freespace 0x%llx", "lifs_query_mountpoint", (const void *)a1, v14);
  }
  vfs_setlocklocal(v4);
  lck_mtx_lock((lck_mtx_t *)(a1 + 96));
  lifs_pathconf(a1, a2);
  if (v15)
  {
    if ((*(unsigned char *)(a1 + 41) & 8) != 0) {
      uint64_t v16 = 0x20000000000;
    }
    else {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    int v17 = *(_DWORD *)(a1 + 480);
    if (v17 < 65) {
      uint64_t v16 = ~(-1 << (v17 - 1));
    }
    else {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(void *)(a1 + 824) = v16;
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lmp %p max_filesize 0x%llx", (const void *)a1, v16);
  lck_mtx_unlock((lck_mtx_t *)(a1 + 96));
  return 0;
}

void lifs_setup_fsid(uint64_t a1, uint64_t a2)
{
  if (atomic_load((unint64_t *)(a1 + 776)))
  {
    uint64_t v5 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
    *(_DWORD *)(a2 + 60) = vnode_specrdev(v5);
    *(_DWORD *)(a2 + 64) = vfs_typenum(*(mount_t *)(a1 + 448));
  }
  else
  {
    char v6 = *(mount **)(a1 + 448);
    vfs_getnewfsid(v6);
  }
}

void lifs_meta_sync_call(uint64_t a1)
{
  explicit = (vnode *)atomic_load_explicit((atomic_ullong *volatile)(a1 + 776), memory_order_acquire);
  if (explicit && vnode_hasdirtyblks(explicit)) {
    lifs_flush_meta(explicit, 0);
  }
  lck_mtx_lock((lck_mtx_t *)(a1 + 96));
  *(void *)(a1 + 32) &= ~0x800uLL;

  lck_mtx_unlock((lck_mtx_t *)(a1 + 96));
}

void lifs_set_ioattr(uint64_t a1)
{
  uint64_t v2 = vfs_context_kernel();
  *(_DWORD *)long long data = 0;
  ioattrp.u_int32_t io_maxreadcnt = lifs_max_ssd_read_size;
  ioattrp.u_int32_t io_maxwritecnt = lifs_max_ssd_write_size;
  ioattrp.u_int32_t io_segreadcnt = lifs_max_ssd_read_size >> PAGE_SHIFT_CONST;
  ioattrp.u_int32_t io_segwritecnt = lifs_max_ssd_write_size >> PAGE_SHIFT_CONST;
  *(_OWORD *)&ioattrp.io_maxsegreadsize = xmmword_3BC0;
  ioattrp.32 = 0uLL;
  if (!atomic_load((unint64_t *)(a1 + 776)))
  {
    int v10 = 0;
    goto LABEL_27;
  }
  BOOL v4 = (vfs_context *)v2;
  uint64_t v5 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
  if (VNOP_IOCTL(v5, 0x4004644FuLL, data, 0, v4)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(_DWORD *)data == 0;
  }
  char v7 = !v6;
  *(unsigned char *)(a1 + 792) = v7;
  if ((*(unsigned char *)(a1 + 32) & 8) == 0)
  {
    *(void *)uint64_t v26 = 0;
    *(void *)uint64_t v27 = 0;
    *(_DWORD *)uint64_t v25 = 0;
    int v8 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
    if (!VNOP_IOCTL(v8, 0x40046418uLL, v26, 0, v4)) {
      ioattrp.u_int32_t io_devblocksize = *(_DWORD *)v26;
    }
    long long v9 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
    if (VNOP_IOCTL(v9, 0x4004644EuLL, &v26[4], 0, v4) || !*(unsigned char *)(a1 + 792) || *(_DWORD *)&v26[4] > 0x20u)
    {
      if (*(unsigned char *)(a1 + 792)) {
        goto LABEL_20;
      }
    }
    else
    {
      *(unsigned char *)(a1 + 792) = 0;
    }
    ioattrp.u_int32_t io_maxreadcnt = lifs_max_read_size;
    ioattrp.u_int32_t io_maxwritecnt = lifs_max_write_size;
    ioattrp.u_int32_t io_segreadcnt = lifs_max_read_size >> PAGE_SHIFT_CONST;
    ioattrp.u_int32_t io_segwritecnt = lifs_max_write_size >> PAGE_SHIFT_CONST;
LABEL_20:
    int v12 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
    if (!VNOP_IOCTL(v12, 0x40046448uLL, v25, 0, v4) && *(_DWORD *)v25) {
      vfs_setflags(*(mount_t *)(a1 + 448), 0x200uLL);
    }
    uint64_t v13 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
    if (!VNOP_IOCTL(v13, 0x40086421uLL, v27, 0, v4) && (v27[0] & 1) != 0)
    {
      ioattrp.io_flags = 64;
      vfs_setflags(*(mount_t *)(a1 + 448), 0x200uLL);
    }
    goto LABEL_26;
  }
  int v11 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
  vfs_init_io_attributes(v11, *(mount_t *)(a1 + 448));
  vfs_ioattr(*(mount_t *)(a1 + 448), &ioattrp);
  *(uint32x2_t *)(a1 + 784) = vmin_u32(*(uint32x2_t *)&ioattrp.io_maxreadcnt, (uint32x2_t)__PAIR64__(lifs_max_dev_write_size, lifs_max_dev_read_size));
  ioattrp.u_int32_t io_maxreadcnt = ubc_upl_maxbufsize();
  ioattrp.u_int32_t io_segreadcnt = ioattrp.io_maxreadcnt >> PAGE_SHIFT_CONST;
  ioattrp.u_int32_t io_maxwritecnt = ubc_upl_maxbufsize();
  ioattrp.u_int32_t io_segwritecnt = ioattrp.io_maxwritecnt >> PAGE_SHIFT_CONST;
LABEL_26:
  uint64_t v14 = (vnode *)atomic_load((unint64_t *)(a1 + 776));
  int v10 = vnode_getname(v14);
LABEL_27:
  int v24 = *(unsigned __int8 *)(a1 + 792);
  if (v10) {
    int v15 = v10;
  }
  else {
    int v15 = "unknown";
  }
  u_int32_t io_devblocksize = ioattrp.io_devblocksize;
  int v17 = *(_DWORD *)(a1 + 784);
  int v18 = *(_DWORD *)(a1 + 788);
  u_int32_t io_maxreadcnt = ioattrp.io_maxreadcnt;
  u_int32_t io_maxwritecnt = ioattrp.io_maxwritecnt;
  u_int32_t io_segreadcnt = ioattrp.io_segreadcnt;
  u_int32_t io_segwritecnt = ioattrp.io_segwritecnt;
  uint64_t v23 = vfs_flags(*(mount_t *)(a1 + 448));
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: isssd %u devblksize %u devreadsize %d devwritesize %d maxreadcnt %u segreadcnt %u maxwritecnt %u segwritecnt %u mnt_flags 0x%llx\n", v15, v24, io_devblocksize, v17, v18, io_maxreadcnt, io_segreadcnt, io_maxwritecnt, io_segwritecnt, v23);
  vfs_setioattr(*(mount_t *)(a1 + 448), &ioattrp);
  if (v10) {
    vnode_putname(v10);
  }
}

uint64_t lifs_sync_callback(vnode *a1, uint64_t a2)
{
  int v4 = vnode_hasdirtyblks(a1);
  int v5 = *(_DWORD *)(a2 + 8);
  if (v4 || v5 != 2)
  {
    errno_t v6 = VNOP_FSYNC(a1, v5, *(vfs_context_t *)a2);
    if (v6) {
      *(_DWORD *)(a2 + 12) = v6;
    }
  }
  return 0;
}

uint64_t lifs_add()
{
  vfs_fsentry v1 = off_25C88;
  return vfs_fsadd(&v1, (vfstable_t *)&lifs_vft);
}

uint64_t lifs_remove()
{
  return vfs_fsremove((vfstable_t)lifs_vft);
}

uint64_t sysctl_max_io_threads(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_io_threads;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 1) <= 7) {
    lifs_max_io_threads = arg1;
  }
  return result;
}

uint64_t sysctl_max_inline_io_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_inline_io_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 4096) <= 0x1FF000) {
    lifs_max_inline_io_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_read_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_read_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0x700000) {
    lifs_max_read_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_write_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_write_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0x300000) {
    lifs_max_write_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_ssd_read_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_ssd_read_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0xF00000) {
    lifs_max_ssd_read_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_ssd_write_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_ssd_write_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0xF00000) {
    lifs_max_ssd_write_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_dev_read_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_dev_read_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0x700000) {
    lifs_max_dev_read_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_dev_write_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_dev_write_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x100000) <= 0x700000) {
    lifs_max_dev_write_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_read_blockmap_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_read_blockmap_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x20000) <= 0x3E0000) {
    lifs_max_read_blockmap_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_write_blockmap_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_write_blockmap_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x20000) <= 0xE0000) {
    lifs_max_write_blockmap_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_ssd_read_blockmap_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_ssd_read_blockmap_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x20000) <= 0x3E0000) {
    lifs_max_ssd_read_blockmap_size = arg1;
  }
  return result;
}

uint64_t sysctl_max_ssd_write_blockmap_size(sysctl_oid *a1, uint64_t a2, uint64_t a3, sysctl_req *a4)
{
  int arg1 = lifs_max_ssd_write_blockmap_size;
  uint64_t result = sysctl_handle_int(a1, &arg1, 0, a4);
  if (!result && a4->newptr && (arg1 - 0x20000) <= 0xE0000) {
    lifs_max_ssd_write_blockmap_size = arg1;
  }
  return result;
}

void lifs_register_sysctl()
{
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_io_threads);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_inline_io_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_read_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_write_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_read_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_write_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_dev_read_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_dev_write_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_read_blockmap_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_write_blockmap_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_read_blockmap_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_write_blockmap_size);
  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_read_meta_cache_hit);

  sysctl_register_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_write_meta_cache_hit);
}

void lifs_unregister_sysctl()
{
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_io_threads);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_inline_io_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_read_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_write_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_read_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_write_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_dev_read_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_dev_write_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_read_blockmap_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_write_blockmap_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_read_blockmap_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_max_ssd_write_blockmap_size);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_read_meta_cache_hit);
  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs_write_meta_cache_hit);

  sysctl_unregister_oid((sysctl_oid *)&sysctl__vfs_generic_lifs);
}

unint64_t lifatype_to_dtype(unsigned int a1)
{
  unint64_t v1 = 0xC0602010A040800uLL >> (8 * a1);
  if (a1 >= 8) {
    LOBYTE(v1) = 0;
  }
  return v1 & 0xF;
}

BOOL update_lnode_attr_locked(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a1 + 456);
  if (v3 < v4)
  {
    *(void *)(a1 + 232) = 0;
    *(void *)(a1 + 240) = 0;
    return v3 >= v4;
  }
  uint64_t v6 = *(void *)(a2 + 8);
  if (v6)
  {
    if (*(unsigned char *)(a1 + 256))
    {
      int v8 = *(_DWORD *)(a2 + 24);
      if (*(_DWORD *)(a1 + 272) != v8)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unexpected attribute type changed from %d to %d", *(_DWORD *)(a1 + 272), v8);
        uint64_t v6 = *(void *)(a2 + 8);
      }
    }
    *(_DWORD *)(a1 + 272) = *(_DWORD *)(a2 + 24);
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_29;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 276) = *(_DWORD *)(a2 + 28);
  if ((v6 & 8) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(a1 + 284) = *(_DWORD *)(a2 + 36);
  if ((v6 & 4) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(a1 + 280) = *(_DWORD *)(a2 + 32);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(a1 + 288) = *(_DWORD *)(a2 + 40);
  if ((v6 & 0x20) == 0)
  {
LABEL_8:
    if ((v6 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(a1 + 292) = *(_DWORD *)(a2 + 44);
  if ((v6 & 0x40) == 0)
  {
LABEL_9:
    if ((v6 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(void *)(a1 + 296) = *(void *)(a2 + 48);
  if ((v6 & 0x80) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(void *)(a1 + 304) = *(void *)(a2 + 56);
  if ((v6 & 0x100) == 0)
  {
LABEL_11:
    if ((v6 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_35:
  *(void *)(a1 + 312) = *(void *)(a2 + 64);
  if ((v6 & 0x200) != 0) {
LABEL_12:
  }
    *(void *)(a1 + 320) = *(void *)(a2 + 72);
LABEL_13:
  if ((v6 & 0x400) != 0)
  {
    *(_OWORD *)(a1 + 328) = *(_OWORD *)(a2 + 80);
    if ((v6 & 0x800) == 0)
    {
LABEL_15:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_39;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 96);
  if ((v6 & 0x1000) == 0)
  {
LABEL_16:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 112);
  if ((v6 & 0x2000) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 128);
  if ((v6 & 0x4000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_19;
    }
LABEL_42:
    *(_OWORD *)(a1 + 408) = *(_OWORD *)(a2 + 160);
    if ((v6 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_41:
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 144);
  if ((v6 & 0x8000) != 0) {
    goto LABEL_42;
  }
LABEL_19:
  if ((v6 & 0x10000) != 0) {
LABEL_20:
  }
    *(_DWORD *)(a1 + 424) = *(_DWORD *)(a2 + 176);
LABEL_21:
  *(void *)(a1 + 256) |= v6;
  microuptime((timeval *)(a1 + 232));
  *(void *)(a1 + 456) = *(void *)(a2 + 16);
  return v3 >= v4;
}

uint64_t invalidate_lnode_attr_locked(uint64_t result)
{
  *(void *)(result + 232) = 0;
  *(void *)(result + 240) = 0;
  return result;
}

BOOL update_lnode_attr(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  BOOL updated = update_lnode_attr_locked(a1, a2);
  lck_mtx_unlock(v4);
  return updated;
}

uint64_t lifs_num_cpus()
{
  unsigned int v2 = 0;
  size_t v1 = 4;
  if (sysctlbyname("hw.ncpu", &v2, &v1, 0, 0)) {
    return 8;
  }
  else {
    return v2;
  }
}

uint64_t lifs_next_powerof2(uint64_t result, int8x8_t a2)
{
  if (result <= 1) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = result;
  }
  if ((result & 0x80000000) == 0)
  {
    a2.i32[0] = result;
    uint8x8_t v2 = (uint8x8_t)vcnt_s8(a2);
    v2.i16[0] = vaddlv_u8(v2);
    if (v2.i32[0] >= 2u)
    {
      unsigned int v3 = (result - 1) | ((result - 1) >> 1) | (((result - 1) | ((result - 1) >> 1)) >> 2);
      unsigned int v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      return (v4 | HIWORD(v4)) + 1;
    }
  }
  return result;
}

uint64_t get_lifs_port(void *a1)
{
  lck_rw_lock_shared((lck_rw_t *)&lifs_port_rwlock);
  uint64_t v2 = lifs_port;
  *a1 = lifs_port;
  if ((unint64_t)(v2 + 1) > 1) {
    return 0;
  }
  _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Invalid lifs host port or port dying");
  *a1 = 0;
  lck_rw_unlock_shared((lck_rw_t *)&lifs_port_rwlock);
  return 5;
}

void release_lifs_port()
{
}

uint64_t init_statfs(uint64_t a1, const char *a2, const char *a3)
{
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)a1 = 0x100000;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(void *)(a1 + 52) = 0;
  *(_OWORD *)(a1 + 4) = xmmword_3C20;
  return 0;
}

uint64_t lifs_lookup_node(uint64_t a1, void *a2)
{
  uint32_t v4 = crc32(0xFFF1u, a2, 0x40uLL);
  int v5 = (uint64_t *)(*(void *)(a1 + 560) + 8 * (*(void *)(a1 + 568) & v4));
  a1 += 112;
  lck_mtx_lock((lck_mtx_t *)a1);
  uint64_t v6 = lifs_lookup_node_locked(a2, v5, v4);
  lck_mtx_unlock((lck_mtx_t *)a1);
  return v6;
}

uint64_t lifs_lookup_node_locked(void *__s2, uint64_t *a2, int a3)
{
  for (uint64_t i = *a2; i; uint64_t i = *(void *)(i + 208))
  {
    if (*(_DWORD *)(i + 64) == a3 && !memcmp((const void *)i, __s2, 0x40uLL)) {
      break;
    }
  }
  return i;
}

uint64_t lifs_create_node(mount *a1, long long *a2, vnode *a3, uint64_t a4, uint64_t a5, vnode_t *a6)
{
  if (!a1) {
    return 22;
  }
  uint64_t v70 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long data = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v64 = 0;
  vnode_t vpp = 0;
  int v8 = (char *)vfs_fsprivate(a1);
  uint32_t v9 = crc32(0xFFF1u, a2, 0x40uLL);
  uint64_t v10 = 0;
  int v11 = (uint64_t *)(*((void *)v8 + 70) + 8 * (*((void *)v8 + 71) & v9));
  uint64_t v52 = v8;
  for (uint64_t i = (lck_mtx_t *)(v8 + 112); ; msleep((void *)v13, i, 1040, "lnode_larval", 0))
  {
    lck_mtx_lock(i);
    uint64_t v13 = lifs_lookup_node_locked(a2, v11, v9);
    if (!v13)
    {
      lck_mtx_unlock(i);
      if (!v10)
      {
        uint64_t v10 = kalloc_type_impl();
        lck_mtx_init((lck_mtx_t *)(v10 + 112), (lck_grp_t *)lifs_node_grp, 0);
        lck_rw_init((lck_rw_t *)(v10 + 504), (lck_grp_t *)lifs_node_grp, 0);
        lck_rw_init((lck_rw_t *)(v10 + 576), (lck_grp_t *)lifs_node_grp, 0);
        lck_rw_init((lck_rw_t *)(v10 + 824), (lck_grp_t *)lifs_node_grp, 0);
        lck_rw_init((lck_rw_t *)(v10 + 72), (lck_grp_t *)lifs_node_grp, 0);
        long long v14 = *a2;
        long long v15 = a2[1];
        long long v16 = a2[3];
        *(_OWORD *)(v10 + 32) = a2[2];
        *(_OWORD *)(v10 + 48) = v16;
        *(_OWORD *)uint64_t v10 = v14;
        *(_OWORD *)(v10 + 16) = v15;
        *(_DWORD *)(v10 + 64) = v9;
      }
      lck_mtx_lock(i);
      uint64_t v13 = lifs_lookup_node_locked(a2, v11, v9);
      if (!v13) {
        break;
      }
    }
    int v17 = *(vnode **)(v13 + 224);
    if (v17)
    {
      vnode_t vpp = *(vnode_t *)(v13 + 224);
      uint32_t v18 = *(_DWORD *)(v13 + 448);
      lck_mtx_unlock(i);
      uint64_t v19 = vnode_getwithvid(v17, v18);
      if (v10) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    *(_DWORD *)(v13 + 132) |= 2u;
  }
  uint64_t v21 = *v11;
  if (*v11)
  {
    if (*(uint64_t **)(v21 + 216) != v11)
    {
      __break(0xBFFDu);
      JUMPOUT(0x18740);
    }
    *(void *)(v10 + 208) = v21;
    long long v22 = (uint64_t *)(v10 + 208);
    *(void *)(v21 + 216) = v10 + 208;
  }
  else
  {
    *(void *)(v10 + 208) = 0;
    long long v22 = (uint64_t *)(v10 + 208);
  }
  *int v11 = v10;
  *(void *)(v10 + 216) = v11;
  *(_DWORD *)(v10 + 132) |= 1u;
  lck_mtx_unlock(i);
  *(void *)&long long v67 = v10;
  *(void *)&long long data = a1;
  int v23 = *(_DWORD *)(a5 + 24);
  int v24 = 1;
  uint64_t v25 = a4;
  uint64_t v26 = v52;
  uint64_t v27 = a3;
  switch(v23)
  {
    case 0:
    case 1:
      __asm { BTI             j; jumptable 00000000000183F0 cases 0,1 }
      int v24 = 0;
      break;
    case 2:
      break;
    case 3:
      __asm { BTI             j; jumptable 00000000000183F0 case 3 }
      int v24 = 0;
      int v23 = 5;
      break;
    case 4:
      __asm { BTI             j; jumptable 00000000000183F0 case 4 }
      int v24 = 0;
      int v23 = 7;
      break;
    case 5:
      __asm { BTI             j; jumptable 00000000000183F0 case 5 }
      int v24 = 0;
      int v23 = 4;
      break;
    case 6:
      __asm { BTI             j; jumptable 00000000000183F0 case 6 }
      int v24 = 0;
      int v23 = 3;
      break;
    case 7:
      __asm { BTI             j; jumptable 00000000000183F0 case 7 }
      int v24 = 0;
      int v23 = 6;
      break;
    default:
      int v24 = 0;
      int v23 = 8;
      uint64_t v25 = a4;
      uint64_t v26 = v52;
      uint64_t v27 = a3;
      break;
  }
  __asm { BTI             j; jumptable 00000000000183F0 case 2 }
  DWORD2(data) = v23;
  *(void *)&long long v66 = "lifs";
  *((void *)&v66 + 1) = v27;
  *((void *)&v67 + 1) = lifs_vnodeop_p;
  *(void *)&long long v68 = 0;
  DWORD2(v68) = 0;
  *(void *)&long long v69 = *(void *)(a5 + 48);
  *((void *)&v69 + 1) = v25;
  LODWORD(v70) = 4;
  uint64_t v32 = vnode_fsnode(v27);
  long long v33 = v32[2];
  long long v34 = v32[3];
  long long v35 = v32[1];
  *(_OWORD *)(v10 + 136) = *v32;
  *(_OWORD *)(v10 + 184) = v34;
  *(_OWORD *)(v10 + 168) = v33;
  *(_OWORD *)(v10 + 152) = v35;
  *(void *)(v10 + 200) = v26;
  *(_DWORD *)(v10 + 104) = 0;
  uint64_t v36 = *(unsigned char **)(v25 + 40);
  if (v36 && *(int *)(v25 + 48) >= 3 && *v36 == 46 && v36[1] == 95) {
    *(_DWORD *)(v10 + 128) |= 0x500u;
  }
  int v37 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == -1) {
    int v38 = v24;
  }
  else {
    int v38 = 0;
  }
  if (v38 == 1)
  {
    long long v58 = v67;
    long long v59 = v68;
    long long v60 = v69;
    long long v56 = data;
    long long v57 = v66;
    *(void *)&long long v61 = v70;
    *((void *)&v61 + 1) = lifs_mirror_mount_trigger_resolve;
    *(void *)&long long v62 = lifs_mirror_mount_trigger_unresolve;
    *((void *)&v62 + 1) = lifs_mirror_mount_trigger_rearm;
    long long v63 = 0uLL;
    uint64_t v64 = 5;
    p_long long data = &v56;
    uint32_t v40 = 21590;
    uint32_t v41 = 136;
  }
  else
  {
    p_long long data = &data;
    uint32_t v40 = 0;
    uint32_t v41 = 88;
  }
  uint64_t v19 = vnode_create(v40, v41, p_data, &vpp);
  if (!v19)
  {
    *(_DWORD *)(v10 + 448) = vnode_vid(vpp);
    update_lnode_attr_locked(v10, a5);
    uint64_t v42 = *((void *)v26 + 4);
    if (v42 & 8) != 0 && (*(unsigned char *)(v10 + 424)) {
      *(_DWORD *)(v10 + 128) |= 0x800u;
    }
    if ((v42 & 0x40) != 0 && (*(unsigned char *)(v10 + 424) & 2) != 0) {
      *(_DWORD *)(v10 + 128) |= 0x2000u;
    }
    uint64_t v43 = *(void *)(a5 + 48);
    *(void *)(v10 + 488) = v43;
    int v44 = *(_DWORD *)(v10 + 128);
    if ((v44 & 0x2000) == 0)
    {
      *(void *)(v10 + 496) = v43;
      v44 |= 0x4000u;
      *(_DWORD *)(v10 + 128) = v44;
    }
    *(void *)(v10 + 472) = 0;
    *(void *)(v10 + 480) = v10 + 472;
    *(void *)(v10 + 840) = 0;
    *(void *)(v10 + 848) = v10 + 840;
    if ((v44 & 0x800) != 0) {
      lifs_init_extent_tree((void *)(v10 + 816));
    }
    lifs_get_supported_xattrs(v10);
    lck_mtx_lock(i);
    *(void *)(v10 + 224) = vpp;
    int v45 = *(_DWORD *)(v10 + 132);
    if ((v45 & 2) != 0)
    {
      *(_DWORD *)(v10 + 132) = v45 & 0xFFFFFFFD;
      lck_mtx_unlock(i);
      wakeup((void *)v10);
    }
    else
    {
      lck_mtx_unlock(i);
    }
LABEL_12:
    uint64_t v19 = 0;
    *a6 = vpp;
    return v19;
  }
  if (DWORD2(data) == 2 && v37 == -1) {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create trigger vnode");
  }
  else {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create vnode", a3, a4);
  }
  lck_mtx_lock(i);
  uint64_t v46 = *v22;
  if (!*v22)
  {
    long long v48 = *(void **)(v10 + 216);
    if (*v48 == v10) {
      goto LABEL_60;
    }
LABEL_64:
    __break(0xBFFDu);
    JUMPOUT(0x1874CLL);
  }
  if (*(uint64_t **)(v46 + 216) != v22)
  {
    __break(0xBFFDu);
    JUMPOUT(0x18758);
  }
  long long v47 = *(void **)(v10 + 216);
  if (*v47 != v10) {
    goto LABEL_64;
  }
  *(void *)(v46 + 216) = v47;
  long long v48 = *(void **)(v10 + 216);
LABEL_60:
  *long long v48 = v46;
  int v49 = *(_DWORD *)(v10 + 132);
  *(_DWORD *)(v10 + 132) = 0;
  lck_mtx_unlock(i);
  if ((v49 & 2) != 0) {
    wakeup((void *)v10);
  }
LABEL_10:
  kfree_type_impl();
LABEL_11:
  if (!v19) {
    goto LABEL_12;
  }
  return v19;
}

uintptr_t lifs_mirror_mount_trigger_resolve(vnode *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = (int *)vnode_fsnode(a1);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400D5u, 0, (uintptr_t)a1, (uintptr_t)v6, 0);
  }
  if ((*(unsigned char *)(a2 + 5) & 0x80) != 0
    && a3 <= 0x1D
    && (((1 << a3) & 0x24713CEF) != 0 || a3 == 25 && is_machport_proc()))
  {
    uintptr_t v11 = vfs_resolver_result();
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x31400D6u, 1uLL, v6[108], v11, 0);
    }
    return v11;
  }
  if (vnode_mountedhere(a1)) {
    goto LABEL_5;
  }
  int v12 = lifs_set_busy((uint64_t)v6);
  if (v12)
  {
    int v9 = v12;
    char v7 = 0;
    goto LABEL_14;
  }
  if (vnode_mountedhere(a1))
  {
    lifs_clear_busy((uint64_t)v6);
LABEL_5:
    char v7 = 0;
LABEL_6:
    int v8 = v6[108];
    v6[108] = v8 + 1;
    if (__OFADD__(v8, 1)) {
      lifs_mirror_mount_trigger_resolve_cold_1();
    }
    int v9 = 0;
    unsigned int v10 = 0;
    goto LABEL_15;
  }
  lck_mtx_lock((lck_mtx_t *)(v6 + 28));
  int v14 = v6[32];
  lck_mtx_unlock((lck_mtx_t *)(v6 + 28));
  if ((v14 & 0x10) != 0)
  {
    char v7 = 0;
    int v9 = 89;
LABEL_32:
    lifs_clear_busy((uint64_t)v6);
    goto LABEL_14;
  }
  char v7 = vnode_getparent(a1);
  if (!v7 || vnode_vtype(a1) != VDIR)
  {
    int v9 = 22;
    goto LABEL_32;
  }
  int v9 = lifs_mirror_mount_domount((int)v7, a1, a2);
  lifs_clear_busy((uint64_t)v6);
  if (!v9) {
    goto LABEL_6;
  }
LABEL_14:
  unsigned int v10 = 3;
LABEL_15:
  uintptr_t v11 = vfs_resolver_result();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400D6u, v10, v6[108], v11, v9);
  }
  if (v7) {
    vnode_put(v7);
  }
  return v11;
}

uint64_t lifs_mirror_mount_trigger_unresolve(vnode *a1, int a2, uint64_t a3, vfs_context *a4)
{
  vnode_mount(a1);
  if (!a1) {
    return 22;
  }
  char v7 = (char *)vnode_fsnode(a1);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400D5u, 1uLL, (uintptr_t)a1, (uintptr_t)v7, 0);
  }
  lck_mtx_lock((lck_mtx_t *)(v7 + 112));
  int v8 = vnode_mountedhere(a1);
  if (v8)
  {
    int v9 = vfs_statfs(v8);
    int v10 = vfs_unmountbyfsid(&v9->f_fsid, a2, a4);
    if (v10)
    {
      int v11 = v10;
      unsigned int v12 = 3;
    }
    else
    {
      int v14 = *((_DWORD *)v7 + 108);
      *((_DWORD *)v7 + 108) = v14 + 1;
      if (__OFADD__(v14, 1)) {
        lifs_mirror_mount_trigger_unresolve_cold_1();
      }
      int v11 = 0;
      unsigned int v12 = 2;
    }
  }
  else
  {
    unsigned int v12 = 3;
    int v11 = 2;
  }
  uintptr_t v13 = vfs_resolver_result();
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400D6u, v12, *((int *)v7 + 108), v13, v11);
  }
  lck_mtx_unlock((lck_mtx_t *)(v7 + 112));
  return v13;
}

uint64_t lifs_mirror_mount_trigger_rearm(vnode *a1)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = (char *)vnode_fsnode(a1);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400D5u, 2uLL, (uintptr_t)a1, (uintptr_t)v2, 0);
  }
  lck_mtx_lock((lck_mtx_t *)(v2 + 112));
  int v3 = *((_DWORD *)v2 + 108);
  *((_DWORD *)v2 + 108) = v3 + 1;
  if (__OFADD__(v3, 1)) {
    lifs_mirror_mount_trigger_rearm_cold_1();
  }
  vnode_mountedhere(a1);
  uintptr_t v4 = vfs_resolver_result();
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    mount_t v5 = vnode_mountedhere(a1);
    kernel_debug_filtered(0x31400D6u, 2 * (v5 == 0), *((int *)v2 + 108), v4, 0);
  }
  lck_mtx_unlock((lck_mtx_t *)(v2 + 112));
  return v4;
}

uint64_t lifs_get_supported_xattrs(uint64_t result)
{
  if ((*(unsigned char *)(result + 424) & 4) != 0)
  {
    uint64_t v1 = result;
    unint64_t v5 = 0;
    int v2 = lifs_getfsattr_call((long long *)result, "_N_supported_xattr_namessize", &v5, 8);
    if (v2 || !v5)
    {
      if (v2) {
        return printf("%s: node has declared limited xattr support, but we got an error: %d\n");
      }
      else {
        return printf("%s: node has declared limited xattr support, but we got an empty list\n");
      }
    }
    else
    {
      if (v5 > 0x100) {
        return printf("%s: supported xattrs list size is not reasonable: %llu\n");
      }
      int v3 = (_DWORD *)kalloc_data();
      uint64_t result = lifs_getfsattr_call((long long *)v1, "_O_supported_xattr_names", v3, v5);
      if (result)
      {
        printf("%s: failed to get supported xattr names: %d\n");
      }
      else
      {
        int v4 = v5;
        if (!*((unsigned char *)v3 + v5 - 1))
        {
          *(void *)(v1 + 608) = v3;
          *(_DWORD *)(v1 + 616) = v4;
          return result;
        }
        printf("%s: supported xattr names list not NUL terminated\n");
      }
      return kfree_data();
    }
  }
  return result;
}

void lifs_hashremove(uint64_t a1)
{
  int v2 = (lck_mtx_t *)(*(void *)(a1 + 200) + 112);
  lck_mtx_lock(v2);
  int v3 = *(_DWORD *)(a1 + 132);
  if (v3)
  {
    unsigned int v4 = v3 & 0xFFFFFFFE;
    uint64_t v5 = *(void *)(a1 + 208);
    *(_DWORD *)(a1 + 132) = v4;
    if (v5)
    {
      if (*(void *)(v5 + 216) == a1 + 208)
      {
        uint64_t v6 = *(void **)(a1 + 216);
        if (*v6 == a1)
        {
          *(void *)(v5 + 216) = v6;
          char v7 = *(void **)(a1 + 216);
LABEL_7:
          *char v7 = v5;
          goto LABEL_8;
        }
      }
    }
    else
    {
      char v7 = *(void **)(a1 + 216);
      if (*v7 == a1) {
        goto LABEL_7;
      }
    }
    __break(0xBFFDu);
    JUMPOUT(0x18D9CLL);
  }
LABEL_8:

  lck_mtx_unlock(v2);
}

uint64_t convert_va_active_to_requested_attributes(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = (16 * (int)v1) & 0x40;
  if ((v1 & 0x10) != 0) {
    uint64_t v2 = 64;
  }
  uint64x2_t v3 = (uint64x2_t)vdupq_n_s64(v1);
  int8x16_t v4 = vorrq_s8(vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_3C30), (int8x16_t)xmmword_3C60), vandq_s8((int8x16_t)vshlq_u64(v3, (uint64x2_t)xmmword_3C40), (int8x16_t)xmmword_3C50));
  return *(void *)&vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) | (2 * (int)v1) & 0x2000 | (v1 >> 2) & 0x4000 | (v1 >> 15) & 0x8000 | v2;
}

uint64_t lifs_pack_vap(uint64_t result, uint64_t a2, mount_t mp)
{
  uint64_t v5 = result;
  uint64_t v6 = *(void *)(a2 + 8);
  if ((v6 & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)(result + 8);
  if ((v7 & 0x1000000) != 0)
  {
    uint64_t v8 = *(int *)(a2 + 24);
    if (v8 > 7) {
      int v9 = 8;
    }
    else {
      int v9 = dword_3C70[v8];
    }
    *(_DWORD *)(result + 224) = v9;
    *(void *)result |= 0x1000000uLL;
    if ((v7 & 0x800000000) == 0)
    {
LABEL_4:
      if ((v7 & 0x2000000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v10 = *(int *)(a2 + 24);
  if (v10 > 7) {
    int v11 = 8;
  }
  else {
    int v11 = dword_3C70[v10];
  }
  *(_DWORD *)(result + 328) = v11;
  *(void *)result |= 0x800000000uLL;
  if ((v7 & 0x2000000000) != 0)
  {
LABEL_14:
    uint64_t v12 = *(int *)(a2 + 24);
    if (v12 > 7) {
      int v13 = 0;
    }
    else {
      int v13 = dword_3C90[v12];
    }
    uint64_t result = vfs_flags(mp);
    if (result) {
      int v14 = 4;
    }
    else {
      int v14 = 6;
    }
    *(_DWORD *)(v5 + 336) = v14 | v13;
    *(void *)v5 |= 0x2000000000uLL;
    uint64_t v6 = *(void *)(a2 + 8);
  }
LABEL_21:
  uint64_t v15 = *(void *)(v5 + 8);
  if ((v15 & 0x200) != 0 && (v6 & 2) != 0)
  {
    int v16 = *(_DWORD *)(a2 + 28);
    if (v6)
    {
      __int16 v17 = v16 & 0xFFF;
      int v18 = *(_DWORD *)(a2 + 24) - 1;
      if (v18 > 6) {
        LOWORD(v19) = 0;
      }
      else {
        int v19 = dword_3CB0[v18];
      }
      LOWORD(v16) = v19 | v17;
    }
    *(_WORD *)(v5 + 76) = v16;
    *(void *)v5 |= 0x200uLL;
  }
  if ((v15 & 0x80) != 0 && (v6 & 8) != 0)
  {
    *(_DWORD *)(v5 + 68) = *(_DWORD *)(a2 + 36);
    *(void *)v5 |= 0x80uLL;
  }
  if ((v15 & 2) != 0)
  {
    if ((v6 & 4) != 0) {
      uint64_t v20 = *(unsigned int *)(a2 + 32);
    }
    else {
      uint64_t v20 = 1;
    }
    *(void *)(v5 + 24) = v20;
    *(void *)v5 |= 2uLL;
  }
  if ((v15 & 0x100) != 0 && (v6 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 72) = *(_DWORD *)(a2 + 40);
    *(void *)v5 |= 0x100uLL;
  }
  if ((v15 & 0x400) != 0 && (v6 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = *(_DWORD *)(a2 + 44);
    *(void *)v5 |= 0x400uLL;
  }
  if ((v6 & 0x40) != 0)
  {
    if ((v15 & 0x10) != 0)
    {
      *(void *)(v5 + 48) = *(void *)(a2 + 48);
      *(void *)v5 |= 0x10uLL;
    }
    if ((v15 & 4) != 0)
    {
      *(void *)(v5 + 32) = *(void *)(a2 + 48);
      *(void *)v5 |= 4uLL;
    }
  }
  if ((v6 & 0x80) != 0)
  {
    if ((v15 & 0x20) != 0)
    {
      *(void *)(v5 + 56) = *(void *)(a2 + 56);
      *(void *)v5 |= 0x20uLL;
    }
    if ((v15 & 8) != 0)
    {
      *(void *)(v5 + 40) = *(void *)(a2 + 56);
      *(void *)v5 |= 8uLL;
    }
  }
  if ((v15 & 0x20000) != 0 && (v6 & 0x100) != 0)
  {
    *(void *)(v5 + 176) = *(void *)(a2 + 64);
    *(void *)v5 |= 0x20000uLL;
  }
  if ((v15 & 0x80000) != 0 && (v6 & 0x200) != 0)
  {
    *(void *)(v5 + 192) = *(void *)(a2 + 72);
    *(void *)v5 |= 0x80000uLL;
  }
  if ((v15 & 0x2000) != 0 && (v6 & 0x400) != 0)
  {
    *(_OWORD *)(v5 + 112) = *(_OWORD *)(a2 + 80);
    *(void *)v5 |= 0x2000uLL;
  }
  if ((v15 & 0x4000) != 0 && (v6 & 0x800) != 0)
  {
    *(_OWORD *)(v5 + 128) = *(_OWORD *)(a2 + 96);
    *(void *)v5 |= 0x4000uLL;
  }
  if ((v15 & 0x8000) != 0 && (v6 & 0x1000) != 0)
  {
    *(_OWORD *)(v5 + 144) = *(_OWORD *)(a2 + 112);
    *(void *)v5 |= 0x8000uLL;
  }
  if ((v15 & 0x1000) != 0 && (v6 & 0x2000) != 0)
  {
    *(_OWORD *)(v5 + 96) = *(_OWORD *)(a2 + 128);
    *(void *)v5 |= 0x1000uLL;
  }
  if ((v15 & 0x10000) != 0 && (v6 & 0x4000) != 0)
  {
    *(_OWORD *)(v5 + 160) = *(_OWORD *)(a2 + 144);
    *(void *)v5 |= 0x10000uLL;
  }
  if ((v15 & 0x40000000) != 0 && (v6 & 0x8000) != 0)
  {
    *(_OWORD *)(v5 + 296) = *(_OWORD *)(a2 + 160);
    *(void *)v5 |= 0x40000000uLL;
  }
  if ((v15 & 0x20000000000) != 0)
  {
    uint64_t result = (uint64_t)vfs_statfs(mp);
    *(void *)(v5 + 392) = *(void *)(result + 60);
    uint64_t v15 = *(void *)(v5 + 8);
    *(void *)v5 |= 0x20000000000uLL;
    if ((v15 & 0x100000) == 0)
    {
LABEL_79:
      if ((v15 & 0x400000000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_90;
    }
  }
  else if ((v15 & 0x100000) == 0)
  {
    goto LABEL_79;
  }
  uint64_t result = (uint64_t)vfs_statfs(mp);
  *(_DWORD *)(v5 + 200) = *(_DWORD *)(result + 60);
  uint64_t v15 = *(void *)(v5 + 8);
  *(void *)v5 |= 0x100000uLL;
  if ((v15 & 0x400000000) == 0)
  {
LABEL_80:
    if ((v15 & 0x400000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t result = (uint64_t)vfs_statfs(mp);
  *(_DWORD *)(v5 + 324) = *(_DWORD *)(result + 60);
  uint64_t v15 = *(void *)(v5 + 8);
  *(void *)v5 |= 0x400000000uLL;
  if ((v15 & 0x400000) == 0)
  {
LABEL_81:
    if ((v15 & 0x200000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 216) = 0;
  *(void *)v5 |= 0x400000uLL;
  if ((v15 & 0x200000) == 0)
  {
LABEL_82:
    if ((v15 & 1) == 0) {
      goto LABEL_83;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(void *)(v5 + 208) = 0;
  *(void *)v5 |= 0x200000uLL;
  if ((v15 & 1) == 0)
  {
LABEL_83:
    if ((v15 & 0x40) == 0) {
      goto LABEL_84;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v5 + 20) = 0;
  *(void *)v5 |= 1uLL;
  if ((v15 & 0x40) == 0)
  {
LABEL_84:
    if ((v15 & 0x800000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v5 + 64) = 0x100000;
  *(void *)v5 |= 0x40uLL;
  if ((v15 & 0x800000) == 0)
  {
LABEL_85:
    if ((v15 & 0x20000000) == 0) {
      return result;
    }
    goto LABEL_86;
  }
LABEL_95:
  *(_DWORD *)(v5 + 220) = 126;
  *(void *)v5 |= 0x800000uLL;
  if ((v15 & 0x20000000) == 0) {
    return result;
  }
LABEL_86:
  *(void *)(v5 + 280) = 1;
  *(void *)v5 |= 0x20000000uLL;
  return result;
}

uint64_t convert_vnode_attr(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a2 = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  if ((v3 & 0x200) != 0)
  {
    *(_DWORD *)(a1 + 28) = *(unsigned __int16 *)(a2 + 76);
    uint64_t v2 = 2;
    *(void *)(a1 + 8) = 2;
    if ((v3 & 0x80) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 68);
  v2 |= 8uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 72);
  v2 |= 0x10uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 80);
  v2 |= 0x20uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(void *)(a1 + 48) = *(void *)(a2 + 32);
  v2 |= 0x40uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  v2 |= 0x40uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x4000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 128);
  v2 |= 0x800uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x2000) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 112);
  v2 |= 0x400uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x1000) == 0)
  {
LABEL_10:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 160);
    v2 |= 0x4000uLL;
    *(void *)(a1 + 8) = v2;
    if ((v3 & 0x40000000) == 0) {
      return 0;
    }
    goto LABEL_12;
  }
LABEL_22:
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 96);
  v2 |= 0x2000uLL;
  *(void *)(a1 + 8) = v2;
  if ((v3 & 0x10000) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((v3 & 0x40000000) != 0)
  {
LABEL_12:
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 296);
    *(void *)(a1 + 8) = v2 | 0x8000;
  }
  return 0;
}

uint64_t get_lifs_mount_from_node(uint64_t a1, void *a2)
{
  if (!a1)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing lifs node");
    return 22;
  }
  uint64_t v2 = *(void *)(a1 + 200);
  if (!v2)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing lifs mount");
    return 22;
  }
  *a2 = v2;
  uint64_t v3 = *(mount **)(v2 + 448);
  uint64_t v4 = 6;
  if (v3)
  {
    if (vfs_isforce(v3)) {
      return 6;
    }
    else {
      return 0;
    }
  }
  return v4;
}

uint64_t lifs_set_busy(uint64_t a1)
{
  uint64_t v2 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  while (1)
  {
    int v3 = *(_DWORD *)(a1 + 436);
    if ((v3 & 1) == 0) {
      break;
    }
    *(_DWORD *)(a1 + 436) = v3 | 2;
    uint64_t v4 = msleep((void *)a1, v2, 277, "lifsbusywant", 0);
    if (v4)
    {
      uint64_t v5 = v4;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
  *(_DWORD *)(a1 + 436) = v3 | 1;
LABEL_6:
  lck_mtx_unlock(v2);
  return v5;
}

uint64_t lifs_mirror_mount_domount(int a1, vnode_t vp, uint64_t a3)
{
  uint64_t v5 = vnode_fsnode(vp);
  uint64_t v21 = 0;
  int len = 1024;
  uint64_t v6 = kalloc_type_impl();
  uint64_t v7 = (char *)kalloc_data();
  uint64_t lifs_mount_from_node = get_lifs_mount_from_node((uint64_t)v5, &v21);
  if (!lifs_mount_from_node)
  {
    if (vn_getpath(vp, v7, &len))
    {
      uint64_t lifs_mount_from_node = 12;
    }
    else
    {
      strlcpy((char *)(v6 + 1112), v7, 0x400uLL);
      uint64_t v9 = *(int *)(a3 + 48);
      size_t v10 = strlen("lifs:/");
      strlcpy((char *)(v6 + 88), "lifs:/", 0x400uLL);
      int v11 = (char *)(v6 + 88 + strlen("lifs:/"));
      if (v10 + v9 + 1 <= 0x3FF) {
        size_t v12 = v9 + 1;
      }
      else {
        size_t v12 = 1024 - v10;
      }
      strlcpy(v11, *(const char **)(a3 + 40), v12);
      uint64_t v13 = v21;
      *(_DWORD *)uint64_t v6 = *(_DWORD *)(v21 + 24);
      *(void *)(v6 + 4) = 0x10000000100000;
      *(_DWORD *)(v6 + 20) = 0;
      unint64_t v14 = *(int *)(v13 + 552) / 0xF4240uLL;
      *(_DWORD *)(v6 + 12) = 0;
      *(_DWORD *)(v6 + 16) = v14;
      *(void *)(v6 + 2204) = *(void *)(v13 + 544);
      long long v16 = v5[2];
      long long v15 = v5[3];
      long long v17 = v5[1];
      *(_OWORD *)(v6 + 2136) = *v5;
      *(_OWORD *)(v6 + 2152) = v17;
      *(_OWORD *)(v6 + 2168) = v16;
      *(_OWORD *)(v6 + 2184) = v15;
      *(_DWORD *)(v6 + 2200) = 64;
      vfs_flags(*(mount_t *)(v13 + 448));
      uint64_t v18 = vfs_mount_at_path();
      uint64_t lifs_mount_from_node = v18;
      if (v18) {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to mirror mount - error %d", v18);
      }
    }
  }
  if (v7) {
    kfree_data();
  }
  if (v6) {
    kfree_type_impl();
  }
  return lifs_mount_from_node;
}

void lifs_clear_busy(uint64_t a1)
{
  uint64_t v2 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  int v3 = *(_DWORD *)(a1 + 436);
  *(_DWORD *)(a1 + 436) = v3 & 0xFFFFFFFC;
  lck_mtx_unlock(v2);
  if ((v3 & 2) != 0)
  {
    wakeup((void *)a1);
  }
}

uint64_t lifs_getfsattr_call(long long *a1, unsigned char *a2, _DWORD *a3, int a4)
{
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t result = get_lifs_mount_from_node((uint64_t)a1, &v17);
  if (result) {
    return result;
  }
  LODWORD(v15) = a4;
  long long v16 = a3;
  if (*a2 == 95)
  {
    int v9 = a2[1];
    if (v9 == 66)
    {
      if (a4 == 4) {
        goto LABEL_9;
      }
      return 22;
    }
    if (a4 != 8 && v9 == 78) {
      return 22;
    }
  }
LABEL_9:
  uint64_t result = lifs_getfsattr_request(v17, a1, (uint64_t)a2, (uint64_t)&v14);
  if (!result)
  {
    switch((int)v14)
    {
      case 0:
        __asm { BTI             j; jumptable 00000000000197D8 case 0 }
        if (*a2 != 95 || a2[1] != 66) {
          goto LABEL_24;
        }
        uint64_t result = 0;
        *a3 = v15;
        break;
      case 1:
        __asm { BTI             j; jumptable 00000000000197D8 case 1 }
        if (*a2 != 95 || a2[1] != 78) {
          goto LABEL_24;
        }
        uint64_t result = 0;
        *(void *)a3 = v15;
        break;
      case 2:
        __asm { BTI             j; jumptable 00000000000197D8 case 2 }
        if (*a2 == 95 && a2[1] == 79) {
          goto LABEL_19;
        }
        goto LABEL_24;
      case 3:
        __asm { BTI             j; jumptable 00000000000197D8 case 3 }
        if (*a2 == 95 && a2[1] == 83) {
LABEL_19:
        }
          uint64_t result = 0;
        else {
LABEL_24:
        }
          uint64_t result = 5;
        break;
      default:
        uint64_t result = 45;
        break;
    }
  }
  return result;
}

size_t lifs_mntfromname(uint64_t a1, long long *a2)
{
  uint64_t v4 = vfs_statfs(*(mount_t *)(a1 + 448));
  f_mntfromname = v4->f_mntfromname;
  if (!a2)
  {
    size_t v10 = "Dead volume";
    int v11 = v4->f_mntfromname;
    size_t v12 = 1024;
LABEL_13:
    return strlcpy(v11, v10, v12);
  }
  bzero(v4->f_mntfromname, 0x400uLL);
  if (lifs_getfsattr_call(a2, "_S_f_type", f_mntfromname, 1024)) {
    strlcpy(f_mntfromname, "unknown", 0x400uLL);
  }
  size_t result = strlen(f_mntfromname);
  if (1024 - result >= 4)
  {
    size_t v7 = result;
    uint64_t v8 = &f_mntfromname[result];
    strlcpy(&f_mntfromname[result], "://", 1024 - result);
    size_t v9 = 1021 - v7;
    if (lifs_getfsattr_call(a2, "_S_f_location", v8 + 3, v9))
    {
      strlcpy(v8 + 3, "unknown", v9);
    }
    else if (!strncmp(v8 + 3, "/dev/", 5uLL))
    {
      strlcpy((char *)(a1 + 733), v8 + 3, 0x26uLL);
      size_t v13 = strlen(v8 + 3);
      memmove(v8 + 3, v8 + 8, v13 - 4);
    }
    size_t result = strlen(v8 + 3);
    size_t v14 = v9 - result;
    if (v9 - result >= 2)
    {
      uint64_t v15 = &v8[result + 3];
      strlcpy(v15, "/", v14);
      long long v16 = v15 + 1;
      size_t v17 = v14 - 1;
      size_t result = lifs_getfsattr_call(a2, "_S_f_vol_name", v16, v17);
      if (result)
      {
        size_t v10 = "Untitled";
        int v11 = v16;
        size_t v12 = v17;
        goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t lifs_free_supported_xattrs(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 608);
  if (result)
  {
    *(void *)(a1 + 608) = 0;
    uint64_t result = kfree_data();
  }
  *(void *)(a1 + 608) = 0;
  *(_DWORD *)(a1 + 616) = 0;
  return result;
}

uint64_t lifs_cache_dirattr(uint64_t a1, uintptr_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = (lck_mtx_t *)(a1 + 112);
  *(_OWORD *)unsigned int arg3 = 0u;
  *(_OWORD *)uintptr_t arg4 = 0u;
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  if ((*(unsigned char *)(a1 + 128) & 0x80) == 0) {
    goto LABEL_2;
  }
  lck_rw_lock_shared((lck_rw_t *)(a1 + 576));
  unint64_t v13 = *(void *)(a1 + 560);
  unint64_t v14 = *(void *)(a1 + 568);
  uintptr_t v15 = *(void *)(a1 + 544);
  uintptr_t v16 = *(void *)(a1 + 552);
  lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
  if (v13 <= a3 && v14 > a3) {
    goto LABEL_39;
  }
  if (v14 == a3)
  {
    arg3[0] = v16;
    arg3[1] = v15;
    BOOL v9 = v16 == 0;
  }
  else
  {
LABEL_2:
    BOOL v9 = 1;
  }
  lck_mtx_unlock(v8);
  if (a3 && v9)
  {
    lck_rw_lock_shared((lck_rw_t *)(a1 + 576));
    size_t v10 = (_OWORD *)(a1 + 632);
    uint64_t v11 = -1;
    while (*((void *)v10 - 1) != a3)
    {
      size_t v10 = (_OWORD *)((char *)v10 + 24);
      if ((unint64_t)++v11 >= 7)
      {
        lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
        return 16;
      }
    }
    *(_OWORD *)unsigned int arg3 = *v10;
    lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
  }
  if (atomic_fetch_or((atomic_uint *volatile)(a2 + 728), 0) <= 0xFF)
  {
    uint64_t v18 = kalloc_data();
    uintptr_t v19 = arg3[0];
    uint64_t v20 = convert_va_active_to_requested_attributes(a4);
    uint64_t v12 = lifs_getattrlistbulk_request(a2, arg3[0], (long long *)a1, 0x10000, arg3[1], v20, v18, 0x10000, (uint64_t)arg3);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug_filtered(0x3140080u, a2, *(void *)(a1 + 224), arg3[1], SLODWORD(arg4[0]));
    }
    if (v12)
    {
      if (v12 == -1000)
      {
        lifs_invalidate_dirattrcache_ext(a1, 1);
      }
      else if (v12 == -1002)
      {
        LODWORD(arg4[0]) = 0;
        unint64_t v21 = a3;
LABEL_35:
        lck_mtx_lock(v8);
        if ((*(unsigned char *)(a1 + 128) & 0x80) == 0)
        {
          uint64_t v12 = 0;
LABEL_43:
          atomic_fetch_add((atomic_uint *volatile)(a2 + 728), 1u);
          lck_rw_lock_exclusive((lck_rw_t *)(a1 + 576));
          *(void *)(a1 + 528) = v18;
          *(_DWORD *)(a1 + 536) = 0x10000;
          *(void *)(a1 + 544) = arg3[1];
          *(void *)(a1 + 552) = v19;
          *(_DWORD *)(a1 + 540) = arg4[0];
          *(void *)(a1 + 560) = a3;
          *(void *)(a1 + 568) = v21;
          lck_rw_unlock_exclusive((lck_rw_t *)(a1 + 576));
          *(_DWORD *)(a1 + 128) |= 0x80u;
          lck_mtx_unlock(v8);
          if (!v12) {
            return v12;
          }
          kfree_data();
          return 0;
        }
        lck_rw_lock_shared((lck_rw_t *)(a1 + 576));
        unint64_t v27 = *(void *)(a1 + 560);
        unint64_t v28 = *(void *)(a1 + 568);
        lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
        if (v27 > a3 || v28 <= a3)
        {
          uint64_t v12 = lifs_invalidate_dirattrcache_locked(a1, 1);
          goto LABEL_43;
        }
LABEL_39:
        lck_mtx_unlock(v8);
        return 0;
      }
    }
    else
    {
      unint64_t v22 = LODWORD(arg4[0]);
      if (LODWORD(arg4[0]) <= 0x10000)
      {
        unint64_t v21 = a3;
        if (LODWORD(arg4[0]) >= 0xD0)
        {
          unint64_t v23 = a3 + 1;
          uint64_t v24 = v18;
          do
          {
            unint64_t v21 = v23;
            unint64_t v25 = *(unsigned __int16 *)(v24 + 8);
            uintptr_t v19 = *(void *)v24;
            if (!*(_WORD *)(v24 + 8) || v19 == -1) {
              break;
            }
            v24 += v25;
            BOOL v26 = v22 >= v25;
            v22 -= v25;
            if (!v26) {
              unint64_t v22 = 0;
            }
            unint64_t v23 = v21 + 1;
          }
          while (v22 > 0xCF);
        }
        goto LABEL_35;
      }
      uint64_t v12 = 22;
    }
    kfree_data();
    return v12;
  }
  return 12;
}

void lifs_invalidate_dirattrcache_ext(uint64_t a1, int a2)
{
  uint64_t v4 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  uint64_t v5 = lifs_invalidate_dirattrcache_locked(a1, a2);
  lck_mtx_unlock(v4);
  if (v5)
  {
    kfree_data();
  }
}

uint64_t lifs_invalidate_dirattrcache_locked(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 128);
  if ((v4 & 0x80) == 0)
  {
    uint64_t v5 = 0;
    if (!a2) {
      return v5;
    }
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a1 + 200);
  *(_DWORD *)(a1 + 128) = v4 & 0xFFFFFF7F;
  lck_rw_lock_exclusive((lck_rw_t *)(a1 + 576));
  uint64_t v5 = *(void *)(a1 + 528);
  *(void *)(a1 + 528) = 0;
  *(void *)(a1 + 536) = 0;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  lck_rw_unlock_exclusive((lck_rw_t *)(a1 + 576));
  atomic_fetch_add((atomic_uint *volatile)(v6 + 728), 0xFFFFFFFF);
  if (a2)
  {
LABEL_5:
    *(void *)(a1 + 232) = 0;
    *(void *)(a1 + 240) = 0;
  }
  return v5;
}

void lifs_invalidate_dirattrcache(uint64_t a1)
{
}

uint64_t lifs_readdir_cached(uint64_t a1, uintptr_t a2, unint64_t a3, void *a4, void *a5, uint64_t a6, vnode_attr *a7)
{
  off_t v14 = uio_offset(*(uio_t *)(a6 + 32));
  uint64_t v15 = lifs_cache_dirattr(a1, a2, v14, (uint64_t)a7);
  if (v15) {
    return v15;
  }
  long long v35 = a4;
  uint64_t v36 = a5;
  lck_rw_lock_shared((lck_rw_t *)(a1 + 576));
  uint64_t v16 = *(void *)(a1 + 528);
  uint64_t v17 = *(unsigned int *)(a1 + 540);
  unint64_t v18 = *(void *)(a1 + 560);
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140080u, *(void *)(a1 + 528), *(unsigned int *)(a1 + 540), *(void *)(a1 + 544), 0);
  }
  if (!v16)
  {
    lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
    return 0xFFFFFFFFLL;
  }
  if (v17)
  {
    if (*(void *)(a1 + 560) <= a3 && *(void *)(a1 + 568) > a3)
    {
      unsigned int lck = (lck_rw_t *)(a1 + 576);
      int v34 = 0;
      uint64_t v19 = 0;
      while (1)
      {
        unsigned int v20 = lifs_pack_attrlist_entry(a7, v16, v17, a6, a2, v14, v18);
        if (v20)
        {
          if (v20 != -2)
          {
            if (v20 == -1) {
              uint64_t v15 = 0;
            }
            else {
              uint64_t v15 = v20;
            }
LABEL_37:
            *uint64_t v36 = *(void *)(a1 + 544);
            lck_rw_unlock_shared(lck);
            *long long v35 = v19;
            uio_setoffset(*(uio_t *)(a6 + 32), v18);
            lck_rw_lock_exclusive(lck);
            uint64_t v28 = 0;
            while (*(void *)(a1 + v28 + 624) != a3)
            {
              v28 += 24;
              if (v28 == 192) {
                goto LABEL_44;
              }
            }
            uint64_t v29 = (unint64_t *)(a1 + v28 + 624);
            if (v19 == -1)
            {
              *uint64_t v29 = 0;
              *(void *)(a1 + v28 + 632) = 0;
              *(void *)(a1 + v28 + 640) = 0;
            }
            else
            {
              *uint64_t v29 = v18;
              uint64_t v30 = a1 + v28;
              *(void *)(v30 + 632) = v19;
              *(void *)(v30 + 640) = *(void *)(a1 + 544);
            }
LABEL_44:
            lck_rw_unlock_exclusive(lck);
            uint64_t v31 = *(_DWORD **)(a6 + 64);
            if (v31) {
              *uint64_t v31 = v34;
            }
            BOOL v26 = *(BOOL **)(a6 + 56);
            if (v26)
            {
              BOOL v27 = v19 == -1;
LABEL_48:
              *BOOL v26 = v27;
            }
            return v15;
          }
          uint64_t v19 = *(void *)v16;
          unsigned int v21 = *(unsigned __int16 *)(v16 + 8);
          if (!*(_WORD *)(v16 + 8) || v19 == -1)
          {
LABEL_19:
            uint64_t v15 = 0;
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v19 = *(void *)v16;
          unsigned int v21 = *(unsigned __int16 *)(v16 + 8);
          ++v34;
          if (*(_WORD *)(v16 + 8)) {
            BOOL v22 = v19 == -1;
          }
          else {
            BOOL v22 = 1;
          }
          if (v22)
          {
            uint64_t v15 = 0;
            ++v18;
            goto LABEL_37;
          }
        }
        v16 += v21;
        ++v18;
        v17 -= v21;
        if (!v17) {
          goto LABEL_19;
        }
      }
    }
    lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
    lck_rw_lock_exclusive((lck_rw_t *)(a1 + 576));
    uint64_t v23 = 0;
    while (1)
    {
      uint64_t v24 = a1 + v23;
      if (*(void *)(a1 + v23 + 624) == a3) {
        break;
      }
      v23 += 24;
      if (v23 == 192) {
        goto LABEL_30;
      }
    }
    *a4 = *(void *)(v24 + 632);
    *uint64_t v36 = *(void *)(v24 + 640);
LABEL_30:
    lck_rw_unlock_exclusive((lck_rw_t *)(a1 + 576));
    return 0xFFFFFFFFLL;
  }
  lck_rw_unlock_shared((lck_rw_t *)(a1 + 576));
  unint64_t v25 = *(_DWORD **)(a6 + 64);
  if (v25) {
    *unint64_t v25 = 0;
  }
  BOOL v26 = *(BOOL **)(a6 + 56);
  if (v26)
  {
    uint64_t v15 = 0;
    BOOL v27 = 1;
    goto LABEL_48;
  }
  return 0;
}

uint64_t lifs_pack_attrlist_entry(vnode_attr *vap, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  if ((int)a3 < 8) {
    return 0xFFFFFFFFLL;
  }
  int v8 = *(unsigned __int16 *)(a2 + 10);
  if (((v8 + 9) & 0x1FFF8u) > a3) {
    return 0xFFFFFFFFLL;
  }
  if (a7 < a6 || !*(void *)(a2 + 80) || !*(_WORD *)(a2 + 12)) {
    return 4294967294;
  }
  unsigned int v11 = *(unsigned __int16 *)(a2 + 12) + v8;
  if (v11 >= a3
    || (uint64_t v15 = *(uio **)(a4 + 32), v16 = *(vnode **)(a4 + 8), *(_WORD *)(a2 + 8)) && v11 >= *(unsigned __int16 *)(a2 + 8))
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Directory Entry name not within entry bounds");
    return 14;
  }
  va_name = vap->va_name;
  *(_OWORD *)&vap->va_supported = 0u;
  *(_OWORD *)&vap->va_vaflags = 0u;
  *(_OWORD *)&vap->va_total_size = 0u;
  *(_OWORD *)&vap->va_data_size = 0u;
  *(_OWORD *)&vap->va_iosize = 0u;
  *(_OWORD *)&vap->va_flags = 0u;
  vap->va_create_time = 0u;
  vap->va_access_time = 0u;
  vap->va_modify_time = 0u;
  vap->va_change_time = 0u;
  vap->va_backup_time = 0u;
  *(_OWORD *)&vap->va_fileid = 0u;
  *(_OWORD *)&vap->va_parentid = 0u;
  *(_OWORD *)&vap->va_filerev = 0u;
  vap->va_guuid = 0u;
  *(_OWORD *)&vap->va_nchildren = 0u;
  *(_OWORD *)&vap->va_reserved1 = 0u;
  *(_OWORD *)&vap->va_addedtime.tv_nsec = 0u;
  *(_OWORD *)&vap->va_document_id = 0u;
  *(_OWORD *)&vap->va_user_access = 0u;
  *(_OWORD *)&vap->va_finderinfo[12] = 0u;
  *(_OWORD *)&vap->va_finderinfo[28] = 0u;
  *(_OWORD *)&vap->va_rsrc_alloc = 0u;
  *(_OWORD *)&vap->va_write_gencount = 0u;
  *(_OWORD *)&vap->va_clone_id = 0u;
  *(_OWORD *)&vap->va_recursive_gencount = 0u;
  vap[1].va_active = 0;
  *(_OWORD *)&vap->va_type = 0u;
  vap->va_uuuid = 0u;
  vap->va_name = va_name;
  if (*(_DWORD *)(a2 + 40) == 2) {
    vtype v19 = VDIR;
  }
  else {
    vtype v19 = VREG;
  }
  uint64_t v20 = vfs_setup_vattr_from_attrlist(*(attrlist **)(a4 + 16), vap, v19, 0, *(vfs_context_t *)(a4 + 72));
  if (v20)
  {
    uint64_t v9 = v20;
LABEL_21:
    uio_setoffset(v15, a6);
    return v9;
  }
  lifs_pack_vap((uint64_t)vap, a2 + 16, *(mount_t *)(a5 + 448));
  if ((vap->va_active & 0x2000000) != 0)
  {
    strlcpy(vap->va_name, (const char *)(a2 + *(unsigned __int16 *)(a2 + 10)), 0x400uLL);
    vap->va_supported |= 0x2000000uLL;
  }
  user_ssize_t v21 = uio_resid(v15);
  BOOL v22 = vnode_mount(v16);
  uint64_t v9 = vfs_attr_pack_ext(v22, 0, v15, *(attrlist **)(a4 + 16), *(void *)(a4 + 48), vap, 0, *(vfs_context_t *)(a4 + 72));
  user_ssize_t v23 = uio_resid(v15);
  if (v9) {
    goto LABEL_21;
  }
  if (v21 == v23) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void add_sillyrename_entry(uint64_t a1, _OWORD *a2, const char *a3)
{
  uint64_t v6 = kalloc_type_impl();
  long long v7 = a2[2];
  long long v8 = a2[3];
  long long v9 = a2[1];
  *(_OWORD *)(v6 + 1040) = *a2;
  *(_OWORD *)(v6 + 1088) = v8;
  *(_OWORD *)(v6 + 1072) = v7;
  *(_OWORD *)(v6 + 1056) = v9;
  strlcpy((char *)(v6 + 16), a3, 0x400uLL);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  size_t v10 = (char *)(a1 + 472);
  while (1)
  {
    size_t v10 = *(char **)v10;
    if (!v10) {
      break;
    }
    if (!memcmp((const void *)a1, a2, 0x40uLL))
    {
      strlcpy(v10 + 16, a3, 0x400uLL);
      *(_DWORD *)(a1 + 128) |= 0x200u;
      lck_mtx_unlock((lck_mtx_t *)(a1 + 112));
      kfree_type_impl();
      return;
    }
  }
  unsigned int v11 = *(uint64_t **)(a1 + 480);
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = v11;
  *unsigned int v11 = v6;
  *(void *)(a1 + 480) = v6;
  *(_DWORD *)(a1 + 128) |= 0x200u;

  lck_mtx_unlock((lck_mtx_t *)(a1 + 112));
}

void move_sillyrename_entries(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 200);
  memset(v23, 0, sizeof(v23));
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  unsigned int lck = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  int v5 = *(_DWORD *)(a1 + 128);
  if ((v5 & 0x200) != 0)
  {
    uint64_t v6 = (void *)(a1 + 480);
    long long v8 = v21;
    long long v21 = *(_OWORD *)(a1 + 472);
    long long v7 = (long long *)v21;
    *(_OWORD *)(a1 + 472) = v8;
    long long v9 = v7;
    if (!v7) {
      long long v9 = &v21;
    }
    *((void *)v9 + 1) = &v21;
    if ((void)v8) {
      uint64_t v6 = (void *)(v8 + 8);
    }
    *uint64_t v6 = a1 + 472;
  }
  *(_DWORD *)(a1 + 128) = v5 & 0xFFFFFDFF;
  lck_mtx_unlock(lck);
  for (uint64_t i = (uint64_t *)v21; (void)v21; uint64_t i = (uint64_t *)v21)
  {
    uint64_t v11 = *i;
    if (*i)
    {
      if (*(uint64_t **)(v11 + 8) != i || (uint64_t v12 = (uint64_t **)i[1], *v12 != i))
      {
LABEL_19:
        __break(0xBFFDu);
        JUMPOUT(0x1A764);
      }
      *(void *)(v11 + 8) = v12;
      unint64_t v13 = (uint64_t **)i[1];
    }
    else
    {
      unint64_t v13 = (uint64_t **)i[1];
      if (*v13 != i) {
        goto LABEL_19;
      }
      *((void *)&v21 + 1) = i[1];
    }
    *unint64_t v13 = (uint64_t *)v11;
    uint64_t v14 = lifs_lookup_node(v4, i + 130);
    if (v14)
    {
      uint64_t v15 = v14;
      memset(v22, 0, sizeof(v22));
      if (!lifs_rename_request(v4, (const char *)i + 16, (_OWORD *)i + 65, (_OWORD *)a1, (const char *)i + 16, v22, (long long *)a2, 0, (uint64_t)v23))
      {
        lck_mtx_lock((lck_mtx_t *)(a2 + 112));
        update_lnode_attr_locked(a2, (uint64_t)&v23[11] + 8);
        lck_mtx_unlock((lck_mtx_t *)(a2 + 112));
        lck_mtx_lock(lck);
        update_lnode_attr_locked(a1, (uint64_t)v23);
        lck_mtx_unlock(lck);
        add_sillyrename_entry(a2, (_OWORD *)i + 65, (const char *)i + 16);
        lck_mtx_lock((lck_mtx_t *)(a2 + 112));
        int v16 = *(_DWORD *)(a2 + 448);
        lck_mtx_unlock((lck_mtx_t *)(a2 + 112));
        lck_mtx_lock((lck_mtx_t *)(v15 + 112));
        *(_DWORD *)(v15 + 452) = v16;
        lck_mtx_unlock((lck_mtx_t *)(v15 + 112));
        uint64_t v17 = *(vnode **)(v15 + 224);
        unint64_t v18 = *(vnode **)(a2 + 224);
        int v19 = strnlen((const char *)i + 16, 0x400uLL);
        vnode_update_identity(v17, v18, (const char *)i + 16, v19, 0, 1);
      }
    }
    kfree_type_impl();
  }
}

void cleanup_sillyrename_entries(uint64_t a1)
{
  *(void *)&long long v12 = 0;
  *((void *)&v12 + 1) = &v12;
  uint64_t v2 = (lck_mtx_t *)(a1 + 112);
  lck_mtx_lock((lck_mtx_t *)(a1 + 112));
  int v3 = *(_DWORD *)(a1 + 128);
  if ((v3 & 0x200) != 0)
  {
    uint64_t v4 = (void *)(a1 + 480);
    long long v6 = v12;
    long long v12 = *(_OWORD *)(a1 + 472);
    int v5 = (long long *)v12;
    *(_OWORD *)(a1 + 472) = v6;
    long long v7 = v5;
    if (!v5) {
      long long v7 = &v12;
    }
    *((void *)v7 + 1) = &v12;
    if ((void)v6) {
      uint64_t v4 = (void *)(v6 + 8);
    }
    *uint64_t v4 = a1 + 472;
  }
  *(_DWORD *)(a1 + 128) = v3 & 0xFFFFFDFF;
  lck_mtx_unlock(v2);
  for (uint64_t i = (uint64_t *)v12; (void)v12; uint64_t i = (uint64_t *)v12)
  {
    uint64_t v9 = *i;
    if (*i)
    {
      if (*(uint64_t **)(v9 + 8) != i || (size_t v10 = (uint64_t **)i[1], *v10 != i))
      {
LABEL_16:
        __break(0xBFFDu);
        JUMPOUT(0x1A87CLL);
      }
      *(void *)(v9 + 8) = v10;
      uint64_t v11 = (uint64_t **)i[1];
    }
    else
    {
      uint64_t v11 = (uint64_t **)i[1];
      if (*v11 != i) {
        goto LABEL_16;
      }
      *((void *)&v12 + 1) = i[1];
    }
    *uint64_t v11 = (uint64_t *)v9;
    kfree_type_impl();
  }
}

double lifs_pathconf(uint64_t a1, long long *a2)
{
  memset(v4, 0, 28);
  if (!lifs_pathconf_request(a1, a2, (uint64_t)v4))
  {
    *(_OWORD *)(a1 + 456) = v4[0];
    double result = *(double *)((char *)v4 + 12);
    *(_OWORD *)(a1 + 468) = *(_OWORD *)((char *)v4 + 12);
    *(void *)(a1 + 32) |= 1uLL;
  }
  return result;
}

uint64_t lifs_write_meta(vnode *a1, unsigned int a2, user_addr_t a3, int64_t arg2, uintptr_t size)
{
  uint64_t v9 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400F1u, (uintptr_t)a1, arg2, size, 0);
  }
  uintptr_t v10 = 0;
  uint64_t v11 = 22;
  if (a3 && (arg2 & 0x8000000000000000) == 0 && size - 1048577 >= 0xFFFFFFFFFFF00000)
  {
    buf_t bp = 0;
    uint64_t v12 = lifs_setup_buf_for_write(a1, v9, a3, size, &bp);
    if (v12)
    {
      uint64_t v11 = v12;
      uintptr_t v10 = 0;
    }
    else
    {
      unint64_t v13 = bp;
      uintptr_t v10 = buf_fromcache(bp) != 0;
      buf_setflags(v13, 2048);
      uint64_t v11 = buf_bwrite(v13);
    }
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400F2u, (uintptr_t)a1, v9, v10, (int)v11);
  }
  return v11;
}

uint64_t lifs_setup_buf_for_write(vnode *a1, daddr64_t a2, user_addr_t a3, size_t size, buf **a5)
{
  *a5 = 0;
  long long v8 = buf_getblk(a1, a2, size, 0, 0, 16);
  if (!v8) {
    return 12;
  }
  uint64_t v9 = v8;
  uintptr_t v10 = (void *)buf_dataptr(v8);
  uint64_t v11 = copyin(a3, v10, size);
  if (v11)
  {
    buf_markinvalid(v9);
    buf_brelse(v9);
  }
  else
  {
    *a5 = v9;
  }
  return v11;
}

uint64_t lifs_write_meta_async(vnode *a1, unsigned int a2, user_addr_t a3, int64_t arg2, uintptr_t size)
{
  uint64_t v9 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400F5u, (uintptr_t)a1, arg2, size, 0);
  }
  uintptr_t v10 = 0;
  uint64_t v11 = 22;
  if (a3 && (arg2 & 0x8000000000000000) == 0 && size - 1048577 >= 0xFFFFFFFFFFF00000)
  {
    buf_t bp = 0;
    uint64_t v12 = lifs_setup_buf_for_write(a1, v9, a3, size, &bp);
    if (v12)
    {
      uint64_t v11 = v12;
      uintptr_t v10 = 0;
    }
    else
    {
      unint64_t v13 = bp;
      uintptr_t v10 = buf_fromcache(bp) != 0;
      uint64_t v11 = buf_bawrite(v13);
    }
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400F6u, (uintptr_t)a1, v9, v10, (int)v11);
  }
  return v11;
}

uint64_t lifs_write_meta_delayed(vnode *a1, unsigned int a2, user_addr_t a3, int64_t arg2, uintptr_t size)
{
  uint64_t v9 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400F9u, (uintptr_t)a1, arg2, size, 0);
  }
  BOOL v10 = 0;
  uint64_t v11 = 22;
  if (a3 && (arg2 & 0x8000000000000000) == 0 && size - 1048577 >= 0xFFFFFFFFFFF00000)
  {
    buf_t bp = 0;
    uint64_t v12 = lifs_setup_buf_for_write(a1, v9, a3, size, &bp);
    if (v12)
    {
      uint64_t v11 = v12;
      BOOL v10 = 0;
    }
    else
    {
      unint64_t v13 = bp;
      int v14 = buf_fromcache(bp);
      BOOL v10 = v14 != 0;
      if (v14)
      {
        atomic_fetch_add(&lifs_write_meta_cache_hit, 1uLL);
        unint64_t v13 = bp;
      }
      uint64_t v11 = buf_bdwrite(v13);
      if (!v11) {
        lifs_schedule_meta_flush((uint64_t)a1);
      }
    }
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400FAu, (uintptr_t)a1, v9, v10, (int)v11);
  }
  return v11;
}

void lifs_schedule_meta_flush(uint64_t a1)
{
  lck_mtx_lock((lck_mtx_t *)&lifs_mount_list_lock);
  mount_with_devvp = lifs_get_mount_with_devvp(a1);
  if (mount_with_devvp)
  {
    int v3 = mount_with_devvp;
    uint64_t v4 = (lck_mtx_t *)(mount_with_devvp + 12);
    lck_mtx_lock((lck_mtx_t *)(mount_with_devvp + 12));
    if (v3[106] && (*((unsigned char *)v3 + 33) & 8) == 0)
    {
      uint64_t result = 0;
      clock_interval_to_deadline(0x32u, 0xF4240u, &result);
      thread_call_enter_delayed((thread_call_t)v3[106], result);
      v3[4] |= 0x800uLL;
    }
    lck_mtx_unlock(v4);
  }
  lck_mtx_unlock((lck_mtx_t *)&lifs_mount_list_lock);
}

uint64_t lifs_write_meta_subblock(vnode *arg1, unsigned int a2, int64_t arg2, uint64_t size, user_addr_t a5, uintptr_t arg3, uintptr_t arg4)
{
  uint64_t v13 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400FDu, (uintptr_t)arg1, arg2, arg3, arg4);
  }
  BOOL v14 = 0;
  buf_t bpp = 0;
  uint64_t v15 = 22;
  if ((arg2 & 0x8000000000000000) == 0 && (unint64_t)(size - 1048577) >= 0xFFFFFFFFFFF00000)
  {
    BOOL v14 = 0;
    uint64_t v15 = 22;
    if (a5)
    {
      if ((arg3 & 0x8000000000000000) == 0 && arg4 - 1048577 >= 0xFFFFFFFFFFF00000)
      {
        BOOL v14 = 0;
        uint64_t v15 = 22;
        if (arg3 >= arg2 && arg4 + arg3 <= size + arg2)
        {
          uint64_t v16 = buf_meta_bread(arg1, v13, size, 0, &bpp);
          if (v16)
          {
            uint64_t v15 = v16;
LABEL_14:
            buf_brelse(bpp);
            BOOL v14 = 0;
            goto LABEL_15;
          }
          uintptr_t v17 = buf_dataptr(bpp);
          uint64_t v15 = copyin(a5, (void *)(arg3 - arg2 + v17), arg4);
          if (v15)
          {
            buf_markinvalid(bpp);
            goto LABEL_14;
          }
          int v19 = buf_fromcache(bpp);
          BOOL v14 = v19 != 0;
          if (v19) {
            atomic_fetch_add(&lifs_write_meta_cache_hit, 1uLL);
          }
          uint64_t v15 = buf_bdwrite(bpp);
          if (!v15) {
            lifs_schedule_meta_flush((uint64_t)arg1);
          }
        }
      }
    }
  }
LABEL_15:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x31400FEu, (uintptr_t)arg1, v13, v14, (int)v15);
  }
  return v15;
}

uint64_t lifs_read_meta(vnode *arg1, unsigned int a2, user_addr_t a3, int64_t arg2, uintptr_t arg3)
{
  uint64_t v9 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140101u, (uintptr_t)arg1, arg2, arg3, 0);
  }
  uintptr_t v10 = 0;
  buf_t bpp = 0;
  uint64_t v11 = 22;
  if (a3 && (arg2 & 0x8000000000000000) == 0 && arg3 - 1048577 >= 0xFFFFFFFFFFF00000)
  {
    uint64_t v11 = buf_meta_bread(arg1, v9, arg3, 0, &bpp);
    if (v11)
    {
      buf_brelse(bpp);
      uintptr_t v10 = 0;
    }
    else
    {
      uint64_t v12 = (const void *)buf_dataptr(bpp);
      uint64_t v11 = copyout(v12, a3, arg3);
      int v13 = buf_fromcache(bpp);
      if (v13) {
        atomic_fetch_add(&lifs_read_meta_cache_hit, 1uLL);
      }
      uintptr_t v10 = v13 != 0;
      buf_brelse(bpp);
    }
  }
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140102u, (uintptr_t)arg1, v9, v10, (int)v11);
  }
  return v11;
}

uint64_t lifs_read_meta_with_ra(vnode *arg1, unsigned int a2, user_addr_t a3, int64_t arg2, uintptr_t arg3, uint64_t a6, int nrablks)
{
  uint64_t v12 = a2;
  uint64_t v13 = arg2 / a2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0)
  {
    user_addr_t v14 = a3;
    kernel_debug_filtered(0x3140105u, (uintptr_t)arg1, arg2, arg3, nrablks);
    a3 = v14;
  }
  uintptr_t v25 = arg3;
  buf_t bpp = 0;
  uintptr_t v15 = 0;
  *(_OWORD *)rablks = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v16 = 22;
  *(_OWORD *)rasizes = 0u;
  long long v28 = 0u;
  if (a3)
  {
    if ((arg2 & 0x8000000000000000) == 0 && v25 - 1048577 >= 0xFFFFFFFFFFF00000)
    {
      uintptr_t v15 = 0;
      uint64_t v16 = 22;
      if (a6)
      {
        if ((nrablks - 9) >= 0xFFFFFFF8)
        {
          user_addr_t udaddr = a3;
          uintptr_t v17 = 0;
          unint64_t v18 = (uintptr_t *)(a6 + 8);
          do
          {
            uintptr_t v19 = *v18;
            if (*v18 - 1048577 < 0xFFFFFFFFFFF00000)
            {
              uintptr_t v15 = 0;
              uint64_t v16 = 22;
              goto LABEL_19;
            }
            rasizes[v17] = v19;
            int64_t v20 = *(v18 - 1);
            rablks[v17] = v20 / v12;
            if ((kdebug_enable & 0xFFFFFFF7) != 0) {
              kernel_debug_filtered(0x3140104u, (uintptr_t)arg1, v17, v20, v19);
            }
            ++v17;
            v18 += 2;
          }
          while (nrablks != v17);
          uint64_t v16 = buf_meta_breadn(arg1, v13, v25, rablks, rasizes, nrablks, 0, &bpp);
          if (v16)
          {
            buf_brelse(bpp);
            uintptr_t v15 = 0;
          }
          else
          {
            long long v21 = (const void *)buf_dataptr(bpp);
            uint64_t v16 = copyout(v21, udaddr, v25);
            int v22 = buf_fromcache(bpp);
            if (v22) {
              atomic_fetch_add(&lifs_read_meta_cache_hit, 1uLL);
            }
            uintptr_t v15 = v22 != 0;
            buf_brelse(bpp);
          }
        }
      }
    }
  }
LABEL_19:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140106u, (uintptr_t)arg1, v13, v15, (int)v16);
  }
  return v16;
}

uint64_t lifs_flush_meta(vnode *a1, int a2)
{
  return 0;
}

uint64_t lifs_flush_meta_blocks(vnode *arg1, unsigned int a2, uintptr_t arg2, unsigned int a4, int a5)
{
  uintptr_t v7 = arg2;
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140109u, (uintptr_t)arg1, arg2, (int)a4, a5);
  }
  int v10 = 0;
  uint64_t v11 = 22;
  if (v7 && a4 - 9 >= 0xFFFFFFF8)
  {
    uintptr_t v26 = v7;
    int v27 = a5;
    uint64_t v12 = 0;
    int v10 = 0;
    uint64_t v13 = a2;
    uint64_t v25 = a4;
    while (1)
    {
      uintptr_t v14 = v7 + 16 * v12;
      uintptr_t v15 = (int *)(v14 + 8);
      if ((*(_DWORD *)(v14 + 8) - 1048577) < 0xFFF00000) {
        break;
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140108u, (uintptr_t)arg1, *(void *)v14, *(unsigned int *)(v14 + 8), *(unsigned int *)(v7 + 16 * v12 + 12));
      }
      uintptr_t v16 = v7 + 16 * v12;
      int v18 = *(_DWORD *)(v16 + 12);
      uintptr_t v17 = (unsigned int *)(v16 + 12);
      if (v18)
      {
        uintptr_t v19 = 0;
        do
        {
          uint64_t v20 = (*(void *)v14 + (*v15 * v19)) / v13;
          buf_t v21 = buf_getblk(arg1, v20, *v15, 0, 0, -2147483632);
          if (v21)
          {
            int v22 = v21;
            if ((kdebug_enable & 0xFFFFFFF7) != 0) {
              kernel_debug_filtered(0x3140108u, (uintptr_t)arg1, v19, v20, (uintptr_t)v21);
            }
            if ((buf_flags(v22) & 8) != 0)
            {
              if (v27) {
                buf_bwrite(v22);
              }
              else {
                buf_bawrite(v22);
              }
              if (__OFADD__(v10++, 1)) {
                lifs_flush_meta_blocks_cold_1();
              }
            }
            else
            {
              buf_brelse(v22);
            }
          }
          ++v19;
        }
        while (v19 < *v17);
      }
      ++v12;
      uintptr_t v7 = v26;
      if (v12 == v25)
      {
        uint64_t v11 = 0;
        goto LABEL_23;
      }
    }
    uint64_t v11 = 22;
  }
LABEL_23:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314010Au, (uintptr_t)arg1, v10, v11, 0);
  }
  return v11;
}

uint64_t lifs_clear_meta_blocks(vnode *arg1, unsigned int a2, uintptr_t arg2, unsigned int a4, int a5)
{
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314010Du, (uintptr_t)arg1, arg2, (int)a4, a5);
  }
  int v10 = 0;
  uint64_t v11 = 22;
  uintptr_t v25 = arg2;
  if (arg2 && a4 - 9 >= 0xFFFFFFF8)
  {
    uint64_t v12 = 0;
    int v10 = 0;
    uint64_t v13 = a2;
    uint64_t v26 = a4;
    uintptr_t v14 = arg2;
    while (1)
    {
      uintptr_t v15 = v14 + 16 * v12;
      uintptr_t v16 = (int *)(v15 + 8);
      if ((*(_DWORD *)(v15 + 8) - 1048577) < 0xFFF00000) {
        break;
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x314010Cu, (uintptr_t)arg1, *(void *)v15, *(unsigned int *)(v15 + 8), *(unsigned int *)(v14 + 16 * v12 + 12));
      }
      uint64_t v28 = v12;
      uintptr_t v17 = v14 + 16 * v12;
      int v19 = *(_DWORD *)(v17 + 12);
      int v18 = (unsigned int *)(v17 + 12);
      if (v19)
      {
        uintptr_t v20 = 0;
        int v27 = v10;
        uint64_t v21 = v10 ^ 0x7FFFFFFFu;
        do
        {
          uint64_t v22 = (*(void *)v15 + (*v16 * v20)) / v13;
          user_ssize_t v23 = buf_getblk(arg1, v22, *v16, 0, 0, 16);
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x314010Cu, (uintptr_t)arg1, v20, v22, (uintptr_t)v23);
          }
          buf_clear(v23);
          if (a5) {
            buf_bwrite(v23);
          }
          else {
            buf_bawrite(v23);
          }
          if (v21 == v20) {
            lifs_clear_meta_blocks_cold_1();
          }
          ++v20;
        }
        while (v20 < *v18);
        int v10 = v27 + v20;
        uintptr_t v14 = v25;
      }
      uint64_t v12 = v28 + 1;
      if (v28 + 1 == v26)
      {
        uint64_t v11 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v11 = 22;
  }
LABEL_21:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x314010Eu, (uintptr_t)arg1, v10, v11, 0);
  }
  return v11;
}

uint64_t lifs_purge_meta_blocks(vnode *arg1, unsigned int a2, uintptr_t arg2, unsigned int a4)
{
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140111u, (uintptr_t)arg1, arg2, (int)a4, 0);
  }
  int v8 = 0;
  uintptr_t v9 = arg2;
  uint64_t v10 = 22;
  uintptr_t v22 = v9;
  if (v9 && a4 - 9 >= 0xFFFFFFF8)
  {
    uint64_t v11 = 0;
    int v8 = 0;
    uint64_t v23 = a4;
    uintptr_t v12 = v9;
    while (1)
    {
      uintptr_t v13 = v12 + 16 * v11;
      if ((*(_DWORD *)(v13 + 8) - 1048577) < 0xFFF00000) {
        break;
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug_filtered(0x3140110u, (uintptr_t)arg1, *(void *)v13, *(unsigned int *)(v13 + 8), *(unsigned int *)(v12 + 16 * v11 + 12));
      }
      uintptr_t v14 = v12 + 16 * v11;
      int v16 = *(_DWORD *)(v14 + 12);
      uintptr_t v15 = (unsigned int *)(v14 + 12);
      if (v16)
      {
        uintptr_t v17 = 0;
        int v24 = v8;
        uint64_t v18 = v8 ^ 0x7FFFFFFFu;
        do
        {
          uint64_t v19 = *(void *)v13 + (*(_DWORD *)(v13 + 8) * v17);
          daddr64_t v20 = v19 / a2;
          if ((kdebug_enable & 0xFFFFFFF7) != 0) {
            kernel_debug_filtered(0x3140110u, (uintptr_t)arg1, v17, v19 / a2, 0);
          }
          buf_invalblkno(arg1, v20, 1);
          if (v18 == v17) {
            lifs_purge_meta_blocks_cold_1();
          }
          ++v17;
        }
        while (v17 < *v15);
        int v8 = v24 + v17;
        uintptr_t v12 = v22;
      }
      if (++v11 == v23)
      {
        uint64_t v10 = 0;
        goto LABEL_18;
      }
    }
    uint64_t v10 = 22;
  }
LABEL_18:
  if ((kdebug_enable & 0xFFFFFFF7) != 0) {
    kernel_debug_filtered(0x3140112u, (uintptr_t)arg1, v8, v10, 0);
  }
  return v10;
}

void lifs_update_freespace(uint64_t a1, unint64_t *a2)
{
  uint64_t v4 = (lck_mtx_t *)(a1 + 96);
  lck_mtx_lock((lck_mtx_t *)(a1 + 96));
  unint64_t v5 = a2[1];
  if (v5 > *(void *)(a1 + 864))
  {
    *(void *)(a1 + 864) = v5;
    unint64_t v6 = *a2;
    *(void *)(a1 + 856) = *a2;
    uint64_t v7 = *(void *)(a1 + 32);
    if ((v7 & 0x400) != 0 && v6 >= 0x46666667)
    {
      *(void *)(a1 + 32) = v7 & 0xFFFFFFFFFFFFFBFFLL;
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: lmp %p freespace 0x%llx sync write disabled", "lifs_update_freespace", (const void *)a1, v6);
    }
  }

  lck_mtx_unlock(v4);
}

void lifs_dev_ref(uint64_t a1)
{
}

void lifs_dev_rele(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 832);
  if (os_ref_release_barrier_external((os_ref_atomic_t *)(a1 + 832), 0) == 1)
  {
    lck_mtx_lock((lck_mtx_t *)(a1 + 96));
    uint64_t v3 = *(void *)(a1 + 32);
    if ((v3 & 0x80) != 0)
    {
      *(void *)(a1 + 32) = v3 & 0xFFFFFFFFFFFFFF7FLL;
      lck_mtx_unlock((lck_mtx_t *)(a1 + 96));
      wakeup(v2);
    }
    else
    {
      lck_mtx_unlock((lck_mtx_t *)(a1 + 96));
    }
  }
}

void IOCancelationWrapper::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void IOCancelationWrapper::IOCancelationWrapper(IOCancelationWrapper *this, const OSMetaClass *a2)
{
  OSObject::OSObject((OSObject *)this, a2)->__vftable = (OSObject_vtbl *)off_25CD8;
}

void IOCancelationWrapper::~IOCancelationWrapper(OSObject *this)
{
}

{
  OSObject::~OSObject(this);
}

{
  uint64_t vars8;

  OSObject::~OSObject(this);

  _OSObject_typed_operator_delete(&IOCancelationWrapper_ktv, this, 40);
}

void *IOCancelationWrapper::getMetaClass(IOCancelationWrapper *this)
{
  return &IOCancelationWrapper::gMetaClass;
}

uint64_t IOCancelationWrapper::MetaClass::alloc(IOCancelationWrapper::MetaClass *this)
{
  return 0;
}

uint64_t IOCancelationWrapper::init(IOCancelationWrapper *this, OSObject *a2)
{
  if (result)
  {
    unint64_t v5 = IOLockAlloc();
    *((void *)this + 4) = v5;
    *((void *)this + 2) = a2;
    *((_DWORD *)this + 6) = 0;
    *((unsigned char *)this + 28) = 0;
    if (a2)
    {
      ((void (*)(OSObject *))a2->retain)(a2);
      unint64_t v5 = (IOLock *)*((void *)this + 4);
    }
    return v5 != 0;
  }
  return result;
}

uint64_t IOCancelationWrapper::free(IOCancelationWrapper *this)
{
  uint64_t v2 = (IOLock *)*((void *)this + 4);
  if (v2) {
    IOLockFree(v2);
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
  }

  return ((uint64_t (*)(IOCancelationWrapper *))free)(this);
}

uint64_t IOCancelationWrapper::startUsingObjectAndGetReference(IOCancelationWrapper *this, OSObject **a2)
{
  if (!a2) {
    return 0;
  }
  if (*((unsigned char *)this + 28))
  {
LABEL_5:
    uint64_t result = 0;
    *a2 = 0;
    return result;
  }
  IOLockLock(*((IOLock **)this + 4));
  if (*((unsigned char *)this + 28))
  {
    IOLockUnlock(*((IOLock **)this + 4));
    goto LABEL_5;
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 32))(v5);
    unint64_t v6 = (OSObject *)*((void *)this + 2);
  }
  else
  {
    unint64_t v6 = 0;
  }
  *a2 = v6;
  ++*((_DWORD *)this + 6);
  IOLockUnlock(*((IOLock **)this + 4));
  return 1;
}

void IOCancelationWrapper::stopUsingObjectAndRelease(IOCancelationWrapper *this, OSObject *a2)
{
  if (*((OSObject **)this + 2) == a2)
  {
    if (a2) {
      ((void (*)(OSObject *))a2->release_0)(a2);
    }
  }
  else
  {
    IOLog("%s passed object other than object shared", "void IOCancelationWrapper::stopUsingObjectAndRelease(OSObject *)");
  }
  IOLockLock(*((IOLock **)this + 4));
  int v3 = *((_DWORD *)this + 6);
  BOOL v4 = __OFSUB__(v3, 1);
  int v5 = v3 - 1;
  if (v5 < 0 != v4)
  {
    IOLog("%s called when use count was zero", "void IOCancelationWrapper::stopUsingObjectAndRelease(OSObject *)");
    if (*((_DWORD *)this + 6)) {
      goto LABEL_7;
    }
  }
  else
  {
    *((_DWORD *)this + 6) = v5;
    if (v5)
    {
LABEL_7:
      unint64_t v6 = (IOLock *)*((void *)this + 4);
      IOLockUnlock(v6);
      return;
    }
  }
  int v7 = *((unsigned __int8 *)this + 29);
  *((unsigned char *)this + 29) = 0;
  IOLockUnlock(*((IOLock **)this + 4));
  if (v7)
  {
    int v8 = (IOLock *)*((void *)this + 4);
    IOLockWakeup(v8, this, 0);
  }
}

OSMetaClass *_GLOBAL__sub_I_IOCancelationWrapper_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&IOCancelationWrapper::gMetaClass, "IOCancelationWrapper", &OSObject::gMetaClass, 0x28u);
  result->__vftable = (OSMetaClass_vtbl *)off_25D70;
  return result;
}

void global destructor keyed to'_a_0()
{
}

void IOWrappedMemoryDescriptor::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void IOWrappedMemoryDescriptor::~IOWrappedMemoryDescriptor(OSObject *this)
{
}

{
  uint64_t vars8;

  IOCancelationWrapper::~IOCancelationWrapper(this);

  _OSObject_typed_operator_delete(&IOWrappedMemoryDescriptor_ktv, this, 40);
}

void *IOWrappedMemoryDescriptor::getMetaClass(IOWrappedMemoryDescriptor *this)
{
  return &IOWrappedMemoryDescriptor::gMetaClass;
}

IOCancelationWrapper *IOWrappedMemoryDescriptor::MetaClass::alloc(IOWrappedMemoryDescriptor::MetaClass *this)
{
  unint64_t v1 = (IOCancelationWrapper *)OSObject_typed_operator_new();
  IOCancelationWrapper::IOCancelationWrapper(v1, &IOWrappedMemoryDescriptor::gMetaClass);
  *uint64_t v2 = off_25E00;
  OSMetaClass::instanceConstructed(&IOWrappedMemoryDescriptor::gMetaClass);
  return v1;
}

uint64_t IOWrappedMemoryDescriptor::operator new(IOWrappedMemoryDescriptor *this)
{
  return OSObject_typed_operator_new();
}

void IOWrappedMemoryDescriptor::IOWrappedMemoryDescriptor(IOWrappedMemoryDescriptor *this)
{
  IOCancelationWrapper::IOCancelationWrapper(this, &IOWrappedMemoryDescriptor::gMetaClass);
  *unint64_t v1 = off_25E00;
  OSMetaClass::instanceConstructed(&IOWrappedMemoryDescriptor::gMetaClass);
}

BOOL IOWrappedMemoryDescriptor::init(IOWrappedMemoryDescriptor *this, IOMemoryDescriptor *a2)
{
  int v3 = IOCancelationWrapper::init(this, a2);
  BOOL result = 0;
  if (a2)
  {
    if (v3) {
      return OSMetaClassBase::safeMetaCast(a2, IOMemoryDescriptor::metaClass) != 0;
    }
  }
  return result;
}

uint64_t IOWrappedMemoryDescriptor::free(IOWrappedMemoryDescriptor *this)
{
  return IOCancelationWrapper::free(this);
}

IOMemoryMap *IOWrappedMemoryDescriptor::createMappingInTask(IOWrappedMemoryDescriptor *this, task *a2, mach_vm_address_t a3, IOOptionBits a4, mach_vm_size_t a5, mach_vm_size_t a6)
{
  anObject = 0;
  int Reference = IOCancelationWrapper::startUsingObjectAndGetReference(this, (OSObject **)&anObject);
  BOOL result = 0;
  if (Reference)
  {
    uintptr_t v14 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, IOMemoryDescriptor::metaClass);
    if (v14)
    {
      return IOMemoryDescriptor::createMappingInTask(v14, a2, a3, a4, a5, a6);
    }
    else
    {
      IOCancelationWrapper::stopUsingObjectAndRelease(this, (OSObject *)anObject);
      return 0;
    }
  }
  return result;
}

OSMetaClass *_GLOBAL__sub_I_IOWrappedMemoryDescriptor_cpp()
{
  BOOL result = OSMetaClass::OSMetaClass(&IOWrappedMemoryDescriptor::gMetaClass, "IOWrappedMemoryDescriptor", &IOCancelationWrapper::gMetaClass, 0x28u);
  result->__vftable = (OSMetaClass_vtbl *)off_25EA0;
  return result;
}

void global destructor keyed to'_a_1()
{
}

uint64_t lifs_mount_send(ipc_port *a1, uint64_t a2, const char *a3, const char *a4, int a5, int a6, long long *a7)
{
  bzero(&v26, 0x888uLL);
  NDR_record_t v27 = NDR_record;
  uint64_t v28 = a2;
  if (&_mig_strncpy_zerofill) {
    int v14 = mig_strncpy_zerofill(v31, a3, 1024);
  }
  else {
    int v14 = mig_strncpy(v31, a3, 1024);
  }
  int v29 = 0;
  int v30 = v14;
  uint64_t v15 = (v14 + 3) & 0xFFFFFFFC;
  int v16 = (char *)&v26 + v15 - 1024;
  uintptr_t v17 = &v31[v15 + 8];
  if (&_mig_strncpy_zerofill) {
    int v18 = mig_strncpy_zerofill(v17, a4, 1024);
  }
  else {
    int v18 = mig_strncpy(v17, a4, 1024);
  }
  *((_DWORD *)v16 + 271) = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  *((_DWORD *)v16 + 270) = 0;
  mach_msg_size_t v20 = v15 + v19 + 136;
  uint64_t v21 = &v16[v19];
  *((_DWORD *)v21 + 272) = a5;
  *((_DWORD *)v21 + 273) = a6;
  v21 += 1096;
  long long v22 = *a7;
  long long v23 = a7[1];
  long long v24 = a7[3];
  *((_OWORD *)v21 + 2) = a7[2];
  *((_OWORD *)v21 + 3) = v24;
  *(_OWORD *)uint64_t v21 = v22;
  *((_OWORD *)v21 + 1) = v23;
  v26.msgh_bits = 19;
  v26.msgh_remote_port = a1;
  v26.msgh_local_port = 0;
  *(void *)&v26.msgh_voucher_port = 0x29A00000000;
  return mach_msg_send_from_kernel_proper(&v26, v20);
}

uint64_t lifs_unmount_send(ipc_port *a1, uint64_t a2, int a3, long long *a4)
{
  long long v4 = a4[1];
  long long v11 = *a4;
  long long v12 = v4;
  long long v5 = a4[3];
  long long v13 = a4[2];
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  int v10 = a3;
  long long v14 = v5;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x29B00000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x74u);
}

uint64_t lifs_unmount2_send(ipc_port *a1, uint64_t a2, int a3, long long *a4)
{
  long long v4 = a4[1];
  long long v11 = *a4;
  long long v12 = v4;
  long long v5 = a4[3];
  long long v13 = a4[2];
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  int v10 = a3;
  long long v14 = v5;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x29C00000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x74u);
}

uint64_t lifs_statfs_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x29D00000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_getfsattr_send(ipc_port *a1, uint64_t a2, long long *a3, char *src)
{
  long long v5 = *a3;
  long long v6 = a3[1];
  long long v13 = 0u;
  long long v14 = v5;
  long long v7 = a3[2];
  long long v8 = a3[3];
  long long v15 = v6;
  long long v16 = v7;
  memset(&v12, 0, sizeof(v12));
  *(NDR_record_t *)&long long v13 = NDR_record;
  *((void *)&v13 + 1) = a2;
  long long v17 = v8;
  memset(v18, 0, 44);
  if (&_mig_strncpy_zerofill) {
    int v9 = mig_strncpy_zerofill((char *)v18 + 8, src, 33);
  }
  else {
    int v9 = mig_strncpy((char *)v18 + 8, src, 33);
  }
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v9;
  for (uint64_t i = 153; i != 156; ++i)
    *((unsigned char *)&v12.msgh_bits + i) = 0;
  v12.msgh_bits = 19;
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = 0;
  *(void *)&v12.msgh_voucher_port = 0x29E00000000;
  return mach_msg_send_from_kernel_proper(&v12, ((v9 + 3) & 0xFFFFFFFC) + 120);
}

uint64_t lifs_setfsattr_send(ipc_port *a1, uint64_t a2, long long *a3, char *src, long long *a5, int a6)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v9 = a3[1];
  long long v32 = *a3;
  long long v33 = v9;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v10 = a3[3];
  long long v34 = a3[2];
  memset(&v29, 0, sizeof(v29));
  NDR_record_t v30 = NDR_record;
  uint64_t v31 = a2;
  long long v35 = v10;
  memset(v36, 0, sizeof(v36));
  if (&_mig_strncpy_zerofill) {
    int v11 = mig_strncpy_zerofill((char *)v36 + 8, src, 33);
  }
  else {
    int v11 = mig_strncpy((char *)v36 + 8, src, 33);
  }
  LODWORD(v36[0]) = 0;
  DWORD1(v36[0]) = v11;
  for (uint64_t i = 153; i != 156; ++i)
    *((unsigned char *)&v29.msgh_bits + i) = 0;
  uint64_t v13 = (v11 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v14 = v13 + 380;
  long long v15 = (char *)&v29 + v13;
  long long v16 = *a5;
  long long v17 = a5[1];
  long long v18 = a5[2];
  *(_OWORD *)(v15 + 168) = a5[3];
  *(_OWORD *)(v15 + 152) = v18;
  *(_OWORD *)(v15 + 136) = v17;
  *(_OWORD *)(v15 + 120) = v16;
  long long v19 = a5[4];
  long long v20 = a5[5];
  long long v21 = a5[6];
  *(_OWORD *)(v15 + 232) = a5[7];
  *(_OWORD *)(v15 + 216) = v21;
  *(_OWORD *)(v15 + 200) = v20;
  *(_OWORD *)(v15 + 184) = v19;
  long long v22 = a5[10];
  long long v23 = a5[11];
  long long v24 = a5[9];
  *(_OWORD *)(v15 + 248) = a5[8];
  *(_OWORD *)(v15 + 280) = v22;
  *(_OWORD *)(v15 + 296) = v23;
  *(_OWORD *)(v15 + 264) = v24;
  long long v25 = a5[12];
  long long v26 = a5[13];
  long long v27 = a5[15];
  *(_OWORD *)(v15 + 344) = a5[14];
  *(_OWORD *)(v15 + 360) = v27;
  *(_OWORD *)(v15 + 312) = v25;
  *(_OWORD *)(v15 + 328) = v26;
  *((_DWORD *)v15 + 94) = a6;
  v29.msgh_bits = 19;
  v29.msgh_remote_port = a1;
  v29.msgh_local_port = 0;
  *(void *)&v29.msgh_voucher_port = 0x29F00000000;
  return mach_msg_send_from_kernel_proper(&v29, v14);
}

uint64_t lifs_create_send(ipc_port *a1, uint64_t a2, const char *a3, _OWORD *a4, _OWORD *a5)
{
  bzero(&msg, 0x530uLL);
  NDR_record_t v25 = NDR_record;
  uint64_t v26 = a2;
  if (&_mig_strncpy_zerofill) {
    int v10 = mig_strncpy_zerofill(v29, a3, 1024);
  }
  else {
    int v10 = mig_strncpy(v29, a3, 1024);
  }
  int v27 = 0;
  int v28 = v10;
  int v11 = (char *)&msg + ((v10 + 3) & 0xFFFFFFFC);
  long long v12 = a4[2];
  long long v13 = a4[3];
  long long v14 = a4[1];
  *(_OWORD *)(v11 + 56) = *a4;
  *(_OWORD *)(v11 + 104) = v13;
  *(_OWORD *)(v11 + 88) = v12;
  *(_OWORD *)(v11 + 72) = v14;
  long long v16 = a5[1];
  long long v15 = a5[2];
  *(_OWORD *)(v11 + 120) = *a5;
  *(_OWORD *)(v11 + 152) = v15;
  *(_OWORD *)(v11 + 136) = v16;
  long long v17 = a5[5];
  long long v18 = a5[6];
  long long v19 = a5[4];
  *(_OWORD *)(v11 + 168) = a5[3];
  *(_OWORD *)(v11 + 216) = v18;
  *(_OWORD *)(v11 + 200) = v17;
  *(_OWORD *)(v11 + 184) = v19;
  long long v20 = a5[9];
  long long v21 = a5[10];
  long long v22 = a5[8];
  *(_OWORD *)(v11 + 232) = a5[7];
  *(_OWORD *)(v11 + 264) = v20;
  *(_OWORD *)(v11 + 280) = v21;
  *(_OWORD *)(v11 + 248) = v22;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2A100000000;
  return mach_msg_send_from_kernel_proper(&msg, ((v10 + 3) & 0xFFFFFFFC) + 304);
}

uint64_t lifs_clonefile_send(ipc_port *a1, uint64_t a2, const char *a3, _OWORD *a4, _OWORD *a5, int a6, _OWORD *a7)
{
  bzero(&msg, 0x574uLL);
  NDR_record_t v32 = NDR_record;
  uint64_t v33 = a2;
  if (&_mig_strncpy_zerofill) {
    int v14 = mig_strncpy_zerofill(v36, a3, 1024);
  }
  else {
    int v14 = mig_strncpy(v36, a3, 1024);
  }
  int v34 = 0;
  int v35 = v14;
  long long v15 = (char *)&msg + ((v14 + 3) & 0xFFFFFFFC);
  long long v16 = a4[2];
  long long v17 = a4[3];
  long long v18 = a4[1];
  *(_OWORD *)(v15 + 56) = *a4;
  *(_OWORD *)(v15 + 104) = v17;
  *(_OWORD *)(v15 + 88) = v16;
  *(_OWORD *)(v15 + 72) = v18;
  long long v19 = a5[2];
  long long v20 = a5[3];
  long long v21 = a5[1];
  *(_OWORD *)(v15 + 120) = *a5;
  *(_OWORD *)(v15 + 168) = v20;
  *(_OWORD *)(v15 + 152) = v19;
  *(_OWORD *)(v15 + 136) = v21;
  *((_DWORD *)v15 + 46) = a6;
  long long v23 = a7[1];
  long long v22 = a7[2];
  *(_OWORD *)(v15 + 188) = *a7;
  *(_OWORD *)(v15 + 204) = v23;
  *(_OWORD *)(v15 + 220) = v22;
  long long v24 = a7[5];
  long long v25 = a7[6];
  long long v26 = a7[4];
  *(_OWORD *)(v15 + 236) = a7[3];
  *(_OWORD *)(v15 + 268) = v24;
  *(_OWORD *)(v15 + 284) = v25;
  *(_OWORD *)(v15 + 252) = v26;
  long long v27 = a7[10];
  long long v29 = a7[7];
  long long v28 = a7[8];
  *(_OWORD *)(v15 + 332) = a7[9];
  *(_OWORD *)(v15 + 348) = v27;
  *(_OWORD *)(v15 + 300) = v29;
  *(_OWORD *)(v15 + 316) = v28;
  msg.msgh_bits = 19;
  msg.msgh_local_port = 0;
  msg.msgh_remote_port = a1;
  *(void *)&msg.msgh_voucher_port = 0x2A200000000;
  return mach_msg_send_from_kernel_proper(&msg, ((v14 + 3) & 0xFFFFFFFC) + 372);
}

uint64_t lifs_mkdir_send(ipc_port *a1, uint64_t a2, const char *a3, _OWORD *a4, _OWORD *a5)
{
  bzero(&msg, 0x530uLL);
  NDR_record_t v25 = NDR_record;
  uint64_t v26 = a2;
  if (&_mig_strncpy_zerofill) {
    int v10 = mig_strncpy_zerofill(v29, a3, 1024);
  }
  else {
    int v10 = mig_strncpy(v29, a3, 1024);
  }
  int v27 = 0;
  int v28 = v10;
  int v11 = (char *)&msg + ((v10 + 3) & 0xFFFFFFFC);
  long long v12 = a4[2];
  long long v13 = a4[3];
  long long v14 = a4[1];
  *(_OWORD *)(v11 + 56) = *a4;
  *(_OWORD *)(v11 + 104) = v13;
  *(_OWORD *)(v11 + 88) = v12;
  *(_OWORD *)(v11 + 72) = v14;
  long long v16 = a5[1];
  long long v15 = a5[2];
  *(_OWORD *)(v11 + 120) = *a5;
  *(_OWORD *)(v11 + 152) = v15;
  *(_OWORD *)(v11 + 136) = v16;
  long long v17 = a5[5];
  long long v18 = a5[6];
  long long v19 = a5[4];
  *(_OWORD *)(v11 + 168) = a5[3];
  *(_OWORD *)(v11 + 216) = v18;
  *(_OWORD *)(v11 + 200) = v17;
  *(_OWORD *)(v11 + 184) = v19;
  long long v20 = a5[9];
  long long v21 = a5[10];
  long long v22 = a5[8];
  *(_OWORD *)(v11 + 232) = a5[7];
  *(_OWORD *)(v11 + 264) = v20;
  *(_OWORD *)(v11 + 280) = v21;
  *(_OWORD *)(v11 + 248) = v22;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2A300000000;
  return mach_msg_send_from_kernel_proper(&msg, ((v10 + 3) & 0xFFFFFFFC) + 304);
}

uint64_t lifs_lookup_send(ipc_port *a1, uint64_t a2, const char *a3, _OWORD *a4, int a5)
{
  bzero(&msg, 0x47CuLL);
  NDR_record_t v17 = NDR_record;
  uint64_t v18 = a2;
  if (&_mig_strncpy_zerofill) {
    int v10 = mig_strncpy_zerofill(v21, a3, 1024);
  }
  else {
    int v10 = mig_strncpy(v21, a3, 1024);
  }
  int v19 = 0;
  int v20 = v10;
  int v11 = (char *)&msg + ((v10 + 3) & 0xFFFFFFFC);
  long long v12 = a4[2];
  long long v13 = a4[3];
  long long v14 = a4[1];
  *(_OWORD *)(v11 + 56) = *a4;
  *(_OWORD *)(v11 + 104) = v13;
  *(_OWORD *)(v11 + 88) = v12;
  *(_OWORD *)(v11 + 72) = v14;
  *((_DWORD *)v11 + 30) = a5;
  msg.msgh_bits = 19;
  msg.msgh_local_port = 0;
  msg.msgh_remote_port = a1;
  *(void *)&msg.msgh_voucher_port = 0x2A400000000;
  return mach_msg_send_from_kernel_proper(&msg, ((v10 + 3) & 0xFFFFFFFC) + 124);
}

uint64_t lifs_lookupsmall_send(ipc_port *a1, uint64_t a2, char *src, long long *a4, int a5)
{
  memset(v20, 0, sizeof(v20));
  memset(&v17, 0, sizeof(v17));
  NDR_record_t v18 = NDR_record;
  uint64_t v19 = a2;
  if (&_mig_strncpy_zerofill) {
    int v8 = mig_strncpy_zerofill((char *)v20 + 8, src, 33);
  }
  else {
    int v8 = mig_strncpy((char *)v20 + 8, src, 33);
  }
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v8;
  for (uint64_t i = 89; i != 92; ++i)
    *((unsigned char *)&v17.msgh_bits + i) = 0;
  uint64_t v10 = (v8 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v11 = v10 + 124;
  long long v12 = *a4;
  long long v13 = a4[1];
  long long v14 = (char *)&v17 + v10;
  long long v15 = a4[2];
  *(_OWORD *)(v14 + 104) = a4[3];
  *(_OWORD *)(v14 + 88) = v15;
  *(_OWORD *)(v14 + 72) = v13;
  *(_OWORD *)(v14 + 56) = v12;
  *((_DWORD *)v14 + 30) = a5;
  v17.msgh_bits = 19;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = 0;
  *(void *)&v17.msgh_voucher_port = 0x2A500000000;
  return mach_msg_send_from_kernel_proper(&v17, v11);
}

uint64_t lifs_lookupmed_send(ipc_port *a1, uint64_t a2, char *src, long long *a4, int a5)
{
  memset(v20, 0, sizeof(v20));
  memset(&v17, 0, sizeof(v17));
  NDR_record_t v18 = NDR_record;
  uint64_t v19 = a2;
  if (&_mig_strncpy_zerofill) {
    int v8 = mig_strncpy_zerofill((char *)v20 + 8, src, 65);
  }
  else {
    int v8 = mig_strncpy((char *)v20 + 8, src, 65);
  }
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v8;
  for (uint64_t i = 121; i != 124; ++i)
    *((unsigned char *)&v17.msgh_bits + i) = 0;
  uint64_t v10 = (v8 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v11 = v10 + 124;
  long long v12 = *a4;
  long long v13 = a4[1];
  long long v14 = (char *)&v17 + v10;
  long long v15 = a4[2];
  *(_OWORD *)(v14 + 104) = a4[3];
  *(_OWORD *)(v14 + 88) = v15;
  *(_OWORD *)(v14 + 72) = v13;
  *(_OWORD *)(v14 + 56) = v12;
  *((_DWORD *)v14 + 30) = a5;
  v17.msgh_bits = 19;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = 0;
  *(void *)&v17.msgh_voucher_port = 0x2A600000000;
  return mach_msg_send_from_kernel_proper(&v17, v11);
}

uint64_t lifs_open_send(ipc_port *a1, uint64_t a2, long long *a3, int a4)
{
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  long long v4 = a3[1];
  long long v10 = *a3;
  long long v11 = v4;
  long long v5 = a3[3];
  long long v12 = a3[2];
  long long v13 = v5;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x2A700000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x74u);
}

uint64_t lifs_close_send(ipc_port *a1, uint64_t a2, long long *a3, int a4)
{
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  long long v4 = a3[1];
  long long v10 = *a3;
  long long v11 = v4;
  long long v5 = a3[3];
  long long v12 = a3[2];
  long long v13 = v5;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x2A800000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x74u);
}

uint64_t lifs_rename_send(ipc_port *a1, uint64_t a2, const char *a3, _OWORD *a4, _OWORD *a5, const char *a6, long long *a7, long long *a8, int a9)
{
  bzero(&msg, 0x944uLL);
  NDR_record_t v40 = NDR_record;
  uint64_t v41 = a2;
  if (&_mig_strncpy_zerofill) {
    int v17 = mig_strncpy_zerofill(v44, a3, 1024);
  }
  else {
    int v17 = mig_strncpy(v44, a3, 1024);
  }
  int v42 = 0;
  int v43 = v17;
  unsigned int v18 = (v17 + 3) & 0xFFFFFFFC;
  uint64_t v19 = (char *)&msg + v18;
  int v20 = v19 - 1024;
  long long v21 = a4[2];
  long long v22 = a4[3];
  long long v23 = a4[1];
  *(_OWORD *)(v19 + 56) = *a4;
  *(_OWORD *)(v19 + 104) = v22;
  *(_OWORD *)(v19 + 88) = v21;
  *(_OWORD *)(v19 + 72) = v23;
  long long v24 = a5[2];
  long long v25 = a5[3];
  long long v26 = a5[1];
  *(_OWORD *)(v19 + 120) = *a5;
  *(_OWORD *)(v19 + 168) = v25;
  *(_OWORD *)(v19 + 152) = v24;
  *(_OWORD *)(v19 + 136) = v26;
  int v27 = v19 + 192;
  if (&_mig_strncpy_zerofill) {
    int v28 = mig_strncpy_zerofill(v27, a6, 1024);
  }
  else {
    int v28 = mig_strncpy(v27, a6, 1024);
  }
  *((_DWORD *)v20 + 303) = v28;
  uint64_t v29 = (v28 + 3) & 0xFFFFFFFC;
  *((_DWORD *)v20 + 302) = 0;
  mach_msg_size_t v30 = v18 + v29 + 324;
  uint64_t v31 = &v20[v29];
  long long v32 = *a7;
  long long v33 = a7[1];
  long long v34 = a7[2];
  *((_OWORD *)v31 + 79) = a7[3];
  *((_OWORD *)v31 + 78) = v34;
  *((_OWORD *)v31 + 77) = v33;
  *((_OWORD *)v31 + 76) = v32;
  long long v35 = *a8;
  long long v36 = a8[1];
  long long v37 = a8[2];
  *((_OWORD *)v31 + 83) = a8[3];
  *((_OWORD *)v31 + 82) = v37;
  *((_OWORD *)v31 + 81) = v36;
  *((_OWORD *)v31 + 80) = v35;
  *((_DWORD *)v31 + 336) = a9;
  msg.msgh_bits = 19;
  msg.msgh_local_port = 0;
  msg.msgh_remote_port = a1;
  *(void *)&msg.msgh_voucher_port = 0x2A900000000;
  return mach_msg_send_from_kernel_proper(&msg, v30);
}

uint64_t lifs_rmdir_send(ipc_port *a1, uint64_t a2, long long *a3, long long *a4, const char *a5)
{
  bzero(&v16, 0x4B8uLL);
  NDR_record_t v17 = NDR_record;
  uint64_t v18 = a2;
  long long v10 = a3[1];
  long long v19 = *a3;
  long long v20 = v10;
  long long v11 = a3[3];
  long long v21 = a3[2];
  long long v22 = v11;
  long long v12 = a4[1];
  long long v23 = *a4;
  long long v24 = v12;
  long long v13 = a4[3];
  long long v25 = a4[2];
  long long v26 = v13;
  if (&_mig_strncpy_zerofill) {
    int v14 = mig_strncpy_zerofill(v29, a5, 1024);
  }
  else {
    int v14 = mig_strncpy(v29, a5, 1024);
  }
  int v27 = 0;
  int v28 = v14;
  v16.msgh_bits = 19;
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = 0;
  *(void *)&v16.msgh_voucher_port = 0x2AA00000000;
  return mach_msg_send_from_kernel_proper(&v16, ((v14 + 3) & 0xFFFFFFFC) + 184);
}

uint64_t lifs_readdir_send(ipc_port *a1, uint64_t a2, int a3, uint64_t a4, long long *a5, int a6, uint64_t a7)
{
  long long v7 = a5[1];
  long long v15 = *a5;
  long long v16 = v7;
  long long v8 = a5[3];
  long long v17 = a5[2];
  NDR_record_t v11 = NDR_record;
  uint64_t v12 = a2;
  int v13 = a3;
  uint64_t v14 = a4;
  long long v18 = v8;
  int v19 = a6;
  uint64_t v20 = a7;
  *(void *)&v10.msgh_bits = 19;
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = 0;
  *(void *)&v10.msgh_voucher_port = 0x2AB00000000;
  return mach_msg_send_from_kernel_proper(&v10, 0x88u);
}

uint64_t lifs_symlink_send(ipc_port *a1, uint64_t a2, const char *a3, const char *a4, long long *a5, long long *a6)
{
  bzero(&v32, 0x938uLL);
  NDR_record_t v33 = NDR_record;
  uint64_t v34 = a2;
  if (&_mig_strncpy_zerofill) {
    int v12 = mig_strncpy_zerofill(v37, a3, 1024);
  }
  else {
    int v12 = mig_strncpy(v37, a3, 1024);
  }
  int v35 = 0;
  int v36 = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  uint64_t v14 = (char *)&v32 + v13 - 1024;
  long long v15 = &v37[v13 + 8];
  if (&_mig_strncpy_zerofill) {
    int v16 = mig_strncpy_zerofill(v15, a4, 1024);
  }
  else {
    int v16 = mig_strncpy(v15, a4, 1024);
  }
  *((_DWORD *)v14 + 271) = v16;
  uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
  *((_DWORD *)v14 + 270) = 0;
  mach_msg_size_t v18 = v13 + v17 + 312;
  int v19 = &v14[v17];
  long long v20 = *a5;
  long long v21 = a5[1];
  long long v22 = a5[2];
  *((_OWORD *)v19 + 71) = a5[3];
  *((_OWORD *)v19 + 70) = v22;
  *((_OWORD *)v19 + 69) = v21;
  *((_OWORD *)v19 + 68) = v20;
  long long v23 = a6[5];
  long long v24 = a6[6];
  long long v25 = a6[4];
  *((_OWORD *)v19 + 75) = a6[3];
  *((_OWORD *)v19 + 78) = v24;
  *((_OWORD *)v19 + 77) = v23;
  *((_OWORD *)v19 + 76) = v25;
  long long v26 = a6[9];
  long long v27 = a6[10];
  long long v28 = a6[8];
  *((_OWORD *)v19 + 79) = a6[7];
  *((_OWORD *)v19 + 82) = v27;
  *((_OWORD *)v19 + 81) = v26;
  *((_OWORD *)v19 + 80) = v28;
  long long v29 = *a6;
  long long v30 = a6[1];
  *((_OWORD *)v19 + 74) = a6[2];
  *((_OWORD *)v19 + 73) = v30;
  *((_OWORD *)v19 + 72) = v29;
  v32.msgh_bits = 19;
  v32.msgh_remote_port = a1;
  v32.msgh_local_port = 0;
  *(void *)&v32.msgh_voucher_port = 0x2AC00000000;
  return mach_msg_send_from_kernel_proper(&v32, v18);
}

uint64_t lifs_link_send(ipc_port *a1, uint64_t a2, long long *a3, const char *a4, _OWORD *a5)
{
  bzero(&v20, 0x4B8uLL);
  NDR_record_t v21 = NDR_record;
  uint64_t v22 = a2;
  long long v10 = a3[1];
  long long v23 = *a3;
  long long v24 = v10;
  long long v11 = a3[3];
  long long v25 = a3[2];
  long long v26 = v11;
  if (&_mig_strncpy_zerofill) {
    int v12 = mig_strncpy_zerofill(v29, a4, 1024);
  }
  else {
    int v12 = mig_strncpy(v29, a4, 1024);
  }
  int v27 = 0;
  int v28 = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v14 = v13 + 184;
  long long v15 = (char *)&v20 + v13;
  long long v16 = a5[2];
  long long v17 = a5[3];
  long long v18 = a5[1];
  *(_OWORD *)(v15 + 120) = *a5;
  *(_OWORD *)(v15 + 168) = v17;
  *(_OWORD *)(v15 + 152) = v16;
  *(_OWORD *)(v15 + 136) = v18;
  v20.msgh_bits = 19;
  v20.msgh_remote_port = a1;
  v20.msgh_local_port = 0;
  *(void *)&v20.msgh_voucher_port = 0x2AD00000000;
  return mach_msg_send_from_kernel_proper(&v20, v14);
}

uint64_t lifs_readlink_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2AE00000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_remove_send(ipc_port *a1, uint64_t a2, long long *a3, long long *a4, const char *a5, int a6)
{
  bzero(&msg, 0x4BCuLL);
  NDR_record_t v19 = NDR_record;
  uint64_t v20 = a2;
  long long v12 = a3[1];
  long long v21 = *a3;
  long long v22 = v12;
  long long v13 = a3[3];
  long long v23 = a3[2];
  long long v24 = v13;
  long long v14 = a4[1];
  long long v25 = *a4;
  long long v26 = v14;
  long long v15 = a4[3];
  long long v27 = a4[2];
  long long v28 = v15;
  if (&_mig_strncpy_zerofill) {
    int v16 = mig_strncpy_zerofill(v31, a5, 1024);
  }
  else {
    int v16 = mig_strncpy(v31, a5, 1024);
  }
  int v29 = 0;
  int v30 = v16;
  *(_DWORD *)&v31[(v16 + 3) & 0xFFFFFFFC] = a6;
  msg.msgh_bits = 19;
  msg.msgh_local_port = 0;
  msg.msgh_remote_port = a1;
  *(void *)&msg.msgh_voucher_port = 0x2AF00000000;
  return mach_msg_send_from_kernel_proper(&msg, ((v16 + 3) & 0xFFFFFFFC) + 188);
}

uint64_t lifs_setattr_send(uint64_t a1, uint64_t a2, _OWORD *a3, _OWORD *a4)
{
  memset(&v16[212], 0, 32);
  int v17 = 0;
  *(_OWORD *)&v16[196] = 0u;
  *(_OWORD *)&v16[180] = 0u;
  *(_OWORD *)&v16[164] = 0u;
  *(_OWORD *)&v16[148] = 0u;
  *(_OWORD *)&v16[132] = 0u;
  *(_OWORD *)&v16[116] = 0u;
  *(_OWORD *)&v16[100] = 0u;
  *(_OWORD *)&v16[84] = 0u;
  *(_OWORD *)&v16[68] = 0u;
  *(_OWORD *)&v16[52] = 0u;
  *(_OWORD *)&v16[36] = 0u;
  *(_OWORD *)&v16[20] = 0u;
  *(_OWORD *)&long long v16[4] = 0u;
  *(_DWORD *)int v16 = 0;
  *(_OWORD *)long long v14 = 0u;
  long long v13 = 0u;
  *(NDR_record_t *)&_OWORD v14[12] = NDR_record;
  uint64_t v15 = a2;
  long long v4 = a3[1];
  *(_OWORD *)int v16 = *a3;
  *(_OWORD *)&v16[16] = v4;
  long long v5 = a3[3];
  *(_OWORD *)&v16[32] = a3[2];
  *(_OWORD *)&v16[48] = v5;
  long long v6 = a4[9];
  *(_OWORD *)&v16[192] = a4[8];
  *(_OWORD *)&v16[208] = v6;
  *(_OWORD *)&v16[224] = a4[10];
  long long v7 = a4[5];
  *(_OWORD *)&v16[128] = a4[4];
  *(_OWORD *)&v16[144] = v7;
  long long v8 = a4[7];
  *(_OWORD *)&v16[160] = a4[6];
  *(_OWORD *)&v16[176] = v8;
  long long v9 = a4[1];
  *(_OWORD *)&v16[64] = *a4;
  *(_OWORD *)&v16[80] = v9;
  long long v10 = a4[3];
  *(_OWORD *)&v16[96] = a4[2];
  *(_OWORD *)&v16[112] = v10;
  int v12 = 19;
  *(void *)((char *)&v13 + 4) = a1;
  *(_DWORD *)&v14[8] = 688;
  return mach_msg_send_from_kernel_proper((mach_msg_header_t *)&v12, 0x128u);
}

uint64_t lifs_getattr_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B100000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_getattrlistbulk_send(ipc_port *a1, uint64_t a2, uint64_t a3, long long *a4, int a5, uint64_t a6, uint64_t a7)
{
  long long v7 = a4[1];
  long long v14 = *a4;
  long long v15 = v7;
  long long v8 = a4[3];
  long long v16 = a4[2];
  NDR_record_t v11 = NDR_record;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  long long v17 = v8;
  int v18 = a5;
  uint64_t v19 = a6;
  uint64_t v20 = a7;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B200000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x8Cu);
}

uint64_t lifs_write_send(ipc_port *a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, int a6)
{
  long long v6 = a3[1];
  long long v16 = *a3;
  long long v17 = v6;
  long long v7 = a3[3];
  long long v18 = a3[2];
  int v10 = 1;
  uint64_t v11 = a5;
  int v12 = 16777473;
  int v13 = a6;
  NDR_record_t v14 = NDR_record;
  uint64_t v15 = a2;
  long long v19 = v7;
  uint64_t v20 = a4;
  int v21 = a6;
  *(void *)&msg.msgh_bits = 2147483667;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B300000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x90u);
}

uint64_t lifs_write_wrapped_send(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, _DWORD *a7)
{
  long long v18 = 0u;
  memset(&msg[4], 0, 32);
  long long v10 = a2[1];
  long long v20 = *a2;
  long long v21 = v10;
  long long v11 = a2[3];
  long long v22 = a2[2];
  *(_DWORD *)&msg[32] = 1;
  *(void *)&long long v18 = a5;
  DWORD2(v18) = 1245184;
  NDR_record_t v19 = NDR_record;
  long long v23 = v11;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = mig_get_reply_port();
  *(void *)&msg[8] = a1;
  *(void *)&msg[24] = 0x2B400000000;
  uint64_t v12 = mach_msg_rpc_from_kernel_proper((mach_msg_header_t *)msg, 0x8Cu, 0x3Cu);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (v12)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[16]);
      return v13;
    }
    if (*(_DWORD *)&msg[28] == 71)
    {
      uint64_t v13 = 4294966988;
    }
    else if (*(_DWORD *)&msg[28] == 792)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 52)
        {
          if (!*(void *)&msg[8])
          {
            uint64_t v13 = DWORD1(v18);
            if (!DWORD1(v18))
            {
              int v16 = HIDWORD(v18);
              *a6 = DWORD2(v18);
              *a7 = v16;
              return v13;
            }
            goto LABEL_21;
          }
        }
        else if (*(_DWORD *)&msg[4] == 44)
        {
          if (*(void *)&msg[8]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = DWORD1(v18) == 0;
          }
          if (v14) {
            uint64_t v13 = 4294966996;
          }
          else {
            uint64_t v13 = DWORD1(v18);
          }
          goto LABEL_21;
        }
      }
      uint64_t v13 = 4294966996;
    }
    else
    {
      uint64_t v13 = 4294966995;
    }
LABEL_21:
    mach_msg_destroy_from_kernel_proper((mach_msg_header_t *)msg);
    return v13;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[16]);
  return v13;
}

uint64_t lifs_read_send(ipc_port *a1, uint64_t a2, long long *a3, int a4, uint64_t a5)
{
  NDR_record_t v9 = NDR_record;
  uint64_t v10 = a2;
  long long v5 = a3[1];
  long long v11 = *a3;
  long long v12 = v5;
  long long v6 = a3[3];
  long long v13 = a3[2];
  long long v14 = v6;
  int v15 = a4;
  uint64_t v16 = a5;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B500000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x7Cu);
}

uint64_t lifs_read_wrapped_send(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, _DWORD *a7)
{
  long long v18 = 0u;
  memset(&msg[4], 0, 32);
  long long v10 = a2[1];
  long long v20 = *a2;
  long long v21 = v10;
  long long v11 = a2[3];
  long long v22 = a2[2];
  *(_DWORD *)&msg[32] = 1;
  *(void *)&long long v18 = a5;
  DWORD2(v18) = 1245184;
  NDR_record_t v19 = NDR_record;
  long long v23 = v11;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = mig_get_reply_port();
  *(void *)&msg[8] = a1;
  *(void *)&msg[24] = 0x2B600000000;
  uint64_t v12 = mach_msg_rpc_from_kernel_proper((mach_msg_header_t *)msg, 0x8Cu, 0x3Cu);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (v12)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[16]);
      return v13;
    }
    if (*(_DWORD *)&msg[28] == 71)
    {
      uint64_t v13 = 4294966988;
    }
    else if (*(_DWORD *)&msg[28] == 794)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 52)
        {
          if (!*(void *)&msg[8])
          {
            uint64_t v13 = DWORD1(v18);
            if (!DWORD1(v18))
            {
              int v16 = HIDWORD(v18);
              *a6 = DWORD2(v18);
              *a7 = v16;
              return v13;
            }
            goto LABEL_21;
          }
        }
        else if (*(_DWORD *)&msg[4] == 44)
        {
          if (*(void *)&msg[8]) {
            BOOL v14 = 1;
          }
          else {
            BOOL v14 = DWORD1(v18) == 0;
          }
          if (v14) {
            uint64_t v13 = 4294966996;
          }
          else {
            uint64_t v13 = DWORD1(v18);
          }
          goto LABEL_21;
        }
      }
      uint64_t v13 = 4294966996;
    }
    else
    {
      uint64_t v13 = 4294966995;
    }
LABEL_21:
    mach_msg_destroy_from_kernel_proper((mach_msg_header_t *)msg);
    return v13;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[16]);
  return v13;
}

uint64_t lifs_pathconf_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B700000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_reclaim_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2B800000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_access_send(ipc_port *a1, uint64_t a2, long long *a3, int a4)
{
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  long long v4 = a3[1];
  long long v10 = *a3;
  long long v11 = v4;
  long long v5 = a3[3];
  long long v12 = a3[2];
  long long v13 = v5;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x2B900000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x74u);
}

uint64_t lifs_getxattr_send(ipc_port *a1, uint64_t a2, long long *a3, char *src, uint64_t a5, int a6)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v9 = a3[1];
  long long v19 = *a3;
  long long v20 = v9;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v10 = a3[3];
  long long v21 = a3[2];
  int v24 = 0;
  memset(&v16, 0, sizeof(v16));
  NDR_record_t v17 = NDR_record;
  uint64_t v18 = a2;
  long long v22 = v10;
  memset(v23, 0, sizeof(v23));
  if (&_mig_strncpy_zerofill) {
    int v11 = mig_strncpy_zerofill((char *)v23 + 8, src, 128);
  }
  else {
    int v11 = mig_strncpy((char *)v23 + 8, src, 128);
  }
  LODWORD(v23[0]) = 0;
  DWORD1(v23[0]) = v11;
  uint64_t v12 = (v11 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v13 = v12 + 132;
  int v14 = (char *)&v16 + v12;
  *((void *)v14 + 15) = a5;
  *((_DWORD *)v14 + 32) = a6;
  v16.msgh_bits = 19;
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = 0;
  *(void *)&v16.msgh_voucher_port = 0x2BA00000000;
  return mach_msg_send_from_kernel_proper(&v16, v13);
}

uint64_t lifs_listxattr_send(ipc_port *a1, uint64_t a2, long long *a3, uint64_t a4)
{
  NDR_record_t v8 = NDR_record;
  uint64_t v9 = a2;
  long long v4 = a3[1];
  long long v10 = *a3;
  long long v11 = v4;
  long long v5 = a3[3];
  long long v12 = a3[2];
  long long v13 = v5;
  uint64_t v14 = a4;
  *(void *)&v7.msgh_bits = 19;
  v7.msgh_remote_port = a1;
  v7.msgh_local_port = 0;
  *(void *)&v7.msgh_voucher_port = 0x2BB00000000;
  return mach_msg_send_from_kernel_proper(&v7, 0x78u);
}

uint64_t lifs_removexattr_send(ipc_port *a1, uint64_t a2, long long *a3, char *src)
{
  uint64_t v18 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v5 = *a3;
  long long v6 = a3[1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v7 = a3[2];
  long long v8 = a3[3];
  memset(&v11, 0, sizeof(v11));
  *(NDR_record_t *)&long long v12 = NDR_record;
  *((void *)&v12 + 1) = a2;
  long long v16 = v8;
  memset(v17, 0, sizeof(v17));
  long long v14 = v6;
  long long v15 = v7;
  long long v13 = v5;
  if (&_mig_strncpy_zerofill) {
    int v9 = mig_strncpy_zerofill((char *)v17 + 8, src, 128);
  }
  else {
    int v9 = mig_strncpy((char *)v17 + 8, src, 128);
  }
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v9;
  v11.msgh_bits = 19;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = 0;
  *(void *)&v11.msgh_voucher_port = 0x2BC00000000;
  return mach_msg_send_from_kernel_proper(&v11, ((v9 + 3) & 0xFFFFFFFC) + 120);
}

uint64_t lifs_setxattr_small_send(ipc_port *a1, uint64_t a2, long long *a3, const char *a4, const void *a5, uint64_t a6, int a7, int a8)
{
  bzero(&v23, 0x508uLL);
  NDR_record_t v24 = NDR_record;
  uint64_t v25 = a2;
  long long v16 = a3[1];
  long long v26 = *a3;
  long long v27 = v16;
  long long v17 = a3[3];
  long long v28 = a3[2];
  long long v29 = v17;
  if (&_mig_strncpy_zerofill) {
    int v18 = mig_strncpy_zerofill(v32, a4, 128);
  }
  else {
    int v18 = mig_strncpy(v32, a4, 128);
  }
  int v30 = 0;
  int v31 = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v20 = v19 + 1160;
  long long v21 = (char *)&v23 + v19;
  memcpy(&v32[v19], a5, 0x400uLL);
  *((void *)v21 + 143) = a6;
  *((_DWORD *)v21 + 288) = a7;
  *((_DWORD *)v21 + 289) = a8;
  v23.msgh_bits = 19;
  v23.msgh_remote_port = a1;
  v23.msgh_local_port = 0;
  *(void *)&v23.msgh_voucher_port = 0x2BD00000000;
  return mach_msg_send_from_kernel_proper(&v23, v20);
}

uint64_t lifs_setxattr_large_send(ipc_port *a1, uint64_t a2, _OWORD *a3, char *src, uint64_t a5, int a6, int a7, int a8)
{
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  memset(&v19, 0, sizeof(v19));
  long long v12 = a3[1];
  *(_OWORD *)((char *)&v21[1] + 4) = *a3;
  *(_OWORD *)((char *)&v21[2] + 4) = v12;
  long long v13 = a3[3];
  *(_OWORD *)((char *)&v21[3] + 4) = a3[2];
  uint64_t v22 = 0;
  LODWORD(v20) = 1;
  *(void *)((char *)&v20 + 4) = a5;
  HIDWORD(v20) = 16777472;
  LODWORD(v21[0]) = a6;
  *(NDR_record_t *)((char *)v21 + 4) = NDR_record;
  *(void *)((char *)v21 + 12) = a2;
  *(_OWORD *)((char *)&v21[4] + 4) = v13;
  if (&_mig_strncpy_zerofill) {
    int v14 = mig_strncpy_zerofill((char *)&v21[5] + 12, src, 128);
  }
  else {
    int v14 = mig_strncpy((char *)&v21[5] + 12, src, 128);
  }
  DWORD1(v21[5]) = 0;
  DWORD2(v21[5]) = v14;
  uint64_t v15 = (v14 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v16 = v15 + 152;
  long long v17 = (mach_msg_bits_t *)((char *)&v19.msgh_bits + v15);
  v17[35] = a6;
  v17[36] = a7;
  v17[37] = a8;
  v19.msgh_bits = -2147483629;
  v19.msgh_remote_port = a1;
  v19.msgh_local_port = 0;
  *(void *)&v19.msgh_voucher_port = 0x2BE00000000;
  return mach_msg_send_from_kernel_proper(&v19, v16);
}

uint64_t lifs_get_volume_port_send(ipc_port *a1, uint64_t a2, long long *a3)
{
  NDR_record_t v7 = NDR_record;
  uint64_t v8 = a2;
  long long v3 = a3[1];
  long long v9 = *a3;
  long long v10 = v3;
  long long v4 = a3[3];
  long long v11 = a3[2];
  long long v12 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2BF00000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x70u);
}

uint64_t lifs_blockmap_file_send(ipc_port *a1, uint64_t a2, long long *a3, uint64_t a4, int a5, int a6, int a7, uint64_t a8)
{
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = a2;
  long long v8 = a3[1];
  long long v14 = *a3;
  long long v15 = v8;
  long long v9 = a3[3];
  long long v16 = a3[2];
  long long v17 = v9;
  uint64_t v18 = a4;
  int v19 = a5;
  int v20 = a6;
  int v21 = a7;
  uint64_t v22 = a8;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2C000000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x8Cu);
}

uint64_t lifs_endio_send(ipc_port *a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5, int a6, int a7, uint64_t a8)
{
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = a2;
  long long v8 = a3[1];
  long long v14 = *a3;
  long long v15 = v8;
  long long v9 = a3[3];
  long long v16 = a3[2];
  long long v17 = v9;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  int v20 = a6;
  int v21 = a7;
  uint64_t v22 = a8;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x2C100000000;
  return mach_msg_send_from_kernel_proper(&msg, 0x90u);
}

uint64_t _start()
{
  if (_realmain) {
    return _realmain();
  }
  else {
    return 0;
  }
}

uint64_t _stop()
{
  if (_antimain) {
    return _antimain();
  }
  else {
    return 0;
  }
}

void lifs_vnop_readdir_cold_1()
{
}

void lifs_vnop_mkdir_cold_1()
{
}

void lifs_vnop_rmdir_cold_1()
{
}

void lifs_vnop_remove_cold_1()
{
}

void lifs_vnop_link_cold_1()
{
}

void lifs_vnop_lookup_cold_1()
{
}

void lifs_vnop_symlink_cold_1()
{
}

void lifs_vnop_getattrlistbulk_cold_1()
{
}

void lifs_vnop_open_cold_1()
{
}

void lifs_vnop_open_cold_2()
{
}

void lifs_vnop_open_cold_3()
{
}

void lifs_vnop_create_cold_1()
{
}

void lifs_vnop_close_cold_1()
{
}

void lifs_vnop_close_cold_2()
{
}

void lifs_vnop_close_cold_3()
{
}

void lifs_vnop_clonefile_cold_1()
{
}

void lifs_fsync_internal_cold_1()
{
}

void lifs_vnop_dorename_cold_1()
{
}

void lifs_vnop_dorename_cold_2()
{
}

void com_apple_filesystems_lifs::stop()
{
}

void lifs_create_iouc_container()
{
}

void lifs_add_extent_cold_1()
{
}

void lifs_remove_overlapping_extents_cold_1()
{
}

void lifs_mirror_mount_trigger_resolve_cold_1()
{
}

void lifs_mirror_mount_trigger_unresolve_cold_1()
{
}

void lifs_mirror_mount_trigger_rearm_cold_1()
{
}

void lifs_flush_meta_blocks_cold_1()
{
}

void lifs_clear_meta_blocks_cold_1()
{
}

void lifs_purge_meta_blocks_cold_1()
{
}

uint64_t IOFreeTypeImpl()
{
  return _IOFreeTypeImpl();
}

IOLock *IOLockAlloc(void)
{
  return _IOLockAlloc();
}

void IOLockFree(IOLock *lock)
{
}

void IOLockLock(IOLock *lock)
{
}

void IOLockUnlock(IOLock *lock)
{
}

void IOLockWakeup(IOLock *lock, void *event, BOOL oneThread)
{
}

void IOLog(const char *format, ...)
{
}

uint64_t IOMallocTypeImpl()
{
  return _IOMallocTypeImpl();
}

SInt32 OSAddAtomic(SInt32 amount, SInt32 *address)
{
  return _OSAddAtomic(amount, address);
}

SInt64 OSAddAtomic64(SInt64 theAmount, SInt64 *address)
{
  return _OSAddAtomic64(theAmount, address);
}

SInt32 OSDecrementAtomic(SInt32 *address)
{
  return _OSDecrementAtomic(address);
}

SInt32 OSIncrementAtomic(SInt32 *address)
{
  return _OSIncrementAtomic(address);
}

uint64_t OSObject_typed_operator_new()
{
  return _OSObject_typed_operator_new();
}

errno_t VNOP_FSYNC(vnode_t vp, int waitfor, vfs_context_t ctx)
{
  return _VNOP_FSYNC(vp, waitfor, ctx);
}

errno_t VNOP_IOCTL(vnode_t vp, u_long command, caddr_t data, int fflag, vfs_context_t ctx)
{
  return _VNOP_IOCTL(vp, command, data, fflag, ctx);
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

OSObject *__cdecl IOUserClient::copyClientEntitlement(task_t task, const char *entitlement)
{
  return IOUserClient::copyClientEntitlement(task, entitlement);
}

uint64_t IOUserClient::copyObjectForPortNameInTask(IOUserClient *this, task *a2, unsigned int a3, OSObject **a4)
{
  return IOUserClient::copyObjectForPortNameInTask(this, a2, a3, a4);
}

uint64_t IOUserClient::copyPortNameForObjectInTask(IOUserClient *this, task *a2, OSObject *a3, unsigned int *a4)
{
  return IOUserClient::copyPortNameForObjectInTask(this, a2, a3, a4);
}

IOUserClient *__cdecl IOUserClient::IOUserClient(IOUserClient *this, const OSMetaClass *a2)
{
  return IOUserClient::IOUserClient(this, a2);
}

void IOUserClient::~IOUserClient(IOUserClient *this)
{
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

IOMemoryDescriptor *__cdecl IOMemoryDescriptor::withOptions(void *buffers, UInt32 count, UInt32 offset, task_t task, IOOptionBits options, IOMapper *mapper)
{
  return IOMemoryDescriptor::withOptions(buffers, count, offset, task, options, mapper);
}

IOMemoryDescriptor *__cdecl IOMemoryDescriptor::withAddressRange(mach_vm_address_t address, mach_vm_size_t length, IOOptionBits options, task_t task)
{
  return IOMemoryDescriptor::withAddressRange(address, length, options, task);
}

IOMemoryMap *__cdecl IOMemoryDescriptor::createMappingInTask(IOMemoryDescriptor *this, task_t intoTask, mach_vm_address_t atAddress, IOOptionBits options, mach_vm_size_t offset, mach_vm_size_t length)
{
  return IOMemoryDescriptor::createMappingInTask(this, intoTask, atAddress, options, offset, length);
}

OSObject *__cdecl OSObject::OSObject(OSObject *this, const OSMetaClass *a2)
{
  return OSObject::OSObject(this, a2);
}

void OSObject::~OSObject(OSObject *this)
{
}

IOService *IOService::getResourceService(void)
{
  return IOService::getResourceService();
}

IOService *__cdecl IOService::IOService(IOService *this, const OSMetaClass *a2)
{
  return IOService::IOService(this, a2);
}

void IOService::~IOService(IOService *this)
{
}

void OSMetaClass::instanceConstructed(const OSMetaClass *this)
{
}

BOOL IOService::isInactive(const IOService *this)
{
  return IOService::isInactive(this);
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
}

int advisory_read(vnode_t a1, off_t a2, off_t a3, int a4)
{
  return _advisory_read(a1, a2, a3, a4);
}

int bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return _bcmp(__b1, __b2, __len);
}

bufattr_t buf_attr(buf_t bp)
{
  return _buf_attr(bp);
}

errno_t buf_bawrite(buf_t bp)
{
  return _buf_bawrite(bp);
}

errno_t buf_bdwrite(buf_t bp)
{
  return _buf_bdwrite(bp);
}

void buf_biodone(buf_t bp)
{
}

daddr64_t buf_blkno(buf_t bp)
{
  return _buf_blkno(bp);
}

void buf_brelse(buf_t bp)
{
}

errno_t buf_bwrite(buf_t bp)
{
  return _buf_bwrite(bp);
}

void buf_clear(buf_t bp)
{
}

uint32_t buf_count(buf_t bp)
{
  return _buf_count(bp);
}

uintptr_t buf_dataptr(buf_t bp)
{
  return _buf_dataptr(bp);
}

dev_t buf_device(buf_t bp)
{
  return _buf_device(bp);
}

int32_t buf_flags(buf_t bp)
{
  return _buf_flags(bp);
}

void buf_flushdirtyblks(vnode_t vp, int wait, int flags, const char *msg)
{
}

int buf_fromcache(buf_t bp)
{
  return _buf_fromcache(bp);
}

buf_t buf_getblk(vnode_t vp, daddr64_t blkno, int size, int slpflag, int slptimeo, int operation)
{
  return _buf_getblk(vp, blkno, size, slpflag, slptimeo, operation);
}

errno_t buf_invalblkno(vnode_t vp, daddr64_t lblkno, int flags)
{
  return _buf_invalblkno(vp, lblkno, flags);
}

uint64_t buf_kernel_addrperm_addr()
{
  return _buf_kernel_addrperm_addr();
}

void buf_markinvalid(buf_t bp)
{
}

errno_t buf_meta_bread(vnode_t vp, daddr64_t blkno, int size, kauth_cred_t cred, buf_t *bpp)
{
  return _buf_meta_bread(vp, blkno, size, cred, bpp);
}

errno_t buf_meta_breadn(vnode_t vp, daddr64_t blkno, int size, daddr64_t *rablks, int *rasizes, int nrablks, kauth_cred_t cred, buf_t *bpp)
{
  return _buf_meta_breadn(vp, blkno, size, rablks, rasizes, nrablks, cred, bpp);
}

uint32_t buf_resid(buf_t bp)
{
  return _buf_resid(bp);
}

void buf_seterror(buf_t bp, errno_t a2)
{
}

uint64_t buf_setfilter()
{
  return _buf_setfilter();
}

void buf_setflags(buf_t bp, int32_t flags)
{
}

void buf_setresid(buf_t bp, uint32_t resid)
{
}

errno_t buf_strategy(vnode_t devvp, void *ap)
{
  return _buf_strategy(devvp, ap);
}

void *__cdecl buf_upl(buf_t bp)
{
  return _buf_upl(bp);
}

uint32_t buf_uploffset(buf_t bp)
{
  return _buf_uploffset(bp);
}

vnode_t buf_vnode(buf_t bp)
{
  return _buf_vnode(bp);
}

uint64_t bufattr_nocache()
{
  return _bufattr_nocache();
}

void bzero(void *a1, size_t a2)
{
}

void cache_enter(vnode_t dvp, vnode_t vp, componentname *cnp)
{
}

uint64_t cache_lookup_ext()
{
  return _cache_lookup_ext();
}

void cache_purge(vnode_t vp)
{
}

void cache_purge_negatives(vnode_t vp)
{
}

void clock_interval_to_deadline(uint32_t interval, uint32_t scale_factor, uint64_t *result)
{
}

int cluster_copy_upl_data(uio_t a1, upl_t a2, int a3, int *a4)
{
  return _cluster_copy_upl_data(a1, a2, a3, a4);
}

int cluster_pagein(vnode_t a1, upl_t a2, upl_offset_t a3, off_t a4, int a5, off_t a6, int a7)
{
  return _cluster_pagein(a1, a2, a3, a4, a5, a6, a7);
}

int cluster_pageout(vnode_t a1, upl_t a2, upl_offset_t a3, off_t a4, int a5, off_t a6, int a7)
{
  return _cluster_pageout(a1, a2, a3, a4, a5, a6, a7);
}

int cluster_push_err(vnode_t a1, int a2, int (__cdecl *a3)(buf_t, void *), void *a4, int *a5)
{
  return _cluster_push_err(a1, a2, a3, a4, a5);
}

int cluster_read(vnode_t a1, uio *a2, off_t a3, int a4)
{
  return _cluster_read(a1, a2, a3, a4);
}

int cluster_write(vnode_t a1, uio *a2, off_t a3, off_t a4, off_t a5, off_t a6, int a7)
{
  return _cluster_write(a1, a2, a3, a4, a5, a6, a7);
}

int copyin(const user_addr_t uaddr, void *kaddr, size_t len)
{
  return _copyin(uaddr, kaddr, len);
}

int copyout(const void *kaddr, user_addr_t udaddr, size_t len)
{
  return _copyout(kaddr, udaddr, len);
}

uint32_t crc32(uint32_t crc, const void *bufp, size_t len)
{
  return _crc32(crc, bufp, len);
}

proc *current_proc(void)
{
  return _current_proc();
}

task_t current_task(void)
{
  return _current_task();
}

thread_t current_thread(void)
{
  return _current_thread();
}

uint64_t get_aiotask()
{
  return _get_aiotask();
}

void hashdestroy(void *a1, int type, u_long hashmask)
{
}

void *__cdecl hashinit(int count, int type, u_long *hashmask)
{
  return _hashinit(count, type, hashmask);
}

uint64_t iokit_make_ident_port()
{
  return _iokit_make_ident_port();
}

uint64_t ipc_port_release_send()
{
  return _ipc_port_release_send();
}

uint64_t kalloc_data()
{
  return _kalloc_data();
}

uint64_t kalloc_type_impl()
{
  return _kalloc_type_impl();
}

void kernel_debug(uint32_t debugid, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4, uintptr_t arg5)
{
}

void kernel_debug_filtered(uint32_t debugid, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
}

kern_return_t kernel_thread_start(thread_continue_t continuation, void *parameter, thread_t *new_thread)
{
  return _kernel_thread_start(continuation, parameter, new_thread);
}

uint64_t kfree_data()
{
  return _kfree_data();
}

uint64_t kfree_type_impl()
{
  return _kfree_type_impl();
}

lck_grp_t *__cdecl lck_grp_alloc_init(const char *grp_name, lck_grp_attr_t *attr)
{
  return _lck_grp_alloc_init(grp_name, attr);
}

void lck_grp_free(lck_grp_t *grp)
{
}

void lck_mtx_destroy(lck_mtx_t *lck, lck_grp_t *grp)
{
}

void lck_mtx_free(lck_mtx_t *lck, lck_grp_t *grp)
{
}

void lck_mtx_init(lck_mtx_t *lck, lck_grp_t *grp, lck_attr_t *attr)
{
}

void lck_mtx_lock(lck_mtx_t *lck)
{
}

uint64_t lck_mtx_lock_spin()
{
  return _lck_mtx_lock_spin();
}

void lck_mtx_unlock(lck_mtx_t *lck)
{
}

void lck_rw_destroy(lck_rw_t *lck, lck_grp_t *grp)
{
}

void lck_rw_init(lck_rw_t *lck, lck_grp_t *grp, lck_attr_t *attr)
{
}

void lck_rw_lock_exclusive(lck_rw_t *lck)
{
}

void lck_rw_lock_shared(lck_rw_t *lck)
{
}

BOOLean_t lck_rw_lock_shared_to_exclusive(lck_rw_t *lck)
{
  return _lck_rw_lock_shared_to_exclusive(lck);
}

void lck_rw_unlock_exclusive(lck_rw_t *lck)
{
}

void lck_rw_unlock_shared(lck_rw_t *lck)
{
}

void mach_msg_destroy_from_kernel_proper(mach_msg_header_t *msg)
{
}

mach_msg_return_t mach_msg_rpc_from_kernel_proper(mach_msg_header_t *msg, mach_msg_size_t send_size, mach_msg_size_t rcv_size)
{
  return _mach_msg_rpc_from_kernel_proper(msg, send_size, rcv_size);
}

mach_msg_return_t mach_msg_send_from_kernel_proper(mach_msg_header_t *msg, mach_msg_size_t send_size)
{
  return _mach_msg_send_from_kernel_proper(msg, send_size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void microuptime(timeval *tv)
{
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return _mig_strncpy(dest, src, len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return _mig_strncpy_zerofill(dest, src, len);
}

int msleep(void *chan, lck_mtx_t *mtx, int pri, const char *wmesg, timespec *ts)
{
  return _msleep(chan, mtx, pri, wmesg, ts);
}

void os_ref_init_count_external(os_ref_atomic_t *a1, os_refgrp *a2, os_ref_count_t a3)
{
}

os_ref_count_t os_ref_release_barrier_external(os_ref_atomic_t *a1, os_refgrp *a2)
{
  return _os_ref_release_barrier_external(a1, a2);
}

void os_ref_retain_external(os_ref_atomic_t *a1, os_refgrp *a2)
{
}

void panic(const char *string, ...)
{
}

int printf(const char *__format, ...)
{
  return _printf(__format);
}

int proc_pid(proc_t a1)
{
  return _proc_pid(a1);
}

uint64_t proc_pidversion()
{
  return _proc_pidversion();
}

int proc_selfpid(void)
{
  return _proc_selfpid();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int sysctl_handle_int(sysctl_oid *oidp, void *arg1, int arg2, sysctl_req *req)
{
  return _sysctl_handle_int(oidp, arg1, arg2, req);
}

void sysctl_register_oid(sysctl_oid *oidp)
{
}

void sysctl_unregister_oid(sysctl_oid *oidp)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

thread_call_t thread_call_allocate_with_options(thread_call_func_t func, thread_call_param_t param0, thread_call_priority_t pri, thread_call_options_t options)
{
  return _thread_call_allocate_with_options(func, param0, pri, options);
}

BOOLean_t thread_call_cancel_wait(thread_call_t call)
{
  return _thread_call_cancel_wait(call);
}

BOOLean_t thread_call_enter(thread_call_t call)
{
  return _thread_call_enter(call);
}

BOOLean_t thread_call_enter_delayed(thread_call_t call, uint64_t deadline)
{
  return _thread_call_enter_delayed(call, deadline);
}

BOOLean_t thread_call_free(thread_call_t call)
{
  return _thread_call_free(call);
}

void thread_deallocate(thread_t thread)
{
}

void thread_set_thread_name(thread_t th, const char *name)
{
}

kern_return_t thread_terminate(thread_act_t target_act)
{
  return _thread_terminate(target_act);
}

int throttle_get_thread_effective_io_policy(void)
{
  return _throttle_get_thread_effective_io_policy();
}

void *throttle_info_create(void)
{
  return _throttle_info_create();
}

void throttle_info_release(void *throttle_info)
{
}

uint64_t throttle_info_update_with_type()
{
  return _throttle_info_update_with_type();
}

int ubc_create_upl(vnode_t a1, off_t a2, int a3, upl_t *a4, upl_page_info_t **a5, int a6)
{
  return _ubc_create_upl(a1, a2, a3, a4, a5, a6);
}

off_t ubc_getsize(vnode *a1)
{
  return _ubc_getsize(a1);
}

int ubc_setsize(vnode *a1, off_t a2)
{
  return _ubc_setsize(a1, a2);
}

int ubc_upl_abort_range(upl_t a1, upl_offset_t a2, upl_size_t a3, int a4)
{
  return _ubc_upl_abort_range(a1, a2, a3, a4);
}

upl_size_t ubc_upl_maxbufsize(void)
{
  return _ubc_upl_maxbufsize();
}

void ubc_upl_range_needed(upl_t a1, int a2, int a3)
{
}

int uio_addiov(uio_t a_uio, user_addr_t a_baseaddr, user_size_t a_length)
{
  return _uio_addiov(a_uio, a_baseaddr, a_length);
}

uio_t uio_create(int a_iovcount, off_t a_offset, int a_spacetype, int a_iodirection)
{
  return _uio_create(a_iovcount, a_offset, a_spacetype, a_iodirection);
}

void uio_free(uio_t a_uio)
{
}

off_t uio_offset(uio_t a_uio)
{
  return _uio_offset(a_uio);
}

user_ssize_t uio_resid(uio_t a_uio)
{
  return _uio_resid(a_uio);
}

void uio_setoffset(uio_t a_uio, off_t a_offset)
{
}

int uiomove(const char *cp, int n, uio *uio)
{
  return _uiomove(cp, n, uio);
}

BOOLean_t upl_dirty_page(upl_page_info_t *upl, int index)
{
  return _upl_dirty_page(upl, index);
}

BOOLean_t upl_page_present(upl_page_info_t *upl, int index)
{
  return _upl_page_present(upl, index);
}

int vcount(vnode_t vp)
{
  return _vcount(vp);
}

int vflush(mount *mp, vnode *skipvp, int flags)
{
  return _vflush(mp, skipvp, flags);
}

errno_t vfs_attr_pack_ext(mount_t mp, vnode_t vp, uio_t uio, attrlist *alp, uint64_t options, vnode_attr *vap, void *fndesc, vfs_context_t ctx)
{
  return _vfs_attr_pack_ext(mp, vp, uio, alp, options, vap, fndesc, ctx);
}

int vfs_authopaqueaccess(mount_t mp)
{
  return _vfs_authopaqueaccess(mp);
}

vfs_context_t vfs_context_current(void)
{
  return _vfs_context_current();
}

uint64_t vfs_context_kernel()
{
  return _vfs_context_kernel();
}

int vfs_context_pid(vfs_context_t ctx)
{
  return _vfs_context_pid(ctx);
}

proc_t vfs_context_proc(vfs_context_t ctx)
{
  return _vfs_context_proc(ctx);
}

int vfs_devblocksize(mount_t mp)
{
  return _vfs_devblocksize(mp);
}

uint64_t vfs_flags(mount_t mp)
{
  return _vfs_flags(mp);
}

int vfs_fsadd(vfs_fsentry *vfe, vfstable_t *handle)
{
  return _vfs_fsadd(vfe, handle);
}

void *__cdecl vfs_fsprivate(mount_t mp)
{
  return _vfs_fsprivate(mp);
}

int vfs_fsremove(vfstable_t handle)
{
  return _vfs_fsremove(handle);
}

void vfs_getnewfsid(mount *mp)
{
}

int vfs_init_io_attributes(vnode_t devvp, mount_t mp)
{
  return _vfs_init_io_attributes(devvp, mp);
}

void vfs_ioattr(mount_t mp, vfsioattr *ioattrp)
{
}

int vfs_isforce(mount_t mp)
{
  return _vfs_isforce(mp);
}

uint64_t vfs_iskernelmount()
{
  return _vfs_iskernelmount();
}

int vfs_isrdonly(mount_t mp)
{
  return _vfs_isrdonly(mp);
}

int vfs_isunmount(mount_t mp)
{
  return _vfs_isunmount(mp);
}

uint64_t vfs_mount_at_path()
{
  return _vfs_mount_at_path();
}

uint64_t vfs_resolver_result()
{
  return _vfs_resolver_result();
}

void vfs_setauthopaque(mount_t mp)
{
}

void vfs_setauthopaqueaccess(mount_t mp)
{
}

uint64_t vfs_setdevvp()
{
  return _vfs_setdevvp();
}

void vfs_setflags(mount_t mp, uint64_t flags)
{
}

uint64_t vfs_setfskit()
{
  return _vfs_setfskit();
}

void vfs_setfsprivate(mount_t mp, void *mntdata)
{
}

void vfs_setioattr(mount_t mp, vfsioattr *ioattrp)
{
}

void vfs_setlocklocal(mount_t mp)
{
}

uint64_t vfs_setowner()
{
  return _vfs_setowner();
}

errno_t vfs_setup_vattr_from_attrlist(attrlist *alp, vnode_attr *vap, vtype obj_vtype, ssize_t *attr_fixed_sizep, vfs_context_t ctx)
{
  return _vfs_setup_vattr_from_attrlist(alp, vap, obj_vtype, attr_fixed_sizep, ctx);
}

vfsstatfs *__cdecl vfs_statfs(mount_t mp)
{
  return _vfs_statfs(mp);
}

int vfs_typenum(mount_t mp)
{
  return _vfs_typenum(mp);
}

int vfs_unmountbyfsid(fsid_t *fsid, int flags, vfs_context_t ctx)
{
  return _vfs_unmountbyfsid(fsid, flags, ctx);
}

uint64_t vfs_vnodecovered()
{
  return _vfs_vnodecovered();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

uint64_t vm_map_copy_discard()
{
  return _vm_map_copy_discard();
}

uint64_t vm_map_copyin()
{
  return _vm_map_copyin();
}

int vn_getpath(vnode *vp, char *pathbuf, int *len)
{
  return _vn_getpath(vp, pathbuf, len);
}

void vnode_clearfsnode(vnode_t vp)
{
}

void vnode_clearmountedon(vnode_t vp)
{
}

errno_t vnode_close(vnode_t vp, int flags, vfs_context_t ctx)
{
  return _vnode_close(vp, flags, ctx);
}

errno_t vnode_create(uint32_t flavor, uint32_t size, void *data, vnode_t *vpp)
{
  return _vnode_create(flavor, size, data, vpp);
}

void *__cdecl vnode_fsnode(vnode_t vp)
{
  return _vnode_fsnode(vp);
}

int vnode_get(vnode_t a1)
{
  return _vnode_get(a1);
}

uint64_t vnode_getfromfd()
{
  return _vnode_getfromfd();
}

const char *__cdecl vnode_getname(vnode_t vp)
{
  return _vnode_getname(vp);
}

vnode_t vnode_getparent(vnode_t vp)
{
  return _vnode_getparent(vp);
}

int vnode_getwithref(vnode_t vp)
{
  return _vnode_getwithref(vp);
}

int vnode_getwithvid(vnode_t a1, uint32_t a2)
{
  return _vnode_getwithvid(a1, a2);
}

int vnode_hasdirtyblks(vnode_t vp)
{
  return _vnode_hasdirtyblks(vp);
}

int vnode_ischr(vnode_t vp)
{
  return _vnode_ischr(vp);
}

int vnode_isdir(vnode_t vp)
{
  return _vnode_isdir(vp);
}

int vnode_isinuse(vnode_t vp, int refcnt)
{
  return _vnode_isinuse(vp, refcnt);
}

int vnode_isrecycled(vnode_t vp)
{
  return _vnode_isrecycled(vp);
}

int vnode_isreg(vnode_t vp)
{
  return _vnode_isreg(vp);
}

int vnode_isvroot(vnode_t vp)
{
  return _vnode_isvroot(vp);
}

int vnode_iterate(mount *mp, int flags, int (__cdecl *callout)(vnode *, void *), void *arg)
{
  return _vnode_iterate(mp, flags, callout, arg);
}

mount_t vnode_mount(vnode_t vp)
{
  return _vnode_mount(vp);
}

mount_t vnode_mountedhere(vnode_t vp)
{
  return _vnode_mountedhere(vp);
}

errno_t vnode_open(const char *path, int fmode, int cmode, int flags, vnode_t *vpp, vfs_context_t ctx)
{
  return _vnode_open(path, fmode, cmode, flags, vpp, ctx);
}

int vnode_put(vnode_t vp)
{
  return _vnode_put(vp);
}

void vnode_putname(const char *name)
{
}

int vnode_recycle(vnode_t vp)
{
  return _vnode_recycle(vp);
}

int vnode_ref(vnode_t vp)
{
  return _vnode_ref(vp);
}

void vnode_rele(vnode_t vp)
{
}

int vnode_removefsref(vnode_t vp)
{
  return _vnode_removefsref(vp);
}

void vnode_setmountedon(vnode_t vp)
{
}

dev_t vnode_specrdev(vnode_t vp)
{
  return _vnode_specrdev(vp);
}

void vnode_update_identity(vnode_t vp, vnode_t dvp, const char *name, int name_len, uint32_t name_hashval, int flags)
{
}

uint64_t vnode_usecount()
{
  return _vnode_usecount();
}

uint32_t vnode_vid(vnode_t vp)
{
  return _vnode_vid(vp);
}

vtype vnode_vtype(vnode_t vp)
{
  return _vnode_vtype(vp);
}

void wakeup(void *chan)
{
}

void wakeup_one(caddr_t chan)
{
}