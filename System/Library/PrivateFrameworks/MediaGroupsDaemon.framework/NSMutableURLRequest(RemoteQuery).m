@interface NSMutableURLRequest(RemoteQuery)
- (void)rq_setProtocolVersion:()RemoteQuery;
- (void)rq_setTimeout:()RemoteQuery;
@end

@implementation NSMutableURLRequest(RemoteQuery)

- (void)rq_setProtocolVersion:()RemoteQuery
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v4 forHTTPHeaderField:0x26DD64558];
}

- (void)rq_setTimeout:()RemoteQuery
{
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v4 forHTTPHeaderField:0x26DD64578];
}

@end