@interface MIODictionaryConstraint
- (BOOL)isEqual:(id)a3;
- (MIODictionaryConstraint)initWithSpecification:(const void *)a3;
- (NSString)description;
- (const)dictionaryFeatureTypeSpecification;
- (id).cxx_construct;
- (int64_t)keyType;
@end

@implementation MIODictionaryConstraint

- (MIODictionaryConstraint)initWithSpecification:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MIODictionaryConstraint;
  v4 = [(MIODictionaryConstraint *)&v7 init];
  v5 = (MIODictionaryConstraint *)v4;
  if (v4) {
    CoreML::Specification::DictionaryFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
  }
  return v5;
}

- (const)dictionaryFeatureTypeSpecification
{
  return &self->_dictionaryFeatureTypeParams;
}

- (NSString)description
{
  v2 = NSString;
  v3 = MIOFeatureTypeToString([(MIODictionaryConstraint *)self keyType]);
  v4 = [v2 stringWithFormat:@"MIODictionaryConstraint { keyType: %@ }", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIODictionaryConstraint *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(MIODictionaryConstraint *)self keyType];
      BOOL v7 = v6 == [(MIODictionaryConstraint *)v5 keyType];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (int64_t)keyType
{
  unsigned int v2 = self->_dictionaryFeatureTypeParams._oneof_case_[0];
  int64_t v3 = 3;
  if (v2 != 2) {
    int64_t v3 = 0;
  }
  if (v2 == 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end