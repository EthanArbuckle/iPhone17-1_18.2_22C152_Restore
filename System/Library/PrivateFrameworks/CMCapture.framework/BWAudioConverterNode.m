@interface BWAudioConverterNode
+ (void)initialize;
- (BOOL)isCinematicAudioCapture;
- (BWAudioConverterNode)init;
- (NSDictionary)gaplessPlaybackInfo;
- (const)_isAPACConversion;
- (id)nodeSubType;
- (id)nodeType;
- (id)settings;
- (uint64_t)_resetAudioCompressionSBP;
- (uint64_t)_setupAudioCompressionSBPForInputFormat:(uint64_t)a1;
- (uint64_t)createFormatDescriptionWithAudioExtension:(const __CFData *)a3 withMagicCookie:(CMAudioFormatDescriptionRef *)a4 outputFormatDescription:;
- (void)_handleUpdatedRecordingSettings:(uint64_t)a1;
- (void)_teardownAudioCompressionSBP;
- (void)acquireHardware;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)relinquishHardware;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCinematicAudioCapture:(BOOL)a3;
- (void)setSettings:(id)a3;
@end

@implementation BWAudioConverterNode

+ (void)initialize
{
}

- (BWAudioConverterNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)BWAudioConverterNode;
  v2 = [(BWNode *)&v6 init];
  if (v2)
  {
    v3 = [[BWNodeInput alloc] initWithMediaType:1936684398 node:v2];
    [(BWNode *)v2 addInput:v3];

    v4 = [[BWNodeOutput alloc] initWithMediaType:1936684398 node:v2];
    [(BWNode *)v2 addOutput:v4];
  }
  return v2;
}

