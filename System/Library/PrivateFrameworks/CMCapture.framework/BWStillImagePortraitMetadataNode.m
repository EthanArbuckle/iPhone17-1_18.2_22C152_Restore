@interface BWStillImagePortraitMetadataNode
+ (void)initialize;
- (BWStillImagePortraitMetadataNode)initWithNodeConfiguration:(id)a3 sdofRenderingVersion:(int)a4 sensorConfigurationsByPortType:(id)a5 defaultPortType:(id)a6 defaultZoomFactor:(float)a7;
- (uint64_t)_attachPortraitLightingEffectMetadataToDepthMetadata:(uint64_t)result portType:(void *)a2;
- (uint64_t)_loadSDOFRenderingBundle;
- (uint64_t)_loadSDOFRenderingTuningParametersForPortType:(float)a3 zoomFactorForPortType:;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWStillImagePortraitMetadataNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (BWStillImagePortraitMetadataNode)initWithNodeConfiguration:(id)a3 sdofRenderingVersion:(int)a4 sensorConfigurationsByPortType:(id)a5 defaultPortType:(id)a6 defaultZoomFactor:(float)a7
{
  v20.receiver = self;
  v20.super_class = (Class)BWStillImagePortraitMetadataNode;
  v12 = [(BWNode *)&v20 init];
  v13 = v12;
  if (v12)
  {
    if (a4 && a5)
    {
      v12->_sdofRenderingVersion = a4;
      v12->_sensorConfigurationsByPortType = (NSDictionary *)a5;
      v13->_defaultPortType = (NSString *)a6;
      v13->_defaultZoomFactor = a7;
      if (FigCapturePlatformSupportsUniversalCompression()) {
        v14 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB04178, [a3 maxLossyCompressionLevel]);
      }
      else {
        v14 = &unk_1EFB04178;
      }
      v15 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v13];
      v16 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v16 setSupportedPixelFormats:v14];
      [(BWNodeInput *)v15 setFormatRequirements:v16];

      [(BWNodeInput *)v15 setPassthroughMode:1];
      [(BWNode *)v13 addInput:v15];

      v17 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v13];
      v18 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v17 setFormatRequirements:v18];

      [(BWNodeOutput *)v17 setPassthroughMode:1];
      [(BWNode *)v13 addOutput:v17];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v13;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImagePortraitMetadataNode;
  [(BWNode *)&v3 dealloc];
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImagePortraitMetadataNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (-[BWStillImagePortraitMetadataNode _loadSDOFRenderingBundle]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadSDOFRenderingBundle
{
  uint64_t v1 = a1;
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 96);
    if (v2 >= 5) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = v2;
    }
    v4 = BWLoadProcessorBundle(@"SDOFRendering", v3);
    if (v4)
    {
      *(void *)(v1 + 128) = [v4 classNamed:@"FigSDOFRenderingTuningParameters"];
      uint64_t v1 = -[BWStillImagePortraitMetadataNode _loadSDOFRenderingTuningParametersForPortType:zoomFactorForPortType:](v1, *(void **)(v1 + 112), *(float *)(v1 + 120));
      if (v1)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      return 4294954510;
    }
  }
  return v1;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (BWSampleBufferGetAttachedMedia(a3, @"Depth"))
  {
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F55B40];
    v7 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B40], 0), "mutableCopy");
    if (!v7) {
      goto LABEL_23;
    }
    CFTypeRef v8 = CMGetAttachment(a3, @"StillSettings", 0);
    if (!v8) {
      goto LABEL_23;
    }
    v9 = (void *)v8;
    v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if ([(NSDictionary *)self->_sensorConfigurationsByPortType count] < 2) {
      defaultPortType = self->_defaultPortType;
    }
    else {
      defaultPortType = (NSString *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    }
    int64_t v12 = BWPixelBufferDimensionsFromSampleBuffer(a3);
    long long v27 = *MEMORY[0x1E4F1DB20];
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    if (!FigCFDictionaryGetCGRectIfPresent())
    {
      long long v27 = 0uLL;
      __asm { FMOV            V0.2D, #1.0 }
      long long v28 = _Q0;
    }
    FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v12, v12 >> 32, *(CGFloat *)&v27, *((CGFloat *)&v27 + 1), *(CGFloat *)&v28, *((CGFloat *)&v28 + 1), (double)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputWidth")/ (double)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputHeight"));
    double height = v29.size.height;
    if (CGRectIsNull(v29)) {
      goto LABEL_23;
    }
    float v19 = (float)objc_msgSend((id)objc_msgSend(v9, "requestedSettings"), "outputHeight") / height;
    int v20 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F54148]), "intValue");
    if (v20) {
      float v19 = v19 / (float)((float)v20 * 0.5);
    }
    objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE8]), "floatValue");
    if (v21 == 0.0) {
      float v21 = 1.0;
    }
    float v22 = v19 * v21;
    float v23 = v22 >= 1.0 ? v22 : 1.0;
    if ([(NSString *)defaultPortType isEqualToString:self->_currentPortType]
      && v23 == self->_currentZoomFactorForSDOFRenderingParameters
      || !-[BWStillImagePortraitMetadataNode _loadSDOFRenderingTuningParametersForPortType:zoomFactorForPortType:]((uint64_t)self, defaultPortType, v23))
    {
      BWPortraitUtilitiesAttachLumaNoiseLevelToSampleBuffer(a3, self->_sdofRenderingParameters);
      BWPortraitUtilitiesAttachSyntheticFocusRectangleToSampleBuffer(a3);
      uint64_t v24 = -[FigSDOFRenderingTuningParameters encodeParametersForSampleBuffer:captureType:](self->_sdofRenderingTuningParameters, "encodeParametersForSampleBuffer:captureType:", a3, objc_msgSend((id)objc_msgSend(v9, "captureSettings"), "captureType") == 11);
      [v7 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F55790]];
      v25 = NSNumber;
      [(FigSDOFRenderingTuningParameters *)self->_sdofRenderingTuningParameters simulatedAperture];
      uint64_t v26 = objc_msgSend(v25, "numberWithFloat:");
      [v7 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F55798]];
      -[BWStillImagePortraitMetadataNode _attachPortraitLightingEffectMetadataToDepthMetadata:portType:]((uint64_t)self, v7);
      CMSetAttachment(a3, v6, v7, 1u);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55C10], (CFTypeRef)[NSNumber numberWithInt:self->_sdofRenderingVersion], 1u);
    }
    else
    {
LABEL_23:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    v7 = 0;
  }

  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
}

