__CFDictionary *__cdecl __main_block_invoke_67(id a1, int a2, __CFDictionary *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  __CFDictionary *v11;

  purge_orphans(1, 1);
  v5 = fsPurgeable(a3, a2);
  v6 = [v5 mutableCopy];

  v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  v8 = evaluateNumberProperty();
  v9 = [v8 unsignedLongLongValue];

  if (!v6) {
    v6 = [(__CFDictionary *)a3 mutableCopy];
  }
  v10 = +[NSNumber numberWithUnsignedLongLong:v9];
  [v6 setObject:v10 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  v11 = (__CFDictionary *)[v6 copy];
  return v11;
}

uint64_t purge_orphans(signed int a1, char a2)
{
  v4 = getRootVolume();
  v5 = +[CacheDeleteVolume volumeWithMountpoint:v4];

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 mountPoint];
    id v8 = [v5 freespace];
    *(_DWORD *)buf = 67109890;
    int v23 = 626;
    __int16 v24 = 1024;
    signed int v25 = a1;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2048;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%d purge_orphans ENTRY urgency: %d : %@ freespace: %llu", buf, 0x22u);
  }
  if ((atomic_exchange(purge_orphans_f, 1u) & 1) == 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __purge_orphans_block_invoke;
    v15[3] = &unk_100008570;
    signed int v16 = a1;
    char v17 = a2;
    v15[4] = &v18;
    iterate_orphans(a1, 0, v15);
    if (os_variant_is_darwinos())
    {
      v9 = CDGetLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v23 = 640;
        __int16 v24 = 1024;
        signed int v25 = a1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%d purge_orphans urgency: %d, clearing /tmp/", buf, 0xEu);
      }

      nuke_dir();
    }
    atomic_store(0, (unsigned __int8 *)purge_orphans_f);
  }
  v10 = CDGetLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v5 mountPoint];
    id v12 = [v5 freespace];
    *(_DWORD *)buf = 67109890;
    int v23 = 645;
    __int16 v24 = 1024;
    signed int v25 = a1;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2048;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%d purge_orphans EXIT urgency: %d : %@ freespace: %llu", buf, 0x22u);
  }
  uint64_t v13 = v19[3];
  _Block_object_dispose(&v18, 8);

  return v13;
}

void sub_100003534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void iterate_orphans(signed int a1, char a2, void *a3)
{
  v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)_MergedGlobals;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412290;
    long long v17 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = objc_msgSend((id)_MergedGlobals, "objectForKeyedSubscript:", v11, v17);
        uint64_t v13 = evaluateNumberProperty();
        unsigned int v14 = [v13 intValue];

        if ((int)(v14 & 0xFFFFFFF7) >= a1) {
          char v15 = 1;
        }
        else {
          char v15 = a2;
        }
        if ((v14 & 0xFFFFFFF7) == a1 || (v15 & 1) == 0)
        {
          signed int v16 = CDGetLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            __int16 v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iterate_orphans calling block: %@", buf, 0xCu);
          }

          v5[2](v5, [v11 UTF8String], (v14 >> 3) & 1);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }
}

uint64_t __purge_orphans_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109634;
    v8[1] = 629;
    __int16 v9 = 1024;
    int v10 = v5;
    __int16 v11 = 2080;
    uint64_t v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d purge_orphans urgency: %d, clearing: %s", (uint8_t *)v8, 0x18u);
  }

  if (*(unsigned char *)(a1 + 44)) {
    return nuke_dir();
  }
  uint64_t v7 = size_dir();
  nuke_dir();
  uint64_t result = size_dir();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v7 - result;
  return result;
}

id fsPurgeable(void *a1, int32_t a2)
{
  id v3 = a1;
  uint64_t v94 = 0;
  memset(v93, 0, sizeof(v93));
  memset(v92, 0, sizeof(v92));
  v89 = objc_opt_new();
  v4 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v5 = evaluateStringProperty();
  id v6 = mapVolume();

  if (!v6)
  {
    uint64_t v13 = CDGetLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No volume specified, returning NULL dictionary", (uint8_t *)&buf, 2u);
    }
    id v88 = 0;
    goto LABEL_44;
  }
  if ((a2 - 5) >= 0xFFFFFFFC) {
    int32_t v7 = a2;
  }
  else {
    int32_t v7 = 3;
  }
  uint64_t v8 = dword_100006E90[v7 - 1];
  *(void *)&v92[0] = 12;
  *((void *)&v92[0] + 1) = v8;
  __int16 v9 = CDGetLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 67109376;
    buf.int32_t f_iosize = v7;
    LOWORD(buf.f_blocks) = 2048;
    *(uint64_t *)((char *)&buf.f_blocks + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Reguesting fsPurgeable for urgency %d with APFS_PURGEABLE urgency %0llx", (uint8_t *)&buf, 0x12u);
  }

  int v10 = (void *)os_transaction_create();
  id v11 = v6;
  if (fsctl((const char *)[v11 UTF8String], 0xC0E84A70uLL, v92, 0))
  {
    if (*__error() != 45)
    {
      uint64_t v12 = CDGetLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_47:
        v40 = __error();
        v41 = strerror(*v40);
        buf.f_bsize = 136315138;
        *(void *)&buf.int32_t f_iosize = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "APFSIOC_PURGEABLE_GET_DETAILED_STATS: %s", (uint8_t *)&buf, 0xCu);
      }
