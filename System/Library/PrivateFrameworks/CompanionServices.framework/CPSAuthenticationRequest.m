@interface CPSAuthenticationRequest
+ (BOOL)supportsSecureCoding;
- (CPSAuthenticationRequest)init;
- (CPSAuthenticationRequest)initWithCoder:(id)a3;
- (NSString)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CPSAuthenticationRequest

- (CPSAuthenticationRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAuthenticationRequest;
  v2 = [(CPSAuthenticationRequest *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSAuthenticationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSAuthenticationRequest;
  v5 = [(CPSAuthenticationRequest *)&v10 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end