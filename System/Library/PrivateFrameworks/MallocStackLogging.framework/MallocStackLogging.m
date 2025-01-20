DIR *reap_orphaned_log_files(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  char v6;
  unsigned char *v7;
  unsigned char v9[1024];
  unsigned char v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x263EF8C08];
  reap_orphaned_log_files_in_hierarchy((uint64_t)"/tmp/", 0, a1, a2);
  get_raw_log_dirs(a1, v9, v10);
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = &v9[1024 * v4];
    if (*v7 && _platform_strcmp()) {
      reap_orphaned_log_files_in_hierarchy((uint64_t)v7, 0, a1, a2);
    }
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return reap_orphaned_log_files_in_hierarchy((uint64_t)"/private/var/mobile/Containers/Data/Application", "<application-UUID>/tmp", a1, a2);
}

DIR *reap_orphaned_log_files_in_hierarchy(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = *MEMORY[0x263EF8C08];
  _platform_strlcpy();
  result = (DIR *)_platform_strlen();
  if ((unint64_t)&result[-8].__dd_lock.__sig + 1 >= 0xFFFFFFFFFFFFFC02)
  {
    v8 = result;
    result = opendir(v31);
    if (result)
    {
      v9 = result;
      if (v31[(void)v8 - 1] != 47) {
        v31[(void)v8] = 47;
      }
      if (a2)
      {
        for (uint64_t i = 0; ; ++i)
        {
          int v11 = a2[i];
          if (!a2[i] || v11 == 47) {
            break;
          }
        }
        if (*a2 == 60) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = i;
        }
        v13 = &a2[i];
        if (v11) {
          v14 = v13 + 1;
        }
        else {
          v14 = 0;
        }
        v15 = readdir(result);
        if (v15)
        {
          v16 = v15;
          do
          {
            if (v16->d_type == 4 && v16->d_name[0] != 46 && (!v12 || !_platform_strncmp()))
            {
              _platform_strlcpy();
              reap_orphaned_log_files_in_hierarchy(v31, v14, a3, a4);
            }
            v16 = readdir(v9);
          }
          while (v16);
        }
      }
      else
      {
        if (__stack_log_file_path__) {
          v29 = strrchr((char *)__stack_log_file_path__, 47) + 1;
        }
        else {
          v29 = 0;
        }
        pid_t v17 = getpid();
        uint64_t v18 = _platform_strlen();
        v19 = readdir(v9);
        if (v19)
        {
          v20 = v19;
          do
          {
            if ((v20->d_type | 2) == 0xA && !_platform_strncmp())
            {
              uint64_t v21 = strtol(&v20->d_name[v18], 0, 10);
              uint64_t v22 = v21;
              if (a4 && v21 == (int)a3)
              {
                _platform_strlcpy();
                open_log_file_at_path(v31, a4);
              }
              else
              {
                size_t v30 = 648;
                *(void *)v32 = 0xE00000001;
                int v33 = 1;
                int v34 = v21;
                sysctl(v32, 4u, v35, &v30, 0, 0);
                if (v30 != 648 || v22 == v17 && v29 && _platform_strcmp())
                {
                  _platform_strlcpy();
                  if (!delete_logging_file((uint64_t)v31))
                  {
                    if (v22 == v17) {
                      msl_printf(5, (uint64_t)"stack logs deleted from %s\n", v23, v24, v25, v26, v27, v28, (uint64_t)v31);
                    }
                    else {
                      msl_printf(5, (uint64_t)"process %ld no longer exists, stack logs deleted from %s\n", v23, v24, v25, v26, v27, v28, v22);
                    }
                  }
                }
              }
            }
            v20 = readdir(v9);
          }
          while (v20);
        }
      }
      return (DIR *)closedir(v9);
    }
  }
  return result;
}

uint64_t get_remote_env_var(int a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8C08];
  *a3 = 0;
  *(void *)uint64_t v21 = 0x800000001;
  size_t v18 = 8;
  size_t v19 = 0;
  uint64_t result = sysctl(v21, 2u, &v19, &v18, 0, 0);
  if (!result)
  {
    v5 = (void *)MEMORY[0x263EF8C78];
    uint64_t result = sld_allocate_pages((v19 + *MEMORY[0x263EF8C78] - 1) & -*MEMORY[0x263EF8C78]);
    if (result)
    {
      v6 = (_DWORD *)result;
      size_t v20 = v19;
      *(void *)uint64_t v22 = 0x3100000001;
      int v23 = a1;
      if (!sysctl(v22, 3u, (void *)result, &v20, 0, 0))
      {
        int64_t v7 = v20;
        unint64_t v8 = (unint64_t)v6 + v20;
        *((unsigned char *)v6 + v20 - 1) = 0;
        v10 = v6 + 1;
        int v9 = *v6;
        if (v7 >= 5 && (v9 & 0x80000000) == 0)
        {
          int v11 = 0;
          do
          {
            do
            {
              if (!*v10) {
                break;
              }
              ++v10;
            }
            while ((unint64_t)v10 < v8);
            if ((unint64_t)v10 < v8)
            {
              uint64_t v12 = (char *)v6 + v7 - v10;
              while (!*v10)
              {
                ++v10;
                if (!--v12)
                {
                  v10 = (char *)v6 + v7;
                  break;
                }
              }
            }
            if (v11 >= v9) {
              break;
            }
            ++v11;
          }
          while ((unint64_t)v10 < v8);
        }
        uint64_t v13 = _platform_strlen();
        v14 = &v10[v13];
        if ((unint64_t)&v10[v13 + 1] < v8)
        {
          uint64_t v15 = v13;
          v16 = (char *)v6 + v7;
          while (*v10)
          {
            if (!_platform_strncmp() && *v14 == 61)
            {
              _platform_strlcpy();
              return sld_deallocate_pages((mach_vm_address_t)v6, (v19 + *v5 - 1) & -*v5);
            }
            if ((unint64_t)v10 < v8)
            {
              uint64_t v17 = v16 - v10;
              while (*v10)
              {
                ++v10;
                if (!--v17)
                {
                  v10 = v16;
                  break;
                }
              }
            }
            v14 = &(++v10)[v15];
            if ((unint64_t)&v10[v15 + 1] >= v8) {
              return sld_deallocate_pages((mach_vm_address_t)v6, (v19 + *v5 - 1) & -*v5);
            }
          }
        }
      }
      return sld_deallocate_pages((mach_vm_address_t)v6, (v19 + *v5 - 1) & -*v5);
    }
  }
  return result;
}

uint64_t sld_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size)
{
  return mach_vm_deallocate(*MEMORY[0x263EF8C60], address, size);
}

uint64_t sld_allocate_pages(mach_vm_size_t size)
{
  v2 = (task_t *)MEMORY[0x263EF8C60];
  if (!stack_logging_enable_logging) {
    goto LABEL_11;
  }
  mach_vm_address_t address = 0;
  mach_port_t object_handle = 0;
  if ((enabled_no_footprint & 1) == 0) {
    goto LABEL_11;
  }
  memory_object_size_t sizea = size;
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x263EF8C60], &sizea, 0, 139267, &object_handle, 0);
  if (memory_entry_64 || (vm_size_t v4 = sizea, sizea < size) || object_handle + 1 <= 1)
  {
    if ((atomic_exchange((atomic_uchar *volatile)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce, 1u) & 1) == 0)
    {
      cur_protection = mach_error_string(memory_entry_64);
      msl_printf(3, (uint64_t)"allocate_pages(): unable to retrieve memory object: %s (%d)\n", v5, v6, v7, v8, v9, v10, (uint64_t)cur_protection);
    }
  }
  else
  {
    mach_error_t v20 = mach_memory_entry_ownership(object_handle, *v2, 1, 2);
    if (v20)
    {
      if ((atomic_exchange((atomic_uchar *volatile)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_5, 1u) & 1) == 0)
      {
        cur_protectiona = mach_error_string(v20);
        msl_printf(3, (uint64_t)"allocate_pages(): unable to hide memory from phys_footprint: %s (%d)\n", v21, v22, v23, v24, v25, v26, (uint64_t)cur_protectiona);
      }
    }
    else
    {
      mach_error_t v27 = vm_map(*v2, &address, v4, 0, 167772161, object_handle, 0, 0, 3, 3, 1u);
      if (v27)
      {
        if ((atomic_exchange((atomic_uchar *volatile)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_7, 1u) & 1) == 0)
        {
          uint64_t v28 = mach_error_string(v27);
          msl_printf(3, (uint64_t)"allocate_pages(): unable to map memory that was hidden from phys_footprint: %s (%d)\n", v29, v30, v31, v32, v33, v34, (uint64_t)v28);
        }
        mach_vm_address_t address = 0;
      }
    }
  }
  if (object_handle) {
    mach_port_deallocate(*v2, object_handle);
  }
  uint64_t result = address;
  if (!address)
  {
LABEL_11:
    mach_vm_address_t address = 0;
    mach_error_t v12 = mach_vm_allocate(*v2, &address, size, 167772161);
    if (v12)
    {
      uint64_t v13 = mach_error_string(v12);
      msl_printf(3, (uint64_t)"allocate_pages(): failed to map memory: %s (%d)\n", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
      return 0;
    }
    else
    {
      return address;
    }
  }
  return result;
}

void *retain_file_streams_for_task_with_error(mach_port_name_t a1, mach_vm_address_t a2, int *a3)
{
  kern_return_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  size_t v20;
  char *v21;
  mach_vm_address_t v22;
  int v23;
  int v24;
  BOOL v25;
  int v26;
  int v27;
  int v28;
  size_t v30;
  mach_vm_size_t outsize;
  int x;
  _OWORD v33[2];
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  int v64[2];
  int v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x263EF8C08];
  if (!a1)
  {
    uint64_t v8 = 0;
    uint64_t v7 = 5;
    goto LABEL_54;
  }
  x = 0;
  uint64_t v6 = pid_for_task(a1, &x);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    goto LABEL_54;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v9 = remote_fds_count;
  if (remote_fds_count)
  {
    uint64_t v10 = (void **)remote_fds;
    int v11 = remote_fds_count;
    do
    {
      uint64_t v8 = *v10;
      if (*v10 && *(_DWORD *)v8 == a1)
      {
        uint64_t v7 = 0;
        ++*((_DWORD *)v8 + 3);
        goto LABEL_52;
      }
      ++v10;
      --v11;
    }
    while (v11);
    mach_error_t v12 = (void **)remote_fds;
    uint64_t v13 = remote_fds_count;
    do
    {
      uint64_t v8 = *v12;
      if (*v12 && !*((_DWORD *)v8 + 3))
      {
        free_file_streams(*v12);
        goto LABEL_28;
      }
      ++v12;
      --v13;
    }
    while (v13);
    uint64_t v14 = remote_fds_count;
    uint64_t v15 = (char *)remote_fds;
    while (*(void *)v15)
    {
      v15 += 8;
      if (!--v14) {
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    if (remote_fds_count) {
      uint64_t v16 = (2 * remote_fds_count);
    }
    else {
      uint64_t v16 = 1;
    }
    uint64_t v17 = (char *)malloc_type_realloc((void *)remote_fds, 8 * v16, 0x61171CC2uLL);
    if (!v17)
    {
      uint64_t v8 = 0;
LABEL_26:
      uint64_t v7 = 5;
      goto LABEL_52;
    }
    remote_fds = (uint64_t)v17;
    remote_fds_count = v16;
    uint64_t v15 = &v17[8 * v9];
    bzero(v15, 8 * (v16 - v9));
  }
  uint64_t v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x1020040EE5BEA7CuLL);
  *(void *)uint64_t v15 = v8;
  if (!v8) {
    goto LABEL_26;
  }
LABEL_28:
  uint64_t v18 = x;
  *(_DWORD *)uint64_t v8 = a1;
  *((_DWORD *)v8 + 1) = v18;
  if (a2)
  {
    uint64_t v7 = map_shared_memory((uint64_t)v8, a2);
    if (v7 == 257) {
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v19 = *((void *)v8 + 5);
  if (v19)
  {
    if (!*(void *)(v19 + 40)) {
      goto LABEL_44;
    }
    mach_error_t v20 = (*(_DWORD *)(v19 + 48) + 1);
    uint64_t v21 = (char *)malloc_type_malloc(v20, 0xA6146A08uLL);
    outsize = 0;
    mach_vm_read_overwrite(*(_DWORD *)v8, *(void *)(*((void *)v8 + 5) + 40), v20, (mach_vm_address_t)v21, &outsize);
    if (outsize == v20) {
      open_log_file_at_path(v21, (uint64_t)v8);
    }
    free(v21);
    if (*((void *)v8 + 5)) {
      goto LABEL_44;
    }
  }
  if (!*((void *)v8 + 2))
  {
    open_log_file((void *)x, (uint64_t)v8);
    if (*((void *)v8 + 5))
    {
LABEL_44:
      *(void *)v64 = 0xE00000001;
      v65 = 1;
      v66 = x;
      memset(v33, 0, sizeof(v33));
      uint64_t v34 = 0u;
      v35 = 0u;
      uint64_t v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      uint64_t v30 = 648;
      uint64_t v24 = sysctl(v64, 4u, v33, &v30, 0, 0);
      if (v30) {
        uint64_t v25 = v24 == 0;
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = v34 & 4;
      if (!v25) {
        uint64_t v26 = 0;
      }
      *((_DWORD *)v8 + 2) = v26;
      *((_DWORD *)v8 + 3) = 1;
      goto LABEL_52;
    }
  }
  uint64_t v22 = *((void *)v8 + 3);
  if (!v22)
  {
LABEL_50:
    free_file_streams(v8);
    uint64_t v8 = 0;
    if (!v7) {
      uint64_t v7 = 5;
    }
    goto LABEL_52;
  }
  uint64_t v23 = map_shared_memory((uint64_t)v8, v22);
  if (v23 != 257)
  {
    uint64_t v7 = v23;
    if (*((void *)v8 + 5)) {
      goto LABEL_44;
    }
    goto LABEL_50;
  }
LABEL_40:
  free_file_streams(v8);
  uint64_t v8 = 0;
  uint64_t v7 = 257;
LABEL_52:
  mach_error_t v27 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint64_t v28 = v27;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&remote_fd_list_lock, (unsigned int *)&v28, 0, memory_order_release, memory_order_relaxed);
  if (v28 != v27) {
    os_unfair_lock_unlock(&remote_fd_list_lock);
  }
LABEL_54:
  if (a3) {
    *a3 = v7;
  }
  return v8;
}

void *open_log_file(void *result, uint64_t a2)
{
  int v3 = (int)result;
  uint64_t v10 = *MEMORY[0x263EF8C08];
  if ((open_log_file_already_reaped & 1) == 0)
  {
    uint64_t result = reap_orphaned_log_files((uint64_t)result, a2);
    open_log_file_already_reaped = 1;
  }
  if (!*(void *)(a2 + 16))
  {
    uint64_t result = open_log_file_from_directory(v3, "/tmp/", a2);
    if (!result)
    {
      uint64_t result = get_raw_log_dirs(v3, v8, v9);
      uint64_t v4 = 0;
      char v5 = 1;
      do
      {
        char v6 = v5;
        uint64_t v7 = &v8[1024 * v4];
        if (*v7) {
          uint64_t result = open_log_file_from_directory(v3, v7, a2);
        }
        char v5 = 0;
        uint64_t v4 = 1;
      }
      while ((v6 & 1) != 0);
    }
  }
  return result;
}

uint64_t msl_start_reading(mach_port_name_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  int v11 = 0;
  char v5 = retain_file_streams_for_task_with_error(a1, a2, &v11);
  if (!v5) {
    return 5;
  }
  char v6 = v5;
  uint64_t updated = update_cache_for_file_streams();
  if (updated)
  {
    uint64_t v8 = updated;
    release_file_streams_for_task(a1);
  }
  else
  {
    uint64_t v9 = v6[5];
    if (v9) {
      LODWORD(v9) = *(unsigned char *)(v9 + 56) & 1;
    }
    uint64_t v8 = 0;
    *a3 = v9;
  }
  return v8;
}

char *get_raw_log_dirs(int a1, unsigned char *a2, unsigned char *a3)
{
  if (getpid() == a1)
  {
    if (msl_get_tmp_dir()) {
      _platform_strlcpy();
    }
    else {
      *a2 = 0;
    }
    uint64_t result = msl_get_log_dir();
    if (result)
    {
      return (char *)_platform_strlcpy();
    }
    else
    {
      *a3 = 0;
    }
  }
  else
  {
    get_remote_env_var(a1, (uint64_t)"TMPDIR", a2);
    return (char *)get_remote_env_var(a1, (uint64_t)"MallocStackLoggingDirectory", a3);
  }
  return result;
}

uint64_t radix_tree_lookup(uint64_t a1, unint64_t a2)
{
  radix_tree_lookup_interval(a1, a2, 1uLL, (uint64_t)v3);
  return v3[2];
}

uint64_t radix_tree_lookup_interval@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  uint64_t result = radix_tree_lookup_recursive(a1, a2, a3, 0, 0xFFFFFFFFFFFFFFFFLL, (unsigned int *)(a1 + 20), 0, (unint64_t *)a4);
  if (*(void *)(a4 + 16) != -1)
  {
    if (!a3) {
      goto LABEL_15;
    }
    unint64_t v8 = *(void *)(a4 + 8);
    if (!v8) {
      goto LABEL_15;
    }
    unint64_t v9 = *(void *)a4;
    if (a2 < *(void *)a4 || a2 - *(void *)a4 >= v8)
    {
      unint64_t v10 = a3 + a2 - 1;
      BOOL v11 = v10 >= v9;
      unint64_t v12 = v10 - v9;
      if ((!v11 || v12 >= v8) && (v9 < a2 || v9 - a2 >= a3))
      {
        unint64_t v13 = v9 + v8 - 1;
        BOOL v11 = v13 >= a2;
        unint64_t v14 = v13 - a2;
        if (!v11 || v14 >= a3) {
LABEL_15:
        }
          radix_tree_lookup_interval_cold_1();
      }
    }
  }
  return result;
}

uint64_t radix_tree_insert(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (__CFADD__(a2, a3))
  {
    radix_tree_panic("MallocStackLogging INTERNAL ERROR: interval wraps around the end of the address space: %llx, size=%llx\n", a2, a3);
    goto LABEL_10;
  }
  uint64_t v4 = a4;
  if ((unint64_t)(a3 >> *(_DWORD *)(*a1 + 8)) << *(_DWORD *)(*a1 + 8) != a3)
  {
LABEL_10:
    radix_tree_panic("MallocStackLogging INTERNAL ERROR: cannot represent value:%llx or size:%llx (key is %llx)\n", v4, a3, a2);
    goto LABEL_11;
  }
  if ((a2 & 0xFFF) != 0)
  {
LABEL_11:
    unint64_t v9 = (char *)radix_tree_panic("MallocStackLogging INTERNAL ERROR: cannot represent key: %llx\n", a2);
    return radix_tree_panic(v9);
  }
  uint64_t result = radix_tree_delete(a1, a2, a3);
  if (result)
  {
    return radix_tree_insert_recursive((mach_vm_address_t *)a1, a2, a3, v4, 0, 0);
  }
  return result;
}

uint64_t radix_tree_panic(char *__format, ...)
{
  va_start(va, __format);
  va_copy(v4, va);
  vsnprintf(__str, 0x100uLL, __format, va);
  uint64_t v1 = abort_with_reason();
  return radix_tree_delete(v1);
}

uint64_t radix_tree_delete(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v5 = a3 + a2;
    if (__CFADD__(a3, a2)) {
      return 0;
    }
    while (1)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      radix_tree_lookup_interval(*a1, a2, a3, (uint64_t)&v10);
      uint64_t v8 = v11;
      if ((void)v11 == -1) {
        break;
      }
      unint64_t v9 = v10;
      if ((radix_tree_delete_recursive(*a1, v10, *a1 + 20, 0) & 1) == 0) {
        radix_tree_delete_cold_1();
      }
      if (a2 > v9)
      {
        uint64_t result = radix_tree_insert(a1, v9, a2 - v9, v8);
        if (!result) {
          return result;
        }
      }
      if (*((void *)&v10 + 1) + v9 > v5 && (radix_tree_insert(a1, v5, *((void *)&v10 + 1) + v9 - v5, v8) & 1) == 0) {
        return 0;
      }
    }
  }
  return 1;
}

