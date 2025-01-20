@interface _FBDarkBootHelper
- (BOOL)isBootingDark;
- (void)_setDarkBootEnabled:(BOOL)a3;
- (void)clearBootedDark;
- (void)isBootingDark;
- (void)setNextBootDark;
@end

@implementation _FBDarkBootHelper

- (BOOL)isBootingDark
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  size_t v11 = 4;
  int v2 = sysctlbyname("kern.darkboot", &v12, &v11, 0, 0);
  if (v2)
  {
    int v3 = v2;
    v4 = FBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) { {
      [(_FBDarkBootHelper *)v3 isBootingDark];
    }
    }
LABEL_4:
    BOOL v5 = 0;
    goto LABEL_5;
  }
  int v7 = v12;
  v8 = FBLogCommon();
  v4 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = [NSNumber numberWithBool:0];
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      __int16 v15 = 1024;
      int v16 = v12;
      _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_INFO, "read darkboot flag = %{public}@ (%i)", buf, 0x12u);
    }
    goto LABEL_4;
  }
  BOOL v5 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [NSNumber numberWithBool:1];
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 1024;
    int v16 = v12;
    _os_log_impl(&dword_1A62FC000, v4, OS_LOG_TYPE_DEFAULT, "read darkboot flag = %{public}@ (%i)", buf, 0x12u);
  }
LABEL_5:

  return v5;
}

- (void)setNextBootDark
{
}

- (void)clearBootedDark
{
}

- (void)_setDarkBootEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3) { {
    int v4 = 2;
  }
  }
  else {
    int v4 = 0;
  }
  int v9 = v4;
  int v5 = sysctlbyname("kern.darkboot", 0, 0, &v9, 4uLL);
  v6 = FBLogCommon();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) { {
      -[_FBDarkBootHelper _setDarkBootEnabled:](v5, v7);
    }
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "NO";
    if (v3) { {
      v8 = "YES";
    }
    }
    *(_DWORD *)buf = 136446210;
    size_t v11 = v8;
    _os_log_impl(&dword_1A62FC000, v7, OS_LOG_TYPE_DEFAULT, "Set darkBoot = %{public}s", buf, 0xCu);
  }
}

- (void)isBootingDark
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "failed to read darkboot state ->  %{darwin.errno}i", (uint8_t *)v2, 8u);
}

- (void)_setDarkBootEnabled:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "Failed to set darkboot state ->  %{darwin.errno}i : do you have the entitlement (com.apple.private.kernel.darkboot)?", (uint8_t *)v2, 8u);
}

@end