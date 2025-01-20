@interface CSUImageCaptioningDecoderConfiguration
+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 saveDecoderFeatures:(BOOL)a4 error:(id *)a5;
+ (id)availableRevisions;
+ (id)createCSUImageCaptioningDecoderConfigurationWithConfigPath:(id)a3 error:(id *)a4;
+ (id)createCSUImageCaptioningDecoderConfigurationWithDecoderEspressoPath:(id)a3 decoderNetworkParams:(id)a4 bridgeNetworkPath:(id)a5 bridgeNetworkParams:(id)a6 vocabularyPath:(id)a7 useRuntimeEngine:(int64_t)a8 runtimeParamsPath:(id)a9 error:(id *)a10;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (BOOL)bridgeIsPrecompiled;
- (BOOL)decoderIsPrecompiled;
- (BOOL)saveDecoderFeatures;
- (MLComputeDeviceProtocol)computeDevice;
- (NSArray)bridgeInputShape;
- (NSArray)decoderEmbeddingShape;
- (NSArray)decoderInputSeqShape;
- (NSString)bridgeNetworkPath;
- (NSString)decoderNetworkPath;
- (NSString)inputEncodedFeaturesTensorName;
- (NSString)inputEncodedFeaturesTensorNameOfBridge;
- (NSString)inputWordIdsTensorName;
- (NSString)outputTensorNameOfBridge;
- (NSString)outputWordProbsTensorName;
- (NSString)runTimeParamsPath;
- (NSString)vocabularyModelPath;
- (id)initImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 runtimeEngine:(int64_t)a4 espressoNetPath:(id)a5 vocabularyModelPath:(id)a6 inputEncodedFeaturesTensorName:(id)a7 inputWordIdsTensorName:(id)a8 outputWordProbsTensorName:(id)a9 decoderEmbeddingShape:(id)a10 decoderInputSeqShape:(id)a11 decoderIsPrecompiled:(BOOL)a12 saveDecoderFeatures:(BOOL)a13 bridgeNetworkPath:(id)a14 inputEncodedFeaturesTensorNameOfBridge:(id)a15 outputTensorNameOfBridge:(id)a16 bridgeInputShape:(id)a17 bridgeIsPrecompiled:(BOOL)a18 runtimeParamsPath:(id)a19;
- (int)espressoExecutionEngine;
- (int64_t)revision;
- (int64_t)runtimeEngine;
- (unint64_t)maxSeqLen;
- (void)setBridgeInputShape:(id)a3;
- (void)setBridgeIsPrecompiled:(BOOL)a3;
- (void)setBridgeNetworkPath:(id)a3;
- (void)setComputeDevice:(id)a3;
- (void)setDecoderEmbeddingShape:(id)a3;
- (void)setDecoderInputSeqShape:(id)a3;
- (void)setDecoderIsPrecompiled:(BOOL)a3;
- (void)setDecoderNetworkPath:(id)a3;
- (void)setEspressoExecutionEngine:(int)a3;
- (void)setInputEncodedFeaturesTensorName:(id)a3;
- (void)setInputEncodedFeaturesTensorNameOfBridge:(id)a3;
- (void)setInputWordIdsTensorName:(id)a3;
- (void)setMaxSeqLen:(unint64_t)a3;
- (void)setOutputTensorNameOfBridge:(id)a3;
- (void)setOutputWordProbsTensorName:(id)a3;
- (void)setRunTimeParamsPath:(id)a3;
- (void)setSaveDecoderFeatures:(BOOL)a3;
- (void)setVocabularyModelPath:(id)a3;
@end

@implementation CSUImageCaptioningDecoderConfiguration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3;
  }
}

+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](CSUImageCaptioningDecoderConfiguration, sel_CSUImageCaptioningDecoderConfigurationForRevision_saveDecoderFeatures_error_, a3, 0, a4);
}