uint64_t radix_tree_insert_recursive(mach_vm_address_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned __int16 a5, int a6)
{
  uint64_t v8 = a1;
LABEL_2:
  while (2)
  {
    if (a6 >= 52) {
      radix_tree_insert_recursive_cold_1();
    }
    unsigned int v9 = a5;
    if (*(unsigned __int16 *)(*v8 + 12) < a5) {
      radix_tree_insert_recursive_cold_2();
    }
    long long v10 = v8;
    uint64_t v11 = 0;
    uint64_t v12 = *v8 + 12 * a5 + 20;
    char v13 = 1;
    while (1)
    {
      char v14 = v13;
      unint64_t v15 = *(unsigned int *)(v12 + 6 * v11);
      int v16 = v15 & 0x7C000000;
      if ((v15 & 0x7C000000) == 0) {
        break;
      }
      int v17 = 0;
      unint64_t v18 = v15 & 0x3FFFFFF;
      uint64_t v19 = (v15 >> 26) & 0x1F;
      int v20 = -a6;
      while (v18 != ((a2 >> (v20 - v19)) & ~(-1 << (v19 + v17))))
      {
        int v21 = v19 + v17;
        v18 >>= 1;
        --v17;
        v16 -= 0x4000000;
        LOBYTE(v20) = v20 + 1;
        if (v21 == 1) {
          goto LABEL_11;
        }
      }
      if (v19 + v17)
      {
        if (v17)
        {
          int v46 = a6;
          uint64_t result = radix_tree_allocate_node(v10);
          if (!result) {
            return result;
          }
          a5 = result;
          int v47 = v46 + ((v15 >> 26) & 0x1F) + v17;
          unsigned int v30 = *(unsigned __int16 *)(*a1 + 12);
          uint64_t v31 = *a1 + 20;
          if (v30 >= v9) {
            uint64_t v32 = (unsigned int *)(v31 + 12 * v9);
          }
          else {
            uint64_t v32 = 0;
          }
          uint64_t v33 = (char *)v32 + 6 * v11;
          uint64_t v34 = v31 + 12 * a5;
          if (v30 < a5) {
            uint64_t v34 = 0;
          }
          int v35 = (*(_DWORD *)v33 - v16) & 0x7C000000;
          unsigned int v36 = *(_DWORD *)v34 & 0x83FFFFFF | v35;
          *(_DWORD *)uint64_t v34 = v36;
          unsigned int v37 = *(_DWORD *)v33 & 0x80000000;
          *(_DWORD *)uint64_t v34 = v37 | v36 & 0x7FFFFFFF;
          *(_WORD *)(v34 + 4) = *((_WORD *)v33 + 2);
          *(_DWORD *)uint64_t v34 = v35 & 0xFC000000 | *(_DWORD *)v33 & ~(-1 << (((*(_DWORD *)v33 >> 26) & 0x1F)
                                                                      - ((v15 >> 26) & 0x1F)
                                                                      - v17)) & 0x3FFFFFF | v37;
          *(_DWORD *)uint64_t v33 = ((*(_DWORD *)v33 & 0x3FFFFFFu) >> (((*(_DWORD *)v33 >> 26) & 0x1F)
                                                            - ((v15 >> 26) & 0x1F)
                                                            - v17))
                         + v16;
          *((_WORD *)v33 + 2) = a5;
          fixnode(v32);
          uint64_t v8 = a1;
          a6 = v47;
        }
        else
        {
          if ((v15 & 0x80000000) != 0) {
            radix_tree_insert_recursive_cold_4();
          }
          a5 = *(_WORD *)(v12 + 6 * v11 + 4);
          a6 += v19;
          uint64_t v8 = v10;
        }
        goto LABEL_2;
      }
LABEL_11:
      char v13 = 0;
      uint64_t v11 = 1;
      if ((v14 & 1) == 0)
      {
        radix_tree_panic("MallocStackLogging INTERNAL ERROR: at least one edge must prefix-match or be unused\n");
        goto LABEL_44;
      }
    }
    uint64_t v8 = v10;
    int v22 = a6;
    int node = radix_tree_allocate_node(v10);
    char v24 = v22;
    a5 = node;
    if (v22 < 26)
    {
      if (!node) {
        return 0;
      }
      if (*(unsigned __int16 *)(*v8 + 12) >= v9) {
        uint64_t v25 = (unsigned int *)(*v8 + 12 * v9 + 20);
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = (char *)v25 + 6 * v11;
      *((_WORD *)v26 + 2) = node;
      int v27 = v22 + 26;
      *(_DWORD *)uint64_t v26 = (a2 >> (38 - v24)) & 0x3FFFFFF | 0x68000000;
      if (*(unsigned __int16 *)(*v8 + 12) >= (unsigned __int16)node) {
        uint64_t v28 = (void *)(*v8 + 12 * (unsigned __int16)node + 20);
      }
      else {
        uint64_t v28 = 0;
      }
      bzero(v28, 0xCuLL);
      fixnode(v25);
      a6 = v27;
      continue;
    }
    break;
  }
  if (node)
  {
    if (*(unsigned __int16 *)(*v8 + 12) >= v9) {
      v38 = (unsigned int *)(*v8 + 12 * v9 + 20);
    }
    else {
      v38 = 0;
    }
    v39 = (char *)v38 + 6 * v11;
    *((_WORD *)v39 + 2) = a5;
    *(_DWORD *)v39 = (a2 >> 12) & ~(-1 << (52 - v22)) & 0x3FFFFFF | ((52 - v22) << 26) | 0x80000000;
    uint64_t v40 = *v8 + 12 * a5 + 20;
    if (*(unsigned __int16 *)(*v8 + 12) < a5) {
      uint64_t v40 = 0;
    }
    *(void *)uint64_t v40 = a4;
    mach_vm_address_t v41 = *v8;
    unint64_t v42 = a3 >> *(_DWORD *)(*v8 + 8);
    *(_DWORD *)(v40 + 8) = v42;
    if ((unint64_t)v42 << *(_DWORD *)(v41 + 8) == a3)
    {
      fixnode(v38);
      return 1;
    }
LABEL_44:
    radix_tree_insert_recursive_cold_3();
  }
  return 0;
}

uint64_t radix_tree_delete_recursive(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  if (a4 >= 52) {
    radix_tree_delete_recursive_cold_1();
  }
  if (!a3) {
    radix_tree_delete_recursive_cold_2();
  }
  uint64_t v5 = a1;
  uint64_t v6 = 0;
  char v7 = 1;
  while (1)
  {
    unsigned int v8 = *(_DWORD *)(a3 + 6 * v6);
    char v9 = v7;
    if ((v8 & 0x7C000000) != 0
      && ((a2 >> (-(char)a4 - ((v8 >> 26) & 0x1F))) & ~(-1 << (v8 >> 26))) == (v8 & 0x3FFFFFF))
    {
      break;
    }
    char v7 = 0;
    int v11 = 0;
    uint64_t v6 = 1;
    if ((v9 & 1) == 0) {
      return v11 & v8;
    }
  }
  uint64_t v12 = a3 + 6 * v6;
  unsigned int v15 = *(unsigned __int16 *)(v12 + 4);
  char v14 = (unsigned __int16 *)(v12 + 4);
  unsigned int v13 = v15;
  if ((v8 & 0x80000000) != 0)
  {
    unsigned int v16 = v13;
    goto LABEL_17;
  }
  if (!radix_tree_delete_recursive(a1))
  {
    unsigned int v8 = 0;
    int v11 = 1;
    return v11 & v8;
  }
  unsigned int v16 = *v14;
  if (*(unsigned __int16 *)(v5 + 12) < v16) {
    radix_tree_delete_recursive_cold_3();
  }
  if ((*(unsigned char *)(v5 + 12 * *v14 + 23) & 0x7C) == 0 && (*(unsigned char *)(v5 + 12 * *v14 + 29) & 0x7C) == 0)
  {
    a1 = v5;
LABEL_17:
    radix_tree_free_node(a1, v16);
    int v17 = (_DWORD *)(a3 + 6);
    if (!v6)
    {
      *(_DWORD *)a3 = *v17;
      *(_WORD *)(a3 + 4) = *(_WORD *)(a3 + 10);
    }
    *v17 &= 0x83FFFFFF;
  }
  int v11 = 1;
  unsigned int v8 = 1;
  return v11 & v8;
}

uint64_t radix_tree_init(uint64_t a1, uint64_t a2)
{
  strcpy((char *)a1, "radixv3");
  int v3 = (void *)(a1 + 20);
  if (a1 + 20 >= (unint64_t)(a1 + a2)) {
    radix_tree_init_cold_2();
  }
  *(_WORD *)(a1 + 12) = ((int)a2 - 20) / 0xCu;
  if ((unsigned __int16)(((int)a2 - 20) / 0xCu) <= 2u) {
    radix_tree_init_cold_1();
  }
  *(_DWORD *)(a1 + 16) = 1;
  bzero(v3, 0xCuLL);
  bzero((void *)(a1 + 32), 0xCuLL);
  *(_WORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 8) = 12;
  return a1;
}

uint64_t radix_tree_create()
{
  uint64_t result = sld_allocate_pages(0x4000uLL);
  if (result) {
    return radix_tree_init(result, 0x4000);
  }
  return result;
}

uint64_t radix_tree_destroy(mach_vm_address_t a1)
{
  mach_vm_size_t v2 = radix_tree_size(a1);
  uint64_t result = mach_vm_deallocate(*MEMORY[0x263EF8C60], a1, v2);
  if (result) {
    radix_tree_destroy_cold_1();
  }
  return result;
}

uint64_t radix_tree_size(uint64_t a1)
{
  uint64_t v1 = 3 * *(unsigned __int16 *)(a1 + 12);
  uint64_t result = (12 * *(unsigned __int16 *)(a1 + 12) + 16403) & 0x1FC000;
  if ((unint64_t)(result - 4 * v1 - 32) <= 0xFFFFFFFFFFFFFFF3) {
    radix_tree_size_cold_1();
  }
  return result;
}

uint64_t radix_tree_count(uint64_t a1)
{
  return radix_tree_count_recursive(a1, a1 + 20);
}

uint64_t radix_tree_count_recursive(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    int v8 = *(_DWORD *)(a2 + 6 * v4);
    if ((v8 & 0x7C000000) != 0)
    {
      unsigned int v9 = *(unsigned __int16 *)(a2 + 6 * v4 + 4);
      if (*(unsigned __int16 *)(a1 + 12) >= v9) {
        uint64_t v10 = a1 + 12 * v9 + 20;
      }
      else {
        uint64_t v10 = 0;
      }
      if (v8 < 0) {
        unint64_t v11 = (unint64_t)*(unsigned int *)(v10 + 8) << *(_DWORD *)(a1 + 8);
      }
      else {
        unint64_t v11 = radix_tree_count_recursive(a1, v10);
      }
      v5 += v11;
    }
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
  return v5;
}

uint64_t radix_tree_lookup_recursive@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unsigned int *a6@<X5>, int a7@<W6>, unint64_t *a8@<X8>)
{
  if (!a6) {
    radix_tree_lookup_recursive_cold_1();
  }
  unint64_t v8 = a5;
  if (!a5) {
    goto LABEL_89;
  }
  unint64_t v9 = a3;
  if (!a3) {
    goto LABEL_89;
  }
  unint64_t v13 = a2;
  unint64_t v16 = a4 - a2;
  if (a4 < a2 || a3 <= v16)
  {
    unint64_t v17 = a5 + a4 - 1;
    BOOL v34 = v17 >= a2;
    unint64_t v18 = v17 - a2;
    if ((!v34 || v18 >= a3) && (a2 < a4 || a2 - a4 >= a5))
    {
      unint64_t v19 = a3 + a2 - 1;
      BOOL v34 = v19 >= a4;
      unint64_t v20 = v19 - a4;
      if (!v34 || v20 >= a5) {
LABEL_89:
      }
        radix_tree_lookup_recursive_cold_2();
    }
  }
  if (a7 >= 52) {
    radix_tree_lookup_recursive_cold_3();
  }
  uint64_t result = fixnode(a6);
  if (result) {
    radix_tree_lookup_recursive_cold_4();
  }
  if (v13 < a4)
  {
    BOOL v22 = v9 == v16;
    BOOL v23 = v9 > v16;
    v9 -= v16;
    if (!v23)
    {
      *a8 = 0;
      a8[1] = 0;
      a8[2] = -1;
      a8[3] = a4;
      return result;
    }
    if (v22) {
LABEL_92:
    }
      radix_tree_lookup_recursive_cold_5();
    unint64_t v13 = a4;
  }
  if (a4 < v13 || a4 - v13 >= v9)
  {
    unint64_t v24 = v8 + a4 - 1;
    BOOL v34 = v24 >= v13;
    unint64_t v25 = v24 - v13;
    if ((!v34 || v25 >= v9) && (v13 < a4 || v13 - a4 >= v8))
    {
      unint64_t v26 = v9 + v13 - 1;
      BOOL v34 = v26 >= a4;
      unint64_t v27 = v26 - a4;
      if (!v34 || v27 >= v8) {
        goto LABEL_92;
      }
    }
  }
  uint64_t v28 = 0;
  unint64_t v45 = v9 + v13 - 1;
  while (1)
  {
    unsigned int v29 = *(unsigned int *)((char *)a6 + v28 + 6);
    if ((v29 & 0x7C000000) == 0) {
      goto LABEL_78;
    }
    if (((-1 << (v29 >> 26)) & v29 & 0x3FFFFFF) != 0) {
      radix_tree_lookup_recursive_cold_11();
    }
    int v30 = ((v29 >> 26) & 0x1F) + a7;
    if ((((unint64_t)~(-1 << (v29 >> 26)) << -(char)(((v29 >> 26) & 0x1F) + a7)) & a4) != 0) {
      radix_tree_lookup_recursive_cold_10();
    }
    unint64_t v31 = ((unint64_t)(v29 & 0x3FFFFFF) << (64 - v30)) | a4;
    if (v31 - a4 >= v8 || ((v32 = a4 - v31 + v8, unint64_t v33 = a4 + v8 - 1, v33 >= a4) ? (v34 = v8 - 1 >= v8) : (v34 = 1), v34)) {
      radix_tree_lookup_recursive_cold_9();
    }
    if (!v32) {
      goto LABEL_78;
    }
    BOOL v35 = v31 < v13 || v31 - v13 >= v9;
    BOOL v36 = !v35;
    if (v35)
    {
      BOOL v34 = v33 >= v13;
      unint64_t v37 = v33 - v13;
      BOOL v38 = !v34 || v37 >= v9;
      if (v38 && (v13 < v31 || v13 - v31 >= v32) && (v45 < v31 || v45 - v31 >= v32)) {
        goto LABEL_78;
      }
    }
    if ((v29 & 0x80000000) == 0)
    {
      *(_OWORD *)a8 = 0u;
      *((_OWORD *)a8 + 1) = 0u;
      uint64_t result = radix_tree_lookup_recursive(a1, v13, v9);
      if (a8[2] != -1) {
        return result;
      }
      unint64_t v39 = a8[3];
      BOOL v34 = v39 >= a4;
      unint64_t v40 = v39 - a4;
      if (v34) {
        unint64_t v8 = v40;
      }
      else {
        unint64_t v8 = 0;
      }
      goto LABEL_78;
    }
    if (*(unsigned __int16 *)(a1 + 12) < *(unsigned __int16 *)((char *)a6 + v28 + 10)) {
      radix_tree_lookup_recursive_cold_6();
    }
    if (v30 != 52) {
      radix_tree_lookup_recursive_cold_8();
    }
    mach_vm_address_t v41 = (unint64_t *)(a1 + 12 * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 20);
    unint64_t v42 = (unint64_t)*(unsigned int *)(a1 + 12 * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 28) << *(_DWORD *)(a1 + 8);
    if (v42 > v32) {
      radix_tree_lookup_recursive_cold_7();
    }
    if (v42)
    {
      if (v36) {
        break;
      }
      unint64_t v43 = v31 - 1 + v42;
      BOOL v34 = v43 >= v13;
      unint64_t v44 = v43 - v13;
      if (v34 && v44 < v9) {
        break;
      }
      if (v13 >= v31 && v13 - v31 < v42 || v45 >= v31 && v45 - v31 < v42) {
        break;
      }
    }
    if (v31 >= a4) {
      unint64_t v8 = v31 - a4;
    }
    else {
      unint64_t v8 = 0;
    }
LABEL_78:
    v28 -= 6;
    if (v28 == -12)
    {
      *a8 = 0;
      a8[1] = 0;
      a8[2] = -1;
      a8[3] = v8 + a4;
      return result;
    }
  }
  *a8 = v31;
  a8[1] = v42;
  a8[2] = *v41;
  a8[3] = 0;
  return result;
}

uint64_t fixnode(unsigned int *a1)
{
  unsigned int v1 = *a1;
  int v2 = (*a1 >> 26) & 0x1F;
  if (!v2 || (v3 = *(unsigned int *)((char *)a1 + 6), (int v4 = (v3 >> 26) & 0x1F) == 0))
  {
    if ((v1 & 0x7C000000) == 0 && (*((unsigned char *)a1 + 9) & 0x7C) != 0) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((v3 & 0x3FFFFFF) << (26 - v4) >= (v1 & 0x3FFFFFF) << (26 - v2)) {
    return 0;
  }
LABEL_8:
  __int16 v6 = *((_WORD *)a1 + 2);
  unsigned int v7 = *a1;
  *a1 = *(unsigned int *)((char *)a1 + 6);
  *((_WORD *)a1 + 2) = *((_WORD *)a1 + 5);
  *(unsigned int *)((char *)a1 + 6) = v7;
  *((_WORD *)a1 + 5) = v6;
  return 1;
}

uint64_t radix_tree_allocate_node(mach_vm_address_t *a1)
{
  uint64_t v2 = *a1;
  if (!*(_DWORD *)(v2 + 16))
  {
    unint64_t v3 = radix_tree_size(v2);
    mach_vm_size_t v4 = v3 <= 0x60000 ? 2 * v3 : 786432;
    if (v4 > v3)
    {
      mach_vm_size_t v5 = v3;
      mach_vm_address_t pages = sld_allocate_pages(v4);
      if (pages)
      {
        mach_vm_address_t v7 = pages;
        unint64_t v8 = (vm_map_t *)MEMORY[0x263EF8C60];
        if (mach_vm_copy(*MEMORY[0x263EF8C60], *a1, v5, pages))
        {
          mach_vm_deallocate(*v8, v7, v4);
        }
        else
        {
          uint64_t v9 = *(unsigned __int16 *)(*a1 + 12);
          mach_vm_deallocate(*v8, *a1, v5);
          *a1 = v7;
          *(_WORD *)(v7 + 12) = ((v4 & 0x1FFFFC) - 20) / 0xC;
          *(_DWORD *)(v7 + 16) = v9;
          *(unsigned char *)(v7 + 12 * v9 + 22) = 0;
          *(_WORD *)(*a1 + 12 * v9 + 20) = v9 + 1;
        }
      }
    }
  }
  mach_vm_address_t v10 = *a1;
  uint64_t v11 = *(unsigned int *)(*a1 + 16);
  if (!v11) {
    return v11;
  }
  unsigned int v12 = *(unsigned __int16 *)(v10 + 12);
  if (v12 < (unsigned __int16)v11) {
    radix_tree_allocate_node_cold_1();
  }
  unint64_t v13 = (unsigned __int16 *)(v10 + 12 * (unsigned __int16)v11 + 20);
  unsigned int v14 = *v13;
  *(_DWORD *)(v10 + 16) = v14;
  if (!v14 || *(unsigned char *)(v10 + 12 * (unsigned __int16)v11 + 22))
  {
LABEL_19:
    bzero(v13, 0xCuLL);
    return v11;
  }
  if (v12 >= v14)
  {
    mach_vm_address_t v15 = v10 + 12 * v14;
    if (v14 + 1 < v12) {
      __int16 v16 = v14 + 1;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)(v15 + 20) = v16;
    goto LABEL_19;
  }
  uint64_t v18 = radix_tree_panic("radix tree is corrupt, next_free=%d num_nodes=%d\n", v14, v12);
  return radix_tree_free_node(v18, v19);
}

uint64_t radix_tree_free_node(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 12) < (unsigned __int16)a2) {
    radix_tree_free_node_cold_1();
  }
  uint64_t v2 = result + 12 * (unsigned __int16)a2;
  *(_WORD *)(v2 + 20) = *(_DWORD *)(result + 16);
  *(unsigned char *)(v2 + 22) = 1;
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t uniquing_table_unwind_stack_remote(uint64_t result, unsigned int a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!result)
  {
LABEL_27:
    LODWORD(v9) = 0;
    goto LABEL_28;
  }
  if (a5 >= 0x200) {
    uint64_t v9 = 512;
  }
  else {
    uint64_t v9 = a5;
  }
  if (v9)
  {
    uint64_t v10 = 0;
    char v11 = *(unsigned char *)(result + 60);
    int v12 = -1;
    while (1)
    {
      if (a2 == -1) {
        goto LABEL_25;
      }
      unsigned int v13 = a2;
      if (*(void *)(result + 8) <= (unint64_t)a2) {
        goto LABEL_25;
      }
      if (a2 == v12) {
        break;
      }
      uint64_t v14 = *(void *)(result + 44);
      if (!v14) {
        goto LABEL_24;
      }
      if (*(_DWORD *)v14 < a2)
      {
        int v15 = 0;
        while (1)
        {
          uint64_t v14 = *(void *)(v14 + 24);
          if (!v14) {
            break;
          }
          v15 += *(_DWORD *)v14;
          if (*(_DWORD *)v14 + v15 >= a2) {
            goto LABEL_17;
          }
        }
LABEL_24:
        uint64_t result = msl_printf(3, (uint64_t)"failed to read table node\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
LABEL_25:
        LODWORD(v9) = v10;
        goto LABEL_28;
      }
      int v15 = 0;
LABEL_17:
      uint64_t v16 = *(void *)(v14 + 16);
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v17 = v16 + 16 * (a2 - v15);
      if ((v11 & 2) != 0)
      {
        if (*(void *)(v17 + 8) < 0x10000uLL) {
          goto LABEL_25;
        }
        *(void *)(a3 + 8 * v10) = *(void *)v17 & 0xFFFFFFFFFFFFLL;
        a2 = *(_DWORD *)(v17 + 6);
      }
      else
      {
        atomic_load((unsigned int *)(v17 + 12));
        *(void *)(a3 + 8 * v10) = *(void *)v17;
        a2 = *(_DWORD *)(v17 + 8);
      }
      ++v10;
      int v12 = v13;
      if (v10 == v9) {
        goto LABEL_28;
      }
    }
    uint64_t result = msl_printf(3, (uint64_t)"circular parent reference in uniquing_table_stack_unwind: parent == prev_parent\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
    goto LABEL_27;
  }
LABEL_28:
  *a4 = v9;
  return result;
}

unint64_t *uniquing_table_clone_from_task(vm_map_read_t a1, mach_vm_address_t a2)
{
  vm_offset_t data = 0;
  mach_msg_type_number_t dataCnt = 0;
  mach_vm_size_t v3 = (*MEMORY[0x263EF8C78] + 67) & -*MEMORY[0x263EF8C78];
  mach_error_t v4 = mach_vm_read(a1, a2, v3, &data, &dataCnt);
  if (v4)
  {
    mach_error_t v5 = v4;
    __int16 v6 = (FILE *)*MEMORY[0x263EF8C10];
    mach_vm_address_t v7 = mach_error_string(v4);
    fprintf(v6, "error while attempting to mach_vm_read remote stack uniquing table (%d): %s\n", v5, v7);
    return 0;
  }
  else
  {
    if (v3 == dataCnt)
    {
      uint64_t v9 = (unint64_t *)malloc_type_malloc(0x44uLL, 0x10200402DA45A13uLL);
      unint64_t v8 = v9;
      if (v9)
      {
        long long v10 = *(_OWORD *)data;
        long long v11 = *(_OWORD *)(data + 16);
        long long v12 = *(_OWORD *)(data + 48);
        *((_OWORD *)v9 + 2) = *(_OWORD *)(data + 32);
        *((_OWORD *)v9 + 3) = v12;
        *(_OWORD *)uint64_t v9 = v10;
        *((_OWORD *)v9 + 1) = v11;
        *(unint64_t *)((char *)v9 + 44) = 0;
        unsigned int v13 = (unint64_t *)((char *)v9 + 44);
        *((_DWORD *)v9 + 16) = 1;
        unint64_t v14 = v9[2];
        if (v14)
        {
          mach_vm_address_t v15 = v9[4];
          do
          {
            vm_offset_t v27 = 0;
            mach_msg_type_number_t v26 = 0;
            if (v14 >= 0x80000000) {
              mach_vm_size_t v16 = 0x80000000;
            }
            else {
              mach_vm_size_t v16 = v14;
            }
            while (1)
            {
              mach_error_t v17 = mach_vm_read(a1, v15, v16, &v27, &v26);
              if (!v17) {
                break;
              }
              BOOL v18 = v16 > 0x200001;
              v16 >>= 1;
              if (!v18)
              {
                mach_error_t v22 = v17;
                BOOL v23 = (FILE *)*MEMORY[0x263EF8C10];
                unint64_t v24 = mach_error_string(v17);
                fprintf(v23, "error while attempting to mach_vm_read remote stack uniquing table contents (%d): %s\n", v22, v24);
                free_uniquing_table_chunks((uint64_t)v8);
                free(v8);
                goto LABEL_15;
              }
            }
            int v19 = malloc_type_malloc(0x20uLL, 0x102004078DD3916uLL);
            void *v13 = v19;
            uint64_t v20 = v26;
            *(_DWORD *)int v19 = v26 >> 4;
            vm_offset_t v21 = v27;
            v19[1] = v20;
            v19[2] = v21;
            v19[3] = 0;
            v15 += v20;
            unsigned int v13 = v19 + 3;
            v14 -= v20;
          }
          while (v14);
        }
      }
    }
    else
    {
LABEL_15:
      unint64_t v8 = 0;
    }
    mach_vm_deallocate(*MEMORY[0x263EF8C60], data, dataCnt);
  }
  return v8;
}

void free_uniquing_table_chunks(uint64_t a1)
{
  unsigned int v1 = *(mach_vm_size_t **)(a1 + 44);
  if (v1)
  {
    uint64_t v2 = (vm_map_t *)MEMORY[0x263EF8C60];
    do
    {
      mach_vm_deallocate(*v2, v1[2], v1[1]);
      mach_vm_size_t v3 = (mach_vm_size_t *)v1[3];
      free(v1);
      unsigned int v1 = v3;
    }
    while (v3);
  }
}

mach_vm_size_t *uniquing_table_chunk_from_slots(mach_vm_address_t a1, unsigned int a2)
{
  mach_error_t v4 = (mach_vm_size_t *)malloc_type_malloc(0x20uLL, 0x102004078DD3916uLL);
  mach_error_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)mach_error_t v4 = a2;
    mach_vm_size_t v6 = 16 * a2;
    v4[1] = v6;
    v4[3] = 0;
    mach_vm_address_t address = 0;
    mach_vm_address_t v7 = (vm_map_t *)MEMORY[0x263EF8C60];
    if (mach_vm_allocate(*MEMORY[0x263EF8C60], &address, v6, 167772161) || mach_vm_copy(*v7, a1, v5[1], address))
    {
      free(v5);
      return 0;
    }
    else
    {
      v5[2] = address;
    }
  }
  return v5;
}

