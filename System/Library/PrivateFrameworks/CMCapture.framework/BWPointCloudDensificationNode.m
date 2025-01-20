@interface BWPointCloudDensificationNode
+ (void)initialize;
- (BWPointCloudDensificationNode)initWithConfiguration:(id)a3;
- (id)_newPointCloudFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_setupPointCloudMediaConfigurationForInput:(id)a3 inputAttachedMediaKey:(id)a4;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWPointCloudDensificationNode

+ (void)initialize
{
}

- (BWPointCloudDensificationNode)initWithConfiguration:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)BWPointCloudDensificationNode;
  v4 = [(BWNode *)&v10 init];
  if (v4)
  {
    v4->_configuration = (BWPointCloudDensificationNodeConfiguration *)a3;
    v5 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeInput *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWPointCloudDensificationNode *)v4 _setupPointCloudMediaConfigurationForInput:v5 inputAttachedMediaKey:0x1EFA68B60];
    if ([(BWPointCloudDensificationNodeConfiguration *)v4->_configuration timeOfFlightCameraType] == 2)[(BWPointCloudDensificationNode *)v4 _setupPointCloudMediaConfigurationForInput:v5 inputAttachedMediaKey:0x1EFA74620]; {
    [(BWNode *)v4 addInput:v5];
    }
    v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v4];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v6 primaryMediaConfiguration] setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutput *)v6 setPassthroughMode:1];
    [(BWNodeOutput *)v6 setIndexOfInputWhichDrivesThisOutput:0];
    v7 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    v11[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWPointCloudDensificationNodeConfiguration depthPixelFormat](v4->_configuration, "depthPixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
    [(BWVideoFormatRequirements *)v8 setWidth:(int)[(BWPointCloudDensificationNodeConfiguration *)v4->_configuration depthOutputDimensions]];
    [(BWVideoFormatRequirements *)v8 setHeight:[(BWPointCloudDensificationNodeConfiguration *)v4->_configuration depthOutputDimensions] >> 32];
    [(BWNodeOutputMediaConfiguration *)v7 setFormatRequirements:v8];
    [(BWNodeOutputMediaConfiguration *)v7 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v7 setProvidesPixelBufferPool:1];
    [(BWNodeOutput *)v6 setMediaConfiguration:v7 forAttachedMediaKey:@"Depth"];
    [(BWNode *)v4 addOutput:v6];
    v4->_executor = (ADJasperColorV2Executor *)[objc_alloc((Class)getADJasperColorV2ExecutorClass()) initWithInputPrioritization:2 engineType:4];
    objc_msgSend((id)objc_msgSend((id)-[ADJasperColorV2Executor executorParameters](v4->_executor, "executorParameters"), "pipelineParameters"), "setOutputHighConfidencePixelsOnly:", -[BWPointCloudDensificationNodeConfiguration filteringEnabled](v4->_configuration, "filteringEnabled") ^ 1);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudDensificationNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_setupPointCloudMediaConfigurationForInput:(id)a3 inputAttachedMediaKey:(id)a4
{
  v6 = objc_alloc_init(BWNodeInputMediaConfiguration);
  [(BWNodeInputMediaConfiguration *)v6 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
  [(BWNodeInputMediaConfiguration *)v6 setPassthroughMode:0];
  [a3 setMediaConfiguration:v6 forAttachedMediaKey:a4];
}

- (id)_newPointCloudFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA68B60);
  if (!AttachedMedia)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
LABEL_10:

    return 0;
  }
  CFTypeRef CVDataBuffer = BWSampleBufferGetCVDataBuffer(AttachedMedia);
  v7 = (void *)[objc_alloc((Class)getADJasperPointCloudClass()) initWithDataBuffer:CVDataBuffer];
  if (!v7)
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_10;
  }
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA68B60);
  if ([(BWPointCloudDensificationNodeConfiguration *)self->_configuration timeOfFlightCameraType] == 2)
  {
    v8 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA74620);
    if (v8)
    {
      CFTypeRef v9 = BWSampleBufferGetCVDataBuffer(v8);
      objc_super v10 = (void *)[objc_alloc((Class)getADJasperPointCloudClass()) initWithDataBuffer:v9];
      BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA74620);
      if (v10)
      {
        v13[0] = v7;
        v13[1] = v10;
        v11 = objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initByMergingPointClouds:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 2));

        return v11;
      }
    }
    goto LABEL_9;
  }
  return v7;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v18 = 0;
  v19 = 0;
  v16 = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  if (FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(a3, -[BWPointCloudDensificationNodeConfiguration rgbSensorConfiguration](self->_configuration, "rgbSensorConfiguration", a3, a4), -[BWPointCloudDensificationNodeConfiguration rgbCameraHorizontalSensorBinningFactor](self->_configuration, "rgbCameraHorizontalSensorBinningFactor"), -[BWPointCloudDensificationNodeConfiguration rgbCameraVerticalSensorBinningFactor](self->_configuration, "rgbCameraVerticalSensorBinningFactor"), &v19)|| (v14 = 0u, v15 = 0u, long long v12 = 0u, v13 = 0u, FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(-[BWPointCloudDensificationNodeConfiguration timeOfFlightSensorConfiguration](
                          self->_configuration,
                          "timeOfFlightSensorConfiguration"),
                        (uint64_t)&v12)))
  {
    id v6 = 0;
    goto LABEL_13;
  }
  id v6 = [(BWPointCloudDensificationNode *)self _newPointCloudFromSampleBuffer:a3];
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_27:
    FigDebugAssert3();
    goto LABEL_13;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v16 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", @"Depth"), "livePixelBufferPool"), "newPixelBuffer");
  if (v16
    && !FigCaptureCreateDepthMetadataForColorCameraCalibration(v19, [(BWPointCloudDensificationNodeConfiguration *)self->_configuration filteringEnabled], &v18))
  {
    if (-[ADJasperColorV2Executor executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:](self->_executor, "executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:", ImageBuffer, v6, v19, &v16, 0, *(double *)&v12, *(double *)&v13, *(double *)&v14, *(double *)&v15)|| !v16)
    {
      goto LABEL_12;
    }
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v16, &formatDescriptionOut);
    memset(&sampleTiming.presentationTimeStamp, 0, 48);
    *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
    sampleTiming.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMSampleBufferGetPresentationTimeStamp(&sampleTiming.presentationTimeStamp, a3);
    sampleTiming.decodeTimeStamp = sampleTiming.duration;
    OSStatus v9 = CMSampleBufferCreateForImageBuffer(v8, v16, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (!v9)
    {
      CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E4F55B40], v18, 1u);
      BWSampleBufferSetAttachedMedia(a3, @"Depth", (uint64_t)sampleBufferOut);
