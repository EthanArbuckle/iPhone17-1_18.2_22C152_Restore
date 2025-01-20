@interface CHDiffusionModelE5ML
+ (id)defaultURLOfModelInThisBundle;
+ (id)inputNames;
+ (id)outputNames;
- (CHDiffusionModelE5ML)initWithProgramLibrary:(id)a3 width:(unint64_t)a4;
- (id)createExecutionContext;
@end

@implementation CHDiffusionModelE5ML

+ (id)defaultURLOfModelInThisBundle
{
  v2 = objc_alloc_init(CHModelCatalog);
  v10 = objc_msgSend_getModelURL_(v2, v3, 0, v4, v5, v6);
  if (v10)
  {
    v11 = objc_msgSend_URLWithString_relativeToURL_(MEMORY[0x1E4F1CB10], v7, @"diffusion_latn_denoiser.bundle", (uint64_t)v10, v8, v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)inputNames
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"input_diffusion_x_timestep";
  v6[1] = @"input_diffusion_timestep";
  v6[2] = @"input_labels";
  v6[3] = @"input_labels_length";
  v6[4] = @"input_length";
  v6[5] = @"input_diffusion_style_encoding";
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v6, 6, v2, v3);
  return v4;
}

+ (id)outputNames
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"pred_noise";
  v6[1] = @"pred_penup";
  uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v6, 2, v2, v3);
  return v4;
}

- (CHDiffusionModelE5ML)initWithProgramLibrary:(id)a3 width:(unint64_t)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v11 = objc_msgSend_stringWithFormat_(NSString, v7, @"main_%zu", v8, v9, v10, a4);
  id v12 = v6;
  id v13 = v11;
  if (!self) {
    goto LABEL_16;
  }
  v60.receiver = self;
  v60.super_class = (Class)CHDiffusionModelE5ML;
  self = [(CHDiffusionModelE5ML *)&v60 init];
  if (!self) {
    goto LABEL_16;
  }
  id v14 = v13;
  id v59 = v12;
  self;
  v20 = objc_msgSend_visionCoreProgramLibrary(v59, v15, v16, v17, v18, v19);
  v24 = objc_msgSend_functionNamed_error_(v20, v21, (uint64_t)v14, 0, v22, v23);

  if (!v24)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v35 = (id)qword_1EA3C9FD8;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = v14;
      _os_log_impl(&dword_1C492D000, v35, OS_LOG_TYPE_ERROR, "Failed to load function named '%@'.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v25 = objc_opt_class();
  v31 = objc_msgSend_inputNames(v25, v26, v27, v28, v29, v30);
  v35 = objc_msgSend_descriptorsForInputs_error_(v24, v32, (uint64_t)v31, 0, v33, v34);

  if (!v35)
  {
LABEL_11:
    v55 = 0;
    goto LABEL_14;
  }
  v36 = objc_opt_class();
  v42 = objc_msgSend_outputNames(v36, v37, v38, v39, v40, v41);
  v46 = objc_msgSend_descriptorsForOutputs_error_(v24, v43, (uint64_t)v42, 0, v44, v45);

  if (v46)
  {
    id v47 = objc_alloc(MEMORY[0x1E4FB3F10]);
    v52 = objc_msgSend_initWithMajor_(v47, v48, 1, v49, v50, v51);
    id v53 = objc_alloc(MEMORY[0x1E4FB3E78]);
    v55 = (VisionCoreE5RTInferenceFunctionDescriptor *)objc_msgSend_initWithFunction_inputDescriptors_inputImageDescriptors_outputDescriptors_confidencesOutputDescriptors_networkVersion_(v53, v54, (uint64_t)v24, (uint64_t)v35, MEMORY[0x1E4F1CBF0], (uint64_t)v46, 0, v52);
  }
  else
  {
    v55 = 0;
  }

LABEL_14:
  functionDescriptor = self->_functionDescriptor;
  self->_functionDescriptor = v55;

  if (!self->_functionDescriptor)
  {
LABEL_16:
    v57 = 0;
    goto LABEL_17;
  }
  self = self;
  v57 = self;
LABEL_17:

  return v57;
}

- (id)createExecutionContext
{
  uint64_t v3 = [CHDiffusionModelE5MLExecutionContext alloc];
  uint64_t v8 = objc_msgSend_initWithFunction_(v3, v4, (uint64_t)self->_functionDescriptor, v5, v6, v7);
  return v8;
}

- (void).cxx_destruct
{
}

@end