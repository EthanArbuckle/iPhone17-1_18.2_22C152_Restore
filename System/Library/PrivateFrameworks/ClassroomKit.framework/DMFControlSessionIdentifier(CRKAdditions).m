@interface DMFControlSessionIdentifier(CRKAdditions)
- (CRKRemoteEndpoint)crk_endpoint;
@end

@implementation DMFControlSessionIdentifier(CRKAdditions)

- (CRKRemoteEndpoint)crk_endpoint
{
  v2 = [CRKRemoteEndpoint alloc];
  v3 = objc_msgSend(NSString, "crk_stringWithIPAddress:", objc_msgSend(a1, "leaderIP"));
  v4 = -[CRKRemoteEndpoint initWithIPAddress:port:](v2, "initWithIPAddress:port:", v3, [a1 port]);

  return v4;
}

@end