+ (id)CSUImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 saveDecoderFeatures:(BOOL)a4 error:(id *)a5
{
  v8 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = objc_opt_class();
  v101 = objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12);
  uint64_t v19 = objc_msgSend__resolvedRevision_(a1, v13, a3, v14, v15);
  switch(v19)
  {
    case 1:
      uint64_t v20 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v16, @"ImageCaptioning-ax_v1.0.0_decoder_quantized", @"espresso.net", @"ImageCaptioning-ax_v1.0.0");
      v21 = 0;
      objc_msgSend_pathForResource_ofType_inDirectory_(v101, v22, @"ImageCaptioning-ax_v1.0.0.reverse_vocab", @"json", @"ImageCaptioning-ax_v1.0.0");
      v23 = @"att_feats_placeholder";
      v98 = @"in_word_ids";
      v24 = @"word_probs";
      v25 = 0;
      v27 = v26 = 0;
      v28 = (void *)v20;
      v29 = &unk_26FEEA458;
      goto LABEL_7;
    case 5:
      uint64_t v41 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v16, @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222_bridge_stage2_quantized", @"espresso.net", @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222");
      uint64_t v43 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v42, @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222_decoder_stage2_quantized", @"espresso.net", @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222");
      objc_msgSend_pathForResource_ofType_inDirectory_(v101, v44, @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222.reverse_vocab", @"json", @"ImageCaptioning-mica_v3.0.0_ya2ywy3nyz-40222");
      v28 = (void *)v43;
      v23 = @"encoder_embed";
      v98 = @"input_seq";
      v24 = @"captioning_decoder/word_probs";
      v26 = @"bridge_input";
      v25 = @"image_encoder_head/out";
      v27 = v21 = (void *)v41;
      v29 = &unk_26FEEA470;
      goto LABEL_7;
    case 6:
      v45 = objc_msgSend_stringWithFormat_(NSString, v16, @"video_captioning/%@", v17, v18, @"VideoCaptioning_v3.0.0_nm8r5qngqf-94830");
      v99 = objc_msgSend_stringWithFormat_(NSString, v46, @"%@_bridge_quant", v47, v48, @"VideoCaptioning_v3.0.0_nm8r5qngqf-94830");
      v52 = objc_msgSend_stringWithFormat_(NSString, v49, @"%@_decoder_quant", v50, v51, @"VideoCaptioning_v3.0.0_nm8r5qngqf-94830");
      v56 = objc_msgSend_stringWithFormat_(NSString, v53, @"%@.reverse_vocab", v54, v55, @"VideoCaptioning_v3.0.0_nm8r5qngqf-94830");
      v21 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v57, (uint64_t)v99, @"espresso.net", (uint64_t)v45);
      v28 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v58, (uint64_t)v52, @"espresso.net", (uint64_t)v45);
      v27 = objc_msgSend_pathForResource_ofType_inDirectory_(v101, v59, (uint64_t)v56, @"json", (uint64_t)v45);

      v98 = @"input_seq";
      v24 = @"captioning_decoder/word_probs";
      v26 = @"encoder_embed";
      v25 = @"image_encoder_head/out";
      v29 = &unk_26FEEA488;
      v23 = @"encoder_embed";
