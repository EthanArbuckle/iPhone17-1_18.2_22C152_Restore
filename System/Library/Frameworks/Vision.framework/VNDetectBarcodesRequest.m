@interface VNDetectBarcodesRequest
+ (Class)configurationClass;
+ (NSArray)availableLocateModes;
+ (NSArray)supportedSymbologies;
+ (__CFString)MRCSymbologyForBarcodeSymbology:(id)a3;
+ (const)revisionAvailability;
+ (id)ACBSBarcodeTypeForBarcodeSymbology:(id)a3;
+ (id)_allBarcodeSymbologiesRev1;
+ (id)_allBarcodeSymbologiesRev2;
+ (id)_allBarcodeSymbologiesRev2Private;
+ (id)_allBarcodeSymbologiesRev3;
+ (id)_allBarcodeSymbologiesRev3Private;
+ (id)_allBarcodeSymbologiesRev4;
+ (id)_allBarcodeSymbologiesRev4Private;
+ (id)_ourACBSBarcodeTypeToBarcodeSymbologyMap;
+ (id)_ourBarcodeSymbologyToACBSBarcodeTypeMap;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMap;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMapPrivate;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3Private;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4;
+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4Private;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMap;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMapPrivate;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3Private;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4;
+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4Private;
+ (id)availableLocateModesRev1;
+ (id)availableLocateModesRev2;
+ (id)barcodeSymbologyForACBSBarcodeType:(id)a3;
+ (id)barcodeSymbologyForMRCSymbology:(__CFString *)a3;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
+ (id)supportedSymbologiesRev1;
+ (id)supportedSymbologiesRev2;
+ (id)supportedSymbologiesRev2Private;
+ (id)supportedSymbologiesRev3;
+ (id)supportedSymbologiesRev3Private;
+ (id)supportedSymbologiesRev4;
+ (id)supportedSymbologiesRev4Private;
- (ACBSConfig)_createACBSConfigAndReturnError:(id *)a3;
- (BOOL)_getCornerPointsFromCodeLocationPoints:(id)a3 bottomLeft:(CGPoint *)a4 topLeft:(CGPoint *)a5 topRight:(CGPoint *)a6 bottomRight:(CGPoint *)a7;
- (BOOL)coalesceCompositeSymbologies;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)stopAtFirstPyramidWith2DCode;
- (BOOL)useMLDetector;
- (BOOL)useSegmentationPregating;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (NSArray)supportedSymbologiesAndReturnError:(NSError *)error;
- (NSArray)symbologies;
- (NSString)locateMode;
- (id)_barcodesDetectedInImageBuffer:(id)a3 usingACBSConfig:(ACBSConfig *)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6;
- (id)_createMRCDecoderOptionsForRevision:(unint64_t)a3 error:(id *)a4;
- (id)_machineReadableCodesDetectedInImageBuffer:(id)a3 originatingRequestSpecifier:(id)a4 inContext:(id)a5 mrcDetector:(id)a6 error:(id *)a7;
- (id)_newVNBarcodeSymbologyAztecDescriptorForACBSBarcodeInfo:(id)a3;
- (id)_newVNBarcodeSymbologyAztecDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4;
- (id)_newVNBarcodeSymbologyPDF417DescriptorForACBSBarcodeInfo:(id)a3;
- (id)_newVNBarcodeSymbologyPDF417DescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4;
- (id)_newVNBarcodeSymbologyQRDescriptorForACBSBarcodeInfo:(id)a3;
- (id)_newVNBarcodeSymbologyQRDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)availableLocateModesAndReturnError:(id *)a3;
- (id)newBarcodeObservationForACBSBarcodeInfo:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 roiCroppingPixelRect:(CGRect)a6 originatingRequestSpecifier:(id)a7 error:(id *)a8;
- (id)newBarcodeObservationForMRCDescriptor:(__MRCDescriptor *)a3 roiCroppingPixelRect:(CGRect)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6;
- (id)supportedComputeStageDevicesAndReturnError:(id *)a3;
- (int)_ACBarcodeRecognizerLocateMode;
- (int64_t)_MRCLocateMode;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3;
- (void)setCoalesceCompositeSymbologies:(BOOL)coalesceCompositeSymbologies;
- (void)setLocateMode:(id)a3;
- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3;
- (void)setSymbologies:(NSArray *)symbologies;
- (void)setUseMLDetector:(BOOL)a3;
- (void)setUseSegmentationPregating:(BOOL)a3;
@end

@implementation VNDetectBarcodesRequest

- (void)setUseSegmentationPregating:(BOOL)a3
{
  self->_useSegmentationPregating = a3;
}

- (BOOL)useSegmentationPregating
{
  return self->_useSegmentationPregating;
}

- (void)resolvedRevisionDidChangeFromRevision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNDetectBarcodesRequest;
  [(VNRequest *)&v5 resolvedRevisionDidChangeFromRevision:a3];
  v4 = [(VNRequest *)self configuration];
  objc_msgSend(v4, "setDefaultSymbologiesForRevision:", -[VNRequest resolvedRevision](self, "resolvedRevision"));
}

- (void)applyConfigurationOfRequest:(id)a3
{
  v4 = (VNDetectBarcodesRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNDetectBarcodesRequest;
    [(VNImageBasedRequest *)&v7 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = [(VNDetectBarcodesRequest *)v4 symbologies];
      [(VNDetectBarcodesRequest *)self setSymbologies:v5];

      v6 = [(VNDetectBarcodesRequest *)v4 locateMode];
      [(VNDetectBarcodesRequest *)self setLocateMode:v6];

      [(VNDetectBarcodesRequest *)self setStopAtFirstPyramidWith2DCode:[(VNDetectBarcodesRequest *)v4 stopAtFirstPyramidWith2DCode]];
      [(VNDetectBarcodesRequest *)self setUseMLDetector:[(VNDetectBarcodesRequest *)v4 useMLDetector]];
    }
  }
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNDetectBarcodesRequest;
  if ([(VNRequest *)&v16 warmUpSession:v6 error:a4])
  {
    unint64_t v7 = [(VNRequest *)self resolvedRevision];
    v8 = [(VNDetectBarcodesRequest *)self applicableDetectorTypeForRevision:v7 error:a4];
    v9 = v8;
    if (v8)
    {
      if ([v8 isEqualToString:&stru_1EF75C0C0])
      {
LABEL_6:
        BOOL v14 = 1;
LABEL_10:

        goto LABEL_11;
      }
      id v10 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:v7 session:v6];
      v11 = [v6 detectorOfType:v9 configuredWithOptions:v10 error:a4];
      v12 = v11;
      if (v11)
      {
        char v13 = [v11 warmUpSession:v6 withOptions:v10 error:a4];

        if (v13) {
          goto LABEL_6;
        }
      }
      else
      {
      }
    }
    BOOL v14 = 0;
    goto LABEL_10;
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(VNDetectBarcodesRequest *)self locateMode];
  id v6 = [v4 locateMode];

  if (v5 != v6) {
    goto LABEL_7;
  }
  int v7 = [(VNDetectBarcodesRequest *)self stopAtFirstPyramidWith2DCode];
  if (v7 != [v4 stopAtFirstPyramidWith2DCode]) {
    goto LABEL_7;
  }
  int v8 = [(VNDetectBarcodesRequest *)self useMLDetector];
  if (v8 != [v4 useMLDetector]) {
    goto LABEL_7;
  }
  int v9 = [(VNDetectBarcodesRequest *)self coalesceCompositeSymbologies];
  if (v9 != [v4 coalesceCompositeSymbologies]) {
    goto LABEL_7;
  }
  id v10 = [(VNDetectBarcodesRequest *)self symbologies];
  v11 = [v4 symbologies];
  char v12 = VisionCoreEquivalentOrNilUnorderedArrays();

  if (v12)
  {
    v15.receiver = self;
    v15.super_class = (Class)VNDetectBarcodesRequest;
    BOOL v13 = [(VNImageBasedRequest *)&v15 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_7:
    BOOL v13 = 0;
  }

  return v13;
}

- (id)supportedComputeStageDevicesAndReturnError:(id *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VNRequest *)self resolvedRevision];
  if (v5 > 3737841663)
  {
    if ((unint64_t)(v5 - 3737841665) < 2)
    {
LABEL_6:
      id v6 = [(VNDetectBarcodesRequest *)self _createMRCDecoderOptionsForRevision:v5 error:a3];
      if (v6)
      {
        uint64_t v7 = MRCContextCopySupportedComputeDevicesForDecoderUsingOptions();
        int v8 = (void *)v7;
        if (v7)
        {
          objc_super v15 = @"VNComputeStageMain";
          uint64_t v16 = v7;
          int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];

LABEL_17:
          goto LABEL_18;
        }
        if (a3)
        {
          id v11 = [NSString alloc];
          char v12 = (__CFString *)CFErrorCopyDescription(0);
          BOOL v13 = (void *)[v11 initWithFormat:@"No compute devices found: %@", v12];

          *a3 = +[VNError errorForDataUnavailableWithLocalizedDescription:v13];
        }
        CFRelease(0);
      }
      int v9 = 0;
      goto LABEL_17;
    }
    if (v5 != 3737841664) {
      goto LABEL_11;
    }
LABEL_10:
    v17 = @"VNComputeStageMain";
    id v10 = +[VNComputeDeviceUtilities allCPUComputeDevices];
    v18[0] = v10;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];

    goto LABEL_18;
  }
  if ((unint64_t)(v5 - 1) < 2) {
    goto LABEL_10;
  }
  if ((unint64_t)(v5 - 3) < 2) {
    goto LABEL_6;
  }
LABEL_11:
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:v5 ofRequest:self];
    int v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v9 = 0;
  }
LABEL_18:

  return v9;
}

- (void)setCoalesceCompositeSymbologies:(BOOL)coalesceCompositeSymbologies
{
  BOOL v3 = coalesceCompositeSymbologies;
  id v4 = [(VNRequest *)self configuration];
  [v4 setCoalesceCompositeSymbologies:v3];
}

- (BOOL)coalesceCompositeSymbologies
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 coalesceCompositeSymbologies];

  return v3;
}

- (void)setUseMLDetector:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setUseMLDetector:v3];
}

- (BOOL)useMLDetector
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 useMLDetector];

  return v3;
}

- (void)setStopAtFirstPyramidWith2DCode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setStopAtFirstPyramidWith2DCode:v3];
}

- (BOOL)stopAtFirstPyramidWith2DCode
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 stopAtFirstPyramidWith2DCode];

  return v3;
}

