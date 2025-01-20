@interface CPSSystemAuthenticationRequest
+ (BOOL)supportsSecureCoding;
- (CPSSystemAuthenticationRequest)initWithCoder:(id)a3;
- (CPSSystemAuthenticationRequest)initWithXPCDictionary:(id)a3;
- (NSString)appleAccountAltDSID;
- (NSString)description;
- (int64_t)authType;
- (int64_t)service;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setAppleAccountAltDSID:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setService:(int64_t)a3;
@end

@implementation CPSSystemAuthenticationRequest

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v4 = self->_service - 1;
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_service);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_26528A0F0[v4];
  }
  [v3 appendString:v5 withName:@"service"];

  v6 = CUPrintFlags64();
  [v3 appendString:v6 withName:@"options"];

  id v7 = (id)[v3 appendObject:self->_appleAccountAltDSID withName:@"appleAccountAltDSID"];
  v8 = [v3 build];

  return (NSString *)v8;
}

- (int64_t)authType
{
  unint64_t v2 = *(void *)(self + 16) - 2;
  if (v2 < 3) {
    return qword_24A692698[v2];
  }
  __break(1u);
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSystemAuthenticationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSSystemAuthenticationRequest;
  v5 = [(CPSAuthenticationRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5->_service = [v4 decodeIntegerForKey:@"service"];
    v5->_options = [v4 decodeIntegerForKey:@"options"];
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"appleAccountAltDSID"];
    appleAccountAltDSID = v5->_appleAccountAltDSID;
    v5->_appleAccountAltDSID = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSSystemAuthenticationRequest;
  id v4 = a3;
  [(CPSAuthenticationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_service, @"service", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_options forKey:@"options"];
  [v4 encodeObject:self->_appleAccountAltDSID forKey:@"appleAccountAltDSID"];
}

- (CPSSystemAuthenticationRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPSSystemAuthenticationRequest;
  objc_super v5 = [(CPSAuthenticationRequest *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F29D08] coderWithMessage:v4];
    uint64_t v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(CPSAuthenticationRequest *)v5 setIdentifier:v7];

    v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
    v5->_service = [v8 integerValue];

    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    v5->_options = [v9 integerValue];

    uint64_t v10 = [v6 decodeStringForKey:@"appleAccountAltDSID"];
    appleAccountAltDSID = v5->_appleAccountAltDSID;
    v5->_appleAccountAltDSID = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v7 = [MEMORY[0x263F29D08] coderWithMessage:a3];
  id v4 = [(CPSAuthenticationRequest *)self identifier];
  [v7 encodeObject:v4 forKey:@"identifier"];

  objc_super v5 = [NSNumber numberWithInteger:self->_service];
  [v7 encodeObject:v5 forKey:@"service"];

  v6 = [NSNumber numberWithUnsignedInteger:self->_options];
  [v7 encodeObject:v6 forKey:@"options"];

  [v7 encodeObject:self->_appleAccountAltDSID forKey:@"appleAccountAltDSID"];
}

- (int64_t)service
{
  return self->_service;
}

- (void)setService:(int64_t)a3
{
  self->_service = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSString)appleAccountAltDSID
{
  return self->_appleAccountAltDSID;
}

- (void)setAppleAccountAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end