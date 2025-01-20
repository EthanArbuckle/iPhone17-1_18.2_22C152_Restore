@interface BWStillImageSampleBufferSinkNode
+ (void)initialize;
- (BOOL)cameraSupportsFlash;
- (BOOL)captureTimePhotosCurationSupported;
- (BOOL)clientIsCameraOrDerivative;
- (BOOL)deferredPhotoProcessorEnabled;
- (BOOL)focusPixelBlurScoreEnabled;
- (BWAutoFocusROIAnalyticsPayload)_autoFocusROIAnalyticsPayloadWithSampleBuffer:(uint64_t)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:;
- (BWStillImageErrorAnalyticsPayload)_coreAnalyticsPayloadWithSampleBuffer:(int)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:(int)a6 isForConstantColorCapture:;
- (BWStillImageSampleBufferSinkNode)initWithInputMediaType:(unsigned int)a3 sinkID:(id)a4;
- (BWStillImageSampleBufferSinkNode)initWithSinkID:(id)a3;
- (id)_newFilteredDetectedObjectsInfoFromDetectedObjectsInfo:(id)result;
- (id)analyticsConfiguration;
- (id)nodeSubType;
- (id)propagatedAttachedMediaKeys;
- (id)sampleBufferAvailableHandler;
- (int)stillImageCapturePipeliningMode;
- (uint64_t)_reportAggdDataWithRequestedStillImageSettings:(void *)a3 resolvedStillImageCaptureSettings:(opaqueCMSampleBuffer *)target sbuf:;
- (void)_attachPrivateClientMetadataToSampleBuffer:(unsigned char *)a1;
- (void)_reportCoreAnalyticsForNodeError:(uint64_t)a1;
- (void)_reportCoreAnalyticsForSampleBuffer:(void *)a3 stillImageSettings:;
- (void)_sendCoreAnalyticsPayloadAndResetReportingStateWithPayload:(uint64_t)a1 settingsID:(uint64_t)a2 processingFlags:(uint64_t)a3;
- (void)_updateMemoryAnalyticsForStillImageWithSampleBuffer:(void *)a3 stillImageSettings:(int)a4 timeSinceLastCaptureInSession:;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAnalyticsConfiguration:(id)a3;
- (void)setCameraSupportsFlash:(BOOL)a3;
- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3;
- (void)setClientIsCameraOrDerivative:(BOOL)a3;
- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3;
- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3;
- (void)setPropagatedAttachedMediaKeys:(id)a3;
- (void)setSampleBufferAvailableHandler:(id)a3;
- (void)setStillImageCapturePipeliningMode:(int)a3;
@end

@implementation BWStillImageSampleBufferSinkNode

- (void)setStillImageCapturePipeliningMode:(int)a3
{
  self->_stillImageCapturePipeliningMode = a3;
}

- (void)setSampleBufferAvailableHandler:(id)a3
{
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreEnabled = a3;
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setCaptureTimePhotosCurationSupported:(BOOL)a3
{
  self->_captureTimePhotosCurationSupported = a3;
}

- (void)setAnalyticsConfiguration:(id)a3
{
  self->_analyticsConfiguration = (BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)a3;
}

- (void)setPropagatedAttachedMediaKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!-[NSArray isEqualToArray:](self->_propagatedAttachedMediaKeys, "isEqualToArray:"))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    propagatedAttachedMediaKeys = self->_propagatedAttachedMediaKeys;
    uint64_t v6 = [(NSArray *)propagatedAttachedMediaKeys countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(propagatedAttachedMediaKeys);
          }
          [(BWNodeInput *)self->super.super._input setMediaConfiguration:0 forAttachedMediaKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v7 = [(NSArray *)propagatedAttachedMediaKeys countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    v10 = (NSArray *)[a3 copy];
    self->_propagatedAttachedMediaKeys = v10;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * j);
          v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
          [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
          [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:1];
          [(BWNodeInput *)self->super.super._input setMediaConfiguration:v16 forAttachedMediaKey:v15];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_cameraSupportsFlash = a3;
}

- (BWStillImageSampleBufferSinkNode)initWithSinkID:(id)a3
{
  return [(BWStillImageSampleBufferSinkNode *)self initWithInputMediaType:1986618469 sinkID:a3];
}

- (BWStillImageSampleBufferSinkNode)initWithInputMediaType:(unsigned int)a3 sinkID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)BWStillImageSampleBufferSinkNode;
  v5 = [(BWSinkNode *)&v9 initWithSinkID:a4];
  if (v5)
  {
    uint64_t v6 = [[BWNodeInput alloc] initWithMediaType:v4 node:v5];
    if (v4 == 1986618469)
    {
      uint64_t v7 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v7 setMemoryPoolUseAllowed:0];
      [(BWNodeInput *)v6 setFormatRequirements:v7];
    }
    [(BWNode *)v5 addInput:v6];
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageSampleBufferSinkNode;
  [(BWSinkNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"SampleBuffer";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  BWNodeSanitizeMetadataIfNecessary(a3);
  -[BWStillImageSampleBufferSinkNode _attachPrivateClientMetadataToSampleBuffer:](self, a3);
  if (self->_focusPixelBlurScoreEnabled)
  {
    uint64_t v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v7 = BWFocusPixelBlurScoreForMetadata(v6);
    CMSetAttachment(a3, @"FocusPixelBlurScoreResult", v7, 1u);
  }
  uint64_t v8 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  __int16 v9 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntValue");
  if ((v9 & 0x1000) != 0
    && (objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureFlags") & 4) != 0
    && self->_stillImageCapturePipeliningMode != 2)
  {
    -[BWDeferredCaptureContainerManager containerWaitForFlush:](+[BWDeferredCaptureContainerManager sharedInstance](BWDeferredCaptureContainerManager, "sharedInstance"), "containerWaitForFlush:", objc_msgSend((id)objc_msgSend(v8, "requestedSettings"), "captureRequestIdentifier"));
  }
  sampleBufferAvailableHandler = (void (**)(id, opaqueCMSampleBuffer *, void, uint64_t))self->_sampleBufferAvailableHandler;
  if (sampleBufferAvailableHandler) {
    sampleBufferAvailableHandler[2](sampleBufferAvailableHandler, a3, 0, [v8 requestedSettings]);
  }
  BOOL v11 = [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)self->_analyticsConfiguration isTimeLapse];
  if ((v9 & 0x2000) == 0 && !v11) {
    -[BWStillImageSampleBufferSinkNode _reportAggdDataWithRequestedStillImageSettings:resolvedStillImageCaptureSettings:sbuf:]((uint64_t)self, (void *)[v8 requestedSettings], objc_msgSend(v8, "captureSettings"), a3);
  }
  -[BWStillImageSampleBufferSinkNode _reportCoreAnalyticsForSampleBuffer:stillImageSettings:]((uint64_t)self, a3, v8);
}

- (void)_attachPrivateClientMetadataToSampleBuffer:(unsigned char *)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1 && a1[181])
  {
    v30 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    CMAttachmentBearerRef target = a2;
    CFTypeRef v3 = CMGetAttachment(a2, @"Inferences", 0);
    CFTypeRef v4 = (CFTypeRef)MEMORY[0x1E4F1CC08];
    if (v3) {
      CFTypeRef v4 = v3;
    }
    v33 = (void *)v4;
    v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v34 = [&unk_1EFB03AD0 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v43;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v43 != v32) {
            objc_enumerationMutation(&unk_1EFB03AD0);
          }
          uint64_t v35 = v6;
          uint64_t v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
          uint64_t v8 = objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v7), "inferences");
          if (v8)
          {
            __int16 v9 = v8;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v48 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v39 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  uint64_t v15 = [v9 objectForKeyedSubscript:v14];
                  uint64_t v37 = 0;
                  uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v37];
                  if (v16) {
                    BOOL v17 = v37 == 0;
                  }
                  else {
                    BOOL v17 = 0;
                  }
                  if (v17)
                  {
                    uint64_t v18 = v16;
                    if ([v7 intValue] == 801) {
                      v14 = (void *)[v14 stringByAppendingString:@"-Landmarks"];
                    }
                    [v5 setObject:v18 forKeyedSubscript:v14];
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v48 count:16];
              }
              while (v11);
            }
          }
          uint64_t v6 = v35 + 1;
        }
        while (v35 + 1 != v34);
        uint64_t v34 = [&unk_1EFB03AD0 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v34);
    }
    long long v19 = (void *)CMGetAttachment(target, @"BWStillImageCaptureSettings", 0);
    long long v20 = (void *)[v19 metadata];
    if ((int)[v20 smartCamVersion] >= 1
      && objc_msgSend((id)objc_msgSend(v20, "smartCamInferences"), "count"))
    {
      if (v20) {
        [v20 smartCamTimestamp];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      CFDictionaryRef v21 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
      v46[0] = *MEMORY[0x1E4F52E50];
      uint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "smartCamVersion"));
      uint64_t v23 = *MEMORY[0x1E4F52E48];
      v47[0] = v22;
      v47[1] = v21;
      uint64_t v24 = *MEMORY[0x1E4F52E38];
      v46[1] = v23;
      v46[2] = v24;
      v47[2] = objc_msgSend((id)objc_msgSend(v19, "metadata"), "smartCamInferences");
      v46[3] = *MEMORY[0x1E4F52E40];
      v47[3] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "isPreviewSmartCamInferences"));
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:4];
      [v5 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F52E30]];
    }
    if ([v5 count]) {
      v26 = v5;
    }
    else {
      v26 = 0;
    }
    [v30 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F52E28]];
    if (a1[182])
    {
      uint64_t v27 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]);
      if (v27)
      {
        id v28 = -[BWStillImageSampleBufferSinkNode _newFilteredDetectedObjectsInfoFromDetectedObjectsInfo:](a1, v27);
        [v30 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F52E20]];
      }
    }
    if ([v30 count]) {
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F52E18], v30, 1u);
    }
  }
}

