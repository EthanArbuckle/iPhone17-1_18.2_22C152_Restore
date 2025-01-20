@interface DNDModeAssertionInvalidation(Resolution)
- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:;
@end

@implementation DNDModeAssertionInvalidation(Resolution)

- (id)resolveWithExpectedRemoteDeviceIdentifier:()Resolution localDeviceIdentifier:remoteDeviceIdentifier:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 assertion];
  v30 = v8;
  uint64_t v12 = [v11 resolveWithExpectedRemoteDeviceIdentifier:v8 localDeviceIdentifier:v9 remoteDeviceIdentifier:v10];
  v13 = (void *)v12;
  if (v11 == (void *)v12)
  {
    int v14 = 0;
  }
  else
  {
    int v14 = 1;
    if (v11 && v12) {
      int v14 = [v11 isEqual:v12] ^ 1;
    }
  }
  v15 = [a1 source];
  uint64_t v16 = [v15 resolveWithExpectedRemoteDeviceIdentifier:v30 localDeviceIdentifier:v9 remoteDeviceIdentifier:v10];
  v17 = (void *)v16;
  if (v15 == (void *)v16)
  {
    int v18 = 0;
  }
  else
  {
    if (!v15 || !v16) {
      goto LABEL_12;
    }
    int v18 = [v15 isEqual:v16] ^ 1;
  }
  if ((v14 | v18))
  {
LABEL_12:
    id v29 = v10;
    id v19 = objc_alloc(MEMORY[0x1E4F5F630]);
    v20 = [a1 invalidationDate];
    v21 = [a1 details];
    id v22 = v9;
    uint64_t v23 = [a1 reason];
    uint64_t v24 = [a1 reasonOverride];
    v25 = v19;
    id v10 = v29;
    uint64_t v26 = v23;
    id v9 = v22;
    id v27 = (id)[v25 initWithAssertion:v13 invalidationDate:v20 details:v21 source:v17 reason:v26 reasonOverride:v24];

    goto LABEL_14;
  }
  id v27 = a1;
LABEL_14:

  return v27;
}

@end