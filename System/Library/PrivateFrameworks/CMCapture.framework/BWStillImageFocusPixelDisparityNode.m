@interface BWStillImageFocusPixelDisparityNode
+ (void)initialize;
- (BWStillImageFocusPixelDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfiguration:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 depthIsAlwaysHighQuality:(BOOL)a7;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_loadAndConfigureDisparityGenerator;
- (void)_attachDepthMetadataToSampleBuffer:(uint64_t)a1;
- (void)_processDisparityForSampleBuffer:(uint64_t)a1;
- (void)_removeConsumedAttachedMediaFromSampleBuffer:(uint64_t)a1;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)processorOptionsForProcessorVersion:(uint64_t)a1;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImageFocusPixelDisparityNode

+ (void)initialize
{
}

- (BWStillImageFocusPixelDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfiguration:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 depthIsAlwaysHighQuality:(BOOL)a7
{
  v41.receiver = self;
  v41.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  v12 = [(BWNode *)&v41 init];
  if (v12)
  {
    if (!a3
      || (v12->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3, !a4)
      || (v13 = (BWSensorConfiguration *)a4,
          v12->_sensorConfiguration = v13,
          ![(BWSensorConfiguration *)v13 cameraInfo])
      || (v14 = [(BWSensorConfiguration *)v12->_sensorConfiguration cameraInfo],
          (id v15 = [(NSDictionary *)v14 objectForKeyedSubscript:*MEMORY[0x1E4F52D28]]) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    [v15 doubleValue];
    *(float *)&double v16 = v16 * 0.001;
    v12->_pixelSizeInMm = *(float *)&v16;
    v12->_depthIsAlwaysHighQuality = a7;
    v17 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v12];
    v18 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v18 setSupportedPixelFormats:&unk_1EFB02AF8];
    [(BWNodeInput *)v17 setFormatRequirements:v18];

    [(BWNodeInput *)v17 setPassthroughMode:1];
    [(BWNode *)v12 addInput:v17];

    int v19 = [(BWStillImageNodeConfiguration *)v12->_nodeConfiguration depthDataType];
    switch(v19)
    {
      case 9:
        v26 = objc_alloc_init(BWNodeInputMediaConfiguration);
        id v27 = +[BWVideoFormatRequirements formatRequirements];
        [v27 setSupportedPixelFormats:&unk_1EFB02B58];
        [(BWNodeInputMediaConfiguration *)v26 setFormatRequirements:v27];
        [(BWNodeInputMediaConfiguration *)v26 setPassthroughMode:0];
        [(BWNodeInput *)v12->super._input setMediaConfiguration:v26 forAttachedMediaKey:0x1EFA74380];
        v28 = objc_alloc_init(BWNodeInputMediaConfiguration);
        id v29 = +[BWVideoFormatRequirements formatRequirements];
        [v29 setSupportedPixelFormats:&unk_1EFB02B70];
        [(BWNodeInputMediaConfiguration *)v28 setFormatRequirements:v29];
        [(BWNodeInputMediaConfiguration *)v28 setPassthroughMode:0];
        [(BWNodeInput *)v12->super._input setMediaConfiguration:v28 forAttachedMediaKey:0x1EFA743E0];
        v30 = objc_alloc_init(BWNodeInputMediaConfiguration);
        id v31 = +[BWVideoFormatRequirements formatRequirements];
        [v31 setSupportedPixelFormats:&unk_1EFB02B88];
        [(BWNodeInputMediaConfiguration *)v30 setFormatRequirements:v31];
        [(BWNodeInputMediaConfiguration *)v30 setPassthroughMode:0];
        [(BWNodeInput *)v12->super._input setMediaConfiguration:v30 forAttachedMediaKey:0x1EFA74400];
        break;
      case 5:
        v22 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v32 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v32 setSupportedPixelFormats:&unk_1EFB02B40];
        [(BWNodeInputMediaConfiguration *)v22 setFormatRequirements:v32];

        [(BWNodeInputMediaConfiguration *)v22 setPassthroughMode:0];
        input = v12->super._input;
        uint64_t v25 = 0x1EFA74360;
        goto LABEL_12;
      case 4:
        v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v21 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v21 setSupportedPixelFormats:&unk_1EFB02B10];
        [(BWNodeInputMediaConfiguration *)v20 setFormatRequirements:v21];

        [(BWNodeInputMediaConfiguration *)v20 setPassthroughMode:0];
        [(BWNodeInput *)v12->super._input setMediaConfiguration:v20 forAttachedMediaKey:0x1EFA74380];

        v22 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v23 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v23 setSupportedPixelFormats:&unk_1EFB02B28];
        [(BWNodeInputMediaConfiguration *)v22 setFormatRequirements:v23];

        [(BWNodeInputMediaConfiguration *)v22 setPassthroughMode:0];
        input = v12->super._input;
        uint64_t v25 = 0x1EFA743C0;
LABEL_12:
        [(BWNodeInput *)input setMediaConfiguration:v22 forAttachedMediaKey:v25];

        break;
    }
    v33 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v34 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v34 setSupportedPixelFormats:&unk_1EFB02BA0];
    [(BWNodeInputMediaConfiguration *)v33 setFormatRequirements:v34];
    [(BWNodeInputMediaConfiguration *)v33 setPassthroughMode:0];
    [(BWNodeInput *)v12->super._input setMediaConfiguration:v33 forAttachedMediaKey:0x1EFA744E0];
    v35 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v12];
    v36 = [(BWNodeOutput *)v35 primaryMediaConfiguration];
    v37 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v37 setSupportedPixelFormats:&unk_1EFB02BB8];
    [(BWNodeOutputMediaConfiguration *)v36 setFormatRequirements:v37];

    [(BWNodeOutputMediaConfiguration *)v36 setProvidesPixelBufferPool:0];
    [(BWNodeOutputMediaConfiguration *)v36 setPassthroughMode:1];
    v38 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v39 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v39 setSupportedPixelFormats:&unk_1EFB02BD0];
    [(BWVideoFormatRequirements *)v39 setWidth:a5];
    [(BWVideoFormatRequirements *)v39 setHeight:a6];
    [(BWNodeOutputMediaConfiguration *)v38 setFormatRequirements:v39];

    [(BWNodeOutputMediaConfiguration *)v38 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v38 setProvidesPixelBufferPool:1];
    [(BWNodeOutput *)v35 setMediaConfiguration:v38 forAttachedMediaKey:@"Depth"];

    [(BWNode *)v12 addOutput:v35];
    *(_DWORD *)v12->_anon_90 = 1065353216;
    *(_DWORD *)&v12->_anon_90[20] = 1065353216;
    *(_DWORD *)&v12->_anon_90[40] = 1065353216;
  }
  return v12;
}

