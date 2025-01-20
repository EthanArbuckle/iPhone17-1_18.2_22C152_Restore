@interface NLRouterExperimentTrialController
- (BOOL)suppressRewrite;
- (NLRouterExperimentTrialController)init;
@end

@implementation NLRouterExperimentTrialController

- (BOOL)suppressRewrite
{
  return NLRouterExperimentTrialController.suppressRewrite.getter() & 1;
}

- (NLRouterExperimentTrialController)init
{
  return (NLRouterExperimentTrialController *)NLRouterExperimentTrialController.init()();
}

- (void).cxx_destruct
{
}

@end