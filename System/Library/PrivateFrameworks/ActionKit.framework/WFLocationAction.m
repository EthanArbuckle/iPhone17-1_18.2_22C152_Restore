@interface WFLocationAction
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFLocationAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5 = [(WFLocationAction *)self parameterValueForKey:@"WFLocation" ofClass:objc_opt_class()];
  [(WFLocationAction *)self setOutput:v5];
}

@end