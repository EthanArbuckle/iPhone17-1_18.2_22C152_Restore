@interface VNCRImageReaderDetector
+ (id)_imageReaderInitializationOptionsForCreationOptions:(id)a3 computeDevice:(id)a4 error:(id *)a5;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedLanguagesForProcessOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)isCRImageReaderViableAfterError:(id)a3;
- (id)_observationsForImageReaderOutput:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
- (id)cachedImageReader;
- (id)newImageReaderAndReturnError:(id *)a3;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)setCachedImageReader:(id)a3;
@end

@implementation VNCRImageReaderDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VNCRImageReaderDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __64__VNCRImageReaderDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNCRImageReaderDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_FastRecognition"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_RecognitionLanguages"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_CustomWords"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_UsesCoreMode"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_SkipVerticalText"];
  [v2 addObject:@"VNCRImageReaderDetectorCreationOption_KeepResourcesLoaded"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNCRImageReaderDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v12 = 0;
  if (+[VNValidationUtilities getNSIntegerValue:&v12 forKey:@"VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey" inOptions:v6 error:a4])
  {
    v7 = [a1 _imageReaderInitializationOptionsForCreationOptions:v6 computeDevice:0 error:a4];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4FAF150] supportedComputeDevicesForOptions:v7 revision:v12 error:a4];
      v9 = (void *)v8;
      if (v8)
      {
        v13 = @"VNComputeStageMain";
        v14[0] = v8;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)supportedLanguagesForProcessOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v6 error:a4];
  uint64_t v8 = [a1 _imageReaderInitializationOptionsForCreationOptions:v6 computeDevice:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
    v11 = [a1 imageReaderRecognitionOptionsForProcessOptions:v6];
    [v10 addEntriesFromDictionary:v11];

    uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FAF0B8]];
    uint64_t v13 = [v12 unsignedIntegerValue];

    v14 = [MEMORY[0x1E4FAF150] supportedLanguagesForOptions:v10 revision:v13 error:a4];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v5 = [v3 objectForKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_MinimumTextHeight"];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FAF0A0]];

  id v6 = [v3 objectForKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_UsesFormFieldDetection"];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4FAF060]];

  return v4;
}

+ (id)_imageReaderInitializationOptionsForCreationOptions:(id)a3 computeDevice:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FAF050]];
  v9 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_FastRecognition"];
  int v10 = [v9 BOOLValue];

  uint64_t v11 = *MEMORY[0x1E4FAF0C8];
  if (v10)
  {
    [v8 setObject:*MEMORY[0x1E4FAF0D0] forKeyedSubscript:v11];
    uint64_t v12 = (void *)MEMORY[0x1E4FAF0E8];
  }
  else
  {
    [v8 setObject:*MEMORY[0x1E4FAF0D8] forKeyedSubscript:v11];
    uint64_t v12 = (void *)MEMORY[0x1E4FAF0F0];
  }
  [v8 setObject:*v12 forKeyedSubscript:*MEMORY[0x1E4FAF0E0]];
  uint64_t v13 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_MaximumCandidatesCount"];
  [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4FAF0A8]];

  v14 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_RecognitionLanguages"];
  [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FAF098]];
  v15 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesLanguageDetection"];
  int v16 = [v15 BOOLValue];

  v17 = [NSNumber numberWithBool:v16 ^ 1u];
  [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4FAF078]];

  v18 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CRImageReaderRevisionKey"];
  [v8 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4FAF0B8]];

  v19 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_CustomWords"];
  [v8 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FAF080]];

  v20 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_DisableLanguageCorrection"];
  [v8 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FAF070]];

  v21 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesAlternateLineGrouping"];
  [v8 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4FAF0B0]];

  v22 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_UsesCoreMode"];
  [v8 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FAF058]];

  v23 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_SkipVerticalText"];
  [v8 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4FAF0C0]];

  v24 = [v6 objectForKeyedSubscript:@"VNCRImageReaderDetectorCreationOption_KeepResourcesLoaded"];
  [v8 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4FAF090]];

  return v8;
}

