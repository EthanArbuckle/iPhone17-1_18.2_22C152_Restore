@interface NSError(LNStaticDeferredLocalizedString)
- (id)ln_staticDeferredLocalizedString;
@end

@implementation NSError(LNStaticDeferredLocalizedString)

- (id)ln_staticDeferredLocalizedString
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 userInfo];
  v3 = [v2 objectForKeyedSubscript:@"LNPerformActionErrorLocalizedStringResourceData"];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    v6 = [a1 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"LNPerformActionErrorLocalizedStringResourceData"];
    id v12 = 0;
    v8 = [v4 unarchivedObjectOfClass:v5 fromData:v7 error:&v12];
    id v9 = v12;

    if (v9)
    {
      v10 = getLNLogCategoryGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = @"LNPerformActionErrorLocalizedStringResourceData";
        __int16 v15 = 2114;
        id v16 = v9;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end