- (void)setLocateMode:(id)a3
{
  id v5 = a3;
  id v4 = [(VNRequest *)self configuration];
  [v4 setLocateMode:v5];
}

- (NSString)locateMode
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 locateMode];

  return (NSString *)v3;
}

- (void)setSymbologies:(NSArray *)symbologies
{
  id v5 = symbologies;
  if ([(NSArray *)v5 count])
  {
    id v4 = [(VNRequest *)self configuration];
    [v4 setSymbologies:v5];
  }
}

- (NSArray)supportedSymbologiesAndReturnError:(NSError *)error
{
  uint64_t v5 = [(VNRequest *)self revision];
  if (v5 > 3737841663)
  {
    switch(v5)
    {
      case 3737841664:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev2Private];
        break;
      case 3737841665:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev3Private];
        break;
      case 3737841666:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev4Private];
        break;
      default:
LABEL_13:
        if (error)
        {
          uint64_t v7 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
          id v6 = 0;
          *error = v7;
        }
        else
        {
          id v6 = 0;
        }
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev1];
        break;
      case 2:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev2];
        break;
      case 3:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev3];
        break;
      case 4:
        id v6 = +[VNDetectBarcodesRequest supportedSymbologiesRev4];
        break;
      default:
        goto LABEL_13;
    }
  }

  return (NSArray *)v6;
}

- (NSArray)symbologies
{
  v2 = [(VNRequest *)self configuration];
  char v3 = [v2 symbologies];

  return (NSArray *)v3;
}

- (id)availableLocateModesAndReturnError:(id *)a3
{
  NSUInteger v5 = [(VNRequest *)self revision];
  if (v5 - 2 >= 3 && v5 - 3737841664u >= 3)
  {
    if (v5 == 1)
    {
      uint64_t v7 = +[VNDetectBarcodesRequest availableLocateModesRev1];
    }
    else if (a3)
    {
      id v9 = +[VNError errorForUnsupportedRevision:[(VNRequest *)self revision] ofRequest:self];
      uint64_t v7 = 0;
      *a3 = v9;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = +[VNDetectBarcodesRequest availableLocateModesRev2];
  }

  return v7;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 imageBufferAndReturnError:a5];
  if (v9
    && [(VNRequest *)self validateImageBuffer:v9 ofNonZeroWidth:0 andHeight:0 error:a5])
  {
    id v10 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:a3 error:a5];
    if (!v10)
    {
      BOOL v17 = 0;
LABEL_19:

      goto LABEL_20;
    }
    if (a3 - 2 >= 3 && a3 - 3737841664u >= 3)
    {
      if (a3 == 1)
      {
        v19 = [(VNDetectBarcodesRequest *)self _createACBSConfigAndReturnError:a5];
        if (v19)
        {
          BOOL v14 = [(VNDetectBarcodesRequest *)self _barcodesDetectedInImageBuffer:v9 usingACBSConfig:v19 originatingRequestSpecifier:v10 error:a5];
          ACBSConfigFree();
          if (v14)
          {
LABEL_11:
            id v15 = &__block_literal_global_125;
            uint64_t v16 = [v14 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_125];

            BOOL v14 = (void *)v16;
LABEL_12:
            [(VNRequest *)self setResults:v14];
            BOOL v17 = 1;
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:
          BOOL v17 = 0;
          goto LABEL_18;
        }
      }
      else if (a5)
      {
        +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
        BOOL v14 = 0;
        BOOL v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      id v11 = [v8 session];
      id v12 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:a3 session:v11];
      BOOL v13 = [v11 detectorOfType:@"VNMRCDetectorType" configuredWithOptions:v12 error:a5];

      if (v13)
      {
        BOOL v14 = [(VNDetectBarcodesRequest *)self _machineReadableCodesDetectedInImageBuffer:v9 originatingRequestSpecifier:v10 inContext:v8 mrcDetector:v13 error:a5];

        if (v14)
        {
          if (a3 - 3737841664u >= 3 && a3 - 2 > 2
            || +[VisionCoreRuntimeUtilities linkTimeOrRunTimeAtLeastVersion:393216])
          {
            goto LABEL_12;
          }
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
    BOOL v14 = 0;
    goto LABEL_17;
  }
  BOOL v17 = 0;
LABEL_20:

  return v17;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 - 2 < 3 || a3 - 3737841664u < 3)
  {
    id v4 = @"VNMRCDetectorType";
LABEL_4:
    NSUInteger v5 = v4;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v4 = &stru_1EF75C0C0;
    goto LABEL_4;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
LABEL_5:

  return v4;
}

- (id)_barcodesDetectedInImageBuffer:(id)a3 usingACBSConfig:(ACBSConfig *)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v39 = a5;
  uint64_t v10 = [v9 width];
  uint64_t v11 = [v9 height];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __108__VNDetectBarcodesRequest__barcodesDetectedInImageBuffer_usingACBSConfig_originatingRequestSpecifier_error___block_invoke;
  v45[3] = &unk_1E5B20040;
  v45[4] = self;
  if (!+[VNValidationUtilities validateNonZeroImageWidth:v10 height:v11 componentNameProvidingBlock:v45 error:a6])
  {
    v20 = 0;
    goto LABEL_29;
  }
  [(VNImageBasedRequest *)self regionOfInterestPixelRectForWidth:v10 height:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v44 = 0;
  v20 = (__CVBuffer *)objc_msgSend(v9, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)v16, (unint64_t)v18, 875704422, 0, a6, &v44);
  id v36 = v44;
  if (v20)
  {
    v37 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [v37 addPointer:v36];
    v38 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [v38 addPointer:v9];
    [v9 orientation];
    v35 = (void *)ACBSCreateFrameInfoBySearchingForBarcodesInCVPixelBuffer();
    if (v35)
    {
      int v21 = 1;
    }
    else if (a6)
    {
      +[VNError errorWithCode:9 message:@"failed to analyze image"];
      v35 = 0;
      int v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
      int v21 = 0;
    }
    CVPixelBufferRelease(v20);
    if (!v21)
    {
      v20 = 0;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v22 = *MEMORY[0x1E4F94480];
    v23 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F94480]];
    uint64_t v24 = [v23 integerValue];

    if (v24)
    {
      v25 = [v35 objectForKeyedSubscript:v22];
      [(VNRequest *)self recordWarning:v22 value:v25];
    }
    else
    {
      v25 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F94488]];
      uint64_t v26 = [v25 count];
      if (v26)
      {
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v26];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v25;
        uint64_t v28 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v41;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v41 != v29) {
                objc_enumerationMutation(obj);
              }
              id v31 = -[VNDetectBarcodesRequest newBarcodeObservationForACBSBarcodeInfo:imageWidth:imageHeight:roiCroppingPixelRect:originatingRequestSpecifier:error:](self, "newBarcodeObservationForACBSBarcodeInfo:imageWidth:imageHeight:roiCroppingPixelRect:originatingRequestSpecifier:error:", *(void *)(*((void *)&v40 + 1) + 8 * i), v10, v11, v39, a6, v13, v15, v17, v19);
              v32 = v31;
              if (!v31)
              {

                v20 = 0;
                goto LABEL_25;
              }
              [v31 setRequestImageBuffers:v38];
              [v32 setRequestImageBuffersCacheKeys:v37];
              [v27 addObject:v32];
            }
            uint64_t v28 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        v20 = v27;
LABEL_25:

        v25 = obj;
        goto LABEL_26;
      }
    }
    v20 = (__CVBuffer *)MEMORY[0x1E4F1CBF0];
LABEL_26:

    goto LABEL_27;
  }
LABEL_28:

LABEL_29:

  return v20;
}

NSString *__108__VNDetectBarcodesRequest__barcodesDetectedInImageBuffer_usingACBSConfig_originatingRequestSpecifier_error___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (id)newBarcodeObservationForACBSBarcodeInfo:(id)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5 roiCroppingPixelRect:(CGRect)a6 originatingRequestSpecifier:(id)a7 error:(id *)a8
{
  double height = a6.size.height;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v16 = a3;
  id v17 = a7;
  double v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F944A8]];
  if (v18)
  {
    double v19 = +[VNDetectBarcodesRequest barcodeSymbologyForACBSBarcodeType:v18];
    if (!v19)
    {
      if (a8)
      {
        id v31 = (void *)[[NSString alloc] initWithFormat:@"unknown barcode type of '%@'", v18];
        *a8 = +[VNError errorForInternalErrorWithLocalizedDescription:v31];
      }
      uint64_t v24 = 0;
      goto LABEL_27;
    }
    v20 = (NSString *)[[NSString alloc] initWithFormat:@"_new%@DescriptorForACBSBarcodeInfo:", v19];
    SEL v21 = NSSelectorFromString(v20);
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v22 = (void *)((uint64_t (*)(VNDetectBarcodesRequest *, SEL, id))[(VNDetectBarcodesRequest *)self methodForSelector:v21])(self, v21, v16);
      if (v22)
      {
LABEL_11:

        long long v35 = *MEMORY[0x1E4F1DAD8];
        long long v36 = v35;
        long long v33 = v35;
        long long v34 = v35;
        v25 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F94490]];
        BOOL v26 = [(VNDetectBarcodesRequest *)self _getCornerPointsFromCodeLocationPoints:v25 bottomLeft:&v36 topLeft:&v35 topRight:&v34 bottomRight:&v33];

        if (v26)
        {
          *(double *)&long long v36 = (x + *(double *)&v36) / (double)a4;
          *((double *)&v36 + 1) = (y + height - *((double *)&v36 + 1)) / (double)a5;
          *(double *)&long long v35 = (x + *(double *)&v35) / (double)a4;
          *((double *)&v35 + 1) = (y + height - *((double *)&v35 + 1)) / (double)a5;
          *(double *)&long long v34 = (x + *(double *)&v34) / (double)a4;
          *((double *)&v34 + 1) = (y + height - *((double *)&v34 + 1)) / (double)a5;
          *(double *)&long long v33 = (x + *(double *)&v33) / (double)a4;
          *((double *)&v33 + 1) = (y + height - *((double *)&v33 + 1)) / (double)a5;
          v27 = [VNBarcodeObservation alloc];
          uint64_t v24 = [(VNBarcodeObservation *)v27 initWithOriginatingRequestSpecifier:v17 symbology:v19 descriptor:v22 topLeft:v36 topRight:v33 bottomRight:v34 bottomLeft:v35];
          if (v24)
          {
            uint64_t v28 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F944B0]];
            uint64_t v29 = v28;
            if (v28)
            {
              [v28 floatValue];
              -[VNObservation setConfidence:](v24, "setConfidence:");
            }
            [(VNBarcodeObservation *)v24 setACBSBarcodeInfo:v16];
            v30 = v24;
          }
          else if (a8)
          {
            *a8 = +[VNError errorForMemoryAllocationFailure];
          }
        }
        else if (a8)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:@"barcode location is not available"];
          uint64_t v24 = 0;
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v24 = 0;
        }

