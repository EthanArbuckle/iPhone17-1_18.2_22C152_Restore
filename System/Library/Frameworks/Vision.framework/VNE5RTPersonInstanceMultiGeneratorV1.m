@interface VNE5RTPersonInstanceMultiGeneratorV1
+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)outputMaskBlobNameToRequestKey;
+ (id)outputMaskBlobNames;
+ (unint64_t)modelVersion;
- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7;
@end

@implementation VNE5RTPersonInstanceMultiGeneratorV1

+ (id)outputMaskBlobNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VNE5RTPersonInstanceMultiGeneratorV1_outputMaskBlobNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNames]::onceToken != -1) {
    dispatch_once(&+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNames]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNames]::outputMaskBlobNames;

  return v2;
}

void __59__VNE5RTPersonInstanceMultiGeneratorV1_outputMaskBlobNames__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) E5RTFunctionDescriptorForConfigurationOptions:MEMORY[0x1E4F1CC08] error:0];
  v2 = [v1 personInstanceMasksOutput];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "name", (void)v11);
        [v3 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v3 copy];
  v10 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNames]::outputMaskBlobNames;
  +[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNames]::outputMaskBlobNames = v9;
}

+ (id)outputMaskBlobNameToRequestKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VNE5RTPersonInstanceMultiGeneratorV1_outputMaskBlobNameToRequestKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNameToRequestKey]::onceToken != -1) {
    dispatch_once(&+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNameToRequestKey]::onceToken, block);
  }
  v2 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;

  return v2;
}

void __70__VNE5RTPersonInstanceMultiGeneratorV1_outputMaskBlobNameToRequestKey__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [*(id *)(a1 + 32) outputMaskBlobNames];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKey:", v3, *(void *)(*((void *)&v12 + 1) + 8 * v9++), (void)v12);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v5 copy];
  long long v11 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey;
  +[VNE5RTPersonInstanceMultiGeneratorV1 outputMaskBlobNameToRequestKey]::outputMaskBlobNameToRequestKey = v10;
}

+ (unint64_t)modelVersion
{
  return 1;
}

