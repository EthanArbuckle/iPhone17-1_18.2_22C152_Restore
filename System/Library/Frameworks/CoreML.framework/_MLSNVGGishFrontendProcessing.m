@interface _MLSNVGGishFrontendProcessing
- (MLModelDescription)modelDescription;
- (_MLSNVGGishFrontendProcessing)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)p_isa;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation _MLSNVGGishFrontendProcessing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);

  objc_storeStrong((id *)&self->_frontendProcessingModel, 0);
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)[(MLCustomModel *)self->_frontendProcessingModel predictionFromFeatures:a3 options:a4 error:a5];
}

- (_MLSNVGGishFrontendProcessing)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)p_isa
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
  if (!NSClassFromString(&cfstr_Snvggishfronte.isa))
  {
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = @"Frontend processing not available on this version";
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = &v28;
    v19 = &v27;
    goto LABEL_14;
  }
  if (([NSClassFromString(&cfstr_Snvggishfronte.isa) conformsToProtocol:&unk_1EF11E650] & 1) == 0)
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
  v22.super_class = (Class)_MLSNVGGishFrontendProcessing;
  self = [(_MLSNVGGishFrontendProcessing *)&v22 init];
  if (self)
  {
    v12 = (MLCustomModel *)objc_alloc(NSClassFromString(&cfstr_Snvggishfronte.isa));
    frontendProcessingModel = self->_frontendProcessingModel;
    self->_frontendProcessingModel = v12;

    v14 = [(MLCustomModel *)self->_frontendProcessingModel initWithModelDescription:v9 parameterDictionary:v10 error:p_isa];
    v15 = self->_frontendProcessingModel;
    self->_frontendProcessingModel = v14;

    if (self->_frontendProcessingModel)
    {
      objc_storeStrong((id *)&self->_modelDescription, a3);
      goto LABEL_7;
    }
    if (!p_isa) {
      goto LABEL_15;
    }
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24 = @"Frontend processing failed to init";
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

  return (_MLSNVGGishFrontendProcessing *)p_isa;
}

@end