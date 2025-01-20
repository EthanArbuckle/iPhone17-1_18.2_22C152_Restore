@interface BWFlexGTCNode
+ (void)initialize;
- (BWFlexGTCNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 metalCommandQueue:(id)a5;
- (void)_releaseResources;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWFlexGTCNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (BWFlexGTCNode)initWithNodeConfiguration:(id)a3 sensorConfigurationsByPortType:(id)a4 metalCommandQueue:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BWFlexGTCNode;
  v8 = [(BWNode *)&v23 init];
  v9 = v8;
  if (v8)
  {
    v8->_enableHighlightAdjustment = 1;
    v8->_commandQueue = (MTLCommandQueue *)a5;
    if (a3 && (v9->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3, a4))
    {
      v9->_sensorIDDictionaryByPortType = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a4, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v10 = [a4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(a4);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_sensorIDDictionaryByPortType, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i)), "sensorIDDictionary"), *(void *)(*((void *)&v19 + 1) + 8 * i));
          }
          uint64_t v11 = [a4 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v11);
      }
      v14 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v9];
      v15 = objc_alloc_init(BWVideoFormatRequirements);
      v16 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB02978];
      objc_msgSend(v16, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, 3));
      [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:v16];
      [(BWNodeInput *)v14 setFormatRequirements:v15];
      [(BWNodeInput *)v14 setPassthroughMode:1];
      [(BWNode *)v9 addInput:v14];
      v17 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
      [(BWNodeOutput *)v17 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeOutput *)v17 setPassthroughMode:1];
      [(BWNode *)v9 addOutput:v17];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v9;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWFlexGTCNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWFlexGTCNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[17] = 0;
    a1[12] = 0;

    a1[13] = 0;
    a1[14] = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWFlexGTCNode _releaseResources]((id *)&self->super.super.isa);
  v5.receiver = self;
  v5.super_class = (Class)BWFlexGTCNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v6.receiver = self;
  v6.super_class = (Class)BWFlexGTCNode;
  [(BWNode *)&v6 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_metalContext
    && ((uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()]) == 0
     || (v4 = (FigMetalContext *)[objc_alloc(MEMORY[0x1E4F55F60]) initWithbundle:v3 andOptionalCommandQueue:0], (self->_metalContext = v4) == 0))|| !self->_cmiFlexGTCStage&& (objc_super v5 = (CMIFlexGTCStage *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55ED0]), "initWithOptionalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue")), (self->_cmiFlexGTCStage = v5) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_49;
  }
  sbuf = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA4EB60);
  if (!sbuf) {
    goto LABEL_42;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (!ImageBuffer) {
    goto LABEL_49;
  }
  objc_super v6 = ImageBuffer;
  v7 = a3;
  CVImageBufferRef v8 = CMSampleBufferGetImageBuffer(a3);
  if (!v8) {
    goto LABEL_49;
  }
  v9 = v8;
  keCGFloat y = (const __CFString *)*MEMORY[0x1E4F53070];
  uint64_t v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v10) {
    goto LABEL_49;
  }
  uint64_t v11 = v10;
  int v80 = 1;
  uint64_t v79 = 0x424800003C03126FLL;
  if (!self->_enableHighlightAdjustment) {
    goto LABEL_34;
  }
  uint64_t v12 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F53E68]];
  if (!v12) {
    goto LABEL_49;
  }
  [v12 floatValue];
  float v14 = v13;
  v15 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53D48]];
  if (!v15
    || ([v15 floatValue],
        float v17 = v16,
        v18 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]],
        long long v19 = (void *)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F538C8]],
        (long long v20 = (void *)[v19 objectForKeyedSubscript:*MEMORY[0x1E4F538F8]]) == 0))
  {
LABEL_49:
    fig_log_get_emitter();
    uint64_t v67 = v4;
    LODWORD(v66) = 0;
    goto LABEL_50;
  }
  long long v21 = v20;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v75 objects:v81 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v76;
    uint64_t v25 = *MEMORY[0x1E4F54180];
    float v26 = 0.0;
    CGSize v72 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    CGPoint v73 = (CGPoint)*MEMORY[0x1E4F1DB20];
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v76 != v24) {
          objc_enumerationMutation(v21);
        }
        v28 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        rect.origin = v73;
        rect.size = v72;
        if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v28 objectForKeyedSubscript:v25], &rect))
        {
          float v26 = v26 + rect.size.height * rect.size.width;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v75 objects:v81 count:16];
    }
    while (v23);
  }
  else
  {
    float v26 = 0.0;
  }
  if (v14 < 2.21)
  {
    v7 = a3;
    if (v14 >= 1.67)
    {
      if (v26 < 0.0195 || v17 < 0.37)
      {
        float v29 = 50.0;
        if (v26 < 0.01 || v17 < 0.65) {
          goto LABEL_33;
        }
      }
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  v7 = a3;
  if (v17 < 2.9)
  {
LABEL_31:
    float v29 = 50.0;
    goto LABEL_33;
  }
  float v29 = 5.0;
  if (v26 < 0.0225)
  {
    if (v26 >= 0.0197)
    {
LABEL_32:
      float v29 = 15.0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
LABEL_33:
  LODWORD(v79) = 994352038;
  *((float *)&v79 + 1) = v29;
LABEL_34:
  CFTypeRef v30 = CMGetAttachment(v7, @"StillSettings", 0);
  if (!v30) {
    goto LABEL_46;
  }
  v31 = (void *)v30;
  size_t Width = CVPixelBufferGetWidth(v9);
  size_t Height = CVPixelBufferGetHeight(v9);
  size_t v34 = CVPixelBufferGetWidth(v6);
  size_t v35 = CVPixelBufferGetHeight(v6);
  CFTypeRef v36 = CMGetAttachment(sbuf, key, 0);
  if (!v36 || !self->_cmiFlexGTCStage) {
    goto LABEL_46;
  }
  v37 = v36;
  uint64_t v38 = [v31 requestedSettings];
  if (!v38) {
    goto LABEL_42;
  }
  v39 = (void *)v38;
  double FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  CGFloat v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  double v47 = (double)[v39 outputWidth];
  double v48 = v47 / (double)[v39 outputHeight];
  FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((unint64_t)(double)Width, (unint64_t)(double)Height, FinalCropRect, v42, v44, v46, v48);
  CGFloat x = v83.origin.x;
  CGFloat y = v83.origin.y;
  CGFloat v51 = v83.size.width;
  CGFloat v52 = v83.size.height;
  if (CGRectIsNull(v83)
    || (double v53 = FigCaptureMetadataUtilitiesGetFinalCropRect(),
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((unint64_t)(double)v34, (unint64_t)(double)v35, v53, v54, v55, v56, v48), CGFloat v57 = v84.origin.x, v58 = v84.origin.y, v59 = v84.size.width, v60 = v84.size.height, CGRectIsNull(v84)))
  {
LABEL_46:
    fig_log_get_emitter();
    uint64_t v67 = v4;
    LODWORD(v66) = 0;
LABEL_50:
    FigDebugAssert3();
    goto LABEL_42;
  }
  cmiFlexGTCStage = self->_cmiFlexGTCStage;
  v85.origin.CGFloat x = x;
  v85.origin.CGFloat y = y;
  v85.size.width = v51;
  v85.size.height = v52;
  CGRect v86 = CGRectIntegral(v85);
  double v62 = v86.origin.x;
  double v63 = v86.origin.y;
  double v64 = v86.size.width;
  double v65 = v86.size.height;
  v86.origin.CGFloat x = v57;
  v86.origin.CGFloat y = v58;
  v86.size.width = v59;
  v86.size.height = v60;
  CGRect v87 = CGRectIntegral(v86);
  if (!-[CMIFlexGTCStage computeFlexGTCWithSDRImage:gainMap:gainMapMetadata:config:cropRect:gainMapCropRect:](cmiFlexGTCStage, "computeFlexGTCWithSDRImage:gainMap:gainMapMetadata:config:cropRect:gainMapCropRect:", v9, v6, v37, &v79, v62, v63, v64, v65, v87.origin.x, v87.origin.y, v87.size.width, v87.size.height))CMSetAttachment(sbuf, key, v37, 1u); {
LABEL_42:
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v66, v67);
}

@end