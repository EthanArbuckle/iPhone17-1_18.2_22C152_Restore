@interface LACDTOEnvironmentProviderFactory
+ (id)environmentProviderWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6;
@end

@implementation LACDTOEnvironmentProviderFactory

+ (id)environmentProviderWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider alloc] initWithLocationProvider:v12 featureController:v11 ratchetStateProvider:v10 lostModeController:v9];

  return v13;
}

@end