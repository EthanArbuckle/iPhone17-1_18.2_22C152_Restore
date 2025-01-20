@interface NSXPCConnection(CoordinationCore)
- (id)co_ClientBundleIdentifier;
- (id)co_PeerInstance;
- (void)co_SetClientBundleIdentifier:()CoordinationCore;
- (void)co_SetPeerInstance:()CoordinationCore;
@end

@implementation NSXPCConnection(CoordinationCore)

- (id)co_ClientBundleIdentifier
{
  v2 = objc_getAssociatedObject(a1, sel_co_ClientBundleIdentifier);
  if (!v2)
  {
    [a1 auditToken];
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    v3 = objc_msgSend(MEMORY[0x263F086E0], "mainBundle", 0, 0, 0, 0);
    v2 = [v3 bundleIdentifier];

    objc_msgSend(a1, "co_SetClientBundleIdentifier:", v2, v5, v6, v7, v8);
  }
  return v2;
}

- (void)co_SetClientBundleIdentifier:()CoordinationCore
{
}

- (id)co_PeerInstance
{
  v5[2] = *MEMORY[0x263EF8340];
  v2 = objc_getAssociatedObject(a1, sel_co_PeerInstance);
  if (!v2)
  {
    v5[0] = 0;
    v5[1] = 0;
    v3 = [a1 _xpcConnection];
    if (v3 && xpc_connection_get_peer_instance()) {
      v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v5];
    }
    else {
      v2 = 0;
    }
  }
  return v2;
}

- (void)co_SetPeerInstance:()CoordinationCore
{
}

@end