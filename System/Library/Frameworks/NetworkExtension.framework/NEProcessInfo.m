@interface NEProcessInfo
+ (BOOL)is64bitCapable;
+ (id)copyDNSUUIDs;
+ (id)copyNEHelperUUIDs;
+ (id)copyUUIDsForBundleID:(id)a3 uid:(unsigned int)a4;
+ (id)copyUUIDsForExecutable:(id)a3;
+ (id)copyUUIDsForExecutableWithoutCache:(id)a3;
+ (id)copyUUIDsForPID:(int)a3;
+ (id)copyUUIDsFromExecutable:(uint64_t)a1;
+ (uint64_t)copyUUIDForSingleArch:(uint64_t)a1;
+ (void)clearUUIDCache;
+ (void)initGlobals;
- (NEProcessInfo)init;
@end

@implementation NEProcessInfo

+ (uint64_t)copyUUIDForSingleArch:(uint64_t)a1
{
  v16[2] = *MEMORY[0x1E4F143B8];
  self;
  v8[0] = 0;
  v8[1] = 0;
  int v10 = 0;
  uint64_t v9 = 0;
  uint64_t v3 = 0;
  if (read(a2, v8, 0x1CuLL) == 28)
  {
    if (LODWORD(v8[0]) == -17958193) {
      lseek(a2, 4, 1);
    }
    if (v9)
    {
      for (unint64_t i = 0; i < v9; ++i)
      {
        uint64_t v7 = 0;
        if (read(a2, &v7, 8uLL) != 8) {
          break;
        }
        if (v7 == 27)
        {
          uint64_t v15 = 0;
          v16[0] = 0;
          v16[1] = 0;
          uint64_t v3 = 0;
          if (read(a2, v16, 0x10uLL) == 16)
          {
            uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v16];
            v6 = ne_log_obj();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v12 = "+[NEProcessInfo copyUUIDForSingleArch:]";
              __int16 v13 = 2112;
              uint64_t v14 = v3;
              _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%s: got UUID %@", buf, 0x16u);
            }
          }
          return v3;
        }
        lseek(a2, HIDWORD(v7) - 8, 1);
      }
    }
    return 0;
  }
  return v3;
}

+ (id)copyUUIDsForExecutable:(id)a3
{
  id v3 = a3;
  +[NEProcessInfo initGlobals]();
  id v4 = 0;
  if (v3 && g_executableUUIDMapping)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = g_queue;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke;
    v12 = &unk_1E5992328;
    id v13 = v3;
    id v7 = v5;
    id v14 = v7;
    dispatch_sync(v6, &v9);
    if (objc_msgSend(v7, "count", v9, v10, v11, v12)) {
      id v4 = v7;
    }
    else {
      id v4 = 0;
    }
  }
  return v4;
}

+ (void)initGlobals
{
  self;
  if (initGlobals_mapping_init != -1)
  {
    dispatch_once(&initGlobals_mapping_init, &__block_literal_global_15055);
  }
}

void __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];
    [v4 addObjectsFromArray:v5];

    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [(id)g_executableUUIDMapping objectForKeyedSubscript:v2];
      int v10 = 136315650;
      v11 = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v2;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%s: cached %@ UUID %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    v8 = +[NEProcessInfo copyUUIDsFromExecutable:]((uint64_t)NEProcessInfo, (const char *)[v2 UTF8String]);
    if (v8)
    {
      v6 = v8;
      [(id)g_executableUUIDMapping setObject:v8 forKeyedSubscript:v2];
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }
    else
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        v11 = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v2;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%s: failed to get UUIDs for %@", (uint8_t *)&v10, 0x16u);
      }

      v6 = 0;
    }
  }
}

