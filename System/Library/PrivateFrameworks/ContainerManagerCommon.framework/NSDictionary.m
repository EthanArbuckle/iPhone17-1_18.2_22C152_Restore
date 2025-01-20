@interface NSDictionary
@end

@implementation NSDictionary

id __94__NSDictionary_MobileContainerManagerAdditions__MCM_writeToURL_withOptions_fileManager_error___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  v3 = [*(id *)(a1 + 32) path];
  v4 = (void *)[v2 initWithFormat:@"Attempting to write a zero-length plist file at [%@]", v3];

  v13[0] = @"FunctionName";
  v5 = [NSString stringWithUTF8String:"-[NSDictionary(MobileContainerManagerAdditions) MCM_writeToURL:withOptions:fileManager:error:]_block_invoke"];
  v14[0] = v5;
  v14[1] = &unk_1F2F11C48;
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v13[1] = @"SourceFileLine";
  v13[2] = v6;
  v14[2] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  v8 = container_log_handle_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MCMErrorDomain" code:34 userInfo:v7];

  return v9;
}

@end