LABEL_27:
        goto LABEL_28;
      }
      v23 = (void *)[[NSString alloc] initWithFormat:@"unable to create a barcode descriptor for %@", v19];
      [(VNRequest *)self recordWarning:@"VNDetectBarcodesRequest" value:v23];
    }
    else
    {
      v23 = (void *)[[NSString alloc] initWithFormat:@"creation of a barcode descriptor for %@ is not supported", v19];
      [(VNRequest *)self recordWarning:@"VNDetectBarcodesRequest" value:v23];
    }

    uint64_t v22 = 0;
    goto LABEL_11;
  }
  if (a8)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"barcode type is not available"];
    uint64_t v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = 0;
  }
LABEL_28:

  return v24;
}

- (BOOL)_getCornerPointsFromCodeLocationPoints:(id)a3 bottomLeft:(CGPoint *)a4 topLeft:(CGPoint *)a5 topRight:(CGPoint *)a6 bottomRight:(CGPoint *)a7
{
  id v11 = a3;
  double v12 = v11;
  if (v11 && [v11 count] == 4)
  {
    CFDictionaryRef v13 = [v12 objectAtIndexedSubscript:0];
    if (CGPointMakeWithDictionaryRepresentation(v13, a4))
    {
      CFDictionaryRef v14 = [v12 objectAtIndexedSubscript:1];
      if (CGPointMakeWithDictionaryRepresentation(v14, a5))
      {
        CFDictionaryRef v15 = [v12 objectAtIndexedSubscript:2];
        if (CGPointMakeWithDictionaryRepresentation(v15, a6))
        {
          CFDictionaryRef v16 = [v12 objectAtIndexedSubscript:3];
          BOOL v17 = CGPointMakeWithDictionaryRepresentation(v16, a7);
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)_machineReadableCodesDetectedInImageBuffer:(id)a3 originatingRequestSpecifier:(id)a4 inContext:(id)a5 mrcDetector:(id)a6 error:(id *)a7
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v78 = a4;
  id v77 = a5;
  id v76 = a6;
  CFDictionaryRef v13 = [(VNDetectBarcodesRequest *)self _createMRCDecoderOptionsForRevision:[(VNRequest *)self revision] error:a7];
  if (!v13
    || (uint64_t v14 = [v12 width],
        uint64_t v15 = [v12 height],
        v84[0] = MEMORY[0x1E4F143A8],
        v84[1] = 3221225472,
        v84[2] = __126__VNDetectBarcodesRequest__machineReadableCodesDetectedInImageBuffer_originatingRequestSpecifier_inContext_mrcDetector_error___block_invoke,
        v84[3] = &unk_1E5B20040,
        v84[4] = self,
        !+[VNValidationUtilities validateNonZeroImageWidth:v14 height:v15 componentNameProvidingBlock:v84 error:a7]))
  {
    id v30 = 0;
    goto LABEL_53;
  }
  [(VNImageBasedRequest *)self regionOfInterestPixelRectForWidth:v14 height:v15];
  double v19 = v18;
  double v21 = v20;
  double v22 = v16;
  double v23 = v17;
  if (v16 >= v17) {
    double v24 = v16;
  }
  else {
    double v24 = v17;
  }
  unint64_t v25 = [(VNRequest *)self maximumProcessingDimensionOnTheLongSide];
  double v26 = 1.0;
  if (v25)
  {
    double v27 = (double)v25;
    double height = v23;
    double width = v22;
    double x = v19;
    double y = v21;
    if (v24 > (double)v25)
    {
      double v26 = v27 / v24;
      v89.origin.double x = v19 * (v27 / v24);
      v89.origin.double y = v21 * v26;
      v89.size.double width = v22 * v26;
      v89.size.double height = v23 * v26;
      CGRect v90 = CGRectIntegral(v89);
      double x = v90.origin.x;
      double y = v90.origin.y;
      double width = v90.size.width;
      double height = v90.size.height;
    }
  }
  else
  {
    double height = v23;
    double width = v22;
    double x = v19;
    double y = v21;
  }
  id v83 = 0;
  id v31 = (__CVBuffer *)objc_msgSend(v12, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)width, (unint64_t)height, 875704422, 0, a7, &v83, v19, v21, v22, v23);
  id v74 = v83;
  pixelBuffer = v31;
  if (v31)
  {
    v69 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [v69 addPointer:v74];
    v68 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    [v68 addPointer:v12];
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CVPixelBufferGetWidth(v31);
    CVPixelBufferGetHeight(v31);
    CFTypeRef cf = (CFTypeRef)MRCSampleCreateWithCVPixelBuffer();
    if (!cf)
    {
      if (a7)
      {
        +[VNError errorForDataUnavailableWithLocalizedDescription:@"Failed to create MRCSample"];
        id v30 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:

        CVPixelBufferRelease(pixelBuffer);
        goto LABEL_52;
      }
LABEL_49:
      id v30 = 0;
      goto LABEL_51;
    }
    v65 = [v77 session];
    unint64_t v32 = 0x1E4F1C000;
    if ([(VNDetectBarcodesRequest *)self useSegmentationPregating]
      && ![(VNDetectBarcodesRequest *)self useMLDetector])
    {
      long long v33 = [VNImageRequestHandler alloc];
      v75 = [(VNImageRequestHandler *)v33 initWithCVPixelBuffer:pixelBuffer options:MEMORY[0x1E4F1CC08] session:v65];
      v64 = objc_alloc_init(VNRecognizeDocumentElementsRequest);
      [(VNImageBasedRequest *)v64 applyConfigurationOfRequest:self];
      [(VNRequest *)v64 setRevision:1];
      long long v34 = [(VNRecognizeDocumentElementsRequest *)v64 machineReadableCodeElements];
      [v34 setRecognize:1];

      long long v35 = [(VNRecognizeDocumentElementsRequest *)v64 machineReadableCodeElements];
      [v35 setGenerateSegmentationMask:1];

      v87[0] = v64;
      long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
      BOOL v37 = [(VNImageRequestHandler *)v75 performRequests:v36 error:0];

      if (v37)
      {
        v38 = [(VNRequest *)v64 results];
        v62 = [v38 firstObject];

        id v39 = [v62 segmentationMask];
        texture = CVPixelBufferRetain((CVPixelBufferRef)[v39 pixelBuffer]);

        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v40 = [v62 labels];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v79 objects:v86 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v80;
          id obj = v40;
          while (2)
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v80 != v42) {
                objc_enumerationMutation(obj);
              }
              id v44 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v45 = [v44 identifier];
              if ([v45 isEqualToString:@"VNRecognizeDocumentElementIdentifierAppCode"])
              {

LABEL_32:
                goto LABEL_33;
              }
              v46 = [v44 identifier];
              char v47 = [v46 isEqualToString:@"VNRecognizeDocumentElementIdentifierQRCode"];

              if (v47) {
                goto LABEL_32;
              }
            }
            long long v40 = obj;
            uint64_t v41 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
            if (v41) {
              continue;
            }
            break;
          }
        }

        v48 = v64;
        goto LABEL_46;
      }
      texture = 0;
LABEL_33:

      unint64_t v32 = 0x1E4F1C000uLL;
    }
    else
    {
      texture = 0;
    }
    v75 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:[(VNRequest *)self resolvedRevision] session:v65];
    id v85 = v12;
    v49 = [*(id *)(v32 + 2424) arrayWithObjects:&v85 count:1];
    [(VNImageRequestHandler *)v75 setObject:v49 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    [(VNImageRequestHandler *)v75 setObject:v13 forKeyedSubscript:@"VNMRCDetectorProcessOption_MRCDecoderOptions"];
    [(VNImageRequestHandler *)v75 setObject:cf forKeyedSubscript:@"VNMRCDetectorProcessOption_MRCSample"];
    v50 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectBarcodesRequest useMLDetector](self, "useMLDetector"));
    [(VNImageRequestHandler *)v75 setObject:v50 forKeyedSubscript:@"VNMRCDetectorProcessOption_UseMLBasedDetector"];

    if (texture) {
      [(VNImageRequestHandler *)v75 setObject:texture forKeyedSubscript:@"VNMRCDetectorProcessOption_SegmentationMask"];
    }
    if (v26 != 1.0)
    {
      v51 = [NSNumber numberWithDouble:v26];
      [(VNImageRequestHandler *)v75 setObject:v51 forKeyedSubscript:@"VNMRCDetectorProcessOption_MaxDimensionSideScale"];
    }
    uint64_t v52 = [v77 qosClass];
    [(VNImageBasedRequest *)self regionOfInterest];
    objc_msgSend(v76, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v52, v75, self, a7, 0);
    v53 = (VNRecognizeDocumentElementsRequest *)objc_claimAutoreleasedReturnValue();
    v48 = v53;
    if (v53 && [(VNRecognizeDocumentElementsRequest *)v53 count])
    {
      v54 = [(VNRecognizeDocumentElementsRequest *)v48 objectAtIndexedSubscript:0];

      if (v54)
      {
        uint64_t DescriptorCount = MRCDecoderResultGetDescriptorCount();
        if (DescriptorCount < 1)
        {
LABEL_45:
          int v60 = 0;
          BOOL v59 = 1;
        }
        else
        {
          uint64_t v56 = 0;
          while (1)
          {
            id v57 = -[VNDetectBarcodesRequest newBarcodeObservationForMRCDescriptor:roiCroppingPixelRect:originatingRequestSpecifier:error:](self, "newBarcodeObservationForMRCDescriptor:roiCroppingPixelRect:originatingRequestSpecifier:error:", MRCDecoderResultGetDescriptorAtIndex(), v78, a7, x, y, width, height);
            v58 = v57;
            BOOL v59 = v57 != 0;
            if (!v57) {
              break;
            }
            [v57 setRequestImageBuffers:v68];
            [v58 setRequestImageBuffersCacheKeys:v69];
            [v70 addObject:v58];

            if (DescriptorCount == ++v56) {
              goto LABEL_45;
            }
          }
          int v60 = 1;
        }
        CFRelease(v54);
        if (!v59)
        {
LABEL_48:

          CVPixelBufferRelease(texture);
          CFRelease(cf);
          if (!v60)
          {
            id v30 = v70;
            goto LABEL_51;
          }
          goto LABEL_49;
        }
      }
LABEL_47:
      int v60 = 0;
      goto LABEL_48;
    }