uint64_t uniquing_table_remote_retain(uint64_t result)
{
  if (!result) {
    uniquing_table_remote_retain_cold_1();
  }
  int v1 = *(_DWORD *)(result + 64);
  if (!v1) {
    uniquing_table_remote_retain_cold_2();
  }
  *(_DWORD *)(result + 64) = v1 + 1;
  return result;
}

void uniquing_table_remote_release(_DWORD *a1)
{
  if (a1)
  {
    int v2 = a1[16];
    if (!v2) {
      uniquing_table_remote_release_cold_1();
    }
    int v3 = v2 - 1;
    a1[16] = v3;
    if (!v3)
    {
      free_uniquing_table_chunks((uint64_t)a1);
      free(a1);
    }
  }
}

uint64_t uniquing_table_remote_enumerate_chunks(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (!a2) {
      uniquing_table_remote_enumerate_chunks_cold_1();
    }
    for (uint64_t i = *(unsigned int **)(result + 44); i; uint64_t i = (unsigned int *)*((void *)i + 3))
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *((void *)i + 2), *i);
  }
  return result;
}

uint64_t uniquing_table_create(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < a1) {
    return 0;
  }
  unint64_t v8 = (void *)MEMORY[0x263EF8C78];
  unint64_t v9 = 16 * (unint64_t)a1 / *MEMORY[0x263EF8C78] * *MEMORY[0x263EF8C78] <= 0x100000
     ? 0x100000
     : 16 * (unint64_t)a1 / *MEMORY[0x263EF8C78] * *MEMORY[0x263EF8C78];
  unint64_t v10 = 16 * (unint64_t)a2 / *MEMORY[0x263EF8C78] * *MEMORY[0x263EF8C78];
  if (v9 > v10) {
    return 0;
  }
  if (dword_26774EB70)
  {
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  bzero(&global_stack_uniquing_state, 0x2828uLL);
  qword_26774E350 = (uint64_t)&global_stack_uniquing_state;
  qword_26774E358 = (uint64_t)&global_stack_uniquing_state + 4104;
  dword_26774EB70 = 1;
  uint64_t v13 = pthread_key_create((pthread_key_t *)&global_stack_uniquing_state + 1285, (void (__cdecl *)(void *))msl_tsd_destroy);
  if (v13)
  {
LABEL_11:
    if (!dword_26774EB74) {
      msl_printf(3, (uint64_t)"pthread_key_create failed with error %d; MSL can't proceed with TSD.",
    }
        a3,
        a4,
        a5,
        a6,
        a7,
        a8,
        v13);
    goto LABEL_14;
  }
  dword_26774EB74 = 1;
LABEL_14:
  mach_vm_address_t pages = (void *)sld_allocate_pages((*v8 + 1679) & -*v8);
  uint64_t v11 = (uint64_t)pages;
  if (pages)
  {
    bzero(pages, 0x690uLL);
    unint64_t v15 = 0;
    uint64_t v16 = 96;
    do
    {
      *(void *)(v11 + v16) = v9;
      unint64_t v17 = 4 * v9;
      if (4 * v9 <= v9) {
        break;
      }
      if (v15 > 8) {
        break;
      }
      ++v15;
      v16 += 160;
      v9 *= 4;
    }
    while (v17 <= v10);
    uniquing_table_initialize(v11);
  }
  return v11;
}

mach_vm_address_t msl_tsd_destroy(mach_vm_address_t result)
{
  if (result) {
    return sld_deallocate_pages(result, 0x2828uLL);
  }
  return result;
}

uint64_t uniquing_table_initialize(uint64_t a1)
{
  mach_vm_size_t v2 = *(void *)(a1 + 96);
  uint64_t result = sld_allocate_pages(v2);
  uint64_t v4 = (v2 >> 4) & 0xFFFFFFFFFFFFFFELL;
  *(void *)(a1 + 72) = result;
  *(_DWORD *)(a1 + 84) = v4;
  *(_DWORD *)(a1 + 88) = 19;
  *(_DWORD *)(a1 + 80) = 0;
  atomic_fetch_add((atomic_uint *volatile)(a1 + 224), 1u);
  *(void *)(a1 + 16) = v2;
  *(unsigned char *)(a1 + 60) = *(unsigned char *)(a1 + 60) & 0xF9 | 4;
  *(void *)(a1 + 52) = *(void *)(a1 + 1536);
  mach_error_t v5 = (void *)MEMORY[0x263EF8C78];
  *(void *)(a1 + 32) = result;
  *(void *)a1 = v2 / *v5;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 1676) = atomic_fetch_add_explicit(uniquing_table_initialize_process_wide_generation, 1u, memory_order_relaxed)+ 1;
  atomic_store(0, (unsigned int *)(a1 + 1672));
  return result;
}

uint64_t uniquing_table_is_husk(uint64_t result)
{
  if (result)
  {
    unsigned int v1 = atomic_load((unsigned int *)(result + 1672));
    return v1 >> 31;
  }
  return result;
}

uint64_t uniquing_table_destroy_husk_exclusive(mach_vm_address_t a1)
{
  if (!a1 || (unsigned int v1 = atomic_load((unsigned int *)(a1 + 1672)), (v1 & 0x80000000) == 0)) {
    uniquing_table_destroy_husk_exclusive_cold_1();
  }

  return sld_deallocate_pages(a1, 0x690uLL);
}

void uniquing_table_deinitialize(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (!a2) {
      __malloc_lock_stack_logging();
    }
    unsigned int v10 = atomic_load((unsigned int *)(a1 + 1672));
    if ((v10 & 0x80000000) != 0)
    {
      msl_printf(3, (uint64_t)"redundant attempt to de-initialize the uniquing table.\n", a3, a4, a5, a6, a7, a8, v11);
      if (a2) {
        return;
      }
    }
    else
    {
      atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 1672));
      uniquing_table_release(a1 + 160 * v10 + 72, 1);
      if (a2) {
        return;
      }
    }
    __malloc_unlock_stack_logging();
  }
}

void uniquing_table_release(uint64_t a1, int a2)
{
  unsigned int add = atomic_fetch_add((atomic_uint *volatile)(a1 + 152), 0xFFFFFFFF);
  if (!add) {
    uniquing_table_release_cold_1();
  }
  if (add == 1)
  {
    if (!a2) {
      __malloc_lock_stack_logging();
    }
    if (atomic_load((unsigned int *)(a1 + 152))) {
      uniquing_table_release_cold_2();
    }
    sld_deallocate_pages(*(void *)a1, *(void *)(a1 + 24));
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    if (!a2)
    {
      __malloc_unlock_stack_logging();
    }
  }
}

uint64_t uniquing_table_stack_retain(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  if (!a1) {
    return 0;
  }
  int v14 = 0;
  hash_cache = msl_get_hash_cache(a3, &v14);
  int v9 = v14;
  thread_stack_pcs();
  uint64_t v10 = hash_cache[1026];
  if (*(_DWORD *)(v10 + 4096) <= (a2 + 2))
  {
    *a4 = -1;
LABEL_9:
    uint64_t v12 = 0;
    if (!v9) {
      return v12;
    }
    goto LABEL_5;
  }
  *(_DWORD *)(v10 + 4100) = a2 + 2;
  int v11 = uniquing_table_stack_retain_internal(a1, (uint64_t)hash_cache, v9 | a3);
  *a4 = v11;
  if (v11 == -1) {
    goto LABEL_9;
  }
  uint64_t v12 = 1;
  if (v9) {
LABEL_5:
  }
    __malloc_unlock_stack_logging();
  return v12;
}

void *msl_get_hash_cache(int a1, _DWORD *a2)
{
  if (!dword_26774EB74) {
    return 0;
  }
  uint64_t v4 = pthread_getspecific(qword_26774EB68);
  if (!v4)
  {
    if (pthread_self_is_exiting_np())
    {
      if (!a1)
      {
        __malloc_lock_stack_logging();
        *a2 = 1;
      }
      return &global_stack_uniquing_state;
    }
    else
    {
      mach_vm_address_t pages = (void *)sld_allocate_pages(0x2828uLL);
      if (!pages) {
        msl_get_hash_cache_cold_1();
      }
      uint64_t v4 = pages;
      bzero(pages, 0x2828uLL);
      v4[1026] = v4;
      v4[1027] = v4 + 513;
      pthread_setspecific(qword_26774EB68, v4);
    }
  }
  return v4;
}

uint64_t uniquing_table_stack_retain_internal(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2;
  unsigned int v143 = *(_DWORD *)(*(void *)(a2 + 8208) + 4100);
  uint64_t v5 = uniquing_table_retain(a1);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)(v3 + 8208);
  uint64_t v10 = *(unsigned int *)(v9 + 4096);
  char v148 = *(unsigned char *)(a1 + 60);
  if ((v148 & 4) == 0)
  {
    uint64_t v24 = 0xFFFFFFFFLL;
LABEL_19:
    uint64_t v150 = v3 + 8224;
    uint64_t v146 = v3;
    uint64_t v142 = a1;
    while (1)
    {
      uint64_t v27 = *(void *)(v3 + 8208);
      uint64_t v151 = *(unsigned int *)(v27 + 4096);
      uint64_t v154 = v27;
      unsigned int v28 = *(_DWORD *)(v27 + 4100);
      uint64_t v29 = *(void *)v8;
      if ((v148 & 4) == 0 && v24 != -1) {
        uniquing_table_stack_retain_internal_cold_1();
      }
      if (v24 != -1)
      {
        _X0 = 0;
        _X1 = 0;
        __asm { CASP            X0, X1, X0, X1, [X11] }
        uniquing_table_stack_retain_internal_cold_11();
      }
      if ((v148 & 4) != 0) {
        uint64_t v35 = *(unsigned int *)(v3 + 10272);
      }
      else {
        uint64_t v35 = 0xFFFFFFFFLL;
      }
      uint64_t v155 = v8;
      if (v28 >= v10)
      {
        uint64_t v39 = v10;
        LODWORD(v45) = -1;
        unsigned int v40 = v10;
      }
      else
      {
        unsigned int v36 = *(_DWORD *)(v8 + 12) - *(_DWORD *)(v8 + 8);
        unint64_t v153 = v36 - 1;
        unint64_t v37 = v24;
        unsigned int v38 = v10;
        uint64_t v39 = v10;
        unsigned int v149 = v36 / ((2 * *(_DWORD *)(v8 + 16)) | 1u);
        unsigned int v152 = *(_DWORD *)(v27 + 4100);
        while (1)
        {
          unsigned int v40 = v38 - 1;
          BOOL v41 = v38 - 1 <= v28;
          int v42 = *(_DWORD *)(v8 + 16);
          if (!v42) {
            break;
          }
          unsigned int v43 = 2 * v41;
          _X2 = *(void *)(v154 + 8 * v40);
          uint64_t v45 = *(_DWORD *)(v8 + 8) + (((16 * v37) ^ (_X2 >> 2)) % v153);
          if ((2 * v41) <= 1) {
            int v46 = 1;
          }
          else {
            int v46 = 2 * v41;
          }
          _ZF = v37 == -1 || v35 == v37;
          int v48 = _ZF;
LABEL_39:
          _X4 = 0;
          _X5 = 0;
          BOOL v51 = 0;
          --v42;
          __asm { CASP            X4, X5, X4, X5, [X8] }
          unint64_t v53 = 0;
          _X7 = 0;
          do
          {
            unint64_t v55 = v53;
            BOOL v56 = v53 == 0;
            if (v53)
            {
              if (v37 != -1 && v51)
              {
                v57 = (uint64_t *)(v29 + 16 * v37);
                uint64_t v58 = *v57;
                _X25 = v57[1];
                do
                {
                  _X22 = v58;
                  __asm { CASP            X24, X25, X22, X23, [X30] }
                  _ZF = _X24 == v58;
                  uint64_t v58 = _X24;
                }
                while (!_ZF);
                if (!HIDWORD(_X25)) {
                  uniquing_table_stack_retain_internal_cold_8();
                }
              }
              BOOL v63 = _X4 != _X2 || _X7 != v37;
              if (!v43 || v63)
              {
                if (!v63)
                {
                  uint64_t v70 = v35;
                  uint64_t v8 = v155;
                  uint64_t v39 = v39;
                  goto LABEL_74;
                }
                uint64_t v45 = v45 + v42 * v149 + 1;
                uint64_t v8 = v155;
                unsigned int v67 = *(_DWORD *)(v155 + 12);
                _CF = v45 >= v67;
                int v68 = v45 - v67;
                if (_CF) {
                  uint64_t v45 = (v68 + *(_DWORD *)(v155 + 8));
                }
                if (!v42)
                {
                  unsigned int v40 = v38;
                  LODWORD(v45) = v37;
                  unsigned int v28 = v152;
                  uint64_t v39 = v39;
                  goto LABEL_109;
                }
                goto LABEL_39;
              }
              BOOL v51 = v56;
              if ((v55 & 0x80000000) != 0)
              {
                int v46 = -3;
                int v69 = -3;
                goto LABEL_70;
              }
            }
            else if (((v48 | v51) & 1) == 0)
            {
              _X24 = 0;
              _X25 = 0;
              __asm { CASP            X24, X25, X24, X25, [X8] }
              if (v24 != -1)
              {
                _X2 = 0;
                _X3 = 0;
                __asm { CASP            X2, X3, X2, X3, [X8] }
                uniquing_table_stack_retain_internal_cold_11();
              }
              uint64_t v39 = v39;
              unsigned int v40 = v39;
              uint64_t v45 = 0xFFFFFFFFLL;
              uint64_t v8 = v155;
              goto LABEL_75;
            }
            _X3 = v37 | ((unint64_t)(v55 + v46) << 32);
            _X5 = _X7 | (v55 << 32);
            _X7 = _X5;
            __asm { CASP            X6, X7, X2, X3, [X8] }
            unint64_t v53 = HIDWORD(_X5);
            _ZF = _X6 == _X4;
            _X4 = _X6;
          }
          while (!_ZF);
          if (v55) {
            int v46 = -3;
          }
          int v69 = v46;
LABEL_70:
          uint64_t v8 = v155;
          if (v37 == v24)
          {
            uint64_t v39 = v38 - 1;
            uint64_t v24 = v45;
            uint64_t v70 = v45;
            if (v69 != -3)
            {
              uint64_t v39 = v38 - 1;
              uint64_t v24 = v45;
              uint64_t v70 = v45;
              if (v35 != v37)
              {
                uniquing_table_node_release_internal(v155, v35, _X2, _X3, _X4, _X5, _X6, _X7, (uint64_t)cur_protection);
                uint64_t v8 = v155;
                uint64_t v39 = v38 - 1;
                uint64_t v24 = v45;
                uint64_t v70 = v45;
              }
            }
LABEL_74:
            *(_DWORD *)(v150 + 4 * (v151 - v38)) = v45;
            uint64_t v35 = v70;
LABEL_75:
            unsigned int v28 = v152;
            goto LABEL_76;
          }
          _X3 = v37;
          if (v154 + 8 * (unint64_t)v38 < v154 + 8 * v151 && v37 != -1)
          {
            _X2 = 0;
            _X3 = 0;
            __asm { CASP            X2, X3, X2, X3, [X8] }
          }
          if (v69 != -3) {
            unsigned int v43 = v46;
          }
          if (v45 == -1) {
            goto LABEL_101;
          }
          v73 = (uint64_t *)(v29 + 16 * v45);
          uint64_t v74 = *v73;
          _X5 = v73[1];
          do
          {
            _X3 = v73[1];
            _X6 = v74;
            __asm { CASP            X4, X5, X6, X7, [X13] }
            _ZF = _X4 == v74;
            uint64_t v74 = _X4;
          }
          while (!_ZF);
          if (HIDWORD(_X5) < v43) {
            uniquing_table_stack_retain_internal_cold_8();
          }
          if (v69 == -3)
          {
LABEL_101:
            uint64_t v39 = v39;
            unsigned int v40 = v39;
            uint64_t v45 = v24;
            goto LABEL_75;
          }
          BOOL v78 = HIDWORD(_X5) != v43 || v35 == v37 || v37 == -1;
          unsigned int v28 = v152;
          if (v78)
          {
            uint64_t v39 = v39;
            unsigned int v40 = v39;
            uint64_t v45 = v24;
          }
          else
          {
            v79 = (uint64_t *)(v29 + 16 * v37);
            uint64_t v80 = *v79;
            _X5 = v79[1];
            do
            {
              _X3 = v79[1];
              _X6 = v80;
              __asm { CASP            X4, X5, X6, X7, [X10] }
              _ZF = _X4 == v80;
              uint64_t v80 = _X4;
            }
            while (!_ZF);
            uint64_t v39 = v39;
            unsigned int v40 = v39;
            uint64_t v45 = v24;
            if (!HIDWORD(_X5)) {
              uniquing_table_stack_retain_internal_cold_8();
            }
          }
LABEL_76:
          unint64_t v37 = v45;
          unsigned int v38 = v40;
          if (v40 <= v28) {
            goto LABEL_109;
          }
        }
        unsigned int v40 = v38;
        LODWORD(v45) = v37;
      }
LABEL_109:
      if ((v148 & 4) != 0)
      {
        *(_DWORD *)(v146 + 10272) = v35;
        if (v40 > v28)
        {
          uint64_t v10 = v39;
          uint64_t v3 = v146;
          goto LABEL_122;
        }
      }
      else
      {
        if (v35 != -1)
        {
          v86 = (uint64_t *)(v29 + 16 * v35);
          uint64_t v87 = *v86;
          _X3 = v86[1];
          do
          {
            _X4 = v87;
            __asm { CASP            X2, X3, X4, X5, [X8] }
            _ZF = _X2 == v87;
            uint64_t v87 = _X2;
          }
          while (!_ZF);
          if (!HIDWORD(_X3)) {
            uniquing_table_stack_retain_internal_cold_8();
          }
        }
        if (v40 > v28)
        {
          uint64_t v3 = v146;
          uint64_t v24 = 0xFFFFFFFFLL;
          if (*(_DWORD *)(*(void *)(v146 + 8208) + 4096) != v10) {
            uniquing_table_stack_retain_internal_cold_5();
          }
          goto LABEL_122;
        }
      }
      if (v45 != v24) {
        uniquing_table_stack_retain_internal_cold_7();
      }
      uint64_t v10 = v39;
      uint64_t v3 = v146;
      if (v40 != v39) {
        uniquing_table_stack_retain_internal_cold_6();
      }
LABEL_122:
      if (v10 <= v143)
      {
        uniquing_table_release(v8, a3);
        if (v24 == -1) {
          uniquing_table_stack_retain_internal_cold_4();
        }
        *(int8x16_t *)(v3 + 8208) = vextq_s8(*(int8x16_t *)(v3 + 8208), *(int8x16_t *)(v3 + 8208), 8uLL);
        return v24;
      }
      if (!a3)
      {
        __malloc_lock_stack_logging();
        uint64_t v8 = v155;
      }
      uint64_t v91 = v142;
      signed int v92 = atomic_load((unsigned int *)(v142 + 1672));
      uint64_t v93 = v91 + 160 * v92 + 72;
      uint64_t v94 = v8;
      uniquing_table_release(v8, 1);
      if (v94 == v93)
      {
        uint64_t v101 = atomic_load((unsigned int *)(v142 + 1672));
        if ((int)v101 >= 10) {
          uniquing_table_stack_retain_internal_cold_2();
        }
        if ((v101 & 0x80000000) != 0) {
          uniquing_table_stack_retain_internal_cold_3();
        }
        if (v101 < 9)
        {
          uint64_t v144 = v10;
          unsigned int v145 = v24;
          uint64_t v102 = v142 + 160 * v101;
          mach_vm_address_t v105 = *(void *)(v102 + 72);
          uint64_t v103 = v102 + 72;
          mach_vm_address_t v104 = v105;
          mach_vm_size_t v106 = *(void *)(v103 + 24);
          int v108 = *(_DWORD *)(v103 + 12);
          int v107 = *(_DWORD *)(v103 + 16);
          uint64_t v109 = v101 + 1;
          uint64_t v110 = v142 + 160 * (v101 + 1);
          mach_vm_size_t v111 = *(void *)(v110 + 96);
          uint64_t pages = sld_allocate_pages(v111);
          uint64_t __pattern4 = pages;
          if (pages)
          {
            mach_vm_address_t v119 = pages;
            *(void *)max_protection = 0;
            if (mach_vm_remap(*MEMORY[0x263EF8C60], (mach_vm_address_t *)&__pattern4, v106, 0, 0x4000, *MEMORY[0x263EF8C60], v104, 0, &max_protection[1], max_protection, 1u))
            {
              msl_printf(3, (uint64_t)"uniquing_table_expand(): mach_vm_remap failed\n", v120, v121, v122, v123, v124, v125, (uint64_t)cur_protection);
              sld_deallocate_pages(v119, v111);
              goto LABEL_135;
            }
            uint64_t v126 = (v111 >> 4) & 0xFFFFFFFFFFFFFFELL;
            *(void *)(v110 + 72) = v119;
            uint64_t v127 = v142;
            v128 = (_DWORD *)(v142 + 160 * v109);
            v128[20] = v108;
            v128[21] = v126;
            v128[22] = v107 + 3;
            atomic_fetch_add(v128 + 56, 1u);
            *(void *)(v142 + 32) = v119;
            *(void *)(v142 + 16) = v111;
            *(void *)uint64_t v142 = v111 / *MEMORY[0x263EF8C78];
            *(void *)(v142 + 8) = v126;
            atomic_store(v109, (unsigned int *)(v142 + 1672));
            uniquing_table_release(v103, 1);
            uint64_t v8 = uniquing_table_retain(v127);
          }
          else
          {
            msl_printf(3, (uint64_t)"failed to expand uniquing table\n", v113, v114, v115, v116, v117, v118, (uint64_t)cur_protection);
LABEL_135:
            uint64_t v8 = 0;
          }
          uint64_t v3 = v146;
          uint64_t v24 = v145;
          uint64_t v10 = v144;
          goto LABEL_138;
        }
        msl_printf(3, (uint64_t)"no more space in uniquing table\n", v95, v96, v97, v98, v99, v100, (uint64_t)cur_protection);
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v8 = uniquing_table_retain(v142);
      }
LABEL_138:
      if (!a3)
      {
        uint64_t v129 = v8;
        __malloc_unlock_stack_logging();
        uint64_t v8 = v129;
      }
      if (!v8) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  int v11 = *(_DWORD *)(a1 + 1676);
  if (*(_DWORD *)(v3 + 10276) == v11)
  {
    if (*(_DWORD *)(v3 + 10272) == -1) {
      goto LABEL_17;
    }
    uint64_t v12 = *(void *)(v3 + 8216);
    uint64_t v13 = *(unsigned int *)(v12 + 4096);
    int v14 = v13 - *(_DWORD *)(v12 + 4100);
    if (v14 >= (int)v10 - *(_DWORD *)(v9 + 4100)) {
      int v14 = v10 - *(_DWORD *)(v9 + 4100);
    }
    if (v14 < 1) {
      goto LABEL_17;
    }
    uint64_t v15 = (v14 + 1);
    int v16 = ~v14;
    unint64_t v17 = (uint64_t *)(v9 + 8 * v10 - 8);
    BOOL v18 = (uint64_t *)(v12 + 8 * v13 - 8);
    uint64_t v19 = 1;
    while (1)
    {
      uint64_t v21 = *v18--;
      uint64_t v20 = v21;
      uint64_t v22 = *v17--;
      if (v20 != v22) {
        break;
      }
      if (v15 == ++v19) {
        goto LABEL_14;
      }
    }
    int v16 = -(int)v19;
    LODWORD(v15) = v19;
LABEL_14:
    uint64_t v10 = (v10 + v16 + 1);
    _CF = v15 >= 2;
    unsigned int v26 = v15 - 2;
    if (_CF) {
      uint64_t v24 = *(unsigned int *)(v3 + 4 * v26 + 8224);
    }
    else {
LABEL_17:
    }
      uint64_t v24 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v23 = v5;
    bzero(*(void **)(v3 + 8216), 0x1008uLL);
    uint64_t v24 = 0xFFFFFFFFLL;
    LODWORD(__pattern4) = -1;
    memset_pattern4((void *)(v3 + 8224), &__pattern4, 0x800uLL);
    uint64_t v8 = v23;
    *(_DWORD *)(v3 + 10272) = -1;
    *(_DWORD *)(v3 + 10276) = v11;
    uint64_t v10 = *(unsigned int *)(*(void *)(v3 + 8208) + 4096);
  }
  if (v10 > v143) {
    goto LABEL_19;
  }
  if (*(_DWORD *)(v8 + 12) <= v24) {
    uniquing_table_stack_retain_internal_cold_15();
  }
  v130 = (uint64_t *)(*(void *)v8 + 16 * v24);
  uint64_t v131 = *v130;
  _X3 = v130[1];
  do
  {
    _X4 = v131;
    __asm { CASP            X2, X3, X4, X5, [X11] }
    _ZF = _X2 == v131;
    uint64_t v131 = _X2;
  }
  while (!_ZF);
  if (!HIDWORD(_X3)) {
    uniquing_table_stack_retain_internal_cold_14();
  }
  if ((_X3 & 0x8000000000000000) != 0)
  {
    v136 = (uint64_t *)(*(void *)v8 + 16 * v24);
    uint64_t v137 = *v136;
    do
    {
      _X2 = v137;
      _X5 = v136[1];
      __asm { CASP            X4, X5, X2, X3, [X8] }
      _ZF = _X4 == v137;
      uint64_t v137 = _X4;
    }
    while (!_ZF);
  }
  uniquing_table_release(v8, a3);
  return v24;
}

void uniquing_table_stack_release(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    if (a2 == -1)
    {
      msl_printf(3, (uint64_t)"attempting to release an invalid index\n", a3, a4, a5, a6, a7, a8, a9);
    }
    else
    {
      int v10 = a3;
      uint64_t v11 = uniquing_table_retain(a1);
      if (v11)
      {
        uint64_t v18 = v11;
        uniquing_table_node_release_internal(v11, a2, v12, v13, v14, v15, v16, v17, v19);
        uniquing_table_release(v18, v10);
      }
    }
  }
}

