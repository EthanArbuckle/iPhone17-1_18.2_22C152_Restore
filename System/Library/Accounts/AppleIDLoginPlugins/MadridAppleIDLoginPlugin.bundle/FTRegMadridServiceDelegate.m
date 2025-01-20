@interface FTRegMadridServiceDelegate
- (BOOL)serviceIsAvailable;
- (id)displayName;
- (id)name;
- (id)parametersForIdentityEstablishmentRequest;
- (id)serviceIdentifier;
- (int64_t)serviceType;
@end

@implementation FTRegMadridServiceDelegate

- (int64_t)serviceType
{
  return 1;
}

- (id)name
{
  return @"iMessageSetupAssistant";
}

- (id)displayName
{
  return @"iMessage";
}

- (id)serviceIdentifier
{
  return @"com.apple.madrid";
}

- (BOOL)serviceIsAvailable
{
  v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 iMessageAvailable];

  return v3;
}

- (id)parametersForIdentityEstablishmentRequest
{
  return 0;
}

@end