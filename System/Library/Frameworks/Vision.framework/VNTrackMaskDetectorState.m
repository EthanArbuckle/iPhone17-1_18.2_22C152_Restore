@interface VNTrackMaskDetectorState
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameUpdateSpacing;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedPTS;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastUpdatePTS;
- ($FD4688982923A924290ECB669CAF1EC2)getHiddenMaskBuffer;
- ($FD4688982923A924290ECB669CAF1EC2)getKeyBuffer;
- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer;
- ($FD4688982923A924290ECB669CAF1EC2)getValueBuffer;
- (BOOL)firstFrame;
- (VNTrackMaskDetectorState)init;
- (VNTrackMaskDetectorState)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4;
- (__CVBuffer)inititalMask;
- (float)confidence;
- (void)dealloc;
- (void)setConfidence:(float)a3;
- (void)setFirstFrame:(BOOL)a3;
- (void)setLastProcessedPTS:(id *)a3;
- (void)setLastUpdatePTS:(id *)a3;
@end

@implementation VNTrackMaskDetectorState

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setLastProcessedPTS:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedPTS
{
  objc_copyStruct(retstr, &self->_lastProcessedPTS, 24, 1, 0);
  return result;
}

- (void)setLastUpdatePTS:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastUpdatePTS
{
  objc_copyStruct(retstr, &self->_lastUpdatePTS, 24, 1, 0);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameUpdateSpacing
{
  objc_copyStruct(retstr, &self->_frameUpdateSpacing, 24, 1, 0);
  return result;
}

- (__CVBuffer)inititalMask
{
  return self->_inititalMask;
}

- (void)setFirstFrame:(BOOL)a3
{
  self->_firstFrame = a3;
}

- (BOOL)firstFrame
{
  return self->_firstFrame;
}

- ($FD4688982923A924290ECB669CAF1EC2)getOutputMaskBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->outputMaskBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getHiddenMaskBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->hiddenMaskBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getValueBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->valueBuffer;
}

- ($FD4688982923A924290ECB669CAF1EC2)getKeyBuffer
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->keyBuffer;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_inititalMask);
  self->_inititalMask = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNTrackMaskDetectorState;
  [(VNTrackMaskDetectorState *)&v3 dealloc];
}

- (VNTrackMaskDetectorState)initWithFrameUpdateSpacing:(id *)a3 mask:(__CVBuffer *)a4
{
  v6 = [(VNTrackMaskDetectorState *)self init];
  v7 = v6;
  if (v6)
  {
    long long v8 = *(_OWORD *)&a3->var0;
    v6->_frameUpdateSpacing.epoch = a3->var3;
    *(_OWORD *)&v6->_frameUpdateSpacing.value = v8;
    v6->_inititalMask = CVPixelBufferRetain(a4);
  }
  return v7;
}

- (VNTrackMaskDetectorState)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNTrackMaskDetectorState;
  result = [(VNTrackMaskDetectorState *)&v6 init];
  if (result)
  {
    result->_firstFrame = 1;
    uint64_t v3 = MEMORY[0x1E4F1FA48];
    long long v4 = *MEMORY[0x1E4F1FA48];
    *(_OWORD *)&result->_frameUpdateSpacing.value = *MEMORY[0x1E4F1FA48];
    int64_t v5 = *(void *)(v3 + 16);
    result->_frameUpdateSpacing.epoch = v5;
    *(_OWORD *)&result->_lastUpdatePTS.value = v4;
    result->_lastUpdatePTS.epoch = v5;
    *(_OWORD *)&result->_lastProcessedPTS.value = v4;
    result->_lastProcessedPTS.epoch = v5;
    result->_confidence = 0.0;
  }
  return result;
}

@end