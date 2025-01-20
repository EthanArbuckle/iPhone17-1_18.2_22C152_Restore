@interface SOKerberosCredential
- (NSString)name;
- (NSString)uuid;
- (SOKerberosCredential)init;
- (unsigned)lifetime;
- (void)setLifetime:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation SOKerberosCredential

- (SOKerberosCredential)init
{
  v5.receiver = self;
  v5.super_class = (Class)SOKerberosCredential;
  v2 = [(SOKerberosCredential *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SOKerberosCredential *)v2 setName:&stru_26D3372C0];
    [(SOKerberosCredential *)v3 setLifetime:0];
    [(SOKerberosCredential *)v3 setUuid:&stru_26D3372C0];
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (unsigned)lifetime
{
  return self->_lifetime;
}

- (void)setLifetime:(unsigned int)a3
{
  self->_lifetime = a3;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end