uint64_t uniquing_table_retain(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 1672);
  while ((v1 & 0x80000000) == 0)
  {
    uint64_t v2 = a1 + 160 * v1;
    uint64_t v3 = *(unsigned int *)(v2 + 224);
    if (v3)
    {
      uint64_t v4 = (atomic_uint *)(v2 + 224);
      do
      {
        uint64_t v5 = v3;
        atomic_compare_exchange_strong(v4, (unsigned int *)&v5, v3 + 1);
        BOOL v6 = v5 == v3;
        uint64_t v3 = v5;
      }
      while (!v6 && v5);
      if (v5) {
        return a1 + 160 * v1 + 72;
      }
    }
    BOOL v6 = *(unsigned int *)(a1 + 1672) == v1;
    uint64_t v1 = *(unsigned int *)(a1 + 1672);
    if (v6) {
      uniquing_table_retain_cold_1();
    }
  }
  return 0;
}

uint64_t uniquing_table_node_release_internal(uint64_t result, unsigned int a2, uint64_t _X2, uint64_t _X3, uint64_t a5, uint64_t a6, uint64_t _X6, uint64_t a8, uint64_t a9)
{
  if (a2 != -1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0xFFFFFFFFLL;
    unint64_t v11 = a2;
    while (1)
    {
      if (v11 == v10)
      {
        uint64_t v17 = "circular parent reference in uniquing_table_node_release_internal: parent == prev_parent\n";
        goto LABEL_17;
      }
      if (v9 == 512) {
        return msl_printf(3, (uint64_t)"circular parent reference in uniquing_table_node_release_internal: num_tries == %zu\n", _X2, _X3, a5, a6, _X6, a8, 512);
      }
      uint64_t v10 = v11;
      if (v11 >= *(unsigned int *)(result + 12)) {
        break;
      }
      uint64_t v12 = (uint64_t *)(*(void *)result + 16 * v11);
      a5 = *v12;
      _X3 = v12[1];
      do
      {
        a6 = v12[1];
        a8 = _X3 - 0x100000000;
        _X6 = a5;
        __asm { CASP            X2, X3, X6, X7, [X12] }
        _ZF = _X2 == a5;
        a5 = _X2;
      }
      while (!_ZF);
      if (HIDWORD(_X3) != 1)
      {
        if (!HIDWORD(_X3)) {
          uniquing_table_node_release_internal_cold_1();
        }
        return result;
      }
      unint64_t v11 = v12[1];
      ++v9;
      if (_X3 == -1) {
        return result;
      }
    }
    uint64_t v17 = "attempting to release an index out of bounds\n";
LABEL_17:
    return msl_printf(3, (uint64_t)v17, _X2, _X3, a5, a6, _X6, a8, a9);
  }
  return result;
}

uint64_t uniquing_table_node_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t msl_get_lite_wrapped_zone()
{
  if (active_lite_zone) {
    return *(void *)(active_lite_zone + 200);
  }
  else {
    return 0;
  }
}

uint64_t msl_is_stack_logging_lite_enabled()
{
  return stack_logging_lite_enabled;
}

void enable_stack_logging_lite()
{
  stack_logging_lite_enabled = 1;
}

void disable_stack_logging_lite()
{
  stack_logging_lite_enabled = 0;
}

uint64_t create_and_insert_lite_zone(unsigned char *a1)
{
  *a1 = 0;
  if (active_lite_zone) {
    create_and_insert_lite_zone_cold_1();
  }
  mach_vm_size_t v2 = (*MEMORY[0x263EF8C78] + 207) & -*MEMORY[0x263EF8C78];
  uint64_t result = sld_allocate_pages(v2);
  if (result)
  {
    uint64_t v4 = (malloc_zone_t *)result;
    *(void *)uint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = stack_logging_lite_size;
    *(void *)(result + 24) = stack_logging_lite_malloc;
    *(void *)(result + 32) = stack_logging_lite_calloc;
    *(void *)(result + 40) = stack_logging_lite_valloc;
    *(void *)(result + 48) = stack_logging_lite_free;
    *(void *)(result + 56) = stack_logging_lite_realloc;
    *(void *)(result + 64) = stack_logging_lite_destroy;
    *(void *)(result + 72) = "MallocStackLoggingLiteZone_Wrapper";
    *(void *)(result + 80) = stack_logging_lite_batch_malloc;
    *(void *)(result + 88) = stack_logging_lite_batch_free;
    *(void *)(result + 96) = stack_logging_lite_zone_introspect;
    *(_DWORD *)(result + 104) = 15;
    *(void *)(result + 112) = stack_logging_lite_memalign;
    *(void *)(result + 120) = stack_logging_lite_free_definite_size;
    *(void *)(result + 128) = stack_logging_lite_pressure_relief;
    *(void *)(result + 136) = stack_logging_lite_claimed_address;
    *(void *)(result + 144) = 0;
    *(void *)(result + 152) = stack_logging_lite_malloc_with_options;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    zone = malloc_create_zone(0, 0x400u);
    malloc_zone_unregister(zone);
    v4[1].free = (void (__cdecl *)(_malloc_zone_t *, void *))zone;
    active_lite_zone = (uint64_t)v4;
    uint64_t v6 = off_26774EC10();
    lite_helper_zone = v6;
    if (zone->version < 0xF || !zone[1].reserved1 || *(_DWORD *)(v6 + 104) < 0xFu || !*(void *)(v6 + 152)) {
      v4[1].reserved1 = 0;
    }
    mprotect(v4, v2, 1);
    malloc_zone_register(v4);
    malloc_zone_register(zone);
    malloc_set_zone_name(v4, "MallocStackLoggingLiteZone_Wrapper");
    malloc_set_zone_name(zone, "MallocStackLoggingLiteZone");
    uint64_t result = off_26774EC08(v4);
    *a1 = 1;
  }
  return result;
}

uint64_t stack_logging_lite_size(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16))();
  if (v3) {
    return v3 - msl_payload_get_size_info((void *)(v3 + a2 - 8), (unsigned int *)(v3 + a2 - 16), 0, 0) - 8;
  }
  uint64_t v5 = *(uint64_t (**)(void))(lite_helper_zone + 16);

  return v5();
}

uint64_t stack_logging_lite_malloc(uint64_t a1, unint64_t a2)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v3 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    mach_vm_address_t v7 = *(uint64_t (**)(void))(lite_helper_zone + 24);
    return v7();
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v4 = 0;
    if (required_allocation_size(v3, a2, (unint64_t *)&v9, &v8))
    {
      unint64_t v5 = v8;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 24))(v3, v8);
      if (v4) {
        add_stack_to_ptr(v3, v4, a2, v9, v5);
      }
    }
    return v4;
  }
}

uint64_t stack_logging_lite_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v5 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    mach_vm_address_t v7 = *(uint64_t (**)(void))(lite_helper_zone + 32);
    return v7();
  }
  else
  {
    if (is_mul_ok(a2, a3))
    {
      unint64_t v9 = a2 * a3;
      unint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v6 = 0;
      if (required_allocation_size(v5, v9, (unint64_t *)&v12, &v11))
      {
        unint64_t v10 = v11;
        uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 32))(v5, 1, v11);
        if (v6) {
          add_stack_to_ptr(v5, v6, v9, v12, v10);
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
      *__error() = 12;
    }
    return v6;
  }
}

uint64_t stack_logging_lite_valloc(uint64_t a1, unint64_t a2)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v3 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    mach_vm_address_t v7 = *(uint64_t (**)(void))(lite_helper_zone + 40);
    return v7();
  }
  else
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v4 = 0;
    if (required_allocation_size(v3, a2, (unint64_t *)&v9, &v8))
    {
      unint64_t v5 = v8;
      uint64_t v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 40))(v3, v8);
      if (v4) {
        add_stack_to_ptr(v3, v4, a2, v9, v5);
      }
    }
    return v4;
  }
}

uint64_t stack_logging_lite_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 200);
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  if (v4)
  {
    unint64_t v5 = msl_payload_from_lite_zone_ptr_internal(a2, v4);
    unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v5);
    if (uniquing_table_index != -1)
    {
      uint64_t v7 = global_uniquing_table();
      if (v7) {
        uniquing_table_stack_release(v7, uniquing_table_index, 0, v8, v9, v10, v11, v12, v16);
      }
    }
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 48);
    uint64_t v14 = v3;
  }
  else
  {
    uint64_t v14 = lite_helper_zone;
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48);
  }

  return v13(v14, a2);
}

uint64_t stack_logging_lite_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
  unint64_t v8 = v7;
  if (stack_logging_lite_enabled)
  {
    char thread_options = malloc_get_thread_options();
    BOOL v10 = v8 != 0;
    BOOL v11 = (thread_options & 4) == 0;
    if (v8) {
      BOOL v12 = (thread_options & 4) == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      unint64_t v32 = 0;
      unint64_t v33 = 0;
      uint64_t v13 = 0;
      if (required_allocation_size(v6, a3, &v33, &v32))
      {
        uint64_t v30 = 0;
        unint64_t v31 = 0;
        msl_payload_get_size_info(&a2[v8 - 8], (unsigned int *)&a2[v8 - 16], &v31, &v30);
        unint64_t v14 = *(void *)&a2[v8 - 8];
        unint64_t v15 = v32;
        uint64_t v13 = (char *)(*(uint64_t (**)(uint64_t, char *, unint64_t))(v6 + 56))(v6, a2, v32);
        if (v13)
        {
          unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v14);
          if (uniquing_table_index != -1)
          {
            uint64_t v17 = global_uniquing_table();
            if (v17) {
              uniquing_table_stack_release(v17, uniquing_table_index, 0, v18, v19, v20, v21, v22, v30);
            }
          }
          if (v13 == a2)
          {
            uint64_t v29 = (*(uint64_t (**)(uint64_t, char *))(v6 + 16))(v6, a2);
            uint64_t v23 = v33;
            if (v29 == v8)
            {
              if (v33 <= v8 - v30) {
                uint64_t v23 = v8 - v30;
              }
              unint64_t v15 = v8;
            }
          }
          else
          {
            uint64_t v23 = v33;
          }
          add_stack_to_ptr(v6, (uint64_t)v13, a3, v23, v15);
        }
      }
      return (uint64_t)v13;
    }
  }
  else
  {
    BOOL v11 = 0;
    BOOL v10 = v7 != 0;
  }
  if (v10 || v11)
  {
    uint64_t v13 = (char *)stack_logging_lite_malloc(a1, a3);
    if (v13)
    {
      size_t v26 = malloc_size(a2);
      size_t v27 = malloc_size(v13);
      if (v26 >= v27) {
        size_t v28 = v27;
      }
      else {
        size_t v28 = v26;
      }
      memcpy(v13, a2, v28);
    }
    stack_logging_lite_free(a1, (uint64_t)a2);
    return (uint64_t)v13;
  }
  uint64_t v24 = *(uint64_t (**)(void))(lite_helper_zone + 56);

  return v24();
}

uint64_t stack_logging_lite_destroy(mach_vm_address_t a1)
{
  if (!active_lite_zone) {
    stack_logging_lite_destroy_cold_1();
  }
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  uint64_t result = mach_vm_deallocate(*MEMORY[0x263EF8C60], a1, (*MEMORY[0x263EF8C78] + 207) & -*MEMORY[0x263EF8C78]);
  if (result) {
    stack_logging_lite_destroy_cold_2();
  }
  active_lite_zone = 0;
  return result;
}

uint64_t stack_logging_lite_batch_malloc(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v7 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    unint64_t v14 = *(uint64_t (**)(void))(lite_helper_zone + 80);
    return v14();
  }
  else
  {
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    if (!required_allocation_size(v7, a2, (unint64_t *)&v17, &v16)) {
      return 0;
    }
    unint64_t v8 = v16;
    uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(v7 + 80))(v7, v16, a3, a4);
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = v17;
      uint64_t v12 = v9;
      do
      {
        uint64_t v13 = *a3++;
        add_stack_to_ptr(v7, v13, a2, v11, v8);
        --v12;
      }
      while (v12);
    }
    return v10;
  }
}

uint64_t stack_logging_lite_batch_free(uint64_t result, uint64_t *a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(result + 200);
    uint64_t v5 = a3;
    do
    {
      uint64_t v6 = *a2;
      if (*a2)
      {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, *a2);
        if (v7)
        {
          unint64_t v8 = msl_payload_from_lite_zone_ptr_internal(v6, v7);
          unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(v8);
          if (uniquing_table_index != -1)
          {
            uint64_t v10 = global_uniquing_table();
            if (v10) {
              uniquing_table_stack_release(v10, uniquing_table_index, 0, v11, v12, v13, v14, v15, v16);
            }
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v4, v6);
        }
        else
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48))(lite_helper_zone, v6);
        }
      }
      ++a2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t stack_logging_lite_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v5 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    uint64_t v9 = *(uint64_t (**)(void))(lite_helper_zone + 112);
    return v9();
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v6 = 0;
    if (required_allocation_size(v5, a3, (unint64_t *)&v11, &v10))
    {
      unint64_t v7 = v10;
      uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 112))(v5, a2, v10);
      if (v6) {
        add_stack_to_ptr(v5, v6, a3, v11, v7);
      }
    }
    return v6;
  }
}

uint64_t stack_logging_lite_pressure_relief()
{
  return 0;
}

uint64_t stack_logging_lite_claimed_address(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 136))();
}

uint64_t stack_logging_lite_malloc_with_options(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (stack_logging_lite_enabled != 1 || (uint64_t v7 = *(void *)(a1 + 200), (malloc_get_thread_options() & 4) != 0))
  {
    uint64_t v11 = *(uint64_t (**)(void))(lite_helper_zone + 152);
    return v11();
  }
  else
  {
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v8 = 0;
    if (required_allocation_size(v7, a3, (unint64_t *)&v13, &v12))
    {
      unint64_t v9 = v12;
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(v7 + 152))(v7, a2, v12, a4);
      if (v8) {
        add_stack_to_ptr(v7, v8, a3, v13, v9);
      }
    }
    return v8;
  }
}

uint64_t msl_lite_block_size()
{
  if (active_lite_zone) {
    return (*(uint64_t (**)(void))(*(void *)(active_lite_zone + 200) + 16))();
  }
  else {
    return 0;
  }
}

uint64_t required_allocation_size(uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t result = 0;
  if (a2 <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = a2;
  }
  if (v6 < 0xFFFFFFFFFFFFFFF8 && v6 + 8 < 0xFFFFFFFFFFFFFFF8)
  {
    if (*(void *)(a1 + 96)) {
      uint64_t v9 = *(void *)(a1 + 96);
    }
    else {
      uint64_t v9 = 0;
    }
    unint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(v9 + 8))(a1, v6);
    if (v10 < v6) {
      return 0;
    }
    unint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 96) ? *(void *)(a1 + 96) : 0;
    unint64_t v13 = (*(uint64_t (**)(uint64_t, unint64_t))(v12 + 8))(a1, v6 + 8);
    if (v13 < v11) {
      return 0;
    }
    unint64_t v14 = v13;
    if (v13 > v11
      && (!*(void *)(a1 + 96) ? (uint64_t v15 = 0) : (uint64_t v15 = *(void *)(a1 + 96)),
          unint64_t v13 = (*(uint64_t (**)(uint64_t, unint64_t))(v15 + 8))(a1, v6 + 16),
          v13 < v14))
    {
      return 0;
    }
    else
    {
      *a3 = v11;
      *a4 = v13;
      return 1;
    }
  }
  return result;
}