- (uint64_t)_reportAggdDataWithRequestedStillImageSettings:(void *)a3 resolvedStillImageCaptureSettings:(opaqueCMSampleBuffer *)target sbuf:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a3
      && target
      && (uint64_t v7 = result,
          uint64_t v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0),
          [v8 count]))
    {
      __int16 v9 = +[BWAggdDataReporter sharedInstance];
      CMSampleBufferGetPresentationTimeStamp(&v43, target);
      CMTimeValue value = v43.value;
      CMTimeFlags flags = v43.flags;
      CMTimeScale timescale = v43.timescale;
      CMTimeEpoch epoch = v43.epoch;
      char v10 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      uint64_t v11 = (void *)CMGetAttachment(target, @"TotalZoomFactor", 0);
      if (v11)
      {
        [v11 floatValue];
        float v13 = v12;
      }
      else
      {
        float v13 = 1.0;
      }
      if (*(unsigned char *)(v7 + 181)) {
        unsigned int v38 = [*(id *)(v7 + 200) isPhotoFormat] ^ 1;
      }
      else {
        unsigned int v38 = 0;
      }
      uint64_t v37 = v9;
      v14 = v8;
      if ([a3 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF8]]) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = [a3 captureStreamSettingsForPortType:*MEMORY[0x1E4F52E10]] != 0;
      }
      uint64_t v16 = [a3 captureType];
      uint64_t v17 = *MEMORY[0x1E4F52DF0];
      uint64_t v18 = [a3 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF0]];
      if (v18
        && (long long v19 = (void *)v18,
            (unint64_t)objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "count") >= 2))
      {
        unsigned int v40 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E4F52DD8]), "captureType");
        unsigned int v39 = [v19 captureType];
      }
      else
      {
        unsigned int v39 = 0;
        unsigned int v40 = v16;
      }
      unint64_t v20 = [a3 captureFlags];
      if ((v20 & 0x400) != 0)
      {
        uint64_t v21 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", *MEMORY[0x1E4F52DD8]), "captureType");
        uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "captureStreamSettingsForPortType:", v17), "captureType");
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
      }
      result = [(BWAggdDataReporter *)v37 reportStereoFusionProcessingTypeForCaptureType:v16 isStereoFusionCapture:(v20 >> 10) & 1 wideSubCaptureType:v21 teleSubCaptureType:v22 isOriginalImage:v10 & 1];
      if ((v10 & 9) == 0)
      {
        uint64_t v23 = v38;
        if ([a2 stillImageUserInitiatedRequestTime] && (flags & 1) != 0)
        {
          memset(&v43, 0, sizeof(v43));
          if (a2) {
            [a2 stillImageUserInitiatedRequestPTS];
          }
          else {
            memset(&rhs, 0, sizeof(rhs));
          }
          lhs.CMTimeValue value = value;
          lhs.CMTimeScale timescale = timescale;
          lhs.CMTimeFlags flags = flags;
          lhs.CMTimeEpoch epoch = epoch;
          CMTimeSubtract(&v43, &lhs, &rhs);
          if ((v43.flags & 0x1D) == 1)
          {
            uint64_t v24 = [a3 captureFlags];
            uint64_t v25 = [a3 sceneFlags];
            CMTime lhs = v43;
            LOBYTE(v34) = v15;
            [(BWAggdDataReporter *)v37 reportShutterLag:&lhs primaryCaptureType:v40 secondaryCaptureType:v39 captureFlags:v24 sceneFlags:v25 stillDuringVideo:v38 frontCamera:v34];
          }
          else if (a2)
          {
            [a2 stillImageUserInitiatedRequestPTS];
          }
        }
        v26 = objc_msgSend((id)objc_msgSend(a3, "frameStatisticsByPortType"), "objectForKeyedSubscript:", objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
        if (v26)
        {
          uint64_t v27 = [v26 luxLevel];
          uint64_t v28 = [a3 captureFlags];
          uint64_t v29 = [a3 sceneFlags];
          LOBYTE(v34) = v15;
          uint64_t v30 = v28;
          uint64_t v23 = v38;
          [(BWAggdDataReporter *)v37 reportLuxLevel:v27 primaryCaptureType:v40 secondaryCaptureType:v39 captureFlags:v30 sceneFlags:v29 stillDuringVideo:v38 frontCamera:v34];
        }
        if (v13 != 0.0)
        {
          uint64_t v31 = [a3 captureFlags];
          uint64_t v32 = [a3 sceneFlags];
          *(float *)&double v33 = v13;
          [(BWAggdDataReporter *)v37 reportZoomFactor:v40 primaryCaptureType:v39 secondaryCaptureType:v31 captureFlags:v32 sceneFlags:v23 stillDuringVideo:v15 frontCamera:v33];
        }
        if (*(unsigned char *)(v7 + 181))
        {
          if ((v23 & 1) == 0) {
            [(BWAggdDataReporter *)v37 reportCameraAppCaptureForNonCameraAppLoggingWithFrontCamera:v15];
          }
        }
        else
        {
          -[BWAggdDataReporter reportNonCameraAppCaptureWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:](v37, "reportNonCameraAppCaptureWithPrimaryCaptureType:secondaryCaptureType:captureFlags:sceneFlags:stillDuringVideo:frontCamera:", v40, v39, [a3 captureFlags], objc_msgSend(a3, "sceneFlags"), v23, v15);
        }
        if (*(unsigned char *)(v7 + 181)
          && ([*(id *)(v7 + 200) isTimeLapse] & 1) == 0
          && ([a2 burstQualityCaptureEnabled] & 1) == 0)
        {
          +[BWAutoFocusPositionSensorMonitor logStillImageAPSStatistics:v14];
        }
        if (([*(id *)(v7 + 200) isTimeLapse] & 1) == 0
          && ([a2 burstQualityCaptureEnabled] & 1) == 0)
        {
          -[BWAggdDataReporter reportFaceCount:frontCamera:](v37, "reportFaceCount:frontCamera:", objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC0]), "count"), v15);
        }
        result = [*(id *)(v7 + 200) isTimeLapse];
        if ((result & 1) == 0)
        {
          result = [a2 burstQualityCaptureEnabled];
          if ((result & 1) == 0)
          {
            result = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F54230]];
            if (result) {
              return -[BWAggdDataReporter reportSensorTemperature:frontCamera:](v37, "reportSensorTemperature:frontCamera:", [(id)result intValue], v15);
            }
          }
        }
      }
    }
    else
    {
      return FigDebugAssert3();
    }
  }
  return result;
}