- (void)dealloc
{
  -[BWAudioConverterNode _teardownAudioCompressionSBP]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWAudioConverterNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_teardownAudioCompressionSBP
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 104);
    if (v2)
    {
      uint64_t v3 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v3) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = 0;
      }
      v5 = *(void (**)(uint64_t))(v4 + 24);
      if (v5) {
        v5(v2);
      }
      objc_super v6 = *(const void **)(a1 + 104);
      if (v6)
      {
        CFRelease(v6);
        *(void *)(a1 + 104) = 0;
      }
    }
  }
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"AudioConverter";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  id v5 = +[BWAudioFormat formatForAVAudioSettings:self->_settings inputFormat:a3];
  output = self->super._output;
  [(BWNodeOutput *)output setFormat:v5];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (a4)
  {
    [(BWNodeOutput *)self->super._output setFormat:+[BWAudioFormat formatForAVAudioSettings:self->_settings inputFormat:a4]];
    if (self->_settings) {
      -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:]((uint64_t)self, a4);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)BWAudioConverterNode;
  [(BWNode *)&v9 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (uint64_t)_setupAudioCompressionSBPForInputFormat:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  CMAudioFormatDescriptionRef desc = 0;
  if (*(void *)(a1 + 104))
  {
    fig_log_get_emitter();
    uint64_t v24 = v2;
    LODWORD(v23) = 0;
    FigDebugAssert3();
  }
  id v5 = objc_msgSend(*(id *)(a1 + 16), "format", v23, v24);
  objc_super v6 = (const opaqueCMFormatDescription *)[v5 formatDescription];
  CMAudioFormatDescriptionGetStreamBasicDescription(v6);
  size_t sizeOut = 0;
  CMAudioFormatDescriptionGetChannelLayout(v6, &sizeOut);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", objc_msgSend(v5, "audioCompressionSBPOptions"));
  v8 = (const opaqueCMFormatDescription *)[a2 formatDescription];
  if (*(unsigned char *)(a1 + 112))
  {
    uint64_t v9 = -[BWAudioConverterNode createFormatDescriptionWithAudioExtension:withMagicCookie:outputFormatDescription:](a1, v8, 0, &desc);
    CMAudioFormatDescriptionRef v10 = desc;
    if (v9 || !desc) {
      goto LABEL_22;
    }
    CMAudioFormatDescriptionGetChannelLayout(desc, &sizeOut);
    if (-[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)a1))
    {
      [v7 setObject:&unk_1EFAFEF58 forKeyedSubscript:*MEMORY[0x1E4F32610]];
      [v7 setObject:&unk_1EFAFEF70 forKeyedSubscript:*MEMORY[0x1E4F32630]];
      [v7 setObject:&unk_1EFAFEF88 forKeyedSubscript:*MEMORY[0x1E4F32628]];
    }
  }
  else
  {
    CMAudioFormatDescriptionRef v10 = 0;
  }
  uint64_t v11 = FigSampleBufferProcessorCreateWithAudioCompression();
  if (v11)
  {
    uint64_t v9 = v11;
    fig_log_get_emitter();
    goto LABEL_23;
  }
  uint64_t v12 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = *(uint64_t (**)(uint64_t, void, uint64_t))(v14 + 8);
  if (!v15)
  {
    uint64_t v9 = 4294954514;
LABEL_22:
    fig_log_get_emitter();
    goto LABEL_23;
  }
  uint64_t v16 = v15(v12, acn_sampleBufferProcessorOutputCallback, a1);
  if (v16)
  {
    uint64_t v9 = v16;
    goto LABEL_22;
  }
  if (*(unsigned char *)(a1 + 112)
    && -[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)a1))
  {
    CFTypeRef cf = 0;
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v18) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = *(uint64_t (**)(uint64_t, void, void, CFTypeRef *))(v19 + 48);
    if (v20)
    {
      uint64_t v21 = v20(FigBaseObject, *MEMORY[0x1E4F346A0], 0, &cf);
      if (!v21)
      {
        objc_msgSend(*(id *)(a1 + 16), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", cf));
        if (cf) {
          CFRelease(cf);
        }
        goto LABEL_29;
      }
      uint64_t v9 = v21;
    }
    else
    {
      uint64_t v9 = 4294954514;
    }
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v9 = 0;
LABEL_30:

  if (v10) {
    CFRelease(v10);
  }
  return v9;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWAudioConverterNode _teardownAudioCompressionSBP]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWAudioConverterNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  objc_super v6 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CFTypeRef cf = 0;
  if (!a3) {
    goto LABEL_12;
  }
  if (CMSampleBufferGetDataBuffer(a3) || CMSampleBufferGetImageBuffer(a3))
  {
    audioCompressionSBP = self->_audioCompressionSBP;
    if (!audioCompressionSBP
      || ((v8 = *(void *)(CMBaseObjectGetVTable() + 16)) == 0 ? (uint64_t v9 = 0) : (uint64_t v9 = v8),
          (CMAudioFormatDescriptionRef v10 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v9 + 16)) == 0
       || v10(audioCompressionSBP, a3)))
    {
LABEL_12:
      fig_log_get_emitter();
LABEL_13:
      FigDebugAssert3();
    }
  }
  else
  {
    uint64_t v11 = (void *)CMGetAttachment(a3, @"FileWriterAction", 0);
    if (([v11 isEqualToString:0x1EFA73560] & 1) != 0
      || [v11 isEqualToString:0x1EFA735C0])
    {
      uint64_t v12 = self->_audioCompressionSBP;
      if (v12)
      {
        uint64_t v13 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v13) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        v15 = *(void (**)(OpaqueFigSampleBufferProcessor *))(v14 + 24);
        if (v15) {
          v15(v12);
        }
        if (self->_cinematicAudioCapture
          && -[BWAudioConverterNode _isAPACConversion]((const AudioStreamBasicDescription *)self))
        {
          uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          uint64_t v17 = *(void *)(CMBaseObjectGetVTable() + 8);
          if (v17) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = 0;
          }
          uint64_t v19 = *(unsigned int (**)(uint64_t, void, void, CFTypeRef *))(v18 + 48);
          if (!v19 || v19(FigBaseObject, *MEMORY[0x1E4F346A0], 0, &cf))
          {
            fig_log_get_emitter();
            goto LABEL_13;
          }
          CMSetAttachment(a3, @"TrackFormatDescription", cf, 1u);
          -[BWAudioConverterNode _resetAudioCompressionSBP]((uint64_t)self);
        }
      }
    }
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    v20 = (void *)CMGetAttachment(a3, @"RecordingSettings", 0);
    if (v20) {
      -[BWAudioConverterNode _handleUpdatedRecordingSettings:]((uint64_t)self, v20);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (*v6 == 1) {
    kdebug_trace();
  }
}