LABEL_46:

    goto LABEL_47;
  }
  id v30 = 0;
LABEL_52:

LABEL_53:

  return v30;
}

NSString *__126__VNDetectBarcodesRequest__machineReadableCodesDetectedInImageBuffer_originatingRequestSpecifier_inContext_mrcDetector_error___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (id)newBarcodeObservationForMRCDescriptor:(__MRCDescriptor *)a3 roiCroppingPixelRect:(CGRect)a4 originatingRequestSpecifier:(id)a5 error:(id *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v11 = a5;
  id v12 = (const void *)MRCDescriptorCopyAttribute();
  if (v12)
  {
    CFDictionaryRef v13 = +[VNDetectBarcodesRequest barcodeSymbologyForMRCSymbology:v12];
    CFRelease(v12);
    if (!v13)
    {
      if (a6)
      {
        unint64_t v25 = (void *)[[NSString alloc] initWithFormat:@"unknown barcode type of '%@'", v12];
        *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:v25];
      }
      double v17 = 0;
      goto LABEL_31;
    }
    uint64_t v14 = (NSString *)[[NSString alloc] initWithFormat:@"_new%@DescriptorForMRCDescriptor:error:", v13];
    SEL v15 = NSSelectorFromString(v14);
    if (v15 && (objc_opt_respondsToSelector() & 1) != 0) {
      double v16 = (void *)((uint64_t (*)(VNDetectBarcodesRequest *, SEL, __MRCDescriptor *, id *))[(VNDetectBarcodesRequest *)self methodForSelector:v15])(self, v15, a3, a6);
    }
    else {
      double v16 = 0;
    }

    CGPoint v35 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    CGPoint point = v35;
    CGPoint v33 = v35;
    CGPoint v34 = v35;
    CFArrayRef v18 = (const __CFArray *)MRCDescriptorCopyAttribute();
    CFArrayRef v19 = v18;
    if (v18)
    {
      if (CFArrayGetCount(v18) == 4)
      {
        ValueAtIndedouble x = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 0);
        CGPointMakeWithDictionaryRepresentation(ValueAtIndex, &point);
        CFDictionaryRef v21 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 1);
        CGPointMakeWithDictionaryRepresentation(v21, &v35);
        CFDictionaryRef v22 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 2);
        CGPointMakeWithDictionaryRepresentation(v22, &v34);
        CFDictionaryRef v23 = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, 3);
        CGPointMakeWithDictionaryRepresentation(v23, &v33);
        int v24 = 1;
      }
      else if (a6)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"invalid barcode location information"];
        int v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        int v24 = 0;
      }
      CFRelease(v19);
      if (v24)
      {
        point.double x = point.x / width;
        point.double y = (height - point.y) / height;
        v35.double x = v35.x / width;
        v35.double y = (height - v35.y) / height;
        v34.double x = v34.x / width;
        v34.double y = (height - v34.y) / height;
        v33.double x = v33.x / width;
        v33.double y = (height - v33.y) / height;
        double v26 = [VNBarcodeObservation alloc];
        double v17 = -[VNBarcodeObservation initWithOriginatingRequestSpecifier:symbology:descriptor:mrcDescriptor:topLeft:topRight:bottomRight:bottomLeft:](v26, "initWithOriginatingRequestSpecifier:symbology:descriptor:mrcDescriptor:topLeft:topRight:bottomRight:bottomLeft:", v11, v13, v16, a3, point.x, point.y, v33.x, v33.y, v34.x, v34.y, v35.x, v35.y);
        if (v17)
        {
          CFNumberRef v27 = (const __CFNumber *)MRCDescriptorCopyAttribute();
          CFNumberRef v28 = v27;
          if (v27)
          {
            int valuePtr = 0;
            CFNumberGetValue(v27, kCFNumberFloatType, &valuePtr);
            LODWORD(v29) = valuePtr;
            [(VNObservation *)v17 setConfidence:v29];
            CFRelease(v28);
          }
          id v30 = v17;
        }
        else if (a6)
        {
          *a6 = +[VNError errorForMemoryAllocationFailure];
        }

        goto LABEL_30;
      }
    }
    else if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"barcode location is not available"];
      double v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    double v17 = 0;
    goto LABEL_30;
  }
  if (a6)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"barcode type is not available"];
    double v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v17 = 0;
  }
LABEL_32:

  return v17;
}

- (id)_createMRCDecoderOptionsForRevision:(unint64_t)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v7)
  {
    if (a4)
    {
      +[VNError errorForMemoryAllocationFailure];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  id v8 = v7;
  id v9 = objc_msgSend(NSNumber, "numberWithLong:", -[VNDetectBarcodesRequest _MRCLocateMode](self, "_MRCLocateMode"));
  [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F942A8]];

  [v8 setObject:&unk_1EF7A71D8 forKeyedSubscript:*MEMORY[0x1E4F94290]];
  if ([(VNDetectBarcodesRequest *)self coalesceCompositeSymbologies]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F942B0]];
  }
  double v26 = [(VNDetectBarcodesRequest *)self symbologies];
  if (!v26 || ![v26 count])
  {
    if (a4)
    {
      *a4 = +[VNError errorWithCode:5 message:@"barcode detection requires at least one element in the symbologies property"];
    }
    goto LABEL_41;
  }
  int v24 = a4;
  CFIndex v10 = [v26 count];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, MEMORY[0x1E4F1D510]);
  if (!Mutable)
  {
    if (a4)
    {
      *a4 = +[VNError errorForMemoryAllocationFailure];
    }
LABEL_41:

LABEL_42:
    id v8 = 0;
    goto LABEL_43;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v26;
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if ((uint64_t)a3 > 3737841663)
        {
          switch(a3)
          {
            case 0xDECAF000uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            case 0xDECAF001uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            case 0xDECAF002uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            default:
              goto LABEL_36;
          }
        }
        else
        {
          switch(a3)
          {
            case 2uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            case 3uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            case 4uLL:
              double v16 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4];
              double v17 = [v16 objectForKeyedSubscript:v15];
              break;
            default:
              goto LABEL_36;
          }
        }
        CFArrayRef v18 = v17;

        if (!v18)
        {
LABEL_36:
          if (v24)
          {
            CFDictionaryRef v21 = (void *)[[NSString alloc] initWithFormat:@"%@ is not a supported barcode symbology", v15];
            *int v24 = +[VNError errorWithCode:5 message:v21];
          }
          CFRelease(Mutable);

          goto LABEL_41;
        }
        CFArrayAppendValue(Mutable, v18);
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [v8 setObject:Mutable forKeyedSubscript:*MEMORY[0x1E4F942C0]];
  CFArrayRef v19 = objc_msgSend(NSNumber, "numberWithBool:", -[VNDetectBarcodesRequest stopAtFirstPyramidWith2DCode](self, "stopAtFirstPyramidWith2DCode"));
  [v8 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F942B8]];

  uint64_t v20 = 0x20000;
  if ((uint64_t)a3 <= 3737841664)
  {
    if (a3 != 3)
    {
      if (a3 != 4) {
        goto LABEL_50;
      }
      goto LABEL_48;
    }
LABEL_49:
    uint64_t v20 = 196608;
    goto LABEL_50;
  }
  if (a3 == 3737841665) {
    goto LABEL_49;
  }
  if (a3 == 3737841666) {
LABEL_48:
  }
    uint64_t v20 = 0x40000;
LABEL_50:
  CFDictionaryRef v23 = [NSNumber numberWithLong:v20];
  [v8 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F94298]];

LABEL_43:

  return v8;
}

- (int64_t)_MRCLocateMode
{
  char v3 = [(VNDetectBarcodesRequest *)self locateMode];
  if (!v3)
  {
    unint64_t v4 = [(VNRequest *)self detectionLevel];
    if (v4 > 2)
    {
      char v3 = 0;
LABEL_9:
      int64_t v5 = 9;
      goto LABEL_10;
    }
    char v3 = off_1E5B1D460[v4];
  }
  if (-[VNDetectBarcodesRequest _MRCLocateMode]::onceToken != -1) {
    dispatch_once(&-[VNDetectBarcodesRequest _MRCLocateMode]::onceToken, &__block_literal_global_169);
  }
  value = 0;
  if (!NSMapMember((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, v3, 0, &value)) {
    goto LABEL_9;
  }
  int64_t v5 = (int64_t)value;
LABEL_10:

  return v5;
}

void __41__VNDetectBarcodesRequest__MRCLocateMode__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:10];
  v1 = (void *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable;
  -[VNDetectBarcodesRequest _MRCLocateMode]::mapTable = v0;

  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneVertical", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneVerticalThick", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVertical", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVerticalCrossed", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneHorizontal", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneHorizontalThick", (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontal", (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed", (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneEachDirection", (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeEachDirection", (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterFiveEachDirection", (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals", (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals", (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals", (const void *)0xF);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable, @"VNDetectBarcodesLocateModeRegularIntervalHorizontal", (const void *)0x11);
  v2 = (NSMapTable *)-[VNDetectBarcodesRequest _MRCLocateMode]::mapTable;

  NSMapInsertKnownAbsent(v2, @"VNDetectBarcodesLocateModeRegularIntervalVertical", (const void *)0x12);
}

- (ACBSConfig)_createACBSConfigAndReturnError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = ACBSConfigCreate();
  if (!v5)
  {
    if (a3)
    {
      +[VNError errorForMemoryAllocationFailure];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    return 0;
  }
  id v6 = (ACBSConfig *)v5;
  [(VNDetectBarcodesRequest *)self _ACBarcodeRecognizerLocateMode];
  ACBSConfigSetLocateMode();
  ACBSConfigSetMaxQRModuleSamples();
  ACBSConfigSetFailedLocationsEnabled();
  CFArrayRef v19 = [(VNDetectBarcodesRequest *)self symbologies];
  if (!v19 || ![v19 count])
  {
    if (a3)
    {
      *a3 = +[VNError errorWithCode:5 message:@"barcode detection requires at least one element in the symbologies property"];
    }

LABEL_21:
    ACBSConfigFree();
    return 0;
  }
  double v17 = self;
  CFArrayRef v18 = a3;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v19;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * v11);
        uint64_t v13 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap];
        uint64_t v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14)
        {
          if (v18)
          {
            uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"%@ is not a supported barcode symbology", v12];
            *CFArrayRef v18 = +[VNError errorWithCode:5 message:v15];
          }
          goto LABEL_21;
        }
        [v7 addObject:v14];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  ACBSConfigSetSymbologiesEnabled();
  [(VNDetectBarcodesRequest *)v17 stopAtFirstPyramidWith2DCode];
  ACBSConfigSetStopsAtFirstPyramidWith2DCode();

  return v6;
}

