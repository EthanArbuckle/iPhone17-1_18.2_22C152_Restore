@interface DDMoneyPreviewAction
- (id)iconName;
- (id)localizedName;
- (id)menuActions;
- (void)performFromView:(id)a3;
@end

@implementation DDMoneyPreviewAction

- (id)localizedName
{
  return DDLocalizedString(@"Send with Apple Cash");
}

- (id)iconName
{
  return @"applepaycash";
}

- (void)performFromView:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  double v9 = 0.0;
  if (DDResultCurrencyExtraction())
  {
    if (v9 > 0.0 && v8 != 0)
    {
      v4 = +[DDAction clientActionsDelegate];
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithDouble:v9];
        v10[0] = v8;
        v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
        [v4 handleMoneyActionWithAmount:v5 currencies:v6];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "No money action delegate set, can't perform the action", v7, 2u);
      }
    }
  }
}

- (id)menuActions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = +[DDAction clientActionsDelegate];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = 0;
      if (DDResultCurrencyExtraction()) {
        double v5 = 0.0;
      }
    }
    v6 = +[DDAction actionWithURL:result:context:](DDMoneyPreviewAction, "actionWithURL:result:context:", self->super.super.super._url, self->super.super.super._result, self->super.super.super._context, v5, v18);
    [v4 addObject:v6];
  }
  v7 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v4);
  uint64_t v8 = v7;
  if (v7)
  {
    double v9 = v7;
  }
  else
  {
    +[DDActionGroup emptyGroup]();
    double v9 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  BOOL v11 = +[DDConversionAction actionAvailableForResult:self->super.super.super._result];
  url = self->super.super.super._url;
  v13 = self->super.super.super._result;
  context = self->super.super.super._context;
  if (v11)
  {
    v15 = +[DDAction actionWithURL:url result:v13 context:context];
    -[DDActionGroup appendAction:]((uint64_t)v10, v15);
    v16 = [v15 specialCaseActions];
    -[DDActionGroup setInlinedGroup:]((uint64_t)v16, 1);
    -[DDActionGroup appendGroup:](v10, v16);
  }
  else
  {
    v15 = +[DDAction actionWithURL:url result:v13 context:context];
    -[DDActionGroup appendAction:]((uint64_t)v10, v15);
  }

  return v10;
}

@end