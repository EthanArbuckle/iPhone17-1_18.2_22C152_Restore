@interface BWSWFRProcessorController
+ (BOOL)usesCustomProcessingFlow;
+ (uint64_t)_nrfVersionForSWFRVersion:(uint64_t)a1;
- (BWSWFRProcessorController)initWithConfiguration:(id)a3;
- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 metadata:(int)a5 processingFlags:(CFTypeRef *)a6 formatDescriptionInOut:;
- (id)metalImageBufferProcessor;
- (id)processorNewInferences:(id)a3;
- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5;
- (int)prepare;
- (int)process;
- (uint64_t)_addFrame:(uint64_t)a3 type:;
- (uint64_t)_loadSetupAndPrepareProcessor;
- (unsigned)outputPixelFormat;
- (void)dealloc;
- (void)input:(id)a3 addAmbientFrame:(opaqueCMSampleBuffer *)a4;
- (void)input:(id)a3 addFlashFrame:(opaqueCMSampleBuffer *)a4;
- (void)reset;
@end

@implementation BWSWFRProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWSWFRProcessorController)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWSWFRProcessorController;
  v4 = [(BWStillImageProcessorController *)&v8 initWithName:@"SoftwareFlashRendering" type:15 configuration:a3];
  if (v4)
  {
    v4->_version = [a3 version];
    v4->_outputPixelFormat = FigCaptureCompressedPixelFormatForPixelFormat(1751527984, 4, [a3 lossyCompressionLevel]);
    v5 = (void *)MEMORY[0x1A6272C70]();
    int SetupAndPrepare = -[BWSWFRProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
    if (SetupAndPrepare)
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 64))
    {
      return 0;
    }
    else
    {
      unsigned int v2 = +[BWSWFRProcessorController _nrfVersionForSWFRVersion:]((uint64_t)BWSWFRProcessorController, *(_DWORD *)(result + 56));
      if (v2 == [+[FigCaptureCameraParameters sharedInstance] nrfVersion])
      {
        uint64_t v3 = *(unsigned int *)(v1 + 56);
        v4 = objc_msgSend((id)objc_msgSend((id)v1, "configuration"), "sensorConfigurationsByPortType");
        uint64_t v5 = objc_msgSend((id)objc_msgSend((id)v1, "configuration"), "metalCommandQueue");
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __58__BWSWFRProcessorController__loadSetupAndPrepareProcessor__block_invoke;
        v6[3] = &unk_1E5C26228;
        v6[4] = v1;
        return BWLoadCreateAndSetupMetalImageBufferProcessor(@"NRF", v2, @"CMI", @"SoftwareFlashRendering", v3, (uint64_t)&unk_1EFB6FF08, 1, v4, v5, (uint64_t)v6, (void *)(v1 + 64));
      }
      else
      {
        return 4294954516;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  [(BWSWFRProcessorController *)self reset];

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription) {
    CFRelease(demosaicedRawFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWSWFRProcessorController;
  [(BWStillImageProcessorController *)&v5 dealloc];
}

- (void)input:(id)a3 addFlashFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWSWFRProcessorController _addFrame:type:]((uint64_t)self, a4, 1);
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (uint64_t)_addFrame:(uint64_t)a3 type:
{
  if (!a1) {
    return 0;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (ImageBuffer && (v7 = ImageBuffer, (CFTypeRef v8 = CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0))
  {
    CFTypeRef v9 = v8;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(sbuf, 0x1EFA74640);
    uint64_t v11 = BWSampleBufferGetAttachedMedia(sbuf, 0x1EFA74660);
    if (AttachedMedia)
    {
      v12 = (opaqueCMSampleBuffer *)v11;
      CVImageBufferRef v13 = CMSampleBufferGetImageBuffer(AttachedMedia);
      CFTypeRef v14 = CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53058], 0);
      id v15 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISoftwareFlashRenderingFrameParamsV%d", *(unsigned int *)(a1 + 56))));
      [v15 setLscGains:v13];
      [v15 setLscParams:v14];
      if (v12) {
        [v15 setFlashLSCGains:CMSampleBufferGetImageBuffer(v12)];
      }
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v16 = [*(id *)(a1 + 64) addFrame:v7 metadata:v9 frameType:a3 frameParams:v15];
  }
  else
  {
    id v15 = 0;
    uint64_t v16 = 4294954516;
  }

  return v16;
}

- (void)input:(id)a3 addAmbientFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWSWFRProcessorController _addFrame:type:]((uint64_t)self, a4, 0);
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (void)reset
{
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  v6 = [(BWStillImageProcessorControllerRequest *)[BWSWFRProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = -12786;
  }
  if (a5) {
    *a5 = v7;
  }
  return v6;
}

- (int)prepare
{
  uint64_t v3 = [(BWStillImageProcessorController *)self currentRequest];
  v4 = (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)v3 input] type:1];
  if (v4)
  {
    [(CMISoftwareFlashRenderingProcessor *)self->_processor setOutputImagePixelBuffer:v4];
    -[CMISoftwareFlashRenderingProcessor setOutputImageMetadata:](self->_processor, "setOutputImageMetadata:", [MEMORY[0x1E4F1CA60] dictionary]);
    if ([(BWStillImageProcessingSettings *)[(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] stillImageSettings] processingSettings] provideDemosaicedRaw])
    {
      -[CMISoftwareFlashRenderingProcessor setLinearOutputImageMetadata:](self->_processor, "setLinearOutputImageMetadata:", [MEMORY[0x1E4F1CA60] dictionary]);
    }
    int v5 = [(CMISoftwareFlashRenderingProcessor *)self->_processor prepareToProcess:0];
  }
  else
  {
    int v5 = -12786;
  }
  CVPixelBufferRelease(v4);
  CVPixelBufferRelease(0);
  return v5;
}

