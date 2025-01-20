@interface WFDateAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFDateAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  v6 = [(WFDateAction *)self parameterValueForKey:@"WFDateActionMode" ofClass:objc_opt_class()];
  if ([v6 isEqualToString:@"Current Date"])
  {
    v7 = [(WFDateAction *)self output];
    v8 = [MEMORY[0x263EFF910] date];
    [v7 addObject:v8];
  }
  else
  {
    v9 = [(WFDateAction *)self parameterValueForKey:@"WFDateActionDate" ofClass:objc_opt_class()];
    if (v9)
    {
      v10 = [(WFDateAction *)self output];
      [v10 addObject:v9];
    }
    else
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F870B8];
      v16[0] = *MEMORY[0x263F08338];
      v13 = WFLocalizedString(@"Invalid Date");
      v17[0] = v13;
      v16[1] = *MEMORY[0x263F08320];
      v14 = WFLocalizedString(@"Please enter a valid date into the Date action.");
      v17[1] = v14;
      v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      *a4 = [v11 errorWithDomain:v12 code:5 userInfo:v15];
    }
  }
}

@end