- (void)_reportCoreAnalyticsForSampleBuffer:(void *)a3 stillImageSettings:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1
    && a2
    && a3
    && ([*(id *)(a1 + 200) isTimeLapse] & 1) == 0
    && (!objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "constantColorEnabled")
     || BWSampleBufferGetAttachedMedia(a2, 0x1EFA74920)))
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "settingsID");
    if (v6 != *(void *)(a1 + 224))
    {
      uint64_t v7 = v6;
      char v8 = objc_msgSend((id)CMGetAttachment(a2, @"StillImageProcessingFlags", 0), "unsignedIntValue");
      if ((v8 & 1) == 0)
      {
        char v9 = v8;
        long long v19 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        char v10 = -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, a2, 0, a3, v19, 0);
        int v21 = [(BWStillImageAnalyticsPayloadCommon *)v10 timeSinceLastCaptureInSession];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v11 = objc_msgSend((id)CMGetAttachment(a2, @"PhotoManifest", 0), "photoDescriptors");
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
LABEL_11:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            if ((objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v15), "processingFlags", v19) & 0x40) != 0) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
              if (v13) {
                goto LABEL_11;
              }
              goto LABEL_20;
            }
          }
          if ((v9 & 0x40) != 0) {
            goto LABEL_20;
          }

          *(void *)(a1 + 232) = v10;
        }
        else
        {
LABEL_20:
          [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v10];

          *(void *)(a1 + 232) = 0;
          *(void *)(a1 + 224) = v7;
          -[BWStillImageSampleBufferSinkNode _updateMemoryAnalyticsForStillImageWithSampleBuffer:stillImageSettings:timeSinceLastCaptureInSession:]((void *)a1, a2, a3, v21);
          if (!*(unsigned char *)(a1 + 180))
          {
            uint64_t v16 = -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, a2, 0, a3, v20, 1);
            if (v16) {
              [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v16];
            }
            if (*(unsigned char *)(a1 + 181))
            {
              uint64_t v18 = -[BWStillImageSampleBufferSinkNode _autoFocusROIAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:](a1, (uint64_t)a2, v17, a3, v20);
              if (v18) {
                [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v18];
              }
            }
          }
          FigCaptureLogCameraStillImageCapturePowerEvent(objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "masterPortType"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputWidth"), objc_msgSend((id)objc_msgSend(a3, "requestedSettings"), "outputHeight"), objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "deliverDeferredPhotoProxyImage"));
        }
      }
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings");
  sampleBufferAvailableHandler = (void (**)(id, void, uint64_t, void *))self->_sampleBufferAvailableHandler;
  if (sampleBufferAvailableHandler) {
    sampleBufferAvailableHandler[2](sampleBufferAvailableHandler, 0, [a3 errorCode], v6);
  }
  cachedAnalyticsPayloadForPortraitFailures = self->_cachedAnalyticsPayloadForPortraitFailures;
  if (cachedAnalyticsPayloadForPortraitFailures)
  {
    -[BWStillImageSampleBufferSinkNode _sendCoreAnalyticsPayloadAndResetReportingStateWithPayload:settingsID:processingFlags:]((uint64_t)self, (uint64_t)cachedAnalyticsPayloadForPortraitFailures, [v6 settingsID]);
    self->_lastReportedSettingsID = 0;
  }
  -[BWStillImageSampleBufferSinkNode _reportCoreAnalyticsForNodeError:]((uint64_t)self, a3);
}

- (void)_sendCoreAnalyticsPayloadAndResetReportingStateWithPayload:(uint64_t)a1 settingsID:(uint64_t)a2 processingFlags:(uint64_t)a3
{
  if (a1)
  {
    [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:a2];

    *(void *)(a1 + 232) = 0;
    *(void *)(a1 + 224) = a3;
  }
}

- (void)_reportCoreAnalyticsForNodeError:(uint64_t)a1
{
  if (a1 && a2 && ([*(id *)(a1 + 200) isTimeLapse] & 1) == 0)
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stillImageSettings"), "requestedSettings"), "settingsID");
    if (v4 != *(void *)(a1 + 224))
    {
      uint64_t v5 = v4;
      -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", -[BWStillImageSampleBufferSinkNode _coreAnalyticsPayloadWithSampleBuffer:error:stillImageSettings:metadata:isForConstantColorCapture:]((BWStillImageErrorAnalyticsPayload *)a1, 0, [a2 errorCode], objc_msgSend(a2, "stillImageSettings"), objc_msgSend(a2, "metadata"), 0));

      *(void *)(a1 + 232) = 0;
      *(void *)(a1 + 224) = v5;
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5410)
  {
    int v10 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWStillImageSampleBufferSinkNode setSampleBufferAvailableHandler:](self, "setSampleBufferAvailableHandler:", 0, v6, v7);
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageSampleBufferSinkNode;
  [(BWSinkNode *)&v8 didReachEndOfDataForInput:a3];
}

- (int)stillImageCapturePipeliningMode
{
  return self->_stillImageCapturePipeliningMode;
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (BOOL)captureTimePhotosCurationSupported
{
  return self->_captureTimePhotosCurationSupported;
}

- (id)propagatedAttachedMediaKeys
{
  return self->_propagatedAttachedMediaKeys;
}

- (BOOL)focusPixelBlurScoreEnabled
{
  return self->_focusPixelBlurScoreEnabled;
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- (id)analyticsConfiguration
{
  return self->_analyticsConfiguration;
}

- (id)_newFilteredDetectedObjectsInfoFromDetectedObjectsInfo:(id)result
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v17 = [a2 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v17)
    {
      uint64_t v15 = *(void *)v26;
      uint64_t v19 = *MEMORY[0x1E4F538F8];
      uint64_t v3 = *MEMORY[0x1E4F54180];
      uint64_t v4 = *MEMORY[0x1E4F53D80];
      uint64_t v16 = a2;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(a2);
          }
          uint64_t v20 = v5;
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v5);
          uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:"), "objectForKeyedSubscript:", v19);
          uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v22;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v22 != v10) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
                uint64_t v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                if ([v12 objectForKeyedSubscript:v3]) {
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", v3), v3);
                }
                if ([v12 objectForKeyedSubscript:v4]) {
                  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v12, "objectForKeyedSubscript:", v4), v4);
                }
                if ([v13 objectForKeyedSubscript:v3]) {
                  [v7 addObject:v13];
                }
                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
            }
            while (v9);
          }
          if ([v7 count])
          {
            uint64_t v29 = v19;
            uint64_t v30 = v7;
            objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1), v18);
          }
          uint64_t v5 = v20 + 1;
          a2 = v16;
        }
        while (v20 + 1 != v17);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v17);
    }
    return v14;
  }
  return result;
}

