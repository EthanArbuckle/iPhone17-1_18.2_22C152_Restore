@interface DDConversionPreviewAction
- (id)commitURL;
- (id)createViewController;
- (id)menuActions;
@end

@implementation DDConversionPreviewAction

- (id)createViewController
{
  if (+[DDConversionAction actionAvailableForResult:self->super.super._result])
  {
    v3 = [[DDConversionAction alloc] initWithURL:0 result:self->super.super._result context:self->super.super._context];
    v4 = [(DDConversionAction *)v3 calculateResult];
    v5 = [v4 formattedExpression];

    v6 = [(DDConversionAction *)v3 calculateResult];
    v7 = [v6 formattedResult];

    v8 = 0;
    if (v5) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9)
    {
      v10 = [DDConversionPreviewController alloc];
      v11 = [NSString stringWithFormat:@"%@ =", v5];
      v8 = [(DDConversionPreviewController *)v10 initWithTitle:v11 subTitle:v7 finance:DDResultHasType()];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)menuActions
{
  return +[DDConversionAction allActionsForResult:self->super.super._result context:self->super.super._context onlyTest:0 forceSubMenu:0];
}

- (id)commitURL
{
  v2 = self->super.super._result;
  if (v2)
  {
    if (DDResultHasType())
    {
      v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://finance.yahoo.com/currency-converter/"];
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

@end