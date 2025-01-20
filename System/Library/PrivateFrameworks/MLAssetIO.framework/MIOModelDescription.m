@interface MIOModelDescription
- (BOOL)isEqual:(id)a3;
- (BOOL)updatable;
- (MIOModelDescription)initWithSpecification:(const void *)a3 isUpdatable:(BOOL)a4 modelParameters:(id)a5 classLabelsPerFunction:(id)a6 error:(id *)a7;
- (NSArray)classLabels;
- (NSArray)functionDescriptions;
- (NSArray)inputDescriptions;
- (NSArray)outputDescriptions;
- (NSArray)stateDescriptions;
- (NSArray)trainingInputDescriptions;
- (NSDictionary)metadata;
- (NSDictionary)parameterDescriptionsByKey;
- (NSString)defaultFunctionName;
- (NSString)predictedFeatureName;
- (NSString)predictedProbabilitiesName;
- (const)modelDescriptionSpecification;
- (id).cxx_construct;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5;
- (void)_setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5;
- (void)_setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5;
- (void)_setShortDescription:(id)a3 forTrainingInputFeatureWithName:(id)a4;
- (void)setMetadata:(id)a3;
@end

@implementation MIOModelDescription

- (MIOModelDescription)initWithSpecification:(const void *)a3 isUpdatable:(BOOL)a4 modelParameters:(id)a5 classLabelsPerFunction:(id)a6 error:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v49 = a5;
  id v50 = a6;
  v55.receiver = self;
  v55.super_class = (Class)MIOModelDescription;
  v11 = [(MIOModelDescription *)&v55 init];
  v12 = (id *)v11;
  if (!v11)
  {
LABEL_47:
    v41 = v12;
    goto LABEL_48;
  }
  if (*((_DWORD *)a3 + 24))
  {
    if ([v50 count] != *((_DWORD *)a3 + 24))
    {
      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = [v50 count];
    }
  }
  else if ([v50 count] != 1)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = [v50 count];
  }
  CoreML::Specification::ModelDescription::CopyFrom((std::string *)(v11 + 8), (std::string *)a3);
  v11[192] = a4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v18 = v49;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v23 = [v22 key];
        [v17 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v19);
  }

  objc_storeStrong((id *)v11 + 25, v17);
  uint64_t v24 = [v50 copy];
  v25 = (void *)*((void *)v11 + 23);
  *((void *)v11 + 23) = v24;

  uint64_t v26 = *((int *)a3 + 24);
  if (!v26)
  {
    uint64_t v27 = 0;
LABEL_44:
    v42 = [v12[23] objectAtIndexedSubscript:v27];
    v43 = [MEMORY[0x1E4F1CA98] null];
    BOOL v44 = v42 == v43;

    if (!v44)
    {
      uint64_t v45 = [v12[23] objectAtIndexedSubscript:v27];
      id v46 = v12[26];
      v12[26] = (id)v45;
    }
    goto LABEL_47;
  }
  uint64_t v27 = 0;
  v28 = (unsigned __int8 *)*((void *)a3 + 19);
  uint64_t v29 = *((void *)a3 + 13);
  if (v29) {
    uint64_t v30 = v29 + 8;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = v30 + 8 * v26;
  int v32 = (char)v28[23];
  if (v32 >= 0) {
    uint64_t v33 = v28[23];
  }
  else {
    uint64_t v33 = *((void *)v28 + 1);
  }
  do
  {
    v34 = *(unsigned __int8 **)(*(void *)v30 + 88);
    uint64_t v35 = v34[23];
    if ((v35 & 0x80u) == 0) {
      uint64_t v36 = v34[23];
    }
    else {
      uint64_t v36 = *((void *)v34 + 1);
    }
    if (v36 == v33)
    {
      if (v32 >= 0) {
        v37 = v28;
      }
      else {
        v37 = *(unsigned __int8 **)v28;
      }
      if ((v35 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)v34, v37, *((void *)v34 + 1))) {
          goto LABEL_36;
        }
      }
      else
      {
        if (!v34[23]) {
          goto LABEL_36;
        }
        while (*v34 == *v37)
        {
          ++v34;
          ++v37;
          if (!--v35) {
            goto LABEL_36;
          }
        }
      }
    }
    ++v27;
    v30 += 8;
  }
  while (v30 != v31);
  uint64_t v27 = ((v26 - 1) & 0x1FFFFFFFFFFFFFFFLL) + 1;
