@interface HMFMutableMessage(RemoteMessage)
- (uint64_t)setRemoteSenderContext:()RemoteMessage;
- (uint64_t)setRemoteSourceID:()RemoteMessage;
- (uint64_t)setRemoteToID:()RemoteMessage;
- (void)setRemote:()RemoteMessage;
- (void)setRemoteDisallowsIDSRacing:()RemoteMessage;
- (void)setRemoteResponseRestriction:()RemoteMessage;
- (void)setRemoteRestriction:()RemoteMessage;
- (void)setSecureRemote:()RemoteMessage;
@end

@implementation HMFMutableMessage(RemoteMessage)

- (void)setRemoteDisallowsIDSRacing:()RemoteMessage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"HMD.remoteDisallowsIDSRacing"];
}

- (uint64_t)setRemoteSenderContext:()RemoteMessage
{
  return [a1 setUserInfoValue:a3 forKey:@"HMD.remoteSenderContext"];
}

- (void)setRemoteResponseRestriction:()RemoteMessage
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"HMD.remoteTransportResponseRestriction"];
}

- (void)setRemoteRestriction:()RemoteMessage
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"HMD.remoteTransportRestriction"];
}

- (uint64_t)setRemoteToID:()RemoteMessage
{
  return [a1 setUserInfoValue:a3 forKey:@"kRemoteMessageIDSToIDKey"];
}

- (uint64_t)setRemoteSourceID:()RemoteMessage
{
  return [a1 setUserInfoValue:a3 forKey:@"kIDSMessageSourceIDKey"];
}

- (void)setSecureRemote:()RemoteMessage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"HMD.remoteSecure"];
}

- (void)setRemote:()RemoteMessage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setUserInfoValue:v2 forKey:@"HMD.remote"];
}

@end