- (int)_ACBarcodeRecognizerLocateMode
{
  char v3 = [(VNDetectBarcodesRequest *)self locateMode];
  if (!v3)
  {
    unint64_t v4 = [(VNRequest *)self detectionLevel];
    if (v4 > 2)
    {
      char v3 = 0;
LABEL_9:
      int v5 = 9;
      goto LABEL_10;
    }
    char v3 = off_1E5B1D460[v4];
  }
  if (-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::onceToken != -1) {
    dispatch_once(&-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::onceToken, &__block_literal_global_158_12464);
  }
  value = 0;
  if (!NSMapMember((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, v3, 0, &value)) {
    goto LABEL_9;
  }
  int v5 = (int)value;
LABEL_10:

  return v5;
}

void __57__VNDetectBarcodesRequest__ACBarcodeRecognizerLocateMode__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:1282 capacity:10];
  v1 = (void *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable;
  -[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable = v0;

  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneVertical", (const void *)2);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneVerticalThick", (const void *)3);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVertical", (const void *)4);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVerticalCrossed", (const void *)5);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneHorizontal", (const void *)6);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneHorizontalThick", (const void *)7);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontal", (const void *)8);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed", (const void *)9);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterOneEachDirection", (const void *)0xA);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeEachDirection", (const void *)0xB);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterFiveEachDirection", (const void *)0xC);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals", (const void *)0xD);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals", (const void *)0xE);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals", (const void *)0xF);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeFastSearch", (const void *)0x10);
  NSMapInsertKnownAbsent((NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable, @"VNDetectBarcodesLocateModeRegularIntervalHorizontal", (const void *)0x11);
  v2 = (NSMapTable *)-[VNDetectBarcodesRequest _ACBarcodeRecognizerLocateMode]::mapTable;

  NSMapInsertKnownAbsent(v2, @"VNDetectBarcodesLocateModeRegularIntervalVertical", (const void *)0x12);
}

- (id)_newVNBarcodeSymbologyPDF417DescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (const void *)MRCDescriptorCopyAttribute();
    id v8 = v7;
    if (v7)
    {
      CFRelease(v7);
      CFNumberRef v9 = (const __CFNumber *)MRCDescriptorCopyAttribute();
      CFNumberRef v10 = v9;
      if (v9)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(v10);
        CFNumberRef v11 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        CFNumberRef v12 = v11;
        if (v11)
        {
          uint64_t v17 = 0;
          CFNumberGetValue(v11, kCFNumberNSIntegerType, &v17);
          CFRelease(v12);
          id v13 = objc_alloc(MEMORY[0x1E4F1E060]);
          uint64_t v14 = (void *)[v13 initWithPayload:v6 isCompact:v8 == (const void *)*MEMORY[0x1E4F1CFD0] rowCount:valuePtr columnCount:v17];
LABEL_17:

          return v14;
        }
        if (a4)
        {
          uint64_t v15 = +[VNError errorWithCode:17 message:@"ColumnCount data is missing"];
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v14 = 0;
        goto LABEL_17;
      }
      if (!a4) {
        goto LABEL_16;
      }
      uint64_t v15 = +[VNError errorWithCode:17 message:@"RowCount data is missing"];
    }
    else
    {
      if (!a4) {
        goto LABEL_16;
      }
      uint64_t v15 = +[VNError errorWithCode:17 message:@"IsCompact data is missing"];
    }
LABEL_15:
    uint64_t v14 = 0;
    *a4 = v15;
    goto LABEL_17;
  }
  if (!a4) {
    return 0;
  }
  +[VNError errorWithCode:17 message:@"Payload data is missing"];
  uint64_t v14 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)_newVNBarcodeSymbologyAztecDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = (const void *)MRCDescriptorCopyAttribute();
    id v8 = v7;
    if (v7)
    {
      CFRelease(v7);
      CFNumberRef v9 = (const __CFNumber *)MRCDescriptorCopyAttribute();
      CFNumberRef v10 = v9;
      if (v9)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v9, kCFNumberNSIntegerType, &valuePtr);
        CFRelease(v10);
        CFNumberRef v11 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        CFNumberRef v12 = v11;
        if (v11)
        {
          uint64_t v17 = 0;
          CFNumberGetValue(v11, kCFNumberNSIntegerType, &v17);
          CFRelease(v12);
          id v13 = objc_alloc(MEMORY[0x1E4F1DFF0]);
          uint64_t v14 = (void *)[v13 initWithPayload:v6 isCompact:v8 == (const void *)*MEMORY[0x1E4F1CFD0] layerCount:valuePtr dataCodewordCount:v17];
LABEL_17:

          return v14;
        }
        if (a4)
        {
          uint64_t v15 = +[VNError errorWithCode:17 message:@"CodewordCount data is missing"];
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v14 = 0;
        goto LABEL_17;
      }
      if (!a4) {
        goto LABEL_16;
      }
      uint64_t v15 = +[VNError errorWithCode:17 message:@"LayerCount data is missing"];
    }
    else
    {
      if (!a4) {
        goto LABEL_16;
      }
      uint64_t v15 = +[VNError errorWithCode:17 message:@"IsCompact data is missing"];
    }
LABEL_15:
    uint64_t v14 = 0;
    *a4 = v15;
    goto LABEL_17;
  }
  if (!a4) {
    return 0;
  }
  +[VNError errorWithCode:17 message:@"Payload data is missing"];
  uint64_t v14 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v14;
}

- (id)_newVNBarcodeSymbologyQRDescriptorForMRCDescriptor:(__MRCDescriptor *)a3 error:(id *)a4
{
  uint64_t v5 = MRCDescriptorCopyAttribute();
  if (v5)
  {
    id v6 = (void *)v5;
    CFNumberRef v7 = (const __CFNumber *)MRCDescriptorCopyAttribute();
    CFNumberRef v8 = v7;
    if (v7)
    {
      unsigned int valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
      CFRelease(v8);
      if (valuePtr < 4)
      {
        uint64_t v11 = kErrorCorrectionLevels[valuePtr];
        CFNumberRef v12 = (const __CFNumber *)MRCDescriptorCopyAttribute();
        CFNumberRef v13 = v12;
        if (v12)
        {
          uint64_t v19 = 0;
          CFNumberGetValue(v12, kCFNumberNSIntegerType, &v19);
          CFRelease(v13);
          CFNumberRef v14 = (const __CFNumber *)MRCDescriptorCopyAttribute();
          CFNumberRef v15 = v14;
          if (v14)
          {
            unsigned __int8 v18 = 0;
            CFNumberGetValue(v14, kCFNumberCharType, &v18);
            CFRelease(v15);
            id v16 = objc_alloc(MEMORY[0x1E4F1E068]);
            CFNumberRef v10 = (void *)[v16 initWithPayload:v6 symbolVersion:v19 maskPattern:v18 errorCorrectionLevel:v11];
LABEL_20:

            return v10;
          }
          if (a4)
          {
            CFNumberRef v9 = +[VNError errorWithCode:17 message:@"QRMaskPattern data is missing"];
            goto LABEL_18;
          }
        }
        else if (a4)
        {
          CFNumberRef v9 = +[VNError errorWithCode:17 message:@"QRSymbolVersion data is missing"];
          goto LABEL_18;
        }
      }
      else if (a4)
      {
        CFNumberRef v9 = +[VNError errorWithCode:2 message:@"QRErrorCorrectionLevel data is invalid"];
LABEL_18:
        CFNumberRef v10 = 0;
        *a4 = v9;
        goto LABEL_20;
      }
    }
    else if (a4)
    {
      CFNumberRef v9 = +[VNError errorWithCode:17 message:@"QRErrorCorrectionLevel data is missing"];
      goto LABEL_18;
    }
    CFNumberRef v10 = 0;
    goto LABEL_20;
  }
  if (!a4) {
    return 0;
  }
  +[VNError errorWithCode:17 message:@"Payload data is missing"];
  CFNumberRef v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_newVNBarcodeSymbologyPDF417DescriptorForACBSBarcodeInfo:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F94498]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F94460]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 objectForKey:*MEMORY[0x1E4F94478]];
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        CFNumberRef v10 = 0;
      }
      else
      {
        uint64_t v7 = [v6 BOOLValue];
        CFNumberRef v8 = [v5 objectForKey:*MEMORY[0x1E4F94468]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFNumberRef v9 = [v5 objectForKey:*MEMORY[0x1E4F94470]];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            CFNumberRef v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E060]), "initWithPayload:isCompact:rowCount:columnCount:", v4, v7, objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));
          }
          else {
            CFNumberRef v10 = 0;
          }
        }
        else
        {
          CFNumberRef v10 = 0;
        }
      }
    }
    else
    {
      CFNumberRef v10 = 0;
    }
  }
  else
  {
    CFNumberRef v10 = 0;
  }

  return v10;
}

- (id)_newVNBarcodeSymbologyAztecDescriptorForACBSBarcodeInfo:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F94498]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F94460]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 objectForKey:*MEMORY[0x1E4F94458]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F94450]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFNumberRef v8 = [v5 objectForKey:*MEMORY[0x1E4F94448]];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            CFNumberRef v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1DFF0]), "initWithPayload:isCompact:layerCount:dataCodewordCount:", v4, objc_msgSend(v6, "BOOLValue"), objc_msgSend(v7, "integerValue"), objc_msgSend(v8, "integerValue"));
          }
          else {
            CFNumberRef v9 = 0;
          }
        }
        else
        {
          CFNumberRef v9 = 0;
        }
      }
      else
      {
        CFNumberRef v9 = 0;
      }
    }
    else
    {
      CFNumberRef v9 = 0;
    }
  }
  else
  {
    CFNumberRef v9 = 0;
  }

  return v9;
}

- (id)_newVNBarcodeSymbologyQRDescriptorForACBSBarcodeInfo:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F94498]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F94460]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 objectForKey:*MEMORY[0x1E4F944B8]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unsigned int v7 = [v6 intValue], v7 <= 3))
      {
        uint64_t v9 = kErrorCorrectionLevels[v7];
        CFNumberRef v10 = [v5 objectForKey:*MEMORY[0x1E4F944C8]];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v5 objectForKey:*MEMORY[0x1E4F944C0]];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            CFNumberRef v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E068]), "initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v4, objc_msgSend(v10, "integerValue"), objc_msgSend(v11, "unsignedCharValue"), v9);
          }
          else {
            CFNumberRef v8 = 0;
          }
        }
        else
        {
          CFNumberRef v8 = 0;
        }
      }
      else
      {
        CFNumberRef v8 = 0;
      }
    }
    else
    {
      CFNumberRef v8 = 0;
    }
  }
  else
  {
    CFNumberRef v8 = 0;
  }

  return v8;
}

