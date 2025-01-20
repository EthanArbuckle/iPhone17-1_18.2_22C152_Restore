@interface MIPersonaAttributes
- (MIPersonaAttributes)initWithPersonaString:(id)a3 personaType:(unint64_t)a4 associatedBundleIDs:(id)a5;
- (NSSet)bundleIDs;
- (NSString)personaUniqueString;
- (unint64_t)personaType;
@end

@implementation MIPersonaAttributes

- (MIPersonaAttributes)initWithPersonaString:(id)a3 personaType:(unint64_t)a4 associatedBundleIDs:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MIPersonaAttributes;
  v11 = [(MIPersonaAttributes *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personaUniqueString, a3);
    v12->_personaType = a4;
    objc_storeStrong((id *)&v12->_bundleIDs, a5);
  }

  return v12;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (unint64_t)personaType
{
  return self->_personaType;
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
}

@end