- (void)dealloc
{
  [(FigFocusPixelDisparityGenerator *)self->_focusPixelDisparityGenerator finishProcessing];

  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription) {
    CFRelease(disparityFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  [(BWNode *)&v4 dealloc];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    output = self->super._output;
    [(BWNodeOutput *)output setFormat:a3];
  }
  else if (([a5 isEqualToString:0x1EFA743C0] & 1) == 0 {
         && ([a5 isEqualToString:0x1EFA74380] & 1) == 0
  }
         && ([a5 isEqualToString:0x1EFA74360] & 1) == 0
         && ([a5 isEqualToString:0x1EFA744E0] & 1) == 0
         && ([a5 isEqualToString:0x1EFA74500] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)BWStillImageFocusPixelDisparityNode;
    [(BWNode *)&v10 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"DisparityGenerator";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWStillImageFocusPixelDisparityNode _loadAndConfigureDisparityGenerator]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureDisparityGenerator
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "focusPixelDisparityVersionForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
  int v3 = [*(id *)(a1 + 104) depthDataType];
  if (v3 == 9)
  {
    if ((int)v2 >= 3) {
      goto LABEL_9;
    }
    return 0;
  }
  if (v3 == 5)
  {
    if ((int)v2 >= 2) {
      goto LABEL_9;
    }
    return 0;
  }
  if (v3 == 4 && v2 != 1) {
    return 0;
  }
LABEL_9:
  v5 = -[BWStillImageFocusPixelDisparityNode processorOptionsForProcessorVersion:](a1, v2);
  if (!v5
    || (v6 = v5, (v7 = BWLoadProcessorBundle(@"FPDisparity", v2)) == 0)
    || (v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "principalClass")), "initWithCommandQueue:", objc_msgSend(*(id *)(a1 + 104), "metalCommandQueue")), (*(void *)(a1 + 120) = v8) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v9 = FigSignalErrorAt();
    if (!v9) {
      return v9;
    }
    goto LABEL_21;
  }
  [v8 setOptions:v6];
  [*(id *)(a1 + 120) setFocusPixelMetadata:0];
  [*(id *)(a1 + 120) setQualityEstimationEnabled:*(unsigned char *)(a1 + 212) == 0];
  uint64_t v9 = 0;
  if ([*(id *)(a1 + 120) prepareToProcess:0])
  {
    uint64_t v9 = 4294954516;
LABEL_21:

    *(void *)(a1 + 120) = 0;
  }
  return v9;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (a3)
  {
    v6 = (void *)CMGetAttachment(a3, @"BWStillImageCaptureSettings", 0);
    if (v6)
    {
      if (([v6 captureFlags] & 0x800) != 0) {
        -[BWStillImageFocusPixelDisparityNode _processDisparityForSampleBuffer:]((uint64_t)self, a3);
      }
    }
  }
  if ([(BWStillImageNodeConfiguration *)self->_nodeConfiguration depthDataType] == 5) {
    -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:]((uint64_t)self, a3);
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
}

