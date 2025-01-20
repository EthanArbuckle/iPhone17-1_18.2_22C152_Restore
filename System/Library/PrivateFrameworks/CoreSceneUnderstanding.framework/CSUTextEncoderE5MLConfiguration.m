@interface CSUTextEncoderE5MLConfiguration
+ (id)TextEncoderE5MLConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (id)getConfigurationForRevision_v1_2_EnglishWithError:(id *)a3;
+ (id)getConfigurationForRevision_v5_0_Tier0WithError:(id *)a3;
+ (id)getConfigurationFromModelCatalogForRevision_v1_2_EnglishWithError:(id *)a3;
+ (id)getConfigurationFromModelCatalogForRevision_v4_1_Tier0WithError:(id *)a3;
+ (id)overrideWithSideLoadedPathForTokenEmbeddingModel:(id)a3 TextEmbeddingModel:(id)a4;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)inputIsLowerCase;
- (BOOL)sideLoaded;
- (BOOL)usePrecompiledBundleForMacOS;
- (NSArray)additionalLayerNames;
- (NSDictionary)e5FunctionsAvailable;
- (NSMutableDictionary)layerHeights;
- (NSMutableDictionary)layerShapes;
- (NSMutableDictionary)layerWidths;
- (NSString)e5function;
- (NSString)inputTextIDTensorName;
- (NSString)inputTokenEmbeddingIDTensorName;
- (NSString)inputTokenEmbeddingMaskTensorName;
- (NSString)outputLastHiddenStateTensorName;
- (NSString)outputTextEmbeddingTensorName;
- (NSString)outputTokenEmbeddingIDTensorName;
- (NSString)textEncoderNetworkPath;
- (NSString)tokenEmbeddingNetworkPath;
- (NSString)vocabularyModelPath;
- (NSURL)textEncoderNetworkURL;
- (NSURL)tokenEmbeddingNetworkURL;
- (id)initTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (unint64_t)contextLength;
- (unint64_t)maximumSequenceLength;
- (unint64_t)numCustomTokens;
- (unint64_t)tokenEmbeddingLength;
- (void)setAdditionalLayerNames:(id)a3;
- (void)setContextLength:(unint64_t)a3;
- (void)setE5FunctionsAvailable:(id)a3;
- (void)setE5function:(id)a3;
- (void)setEspressoExecutionEngine:(int)a3;
- (void)setInputIsLowerCase:(BOOL)a3;
- (void)setInputTextIDTensorName:(id)a3;
- (void)setInputTokenEmbeddingIDTensorName:(id)a3;
- (void)setInputTokenEmbeddingMaskTensorName:(id)a3;
- (void)setLayerHeights:(id)a3;
- (void)setLayerShapes:(id)a3;
- (void)setLayerWidths:(id)a3;
- (void)setMaximumSequenceLength:(unint64_t)a3;
- (void)setNumCustomTokens:(unint64_t)a3;
- (void)setOutputLastHiddenStateTensorName:(id)a3;
- (void)setOutputTextEmbeddingTensorName:(id)a3;
- (void)setOutputTokenEmbeddingIDTensorName:(id)a3;
- (void)setSideLoaded:(BOOL)a3;
- (void)setTextEncoderNetworkPath:(id)a3;
- (void)setTextEncoderNetworkURL:(id)a3;
- (void)setTokenEmbeddingLength:(unint64_t)a3;
- (void)setTokenEmbeddingNetworkPath:(id)a3;
- (void)setTokenEmbeddingNetworkURL:(id)a3;
- (void)setUsePrecompiledBundleForMacOS:(BOOL)a3;
- (void)setVocabularyModelPath:(id)a3;
@end

@implementation CSUTextEncoderE5MLConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  return a3;
}

