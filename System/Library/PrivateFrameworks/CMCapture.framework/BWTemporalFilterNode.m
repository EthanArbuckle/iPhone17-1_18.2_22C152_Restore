@interface BWTemporalFilterNode
+ (void)initialize;
- (__CVBuffer)_createMatchingOutputFormatIfNeededForInputBuffer:(uint64_t)a1;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_dumpFrameMetaData:(uint64_t)result;
- (uint64_t)_dumpFrameStats;
- (uint64_t)_invalidateFilterSession;
- (uint64_t)_shouldBypassTemporalFilteringForSampleBuffer:(uint64_t)result;
- (uint64_t)_updateOutputRequirements;
- (void)_dropInputSampleWithPTS:(uint64_t)a1;
- (void)_supportedOutputPixelFormats;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWTemporalFilterNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)_supportedOutputPixelFormats
{
  if (!a1) {
    return 0;
  }
  v2 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB04538];
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 104), "videoFormat"), "pixelFormat");
  if (v3)
  {
    char IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__BWTemporalFilterNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    char v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v6));
  }
  return v2;
}

- (void)dealloc
{
  -[BWTemporalFilterNode _invalidateFilterSession]((uint64_t)self);
  inputSampleBufferQueue = self->_inputSampleBufferQueue;
  if (inputSampleBufferQueue) {
    CFRelease(inputSampleBufferQueue);
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(pixelTransferSession);
    v5 = self->_pixelTransferSession;
    if (v5)
    {
      CFRelease(v5);
      self->_pixelTransferSession = 0;
    }
  }

  -[BWTemporalFilterNode _dumpFrameStats]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)BWTemporalFilterNode;
  [(BWNode *)&v6 dealloc];
}

- (uint64_t)_invalidateFilterSession
{
  if (result)
  {
    uint64_t v1 = result;
    VTTemporalFilterSessionInvalidate();
    v2 = *(const void **)(v1 + 112);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 112) = 0;
    }
    *(void *)(v1 + 112) = 0;
    int v3 = *(opaqueCMSimpleQueue **)(v1 + 120);
    return CMSimpleQueueReset(v3);
  }
  return result;
}

- (uint64_t)_dumpFrameStats
{
  if (result)
  {
    if (dword_1E96B6DC8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"NoiseReducer";
}

- (uint64_t)_dumpFrameMetaData:(uint64_t)result
{
  if (result && a2)
  {
    if (dword_1E96B6DC8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->_videoOutput, "setFormat:", a3, a4);
  -[BWTemporalFilterNode _updateOutputRequirements]((uint64_t)self);
}

- (uint64_t)_updateOutputRequirements
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 104), "videoFormat"), "colorSpaceProperties");
    if (v2)
    {
      v6[0] = [NSNumber numberWithInt:v2];
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
    v4 = -[BWTemporalFilterNode _supportedOutputPixelFormats](v1);
    v5 = (void *)[*(id *)(v1 + 128) formatRequirements];
    objc_msgSend(v5, "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 104), "videoFormat"), "width"));
    objc_msgSend(v5, "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 104), "videoFormat"), "height"));
    [v5 setSupportedColorSpaceProperties:v3];
    return [v5 setSupportedPixelFormats:v4];
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v13.receiver = self;
  v13.super_class = (Class)BWTemporalFilterNode;
  [(BWNode *)&v13 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_mctfSession)
  {
    if ([(BWPipelineStage *)[(BWNodeConnection *)[(BWNodeInput *)self->_videoInput connection] pipelineStage] queue])
    {
      self->_sampleBufferSerialQueue = [(BWPipelineStage *)[(BWNodeConnection *)[(BWNodeInput *)self->_videoInput connection] pipelineStage] queue];
      uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "pixelFormat"));
      uint64_t v5 = *MEMORY[0x1E4F24D70];
      [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "width"));
      uint64_t v12 = *MEMORY[0x1E4F24E10];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6);
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeInput videoFormat](self->_videoInput, "videoFormat"), "height"));
      uint64_t v8 = *MEMORY[0x1E4F24D08];
      [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
      v9 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", getpid()), *MEMORY[0x1E4F454C0]);
      [v9 setObject:@"BWTemporalFilterNode" forKeyedSubscript:*MEMORY[0x1E4F454C8]];
      v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v10 setObject:@"com.apple.videotoolbox.temporalfilter.mctf" forKeyedSubscript:*MEMORY[0x1E4F454D0]];
      v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWVideoFormat pixelFormat](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "pixelFormat")), v5);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "width")), v12);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->_videoOutput, "videoFormat"), "height")), v8);
      [(BWVideoFormat *)[(BWNodeInput *)self->_videoInput videoFormat] width];
      [(BWVideoFormat *)[(BWNodeInput *)self->_videoInput videoFormat] height];
      VTTemporalFilterSessionCreate();
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_videoInput == a5)
  {
    if (self->_mctfSession)
    {
      uint64_t v6 = [(BWPixelBufferPool *)[(BWNodeOutput *)self->_videoOutput preparedPixelBufferPool] cvPixelBufferPool];
      if (v6)
      {
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E4F454B0], v6);
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E4F454A0], (CFTypeRef)*MEMORY[0x1E4F45480]);
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E4F454B8], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
        VTSessionSetProperty(self->_mctfSession, @"TemporalFilterPriority", &unk_1EFB01970);
        VTSessionSetProperty(self->_mctfSession, (CFStringRef)*MEMORY[0x1E4F45498], &unk_1EFB01988);
        [(BWNodeOutput *)self->_videoOutput makeConfiguredFormatLive];
        if (dword_1E96B6DC8)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sampleBufferSerialQueue);
  if (self->_mctfSession)
  {
    self->_didReachEODForVideoInput = 1;
    VTTemporalFilterSessionCompleteFrames();
    v5.receiver = self;
    v5.super_class = (Class)BWTemporalFilterNode;
    [(BWNode *)&v5 didReachEndOfDataForInput:a3];
  }
}