LABEL_36:
  if (v27 != v26 && v27 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_44;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MIOModelDescription initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:]();
  }
  if (a7)
  {
    v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v39 = [NSString stringWithFormat:@"The default function was not found."];
    v57 = v39;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    *a7 = [v38 errorWithDomain:@"com.apple.mlassetio" code:1 userInfo:v40];
  }
  v41 = 0;
LABEL_48:

  return v41;
}

- (const)modelDescriptionSpecification
{
  return &self->_modelDescriptionParams;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [MIOMutableModelDescription alloc];
  BOOL v5 = [(MIOModelDescription *)self updatable];
  v6 = [(MIOModelDescription *)self parameterDescriptionsByKey];
  v7 = [v6 allValues];
  v8 = [(MIOModelDescription *)v4 initWithSpecification:&self->_modelDescriptionParams isUpdatable:v5 modelParameters:v7 classLabelsPerFunction:self->_classLabelsPerFunction error:0];

  return v8;
}

- (id)description
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"MIOModelDescription (%p)\n", self);
  v4 = [(MIOModelDescription *)self inputDescriptions];
  BOOL v5 = [v4 componentsJoinedByString:@"\n    "];
  [v3 appendFormat:@"  inputDescriptions:\n    %@\n", v5];

  v6 = [(MIOModelDescription *)self outputDescriptions];
  v7 = [v6 componentsJoinedByString:@"\n    "];
  [v3 appendFormat:@"  outputDescriptions:\n    %@\n", v7];

  v8 = [(MIOModelDescription *)self metadata];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [v3 appendFormat:@"  metadata:\n"];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v10 = [(MIOModelDescription *)self metadata];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          v15 = [(MIOModelDescription *)self metadata];
          uint64_t v16 = [v15 objectForKeyedSubscript:v14];
          [v3 appendFormat:@"    %@ -> %@\n", v14, v16];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v11);
    }
  }
  id v17 = [(MIOModelDescription *)self predictedFeatureName];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    uint64_t v19 = [(MIOModelDescription *)self predictedFeatureName];
    [v3 appendFormat:@"  predictedFeatureName: %@\n", v19];
  }
  uint64_t v20 = [(MIOModelDescription *)self predictedProbabilitiesName];
  BOOL v21 = v20 == 0;

  if (!v21)
  {
    v22 = [(MIOModelDescription *)self predictedProbabilitiesName];
    [v3 appendFormat:@"  predictedProbabilitiesName: %@\n", v22];
  }
  BOOL v23 = [(MIOModelDescription *)self updatable];
  uint64_t v24 = "NO";
  if (v23) {
    uint64_t v24 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @"  updatable: %s\n", v24);
  if ([(MIOModelDescription *)self updatable])
  {
    v25 = [(MIOModelDescription *)self trainingInputDescriptions];
    uint64_t v26 = [v25 componentsJoinedByString:@"\n    "];
    [v3 appendFormat:@"  trainingInputDescriptions:\n    %@\n", v26];
  }
  uint64_t v27 = [(MIOModelDescription *)self parameterDescriptionsByKey];
  BOOL v28 = [v27 count] == 0;

  if (!v28)
  {
    [v3 appendFormat:@"  parameterDescriptions:\n"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v29 = [(MIOModelDescription *)self parameterDescriptionsByKey];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void *)(*((void *)&v42 + 1) + 8 * j);
          v34 = [(MIOModelDescription *)self parameterDescriptionsByKey];
          uint64_t v35 = [v34 objectForKeyedSubscript:v33];
          [v3 appendFormat:@"    %@ -> %@\n", v33, v35];
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v30);
    }
  }
  uint64_t v36 = [(MIOModelDescription *)self defaultFunctionName];
  BOOL v37 = v36 == 0;

  if (!v37)
  {
    v38 = [(MIOModelDescription *)self defaultFunctionName];
    [v3 appendFormat:@"  defaultFunctionName: %@\n", v38];

    v39 = [(MIOModelDescription *)self functionDescriptions];
    v40 = [v39 componentsJoinedByString:@"\n    "];
    [v3 appendFormat:@"  functions:\n    %@\n", v40];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MIOModelDescription *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      v6 = [(MIOModelDescription *)self inputDescriptions];
      v7 = [(MIOModelDescription *)v5 inputDescriptions];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v9 = [(MIOModelDescription *)self outputDescriptions];
      v10 = [(MIOModelDescription *)v5 outputDescriptions];
      char v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v12 = [(MIOModelDescription *)self stateDescriptions];
      v13 = [(MIOModelDescription *)v5 stateDescriptions];
      char v14 = [v12 isEqual:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_22;
      }
      v15 = [(MIOModelDescription *)self metadata];
      uint64_t v16 = [(MIOModelDescription *)v5 metadata];
      char v17 = [v15 isEqual:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_22;
      }
      BOOL v18 = [(MIOModelDescription *)self predictedFeatureName];
      if (v18)
      {
      }
      else
      {
        uint64_t v20 = [(MIOModelDescription *)v5 predictedFeatureName];

        if (!v20) {
          goto LABEL_13;
        }
      }
      BOOL v21 = [(MIOModelDescription *)self predictedFeatureName];
      v22 = [(MIOModelDescription *)v5 predictedFeatureName];
      char v23 = [v21 isEqual:v22];

      if ((v23 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_13:
      uint64_t v24 = [(MIOModelDescription *)self predictedProbabilitiesName];
      if (v24)
      {
      }
      else
      {
        v25 = [(MIOModelDescription *)v5 predictedProbabilitiesName];

        if (!v25) {
          goto LABEL_17;
        }
      }
      uint64_t v26 = [(MIOModelDescription *)self predictedProbabilitiesName];
      uint64_t v27 = [(MIOModelDescription *)v5 predictedProbabilitiesName];
      char v28 = [v26 isEqual:v27];

      if ((v28 & 1) == 0) {
        goto LABEL_22;
      }
LABEL_17:
      uint64_t v29 = [(MIOModelDescription *)self classLabels];
      if (v29)
      {
      }
      else
      {
        uint64_t v30 = [(MIOModelDescription *)v5 classLabels];

        if (!v30)
        {
LABEL_21:
          BOOL v34 = [(MIOModelDescription *)self updatable];
          if (v34 == [(MIOModelDescription *)v5 updatable])
          {
            if (![(MIOModelDescription *)self updatable]
              || ([(MIOModelDescription *)self trainingInputDescriptions],
                  uint64_t v36 = objc_claimAutoreleasedReturnValue(),
                  [(MIOModelDescription *)v5 trainingInputDescriptions],
                  BOOL v37 = objc_claimAutoreleasedReturnValue(),
                  char v38 = [v36 isEqual:v37],
                  v37,
                  v36,
                  (v38 & 1) != 0))
            {
              v39 = [(MIOModelDescription *)self parameterDescriptionsByKey];
              v40 = [(MIOModelDescription *)v5 parameterDescriptionsByKey];
              char v19 = [v39 isEqual:v40];

              goto LABEL_23;
            }
          }
LABEL_22:
          char v19 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      uint64_t v31 = [(MIOModelDescription *)self classLabels];
      int v32 = [(MIOModelDescription *)v5 classLabels];
      char v33 = [v31 isEqual:v32];

      if ((v33 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    char v19 = 0;
  }
LABEL_24:

  return v19;
}

- (unint64_t)hash
{
  BOOL v18 = [(MIOModelDescription *)self inputDescriptions];
  uint64_t v15 = [v18 hash];
  char v17 = [(MIOModelDescription *)self outputDescriptions];
  uint64_t v3 = [v17 hash];
  uint64_t v16 = [(MIOModelDescription *)self metadata];
  uint64_t v4 = [v16 hash];
  BOOL v5 = [(MIOModelDescription *)self predictedFeatureName];
  uint64_t v6 = [v5 hash];
  v7 = [(MIOModelDescription *)self predictedProbabilitiesName];
  uint64_t v8 = [v7 hash];
  BOOL v9 = [(MIOModelDescription *)self updatable];
  v10 = [(MIOModelDescription *)self trainingInputDescriptions];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(MIOModelDescription *)self parameterDescriptionsByKey];
  unint64_t v13 = v3 ^ v15 ^ v4 ^ v6 ^ v8 ^ v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (NSString)defaultFunctionName
{
  if (self->_modelDescriptionParams.functions_.current_size_)
  {
    ptr = (void **)self->_modelDescriptionParams.defaultfunctionname_.ptr_;
    if (*((char *)ptr + 23) < 0) {
      ptr = (void **)*ptr;
    }
    uint64_t v3 = [NSString stringWithUTF8String:ptr];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (NSArray)functionDescriptions
{
  uint64_t v3 = self->_classLabelsPerFunction;
  uint64_t current_size = self->_modelDescriptionParams.functions_.current_size_;
  if (current_size)
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:current_size];
    rep = self->_modelDescriptionParams.functions_.rep_;
    if (rep) {
      v7 = (char *)rep + 8;
    }
    else {
      v7 = 0;
    }
    uint64_t v8 = self->_modelDescriptionParams.functions_.current_size_;
    if (v8)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 8 * v8;
      do
      {
        uint64_t v11 = *(void *)&v7[8 * v9];
        uint64_t v12 = [(NSArray *)v3 objectAtIndexedSubscript:v9];
        unint64_t v13 = [MEMORY[0x1E4F1CA98] null];

        if (v12 == v13)
        {

          uint64_t v12 = 0;
        }
        char v14 = [[MIOFunctionDescription alloc] initWithSpecification:v11 classLabels:v12];
        [v5 addObject:v14];
        ++v9;

        v10 -= 8;
      }
      while (v10);
    }
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSArray)inputDescriptions
{
  if (self->_modelDescriptionParams.functions_.current_size_) {
    p_input = (RepeatedPtrField<CoreML::Specification::FeatureDescription> *)(defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
  }
                                                                            + 16);
  else {
    p_input = &self->_modelDescriptionParams.input_;
  }
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)p_input);
}

- (NSArray)outputDescriptions
{
  if (self->_modelDescriptionParams.functions_.current_size_) {
    p_output = (RepeatedPtrField<CoreML::Specification::FeatureDescription> *)(defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
  }
                                                                             + 40);
  else {
    p_output = &self->_modelDescriptionParams.output_;
  }
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)p_output);
}

- (NSArray)stateDescriptions
{
  if (self->_modelDescriptionParams.functions_.current_size_) {
    p_state = (RepeatedPtrField<CoreML::Specification::FeatureDescription> *)(defaultFunctionDescriptionSpecification((const CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams)
  }
                                                                            + 64);
  else {
    p_state = &self->_modelDescriptionParams.state_;
  }
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)p_state);
}

