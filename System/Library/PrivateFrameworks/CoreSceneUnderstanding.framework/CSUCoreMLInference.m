@interface CSUCoreMLInference
- (BOOL)predict:(id *)a3;
- (BOOL)setInputFeatures:(id)a3 error:(id *)a4;
- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useComputeUnit:(int64_t)a4 usePrecompiledE5Bundle:(BOOL)a5 error:(id *)a6;
- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useFunction:(id)a4 useComputeUnit:(int64_t)a5 usePrecompiledE5Bundle:(BOOL)a6 error:(id *)a7;
- (id)getInputMLMutliArrayFor:(id)a3 WithShape:(id)a4 error:(id *)a5;
- (id)getInputMLMutliArrayFor:(id)a3 error:(id *)a4;
- (id)getOutputFor:(id)a3;
- (void)getMLModelConfigWithFuncName:(id)a3 ComputeUnit:(int64_t)a4 PrecompiledE5Bundle:(BOOL)a5;
- (void)setOutputBufferWithLayerName:(id)a3 withWidth:(unint64_t)a4 withHeight:(unint64_t)a5 withShape:(id)a6 withPixelFormat:(unsigned int)a7 error:(id *)a8;
@end

@implementation CSUCoreMLInference

- (void)getMLModelConfigWithFuncName:(id)a3 ComputeUnit:(int64_t)a4 PrecompiledE5Bundle:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (MLModelConfiguration *)objc_opt_new();
  config = self->_config;
  self->_config = v9;

  objc_msgSend_setComputeUnits_(self->_config, v11, a4, v12, v13);
  objc_msgSend_setUsePrecompiledE5Bundle_(self->_config, v14, v5, v15, v16);
  if (objc_msgSend_usePrecompiledE5Bundle(self->_config, v17, v18, v19, v20))
  {
    v21 = sub_24C69662C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    LOWORD(v27) = 0;
    v22 = "Using precompiled bundle";
  }
  else
  {
    v21 = sub_24C69662C();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    LOWORD(v27) = 0;
    v22 = "Not using precompiled bundle";
  }
  _os_log_impl(&dword_24C664000, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v27, 2u);
LABEL_7:

  if (v8)
  {
    objc_msgSend_setFunctionName_(self->_config, v23, (uint64_t)v8, v24, v25);
    v26 = sub_24C69662C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      id v28 = v8;
      _os_log_impl(&dword_24C664000, v26, OS_LOG_TYPE_INFO, "Using function = %@", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useComputeUnit:(int64_t)a4 usePrecompiledE5Bundle:(BOOL)a5 error:(id *)a6
{
  return (CSUCoreMLInference *)objc_msgSend_initWithCompiledModelFromUri_useFunction_useComputeUnit_usePrecompiledE5Bundle_error_(self, a2, (uint64_t)a3, 0, a4, a5, a6);
}

- (CSUCoreMLInference)initWithCompiledModelFromUri:(id)a3 useFunction:(id)a4 useComputeUnit:(int64_t)a5 usePrecompiledE5Bundle:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  v58.receiver = self;
  v58.super_class = (Class)CSUCoreMLInference;
  v14 = [(CSUCoreMLInference *)&v58 init];
  uint64_t v16 = v14;
  if (v14)
  {
    objc_msgSend_getMLModelConfigWithFuncName_ComputeUnit_PrecompiledE5Bundle_(v14, v15, (uint64_t)v13, a5, v8);
    pixelBufferAttributesForIOSurfaceBacking = v16->_pixelBufferAttributesForIOSurfaceBacking;
    v16->_pixelBufferAttributesForIOSurfaceBacking = 0;

    outputBackings = v16->_outputBackings;
    v16->_outputBackings = 0;

    uint64_t v19 = NSURL;
    v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"file://%@", v21, v22, v12);
    uint64_t v27 = objc_msgSend_URLWithString_(v19, v24, (uint64_t)v23, v25, v26);
    modelURL = v16->_modelURL;
    v16->_modelURL = (NSURL *)v27;

    v33 = objc_msgSend_date(MEMORY[0x263EFF910], v29, v30, v31, v32);
    uint64_t v35 = objc_msgSend_modelWithContentsOfURL_configuration_error_(MEMORY[0x263F00D80], v34, (uint64_t)v16->_modelURL, (uint64_t)v16->_config, (uint64_t)a7);
    model = v16->_model;
    v16->_model = (MLModel *)v35;

    if (!v16->_model)
    {

      v56 = 0;
      goto LABEL_8;
    }
    objc_msgSend_timeIntervalSinceNow(v33, v37, v38, v39, v40);
    uint64_t v42 = v41;
    v43 = sub_24C69662C();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = v16->_modelURL;
      *(_DWORD *)buf = 138412546;
      v60 = v44;
      __int16 v61 = 2048;
      uint64_t v62 = v42;
      _os_log_impl(&dword_24C664000, v43, OS_LOG_TYPE_INFO, "Time to load CoreML model %@ = %f", buf, 0x16u);
    }

    v49 = objc_msgSend_modelDescription(v16->_model, v45, v46, v47, v48);
    uint64_t v54 = objc_msgSend_inputDescriptionsByName(v49, v50, v51, v52, v53);
    inputDescriptionsByName = v16->_inputDescriptionsByName;
    v16->_inputDescriptionsByName = (NSDictionary *)v54;
  }
  v56 = v16;
