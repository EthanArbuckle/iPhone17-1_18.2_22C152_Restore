@interface HMDHAPAccessoryRemoteReadTask
- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4;
- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5;
- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6;
@end

@implementation HMDHAPAccessoryRemoteReadTask

- (BOOL)_appendServiceListWithRequest:(id)a3 serviceList:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 service];
  v8 = [v7 instanceID];

  v9 = [v6 characteristic];

  v10 = [v9 instanceID];

  v11 = [v8 stringValue];
  v12 = objc_msgSend(v5, "hmf_mutableArrayForKey:", v11);

  if (!v12)
  {
    v12 = [MEMORY[0x263EFF980] array];
    v13 = [v8 stringValue];
    [v5 setObject:v12 forKey:v13];
  }
  [v12 addObject:v10];

  return 0;
}

- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6
{
  v10 = (void *)MEMORY[0x263F42608];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 sharedPreferences];
  v16 = [v15 preferenceForKey:@"AccessoryReaderWriterMessageDefaultTimeout"];
  v17 = [v16 numberValue];
  [v17 doubleValue];
  double v19 = v18;

  v22.receiver = self;
  v22.super_class = (Class)HMDHAPAccessoryRemoteReadTask;
  v20 = [(HMDHAPAccessoryRemoteOperationTask *)&v22 initWithContext:v14 remoteMessageName:@"kMultipleCharacteristicReadRequestKey" requests:v13 delegateDevice:v12 timeout:v11 completion:v19];

  return v20;
}

- (HMDHAPAccessoryRemoteReadTask)initWithContext:(id)a3 requests:(id)a4 completion:(id)a5
{
  return [(HMDHAPAccessoryRemoteReadTask *)self initWithContext:a3 requests:a4 delegateDevice:0 completion:a5];
}

@end