+ (id)copyUUIDsFromExecutable:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  self;
  if (!a2) {
    return 0;
  }
  int v3 = open(a2, 0);
  if (v3 < 0)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      v28 = strerror(*v27);
      host_info_out[0] = 136315650;
      *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      LOWORD(host_info_out[3]) = 2080;
      *(void *)((char *)&host_info_out[3] + 2) = a2;
      HIWORD(host_info_out[5]) = 2080;
      *(void *)&host_info_out[6] = v28;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%s: cannot open %s: %s", (uint8_t *)host_info_out, 0x20u);
    }

    return 0;
  }
  int v4 = v3;
  int v41 = 0;
  if (read(v3, &v41, 4uLL) != 4)
  {
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v29 = __error();
      v30 = strerror(*v29);
      host_info_out[0] = 136315650;
      *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      LOWORD(host_info_out[3]) = 2080;
      *(void *)((char *)&host_info_out[3] + 2) = a2;
      HIWORD(host_info_out[5]) = 2080;
      *(void *)&host_info_out[6] = v30;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%s: cannot read magic for %s: %s", (uint8_t *)host_info_out, 0x20u);
    }

    goto LABEL_14;
  }
  lseek(v4, 0, 0);
  if ((v41 + 17958194) < 2)
  {
    uint64_t v5 = +[NEProcessInfo copyUUIDForSingleArch:]((uint64_t)NEProcessInfo, v4);
    v6 = (void *)v5;
    if (v5)
    {
      uint64_t v46 = v5;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    }
    else
    {
      __int16 v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        host_info_out[0] = 136315138;
        *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
        _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%s: failed to get UUID for Single Arch", (uint8_t *)host_info_out, 0xCu);
      }

      id v7 = 0;
    }

    goto LABEL_23;
  }
  id v7 = 0;
  if (v41 != -1095041334) {
    goto LABEL_23;
  }
  uint64_t v10 = self;
  long long v52 = 0u;
  memset(host_info_out, 0, sizeof(host_info_out));
  mach_msg_type_number_t host_info_outCnt = 12;
  host_t v11 = MEMORY[0x19F3B7830](v10);
  if (host_info(v11, 1, host_info_out, &host_info_outCnt))
  {
    __int16 v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      id v13 = "%s: cannot get host_info";
LABEL_45:
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
      goto LABEL_48;
    }
    goto LABEL_48;
  }
  uint64_t v44 = 0;
  if (read(v4, &v44, 8uLL) != 8)
  {
    __int16 v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      id v13 = "%s: failed to read file";
      goto LABEL_45;
    }
LABEL_48:

LABEL_14:
    id v7 = 0;
    goto LABEL_23;
  }
  int v17 = HIDWORD(v44);
  LODWORD(v18) = bswap32(HIDWORD(v44));
  v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
    __int16 v49 = 1024;
    LODWORD(v50[0]) = v18;
    _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%s: number of arch detected: %d", buf, 0x12u);
  }

  if (!v17)
  {
    __int16 v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEFAULT, "Number of architectures is 0", buf, 2u);
    }
    goto LABEL_48;
  }
  if (v18 >= 0x20) {
    unint64_t v18 = 32;
  }
  else {
    unint64_t v18 = v18;
  }
  v20 = (unsigned int *)malloc_type_malloc(4 * (v18 + 4 * v18), 0x1000040A86A77D5uLL);
  if (!v20) {
    goto LABEL_14;
  }
  v21 = v20;
  uint64_t v22 = 0;
  if (v18 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v18;
  }
  do
  {
    long long v42 = 0uLL;
    unsigned int v43 = 0;
    if (read(v4, &v42, 0x14uLL) != 20)
    {
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
        _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "%s: failed to read arch info", buf, 0xCu);
      }

      id v7 = 0;
      goto LABEL_76;
    }
    LODWORD(v42) = bswap32(v42);
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = v42;
      WORD2(v50[0]) = 1024;
      *(_DWORD *)((char *)v50 + 6) = v42;
      _os_log_debug_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEBUG, "%s: cpu type %X (%d)", buf, 0x18u);
    }

    DWORD2(v42) = bswap32(DWORD2(v42));
    v25 = &v21[v22];
    long long v26 = v42;
    v25[4] = v43;
    *(_OWORD *)v25 = v26;
    v22 += 5;
  }
  while (5 * v23 != v22);
  id v7 = 0;
  v32 = v21 + 2;
  do
  {
    int v33 = *v32;
    if (!*v32)
    {
      v36 = ne_log_obj();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_75;
      }
      *(_DWORD *)buf = 136315138;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v37 = "%s: invalid offset";
      v38 = v36;
      uint32_t v39 = 12;
LABEL_67:
      _os_log_error_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
      goto LABEL_75;
    }
    int v34 = *(v32 - 2);
    if (lseek(v4, *v32, 0) == -1)
    {
      v36 = ne_log_obj();
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        goto LABEL_75;
      }
      *(_DWORD *)buf = 136315394;
      v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = v33;
      v37 = "%s: failed to seek to offset %u";
      v38 = v36;
      uint32_t v39 = 18;
      goto LABEL_67;
    }
    uint64_t v35 = +[NEProcessInfo copyUUIDForSingleArch:]((uint64_t)NEProcessInfo, v4);
    if (!v35)
    {
      v40 = ne_log_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
        __int16 v49 = 1024;
        LODWORD(v50[0]) = v33;
        _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%s: failed to get uuid for offset %u", buf, 0x12u);
      }
      v36 = 0;
      goto LABEL_74;
    }
    v36 = v35;
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (!v7)
      {
        v40 = ne_log_obj();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
          _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%s: failed allocate UUID array", buf, 0xCu);
        }
        id v7 = 0;