LABEL_31:

      id v88 = 0;
      goto LABEL_42;
    }
    *(void *)&v92[0] = 4;
    if (fsctl((const char *)[v11 UTF8String], 0xC0E84A70uLL, v92, 0))
    {
      uint64_t v12 = CDGetLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      goto LABEL_31;
    }
  }
  v80 = v10;
  v81 = v6;
  id v82 = v3;
  id v88 = (id)objc_opt_new();
  uint64_t v14 = 0;
  char v15 = (uint64_t *)v93;
  do
  {
    signed int v16 = +[NSNumber numberWithInt:v14];
    long long v17 = serviceForFSPurgeableType();

    if (v17)
    {
      uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:*v15];
      [v89 setObject:v18 forKeyedSubscript:v17];

      if (!v14)
      {
        long long v19 = +[NSNumber numberWithUnsignedLongLong:*v15];
        [v88 setObject:v19 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      }
      long long v20 = CDGetLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *v15;
        uint64_t v22 = *(v15 - 13);
        buf.f_bsize = 67109890;
        buf.int32_t f_iosize = v14;
        LOWORD(buf.f_blocks) = 2114;
        *(uint64_t *)((char *)&buf.f_blocks + 2) = (uint64_t)v17;
        WORD1(buf.f_bfree) = 2048;
        *(uint64_t *)((char *)&buf.f_bfree + 4) = v21;
        WORD2(buf.f_bavail) = 2048;
        *(uint64_t *)((char *)&buf.f_bavail + 6) = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[%d] fsPurgeable type: %{public}@, count: %lld bytes for %lld files", (uint8_t *)&buf, 0x26u);
      }
    }
    ++v14;
    ++v15;
  }
  while (v14 != 13);
  id v23 = v11;
  __int16 v24 = (const char *)[v23 UTF8String];
  memset(&buf, 0, 36);
  *(_OWORD *)v106 = xmmword_100006EA0;
  *(void *)&long long v107 = 0;
  int v25 = open(v24, 0x100000);
  if (v25 == -1) {
    goto LABEL_41;
  }
  int v26 = v25;
  if (fgetattrlist(v25, v106, &buf, 0x24uLL, 0) < 0) {
    goto LABEL_41;
  }
  int f_bfree_high = HIDWORD(buf.f_bfree);
  int32_t f_iosize = buf.f_iosize;
  close(v26);
  if ((f_bfree_high & 0x4000000) == 0 || (f_iosize & 0x4000000) == 0) {
    goto LABEL_41;
  }
  id v29 = &CDGetLogHandle_ptr;
  v30 = (const char *)[v23 UTF8String];
  uint64_t v99 = 0x1D4C000000000;
  bzero(&buf, 0x878uLL);
  if (statfs(v30, &buf))
  {
    v31 = CDGetLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_29:

      uint64_t v32 = 0;
      goto LABEL_40;
    }
    *(_DWORD *)v106 = 67109120;
    *(_DWORD *)&v106[4] = 0;
    v42 = "statfs returned %d";
    v43 = v31;
    uint32_t v44 = 8;
