@interface HMDBLEBroadcastEventReceived
+ (id)broadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4;
- (BOOL)hasExpectedGSN;
- (HMDAccessory)accessory;
- (id)initBroadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4;
@end

@implementation HMDBLEBroadcastEventReceived

- (void).cxx_destruct
{
}

- (BOOL)hasExpectedGSN
{
  return self->_hasExpectedGSN;
}

- (HMDAccessory)accessory
{
  return self->_accessory;
}

- (id)initBroadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDBLEBroadcastEventReceived;
  v8 = [(HMMLogEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accessory, a3);
    v9->_hasExpectedGSN = a4;
  }

  return v9;
}

+ (id)broadcastEventFromAccessory:(id)a3 withExpectedGSN:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[HMDBLEBroadcastEventReceived alloc] initBroadcastEventFromAccessory:v5 withExpectedGSN:v4];

  return v6;
}

@end