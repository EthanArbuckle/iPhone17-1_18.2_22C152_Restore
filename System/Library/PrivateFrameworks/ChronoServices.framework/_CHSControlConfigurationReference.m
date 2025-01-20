@interface _CHSControlConfigurationReference
- (CHSControlIdentity)controlIdentity;
- (NSString)uniqueIdentifier;
- (_CHSControlConfigurationReference)initWithControlIdentity:(id)a3 uniqueIdentifier:(id)a4;
@end

@implementation _CHSControlConfigurationReference

- (_CHSControlConfigurationReference)initWithControlIdentity:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CHSControlConfigurationReference;
  v8 = [(_CHSControlConfigurationReference *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    controlIdentity = v8->_controlIdentity;
    v8->_controlIdentity = (CHSControlIdentity *)v9;

    uint64_t v11 = [v7 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v11;
  }
  return v8;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSControlIdentity)controlIdentity
{
  return self->_controlIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_controlIdentity, 0);
}

@end