LABEL_101:
    _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v42, v106, v44);
    goto LABEL_29;
  }
  v33 = (char *)malloc_type_malloc(0x1D4C0uLL, 0x1000040504FFAC1uLL);
  if (!v33)
  {
    v31 = CDGetLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)v106 = 134217984;
    *(void *)&v106[4] = 120000;
    v42 = "can't malloc %llu bytes";
    v43 = v31;
    uint32_t v44 = 12;
    goto LABEL_101;
  }
  v34 = v33;
  uint64_t v95 = 0x100000001;
  v100 = v33;
  uint64_t v96 = 0;
  id v97 = 0;
  long long v98 = xmmword_100006E80;
  int v35 = fsctl(buf.f_mntonname, 0xC0384A74uLL, &v95, 0);
  if (v35)
  {
    int v36 = v35;
    uint64_t v32 = 0;
    goto LABEL_36;
  }
  id v90 = 0;
  v78 = v30;
  uint64_t v32 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  int v47 = 1;
  do
  {
    unint64_t v48 = HIDWORD(v99);
    if (HIDWORD(v99)) {
      BOOL v49 = 1;
    }
    else {
      BOOL v49 = v46 == 0;
    }
    if (!v49)
    {
      if (v47) {
        uint64_t v75 = v45;
      }
      else {
        uint64_t v75 = 0;
      }
      v32 += v75;
      id v6 = v81;
      id v3 = v82;
      goto LABEL_39;
    }
    if (HIDWORD(v99) < 0x18)
    {
      id v6 = v81;
      id v3 = v82;
      if (!HIDWORD(v99))
      {
        v76 = CDGetLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v106 = 136315138;
          *(void *)&v106[4] = v78;
          _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "processCloneMapOnVol buffSize 0 : No clones in volume %s", v106, 0xCu);
        }
      }
      goto LABEL_39;
    }
    if (HIDWORD(v99) != 24)
    {
      uint64_t v51 = 0;
      v83 = v100;
      int v52 = 24;
      unint64_t v79 = HIDWORD(v99);
      while (1)
      {
        v53 = (uint64_t *)&v83[v51];
        if (v47) {
          uint64_t v54 = v45;
        }
        else {
          uint64_t v54 = 0;
        }
        uint64_t v55 = v54 + v32;
        uint64_t v50 = *v53;
        uint64_t v45 = v53[1];
        if (*v53 == v46) {
          int v56 = v47;
        }
        else {
          int v56 = 1;
        }
        if (*v53 == v46) {
          uint64_t v55 = v32;
        }
        if (v46)
        {
          int v47 = v56;
          uint64_t v32 = v55;
        }
        uint64_t v91 = v53[2];
        if (v91) {
          break;
        }
LABEL_97:
        uint64_t v51 = (v52 + 32 * v91);
        int v52 = v51 + 24;
        uint64_t v46 = v50;
        if (v51 + 24 >= v48) {
          goto LABEL_98;
        }
      }
      int v84 = v52;
      uint64_t v85 = *v53;
      uint64_t v86 = v53[1];
      uint64_t v87 = v32;
      uint64_t v57 = 0;
      while (1)
      {
        v58 = &v53[4 * v57];
        id v90 = (id)v58[3];
        uint64_t v60 = v58[5];
        uint64_t v59 = v58[6];
        if (v60) {
          break;
        }
        int v66 = v59 & 1;
LABEL_85:
        v47 &= v66;
        if (++v57 == v91)
        {
          uint64_t v45 = v86;
          uint64_t v32 = v87;
          unint64_t v48 = v79;
          int v52 = v84;
          uint64_t v50 = v85;
          goto LABEL_97;
        }
      }
      v61 = [v29[88] numberWithUnsignedLongLong:v58[5]];
      if (qword_10000C120 != -1) {
        dispatch_once(&qword_10000C120, &__block_literal_global_113);
      }
      v62 = (void *)qword_10000C118;
      v63 = [v29[88] numberWithUnsignedLongLong:v60];
      v64 = [v62 objectForKey:v63];

      if (v64)
      {
        unsigned int v65 = [v64 BOOLValue];
      }
      else
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        *(void *)v106 = 1;
        *(void *)&v106[8] = 33;
        *(void *)&long long v108 = v60;
        if (!fsctl(buf.f_mntonname, 0xC1104A71uLL, v106, 0))
        {
          while (1)
          {
            unint64_t v69 = *(void *)&v106[8];
            if ((v106[8] & 8) != 0) {
              break;
            }
            uint64_t v67 = *((void *)&v108 + 1);
            if (!*((void *)&v108 + 1))
            {
              v70 = CDGetLogHandle();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v102 = 134217984;
                uint64_t v103 = v60;
                _os_log_debug_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Finished checking dirstat key %llu", v102, 0xCu);
              }

              break;
            }
            long long v121 = 0u;
            long long v122 = 0u;
            long long v119 = 0u;
            long long v120 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v107 = 0u;
            long long v108 = 0u;
            *(void *)v106 = 1;
            *(void *)&v106[8] = 33;
            *(void *)&long long v108 = v67;
            if (fsctl(buf.f_mntonname, 0xC1104A71uLL, v106, 0)) {
              goto LABEL_80;
            }
          }
          uint64_t v71 = (v69 >> 3) & 1;
          id v29 = &CDGetLogHandle_ptr;
          v72 = +[NSNumber numberWithBool:v71];
          if (v72) {
            [(id)qword_10000C118 setObject:v72 forKey:v61];
          }
          unsigned int v65 = [v72 BOOLValue];

          goto LABEL_84;
        }
        uint64_t v67 = v60;
