@interface AVOutputDeviceAuthorizedPeer(HAPPairingIdentity)
- (id)hmd_pairingIdentity;
@end

@implementation AVOutputDeviceAuthorizedPeer(HAPPairingIdentity)

- (id)hmd_pairingIdentity
{
  uint64_t v2 = [a1 hasAdministratorPrivileges];
  id v3 = objc_alloc(MEMORY[0x1E4F65510]);
  v4 = [a1 publicKey];
  v5 = (void *)[v3 initWithPairingKeyData:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F5BE00]);
  v7 = [a1 peerID];
  v8 = (void *)[v6 initWithIdentifier:v7 publicKey:v5 privateKey:0 permissions:v2];

  return v8;
}

@end