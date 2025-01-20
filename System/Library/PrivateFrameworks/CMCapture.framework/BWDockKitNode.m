@interface BWDockKitNode
+ (void)initialize;
- (BOOL)customInferenceEnabled;
- (BWCinematicVideoFocusDetectionProvider)cinematicVideoFocusDetectionsProvider;
- (BWDockKitNode)initWithIsRunningForContinuityCapture:(BOOL)a3 cinematicVideoEnabled:(BOOL)a4;
- (NSString)clientApplicationID;
- (id)nodeSubType;
- (id)nodeType;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setCinematicVideoFocusDetectionsProvider:(id)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setCustomInferenceEnabled:(BOOL)a3;
@end

@implementation BWDockKitNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (id)nodeType
{
  return @"Effect";
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (DockKitCoreLibraryCore() && getDKTrackingAgentClass())
  {
    if (!self->_agent)
    {
      if (self->_isRunningForContinuityCapture)
      {
        if (dword_1E96B6968)
        {
          LODWORD(t1.a) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        clientApplicationID = @"continuitycapture";
      }
      else
      {
        clientApplicationID = (__CFString *)self->_clientApplicationID;
      }
      self->_agent = (DKTrackingAgent *)objc_alloc((Class)getDKTrackingAgentClass());
      SEL v9 = NSSelectorFromString(&cfstr_Initwithconfig.isa);
      char v10 = objc_opt_respondsToSelector();
      agent = self->_agent;
      if (v10)
      {
        v96[0] = clientApplicationID;
        v95[0] = @"appID";
        v95[1] = @"customInferenceEnabled";
        v96[1] = [NSNumber numberWithBool:self->_customInferenceEnabled];
        -[DKTrackingAgent performSelector:withObject:](agent, "performSelector:withObject:", v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2]);
      }
      else
      {
        [(DKTrackingAgent *)agent initWithClientApplicationID:clientApplicationID];
      }
      [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor start];
    }
    if (objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider)
      && !self->_dockingNotificationAgent
      && getDKNotificationAgentClass())
    {
      self->_dockingNotificationAgent = (DKNotificationAgent *)[objc_alloc((Class)getDKNotificationAgentClass()) init];
      objc_initWeak((id *)location, self);
      dockingNotificationAgent = self->_dockingNotificationAgent;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __45__BWDockKitNode_renderSampleBuffer_forInput___block_invoke;
      v81[3] = &unk_1E5C2B418;
      objc_copyWeak(&v82, (id *)location);
      [(DKNotificationAgent *)dockingNotificationAgent registerNotifications:v81];
      if ([(DKNotificationAgent *)self->_dockingNotificationAgent isTracking]) {
        [objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider) setFocusDetectionProviderEnabled:1];
      }
      objc_destroyWeak(&v82);
      objc_destroyWeak((id *)location);
    }
    v13 = self->_agent;
    if (!v13 || ([(DKTrackingAgent *)v13 tracking] & 1) == 0)
    {
      [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
      return;
    }
    if ([(BWGraph *)[(BWNode *)self graph] memoryAnalyticsReportingEnabled]) {
      [(BWMemoryAnalyticsPayload *)[(BWGraph *)[(BWNode *)self graph] memoryAnalyticsPayload] setDockKitDeviceConnected:1];
    }
    pixelBuffer = CMSampleBufferGetImageBuffer(a3);
    if (!pixelBuffer) {
      goto LABEL_75;
    }
    v14 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    if (!v14) {
      goto LABEL_75;
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v78 = 0u;
    v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F218], 0);
    v16 = v15;
    if (!v15 || [v15 length] != 48) {
      goto LABEL_75;
    }
    objc_msgSend(v16, "getBytes:length:", &v78, objc_msgSend(v16, "length"));
    unsigned int v17 = v78;
    int v69 = DWORD1(v79);
    double v71 = *(double *)&v80;
    v93[0] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v80), v78)));
    v93[1] = &unk_1EFB01550;
    v93[2] = [NSNumber numberWithFloat:v71];
    v94[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
    v92[0] = &unk_1EFB01550;
    LODWORD(v18) = v69;
    uint64_t v19 = [NSNumber numberWithFloat:v18];
    HIDWORD(v20) = HIDWORD(v71);
    v92[1] = v19;
    LODWORD(v20) = HIDWORD(v71);
    v92[2] = [NSNumber numberWithFloat:v20];
    v94[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:3];
    v94[2] = &unk_1EFB042C8;
    v68 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:3];
    v21 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
    if (!v21)
    {
      v42 = 0;
      goto LABEL_50;
    }
    *(void *)type = 0;
    uint64_t v76 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    long long v77 = _Q0;
    FigCFDictionaryGetCGRectIfPresent();
    BOOL v27 = *((double *)&v77 + 1) != 1.0 || *(double *)&v77 != 1.0;
    v28 = (id)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v21, 1uLL);
    if (v27)
    {
      size_t Width = CVPixelBufferGetWidth(pixelBuffer);
      double Height = (double)CVPixelBufferGetHeight(pixelBuffer);
      long long v31 = v77;
      memset(location, 0, 48);
      CGAffineTransformMakeTranslation(location, -0.0, -0.0);
      CGAffineTransformMakeScale(&t2, *(CGFloat *)&v77, *((CGFloat *)&v77 + 1));
      CGAffineTransform t1 = location[0];
      CGAffineTransformConcat(&v91, &t1, &t2);
      location[0] = v91;
      FigCaptureMakeMirrorAndRotateVideoTransform((int)(*(double *)&v31 * (double)Width + -1.0), (int)(*((double *)&v31 + 1) * Height + -1.0), 0, 0, (uint64_t)&v72);
      CGAffineTransform t1 = location[0];
      CGAffineTransformConcat(&v91, &t1, &v72);
      location[0] = v91;
      long long v32 = *(_OWORD *)&v91.a;
      long long v33 = *(_OWORD *)&v91.c;
      long long v34 = *(_OWORD *)&v91.tx;
      uint64_t v35 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v91.c), v17)));
      double v36 = *(double *)&v34 + *(double *)&v33 * *((float *)&v71 + 1) + *(double *)&v32 * *(float *)&v71;
      *(float *)&double v36 = v36;
      v89[0] = v35;
      v89[1] = &unk_1EFB01550;
      v89[2] = [NSNumber numberWithFloat:v36];
      v90[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:3];
      v88[0] = &unk_1EFB01550;
      LODWORD(v37) = v69;
      uint64_t v38 = [NSNumber numberWithFloat:v37];
      double v39 = *((double *)&v34 + 1)
          + *((double *)&v33 + 1) * *((float *)&v71 + 1)
          + *((double *)&v32 + 1) * *(float *)&v71;
      *(float *)&double v39 = v39;
      v88[1] = v38;
      v88[2] = [NSNumber numberWithFloat:v39];
      v90[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:3];
      v90[2] = &unk_1EFB042E0;
      v68 = objc_msgSend(v68, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v90, 3));
    }
    if ([v28 count])
    {
      v40 = (void *)[v28 objectForKey:@"HumanBodies"];
      v41 = (void *)[v28 objectForKey:@"HumanFaces"];
      if ([v40 count])
      {
        v42 = (void *)[v40 objectForKey:@"ObjectsArray"];
        if (![v42 count]) {
          v42 = 0;
        }
      }
      else
      {
        v42 = 0;
      }
      if ([v41 count])
      {
        v21 = (void *)[v41 objectForKey:@"ObjectsArray"];
        if (![v21 count]) {
          v21 = 0;
        }
LABEL_50:
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
        uint64_t v43 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
        if ([v21 count] || objc_msgSend(v42, "count"))
        {
          if ([v21 count]) {
            v44 = (void *)[MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v21];
          }
          else {
            v44 = (void *)MEMORY[0x1E4F1CBF0];
          }
          if ([v42 count]) {
            v44 = (void *)[v44 arrayByAddingObjectsFromArray:v42];
          }
          BOOL v45 = 1;
        }
        else
        {
          [(NSDate *)self->start timeIntervalSinceNow];
          BOOL v45 = fabs(v65) >= self->minFrameDuration + self->minFrameDuration;
          v44 = (void *)MEMORY[0x1E4F1CBF0];
        }
        if (self->_cinematicVideoEnabled
          && objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider)
          && [objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider) focusDetectionProviderEnabled])
        {
          v46 = (void *)[objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider) copyCinematicVideoFocusDetections];
          v47 = (void *)[v46 firstObject];
          v48 = v47;
          if (v47)
          {
            uint64_t v49 = [v47 identifier];
            [v48 rect];
            double v51 = v50;
            double v53 = v52;
            double v55 = v54;
            double v57 = v56;
            v85 = @"cinematography_selected";
            v83[0] = @"identifier";
            v84[0] = [NSNumber numberWithInteger:v49];
            v83[1] = @"X";
            v84[1] = [NSNumber numberWithDouble:v51];
            v83[2] = @"Y";
            v84[2] = [NSNumber numberWithDouble:v53];
            v83[3] = @"Width";
            v84[3] = [NSNumber numberWithDouble:v55];
            v83[4] = @"Height";
            v84[4] = [NSNumber numberWithDouble:v57];
            uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:5];
            uint64_t v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
            v44 = objc_msgSend(v44, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v87, 1));
          }
        }
        if (v45)
        {
          v58 = (void *)[MEMORY[0x1E4F1E050] imageWithCVImageBuffer:pixelBuffer];
          v59 = v58;
          if (!v58)
          {
LABEL_75:
            [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
            return;
          }
          v60 = self->_agent;
          [v58 extent];
          -[DKTrackingAgent trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:](v60, "trackWithMetadata:image:cameraPortType:cameraIntrinsics:referenceDimensions:orientation:completionHandler:", v44, v59, v43, v68, [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor mostRecentPortraitLandscapeOrientation], &__block_literal_global_101, v61, v62);
          self->start = (NSDate *)[MEMORY[0x1E4F1C9C8] date];
        }
        if (*MEMORY[0x1E4F1EBA8] == 1) {
          kdebug_trace();
        }
        v63 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[DKTrackingAgent getSelectedFaceIds](self->_agent, "getSelectedFaceIds"));
        v64 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[DKTrackingAgent getSelectedBodyIds](self->_agent, "getSelectedBodyIds"));
        if ([v63 count]) {
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53010], v63, 1u);
        }
        if ([v64 count]) {
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53008], v64, 1u);
        }
        goto LABEL_75;
      }
    }
    else
    {
      v42 = 0;
    }
    v21 = 0;
    goto LABEL_50;
  }
  output = self->super._output;
  [(BWNodeOutput *)output emitSampleBuffer:a3];
}

