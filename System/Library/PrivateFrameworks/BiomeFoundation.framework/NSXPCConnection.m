@interface NSXPCConnection
+ (id)bm_connectionWithPeer:(void *)a3 queue:;
- (BMProcess)bm_process;
- (id)bm_accessControlPolicy;
- (id)bm_userInfo;
- (void)bm_connectionFlags;
- (void)setBm_accessControlPolicy:(BMProcess *)a1;
- (void)setBm_connectionFlags:(void *)a1;
@end

@implementation NSXPCConnection

- (id)bm_accessControlPolicy
{
  if (a1)
  {
    v1 = -[NSXPCConnection bm_userInfo](a1);
    v2 = [v1 objectForKeyedSubscript:@"bm_accessControlPolicy"];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)bm_userInfo
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_9:
    v2 = 0;
    goto LABEL_11;
  }
  v2 = [a1 userInfo];
  v3 = [a1 userInfo];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_11;
    }
    v4 = __biome_log_for_category(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x2020000000;
    char v13 = 16;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__NSXPCConnection_BiomeUserInfo__bm_userInfo__block_invoke;
    block[3] = &unk_1E60229E8;
    block[4] = &buf;
    if (bm_userInfo_onceToken != -1) {
      dispatch_once(&bm_userInfo_onceToken, block);
    }
    os_log_type_t v5 = *(unsigned char *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
    if (os_log_type_enabled(v4, v5))
    {
      v6 = objc_opt_class();
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      id v7 = v6;
      _os_log_impl(&dword_1B30A0000, v4, v5, "NSXPCConnection userInfo is of class %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_9;
  }
  uint64_t v8 = objc_opt_new();

  [a1 setUserInfo:v8];
  v2 = (void *)v8;
LABEL_11:
  return v2;
}

- (void)bm_connectionFlags
{
  if (result)
  {
    v1 = -[NSXPCConnection bm_userInfo](result);
    v2 = [v1 objectForKeyedSubscript:@"bm_connectionFlags"];
    uint64_t v3 = [v2 unsignedLongLongValue];

    return (void *)v3;
  }
  return result;
}

+ (id)bm_connectionWithPeer:(void *)a3 queue:
{
  v4 = a2;
  os_log_type_t v5 = a3;
  self;
  if (v5) {
    xpc_connection_set_target_queue(v4, v5);
  }
  id v6 = [[_BMXPCConnection alloc] _initWithConnection:v4 queue:v5 flags:1];

  return v6;
}

- (void)setBm_connectionFlags:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = -[NSXPCConnection bm_userInfo](a1);
    os_log_type_t v5 = [v4 objectForKeyedSubscript:@"bm_connectionFlags"];

    if (v5)
    {
      id v6 = __biome_log_for_category(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v12 = 0x2020000000;
      char v13 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__NSXPCConnection_BiomeAccessControl__setBm_connectionFlags___block_invoke;
      block[3] = &unk_1E60229E8;
      block[4] = &buf;
      if (setBm_connectionFlags__onceToken != -1) {
        dispatch_once(&setBm_connectionFlags__onceToken, block);
      }
      os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (os_log_type_enabled(v6, v7))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = a1;
        _os_log_impl(&dword_1B30A0000, v6, v7, "Connection flags cannot change after being set %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v9 = [NSNumber numberWithUnsignedInteger:a2];
      uint64_t v8 = -[NSXPCConnection bm_userInfo](a1);
      [v8 setObject:v9 forKeyedSubscript:@"bm_connectionFlags"];
    }
  }
}

- (void)setBm_accessControlPolicy:(BMProcess *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = -[NSXPCConnection bm_accessControlPolicy](a1);
    os_log_type_t v5 = [v4 useCase];

    if (v5)
    {
      id v6 = __biome_log_for_category(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v15 = 0x2020000000;
      char v16 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke;
      block[3] = &unk_1E60229E8;
      block[4] = &buf;
      if (setBm_accessControlPolicy__onceToken != -1) {
        dispatch_once(&setBm_accessControlPolicy__onceToken, block);
      }
      os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (!os_log_type_enabled(v6, v7)) {
        goto LABEL_13;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a1;
      uint64_t v8 = "Access control policy useCase cannot change %@";
    }
    else
    {
      id v9 = -[NSXPCConnection bm_process](a1);
      v10 = [v3 process];

      if (v9 == v10)
      {
        v11 = -[NSXPCConnection bm_userInfo](a1);
        [v11 setObject:v3 forKeyedSubscript:@"bm_accessControlPolicy"];

        goto LABEL_14;
      }
      id v6 = __biome_log_for_category(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v15 = 0x2020000000;
      char v16 = 16;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke_9;
      v12[3] = &unk_1E60229E8;
      v12[4] = &buf;
      if (setBm_accessControlPolicy__onceToken_8 != -1) {
        dispatch_once(&setBm_accessControlPolicy__onceToken_8, v12);
      }
      os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
      _Block_object_dispose(&buf, 8);
      if (!os_log_type_enabled(v6, v7)) {
        goto LABEL_13;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a1;
      uint64_t v8 = "Access control policy process mismatch %@";
    }
    _os_log_impl(&dword_1B30A0000, v6, v7, v8, (uint8_t *)&buf, 0xCu);
LABEL_13:
  }
LABEL_14:
}

- (BMProcess)bm_process
{
  v1 = a1;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = -[NSXPCConnection bm_userInfo](a1);
    id v3 = [v2 objectForKeyedSubscript:@"bm_process"];

    if (!v3)
    {
      v4 = [BMProcess alloc];
      [(BMProcess *)v1 auditToken];
      id v3 = [(BMProcess *)v4 initWithAuditToken:v11];
      os_log_type_t v5 = -[NSXPCConnection bm_accessControlPolicy](v1);

      if (v5)
      {
        id v6 = __biome_log_for_category(0);
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v13 = 0x2020000000;
        char v14 = 16;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__NSXPCConnection_BiomeAccessControl__bm_process__block_invoke;
        block[3] = &unk_1E60229E8;
        block[4] = &buf;
        if (bm_process_onceToken != -1) {
          dispatch_once(&bm_process_onceToken, block);
        }
        os_log_type_t v7 = *(unsigned char *)(*((void *)&buf + 1) + 24);
        _Block_object_dispose(&buf, 8);
        if (os_log_type_enabled(v6, v7))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_1B30A0000, v6, v7, "Access control policy already set %@", (uint8_t *)&buf, 0xCu);
        }

        v1 = 0;
        goto LABEL_10;
      }
      id v9 = -[NSXPCConnection bm_userInfo](v1);
      [v9 setObject:v3 forKeyedSubscript:@"bm_process"];
    }
    id v3 = v3;
    v1 = v3;
LABEL_10:
  }
  return v1;
}

uint64_t __45__NSXPCConnection_BiomeUserInfo__bm_userInfo__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __49__NSXPCConnection_BiomeAccessControl__bm_process__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __65__NSXPCConnection_BiomeAccessControl__setBm_accessControlPolicy___block_invoke_9(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __61__NSXPCConnection_BiomeAccessControl__setBm_connectionFlags___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

@end