LABEL_80:
        v68 = CDGetLogHandle();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          int v73 = *__error();
          *(_DWORD *)v102 = 134218240;
          uint64_t v103 = v67;
          __int16 v104 = 1024;
          int v105 = v73;
          _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "APFSIOC_DIR_STATS_OP for %llu returned errno %u", v102, 0x12u);
        }

        unsigned int v65 = 0;
      }
      id v29 = &CDGetLogHandle_ptr;
LABEL_84:

      int v66 = v65 | v59;
      goto LABEL_85;
    }
    uint64_t v50 = v46;
LABEL_98:
    uint64_t v96 = v50;
    id v97 = v90;
    HIDWORD(v99) = 120000;
    int v74 = fsctl(buf.f_mntonname, 0xC0384A74uLL, &v95, 0);
    uint64_t v46 = v50;
  }
  while (!v74);
  int v36 = v74;
  id v6 = v81;
  id v3 = v82;
LABEL_36:
  v37 = CDGetLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    int v77 = *__error();
    *(_DWORD *)v106 = 67109632;
    *(_DWORD *)&v106[4] = v36;
    *(_WORD *)&v106[8] = 1024;
    *(_DWORD *)&v106[10] = v77;
    *(_WORD *)&v106[14] = 1024;
    LODWORD(v107) = HIDWORD(v99);
    _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "err %d, errno %d, buffer_size %u", v106, 0x14u);
  }

LABEL_39:
  free(v34);
LABEL_40:
  v38 = +[NSNumber numberWithUnsignedLongLong:v32];
  [v89 setObject:v38 forKeyedSubscript:@"CACHE_DELETE_PURGEABLE_CLONES"];

LABEL_41:
  [v88 setObject:v89 forKeyedSubscript:@"CACHE_DELETE_ITEMIZED_PURGEABLE"];
  int v10 = v80;
LABEL_42:

  uint64_t v13 = CDGetLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    buf.f_bsize = 138543362;
    *(void *)&buf.int32_t f_iosize = v88;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "fsPurgeable: %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_44:

  return v88;
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)&off_100008A40;

  if (qword_10000C110 != -1) {
    dispatch_once(&qword_10000C110, &__block_literal_global_90);
  }
  CacheDeleteRegisterInfoCallbacks();
  char is_darwinos = os_variant_is_darwinos();
  xpc_activity_register("com.apple.deleted_helper.daily", XPC_ACTIVITY_CHECK_IN, &__block_literal_global);
  id v6 = dispatch_get_global_queue(17, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __main_block_invoke_47;
  handler[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  char v13 = is_darwinos;
  xpc_set_event_stream_handler("com.apple.dispatch.vfs", v6, handler);

  if ((is_darwinos & 1) == 0) {
    CacheDeleteRegisterInfoCallbacks();
  }
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  uint64_t v8 = (void *)qword_10000C0F8;
  qword_10000C0F8 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C0F8, &__block_literal_global_85);
  dispatch_resume((dispatch_object_t)qword_10000C0F8);
  signal(3, (void (__cdecl *)(int))1);
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0, 0);
  int v10 = (void *)qword_10000C0F0;
  qword_10000C0F0 = (uint64_t)v9;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C0F0, &__block_literal_global_88);
  dispatch_resume((dispatch_object_t)qword_10000C0F0);
  dispatch_main();
}

void __main_block_invoke(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  id v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    int v9 = 758;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%d com.apple.deleted_helper.daily xpc activity handler ENTRY", (uint8_t *)&v8, 8u);
  }

  v4 = (void *)os_transaction_create();
  xpc_activity_state_t state = xpc_activity_get_state(v2);

  if (state == 2)
  {
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      int v9 = 763;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%d com.apple.deleted_helper.daily xpc activity handler calling purge_orphans(kCacheDeleteUrgencyLow)", (uint8_t *)&v8, 8u);
    }

    purge_orphans(1, 1);
  }
  dispatch_source_t v7 = CDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    int v9 = 766;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d com.apple.deleted_helper.daily xpc activity handler EXIT", (uint8_t *)&v8, 8u);
  }
}