- (void)_processDisparityForSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  v5 = (double *)MEMORY[0x1E4F1DB20];
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v6;
  CFTypeRef cf = 0;
  unint64_t v7 = 0x1E96A8000uLL;
  if (!*(void *)(a1 + 120)) {
    goto LABEL_79;
  }
  int v8 = [*(id *)(a1 + 104) depthDataType];
  v44 = a2;
  switch(v8)
  {
    case 9:
      v17 = +[FigCaptureCameraParameters sharedInstance];
      -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](v17, "focusPixelDisparityVersionForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
      id v18 = -[FigCaptureCameraParameters focusPixelDisparityParametersForPortType:sensorIDString:](v17, "focusPixelDisparityParametersForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
      if (v18)
      {
        uint64_t v19 = [v18 objectForKeyedSubscript:@"sizes"];
        if (!v19) {
          goto LABEL_78;
        }
        v20 = (void *)v19;
        unint64_t v21 = BWPixelBufferDimensionsFromSampleBuffer(a2);
        if (__PAIR64__(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"color_size"), "objectForKeyedSubscript:", @"height"), "intValue"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"color_size"), "objectForKeyedSubscript:", @"width"), "intValue")) != v21)goto LABEL_79; {
        AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74380);
        }
        v12 = AttachedMedia;
        if (!AttachedMedia) {
          goto LABEL_76;
        }
        ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
        if (!ImageBuffer)
        {
LABEL_81:
          fig_log_get_emitter();
          uint64_t v42 = v2;
          LODWORD(v41) = 0;
          FigDebugAssert3();
          LOBYTE(v12) = 0;
          goto LABEL_46;
        }
        unint64_t v23 = BWPixelBufferDimensionsFromSampleBuffer(v12);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"green_size"), "objectForKeyedSubscript:", @"width"), "intValue") != v23)
        {
LABEL_79:
          LOBYTE(v12) = 0;
          goto LABEL_80;
        }
        if (__PAIR64__(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"green_size"), "objectForKeyedSubscript:", @"height"), "intValue"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"raw_size"), "objectForKeyedSubscript:", @"width"), "intValue")) == v23&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"raw_size"), "objectForKeyedSubscript:", @"height"), "intValue") == HIDWORD(v23))
        {
          v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA743E0);
          if (v24)
          {
            CVImageBufferRef v25 = CMSampleBufferGetImageBuffer(v24);
            if (v25)
            {
              CVImageBufferRef v26 = v25;
              id v27 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74400);
              if (v27)
              {
                CVImageBufferRef v28 = CMSampleBufferGetImageBuffer(v27);
                if (v28)
                {
                  CVImageBufferRef v29 = v28;
                  CFTypeRef v16 = 0;
                  CVImageBufferRef v14 = 0;
                  goto LABEL_30;
                }
              }
            }
          }
          goto LABEL_78;
        }
      }
      LOBYTE(v12) = 0;
      ImageBuffer = 0;
      goto LABEL_62;
    case 5:
      v30 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74360);
      if (v30)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v30);
        if (ImageBuffer)
        {
          CFTypeRef v16 = 0;
          CVImageBufferRef v14 = 0;
          goto LABEL_28;
        }
        goto LABEL_81;
      }
      goto LABEL_78;
    case 4:
      uint64_t v9 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA74380);
      if (v9)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v9);
        if (ImageBuffer)
        {
          v11 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA743C0);
          v12 = v11;
          if (v11)
          {
            CVImageBufferRef v13 = CMSampleBufferGetImageBuffer(v11);
            if (v13)
            {
              CVImageBufferRef v14 = v13;
              CFTypeRef v15 = CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53038], 0);
              if (v15)
              {
                CFTypeRef v16 = v15;
LABEL_28:
                CVImageBufferRef v29 = 0;
                CVImageBufferRef v26 = 0;
                goto LABEL_30;
              }
            }
            goto LABEL_78;
          }