- (NSDictionary)metadata
{
  if (self->_modelDescriptionParams.metadata_) {
    return (NSDictionary *)NSDictionaryFromModelMetadataSpecification((const CoreML::Specification::Metadata *)self->_modelDescriptionParams.metadata_);
  }
  else {
    return (NSDictionary *)NSDictionaryFromModelMetadataSpecification((const CoreML::Specification::Metadata *)&CoreML::Specification::_Metadata_default_instance_);
  }
}

- (NSString)predictedFeatureName
{
  ptr = (void **)self->_modelDescriptionParams.predictedfeaturename_.ptr_;
  if (*((char *)ptr + 23) < 0) {
    ptr = (void **)*ptr;
  }
  return (NSString *)[NSString stringWithUTF8String:ptr];
}

- (NSString)predictedProbabilitiesName
{
  ptr = (void **)self->_modelDescriptionParams.predictedprobabilitiesname_.ptr_;
  if (*((char *)ptr + 23) < 0) {
    ptr = (void **)*ptr;
  }
  return (NSString *)[NSString stringWithUTF8String:ptr];
}

- (NSArray)trainingInputDescriptions
{
  return (NSArray *)NSArrayFromFeatureDescriptionSpecifications((uint64_t)&self->_modelDescriptionParams.traininginput_);
}