void __main_block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    v4 = CDGetLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 67109376;
      int v13 = 773;
      __int16 v14 = 2048;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d com.apple.dispatch.vfs xpc stream handler ENTRY, event: %p", buf, 0x12u);
    }

    xpc_dictionary_apply(v3, &__block_literal_global_51);
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = __main_block_invoke_53;
    activity_block[3] = &unk_100008378;
    id v9 = (id)os_transaction_create();
    id v5 = v3;
    id v10 = v5;
    char v11 = *(unsigned char *)(a1 + 32);
    id v6 = v9;
    _os_activity_initiate((void *)&_mh_execute_header, "com.apple.deleted_helper.handle_vfs_xpc", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    dispatch_source_t v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 67109376;
      int v13 = 819;
      __int16 v14 = 2048;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%d com.apple.dispatch.vfs xpc stream handler EXIT, event: %p", buf, 0x12u);
    }
  }
}

BOOL __main_block_invoke_48(id a1, const char *a2, OS_xpc_object *a3)
{
  v4 = a3;
  id v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = a2;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\tkey: %s, value: %@", (uint8_t *)&v7, 0x16u);
  }

  return 1;
}

void __main_block_invoke_53(uint64_t a1)
{
  v1 = lowSpaceVolumes();
  v2 = objc_opt_new();
  int v26 = getRootVolume();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v1;
  id v3 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        int v8 = [obj objectForKeyedSubscript:v7];
        id v9 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v29;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v29 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
              [v2 addObject:v13];
            }
            id v10 = [v8 countByEnumeratingWithState:&v28 objects:v44 count:16];
          }
          while (v10);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v4);
  }

  unsigned int v14 = [v2 containsObject:v26];
  id v15 = CDGetLogHandle();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)statfs buf = 134218242;
      *(void *)v41 = v24;
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = v2;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping low disk event %p for %@", buf, 0x16u);
    }
    goto LABEL_27;
  }
  if (v16)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v18 = "YES";
    }
    else {
      uint64_t v18 = "NO";
    }
    *(_DWORD *)statfs buf = 67109890;
    *(_DWORD *)v41 = 800;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = v17;
    *(_WORD *)&v41[14] = 2080;
    *(void *)&v41[16] = v18;
    __int16 v42 = 1024;
    int v43 = 4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%d com.apple.dispatch.vfs xpc stream handler calling purge_orphans event: %p, darwin: %s, urgency: %d", buf, 0x22u);
  }

  purge_orphans(4, 1);
  if (*(unsigned char *)(a1 + 48))
  {
    CFStringRef v38 = @"CACHE_DELETE_VOLUME";
    v39 = v26;
    id v15 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    long long v19 = fsPurgeable(v15, 4);
    uint64_t v20 = [v19 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v21 = (void *)v20;
    if (v20)
    {
      v36[0] = @"CACHE_DELETE_VOLUME";
      v36[1] = @"CACHE_DELETE_AMOUNT";
      v37[0] = v26;
      v37[1] = v20;
      uint64_t v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
      id v23 = fsPurge(v22, 4);
    }
LABEL_27:
  }
}

