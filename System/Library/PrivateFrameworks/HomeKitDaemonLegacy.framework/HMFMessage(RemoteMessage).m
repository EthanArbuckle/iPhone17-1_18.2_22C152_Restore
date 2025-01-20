@interface HMFMessage(RemoteMessage)
- (id)remoteSenderContext;
- (id)remoteSourceDevice;
- (id)remoteSourceID;
- (id)remoteToID;
- (id)remoteUserPairingIdentity;
- (uint64_t)isRemote;
- (uint64_t)isSecureRemote;
- (uint64_t)remoteDisallowsIDSRacing;
- (uint64_t)remoteResponseRestriction;
- (uint64_t)remoteRestriction;
@end

@implementation HMFMessage(RemoteMessage)

- (uint64_t)isRemote
{
  v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_BOOLForKey:", @"HMD.remote");

  return v2;
}

- (uint64_t)remoteDisallowsIDSRacing
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:@"HMD.remoteDisallowsIDSRacing"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4) {
    uint64_t v5 = [v4 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)remoteSenderContext
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:@"HMD.remoteSenderContext"];

  return v2;
}

- (uint64_t)remoteResponseRestriction
{
  v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_numberForKey:", @"HMD.remoteTransportResponseRestriction");

  if (v2) {
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

- (uint64_t)remoteRestriction
{
  v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_numberForKey:", @"HMD.remoteTransportRestriction");

  if (v2) {
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

- (id)remoteToID
{
  v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_stringForKey:", @"kRemoteMessageIDSToIDKey");

  return v2;
}

- (id)remoteUserPairingIdentity
{
  v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"kIDSMessageSourceUserKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 pairingIdentity];

  return v5;
}

- (id)remoteSourceDevice
{
  v1 = [a1 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  id v4 = [v3 device];

  return v4;
}

- (id)remoteSourceID
{
  uint64_t v2 = [a1 userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"kIDSMessageSourceIDKey"];

  if (!v3)
  {
    id v4 = [a1 messagePayload];
    id v3 = [v4 objectForKeyedSubscript:@"kIDSMessageSourceIDKey"];
  }
  id v5 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (uint64_t)isSecureRemote
{
  v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "hmf_BOOLForKey:", @"HMD.remoteSecure");

  return v2;
}

@end