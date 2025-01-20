@interface NSString(DeviceManagementClient)
- (id)dmc_substringWithPattern:()DeviceManagementClient;
@end

@implementation NSString(DeviceManagementClient)

- (id)dmc_substringWithPattern:()DeviceManagementClient
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:a3 options:16 error:&v13];
  id v5 = v13;
  if (v5)
  {
    v6 = *DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[NSString(DeviceManagementClient) dmc_substringWithPattern:]";
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1A7863000, v6, OS_LOG_TYPE_ERROR, "%s Failed to create regex with error: %{public}@", buf, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 rangeAtIndex:1];
      v7 = objc_msgSend(a1, "substringWithRange:", v10, v11);
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

@end