+ (id)getConfigurationFromModelCatalogForRevision_v1_2_EnglishWithError:(id *)a3
{
  v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  v10 = objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v14 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, @"t5_base", @"model", @"SystemSearch/v1.2.0/");
  if (v14)
  {
    id v15 = objc_alloc((Class)a1);
    inited = objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v15, v16, 2, (uint64_t)v14, @"md1_e5_3outputs_token_embed_fp32inOut.mlmodelc", @"md1_e5_3outputs_text_model_fp16outs_only.mlmodelc", &unk_26FEEA4E8);
  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, @"Vocabulary model file not found in bundle!", 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)getConfigurationForRevision_v1_2_EnglishWithError:(id *)a3
{
  v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  v10 = objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  v14 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, @"t5_base", @"model", @"SystemSearch/v1.2.0/");
  if (v14)
  {
    v17 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v12, @"SystemSearch_v1.2.0_ac4rja6ikq-15000_token-embed-en", @"mlmodelc", @"SystemSearch/v1.2.0/");
    if (v17)
    {
      v20 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v15, @"SystemSearch_v1.2.0_ac4rja6ikq-15000_text-encoder-en", @"mlmodelc", @"SystemSearch/v1.2.0/");
      if (v20)
      {
        id v21 = objc_alloc((Class)a1);
        inited = objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v21, v22, 2, (uint64_t)v14, (uint64_t)v17, v20, &unk_26FEEA510);
      }
      else if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v18, @"text embedding model file not found in bundle!", 0, v19);
        inited = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        inited = 0;
      }
    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v15, @"token embedding model file not found in bundle!", 0, v16);
      inited = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      inited = 0;
    }
  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, @"Vocabulary model file not found in bundle!", 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)overrideWithSideLoadedPathForTokenEmbeddingModel:(id)a3 TextEmbeddingModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9, v10);
  id v15 = objc_msgSend_stringByAppendingPathComponent_(@"private/var/mobile/Library/Application Support/com.apple.VisualGeneration/OVERRIDE", v12, (uint64_t)v5, v13, v14);
  if (objc_msgSend_fileExistsAtPath_(v11, v16, (uint64_t)v15, v17, v18))
  {
    v22 = objc_msgSend_stringByAppendingPathComponent_(@"private/var/mobile/Library/Application Support/com.apple.VisualGeneration/OVERRIDE", v19, (uint64_t)v6, v20, v21);
    if (objc_msgSend_fileExistsAtPath_(v11, v23, (uint64_t)v22, v24, v25))
    {
      v28 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v26, @"private/var/mobile/Library/Application Support/com.apple.VisualGeneration/OVERRIDE", 1, v27);
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (id)getConfigurationFromModelCatalogForRevision_v4_1_Tier0WithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  uint64_t v10 = objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  uint64_t v14 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, @"omnie_t0_50k", @"model", @"SystemSearch/v5.0.0/");
  if (v14)
  {
    id v15 = objc_alloc((Class)a1);
    inited = objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v15, v16, 5, (uint64_t)v14, @"token_model_md4_mubb.mlmodelc", @"text_model_md4_mubb.mlmodelc", &unk_26FEEA538);
  }
  else if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, @"Vocabulary model file not found in bundle!", 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }

  return inited;
}

+ (id)getConfigurationForRevision_v5_0_Tier0WithError:(id *)a3
{
  v39[10] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  uint64_t v10 = objc_msgSend_bundleForClass_(v5, v7, v6, v8, v9);
  uint64_t v14 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v11, @"omnie_t0_50k", @"model", @"SystemSearch/v5.0.0/");
  if (v14)
  {
    id v15 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v12, @"token_model_md5_mubb_enum", @"mlmodelc", @"SystemSearch/v5.0.0/");
    uint64_t v19 = objc_msgSend_stringWithFormat_(NSString, v16, @"file://%@", v17, v18, v15);

    if (v19)
    {
      uint64_t v25 = objc_msgSend_pathForResource_ofType_inDirectory_(v10, v20, @"text_model_ctx_512_77", @"mlmodelc", @"SystemSearch/v5.0.0/");
      if (v25)
      {
        v26 = objc_msgSend_stringWithFormat_(NSString, v22, @"file://%@", v23, v24, v25);

        v38[0] = @"contextLength";
        v38[1] = @"maxSeqLen";
        v39[0] = &unk_26FEEA170;
        v39[1] = &unk_26FEEA188;
        v38[2] = @"tokenEmbedLen";
        v38[3] = @"numCustomTokens";
        v39[2] = &unk_26FEEA1D0;
        v39[3] = &unk_26FEEA1A0;
        v38[4] = @"text_embed_shape";
        v38[5] = @"text_embed_width";
        v39[4] = &unk_26FEEA368;
        v39[5] = &unk_26FEEA188;
        v38[6] = @"text_embed_height";
        v38[7] = @"usePrecompiledBundleForMacOS";
        v39[6] = &unk_26FEEA1B8;
        v39[7] = MEMORY[0x263EFFA80];
        v39[8] = @"main_ctx_77";
        v38[8] = @"e5function";
        v38[9] = @"e5functionsAvailable";
        v36[0] = &unk_26FEEA188;
        v36[1] = &unk_26FEEA170;
        v37[0] = @"main_ctx_512";
        v37[1] = @"main_ctx_77";
        v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)v37, (uint64_t)v36, 2);
        v39[9] = v28;
        v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v39, (uint64_t)v38, 10);

        id v31 = objc_alloc((Class)a1);
        inited = objc_msgSend_initTextEncoderV1ConfigurationForRevision_vocabularyModelPath_tokenEmbeddingNetworkPath_textEncoderNetworkPath_encoderParams_(v31, v32, 4, (uint64_t)v14, (uint64_t)v19, v26, v30);

