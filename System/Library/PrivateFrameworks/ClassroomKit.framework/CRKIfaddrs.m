@interface CRKIfaddrs
- (BOOL)isInternetInterface;
- (CRKIfaddrs)initWithIfaddrs:(ifaddrs *)a3;
- (CRKIfaddrs)next;
- (NSString)IPAddress;
- (NSString)name;
@end

@implementation CRKIfaddrs

- (CRKIfaddrs)initWithIfaddrs:(ifaddrs *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKIfaddrs;
  result = [(CRKIfaddrs *)&v5 init];
  if (result) {
    result->mIfaddrs = a3;
  }
  return result;
}

- (BOOL)isInternetInterface
{
  return self->mIfaddrs->ifa_addr->sa_family == 2;
}

- (NSString)name
{
  return (NSString *)[NSString stringWithUTF8String:self->mIfaddrs->ifa_name];
}

- (NSString)IPAddress
{
  v2.s_addr = *(_DWORD *)&self->mIfaddrs->ifa_addr->sa_data[2];
  if (v2.s_addr)
  {
    v3 = [NSString stringWithUTF8String:inet_ntoa(v2)];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (CRKIfaddrs)next
{
  ifa_next = self->mIfaddrs->ifa_next;
  if (ifa_next) {
    v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIfaddrs:ifa_next];
  }
  else {
    v3 = 0;
  }

  return (CRKIfaddrs *)v3;
}

@end