- (void).cxx_destruct
{
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a9;
  v15 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNCRImageReaderDetectorProcessOption_OriginatingRequest" inOptions:v13 error:a8];
  if (!v15)
  {
    v25 = 0;
    goto LABEL_31;
  }
  uint64_t v16 = [(VNDetector *)self requiredCancellerInOptions:v13 error:a8];
  v17 = (void *)v16;
  if (v16)
  {
    v36 = (void *)v16;
    v18 = [(id)objc_opt_class() imageReaderRecognitionOptionsForProcessOptions:v13];
    v19 = self->_imageReader;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__1981;
    v65 = __Block_byref_object_dispose__1982;
    id v66 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__1981;
    v59 = __Block_byref_object_dispose__1982;
    id v60 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v44[3] = &unk_1E5B1C1B0;
    id v47 = v14;
    v48 = &v61;
    v45 = v19;
    v50 = a4;
    id v20 = v18;
    id v46 = v20;
    v49 = &v55;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
    v41[3] = &unk_1E5B1C658;
    v43 = &v51;
    v35 = v45;
    v42 = v35;
    v17 = v36;
    char v21 = [v36 tryToPerformBlock:v44 usingSignallingBlock:v41];
    if (*((unsigned char *)v52 + 24)
      || ![(VNCRImageReaderDetector *)self isCRImageReaderViableAfterError:v56[5]])
    {
      id v22 = [(VNCRImageReaderDetector *)self newImageReaderAndReturnError:0];
      if (v22) {
        objc_storeStrong((id *)&self->_imageReader, v22);
      }
    }
    if (v21)
    {
      v23 = (NSError *)v56[5];
      if (!v23)
      {
        uint64_t v26 = v62[5];
        if (v26)
        {
          v27 = [(VNCRImageReaderDetector *)self _observationsForImageReaderOutput:v26 requestRevision:[(VNRequest *)v15 revision] error:a8];
          v25 = v27;
          if (v27)
          {
            id v34 = v20;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v28 = v27;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v67 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v38 != v30) {
                    objc_enumerationMutation(v28);
                  }
                  [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v13 toObservation:*(void *)(*((void *)&v37 + 1) + 8 * i)];
                }
                uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v67 count:16];
              }
              while (v29);
            }

            id v20 = v34;
            id v32 = v28;
          }

          goto LABEL_29;
        }
      }
      if (a8)
      {
        _vnErrorForError(v23, v15);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v25 = 0;
        *a8 = v24;
LABEL_29:

        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);

        _Block_object_dispose(&v61, 8);
        goto LABEL_30;
      }
    }
    else if (a8)
    {
      id v24 = +[VNError errorForCancellationOfRequest:v15];
      goto LABEL_16;
    }
    v25 = 0;
    goto LABEL_29;
  }
  v25 = 0;
LABEL_30:

LABEL_31:

  return v25;
}

void __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  v9 = *(void **)(v6 + 40);
  id v8 = (id *)(v6 + 40);
  id v7 = v9;
  if (v2)
  {
    v15 = v7;
    uint64_t v10 = objc_msgSend(v3, "resultsForPixelBuffer:roi:options:error:withProgressHandler:", v5, v4, &v15, 0.0, 0.0, 1.0, 1.0);
    id v11 = v15;
  }
  else
  {
    id obj = v7;
    uint64_t v10 = [v3 resultsForPixelBuffer:v5 options:v4 error:&obj];
    id v11 = obj;
  }
  objc_storeStrong(v8, v11);
  uint64_t v12 = *(void *)(a1[7] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;
}