LABEL_7:
      id v60 = objc_alloc((Class)a1);
      HIBYTE(v97) = a4;
      LOBYTE(v97) = 0;
      IsPrecompiled_runtimeParamsPath = objc_msgSend_initImageCaptioningDecoderConfigurationForRevision_runtimeEngine_espressoNetPath_vocabularyModelPath_inputEncodedFeaturesTensorName_inputWordIdsTensorName_outputWordProbsTensorName_decoderEmbeddingShape_decoderInputSeqShape_decoderIsPrecompiled_saveDecoderFeatures_bridgeNetworkPath_inputEncodedFeaturesTensorNameOfBridge_outputTensorNameOfBridge_bridgeInputShape_bridgeIsPrecompiled_runtimeParamsPath_(v60, v61, v19, 1, (uint64_t)v28, v27, v23, v98, v24, 0, v29, v97, v21, v26, v25, 0, 0, 0);
      v36 = v101;
      goto LABEL_14;
    case 7:
      v36 = v101;
      v31 = objc_msgSend_pathForResource_ofType_(v101, v16, @"image_captioning", (uint64_t)&stru_26FEDE788, v18);
      v35 = objc_msgSend_stringByAppendingPathComponent_(v31, v62, @"ImageCaptioningMD4_s3xsc4vvsa-34701", v63, v64);
      v68 = objc_msgSend_stringByAppendingPathComponent_(v35, v65, @"ImageCaptioning.config.json", v66, v67);
      uint64_t v71 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(a1, v69, (uint64_t)v68, (uint64_t)a5, v70);
      goto LABEL_12;
    case 8:
      v36 = v101;
      v31 = objc_msgSend_pathForResource_ofType_(v101, v16, @"image_captioning", (uint64_t)&stru_26FEDE788, v18);
      v35 = objc_msgSend_stringByAppendingPathComponent_(v31, v72, @"ImageCaptioningMD5_jf7fjab8py-1414", v73, v74);
      v68 = objc_msgSend_stringByAppendingPathComponent_(v35, v75, @"ImageCaptioning.config.json", v76, v77);
      uint64_t v71 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(a1, v78, (uint64_t)v68, (uint64_t)a5, v79);
      goto LABEL_12;
    case 9:
      v36 = v101;
      v31 = objc_msgSend_pathForResource_ofType_(v101, v16, @"image_captioning", (uint64_t)&stru_26FEDE788, v18);
      v35 = objc_msgSend_stringByAppendingPathComponent_(v31, v80, @"ImageCaptioningMD5_jf7fjab8py-1414", v81, v82);
      v68 = objc_msgSend_stringByAppendingPathComponent_(v35, v83, @"ImageCaptioning_Safe.config.json", v84, v85);
      uint64_t v71 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(a1, v86, (uint64_t)v68, (uint64_t)a5, v87);
      goto LABEL_12;
    case 10:
      v36 = v101;
      v31 = objc_msgSend_pathForResource_ofType_(v101, v16, @"image_captioning", (uint64_t)&stru_26FEDE788, v18);
      v35 = objc_msgSend_stringByAppendingPathComponent_(v31, v88, @"ImageCaptioningMD5_jf7fjab8py-1414", v89, v90);
      v68 = objc_msgSend_stringByAppendingPathComponent_(v35, v91, @"ImageCaptioning_GP_PeopleDetection.config.json", v92, v93);
      uint64_t v71 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithConfigPath_error_(a1, v94, (uint64_t)v68, (uint64_t)a5, v95);
LABEL_12:
      IsPrecompiled_runtimeParamsPath = (void *)v71;

      goto LABEL_13;
    default:
      if (a5)
      {
        v30 = NSString;
        v31 = objc_msgSend_numberWithInteger_(NSNumber, v16, a3, v17, v18);
        v35 = objc_msgSend_stringWithFormat_(v30, v32, @"Unsupported captioning image decoder revision %@", v33, v34, v31);
        v36 = v101;
        objc_msgSend_errorForUnsupportedRevision_(CSUError, v37, (uint64_t)v35, v38, v39);
        IsPrecompiled_runtimeParamsPath = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

        v21 = 0;
        v27 = 0;
        v28 = 0;
      }
      else
      {
        v21 = 0;
        v27 = 0;
        v28 = 0;
        IsPrecompiled_runtimeParamsPath = 0;
        v36 = v101;
      }
LABEL_14:

      return IsPrecompiled_runtimeParamsPath;
  }
}