- (const)_isAPACConversion
{
  if (result)
  {
    result = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)objc_msgSend((id)objc_msgSend(*(id *)&result->mBytesPerPacket, "format"), "formatDescription"));
    if (result)
    {
      AudioFormatID mFormatID = result->mFormatID;
      return (const AudioStreamBasicDescription *)(mFormatID == 1634754915
                                                || mFormatID == 1902211171
                                                || mFormatID == 1667330147);
    }
  }
  return result;
}

- (uint64_t)_resetAudioCompressionSBP
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(const void **)(result + 104);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 104) = 0;
    }
    uint64_t v3 = (void *)[*(id *)(v1 + 8) format];
    return -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:](v1, v3);
  }
  return result;
}

- (void)_handleUpdatedRecordingSettings:(uint64_t)a1
{
  if (a1)
  {
    CMAudioFormatDescriptionRef v10 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (*(unsigned char *)(a1 + 112))
      {
        uint64_t v4 = (void *)[a2 cinematicAudioSettings];
        goto LABEL_7;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
    }
    uint64_t v4 = (void *)[a2 audioSettings];
LABEL_7:
    objc_super v5 = v4;
    if (!v4) {
      return;
    }
    if (*(void *)(a1 + 96))
    {
      if (objc_msgSend(v4, "isEqual:"))
      {
        if (*(void *)(a1 + 96)) {
          return;
        }
      }
      else
      {
        -[BWAudioConverterNode _teardownAudioCompressionSBP](a1);

        *(void *)(a1 + 96) = 0;
      }
    }
    *(void *)(a1 + 96) = v5;
    objc_super v6 = (void *)[*(id *)(a1 + 8) format];
    v7 = +[BWAudioFormat formatForAVAudioSettings:*(void *)(a1 + 96) inputFormat:v6];
    uint64_t v8 = v7;
    if (*(unsigned char *)(a1 + 112))
    {
      if (-[BWAudioConverterNode createFormatDescriptionWithAudioExtension:withMagicCookie:outputFormatDescription:](a1, [(BWAudioFormat *)v7 audioFormatDescription], 0, &v10))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        CMAudioFormatDescriptionRef v9 = v10;
        if (!v10) {
          return;
        }
LABEL_18:
        CFRelease(v9);
        return;
      }
      CMAudioFormatDescriptionRef v9 = v10;
      uint64_t v8 = +[BWAudioFormat formatWithAudioFormatDescription:v10];
    }
    else
    {
      CMAudioFormatDescriptionRef v9 = 0;
    }
    [*(id *)(a1 + 16) setFormat:v8];
    -[BWAudioConverterNode _setupAudioCompressionSBPForInputFormat:](a1, v6);
    if (!v9) {
      return;
    }
    goto LABEL_18;
  }
}

- (void)acquireHardware
{
  audioCompressionSBP = self->_audioCompressionSBP;
  if (audioCompressionSBP) {
    MEMORY[0x1F40EDB20](audioCompressionSBP, a2);
  }
}

- (void)relinquishHardware
{
  audioCompressionSBP = self->_audioCompressionSBP;
  if (audioCompressionSBP) {
    MEMORY[0x1F40EDB48](audioCompressionSBP, a2);
  }
}

- (NSDictionary)gaplessPlaybackInfo
{
  uint64_t v8 = 0;
  audioCompressionSBP = self->_audioCompressionSBP;
  if (audioCompressionSBP)
  {
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_super v6 = *(void (**)(uint64_t, void, void, OpaqueFigSampleBufferProcessor **))(v5 + 48);
    if (v6)
    {
      v6(FigBaseObject, *MEMORY[0x1E4F346A8], 0, &v8);
      audioCompressionSBP = v8;
    }
    else
    {
      audioCompressionSBP = 0;
    }
  }
  return (NSDictionary *)audioCompressionSBP;
}

- (void)setSettings:(id)a3
{
  settings = self->_settings;
  if (settings != a3)
  {

    self->_settings = (NSDictionary *)[a3 copy];
  }
}

- (id)settings
{
  return self->_settings;
}

- (void)setCinematicAudioCapture:(BOOL)a3
{
  self->_cinematicAudioCapture = a3;
}