- (__CVBuffer)_createMatchingOutputFormatIfNeededForInputBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (PixelFormatType == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "videoFormat"), "pixelFormat")
    || !*(void *)(a1 + 144)
    && (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)(a1 + 144))
     || !*(void *)(a1 + 144)))
  {
    return 0;
  }
  objc_super v5 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "livePixelBufferPool"), "newPixelBuffer");
  if (v5) {
    VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 144), pixelBuffer, v5);
  }
  return v5;
}

- (uint64_t)_shouldBypassTemporalFilteringForSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (result)
    {
      uint64_t v3 = (void *)result;
      result = objc_msgSend((id)objc_msgSend((id)result, "objectForKey:", *MEMORY[0x1E4F54070]), "BOOLValue");
      if (result)
      {
        uint64_t v4 = *MEMORY[0x1E4F54078];
        if ([v3 objectForKey:*MEMORY[0x1E4F54078]]
          && (objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v4), "BOOLValue") & 1) != 0)
        {
          return 0;
        }
        else
        {
          if (*(void *)(v2 + 160)) {
            BOOL v5 = 1;
          }
          else {
            BOOL v5 = dword_1E96B6DC8 == 0;
          }
          if (!v5)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          if (!*(unsigned char *)(v2 + 192))
          {
            if (!*(unsigned char *)(v2 + 139) && *(void *)(v2 + 152)) {
              VTTemporalFilterSessionCompleteFrames();
            }
            if (dword_1E96B6DC8)
            {
              uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            -[BWTemporalFilterNode _dumpFrameStats](v2);
          }
          ++*(void *)(v2 + 160);
          result = 1;
          *(unsigned char *)(v2 + 192) = 1;
        }
      }
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  CFTypeRef v37 = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CFTypeRef cf = 0;
  CMTime v35 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sampleBufferSerialQueue);
  p_frameStats = &self->_frameStats;
  unint64_t framesReceivedCount = self->_frameStats.framesReceivedCount;
  if (framesReceivedCount) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = dword_1E96B6DC8 == 0;
  }
  if (!v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unint64_t framesReceivedCount = p_frameStats->framesReceivedCount;
  }
  unint64_t v10 = framesReceivedCount + 1;
  uint64_t v11 = framesReceivedCount == -1;
  uint64_t v12 = v11 << 63 >> 63;
  p_frameStats->unint64_t framesReceivedCount = v10;
  if (v12 != v11 || v12 < 0)
  {
    -[BWTemporalFilterNode _dumpFrameStats]((uint64_t)self);
    if (dword_1E96B6DC8)
    {
      objc_super v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_frameStats.framesDroppedCount = 0;
    *(_OWORD *)&p_frameStats->unint64_t framesReceivedCount = 0u;
    *(_OWORD *)&self->_frameStats.framesWithMCTFAppliedCount = 0u;
  }
  CFDictionaryRef v14 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v14) {
    goto LABEL_45;
  }
  if (self->_logMLVNRMetadata) {
    -[BWTemporalFilterNode _dumpFrameMetaData:]((uint64_t)self, (uint64_t)v14);
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x1E4F530C0]);
  if (!Value) {
    goto LABEL_44;
  }
  CMTimeMakeFromDictionary(&v35, Value);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    goto LABEL_44;
  }
  v17 = ImageBuffer;
  if (self->_enforceTemporalFilter
    || !self->_bypassTemporalFilter
    && !-[BWTemporalFilterNode _shouldBypassTemporalFilteringForSampleBuffer:]((uint64_t)self, a3))
  {
    if (self->_mctfSession)
    {
      if (self->_frameStats.lastFrameWasMLVNRAppliedFrame)
      {
        if (dword_1E96B6DC8)
        {
          v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[BWTemporalFilterNode _dumpFrameStats]((uint64_t)self);
      }
      self->_frameStats.lastFrameWasMLVNRAppliedFrame = 0;
      ++self->_frameStats.framesWithMCTFAppliedCount;
      if (!self->_mctfUsesMLVNRPixelBufferAttachments)
      {
LABEL_41:
        CMTime v39 = v35;
        if (!VTTemporalFilterSessionProcessFrame())
        {
          if (!CMSimpleQueueEnqueue(self->_inputSampleBufferQueue, a3))
          {
            if (a3) {
              CFRetain(a3);
            }
            CFDictionaryRef v14 = 0;
            goto LABEL_57;
          }
          -[NSMutableSet addObject:](self->_enqueueFailedInputSbufPTSValuesList, "addObject:", [MEMORY[0x1E4F29238] valueWithBytes:&v35 objCType:"{?=qiIq}"]);
        }
        goto LABEL_44;
      }
      CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      IOSurface = CVPixelBufferGetIOSurface(v17);
      CFDictionaryRef Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
      if (!CVPixelBufferCreateWithIOSurface(v21, IOSurface, Attributes, &pixelBufferOut))
      {
        CVBufferPropagateAttachments(v17, pixelBufferOut);
        CFDictionaryRef v24 = CVBufferCopyAttachments(pixelBufferOut, kCVAttachmentMode_ShouldPropagate);
        if (v24 && (CFTypeRef v25 = CFAutorelease(v24)) != 0) {
          uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v25];
        }
        else {
          uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v33, v34);
        }
        v27 = (void *)v26;
        uint64_t v28 = *MEMORY[0x1E4F54070];
        uint64_t v29 = -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54070], v33, v34);
        if (v29)
        {
          v30 = (void *)v29;
          [v27 setObject:v29 forKeyedSubscript:v28];
          if ([v30 BOOLValue]) {
            ++self->_frameStats.framesWithMLVNRAppliedCount;
          }
        }
        uint64_t v31 = *MEMORY[0x1E4F54078];
        uint64_t v32 = [(__CFDictionary *)v14 objectForKeyedSubscript:*MEMORY[0x1E4F54078]];
        if (v32) {
          [v27 setObject:v32 forKeyedSubscript:v31];
        }
        CVBufferSetAttachments(pixelBufferOut, (CFDictionaryRef)v27, kCVAttachmentMode_ShouldPropagate);
        goto LABEL_41;
      }
    }