- (void)_setShortDescription:(id)a3 forInputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v9 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 UTF8String]);
    setShortDescription((uint64_t)&self->_modelDescriptionParams.input_, v28, &__str);
    goto LABEL_30;
  }
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v12 UTF8String]);
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep) {
    char v14 = (char *)rep + 8;
  }
  else {
    char v14 = 0;
  }
  uint64_t current_size = self->_modelDescriptionParams.functions_.current_size_;
  uint64_t v16 = &v14[8 * current_size];
  if (current_size)
  {
    if ((v29 & 0x80u) == 0) {
      unint64_t v17 = v29;
    }
    else {
      unint64_t v17 = (unint64_t)v28[1];
    }
    if ((v29 & 0x80u) == 0) {
      BOOL v18 = v28;
    }
    else {
      BOOL v18 = (void **)v28[0];
    }
    do
    {
      char v19 = *(unsigned __int8 **)(*(void *)v14 + 88);
      uint64_t v20 = v19[23];
      if ((v20 & 0x80u) == 0) {
        BOOL v21 = (void *)v19[23];
      }
      else {
        BOOL v21 = (void *)*((void *)v19 + 1);
      }
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((void *)v19 + 1))) {
            goto LABEL_25;
          }
        }
        else
        {
          if (!v19[23]) {
            goto LABEL_25;
          }
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20) {
              goto LABEL_25;
            }
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16) {
      goto LABEL_27;
    }
  }
  char v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = [v12 UTF8String];
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E4F1C3C8], @"No input feature named: %s was found.", v24);
  char v14 = v16;