id fsPurge(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 67109378;
    *(_DWORD *)id v90 = a2;
    *(_WORD *)&v90[4] = 2112;
    *(void *)&v90[6] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fsPurge: urgency %d, info: %@", buf, 0x12u);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  id v5 = [v3 mutableCopy];
  id v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  uint64_t v7 = evaluateStringProperty();
  int v8 = mapVolume();

  id v9 = +[CacheDeleteVolume volumeWithPath:v8];
  id v10 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v11 = evaluateNumberProperty();

  uint64_t v12 = [v3 objectForKeyedSubscript:@"CACHE_DELETE_SERVICES"];
  id v82 = (void *)v12;
  if (v8 && v11)
  {
    int v13 = (void *)v12;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v75 = (void *)os_transaction_create();
    if ([v13 count])
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      unsigned int v14 = v13;
      id v69 = [v14 countByEnumeratingWithState:&v83 objects:v93 count:16];
      if (!v69)
      {
        uint64_t v55 = v11;

        uint64_t v54 = &off_100008958;
        goto LABEL_57;
      }
      v80 = v11;
      uint64_t v72 = *(void *)v84;
      uint64_t v70 = a2;
      uint64_t v71 = (int)a2 + 4;
      id v15 = &off_100008958;
      int v16 = -1;
      id v76 = v5;
      v68 = v14;
      do
      {
        for (i = 0; i != v69; i = (char *)i + 1)
        {
          if (*(void *)v84 != v72) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          LODWORD(v87) = dword_100006EB8[v71] | 0x11;
          v78 = fsPurgeableTypeForService();
          if (v78)
          {
            long long v19 = v15;
            uint64_t v20 = CDGetLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v21 = [v78 unsignedIntValue];
              *(_DWORD *)statfs buf = 138412802;
              *(void *)id v90 = v18;
              *(_WORD *)&v90[8] = 1024;
              *(_DWORD *)&v90[10] = v21;
              *(_WORD *)&v90[14] = 2112;
              *(void *)&v90[16] = v80;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "fsPurge: adding service %@ (%u), amount: %@", buf, 0x1Cu);
            }

            LODWORD(v87) = v87 | 2;
            DWORD1(v87) = [v78 unsignedIntValue];
            uint64_t v22 = [v9 freespace];
            id v23 = [v80 unsignedLongLongValue];
            int v24 = 1;
            while (1)
            {
              *((void *)&v88 + 1) = v23;
              int v16 = fsctl((const char *)[v8 UTF8String], 0xC0204A45uLL, &v87, 0);
              if (v16) {
                break;
              }
              id v25 = [v9 freespace];
              char v26 = shouldRetryPurge((unint64_t)v22, (unint64_t)v25, (unint64_t)v23, *((unint64_t *)&v88 + 1), v24++);
              if ((v26 & 1) == 0)
              {
                id v73 = v3;
                v27 = [v9 freespace];
                long long v28 = v27;
                if (v27 != (unsigned char *)-1 && v27 > v22) {
                  int64_t v30 = v27 - v22;
                }
                else {
                  int64_t v30 = 0;
                }
                long long v31 = (char *)[v19 unsignedLongLongValue];
                int64_t v32 = *((void *)&v88 + 1);
                int64_t v67 = v30;
                if (v24 != 2) {
                  int64_t v32 = v30;
                }
                long long v33 = +[NSNumber numberWithUnsignedLongLong:&v31[v32]];

                long long v34 = CDGetLogHandle();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  id v35 = [v33 unsignedLongLongValue];
                  *(_DWORD *)statfs buf = 134218496;
                  *(void *)id v90 = v35;
                  *(_WORD *)&v90[8] = 2048;
                  *(void *)&v90[10] = v28;
                  *(_WORD *)&v90[18] = 2048;
                  *(void *)&v90[20] = v22;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "fsPurge: amountPurged %llu postPurgeFreespace %llu prePurgeFreespace %llu", buf, 0x20u);
                }

                id v36 = [v80 unsignedLongLongValue];
                if (v36 > [v33 unsignedLongLongValue])
                {
                  v37 = (char *)[v80 unsignedLongLongValue];
                  int64_t v38 = *((void *)&v88 + 1);
                  if (v24 != 2) {
                    int64_t v38 = v67;
                  }
                  uint64_t v39 = +[NSNumber numberWithUnsignedLongLong:&v37[-v38]];

                  int v16 = 0;
                  id v15 = (_UNKNOWN **)v33;
                  v80 = (void *)v39;
                  id v3 = v73;
                  id v5 = v76;
                  unsigned int v14 = v68;
                  goto LABEL_31;
                }
                id v15 = (_UNKNOWN **)v33;
                id v3 = v73;
                id v5 = v76;
LABEL_38:

                uint64_t v11 = v80;
                unsigned int v14 = v68;
                goto LABEL_53;
              }
            }
            id v5 = v76;
            goto LABEL_38;
          }
LABEL_31:
        }
        id v69 = [v14 countByEnumeratingWithState:&v83 objects:v93 count:16];
      }
      while (v69);
      uint64_t v11 = v80;
    }
    else
    {
      int v43 = [v9 freespace];
      id v44 = [v11 unsignedLongLongValue];
      int v45 = 0;
      uint64_t v70 = a2;
      LODWORD(v87) = dword_100006EB8[(int)a2 + 4] | 0x11;
      do
      {
        *((void *)&v88 + 1) = v44;
        int v16 = fsctl((const char *)[v8 UTF8String], 0xC0204A45uLL, &v87, 0);
        if (v16) {
          break;
        }
        id v46 = [v9 freespace];
        ++v45;
      }
      while ((shouldRetryPurge((unint64_t)v43, (unint64_t)v46, (unint64_t)v44, *((unint64_t *)&v88 + 1), v45) & 1) != 0);
      int v47 = [v9 freespace];
      unint64_t v48 = v47;
      int64_t v49 = v47 - v43;
      if (v47 == (unsigned char *)-1 || v47 <= v43) {
        int64_t v49 = 0;
      }
      if (v45 >= 2) {
        int64_t v51 = v49;
      }
      else {
        int64_t v51 = *((void *)&v88 + 1);
      }
      id v15 = +[NSNumber numberWithUnsignedLongLong:v51];
      int v52 = CDGetLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = [v15 unsignedLongLongValue];
        *(_DWORD *)statfs buf = 134218496;
        *(void *)id v90 = v53;
        *(_WORD *)&v90[8] = 2048;
        *(void *)&v90[10] = v48;
        *(_WORD *)&v90[18] = 2048;
        *(void *)&v90[20] = v43;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "fsPurge: amountPurged %llu postPurgeFreespace %llu prePurgeFreespace %llu", buf, 0x20u);
      }
      unsigned int v14 = v52;
    }