LABEL_13:
        goto LABEL_14;
      }
      if (a3)
      {
        objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v22, @"text embedding model file not found in bundle!", 0, v24);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else if (a3)
    {
      objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v20, @"token embedding model file not found in bundle!", 0, v21);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      inited = 0;
      *a3 = v34;
      goto LABEL_13;
    }
    inited = 0;
    goto LABEL_13;
  }
  if (a3)
  {
    objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v12, @"Vocabulary model file not found in bundle!", 0, v13);
    inited = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    inited = 0;
  }
LABEL_14:

  return inited;
}

+ (id)TextEncoderE5MLConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  uint64_t v8 = objc_msgSend__resolvedRevision_(a1, a2, a3, (uint64_t)a4, v4);
  switch(v8)
  {
    case 5:
      v12 = objc_msgSend_getConfigurationFromModelCatalogForRevision_v4_1_Tier0WithError_(a1, v9, (uint64_t)a4, v10, v11);
      break;
    case 4:
      v12 = objc_msgSend_getConfigurationForRevision_v5_0_Tier0WithError_(a1, v9, (uint64_t)a4, v10, v11);
      break;
    case 2:
      v12 = objc_msgSend_getConfigurationFromModelCatalogForRevision_v1_2_EnglishWithError_(a1, v9, (uint64_t)a4, v10, v11);
      break;
    default:
      if (a4)
      {
        uint64_t v14 = NSString;
        id v15 = objc_msgSend_numberWithInteger_(NSNumber, v9, a3, v10, v11);
        uint64_t v19 = objc_msgSend_stringWithFormat_(v14, v16, @"Unsupported TextEncoderE5ML revision %@", v17, v18, v15);
        objc_msgSend_errorForUnsupportedRevision_(CSUError, v20, (uint64_t)v19, v21, v22);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = 0;
      break;
  }
  return v12;
}

