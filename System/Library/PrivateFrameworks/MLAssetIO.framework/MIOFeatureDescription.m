@interface MIOFeatureDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)optional;
- (MIOFeatureDescription)initWithSpecification:(const void *)a3;
- (MIOFeatureValueConstraint)constraint;
- (NSString)name;
- (NSString)shortDescription;
- (const)featureDescriptionSpecification;
- (id).cxx_construct;
- (id)description;
- (id)featureTypeDictionaryForModelViewer;
- (id)featureTypeStringForModelViewer;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)setShortDescription:(id)a3;
@end

@implementation MIOFeatureDescription

- (MIOFeatureDescription)initWithSpecification:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MIOFeatureDescription;
  v4 = [(MIOFeatureDescription *)&v15 init];
  v5 = (MIOFeatureDescription *)v4;
  if (v4)
  {
    CoreML::Specification::FeatureDescription::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    type = &CoreML::Specification::_FeatureType_default_instance_;
    if (v5->_featureDescriptionParams.type_) {
      type = (uint64_t *)v5->_featureDescriptionParams.type_;
    }
    switch(*((_DWORD *)type + 9))
    {
      case 4:
        v7 = [[MIOImageConstraint alloc] initWithSpecification:type[3]];
        break;
      case 5:
        v7 = [[MIOMultiArrayConstraint alloc] initWithSpecification:type[3]];
        break;
      case 6:
        uint64_t v8 = type[3];
        v9 = [MIODictionaryConstraint alloc];
        goto LABEL_11;
      case 7:
        v7 = [[MIOSequenceConstraint alloc] initWithSpecification:type[3]];
        break;
      case 8:
        uint64_t v8 = type[3];
        v9 = [MIOStateConstraint alloc];
LABEL_11:
        v7 = [(MIODictionaryConstraint *)v9 initWithSpecification:v8];
        break;
      default:
        v7 = 0;
        break;
    }
    constraint = v5->_constraint;
    v5->_constraint = (MIOFeatureValueConstraint *)v7;

    ptr = (void **)v5->_featureDescriptionParams.name_.ptr_;
    if (*((char *)ptr + 23) < 0) {
      ptr = (void **)*ptr;
    }
    uint64_t v12 = [NSString stringWithUTF8String:ptr];
    cachedName = v5->_cachedName;
    v5->_cachedName = (NSString *)v12;
  }
  return v5;
}

- (const)featureDescriptionSpecification
{
  return &self->_featureDescriptionParams;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [MIOMutableFeatureDescription alloc];
  return [(MIOFeatureDescription *)v4 initWithSpecification:&self->_featureDescriptionParams];
}

- (id)description
{
  v3 = NSString;
  v4 = [(MIOFeatureDescription *)self name];
  v5 = MIOFeatureTypeToString([(MIOFeatureDescription *)self type]);
  if ([(MIOFeatureDescription *)self optional]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  v7 = [(MIOFeatureDescription *)self constraint];
  uint64_t v8 = [(MIOFeatureDescription *)self shortDescription];
  v9 = [v3 stringWithFormat:@"MIOFeatureDescription (%@) {type: %@, optional: %s, constraint: %@, shortDescription: %@}", v4, v5, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOFeatureDescription *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MIOFeatureDescription *)self name];
      v7 = [(MIOFeatureDescription *)v5 name];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(MIOFeatureDescription *)self shortDescription];
        v10 = [(MIOFeatureDescription *)v5 shortDescription];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
          int64_t v12 = [(MIOFeatureDescription *)self type];
          if (v12 == [(MIOFeatureDescription *)v5 type])
          {
            BOOL v13 = [(MIOFeatureDescription *)self optional];
            if (v13 == [(MIOFeatureDescription *)v5 optional])
            {
              v14 = [(MIOFeatureDescription *)self constraint];
              if (v14
                && ([(MIOFeatureDescription *)v5 constraint],
                    objc_super v15 = objc_claimAutoreleasedReturnValue(),
                    v15,
                    v14,
                    v15))
              {
                v16 = [(MIOFeatureDescription *)self constraint];
                v17 = [(MIOFeatureDescription *)v5 constraint];
                char v18 = [v16 isEqual:v17];

                if (v18) {
                  goto LABEL_19;
                }
              }
              else
              {
                v20 = [(MIOFeatureDescription *)self constraint];
                if (v20)
                {
                }
                else
                {
                  v21 = [(MIOFeatureDescription *)v5 constraint];

                  if (!v21)
                  {
LABEL_19:
                    BOOL v19 = 1;
                    goto LABEL_17;
                  }
                }
              }
            }
          }
        }
      }
      BOOL v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    BOOL v19 = 0;
  }