- (BWStillImageErrorAnalyticsPayload)_coreAnalyticsPayloadWithSampleBuffer:(int)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:(int)a6 isForConstantColorCapture:
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    p_isa = (id *)&result->super.super.isa;
    uint64_t v12 = [a4 captureSettings];
    if (v12
      && (uint64_t v13 = (void *)v12, (v14 = [a4 requestedSettings]) != 0)
      && ((uint64_t v15 = (void *)v14, a2) || a3))
    {
      uint64_t v16 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      uint64_t v17 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F538C8]];
      obuint64_t j = (id)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F538F8]];
      if (!obj) {
        obuint64_t j = (id)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
      }
      int v172 = a3;
      if (a2)
      {
        if (a6) {
          uint64_t v18 = BWStillImageCaptureConstantColorAnalyticsPayload;
        }
        else {
          uint64_t v18 = BWStillImageCaptureAnalyticsPayload;
        }
        uint64_t v20 = (BWStillImageErrorAnalyticsPayload *)objc_alloc_init(v18);
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v19 = objc_alloc_init(BWStillImageErrorAnalyticsPayload);
        uint64_t v20 = 0;
      }
      if (v20) {
        long long v21 = v20;
      }
      else {
        long long v21 = v19;
      }
      if (!v21)
      {
LABEL_267:
        FigDebugAssert3();
        return v21;
      }
      int v171 = a6;
      [(BWStillImageAnalyticsPayloadCommon *)v21 setDeferred:*((unsigned __int8 *)p_isa + 180)];
      v174 = a5;
      v175 = v21;
      if (!a2)
      {
LABEL_93:
        if (!v172) {
          goto LABEL_100;
        }
        if (v19)
        {
          -[BWStillImageErrorAnalyticsPayload setError:](v19, "setError:");
          long long v68 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
          *(_OWORD *)v190 = *MEMORY[0x1E4F1DB20];
          *(_OWORD *)&v190[16] = v68;
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            double v69 = *(double *)&v190[24];
            if (*(double *)&v190[24] == 0.0)
            {
LABEL_100:
              unint64_t v72 = 0x1E5C1E000;
              if (a5)
              {
                uint64_t v73 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setPortType:v73];
                if (v73)
                {
                  v168 = v15;
                  v170 = v13;
                  v173 = p_isa;
                  v166 = objc_msgSend((id)objc_msgSend(v13, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v73);
                  -[BWStillImageAnalyticsPayloadCommon setLuxLevel:](v21, "setLuxLevel:", [v166 luxLevel]);
                  v74 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  v75 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  v76 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  v77 = a5;
                  uint64_t v178 = *MEMORY[0x1E4F53EB0];
                  v180 = v74;
                  objc_msgSend(v74, "setObject:forKeyedSubscript:", objc_msgSend(a5, "objectForKeyedSubscript:"), v73);
                  uint64_t v78 = *MEMORY[0x1E4F54130];
                  uint64_t v79 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54130]];
                  v80 = v75;
                  [v75 setObject:v79 forKeyedSubscript:v73];
                  uint64_t v81 = *MEMORY[0x1E4F54020];
                  v82 = v76;
                  objc_msgSend(v76, "setObject:forKeyedSubscript:", objc_msgSend(v77, "objectForKeyedSubscript:", *MEMORY[0x1E4F54020]), v73);
                  v83 = (void *)[v77 objectForKeyedSubscript:*MEMORY[0x1E4F54300]];
                  long long v181 = 0u;
                  long long v182 = 0u;
                  long long v183 = 0u;
                  long long v184 = 0u;
                  uint64_t v84 = [v83 countByEnumeratingWithState:&v181 objects:v193 count:16];
                  if (v84)
                  {
                    uint64_t v85 = v84;
                    uint64_t v86 = *(void *)v182;
                    do
                    {
                      for (uint64_t i = 0; i != v85; ++i)
                      {
                        if (*(void *)v182 != v86) {
                          objc_enumerationMutation(v83);
                        }
                        uint64_t v88 = *(void *)(*((void *)&v181 + 1) + 8 * i);
                        v89 = (void *)[v83 objectForKeyedSubscript:v88];
                        objc_msgSend(v180, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v178), v88);
                        objc_msgSend(v80, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v78), v88);
                        objc_msgSend(v82, "setObject:forKeyedSubscript:", objc_msgSend(v89, "objectForKeyedSubscript:", v81), v88);
                      }
                      uint64_t v85 = [v83 countByEnumeratingWithState:&v181 objects:v193 count:16];
                    }
                    while (v85);
                  }
                  long long v21 = v175;
                  [(BWStillImageAnalyticsPayloadCommon *)v175 setApsSubjectDistance:v180];
                  [(BWStillImageAnalyticsPayloadCommon *)v175 setPracticalFocalLength:v80];
                  [(BWStillImageAnalyticsPayloadCommon *)v175 setFocusingMethod:v82];
                  -[BWStillImageAnalyticsPayloadCommon setAwbStable:](v175, "setAwbStable:", [v166 awbStable]);
                  p_isa = v173;
                  a5 = v174;
                  uint64_t v15 = v168;
                  uint64_t v13 = v170;
                  unint64_t v72 = 0x1E5C1E000uLL;
                }
                v90 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53D98]];
                if (v90)
                {
                  *(float *)&double v91 = (float)((float)(int)[v90 intValue] / -255.0) + 1.0;
                  [(BWStillImageAnalyticsPayloadCommon *)v21 setLensPosition:v91];
                }
                v92 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F54230]];
                if (v92) {
                  -[BWStillImageAnalyticsPayloadCommon setSensorTemperature:](v21, "setSensorTemperature:", [v92 intValue]);
                }
                v93 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F54038]];
                if (v93)
                {
                  [v93 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setLensTemperature:](v21, "setLensTemperature:");
                }
                v94 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53E48]];
                v95 = v94;
                if (v94)
                {
                  [v94 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setExposureDuration:](v21, "setExposureDuration:");
                }
                *(_DWORD *)v190 = 0;
                int v96 = FigCaptureComputeImageGainFromMetadata();
                if (v95 && !v96)
                {
                  [v95 floatValue];
                  *(float *)&double v98 = v97 * *(float *)v190;
                  [(BWStillImageAnalyticsPayloadCommon *)v21 setEffectiveIntegrationTime:v98];
                }
                v99 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53F70]];
                if (v99)
                {
                  [v99 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setIso:](v21, "setIso:");
                }
                objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F540F8]), "floatValue");
                if (v100 != 0.0) {
                  -[BWStillImageAnalyticsPayloadCommon setNormalizedSNR:](v21, "setNormalizedSNR:");
                }
                objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F541C0]), "floatValue");
                if (v101 != 0.0) {
                  -[BWStillImageAnalyticsPayloadCommon setSNR:](v21, "setSNR:");
                }
                v102 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53DD8]];
                if (v102)
                {
                  v103 = v102;
                  objc_msgSend((id)objc_msgSend(v102, "objectForKeyedSubscript:", *MEMORY[0x1E4F53928]), "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setAccelStandardDeviation:](v21, "setAccelStandardDeviation:");
                  objc_msgSend((id)objc_msgSend(v103, "objectForKeyedSubscript:", *MEMORY[0x1E4F53930]), "floatValue");
                  -[BWStillImageAnalyticsPayloadCommon setGyroStandardDeviation:](v21, "setGyroStandardDeviation:");
                }
                v104 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F54270]];
                if (v104)
                {
                  v105 = v104;
                  v106 = (void *)[v104 objectForKeyedSubscript:*MEMORY[0x1E4F54DD8]];
                  if (v106)
                  {
                    [v106 floatValue];
                    *(float *)&double v108 = v107 * 0.0039062;
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setMaxSphereTrackingError:v108];
                  }
                  v109 = (void *)[v105 objectForKeyedSubscript:*MEMORY[0x1E4F54E18]];
                  if (v109)
                  {
                    [v109 floatValue];
                    *(float *)&double v111 = v110 * 0.0039062;
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setStdSphereTrackingError:v111];
                  }
                  v112 = (void *)[v105 objectForKeyedSubscript:*MEMORY[0x1E4F54DF0]];
                  if (v112)
                  {
                    [v112 floatValue];
                    *(float *)&double v114 = v113 * 0.0039062;
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setMinDistanceFromSphereEndStop:v114];
                  }
                  v115 = (void *)[v105 objectForKeyedSubscript:*MEMORY[0x1E4F54E10]];
                  if (v115)
                  {
                    [v115 floatValue];
                    -[BWStillImageAnalyticsPayloadCommon setSpherePowerConsumption:](v21, "setSpherePowerConsumption:");
                  }
                }
                v116 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53CC8]];
                if (v116)
                {
                  v117 = v116;
                  v118 = (void *)[v116 objectForKeyedSubscript:*MEMORY[0x1E4F53698]];
                  if (v118)
                  {
                    [v118 floatValue];
                    -[BWStillImageAnalyticsPayloadCommon setMaxAFTrackingError:](v21, "setMaxAFTrackingError:");
                  }
                  v119 = (void *)[v117 objectForKeyedSubscript:*MEMORY[0x1E4F536D0]];
                  if (v119)
                  {
                    [v119 floatValue];
                    -[BWStillImageAnalyticsPayloadCommon setStdAFTrackingError:](v21, "setStdAFTrackingError:");
                  }
                  v120 = (void *)[v117 objectForKeyedSubscript:*MEMORY[0x1E4F536B8]];
                  if (v120)
                  {
                    [v120 floatValue];
                    -[BWStillImageAnalyticsPayloadCommon setAfPowerConsumption:](v21, "setAfPowerConsumption:");
                  }
                }
                v121 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53C00]];
                if (v121)
                {
                  v122 = (void *)[v121 objectForKeyedSubscript:*MEMORY[0x1E4F53638]];
                  if (v122) {
                    -[BWStillImageAnalyticsPayloadCommon setDepthAFStatus:](v21, "setDepthAFStatus:", [v122 intValue]);
                  }
                }
                v123 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53D68]];
                if (v123) {
                  -[BWStillImageAnalyticsPayloadCommon setCameraPosture:](v21, "setCameraPosture:", [v123 intValue]);
                }
                v124 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53248]];
                if (v124) {
                  -[BWStillImageAnalyticsPayloadCommon setImageExifOrientation:](v21, "setImageExifOrientation:", [v124 intValue]);
                }
                uint64_t v125 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54280]];
                if (v125) {
                  [(BWStillImageAnalyticsPayloadCommon *)v21 setSphereMode:v125];
                }
                v126 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53CD8]];
                if (v126) {
                  -[BWStillImageAnalyticsPayloadCommon setApsMode:](v21, "setApsMode:", [v126 intValue]);
                }
                v127 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53E80]];
                if (v127)
                {
                  [v127 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setFlashBrightnessRatio:](v21, "setFlashBrightnessRatio:");
                }
                v128 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53478]];
                if (v128) {
                  -[BWStillImageAnalyticsPayloadCommon setStfStillSupported:](v21, "setStfStillSupported:", [v128 BOOLValue]);
                }
                v129 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53468]];
                if (v129) {
                  -[BWStillImageAnalyticsPayloadCommon setStfStillApplied:](v21, "setStfStillApplied:", [v129 BOOLValue]);
                }
                v130 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53470]];
                if (v130) {
                  -[BWStillImageAnalyticsPayloadCommon setStfStillCorrectionStrength:](v21, "setStfStillCorrectionStrength:", [v130 intValue]);
                }
                v131 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53460]];
                if (v131) {
                  -[BWStillImageAnalyticsPayloadCommon setStfStillAnalyticsVersion:](v21, "setStfStillAnalyticsVersion:", [v131 unsignedIntValue]);
                }
                v132 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53328]];
                if (v132) {
                  -[BWStillImageAnalyticsPayloadCommon setGeometricDistortionCorrectionSource:](v21, "setGeometricDistortionCorrectionSource:", objc_msgSend(*(id *)(v72 + 2104), "geometricDistortionCorrectionSourceToShortString:", objc_msgSend(v132, "intValue")));
                }
                -[BWStillImageAnalyticsPayloadCommon setGeometricDistortionCorrectionEnabled:](v21, "setGeometricDistortionCorrectionEnabled:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53320]), "BOOLValue"));
                v133 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53368]];
                if (v133)
                {
                  unsigned int v134 = [v133 unsignedIntValue];
                  int v135 = [v13 captureType];
                  if (v135 == 11)
                  {
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setGreenGhostMitigationLowLightExceedsMaxMaskAverage:(v134 >> 3) & 1];
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setGreenGhostMitigationLowLightSkipRepair:(v134 >> 4) & 1];
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setGreenGhostMitigationLowLightTripodMode:(v134 >> 5) & 1];
                    v136 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53360]];
                    if (v136)
                    {
                      [v136 floatValue];
                      -[BWStillImageAnalyticsPayloadCommon setGreenGhostMitigationLowLightMaskAverage:](v21, "setGreenGhostMitigationLowLightMaskAverage:");
                    }
                  }
                  else if (v135 == 10)
                  {
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setGreenGhostMitigationBrightLightIsBrightScene:(v134 >> 3) & 1];
                    [(BWStillImageAnalyticsPayloadCommon *)v21 setGreenGhostMitigationBrightLightROIIsComputed:(v134 >> 4) & 1];
                  }
                }
                -[BWStillImageAnalyticsPayloadCommon setTimeOfFlightAssistedAutoFocusEstimatorData:](v21, "setTimeOfFlightAssistedAutoFocusEstimatorData:", [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54338]]);
                -[BWStillImageAnalyticsPayloadCommon setLeaderFollowerAutoFocusData:](v21, "setLeaderFollowerAutoFocusData:", [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54028]]);
                -[BWStillImageAnalyticsPayloadCommon setTimeOfFlightFlickerDetectionData:](v21, "setTimeOfFlightFlickerDetectionData:", [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54340]]);
                v137 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53CC0]];
                if (v137) {
                  -[BWStillImageAnalyticsPayloadCommon setAfDriverShortOccurred:](v21, "setAfDriverShortOccurred:", [v137 BOOLValue]);
                }
                v138 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53488]];
                if (v138) {
                  -[BWStillImageAnalyticsPayloadCommon setSwfrApplied:](v21, "setSwfrApplied:", [v138 BOOLValue]);
                }
                v139 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F534A8]];
                if (v139) {
                  -[BWStillImageAnalyticsPayloadCommon setSwfrForegroundCorrectionStrength:](v21, "setSwfrForegroundCorrectionStrength:", [v139 intValue]);
                }
                v140 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53498]];
                if (v140) {
                  -[BWStillImageAnalyticsPayloadCommon setSwfrBackgroundCorrectionStrength:](v21, "setSwfrBackgroundCorrectionStrength:", [v140 intValue]);
                }
                v141 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F534A0]];
                if (v141)
                {
                  [v141 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setSwfrForegroundCorrectionDirection:](v21, "setSwfrForegroundCorrectionDirection:");
                }
                v142 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53490]];
                if (v142)
                {
                  [v142 floatValue];
                  -[BWStillImageAnalyticsPayloadCommon setSwfrBackgroundCorrectionDirection:](v21, "setSwfrBackgroundCorrectionDirection:");
                }
                v143 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53480]];
                if (v143) {
                  -[BWStillImageAnalyticsPayloadCommon setSwfrAnalyticsVersion:](v21, "setSwfrAnalyticsVersion:", [v143 intValue]);
                }
                v144 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53448]];
                if (v144) {
                  -[BWStillImageAnalyticsPayloadCommon setRedEyeReductionStatus:](v21, "setRedEyeReductionStatus:", [v144 intValue]);
                }
                if (v171)
                {
                  v145 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53210]];
                  if (v145) {
                    -[BWStillImageErrorAnalyticsPayload setConstantColorApplied:](v21, "setConstantColorApplied:", [v145 BOOLValue]);
                  }
                  v146 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53218]];
                  if (v146)
                  {
                    [v146 floatValue];
                    -[BWStillImageErrorAnalyticsPayload setConstantColorCenterWeightedMeanConfidenceLevel:](v21, "setConstantColorCenterWeightedMeanConfidenceLevel:");
                  }
                  v147 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53208]];
                  if (v147) {
                    -[BWStillImageErrorAnalyticsPayload setConstantColorAnalyticsVersion:](v21, "setConstantColorAnalyticsVersion:", [v147 intValue]);
                  }
                  v148 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53230]];
                  if (v148)
                  {
                    [v148 floatValue];
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointRGain:](v21, "setConstantColorStrobeWhitePointRGain:");
                  }
                  v149 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53228]];
                  if (v149)
                  {
                    [v149 floatValue];
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointGGain:](v21, "setConstantColorStrobeWhitePointGGain:");
                  }
                  v150 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53220]];
                  if (v150)
                  {
                    [v150 floatValue];
                    -[BWStillImageErrorAnalyticsPayload setConstantColorStrobeWhitePointBGain:](v21, "setConstantColorStrobeWhitePointBGain:");
                  }
                }
                v151 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53238]];
                if (v151)
                {
                  v152 = v151;
                  v153 = (void *)[v151 objectForKeyedSubscript:@"RearCameraAssembly"];
                  if (v153) {
                    -[BWStillImageAnalyticsPayloadCommon setCoreRepairStatusRearCameraAssembly:](v21, "setCoreRepairStatusRearCameraAssembly:", [v153 intValue]);
                  }
                  v154 = (void *)[v152 objectForKeyedSubscript:@"FrontCameraAssembly"];
                  if (v154) {
                    -[BWStillImageAnalyticsPayloadCommon setCoreRepairStatusFrontCameraAssembly:](v21, "setCoreRepairStatusFrontCameraAssembly:", [v154 intValue]);
                  }
                }
                v155 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F53200]];
                if (v155)
                {
                  v156 = v155;
                  v157 = (void *)[v155 objectForKeyedSubscript:0x1EFA76E20];
                  if (v157) {
                    -[BWStillImageAnalyticsPayloadCommon setCalibrationValidationStatusCmCl:](v21, "setCalibrationValidationStatusCmCl:", [v157 intValue]);
                  }
                  v158 = (void *)[v156 objectForKeyedSubscript:@"CmPMValidationStatus"];
                  if (v158) {
                    -[BWStillImageAnalyticsPayloadCommon setCalibrationValidationStatusCmPM:](v21, "setCalibrationValidationStatusCmPM:", [v158 intValue]);
                  }
                  v159 = (void *)[v156 objectForKeyedSubscript:@"FCClValidationStatus"];
                  if (v159) {
                    -[BWStillImageAnalyticsPayloadCommon setCalibrationValidationStatusFCCl:](v21, "setCalibrationValidationStatusFCCl:", [v159 intValue]);
                  }
                }
              }
              -[BWStillImageAnalyticsPayloadCommon setCaptureType:](v21, "setCaptureType:", [v13 captureType]);
              -[BWStillImageAnalyticsPayloadCommon setCaptureFlags:](v21, "setCaptureFlags:", [v13 captureFlags]);
              -[BWStillImageAnalyticsPayloadCommon setSceneFlags:](v21, "setSceneFlags:", [v13 sceneFlags]);
              [v15 stillImageCaptureStartTime];
              mach_absolute_time();
              [(BWStillImageAnalyticsPayloadCommon *)v21 setProcessingDuration:((int)FigHostTimeToNanoseconds() / 1000 / 1000)];
              -[BWStillImageAnalyticsPayloadCommon setStreamingTime:](v21, "setStreamingTime:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "streamingTime"));
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF8]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 1];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:2];
              }
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52E10]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 0x40];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:2];
              }
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52E00]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 2];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:2];
              }
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF0]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 8];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:1];
              }
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DD8]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 4];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:1];
              }
              if ([v13 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DE8]])
              {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setActiveDeviceMask:[(BWStillImageAnalyticsPayloadCommon *)v21 activeDeviceMask] | 0x10];
                [(BWStillImageAnalyticsPayloadCommon *)v21 setDevicePosition:1];
              }
              if (objc_msgSend((id)objc_msgSend(v15, "bravoConstituentImageDeliveryDeviceTypes"), "count")) {
                -[BWStillImageAnalyticsPayloadCommon setConstituentImageDeliveryDeviceTypes:](v21, "setConstituentImageDeliveryDeviceTypes:", BWStringFromFigCaptureSourceDeviceTypes((void *)[v15 bravoConstituentImageDeliveryDeviceTypes]));
              }
              -[BWStillImageAnalyticsPayloadCommon setAlsLuxLevel:](v21, "setAlsLuxLevel:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "alsLuxLevel"));
              objc_msgSend((id)objc_msgSend(v13, "metadata"), "alsRearLuxLevel");
              -[BWStillImageAnalyticsPayloadCommon setAlsRearLuxLevel:](v21, "setAlsRearLuxLevel:");
              -[BWStillImageAnalyticsPayloadCommon setClientApplicationID:](v21, "setClientApplicationID:", [v13 applicationID]);
              -[BWStillImageAnalyticsPayloadCommon setTimeLapse:](v21, "setTimeLapse:", [p_isa[25] isTimeLapse]);
              -[BWStillImageAnalyticsPayloadCommon setBurst:](v21, "setBurst:", [v15 burstQualityCaptureEnabled]);
              -[BWStillImageAnalyticsPayloadCommon setDepthEnabled:](v21, "setDepthEnabled:", [v15 depthDataDeliveryEnabled]);
              -[BWStillImageAnalyticsPayloadCommon setNumberOfFaces:](v21, "setNumberOfFaces:", [obj count]);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 movieMode] == 1) {
                [(BWStillImageAnalyticsPayloadCommon *)v21 setLivePhotoEnabled:1];
              }
              if (*((unsigned char *)p_isa + 181)) {
                int v160 = [p_isa[25] isPhotoFormat] ^ 1;
              }
              else {
                int v160 = 0;
              }
              if (([p_isa[25] isTimeLapse] & 1) == 0
                && (([v15 burstQualityCaptureEnabled] | v160) & 1) == 0)
              {
                if (p_isa[27])
                {
                  [v15 stillImageRequestTime];
                  [(BWStillImageAnalyticsPayloadCommon *)v21 setTimeSinceLastCaptureInSession:FigHostTimeToNanoseconds() / 0xF4240uLL];
                }
                p_isa[27] = (id)[v15 stillImageRequestTime];
              }
              -[BWStillImageAnalyticsPayloadCommon setSemanticStyleRenderingSupported:](v21, "setSemanticStyleRenderingSupported:", [p_isa[25] isSemanticStyleRenderingSupported]);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 semanticStyle])
              {
                v161 = (void *)[v15 semanticStyle];
                -[BWStillImageAnalyticsPayloadCommon setSemanticSceneType:](v21, "setSemanticSceneType:", objc_msgSend((id)objc_msgSend(v13, "metadata"), "semanticStyleSceneType"));
                [v161 toneBias];
                -[BWStillImageAnalyticsPayloadCommon setSemanticStyleToneBias:](v21, "setSemanticStyleToneBias:");
                [v161 warmthBias];
                -[BWStillImageAnalyticsPayloadCommon setSemanticStyleWarmthBias:](v21, "setSemanticStyleWarmthBias:");
              }
              -[BWStillImageAnalyticsPayloadCommon setSmartStyleRenderingSupported:](v21, "setSmartStyleRenderingSupported:", [p_isa[25] isSmartStyleRenderingSupported]);
              if ([v15 smartStyle])
              {
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleCastType:](v21, "setSmartStyleCastType:", objc_msgSend(MEMORY[0x1E4F55F08], "makerNoteTagForSmartStyleCastType:smartStyleVersion:", objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "cast"), 1));
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "toneBias");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleToneBias:](v21, "setSmartStyleToneBias:");
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "colorBias");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleColorBias:](v21, "setSmartStyleColorBias:");
                objc_msgSend((id)objc_msgSend(v15, "smartStyle"), "intensity");
                -[BWStillImageAnalyticsPayloadCommon setSmartStyleIntensity:](v21, "setSmartStyleIntensity:");
              }
              if (FigCapturePixelFormatIsDemosaicedRaw([v15 rawOutputFormat]))
              {
                int v162 = 4;
              }
              else
              {
                if (!FigCapturePixelFormatIsBayerRaw([v15 rawOutputFormat])) {
                  goto LABEL_250;
                }
                int v162 = 8;
              }
              [(BWStillImageAnalyticsPayloadCommon *)v21 setOutputFileType:[(BWStillImageAnalyticsPayloadCommon *)v21 outputFileType] | v162];
