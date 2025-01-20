@interface DTBKSWatchdogAssertionFactory
- (id)assertionForPid:(int)a3;
@end

@implementation DTBKSWatchdogAssertionFactory

- (id)assertionForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = sub_2308B3098();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = v3;
    _os_log_impl(&dword_23087D000, v4, OS_LOG_TYPE_INFO, "acquiring assertion for pid %d", buf, 8u);
  }

  v5 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.DTServiceHub" name:@"DeveloperToolsDebugging"];
  v20 = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];

  id v7 = objc_alloc(MEMORY[0x263F64408]);
  v8 = [MEMORY[0x263F64630] targetWithPid:v3];
  v9 = (void *)[v7 initWithExplanation:@"Target is being analyzed by developer tools" target:v8 attributes:v6];

  id v19 = 0;
  char v10 = [v9 acquireWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_2308B30EC;
    v16[3] = &unk_264B8D788;
    int v18 = v3;
    v17 = v9;
    v12 = _Block_copy(v16);
    v13 = _Block_copy(v12);

    v14 = v17;
  }
  else
  {
    v14 = sub_2308B3098();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_23093D6E4((uint64_t)v11, v3, v14);
    }
    v13 = 0;
  }

  return v13;
}

@end