@interface Client
- (NSBundle)bundle;
- (NSString)client;
- (NSString)client_name;
- (NSString)path;
- (int)client_type;
- (void)setBundle:(id)a3;
- (void)setClient:(id)a3;
- (void)setClient_name:(id)a3;
- (void)setClient_type:(int)a3;
- (void)setPath:(id)a3;
@end

@implementation Client

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_client_name, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setBundle:(id)a3
{
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClient_name:(id)a3
{
}

- (NSString)client_name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClient:(id)a3
{
}

- (NSString)client
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClient_type:(int)a3
{
  self->_client_type = a3;
}

- (int)client_type
{
  return self->_client_type;
}

@end