LABEL_250:
              if ([v15 outputFileType] == 1785096550)
              {
                int v163 = 2;
              }
              else if ([v15 outputFileType] == 1751476579 {
                     || [v15 outputFileType] == 1751476582)
              }
              {
                int v163 = 1;
              }
              else
              {
                if ([v15 outputFileType] != 1953064550) {
                  goto LABEL_256;
                }
                int v163 = 16;
              }
              [(BWStillImageAnalyticsPayloadCommon *)v21 setOutputFileType:[(BWStillImageAnalyticsPayloadCommon *)v21 outputFileType] | v163];
LABEL_256:
              -[BWStillImageAnalyticsPayloadCommon setFormatDimensionWidth:](v21, "setFormatDimensionWidth:", [p_isa[25] formatDimensionWidth]);
              -[BWStillImageAnalyticsPayloadCommon setFormatDimensionHeight:](v21, "setFormatDimensionHeight:", [p_isa[25] formatDimensionHeight]);
              -[BWStillImageAnalyticsPayloadCommon setDeliveredDimensionWidth:](v21, "setDeliveredDimensionWidth:", [v15 outputWidth]);
              -[BWStillImageAnalyticsPayloadCommon setDeliveredDimensionHeight:](v21, "setDeliveredDimensionHeight:", [v15 outputHeight]);
              [p_isa[25] formatMaxFrameRate];
              [(BWStillImageAnalyticsPayloadCommon *)v21 setFormatMaxFrameRate:(int)v164];
              -[BWStillImageAnalyticsPayloadCommon setQualityPrioritization:](v21, "setQualityPrioritization:", [v15 qualityPrioritization]);
              -[BWStillImageAnalyticsPayloadCommon setClientRequestedQualityPrioritization:](v21, "setClientRequestedQualityPrioritization:", [v15 clientQualityPrioritization]);
              -[BWStillImageAnalyticsPayloadCommon setHighQualityPhotoWithVideoFormatSupported:](v21, "setHighQualityPhotoWithVideoFormatSupported:", [p_isa[25] isHighQualityPhotoWithVideoFormatSupported]);
              -[BWStillImageAnalyticsPayloadCommon setPhotoFormat:](v21, "setPhotoFormat:", [p_isa[25] isPhotoFormat]);
              -[BWStillImageAnalyticsPayloadCommon setPixelFormat:](v21, "setPixelFormat:", [p_isa[25] pixelFormat]);
              -[BWStillImageAnalyticsPayloadCommon setBinned:](v21, "setBinned:", [p_isa[25] binned]);
              -[BWStillImageAnalyticsPayloadCommon setDepthDataDeliveryEnabled:](v21, "setDepthDataDeliveryEnabled:", [v15 depthDataDeliveryEnabled]);
              v165 = objc_msgSend((id)objc_msgSend(v13, "metadata"), "shallowDepthOfFieldEffectSceneStatus");
              [(BWStillImageAnalyticsPayloadCommon *)v21 setPortraitRequested:v165 != 0];
              if (v165) {
                -[BWStillImageAnalyticsPayloadCommon setPortraitEffectStatus:](v21, "setPortraitEffectStatus:", objc_msgSend(*(id *)(v72 + 2104), "shallowDepthOfFieldEffectStatusToString:", objc_msgSend(v165, "intValue")));
              }
              -[BWStillImageAnalyticsPayloadCommon setFastCapturePrioritizationEnabled:](v21, "setFastCapturePrioritizationEnabled:", [p_isa[25] fastCapturePrioritizationEnabled]);
              -[BWStillImageAnalyticsPayloadCommon setResolutionFlavor:](v21, "setResolutionFlavor:", FigCaptureSourceFormatHighResolutionFlavorToShortString([v15 resolutionFlavor]));
              return v21;
            }
          }
          else
          {
            *(_OWORD *)v190 = 0uLL;
            __asm { FMOV            V0.2D, #1.0 }
            *(_OWORD *)&v190[16] = _Q0;
            double v69 = 1.0;
          }
          double v71 = 1.0 / v69;
          *(float *)&double v71 = v71;
          [(BWStillImageErrorAnalyticsPayload *)v19 setDigitalZoomRatioFromSource:v71];
          goto LABEL_100;
        }
        goto LABEL_267;
      }
      if (v20)
      {
        if ([a5 count])
        {
          -[BWStillImageErrorAnalyticsPayload setProcessingFlags:](v20, "setProcessingFlags:", objc_msgSend((id)CMGetAttachment(a2, @"StillImageProcessingFlags", 0), "unsignedIntValue"));
          long long v22 = (void *)CMGetAttachment(a2, @"TotalZoomFactor", 0);
          if (v22) {
            [v22 floatValue];
          }
          else {
            LODWORD(v23) = 1.0;
          }
          [(BWStillImageErrorAnalyticsPayload *)v20 setZoom:v23];
          -[BWStillImageErrorAnalyticsPayload setDeviceType:](v20, "setDeviceType:", objc_msgSend((id)CMGetAttachment(a2, @"CaptureDeviceType", 0), "intValue"));
          objc_msgSend((id)CMGetAttachment(a2, @"UIZoomFactor", 0), "floatValue");
          -[BWStillImageErrorAnalyticsPayload setUiZoom:](v20, "setUiZoom:");
          memset(&v192, 0, sizeof(v192));
          CMSampleBufferGetPresentationTimeStamp(&v192, (CMSampleBufferRef)a2);
          if ([v15 stillImageUserInitiatedRequestTime])
          {
            if (v192.flags)
            {
              memset(v190, 0, 24);
              [v15 stillImageUserInitiatedRequestPTS];
              lhs.origin = *(CGPoint *)&v192.value;
              *(void *)&lhs.size.width = v192.epoch;
              CMTimeSubtract((CMTime *)v190, (CMTime *)&lhs, &rhs);
              if ((v190[12] & 0x1D) == 1)
              {
                lhs.origin = *(CGPoint *)v190;
                lhs.size.width = *(CGFloat *)&v190[16];
                [(BWStillImageErrorAnalyticsPayload *)v20 setShutterLag:(int)(CMTimeGetSeconds((CMTime *)&lhs) * 1000.0)];
              }
            }
          }
          AttachedInference = (void *)BWInferenceGetAttachedInference(a2, 802, @"VisionFaceDetectionObservations");
          if (AttachedInference) {
            -[BWStillImageErrorAnalyticsPayload setNumberOfFacesWithVisionFaceDetection:](v20, "setNumberOfFacesWithVisionFaceDetection:", [AttachedInference count]);
          }
          v167 = v19;
          if ([obj count])
          {
            unint64_t v25 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
            if ((int)v25 <= SHIDWORD(v25)) {
              int v26 = HIDWORD(v25);
            }
            else {
              int v26 = v25;
            }
            float v27 = (float)SHIDWORD(v25);
            float v28 = (float)v26;
            *(_OWORD *)v190 = 0uLL;
            __asm { FMOV            V0.2D, #1.0 }
            *(_OWORD *)&v190[16] = _Q0;
            if ((objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53270], 0), "BOOLValue") & 1) == 0) {
              FigCFDictionaryGetCGRectIfPresent();
            }
            v169 = v13;
            uint64_t v34 = v15;
            long long v188 = 0u;
            long long v189 = 0u;
            long long v186 = 0u;
            long long v187 = 0u;
            float v35 = v27 / v28;
            uint64_t v36 = [obj countByEnumeratingWithState:&v186 objects:v194 count:16];
            if (v36)
            {
              uint64_t v38 = v36;
              uint64_t v39 = 0;
              uint64_t v40 = 0;
              uint64_t v41 = *(void *)v187;
              CGSize v177 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
              CGPoint v179 = (CGPoint)*MEMORY[0x1E4F1DB28];
              uint64_t v42 = *MEMORY[0x1E4F54180];
              float v43 = 0.0;
              float v44 = 1.0;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v187 != v41) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v46 = *(void **)(*((void *)&v186 + 1) + 8 * j);
                  lhs.origin = v179;
                  lhs.size = v177;
                  if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v46 objectForKeyedSubscript:v42], &lhs))
                  {
                    v196.origin.x = FigCaptureTransformRectToCoordinateSpaceOfRect(lhs.origin.x, lhs.origin.y, lhs.size.width, lhs.size.height, *(double *)v190, *(double *)&v190[8], *(double *)&v190[16]);
                    v198.origin.x = 0.0;
                    v198.origin.y = 0.0;
                    v198.size.width = 1.0;
                    v198.size.float height = 1.0;
                    CGRect v197 = CGRectIntersection(v196, v198);
                    float height = v197.size.height;
                    double v48 = v197.origin.x + v197.size.width;
                    BOOL v49 = v197.origin.x > 0.849999994;
                    if (v48 < 0.150000006) {
                      BOOL v49 = 1;
                    }
                    double v50 = v197.origin.y + v197.size.height;
                    if (v50 < 0.150000006) {
                      BOOL v49 = 1;
                    }
                    if (v197.origin.y > 0.849999994) {
                      BOOL v49 = 1;
                    }
                    BOOL v51 = v197.origin.x > 0.150000006;
                    if (v48 >= 0.849999994) {
                      BOOL v51 = 0;
                    }
                    if (v197.origin.y <= 0.150000006) {
                      BOOL v51 = 0;
                    }
                    if (v50 >= 0.849999994) {
                      BOOL v51 = 0;
                    }
                    uint64_t v40 = v40 + (v49 || !v49 && !v51);
                    uint64_t v39 = v39 + (v51 || !v49 && !v51);
                    if (v43 <= height) {
                      float v43 = height;
                    }
                    if (v44 >= height) {
                      float v44 = height;
                    }
                  }
                }
                uint64_t v38 = [obj countByEnumeratingWithState:&v186 objects:v194 count:16];
              }
              while (v38);
            }
            else
            {
              uint64_t v39 = 0;
              uint64_t v40 = 0;
              float v43 = 0.0;
              float v44 = 1.0;
            }
            *(float *)&double v37 = v35 * v43;
            [(BWStillImageErrorAnalyticsPayload *)v20 setLargestFaceHeight:v37];
            *(float *)&double v52 = v35 * v44;
            [(BWStillImageErrorAnalyticsPayload *)v20 setSmallestFaceHeight:v52];
            [(BWStillImageErrorAnalyticsPayload *)v20 setNumberOfFacesAtEdge:v40];
            [(BWStillImageErrorAnalyticsPayload *)v20 setNumberOfFacesAtCenter:v39];
            uint64_t v15 = v34;
            uint64_t v13 = v169;
            a5 = v174;
            long long v21 = v175;
          }
          [(BWStillImageErrorAnalyticsPayload *)v20 setOisRecenteringLoggingData:CMGetAttachment(a2, @"OisRecenteringLoggingData", 0)];
          v53 = (void *)CMGetAttachment(a2, @"IntelligentDistortionCorrectionStatusCode", 0);
          if (v53) {
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionStatusCode:](v20, "setIntelligentDistortionCorrectionStatusCode:", [v53 intValue]);
          }
          v54 = (void *)CMGetAttachment(a2, @"IntelligentDistortionCorrectionGainMapProcessingStatusCode", 0);
          if (v54) {
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionGainMapProcessingStatusCode:](v20, "setIntelligentDistortionCorrectionGainMapProcessingStatusCode:", [v54 intValue]);
          }
          v55 = (void *)CMGetAttachment(a2, @"IntelligentDistortionCorrectionCorrectionType", 0);
          if (v55) {
            -[BWStillImageErrorAnalyticsPayload setIntelligentDistortionCorrectionCorrectionType:](v20, "setIntelligentDistortionCorrectionCorrectionType:", [v55 intValue]);
          }
          v56 = (void *)CMGetAttachment(a2, @"ISPMotionHighPassFilterConvergenceFlags", 0);
          if (v56) {
            -[BWStillImageErrorAnalyticsPayload setIspMotionHighPassFilterConvergenceFlags:](v20, "setIspMotionHighPassFilterConvergenceFlags:", [v56 intValue]);
          }
          if (FigCapturePixelFormatIsDemosaicedRaw([v15 rawOutputFormat]))
          {
            v57 = (void *)CMGetAttachment(a2, @"RawImageAssetSizes", 0);
            v58 = (void *)[v57 objectForKeyedSubscript:0x1EFA74140];
            v59 = (void *)[v57 objectForKeyedSubscript:0x1EFA74160];
            v60 = (void *)[v57 objectForKeyedSubscript:0x1EFA74180];
            v61 = (void *)CMGetAttachment(a2, @"RawImageBitDepth", 0);
            uint64_t v62 = [v15 rawOutputFileCodec];
            [v15 rawOutputFileCodecQuality];
            float v64 = *(float *)&v63;
            if (v58) {
              -[BWStillImageErrorAnalyticsPayload setDngFileSize:](v20, "setDngFileSize:", [v58 unsignedIntValue]);
            }
            if (v59) {
              -[BWStillImageErrorAnalyticsPayload setThumbnailImageSize:](v20, "setThumbnailImageSize:", [v59 unsignedIntValue]);
            }
            if (v60) {
              -[BWStillImageErrorAnalyticsPayload setAuxiliaryImagesSize:](v20, "setAuxiliaryImagesSize:", [v60 unsignedIntValue]);
            }
            long long v21 = v175;
            if (v61) {
              -[BWStillImageErrorAnalyticsPayload setBitDepth:](v20, "setBitDepth:", [v61 unsignedIntValue]);
            }
            a5 = v174;
            if (v62) {
              [(BWStillImageErrorAnalyticsPayload *)v20 setDngCodecType:v62];
            }
            if (v64 != 0.0)
            {
              *(float *)&double v63 = v64;
              [(BWStillImageErrorAnalyticsPayload *)v20 setDngCodecQuality:v63];
            }
          }
          if ([v15 outputFileType] == 1785096550
            || [v15 outputFileType] == 1751476579
            || [v15 outputFileType] == 1751476582)
          {
            v65 = (void *)CMGetAttachment(a2, @"EncodedImageSurfaceSize", 0);
            if (v65) {
              -[BWStillImageErrorAnalyticsPayload setPhotoFileSize:](v20, "setPhotoFileSize:", [v65 unsignedIntValue]);
            }
          }
          if ([v15 depthDataDeliveryEnabled])
          {
            AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, @"Depth");
            if (AttachedMedia)
            {
              ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
              [(BWStillImageErrorAnalyticsPayload *)v20 setDepthFormatDimensionWidth:CVPixelBufferGetWidth(ImageBuffer)];
              [(BWStillImageErrorAnalyticsPayload *)v20 setDepthFormatDimensionHeight:CVPixelBufferGetHeight(ImageBuffer)];
              [(BWStillImageErrorAnalyticsPayload *)v20 setDepthPixelFormat:CVPixelBufferGetPixelFormatType(ImageBuffer)];
              -[BWStillImageErrorAnalyticsPayload setDepthDataFiltered:](v20, "setDepthDataFiltered:", [v15 depthDataFiltered]);
            }
          }
          [(BWStillImageErrorAnalyticsPayload *)v20 setFocusPixelBlurScoreResult:CMGetAttachment(a2, @"FocusPixelBlurScoreResult", 0)];
          -[BWStillImageErrorAnalyticsPayload setFusionMode:](v20, "setFusionMode:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53300]), "intValue"));
          uint64_t v19 = v167;
          goto LABEL_93;
        }
        FigDebugAssert3();
        long long v21 = v20;
      }
      else
      {
        FigDebugAssert3();
        long long v21 = v19;
      }
    }
    else
    {
      FigDebugAssert3();
      long long v21 = 0;
    }
    return v21;
  }
  return result;
}