LABEL_74:

        goto LABEL_75;
      }
    }
    if (v34 == host_info_out[3]) {
      [v7 insertObject:v36 atIndex:0];
    }
    else {
      [v7 addObject:v36];
    }
    v32 += 5;

    --v23;
  }
  while (v23);
  v36 = ne_log_obj();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
    __int16 v49 = 2112;
    v50[0] = v7;
    _os_log_debug_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_DEBUG, "%s: uuids %@", buf, 0x16u);
  }
LABEL_75:

LABEL_76:
  free(v21);
LABEL_23:
  close(v4);
  uint64_t v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    host_info_out[0] = 136315394;
    *(void *)&host_info_out[1] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
    LOWORD(host_info_out[3]) = 2112;
    *(void *)((char *)&host_info_out[3] + 2) = v7;
    _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%s: UUIDs %@", (uint8_t *)host_info_out, 0x16u);
  }

  return v7;
}

- (NEProcessInfo)init
{
}

+ (id)copyUUIDsForPID:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (proc_pidpath(a3, buffer, 0x400u) < 0) {
    return 0;
  }
  int v4 = [NSString stringWithUTF8String:buffer];
  id v5 = +[NEProcessInfo copyUUIDsForExecutable:v4];

  return v5;
}

+ (BOOL)is64bitCapable
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  size_t v6 = 4;
  if (sysctlbyname("hw.cpu64bit_capable", &v7, &v6, 0, 0))
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = __error();
      id v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Failed to get 64 bit capability: %s", buf, 0xCu);
    }
  }
  return v7 != 0;
}

+ (id)copyNEHelperUUIDs
{
  id v2 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/libexec/nehelper"];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v3 addObjectsFromArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)copyDNSUUIDs
{
  id v2 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/sbin/mDNSResponder"];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v3 addObjectsFromArray:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (void)clearUUIDCache
{
  +[NEProcessInfo initGlobals]();
  id v2 = g_queue;

  dispatch_sync(v2, &__block_literal_global_10_15053);
}

uint64_t __31__NEProcessInfo_clearUUIDCache__block_invoke()
{
  return [(id)g_executableUUIDMapping removeAllObjects];
}

uint64_t __28__NEProcessInfo_initGlobals__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("NEProcessInfo queue", v0);
  id v2 = (void *)g_queue;
  g_queue = (uint64_t)v1;

  uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  uint64_t v4 = g_executableUUIDMapping;
  g_executableUUIDMapping = v3;

  return MEMORY[0x1F41817F8](v3, v4);
}

+ (id)copyUUIDsForExecutableWithoutCache:(id)a3
{
  id v3 = a3;
  +[NEProcessInfo initGlobals]();
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = g_queue;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    host_t v11 = __52__NEProcessInfo_copyUUIDsForExecutableWithoutCache___block_invoke;
    __int16 v12 = &unk_1E5992328;
    id v13 = v3;
    id v6 = v4;
    id v14 = v6;
    dispatch_sync(v5, &v9);
    if (objc_msgSend(v6, "count", v9, v10, v11, v12)) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __52__NEProcessInfo_copyUUIDsForExecutableWithoutCache___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = +[NEProcessInfo copyUUIDsFromExecutable:]((uint64_t)NEProcessInfo, (const char *)[v2 UTF8String]);
  if (v3)
  {
    [(id)g_executableUUIDMapping setObject:v3 forKeyedSubscript:v2];
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "+[NEProcessInfo copyUUIDsForExecutableWithoutCache:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v2;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%s: failed to get UUIDs for %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

+ (id)copyUUIDsForBundleID:(id)a3 uid:(unsigned int)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v5 UTF8String];
  uint64_t v7 = NEHelperCacheCopyAppUUIDMappingForUIDExtended();
  id v8 = (void *)v7;
  if (v7 && MEMORY[0x19F3B92C0](v7) == MEMORY[0x1E4F14568])
  {
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke;
    applier[3] = &unk_1E5991810;
    id v11 = v6;
    xpc_array_apply(v8, applier);
  }
  return v6;
}

uint64_t __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x19F3B92C0](v4) == MEMORY[0x1E4F14600])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    [v6 addObject:v7];
  }
  return 1;
}

@end