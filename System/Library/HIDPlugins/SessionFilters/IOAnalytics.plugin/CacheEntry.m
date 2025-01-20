@interface CacheEntry
- (NSDictionary)payload;
- (NSNumber)routerID;
- (void)setPayload:(id)a3;
- (void)setRouterID:(id)a3;
@end

@implementation CacheEntry

- (NSNumber)routerID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRouterID:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_routerID, 0);
}

@end