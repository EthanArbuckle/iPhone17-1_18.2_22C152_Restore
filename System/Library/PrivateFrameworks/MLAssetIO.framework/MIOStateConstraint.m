@interface MIOStateConstraint
- (BOOL)isEqual:(id)a3;
- (MIOStateConstraint)initWithSpecification:(const void *)a3;
- (NSArray)bufferShape;
- (NSString)description;
- (const)stateFeatureTypeSpecification;
- (id).cxx_construct;
- (int64_t)dataType;
- (unint64_t)hash;
@end

@implementation MIOStateConstraint

- (MIOStateConstraint)initWithSpecification:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MIOStateConstraint;
  v4 = [(MIOStateConstraint *)&v15 init];
  v5 = (MIOStateConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::StateFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    v6 = (CoreML::Specification::ArrayFeatureType *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = (NSArray *)v6;
    if (*((_DWORD *)a3 + 7) == 1) {
      v8 = (uint64_t *)*((void *)a3 + 2);
    }
    else {
      v8 = CoreML::Specification::ArrayFeatureType::default_instance(v6);
    }
    uint64_t v9 = v8[3];
    if (v9) {
      v10 = (void *)(v9 + 8);
    }
    else {
      v10 = 0;
    }
    if (v9) {
      uint64_t v11 = v9 + 8 + 8 * *((int *)v8 + 4);
    }
    else {
      uint64_t v11 = 0;
    }
    for (; v10 != (void *)v11; ++v10)
    {
      v12 = [NSNumber numberWithLongLong:*v10];
      [(NSArray *)v7 addObject:v12];
    }
    bufferShape = v5->_bufferShape;
    v5->_bufferShape = v7;
  }
  return v5;
}

- (const)stateFeatureTypeSpecification
{
  return &self->_stateFeatureTypeParams;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(MIOStateConstraint *)self bufferShape];
  v5 = [v4 componentsJoinedByString:@", "];
  v6 = MIOMultiArrayDataTypeToString([(MIOStateConstraint *)self dataType]);
  v7 = [v3 stringWithFormat:@"MIOStateConstraint { bufferShape: [%@] dataType: %@ }", v5, v6];

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOStateConstraint *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MIOStateConstraint *)self bufferShape];
      v7 = [(MIOStateConstraint *)v5 bufferShape];
      char v8 = [v6 isEqual:v7];

      if (v8)
      {
        int64_t v9 = [(MIOStateConstraint *)self dataType];
        BOOL v10 = v9 == [(MIOStateConstraint *)v5 dataType];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(MIOStateConstraint *)self bufferShape];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v6 ^= [*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return [(MIOStateConstraint *)self dataType] ^ v6;
}

- (int64_t)dataType
{
  if (self->_stateFeatureTypeParams._oneof_case_[0] == 1) {
    arraytype = (uint64_t *)self->_stateFeatureTypeParams.Type_.arraytype_;
  }
  else {
    arraytype = CoreML::Specification::ArrayFeatureType::default_instance((CoreML::Specification::ArrayFeatureType *)self);
  }
  int64_t result = 65600;
  int v4 = *((_DWORD *)arraytype + 9);
  if (v4 > 65599)
  {
    if (v4 == 131104) {
      return 131104;
    }
  }
  else if (v4 == 65552)
  {
    return 65552;
  }
  else if (v4 == 65568)
  {
    return 65568;
  }
  return result;
}

- (NSArray)bufferShape
{
  return self->_bufferShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferShape, 0);
  CoreML::Specification::StateFeatureType::~StateFeatureType((CoreML::Specification::StateFeatureType *)&self->_stateFeatureTypeParams);
}

- (id).cxx_construct
{
  return self;
}

@end