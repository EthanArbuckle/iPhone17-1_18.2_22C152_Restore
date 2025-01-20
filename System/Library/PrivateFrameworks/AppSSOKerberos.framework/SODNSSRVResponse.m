@interface SODNSSRVResponse
- (NSString)host;
- (SODNSSRVResponse)init;
- (id)description;
- (unsigned)port;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned __int16)a3;
@end

@implementation SODNSSRVResponse

- (SODNSSRVResponse)init
{
  v3.receiver = self;
  v3.super_class = (Class)SODNSSRVResponse;
  return [(SODNSSRVResponse *)&v3 init];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(SODNSSRVResponse *)self host];
  v5 = [v3 stringWithFormat:@"host: %@, port: %d", v4, -[SODNSSRVResponse port](self, "port")];

  return v5;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (void).cxx_destruct
{
}

@end