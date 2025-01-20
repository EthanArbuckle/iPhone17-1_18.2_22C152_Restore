@interface NSXPCConnection(DropInCoreAdditions)
- (id)bundleIdentifier;
@end

@implementation NSXPCConnection(DropInCoreAdditions)

- (id)bundleIdentifier
{
  [a1 auditToken];
  CPCopyBundleIdentifierAndTeamFromAuditToken();

  return 0;
}

@end