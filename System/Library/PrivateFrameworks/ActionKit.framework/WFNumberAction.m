@interface WFNumberAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFNumberAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v8 = [(WFNumberAction *)self output];
  uint64_t v5 = [(WFNumberAction *)self parameterValueForKey:@"WFNumberActionNumber" ofClass:objc_opt_class()];
  v6 = (void *)v5;
  if (v5) {
    v7 = (void *)v5;
  }
  else {
    v7 = &unk_26F076488;
  }
  [v8 addObject:v7];
}

@end