LABEL_27:
  uint64_t v25 = *(void *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  setShortDescription(v25 + 16, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if ((char)v29 < 0) {
    operator delete(v28[0]);
  }
}

- (void)_setShortDescription:(id)a3 forOutputFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v9 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 UTF8String]);
    setShortDescription((uint64_t)&self->_modelDescriptionParams.output_, v28, &__str);
    goto LABEL_30;
  }
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v12 UTF8String]);
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep) {
    char v14 = (char *)rep + 8;
  }
  else {
    char v14 = 0;
  }
  uint64_t current_size = self->_modelDescriptionParams.functions_.current_size_;
  uint64_t v16 = &v14[8 * current_size];
  if (current_size)
  {
    if ((v29 & 0x80u) == 0) {
      unint64_t v17 = v29;
    }
    else {
      unint64_t v17 = (unint64_t)v28[1];
    }
    if ((v29 & 0x80u) == 0) {
      BOOL v18 = v28;
    }
    else {
      BOOL v18 = (void **)v28[0];
    }
    do
    {
      char v19 = *(unsigned __int8 **)(*(void *)v14 + 88);
      uint64_t v20 = v19[23];
      if ((v20 & 0x80u) == 0) {
        BOOL v21 = (void *)v19[23];
      }
      else {
        BOOL v21 = (void *)*((void *)v19 + 1);
      }
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((void *)v19 + 1))) {
            goto LABEL_25;
          }
        }
        else
        {
          if (!v19[23]) {
            goto LABEL_25;
          }
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20) {
              goto LABEL_25;
            }
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16) {
      goto LABEL_27;
    }
  }
  char v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = [v12 UTF8String];
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E4F1C3C8], @"No output feature named: %s was found.", v24);
  char v14 = v16;
LABEL_27:
  uint64_t v25 = *(void *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  setShortDescription(v25 + 40, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if ((char)v29 < 0) {
    operator delete(v28[0]);
  }
}

- (void)_setShortDescription:(id)a3 forStateFeatureWithName:(id)a4 functionName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (!v10)
  {
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v9 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 UTF8String]);
    setShortDescription((uint64_t)&self->_modelDescriptionParams.state_, v28, &__str);
    goto LABEL_30;
  }
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(v28, (char *)[v12 UTF8String]);
  rep = self->_modelDescriptionParams.functions_.rep_;
  if (rep) {
    char v14 = (char *)rep + 8;
  }
  else {
    char v14 = 0;
  }
  uint64_t current_size = self->_modelDescriptionParams.functions_.current_size_;
  uint64_t v16 = &v14[8 * current_size];
  if (current_size)
  {
    if ((v29 & 0x80u) == 0) {
      unint64_t v17 = v29;
    }
    else {
      unint64_t v17 = (unint64_t)v28[1];
    }
    if ((v29 & 0x80u) == 0) {
      BOOL v18 = v28;
    }
    else {
      BOOL v18 = (void **)v28[0];
    }
    do
    {
      char v19 = *(unsigned __int8 **)(*(void *)v14 + 88);
      uint64_t v20 = v19[23];
      if ((v20 & 0x80u) == 0) {
        BOOL v21 = (void *)v19[23];
      }
      else {
        BOOL v21 = (void *)*((void *)v19 + 1);
      }
      if (v21 == (void *)v17)
      {
        if ((v20 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v19, v18, *((void *)v19 + 1))) {
            goto LABEL_25;
          }
        }
        else
        {
          if (!v19[23]) {
            goto LABEL_25;
          }
          v22 = v18;
          while (*v19 == *(unsigned __int8 *)v22)
          {
            ++v19;
            v22 = (void **)((char *)v22 + 1);
            if (!--v20) {
              goto LABEL_25;
            }
          }
        }
      }
      v14 += 8;
    }
    while (v14 != v16);
  }
  else
  {
LABEL_25:
    if (v14 != v16) {
      goto LABEL_27;
    }
  }
  char v23 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v24 = [v12 UTF8String];
  objc_msgSend(v23, "raise:format:", *MEMORY[0x1E4F1C3C8], @"No output feature named: %s was found.", v24);
  char v14 = v16;
