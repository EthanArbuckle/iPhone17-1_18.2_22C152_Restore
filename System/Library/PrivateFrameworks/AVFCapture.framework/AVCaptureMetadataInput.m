@interface AVCaptureMetadataInput
+ (AVCaptureMetadataInput)metadataInputWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock;
+ (void)initialize;
- (AVCaptureMetadataInput)init;
- (AVCaptureMetadataInput)initWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock;
- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)metadata error:(NSError *)outError;
- (OpaqueCMClock)clock;
- (id)ports;
- (id)sourceID;
- (void)dealloc;
@end

@implementation AVCaptureMetadataInput

+ (void)initialize
{
}

+ (AVCaptureMetadataInput)metadataInputWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFormatDescription:desc clock:clock];

  return (AVCaptureMetadataInput *)v4;
}

- (AVCaptureMetadataInput)init
{
  return [(AVCaptureMetadataInput *)self initWithFormatDescription:0 clock:0];
}

- (AVCaptureMetadataInput)initWithFormatDescription:(CMMetadataFormatDescriptionRef)desc clock:(CMClockRef)clock
{
  if (!desc)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_7;
  }
  if (!clock)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_7;
  }
  if (AVCaptureMetadataObjectsOnly())
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F28790];
LABEL_7:
    v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v9);
    }
    NSLog(&cfstr_SuppressingExc.isa, v9);
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureMetadataInput;
  v10 = [(AVCaptureInput *)&v15 initSubclass];
  if (!v10) {
    return v10;
  }
  v12 = objc_alloc_init(AVCaptureMetadataInputInternal);
  v10->_internal = v12;
  if (v12)
  {
    id v13 = [NSString alloc];
    v14 = (objc_class *)objc_opt_class();
    v10->_internal->sourceID = (NSString *)[v13 initWithFormat:@"<%@ %p>", NSStringFromClass(v14), v10];
    v10->_internal->desc = (opaqueCMFormatDescription *)CFRetain(desc);
    v10->_internal->clock = (OpaqueCMClock *)CFRetain(clock);
    return v10;
  }

  return 0;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    desc = v4->desc;
    if (desc)
    {
      CFRelease(desc);
      v4 = self->_internal;
    }
    clock = v4->clock;
    if (clock)
    {
      CFRelease(clock);
      v4 = self->_internal;
    }
    emptyBoxedMetadata = v4->emptyBoxedMetadata;
    if (emptyBoxedMetadata)
    {
      CFRelease(emptyBoxedMetadata);
      v4 = self->_internal;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureMetadataInput;
  [(AVCaptureInput *)&v8 dealloc];
}

- (id)ports
{
  v6[1] = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  metadataPort = internal->metadataPort;
  if (!metadataPort)
  {
    self->_internal->metadataPort = +[AVCaptureInputPort portWithInput:self mediaType:*MEMORY[0x1E4F47C50] formatDescription:internal->desc enabled:1 sourceDeviceType:0 sourceDevicePosition:0];
    metadataPort = self->_internal->metadataPort;
  }
  v6[0] = metadataPort;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
}

- (OpaqueCMClock)clock
{
  return self->_internal->clock;
}

- (id)sourceID
{
  return self->_internal->sourceID;
}

- (BOOL)appendTimedMetadataGroup:(AVTimedMetadataGroup *)metadata error:(NSError *)outError
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  CMSampleBufferRef v44 = 0;
  CFTypeRef v45 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  if (!metadata)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    goto LABEL_6;
  }
  [(AVTimedMetadataGroup *)metadata timeRange];
  if ((v39 & 1) == 0)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
