@interface BWColorConstancyProcessorController
+ (BOOL)usesCustomProcessingFlow;
- (BWColorConstancyProcessorController)initWithConfiguration:(id)a3;
- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(__CVBuffer *)a4 confidenceMap:(void *)a5 metadata:(int)a6 processingFlags:(CFTypeRef *)a7 formatDescriptionInOut:;
- (id)metalImageBufferProcessor;
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

@implementation BWColorConstancyProcessorController

+ (BOOL)usesCustomProcessingFlow
{
  return 0;
}

- (BWColorConstancyProcessorController)initWithConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWColorConstancyProcessorController;
  v4 = [(BWStillImageProcessorController *)&v8 initWithName:@"ColourConstancy" type:17 configuration:a3];
  if (v4)
  {
    v4->_version = [a3 version];
    v4->_outputPixelFormat = FigCaptureCompressedPixelFormatForPixelFormat(1751527984, 4, [a3 lossyCompressionLevel]);
    v5 = (void *)MEMORY[0x1A6272C70]();
    int SetupAndPrepare = -[BWColorConstancyProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
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
    v1 = (void *)result;
    if (!*(void *)(result + 64))
    {
      uint64_t v2 = *(unsigned int *)(result + 56);
      v3 = objc_msgSend((id)objc_msgSend((id)result, "configuration"), "sensorConfigurationsByPortType");
      uint64_t v4 = objc_msgSend((id)objc_msgSend(v1, "configuration"), "metalCommandQueue");
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __68__BWColorConstancyProcessorController__loadSetupAndPrepareProcessor__block_invoke;
      v5[3] = &unk_1E5C26228;
      v5[4] = v1;
      result = BWLoadCreateAndSetupMetalImageBufferProcessor(@"ColourConstancy", v2, @"CMI", @"ColourConstancy", v2, (uint64_t)&unk_1EFB6FE48, 1, v3, v4, (uint64_t)v5, v1 + 8);
      if (result) {
        return result;
      }
      objc_msgSend((id)v1[8], "setClippingRecoveryEnabled:", objc_msgSend((id)objc_msgSend(v1, "configuration"), "clippingRecoveryEnabled"));
      objc_msgSend((id)v1[8], "setSaturationBoostEnabled:", objc_msgSend((id)objc_msgSend(v1, "configuration"), "saturationBoostEnabled"));
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  [(BWColorConstancyProcessorController *)self reset];

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  confidenceMapFormatDescription = self->_confidenceMapFormatDescription;
  if (confidenceMapFormatDescription) {
    CFRelease(confidenceMapFormatDescription);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWColorConstancyProcessorController;
  [(BWStillImageProcessorController *)&v5 dealloc];
}

- (void)input:(id)a3 addFlashFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWColorConstancyProcessorController _addFrame:type:]((uint64_t)self, a4, 1);
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
    v11 = AttachedMedia;
    if (AttachedMedia)
    {
      CVImageBufferRef v12 = CMSampleBufferGetImageBuffer(AttachedMedia);
      CFTypeRef v13 = CMGetAttachment(v11, (CFStringRef)*MEMORY[0x1E4F53058], 0);
      v11 = (opaqueCMSampleBuffer *)objc_alloc_init(NSClassFromString((NSString *)objc_msgSend(NSString, "stringWithFormat:", @"CMIColourConstancyFrameParamsV%d", *(unsigned int *)(a1 + 56))));
      [(opaqueCMSampleBuffer *)v11 setLscGains:v12];
      [(opaqueCMSampleBuffer *)v11 setLscParams:v13];
    }
    uint64_t v14 = [*(id *)(a1 + 64) addFrame:v7 metadata:v9 frameType:a3 frameParams:v11];
  }
  else
  {
    v11 = 0;
    uint64_t v14 = 4294954516;
  }

  return v14;
}

- (void)input:(id)a3 addAmbientFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWColorConstancyProcessorController _addFrame:type:]((uint64_t)self, a4, 0);
  [(BWStillImageProcessorController *)self currentRequestChanged];
}

