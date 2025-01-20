@interface PKPushCredentials
- (NSData)token;
- (PKPushType)type;
- (void)setToken:(id)a3;
- (void)setType:(id)a3;
@end

@implementation PKPushCredentials

- (NSData)token
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setType:(id)a3
{
}

- (void)setToken:(id)a3
{
}

- (PKPushType)type
{
  return (PKPushType)objc_getProperty(self, a2, 8, 1);
}

@end