LABEL_27:
  uint64_t v25 = *(void *)v14;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  setShortDescription(v25 + 64, &__str, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_30:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if ((char)v29 < 0) {
    operator delete(v28[0]);
  }
}

- (void)_setShortDescription:(id)a3 forTrainingInputFeatureWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  std::string::basic_string[abi:ne180100]<0>(v10, (char *)[v7 UTF8String]);
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  setShortDescription((uint64_t)&self->_modelDescriptionParams.traininginput_, v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v11 < 0) {
    operator delete(v10[0]);
  }
}

- (void)setMetadata:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CoreML::Specification::Metadata::Metadata((CoreML::Specification::Metadata *)&v28);
  uint64_t v4 = [v3 objectForKeyedSubscript:@"MLModelDescriptionKey"];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"MLModelDescriptionKey"];
    CoreML::Specification::Metadata::set_shortdescription((CoreML::Specification::Metadata *)&v28, (char *)[v6 UTF8String]);
  }
  id v7 = [v3 objectForKeyedSubscript:@"MLModelVersionStringKey"];
  BOOL v8 = v7 == 0;

  if (!v8)
  {
    id v9 = [v3 objectForKeyedSubscript:@"MLModelVersionStringKey"];
    CoreML::Specification::Metadata::set_versionstring((CoreML::Specification::Metadata *)&v28, (char *)[v9 UTF8String]);
  }
  id v10 = [v3 objectForKeyedSubscript:@"MLModelAuthorKey"];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    id v12 = [v3 objectForKeyedSubscript:@"MLModelAuthorKey"];
    CoreML::Specification::Metadata::set_author((CoreML::Specification::Metadata *)&v28, (char *)[v12 UTF8String]);
  }
  unint64_t v13 = [v3 objectForKeyedSubscript:@"MLModelLicenseKey"];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    id v15 = [v3 objectForKeyedSubscript:@"MLModelLicenseKey"];
    CoreML::Specification::Metadata::set_license((CoreML::Specification::Metadata *)&v28, (char *)[v15 UTF8String]);
  }
  uint64_t v16 = [v3 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
  unint64_t v17 = v16;
  if (v16)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v23 = [v18 objectForKeyedSubscript:v22];
          uint64_t v24 = [v23 UTF8String];
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v22 UTF8String]);
          uint64_t v25 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)&v29, &__p);
          MEMORY[0x1E01988D0](v25, v24);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v19);
    }
  }
  metadata = (std::string *)self->_modelDescriptionParams.metadata_;
  if (!metadata) {
    operator new();
  }
  CoreML::Specification::Metadata::CopyFrom(metadata, &v28);
  CoreML::Specification::Metadata::~Metadata((CoreML::Specification::Metadata *)&v28);
}

- (BOOL)updatable
{
  return self->_updatable;
}

- (NSDictionary)parameterDescriptionsByKey
{
  return self->_parameterDescriptionsByKey;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_parameterDescriptionsByKey, 0);
  objc_storeStrong((id *)&self->_classLabelsPerFunction, 0);
  CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)&self->_modelDescriptionParams);
}

- (id).cxx_construct
{
  return self;
}

- (void)initWithSpecification:isUpdatable:modelParameters:classLabelsPerFunction:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The default function was not found.", v0, 2u);
}

@end