+ (id)createE5RTFunctionDescriptorForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 E5RTVisionCoreComputeDeviceForConfigurationOptions:v6 error:a4];
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__16960;
  uint64_t v16 = __Block_byref_object_dispose__16961;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__VNE5RTPersonInstanceMultiGeneratorV1_createE5RTFunctionDescriptorForConfigurationOptions_error___block_invoke;
  v11[3] = &unk_1E5B1E0A0;
  v11[4] = &v12;
  v11[5] = v7;
  if (+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::onceToken, v11);
  }
  uint64_t v8 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  if (+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor)
  {
    id v9 = (id)+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  }
  else if (a4)
  {
    *a4 = (id) v13[5];
  }
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __98__VNE5RTPersonInstanceMultiGeneratorV1_createE5RTFunctionDescriptorForConfigurationOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = [MEMORY[0x1E4FB3EF8] personInstanceMaskForModelVersion:1 computeDeviceType:v1 error:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
  id v4 = (void *)+[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor;
  +[VNE5RTPersonInstanceMultiGeneratorV1 createE5RTFunctionDescriptorForConfigurationOptions:error:]::descriptor = v3;
}

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB3EF8], "modelFileURLForModelVersion:error:", objc_msgSend(a1, "modelVersion", a3), a4);

  return v4;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v62 = a6;
  uint64_t v12 = +[VNValidationUtilities requiredSessionInOptions:error:](VNValidationUtilities, "requiredSessionInOptions:error:");
  if (!v12)
  {
    v41 = 0;
    goto LABEL_49;
  }
  v57 = v12;
  long long v13 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_ObjectClassIDs" inOptions:v62 error:a7];
  v56 = v13;
  if (v13)
  {
    uint64_t v14 = [v13 unsignedIntegerValue];
    long long v15 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat" inOptions:v62 error:a7];
    if (!v15)
    {
      v41 = 0;
LABEL_47:

      goto LABEL_48;
    }
    id v53 = v15;
    char v79 = 0;
    if (!+[VNValidationUtilities getBOOLValue:&v79 forKey:@"VNSegmentationGeneratorProcessOption_ImageRotated" inOptions:v62 error:a7])
    {
      v41 = 0;
LABEL_46:
      long long v15 = v53;
      goto LABEL_47;
    }
    id v49 = v60;
    v46 = [v49 objectMaskDescriptorsForObjectClassIDs:v14 error:a7];
    if (!v46)
    {
      v41 = 0;
LABEL_45:

      goto LABEL_46;
    }
    uint64_t v16 = objc_opt_class();
    [v16 requestKeyToRequestInfo];
    v48 = v52 = self;
    uint64_t v17 = [v48 count];
    for (id i = objc_alloc_init(MEMORY[0x1E4F1CA48]); v17; --v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [i addObject:v18];
    }
    v47 = [v16 outputMaskBlobNameToRequestKey];
    v19 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_OriginalRequestSpecifiers" inOptions:v62 error:a7];
    if (!v19
      || (int v78 = 0,
          !+[VNValidationUtilities getFloatValue:&v78 forKey:@"VNSegmentationGeneratorProcessOption_MinimumConfidence" inOptions:v62 withDefaultValue:a7 error:0.0]))
    {
      v41 = 0;
LABEL_44:

      goto LABEL_45;
    }
    v44 = v19;
    v20 = [v49 objectMaskDescriptorsForObjectClassIDs:16 error:a7];
    v54 = [v20 firstObject];

    if (v54)
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v21 = v46;
      id obj = v21;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v74 objects:v95 count:16];
      if (v22)
      {
        uint64_t v50 = *(void *)v75;
        while (2)
        {
          uint64_t v51 = v22;
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v75 != v50) {
              objc_enumerationMutation(obj);
            }
            v24 = *(void **)(*((void *)&v74 + 1) + 8 * j);
            v25 = [v24 name];
            v26 = [v54 name];
            char v27 = [v25 isEqualToString:v26];

            if ((v27 & 1) == 0)
            {
              int v28 = v78;
              id v29 = v25;
              id v30 = v54;
              id v55 = v61;
              if (!v52)
              {

LABEL_41:
                v41 = 0;
                v42 = obj;
                goto LABEL_42;
              }
              +[VNError VNAssert:1 log:@"One or more of output parameters is/are NULL"];
              uint64_t v91 = 0;
              v92 = (float *)&v91;
              uint64_t v93 = 0x2020000000;
              int v94 = 0;
              uint64_t v87 = 0;
              v88 = &v87;
              uint64_t v89 = 0x2020000000;
              char v90 = 1;
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __167__VNE5RTPersonInstanceMultiGeneratorV1_validateMaskForBlobName_confidenceScoresDescriptor_functionOutputObjects_minimumConfidence_maskConfidence_maskAcceptable_error___block_invoke;
              aBlock[3] = &unk_1E5B1D9C0;
              id v31 = v30;
              v84 = &v91;
              id v81 = v31;
              v82 = v52;
              id v29 = v29;
              id v83 = v29;
              v85 = &v87;
              int v86 = v28;
              v32 = _Block_copy(aBlock);
              v33 = [v31 name];
              char v34 = [v55 accessReadOnlyDataForName:v33 usingBlock:v32 error:a7];

              if (v34)
              {
                float v35 = v92[6];
                int v36 = *((unsigned __int8 *)v88 + 24);
              }
              else
              {
                int v36 = 0;
                float v35 = 1.0;
              }

              _Block_object_dispose(&v87, 8);
              _Block_object_dispose(&v91, 8);

              if ((v34 & 1) == 0) {
                goto LABEL_41;
              }
              if (v36)
              {
                v63[0] = MEMORY[0x1E4F143A8];
                v63[1] = 3221225472;
                v63[2] = __141__VNE5RTPersonInstanceMultiGeneratorV1_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke;
                v63[3] = &unk_1E5B1D998;
                v63[4] = v24;
                id v29 = v29;
                id v64 = v29;
                id v37 = v53;
                char v73 = v79;
                id v65 = v37;
                v66 = v52;
                id v67 = v57;
                id v68 = v47;
                id v69 = v48;
                id v70 = v44;
                float v72 = v35;
                id v71 = i;
                v38 = _Block_copy(v63);
                v39 = [v24 name];
                char v40 = [v55 accessReadOnlyDataForName:v39 usingBlock:v38 error:a7];

                if ((v40 & 1) == 0) {
                  goto LABEL_41;
                }
              }
            }
          }
          id v21 = obj;
          uint64_t v22 = [obj countByEnumeratingWithState:&v74 objects:v95 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      if (![i count])
      {
        v41 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_43;
      }
      if ([v59 specifiesRequestClass:objc_opt_class()])
      {
        v41 = (void *)[i copy];
LABEL_43:

        v19 = v44;
        goto LABEL_44;
      }
      v42 = [i firstObject];
      v41 = (void *)[v42 copy];
    }
    else
    {
      if (!a7)
      {
        v41 = 0;
        goto LABEL_43;
      }
      v42 = (void *)[[NSString alloc] initWithFormat:@"Cannot find confidence score descriptor"];
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:");
      v41 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_42:

    goto LABEL_43;
  }
  v41 = 0;
LABEL_48:

  uint64_t v12 = v57;
LABEL_49:

  return v41;
}

