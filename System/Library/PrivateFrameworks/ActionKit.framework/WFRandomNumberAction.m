@interface WFRandomNumberAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFRandomNumberAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v5 = [(WFRandomNumberAction *)self parameterValueForKey:@"WFRandomNumberMinimum" ofClass:objc_opt_class()];
  int v6 = [v5 intValue];

  v7 = [(WFRandomNumberAction *)self parameterValueForKey:@"WFRandomNumberMaximum" ofClass:objc_opt_class()];
  int v8 = [v7 intValue];

  if (v8 >= v6)
  {
    id v10 = [(WFRandomNumberAction *)self output];
    v9 = [NSNumber numberWithInt:arc4random_uniform(v8 - v6 + 1) + v6];
    [v10 addObject:v9];
  }
}

@end