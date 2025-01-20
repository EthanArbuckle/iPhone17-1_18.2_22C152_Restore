@interface BWPhotoEncoderControllerInput
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)stereoPhotoImageHandles;
- (BOOL)deltaMapIsValid;
- (BOOL)fatalErrorOccurred;
- (BOOL)isStereoPhotoCapture;
- (BOOL)receivedAllFramesInSingleContainer;
- (BOOL)requiresPhotosAdjustment;
- (NSDictionary)decompressStyledBufferAttributes;
- (NSDictionary)primaryImageMetadataForPrewarming;
- (NSMutableDictionary)stashedAttacheMediaSampleBuffersByAttachedMediaKey;
- (NSMutableSet)encodedAttachedMediaKeys;
- initWithStillImageSettings:(uint64_t)a3 portType:(char)a4 requiresPhotosAdjustment:;
- (id)description;
- (int64_t)gainMapHandle;
- (int64_t)reservedPrimaryImageHandle;
- (int64_t)settingsID;
- (int64_t)toneMapAlternateGroupHandle;
- (opaqueCMSampleBuffer)primarySampleBuffer;
- (opaqueCMSampleBuffer)sbufToProcess;
- (unint64_t)monoImageLocationType;
- (unsigned)processingFlagsForPrewarming;
- (unsigned)receivedFramesCount;
- (void)addAuxSbuf:(opaqueCMSampleBuffer *)a3 attachedMediakey:(id)a4 primaryImageMetadata:(id)a5 processingFlags:(unsigned int)a6;
- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)dealloc;
- (void)finishedProcessingSbuf;
- (void)receivedFrame:(opaqueCMSampleBuffer *)a3 isPrimary:(BOOL)a4;
- (void)setDecompressStyledBufferAttributes:(id)a3;
- (void)setDeltaMapIsValid:(BOOL)a3;
- (void)setFatalErrorOccurred:(BOOL)a3;
- (void)setGainMapHandle:(int64_t)a3;
- (void)setMonoImageLocationType:(unint64_t)a3;
- (void)setReservedPrimaryImageHandle:(int64_t)a3;
- (void)setStereoPhotoImageHandles:(id *)a3;
- (void)setToneMapAlternateGroupHandle:(int64_t)a3;
@end

@implementation BWPhotoEncoderControllerInput

- initWithStillImageSettings:(uint64_t)a3 portType:(char)a4 requiresPhotosAdjustment:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)BWPhotoEncoderControllerInput;
  v5 = objc_msgSendSuper2(&v9, sel_initWithSettings_portType_, a2, a3);
  v6 = v5;
  if (v5)
  {
    if ([v5 isStereoPhotoCapture]) {
      int v7 = 3;
    }
    else {
      int v7 = 1;
    }
    v6[10] = v7;
    *((unsigned char *)v6 + 44) = a4;
    *((void *)v6 + 9) = -1;
    *((void *)v6 + 10) = -1;
    *((void *)v6 + 11) = -1;
    *((void *)v6 + 13) = -1;
    *((void *)v6 + 14) = -1;
    *((void *)v6 + 15) = -1;
    *((void *)v6 + 16) = 0;
    *((void *)v6 + 18) = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    *((void *)v6 + 19) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (void)dealloc
{
  primarySampleBuffer = self->_primarySampleBuffer;
  if (primarySampleBuffer) {
    CFRelease(primarySampleBuffer);
  }
  sbufToProcess = self->_sbufToProcess;
  if (sbufToProcess) {
    CFRelease(sbufToProcess);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWPhotoEncoderControllerInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (int64_t)settingsID
{
  v2 = [(BWStillImageProcessorControllerInput *)self stillImageSettings];
  return [(BWStillImageSettings *)v2 settingsID];
}

- (BOOL)isStereoPhotoCapture
{
  return [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)[(BWStillImageProcessorControllerInput *)self stillImageSettings] captureSettings] learnedNRStereoPhotoFrameFlag] != 0;
}

- (BOOL)receivedAllFramesInSingleContainer
{
  return self->_receivedFramesCount == self->_expectedFramesCount;
}

- (void)receivedFrame:(opaqueCMSampleBuffer *)a3 isPrimary:(BOOL)a4
{
  ++self->_receivedFramesCount;
  if (self->_fatalErrorOccurred)
  {
    FigDebugAssert3();
  }
  else
  {
    primarySampleBuffer = self->_primarySampleBuffer;
    if (primarySampleBuffer) {
      BOOL v5 = !a4;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5)
    {
      self->_primarySampleBuffer = a3;
      if (a3) {
        CFRetain(a3);
      }
      if (primarySampleBuffer)
      {
        CFRelease(primarySampleBuffer);
      }
    }
  }
}

- (void)finishedProcessingSbuf
{
  sbufToProcess = self->_sbufToProcess;
  if (sbufToProcess)
  {
    CFRelease(sbufToProcess);
    self->_sbufToProcess = 0;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: captureID:%lld, receivedFramesCount:%u, expectedFramesCount:%u fatalErrorOccurred:%d", objc_opt_class(), self, -[BWPhotoEncoderControllerInput settingsID](self, "settingsID"), self->_receivedFramesCount, self->_expectedFramesCount, self->_fatalErrorOccurred];
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (a3)
  {
    sbufToProcess = self->_sbufToProcess;
    self->_sbufToProcess = a3;
    CFRetain(a3);
    if (sbufToProcess) {
      CFRelease(sbufToProcess);
    }
    int v6 = BWStillImageProcessingFlagsForSampleBuffer(a3);
    [(BWPhotoEncoderControllerInput *)self receivedFrame:a3 isPrimary:BWPhotoEncoderIsPrimaryFrame(v6)];
    int v7 = [(BWStillImageProcessorControllerInput *)self delegate];
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)v7 inputReceivedNewInputData:self];
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)addAuxSbuf:(opaqueCMSampleBuffer *)a3 attachedMediakey:(id)a4 primaryImageMetadata:(id)a5 processingFlags:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  if (!self->_primaryImageMetadataForPrewarming) {
    self->_primaryImageMetadataForPrewarming = (NSDictionary *)a5;
  }
  if (!self->_processingFlagsForPrewarming) {
    self->_processingFlagsForPrewarming = v6;
  }
  if ([(BWStillImageProcessorControllerInput *)self delegate])
  {
    v11 = [(BWStillImageProcessorControllerInput *)self delegate];
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)v11 inputReceivedNewAuxMedia:self auxSbuf:a3 attachedMediaKey:a4 primaryImageMetadata:a5 processingFlags:v6];
  }
  else
  {
    stashedAttacheMediaSampleBuffersByAttachedMediaKey = self->_stashedAttacheMediaSampleBuffersByAttachedMediaKey;
    [(NSMutableDictionary *)stashedAttacheMediaSampleBuffersByAttachedMediaKey setObject:a3 forKeyedSubscript:a4];
  }
}

