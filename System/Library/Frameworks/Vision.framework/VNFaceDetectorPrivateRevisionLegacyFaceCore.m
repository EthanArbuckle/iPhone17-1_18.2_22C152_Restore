@interface VNFaceDetectorPrivateRevisionLegacyFaceCore
+ (id)_convertVNOptionsToFaceCoreDetectOptions:(id)a3;
+ (id)_convertVNOptionsToFaceCoreExtractOptions:(id)a3;
+ (id)_convertVNOptionsToFaceCoreOptions:(id)a3 optionsMap:(id)a4;
+ (id)_convertVNOptionsToFaceCoreSetupOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
@end

@implementation VNFaceDetectorPrivateRevisionLegacyFaceCore

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)_convertVNOptionsToFaceCoreOptions:(id)a3 optionsMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__VNFaceDetectorPrivateRevisionLegacyFaceCore__convertVNOptionsToFaceCoreOptions_optionsMap___block_invoke;
  v13[3] = &unk_1E5B1D268;
  id v8 = v7;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];
  v10 = v15;
  id v11 = v8;

  return v11;
}

void __93__VNFaceDetectorPrivateRevisionLegacyFaceCore__convertVNOptionsToFaceCoreOptions_optionsMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

+ (id)_convertVNOptionsToFaceCoreExtractOptions:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F45D78];
  v10[0] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization";
  v10[1] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink";
  uint64_t v6 = *MEMORY[0x1E4F45D80];
  v11[0] = v5;
  v11[1] = v6;
  v10[2] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile";
  v11[2] = *MEMORY[0x1E4F45D88];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v8 = [a1 _convertVNOptionsToFaceCoreOptions:v4 optionsMap:v7];

  return v8;
}

+ (id)_convertVNOptionsToFaceCoreDetectOptions:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F45D58];
  v10[0] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_ROIs";
  v10[1] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_InitialAngle";
  uint64_t v6 = *MEMORY[0x1E4F45D68];
  v11[0] = v5;
  v11[1] = v6;
  v10[2] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_EnhanceEyesAndMouthLocalization";
  v11[2] = *MEMORY[0x1E4F45D60];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  id v8 = [a1 _convertVNOptionsToFaceCoreOptions:v4 optionsMap:v7];

  return v8;
}

+ (id)_convertVNOptionsToFaceCoreSetupOptions:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v21 = 0;
  uint64_t v22 = 0;
  BOOL v6 = +[VNValidationUtilities getNSUIntegerValue:&v22 forKey:@"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_Type" inOptions:v4 error:&v21];
  id v7 = v21;
  id v14 = v7;
  if (!v6) {
    VNValidatedLog(4, @"FaceCore processing type option does not exist. We should never get here: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  }
  switch(v22)
  {
    case 0:
      id v15 = FCRFaceDetectionParameters();
      [v5 addEntriesFromDictionary:v15];
      goto LABEL_7;
    case 1:
      id v15 = FCRFastFaceDetectionParameters();
      [v5 addEntriesFromDictionary:v15];
      goto LABEL_7;
    case 2:
      id v15 = FCRPreciseDetectionParameters();
      [v5 addEntriesFromDictionary:v15];
LABEL_7:

      break;
    case 3:
      [v5 setValue:*MEMORY[0x1E4F45DD0] forKey:*MEMORY[0x1E4F45DC8]];
      break;
    default:
      VNValidatedLog(4, @"Unsupported FaceCore processing type: %lu", v8, v9, v10, v11, v12, v13, v22);
      break;
  }
  uint64_t v16 = *MEMORY[0x1E4F45DD8];
  v23[0] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize";
  v23[1] = @"VNFaceDetectorPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles";
  uint64_t v17 = *MEMORY[0x1E4F45DE0];
  v24[0] = v16;
  v24[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v19 = [a1 _convertVNOptionsToFaceCoreOptions:v4 optionsMap:v18];
  [v5 addEntriesFromDictionary:v19];

  return v5;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [[VNSizeRange alloc] initWithMinimumDimension:0 maximumDimension:-1 idealDimension:0];
  id v5 = [[VNSupportedImageSize alloc] initWithIdealFormat:1111970369 pixelsWideRange:v4 pixelsHighRange:v4 aspectRatioHandling:0 idealOrientation:1 orientationAgnostic:0];
  v8[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  v49 = v14;
  id v15 = [(VNDetector *)self validatedImageBufferFromOptions:v14 error:a7];
  uint64_t v16 = v15;
  if (!v15)
  {
    v26 = 0;
    goto LABEL_29;
  }
  v48 = v15;
  unint64_t v51 = [v15 width];
  unint64_t v17 = [v16 height];
  v18 = objc_opt_class();
  v19 = [v18 _convertVNOptionsToFaceCoreSetupOptions:v14];
  v20 = [v18 _convertVNOptionsToFaceCoreDetectOptions:v14];
  v46 = v20;
  v47 = [v18 _convertVNOptionsToFaceCoreExtractOptions:v14];
  v80.origin.double x = 0.0;
  v80.origin.double y = 0.0;
  v80.size.double width = 1.0;
  v80.size.double height = 1.0;
  v79.origin.double x = x;
  v79.origin.double y = y;
  v79.size.double width = width;
  v79.size.double height = height;
  if (!CGRectEqualToRect(v79, v80))
  {
    v75[0] = x * (double)v51;
    v75[1] = (1.0 - y - height) * (double)v17;
    v75[2] = width * (double)v51;
    v75[3] = height * (double)v17;
    id v21 = [MEMORY[0x1E4F29238] valueWithBytes:v75 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F45D58]];
  }
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F45DE8]) initWithOptions:v19];
  if (v22)
  {
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__12074;
    v73 = __Block_byref_object_dispose__12075;
    id v74 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E5B1D240;
    double v63 = x;
    double v64 = y;
    double v65 = width;
    double v66 = height;
    unint64_t v67 = v51;
    unint64_t v68 = v17;
    v23 = v22;
    id v57 = v48;
    id v24 = v14;
    id v58 = v24;
    v62 = &v69;
    id v44 = v23;
    id v59 = v23;
    id v60 = v20;
    id v61 = v47;
    v45 = _Block_copy(aBlock);
    if (VNExecuteBlock(v45, (uint64_t)a7))
    {
      v25 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v24 error:a7];
      if (v25)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v70[5], "count"));
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id obj = (id)v70[5];
        uint64_t v27 = [obj countByEnumeratingWithState:&v52 objects:v76 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v53;
          double v29 = (double)v51;
          double v30 = (double)v17;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v53 != v28) {
                objc_enumerationMutation(obj);
              }
              v32 = [[VNFaceLegacyFaceCore alloc] initWithFace:*(void *)(*((void *)&v52 + 1) + 8 * i)];
              [(VNFaceLegacyFaceCore *)v32 faceBoundingBox];
              double v37 = 0.0;
              double v38 = 0.0;
              double v39 = 0.0;
              if (v51)
              {
                double v38 = v33 / v29;
                double v39 = v35 / v29;
              }
              double v40 = 0.0;
              if (v17)
              {
                double v37 = v34 / v30;
                double v40 = v36 / v30;
              }
              v41 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:]([VNFaceObservation alloc], "initWithOriginatingRequestSpecifier:boundingBox:", v25, v38, v37, v39, v40);
              -[VNFaceObservation setUnalignedBoundingBox:](v41, "setUnalignedBoundingBox:", v38, v37, v39, v40);
              [(VNFaceObservation *)v41 setLegacyFaceCore:v32];
              [v26 addObject:v41];
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v52 objects:v76 count:16];
          }
          while (v27);
        }

        id v42 = &__block_literal_global_125;
        [v26 sortWithOptions:16 usingComparator:&__block_literal_global_125];
      }
      else
      {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }

    _Block_object_dispose(&v69, 8);
    goto LABEL_27;
  }
  if (a7)
  {
    id v44 = 0;
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create detector"];
    v26 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
    uint64_t v22 = v44;
    goto LABEL_28;
  }
  v26 = 0;