+ (id)createCSUImageCaptioningDecoderConfigurationWithConfigPath:(id)a3 error:(id *)a4
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v131 = v6;
  v130 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_fileExistsAtPath_(v130, v11, (uint64_t)v6, v12, v13);
  uint64_t v18 = objc_msgSend_stringWithFormat_(NSString, v15, @"decoder config file does not exist at path %@", v16, v17, v6);
  char v20 = objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v19, v14, (uint64_t)a4, (uint64_t)v18);

  if ((v20 & 1) == 0)
  {
    v58 = 0;
    goto LABEL_40;
  }
  v24 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v21, (uint64_t)v6, v22, v23);
  if (objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v25, v24 != 0, (uint64_t)a4, @"decoder config path could not be read!"))
  {
    v27 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v26, (uint64_t)v24, 0, (uint64_t)a4);
    if (objc_msgSend_CSUAssert_logError_withMessage_(CSUError, v28, v27 != 0, (uint64_t)a4, @"decoder config path could not be read!"))
    {
      v129 = v24;
      uint64_t v33 = objc_msgSend_mutableCopy(MEMORY[0x263EFFA68], v29, v30, v31, v32);
      id v127 = a1;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26FEEA4A0, v34, (uint64_t)&v132, (uint64_t)v136, 16);
      if (v39)
      {
        uint64_t v40 = *(void *)v133;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v133 != v40) {
              objc_enumerationMutation(&unk_26FEEA4A0);
            }
            uint64_t v42 = *(void *)(*((void *)&v132 + 1) + 8 * i);
            uint64_t v43 = objc_msgSend_valueForKey_(v27, v35, v42, v37, v38);
            BOOL v44 = v43 == 0;

            if (v44) {
              objc_msgSend_addObject_(v33, v35, v42, v37, v38);
            }
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26FEEA4A0, v35, (uint64_t)&v132, (uint64_t)v136, 16);
        }
        while (v39);
      }
      if (objc_msgSend_count(v33, v35, v36, v37, v38))
      {
        if (!a4)
        {
          v58 = 0;
LABEL_38:

          v24 = v129;
          goto LABEL_39;
        }
        v49 = NSString;
        uint64_t v50 = objc_msgSend_componentsJoinedByString_(v33, v45, @", ", v47, v48);
        uint64_t v54 = objc_msgSend_stringWithFormat_(v49, v51, @"decoder config missing params: %@", v52, v53, v50);

        objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v55, (uint64_t)v54, v56, v57);
        v58 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v54 = objc_msgSend_stringByDeletingLastPathComponent(v131, v45, v46, v47, v48);
        v62 = objc_msgSend_objectForKeyedSubscript_(v27, v59, @"decoderNetworkPath", v60, v61);
        uint64_t v66 = objc_msgSend_stringByAppendingPathComponent_(v54, v63, (uint64_t)v62, v64, v65);

        v126 = objc_msgSend_objectForKeyedSubscript_(v27, v67, @"decoderNetworkParams", v68, v69);
        uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v27, v70, @"vocabularyPath", v71, v72);
        v125 = objc_msgSend_stringByAppendingPathComponent_(v54, v74, (uint64_t)v73, v75, v76);

        v80 = objc_msgSend_objectForKeyedSubscript_(v27, v77, @"bridgeNetworkPath", v78, v79);
        BOOL v81 = v80 == 0;

        if (v81)
        {
          v128 = 0;
          v124 = 0;
        }
        else
        {
          uint64_t v85 = objc_msgSend_objectForKeyedSubscript_(v27, v82, @"bridgeNetworkPath", v83, v84);
          v128 = objc_msgSend_stringByAppendingPathComponent_(v54, v86, (uint64_t)v85, v87, v88);

          uint64_t v92 = objc_msgSend_objectForKeyedSubscript_(v27, v89, @"bridgeNetworkParams", v90, v91);
          BOOL v93 = v92 == 0;

          if (v93)
          {
            objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(CSUError, v94, @"bridge network params missing", 0, v96);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v124 = objc_msgSend_objectForKeyedSubscript_(v27, v94, @"bridgeNetworkParams", v95, v96);
        }
        __int16 v97 = objc_msgSend_objectForKeyedSubscript_(v27, v82, @"runtime", v83, v84);
        BOOL v98 = v97 == 0;

        if (v98)
        {
          uint64_t v107 = 0;
        }
        else
        {
          v102 = objc_msgSend_objectForKeyedSubscript_(v27, v99, @"runtime", v100, v101);
          char isEqualToString = objc_msgSend_isEqualToString_(v102, v103, @"E1", v104, v105);

          if (isEqualToString)
          {
            uint64_t v107 = 1;
          }
          else
          {
            v108 = objc_msgSend_objectForKeyedSubscript_(v27, v99, @"runtime", v100, v101);
            char v112 = objc_msgSend_isEqualToString_(v108, v109, @"AX", v110, v111);

            if (v112)
            {
              uint64_t v107 = 3;
            }
            else
            {
              v113 = objc_msgSend_objectForKeyedSubscript_(v27, v99, @"runtime", v100, v101);
              int v117 = objc_msgSend_isEqualToString_(v113, v114, @"E5", v115, v116);

              if (v117) {
                uint64_t v107 = 2;
              }
              else {
                uint64_t v107 = 0;
              }
            }
          }
        }
        v121 = objc_msgSend_objectForKeyedSubscript_(v27, v99, @"runtimeParamsPath", v100, v101);
        if (v121)
        {
          uint64_t v122 = objc_msgSend_stringByAppendingPathComponent_(v54, v118, (uint64_t)v121, v119, v120);

          v121 = (void *)v122;
        }
        v58 = objc_msgSend_createCSUImageCaptioningDecoderConfigurationWithDecoderEspressoPath_decoderNetworkParams_bridgeNetworkPath_bridgeNetworkParams_vocabularyPath_useRuntimeEngine_runtimeParamsPath_error_(v127, v118, (uint64_t)v66, (uint64_t)v126, (uint64_t)v128, v124, v125, v107, v121, a4);
      }
      goto LABEL_38;
    }
  }
  else
  {
    v27 = 0;
  }
  v58 = 0;
