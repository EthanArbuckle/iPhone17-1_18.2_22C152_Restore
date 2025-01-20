@interface CSUSmileySpotter
+ (id)availableSmileySpotterRevisionsForTextEncoder:(int64_t)a3;
- (BOOL)loadModelCatalogResourcesWithAssetLock:(id)a3 Error:(id *)a4;
- (BOOL)loadResources:(id *)a3;
- (BOOL)loadResourcesInternal:(id *)a3;
- (BOOL)reLoadResources:(id *)a3;
- (CSUSmileySpotter)initWithConfiguration:(id)a3;
- (CSUSmileySpotterConfiguration)configuration;
- (id)runSmileySpotterOnTextEncoding:(id)a3 error:(id *)a4;
- (id)unsafeRunSmileySpotterOnTextEncoding:(id)a3 error:(id *)a4;
- (int64_t)baseModelRevision;
- (void)setConfiguration:(id)a3;
@end

@implementation CSUSmileySpotter

+ (id)availableSmileySpotterRevisionsForTextEncoder:(int64_t)a3
{
  return 0;
}

- (CSUSmileySpotter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSUSmileySpotter;
  v6 = [(CSUSmileySpotter *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    smileySpotterHead = v7->_smileySpotterHead;
    v7->_smileySpotterHead = 0;

    v9 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  id v5 = objc_opt_new();
  if (objc_msgSend_loadModelCatalogResourcesWithAssetLock_Error_(self, v6, (uint64_t)v5, (uint64_t)a3, v7))
  {
    char ResourcesInternal = objc_msgSend_loadResourcesInternal_(self, v8, (uint64_t)a3, v9, v10);

    return ResourcesInternal;
  }
  else
  {

    return 0;
  }
}

- (BOOL)loadResourcesInternal:(id *)a3
{
  if (self->_smileySpotterHead) {
    return 1;
  }
  else {
    return objc_msgSend_reLoadResources_(self, a2, (uint64_t)a3, v3, v4);
  }
}

- (BOOL)reLoadResources:(id *)a3
{
  uint64_t v7 = objc_msgSend_configuration(self, a2, (uint64_t)a3, v3, v4);
  v12 = objc_msgSend_headModelURL(v7, v8, v9, v10, v11);

  v21 = objc_msgSend_configuration(self, v13, v14, v15, v16);
  if (v12)
  {
    v22 = objc_msgSend_headModelURL(v21, v17, v18, v19, v20);
    v27 = objc_msgSend_absoluteString(v22, v23, v24, v25, v26);
    v32 = objc_msgSend_configuration(self, v28, v29, v30, v31);
    v37 = objc_msgSend_headModelPath(v32, v33, v34, v35, v36);
    v41 = objc_msgSend_stringByAppendingPathComponent_(v27, v38, (uint64_t)v37, v39, v40);
  }
  else
  {
    v41 = objc_msgSend_headModelPath(v21, v17, v18, v19, v20);
  }

  v42 = [CSUCoreMLInference alloc];
  v44 = (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useComputeUnit_usePrecompiledE5Bundle_error_(v42, v43, (uint64_t)v41, 2, 1, a3);
  smileySpotterHead = self->_smileySpotterHead;
  self->_smileySpotterHead = v44;

  BOOL v46 = self->_smileySpotterHead != 0;
  return v46;
}

- (BOOL)loadModelCatalogResourcesWithAssetLock:(id)a3 Error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = objc_msgSend_configuration(self, v7, v8, v9, v10);
  char v16 = objc_msgSend_sideLoaded(v11, v12, v13, v14, v15);

  if (v16) {
    goto LABEL_5;
  }
  v17 = objc_opt_new();
  uint64_t v24 = objc_msgSend_fetchWithAssetLock_error_(v17, v18, (uint64_t)v6, (uint64_t)a4, v19);
  if (!v24)
  {
    if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v20, @"Model Catalog asset base url for text and token encoders is nil!", (uint64_t)*a4, v23);
      BOOL v30 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v30 = 0;
    goto LABEL_13;
  }
  uint64_t v25 = objc_msgSend_getAssetVersion(v17, v20, v21, v22, v23);
  char isEqual = objc_msgSend_isEqual_(v25, v26, (uint64_t)self->_assetVersionNumber, v27, v28);

  if ((isEqual & 1) == 0)
  {
    uint64_t v31 = sub_24C69662C();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_24C664000, v31, OS_LOG_TYPE_INFO, "new ModelCatalog assets available for Smiley Spotter - reloading", v50, 2u);
    }

    uint64_t v36 = objc_msgSend_configuration(self, v32, v33, v34, v35);
    objc_msgSend_setHeadModelURL_(v36, v37, (uint64_t)v24, v38, v39);

    if (objc_msgSend_reLoadResources_(self, v40, (uint64_t)a4, v41, v42))
    {
      objc_msgSend_getAssetVersion(v17, v43, v44, v45, v46);
      v47 = (NSString *)objc_claimAutoreleasedReturnValue();
      assetVersionNumber = self->_assetVersionNumber;
      self->_assetVersionNumber = v47;

      BOOL v30 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }

LABEL_5:
  BOOL v30 = 1;
LABEL_14:

  return v30;
}

