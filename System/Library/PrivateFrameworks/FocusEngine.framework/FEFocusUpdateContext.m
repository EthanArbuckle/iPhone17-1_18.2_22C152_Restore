@interface FEFocusUpdateContext
@end

@implementation FEFocusUpdateContext

BOOL __34___FEFocusUpdateContext__validate__block_invoke(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || *(void *)(a1 + 32) != 0;
}

void __34___FEFocusUpdateContext__validate__block_invoke_2(uint64_t a1)
{
  _FEFocusEnvironmentFirstCommonAncestor(*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
    do
    {
      v4 = v3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = _FEFocusEnvironmentShouldUpdateFocus(v3, *(void **)(a1 + 48));
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && *(void *)(a1 + 56))
      {
        v5 = NSString;
        id v6 = v3;
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];

        v10 = +[_FEDebugIssue issueWithDescription:v9];

        [v10 setPrefix:&stru_2700CBC00];
        [*(id *)(a1 + 56) addIssue:v10];
      }
      id v3 = (id)[v4 _parentFocusEnvironment];

      if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))()) {
        BOOL v11 = v3 == 0;
      }
      else {
        BOOL v11 = 1;
      }
    }
    while (!v11);
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))())
  {
    v12 = *(void **)(a1 + 40);
    if (v12 != *(void **)(a1 + 32))
    {
      id v13 = v12;
      do
      {
        v14 = v13;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = _FEFocusEnvironmentShouldUpdateFocus(v13, *(void **)(a1 + 48));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && *(void *)(a1 + 64))
        {
          id v15 = v13;
          if (v15)
          {
            v16 = NSString;
            v17 = (objc_class *)objc_opt_class();
            v18 = NSStringFromClass(v17);
            v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
          }
          else
          {
            v19 = @"(nil)";
          }

          v20 = +[_FEDebugIssue issueWithDescription:v19];

          [v20 setPrefix:&stru_2700CBC00];
          [*(id *)(a1 + 64) addIssue:v20];
        }
        id v13 = (id)[v14 _parentFocusEnvironment];

        if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))()) {
          BOOL v21 = v13 == 0;
        }
        else {
          BOOL v21 = 1;
        }
      }
      while (!v21 && v13 != v23);
    }
  }
}

@end