+ (NSArray)availableLocateModes
{
  NSUInteger v2 = +[VNRequest defaultRevision];
  if (v2 - 2 >= 3 && v2 - 3737841664u >= 3)
  {
    if (v2 == 1)
    {
      CFNumberRef v10 = +[VNDetectBarcodesRequest availableLocateModesRev1];
    }
    else
    {
      VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
      CFNumberRef v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    CFNumberRef v10 = +[VNDetectBarcodesRequest availableLocateModesRev2];
  }

  return (NSArray *)v10;
}

+ (id)availableLocateModesRev2
{
  if (+[VNDetectBarcodesRequest availableLocateModesRev2]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest availableLocateModesRev2]::onceToken, &__block_literal_global_216);
  }
  NSUInteger v2 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesRev2;

  return v2;
}

void __51__VNDetectBarcodesRequest_availableLocateModesRev2__block_invoke()
{
  v2[16] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNDetectBarcodesLocateModeCenterOneVertical";
  v2[1] = @"VNDetectBarcodesLocateModeCenterOneVerticalThick";
  v2[2] = @"VNDetectBarcodesLocateModeCenterThreeVertical";
  v2[3] = @"VNDetectBarcodesLocateModeCenterThreeVerticalCrossed";
  v2[4] = @"VNDetectBarcodesLocateModeCenterOneHorizontal";
  v2[5] = @"VNDetectBarcodesLocateModeCenterOneHorizontalThick";
  v2[6] = @"VNDetectBarcodesLocateModeCenterThreeHorizontal";
  v2[7] = @"VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed";
  v2[8] = @"VNDetectBarcodesLocateModeCenterOneEachDirection";
  v2[9] = @"VNDetectBarcodesLocateModeCenterThreeEachDirection";
  v2[10] = @"VNDetectBarcodesLocateModeCenterFiveEachDirection";
  v2[11] = @"VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals";
  v2[12] = @"VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals";
  v2[13] = @"VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals";
  v2[14] = @"VNDetectBarcodesLocateModeRegularIntervalHorizontal";
  v2[15] = @"VNDetectBarcodesLocateModeRegularIntervalVertical";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:16];
  v1 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesRev2;
  +[VNDetectBarcodesRequest availableLocateModesRev2]::ourAvailableLocateModesReNSUInteger v2 = v0;
}

+ (id)availableLocateModesRev1
{
  if (+[VNDetectBarcodesRequest availableLocateModesRev1]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest availableLocateModesRev1]::onceToken, &__block_literal_global_214_12541);
  }
  NSUInteger v2 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1;

  return v2;
}

void __51__VNDetectBarcodesRequest_availableLocateModesRev1__block_invoke()
{
  void v2[17] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNDetectBarcodesLocateModeCenterOneVertical";
  v2[1] = @"VNDetectBarcodesLocateModeCenterOneVerticalThick";
  v2[2] = @"VNDetectBarcodesLocateModeCenterThreeVertical";
  v2[3] = @"VNDetectBarcodesLocateModeCenterThreeVerticalCrossed";
  v2[4] = @"VNDetectBarcodesLocateModeCenterOneHorizontal";
  v2[5] = @"VNDetectBarcodesLocateModeCenterOneHorizontalThick";
  v2[6] = @"VNDetectBarcodesLocateModeCenterThreeHorizontal";
  v2[7] = @"VNDetectBarcodesLocateModeCenterThreeHorizontalCrossed";
  v2[8] = @"VNDetectBarcodesLocateModeCenterOneEachDirection";
  v2[9] = @"VNDetectBarcodesLocateModeCenterThreeEachDirection";
  v2[10] = @"VNDetectBarcodesLocateModeCenterFiveEachDirection";
  v2[11] = @"VNDetectBarcodesLocateModeCenterThreeEachDirectionAndCoverageAndDiagonals";
  v2[12] = @"VNDetectBarcodesLocateModeCenterThreeVerticalAndCoverageAndDiagonals";
  v2[13] = @"VNDetectBarcodesLocateModeCenterThreeHorizontalAndCoverageAndDiagonals";
  v2[14] = @"VNDetectBarcodesLocateModeFastSearch";
  v2[15] = @"VNDetectBarcodesLocateModeRegularIntervalHorizontal";
  v2[16] = @"VNDetectBarcodesLocateModeRegularIntervalVertical";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:17];
  v1 = (void *)+[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1;
  +[VNDetectBarcodesRequest availableLocateModesRev1]::ourAvailableLocateModesRev1 = v0;
}

+ (NSArray)supportedSymbologies
{
  NSUInteger v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v10;
}

+ (id)supportedSymbologiesRev4Private
{
  NSUInteger v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev4Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::onceToken, &__block_literal_global_69);
  }
  NSUInteger v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private;

  return v2;
}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev4Private__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private];
  uint64_t v0 = [v4 allKeys];
  v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4Private]::_allBarcodeSymbologiesRev4Private = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4Private
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private;

  return v7;
}

void __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private]::ourBarcodeSymbologyToMRCSymbologyMapRev4Private = v3;
}

uint64_t __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4Private__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4Private
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::onceToken, &__block_literal_global_67);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private;

  return v2;
}

void __75__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev4Private__block_invoke()
{
  v15[25] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94380];
  v14[0] = *MEMORY[0x1E4F94368];
  v14[1] = v0;
  v15[0] = @"VNBarcodeSymbologyAztec";
  v15[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F94390];
  v14[2] = *MEMORY[0x1E4F94388];
  v14[3] = v1;
  v15[2] = @"VNBarcodeSymbologyCode39Checksum";
  v15[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F943A0];
  v14[4] = *MEMORY[0x1E4F94398];
  v14[5] = v2;
  v15[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v15[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F94378];
  v14[6] = *MEMORY[0x1E4F943A8];
  v14[7] = v3;
  v15[6] = @"VNBarcodeSymbologyCode93i";
  v15[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F943C0];
  v14[8] = *MEMORY[0x1E4F943B0];
  v14[9] = v4;
  v15[8] = @"VNBarcodeSymbologyDataMatrix";
  v15[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F943E0];
  v14[10] = *MEMORY[0x1E4F943B8];
  v14[11] = v5;
  v15[10] = @"VNBarcodeSymbologyEAN13";
  v15[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F943F0];
  v14[12] = *MEMORY[0x1E4F943E8];
  v14[13] = v6;
  v15[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v15[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94438];
  v14[14] = *MEMORY[0x1E4F94410];
  v14[15] = v7;
  v15[14] = @"VNBarcodeSymbologyPDF417";
  v15[15] = @"VNBarcodeSymbologyQR";
  uint64_t v8 = *MEMORY[0x1E4F94360];
  v14[16] = *MEMORY[0x1E4F94440];
  v14[17] = v8;
  v15[16] = @"VNBarcodeSymbologyUPCE";
  v15[17] = @"VNBarcodeSymbologyAppClipCode";
  uint64_t v9 = *MEMORY[0x1E4F943C8];
  v14[18] = *MEMORY[0x1E4F94370];
  v14[19] = v9;
  v15[18] = @"VNBarcodeSymbologyCodabar";
  v15[19] = @"VNBarcodeSymbologyGS1DataBar";
  uint64_t v10 = *MEMORY[0x1E4F943D8];
  v14[20] = *MEMORY[0x1E4F943D0];
  v14[21] = v10;
  v15[20] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  v15[21] = @"VNBarcodeSymbologyGS1DataBarLimited";
  uint64_t v11 = *MEMORY[0x1E4F94408];
  v14[22] = *MEMORY[0x1E4F94400];
  v14[23] = v11;
  v15[22] = @"VNBarcodeSymbologyMicroPDF417";
  v15[23] = @"VNBarcodeSymbologyMicroQR";
  v14[24] = *MEMORY[0x1E4F943F8];
  v15[24] = @"VNBarcodeSymbologyMSIPlessey";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:25];
  CFNumberRef v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private]::ourMRCSymbologyToBarcodeSymbologyMapRev4Private = v12;
}

+ (id)supportedSymbologiesRev4
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev4
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::onceToken, &__block_literal_global_65_12546);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesRev4;

  return v2;
}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev4__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesRev4;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev4]::_allBarcodeSymbologiesReid v4 = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev4
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapRev4;

  return v7;
}

void __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapRev4;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4]::ourBarcodeSymbologyToMRCSymbologyMapReid v4 = v3;
}

uint64_t __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev4__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev4
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::onceToken, &__block_literal_global_63);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapRev4;

  return v2;
}

void __68__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev4__block_invoke()
{
  v15[24] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94380];
  v14[0] = *MEMORY[0x1E4F94368];
  v14[1] = v0;
  v15[0] = @"VNBarcodeSymbologyAztec";
  v15[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F94390];
  v14[2] = *MEMORY[0x1E4F94388];
  v14[3] = v1;
  v15[2] = @"VNBarcodeSymbologyCode39Checksum";
  v15[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F943A0];
  v14[4] = *MEMORY[0x1E4F94398];
  v14[5] = v2;
  v15[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v15[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F94378];
  v14[6] = *MEMORY[0x1E4F943A8];
  v14[7] = v3;
  v15[6] = @"VNBarcodeSymbologyCode93i";
  v15[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F943C0];
  v14[8] = *MEMORY[0x1E4F943B0];
  v14[9] = v4;
  v15[8] = @"VNBarcodeSymbologyDataMatrix";
  v15[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F943E0];
  v14[10] = *MEMORY[0x1E4F943B8];
  v14[11] = v5;
  v15[10] = @"VNBarcodeSymbologyEAN13";
  v15[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F943F0];
  v14[12] = *MEMORY[0x1E4F943E8];
  v14[13] = v6;
  v15[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v15[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94438];
  v14[14] = *MEMORY[0x1E4F94410];
  v14[15] = v7;
  v15[14] = @"VNBarcodeSymbologyPDF417";
  v15[15] = @"VNBarcodeSymbologyQR";
  uint64_t v8 = *MEMORY[0x1E4F94370];
  v14[16] = *MEMORY[0x1E4F94440];
  v14[17] = v8;
  v15[16] = @"VNBarcodeSymbologyUPCE";
  v15[17] = @"VNBarcodeSymbologyCodabar";
  uint64_t v9 = *MEMORY[0x1E4F943D0];
  v14[18] = *MEMORY[0x1E4F943C8];
  v14[19] = v9;
  v15[18] = @"VNBarcodeSymbologyGS1DataBar";
  v15[19] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  uint64_t v10 = *MEMORY[0x1E4F94400];
  v14[20] = *MEMORY[0x1E4F943D8];
  v14[21] = v10;
  v15[20] = @"VNBarcodeSymbologyGS1DataBarLimited";
  v15[21] = @"VNBarcodeSymbologyMicroPDF417";
  uint64_t v11 = *MEMORY[0x1E4F943F8];
  v14[22] = *MEMORY[0x1E4F94408];
  v14[23] = v11;
  v15[22] = @"VNBarcodeSymbologyMicroQR";
  v15[23] = @"VNBarcodeSymbologyMSIPlessey";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:24];
  CFNumberRef v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapRev4;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4]::ourMRCSymbologyToBarcodeSymbologyMapReuint64_t v4 = v12;
}

