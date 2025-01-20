@interface CUPairedPeer(APPairingClientCoreUtils)
- (id)patchedPairedPeerWithPeerInfo:()APPairingClientCoreUtils;
@end

@implementation CUPairedPeer(APPairingClientCoreUtils)

- (id)patchedPairedPeerWithPeerInfo:()APPairingClientCoreUtils
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F5E180]);
  objc_msgSend(v5, "setAcl:", objc_msgSend(a1, "acl"));
  objc_msgSend(v5, "setAltIRK:", objc_msgSend(a1, "altIRK"));
  objc_msgSend(v5, "setIdentifier:", objc_msgSend(a1, "identifier"));
  objc_msgSend(v5, "setModel:", objc_msgSend(a1, "model"));
  objc_msgSend(v5, "setName:", objc_msgSend(a1, "name"));
  objc_msgSend(v5, "setPublicKey:", objc_msgSend(a1, "publicKey"));
  id v6 = (id)objc_msgSend((id)objc_msgSend(a1, "info"), "mutableCopy");
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  if (a3) {
    [v6 addEntriesFromDictionary:a3];
  }
  [v5 setInfo:v6];
  if (IsAppleInternalBuild()
    && gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v5;
}

@end