- (void)setCustomInferenceEnabled:(BOOL)a3
{
  self->_customInferenceEnabled = a3;
}

- (void)setClientApplicationID:(id)a3
{
}

- (BWDockKitNode)initWithIsRunningForContinuityCapture:(BOOL)a3 cinematicVideoEnabled:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BWDockKitNode;
  v6 = [(BWNode *)&v12 init];
  if (v6)
  {
    v7 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v6];
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v7 setFormatRequirements:v8];

    [(BWNodeInput *)v7 setPassthroughMode:1];
    [(BWNode *)v6 addInput:v7];

    SEL v9 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v6];
    char v10 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutput *)v9 setFormatRequirements:v10];

    [(BWNodeOutput *)v9 setPassthroughMode:1];
    [(BWNode *)v6 addOutput:v9];

    v6->_deviceOrientationMonitor = objc_alloc_init(BWDeviceOrientationMonitor);
    v6->start = (NSDate *)[MEMORY[0x1E4F1C9C8] date];
    v6->minFrameDuration = 0.0333333333;
    v6->_isRunningForContinuityCapture = a3;
    v6->_cinematicVideoEnabled = a4;
    v6->_dockingNotificationAgent = 0;
  }
  return v6;
}

- (void)setCinematicVideoFocusDetectionsProvider:(id)a3
{
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];
  [(DKTrackingAgent *)self->_agent stop];

  [(DKNotificationAgent *)self->_dockingNotificationAgent deregisterNotifications];
  v3.receiver = self;
  v3.super_class = (Class)BWDockKitNode;
  [(BWNode *)&v3 dealloc];
}

- (id)nodeSubType
{
  return @"CinematicFraming";
}

uint64_t __45__BWDockKitNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v3 = (void *)[objc_loadWeak((id *)(a1 + 32)) cinematicVideoFocusDetectionsProvider];
  return [v3 setFocusDetectionProviderEnabled:a2];
}

- (BWCinematicVideoFocusDetectionProvider)cinematicVideoFocusDetectionsProvider
{
  return (BWCinematicVideoFocusDetectionProvider *)objc_loadWeak((id *)&self->_cinematicVideoFocusDetectionsProvider);
}

- (BOOL)customInferenceEnabled
{
  return self->_customInferenceEnabled;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void).cxx_destruct
{
}

@end