void add_stack_to_ptr(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t invalid = msl_payload_get_invalid();
  if (!__malloc_stack_logging_is_reentered())
  {
    unint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a2);
    if (v11 > a5)
    {
      a5 = v11;
      a4 = v11;
    }
    if (stack_logging_lite_enabled == 1)
    {
      __prepare_to_log_stacks_unlocked(1);
      uint64_t v12 = global_uniquing_table();
      if (v12)
      {
        uint64_t v13 = v12;
        if (a3 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = a3;
        }
        char v15 = v14 + 8 < a5;
        unsigned int v18 = 0;
        int v16 = uniquing_table_stack_retain(v12, 2, 0, &v18);
        BOOL v17 = uniquing_table_node_count(v13) <= 0x400000;
        uint64_t invalid = msl_payload_create(v18, v17, v15);
        if (!v16)
        {
          malloc_printf("MallocStackLogging: stack id is invalid. Turning off stack logging\n");
          msl_turn_off_stack_logging();
        }
      }
    }
  }
  msl_payload_set_in_lite_zone_ptr(a2, a3, a4, a5, invalid);
}

uint64_t stack_logging_lite_introspect_enumerator()
{
  return 0;
}

uint64_t stack_logging_lite_introspect_good_size(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 200) + 96)) {
    uint64_t v1 = *(void *)(*(void *)(a1 + 200) + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t stack_logging_lite_introspect_check()
{
  return 1;
}

void stack_logging_lite_introspect_log()
{
}

double stack_logging_lite_introspect_statistics(uint64_t a1, _OWORD *a2)
{
  double result = 0.0;
  *a2 = 0u;
  a2[1] = 0u;
  return result;
}

uint64_t stack_logging_lite_introspect_zone_locked()
{
  return 0;
}

void stack_logging_lite_introspect_print_task()
{
}

double stack_logging_lite_introspect_task_statistics(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  double result = 0.0;
  *a4 = 0u;
  a4[1] = 0u;
  return result;
}

uint64_t msl_printf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return msl_printf_allowStdErr(a1, 1, a2, (uint64_t)&a9);
}

uint64_t msl_printf_allowStdErr(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = _simple_salloc();
  if (result)
  {
    uint64_t v8 = result;
    getprogname();
    getpid();
    _simple_sprintf();
    _simple_vsprintf();
    if (a2 && (debug_mode & 1) == 0) {
      _simple_put();
    }
    if (!*MEMORY[0x263EF8C90])
    {
      _simple_string();
      _simple_asl_log();
    }
    return MEMORY[0x270EDDC38](v8);
  }
  else if (a2 && (debug_mode & 1) == 0)
  {
    getprogname();
    getpid();
    _simple_dprintf();
    return MEMORY[0x270EDDC50](2, a3, a4);
  }
  return result;
}

uint64_t msl_printf_nostderr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return msl_printf_allowStdErr(a1, 0, a2, (uint64_t)&a9);
}

BOOL msl_should_reap_old_logs()
{
  return (msl_should_reap & 1) == 0;
}

BOOL msl_get_writable_log_dir(BOOL result, unint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8C08];
  if (result)
  {
    uint64_t v3 = (unsigned char *)result;
    bzero(v22, 0x400uLL);
    if (msl_log_dir)
    {
      if (realpath_DARWIN_EXTSN(&msl_log_dir, v22))
      {
        if (access(v22, 2) == -1)
        {
          msl_printf(3, (uint64_t)"MallocStackLoggingDirectory env var set to unwritable path '%s'\n", v10, v11, v12, v13, v14, v15, (uint64_t)v22);
        }
        else
        {
          if (!sandbox_query_approval_policy_for_path()) {
            return _platform_strlcpy() < a2;
          }
          msl_printf(3, (uint64_t)"MallocStackLoggingDirectory env var set to a sandbox-protected path '%s' (required: '%s')\n", v16, v17, v18, v19, v20, v21, (uint64_t)v22);
        }
      }
      else
      {
        msl_printf(3, (uint64_t)"MallocStackLoggingDirectory env var set to unresolvable path '%s'\n", v4, v5, v6, v7, v8, v9, (uint64_t)&msl_log_dir);
      }
    }
    if (realpath_DARWIN_EXTSN("/tmp/", v22) && access(v22, 2) != -1
      || tmp_dir && realpath_DARWIN_EXTSN(&tmp_dir, v22) && access(v22, 2) != -1)
    {
      return _platform_strlcpy() < a2;
    }
    uint64_t result = 0;
    *uint64_t v3 = 0;
  }
  return result;
}

char *msl_get_tmp_dir()
{
  return &tmp_dir;
}

char *msl_get_log_dir()
{
  return &msl_log_dir;
}

uint64_t msl_set_flags_from_environment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  msl_cache_environment(a1);
  stack_logging_enable_logging = 0;
  stack_logging_dontcompact = 0;
  if (!_simple_getenv())
  {
    uint64_t result = _simple_getenv();
    if (!result) {
      return result;
    }
    stack_logging_dontcompact = 1;
  }
  uint64_t result = _platform_strncmp();
  if (result)
  {
    uint64_t result = _platform_strncmp();
    if (result)
    {
      uint64_t result = _platform_strcmp();
      if (result)
      {
        uint64_t result = _platform_strcmp();
        if (result)
        {
          uint64_t result = _platform_strcmp();
          if (result)
          {
            uint64_t result = _platform_strcmp();
            BOOL v16 = result == 0;
            int v17 = result ? 1 : 5;
          }
          else
          {
            BOOL v16 = 1;
            int v17 = 3;
          }
        }
        else
        {
          BOOL v16 = 0;
          int v17 = 2;
        }
      }
      else
      {
        BOOL v16 = 1;
        int v17 = 4;
      }
      stack_logging_mode = v17;
      if (stack_logging_dontcompact)
      {
        if (!v16)
        {
          return msl_printf(5, (uint64_t)"stack logging compaction turned off; size of log files on disk can increase rapidly\n",
                   v10,
                   v11,
                   v12,
                   v13,
                   v14,
                   v15,
                   a9);
        }
      }
    }
  }
  return result;
}

uint64_t msl_cache_environment(uint64_t a1)
{
  if (a1) {
    uint64_t v2 = _simple_getenv();
  }
  else {
    uint64_t v2 = (uint64_t)getenv("MallocStackLoggingDirectory");
  }
  if (v2 && (unint64_t)_platform_strlcpy() >= 0x400) {
    msl_log_dir = 0;
  }
  if (a1) {
    uint64_t v3 = _simple_getenv();
  }
  else {
    uint64_t v3 = (uint64_t)getenv("TMPDIR");
  }
  if (v3 && (unint64_t)_platform_strlcpy() >= 0x400) {
    tmp_dir = 0;
  }
  if (a1) {
    uint64_t v4 = (const char *)_simple_getenv();
  }
  else {
    uint64_t v4 = getenv("MallocStackLoggingNoReaping");
  }
  if (v4 && strcasecmp(v4, "no") && _platform_strcmp()) {
    msl_should_reap = 1;
  }
  debug_mode = 1;
  if (a1) {
    uint64_t v5 = _simple_getenv();
  }
  else {
    uint64_t v5 = (uint64_t)getenv("MallocDebugReport");
  }
  if (v5)
  {
    if (_platform_strcmp())
    {
      if (!_platform_strcmp()) {
        goto LABEL_30;
      }
      BOOL v6 = _platform_strcmp() == 0;
      goto LABEL_29;
    }
  }
  else if (!isatty(2))
  {
    goto LABEL_30;
  }
  BOOL v6 = 0;
LABEL_29:
  debug_mode = v6;
LABEL_30:

  return initialize_no_footprint_for_debug_flag();
}

uint64_t msl_initialize()
{
  stack_logging_finished_init = 1;
  stack_logging_postponed = 0;
  uint64_t result = stack_logging_mode;
  if (stack_logging_mode)
  {
    if ((stack_logging_mode & 0xFFFFFFFE) == 4)
    {
      uint64_t result = create_lite_zone_if_has_default_zone0();
      if (!result) {
        return result;
      }
      uint64_t result = stack_logging_mode;
    }
    return enable_stack_logging_for_mode_and_prepare_to_log_stacks(result);
  }
  return result;
}

uint64_t create_lite_zone_if_has_default_zone0()
{
  if (malloc_msl_lite_hooks())
  {
    if (lite_zone_created_predicate != -1) {
      _os_once();
    }
    return 1;
  }
  else
  {
    msl_printf(3, (uint64_t)"zone[0] is not the normal default zone so can't turn on lite mode.\n", v0, v1, v2, v3, v4, v5, v7);
    return 0;
  }
}

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks(uint64_t a1)
{
  uint64_t v2 = global_uniquing_table();
  if (uniquing_table_is_husk(v2)) {
    return 0;
  }
  switch((int)a1)
  {
    case 1:
      uint64_t v10 = "recording malloc and VM allocation stacks to disk using standard recorder";
      int v11 = 1;
      int v12 = 1;
      goto LABEL_11;
    case 2:
      uint64_t v10 = "recording malloc (but not VM allocation) stacks to disk using standard recorder";
      int v11 = 2;
      int v12 = 1;
      int v13 = 0;
      goto LABEL_12;
    case 3:
      uint64_t v10 = "recording VM allocation (but not malloc) stacks to disk using standard recorder";
      int v11 = 3;
      goto LABEL_10;
    case 4:
      uint64_t v10 = "recording malloc (and VM allocation) stacks using lite mode";
      int v11 = 4;
      goto LABEL_10;
    case 5:
      uint64_t v10 = "recording VM allocation (but not malloc) stacks using lite mode";
      int v11 = 5;
LABEL_10:
      int v12 = 0;
LABEL_11:
      int v13 = 1;
LABEL_12:
      BOOL result = enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(v11, v12, v13, (uint64_t)v10);
      break;
    default:
      msl_printf(3, (uint64_t)"invalid mode %d cannot be enabled\n", v3, v4, v5, v6, v7, v8, a1);
      return 0;
  }
  return result;
}

void *msl_copy_msl_lite_hooks(void *__src, unint64_t a2)
{
  if (a2 >= 0x18) {
    size_t v2 = 24;
  }
  else {
    size_t v2 = a2;
  }
  return memcpy(&malloc_msl_lite_hooks, __src, v2);
}

BOOL msl_turn_on_stack_logging(uint64_t a1)
{
  malloc_register_stack_logger();
  if (stack_logging_enable_logging)
  {
    msl_printf(5, (uint64_t)"malloc stack logging already enabled.\n", v2, v3, v4, v5, v6, v7, v16);
    return 0;
  }
  if ((a1 & 0xFFFFFFFE) == 4 && !create_lite_zone_if_has_default_zone0()) {
    return 0;
  }
  __malloc_lock_stack_logging();
  if (stack_logging_enable_logging)
  {
    msl_printf(5, (uint64_t)"malloc stack logging already enabled.\n", v9, v10, v11, v12, v13, v14, v16);
    BOOL v8 = 0;
  }
  else
  {
    msl_cache_environment(0);
    BOOL v8 = enable_stack_logging_for_mode_and_prepare_to_log_stacks(a1);
  }
  __malloc_unlock_stack_logging();
  return v8;
}

void msl_turn_off_stack_logging()
{
  __malloc_lock_stack_logging();
  if (stack_logging_enable_logging)
  {
    switch(stack_logging_mode)
    {
      case 1:
        uint64_t v6 = "turning off stack logging (had been recording malloc and VM allocation stacks to disk using standard recorder)\n";
        goto LABEL_10;
      case 2:
        uint64_t v6 = "turning off stack logging (had been recording malloc stacks to disk using standard recorder)\n";
        goto LABEL_10;
      case 3:
        uint64_t v6 = "turning off stack logging (had been recording VM allocation stacks to disk using standard recorder)\n";
        goto LABEL_10;
      case 4:
        uint64_t v6 = "turning off stack logging (had been recording malloc and VM allocation stacks using lite mode)\n";
        goto LABEL_10;
      case 5:
        uint64_t v6 = "turning off stack logging (had been recording VM allocation stacks using lite mode)\n";
LABEL_10:
        msl_printf(5, (uint64_t)v6, v0, v1, v2, v3, v4, v5, v7);
        break;
      default:
        msl_printf(3, (uint64_t)"invalid stack_logging_mode %d in turn_off_stack_logging\n", v0, v1, v2, v3, v4, v5, stack_logging_mode);
        break;
    }
    *MEMORY[0x263EF8CA0] = 0;
    *MEMORY[0x263EF8C40] = 0;
    stack_logging_enable_logging = 0;
    disable_stack_logging_lite();
  }
  else
  {
    msl_printf(3, (uint64_t)"can't turn off malloc stack logging because it was not enabled.\n", v0, v1, v2, v3, v4, v5, v7);
  }

  __malloc_unlock_stack_logging();
}

uint64_t msl_set_mode_for_pid(unsigned int a1, unsigned int a2)
{
  if (a1 > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_2104CDF10[a1];
  }
  uint64_t v20 = v2 | a2;
  uint64_t v9 = sysctlbyname("kern.memorystatus_vm_pressure_send", 0, 0, &v20, 8uLL);
  if (v9)
  {
    uint64_t v10 = __error();
    uint64_t v19 = strerror(*v10);
    msl_printf(3, (uint64_t)"send_msl_command - sysctl: kern.memorystatus_vm_pressure_send failed %s", v11, v12, v13, v14, v15, v16, (uint64_t)v19);
  }
  else
  {
    msl_printf(5, (uint64_t)"send_msl_command - success!", v3, v4, v5, v6, v7, v8, v18);
  }
  return v9;
}

void msl_handle_memory_event(int a1)
{
  if ((a1 & 0xF0000000) != 0 && (a1 & 0xFFFFFFF) == 0)
  {
    if (a1 < 0)
    {
      msl_turn_off_stack_logging();
    }
    else if ((a1 & 0x40000000) != 0)
    {
      if ((~a1 & 0x30000000) != 0)
      {
        if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 5 || !msl_type_enabled_at_runtime))
        {
          msl_type_enabled_at_runtime = 5;
          msl_turn_on_stack_logging(5);
        }
      }
      else if ((msl_type_enabled_at_runtime & 0xFFFFFFFB) == 0)
      {
        msl_type_enabled_at_runtime = 4;
        msl_turn_on_stack_logging(4);
      }
    }
    else if ((~a1 & 0x30000000) != 0)
    {
      if ((a1 & 0x10000000) != 0)
      {
        if ((msl_type_enabled_at_runtime & 0xFFFFFFFD) == 0)
        {
          msl_type_enabled_at_runtime = 2;
          msl_turn_on_stack_logging(2);
        }
      }
      else if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 3 || !msl_type_enabled_at_runtime))
      {
        msl_type_enabled_at_runtime = 3;
        msl_turn_on_stack_logging(3);
      }
    }
    else if (msl_type_enabled_at_runtime <= 1)
    {
      msl_type_enabled_at_runtime = 1;
      msl_turn_on_stack_logging(1);
    }
  }
}

BOOL msl_is_stack_logging_enabled()
{
  return stack_logging_enable_logging != 0;
}

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(int a1, int a2, int a3, uint64_t a4)
{
  int v14 = __prepare_to_log_stacks((a1 & 0xFFFFFFFE) == 4);
  if (v14)
  {
    if (a2) {
      *MEMORY[0x263EF8CA0] = __disk_stack_logging_log_stack;
    }
    if (a3) {
      *MEMORY[0x263EF8C40] = __disk_stack_logging_log_stack;
    }
    stack_logging_mode = a1;
    stack_logging_enable_logging = 1;
    if (a1 == 4) {
      enable_stack_logging_lite();
    }
    msl_printf(5, (uint64_t)"%s\n", v8, v9, v10, v11, v12, v13, a4);
    set_malloc_stack_logging_start_timestamp();
  }
  return v14 != 0;
}

uint64_t global_uniquing_table()
{
  if (pre_write_buffers) {
    return *(void *)(pre_write_buffers + 16);
  }
  else {
    return 0;
  }
}

void __delete_and_unlink_uniquing_table_while_locked()
{
  if (pre_write_buffers)
  {
    uint64_t v0 = *(void *)(pre_write_buffers + 16);
    if (v0)
    {
      if (!uniquing_table_is_husk(*(void *)(pre_write_buffers + 16))) {
        uniquing_table_deinitialize(v0, 1, v1, v2, v3, v4, v5, v6);
      }
    }
  }
  *MEMORY[0x263EF8C88] = 0;
}

uint64_t __prepare_to_log_stacks(int a1)
{
  if (pre_write_buffers) {
    return 1;
  }
  last_logged_malloc_mach_vm_address_t address = 0;
  if (stack_logging_dontcompact) {
    int v3 = 0;
  }
  else {
    int v3 = logging_use_compaction;
  }
  logging_use_compaction = v3;
  uint64_t pages = (char *)sld_allocate_pages(0x4000uLL);
  pre_write_buffers = (uint64_t)pages;
  if (!pages)
  {
    uint64_t v21 = "error creating VM region for stack logging output buffers\n";
LABEL_13:
    msl_printf(3, (uint64_t)v21, v5, v6, v7, v8, v9, v10, v36);
    msl_printf(3, (uint64_t)"stack logging disabled due to previous errors.\n", v22, v23, v24, v25, v26, v27, v37);
    stack_logging_enable_logging = 0;
    *MEMORY[0x263EF8CA0] = 0;
    *MEMORY[0x263EF8C40] = 0;
    disable_stack_logging_lite();
    return 0;
  }
  strcpy(pages, "mslshm1");
  uint64_t v11 = pre_write_buffers;
  *(void *)(pre_write_buffers + 8) = 0;
  *(_DWORD *)(v11 + 52) = 0;
  *(unsigned char *)(v11 + 56) = *(unsigned char *)(v11 + 56) & 0xFC | a1 & 1 | 2;
  *(void *)(v11 + 24) = 0;
  *(void *)(v11 + 32) = 0;
  uint64_t v12 = uniquing_table_create(0x10000u, 0x40000000u, v5, v6, v7, v8, v9, v10);
  if (!v12)
  {
    uint64_t v21 = "error while allocating stack uniquing table\n";
    goto LABEL_13;
  }
  mach_vm_address_t v13 = v12;
  if (a1 || create_log_file())
  {
    uint64_t v20 = pre_write_buffers;
    *(void *)(pre_write_buffers + 16) = v13;
    *MEMORY[0x263EF8C88] = v20;
    return 1;
  }
  uniquing_table_deinitialize(v13, 1, v14, v15, v16, v17, v18, v19);
  uniquing_table_destroy_husk_exclusive(v13);
  uint64_t v28 = munmap((void *)pre_write_buffers, 0x4000uLL);
  pre_write_buffers = 0;
  if (!stack_logging_postponed) {
    disable_stack_logging(v28, v29, v30, v31, v32, v33, v34, v35);
  }
  return 0;
}

void disable_stack_logging(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  msl_printf(3, (uint64_t)"stack logging disabled due to previous errors.\n", a3, a4, a5, a6, a7, a8, vars0);
  stack_logging_enable_logging = 0;
  *MEMORY[0x263EF8CA0] = 0;
  *MEMORY[0x263EF8C40] = 0;

  disable_stack_logging_lite();
}

uint64_t create_log_file()
{
  uint64_t v60 = *MEMORY[0x263EF8C08];
  pid_t v0 = getpid();
  uint64_t v1 = getprogname();
  uint64_t pages = (char *)__stack_log_file_path__;
  if (!__stack_log_file_path__)
  {
    uint64_t pages = (char *)sld_allocate_pages((*MEMORY[0x263EF8C78] + 1023) & -*MEMORY[0x263EF8C78]);
    __stack_log_file_path__ = (uint64_t)pages;
    if (!pages)
    {
      uint64_t v30 = "unable to allocate memory for stack log file path\n";
      goto LABEL_34;
    }
  }
  if (msl_get_writable_log_dir((BOOL)pages, 0x400uLL)) {
    goto LABEL_6;
  }
  if (!stack_logging_finished_init)
  {
    msl_printf(6, (uint64_t)"stack logging postponed until after initialization.\n", v9, v10, v11, v12, v13, v14, v57);
    stack_logging_postponed = 1;
    goto LABEL_31;
  }
  if (confstr(65537, pages, 0x400uLL) - 1024 < 0xFFFFFFFFFFFFFC01)
  {
LABEL_31:
    *uint64_t pages = 0;
    if (stack_logging_postponed) {
      return 0;
    }
    uint64_t v30 = "No writeable tmp dir\n";
LABEL_34:
    msl_printf(3, (uint64_t)v30, v3, v4, v5, v6, v7, v8, v57);
    return 0;
  }
LABEL_6:
  unint64_t v15 = _platform_strlen();
  if (v15 >= 0x400) {
    create_log_file_cold_1();
  }
  if ((!v15 || *(unsigned char *)(v15 + __stack_log_file_path__ - 1) != 47) && _platform_strlcat() != v15 + 1
    || (unint64_t)_platform_strlcat() > 0x3FF)
  {
    goto LABEL_14;
  }
  int appended = append_int(__stack_log_file_path__, v0, 0xAu);
  if (appended)
  {
    if ((unint64_t)_platform_strlcat() <= 0x3FF)
    {
      int appended = append_int(__stack_log_file_path__, pre_write_buffers, 0x10u);
      goto LABEL_15;
    }
LABEL_14:
    int appended = 0;
  }
LABEL_15:
  if (v1 && *v1)
  {
    if (!appended || (unint64_t)_platform_strlcat() > 0x3FF || (unint64_t)_platform_strlcat() >= 0x400) {
      goto LABEL_28;
    }
  }
  else if (!appended)
  {
    goto LABEL_28;
  }
  if ((unint64_t)_platform_strlcat() <= 0x3FF && (unint64_t)_platform_strlcat() <= 0x3FF)
  {
    uint64_t v23 = (const char *)__stack_log_file_path__;
    uint64_t v24 = _platform_strlen();
    uint64_t v25 = 0;
    uint64_t v26 = v24 << 32;
    while (v23[v25++])
      ;
    if (v25 - 1 <= 1023)
    {
      uint64_t v32 = &v23[v25 - (int)v24];
      uint64_t v33 = (char *)(v32 - 2);
      if (v32 - 2 >= v23)
      {
        uint64_t v34 = (char *)(v32 - 1);
        if (!_platform_strchr())
        {
          getentropy(buffer, 0x10uLL);
          unint64_t v43 = 0;
          do
          {
            if (*v33 != 88 || v43 > 0xE) {
              break;
            }
            unsigned int v45 = buffer[v43++];
            *v33-- = my_mkstemps_padchar[(v45 - 62 * ((133 * (v45 >> 1)) >> 12))];
          }
          while (v33 >= v23);
          memcpy(__dst, v33 + 1, &v23[-(v26 >> 32)] - v33 + v25 - 2);
          int v42 = open(v23, 553650690, 384);
          if (v42 < 0)
          {
            while (2)
            {
              int v46 = __error();
              if (v34 == v33 + 1 || *v46 != 17)
              {
LABEL_61:
                index_file_descriptor = -1;
                msl_printf(3, (uint64_t)"unable to create stack logs at %s\n", v47, v48, v49, v50, v51, v52, __stack_log_file_path__);
                goto LABEL_29;
              }
              unint64_t v53 = __dst;
              v54 = v33 + 1;
              while (1)
              {
                uint64_t v55 = _platform_strchr();
                if (!v55)
                {
                  *__error() = 5;
                  goto LABEL_61;
                }
                int v56 = *(unsigned __int8 *)(v55 + 1);
                if (!*(unsigned char *)(v55 + 1)) {
                  int v56 = 48;
                }
                char *v54 = v56;
                if (v56 != *v53) {
                  break;
                }
                ++v54;
                ++v53;
                if (v34 == v54) {
                  goto LABEL_61;
                }
              }
              int v42 = open(v23, 553650690, 384);
              if (v42 < 0) {
                continue;
              }
              break;
            }
          }
LABEL_41:
          index_file_descriptor = v42;
          msl_printf(5, (uint64_t)"stack logs being written to %s\n", v35, v36, v37, v38, v39, v40, __stack_log_file_path__);
          uint64_t v29 = __stack_log_file_path__;
          *(void *)(pre_write_buffers + 40) = __stack_log_file_path__;
          *(_DWORD *)(pre_write_buffers + 48) = _platform_strlen();
          return v29;
        }
      }
      int v28 = 22;
    }
    else
    {
      int v28 = 63;
    }
    BOOL v41 = __error();
    int v42 = 0;
    *BOOL v41 = v28;
    goto LABEL_41;
  }
LABEL_28:
  msl_printf(3, (uint64_t)"unable to construct valid stack logging path\n", v16, v17, v18, v19, v20, v21, v57);
LABEL_29:
  uint64_t v29 = 0;
  *(unsigned char *)__stack_log_file_path__ = 0;
  return v29;
}

