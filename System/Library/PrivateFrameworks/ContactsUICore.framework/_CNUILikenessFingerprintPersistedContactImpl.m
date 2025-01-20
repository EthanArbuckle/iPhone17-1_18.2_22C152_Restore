@interface _CNUILikenessFingerprintPersistedContactImpl
- (BOOL)hasContactIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)contactIdentifier;
- (NSString)description;
- (_CNUILikenessFingerprintPersistedContactImpl)init;
- (_CNUILikenessFingerprintPersistedContactImpl)initWithContact:(id)a3;
- (_CNUILikenessFingerprintPersistedContactImpl)initWithContactIdentifier:(id)a3;
- (unint64_t)hash;
@end

@implementation _CNUILikenessFingerprintPersistedContactImpl

- (unint64_t)hash
{
  return [MEMORY[0x263F335E8] objectHash:self->_contactIdentifier] + 527;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_CNUILikenessFingerprintPersistedContactImpl *)a3;
  BOOL v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (contactIdentifier = self->_contactIdentifier,
          (unint64_t)contactIdentifier | (unint64_t)v4->_contactIdentifier)
      && !-[NSString isEqual:](contactIdentifier, "isEqual:"))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (_CNUILikenessFingerprintPersistedContactImpl)initWithContactIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUILikenessFingerprintPersistedContactImpl;
  v5 = [(_CNUILikenessFingerprintPersistedContactImpl *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (_CNUILikenessFingerprintPersistedContactImpl)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (_CNUILikenessFingerprintPersistedContactImpl)initWithContact:(id)a3
{
  id v4 = [a3 identifier];
  v5 = [(_CNUILikenessFingerprintPersistedContactImpl *)self initWithContactIdentifier:v4];

  return v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"contactIdentifier" object:self->_contactIdentifier];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return [(NSString *)self->_contactIdentifier isEqualToString:a3];
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end