- (BOOL)isCinematicAudioCapture
{
  return self->_cinematicAudioCapture;
}

- (uint64_t)createFormatDescriptionWithAudioExtension:(const __CFData *)a3 withMagicCookie:(CMAudioFormatDescriptionRef *)a4 outputFormatDescription:
{
  if (!a1) {
    return 0;
  }
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(desc);
  CFAllocatorRef v8 = CFGetAllocator(desc);
  size_t sizeOut = 0;
  *(void *)bytes = 0x1000100616E6963;
  int v38 = 0x1000000;
  CFDataRef v9 = CFDataCreate(0, bytes, 12);
  CMAudioFormatDescriptionRef v10 = (const void **)MEMORY[0x1E4F1EE20];
  if (!Extensions)
  {
    Mutable = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    goto LABEL_14;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x1E4F1EE20]);
  if (Value)
  {
    uint64_t v12 = CFDictionaryGetValue(Value, @"ngst");
    if (v12)
    {
      uint64_t v13 = v12;
      CFTypeID v14 = CFGetTypeID(v12);
      if (v14 == CFArrayGetTypeID())
      {
        if (!FigCFArrayContainsValue()) {
          goto LABEL_13;
        }
      }
      else
      {
        CFTypeID v16 = CFGetTypeID(v13);
        if (v16 != CFDataGetTypeID() || !CFEqual(v13, v9)) {
          goto LABEL_13;
        }
      }
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      if (!v9) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
LABEL_13:
  Mutable = CFDictionaryCreateMutableCopy(v8, 0, Extensions);
LABEL_14:
  uint64_t v18 = Mutable;
  if (!Mutable)
  {
    uint64_t v19 = 0;
    uint64_t v17 = 4294967246;
    if (!v9) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  CFDictionaryRemoveValue(Mutable, (const void *)*MEMORY[0x1E4F1EE58]);
  CFDictionaryRemoveValue(v18, (const void *)*MEMORY[0x1E4F1EE50]);
  v20 = *v10;
  CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(v18, *v10);
  if (v21)
  {
    CFDictionaryRef v22 = v21;
    CFTypeID v23 = CFGetTypeID(v21);
    if (v23 != CFDictionaryGetTypeID())
    {
      uint64_t v19 = 0;
      goto LABEL_34;
    }
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v8, 0, v22);
  }
  else
  {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v19 = MutableCopy;
  if (!MutableCopy) {
    goto LABEL_34;
  }
  CFArrayRef v25 = (const __CFArray *)CFDictionaryGetValue(MutableCopy, @"ngst");
  if (v25)
  {
    CFArrayRef v26 = v25;
    CFTypeID v27 = CFGetTypeID(v25);
    if (v27 == CFArrayGetTypeID())
    {
      CFMutableArrayRef v28 = CFArrayCreateMutableCopy(v8, 0, v26);
    }
    else
    {
      CFTypeID v29 = CFGetTypeID(v26);
      if (v29 != CFDataGetTypeID())
      {
        v30 = 0;
LABEL_31:
        CFArrayAppendValue(v30, v9);
        CFDictionarySetValue(v19, @"ngst", v30);
        if (v30) {
          CFRelease(v30);
        }
        goto LABEL_33;
      }
      CFMutableArrayRef v28 = CFArrayCreateMutable(v8, 0, MEMORY[0x1E4F1D510]);
    }
    v30 = v28;
    goto LABEL_31;
  }
  CFDictionaryAddValue(v19, @"ngst", v9);
LABEL_33:
  CFDictionarySetValue(v18, v20, v19);
LABEL_34:
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(desc);
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(desc, &sizeOut);
  if (a3) {
    size_t Length = CFDataGetLength(a3);
  }
  else {
    size_t Length = 0;
  }
  uint64_t v17 = CMAudioFormatDescriptionCreate(v8, StreamBasicDescription, sizeOut, ChannelLayout, Length, a3, v18, &formatDescriptionOut);
  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!v9) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  *a4 = formatDescriptionOut;
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  if (v9) {
LABEL_39:
  }
    CFRelease(v9);
LABEL_40:
  if (v19) {
    CFRelease(v19);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return v17;
}

@end