uint64_t __prepare_to_log_stacks_unlocked(int a1)
{
  if (pre_write_buffers) {
    return 1;
  }
  __malloc_lock_stack_logging();
  uint64_t v3 = __prepare_to_log_stacks(a1);
  __malloc_unlock_stack_logging();
  return v3;
}

void reap_orphaned_log_files_once()
{
  if ((reap_orphaned_log_files_once_orphaned_log_files & 1) == 0)
  {
    __swp(&reap_orphaned_log_files_once_orphaned_log_files, &reap_orphaned_log_files_once_orphaned_log_files);
    if ((&reap_orphaned_log_files_once_orphaned_log_files & 1) == 0)
    {
      uint64_t v0 = getpid();
      get_remote_env_var(v0, (uint64_t)"MallocStackLoggingDontDeleteStackLogFile", v1);
      if (v1[0] != 49) {
        atexit((void (*)(void))delete_log_files);
      }
      if ((!getprogname() || _platform_strcmp() && _platform_strcmp())
        && msl_should_reap_old_logs())
      {
        reap_orphaned_log_files(v0, 0);
      }
    }
  }
}

uint64_t delete_log_files()
{
  uint64_t result = __stack_log_file_path__;
  if (__stack_log_file_path__ && *(unsigned char *)__stack_log_file_path__)
  {
    if (delete_logging_file(__stack_log_file_path__))
    {
      return msl_printf(5, (uint64_t)"unable to delete stack logs from %s\n", v1, v2, v3, v4, v5, v6, __stack_log_file_path__);
    }
    else
    {
      uint64_t result = msl_printf(5, (uint64_t)"stack logs deleted from %s\n", v1, v2, v3, v4, v5, v6, __stack_log_file_path__);
      *(unsigned char *)__stack_log_file_path__ = 0;
    }
  }
  return result;
}

void __disk_stack_logging_log_stack(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (stack_logging_enable_logging) {
    BOOL v9 = stack_logging_postponed == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9) {
    return;
  }
  uint64_t v14 = (a6 + 1);
  while (1)
  {
    uint64_t v15 = a4;
    if ((malloc_get_thread_options() & 4) != 0) {
      return;
    }
    unsigned int v22 = stack_logging_mode & 0xFFFFFFFE;
    int v23 = a1 & 0x30;
    if ((a1 & 0x30) == 0 && v22 == 4) {
      return;
    }
    if ((~a1 & 6) != 0) {
      break;
    }
    if (!a3)
    {
      a1 ^= 4u;
      a3 = a5;
      goto LABEL_20;
    }
    if (a5)
    {
      __disk_stack_logging_log_stack(4, a2, a3, 0, 0, v14);
      if (stack_logging_enable_logging)
      {
        a4 = 0;
        uint64_t v14 = (v14 + 1);
        a1 = 2;
        a3 = v15;
        if (!stack_logging_postponed) {
          continue;
        }
      }
    }
    return;
  }
  if ((a1 & 0x24) != 0)
  {
    if (!a3) {
      return;
    }
    goto LABEL_20;
  }
  if ((a1 & 0x12) != 0)
  {
    uint64_t v15 = a3;
    a3 = a5;
    if ((unint64_t)(a5 + 1) < 2) {
      return;
    }
LABEL_20:
    if (v23 && *MEMORY[0x263EF8C60] != a2 || __malloc_stack_logging_is_reentered()) {
      return;
    }
    if ((a1 & 2) != 0) {
      reap_orphaned_log_files_once();
    }
    __malloc_lock_stack_logging();
    if (v22 == 4 && (a1 & 0x20) != 0)
    {
      if (pre_write_buffers)
      {
        uint64_t v36 = *(void *)(pre_write_buffers + 24);
        if (v36)
        {
          radix_tree_delete(&v36, a3 & -*MEMORY[0x263EF8C78], ((v15 + a3 + *MEMORY[0x263EF8C78] - 1) & -*MEMORY[0x263EF8C78]) - (a3 & -*MEMORY[0x263EF8C78]));
          uint64_t v24 = v36;
          uint64_t v25 = pre_write_buffers;
          *(void *)(pre_write_buffers + 24) = v36;
          if (v24)
          {
            uint64_t v24 = radix_tree_size(v24);
            uint64_t v25 = pre_write_buffers;
          }
          *(void *)(v25 + 32) = v24;
          goto LABEL_41;
        }
      }
    }
    if (!stack_logging_enable_logging || stack_logging_postponed)
    {
LABEL_41:
      __malloc_unlock_stack_logging();
      return;
    }
    uint64_t v26 = a3 ^ 0x5555;
    if ((a3 ^ 0x5555) == last_logged_malloc_address && (a1 & 4) != 0 && last_logged_malloc_address)
    {
      *(_DWORD *)(pre_write_buffers + 52) -= 32;
      last_logged_malloc_mach_vm_address_t address = 0;
      goto LABEL_41;
    }
    uint64_t invalid = msl_payload_get_invalid();
    if (pre_write_buffers && (uint64_t v28 = *(void *)(pre_write_buffers + 16)) != 0)
    {
      LODWORD(v36) = 0;
      BOOL v29 = uniquing_table_stack_retain(v28, v14, 1, &v36) == 0;
      BOOL v30 = uniquing_table_node_count(v28) <= 0x400000;
      uint64_t invalid = msl_payload_create(v36, v30, 0);
    }
    else
    {
      BOOL v29 = 0;
    }
    if (msl_payload_is_invalid(invalid)) {
      goto LABEL_50;
    }
    if (v22 == 4 && (a1 & 0x10) != 0)
    {
      if (!pre_write_buffers) {
        goto LABEL_50;
      }
      uint64_t v36 = *(void *)(pre_write_buffers + 24);
      if (!v36)
      {
        uint64_t v31 = radix_tree_create();
        uint64_t v36 = v31;
        uint64_t v32 = pre_write_buffers;
        *(void *)(pre_write_buffers + 24) = v31;
        if (!v31)
        {
LABEL_60:
          *(void *)(v32 + 32) = v31;
          goto LABEL_50;
        }
        *(void *)(pre_write_buffers + 32) = radix_tree_size(v31);
      }
      radix_tree_insert(&v36, a3 & -*MEMORY[0x263EF8C78], ((v15 + a3 + *MEMORY[0x263EF8C78] - 1) & -*MEMORY[0x263EF8C78]) - (a3 & -*MEMORY[0x263EF8C78]), invalid);
      uint64_t v31 = v36;
      uint64_t v32 = pre_write_buffers;
      *(void *)(pre_write_buffers + 24) = v36;
      if (v31)
      {
        uint64_t v31 = radix_tree_size(v31);
        uint64_t v32 = pre_write_buffers;
      }
      goto LABEL_60;
    }
    __src[0] = v15;
    __src[1] = a3 ^ 0x5555;
    __src[2] = invalid;
    __src[3] = a1 & 0xFF0000B7;
    if ((a1 & 0x12) != 0)
    {
      if (!logging_use_compaction)
      {
LABEL_66:
        uint64_t v33 = pre_write_buffers;
        unsigned int v34 = *(_DWORD *)(pre_write_buffers + 52);
        if (v34 >> 5 >= 0x1FD)
        {
          if (!flush_data()) {
            goto LABEL_50;
          }
          uint64_t v33 = pre_write_buffers;
          unsigned int v34 = *(_DWORD *)(pre_write_buffers + 52);
        }
        memcpy((void *)(v33 + v34 + 64), __src, 0x20uLL);
        *(_DWORD *)(pre_write_buffers + 52) += 32;
LABEL_50:
        __malloc_unlock_stack_logging();
        if (v29) {
          msl_turn_off_stack_logging();
        }
        return;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    last_logged_malloc_mach_vm_address_t address = v26;
    goto LABEL_66;
  }

  msl_printf(3, (uint64_t)"Invalid stack logging event", v16, v17, v18, v19, v20, v21, a9);
}

uint64_t flush_data()
{
  uint64_t v39 = *MEMORY[0x263EF8C08];
  if (index_file_descriptor == -1)
  {
    uint64_t result = create_log_file();
    if (!result) {
      return result;
    }
  }
  uint64_t v1 = pre_write_buffers;
  size_t v2 = *(unsigned int *)(pre_write_buffers + 52);
  if (!v2)
  {
    uint64_t v20 = 0;
LABEL_24:
    *(void *)(v1 + 8) += v20;
    *(_DWORD *)(v1 + 52) = 0;
    return 1;
  }
  uint64_t v3 = (char *)(pre_write_buffers + 64);
  while (1)
  {
    int v4 = index_file_descriptor;
    ssize_t v5 = write(index_file_descriptor, v3, v2);
    if (v5 != -1) {
      goto LABEL_19;
    }
    if (*__error() != 9) {
      goto LABEL_22;
    }
    if (index_file_descriptor != v4) {
      break;
    }
    uint64_t v12 = __stack_log_file_path__;
    int v19 = open((const char *)__stack_log_file_path__, 553648137);
    if (v19 < 3)
    {
      int v38 = 0;
      uint64_t v37 = 0;
      do
      {
        if (v19 == -1)
        {
          msl_printf(3, (uint64_t)"unable to re-open stack logging file %s\n", v13, v14, v15, v16, v17, v18, v12);
          delete_log_files();
          goto LABEL_22;
        }
        *((_DWORD *)&v37 + v19) = 1;
        int v19 = dup(v19);
      }
      while (v19 < 3);
      if (v37) {
        close(0);
      }
      if (HIDWORD(v37)) {
        close(1);
      }
      if (v38) {
        close(2);
      }
    }
    index_file_descriptor = v19;
    ssize_t v5 = write(v19, v3, v2);
    if (v5 == -1) {
      goto LABEL_22;
    }
LABEL_19:
    v3 += v5;
    v2 -= v5;
    if (!v2)
    {
      uint64_t v1 = pre_write_buffers;
      uint64_t v20 = *(unsigned int *)(pre_write_buffers + 52);
      goto LABEL_24;
    }
  }
  msl_printf(3, (uint64_t)"Unknown file descriptor; expecting stack logging index file\n",
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v35);
LABEL_22:
  uint64_t v21 = __stack_log_file_path__;
  unsigned int v22 = __error();
  strerror(*v22);
  msl_printf(3, (uint64_t)"Unable to write to stack logging file %s (%s)\n", v23, v24, v25, v26, v27, v28, v21);
  msl_printf(3, (uint64_t)"stack logging disabled due to previous errors.\n", v29, v30, v31, v32, v33, v34, v36);
  stack_logging_enable_logging = 0;
  *MEMORY[0x263EF8CA0] = 0;
  *MEMORY[0x263EF8C40] = 0;
  disable_stack_logging_lite();
  return 0;
}

void msl_fork_child()
{
  msl_lock_init();
  msl_turn_off_stack_logging();
  __malloc_lock_stack_logging();
  if (__stack_log_file_path__)
  {
    sld_deallocate_pages(__stack_log_file_path__, (*MEMORY[0x263EF8C78] + 1023) & -*MEMORY[0x263EF8C78]);
    __stack_log_file_path__ = 0;
  }
  if (index_file_descriptor != -1)
  {
    close(index_file_descriptor);
    index_file_descriptor = -1;
  }
  mach_vm_address_t v0 = pre_write_buffers;
  if (pre_write_buffers)
  {
    if (!*(void *)(pre_write_buffers + 24)
      || (radix_tree_destroy(*(void *)(pre_write_buffers + 24)), (mach_vm_address_t v0 = pre_write_buffers) != 0))
    {
      if (*(void *)(v0 + 16))
      {
        __delete_and_unlink_uniquing_table_while_locked();
        mach_vm_address_t v0 = pre_write_buffers;
      }
    }
    sld_deallocate_pages(v0, 0x4000uLL);
    pre_write_buffers = 0;
  }

  __malloc_unlock_stack_logging();
}

uint64_t update_cache_for_file_streams()
{
  uint64_t v0 = MEMORY[0x270FA53B0]();
  __ptr[512] = *MEMORY[0x263EF8C08];
  uint64_t v1 = *(unsigned int **)(v0 + 32);
  if (!v1)
  {
    uint64_t v1 = (unsigned int *)malloc_type_calloc(1uLL, 0x4048uLL, 0x1020040901AD395uLL);
    *(void *)(v0 + 32) = v1;
    v1[4] = 17;
    *((void *)v1 + 2053) = 0;
    *(_OWORD *)uint64_t v1 = xmmword_2104CDF60;
    *((void *)v1 + 3) = malloc_type_calloc(0x4000uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    uint64_t v7 = *(void *)(v0 + 40);
    if (v7)
    {
      mach_vm_address_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
        mach_vm_address_t v9 = map_shared_memory_from_task(*(_DWORD *)v0, v8, *(void *)(v7 + 32));
        *((void *)v1 + 2056) = v9;
        if (!v9) {
          msl_printf(3, (uint64_t)"warning: unable to map vm_stackid table from %llx in target process %d; no VM stack backtraces will"
        }
                     " be available.\n",
            v10,
            v11,
            v12,
            v13,
            v14,
            v15,
            *(void *)(*(void *)(v0 + 40) + 24));
      }
    }
  }
  int v2 = *(_DWORD *)(v0 + 4);
  pid_t v3 = getpid();
  task_suspension_token_t suspend_token = 0;
  if (v2 != v3) {
    task_suspend2(*(_DWORD *)v0, &suspend_token);
  }
  memset(&v44, 0, sizeof(v44));
  int v4 = *(FILE **)(v0 + 16);
  if (v4)
  {
    int v5 = fileno(v4);
    fstat(v5, &v44);
    off_t st_size = v44.st_size;
  }
  else
  {
    off_t st_size = 0;
  }
  int v16 = *(_DWORD *)(v0 + 8);
  if (v16) {
    size_t v17 = 32;
  }
  else {
    size_t v17 = 24;
  }
  uint64_t v18 = *((void *)v1 + 2053);
  size_t v19 = st_size - v18;
  uint64_t v20 = *(void *)(v0 + 40);
  if (v17 <= st_size - v18)
  {
    if (v20)
    {
      unsigned int v22 = 0;
      uint64_t v23 = v18 + v1[21];
      *((void *)v1 + 2053) = v23;
      size_t v19 = st_size - v23;
      BOOL v21 = 1;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v21 = 0;
    unsigned int v22 = 0;
    goto LABEL_20;
  }
  if (!v20) {
    goto LABEL_19;
  }
  BOOL v21 = 0;
  unsigned int v22 = v1[21] / v17;
LABEL_20:
  if (v17 <= v19 || v21 || !v20)
  {
    if (!v20) {
      goto LABEL_26;
    }
  }
  else
  {
    BOOL v21 = *(_DWORD *)(v20 + 52) != v1[21];
  }
  if (*(unsigned char *)(v20 + 56))
  {
    if (!*((void *)v1 + 2054)) {
      LOBYTE(v21) = 1;
    }
    if (v21) {
      goto LABEL_27;
    }
    goto LABEL_32;
  }
LABEL_26:
  if (v21)
  {
LABEL_27:
    memcpy(v1 + 8, (const void *)v20, 0x4000uLL);
    if (*(void *)(*(void *)(v0 + 40) + 16))
    {
      msl_uniquing_table_release(*((void *)v1 + 2054));
      *((void *)v1 + 2054) = uniquing_table_clone_from_task(*(_DWORD *)v0, *(void *)(*(void *)(v0 + 40) + 16));
      int v24 = 1;
    }
    else
    {
      int v24 = 1;
      fwrite("Uniquing table deleted in remote task. This could be the result of memory pressure\n", 0x53uLL, 1uLL, (FILE *)*MEMORY[0x263EF8C10]);
    }
    goto LABEL_34;
  }
LABEL_32:
  int v24 = 0;
LABEL_34:
  if (v2 != v3) {
    task_resume2(suspend_token);
  }
  if (v24)
  {
    if (!*((void *)v1 + 2054)) {
      return 5;
    }
  }
  else if (v17 > v19)
  {
    return 0;
  }
  if (v17 > v19) {
    goto LABEL_61;
  }
  if (v16) {
    size_t v26 = 128;
  }
  else {
    size_t v26 = 170;
  }
  int v42 = *(FILE **)(v0 + 16);
  if (fseeko(v42, *((void *)v1 + 2053), 0)) {
    fwrite("error while attempting to cache information from remote stack index file. (update_cache_for_file_streams)\n", 0x6AuLL, 1uLL, (FILE *)*MEMORY[0x263EF8C10]);
  }
  unint64_t v27 = 0;
  unint64_t v28 = *((void *)v1 + 2053);
  size_t v43 = v19 / v17;
  for (uint64_t i = v0; ; v0 = i)
  {
    if (v43 - v27 < v26) {
      size_t v26 = v43 - v27;
    }
    size_t v29 = fread(__ptr, v17, v26, v42);
    unint64_t v30 = v29;
    if (!*(_DWORD *)(v0 + 8)) {
      break;
    }
    if (!v29) {
      goto LABEL_58;
    }
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    do
    {
      insert_node((uint64_t)v1, __ptr[4 * v32 + 1] ^ 0x5555, v28);
      v28 += v17;
      uint64_t v32 = ++v31;
    }
    while (v30 > v31);
LABEL_57:
    v27 += v31;
  }
  if (v29)
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
    do
    {
      insert_node((uint64_t)v1, HIDWORD(__ptr[3 * v33]) ^ 0x5555, v28);
      v28 += v17;
      uint64_t v33 = ++v31;
    }
    while (v30 > v31);
    goto LABEL_57;
  }
LABEL_58:
  if (v43 > v27) {
    fwrite("insufficient data in remote stack index file; expected more records.\n",
  }
      0x45uLL,
      1uLL,
      (FILE *)*MEMORY[0x263EF8C10]);
  *((void *)v1 + 2053) += v27 * v17;
LABEL_61:
  if (v24)
  {
    uint64_t v34 = *((void *)v1 + 5);
    unsigned int v35 = v1[21] / v17;
    unsigned int v36 = v35 - v22;
    if (*(_DWORD *)(v0 + 8))
    {
      if (v35 > v22)
      {
        unint64_t v37 = v34 + v17 * (unint64_t)v22;
        uint64_t v38 = 32 * v22 + 104;
        do
        {
          insert_node((uint64_t)v1, *(void *)((char *)v1 + v38) ^ 0x5555, v37);
          v37 += v17;
          v38 += 32;
          --v36;
        }
        while (v36);
      }
    }
    else if (v35 > v22)
    {
      unint64_t v39 = v34 + v17 * (unint64_t)v22;
      uint64_t v40 = 24 * v22 + 100;
      do
      {
        insert_node((uint64_t)v1, *(unsigned int *)((char *)v1 + v40) ^ 0x5555, v39);
        v39 += v17;
        v40 += 24;
        --v36;
      }
      while (v36);
    }
  }
  return 0;
}

void release_file_streams_for_task(int a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = remote_fds_count;
  if (remote_fds_count)
  {
    pid_t v3 = (_DWORD **)remote_fds;
    while (1)
    {
      int v4 = *v3;
      if (*v3)
      {
        if (*v4 == a1) {
          break;
        }
      }
      ++v3;
      if (!--v2) {
        goto LABEL_8;
      }
    }
    --v4[3];
  }
LABEL_8:
  int v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v6 = v5;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&remote_fd_list_lock, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 != v5)
  {
    os_unfair_lock_unlock(&remote_fd_list_lock);
  }
}

uint64_t msl_stop_reading(int a1)
{
  release_file_streams_for_task(a1);
  os_unfair_lock_lock_with_options();
  uint64_t v2 = remote_fds_count;
  if (!remote_fds_count) {
    goto LABEL_6;
  }
  pid_t v3 = (int **)remote_fds;
  while (1)
  {
    int v4 = *v3;
    if (*v3)
    {
      if (*v4 == a1) {
        break;
      }
    }
    ++v3;
    if (!--v2) {
      goto LABEL_6;
    }
  }
  if (v4[3] <= 0)
  {
    free_file_streams(v4);
LABEL_6:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  uint64_t v5 = 5;
LABEL_7:
  int v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v7 = v6;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&remote_fd_list_lock, (unsigned int *)&v7, 0, memory_order_release, memory_order_relaxed);
  if (v7 != v6) {
    os_unfair_lock_unlock(&remote_fd_list_lock);
  }
  return v5;
}

void free_file_streams(void *a1)
{
  uint64_t v2 = (FILE *)*((void *)a1 + 2);
  if (v2) {
    fclose(v2);
  }
  pid_t v3 = (void *)*((void *)a1 + 5);
  if (v3) {
    munmap(v3, 0x4000uLL);
  }
  uint64_t v4 = *((void *)a1 + 4);
  if (v4)
  {
    free(*(void **)(v4 + 24));
    msl_uniquing_table_release(*(void *)(*((void *)a1 + 4) + 16432));
    free(*((void **)a1 + 4));
  }

  bzero(a1, 0x30uLL);
}

BOOL msl_payload_version_from_task(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (v2) {
    release_file_streams_for_task(a1);
  }
  return v2 != 0;
}

uint64_t msl_coldest_frame_is_threadid(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2[5];
  if (v3) {
    BOOL v4 = (*(unsigned char *)(v3 + 56) & 3) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  release_file_streams_for_task(a1);
  return v4;
}

uint64_t msl_payload_for_malloc_address_in_task(mach_port_name_t a1, unint64_t a2)
{
  BOOL v4 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (v4)
  {
    uint64_t v5 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v4, a2);
    release_file_streams_for_task(a1);
    return v5;
  }
  else
  {
    return msl_payload_get_invalid();
  }
}

uint64_t msl_payload_for_malloc_address_in_task_helper(uint64_t a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8C08];
  if (update_cache_for_file_streams())
  {
LABEL_2:
    return msl_payload_get_invalid();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unint64_t v6 = *(void *)(v5 + 8);
    unint64_t v7 = (a2 >> 2) % (v6 - 1);
    unsigned int v8 = *(_DWORD *)(v5 + 16);
    unsigned int v9 = 1;
    uint64_t v10 = *(void *)(v5 + 24);
    while (1)
    {
      uint64_t v11 = *(void *)(v10 + 16 * v7);
      if (v11 == a2) {
        break;
      }
      if (v11)
      {
        unint64_t v12 = v7 + v6 / ((2 * v8) | 1) * v9;
        unint64_t v13 = v12 >= v6 ? v6 : 0;
        unint64_t v7 = v12 - v13;
        if (v9++ <= v8) {
          continue;
        }
      }
      goto LABEL_2;
    }
    unint64_t v15 = *(void *)(v10 + 16 * v7 + 8);
    uint64_t invalid = msl_payload_get_invalid();
    uint64_t v17 = *(void *)(a1 + 32);
    if (v15 >= *(void *)(v17 + 16424))
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v20 = v17 + v15 - *(void *)(v17 + 40) + 96;
        if (*(_DWORD *)(a1 + 8)) {
          return *(void *)(v20 + 16);
        }
        else {
          return *(void *)(v20 + 8);
        }
      }
    }
    else
    {
      if (*(_DWORD *)(a1 + 8)) {
        size_t v18 = 32;
      }
      else {
        size_t v18 = 24;
      }
      fseeko(*(FILE **)(a1 + 16), v15, 0);
      if (fread(__ptr, v18, 1uLL, *(FILE **)(a1 + 16)))
      {
        uint64_t v19 = 16;
        if (!*(_DWORD *)(a1 + 8)) {
          uint64_t v19 = 8;
        }
        return *(void *)&__ptr[v19];
      }
    }
    return invalid;
  }
}

