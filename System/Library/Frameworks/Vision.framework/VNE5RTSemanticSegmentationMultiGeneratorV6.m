@interface VNE5RTSemanticSegmentationMultiGeneratorV6
+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)outputMaskBlobNameToFeatureName;
+ (id)outputMaskBlobNameToRequestKey;
+ (id)outputMaskBlobNames;
+ (unint64_t)modelVersion;
@end

@implementation VNE5RTSemanticSegmentationMultiGeneratorV6

+ (id)outputMaskBlobNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNames]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNames]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNames]::outputNames;

  return v2;
}

void __65__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNames__block_invoke(uint64_t a1)
{
  v19[13] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) modelVersion];
  v18 = [v2 objectClassOutputNameForObjectClassID:128 modelVersion:v3 error:0];
  v19[0] = v18;
  v17 = [v2 objectClassOutputNameForObjectClassID:256 modelVersion:v3 error:0];
  v19[1] = v17;
  v16 = [v2 objectClassOutputNameForObjectClassID:512 modelVersion:v3 error:0];
  v19[2] = v16;
  v15 = [v2 objectClassOutputNameForObjectClassID:1024 modelVersion:v3 error:0];
  v19[3] = v15;
  v4 = [v2 objectClassOutputNameForObjectClassID:2048 modelVersion:v3 error:0];
  v19[4] = v4;
  v5 = [v2 objectClassOutputNameForObjectClassID:4096 modelVersion:v3 error:0];
  v19[5] = v5;
  v6 = [v2 objectClassOutputNameForObjectClassID:1 modelVersion:v3 error:0];
  v19[6] = v6;
  v7 = [v2 objectClassOutputNameForObjectClassID:8 modelVersion:v3 error:0];
  v19[7] = v7;
  v8 = [v2 objectClassOutputNameForObjectClassID:16 modelVersion:v3 error:0];
  v19[8] = v8;
  v9 = [v2 objectClassOutputNameForObjectClassID:4 modelVersion:v3 error:0];
  v19[9] = v9;
  v10 = [v2 objectClassOutputNameForObjectClassID:32 modelVersion:v3 error:0];
  v19[10] = v10;
  v11 = [v2 objectClassOutputNameForObjectClassID:64 modelVersion:v3 error:0];
  v19[11] = v11;
  v12 = [v2 objectClassOutputNameForObjectClassID:2 modelVersion:v3 error:0];
  v19[12] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:13];
  v14 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNames]::outputNames;
  +[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNames]::outputNames = v13;
}

+ (id)outputMaskBlobNameToRequestKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNameToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToRequestKey]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;

  return v2;
}

void __76__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNameToRequestKey__block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) modelVersion];
  uint64_t v39 = [v2 objectClassOutputNameForObjectClassID:1 modelVersion:v3 error:0];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v51 = NSStringFromClass(v4);
  v37 = (void *)v51;
  uint64_t v40 = [v2 objectClassOutputNameForObjectClassID:2 modelVersion:v3 error:0];
  v38 = (void *)v40;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v52 = NSStringFromClass(v5);
  v35 = (void *)v52;
  uint64_t v41 = [v2 objectClassOutputNameForObjectClassID:4 modelVersion:v3 error:0];
  v36 = (void *)v41;
  v6 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v6);
  v53 = v33;
  v34 = [v2 objectClassOutputNameForObjectClassID:8 modelVersion:v3 error:0];
  v42 = v34;
  v7 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v7);
  v54 = v31;
  v32 = [v2 objectClassOutputNameForObjectClassID:16 modelVersion:v3 error:0];
  v43 = v32;
  v8 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v8);
  v55 = v29;
  v30 = [v2 objectClassOutputNameForObjectClassID:32 modelVersion:v3 error:0];
  v44 = v30;
  v9 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v9);
  v56 = v27;
  v28 = [v2 objectClassOutputNameForObjectClassID:64 modelVersion:v3 error:0];
  v45 = v28;
  v10 = (objc_class *)objc_opt_class();
  v25 = NSStringFromClass(v10);
  v57 = v25;
  v26 = [v2 objectClassOutputNameForObjectClassID:128 modelVersion:v3 error:0];
  v46 = v26;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v58 = v12;
  uint64_t v13 = [v2 objectClassOutputNameForObjectClassID:256 modelVersion:v3 error:0];
  v47 = v13;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v59 = v15;
  v16 = [v2 objectClassOutputNameForObjectClassID:512 modelVersion:v3 error:0];
  v48 = v16;
  v17 = [MEMORY[0x1E4F1CA98] null];
  v60 = v17;
  v18 = [v2 objectClassOutputNameForObjectClassID:1024 modelVersion:v3 error:0];
  v49 = v18;
  v19 = [MEMORY[0x1E4F1CA98] null];
  v61 = v19;
  v20 = [v2 objectClassOutputNameForObjectClassID:2048 modelVersion:v3 error:0];
  v50 = v20;
  v21 = [MEMORY[0x1E4F1CA98] null];
  v62 = v21;
  v22 = (void *)v39;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v39 count:12];
  v24 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v23;
}

+ (id)outputMaskBlobNameToFeatureName
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNameToFeatureName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToFeatureName]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToFeatureName]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;

  return v2;
}

void __77__VNE5RTSemanticSegmentationMultiGeneratorV6_outputMaskBlobNameToFeatureName__block_invoke(uint64_t a1)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(a1 + 32) modelVersion];
  v4 = [v2 objectClassOutputNameForObjectClassID:4 modelVersion:v3 error:0];
  v12[0] = v4;
  v13[0] = @"human_attribute_skin";
  v5 = [v2 objectClassOutputNameForObjectClassID:8 modelVersion:v3 error:0];
  v12[1] = v5;
  v13[1] = @"human_attribute_hair";
  v6 = [v2 objectClassOutputNameForObjectClassID:16 modelVersion:v3 error:0];
  v12[2] = v6;
  v13[2] = @"human_attribute_facial_hair";
  v7 = [v2 objectClassOutputNameForObjectClassID:32 modelVersion:v3 error:0];
  v12[3] = v7;
  v13[3] = @"human_attribute_teeth";
  v8 = [v2 objectClassOutputNameForObjectClassID:128 modelVersion:v3 error:0];
  v12[4] = v8;
  v13[4] = @"cat";
  v9 = [v2 objectClassOutputNameForObjectClassID:256 modelVersion:v3 error:0];
  v12[5] = v9;
  v13[5] = @"dog";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];
  v11 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName;
  +[VNE5RTSemanticSegmentationMultiGeneratorV6 outputMaskBlobNameToFeatureName]::outputMaskBlobNameToFeatureName = v10;
}

+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 E5RTVisionCoreComputeDeviceForConfigurationOptions:v6 error:a4];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12938;
  v16 = __Block_byref_object_dispose__12939;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__VNE5RTSemanticSegmentationMultiGeneratorV6_createE5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  v11[3] = &unk_1E5B1E0A0;
  v11[4] = &v12;
  v11[5] = v7;
  if (+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::onceToken, v11);
  }
  v8 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  if (+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor)
  {
    id v9 = (id)+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  }
  else if (a4)
  {
    *a4 = (id) v13[5];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __104__VNE5RTSemanticSegmentationMultiGeneratorV6_createE5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = [MEMORY[0x1E4FB3F28] semanticSegmentationForModelVersion:2 computeDeviceType:v1 error:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
  v4 = (void *)+[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  +[VNE5RTSemanticSegmentationMultiGeneratorV6 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor = v3;
}

+ (unint64_t)modelVersion
{
  return 2;
}

@end