LABEL_8:

  return v56;
}

- (id)getInputMLMutliArrayFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10 = objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v7, (uint64_t)v6, v8, v9);
  uint64_t v15 = objc_msgSend_multiArrayConstraint(v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_dataType(v15, v16, v17, v18, v19);

  uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v21, (uint64_t)v6, v22, v23);
  uint64_t v29 = objc_msgSend_multiArrayConstraint(v24, v25, v26, v27, v28);
  v34 = objc_msgSend_shape(v29, v30, v31, v32, v33);

  uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v35, (uint64_t)v6, v36, v37);
  v43 = objc_msgSend_multiArrayConstraint(v38, v39, v40, v41, v42);
  uint64_t v48 = objc_msgSend_shapeConstraint(v43, v44, v45, v46, v47);
  uint64_t v53 = objc_msgSend_enumeratedShapes(v48, v49, v50, v51, v52);

  id v54 = objc_alloc(MEMORY[0x263F00DA8]);
  uint64_t v56 = objc_msgSend_initWithShape_dataType_error_(v54, v55, (uint64_t)v34, v20, (uint64_t)a4);
  v60 = (void *)v56;
  if (a4 && !v56)
  {
    __int16 v61 = objc_msgSend_stringWithFormat_(NSString, v57, @"Could not create input MLMultiArray of type %ld and shape %@", v58, v59, v20, v34);
    id v64 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v62, (uint64_t)v61, (uint64_t)*a4, v63);
  }
  return v60;
}

- (id)getInputMLMutliArrayFor:(id)a3 WithShape:(id)a4 error:(id *)a5
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v10, (uint64_t)v8, v11, v12);
  uint64_t v18 = objc_msgSend_multiArrayConstraint(v13, v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_dataType(v18, v19, v20, v21, v22);

  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(self->_inputDescriptionsByName, v24, (uint64_t)v8, v25, v26);
  uint64_t v32 = objc_msgSend_multiArrayConstraint(v27, v28, v29, v30, v31);
  uint64_t v37 = objc_msgSend_shapeConstraint(v32, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_enumeratedShapes(v37, v38, v39, v40, v41);

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v43 = v42;
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v73, (uint64_t)v77, 16);
  if (v45)
  {
    uint64_t v46 = *(void *)v74;
    while (2)
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v74 != v46) {
          objc_enumerationMutation(v43);
        }
        id v48 = *(id *)(*((void *)&v73 + 1) + 8 * i);
        char isEqualToArray = objc_msgSend_isEqualToArray_(v9, v49, (uint64_t)v48, v50, v51);

        if (isEqualToArray)
        {
          v57 = v43;
          goto LABEL_11;
        }
      }
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v53, (uint64_t)&v73, (uint64_t)v77, 16);
      if (v45) {
        continue;
      }
      break;
    }
  }

  v57 = objc_msgSend_stringWithFormat_(NSString, v54, @"Specified shape %@ for input %@ is invalid, allowed shapes are %@ ", v55, v56, v9, v8, v43);
  id v60 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v58, (uint64_t)v57, (uint64_t)*a5, v59);
