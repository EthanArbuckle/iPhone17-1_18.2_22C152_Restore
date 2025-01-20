@interface NSURLRequest(RemoteQuery)
- (uint64_t)rq_protocolVersion;
- (uint64_t)rq_timeout;
@end

@implementation NSURLRequest(RemoteQuery)

- (uint64_t)rq_protocolVersion
{
  v1 = [a1 valueForHTTPHeaderField:0x26DD64558];
  v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  uint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (uint64_t)rq_timeout
{
  v1 = [a1 valueForHTTPHeaderField:0x26DD64578];
  v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v1, "longLongValue"));
  uint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

@end