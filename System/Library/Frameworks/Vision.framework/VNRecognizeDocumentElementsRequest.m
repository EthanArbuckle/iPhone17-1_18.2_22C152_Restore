@interface VNRecognizeDocumentElementsRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements;
- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements;
- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)supportedIdentifiersAndReturnError:(id *)a3;
- (unint64_t)imageCropAndScaleOption;
- (void)setImageCropAndScaleOption:(unint64_t)a3;
@end

@implementation VNRecognizeDocumentElementsRequest

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
  }
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(VNRecognizeDocumentElementsRequest *)self imageCropAndScaleOption];
  if (v5 != [v4 imageCropAndScaleOption]) {
    goto LABEL_6;
  }
  v6 = [(VNRecognizeDocumentElementsRequest *)self documentElements];
  v7 = [v4 documentElements];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_6;
  }
  v9 = [(VNRecognizeDocumentElementsRequest *)self textElements];
  v10 = [v4 textElements];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0) {
    goto LABEL_6;
  }
  v12 = [(VNRecognizeDocumentElementsRequest *)self machineReadableCodeElements];
  v13 = [v4 machineReadableCodeElements];
  char v14 = [v12 isEqual:v13];

  if (v14)
  {
    v17.receiver = self;
    v17.super_class = (Class)VNRecognizeDocumentElementsRequest;
    BOOL v15 = [(VNImageBasedRequest *)&v17 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
LABEL_6:
    BOOL v15 = 0;
  }

  return v15;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VNRecognizeDocumentElementsRequest;
  id v6 = [(VNRequest *)&v16 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  v7 = v6;
  if (a3 == 1)
  {
    char v8 = [v6 objectForKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
    [v7 setObject:v8 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier"];

    v9 = [(VNRecognizeDocumentElementsRequest *)self documentElements];
    if ([v9 recognize])
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"];
      v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "generateSegmentationMask"));
      [v7 setObject:v10 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"];
    }
    char v11 = [(VNRecognizeDocumentElementsRequest *)self textElements];
    if ([v11 recognize])
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"];
      v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "generateSegmentationMask"));
      [v7 setObject:v12 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"];
    }
    v13 = [(VNRecognizeDocumentElementsRequest *)self machineReadableCodeElements];
    if ([v13 recognize])
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"];
      char v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "generateSegmentationMask"));
      [v7 setObject:v14 forKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"];
    }
  }
  return v7;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    id v4 = @"VNSmartCam5GatingDetectorType";
    unint64_t v5 = @"VNSmartCam5GatingDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    id v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)machineReadableCodeElements
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 machineReadableCodeElements];

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)textElements
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 textElements];

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (VNRecognizeDocumentElementsRequestElementConfiguration)documentElements
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 documentElements];

  return (VNRecognizeDocumentElementsRequestElementConfiguration *)v3;
}

- (void)setImageCropAndScaleOption:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setImageCropAndScaleOption:a3];
}

- (unint64_t)imageCropAndScaleOption
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 imageCropAndScaleOption];

  return v3;
}

- (id)supportedIdentifiersAndReturnError:(id *)a3
{
  unint64_t v5 = objc_alloc_init(VNSession);
  id v10 = 0;
  id v6 = [(VNRequest *)self applicableDetectorAndOptions:&v10 forRevision:[(VNRequest *)self resolvedRevision] loadedInSession:v5 error:a3];
  id v7 = v10;
  if (!v6) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [v6 supportedDocumentElementIdentifiers];
    goto LABEL_7;
  }
  if (a3)
  {
    +[VNError errorForUnsupportedRevision:[(VNRequest *)self resolvedRevision] ofRequest:self];
    char v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNRecognizeDocumentElementsRequest revisionAvailability]::ourRevisionAvailability;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

@end