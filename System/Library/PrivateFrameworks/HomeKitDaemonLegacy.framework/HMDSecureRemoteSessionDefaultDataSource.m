@interface HMDSecureRemoteSessionDefaultDataSource
- (id)createSecureStreamWithPeerDevice:(id)a3 clientMode:(BOOL)a4 sessionID:(id)a5;
@end

@implementation HMDSecureRemoteSessionDefaultDataSource

- (id)createSecureStreamWithPeerDevice:(id)a3 clientMode:(BOOL)a4 sessionID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [HMDSecureRemoteStream alloc];
  v10 = +[HMDAppleAccountManager sharedManager];
  v11 = [v10 device];
  v12 = +[HMDAccountRegistry sharedRegistry];
  v13 = [(HMDSecureRemoteStream *)v9 initWithCurrentDevice:v11 peerDevice:v8 clientMode:v5 sessionID:v7 accountRegistry:v12];

  return v13;
}

@end