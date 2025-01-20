@interface SGTransformerInstance
+ (id)defaultSessionDescriptorForModelId:(id)a3 featureVersion:(id)a4 language:(id)a5 windowAndNgrams:(id)a6;
+ (id)defaultWindowAndNgrams;
- (Class)modelClass;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLTransformerProtocol)transformer;
- (SGTransformerInstance)initWithTransformer:(id)a3 sessionDescriptor:(id)a4 modelClass:(Class)a5;
- (id)trainingFeaturesOf:(id)a3;
- (void)setModelClass:(Class)a3;
- (void)setSessionDescriptor:(id)a3;
- (void)setTransformer:(id)a3;
@end

@implementation SGTransformerInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
}

- (void)setModelClass:(Class)a3
{
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (void)setTransformer:(id)a3
{
}

- (PMLTransformerProtocol)transformer
{
  return self->_transformer;
}

- (void)setSessionDescriptor:(id)a3
{
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (id)trainingFeaturesOf:(id)a3
{
  id v5 = a3;
  v6 = [(SGTransformerInstance *)self sessionDescriptor];
  v7 = [(SGTransformerInstance *)self transformer];

  if (v7)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGModels.m", 305, @"Invalid parameter not satisfying: %@", @"self.transformer" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SGModels.m", 306, @"Invalid parameter not satisfying: %@", @"sessionDescriptor" object file lineNumber description];

LABEL_3:
  if (![(SGTransformerInstance *)self modelClass])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SGModels.m", 307, @"Invalid parameter not satisfying: %@", @"self.modelClass" object file lineNumber description];
  }
  v8 = (void *)MEMORY[0x1CB79B230]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5DFB8]), "initWithSessionDescriptor:modelClass:", v6, -[SGTransformerInstance modelClass](self, "modelClass"));
  v10 = [(SGTransformerInstance *)self transformer];
  v11 = [v10 transform:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGModels.m", 311, @"Invalid parameter not satisfying: %@", @"[vector isKindOfClass:PMLSparseVector.class]" object file lineNumber description];
  }
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F5DFB0]) initWithSource:v9 vector:v11];

  return v12;
}

- (SGTransformerInstance)initWithTransformer:(id)a3 sessionDescriptor:(id)a4 modelClass:(Class)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGModels.m", 292, @"Invalid parameter not satisfying: %@", @"sessionDescriptor" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"SGModels.m", 291, @"Invalid parameter not satisfying: %@", @"transformer" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGModels.m", 293, @"Invalid parameter not satisfying: %@", @"modelClass" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SGTransformerInstance;
  v13 = [(SGTransformerInstance *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_transformer, a3);
    objc_storeStrong((id *)&v14->_sessionDescriptor, a4);
    objc_storeStrong((id *)&v14->_modelClass, a5);
  }

  return v14;
}

+ (id)defaultSessionDescriptorForModelId:(id)a3 featureVersion:(id)a4 language:(id)a5 windowAndNgrams:(id)a6
{
  v9 = (objc_class *)NSString;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v9 alloc];
  v15 = [v10 first];
  v16 = [v10 second];

  v17 = (void *)[v14 initWithFormat:@"TW=%@&NG=%@&FV=%@", v15, v16, v12];
  v18 = [MEMORY[0x1E4F93840] descriptorForName:v13 version:v17 locale:v11];

  return v18;
}

+ (id)defaultWindowAndNgrams
{
  v2 = [MEMORY[0x1E4F5DFA8] rules];
  v3 = [v2 objectForKeyedSubscript:@"TOKEN_WINDOW"];
  uint64_t v4 = [v3 unsignedIntegerValue];
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 12;
  }

  v6 = [v2 objectForKeyedSubscript:@"NGRAMS"];
  uint64_t v7 = [v6 unsignedIntegerValue];
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 3;
  }

  v9 = (void *)MEMORY[0x1E4F93BB8];
  id v10 = [NSNumber numberWithUnsignedInteger:v5];
  id v11 = [NSNumber numberWithUnsignedInteger:v8];
  id v12 = [v9 tupleWithFirst:v10 second:v11];

  return v12;
}

@end