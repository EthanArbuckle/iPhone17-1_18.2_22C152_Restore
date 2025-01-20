@interface AKFollowUpControllerServiceProviderImpl
- (id)serviceControllerForContext:(id)a3;
@end

@implementation AKFollowUpControllerServiceProviderImpl

- (id)serviceControllerForContext:(id)a3
{
  id v3 = a3;
  v4 = [AKFollowUpRequestProvider alloc];
  v5 = [(AKURLRequestProviderImpl *)v4 initWithContext:v3 urlBagKey:AKURLBagKeyFetchFollowUps];

  v6 = [[AKServiceControllerImpl alloc] initWithRequestProvider:v5];

  return v6;
}

@end