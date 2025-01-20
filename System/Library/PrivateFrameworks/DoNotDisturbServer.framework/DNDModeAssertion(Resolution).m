@interface DNDModeAssertion(Resolution)
- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:;
@end

@implementation DNDModeAssertion(Resolution)

- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [a1 source];
  v12 = [v11 resolveWithExpectedRemoteDeviceIdentifier:v10 localDeviceIdentifier:v9 remoteDeviceIdentifier:v8];

  if (v11 == v12 || v11 && v12 && [v11 isEqual:v12])
  {
    id v13 = a1;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4F5F600]);
    v15 = [a1 UUID];
    v16 = [a1 startDate];
    v17 = [a1 details];
    id v13 = (id)[v14 initWithUUID:v15 startDate:v16 details:v17 source:v12];
  }
  return v13;
}

@end