LABEL_18:

  return v19;
}

- (unint64_t)hash
{
  v3 = [(MIOFeatureDescription *)self name];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(MIOFeatureDescription *)self type];
  BOOL v6 = [(MIOFeatureDescription *)self optional];
  v7 = [(MIOFeatureDescription *)self constraint];
  unint64_t v8 = v5 ^ v4 ^ v6 ^ [v7 hash];

  return v8;
}

- (NSString)name
{
  return self->_cachedName;
}

- (NSString)shortDescription
{
  ptr = (void **)self->_featureDescriptionParams.shortdescription_.ptr_;
  if (*((char *)ptr + 23) < 0) {
    ptr = (void **)*ptr;
  }
  return (NSString *)[NSString stringWithUTF8String:ptr];
}

- (void)setShortDescription:(id)a3
{
  id v4 = a3;
  CoreML::Specification::FeatureDescription::set_shortdescription((CoreML::Specification::FeatureDescription *)&self->_featureDescriptionParams, (char *)[v4 UTF8String]);
}

- (int64_t)type
{
  type = self->_featureDescriptionParams.type_;
  if (!type) {
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  }
  return *((unsigned int *)type + 9);
}

- (BOOL)optional
{
  type = self->_featureDescriptionParams.type_;
  if (!type) {
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  }
  return *((unsigned char *)type + 16);
}

- (MIOFeatureValueConstraint)constraint
{
  return self->_constraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraint, 0);
  objc_storeStrong((id *)&self->_cachedName, 0);
  CoreML::Specification::FeatureDescription::~FeatureDescription((CoreML::Specification::FeatureDescription *)&self->_featureDescriptionParams);
}

- (id).cxx_construct
{
  return self;
}

- (id)featureTypeStringForModelViewer
{
  if (self->_featureDescriptionParams.type_) {
    type = self->_featureDescriptionParams.type_;
  }
  else {
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  }
  CoreML::FeatureType::FeatureType((CoreML::FeatureType *)v7, (const CoreML::Specification::FeatureType *)type);
  CoreML::FeatureType::toString((CoreML::FeatureType *)v7, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  id v4 = [NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return v4;
}

- (id)featureTypeDictionaryForModelViewer
{
  if (self->_featureDescriptionParams.type_) {
    type = self->_featureDescriptionParams.type_;
  }
  else {
    type = (FeatureType *)&CoreML::Specification::_FeatureType_default_instance_;
  }
  CoreML::FeatureType::FeatureType((CoreML::FeatureType *)v15, (const CoreML::Specification::FeatureType *)type);
  CoreML::FeatureType::toDictionary((CoreML::FeatureType *)v15, (uint64_t)&v13);
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v14[1]];
  id v4 = v13;
  if (v13 != v14)
  {
    do
    {
      int64_t v5 = v4 + 7;
      if (*((char *)v4 + 79) < 0) {
        int64_t v5 = (void *)*v5;
      }
      BOOL v6 = [NSString stringWithUTF8String:v5];
      v7 = v4 + 4;
      if (*((char *)v4 + 55) < 0) {
        v7 = (void *)*v7;
      }
      unint64_t v8 = [NSString stringWithUTF8String:v7];
      [v3 setObject:v6 forKeyedSubscript:v8];

      v9 = v4[1];
      if (v9)
      {
        do
        {
          v10 = (void **)v9;
          v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (void **)v4[2];
          BOOL v11 = *v10 == v4;
          id v4 = v10;
        }
        while (!v11);
      }
      id v4 = v10;
    }
    while (v10 != v14);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v13, v14[0]);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  return v3;
}

@end