LABEL_6:
    NSLog(&cfstr_SuppressingExc.isa, v7);
    BOOL v8 = 0;
    goto LABEL_41;
  }
  v9 = [(AVTimedMetadataGroup *)metadata items];
  v10 = v9;
  if (!v9 || ![(NSArray *)v9 count])
  {
    internal = self->_internal;
    emptyBoxedMetadata = internal->emptyBoxedMetadata;
    blockBufferOut = &internal->emptyBoxedMetadata;
    BlockBuffer = emptyBoxedMetadata;
    if (!emptyBoxedMetadata)
    {
      OSStatus v23 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 8uLL, 1u, blockBufferOut);
      *((_DWORD *)v41 + 6) = v23;
      if (v23) {
        goto LABEL_43;
      }
      dataPointerOut = 0;
      OSStatus DataPointer = CMBlockBufferGetDataPointer(self->_internal->emptyBoxedMetadata, 0, 0, 0, &dataPointerOut);
      *((_DWORD *)v41 + 6) = DataPointer;
      if (DataPointer)
      {
        FigDebugAssert3();
        goto LABEL_32;
      }
      *(void *)dataPointerOut = 0x8000000;
      BlockBuffer = self->_internal->emptyBoxedMetadata;
    }
LABEL_29:
    memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
    [(AVTimedMetadataGroup *)metadata timeRange];
    *(_OWORD *)&sampleTimingArray.duration.value = v31;
    sampleTimingArray.duration.epoch = v32;
    [(AVTimedMetadataGroup *)metadata timeRange];
    sampleTimingArray.presentationTimeStamp = v30;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    size_t sampleSizeArray = CMBlockBufferGetDataLength(BlockBuffer);
    OSStatus v25 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], BlockBuffer, 1u, 0, 0, self->_internal->desc, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v44);
    *((_DWORD *)v41 + 6) = v25;
    if (v25)
    {
      FigDebugAssert3();
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57__AVCaptureMetadataInput_appendTimedMetadataGroup_error___block_invoke;
      v28[3] = &unk_1E5A72FC0;
      v28[4] = self;
      v28[5] = &v40;
      v28[6] = v44;
      [(AVCaptureInput *)self performFigCaptureSessionOperationSafelyUsingBlock:v28];
      if (*((_DWORD *)v41 + 6)) {
        FigDebugAssert3();
      }
    }
    goto LABEL_32;
  }
  int v11 = FigBoxedMetadataCreateForConstruction();
  *((_DWORD *)v41 + 6) = v11;
  if (v11)
  {
LABEL_43:
    FigDebugAssert3();
    goto LABEL_32;
  }
  v27 = outError;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_super v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v15 identifier];
        [v15 dataType];
        [v15 locale];
        if (FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
        {
          v16 = (void *)[v15 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BoxedMetadataFromFaceObjectAndFormatDescription = (const void *)AVMetadataObjectCreateBoxedMetadataFromFaceObjectAndFormatDescription(v16, (uint64_t)self->_internal->desc, 0);
            if (BoxedMetadataFromFaceObjectAndFormatDescription)
            {
              *((_DWORD *)v41 + 6) = FigBoxedMetadataAppendCFTypedValue();
              CFRelease(BoxedMetadataFromFaceObjectAndFormatDescription);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              *((_DWORD *)v41 + 6) = FigBoxedMetadataAppendCFTypedValue();
            }
          }
        }
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v12);
  }
  int v18 = FigBoxedMetadataEndConstruction();
  outError = v27;
  *((_DWORD *)v41 + 6) = v18;
  if (!v18)
  {
    BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
    goto LABEL_29;
  }
  FigDebugAssert3();
LABEL_32:
  if (outError && *((_DWORD *)v41 + 6) && !*outError) {
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus();
  }
  if (v45) {
    CFRelease(v45);
  }
  if (v44) {
    CFRelease(v44);
  }
  BOOL v8 = *((_DWORD *)v41 + 6) == 0;
LABEL_41:
  _Block_object_dispose(&v40, 8);
  return v8;
}

uint64_t __57__AVCaptureMetadataInput_appendTimedMetadataGroup_error___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sourceID];
    uint64_t v5 = *(void *)(v3 + 48);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    BOOL v8 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v7 + 8);
    if (v8) {
      result = v8(a2, v4, *MEMORY[0x1E4F51660], v5);
    }
    else {
      result = 4294954514;
    }
    *(_DWORD *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = result;
  }
  return result;
}

@end