- (id)runSmileySpotterOnTextEncoding:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if ((objc_msgSend_loadModelCatalogResourcesWithAssetLock_Error_(self, v8, (uint64_t)v7, (uint64_t)a4, v9) & 1) != 0
    && objc_msgSend_loadResourcesInternal_(self, v10, (uint64_t)a4, v11, v12))
  {
    uint64_t v15 = objc_msgSend_unsafeRunSmileySpotterOnTextEncoding_error_(self, v13, (uint64_t)v6, (uint64_t)a4, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)unsafeRunSmileySpotterOnTextEncoding:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  smileySpotterHead = self->_smileySpotterHead;
  if (a4 && !smileySpotterHead)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v6, @"Predictor instance is nil, are you sure you loadedResources(...)?", v8, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    smileySpotterHead = self->_smileySpotterHead;
  }
  v51 = @"pooled_out";
  uint64_t v12 = objc_msgSend_textEncoding(v10, v6, v7, v8, v9);
  v52[0] = v12;
  uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v52, (uint64_t)&v51, 1);
  char v17 = objc_msgSend_setInputFeatures_error_(smileySpotterHead, v15, (uint64_t)v14, (uint64_t)a4, v16);

  if ((v17 & 1) != 0 && objc_msgSend_predict_(self->_smileySpotterHead, v18, (uint64_t)a4, v19, v20))
  {
    uint64_t v24 = objc_msgSend_getOutputFor_(self->_smileySpotterHead, v21, @"fc_dense2_post_act", v22, v23);
    uint64_t v28 = v24;
    if (v24)
    {
      uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)&unk_26FEEA2A8, v26, v27);
      objc_msgSend_floatValue(v29, v30, v31, v32, v33);
      float v35 = v34;
      objc_msgSend_threshold(self->_configuration, v36, v37, v38, v39);
      float v41 = v40;

      uint64_t v42 = [CSUSmileySpotterModelOutput alloc];
      uint64_t v47 = objc_msgSend_revision(self->_configuration, v43, v44, v45, v46);
      v49 = objc_msgSend_initWithOutput_Probability_smileySpotterRevision_(v42, v48, v35 > v41, (uint64_t)v28, v47);
    }
    else if (a4)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v25, @"Could not get output tensor for smiley spotter head", v26, v27);
      v49 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = 0;
    }
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

- (int64_t)baseModelRevision
{
  return self->_baseModelRevision;
}

- (CSUSmileySpotterConfiguration)configuration
{
  return (CSUSmileySpotterConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_assetVersionNumber, 0);
  objc_storeStrong((id *)&self->_smileySpotterHead, 0);
}

@end