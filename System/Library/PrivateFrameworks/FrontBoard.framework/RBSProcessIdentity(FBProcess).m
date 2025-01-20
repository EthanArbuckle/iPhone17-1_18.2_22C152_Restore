@interface RBSProcessIdentity(FBProcess)
- (id)fb_processClass;
- (void)fb_processClass;
@end

@implementation RBSProcessIdentity(FBProcess)

- (id)fb_processClass
{
  id v7 = 0;
  char v2 = [a1 treatedAsAnAppByFrontBoard:&v7];
  id v3 = v7;
  if (v3)
  {
    v4 = FBLogProcess();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
      -[RBSProcessIdentity(FBProcess) fb_processClass]();
    }
    }
  }
  if ((v2 & 1) == 0) { {
    [a1 isXPCService];
  }
  }
  v5 = objc_opt_class();

  return v5;
}

- (void)fb_processClass
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_11_1(&dword_1A62FC000, v1, (uint64_t)v1, "treatedAsAnAppByFrontBoard for %@ returned error %@", v2);
}

@end