- (uint64_t)_loadSDOFRenderingTuningParametersForPortType:(float)a3 zoomFactorForPortType:
{
  if (result)
  {
    uint64_t v5 = result;
    id v6 = *(id *)(result + 136);

    *(void *)(v5 + 136) = 0;
    *(_DWORD *)(v5 + 144) = 0;

    *(void *)(v5 + 152) = 0;
    *(void *)(v5 + 160) = 0;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 104), "objectForKeyedSubscript:", a2), "sensorIDDictionary");
    *(float *)&double v8 = a3;
    id v9 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v7 zoomFactor:v8];
    *(void *)(v5 + 152) = v9;
    if (v9
      && (uint64_t v10 = [objc_alloc(*(Class *)(v5 + 128)) initWithTuningDictionary:*(void *)(v5 + 152)],
          (*(void *)(v5 + 160) = v10) != 0))
    {
      id v11 = a2;
      result = 0;
      *(void *)(v5 + 136) = v11;
      *(float *)(v5 + 144) = a3;
    }
    else
    {
      return 4294954510;
    }
  }
  return result;
}

- (uint64_t)_attachPortraitLightingEffectMetadataToDepthMetadata:(uint64_t)result portType:(void *)a2
{
  if (result)
  {
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "objectForKeyedSubscript:"), "sensorIDDictionary"), "objectForKeyedSubscript:", @"PortraitLightingParameters"), "objectForKeyedSubscript:", @"effectStrength"), "doubleValue");
    if (v3 != 0.0)
    {
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithDouble:");
      uint64_t v5 = *MEMORY[0x1E4F55AB8];
      return [a2 setObject:v4 forKeyedSubscript:v5];
    }
  }
  return result;
}

@end