uint64_t msl_get_frames_for_address(mach_port_name_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  int v16 = 0;
  uint64_t v10 = retain_file_streams_for_task_with_error(a1, 0, &v16);
  if (!v10) {
    return 5;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v10, a2);
  if (msl_payload_is_invalid(v12))
  {
    uint64_t frames_from_task_helper = 5;
  }
  else
  {
    unint64_t uniquing_table_index = msl_payload_get_uniquing_table_index(v12);
    uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v11, uniquing_table_index, a3, a4, a5, 0);
  }
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_get_frames_from_task_helper(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, BOOL *a6)
{
  if (a2 > 0xFFFFFFFE) {
    return 5;
  }
  unsigned int v11 = a2;
  uint64_t result = update_cache_for_file_streams();
  if (!result)
  {
    uniquing_table_unwind_stack_remote(*(void *)(*(void *)(a1 + 32) + 16432), v11, a3, a5, a4, v13, v14, v15);
    if (a6)
    {
      uint64_t v16 = *(void *)(a1 + 40);
      if (v16) {
        BOOL v17 = (*(unsigned char *)(v16 + 56) & 3) == 0;
      }
      else {
        BOOL v17 = 1;
      }
      *a6 = v17;
    }
    if (*a5) {
      return 0;
    }
    else {
      return 5;
    }
  }
  return result;
}

uint64_t msl_copy_disk_stack_logs(mach_port_name_t a1, uint64_t a2)
{
  int v3 = a1;
  int v20 = 0;
  BOOL v4 = (FILE **)retain_file_streams_for_task_with_error(a1, 0, &v20);
  if (!v4) {
    return 5;
  }
  uint64_t v5 = v4;
  unint64_t v6 = v4[2];
  if (v6)
  {
    unint64_t v7 = malloc_type_malloc(0x100000uLL, 0x4FBB177uLL);
    uint64_t updated = update_cache_for_file_streams();
    if (!updated)
    {
      int v19 = v3;
      int v9 = *((_DWORD *)v5 + 2);
      fseeko(v6, 0, 0);
      if (v9) {
        size_t v10 = 32;
      }
      else {
        size_t v10 = 24;
      }
      if (v9) {
        unint64_t v11 = 0x8000;
      }
      else {
        unint64_t v11 = 43690;
      }
      size_t v12 = *(void *)&v5[4][108]._r / v10;
      while (1)
      {
        size_t v13 = v11 >= v12 ? v12 : v11;
        size_t v14 = fread(v7, v10, v13, v6);
        if (!v14) {
          break;
        }
        size_t v15 = v14;
        uint64_t v16 = (*(uint64_t (**)(uint64_t, void *, size_t))(a2 + 16))(a2, v7, v14 * v10);
        if (v16) {
          goto LABEL_25;
        }
        v12 -= v15;
        if (!v12) {
          goto LABEL_22;
        }
      }
      if (ferror(v6))
      {
        uint64_t updated = 5;
        goto LABEL_27;
      }
LABEL_22:
      if (v5[5])
      {
        BOOL v17 = v5[4];
        if (HIDWORD(v17->_write))
        {
          uint64_t v16 = (*(uint64_t (**)(uint64_t, int *))(a2 + 16))(a2, &v17->_ub._size);
LABEL_25:
          uint64_t updated = v16;
          goto LABEL_27;
        }
      }
      uint64_t updated = 0;
LABEL_27:
      int v3 = v19;
    }
    if (v7) {
      free(v7);
    }
  }
  else
  {
    uint64_t updated = 5;
  }
  release_file_streams_for_task(v3);
  return updated;
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  if (a3)
  {
    if (a2 >= 0x20)
    {
      unint64_t v5 = a2 >> 5;
      unint64_t v6 = (uint64_t *)(a1 + 16);
      do
      {
        uint64_t v7 = *(v6 - 2);
        uint64_t v8 = *(v6 - 1) ^ 0x5555;
        uint64_t v9 = *v6;
        size_t v10 = *(void (**)(uint64_t, int *))(a4 + 16);
        int v18 = *((_DWORD *)v6 + 2);
        int v19 = 0;
        uint64_t v20 = v9;
        uint64_t v21 = v7;
        uint64_t v22 = v8;
        v10(a4, &v18);
        v6 += 4;
        --v5;
      }
      while (v5);
    }
  }
  else if (a2 >= 0x18)
  {
    unint64_t v11 = a2 / 0x18;
    size_t v12 = (uint64_t *)(a1 + 8);
    do
    {
      uint64_t v13 = *((unsigned int *)v12 - 2);
      uint64_t v14 = *((unsigned int *)v12 - 1) ^ 0x5555;
      uint64_t v15 = *v12;
      uint64_t v16 = *(void (**)(uint64_t, int *))(a4 + 16);
      int v18 = *((_DWORD *)v12 + 2);
      int v19 = 0;
      uint64_t v20 = v15;
      uint64_t v21 = v13;
      uint64_t v22 = v14;
      v16(a4, &v18);
      v12 += 3;
      --v11;
    }
    while (v11);
  }
  return 0;
}

uint64_t msl_disk_stack_logs_enumerate_from_task(mach_port_name_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[0] = MEMORY[0x263EF8BF8];
  v5[1] = 0x40000000;
  v5[2] = __msl_disk_stack_logs_enumerate_from_task_block_invoke;
  v5[3] = &__block_descriptor_tmp;
  v5[4] = a3;
  v5[5] = a4;
  return msl_disk_stack_logs_enumerate_from_task_with_block(a1, a2, (uint64_t)v5);
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block(mach_port_name_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x263EF8C08];
  __ptr[0] = 0;
  unint64_t v6 = retain_file_streams_for_task_with_error(a1, 0, __ptr);
  if (!v6) {
    return 5;
  }
  uint64_t v7 = v6;
  uint64_t updated = update_cache_for_file_streams();
  if (!updated)
  {
    if (*((_DWORD *)v7 + 2)) {
      unint64_t v10 = 32;
    }
    else {
      unint64_t v10 = 24;
    }
    uint64_t v11 = 64;
    if (!*((_DWORD *)v7 + 2)) {
      uint64_t v11 = 85;
    }
    unint64_t __offseta = 0;
    size_t __nitems = v11;
    char v39 = 1;
    size_t v12 = __ptr;
    size_t __size = v10;
    __stream = (FILE *)*((void *)v7 + 2);
    size_t v40 = *(void *)(*((void *)v7 + 4) + 16424) / v10;
    unsigned int v36 = v7;
    while (1)
    {
      size_t v13 = __nitems;
      if (__nitems >= v40) {
        size_t v13 = v40;
      }
      size_t __nitems = v13;
      if (v13)
      {
        if (!__stream) {
          goto LABEL_39;
        }
        fseeko(__stream, __offseta, 0);
        size_t v14 = fread(__ptr, __size, __nitems, __stream);
        unint64_t __offseta = ftello(__stream);
        if ((__offseta & 0x8000000000000000) != 0) {
          goto LABEL_39;
        }
        v40 -= v14;
        if (!v14) {
          goto LABEL_39;
        }
      }
      else
      {
        if (!*((void *)v7 + 5)) {
          goto LABEL_39;
        }
        uint64_t v15 = *((void *)v7 + 4);
        unint64_t v16 = *(void *)(v15 + 40) + *(unsigned int *)(v15 + 84);
        BOOL v17 = v16 > __offseta;
        unint64_t v18 = v16 - __offseta;
        if (!v17) {
          goto LABEL_39;
        }
        char v39 = 0;
        size_t v12 = (int *)(v15 + 96);
        unint64_t v19 = 16320;
        if (v18 < 0x3FC0) {
          unint64_t v19 = v18;
        }
        size_t v14 = v19 / __size;
        __offseta += v19 / __size * __size;
        if (!(v19 / __size))
        {
LABEL_39:
          release_file_streams_for_task(a1);
          return 0;
        }
      }
      if (*((_DWORD *)v7 + 2))
      {
        uint64_t v20 = 0;
        unsigned int v21 = 1;
        do
        {
          uint64_t v22 = &v12[8 * v20];
          uint64_t v23 = *((void *)v22 + 1);
          if (!a2 || (v24 = v23 == (a2 ^ 0x5555), uint64_t v23 = a2 ^ 0x5555, v24))
          {
            uint64_t v25 = *(void *)v22;
            uint64_t v26 = *((void *)v22 + 2);
            unint64_t v27 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            unsigned int v43 = v22[6];
            int v44 = 0;
            uint64_t v45 = v26;
            uint64_t v46 = v25;
            uint64_t v47 = v23 ^ 0x5555;
            v27(a3, &v43);
          }
          uint64_t v20 = v21;
          BOOL v17 = v14 > v21++;
        }
        while (v17);
      }
      else
      {
        uint64_t v28 = 0;
        unsigned int v29 = 1;
        do
        {
          int v30 = v12[6 * v28 + 1];
          if (!a2 || (BOOL v24 = v30 == (a2 ^ 0x5555), v30 = a2 ^ 0x5555, v24))
          {
            uint64_t v31 = &v12[6 * v28];
            uint64_t v32 = *v31;
            uint64_t v33 = *((void *)v31 + 1);
            uint64_t v34 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            unsigned int v43 = v31[4];
            int v44 = 0;
            uint64_t v45 = v33;
            uint64_t v46 = v32;
            uint64_t v47 = v30 ^ 0x5555u;
            v34(a3, &v43);
          }
          uint64_t v28 = v29;
          BOOL v17 = v14 > v29++;
        }
        while (v17);
      }
      uint64_t v7 = v36;
      if ((v39 & 1) == 0) {
        goto LABEL_39;
      }
    }
  }
  uint64_t v9 = updated;
  release_file_streams_for_task(a1);
  return v9;
}

uint64_t __msl_disk_stack_logs_enumerate_from_task_block_invoke(uint64_t a1, _OWORD *a2)
{
  int v3 = *(uint64_t (**)(_OWORD *, uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return v3(v6, v2);
}

uint64_t msl_payload_for_vm_region_in_task(mach_port_name_t a1, unint64_t a2)
{
  int v10 = 0;
  long long v4 = retain_file_streams_for_task_with_error(a1, 0, &v10);
  if (!v4) {
    return msl_payload_get_invalid();
  }
  unint64_t v5 = v4;
  if (update_cache_for_file_streams())
  {
    release_file_streams_for_task(a1);
    return msl_payload_get_invalid();
  }
  uint64_t invalid = msl_payload_get_invalid();
  uint64_t v7 = v5[4];
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 16448);
    if (v8) {
      uint64_t invalid = radix_tree_lookup(v8, a2);
    }
  }
  release_file_streams_for_task(a1);
  return invalid;
}

uint64_t msl_uniquing_table_get_frames_from_task(mach_port_name_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, BOOL *a6)
{
  if (a2 > 0xFFFFFFFE) {
    return 5;
  }
  int v15 = 0;
  size_t v12 = retain_file_streams_for_task_with_error(a1, 0, &v15);
  if (!v12) {
    return 5;
  }
  uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper((uint64_t)v12, a2, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_get_frames_for_stackid(mach_port_name_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, BOOL *a6)
{
  int v17 = 0;
  size_t v12 = retain_file_streams_for_task_with_error(a1, 0, &v17);
  if (!v12) {
    return 5;
  }
  uint64_t v13 = (uint64_t)v12;
  unint64_t uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
  uint64_t frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v13, uniquing_table_index, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_read_stack(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v10 = 5;
  if (!msl_payload_is_invalid(a2))
  {
    unsigned int uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
    uniquing_table_unwind_stack_remote(a1, uniquing_table_index, a3, a4, a5, v12, v13, v14);
    if (*a4) {
      return 0;
    }
    else {
      return 5;
    }
  }
  return v10;
}

void *msl_uniquing_table_copy_from_task(mach_port_name_t a1)
{
  uint64_t v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (v2)
  {
    if (update_cache_for_file_streams())
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v3 = v2[4];
      uint64_t v2 = *(void **)(v3 + 16432);
      if (v2) {
        *(void *)(v3 + 16432) = 0;
      }
    }
    release_file_streams_for_task(a1);
  }
  return v2;
}

uint64_t append_int(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (_platform_strlen() < (unint64_t)a3) {
    return 0;
  }
  uint64_t v6 = _platform_strlen();
  LODWORD(v7) = 0;
  unint64_t v8 = a2;
  do
  {
    uint64_t v7 = (v7 + 1);
    BOOL v9 = v8 >= a3;
    v8 /= a3;
  }
  while (v9);
  unint64_t v10 = v6 + v7;
  if (v10 > 0x3FF) {
    return 0;
  }
  *(unsigned char *)(a1 + v10) = 0;
  if (v7)
  {
    uint64_t v11 = (unsigned char *)(v6 + a1 + v7 - 1);
    do
    {
      *v11-- = a0123456789abcd[a2 % a3];
      a2 /= a3;
      --v7;
    }
    while (v7);
  }
  return 1;
}

uint64_t delete_logging_file(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (const char *)result;
    if (*(unsigned char *)result && (memset(&v2, 0, sizeof(v2)), unlink((const char *)result)) && !stat(v1, &v2)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
  return result;
}

FILE *open_log_file_at_path(char *a1, uint64_t a2)
{
  long long v4 = fopen(a1, "re");
  if (v4)
  {
    if (strrchr(a1, 47) && _platform_strchr() && (uint64_t v5 = _platform_strchr()) != 0)
    {
      uint64_t v6 = strtoll((const char *)(v5 + 1), 0, 16);
      *(void *)(a2 + 16) = v4;
      *(void *)(a2 + 24) = v6;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t map_shared_memory(uint64_t a1, mach_vm_address_t a2)
{
  mach_vm_address_t v4 = map_shared_memory_from_task(*(_DWORD *)a1, a2, 0x4000uLL);
  *(void *)(a1 + 40) = v4;
  if (v4)
  {
    uint64_t result = _platform_memcmp();
    if (!result) {
      return result;
    }
    uint64_t v6 = *(void **)(a1 + 40);
    size_t v7 = 0x4000;
  }
  else
  {
    size_t v7 = 8;
    uint64_t v6 = (void *)map_shared_memory_from_task(*(_DWORD *)a1, a2, 8uLL);
    *(void *)(a1 + 40) = v6;
    if (!v6)
    {
      msl_printf(3, (uint64_t)"warning: unable to map shared memory from %llx in target process %d; no stack backtraces will be available.\n",
        v8,
        v9,
        v10,
        v11,
        v12,
        v13,
        a2);
      return 5;
    }
  }
  munmap(v6, v7);
  *(void *)(a1 + 40) = 0;
  return 257;
}

mach_vm_address_t map_shared_memory_from_task(vm_map_read_t src_task, mach_vm_address_t src_address, mach_vm_size_t a3)
{
  target_mach_vm_address_t address = 0;
  vm_prot_t v4 = 1;
  vm_prot_t cur_protection = 0;
  if (mach_vm_remap_new(*MEMORY[0x263EF8C60], &target_address, a3, 0, 33, src_task, src_address, 0, &cur_protection, &v4, 2u))
  {
    return 0;
  }
  else
  {
    return target_address;
  }
}

FILE *open_log_file_from_directory(int a1, char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8C08];
  uint64_t v6 = opendir(a2);
  if (!v6) {
    return 0;
  }
  size_t v7 = v6;
  snprintf(__str, 0x400uLL, "%s%d.", "stack-logs.", a1);
  _platform_strlen();
  while (1)
  {
    uint64_t v8 = readdir(v7);
    if (!v8) {
      break;
    }
    d_name = v8->d_name;
    if (!_platform_strncmp())
    {
      snprintf(v12, 0x400uLL, "%s/%s", a2, d_name);
      uint64_t v10 = open_log_file_at_path(v12, a3);
      goto LABEL_8;
    }
  }
  uint64_t v10 = 0;
LABEL_8:
  closedir(v7);
  return v10;
}

void insert_node(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v31 = a2 >> 2;
  unint64_t v5 = (a2 >> 2) % (v4 - 1);
  uint64_t v6 = *(void **)(a1 + 24);
  uint64_t v7 = v6[2 * v5];
  if (v7) {
    BOOL v8 = v7 == a2;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    LODWORD(v10) = 0;
    unsigned int v11 = *(_DWORD *)(a1 + 16);
    uint64_t v12 = (FILE **)MEMORY[0x263EF8C10];
    unint64_t v13 = v4 / ((2 * v11) | 1);
    do
    {
      uint64_t v10 = (v10 + 1);
      unint64_t v14 = v5 + v13 * v10;
      if (v14 >= v4) {
        unint64_t v15 = v4;
      }
      else {
        unint64_t v15 = 0;
      }
      if (v10 <= v11)
      {
        unint64_t v5 = v14 - v15;
      }
      else
      {
        *(void *)a1 *= 4;
        *(void *)(a1 + 8) = 4 * v4;
        *(_DWORD *)(a1 + 16) = v11 + 3;
        *(void *)(a1 + 24) = malloc_type_calloc(4 * v4, 0x10uLL, 0x1000040451B5BE8uLL);
        if (v4)
        {
          for (uint64_t i = 0; i != v4; ++i)
          {
            int v17 = &v6[2 * i];
            unint64_t v18 = *v17;
            if (*v17)
            {
              LODWORD(v19) = 0;
              unint64_t v20 = *(void *)(a1 + 8);
              unint64_t v21 = (v18 >> 2) % (v20 - 1);
              unsigned int v22 = *(_DWORD *)(a1 + 16);
              uint64_t v23 = *(void *)(a1 + 24);
              while (1)
              {
                uint64_t v24 = *(void *)(v23 + 16 * v21);
                if (v24 == v18)
                {
                  fwrite("impossible collision! two address==address lists! (transfer_node)\n", 0x42uLL, 1uLL, *v12);
                  goto LABEL_23;
                }
                if (!v24) {
                  break;
                }
                uint64_t v19 = (v19 + 1);
                unint64_t v25 = v21 + v20 / ((2 * v22) | 1) * v19;
                if (v25 >= v20) {
                  uint64_t v26 = *(void *)(a1 + 8);
                }
                else {
                  uint64_t v26 = 0;
                }
                unint64_t v21 = v25 - v26;
                if (v19 > v22) {
                  goto LABEL_23;
                }
              }
              *(_OWORD *)(v23 + 16 * v21) = *(_OWORD *)v17;
LABEL_23:
              if (v19 > *(_DWORD *)(a1 + 16)) {
                fprintf(*v12, "reporting bad hash function! disk stack logging reader %lu bit. (transfer_node)\n", 64);
              }
            }
          }
        }
        free(v6);
        LODWORD(v10) = 0;
        unint64_t v4 = *(void *)(a1 + 8);
        unint64_t v5 = v31 % (v4 - 1);
        unsigned int v11 = *(_DWORD *)(a1 + 16);
        uint64_t v6 = *(void **)(a1 + 24);
        unint64_t v13 = v4 / ((2 * v11) | 1);
      }
      uint64_t v27 = v6[2 * v5];
      if (v27) {
        BOOL v28 = v27 == a2;
      }
      else {
        BOOL v28 = 1;
      }
    }
    while (!v28);
  }
  unsigned int v29 = &v6[2 * v5];
  unint64_t *v29 = a2;
  v29[1] = a3;
}

uint64_t initialize_no_footprint_for_debug_flag()
{
  int v16 = 1;
  mach_error_t v0 = sysctlbyname("vm.task_no_footprint_for_debug", 0, 0, &v16, 4uLL);
  if (v0)
  {
    uint64_t v7 = mach_error_string(v0);
    return msl_printf(3, (uint64_t)"could not tag MSL-related memory as no_footprint, so those pages will be included in process footprint - %s\n", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  }
  else
  {
    uint64_t result = msl_printf_nostderr(5, (uint64_t)"enabled tagging MSL-related memory as no_footprint, so those pages will not be included in process footprint\n", v1, v2, v3, v4, v5, v6, v15);
    enabled_no_footprint = 1;
  }
  return result;
}

void set_malloc_stack_logging_start_timestamp()
{
  kern_return_t v0;
  double v1;

  if (!malloc_stack_logging_start_timestamp)
  {
    malloc_stack_logging_start_timestamp = mach_continuous_approximate_time();
    mach_error_t v0 = mach_timebase_info((mach_timebase_info_t)&set_malloc_stack_logging_start_timestamp_mach_time_info);
    uint64_t v1 = 1.0;
    if (!v0 && dword_26774EBD4)
    {
      LODWORD(v1) = set_malloc_stack_logging_start_timestamp_mach_time_info;
      uint64_t v1 = (double)*(unint64_t *)&v1 / (double)dword_26774EBD4;
      if ((*(void *)&v1 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000
        || *(void *)&v1 == 0x7FF0000000000000
        || (unint64_t)(*(void *)&v1 - 1) < 0xFFFFFFFFFFFFFLL
        || *(void *)&v1 == 0)
      {
        uint64_t v1 = 1.0;
      }
    }
    mach_to_ns_factor = *(void *)&v1;
  }
}

uint64_t msl_payload_create(uint64_t a1, int a2, char a3)
{
  if (a1 == -1)
  {
    uint64_t v11 = -256;
    unsigned __int8 v10 = -1;
  }
  else
  {
    double v6 = *(double *)&mach_to_ns_factor
       * (double)(mach_continuous_approximate_time() - malloc_stack_logging_start_timestamp);
    if (a2 && (unint64_t v7 = (unint64_t)(v6 / 1000.0), !(v7 >> 39)))
    {
      uint64_t v12 = (8 * (v7 & 0x7FFFFFFFFFLL)) | (2 * (a3 & 1)) | (a1 << 42);
      unsigned __int8 v10 = (8 * v7) | (2 * (a3 & 1)) | 1;
      uint64_t v11 = v12 & 0xFFFFFFFFFFFFFF00;
    }
    else
    {
      double v8 = v6 / 1000000.0;
      unint64_t v9 = 0x7FFFFFFFLL;
      if ((unint64_t)v8 < 0x7FFFFFFF) {
        unint64_t v9 = (unint64_t)v8;
      }
      unsigned __int8 v10 = (2 * (a3 & 1)) & 7 | (8 * v9);
      uint64_t v11 = (8 * v9) & 0x3FFFFFF00 | (a1 << 34);
    }
  }
  return v11 | v10;
}

void msl_payload_set_in_lite_zone_ptr(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a2 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a2;
  }
  uint64_t v6 = a1 + a4;
  *(void *)(a1 + a4 - 8) = a5;
  if (v5 + 8 > a4) {
    msl_payload_set_in_lite_zone_ptr_cold_1();
  }
  unint64_t v7 = a4 - v5;
  if (a4 - v5 - 8 < 8)
  {
    if (a4 - v5 == 8)
    {
      size_t v8 = 0;
    }
    else
    {
      if (a4 != a3) {
        msl_payload_set_in_lite_zone_ptr_cold_2();
      }
      *(unsigned char *)(v6 - 9) = 2 * (a4 - a2);
      size_t v8 = v7 - 9;
    }
  }
  else
  {
    *(_DWORD *)(v6 - 16) = a3 - a2;
    *(_WORD *)(v6 - 12) = (a3 - a2) >> 32;
    *(unsigned char *)(v6 - 10) = a4 - a3;
    *(unsigned char *)(v6 - 9) = ((a4 - a3) >> 7) | 1;
    size_t v8 = v7 - 16;
  }
  unint64_t v9 = (void *)(v5 + a1);

  bzero(v9, v8);
}

uint64_t msl_payload_get_allocation_timestamp(unint64_t a1)
{
  if (a1 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  if (a1) {
    return malloc_stack_logging_start_timestamp + 1000 * ((a1 >> 3) & 0x7FFFFFFFFFLL);
  }
  return malloc_stack_logging_start_timestamp + 1000000 * ((a1 >> 3) & 0x7FFFFFFF);
}

BOOL msl_payload_is_invalid(uint64_t a1)
{
  return (unint64_t)(a1 + 1) < 2;
}

uint64_t msl_payload_get_uniquing_table_index(unint64_t a1)
{
  char v1 = 42;
  if ((a1 & 1) == 0) {
    char v1 = 34;
  }
  unint64_t v2 = a1 >> v1;
  if (a1 - 1 >= 0xFFFFFFFFFFFFFFFELL) {
    return -1;
  }
  else {
    return v2;
  }
}

uint64_t msl_payload_get_size_info(void *a1, unsigned int *a2, unint64_t *a3, uint64_t *a4)
{
  if (a1 && a2 && ((unint64_t)(*a1 + 1) >= 2 ? (BOOL v4 = (*a1 & 2) == 0) : (BOOL v4 = 1), !v4))
  {
    unint64_t v7 = *((unsigned __int8 *)a2 + 7);
    if (v7)
    {
      unint64_t v8 = *a2 | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 32);
      if (a3) {
        *a3 = v8;
      }
      if (!a4) {
        return 8;
      }
      int v9 = *((unsigned __int8 *)a2 + 7) >> 1;
      if (*((unsigned __int8 *)a2 + 6) | ((v9 & 0x7F) << 8)) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 >= 8;
      }
      uint64_t v5 = 0x8000;
      if (v10) {
        uint64_t v5 = *((unsigned __int8 *)a2 + 6) | ((v9 & 0x7F) << 8);
      }
      uint64_t result = 8;
      goto LABEL_11;
    }
    if (a3) {
      *a3 = v7 >> 1;
    }
    uint64_t result = 1;
    if (a4)
    {
      uint64_t v5 = 0;
LABEL_11:
      *a4 = v5;
    }
  }
  else
  {
    if (a3) {
      *a3 = 8;
    }
    uint64_t v5 = 0;
    uint64_t result = 0;
    if (a4) {
      goto LABEL_11;
    }
  }
  return result;
}

uint64_t msl_payload_get_invalid()
{
  return -1;
}

uint64_t msl_payload_create_from_index(uint64_t a1)
{
  uint64_t v1 = a1 << 34;
  if (a1 == 0xFFFFFFFFLL) {
    uint64_t v1 = -1;
  }
  if (a1 == -1) {
    return -1;
  }
  else {
    return v1;
  }
}

uint64_t msl_payload_from_lite_zone_ptr_internal(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + a1 - 8);
}

uint64_t msl_payload_from_lite_zone_ptr(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3) {
    return *(void *)(a2 + a1 - 8);
  }
  uint64_t result = -1;
  if (a1 && a2 >= 8 && !__CFADD__(a1, a2))
  {
    uint64_t v5 = *(void *)(a2 + a1 - 8);
    BOOL v6 = v5 == -1 || v5 == 0xFFFFFFFFLL;
    uint64_t v7 = v5 << 34;
    if (v6) {
      return -1;
    }
    else {
      return v7;
    }
  }
  return result;
}

uint64_t msl_uniquing_table_enumerate(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 60);
  v4[0] = MEMORY[0x263EF8BF8];
  v4[1] = 0x40000000;
  v4[2] = __msl_uniquing_table_enumerate_block_invoke;
  v4[3] = &unk_264130F58;
  int v5 = (v2 >> 1) & 1;
  v4[4] = a2;
  return uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v4);
}

uint64_t __msl_uniquing_table_enumerate_block_invoke(uint64_t result, void *a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v4 = result;
    uint64_t v5 = a3;
    while (*(_DWORD *)(v4 + 40))
    {
      if ((*a2 & 0xFFFFFFFFFFFFLL) != 0) {
        goto LABEL_5;
      }
LABEL_6:
      a2 += 2;
      if (!--v5) {
        return result;
      }
    }
    if (!*a2) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16))();
    goto LABEL_6;
  }
  return result;
}