LABEL_76:
          fig_log_get_emitter();
          uint64_t v42 = v2;
          LODWORD(v41) = 0;
          FigDebugAssert3();
LABEL_80:
          ImageBuffer = 0;
          goto LABEL_46;
        }
        goto LABEL_81;
      }
LABEL_78:
      fig_log_get_emitter();
      uint64_t v42 = v2;
      LODWORD(v41) = 0;
      FigDebugAssert3();
      goto LABEL_79;
  }
  CFTypeRef v16 = 0;
  CVImageBufferRef v14 = 0;
  CVImageBufferRef v29 = 0;
  CVImageBufferRef v26 = 0;
  ImageBuffer = 0;
LABEL_30:
  v12 = (opaqueCMSampleBuffer *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v12)
  {
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    FigDebugAssert3();
LABEL_67:
    ImageBuffer = 0;
    goto LABEL_68;
  }
  if ([*(id *)(a1 + 104) depthDataType] != 9)
  {
    CFDictionaryRef v31 = (const __CFDictionary *)[(opaqueCMSampleBuffer *)v12 objectForKeyedSubscript:*MEMORY[0x1E4F54360]];
    if (!v31)
    {
      fig_log_get_emitter();
      uint64_t v42 = v2;
      LODWORD(v41) = 0;
LABEL_66:
      FigDebugAssert3();
      LOBYTE(v12) = 0;
      goto LABEL_67;
    }
    if (!CGRectMakeWithDictionaryRepresentation(v31, &rect)) {
      goto LABEL_65;
    }
  }
  v32 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1EFA744E0);
  if (!v32)
  {
LABEL_65:
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    goto LABEL_66;
  }
  v33 = ImageBuffer;
  CVImageBufferRef v34 = CMSampleBufferGetImageBuffer(v32);
  if (!v34)
  {
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    LOBYTE(v12) = 0;
    goto LABEL_57;
  }
  CVImageBufferRef v35 = v34;
  v36 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v44, 0x1EFA74500);
  if (v36)
  {
    v12 = CMSampleBufferGetImageBuffer(v36);
    if (!v12)
    {
      fig_log_get_emitter();
      uint64_t v42 = v2;
      LODWORD(v41) = 0;
      FigDebugAssert3();
LABEL_57:
      ImageBuffer = 0;
LABEL_59:
      a2 = v44;
LABEL_68:
      unint64_t v7 = 0x1E96A8000;
      goto LABEL_69;
    }
  }
  else
  {
    v12 = 0;
  }
  CVImageBufferRef v43 = v26;
  ImageBuffer = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", @"Depth"), "livePixelBufferPool"), "newPixelBuffer");
  if (!ImageBuffer)
  {
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    LOBYTE(v12) = 0;
    goto LABEL_59;
  }
  CVImageBufferRef v37 = v29;
  unint64_t v7 = 0x1E96A8000uLL;
  [*(id *)(a1 + 120) setImageSampleBuffer:v44];
  [*(id *)(a1 + 120) setRawImagePixelBufferBuffer:v33];
  [*(id *)(a1 + 120) setFocusPixelBuffer:v14];
  [*(id *)(a1 + 120) setFocusPixelMetadata:v16];
  objc_msgSend(*(id *)(a1 + 120), "setFocusPixelValidArea:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  [*(id *)(a1 + 120) setPersonSegmentationPixelBuffer:v35];
  [*(id *)(a1 + 120) setPersonSegmentationConfidencePixelBuffer:v12];
  [*(id *)(a1 + 120) setOutDisparity:ImageBuffer];
  [*(id *)(a1 + 120) setH0:v43];
  [*(id *)(a1 + 120) setH1:v37];
  if ([*(id *)(a1 + 120) process])
  {
    LOBYTE(v12) = 0;
    a2 = v44;
LABEL_69:
    v5 = (double *)MEMORY[0x1E4F1DB20];
    goto LABEL_46;
  }
  int v38 = [*(id *)(a1 + 120) finishProcessing];
  v5 = (double *)MEMORY[0x1E4F1DB20];
  if (!v38)
  {
    a2 = v44;
    -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:](a1, v44);
    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v44, ImageBuffer, (CFTypeRef *)(a1 + 128), (CMSampleBufferRef *)&cf);
    if (CopyWithNewPixelBuffer)
    {
      int v40 = CopyWithNewPixelBuffer;
      fig_log_get_emitter();
      uint64_t v42 = v2;
      LODWORD(v41) = v40;
      FigDebugAssert3();
    }
    else
    {
      -[BWStillImageFocusPixelDisparityNode _attachDepthMetadataToSampleBuffer:](a1, v44);
      BWSampleBufferSetAttachedMedia(v44, @"Depth", (uint64_t)cf);
    }
    LOBYTE(v12) = 1;
    goto LABEL_46;
  }
  LOBYTE(v12) = 0;