LABEL_28:

  uint64_t v16 = v48;
LABEL_29:

  return v26;
}

uint64_t __152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  v19[4] = *(__CVBuffer **)MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) originalCGImage];
  if (v4)
  {
    id v5 = (CGImage *)v4;
    v21.origin.double x = 0.0;
    v21.origin.double y = 0.0;
    v21.size.double width = 1.0;
    v21.size.double height = 1.0;
    if (CGRectEqualToRect(*(CGRect *)(a1 + 80), v21))
    {
      CGImageRef v6 = 0;
    }
    else
    {
      unint64_t v8 = *(void *)(a1 + 120);
      double v9 = (double)*(unint64_t *)(a1 + 112);
      v20.origin.double x = *(double *)(a1 + 80) * v9;
      v20.size.double width = *(double *)(a1 + 96) * v9;
      v20.origin.double y = *(double *)(a1 + 88) * (double)v8;
      v20.size.double height = *(double *)(a1 + 104) * (double)v8;
      CGImageRef v6 = CGImageCreateWithImageInRect(v5, v20);
      id v5 = v6;
    }
    v18[0] = &unk_1EF753300;
    v18[1] = v6;
    v18[3] = v18;
    v19[3] = (__CVBuffer *)v19;
    _ZNKSt3__110__function6__funcIZZZ152__VNFaceDetectorPrivateRevisionLegacyFaceCore_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler__EUb_ENK3__0clEP7CGImageEUlvE_NS_9allocatorIS5_EEFvvEE7__cloneEPNS0_6__baseIS8_EE((uint64_t)v18, v19);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v18);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F45DF0]) initWithCGImage:v5];
    apple::vision::ScopeExit::~ScopeExit((apple::vision::ScopeExit *)v19);
    if (v7) {
      goto LABEL_8;
    }
LABEL_14:
    if (a2)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Failed to create internal image"];
      uint64_t v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  v19[0] = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", *(double *)(a1 + 80) * (double)*(unint64_t *)(a1 + 112), *(double *)(a1 + 88) * (double)*(unint64_t *)(a1 + 120), *(double *)(a1 + 96) * (double)*(unint64_t *)(a1 + 112), *(double *)(a1 + 104) * (double)*(unint64_t *)(a1 + 120));
  if (v19[0]) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F45DF0]) initWithCVPixelBuffer:v19[0]];
  }
  else {
    id v7 = 0;
  }
  apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(v19);
  if (!v7) {
    goto LABEL_14;
  }
LABEL_8:
  uint64_t v10 = [*(id *)(a1 + 48) detectFacesInImage:v7 options:*(void *)(a1 + 56) error:a2];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 64) count])
  {
    uint64_t v13 = [*(id *)(a1 + 48) extractDetailsForFaces:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inImage:v7 options:*(void *)(a1 + 64) error:a2];
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      goto LABEL_16;
    }
  }
  uint64_t v16 = 1;
LABEL_17:

  return v16;
}

@end