@interface FTRegFaceTimeServiceDelegate
- (BOOL)serviceIsAvailable;
- (id)displayName;
- (id)name;
- (id)parametersForIdentityEstablishmentRequest;
- (id)serviceIdentifier;
- (int64_t)serviceType;
@end

@implementation FTRegFaceTimeServiceDelegate

- (int64_t)serviceType
{
  return 0;
}

- (id)name
{
  return @"FaceTimeSetupAssistant";
}

- (id)displayName
{
  return @"FaceTime";
}

- (id)serviceIdentifier
{
  return @"com.apple.facetime";
}

- (BOOL)serviceIsAvailable
{
  v2 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v3 = [v2 faceTimeAvailable];

  return v3;
}

- (id)parametersForIdentityEstablishmentRequest
{
  return &off_40C0;
}

@end