- (id)initTextEncoderV1ConfigurationForRevision:(int64_t)a3 vocabularyModelPath:(id)a4 tokenEmbeddingNetworkPath:(id)a5 textEncoderNetworkPath:(id)a6 encoderParams:(id)a7
{
  uint64_t v204 = *MEMORY[0x263EF8340];
  id v186 = a4;
  id v187 = a5;
  id v188 = a6;
  id v193 = a7;
  v198.receiver = self;
  v198.super_class = (Class)CSUTextEncoderE5MLConfiguration;
  id v191 = [(CSUTextEncoderE5MLConfiguration *)&v198 init];
  if (v191)
  {
    *((void *)v191 + 6) = a3;
    uint64_t v16 = objc_msgSend_copy(v186, v12, v13, v14, v15);
    uint64_t v17 = (void *)*((void *)v191 + 7);
    *((void *)v191 + 7) = v16;

    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v193, v18, @"contextLength", v19, v20);
    *((void *)v191 + 2) = objc_msgSend_unsignedLongValue(v21, v22, v23, v24, v25);

    v29 = objc_msgSend_objectForKeyedSubscript_(v193, v26, @"maxSeqLen", v27, v28);
    *((void *)v191 + 12) = objc_msgSend_unsignedLongValue(v29, v30, v31, v32, v33);

    *((unsigned char *)v191 + 10) = 1;
    id v34 = (void *)*((void *)v191 + 18);
    *((void *)v191 + 18) = @"text_ids";

    v35 = (void *)*((void *)v191 + 8);
    *((void *)v191 + 8) = 0;

    uint64_t v40 = objc_msgSend_copy(v187, v36, v37, v38, v39);
    v41 = (void *)*((void *)v191 + 9);
    *((void *)v191 + 9) = v40;

    v42 = (void *)*((void *)v191 + 10);
    *((void *)v191 + 10) = 0;

    uint64_t v47 = objc_msgSend_copy(v188, v43, v44, v45, v46);
    v48 = (void *)*((void *)v191 + 11);
    *((void *)v191 + 11) = v47;

    v49 = objc_opt_class();
    objc_msgSend_overrideWithSideLoadedPathForTokenEmbeddingModel_TextEmbeddingModel_(v49, v50, *((void *)v191 + 9), *((void *)v191 + 11), v51);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)v191 + 10, obj);
    objc_storeStrong((id *)v191 + 8, obj);
    v52 = v191;
    *((unsigned char *)v191 + 8) = 0;
    if (obj)
    {
      v53 = sub_24C69662C();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v58 = objc_msgSend_absoluteString(obj, v54, v55, v56, v57);
        *(_DWORD *)buf = 138412290;
        v203 = v58;
        _os_log_impl(&dword_24C664000, v53, OS_LOG_TYPE_INFO, "Models side loaded from %@", buf, 0xCu);
      }
      v52 = v191;
      *((unsigned char *)v191 + 8) = 1;
    }
    v59 = (void *)v52[19];
    v52[19] = @"token_embed";

    v63 = objc_msgSend_objectForKeyedSubscript_(v193, v60, @"tokenEmbedLen", v61, v62);
    *((void *)v191 + 13) = objc_msgSend_unsignedLongValue(v63, v64, v65, v66, v67);

    v71 = objc_msgSend_objectForKeyedSubscript_(v193, v68, @"numCustomTokens", v69, v70);
    *((void *)v191 + 14) = objc_msgSend_unsignedLongValue(v71, v72, v73, v74, v75);

    v79 = objc_msgSend_objectForKeyedSubscript_(v193, v76, @"usePrecompiledBundleForMacOS", v77, v78);
    *((unsigned char *)v191 + 9) = objc_msgSend_BOOLValue(v79, v80, v81, v82, v83);

    uint64_t v84 = objc_opt_new();
    v85 = (void *)*((void *)v191 + 15);
    *((void *)v191 + 15) = v84;

    v89 = objc_msgSend_objectForKeyedSubscript_(v193, v86, @"text_embed_shape", v87, v88);
    objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 15), v90, (uint64_t)v89, @"text_embed", v91);

    uint64_t v92 = objc_opt_new();
    v93 = (void *)*((void *)v191 + 16);
    *((void *)v191 + 16) = v92;

    v97 = objc_msgSend_objectForKeyedSubscript_(v193, v94, @"text_embed_width", v95, v96);
    objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 16), v98, (uint64_t)v97, @"text_embed", v99);

    uint64_t v100 = objc_opt_new();
    v101 = (void *)*((void *)v191 + 17);
    *((void *)v191 + 17) = v100;

    v105 = objc_msgSend_objectForKeyedSubscript_(v193, v102, @"text_embed_height", v103, v104);
    objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 17), v106, (uint64_t)v105, @"text_embed", v107);

    long long v196 = 0u;
    long long v197 = 0u;
    long long v194 = 0u;
    long long v195 = 0u;
    id v190 = *((id *)v191 + 3);
    uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v108, (uint64_t)&v194, (uint64_t)v201, 16);
    if (v112)
    {
      uint64_t v192 = *(void *)v195;
      do
      {
        for (uint64_t i = 0; i != v112; ++i)
        {
          if (*(void *)v195 != v192) {
            objc_enumerationMutation(v190);
          }
          uint64_t v114 = *(void *)(*((void *)&v194 + 1) + 8 * i);
          v115 = objc_msgSend_stringWithFormat_(NSString, v109, @"%@_shape", v110, v111, v114);
          v122 = objc_msgSend_objectForKey_(v193, v116, (uint64_t)v115, v117, v118);
          if (!v122) {
            goto LABEL_10;
          }
          v123 = objc_msgSend_stringWithFormat_(NSString, v119, @"%@_width", v120, v121, v114);
          v130 = objc_msgSend_objectForKey_(v193, v124, (uint64_t)v123, v125, v126);
          if (!v130)
          {

            goto LABEL_9;
          }
          v131 = objc_msgSend_stringWithFormat_(NSString, v127, @"%@_height", v128, v129, v114);
          v135 = objc_msgSend_objectForKey_(v193, v132, (uint64_t)v131, v133, v134);
          BOOL v136 = v135 == 0;

          if (!v136)
          {
            v137 = objc_msgSend_stringWithFormat_(NSString, v109, @"%@_shape", v110, v111, v114);
            v141 = objc_msgSend_objectForKeyedSubscript_(v193, v138, (uint64_t)v137, v139, v140);
            objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 15), v142, (uint64_t)v141, v114, v143);

            v147 = objc_msgSend_stringWithFormat_(NSString, v144, @"%@_width", v145, v146, v114);
            v151 = objc_msgSend_objectForKeyedSubscript_(v193, v148, (uint64_t)v147, v149, v150);
            objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 16), v152, (uint64_t)v151, v114, v153);

            v115 = objc_msgSend_stringWithFormat_(NSString, v154, @"%@_height", v155, v156, v114);
            v122 = objc_msgSend_objectForKeyedSubscript_(v193, v157, (uint64_t)v115, v158, v159);
            objc_msgSend_setObject_forKeyedSubscript_(*((void **)v191 + 17), v160, (uint64_t)v122, v114, v161);