+ (id)supportedSymbologiesRev3Private
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev3Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::onceToken, &__block_literal_global_61);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesRev3;

  return v2;
}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev3Private__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesRev3;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3Private]::_allBarcodeSymbologiesReuint64_t v3 = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3Private
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private;

  return v7;
}

void __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3Private]::ourBarcodeSymbologyToMRCSymbologyMapRevision3Private = v3;
}

uint64_t __75__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3Private__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3Private
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::onceToken, &__block_literal_global_59);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private;

  return v2;
}

void __75__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev3Private__block_invoke()
{
  v15[24] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94368];
  v14[0] = *MEMORY[0x1E4F94360];
  v14[1] = v0;
  v15[0] = @"VNBarcodeSymbologyAppClipCode";
  v15[1] = @"VNBarcodeSymbologyAztec";
  uint64_t v1 = *MEMORY[0x1E4F94388];
  v14[2] = *MEMORY[0x1E4F94380];
  v14[3] = v1;
  v15[2] = @"VNBarcodeSymbologyCode39";
  v15[3] = @"VNBarcodeSymbologyCode39Checksum";
  uint64_t v2 = *MEMORY[0x1E4F94398];
  v14[4] = *MEMORY[0x1E4F94390];
  v14[5] = v2;
  v15[4] = @"VNBarcodeSymbologyCode39FullASCII";
  v15[5] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  uint64_t v3 = *MEMORY[0x1E4F943A8];
  v14[6] = *MEMORY[0x1E4F943A0];
  v14[7] = v3;
  v15[6] = @"VNBarcodeSymbologyCode93";
  v15[7] = @"VNBarcodeSymbologyCode93i";
  uint64_t v4 = *MEMORY[0x1E4F943B0];
  v14[8] = *MEMORY[0x1E4F94378];
  v14[9] = v4;
  v15[8] = @"VNBarcodeSymbologyCode128";
  v15[9] = @"VNBarcodeSymbologyDataMatrix";
  uint64_t v5 = *MEMORY[0x1E4F943B8];
  v14[10] = *MEMORY[0x1E4F943C0];
  v14[11] = v5;
  v15[10] = @"VNBarcodeSymbologyEAN8";
  v15[11] = @"VNBarcodeSymbologyEAN13";
  uint64_t v6 = *MEMORY[0x1E4F943E8];
  v14[12] = *MEMORY[0x1E4F943E0];
  v14[13] = v6;
  v15[12] = @"VNBarcodeSymbologyI2of5";
  v15[13] = @"VNBarcodeSymbologyI2of5Checksum";
  uint64_t v7 = *MEMORY[0x1E4F94410];
  v14[14] = *MEMORY[0x1E4F943F0];
  v14[15] = v7;
  v15[14] = @"VNBarcodeSymbologyITF14";
  v15[15] = @"VNBarcodeSymbologyPDF417";
  uint64_t v8 = *MEMORY[0x1E4F94440];
  v14[16] = *MEMORY[0x1E4F94438];
  v14[17] = v8;
  v15[16] = @"VNBarcodeSymbologyQR";
  v15[17] = @"VNBarcodeSymbologyUPCE";
  uint64_t v9 = *MEMORY[0x1E4F943C8];
  v14[18] = *MEMORY[0x1E4F94370];
  v14[19] = v9;
  v15[18] = @"VNBarcodeSymbologyCodabar";
  v15[19] = @"VNBarcodeSymbologyGS1DataBar";
  uint64_t v10 = *MEMORY[0x1E4F943D8];
  v14[20] = *MEMORY[0x1E4F943D0];
  v14[21] = v10;
  v15[20] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  v15[21] = @"VNBarcodeSymbologyGS1DataBarLimited";
  uint64_t v11 = *MEMORY[0x1E4F94408];
  v14[22] = *MEMORY[0x1E4F94400];
  v14[23] = v11;
  v15[22] = @"VNBarcodeSymbologyMicroPDF417";
  v15[23] = @"VNBarcodeSymbologyMicroQR";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:24];
  CFNumberRef v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3Private]::ourMRCSymbologyToBarcodeSymbologyMapRev3Private = v12;
}

+ (id)supportedSymbologiesRev3
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev3
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::onceToken, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesRev3;

  return v2;
}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev3__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesRev3;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev3]::_allBarcodeSymbologiesReuint64_t v3 = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapRev3
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3;

  return v7;
}

void __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev3]::ourBarcodeSymbologyToMRCSymbologyMapRevision3 = v3;
}

uint64_t __68__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapRev3__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapRev3
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::onceToken, &__block_literal_global_55_12548);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapRev3;

  return v2;
}

void __68__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapRev3__block_invoke()
{
  v14[23] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94380];
  v13[0] = *MEMORY[0x1E4F94368];
  v13[1] = v0;
  v14[0] = @"VNBarcodeSymbologyAztec";
  v14[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F94390];
  v13[2] = *MEMORY[0x1E4F94388];
  v13[3] = v1;
  v14[2] = @"VNBarcodeSymbologyCode39Checksum";
  v14[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F943A0];
  v13[4] = *MEMORY[0x1E4F94398];
  v13[5] = v2;
  v14[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v14[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F94378];
  v13[6] = *MEMORY[0x1E4F943A8];
  v13[7] = v3;
  v14[6] = @"VNBarcodeSymbologyCode93i";
  v14[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F943C0];
  v13[8] = *MEMORY[0x1E4F943B0];
  v13[9] = v4;
  v14[8] = @"VNBarcodeSymbologyDataMatrix";
  v14[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F943E0];
  v13[10] = *MEMORY[0x1E4F943B8];
  v13[11] = v5;
  v14[10] = @"VNBarcodeSymbologyEAN13";
  v14[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F943F0];
  v13[12] = *MEMORY[0x1E4F943E8];
  v13[13] = v6;
  v14[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v14[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94438];
  v13[14] = *MEMORY[0x1E4F94410];
  v13[15] = v7;
  v14[14] = @"VNBarcodeSymbologyPDF417";
  v14[15] = @"VNBarcodeSymbologyQR";
  uint64_t v8 = *MEMORY[0x1E4F94370];
  v13[16] = *MEMORY[0x1E4F94440];
  v13[17] = v8;
  v14[16] = @"VNBarcodeSymbologyUPCE";
  v14[17] = @"VNBarcodeSymbologyCodabar";
  uint64_t v9 = *MEMORY[0x1E4F943D0];
  v13[18] = *MEMORY[0x1E4F943C8];
  v13[19] = v9;
  v14[18] = @"VNBarcodeSymbologyGS1DataBar";
  v14[19] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  uint64_t v10 = *MEMORY[0x1E4F94400];
  v13[20] = *MEMORY[0x1E4F943D8];
  v13[21] = v10;
  v14[20] = @"VNBarcodeSymbologyGS1DataBarLimited";
  v14[21] = @"VNBarcodeSymbologyMicroPDF417";
  v13[22] = *MEMORY[0x1E4F94408];
  v14[22] = @"VNBarcodeSymbologyMicroQR";
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:23];
  uint64_t v12 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapRev3;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev3]::ourMRCSymbologyToBarcodeSymbologyMapReuint64_t v3 = v11;
}

+ (id)supportedSymbologiesRev2Private
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev2Private
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::onceToken, &__block_literal_global_53);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private;

  return v2;
}

void __60__VNDetectBarcodesRequest__allBarcodeSymbologiesRev2Private__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2Private]::_allBarcodeSymbologiesRev2Private = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMapPrivate
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate;

  return v7;
}

void __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapPrivate]::ourBarcodeSymbologyToMRCSymbologyMapPrivate = v3;
}

uint64_t __71__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMapPrivate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMapPrivate
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::onceToken, &__block_literal_global_51_12550);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate;

  return v2;
}

void __71__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMapPrivate__block_invoke()
{
  v15[24] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94380];
  v14[0] = *MEMORY[0x1E4F94368];
  v14[1] = v0;
  v15[0] = @"VNBarcodeSymbologyAztec";
  v15[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F94390];
  v14[2] = *MEMORY[0x1E4F94388];
  v14[3] = v1;
  v15[2] = @"VNBarcodeSymbologyCode39Checksum";
  v15[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F943A0];
  v14[4] = *MEMORY[0x1E4F94398];
  v14[5] = v2;
  v15[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v15[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F94378];
  v14[6] = *MEMORY[0x1E4F943A8];
  v14[7] = v3;
  v15[6] = @"VNBarcodeSymbologyCode93i";
  v15[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F943C0];
  v14[8] = *MEMORY[0x1E4F943B0];
  v14[9] = v4;
  v15[8] = @"VNBarcodeSymbologyDataMatrix";
  v15[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F943E0];
  v14[10] = *MEMORY[0x1E4F943B8];
  v14[11] = v5;
  v15[10] = @"VNBarcodeSymbologyEAN13";
  v15[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F943F0];
  v14[12] = *MEMORY[0x1E4F943E8];
  v14[13] = v6;
  v15[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v15[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94438];
  v14[14] = *MEMORY[0x1E4F94410];
  v14[15] = v7;
  v15[14] = @"VNBarcodeSymbologyPDF417";
  v15[15] = @"VNBarcodeSymbologyQR";
  uint64_t v8 = *MEMORY[0x1E4F94360];
  v14[16] = *MEMORY[0x1E4F94440];
  v14[17] = v8;
  v15[16] = @"VNBarcodeSymbologyUPCE";
  v15[17] = @"VNBarcodeSymbologyAppClipCode";
  uint64_t v9 = *MEMORY[0x1E4F943C8];
  v14[18] = *MEMORY[0x1E4F94370];
  v14[19] = v9;
  v15[18] = @"VNBarcodeSymbologyCodabar";
  v15[19] = @"VNBarcodeSymbologyGS1DataBar";
  uint64_t v10 = *MEMORY[0x1E4F943D8];
  v14[20] = *MEMORY[0x1E4F943D0];
  v14[21] = v10;
  v15[20] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  v15[21] = @"VNBarcodeSymbologyGS1DataBarLimited";
  uint64_t v11 = *MEMORY[0x1E4F94408];
  v14[22] = *MEMORY[0x1E4F94400];
  v14[23] = v11;
  v15[22] = @"VNBarcodeSymbologyMicroPDF417";
  v15[23] = @"VNBarcodeSymbologyMicroQR";
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:24];
  CFNumberRef v13 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapPrivate]::ourMRCSymbologyToBarcodeSymbologyMapPrivate = v12;
}