- (BOOL)requiresPhotosAdjustment
{
  return self->_requiresPhotosAdjustment;
}

- (unsigned)receivedFramesCount
{
  return self->_receivedFramesCount;
}

- (opaqueCMSampleBuffer)sbufToProcess
{
  return self->_sbufToProcess;
}

- (int64_t)reservedPrimaryImageHandle
{
  return self->_reservedPrimaryImageHandle;
}

- (void)setReservedPrimaryImageHandle:(int64_t)a3
{
  self->_reservedPrimaryImageHandle = a3;
}

- (int64_t)gainMapHandle
{
  return self->_gainMapHandle;
}

- (void)setGainMapHandle:(int64_t)a3
{
  self->_gainMapHandle = a3;
}

- (int64_t)toneMapAlternateGroupHandle
{
  return self->_toneMapAlternateGroupHandle;
}

- (void)setToneMapAlternateGroupHandle:(int64_t)a3
{
  self->_toneMapAlternateGroupHandle = a3;
}

- (opaqueCMSampleBuffer)primarySampleBuffer
{
  return self->_primarySampleBuffer;
}

- (BOOL)fatalErrorOccurred
{
  return self->_fatalErrorOccurred;
}

- (void)setFatalErrorOccurred:(BOOL)a3
{
  self->_fatalErrorOccurred = a3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)stereoPhotoImageHandles
{
  *($7B1F0C603D2048E240D0518A13F310F9 *)retstr = *($7B1F0C603D2048E240D0518A13F310F9 *)((char *)self + 104);
  return self;
}

- (void)setStereoPhotoImageHandles:(id *)a3
{
  int64_t var2 = a3->var2;
  *(_OWORD *)&self->_stereoPhotoImageHandles.mono = *(_OWORD *)&a3->var0;
  self->_stereoPhotoImageHandles.right = var2;
}

- (unint64_t)monoImageLocationType
{
  return self->_monoImageLocationType;
}

- (void)setMonoImageLocationType:(unint64_t)a3
{
  self->_monoImageLocationType = a3;
}

- (NSDictionary)decompressStyledBufferAttributes
{
  return self->_decompressStyledBufferAttributes;
}

- (void)setDecompressStyledBufferAttributes:(id)a3
{
}

- (NSMutableSet)encodedAttachedMediaKeys
{
  return self->_encodedAttachedMediaKeys;
}

- (NSMutableDictionary)stashedAttacheMediaSampleBuffersByAttachedMediaKey
{
  return self->_stashedAttacheMediaSampleBuffersByAttachedMediaKey;
}

- (NSDictionary)primaryImageMetadataForPrewarming
{
  return self->_primaryImageMetadataForPrewarming;
}

- (unsigned)processingFlagsForPrewarming
{
  return self->_processingFlagsForPrewarming;
}

- (BOOL)deltaMapIsValid
{
  return self->_deltaMapIsValid;
}

- (void)setDeltaMapIsValid:(BOOL)a3
{
  self->_deltaMapIsValid = a3;
}

@end