- (void)_updateMemoryAnalyticsForStillImageWithSampleBuffer:(void *)a3 stillImageSettings:(int)a4 timeSinceLastCaptureInSession:
{
  if (!result) {
    return result;
  }
  result = objc_msgSend((id)objc_msgSend(result, "graph"), "memoryAnalyticsPayload");
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t v8 = (void *)[a3 captureSettings];
  uint64_t v9 = (void *)[a3 requestedSettings];
  uint64_t v10 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v8) {
    return (void *)FigDebugAssert3();
  }
  if (!v9) {
    return (void *)FigDebugAssert3();
  }
  uint64_t v11 = v10;
  if (![v10 count]) {
    return (void *)FigDebugAssert3();
  }
  uint64_t v12 = [v9 resolutionFlavor];
  uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "metadata"), "shallowDepthOfFieldEffectSceneStatus");
  if (!v13
    || (uint64_t v14 = (void *)v13, [v7 setPortraitRequested:1],
                           unsigned int v15 = [v14 intValue],
                           v15 > 0xE)
    || ((1 << v15) & 0x6202) == 0
    || ([v7 setPortraitDepthGenerationAttempted:1],
        (objc_msgSend((id)CMGetAttachment(a2, @"StillImageProcessingFlags", 0), "unsignedIntValue") & 0x40) == 0))
  {
    if (v12 != 1) {
      goto LABEL_17;
    }
LABEL_14:
    if (([v8 captureFlags] & 0x800) != 0
      && (BWCIFilterArrayContainsPortraitFilters((void *)[v9 processedImageFilters]) & 1) == 0)
    {
      [v7 setEnhancedResolutionPortraitSuggested:1];
    }
    goto LABEL_17;
  }
  [v7 setPortraitEffectApplied:1];
  if (v12 == 1)
  {
    [v7 setEnhancedResolutionPortraitApplied:1];
    goto LABEL_14;
  }
