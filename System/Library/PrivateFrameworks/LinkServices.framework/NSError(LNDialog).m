@interface NSError(LNDialog)
- (id)ln_dialog;
@end

@implementation NSError(LNDialog)

- (id)ln_dialog
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  v4 = [a1 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"LNContextDialogData"];
  id v10 = 0;
  v6 = [v2 unarchivedObjectOfClass:v3 fromData:v5 error:&v10];
  id v7 = v10;

  if (v7)
  {
    v8 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = @"LNContextDialogData";
      __int16 v13 = 2114;
      id v14 = v7;
    }
  }
  return v6;
}

@end