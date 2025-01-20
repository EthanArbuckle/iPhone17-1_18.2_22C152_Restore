@interface MEEmailAddress
+ (BOOL)supportsSecureCoding;
+ (id)emailAddressesForAddresses:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ECEmailAddress)emailAddressValue;
- (MEEmailAddress)initWithCoder:(id)a3;
- (MEEmailAddress)initWithRawString:(NSString *)rawString;
- (NSString)addressString;
- (NSString)rawString;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEEmailAddress

+ (id)emailAddressesForAddresses:(id)a3
{
  v3 = objc_msgSend(a3, "ef_map:", &__block_literal_global_1);
  return v3;
}

MEEmailAddress *__45__MEEmailAddress_emailAddressesForAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MEEmailAddress alloc] initWithRawString:v2];

  return v3;
}

- (MEEmailAddress)initWithRawString:(NSString *)rawString
{
  v4 = rawString;
  v10.receiver = self;
  v10.super_class = (Class)MEEmailAddress;
  v5 = [(MEEmailAddress *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 emailAddressValue];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    objc_storeStrong((id *)&v5->_convertible, v8);
  }
  return v5;
}

- (NSString)rawString
{
  return (NSString *)[(ECEmailAddressConvertible *)self->_convertible stringValue];
}

- (NSString)addressString
{
  id v2 = [(ECEmailAddressConvertible *)self->_convertible emailAddressValue];
  v3 = [v2 simpleAddress];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEEmailAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_rawString"];
  uint64_t v6 = [(MEEmailAddress *)self initWithRawString:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MEEmailAddress *)self rawString];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_rawString"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    v7 = [(MEEmailAddress *)self rawString];
    v8 = [v6 rawString];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  id v2 = [(MEEmailAddress *)self rawString];
  unint64_t v3 = [v2 hash] + 33;

  return v3;
}

- (ECEmailAddress)emailAddressValue
{
  return (ECEmailAddress *)[(ECEmailAddressConvertible *)self->_convertible emailAddressValue];
}

- (NSString)stringValue
{
  return (NSString *)[(ECEmailAddressConvertible *)self->_convertible stringValue];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(MEEmailAddress *)self rawString];
  id v6 = (void *)[v4 initWithRawString:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end