LABEL_39:

LABEL_40:
  return v58;
}

+ (id)createCSUImageCaptioningDecoderConfigurationWithDecoderEspressoPath:(id)a3 decoderNetworkParams:(id)a4 bridgeNetworkPath:(id)a5 bridgeNetworkParams:(id)a6 vocabularyPath:(id)a7 useRuntimeEngine:(int64_t)a8 runtimeParamsPath:(id)a9 error:(id *)a10
{
  id v134 = a3;
  id v15 = a4;
  id v136 = a5;
  id v16 = a6;
  id v133 = a7;
  id v132 = a9;
  long long v135 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v17, v18, v19, v20);
  v25 = objc_msgSend_mutableCopy(MEMORY[0x263EFFA68], v21, v22, v23, v24);
  if ((objc_msgSend_fileExistsAtPath_(v135, v26, (uint64_t)v134, v27, v28) & 1) == 0)
  {
    uint64_t v32 = objc_msgSend_stringWithFormat_(NSString, v29, @"decoder network file does not exist %@", v30, v31, v134);
    objc_msgSend_addObject_(v25, v33, (uint64_t)v32, v34, v35);
  }
  if ((objc_msgSend_fileExistsAtPath_(v135, v29, (uint64_t)v133, v30, v31) & 1) == 0)
  {
    uint64_t v39 = objc_msgSend_stringWithFormat_(NSString, v36, @"vocabulary file does not exist %@", v37, v38, v133);
    objc_msgSend_addObject_(v25, v40, (uint64_t)v39, v41, v42);
  }
  uint64_t v43 = objc_msgSend_valueForKey_(v15, v36, @"inputEncodedFeaturesTensorName", v37, v38);

  if (!v43) {
    objc_msgSend_addObject_(v25, v44, @"decoder config missing params: inputEncodedFeaturesTensorName", v45, v46);
  }
  uint64_t v47 = objc_msgSend_valueForKey_(v15, v44, @"inputWordIdsTensorName", v45, v46);

  if (!v47) {
    objc_msgSend_addObject_(v25, v48, @"decoder config missing params: inputWordIdsTensorName", v49, v50);
  }
  uint64_t v51 = objc_msgSend_valueForKey_(v15, v48, @"outputWordProbsTensorName", v49, v50);

  if (!v51) {
    objc_msgSend_addObject_(v25, v52, @"decoder config missing params: outputWordProbsTensorName", v54, v55);
  }
  if (v136)
  {
    if ((objc_msgSend_fileExistsAtPath_(v135, v52, (uint64_t)v136, v54, v55) & 1) == 0) {
      id v59 = (id)objc_msgSend_stringWithFormat_(NSString, v56, @"bridge network file does not exist %@", v57, v58, v136);
    }
    uint64_t v60 = objc_msgSend_valueForKey_(v16, v56, @"inputEncodedFeaturesTensorNameOfBridge", v57, v58);

    if (!v60) {
      objc_msgSend_addObject_(v25, v61, @"decoder config missing params: inputEncodedFeaturesTensorNameOfBridge", v62, v63);
    }
    uint64_t v64 = objc_msgSend_valueForKey_(v16, v61, @"outputTensorNameOfBridge", v62, v63);

    if (!v64) {
      objc_msgSend_addObject_(v25, v52, @"decoder config missing params: outputTensorNameOfBridge", v54, v55);
    }
  }
  if (!objc_msgSend_count(v25, v52, v53, v54, v55))
  {
    if (!a8)
    {
      int hasSuffix = objc_msgSend_hasSuffix_(v134, v65, @".net", v66, v67);
      int64_t v79 = 1;
      if (!hasSuffix) {
        int64_t v79 = 2;
      }
      a8 = v79;
    }
    id v129 = v16;
    v80 = objc_msgSend_objectForKeyedSubscript_(v15, v65, @"isPrecompiled", v66, v67);
    unsigned __int8 v85 = objc_msgSend_BOOLValue(v80, v81, v82, v83, v84);

    uint64_t v89 = objc_msgSend_objectForKeyedSubscript_(v16, v86, @"isPrecompiled", v87, v88);
    char v127 = objc_msgSend_BOOLValue(v89, v90, v91, v92, v93);

    id v94 = objc_alloc((Class)a1);
    uint64_t v130 = objc_msgSend_objectForKeyedSubscript_(v15, v95, @"inputEncodedFeaturesTensorName", v96, v97);
    v128 = objc_msgSend_objectForKeyedSubscript_(v15, v98, @"inputWordIdsTensorName", v99, v100);
    uint64_t v104 = objc_msgSend_objectForKeyedSubscript_(v15, v101, @"outputWordProbsTensorName", v102, v103);
    v108 = objc_msgSend_objectForKeyedSubscript_(v15, v105, @"decoderEmbeddingShape", v106, v107);
    v126 = objc_msgSend_objectForKeyedSubscript_(v15, v109, @"decoderInputSeqShape", v110, v111);
    uint64_t v115 = objc_msgSend_objectForKeyedSubscript_(v16, v112, @"inputEncodedFeaturesTensorNameOfBridge", v113, v114);
    uint64_t v119 = objc_msgSend_objectForKeyedSubscript_(v16, v116, @"outputTensorNameOfBridge", v117, v118);
    v123 = objc_msgSend_objectForKeyedSubscript_(v16, v120, @"bridgeInputShape", v121, v122);
    IsPrecompiled_runtimeParamsPath = objc_msgSend_initImageCaptioningDecoderConfigurationForRevision_runtimeEngine_espressoNetPath_vocabularyModelPath_inputEncodedFeaturesTensorName_inputWordIdsTensorName_outputWordProbsTensorName_decoderEmbeddingShape_decoderInputSeqShape_decoderIsPrecompiled_saveDecoderFeatures_bridgeNetworkPath_inputEncodedFeaturesTensorNameOfBridge_outputTensorNameOfBridge_bridgeInputShape_bridgeIsPrecompiled_runtimeParamsPath_(v94, v124, v136 == 0, a8, (uint64_t)v134, v133, v130, v128, v104, v108, v126, v85, v136, v115, v119, v123, v127, v132);

    id v16 = v129;
    uint64_t v73 = (void *)v130;
    goto LABEL_26;
  }
  if (a10)
  {
    uint64_t v68 = NSString;
    uint64_t v69 = objc_msgSend_componentsJoinedByString_(v25, v65, @" ", v66, v67);;
    uint64_t v73 = objc_msgSend_stringWithFormat_(v68, v70, @"decoder config errors: %@", v71, v72, v69);

    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v74, (uint64_t)v73, v75, v76);
    IsPrecompiled_runtimeParamsPath = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_28;
  }
  IsPrecompiled_runtimeParamsPath = 0;
