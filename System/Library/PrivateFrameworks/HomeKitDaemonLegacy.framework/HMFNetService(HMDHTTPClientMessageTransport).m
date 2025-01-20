@interface HMFNetService(HMDHTTPClientMessageTransport)
- (id)hmd_sessionIdentifier;
@end

@implementation HMFNetService(HMDHTTPClientMessageTransport)

- (id)hmd_sessionIdentifier
{
  v1 = [a1 TXTRecord];
  v2 = [v1 objectForKeyedSubscript:@"si"];

  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    v4 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
    v5 = (void *)[v3 initWithUUIDString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end