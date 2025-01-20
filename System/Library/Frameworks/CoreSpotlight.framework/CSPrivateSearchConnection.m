@interface CSPrivateSearchConnection
- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5;
- (id)defaultIndexPath:(id)a3;
- (id)serviceName;
- (id)uuidForToken:(id)a3;
@end

@implementation CSPrivateSearchConnection

- (id)uuidForToken:(id)a3
{
  return CSPrivateUUID(a3);
}

- (id)defaultIndexPath:(id)a3
{
  return CSPrivateIndexDefaultPath(a3);
}

- (id)serviceName
{
  return @"com.apple.corespotlightservice";
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return addExtensionToken(a3, a4, a5);
}

@end