LABEL_28:

  return IsPrecompiled_runtimeParamsPath;
}

- (id)initImageCaptioningDecoderConfigurationForRevision:(int64_t)a3 runtimeEngine:(int64_t)a4 espressoNetPath:(id)a5 vocabularyModelPath:(id)a6 inputEncodedFeaturesTensorName:(id)a7 inputWordIdsTensorName:(id)a8 outputWordProbsTensorName:(id)a9 decoderEmbeddingShape:(id)a10 decoderInputSeqShape:(id)a11 decoderIsPrecompiled:(BOOL)a12 saveDecoderFeatures:(BOOL)a13 bridgeNetworkPath:(id)a14 inputEncodedFeaturesTensorNameOfBridge:(id)a15 outputTensorNameOfBridge:(id)a16 bridgeInputShape:(id)a17 bridgeIsPrecompiled:(BOOL)a18 runtimeParamsPath:(id)a19
{
  id v22 = a5;
  id v23 = a6;
  id v122 = a7;
  id v121 = a8;
  id v120 = a9;
  uint64_t v24 = v22;
  id v25 = a10;
  id v26 = a11;
  id v119 = a14;
  id v118 = a15;
  uint64_t v27 = v23;
  id v117 = a16;
  id v28 = a17;
  id v116 = a19;
  v123.receiver = self;
  v123.super_class = (Class)CSUImageCaptioningDecoderConfiguration;
  v29 = [(CSUImageCaptioningDecoderConfiguration *)&v123 init];
  uint64_t v34 = v29;
  if (!v29) {
    goto LABEL_4;
  }
  v29->_revision = a3;
  v29->_runtimeEngine = a4;
  uint64_t v35 = objc_msgSend_copy(v24, v30, v31, v32, v33);
  decoderNetworkPath = v34->_decoderNetworkPath;
  v34->_decoderNetworkPath = (NSString *)v35;

  v34->_espressoExecutionEngine = 0x7FFFFFFF;
  uint64_t v41 = objc_msgSend_copy(v27, v37, v38, v39, v40);
  vocabularyModelPath = v34->_vocabularyModelPath;
  v34->_vocabularyModelPath = (NSString *)v41;

  uint64_t v47 = objc_msgSend_copy(v122, v43, v44, v45, v46);
  inputEncodedFeaturesTensorName = v34->_inputEncodedFeaturesTensorName;
  v34->_inputEncodedFeaturesTensorName = (NSString *)v47;

  uint64_t v53 = objc_msgSend_copy(v121, v49, v50, v51, v52);
  inputWordIdsTensorName = v34->_inputWordIdsTensorName;
  v34->_inputWordIdsTensorName = (NSString *)v53;

  uint64_t v59 = objc_msgSend_copy(v120, v55, v56, v57, v58);
  outputWordProbsTensorName = v34->_outputWordProbsTensorName;
  v34->_outputWordProbsTensorName = (NSString *)v59;

  uint64_t v65 = objc_msgSend_copy(v25, v61, v62, v63, v64);
  decoderEmbeddingShape = v34->_decoderEmbeddingShape;
  v34->_decoderEmbeddingShape = (NSArray *)v65;

  if (v26)
  {
    uint64_t v71 = objc_msgSend_copy(v26, v67, v68, v69, v70);
    decoderInputSeqShape = v34->_decoderInputSeqShape;
    v34->_decoderInputSeqShape = (NSArray *)v71;

    uint64_t v77 = objc_msgSend_copy(v119, v73, v74, v75, v76);
    bridgeNetworkPath = v34->_bridgeNetworkPath;
    v34->_bridgeNetworkPath = (NSString *)v77;

    uint64_t v83 = objc_msgSend_copy(v118, v79, v80, v81, v82);
    inputEncodedFeaturesTensorNameOfBridge = v34->_inputEncodedFeaturesTensorNameOfBridge;
    v34->_inputEncodedFeaturesTensorNameOfBridge = (NSString *)v83;

    uint64_t v89 = objc_msgSend_copy(v117, v85, v86, v87, v88);
    outputTensorNameOfBridge = v34->_outputTensorNameOfBridge;
    v34->_outputTensorNameOfBridge = (NSString *)v89;

    v34->_saveDecoderFeatures = a13;
    uint64_t v95 = objc_msgSend_copy(v28, v91, v92, v93, v94);
    bridgeInputShape = v34->_bridgeInputShape;
    v34->_bridgeInputShape = (NSArray *)v95;

    uint64_t v101 = objc_msgSend_count(v26, v97, v98, v99, v100);
    uint64_t v105 = objc_msgSend_objectAtIndex_(v26, v102, v101 - 1, v103, v104);
    v34->_maxSeqLen = objc_msgSend_unsignedLongValue(v105, v106, v107, v108, v109);

    objc_storeStrong((id *)&v34->_runTimeParamsPath, a19);
    v34->_bridgeIsPrecompiled = a18;
    v34->_decoderIsPrecompiled = a12;
LABEL_4:
    uint64_t v110 = v34;
    goto LABEL_8;
  }
  uint64_t v111 = sub_24C69662C();
  if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
    sub_24C72A750(v111);
  }

  uint64_t v110 = 0;