LABEL_53:

    if (!v16)
    {
      [v5 setObject:v15 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      v41 = 0;
      LODWORD(a2) = v70;
LABEL_60:

      uint64_t v60 = CDGetLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        id v79 = [v15 unsignedLongLongValue];
        v81 = v11;
        int v61 = v87;
        v62 = v15;
        id v63 = [v8 UTF8String];
        [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
        v64 = id v74 = v3;
        evaluateStringProperty();
        unsigned int v65 = v77 = v5;
        *(_DWORD *)statfs buf = 134219010;
        *(void *)id v90 = v79;
        *(_WORD *)&v90[8] = 1024;
        *(_DWORD *)&v90[10] = a2;
        *(_WORD *)&v90[14] = 1024;
        *(_DWORD *)&v90[16] = v61;
        uint64_t v11 = v81;
        *(_WORD *)&v90[20] = 2082;
        *(void *)&v90[22] = v63;
        id v15 = v62;
        __int16 v91 = 2114;
        v92 = v65;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "fsPurge: %llu at urgency %d (flags: 0x%x) on %{public}s (%{public}@)", buf, 0x2Cu);

        id v3 = v74;
        id v5 = v77;
      }

      id v42 = v5;
      goto LABEL_63;
    }
    uint64_t v54 = v15;
    uint64_t v55 = v11;
    a2 = v70;
LABEL_57:
    uint64_t v56 = v87;
    id v57 = [v8 UTF8String];
    v58 = __error();
    v41 = +[NSString stringWithFormat:@"APFSIOC_PURGE_FILES failed: %@ at urgency %d (0x%x) on %s : %s", v54, a2, v56, v57, strerror(*v58)];
    uint64_t v59 = CDGetLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 138543362;
      *(void *)id v90 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    [v5 setObject:v41 forKeyedSubscript:@"CACHE_DELETE_ERROR"];
    [v5 setObject:&off_100008958 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v11 = v55;
    id v15 = v54;
    goto LABEL_60;
  }
  v40 = CDGetLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)statfs buf = 138412290;
    *(void *)id v90 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Parameter error, incomplete info dict: %@", buf, 0xCu);
  }

  v41 = 0;
  id v42 = 0;
  id v15 = &off_100008958;
LABEL_63:

  return v42;
}

__CFDictionary *__cdecl __main_block_invoke_2(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v4 = *(void *)&a2;
  if (qword_10000C108 != -1) {
    dispatch_once(&qword_10000C108, &__block_literal_global_75);
  }
  if (qword_10000C100)
  {
    if (v4 == 4)
    {
      id v5 = objc_alloc_init((Class)qword_10000C100);
      unsigned int v6 = [v5 submit];
      uint64_t v7 = CDGetLogHandle();
      int v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)statfs buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Osanalytics logs submitted successfully.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v19 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to submit osanalytics logs.", v19, 2u);
      }

      goto LABEL_15;
    }
LABEL_11:
    purge_orphans(v4, 1);
    goto LABEL_15;
  }
  id v9 = CDGetLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to get OSASubmissionClient NSClassFromString:OSASubmissionClient", v18, 2u);
  }

  if (v4 != 4) {
    goto LABEL_11;
  }