- (int)process
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BWStillImageProcessorController *)self currentRequest];
  int v4 = [(CMISoftwareFlashRenderingProcessor *)self->_processor process];
  if (dword_1EB4C5590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4
    || (CMAttachmentBearerRef v6 = -[BWSWFRProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:metadata:processingFlags:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame], (__CVBuffer *)[(CMISoftwareFlashRenderingProcessor *)self->_processor outputImagePixelBuffer], (void *)[(CMISoftwareFlashRenderingProcessor *)self->_processor outputImageMetadata], 0, (CFTypeRef *)&self->_outputFormatDescription)) == 0)
  {
    CFTypeRef v9 = (const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v11 = objc_msgSend((id)CMGetAttachment(v9, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
    CMSetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame], v10, v11, 1u);

    [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self didFinishProcessingSampleBuffer:[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame] type:1 processorInput:[(BWStillImageProcessorControllerRequest *)v3 input] err:0];
  }
  else
  {
    int v7 = v6;
    [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self didFinishProcessingSampleBuffer:v6 type:1 processorInput:[(BWStillImageProcessorControllerRequest *)v3 input] err:0];
    CFRelease(v7);
  }
  return 0;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(void *)a4 metadata:(int)a5 processingFlags:(CFTypeRef *)a6 formatDescriptionInOut:
{
  if (result)
  {
    CMAttachmentBearerRef v6 = 0;
    CMAttachmentBearerRef target = 0;
    int v7 = -12780;
    if (a2 && a3)
    {
      int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a6, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        int v7 = CopyWithNewPixelBuffer;
        CMAttachmentBearerRef v6 = 0;
      }
      else
      {
        CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F53070];
        CMAttachmentBearerRef v6 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
        if ([a4 count]) {
          [v6 addEntriesFromDictionary:a4];
        }
        CMSetAttachment(target, v11, v6, 1u);
        if (a5)
        {
          uint64_t v12 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue") | a5;
          CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v12], 1u);
        }
        int v7 = 0;
      }
    }

    result = target;
    if (v7)
    {
      if (target)
      {
        CFRelease(target);
        return 0;
      }
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_processor;
}

- (id)processorNewInferences:(id)a3
{
  id v4 = objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMISoftwareFlashRenderingInferencesV%d", self->_version)));
  [v4 setStatus:0];
  int v5 = (void *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] delegate] processorController:self newInferencesForProcessorInput:[(BWStillImageProcessorControllerRequest *)[(BWStillImageProcessorController *)self currentRequest] input]];
  CMAttachmentBearerRef v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 inferenceBufferForAttachedMediaKey:0x1EFA6A200];
    if (v7) {
      [v4 setPersonMask:v7];
    }
    uint64_t v8 = [v6 inferenceBufferForAttachedMediaKey:@"PersonSemanticsSkin"];
    if (v8) {
      [v4 setSkinMatte:v8];
    }
    uint64_t v9 = [v6 inferenceBufferForAttachedMediaKey:0x1EFA745A0];
    if (v9) {
      [v4 setSkyMatte:v9];
    }
  }
  else
  {
    [v4 setStatus:4294954516];
  }

  return v4;
}

+ (uint64_t)_nrfVersionForSWFRVersion:(uint64_t)a1
{
  self;
  if ((a2 - 1) > 1) {
    return 0xFFFFFFFFLL;
  }
  LODWORD(result) = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
  if ((result - 5) < 0xFFFFFFFE) {
    return 0xFFFFFFFFLL;
  }
  else {
    return result;
  }
}

uint64_t __58__BWSWFRProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end