LABEL_11:

  id v61 = objc_alloc(MEMORY[0x263F00DA8]);
  uint64_t v63 = objc_msgSend_initWithShape_dataType_error_(v61, v62, (uint64_t)v9, v23, (uint64_t)a5);
  v67 = (void *)v63;
  if (a5 && !v63)
  {
    v68 = objc_msgSend_stringWithFormat_(NSString, v64, @"Could not create input MLMultiArray of type %ld and shape %@", v65, v66, v23, v9);
    id v71 = (id)objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v69, (uint64_t)v68, (uint64_t)*a5, v70);
  }
  return v67;
}

- (BOOL)setInputFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x263F00D38]);
  v10 = (MLDictionaryFeatureProvider *)objc_msgSend_initWithDictionary_error_(v7, v8, (uint64_t)v6, (uint64_t)a4, v9);
  featsProvider = self->_featsProvider;
  self->_featsProvider = v10;

  LOBYTE(self) = self->_featsProvider != 0;
  return (char)self;
}

- (void)setOutputBufferWithLayerName:(id)a3 withWidth:(unint64_t)a4 withHeight:(unint64_t)a5 withShape:(id)a6 withPixelFormat:(unsigned int)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a6;
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v15 = NSDictionary;
  uint64_t v20 = objc_msgSend_dictionary(NSDictionary, v16, v17, v18, v19);
  objc_msgSend_dictionaryWithObjectsAndKeys_(v15, v21, (uint64_t)v20, v22, v23, *MEMORY[0x263F04130], 0);
  uint64_t v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  pixelBufferAttributesForIOSurfaceBacking = self->_pixelBufferAttributesForIOSurfaceBacking;
  self->_pixelBufferAttributesForIOSurfaceBacking = v24;

  uint64_t v26 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, a5, 0x4C303068u, (CFDictionaryRef)self->_pixelBufferAttributesForIOSurfaceBacking, &pixelBufferOut);
  if (v26) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = pixelBufferOut == 0;
  }
  if (v30)
  {
    uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v27, @"Could not create CVPixelBuffer - return status is %d", v28, v29, v26);
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v32, (uint64_t)v31, v33, v34);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v35 = (NSMutableDictionary *)objc_opt_new();
    outputBackings = self->_outputBackings;
    self->_outputBackings = v35;

    uint64_t v37 = self->_outputBackings;
    id v38 = objc_alloc(MEMORY[0x263F00DA8]);
    uint64_t v41 = objc_msgSend_initWithPixelBuffer_shape_(v38, v39, (uint64_t)pixelBufferOut, (uint64_t)v14, v40);
    objc_msgSend_setObject_forKey_(v37, v42, (uint64_t)v41, (uint64_t)v13, v43);

    CFRelease(pixelBufferOut);
  }
}

- (BOOL)predict:(id *)a3
{
  BOOL v5 = objc_opt_new();
  objc_msgSend_setOutputBackings_(v5, v6, (uint64_t)self->_outputBackings, v7, v8);
  id v13 = objc_msgSend_date(MEMORY[0x263EFF910], v9, v10, v11, v12);
  objc_msgSend_predictionFromFeatures_options_error_(self->_model, v14, (uint64_t)self->_featsProvider, (uint64_t)v5, (uint64_t)a3);
  uint64_t v15 = (MLFeatureProvider *)objc_claimAutoreleasedReturnValue();
  outputs = self->_outputs;
  self->_outputs = v15;

  objc_msgSend_timeIntervalSinceNow(v13, v17, v18, v19, v20);
  uint64_t v23 = self->_outputs;
  if (a3 && !v23)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v21, 12, @"Model could not generate the output", v22);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v23 != 0;
}

- (id)getOutputFor:(id)a3
{
  BOOL v5 = objc_msgSend_featureValueForName_(self->_outputs, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_multiArrayValue(v5, v6, v7, v8, v9);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_outputBackings, 0);
  objc_storeStrong((id *)&self->_pixelBufferAttributesForIOSurfaceBacking, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_featsProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end