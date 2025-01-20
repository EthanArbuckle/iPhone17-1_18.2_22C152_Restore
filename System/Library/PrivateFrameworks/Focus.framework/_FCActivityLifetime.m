@interface _FCActivityLifetime
- (BOOL)isEqual:(id)a3;
- (DNDLifetimeDetails)_dndLifetimeDetails;
- (NSString)description;
- (NSString)lifetimeIdentifier;
- (NSString)lifetimeMetadata;
- (NSString)lifetimeName;
- (_FCActivityLifetime)initWithLifetimeDetails:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _FCActivityLifetime

- (_FCActivityLifetime)initWithLifetimeDetails:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FCActivityLifetime;
  v6 = [(_FCActivityLifetime *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dndLifetimeDetails, a3);
  }

  return v7;
}

- (NSString)lifetimeIdentifier
{
  return (NSString *)[(DNDLifetimeDetails *)self->_dndLifetimeDetails identifier];
}

- (NSString)lifetimeName
{
  return (NSString *)[(DNDLifetimeDetails *)self->_dndLifetimeDetails name];
}

- (NSString)lifetimeMetadata
{
  return (NSString *)[(DNDLifetimeDetails *)self->_dndLifetimeDetails metadata];
}

- (unint64_t)hash
{
  return [(DNDLifetimeDetails *)self->_dndLifetimeDetails hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_FCActivityLifetime *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v5 = [(_FCActivityLifetime *)self lifetimeIdentifier];
  v6 = [(_FCActivityLifetime *)self lifetimeName];
  v7 = [(_FCActivityLifetime *)self lifetimeMetadata];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; lifetimeIdentifier: %@; lifetimeName: %@; lifetimeMetadata: %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  char v5 = (void *)[(DNDLifetimeDetails *)self->_dndLifetimeDetails copy];
  v6 = (void *)[v4 initWithLifetimeDetails:v5];

  return v6;
}

- (DNDLifetimeDetails)_dndLifetimeDetails
{
  return self->_dndLifetimeDetails;
}

- (void).cxx_destruct
{
}

@end