LABEL_17:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v16 = (void *)[v9 semanticStyle];
  }
  else {
    uint64_t v16 = 0;
  }
  if (([v16 isIdentity] & 1) == 0) {
    [v7 setPhotographicStyleUsed:1];
  }
  if (BWSampleBufferHasDetectedFaces(a2, 1, 1, 1, 1, 1)) {
    [v7 setFaceDetectedInScene:1];
  }
  objc_msgSend(v7, "addCaptureType:", objc_msgSend(v8, "captureType"));
  objc_msgSend(v7, "addDeviceType:", objc_msgSend((id)CMGetAttachment(a2, @"CaptureDeviceType", 0), "intValue"));
  objc_msgSend(v7, "addPortType:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  if (CMGetAttachment(a2, @"RawImageSurface", 0))
  {
    if (CMGetAttachment(a2, @"EncodedImageSurface", 0)) {
      [v7 setProRawPlusProcessedPhotoEncoding:1];
    }
    else {
      [v7 setProRaw:1];
    }
  }
  int v17 = [v9 burstQualityCaptureEnabled];
  char v18 = v17;
  if (v17) {
    [v7 setBurst:1];
  }
  uint64_t v19 = (void *)[v11 objectForKeyedSubscript:*MEMORY[0x1E4F53368]];
  if (v19 && ([v19 unsignedIntValue] & 2) != 0) {
    [v7 setGreenGhostMitigation:1];
  }
  [v7 addHighResolutionFlavor:v12];
  result = (void *)CMGetAttachment(a2, @"IntelligentDistortionCorrectionStatusCode", 0);
  if (result) {
    result = (void *)[v7 setIntelligentDistortionCorrection:1];
  }
  if ((v18 & 1) == 0)
  {
    return (void *)[v7 updateButtonMash:(a4 - 1) < 0x1F3];
  }
  return result;
}