LABEL_62:
  a2 = v44;
LABEL_46:
  objc_msgSend(*(id *)(a1 + *(int *)(v7 + 4016)), "setImageSampleBuffer:", 0, v41, v42);
  [*(id *)(a1 + *(int *)(v7 + 4016)) setRawImagePixelBufferBuffer:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setFocusPixelBuffer:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setFocusPixelMetadata:0];
  objc_msgSend(*(id *)(a1 + *(int *)(v7 + 4016)), "setFocusPixelValidArea:", *v5, v5[1], v5[2], v5[3]);
  [*(id *)(a1 + *(int *)(v7 + 4016)) setPersonSegmentationPixelBuffer:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setPersonSegmentationConfidencePixelBuffer:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setOutDisparity:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setH0:0];
  [*(id *)(a1 + *(int *)(v7 + 4016)) setH1:0];
  if (cf) {
    CFRelease(cf);
  }
  if (ImageBuffer) {
    CFRelease(ImageBuffer);
  }
  if ((v12 & 1) == 0) {
    -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:](a1, a2);
  }
}

- (void)_removeConsumedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74380);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74360);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA743C0);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA744E0);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74500);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA743E0);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA74400);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
}

- (void)processorOptionsForProcessorVersion:(uint64_t)a1
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  objc_super v4 = +[FigCaptureCameraParameters sharedInstance];
  id v5 = -[FigCaptureCameraParameters focusPixelDisparityParametersForPortType:sensorIDString:](v4, "focusPixelDisparityParametersForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  if (a2 < 3)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v7 = (void *)[v5 objectForKeyedSubscript:@"sizes"];
    if (!v7)
    {
      fig_log_get_emitter();
      goto LABEL_15;
    }
    int v8 = v7;
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"disparity_size"), "objectForKeyedSubscript:", @"width"), "intValue");
    if (v9 != [*(id *)(a1 + 104) depthDataOutputDimensions]) {
      return 0;
    }
    int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"disparity_size"), "objectForKeyedSubscript:", @"height"), "intValue");
    if (v10 != (unint64_t)[*(id *)(a1 + 104) depthDataOutputDimensions] >> 32) {
      return 0;
    }
    uint64_t v11 = -[FigCaptureCameraParameters focusPixelsPatternsForPortType:sensorIDString:](v4, "focusPixelsPatternsForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
    if (!v11) {
      return 0;
    }
  }
  uint64_t v18 = [*(id *)(a1 + 112) portType];
  v19[0] = [*(id *)(a1 + 112) cameraInfo];
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  if (!v12)
  {
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    return 0;
  }
  uint64_t v13 = *MEMORY[0x1E4F53560];
  v16[0] = *MEMORY[0x1E4F535B0];
  v16[1] = v13;
  v17[0] = v6;
  v17[1] = v12;
  CVImageBufferRef v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  [v14 setObject:v11 forKeyedSubscript:@"Patterns"];
  return v14;
}

