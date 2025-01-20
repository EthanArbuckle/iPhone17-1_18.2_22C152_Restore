@interface WFTextAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFTextAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v6 = [(WFTextAction *)self output];
  v5 = [(WFTextAction *)self parameterValueForKey:@"WFTextActionText" ofClass:objc_opt_class()];
  [v6 addObject:v5];
}

@end