@interface LSDIconClient
@end

@implementation LSDIconClient

id __58___LSDIconClient_getAlternateIconNameForIdentifier_reply___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) XPCConnection];
  v2 = [v1 _xpcConnection];
  v3 = (void *)_LSCopyBundleIdentifierForXPCConnection(v2, 0);

  return v3;
}

@end