+ (id)supportedSymbologiesRev2
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev2
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::onceToken, &__block_literal_global_49);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesRev2;

  return v2;
}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev2__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesRev2;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev2]::_allBarcodeSymbologiesReuint64_t v2 = v2;
}

+ (id)_ourBarcodeSymbologyToMRCSymbologyMap
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap;

  return v7;
}

void __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMap]::ourBarcodeSymbologyToMRCSymbologyMap = v3;
}

uint64_t __64__VNDetectBarcodesRequest__ourBarcodeSymbologyToMRCSymbologyMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourMRCSymbologyToBarcodeSymbologyMap
{
  if (+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::onceToken, &__block_literal_global_47);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap;

  return v2;
}

void __64__VNDetectBarcodesRequest__ourMRCSymbologyToBarcodeSymbologyMap__block_invoke()
{
  v14[23] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F94380];
  v13[0] = *MEMORY[0x1E4F94368];
  v13[1] = v0;
  v14[0] = @"VNBarcodeSymbologyAztec";
  v14[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F94390];
  v13[2] = *MEMORY[0x1E4F94388];
  v13[3] = v1;
  v14[2] = @"VNBarcodeSymbologyCode39Checksum";
  v14[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F943A0];
  v13[4] = *MEMORY[0x1E4F94398];
  v13[5] = v2;
  v14[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v14[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F94378];
  v13[6] = *MEMORY[0x1E4F943A8];
  v13[7] = v3;
  v14[6] = @"VNBarcodeSymbologyCode93i";
  v14[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F943C0];
  v13[8] = *MEMORY[0x1E4F943B0];
  v13[9] = v4;
  v14[8] = @"VNBarcodeSymbologyDataMatrix";
  v14[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F943E0];
  v13[10] = *MEMORY[0x1E4F943B8];
  v13[11] = v5;
  v14[10] = @"VNBarcodeSymbologyEAN13";
  v14[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F943F0];
  v13[12] = *MEMORY[0x1E4F943E8];
  v13[13] = v6;
  v14[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v14[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94438];
  v13[14] = *MEMORY[0x1E4F94410];
  v13[15] = v7;
  v14[14] = @"VNBarcodeSymbologyPDF417";
  v14[15] = @"VNBarcodeSymbologyQR";
  uint64_t v8 = *MEMORY[0x1E4F94370];
  v13[16] = *MEMORY[0x1E4F94440];
  v13[17] = v8;
  v14[16] = @"VNBarcodeSymbologyUPCE";
  v14[17] = @"VNBarcodeSymbologyCodabar";
  uint64_t v9 = *MEMORY[0x1E4F943D0];
  v13[18] = *MEMORY[0x1E4F943C8];
  v13[19] = v9;
  v14[18] = @"VNBarcodeSymbologyGS1DataBar";
  v14[19] = @"VNBarcodeSymbologyGS1DataBarExpanded";
  uint64_t v10 = *MEMORY[0x1E4F94400];
  v13[20] = *MEMORY[0x1E4F943D8];
  v13[21] = v10;
  v14[20] = @"VNBarcodeSymbologyGS1DataBarLimited";
  v14[21] = @"VNBarcodeSymbologyMicroPDF417";
  v13[22] = *MEMORY[0x1E4F94408];
  v14[22] = @"VNBarcodeSymbologyMicroQR";
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:23];
  uint64_t v12 = (void *)+[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap;
  +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMap]::ourMRCSymbologyToBarcodeSymbologyMap = v11;
}

+ (id)supportedSymbologiesRev1
{
  uint64_t v2 = +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1];
  uint64_t v9 = v2;
  if (v2)
  {
    id v10 = v2;
  }
  else
  {
    VNValidatedLog(4, @"Unable to obtain the supported barcode symbologies", v3, v4, v5, v6, v7, v8, v12);
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

+ (id)_allBarcodeSymbologiesRev1
{
  if (+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::onceToken, &__block_literal_global_42);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesRev1;

  return v2;
}

void __53__VNDetectBarcodesRequest__allBarcodeSymbologiesRev1__block_invoke()
{
  id v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap];
  uint64_t v0 = [v4 allKeys];
  uint64_t v1 = [v0 sortedArrayUsingSelector:sel_compare_];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)+[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesRev1;
  +[VNDetectBarcodesRequest _allBarcodeSymbologiesRev1]::_allBarcodeSymbologiesReuint64_t v1 = v2;
}

+ (id)_ourBarcodeSymbologyToACBSBarcodeTypeMap
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap];
  id v4 = objc_msgSend(v2, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke;
  block[3] = &unk_1E5B1D628;
  id v10 = v4;
  uint64_t v5 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::onceToken, block);
  }
  id v7 = (id)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap;

  return v7;
}

void __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke_2;
  v5[3] = &unk_1E5B1D360;
  id v6 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v5];

  uint64_t v3 = [*(id *)(a1 + 32) copy];
  id v4 = (void *)+[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap;
  +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap]::ourBarcodeSymbologyToACBSBarcodeTypeMap = v3;
}

uint64_t __67__VNDetectBarcodesRequest__ourBarcodeSymbologyToACBSBarcodeTypeMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

+ (id)_ourACBSBarcodeTypeToBarcodeSymbologyMap
{
  if (+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::onceToken, &__block_literal_global_37_12553);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap;

  return v2;
}

void __67__VNDetectBarcodesRequest__ourACBSBarcodeTypeToBarcodeSymbologyMap__block_invoke()
{
  v11[17] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F944E0];
  v10[0] = *MEMORY[0x1E4F944D0];
  v10[1] = v0;
  v11[0] = @"VNBarcodeSymbologyAztec";
  v11[1] = @"VNBarcodeSymbologyCode39";
  uint64_t v1 = *MEMORY[0x1E4F944F0];
  v10[2] = *MEMORY[0x1E4F944E8];
  v10[3] = v1;
  v11[2] = @"VNBarcodeSymbologyCode39Checksum";
  v11[3] = @"VNBarcodeSymbologyCode39FullASCII";
  uint64_t v2 = *MEMORY[0x1E4F94500];
  v10[4] = *MEMORY[0x1E4F944F8];
  v10[5] = v2;
  v11[4] = @"VNBarcodeSymbologyCode39FullASCIIChecksum";
  v11[5] = @"VNBarcodeSymbologyCode93";
  uint64_t v3 = *MEMORY[0x1E4F944D8];
  v10[6] = *MEMORY[0x1E4F94508];
  v10[7] = v3;
  v11[6] = @"VNBarcodeSymbologyCode93i";
  v11[7] = @"VNBarcodeSymbologyCode128";
  uint64_t v4 = *MEMORY[0x1E4F94520];
  v10[8] = *MEMORY[0x1E4F94510];
  v10[9] = v4;
  v11[8] = @"VNBarcodeSymbologyDataMatrix";
  v11[9] = @"VNBarcodeSymbologyEAN8";
  uint64_t v5 = *MEMORY[0x1E4F94528];
  v10[10] = *MEMORY[0x1E4F94518];
  v10[11] = v5;
  v11[10] = @"VNBarcodeSymbologyEAN13";
  v11[11] = @"VNBarcodeSymbologyI2of5";
  uint64_t v6 = *MEMORY[0x1E4F94538];
  v10[12] = *MEMORY[0x1E4F94530];
  v10[13] = v6;
  v11[12] = @"VNBarcodeSymbologyI2of5Checksum";
  v11[13] = @"VNBarcodeSymbologyITF14";
  uint64_t v7 = *MEMORY[0x1E4F94548];
  v10[14] = *MEMORY[0x1E4F94540];
  v10[15] = v7;
  v11[14] = @"VNBarcodeSymbologyPDF417";
  v11[15] = @"VNBarcodeSymbologyQR";
  v10[16] = *MEMORY[0x1E4F94550];
  v11[16] = @"VNBarcodeSymbologyUPCE";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:17];
  uint64_t v9 = (void *)+[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap;
  +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap]::ourACBSBarcodeTypeToBarcodeSymbologyMap = v8;
}

+ (id)barcodeSymbologyForMRCSymbology:(__CFString *)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    uint64_t v4 = +[VNDetectBarcodesRequest _ourMRCSymbologyToBarcodeSymbologyMapRev4Private];
    uint64_t v3 = [v4 objectForKeyedSubscript:v3];
  }

  return v3;
}

+ (__CFString)MRCSymbologyForBarcodeSymbology:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToMRCSymbologyMapRev4Private];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)barcodeSymbologyForACBSBarcodeType:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[VNDetectBarcodesRequest _ourACBSBarcodeTypeToBarcodeSymbologyMap];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)ACBSBarcodeTypeForBarcodeSymbology:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[VNDetectBarcodesRequest _ourBarcodeSymbologyToACBSBarcodeTypeMap];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841664u > 2) {
    return 0;
  }
  else {
    return off_1E5B1D448[a3 - 3737841664u];
  }
}

+ (id)privateRevisionsSet
{
  if (+[VNDetectBarcodesRequest privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectBarcodesRequest privateRevisionsSet]::onceToken, &__block_literal_global_12565);
  }
  uint64_t v2 = (void *)+[VNDetectBarcodesRequest privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __46__VNDetectBarcodesRequest_privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNDetectBarcodesRequest privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF000uLL, a2, a3, a4, a5, a6, a7, a8, 3737841665);

  return MEMORY[0x1F41817F8]();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectBarcodesRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end