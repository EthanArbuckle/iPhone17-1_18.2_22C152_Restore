@interface _MLSNVGGishFeatureEmbedding
- (MLModelDescription)modelDescription;
- (_MLSNVGGishFeatureEmbedding)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)p_isa;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _MLSNVGGishFeatureEmbedding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);

  objc_storeStrong((id *)&self->_featureEmbeddingModel, 0);
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)[(MLCustomModel *)self->_featureEmbeddingModel predictionFromFeatures:a3 options:a4 error:a5];
}

- (_MLSNVGGishFeatureEmbedding)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)p_isa
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLSNFrameworkHandle sharedHandle];
  if (!v11)
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Framework not available on this version";
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = (__CFString **)v30;
    v19 = &v29;
    goto LABEL_14;
  }
  if (!NSClassFromString(&cfstr_Snvggishfeatur.isa))
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = @"Feature embedding not available on this version";
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = &v28;
    v19 = &v27;
    goto LABEL_14;
  }
  if (([NSClassFromString(&cfstr_Snvggishfeatur.isa) conformsToProtocol:&unk_1EF11E650] & 1) == 0)
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26 = @"Frontend processing does not conform to custom model protocol";
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = &v26;
    v19 = &v25;
    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)_MLSNVGGishFeatureEmbedding;
  self = [(_MLSNVGGishFeatureEmbedding *)&v22 init];
  if (self)
  {
    v12 = (MLCustomModel *)objc_alloc(NSClassFromString(&cfstr_Snvggishfeatur.isa));
    featureEmbeddingModel = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v12;

    v14 = [(MLCustomModel *)self->_featureEmbeddingModel initWithModelDescription:v9 parameterDictionary:v10 error:p_isa];
    v15 = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v14;

    if (self->_featureEmbeddingModel)
    {
      objc_storeStrong((id *)&self->_modelDescription, a3);
      goto LABEL_7;
    }
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = @"Feature embedding failed to init";
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = &v24;
    v19 = &v23;
LABEL_14:
    v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    *p_isa = [v16 errorWithDomain:@"com.apple" code:0 userInfo:v20];

    p_isa = 0;
    goto LABEL_15;
  }
LABEL_7:
  self = self;
  p_isa = (id *)&self->super.isa;
LABEL_15:

  return (_MLSNVGGishFeatureEmbedding *)p_isa;
}

@end