uint64_t __141__VNE5RTPersonInstanceMultiGeneratorV1_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) dataType] == 65552 || objc_msgSend(*(id *)(a1 + 32), "dataType") == 983056)
  {
    id v6 = [*(id *)(a1 + 32) shape];
    size_t v7 = *(void *)([v6 sizes] + 24);

    id v8 = [*(id *)(a1 + 32) shape];
    size_t v9 = *(void *)([v8 sizes] + 16);

    [*(id *)(a1 + 32) dataType];
    uint64_t v10 = VisionCoreTensorDataTypeGetElementSize() * v7 * v9;
    if ([v5 length] == v10)
    {
      long long v11 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v7, v9, 1278226534, (void *)a3);
      if (v11)
      {
        if (+[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, v7, v9, 1278226536, (int *)[v5 bytes], v11, (void *)a3))
        {
          uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
          uint64_t v13 = [v12 unsignedIntegerValue];

          if (!*(unsigned char *)(a1 + 108) && v13 == 1278226534) {
            goto LABEL_19;
          }
          uint64_t v14 = (void *)MEMORY[0x1A6257080]();
          long long v15 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v11];
          CVPixelBufferRelease(v11);
          if (*(unsigned char *)(a1 + 108))
          {
            uint64_t v16 = [v15 imageByApplyingCGOrientation:6];

            size_t v17 = v9;
            long long v15 = (void *)v16;
          }
          else
          {
            size_t v17 = v7;
            size_t v7 = v9;
          }
          v20 = *(void **)(a1 + 56);
          id v21 = [*(id *)(a1 + 64) vnciContextManager];
          id v32 = 0;
          long long v11 = (__CVBuffer *)[v20 renderCIImage:v15 width:v17 height:v7 format:v13 vnciContextManager:v21 error:&v32];
          id v22 = v32;

          if (v11)
          {

LABEL_19:
            v23 = [*(id *)(a1 + 72) objectForKey:*(void *)(a1 + 40)];
            v24 = [*(id *)(a1 + 80) objectForKey:v23];
            v25 = *(void **)(a1 + 88);
            v26 = [v24 originatingRequestSpecifierKey];
            char v27 = [v25 objectForKeyedSubscript:v26];

            int v28 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v27 featureName:0 CVPixelBuffer:v11];
            LODWORD(v29) = *(_DWORD *)(a1 + 104);
            [(VNObservation *)v28 setConfidence:v29];
            id v30 = objc_msgSend(*(id *)(a1 + 96), "objectAtIndex:", objc_msgSend(v24, "originalRequestResultsIndex"));
            [v30 addObject:v28];

            a3 = 1;
LABEL_24:
            CVPixelBufferRelease(v11);
            goto LABEL_25;
          }
          if (a3) {
            *(void *)a3 = v22;
          }

          long long v11 = 0;
        }
        a3 = 0;
        goto LABEL_24;
      }
      goto LABEL_15;
    }
    if (a3)
    {
      id v18 = (void *)[[NSString alloc] initWithFormat:@"%@ size is %lu bytes instead of the expected %lu bytes \n", *(void *)(a1 + 40), objc_msgSend(v5, "length"), v10];
      v19 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
LABEL_14:
      *(void *)a3 = v19;

LABEL_15:
      a3 = 0;
    }
  }
  else if (a3)
  {
    id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected data type: %lu", objc_msgSend(*(id *)(a1 + 32), "dataType"));
    v19 = +[VNError errorForInternalErrorWithLocalizedDescription:v18];
    goto LABEL_14;
  }
LABEL_25:

  return a3;
}

BOOL __167__VNE5RTPersonInstanceMultiGeneratorV1_validateMaskForBlobName_confidenceScoresDescriptor_functionOutputObjects_minimumConfidence_maskConfidence_maskAcceptable_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) dataType];
  if (v6 == 65552)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v9;
    double v29 = v8;
    if (v7)
    {
      uint64_t v11 = [v9 bytes];
      id v12 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      [v12 setNumberStyle:1];
      uint64_t v13 = [v8 componentsSeparatedByString:@":"];
      uint64_t v14 = [v13 firstObject];

      long long v15 = [v14 componentsSeparatedByString:@"_"];
      uint64_t v16 = [v15 lastObject];

      size_t v17 = [v12 numberFromString:v16];
      unint64_t v18 = [v17 unsignedIntegerValue] - 1;

      +[VNError VNAssert:v18 < 4 log:@"VNSegmentationGenerator - internal error calculating confidence index"];
      _H0 = *(_WORD *)(v11 + 2 * v18);
      __asm { FCVT            S8, H0 }
    }
    else
    {
      _S8 = 0;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = _S8;
    float v25 = *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v25 >= 0.5)
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
      if (v25 >= *(float *)(a1 + 72))
      {
        *(unsigned char *)(v26 + 24) = 1;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    *(unsigned char *)(v26 + 24) = 0;
  }
  else if (a3)
  {
    char v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected data type: %lu", objc_msgSend(*(id *)(a1 + 32), "dataType"));
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v27];
  }
LABEL_11:

  return v6 == 65552;
}

@end