LABEL_44:
    CFDictionaryRef v14 = 0;
    goto LABEL_45;
  }
  CFDictionaryRef v14 = -[BWTemporalFilterNode _createMatchingOutputFormatIfNeededForInputBuffer:]((uint64_t)self, v17);
  if (!v14)
  {
    videoOutput = self->_videoOutput;
    v20 = a3;
    goto LABEL_27;
  }
  if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v14, &v37, (CMSampleBufferRef *)&cf))
  {
    videoOutput = self->_videoOutput;
    v20 = (void *)cf;
LABEL_27:
    -[BWNodeOutput emitSampleBuffer:](videoOutput, "emitSampleBuffer:", v20, v33, v34);
    ++self->_frameStats.framesDispatchedCount;
LABEL_57:
    if (pixelBufferOut) {
      CFRelease(pixelBufferOut);
    }
    if (v14) {
      CFRelease(v14);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v37) {
      CFRelease(v37);
    }
    return;
  }
LABEL_45:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v37) {
    CFRelease(v37);
  }
  CMTime v39 = v35;
  -[BWTemporalFilterNode _dropInputSampleWithPTS:]((uint64_t)self, (long long *)&v39.value);
}

- (void)_dropInputSampleWithPTS:(uint64_t)a1
{
  if (a1)
  {
    if (*((unsigned char *)a2 + 12))
    {
      ++*(void *)(a1 + 184);
      long long v4 = *a2;
      uint64_t v5 = *((void *)a2 + 2);
      id v3 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA680E0 pts:&v4];
      [*(id *)(a1 + 128) emitDroppedSample:v3];
    }
  }
}

BOOL __52__BWTemporalFilterNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange([a2 intValue]);
}

@end