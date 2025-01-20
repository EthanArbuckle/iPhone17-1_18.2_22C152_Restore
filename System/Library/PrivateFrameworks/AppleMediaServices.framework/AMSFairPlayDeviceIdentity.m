@interface AMSFairPlayDeviceIdentity
+ (AMSFairPlayDeviceIdentity)shared;
- (AMSFairPlayDeviceIdentity)init;
- (void)fpdiLevelFor:(NSURLRequest *)a3 bag:(AMSSendableBag *)a4 buyParams:(NSDictionary *)a5 completionHandler:(id)a6;
- (void)headersFor:(NSURLRequest *)a3 bag:(AMSSendableBag *)a4 buyParams:(NSDictionary *)a5 networkProvider:(AMSFairPlayDeviceIdentityNetworkProviderProtocol *)a6 completionHandler:(id)a7;
- (void)reinitializeSessionWithLevel:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation AMSFairPlayDeviceIdentity

+ (AMSFairPlayDeviceIdentity)shared
{
  v2 = (void *)static FairPlayDeviceIdentity.shared.getter();
  return (AMSFairPlayDeviceIdentity *)v2;
}

- (void)reinitializeSessionWithLevel:(int64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_retain();
  sub_18D677FD0((uint64_t)&unk_1E91BB0D8, (uint64_t)v7);
}

- (void)fpdiLevelFor:(NSURLRequest *)a3 bag:(AMSSendableBag *)a4 buyParams:(NSDictionary *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_retain();
  sub_18D677FD0((uint64_t)&unk_1E91BB0C8, (uint64_t)v11);
}

- (void)headersFor:(NSURLRequest *)a3 bag:(AMSSendableBag *)a4 buyParams:(NSDictionary *)a5 networkProvider:(AMSFairPlayDeviceIdentityNetworkProviderProtocol *)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  swift_unknownObjectRetain();
  swift_retain();
  sub_18D677FD0((uint64_t)&unk_1E91BB0B8, (uint64_t)v13);
}

- (AMSFairPlayDeviceIdentity)init
{
}

@end