LABEL_9:

LABEL_10:
            continue;
          }
        }
        uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v190, v109, (uint64_t)&v194, (uint64_t)v201, 16);
      }
      while (v112);
    }

    v162 = (void *)*((void *)v191 + 20);
    *((void *)v191 + 20) = @"token_embed";

    v163 = (void *)*((void *)v191 + 21);
    *((void *)v191 + 21) = @"indices";

    v164 = (void *)*((void *)v191 + 22);
    *((void *)v191 + 22) = @"text_embed";

    v165 = (void *)*((void *)v191 + 23);
    *((void *)v191 + 23) = @"input_tranpose";

    v169 = objc_msgSend_objectForKey_(v193, v166, @"e5function", v167, v168);
    BOOL v170 = v169 == 0;

    if (v170)
    {
      *((void *)v191 + 4) = @"main";
    }
    else
    {
      v174 = objc_msgSend_objectForKeyedSubscript_(v193, v171, @"e5function", v172, v173);
      *((void *)v191 + 4) = v174;
    }
    v175 = objc_msgSend_objectForKey_(v193, v171, @"e5functionsAvailable", v172, v173);
    BOOL v176 = v175 == 0;

    if (v176)
    {
      v180 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v177, *((void *)v191 + 12), v178, v179);
      uint64_t v181 = *((void *)v191 + 4);
      v199 = v180;
      uint64_t v200 = v181;
      v183 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v182, (uint64_t)&v200, (uint64_t)&v199, 1);
      *((void *)v191 + 5) = v183;
    }
    else
    {
      v180 = objc_msgSend_objectForKeyedSubscript_(v193, v177, @"e5functionsAvailable", v178, v179);
      *((void *)v191 + 5) = v180;
    }

    id v184 = v191;
  }

  return v191;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 2, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 4, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 5, v10, v11);
  uint64_t v16 = objc_msgSend_copy(v2, v12, v13, v14, v15);

  return v16;
}

- (unint64_t)contextLength
{
  return self->_contextLength;
}

- (void)setContextLength:(unint64_t)a3
{
  self->_contextLength = a3;
}

- (NSArray)additionalLayerNames
{
  return self->_additionalLayerNames;
}

- (void)setAdditionalLayerNames:(id)a3
{
}

- (NSString)e5function
{
  return self->_e5function;
}

- (void)setE5function:(id)a3
{
  self->_e5function = (NSString *)a3;
}

- (NSDictionary)e5FunctionsAvailable
{
  return self->_e5FunctionsAvailable;
}