LABEL_15:
  id v10 = fsPurge(a3, v4);
  id v11 = [v10 mutableCopy];

  uint64_t v12 = [v11 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  int v13 = evaluateNumberProperty();
  id v14 = [v13 unsignedLongLongValue];

  if (!v11) {
    id v11 = [(__CFDictionary *)a3 copy];
  }
  id v15 = +[NSNumber numberWithUnsignedLongLong:v14];
  [v11 setObject:v15 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  int v16 = (__CFDictionary *)[v11 copy];
  return v16;
}

void __main_block_invoke_3(id a1)
{
  qword_10000C100 = (uint64_t)NSClassFromString(@"OSASubmissionClient");
}

__CFDictionary *__cdecl __main_block_invoke_80(id a1, int a2, __CFDictionary *a3)
{
  id v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)statfs buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PERIODIC ENTRY", buf, 2u);
  }

  purge_orphans(3, 1);
  uint64_t v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)statfs buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "customerReleaseBuild IS NOT SEED BUILD", buf, 2u);
  }

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  unsigned int v6 = CDGetLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (has_internal_diagnostics)
  {
    if (v7)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "customerReleaseBuild IS INTERNAL BUILD", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "customerReleaseBuild IS NOT INTERNAL BUILD", buf, 2u);
    }

    int v8 = CDGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "unable to get address of MGGetBoolAnswer", buf, 2u);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [&off_100008A68 countByEnumeratingWithState:&v16 objects:buf count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(&off_100008A68);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v14 = CDGetLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v20 = 138412290;
            uint64_t v21 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Customer build, clearing %@", v20, 0xCu);
          }

          traverse_directory();
        }
        id v10 = [&off_100008A68 countByEnumeratingWithState:&v16 objects:buf count:16];
      }
      while (v10);
    }
  }
  return 0;
}

void __main_block_invoke_83(id a1)
{
  v1 = CDGetLogHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "RECEIVED SIGTERM", v2, 2u);
  }

  exit(0);
}

void __main_block_invoke_2_86(id a1)
{
  v1 = CDGetLogHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "RECEIVED SIGQUIT", v2, 2u);
  }

  exit(0);
}

void sub_1000060CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_3(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)&RegisterCacheDeleteOrphanDirHandlerService_orphan_dir_iteration_flag, 1u) & 1) == 0)
  {
    signed int v1 = *(_DWORD *)(a1 + 40);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_4;
    v2[3] = &unk_100008500;
    v2[4] = *(void *)(a1 + 32);
    signed int v3 = v1;
    iterate_orphans(v1, 1, v2);
    atomic_store(0, (unsigned __int8 *)&RegisterCacheDeleteOrphanDirHandlerService_orphan_dir_iteration_flag);
  }
}

void __RegisterCacheDeleteOrphanDirHandlerService_block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += size_dir();
  uint64_t v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v7[0] = 67109890;
    v7[1] = 671;
    __int16 v8 = 1024;
    int v9 = v5;
    __int16 v10 = 2080;
    uint64_t v11 = a2;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%d purgeable orphans urgency: %d, path: %s size: %lld ", (uint8_t *)v7, 0x22u);
  }
}

void __getPurgeableInfoByDirKey_block_invoke(id a1)
{
  qword_10000C118 = +[NSMutableDictionary dictionaryWithCapacity:100];
  _objc_release_x1();
}

uint64_t shouldRetryPurge(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5)
{
  if (a2 >= a1) {
    unint64_t v5 = a2 - a1;
  }
  else {
    unint64_t v5 = 0;
  }
  if (v5 >= a3) {
    return 0;
  }
  uint64_t result = 0;
  if (a5 <= 4 && (double)a4 * 0.3 > (double)v5)
  {
    int v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218496;
      unint64_t v11 = v5;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      __int16 v14 = 2048;
      unint64_t v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "APFS freed much less than reported - suggesting a retry. Actually Freed (%llu), Requested (%llu), Reported (%llu).", (uint8_t *)&v10, 0x20u);
    }

    return 1;
  }
  return result;
}

BOOL __periodic_block_invoke(id a1, const char *a2, $73E2D91FB0D0F26A7F30E74A8C023B7C *a3)
{
  if (a3->var0) {
    a3->var1 = 1;
  }
  else {
    unlink(a2);
  }
  return 1;
}

uint64_t CDGetLogHandle()
{
  return _CDGetLogHandle();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

uint64_t evaluateNumberProperty()
{
  return _evaluateNumberProperty();
}

uint64_t evaluateStringProperty()
{
  return _evaluateStringProperty();
}

void exit(int a1)
{
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

void free(void *a1)
{
}

uint64_t fsPurgeableTypeForService()
{
  return _fsPurgeableTypeForService();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

uint64_t getRootVolume()
{
  return _getRootVolume();
}

uint64_t lowSpaceVolumes()
{
  return _lowSpaceVolumes();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint64_t mapVolume()
{
  return _mapVolume();
}

uint64_t nuke_dir()
{
  return _nuke_dir();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

uint64_t serviceForFSPurgeableType()
{
  return _serviceForFSPurgeableType();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t size_dir()
{
  return _size_dir();
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t traverse_directory()
{
  return _traverse_directory();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_freespace(void *a1, const char *a2, ...)
{
  return [a1 freespace];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_submit(void *a1, const char *a2, ...)
{
  return [a1 submit];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_volumeWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeWithPath:");
}