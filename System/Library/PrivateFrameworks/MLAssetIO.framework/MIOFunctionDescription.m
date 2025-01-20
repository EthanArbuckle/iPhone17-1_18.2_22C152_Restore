@interface MIOFunctionDescription
- (BOOL)isEqual:(id)a3;
- (MIOFunctionDescription)initWithSpecification:(const void *)a3 classLabels:(id)a4;
- (NSArray)classLabels;
- (NSArray)inputDescriptions;
- (NSArray)outputDescriptions;
- (NSArray)stateDescriptions;
- (NSString)name;
- (NSString)predictedFeatureName;
- (NSString)predictedProbabilitiesName;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
@end

@implementation MIOFunctionDescription

- (MIOFunctionDescription)initWithSpecification:(const void *)a3 classLabels:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIOFunctionDescription;
  v7 = [(MIOFunctionDescription *)&v12 init];
  v8 = (MIOFunctionDescription *)v7;
  if (v7)
  {
    CoreML::Specification::FunctionDescription::CopyFrom((std::string *)(v7 + 8), (std::string *)a3);
    uint64_t v9 = [v6 copy];
    classLabels = v8->_classLabels;
    v8->_classLabels = (NSArray *)v9;
  }
  return v8;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"MIOFunctionDescription (%p)\n", self);
  v4 = [(MIOFunctionDescription *)self inputDescriptions];
  v5 = [v4 componentsJoinedByString:@"\n    "];
  [v3 appendFormat:@"  inputDescriptions:\n    %@\n", v5];

  id v6 = [(MIOFunctionDescription *)self outputDescriptions];
  v7 = [v6 componentsJoinedByString:@"\n    "];
  [v3 appendFormat:@"  outputDescriptions:\n    %@\n", v7];

  v8 = [(MIOFunctionDescription *)self predictedFeatureName];

  if (v8)
  {
    uint64_t v9 = [(MIOFunctionDescription *)self predictedFeatureName];
    [v3 appendFormat:@"  predictedFeatureName: %@\n", v9];
  }
  v10 = [(MIOFunctionDescription *)self predictedProbabilitiesName];

  if (v10)
  {
    v11 = [(MIOFunctionDescription *)self predictedProbabilitiesName];
    [v3 appendFormat:@"  predictedProbabilitiesName: %@\n", v11];
  }
  objc_super v12 = [(MIOFunctionDescription *)self classLabels];

  if (v12)
  {
    v13 = [(MIOFunctionDescription *)self classLabels];
    [v3 appendFormat:@"  classLabels: %@\n", v13];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOFunctionDescription *)a3;
  if (self == v4)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MIOFunctionDescription *)self name];
      v7 = [(MIOFunctionDescription *)v5 name];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v9 = [(MIOFunctionDescription *)self inputDescriptions];
      v10 = [(MIOFunctionDescription *)v5 inputDescriptions];
      char v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
      objc_super v12 = [(MIOFunctionDescription *)self outputDescriptions];
      v13 = [(MIOFunctionDescription *)v5 outputDescriptions];
      char v14 = [v12 isEqual:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_10;
      }
      v15 = [(MIOFunctionDescription *)self predictedFeatureName];
      v16 = [(MIOFunctionDescription *)v5 predictedFeatureName];
      char v17 = nullSafeEqual(v15, v16);

      if (v17)
      {
        v18 = [(MIOFunctionDescription *)self predictedProbabilitiesName];
        v19 = [(MIOFunctionDescription *)v5 predictedProbabilitiesName];
        char v20 = nullSafeEqual(v18, v19);
      }
      else
      {
LABEL_10:
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  v2 = [(MIOFunctionDescription *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  ptr = (void **)self->_functionDescriptionParams.name_.ptr_;
  if (*((char *)ptr + 23) < 0) {
    ptr = (void **)*ptr;
  }
  return (NSString *)[NSString stringWithUTF8String:ptr];
}

- (NSArray)inputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.input_);
}

- (NSArray)outputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.output_);
}

- (NSArray)stateDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_functionDescriptionParams.state_);
}

- (NSString)predictedFeatureName
{
  ptr = self->_functionDescriptionParams.predictedfeaturename_.ptr_;
  if (((char)ptr[23] & 0x80000000) == 0)
  {
    if (!ptr[23]) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v3 = [NSString stringWithUTF8String:ptr];
    goto LABEL_8;
  }
  if (*((void *)ptr + 1))
  {
    ptr = *(unsigned char **)ptr;
    goto LABEL_6;
  }
LABEL_7:
  unint64_t v3 = 0;
LABEL_8:
  return (NSString *)v3;
}

- (NSString)predictedProbabilitiesName
{
  ptr = self->_functionDescriptionParams.predictedprobabilitiesname_.ptr_;
  if (((char)ptr[23] & 0x80000000) == 0)
  {
    if (!ptr[23]) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v3 = [NSString stringWithUTF8String:ptr];
    goto LABEL_8;
  }
  if (*((void *)ptr + 1))
  {
    ptr = *(unsigned char **)ptr;
    goto LABEL_6;
  }
LABEL_7:
  unint64_t v3 = 0;
LABEL_8:
  return (NSString *)v3;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabels, 0);
  CoreML::Specification::FunctionDescription::~FunctionDescription((CoreML::Specification::FunctionDescription *)&self->_functionDescriptionParams);
}

- (id).cxx_construct
{
  return self;
}

@end