- (void)setE5FunctionsAvailable:(id)a3
{
  self->_e5FunctionsAvailable = (NSDictionary *)a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (void)setVocabularyModelPath:(id)a3
{
}

- (NSURL)tokenEmbeddingNetworkURL
{
  return self->_tokenEmbeddingNetworkURL;
}

- (void)setTokenEmbeddingNetworkURL:(id)a3
{
}

- (NSString)tokenEmbeddingNetworkPath
{
  return self->_tokenEmbeddingNetworkPath;
}

- (void)setTokenEmbeddingNetworkPath:(id)a3
{
}

- (NSURL)textEncoderNetworkURL
{
  return self->_textEncoderNetworkURL;
}

- (void)setTextEncoderNetworkURL:(id)a3
{
}

- (NSString)textEncoderNetworkPath
{
  return self->_textEncoderNetworkPath;
}

- (void)setTextEncoderNetworkPath:(id)a3
{
}

- (BOOL)sideLoaded
{
  return self->_sideLoaded;
}

- (void)setSideLoaded:(BOOL)a3
{
  self->_sideLoaded = a3;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (void)setMaximumSequenceLength:(unint64_t)a3
{
  self->_maximumSequenceLength = a3;
}

- (unint64_t)tokenEmbeddingLength
{
  return self->_tokenEmbeddingLength;
}

- (void)setTokenEmbeddingLength:(unint64_t)a3
{
  self->_tokenEmbeddingLength = a3;
}

- (unint64_t)numCustomTokens
{
  return self->_numCustomTokens;
}

- (void)setNumCustomTokens:(unint64_t)a3
{
  self->_numCustomTokens = a3;
}

- (BOOL)usePrecompiledBundleForMacOS
{
  return self->_usePrecompiledBundleForMacOS;
}

- (void)setUsePrecompiledBundleForMacOS:(BOOL)a3
{
  self->_usePrecompiledBundleForMacOS = a3;
}

- (NSMutableDictionary)layerShapes
{
  return self->_layerShapes;
}

- (void)setLayerShapes:(id)a3
{
}

- (NSMutableDictionary)layerWidths
{
  return self->_layerWidths;
}

- (void)setLayerWidths:(id)a3
{
}

- (NSMutableDictionary)layerHeights
{
  return self->_layerHeights;
}

- (void)setLayerHeights:(id)a3
{
}

- (BOOL)inputIsLowerCase
{
  return self->_inputIsLowerCase;
}

- (void)setInputIsLowerCase:(BOOL)a3
{
  self->_inputIsLowerCase = a3;
}

- (NSString)inputTextIDTensorName
{
  return self->_inputTextIDTensorName;
}

- (void)setInputTextIDTensorName:(id)a3
{
}

- (NSString)outputTokenEmbeddingIDTensorName
{
  return self->_outputTokenEmbeddingIDTensorName;
}

- (void)setOutputTokenEmbeddingIDTensorName:(id)a3
{
}

- (NSString)inputTokenEmbeddingIDTensorName
{
  return self->_inputTokenEmbeddingIDTensorName;
}

- (void)setInputTokenEmbeddingIDTensorName:(id)a3
{
}

- (NSString)inputTokenEmbeddingMaskTensorName
{
  return self->_inputTokenEmbeddingMaskTensorName;
}

- (void)setInputTokenEmbeddingMaskTensorName:(id)a3
{
}

- (NSString)outputTextEmbeddingTensorName
{
  return self->_outputTextEmbeddingTensorName;
}

- (void)setOutputTextEmbeddingTensorName:(id)a3
{
}

- (NSString)outputLastHiddenStateTensorName
{
  return self->_outputLastHiddenStateTensorName;
}

- (void)setOutputLastHiddenStateTensorName:(id)a3
{
}

- (int)espressoExecutionEngine
{
  return self->_espressoExecutionEngine;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputLastHiddenStateTensorName, 0);
  objc_storeStrong((id *)&self->_outputTextEmbeddingTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingMaskTensorName, 0);
  objc_storeStrong((id *)&self->_inputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_outputTokenEmbeddingIDTensorName, 0);
  objc_storeStrong((id *)&self->_inputTextIDTensorName, 0);
  objc_storeStrong((id *)&self->_layerHeights, 0);
  objc_storeStrong((id *)&self->_layerWidths, 0);
  objc_storeStrong((id *)&self->_layerShapes, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_textEncoderNetworkURL, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkPath, 0);
  objc_storeStrong((id *)&self->_tokenEmbeddingNetworkURL, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_additionalLayerNames, 0);
}

@end