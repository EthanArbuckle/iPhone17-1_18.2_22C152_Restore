@interface VNE5RTSemanticSegmentationMultiGenerator
+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4;
- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7;
@end

@implementation VNE5RTSemanticSegmentationMultiGenerator

+ (id)modelURLForConfigurationOptions:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend(MEMORY[0x1E4FB3F28], "modelFileURLForModelVersion:error:", objc_msgSend(a1, "modelVersion", a3), a4);

  return v4;
}

- (id)observationsFromE5RTExecutionOutputs:(id)a3 forFunctionDescriptor:(id)a4 originatingRequestSpecifier:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v60 = a4;
  id v59 = a5;
  id v11 = a6;
  v12 = +[VNValidationUtilities requiredSessionInOptions:v11 error:a7];
  if (!v12)
  {
    v22 = 0;
    goto LABEL_48;
  }
  v58 = v12;
  v13 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_ObjectClassIDs" inOptions:v11 error:a7];
  v55 = v13;
  if (v13)
  {
    uint64_t v14 = [v13 unsignedIntegerValue];
    v15 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat" inOptions:v11 error:a7];
    if (!v15
      || (char v88 = 0,
          !+[VNValidationUtilities getBOOLValue:&v88 forKey:@"VNSegmentationGeneratorProcessOption_ImageRotated" inOptions:v11 error:a7]))
    {
      v22 = 0;
LABEL_46:

      goto LABEL_47;
    }
    id v45 = v60;
    v44 = [v45 objectMaskDescriptorsForObjectClassIDs:v14 error:a7];
    if (!v44)
    {
      v22 = 0;
LABEL_45:

      goto LABEL_46;
    }
    v16 = objc_opt_class();
    v84[0] = 0;
    v84[1] = v84;
    v84[2] = 0x4812000000;
    v84[3] = __Block_byref_object_copy__19261;
    v84[4] = __Block_byref_object_dispose__19262;
    v84[5] = "";
    uint64_t v87 = 0;
    __p = 0;
    uint64_t v86 = 0;
    uint64_t v56 = [v16 modelVersion];
    if (v56 == 2)
    {
      v17 = [v45 objectMaskDescriptorsForObjectClassIDs:4096 error:a7];
      v18 = [v17 firstObject];

      if (!v18)
      {
        id v47 = 0;
LABEL_41:
        v22 = 0;
LABEL_42:
        _Block_object_dispose(v84, 8);
        if (__p) {
          operator delete(__p);
        }

        goto LABEL_45;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke;
      aBlock[3] = &unk_1E5B1DCA0;
      id v47 = v18;
      id v82 = v47;
      v83 = v84;
      v19 = _Block_copy(aBlock);
      v20 = [v47 name];
      char v21 = [v61 accessReadOnlyDataForName:v20 usingBlock:v19 error:a7];

      if ((v21 & 1) == 0) {
        goto LABEL_41;
      }
    }
    else
    {
      id v47 = 0;
    }
    v49 = [v16 requestKeyToRequestInfo];
    uint64_t v23 = [v49 count];
    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v50 = [v16 outputMaskBlobNameToRequestKey];
    v51 = [v16 outputMaskBlobNameToFeatureName];
    uint64_t v24 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_OriginalRequestSpecifiers" inOptions:v11 error:a7];
    v25 = (void *)v24;
    if (v24)
    {
      v48 = (void *)v24;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v26 = v44;
      obuint64_t j = v26;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v77 objects:v89 count:16];
      if (v27)
      {
        uint64_t v53 = *(void *)v78;
        while (2)
        {
          uint64_t v54 = v27;
          for (uint64_t i = 0; i != v54; ++i)
          {
            if (*(void *)v78 != v53) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            v30 = [v29 name];
            if (v56 == 2
              && ([v47 name],
                  v31 = objc_claimAutoreleasedReturnValue(),
                  int v32 = [v30 isEqualToString:v31],
                  v31,
                  v32))
            {
            }
            else
            {
              v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v23];
              for (uint64_t j = v23; j; --j)
              {
                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v33 addObject:v35];
              }
              v64[0] = MEMORY[0x1E4F143A8];
              v64[1] = 3221225472;
              v64[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_2;
              v64[3] = &unk_1E5B1DCC8;
              v64[4] = v29;
              v74 = v84;
              uint64_t v75 = v56;
              id v36 = v30;
              id v65 = v36;
              id v37 = v15;
              char v76 = v88;
              id v66 = v37;
              v67 = self;
              id v68 = v58;
              id v69 = v50;
              id v70 = v49;
              id v71 = v51;
              id v72 = v48;
              id v38 = v33;
              id v73 = v38;
              v39 = _Block_copy(v64);
              v40 = [v29 name];
              int v41 = [v61 accessReadOnlyDataForName:v40 usingBlock:v39 error:a7];

              if (v41)
              {
                if ([v52 count])
                {
                  v62[0] = MEMORY[0x1E4F143A8];
                  v62[1] = 3221225472;
                  v62[2] = __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_3;
                  v62[3] = &unk_1E5B1DCF0;
                  id v63 = v38;
                  [v52 enumerateObjectsUsingBlock:v62];
                }
                else
                {
                  [v52 addObjectsFromArray:v38];
                }
              }

              if (!v41)
              {
                v22 = 0;
                v42 = obj;
                goto LABEL_38;
              }
            }
          }
          id v26 = obj;
          uint64_t v27 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      v25 = v48;
      if ([v52 count])
      {
        if ([v59 specifiesRequestClass:objc_opt_class()])
        {
          v22 = (void *)[v52 copy];
        }
        else
        {
          v42 = [v52 firstObject];
          v22 = (void *)[v42 copy];
LABEL_38:

          v25 = v48;
        }
      }
      else
      {
        v22 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v22 = 0;
    }

    goto LABEL_42;
  }
  v22 = 0;
LABEL_47:

  v12 = v58;
LABEL_48:

  return v22;
}

void *__145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) dataType] == 65552)
  {
    id v6 = [*(id *)(a1 + 32) shape];
    uint64_t v7 = *(void *)([v6 sizes] + 8);

    id v8 = [*(id *)(a1 + 32) shape];
    uint64_t v9 = *(void *)[v8 sizes];

    uint64_t v10 = [*(id *)(a1 + 32) storageByteCount];
    BOOL v12 = [v5 length] != v10 || v9 != 1 || v7 == 0;
    int v13 = v12;
    if (v12)
    {
      if (a3)
      {
        id v14 = [NSString alloc];
        v15 = [*(id *)(a1 + 32) name];
        v16 = (void *)[v14 initWithFormat:@"%@ size is %lu bytes instead of the expected %lu bytes, or maskBufferHeight (%lu) is not 1, or number of object classes (%lu) is zero \n", v15, objc_msgSend(v5, "length"), v10, v9, v7];

        *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v16];
      }
    }
    else
    {
      v18 = (short float *)[v5 bytes];
      do
      {
        v19 = (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
        BOOL v21 = *v18 > COERCE_SHORT_FLOAT(5145);
        std::vector<BOOL>::push_back(v19, &v21);
        ++v18;
        --v7;
      }
      while (v7);
    }
    a3 = (void *)(v13 ^ 1u);
  }
  else if (a3)
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected data type: %lu", objc_msgSend(*(id *)(a1 + 32), "dataType"));
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v17];

    a3 = 0;
  }

  return a3;
}