- (void)reset
{
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  v6 = [(BWStillImageProcessorControllerRequest *)[BWColorConstancyProcessorControllerRequest alloc] initWithInput:a3 delegate:a4];
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
  v3 = [(BWStillImageProcessorController *)self currentRequest];
  uint64_t v4 = (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)v3 input] type:1];
  if (!v4)
  {
    objc_super v5 = 0;
    goto LABEL_6;
  }
  objc_super v5 = (__CVBuffer *)[(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self newOutputPixelBufferForProcessorInput:[(BWStillImageProcessorControllerRequest *)v3 input] type:2002];
  if (!v5)
  {
LABEL_6:
    int v6 = -12786;
    goto LABEL_4;
  }
  [(CMIColourConstancyProcessorProtocol *)self->_processor setOutputImagePixelBuffer:v4];
  -[CMIColourConstancyProcessorProtocol setOutputImageMetadata:](self->_processor, "setOutputImageMetadata:", [MEMORY[0x1E4F1CA60] dictionary]);
  [(CMIColourConstancyProcessorProtocol *)self->_processor setOutputColourAccuracyConfidenceImagePixelBuffer:v5];
  -[CMIColourConstancyProcessorProtocol setConfidenceMapMetadata:](self->_processor, "setConfidenceMapMetadata:", [MEMORY[0x1E4F1CA60] dictionary]);
  int v6 = [(CMIColourConstancyProcessorProtocol *)self->_processor prepareToProcess:0];
LABEL_4:
  CVPixelBufferRelease(v4);
  CVPixelBufferRelease(v5);
  return v6;
}

- (int)process
{
  v18[22] = *MEMORY[0x1E4F143B8];
  v3 = [(BWStillImageProcessorController *)self currentRequest];
  int v4 = [(CMIColourConstancyProcessorProtocol *)self->_processor process];
  if (dword_1EB4C5590)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4
    || (CMAttachmentBearerRef v6 = -[BWColorConstancyProcessorController _newOutputSampleBufferFromSampleBuffer:pixelBuffer:confidenceMap:metadata:processingFlags:formatDescriptionInOut:](self, (opaqueCMSampleBuffer *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame], (__CVBuffer *)[(CMIColourConstancyProcessorProtocol *)self->_processor outputImagePixelBuffer], (__CVBuffer *)[(CMIColourConstancyProcessorProtocol *)self->_processor outputColourAccuracyConfidenceImagePixelBuffer], (void *)[(CMIColourConstancyProcessorProtocol *)self->_processor outputImageMetadata], 0, (CFTypeRef *)&self->_outputFormatDescription)) == 0)
  {
    CVImageBufferRef v12 = (const void *)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame];
    CFStringRef v13 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v14 = objc_msgSend((id)CMGetAttachment(v12, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
    CMSetAttachment((CMAttachmentBearerRef)[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame], v13, v14, 1u);

    [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self didFinishProcessingSampleBuffer:[(BWStillImageProcessorControllerInput *)[(BWStillImageProcessorControllerRequest *)v3 input] flashFrame] type:1 processorInput:[(BWStillImageProcessorControllerRequest *)v3 input] err:0];
  }
  else
  {
    int v7 = v6;
    uint64_t v17 = *MEMORY[0x1E4F55788];
    CFTypeRef v8 = NSNumber;
    [(CMIColourConstancyProcessorProtocol *)self->_processor outputCenterWeightedMeanColourAccuracyConfidenceLevel];
    v18[0] = objc_msgSend(v8, "numberWithFloat:");
    CFTypeRef v9 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    CMSetAttachment(v7, (CFStringRef)*MEMORY[0x1E4F55B28], v9, 1u);
    v10 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v7, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 0x80000);
    CMSetAttachment(v7, @"StillImageProcessingFlags", v10, 1u);
    [(BWStillImageProcessorControllerDelegate *)[(BWStillImageProcessorControllerRequest *)v3 delegate] processorController:self didFinishProcessingSampleBuffer:v7 type:1 processorInput:[(BWStillImageProcessorControllerRequest *)v3 input] err:0];
    CFRelease(v7);
  }
  return 0;
}

- (CMAttachmentBearerRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(__CVBuffer *)a4 confidenceMap:(void *)a5 metadata:(int)a6 processingFlags:(CFTypeRef *)a7 formatDescriptionInOut:
{
  if (result)
  {
    int v7 = 0;
    CMAttachmentBearerRef target = 0;
    int v8 = -12780;
    if (a2 && a3)
    {
      CMAttachmentBearerRef v12 = result;
      int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a7, (CMSampleBufferRef *)&target);
      if (CopyWithNewPixelBuffer)
      {
        int v8 = CopyWithNewPixelBuffer;
        int v7 = 0;
      }
      else
      {
        CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F53070];
        int v7 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
        if ([a5 count]) {
          [v7 addEntriesFromDictionary:a5];
        }
        CMSetAttachment(target, v14, v7, 1u);
        if (a6)
        {
          uint64_t v15 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue") | a6;
          CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v15], 1u);
        }
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1EFA74920, a4, (CFTypeRef *)v12 + 10, [*((id *)v12 + 8) confidenceMapMetadata], 0, 0);
        int v8 = 0;
      }
    }

    result = target;
    if (v8)
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

uint64_t __68__BWColorConstancyProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end