LABEL_12:
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
      goto LABEL_13;
    }
    fig_log_get_emitter();
    goto LABEL_27;
  }
LABEL_13:
  if (v19) {
    CFRelease(v19);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
  if (v16) {
    CFRelease(v16);
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [(BWNode *)self outputs];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v13)
        {
          long long v14 = (void *)v13;
          if (([a5 isEqualToString:0x1EFA68B60] & 1) == 0
            && ([a5 isEqualToString:0x1EFA74620] & 1) == 0
            && [v12 passthroughMode])
          {
            -[ADJasperColorV2Executor prepareForColorROI:](self->_executor, "prepareForColorROI:", 0.0, 0.0, (double)(unint64_t)objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "width"), (double)(unint64_t)objc_msgSend((id)objc_msgSend(a4, "videoFormat"), "height"));
            long long v15 = (BWNodeOutputMediaProperties *)[v12 mediaPropertiesForAttachedMediaKey:v14];
            int v16 = [v14 isEqualToString:@"PrimaryFormat"];
            if (v15)
            {
              if ((v16 & 1) == 0)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v12, v14, a5];
                goto LABEL_20;
              }
            }
            else
            {
              if (v16)
              {
                uint64_t v17 = [NSString stringWithFormat:@"%@ output %@ has no media properties for the primary format (provided media key is %@)", self, v12, a5, v18];
LABEL_20:
                objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
              }
              long long v15 = objc_alloc_init(BWNodeOutputMediaProperties);
              [v12 _setMediaProperties:v15 forAttachedMediaKey:v14];
            }
            [(BWNodeOutputMediaProperties *)v15 setResolvedFormat:a3];
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
}

@end