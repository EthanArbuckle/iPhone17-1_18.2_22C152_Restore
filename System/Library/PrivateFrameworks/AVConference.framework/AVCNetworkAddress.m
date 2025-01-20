@interface AVCNetworkAddress
- (AVCNetworkAddress)init;
- (BOOL)isIPv6;
- (NSString)interfaceName;
- (NSString)ip;
- (unsigned)port;
- (void)dealloc;
- (void)setInterfaceName:(id)a3;
- (void)setIp:(id)a3;
- (void)setIsIPv6:(BOOL)a3;
- (void)setPort:(unsigned __int16)a3;
@end

@implementation AVCNetworkAddress

- (AVCNetworkAddress)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCNetworkAddress;
  v2 = [(AVCNetworkAddress *)&v4 init];
  if (v2)
  {
    v2->ip = (NSString *)objc_opt_new();
    v2->interfaceName = (NSString *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCNetworkAddress;
  [(AVCNetworkAddress *)&v3 dealloc];
}

- (NSString)interfaceName
{
  return self->interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)ip
{
  return self->ip;
}

- (void)setIp:(id)a3
{
}

- (unsigned)port
{
  return self->port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->port = a3;
}

- (BOOL)isIPv6
{
  return self->isIPv6;
}

- (void)setIsIPv6:(BOOL)a3
{
  self->isIPv6 = a3;
}

@end