- (void)_attachDepthMetadataToSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v4
      && ((v5 = -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "focusPixelDisparityVersionForPortType:sensorIDString:", [*(id *)(a1 + 112) portType], objc_msgSend(*(id *)(a1 + 112), "sensorIDString")), !-[FigCaptureCameraParameters portraitTapToRefocusPrevented](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "portraitTapToRefocusPrevented"))? (v6 = -15536): (v6 = -14536), v5 <= 1 ? (v7 = 30000) : (v7 = v6), (CurrentMajorVersion = FigDepthDataGetCurrentMajorVersion(), !*(unsigned char *)(a1 + 212))? (v9 = objc_msgSend(*(id *)(a1 + 120), "disparityQuality")): (v9 = 1), CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0)&& (size = (CGSize)*MEMORY[0x1E4F1DB30], (CFDictionaryRef v10 = (const __CFDictionary *)CMGetAttachment(a2,
                                            @"OriginalCameraIntrinsicMatrixReferenceDimensions",
                                            0)) != 0)))
    {
      CFDictionaryRef v11 = v10;
      if (CGSizeMakeWithDictionaryRepresentation(v10, &size))
      {
        CFTypeRef v12 = CMGetAttachment(a2, @"OriginalCameraIntrinsicMatrix", 0);
        if (v12)
        {
          CFTypeRef v13 = v12;
          uint64_t v14 = [NSNumber numberWithInt:(unsigned __int16)(v7 + v5) | (CurrentMajorVersion << 16)];
          [v4 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F558B0]];
          uint64_t v15 = [NSNumber numberWithInt:v9];
          [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F558A8]];
          [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F55870]];
          [v4 setObject:&unk_1EFAFDE30 forKeyedSubscript:*MEMORY[0x1E4F55860]];
          LODWORD(v16) = *(_DWORD *)(a1 + 208);
          uint64_t v17 = [NSNumber numberWithFloat:v16];
          [v4 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F558A0]];
          [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F55878]];
          [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F55880]];
          uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a1 + 144 length:64];
          [v4 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F55868]];
          CMSetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F55B40], v4, 1u);
LABEL_17:

          return;
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_17;
  }
}

@end