uint64_t msl_uniquing_table_get_frames_from_table(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 5;
  if (a2 <= 0xFFFFFFFE)
  {
    uniquing_table_unwind_stack_remote(a1, a2, a3, a5, a4, a6, a7, a8);
    if (*a5) {
      return 0;
    }
    else {
      return 5;
    }
  }
  return v8;
}

uint64_t msl_uniquing_table_sizeof(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0x4000;
  v3[0] = MEMORY[0x263EF8BF8];
  v3[1] = 0x40000000;
  v3[2] = __msl_uniquing_table_sizeof_block_invoke;
  v3[3] = &unk_264130F80;
  void v3[4] = &v4;
  uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __msl_uniquing_table_sizeof_block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 16 * a3;
  return result;
}

mach_vm_address_t msl_uniquing_table_serialize(uint64_t a1, mach_vm_size_t *a2)
{
  mach_vm_size_t v4 = msl_uniquing_table_sizeof(a1);
  *a2 = v4;
  mach_vm_address_t address = 0;
  if (mach_vm_allocate(*MEMORY[0x263EF8C60], &address, v4, 1))
  {
    mach_vm_address_t v5 = 0;
    *a2 = 0;
  }
  else
  {
    mach_vm_address_t v5 = address;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2000000000;
    *(_OWORD *)mach_vm_address_t address = *(_OWORD *)"MslUniquingTable";
    *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
    long long v7 = *(_OWORD *)(a1 + 32);
    long long v6 = *(_OWORD *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 16);
    *(_DWORD *)(v5 + 80) = *(_DWORD *)(a1 + 64);
    *(_OWORD *)(v5 + 48) = v7;
    *(_OWORD *)(v5 + 64) = v6;
    *(_OWORD *)(v5 + 32) = v8;
    v15[3] = v5 + 0x4000;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2000000000;
    uint64_t v14 = 0;
    v10[0] = MEMORY[0x263EF8BF8];
    v10[1] = 0x40000000;
    v10[2] = __msl_uniquing_table_serialize_block_invoke;
    v10[3] = &unk_264130FA8;
    v10[4] = &v11;
    v10[5] = v15;
    uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v10);
    if (v12[3] != *(void *)(a1 + 8)) {
      msl_uniquing_table_serialize_cold_1();
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(v15, 8);
  }
  return v5;
}

void *__msl_uniquing_table_serialize_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a3;
  mach_vm_size_t v5 = 16 * a3;
  uint64_t result = (void *)mach_vm_copy(*MEMORY[0x263EF8C60], (mach_vm_address_t)a2, v5, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (result) {
    uint64_t result = memcpy(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2, v5);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
  return result;
}

char *msl_uniquing_table_copy_from_serialized(uint64_t a1, unint64_t a2)
{
  if (a2 < 0x54 || strncmp((const char *)a1, "MslUniquingTable", 0x10uLL)) {
    return 0;
  }
  mach_vm_size_t v4 = (char *)malloc_type_malloc(0x44uLL, 0x10200402DA45A13uLL);
  *(_OWORD *)mach_vm_size_t v4 = *(_OWORD *)(a1 + 16);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 32);
  *((_DWORD *)v4 + 16) = *(_DWORD *)(a1 + 80);
  *((_OWORD *)v4 + 2) = v6;
  *((_OWORD *)v4 + 3) = v5;
  *((_OWORD *)v4 + 1) = v7;
  uint64_t v8 = *((void *)v4 + 1);
  if (16 * v8 + 0x4000 < a2
    || (int v9 = uniquing_table_chunk_from_slots(a1 + 0x4000, v8), (*(void *)(v4 + 44) = v9) == 0))
  {
    free(v4);
    return 0;
  }
  *((_DWORD *)v4 + 16) = 1;
  return v4;
}

void msl_lock_init()
{
  stack_logging_lock = 0;
  thread_doing_logging = 0;
}

pthread_t __malloc_lock_stack_logging()
{
  os_unfair_lock_lock_with_options();
  pthread_t result = pthread_self();
  thread_doing_logging = (uint64_t)result;
  return result;
}

void __malloc_unlock_stack_logging()
{
  thread_doing_logging = 0;
  int v0 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v1 = v0;
  atomic_compare_exchange_strong_explicit(&stack_logging_lock, (unsigned int *)&v1, 0, memory_order_release, memory_order_relaxed);
  if (v1 != v0) {
    os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
  }
}

BOOL __malloc_stack_logging_is_reentered()
{
  pthread_t v0 = (pthread_t)thread_doing_logging;
  return v0 == pthread_self();
}

BOOL msl_stack_logging_locked()
{
  int v0 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit(&stack_logging_lock, (unsigned int *)&v0, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  BOOL v2 = v0 == 0;
  if (!v0)
  {
    int v3 = *(_DWORD *)(StatusReg + 24);
    int v4 = v3;
    atomic_compare_exchange_strong_explicit(&stack_logging_lock, (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
    if (v4 != v3) {
      os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
    }
  }
  return !v2;
}

void radix_tree_lookup_interval_cold_1()
{
}

void radix_tree_delete_cold_1()
{
}

void radix_tree_insert_recursive_cold_1()
{
}

void radix_tree_insert_recursive_cold_2()
{
}

void radix_tree_insert_recursive_cold_3()
{
  __assert_rtn("set_leaf_size", "radix_tree_internal.h", 129, "leaf_size(tree, node) == size");
}

void radix_tree_insert_recursive_cold_4()
{
}

void radix_tree_delete_recursive_cold_1()
{
}

void radix_tree_delete_recursive_cold_2()
{
}

void radix_tree_delete_recursive_cold_3()
{
}

void radix_tree_init_cold_1()
{
  __assert_rtn("radix_tree_init", "radix_tree.c", 516, "tree->num_nodes >= 3");
}

void radix_tree_init_cold_2()
{
}

void radix_tree_destroy_cold_1()
{
  __assert_rtn("radix_tree_destroy", "radix_tree.c", 578, "result == KERN_SUCCESS");
}

void radix_tree_size_cold_1()
{
}

void radix_tree_lookup_recursive_cold_1()
{
}

void radix_tree_lookup_recursive_cold_2()
{
}

void radix_tree_lookup_recursive_cold_3()
{
}

void radix_tree_lookup_recursive_cold_4()
{
}

void radix_tree_lookup_recursive_cold_5()
{
}

void radix_tree_lookup_recursive_cold_6()
{
}

void radix_tree_lookup_recursive_cold_7()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 201, "size <= edgekeys.size");
}

void radix_tree_lookup_recursive_cold_8()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 199, "keyshift + edge->labelBits == RADIX_TREE_KEY_BITS");
}

void radix_tree_lookup_recursive_cold_9()
{
}

void radix_tree_lookup_recursive_cold_10()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 178, "(key & (mask << shift)) == 0");
}

void radix_tree_lookup_recursive_cold_11()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 176, "(label & ~mask) == 0");
}

void radix_tree_allocate_node_cold_1()
{
}

void radix_tree_free_node_cold_1()
{
}

void uniquing_table_remote_retain_cold_1()
{
  __assert_rtn("uniquing_table_remote_retain", "uniquing_table_reader.c", 237, "table != NULL");
}

void uniquing_table_remote_retain_cold_2()
{
}

void uniquing_table_remote_release_cold_1()
{
}

void uniquing_table_remote_enumerate_chunks_cold_1()
{
  __assert_rtn("uniquing_table_remote_enumerate_chunks", "uniquing_table_reader.c", 263, "enumerator != NULL");
}

void uniquing_table_destroy_husk_exclusive_cold_1()
{
}

void uniquing_table_release_cold_1()
{
  __assert_rtn("uniquing_table_release", "uniquing_table_mutator.c", 445, "previous_refcount >= 1");
}

void uniquing_table_release_cold_2()
{
  __assert_rtn("uniquing_table_release", "uniquing_table_mutator.c", 457, "atomic_load(&table_of_specific_size->refcount) == 0");
}

void msl_get_hash_cache_cold_1()
{
  __assert_rtn("msl_get_hash_cache", "uniquing_table_mutator.c", 812, "hash_cache != NULL");
}

void uniquing_table_stack_retain_internal_cold_1()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 902, "*in_out_parent == UNIQUING_TABLE_INVALID_INDEX || cache_allowed");
}

void uniquing_table_stack_retain_internal_cold_2()
{
}

void uniquing_table_stack_retain_internal_cold_3()
{
  __assert_rtn("uniquing_table_expand", "uniquing_table_mutator.c", 594, "size_info_index >= 0");
}

void uniquing_table_stack_retain_internal_cold_4()
{
  __assert_rtn("uniquing_table_stack_retain_internal", "uniquing_table_mutator.c", 1150, "parent_slot != UNIQUING_TABLE_INVALID_INDEX");
}

void uniquing_table_stack_retain_internal_cold_5()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1079, "input_remaining_frames == thread_local_buffer->cur_cache->num_frames");
}

void uniquing_table_stack_retain_internal_cold_6()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1068, "remaining_frames == checkpoint_remaining_frames");
}

void uniquing_table_stack_retain_internal_cold_7()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1067, "parent == checkpoint_parent");
}

void uniquing_table_stack_retain_internal_cold_8()
{
  __assert_rtn("release_nonzero_slot", "uniquing_table_mutator.c", 659, "sub_result.normal_slot.refcount >= amount");
}

void uniquing_table_stack_retain_internal_cold_11()
{
}

void uniquing_table_stack_retain_internal_cold_14()
{
}

void uniquing_table_stack_retain_internal_cold_15()
{
}

void uniquing_table_retain_cold_1()
{
  __assert_rtn("uniquing_table_retain", "uniquing_table_mutator.c", 571, "updated_index != index");
}

void uniquing_table_node_release_internal_cold_1()
{
  __assert_rtn("uniquing_table_node_release_internal", "uniquing_table_mutator.c", 1275, "previous_refcount >= refs");
}

void create_and_insert_lite_zone_cold_1()
{
  __assert_rtn("create_and_insert_lite_zone", "magazine_lite.c", 728, "active_lite_zone == NULL");
}

void stack_logging_lite_destroy_cold_1()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 569, "active_lite_zone != NULL");
}

void stack_logging_lite_destroy_cold_2()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 579, "deallocate_zone_error == KERN_SUCCESS");
}

void create_log_file_cold_1()
{
}

void msl_payload_set_in_lite_zone_ptr_cold_1()
{
  __assert_rtn("msl_payload_set_in_lite_zone_ptr", "msl_payload.c", 205, "expanded_size >= guaranteed_size + sizeof(msl_payload_t)");
}

void msl_payload_set_in_lite_zone_ptr_cold_2()
{
  __assert_rtn("msl_payload_set_in_lite_zone_ptr", "msl_payload.c", 229, "expanded_size == unexpanded_size");
}

void msl_uniquing_table_serialize_cold_1()
{
  __assert_rtn("msl_uniquing_table_serialize", "msl_uniquing_table_reader_adapter.c", 146, "num_nodes == table->numNodes");
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t _os_once()
{
  return MEMORY[0x270EDDBB0]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x270EDDBC8]();
}

uint64_t _platform_memcmp()
{
  return MEMORY[0x270EDDBD0]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x270EDDBD8]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x270EDDBE0]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x270EDDBE8]();
}

uint64_t _platform_strlcat()
{
  return MEMORY[0x270EDDBF0]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x270EDDBF8]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x270EDDC00]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x270EDDC08]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x270EDDC10]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x270EDDC18]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x270EDDC20]();
}

uint64_t _simple_put()
{
  return MEMORY[0x270EDDC28]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x270EDDC30]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x270EDDC40]();
}

uint64_t _simple_string()
{
  return MEMORY[0x270EDDC48]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x270EDDC58]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270EDD590]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270EDD598](a1, *(void *)&a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270EDCFE0](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270EDD038](a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDD040](*(void *)&a1, a2, a3);
}

int dup(int a1)
{
  return MEMORY[0x270EDD5F8](*(void *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270EDD068](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x270EDD080](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270EDD090](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270EDD0C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270EDD0C8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270EDD0E0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270EDD0F0](__stream, a2, *(void *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270EDD100](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270EDD128](__ptr, __size, __nitems, __stream);
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x270EDD6C8](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270EDD130](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270EDD140]();
}

int isatty(int a1)
{
  return MEMORY[0x270EDD160](*(void *)&a1);
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x270EDD770]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDD780](*(void *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDD790](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x270EDD798](*(void *)&mem_entry, *(void *)&owner, *(void *)&ledger_tag, *(void *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDD7C0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDD838](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x270EDD840](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_copy(vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x270EDD848](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDD850](*(void *)&target, address, size);
}

kern_return_t mach_vm_read(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x270EDD868](*(void *)&target_task, address, size, data, dataCnt);
}

kern_return_t mach_vm_read_overwrite(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x270EDD870](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDD878](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

kern_return_t mach_vm_remap_new(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDD880](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x270EDDAB0](start_size, *(void *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
}

uint64_t malloc_get_thread_options()
{
  return MEMORY[0x270EDDAC0]();
}

void malloc_printf(const char *format, ...)
{
}

uint64_t malloc_register_stack_logger()
{
  return MEMORY[0x270EDDAE0]();
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDDAF8](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB00](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB08](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDDB10](ptr, size, type_id);
}

void malloc_zone_register(malloc_zone_t *zone)
{
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDD188](__dst, __src, __n);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDD8C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDD8C8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDD1C8](a1);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDDC80]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDD900](*(void *)&t, x);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDDC98](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDDCA0](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDDCD8]();
}

uint64_t pthread_self_is_exiting_np()
{
  return MEMORY[0x270EDDCE0]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDDCE8](a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDD200](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDD208](a1, a2);
}

uint64_t sandbox_query_approval_policy_for_path()
{
  return MEMORY[0x270EDDCF8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDD268](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDD9E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDD290](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDD2B8](*(void *)&__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDD2F0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDD320](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD340](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDD348](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDD358](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDD360](a1, a2, a3, a4, a5);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x270EDDA18](*(void *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x270EDDA28](*(void *)&target_task, suspend_token);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x270EDD370]();
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDDA58](a1);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDDA78](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDD3D8](__str, __size, __format, a4);
}