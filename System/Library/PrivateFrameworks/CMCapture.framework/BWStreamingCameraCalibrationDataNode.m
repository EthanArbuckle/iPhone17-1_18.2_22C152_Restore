@interface BWStreamingCameraCalibrationDataNode
+ (void)initialize;
- (BOOL)mirroringEnabled;
- (BWStreamingCameraCalibrationDataNode)initWithCameraInfoByPortType:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (int)horizontalSensorBinningFactor;
- (int)rotationDegrees;
- (int)verticalSensorBinningFactor;
- (void)dealloc;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setRotationDegrees:(int)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation BWStreamingCameraCalibrationDataNode

+ (void)initialize
{
}

- (BWStreamingCameraCalibrationDataNode)initWithCameraInfoByPortType:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BWStreamingCameraCalibrationDataNode;
  v4 = [(BWNode *)&v8 init];
  if (v4)
  {
    v4->_cameraInfoByPortType = (NSDictionary *)a3;
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNode *)v4 addInput:v5];
    v6 = [[BWNodeOutput alloc] initWithMediaType:1667326820 node:v4];
    [(BWNodeOutput *)v6 setFormat:+[BWCameraCalibrationDataFormat format]];
    [(BWNode *)v4 addOutput:v6];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCameraCalibrationDataNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"StreamingCameraCalibrationDataNode";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMSampleBufferRef v22 = 0;
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  memset(&v21, 0, sizeof(v21));
  CMSampleBufferGetPresentationTimeStamp(&v21, a3);
  CFTypeRef v7 = CMGetAttachment(a3, @"OriginalCameraIntrinsicMatrix", 0);
  if (v7
    && (objc_super v8 = (void *)v7,
        (CFDictionaryRef v9 = (const __CFDictionary *)CMGetAttachment(a3, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0)) != 0))
  {
    cameraInfoByPortType = self->_cameraInfoByPortType;
    int horizontalSensorBinningFactor = self->_horizontalSensorBinningFactor;
    int verticalSensorBinningFactor = self->_verticalSensorBinningFactor;
    int rotationDegrees = self->_rotationDegrees;
    unsigned __int8 mirroringEnabled = self->_mirroringEnabled;
    CMTime v20 = v21;
    id v15 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadata(v6, (uint64_t)&v20, cameraInfoByPortType, horizontalSensorBinningFactor, verticalSensorBinningFactor, v8, v9, rotationDegrees, mirroringEnabled, 1);
    if (v15)
    {
      v16 = v15;
      memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, a3);
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      OSStatus v17 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v22);
      CMSampleBufferRef v18 = v22;
      if (v22 && !v17)
      {
        CMSetAttachment(v22, @"CameraCalibrationDataMetadata", v16, 1u);
        [(BWNodeOutput *)self->super._output emitSampleBuffer:v22];
        CMSampleBufferRef v18 = v22;
      }
      if (v18) {
        CFRelease(v18);
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (int)rotationDegrees
{
  return self->_rotationDegrees;
}

- (void)setRotationDegrees:(int)a3
{
  self->_int rotationDegrees = a3;
}

- (BOOL)mirroringEnabled
{
  return self->_mirroringEnabled;
}

- (void)setMirroringEnabled:(BOOL)a3
{
  self->_unsigned __int8 mirroringEnabled = a3;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_int horizontalSensorBinningFactor = a3;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_int verticalSensorBinningFactor = a3;
}

@end