- (BWAutoFocusROIAnalyticsPayload)_autoFocusROIAnalyticsPayloadWithSampleBuffer:(uint64_t)a3 error:(void *)a4 stillImageSettings:(void *)a5 metadata:
{
  if (!a1) {
    return 0;
  }
  if (!a2 || !a5 || (uint64_t v6 = [a4 captureSettings]) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = objc_alloc_init(BWAutoFocusROIAnalyticsPayload);
  uint64_t v9 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  [(BWAutoFocusROIAnalyticsPayload *)v8 setPortType:v9];
  -[BWAutoFocusROIAnalyticsPayload setFocusRegion:](v8, "setFocusRegion:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EC8]), "lastObject"));
  -[BWAutoFocusROIAnalyticsPayload setFocusRegionType:](v8, "setFocusRegionType:", objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53ED0]), "intValue"));
  objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EB0]), "floatValue");
  -[BWAutoFocusROIAnalyticsPayload setSubjectDistance:](v8, "setSubjectDistance:");
  -[BWAutoFocusROIAnalyticsPayload setClientApplicationID:](v8, "setClientApplicationID:", [v7 applicationID]);
  if (v9) {
    -[BWAutoFocusROIAnalyticsPayload setLuxLevel:](v8, "setLuxLevel:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v9), "luxLevel"));
  }
  return v8;
}

- (id)sampleBufferAvailableHandler
{
  return self->_sampleBufferAvailableHandler;
}

@end