uint64_t __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) dataType] != 65552 && objc_msgSend(*(id *)(a1 + 32), "dataType") != 983056)
  {
    if (a3)
    {
      id v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected data type: %lu", objc_msgSend(*(id *)(a1 + 32), "dataType"));
      *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v26];
    }
    goto LABEL_16;
  }
  if (*(void *)(a1 + 120) == 2)
  {
    id v6 = (void *)MEMORY[0x1E4FB3F28];
    uint64_t v7 = [*(id *)(a1 + 32) name];
    v48[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    uint64_t v9 = [v6 objectClassNamesToObjectClassesDetectionStatusIndexes:v8 modelVersion:*(void *)(a1 + 120) error:a3];

    uint64_t v10 = [v9 allValues];
    id v11 = [(id)v10 firstObject];
    unint64_t v12 = [v11 unsignedIntegerValue];

    LOBYTE(v10) = ((*(void *)(*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 48)
                              + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0;

    if (v10)
    {
      uint64_t v18 = 1;
      goto LABEL_28;
    }
  }
  id v13 = [*(id *)(a1 + 32) shape];
  size_t v14 = *(void *)([v13 sizes] + 24);

  id v15 = [*(id *)(a1 + 32) shape];
  size_t v16 = *(void *)([v15 sizes] + 16);

  [*(id *)(a1 + 32) dataType];
  uint64_t v17 = VisionCoreTensorDataTypeGetElementSize() * v14 * v16;
  if ([v5 length] != v17)
  {
    if (a3)
    {
      v25 = (void *)[[NSString alloc] initWithFormat:@"%@ size is %lu bytes instead of the expected %lu bytes \n", *(void *)(a1 + 40), objc_msgSend(v5, "length"), v17];
      *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:v25];
    }
LABEL_16:
    uint64_t v18 = 0;
    goto LABEL_28;
  }
  uint64_t v18 = (uint64_t)+[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v14, v16, 1278226534, a3);
  if (v18)
  {
    if (+[VNCVPixelBufferHelper renderRawDataBufferWithWidth:height:pixelFormatType:rowBytes:dataBytes:intoCVPixelBuffer:error:]((uint64_t)VNCVPixelBufferHelper, v14, v16, 1278226536, (int *)[v5 bytes], (__CVBuffer *)v18, a3))
    {
      v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v20 = [v19 unsignedIntegerValue];

      if (!*(unsigned char *)(a1 + 128) && v20 == 1278226534) {
        goto LABEL_22;
      }
      BOOL v21 = (void *)MEMORY[0x1A6257080]();
      v22 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v18];
      CVPixelBufferRelease((CVPixelBufferRef)v18);
      if (*(unsigned char *)(a1 + 128))
      {
        uint64_t v23 = [v22 imageByApplyingCGOrientation:6];

        size_t v24 = v16;
        v22 = (void *)v23;
      }
      else
      {
        size_t v24 = v14;
        size_t v14 = v16;
      }
      v29 = *(void **)(a1 + 56);
      v30 = [*(id *)(a1 + 64) vnciContextManager];
      id v47 = 0;
      uint64_t v18 = [v29 renderCIImage:v22 width:v24 height:v14 format:v20 vnciContextManager:v30 error:&v47];
      id v31 = v47;

      if (v18)
      {

LABEL_22:
        v46 = [*(id *)(a1 + 72) objectForKey:*(void *)(a1 + 40)];
        int v32 = objc_msgSend(*(id *)(a1 + 80), "objectForKey:");
        v33 = [*(id *)(a1 + 88) objectForKey:*(void *)(a1 + 40)];
        v34 = *(void **)(a1 + 96);
        id v35 = [v32 originatingRequestSpecifierKey];
        id v36 = [v34 objectForKeyedSubscript:v35];

        id v37 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v36 featureName:v33 CVPixelBuffer:v18];
        LODWORD(v38) = 1.0;
        [(VNObservation *)v37 setConfidence:v38];
        v39 = objc_opt_class();
        v40 = [v39 objectClassOutputNameForObjectClassID:128 modelVersion:*(void *)(a1 + 120) error:0];
        int v41 = [v39 objectClassOutputNameForObjectClassID:256 modelVersion:*(void *)(a1 + 120) error:0];
        if (([*(id *)(a1 + 40) isEqualToString:v40] & 1) != 0
          || [*(id *)(a1 + 40) isEqualToString:v41])
        {
          v42 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNRectangleObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v36, 0.0, 0.0, 1.0, 1.0);
          LODWORD(v43) = 1.0;
          [(VNObservation *)v42 setConfidence:v43];
          -[VNDetectedObjectObservation setInstanceSegmentationMask:]((uint64_t)v42, v37);
          v44 = objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", objc_msgSend(v32, "originalRequestResultsIndex"));
          [v44 addObject:v42];
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 104), "objectAtIndex:", objc_msgSend(v32, "originalRequestResultsIndex"));
          v42 = (VNRectangleObservation *)objc_claimAutoreleasedReturnValue();
          [(VNRectangleObservation *)v42 addObject:v37];
        }

        int v27 = 1;
        int v28 = 1;
        goto LABEL_27;
      }
      if (a3) {
        *a3 = v31;
      }

      uint64_t v18 = 0;
    }
    int v27 = 0;
    int v28 = 0;
LABEL_27:
    CVPixelBufferRelease((CVPixelBufferRef)v18);
    uint64_t v18 = v27 | v28;
  }
LABEL_28:

  return v18;
}

void __145__VNE5RTSemanticSegmentationMultiGenerator_observationsFromE5RTExecutionOutputs_forFunctionDescriptor_originatingRequestSpecifier_options_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 addObjectsFromArray:v5];
}

@end