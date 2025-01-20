@interface MIOSequenceConstraint
- (BOOL)isEqual:(id)a3;
- (MIOFeatureDescription)valueDescription;
- (MIOSequenceConstraint)initWithSpecification:(const void *)a3;
- (NSString)description;
- (_MIORange)countRange;
- (const)sequenceFeatureTypeSpecification;
- (id).cxx_construct;
- (unint64_t)hash;
@end

@implementation MIOSequenceConstraint

- (MIOSequenceConstraint)initWithSpecification:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MIOSequenceConstraint;
  v4 = [(MIOSequenceConstraint *)&v15 init];
  v5 = (MIOSequenceConstraint *)v4;
  if (v4)
  {
    CoreML::Specification::SequenceFeatureType::CopyFrom((std::string *)(v4 + 8), (std::string *)a3);
    CoreML::Specification::FeatureDescription::FeatureDescription((CoreML::Specification::FeatureDescription *)v12);
    std::string::basic_string[abi:ne180100]<0>(&v16, "values");
    google::protobuf::internal::ArenaStringPtr::SetNoArena(&v13, (uint64_t)&google::protobuf::internal::fixed_address_empty_string, &v16);
    if (v17 < 0) {
      operator delete((void *)v16.n128_u64[0]);
    }
    int v6 = *((_DWORD *)a3 + 9);
    if (v6 == 1)
    {
      v8 = v14;
      if (!v14) {
        operator new();
      }
      if (*((_DWORD *)v14 + 9) != 1)
      {
        CoreML::Specification::FeatureType::clear_Type((uint64_t)v14);
        *((_DWORD *)v8 + 9) = 1;
        operator new();
      }
    }
    else if (v6 == 3)
    {
      v7 = v14;
      if (!v14) {
        operator new();
      }
      if (*((_DWORD *)v14 + 9) != 3)
      {
        CoreML::Specification::FeatureType::clear_Type((uint64_t)v14);
        *((_DWORD *)v7 + 9) = 3;
        operator new();
      }
    }
    v9 = [[MIOFeatureDescription alloc] initWithSpecification:v12];
    valueDescription = v5->_valueDescription;
    v5->_valueDescription = v9;

    CoreML::Specification::FeatureDescription::~FeatureDescription((CoreML::Specification::FeatureDescription *)v12);
  }
  return v5;
}

- (const)sequenceFeatureTypeSpecification
{
  return &self->_sequenceFeatureTypeParams;
}

- (NSString)description
{
  uint64_t v3 = [(MIOSequenceConstraint *)self countRange];
  uint64_t v5 = v4;
  int v6 = NSString;
  v7 = [(MIOSequenceConstraint *)self valueDescription];
  v8 = [v6 stringWithFormat:@"MIOSequenceConstraint { countRange: [%zd, %zd], valueDescription: %@ }", v3, v5, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MIOSequenceConstraint *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(MIOSequenceConstraint *)self countRange];
      uint64_t v8 = v7;
      uint64_t v9 = [(MIOSequenceConstraint *)v5 countRange];
      if (MIOEqualRanges(v6, v8, v9, v10))
      {
        v11 = [(MIOSequenceConstraint *)self valueDescription];
        v12 = [(MIOSequenceConstraint *)v5 valueDescription];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(MIOSequenceConstraint *)self countRange];
  [(MIOSequenceConstraint *)self countRange];
  uint64_t v5 = v4;
  uint64_t v6 = [(MIOSequenceConstraint *)self valueDescription];
  unint64_t v7 = v5 ^ v3 ^ [v6 hash];

  return v7;
}

- (_MIORange)countRange
{
  sizerange = self->_sequenceFeatureTypeParams.sizerange_;
  if (!sizerange) {
    sizerange = (SizeRange *)&CoreML::Specification::_SizeRange_default_instance_;
  }
  uint64_t v3 = *((void *)sizerange + 2);
  uint64_t v4 = *((void *)sizerange + 3);
  if (v4 <= 0) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = v4;
  }
  int64_t v6 = MIOMakeRange(v3, v5);
  result.upperBound = v7;
  result.lowerBound = v6;
  return result;
}

- (MIOFeatureDescription)valueDescription
{
  return self->_valueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDescription, 0);
  CoreML::Specification::SequenceFeatureType::~SequenceFeatureType((CoreML::Specification::SequenceFeatureType *)&self->_sequenceFeatureTypeParams);
}

- (id).cxx_construct
{
  return self;
}

@end