uint64_t __125__VNCRImageReaderDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) cancel];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17)
  {
    v18 = self->_imageReader;
    v19 = [v16 objectForKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_MinimumTextHeight"];
    [v19 doubleValue];
    double v21 = v20;

    unint64_t v22 = [v17 width];
    unint64_t v23 = [v17 height];
    v36.origin.double x = x * (double)v22;
    v36.size.double width = width * (double)v22;
    v36.origin.double y = y * (double)v23;
    v36.size.double height = height * (double)v23;
    CGRect v37 = CGRectIntegral(v36);
    double v24 = v37.origin.x;
    double v25 = v37.origin.y;
    double v26 = v37.size.width;
    double v27 = v37.size.height;
    -[CRImageReader smallestImageSizeForTextWithRelativeHeight:originalImageSize:](v18, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", v21, v37.size.width, v37.size.height);
    unint64_t v30 = ((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if ((((unint64_t)v28 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 3 && v30 > 2)
    {
      v33 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v24, v25, v26, v27);
      id v34 = 0;
      *a7 = v33;
      LOBYTE(a8) = v33 != 0;
      if (v33) {
        [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v16 cacheKey:v34 imageBuffer:v17];
      }
    }
    else if (a8)
    {
      id v32 = objc_msgSend(NSString, "stringWithFormat:", @"The image is too small in at least one dimension %ld x %ld (each dimension has to be more than 2 pixels)", ((unint64_t)v28 + 1) & 0xFFFFFFFFFFFFFFFELL, v30);
      *a8 = +[VNError errorForInvalidImageFailureWithLocalizedDescription:v32];

      LOBYTE(a8) = 0;
    }
  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNCRImageReaderDetector;
  if ([(VNDetector *)&v11 completeInitializationForSession:v6 error:a4])
  {
    id v7 = [(VNCRImageReaderDetector *)self newImageReaderAndReturnError:a4];
    imageReader = self->_imageReader;
    self->_imageReader = v7;

    BOOL v9 = self->_imageReader != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_observationsForImageReaderOutput:(id)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (v7)
  {
    uint64_t v50 = *(void *)v57;
    uint64_t v49 = *MEMORY[0x1E4FAF0F8];
    id v8 = &selRef__checkInitInputs_cachePath_checkType_requestRevision_error_;
    while (2)
    {
      uint64_t v48 = v7;
      uint64_t v9 = 0;
      v44 = v8[499];
      do
      {
        if (*(void *)v57 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
        objc_super v11 = [v10 type];
        int v12 = [v11 isEqualToString:v49];

        if (v12)
        {
          id v13 = [v10 stringValue];
          BOOL v14 = v13 == 0;

          if (!v14)
          {
            v15 = [VNRecognizedTextObservation alloc];
            [v10 topLeft];
            double v17 = v16;
            double v19 = v18;
            [v10 topRight];
            double v21 = v20;
            double v23 = v22;
            [v10 bottomRight];
            double v25 = v24;
            double v27 = v26;
            [v10 bottomLeft];
            unint64_t v30 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](v15, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", a4, v17, 1.0 - v19, v21, 1.0 - v23, v25, 1.0 - v27, v29, 1.0 - v28);
            if (!v30)
            {
              if (a5)
              {
                *a5 = +[VNError errorForMemoryAllocationFailure];
              }
LABEL_26:

              id v42 = 0;
              v41 = v46;
              goto LABEL_27;
            }
            id v47 = v30;
            unsigned int v31 = [v10 confidence];
            double v32 = 0.0;
            if (v31 <= 2) {
              LODWORD(v32) = dword_1A41233A0[v31];
            }
            [(VNObservation *)v30 setConfidence:v32];
            -[VNRecognizedTextObservation setIsTitle:](v30, "setIsTitle:", [v10 isTitle]);
            id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v34 = [v10 performSelector:v44];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v35 = v34;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
            if (v36)
            {
              uint64_t v37 = *(void *)v53;
              while (2)
              {
                for (uint64_t i = 0; i != v36; ++i)
                {
                  if (*(void *)v53 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  long long v39 = [[VNRecognizedText alloc] initWithRequestRevision:a4 CRImageReaderOutput:*(void *)(*((void *)&v52 + 1) + 8 * i)];
                  if (!v39)
                  {
                    if (a5)
                    {
                      *a5 = +[VNError errorForMemoryAllocationFailure];
                    }

                    goto LABEL_26;
                  }
                  [v33 addObject:v39];
                }
                uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
                if (v36) {
                  continue;
                }
                break;
              }
            }

            [(VNRecognizedTextObservation *)v47 setTextObjects:v33];
            long long v40 = [v10 stringValue];
            [(VNRecognizedTextObservation *)v47 setText:v40];

            [v46 addObject:v47];
          }
        }
        ++v9;
      }
      while (v9 != v48);
      uint64_t v7 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      id v8 = &selRef__checkInitInputs_cachePath_checkType_requestRevision_error_;
      if (v7) {
        continue;
      }
      break;
    }
  }

  v41 = v46;
  id v42 = v46;
LABEL_27:

  return v42;
}

- (id)newImageReaderAndReturnError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VNDetector *)self configurationOptions];
  id v6 = [(VNDetector *)self computeDeviceForComputeStage:@"VNComputeStageMain" processingOptions:v5 error:a3];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() _imageReaderInitializationOptionsForCreationOptions:v5 computeDevice:v6 error:a3];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4FAF150]) initWithOptions:v7];
      v11[0] = *MEMORY[0x1E4FAF0F8];
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v8 setOutputObjectTypes:v9];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isCRImageReaderViableAfterError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    char v6 = [v5 isEqualToString:*MEMORY[0x1E4FAF088]];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)setCachedImageReader:(id)a3
{
}

- (id)cachedImageReader
{
  return self->_imageReader;
}

@end