LABEL_8:

  return v110;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  objc_msgSend_addIndex_(v2, v6, 8, v7, v8);
  objc_msgSend_addIndex_(v2, v9, 9, v10, v11);
  objc_msgSend_addIndex_(v2, v12, 10, v13, v14);
  return v2;
}

- (int)espressoExecutionEngine
{
  int result = self->_espressoExecutionEngine;
  if (result == 0x7FFFFFFF)
  {
    uint64_t v7 = objc_msgSend_computeDevice(self, a2, v2, v3, v4);
    self->_espressoExecutionEngine = sub_24C689C00(v7);

    return self->_espressoExecutionEngine;
  }
  return result;
}

- (void)setEspressoExecutionEngine:(int)a3
{
  self->_espressoExecutionEngine = a3;
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (void)setComputeDevice:(id)a3
{
}

- (int64_t)revision
{
  return self->_revision;
}

- (int64_t)runtimeEngine
{
  return self->_runtimeEngine;
}

- (NSString)vocabularyModelPath
{
  return self->_vocabularyModelPath;
}

- (void)setVocabularyModelPath:(id)a3
{
}

- (NSString)runTimeParamsPath
{
  return self->_runTimeParamsPath;
}

- (void)setRunTimeParamsPath:(id)a3
{
}

- (NSString)decoderNetworkPath
{
  return self->_decoderNetworkPath;
}

- (void)setDecoderNetworkPath:(id)a3
{
}

- (NSString)bridgeNetworkPath
{
  return self->_bridgeNetworkPath;
}

- (void)setBridgeNetworkPath:(id)a3
{
}

- (unint64_t)maxSeqLen
{
  return self->_maxSeqLen;
}

- (void)setMaxSeqLen:(unint64_t)a3
{
  self->_maxSeqLen = a3;
}

- (NSString)inputEncodedFeaturesTensorNameOfBridge
{
  return self->_inputEncodedFeaturesTensorNameOfBridge;
}

- (void)setInputEncodedFeaturesTensorNameOfBridge:(id)a3
{
}

- (NSString)outputTensorNameOfBridge
{
  return self->_outputTensorNameOfBridge;
}

- (void)setOutputTensorNameOfBridge:(id)a3
{
}

- (NSString)inputEncodedFeaturesTensorName
{
  return self->_inputEncodedFeaturesTensorName;
}

- (void)setInputEncodedFeaturesTensorName:(id)a3
{
}

- (NSString)inputWordIdsTensorName
{
  return self->_inputWordIdsTensorName;
}

- (void)setInputWordIdsTensorName:(id)a3
{
}

- (NSString)outputWordProbsTensorName
{
  return self->_outputWordProbsTensorName;
}

- (void)setOutputWordProbsTensorName:(id)a3
{
}

- (BOOL)saveDecoderFeatures
{
  return self->_saveDecoderFeatures;
}

- (void)setSaveDecoderFeatures:(BOOL)a3
{
  self->_saveDecoderFeatures = a3;
}

- (NSArray)bridgeInputShape
{
  return self->_bridgeInputShape;
}

- (void)setBridgeInputShape:(id)a3
{
}

- (NSArray)decoderEmbeddingShape
{
  return self->_decoderEmbeddingShape;
}

- (void)setDecoderEmbeddingShape:(id)a3
{
}

- (NSArray)decoderInputSeqShape
{
  return self->_decoderInputSeqShape;
}

- (void)setDecoderInputSeqShape:(id)a3
{
}

- (BOOL)bridgeIsPrecompiled
{
  return self->_bridgeIsPrecompiled;
}

- (void)setBridgeIsPrecompiled:(BOOL)a3
{
  self->_bridgeIsPrecompiled = a3;
}

- (BOOL)decoderIsPrecompiled
{
  return self->_decoderIsPrecompiled;
}

- (void)setDecoderIsPrecompiled:(BOOL)a3
{
  self->_decoderIsPrecompiled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderInputSeqShape, 0);
  objc_storeStrong((id *)&self->_decoderEmbeddingShape, 0);
  objc_storeStrong((id *)&self->_bridgeInputShape, 0);
  objc_storeStrong((id *)&self->_outputWordProbsTensorName, 0);
  objc_storeStrong((id *)&self->_inputWordIdsTensorName, 0);
  objc_storeStrong((id *)&self->_inputEncodedFeaturesTensorName, 0);
  objc_storeStrong((id *)&self->_outputTensorNameOfBridge, 0);
  objc_storeStrong((id *)&self->_inputEncodedFeaturesTensorNameOfBridge, 0);
  objc_storeStrong((id *)&self->_bridgeNetworkPath, 0);
  objc_storeStrong((id *)&self->_decoderNetworkPath, 0);
  objc_storeStrong((id *)&self->_runTimeParamsPath, 0);
  objc_storeStrong((id *)&self->_vocabularyModelPath, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
}

@end