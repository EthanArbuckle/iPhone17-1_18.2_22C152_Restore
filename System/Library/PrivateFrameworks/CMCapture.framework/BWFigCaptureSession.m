@interface BWFigCaptureSession
- (uint64_t)_doFlashMitigation;
- (void)_continuityDisplay:(uint64_t)a1 didUpdateLayout:(void *)a2;
- (void)_mainDisplay:(void *)a3 didUpdateLayout:;
- (void)_postFlashMitigationUserNotification;
- (void)dealloc;
- (void)fileCoordinator:(id)a3 sentMarkerBufferForFileWriterAction:(id)a4 withPTS:(id *)a5 settingsID:(int64_t)a6 errorCode:(int)a7;
- (void)fileCoordinator:(id)a3 stoppedBeforeStartedRecordingForSettings:(id)a4 pendingIrisMovieInfos:(id)a5 errorCode:(int)a6;
- (void)fileWriter:(id)a3 frameDroppedForSettingsID:(unint64_t)a4 withError:(int)a5;
- (void)fileWriter:(id)a3 pausedRecordingForSettingsID:(unint64_t)a4;
- (void)fileWriter:(id)a3 resumedRecordingForSettingsID:(unint64_t)a4;
- (void)fileWriter:(id)a3 startedRecordingForSettings:(id)a4 writerPipelineIndex:(unint64_t)a5 startPTS:(id *)a6;
- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingForSettings:(id)a5 withError:(int)a6 thumbnailSurface:(__IOSurface *)a7 irisMovieInfo:(id)a8 debugMetadataSidecarFileURL:(id)a9 recordingSucceeded:(BOOL)a10;
- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingSampleDataForSettingsID:(int64_t)a5;
- (void)graph:(id)a3 didFinishStartingWithError:(int)a4;
- (void)graph:(id)a3 didStartSourceNode:(id)a4 error:(int)a5;
- (void)graphDidPrepareNodes:(id)a3;
- (void)graphDidResolveRetainedBufferCounts:(id)a3;
- (void)imageQueueSinkNode:(id)a3 didAttemptToEnqueuePreviewSampleBuffer:(opaqueCMSampleBuffer *)a4 withSuccess:(BOOL)a5;
- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3;
- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3 atHostTime:(int64_t)a4;
- (void)initWithFigCaptureSession:(void *)result;
- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4;
- (void)node:(id)a3 format:(id)a4 didBecomeLiveForOutput:(id)a5;
- (void)postNotification:(id)a3 notificationPayload:(id)a4;
- (void)previewStitcher:(id)a3 didApplyWiderShift:(CGPoint)a4 widerScaleFactor:(float)a5 forWiderPortType:(id)a6 narrowerShift:(CGPoint)a7 narrowerScaleFactor:(float)a8 forNarrowerPortType:(id)a9 inSuperWideMacroMode:(BOOL)a10 widerShiftAtBaseZoom:(CGPoint)a11;
- (void)previewStitcher:(id)a3 overCaptureStatusDidChange:(int)a4;
- (void)previewStitcherReadyForPrimaryCaptureRectUpdates:(id)a3;
- (void)previewStitcherTrueVideoExitTransitionDidComplete:(id)a3;
- (void)remoteQueueSinkNode:(id)a3 dumpStateForReason:(id)a4;
- (void)remoteQueueSinkNode:(id)a3 localQueueBecameReady:(localQueueOpaque *)a4;
- (void)remoteQueueSinkNode:(id)a3 queueBecameReady:(remoteQueueSenderOpaque *)a4;
- (void)stagingNode:(id)a3 readyToReceiveRequestsWithEarliestAllowedStillImageCaptureHostPTS:(id *)a4;
- (void)stagingNode:(id)a3 valveClosedWithPendingIrisRequests:(id)a4;
- (void)stagingNode:(id)a3 waitingToEmitFrameWithPTS:(id *)a4;
- (void)stagingNode:(id)a3 willEmitIrisRequest:(id)a4;
- (void)stillImageCoordinator:(id)a3 didCancelMomentCaptureForSettingsID:(int64_t)a4 streamingDisruptionEndPTS:(id *)a5;
- (void)stillImageCoordinator:(id)a3 didCapturePhotoForSettings:(id)a4;
- (void)stillImageCoordinator:(id)a3 didResolveStillImagePTS:(id *)a4 forSettings:(id)a5 isPreBracketedEV0:(BOOL)a6;
- (void)stillImageCoordinator:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6;
- (void)stillImageCoordinator:(id)a3 readyToRespondToRequestAfterRequestWithSettings:(id)a4;
- (void)stillImageCoordinator:(id)a3 willBeginCaptureBeforeResolvingSettingsForID:(int64_t)a4;
- (void)stillImageCoordinator:(id)a3 willBeginCaptureForSettings:(id)a4;
- (void)stillImageCoordinator:(id)a3 willCapturePhotoForSettings:(id)a4 error:(int)a5;
- (void)stillImageCoordinator:(id)a3 willPrepareStillImageCaptureWithSettings:(id)a4 clientInitiated:(BOOL)a5;
- (void)videoPIPOverlayNode:(id)a3 overlayRectDidChange:(CGRect)a4;
@end

@implementation BWFigCaptureSession

- (void)previewStitcher:(id)a3 overCaptureStatusDidChange:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = self;
  v7[2] = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  v6[0] = @"SectionID";
  v7[0] = objc_msgSend((id)objc_msgSend((id)-[BWFigCaptureSession previewSinkPipelines](self, "previewSinkPipelines", a3), "firstObject"), "sinkID");
  v6[1] = @"Status";
  v7[1] = [NSNumber numberWithInt:v4];
  captureSession_postNotificationWithPayload(v5->_captureSession, @"OverCaptureStatusDidChange", (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2]);
}

- (void)previewStitcher:(id)a3 didApplyWiderShift:(CGPoint)a4 widerScaleFactor:(float)a5 forWiderPortType:(id)a6 narrowerShift:(CGPoint)a7 narrowerScaleFactor:(float)a8 forNarrowerPortType:(id)a9 inSuperWideMacroMode:(BOOL)a10 widerShiftAtBaseZoom:(CGPoint)a11
{
  double y = a11.y;
  double x = a11.x;
  BOOL v13 = a10;
  double v16 = a7.y;
  double v17 = a7.x;
  double v20 = a4.y;
  double v21 = a4.x;
  if (self)
  {
    v23 = [(FigCaptureSessionPipelines *)self->_pipelines firstColorCameraSourcePipeline];
    if (v23) {
      goto LABEL_5;
    }
    pipelines = self->_pipelines;
    goto LABEL_4;
  }
  pipelines = (FigCaptureSessionPipelines *)objc_msgSend(0, "firstColorCameraSourcePipeline", a3);
  v23 = (FigCaptureCameraSourcePipeline *)pipelines;
  if (!pipelines) {
LABEL_4:
  }
    v23 = [(NSArray *)[(FigCaptureSessionPipelines *)pipelines cameraSourcePipelines] firstObject];
LABEL_5:
  -[FigCaptureCameraSourcePipeline setPreviewShift:previewScaleFactor:forPortType:previewShiftAtBaseZoom:]((uint64_t)v23, (uint64_t)a6, v21, v20, a5, x, y);
  -[FigCaptureCameraSourcePipeline setPreviewShift:previewScaleFactor:forPortType:previewShiftAtBaseZoom:]((uint64_t)v23, (uint64_t)a9, v17, v16, a8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v25 = (void *)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v23);
  [v25 setOverCaptureSuperWideMacroActive:v13];
}

- (void)layoutMonitor:(id)a3 didUpdateLayout:(id)a4
{
  CMBaseObjectGetDerivedStorage();
  if ([a3 displayType])
  {
    if ([a3 displayType] == 2)
    {
      -[BWFigCaptureSession _continuityDisplay:didUpdateLayout:]((uint64_t)self, a3);
    }
  }
  else
  {
    -[BWFigCaptureSession _mainDisplay:didUpdateLayout:]((uint64_t)self, v7, a4);
  }
}

- (void)graphDidResolveRetainedBufferCounts:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  v3 = (void *)[(BWFigCaptureSession *)self movieFileSinkPipelines];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[FigCaptureMovieFileSinkPipeline setUpBackPressureForResolvedRetainedBufferCounts](*(void *)(*((void *)&v8 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __93__BWFigCaptureSession_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 216));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 224))
  {
    uint64_t v3 = *(void *)(v2 + 232);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 224);
    if (*(unsigned char *)(v2 + 240))
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = 1;
      *(unsigned char *)(v2 + 240) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 216));
    uint64_t v5 = *(void *)(a1 + 40);
    v6(v3, v4, v5);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 216));
  }
}

- (void)node:(id)a3 format:(id)a4 didBecomeLiveForOutput:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v10 = [(FigCaptureSessionPipelines *)self->_pipelines cameraSourcePipelines];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if ((id)-[FigCaptureCameraSourcePipeline sourceFormatReferenceOutput]((uint64_t)v15) == a5) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
    uint64_t v16 = [v15 sourceID];
    double v17 = (NSString *)v16;
    if (a4)
    {
      uint64_t v18 = [(id)-[FigCaptureCameraSourcePipeline captureSourceVideoFormat]((uint64_t)v15) formatDescription];
      if (v17) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v18 = 0;
      if (v16) {
        goto LABEL_19;
      }
    }
  }
LABEL_14:
  if ((id)-[FigCaptureMicSourcePipeline sourceNode]((uint64_t)[(FigCaptureSessionPipelines *)self->_pipelines micSourcePipeline]) == a3)
  {
    double v17 = [(FigCaptureSourcePipeline *)[(FigCaptureSessionPipelines *)self->_pipelines micSourcePipeline] sourceID];
    uint64_t v18 = [a4 formatDescription];
    if (a4)
    {
      if (!*(unsigned char *)(DerivedStorage + 313)) {
        *(unsigned char *)(DerivedStorage + 313) = objc_msgSend((id)-[FigCaptureMicSourcePipeline sourceNode]((uint64_t)-[FigCaptureSessionPipelines micSourcePipeline](self->_pipelines, "micSourcePipeline")), "didBeginInterruption");
      }
    }
    if (v17)
    {
LABEL_19:
      v19 = (const void *)cs_notificationPayloadForSectionFormatChanged((uint64_t)v17, v18);
      captureSession_postNotificationWithPayload(self->_captureSession, @"SourceFormatDidChange", v19);
    }
  }
}

- (void)imageQueueSinkNode:(id)a3 didAttemptToEnqueuePreviewSampleBuffer:(opaqueCMSampleBuffer *)a4 withSuccess:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v10 = -[FigCaptureSessionPipelines previewSinkPipelineWithSinkID:](self->_pipelines, "previewSinkPipelineWithSinkID:", [a3 sinkID]);
  if (v10)
  {
    uint64_t v11 = v10;
    os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
    if ([*(id *)(DerivedStorage + 472) containsObject:v11]
      && (captureSession_setPreviewRunning(self->_captureSession, 1, v11),
          [*(id *)(DerivedStorage + 472) removeObject:v11],
          ![*(id *)(DerivedStorage + 472) count]))
    {

      *(void *)(DerivedStorage + 472) = 0;
      *(unsigned char *)(DerivedStorage + 536) = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
      captureSession_makeCommittedConfigurationLive(self->_captureSession);
      if (!v5) {
        return;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
      if (!v5) {
        return;
      }
    }
    uint64_t v12 = *(NSObject **)(DerivedStorage + 248);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __93__BWFigCaptureSession_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke;
    v13[3] = &__block_descriptor_48_e5_v8__0l;
    v13[4] = DerivedStorage;
    v13[5] = a4;
    dispatch_sync(v12, v13);
  }
}

- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3
{
  uint64_t v4 = (unsigned char *)(CMBaseObjectGetDerivedStorage() + 537);
  captureSession = self->_captureSession;
  captureSession_updateDeferredGraphSetupStartCondition(captureSession, v4, 1);
}

- (void)_mainDisplay:(void *)a3 didUpdateLayout:
{
  if (a1)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!*(unsigned char *)DerivedStorage)
    {
      uint64_t v6 = DerivedStorage;
      if (*(unsigned char *)(DerivedStorage + 112))
      {
        if (objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(void *)(DerivedStorage + 88)))int v7 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(void *)(v6 + 88)) ^ 1; {
        else
        }
          int v7 = 0;
        os_unfair_lock_lock((os_unfair_lock_t)(v6 + 360));
        int v8 = *(_DWORD *)(v6 + 408);
        os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 360));
        if (([*(id *)(v6 + 88) isEqualToString:0x1EFA44100] & 1) != 0
          || [*(id *)(v6 + 88) isEqualToString:0x1EFA55980])
        {
          os_unfair_lock_lock(&sLockScreenCameraLaunchTelemetry);
          int v9 = byte_1E96B7690;
          int v10 = objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(void *)(v6 + 88));
          if (v9)
          {
            if (v10) {
              int v11 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(void *)(v6 + 88)) ^ 1;
            }
            else {
              int v11 = 0;
            }
            if (objc_msgSend((id)objc_msgSend(a3, "foregroundApps"), "containsObject:", *(void *)(v6 + 88))) {
              int v12 = 0;
            }
            else {
              int v12 = objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(void *)(v6 + 88)) ^ 1;
            }
            if ((v11 | v12) == 1)
            {
              byte_1E96B7690 = 0;
              if (v11) {
                qword_1E96B7698 = mach_absolute_time();
              }
              if (v12 && byte_1E96B767C && dword_1E96B768C && !v8) {
                captureSession_reportCancelledLockScreenCameraLaunch();
              }
            }
          }
          else if (v10 {
                 && objc_msgSend((id)objc_msgSend(a3, "transitioningApps"), "containsObject:", *(void *)(v6 + 88)))
          }
          {
            byte_1E96B7690 = 1;
          }
          os_unfair_lock_unlock(&sLockScreenCameraLaunchTelemetry);
        }
        if (v7 && !v8)
        {
          uint64_t v13 = (void *)MEMORY[0x1A6272C70]();
          uint64_t v14 = *(void **)(v6 + 88);
          uint64_t v15 = mach_absolute_time();
          uint64_t v16 = mach_continuous_time();
          FigCaptureSessionPrewarm(v14, v15, v16, @"FBSDisplayLayoutMonitor");
        }
        double v17 = *(const void **)(a1 + 8);
        captureSession_updateDeferredGraphSetupStartCondition(v17, (unsigned char *)(v6 + 538), v7);
      }
    }
  }
}

- (void)stagingNode:(id)a3 readyToReceiveRequestsWithEarliestAllowedStillImageCaptureHostPTS:(id *)a4
{
  BOOL v5 = self;
  if (self)
  {
    id v6 = [(FigCaptureSessionPipelines *)self->_pipelines movieFileSinkPipelineWithIrisStagingNode:a3];
    BOOL v5 = (BWFigCaptureSession *)v5->_pipelines;
  }
  else
  {
    id v6 = (id)[0 movieFileSinkPipelineWithIrisStagingNode:a3];
  }
  uint64_t v7 = objc_msgSend((id)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithSinkID:](v5, "stillImageSinkPipelineSessionStorageWithSinkID:", objc_msgSend(v6, "sinkID")), "cameraSourcePipeline");
  long long v13 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [(id)-[FigCaptureCameraSourcePipeline captureDevice](v7) setZeroShutterLagEarliestAllowedPTS:&v13];
  uint64_t v8 = [(id)-[FigCaptureCameraSourcePipeline captureDevice](v7) previewTimeMachineProcessor];
  if (v8)
  {
    int v9 = (void *)v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 earliestAllowedPTS];
      if (v12)
      {
        long long v10 = *(_OWORD *)&a4->var0;
        int64_t v11 = a4->var3;
        [v9 setEarliestAllowedPTS:&v10];
      }
    }
  }
}

- (void)remoteQueueSinkNode:(id)a3 queueBecameReady:(remoteQueueSenderOpaque *)a4
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  xpc_object_t xdict = 0;
  uint64_t v8 = [a3 sinkID];
  if (!v8) {
    goto LABEL_8;
  }
  uint64_t v9 = v8;
  if (FigRemoteQueueSenderCreateXPCObject((uint64_t)a4, &xdict)) {
    goto LABEL_8;
  }
  if (!*(unsigned char *)(DerivedStorage + 208))
  {
    CFTypeRef cf = 0;
    if (!FigRemoteQueueReceiverCreateFromXPCObject(*MEMORY[0x1E4F1CF80], xdict, (uint64_t *)&cf))
    {
      captureSession_postSinkRemoteQueueUpdatedNotification(self->_captureSession, v9, (uint64_t)cf);
      CFRelease(cf);
      goto LABEL_7;
    }
LABEL_8:
    FigDebugAssert3();
    goto LABEL_7;
  }
  captureSession_postSinkRemoteQueueUpdatedNotification(self->_captureSession, v9, (uint64_t)xdict);
LABEL_7:
  FigXPCRelease();
}

- (void)graphDidPrepareNodes:(id)a3
{
  uint64_t v3 = self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v4 = (void *)[(BWFigCaptureSession *)self videoDataSinkPipelines];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        OwnerOfUpstreamPoolFeedingInput = cs_findOwnerOfUpstreamPoolFeedingInput(objc_msgSend((id)objc_msgSend(v9, "sinkNode"), "input"));
        uint64_t v11 = [v9 sinkNode];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke;
        v41[3] = &unk_1E5C24458;
        v41[4] = v11;
        v41[5] = OwnerOfUpstreamPoolFeedingInput;
        [OwnerOfUpstreamPoolFeedingInput addPoolPreallocationCompletionHandler:v41];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v6);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  if (v3) {
    pipelines = v3->_pipelines;
  }
  else {
    pipelines = 0;
  }
  long long v13 = [(FigCaptureSessionPipelines *)pipelines previewSinkPipelines];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        [v18 prepareForRenderingWithPreparedPixelBufferPool];
        v19 = cs_findOwnerOfUpstreamPoolFeedingInput(objc_msgSend((id)objc_msgSend(v18, "imageQueueSinkNode"), "input"));
        uint64_t v20 = [v18 imageQueueSinkNode];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_2;
        v36[3] = &unk_1E5C24458;
        v36[4] = v20;
        v36[5] = v19;
        [v19 addPoolPreallocationCompletionHandler:v36];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v15);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (v3) {
    long long v21 = v3->_pipelines;
  }
  else {
    long long v21 = 0;
  }
  long long v22 = [(FigCaptureSessionPipelines *)v21 videoThumbnailSinkPipelines];
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * k);
        v28 = (void *)[(id)-[FigCaptureVideoThumbnailSinkPipeline imageQueueSinkNode](v27) input];
        v29 = cs_findOwnerOfUpstreamPoolFeedingInput(v28);
        uint64_t v30 = -[FigCaptureVideoThumbnailSinkPipeline imageQueueSinkNode](v27);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_3;
        v31[3] = &unk_1E5C24458;
        v31[4] = v30;
        v31[5] = v29;
        [v29 addPoolPreallocationCompletionHandler:v31];
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v24);
  }
}

- (void)imageQueueSinkNodeDidDisplayFirstFrame:(id)a3 atHostTime:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  captureSession = self->_captureSession;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (([*(id *)(DerivedStorage + 88) isEqualToString:0x1EFA44100] & 1) != 0
    || [*(id *)(DerivedStorage + 88) isEqualToString:0x1EFA55980])
  {
    pipelines = self->_pipelines;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v10 = [(FigCaptureSessionPipelines *)pipelines previewSinkPipelines];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((id)[v15 imageQueueSinkNode] == a3)
          {
            uint64_t v16 = (const void *)-[FigCaptureCameraSourcePipeline captureSource]((uint64_t)-[FigCaptureSessionPipelines cameraSourcePipelineWithSourceID:](pipelines, "cameraSourcePipelineWithSourceID:", [v15 sourceID]));
            if (v16)
            {
              double v17 = v16;
              CFRetain(v16);
              v19[0] = MEMORY[0x1E4F143A8];
              v19[1] = 3221225472;
              v19[2] = __73__BWFigCaptureSession_imageQueueSinkNodeDidDisplayFirstFrame_atHostTime___block_invoke;
              v19[3] = &__block_descriptor_56_e8_v12__0B8l;
              v19[4] = DerivedStorage;
              v19[5] = v17;
              v19[6] = a4;
              uint64_t v18 = CMBaseObjectGetDerivedStorage();
              captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, *(void *)(v18 + 640), (uint64_t)v19, 0.0);
            }
            return;
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)initWithFigCaptureSession:(void *)result
{
  if (result)
  {
    if (a2)
    {
      v3.receiver = result;
      v3.super_class = (Class)BWFigCaptureSession;
      result = objc_msgSendSuper2(&v3, sel_init);
      if (result) {
        result[1] = a2;
      }
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)videoPIPOverlayNode:(id)a3 overlayRectDidChange:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v8 = self;
  v13[2] = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v9 = objc_msgSend((id)-[BWFigCaptureSession previewSinkPipelines](self, "previewSinkPipelines", a3), "firstObject");
  if (v9)
  {
    long long v10 = (void *)v9;
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v14);
    v12[0] = @"SectionID";
    v12[1] = @"ZoomPIPOverlayRect";
    v13[0] = [v10 sinkID];
    v13[1] = DictionaryRepresentation;
    captureSession_postNotificationWithPayload(v8->_captureSession, @"ZoomPIPOverlayRectDidChange", (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2]);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)previewStitcherReadyForPrimaryCaptureRectUpdates:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v6 = [(NSArray *)[(FigCaptureSessionPipelines *)self->_pipelines previewSinkPipelines] firstObject];
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
  uint64_t v7 = *(void **)(DerivedStorage + 520);
  if (!v7)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    *(void *)(DerivedStorage + 520) = v7;
  }
  id v8 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(v6, "sinkID"));
  objc_msgSend(*(id *)(DerivedStorage + 520), "setObject:forKeyedSubscript:", v6, objc_msgSend(v6, "sinkID"));
  if (dword_1EB4C5110)
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "primaryCameraAspectRatio");
    double v11 = v10;
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "primaryCaptureRectCenterX");
    double v13 = v12;
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "trueVideoTransitionPercentComplete");
    objc_msgSend((id)objc_msgSend(v6, "previewStitcherNode"), "setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:", objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "trueVideoTransitionReferenceSampleBuffer"), 0, v11, v13, 0.0, v14);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
  if ([a3 waitsForFencedUpdateBeforeFirstEmit]) {
    captureSession_makeCommittedConfigurationLive(self->_captureSession);
  }
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(v8, "previewStitcherNode"), "markDelayedEndOfData");
    if (dword_1EB4C5110)
    {
      int v21 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v16 = objc_msgSend(v8, "imageQueueSinkNode", v17, v18);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__BWFigCaptureSession_previewStitcherReadyForPrimaryCaptureRectUpdates___block_invoke;
    v19[3] = &unk_1E5C24F10;
    v19[4] = v6;
    v19[5] = DerivedStorage;
    [v16 notifyWhenIdle:v19];
  }
  else
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "imageQueueSinkNode"), "input"), "connection"), "attachNow");
  }
}

void __73__BWFigCaptureSession_imageQueueSinkNodeDidDisplayFirstFrame_atHostTime___block_invoke(void *a1, int a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 360));
  id v4 = *(id *)(a1[4] + 456);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 360));
  id v5 = v4;
  os_unfair_lock_lock(&sFigCaptureSessionCameraAppStartupTelemetry);
  if (a2)
  {
    if (*(_DWORD *)(a1[4] + 408) != 2) {
      captureSession_abandonCameraAppSessionStartupTelemetry();
    }
    goto LABEL_39;
  }
  int v6 = dword_1EB4C5944;
  if (!dword_1EB4C5944) {
    goto LABEL_39;
  }
  int v7 = cs_captureSourceDeviceType(a1[5]);
  int v8 = cs_captureSourceCameraPosition(a1[5]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v9 = (void *)[v4 sourceConfigurations];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v54 count:16];
  int v39 = v6;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v14 sourceType] == 1)
        {
          int v15 = v7;
          int v16 = v8;
          int v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "AVCaptureSessionPresets"), "containsObject:", @"AVCaptureSessionPresetPhoto");
          goto LABEL_15;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  int v15 = v7;
  int v16 = v8;
  int v17 = 0;
LABEL_15:
  BOOL v18 = byte_1EB4C5948 == 0;
  if (a1[6] <= qword_1EB4C5968) {
    uint64_t v19 = qword_1EB4C5968;
  }
  else {
    uint64_t v19 = a1[6];
  }
  int v38 = FigHostTimeToNanoseconds();
  uint64_t v20 = (((int)FigHostTimeToNanoseconds() / 1000 + 999) / 1000);
  int v21 = v16;
  snprintf(__str, 0x40uLL, "%x,%x,%x,%x", v15, v16, v17, v18);
  if (v39 == 2)
  {
    int v22 = v17;
    if (*MEMORY[0x1E4F1EBA8])
    {
      long long v23 = xmmword_1EB4C5950;
      uint64_t v24 = fig_log_handle();
      if (os_signpost_enabled(v24))
      {
        uint64_t v25 = (char *)(v19 - v23 + *((void *)&v23 + 1));
        if (qword_1EB4C5980) {
          v26 = (const char *)[(id)qword_1EB4C5980 UTF8String];
        }
        else {
          v26 = "Unspecified";
        }
        *(_DWORD *)buf = 134219010;
        long long v45 = v25;
        __int16 v46 = 2082;
        *(void *)v47 = __str;
        *(_WORD *)&v47[8] = 2082;
        v48 = v26;
        __int16 v49 = 1026;
        int v50 = v20;
        __int16 v51 = 1026;
        int v52 = qword_1EB4C5988;
        v28 = "CameraAppLaunchWithOrigin";
        v29 = " enableTelemetry=YES %{signpost.description:end_time}llu S1=%{public,signpost.telemetry:string1}s S2=%{pub"
              "lic,signpost.telemetry:string2}s N1=%{public,signpost.telemetry:number1}d N2=%{public,signpost.telemetry:number2}d";
        uint64_t v30 = v24;
        uint32_t v31 = 44;
        goto LABEL_29;
      }
    }
  }
  else
  {
    int v22 = v17;
    if (v39 == 1)
    {
      if (*MEMORY[0x1E4F1EBA8])
      {
        uint64_t v27 = fig_log_handle();
        if (os_signpost_enabled(v27))
        {
          *(_DWORD *)buf = 136446722;
          long long v45 = __str;
          __int16 v46 = 1026;
          *(_DWORD *)v47 = v20;
          *(_WORD *)&v47[4] = 1026;
          *(_DWORD *)&v47[6] = qword_1EB4C5988;
          v28 = "CameraLaunchWithoutPrewarm";
          v29 = " enableTelemetry=YES S1=%{public,signpost.telemetry:string1}s N1=%{public,signpost.telemetry:number1}d N"
                "2=%{public,signpost.telemetry:number2}d";
          uint64_t v30 = v27;
          uint32_t v31 = 24;
LABEL_29:
          _os_signpost_emit_with_name_impl(&dword_1A5887000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v28, v29, buf, v31);
        }
      }
    }
  }
  if (v21 == 1) {
    int v32 = v22;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1)
  {
    long long v33 = +[BWAggdDataReporter sharedInstance];
    if (v39 == 2)
    {
      [(BWAggdDataReporter *)v33 reportCameraLaunchWithPrewarm:((v38 / 1000 + 999) / 1000) reason:qword_1EB4C5980];
      uint64_t v34 = qword_1EB4C5980;
      uint64_t v35 = 1;
      uint64_t v36 = ((v38 / 1000 + 999) / 1000);
    }
    else
    {
      [(BWAggdDataReporter *)v33 reportCameraLaunchWithoutPrewarm:v20];
      uint64_t v35 = 0;
      uint64_t v34 = 0;
      uint64_t v36 = v20;
    }
    cs_reportCameraAppLaunchCoreAnalyticsData(v35, v34, v36);
  }
  os_unfair_lock_assert_owner(&sFigCaptureSessionCameraAppStartupTelemetry);
  dword_1EB4C5944 = 0;
  byte_1EB4C5948 = 0;
  xmmword_1EB4C5950 = 0u;
  *(_OWORD *)&qword_1EB4C5960 = 0u;
  xmmword_1EB4C5970 = 0u;
  qword_1EB4C5988 = 0;
  *(uint64_t *)((char *)&qword_1EB4C5988 + 5) = 0;

  qword_1EB4C5980 = 0;
LABEL_39:
  os_unfair_lock_unlock(&sFigCaptureSessionCameraAppStartupTelemetry);
  long long v37 = (const void *)a1[5];
  if (v37) {
    CFRelease(v37);
  }
}

- (void)graph:(id)a3 didFinishStartingWithError:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (dword_1EB4C5110)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v4)
  {
    int v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (v4 == -12689 || v4 == -12785)
    {
      uint64_t v9 = (unsigned char *)(DerivedStorage + 380);
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      uint64_t v9 = (unsigned char *)(DerivedStorage + 372);
    }
    captureSession_updateSessionStateWithNewInputCondition(self->_captureSession, v9, v10, v4, 0);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFigCaptureSession;
  [(BWFigCaptureSession *)&v3 dealloc];
}

- (void)postNotification:(id)a3 notificationPayload:(id)a4
{
}

- (void)fileCoordinator:(id)a3 sentMarkerBufferForFileWriterAction:(id)a4 withPTS:(id *)a5 settingsID:(int64_t)a6 errorCode:(int)a7
{
  int v8 = self;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3052000000;
  int v17 = __Block_byref_object_copy__24;
  BOOL v18 = __Block_byref_object_dispose__24;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v19 = 0;
  uint64_t v19 = -[BWFigCaptureSession movieFileSinkPipelineWithFileCoordinatorNode:](self, "movieFileSinkPipelineWithFileCoordinatorNode:", a3, a4, a5, a6, *(void *)&a7);
  v12[0] = 0;
  v12[1] = v12;
  void v12[2] = 0x3052000000;
  v12[3] = __Block_byref_object_copy__24;
  v12[4] = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  uint64_t v13 = -[FigCaptureMovieFileSinkPipeline irisStagingNode](v15[5]);
  if (([a4 isEqualToString:0x1EFA73560] & 1) != 0
    || ([a4 isEqualToString:0x1EFA735E0] & 1) != 0
    || [a4 isEqualToString:0x1EFA735C0])
  {
    captureSession = v8->_captureSession;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__BWFigCaptureSession_fileCoordinator_sentMarkerBufferForFileWriterAction_withPTS_settingsID_errorCode___block_invoke;
    v11[3] = &unk_1E5C286D0;
    v11[4] = v8;
    v11[5] = v12;
    v11[6] = &v14;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, *(void *)(DerivedStorage + 640), (uint64_t)v11, 0.0);
  }
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
}

unint64_t __104__BWFigCaptureSession_fileCoordinator_sentMarkerBufferForFileWriterAction_withPTS_settingsID_errorCode___block_invoke(unint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = (void *)result;
    objc_super v3 = *(void **)(*(void *)(*(void *)(result + 40) + 8) + 40);
    if (v3) {
      [v3 closeValve];
    }
    uint64_t v4 = *(void *)(v2[4] + 8);
    uint64_t v5 = -[FigCaptureMovieFileSinkPipeline videoSourceID](*(void *)(*(void *)(v2[6] + 8) + 40));
    result = captureSession_setRestoreForcedOffOverCaptureActiveSlaveStreamEnabled(v4, v5, 1);
    if (*(void *)(*(void *)(v2[5] + 8) + 40))
    {
      int v6 = *(const void **)(v2[4] + 8);
      int v7 = *(void **)(*(void *)(v2[6] + 8) + 40);
      return captureSession_servicePendingIrisRecordings(v6, v7, 1);
    }
  }
  return result;
}

- (void)fileCoordinator:(id)a3 stoppedBeforeStartedRecordingForSettings:(id)a4 pendingIrisMovieInfos:(id)a5 errorCode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v9 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__24;
  v26 = __Block_byref_object_dispose__24;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v27 = 0;
  uint64_t v27 = [(BWFigCaptureSession *)self movieFileSinkPipelineWithFileCoordinatorNode:a3];
  captureSession = v9->_captureSession;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __112__BWFigCaptureSession_fileCoordinator_stoppedBeforeStartedRecordingForSettings_pendingIrisMovieInfos_errorCode___block_invoke;
  v21[3] = &unk_1E5C286F8;
  v21[4] = &v22;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, *(void *)(DerivedStorage + 640), (uint64_t)v21, 0.0);
  if (a4)
  {
    cs_resetImageControlModeAndStreamSelection(v23[5], 0);
    uint64_t v12 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([(id)v23[5] sinkID], objc_msgSend(a4, "settingsID"), v6);
    captureSession_postNotificationWithPayload(v9->_captureSession, @"DidStopRecording", v12);
  }
  else if (a5)
  {
    mach_absolute_time();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v13 = [a5 countByEnumeratingWithState:&v17 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(a5);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v16 enqueuedHostTime];
          [v16 setProcessingTimeInMilliseconds:(double)FigHostTimeToNanoseconds() / 1000000.0];
          captureSession_postNotificationsForIrisRequestCompletedWithError(v9->_captureSession, [(id)v23[5] sinkID], v16, v6);
        }
        uint64_t v13 = [a5 countByEnumeratingWithState:&v17 objects:v28 count:16];
      }
      while (v13);
    }
  }
  _Block_object_dispose(&v22, 8);
}

uint64_t __112__BWFigCaptureSession_fileCoordinator_stoppedBeforeStartedRecordingForSettings_pendingIrisMovieInfos_errorCode___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40) setRecording:0];
  }
  return result;
}

- (void)fileWriter:(id)a3 startedRecordingForSettings:(id)a4 writerPipelineIndex:(unint64_t)a5 startPTS:(id *)a6
{
  int v10 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([a3 sinkID], objc_msgSend(a4, "settingsID"), 0);
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
  objc_opt_class();
  uint64_t v12 = kFigCaptureSessionFileSinkNotification_DidStartRecording;
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      pipelines = self->_pipelines;
    }
    else {
      pipelines = 0;
    }
    uint64_t v14 = (void *)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)[(FigCaptureSessionPipelines *)pipelines movieFileSinkPipelineWithFileSinkNode:a3]);
    int v15 = (void *)[a4 videoSettings];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", @"AVVideoWidthKey"), @"MovieWidth");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", @"AVVideoHeightKey"), @"MovieHeight");
    uint64_t v16 = NSNumber;
    [v14 torchLevel];
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithInt:", v17 != 0.0), @"TorchEnabled");
    if ([a4 isIrisRecording]) {
      uint64_t v12 = kFigCaptureSessionIrisStillImageSinkNotification_DidStartRecordingIrisMovie;
    }
    int v10 = v11;
  }
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a6;
  CFDictionaryRef v19 = CMTimeCopyAsDictionary((CMTime *)&v20, v18);
  [v11 setObject:v19 forKeyedSubscript:@"StartPTS"];

  captureSession_postNotificationWithPayload(self->_captureSession, *v12, v10);
}

- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingSampleDataForSettingsID:(int64_t)a5
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v10 = [(FigCaptureSessionPipelines *)self->_pipelines movieFileSinkPipelineWithFileSinkNode:a3];
  if (v10)
  {
    unint64_t v11 = (unint64_t)v10;
    uint64_t v12 = (os_unfair_lock_s *)(DerivedStorage + 360);
    os_unfair_lock_lock(v12);
    -[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:](v11, 0, a4);
    char v13 = -[FigCaptureMovieFileSinkPipeline atLeastOneTailIsRecording](v11);
    os_unfair_lock_unlock(v12);
    if ((v13 & 1) == 0)
    {
      id v14 = [(FigCaptureSessionPipelines *)self->_pipelines audioFileSinkPipelineWithFileSinkNode:a3];
      uint64_t v15 = -[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](v11);
      if (!v15) {
        uint64_t v15 = -[FigCaptureAudioFileSinkPipeline fileCoordinatorNode]((uint64_t)v14);
      }
      id v16 = +[FigWeakReference weakReferenceToObject:v15];
      id v17 = +[FigWeakReference weakReferenceToObject:v11];
      captureSession = self->_captureSession;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __94__BWFigCaptureSession_fileWriter_writerPipelineIndex_stoppedRecordingSampleDataForSettingsID___block_invoke;
      v20[3] = &unk_1E5C28720;
      v20[4] = v16;
      v20[5] = v17;
      v20[6] = a5;
      uint64_t v19 = CMBaseObjectGetDerivedStorage();
      captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, *(void *)(v19 + 640), (uint64_t)v20, 0.0);
    }
  }
}

uint64_t __94__BWFigCaptureSession_fileWriter_writerPipelineIndex_stoppedRecordingSampleDataForSettingsID___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[*(id *)(result + 32) referencedObject];
    uint64_t v5 = (void *)[*(id *)(v3 + 40) referencedObject];
    [v4 recordingTerminated:*(void *)(v3 + 48)];
    return [v5 setRecording:0];
  }
  return result;
}

- (void)fileWriter:(id)a3 writerPipelineIndex:(unint64_t)a4 stoppedRecordingForSettings:(id)a5 withError:(int)a6 thumbnailSurface:(__IOSurface *)a7 irisMovieInfo:(id)a8 debugMetadataSidecarFileURL:(id)a9 recordingSucceeded:(BOOL)a10
{
  uint64_t v11 = *(void *)&a6;
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v16 = [(FigCaptureSessionPipelines *)self->_pipelines movieFileSinkPipelineWithFileSinkNode:a3];
  uint64_t v34 = [a9 path];
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
  if (v11 == -16414)
  {
    if (*(unsigned char *)(DerivedStorage + 372)) {
      uint64_t v11 = 4294950882;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
  if (v16)
  {
    char v17 = [a5 isIrisRecording];
    int v18 = [a5 isIrisMovieRecording];
    if (v17)
    {
      int v19 = 1;
    }
    else
    {
      cs_resetImageControlModeAndStreamSelection((uint64_t)v16, 0);
      if ([v16 recordedWhileMultitasking])
      {
        [v16 setRecordedWhileMultitasking:0];
        captureSession_showRecordingVideoWhileMultitaskingDialogIfNecessary();
      }
      int v19 = 0;
    }
  }
  else
  {
    int v19 = 0;
    int v18 = 0;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = (void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([a3 sinkID], objc_msgSend(a5, "settingsID"), v11);
  if (v19)
  {
    if (!a8) {
      return;
    }
    int v21 = [a8 spatialOverCaptureExpected];
    if (a4)
    {
      if (!v21) {
        return;
      }
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
    [a8 movieTrimEndTime];
    [a8 movieTrimStartTime];
    CMTimeSubtract(&time, &lhs, &rhs);
    CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef v23 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    [v20 setObject:CFAutorelease(v23) forKeyedSubscript:@"MovieDuration"];
    if (objc_msgSend((id)objc_msgSend(a8, "outputMovieURL"), "isEqual:", objc_msgSend(a8, "spatialOverCaptureOutputMovieURL")))objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], @"IsSpatialOverCaptureMovie"); {
    memset(&v38, 0, sizeof(v38));
    }
    [a8 stillImageCaptureTime];
    [a8 movieTrimStartTime];
    CMTimeSubtract(&v38, &v37, &v36);
    CMTime v35 = v38;
    CFDictionaryRef v24 = CMTimeCopyAsDictionary(&v35, v22);
    [v20 setObject:CFAutorelease(v24) forKeyedSubscript:@"StillImageDisplayTime"];
    if (objc_msgSend((id)objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v16), "objectAtIndexedSubscript:", 0), "irisSampleReferenceMoviesEnabled"))
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a8, "isFinalReferenceMovie")), @"IsFinalReferenceMovie");
      if ([a8 masterMovieURL]) {
        objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a8, "masterMovieURL"), "path"), @"MasterMoviePath");
      }
    }
    objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a8, "isOriginalPhotoRecording")), @"IsOriginalPhotoMovie");
    if (objc_msgSend((id)objc_msgSend(a8, "settings"), "metadataIdentifiersEnabled")
      && [a8 isVitalityScoreValid])
    {
      v42[0] = *MEMORY[0x1E4F344B0];
      uint64_t v25 = NSNumber;
      [a8 vitalityScore];
      v43[0] = objc_msgSend(v25, "numberWithFloat:");
      v42[1] = *MEMORY[0x1E4F344B8];
      v43[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a8, "vitalityScoringVersion"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v43, v42, 2), @"MetadataIdentifiers");
    }
  }
  if (a7 || v34 || v11)
  {
    v26 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = v26;
    if (a7)
    {
      [v26 setObject:a7 forKeyedSubscript:@"PreviewSurface"];
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", IOSurfaceGetAllocSize(a7)), @"PreviewSurfaceSize");
    }
    if (v34) {
      [v20 setObject:v34 forKeyedSubscript:@"DebugMetadataSidecarFilePath"];
    }
    if (v11) {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", a10), @"RecordingSucceeded");
    }
    if (a4 == 1) {
      char v27 = v19;
    }
    else {
      char v27 = 1;
    }
    if ((v27 & 1) == 0) {
      [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsSpatialOverCaptureMovie"];
    }
    if (v16)
    {
      memset(&v38, 0, sizeof(v38));
      if (a3) {
        [a3 lastFileDuration];
      }
      CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CMTime v35 = v38;
      CFDictionaryRef v29 = CMTimeCopyAsDictionary(&v35, v28);
      [v20 setObject:v29 forKeyedSubscript:@"MovieDuration"];
      if (v29) {
        CFRelease(v29);
      }
    }
  }
  if (v19)
  {
    uint64_t v30 = kFigCaptureSessionIrisStillImageSinkNotification_DidFinishRecordingMomentCaptureMovie;
    if (!v18) {
      uint64_t v30 = kFigCaptureSessionIrisStillImageSinkNotification_DidFinishRecordingIrisMovie;
    }
    uint32_t v31 = *v30;
    cs_reportLivePhotoMovieCoreAnalyticsData((uint64_t)self->_captureSession, a8, v11, a10);
  }
  else
  {
    uint32_t v31 = @"DidStopRecording";
  }
  captureSession_postNotificationWithPayload(self->_captureSession, v31, v20);
}

- (void)fileWriter:(id)a3 pausedRecordingForSettingsID:(unint64_t)a4
{
  uint64_t v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([a3 sinkID], a4, 0);
  captureSession = self->_captureSession;
  captureSession_postNotificationWithPayload(captureSession, @"DidPauseRecording", v5);
}

- (void)fileWriter:(id)a3 resumedRecordingForSettingsID:(unint64_t)a4
{
  uint64_t v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([a3 sinkID], a4, 0);
  captureSession = self->_captureSession;
  captureSession_postNotificationWithPayload(captureSession, @"DidResumeRecording", v5);
}

- (void)fileWriter:(id)a3 frameDroppedForSettingsID:(unint64_t)a4 withError:(int)a5
{
  uint64_t v6 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus([a3 sinkID], a4, *(uint64_t *)&a5);
  captureSession = self->_captureSession;
  captureSession_postNotificationWithPayload(captureSession, @"DidDropFrameWhileRecording", v6);
}

- (void)stillImageCoordinator:(id)a3 willBeginCaptureBeforeResolvingSettingsForID:(int64_t)a4
{
  uint64_t v4 = self;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v5 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend((id)-[BWFigCaptureSession stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3), "stillImageSinkPipeline"), "sinkID"), a4, 0);
  captureSession = v4->_captureSession;
  captureSession_postNotificationWithPayload(captureSession, @"IrisWillBeginCaptureBeforeResolvingSettings", v5);
}

- (void)stillImageCoordinator:(id)a3 willBeginCaptureForSettings:(id)a4
{
  uint64_t v5 = self;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v6 = (void *)[(BWFigCaptureSession *)self stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  int v7 = (void *)[v6 stillImageSinkPipeline];
  uint64_t v8 = [v6 cameraSourcePipeline];
  if (v5) {
    pipelines = v5->_pipelines;
  }
  else {
    pipelines = 0;
  }
  cs_setSceneClassifierSuspended(pipelines, v6, 1);
  id v10 = (void *)[a4 requestedSettings];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend(v7, "sinkID"), objc_msgSend(v10, "settingsID"), 0));
    int v12 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType");
    unint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags");
    BOOL v14 = 0;
    if ((v13 & 0x10000) != 0) {
      BOOL v14 = [v10 outputFormat] != 0;
    }
    v107 = v5;
    int v116 = objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "processIntelligentDistortionCorrection");
    if (v12 == 12 || v12 == 10)
    {
      uint64_t v108 = (v13 >> 20) & 1;
      BOOL v109 = (int)[v10 qualityPrioritization] > 1;
    }
    else
    {
      LODWORD(v108) = v12 == 3;
      BOOL v109 = (v12 & 0xFFFFFFFE) == 4;
    }
    int v114 = [v10 squareCropEnabled];
    int v111 = [v10 movieMode];
    int v110 = [v10 rawOutputFormat];
    int v15 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverDeferredPhotoProxyImage");
    id v16 = NSNumber;
    if (v15) {
      uint64_t v17 = [v10 deferredPhotoFinalWidth];
    }
    else {
      uint64_t v17 = [v10 outputWidth];
    }
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithUnsignedInt:", v17), @"StillWidth");
    int v18 = NSNumber;
    int v120 = v15;
    unint64_t v118 = v13;
    uint64_t v112 = v8;
    int v19 = v12;
    if (v15) {
      uint64_t v20 = [v10 deferredPhotoFinalHeight];
    }
    else {
      uint64_t v20 = [v10 outputHeight];
    }
    v122 = v11;
    objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v18, "numberWithUnsignedInt:", v20), @"StillHeight");
    int v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "photoManifest"), "photoDescriptors");
    CFAllocatorRef v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v127 objects:v140 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v128 != v25) {
            objc_enumerationMutation(v21);
          }
          objc_msgSend(v22, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v127 + 1) + 8 * i), "processingFlags")));
        }
        uint64_t v24 = [v21 countByEnumeratingWithState:&v127 objects:v140 count:16];
      }
      while (v24);
    }
    [v11 setObject:v22 forKeyedSubscript:@"PhotoManifest"];
    if (v110)
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "outputWidth")), @"RawStillWidth");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "outputHeight")), @"RawStillHeight");
    }
    if ([v10 previewEnabled])
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "previewWidth")), @"PreviewWidth");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "previewHeight")), @"PreviewHeight");
    }
    if ([v10 thumbnailEnabled])
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "thumbnailWidth")), @"ThumbnailWidth");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "thumbnailHeight")), @"ThumbnailHeight");
    }
    if ([v10 rawThumbnailEnabled])
    {
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "rawThumbnailWidth")), @"RawThumbnailWidth");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "rawThumbnailHeight")), @"RawThumbnailHeight");
    }
    if (v111)
    {
      char v27 = objc_msgSend((id)objc_msgSend(v10, "movieRecordingSettings"), "videoSettings");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v27, "objectForKeyedSubscript:", @"AVVideoWidthKey"), @"IrisMovieWidth");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v27, "objectForKeyedSubscript:", @"AVVideoHeightKey"), @"IrisMovieHeight");
    }
    if ([v10 portraitEffectsMatteDeliveryEnabled])
    {
      uint64_t v28 = -[FigCaptureCameraSourcePipeline captureSource](v112);
      objc_msgSend(cs_captureSourceGetAttribute(v28, @"PortraitEffectsMatteMainImageDownscalingFactor"), "floatValue");
      float v30 = v29;
      uint32_t v31 = NSNumber;
      *(float *)&double v32 = (float)[v10 outputWidth] / v29;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v31, "numberWithFloat:", v32), @"PortraitEffectsMatteWidth");
      long long v33 = NSNumber;
      *(float *)&double v34 = (float)[v10 outputHeight] / v30;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v33, "numberWithFloat:", v34), @"PortraitEffectsMatteHeight");
    }
    if (objc_msgSend((id)objc_msgSend(v10, "enabledSemanticSegmentationMatteURNs"), "count"))
    {
      uint64_t v35 = -[FigCaptureCameraSourcePipeline captureSource](v112);
      objc_msgSend(cs_captureSourceGetAttribute(v35, @"PortraitEffectsMatteMainImageDownscalingFactor"), "floatValue");
      if (v36 == 0.0)
      {
        float v38 = 0.0;
        float v39 = 0.0;
      }
      else
      {
        float v37 = v36;
        float v38 = (float)[v10 outputWidth] / v36;
        float v39 = (float)[v10 outputHeight] / v37;
      }
      long long v40 = (void *)[v10 enabledSemanticSegmentationMatteURNs];
      if ([v40 containsObject:*MEMORY[0x1E4F55FC8]])
      {
        *(float *)&double v41 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v41), @"HairSegmentationMatteWidth");
        *(float *)&double v42 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v42), @"HairSegmentationMatteHeight");
      }
      long long v43 = (void *)[v10 enabledSemanticSegmentationMatteURNs];
      if ([v43 containsObject:*MEMORY[0x1E4F55FD0]])
      {
        *(float *)&double v44 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v44), @"SkinSegmentationMatteWidth");
        *(float *)&double v45 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v45), @"SkinSegmentationMatteHeight");
      }
      __int16 v46 = (void *)[v10 enabledSemanticSegmentationMatteURNs];
      if ([v46 containsObject:*MEMORY[0x1E4F55FE0]])
      {
        *(float *)&double v47 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v47), @"TeethSegmentationMatteWidth");
        *(float *)&double v48 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v48), @"TeethSegmentationMatteHeight");
      }
      __int16 v49 = (void *)[v10 enabledSemanticSegmentationMatteURNs];
      if ([v49 containsObject:*MEMORY[0x1E4F55FC0]])
      {
        *(float *)&double v50 = v38;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v50), @"GlassesSegmentationMatteWidth");
        *(float *)&double v51 = v39;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v51), @"GlassesSegmentationMatteHeight");
      }
    }
    if (v19 == 2)
    {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"FlashActive"];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v14), @"RedEyeReductionEnabled");
    }
    if (v108)
    {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HDRActive"];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "deliverOriginalImage")), @"OriginalPhotoDeliveryEnabled");
    }
    if (v109) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SISActive"];
    }
    if ((v118 & 0x400) != 0) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"BravoImageFusionActive"];
    }
    if (v114) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SquareCropEnabled"];
    }
    if (v116) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IDCEnabled"];
    }
    if ((v118 & 0x4000000000) != 0) {
      [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"StereoPhotoEnabled"];
    }
    if (v19 == 11)
    {
      int v52 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType");
      if (([v52 isEqualToString:*MEMORY[0x1E4F52DF8]] & 1) != 0
        || [v52 isEqualToString:*MEMORY[0x1E4F52E10]])
      {
        v53 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureStreamSettingsForPortType:", v52), "adaptiveBracketingParameters");
        [v53 previewSNR];
        unsigned int v55 = v54 < 0.0;
        if ([v10 digitalFlashMode] == 2)
        {
          if ([v53 stationary])
          {
            [v53 previewSNR];
            if (v56 < -12.0) {
              v55 |= 2u;
            }
          }
        }
        if (((unint64_t)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureFlags") >> 34) & 2 | v55) {
          objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"DigitalFlashUserInterfaceHints");
        }
        objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "frameStatisticsByPortType"), "objectForKeyedSubscript:", v52), "displayStrobeRGBEstimate"), @"DigitalFlashUserInterfaceRGBEstimate");
      }
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v57 = [v21 countByEnumeratingWithState:&v123 objects:v139 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v124;
      while (2)
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v124 != v59) {
            objc_enumerationMutation(v21);
          }
          if (([*(id *)(*((void *)&v123 + 1) + 8 * j) processingFlags] & 8) != 0)
          {
            [v122 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ProcessedFiltersEnabled"];
            goto LABEL_83;
          }
        }
        uint64_t v58 = [v21 countByEnumeratingWithState:&v123 objects:v139 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }
LABEL_83:
    if (v120)
    {
      objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "deferredPhotoProxyWidth")), @"DeferredPhotoProxyWidth");
      objc_msgSend(v122, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "deferredPhotoProxyHeight")), @"DeferredPhotoProxyHeight");
    }
    v61 = (void *)[a4 captureSettings];
    objc_msgSend((id)objc_msgSend(a4, "processingSettings"), "photoManifest");
    CMTimeValue value = *MEMORY[0x1E4F1FA20];
    CMTimeFlags v119 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
    CMTimeValue v115 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
    CMTimeEpoch v117 = *(void *)(MEMORY[0x1E4F1FA20] + 16);
    uint64_t v121 = *(void *)(MEMORY[0x1E4F1FA20] + 32);
    CMTimeEpoch v113 = *(void *)(MEMORY[0x1E4F1FA20] + 40);
    int v62 = [v61 captureType];
    char v63 = [v61 sceneFlags];
    int v64 = [v61 captureFlags];
    v65 = objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "photoProcessingTimeRangesInMS");
    v66 = (void *)[v61 masterPortType];
    v67 = (void *)[v61 captureStreamSettingsForPortType:v66];
    v68 = objc_msgSend((id)objc_msgSend(v61, "frameStatisticsByPortType"), "objectForKeyedSubscript:", v66);
    if (v65)
    {
      int64_t v69 = 0;
      float v70 = 0.5;
      v71 = v68;
      char v72 = v63;
      int64_t v73 = 0;
      switch(v62)
      {
        case 1:
          if (([v61 captureFlags] & 0x80) == 0) {
            goto LABEL_98;
          }
          v78 = @"WYSIWYG-LearnedNR";
          if (![v65 objectForKeyedSubscript:@"WYSIWYG-LearnedNR"]) {
            goto LABEL_98;
          }
          goto LABEL_99;
        case 2:
          int64_t v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", @"Flash"), "objectForKeyedSubscript:", @"Min"), "integerValue");
          int64_t v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", @"Flash"), "objectForKeyedSubscript:", @"Max"), "integerValue");
          float v70 = 0.1;
          goto LABEL_120;
        case 3:
          v75 = @"HDR";
          goto LABEL_119;
        case 4:
        case 5:
          [v68 integrationTime];
          if (v74 <= 0.0588235294 || ([v66 isEqualToString:*MEMORY[0x1E4F52DF0]] & 1) != 0) {
            v75 = @"Dim-SIS";
          }
          else {
            v75 = @"Dark-SIS";
          }
          goto LABEL_119;
        case 6:
        case 8:
LABEL_98:
          v78 = @"WYSIWYG";
LABEL_99:
          uint64_t v79 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v78), "objectForKeyedSubscript:", @"Min"), "integerValue");
          uint64_t v80 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v78), "objectForKeyedSubscript:", @"Max"), "integerValue");
          if (v62 == 6) {
            int64_t v69 = v79 + 250;
          }
          else {
            int64_t v69 = v79;
          }
          if (v62 == 6) {
            int64_t v73 = v80 + 250;
          }
          else {
            int64_t v73 = v80;
          }
          goto LABEL_105;
        case 7:
          if ([v10 bracketType] == 1)
          {
            *(_OWORD *)&v134.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
            v134.start.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            if ([v10 bracketImageCount])
            {
              uint64_t v81 = 0;
              unint64_t v82 = 0;
              do
              {
                uint64_t v83 = [v10 exposureDurations];
                CMTime lhs = v134.start;
                long long v84 = *(_OWORD *)(v83 + v81);
                rhs.CMTimeEpoch epoch = *(void *)(v83 + v81 + 16);
                *(_OWORD *)&rhs.CMTimeValue value = v84;
                CMTimeAdd(&v134.start, &lhs, &rhs);
                ++v82;
                v81 += 24;
              }
              while (v82 < [v10 bracketImageCount]);
            }
            CMTime lhs = v134.start;
            int64_t v69 = (uint64_t)(CMTimeGetSeconds(&lhs) * 1000.0);
            int64_t v73 = (uint64_t)((double)v69 * 1.1);
LABEL_105:
            float v70 = 0.25;
          }
          else
          {
            float v70 = 0.25;
            if ([v10 bracketType] == 2)
            {
              [v71 integrationTime];
              double v97 = v96;
              if ([v10 bracketImageCount])
              {
                unint64_t v98 = 0;
                int64_t v73 = 0;
                double v99 = 1.79769313e308;
                do
                {
                  float v100 = *(float *)([v10 exposureTargetBiases] + 4 * v98);
                  double v101 = v100;
                  BOOL v102 = v100 < 0.0;
                  if (v100 <= 0.0)
                  {
                    double v103 = 1.0;
                    if (v102) {
                      double v103 = fabs(1.0 / (v101 + v101));
                    }
                  }
                  else
                  {
                    double v103 = v101 + v101;
                  }
                  int64_t v73 = (uint64_t)((double)v73 + v97 * v103 * 1000.0);
                  if (v103 < v99) {
                    double v99 = v103;
                  }
                  ++v98;
                }
                while (v98 < [v10 bracketImageCount]);
              }
              else
              {
                int64_t v73 = 0;
                double v99 = 1.79769313e308;
              }
              int64_t v69 = (uint64_t)(v97 * v99 * 1000.0 * (double)[v10 bracketImageCount]);
            }
            else
            {
              int64_t v69 = 0;
              int64_t v73 = 0;
            }
          }
LABEL_120:
          if (objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count"))
          {
            float v93 = 1.0;
            CMTimeFlags flags = v119;
            CMTimeValue v88 = v115;
            CMTimeEpoch epoch = v117;
            CMTimeEpoch v90 = v113;
            if ((unint64_t)objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count") >= 2)
            {
              unint64_t v94 = 1;
              do
              {
                float v93 = v70 + v93;
                ++v94;
              }
              while (v94 < objc_msgSend((id)objc_msgSend(v10, "bravoConstituentImageDeliveryDeviceTypes"), "count"));
            }
            int64_t v73 = (uint64_t)(float)(v93 * (float)v73);
            v91 = v107;
            v92 = v122;
          }
          else
          {
            v91 = v107;
            v92 = v122;
            CMTimeFlags flags = v119;
            CMTimeValue v88 = v115;
            CMTimeEpoch epoch = v117;
            CMTimeEpoch v90 = v113;
          }
          uint64_t v89 = v121;
          if (v69 >= 1)
          {
            memset(&lhs, 0, sizeof(lhs));
            CMTimeMake(&lhs, v69, 1000);
            memset(&rhs, 0, sizeof(rhs));
            CMTimeMake(&rhs, v73, 1000);
            v134.CMTime start = rhs;
            CMTime start = lhs;
            CMTimeSubtract(&duration, &v134.start, &start);
            CMTime start = lhs;
            CMTimeRangeMake(&v134, &start, &duration);
            CMTimeValue value = v134.start.value;
            CMTimeFlags flags = v134.start.flags;
            CMTimeScale timescale = v134.start.timescale;
            CMTimeEpoch epoch = v134.start.epoch;
            CMTimeValue v88 = v134.duration.value;
            uint64_t v89 = *(void *)&v134.duration.timescale;
            CMTimeEpoch v90 = v134.duration.epoch;
          }
          if (flags) {
            goto LABEL_129;
          }
          goto LABEL_155;
        case 9:
          goto LABEL_120;
        case 10:
        case 12:
          if (v62 == 10) {
            v76 = @"UB-";
          }
          else {
            v76 = @"DeepFusion-";
          }
          if ((v64 & 0x100000) != 0)
          {
            if ((v72 & 8) != 0) {
              v77 = @"LowLightHDR";
            }
            else {
              v77 = @"HDR";
            }
          }
          else if ((v72 & 8) != 0)
          {
            v77 = @"LowLightHDR";
            if (([v66 isEqualToString:*MEMORY[0x1E4F52DF0]] & 1) == 0
              && ![v66 isEqualToString:*MEMORY[0x1E4F52DE8]])
            {
              v77 = @"LowLight";
            }
          }
          else
          {
            v77 = @"WYSIWYG";
          }
          v75 = (__CFString *)[NSString stringWithFormat:@"%@%@", v76, v77];
LABEL_119:
          int64_t v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v75), "objectForKeyedSubscript:", @"Min"), "integerValue");
          int64_t v73 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v65, "objectForKeyedSubscript:", v75), "objectForKeyedSubscript:", @"Max"), "integerValue");
          goto LABEL_120;
        case 11:
          objc_msgSend((id)objc_msgSend(v67, "adaptiveBracketingParameters"), "totalIntegrationTime");
          CMTimeMakeWithSeconds(&lhs, v85, 1000000000);
          CMTimeMakeWithSeconds(&rhs, 0.0, 1000000000);
          CMTimeRangeMake(&v134, &lhs, &rhs);
          CMTimeValue value = v134.start.value;
          CMTimeFlags flags = v134.start.flags;
          CMTimeScale timescale = v134.start.timescale;
          CMTimeEpoch epoch = v134.start.epoch;
          CMTimeValue v88 = v134.duration.value;
          uint64_t v89 = *(void *)&v134.duration.timescale;
          CMTimeEpoch v90 = v134.duration.epoch;
          v91 = v107;
          v92 = v122;
          if ((v134.start.flags & 1) == 0) {
            goto LABEL_155;
          }
          goto LABEL_129;
        default:
          int64_t v73 = 0;
          goto LABEL_120;
      }
    }
    v91 = v107;
    v92 = v122;
    CMTimeFlags flags = v119;
    CMTimeValue v88 = v115;
    CMTimeEpoch epoch = v117;
    uint64_t v89 = v121;
    CMTimeEpoch v90 = v113;
    if (v119)
    {
LABEL_129:
      if ((v89 & 0x100000000) != 0 && !v90 && (v88 & 0x8000000000000000) == 0)
      {
        CMTimeEpoch v95 = 0;
LABEL_156:
        CFAllocatorRef v104 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        v134.start.CMTimeValue value = value;
        v134.start.CMTimeScale timescale = timescale;
        v134.start.CMTimeFlags flags = flags;
        v134.start.CMTimeEpoch epoch = epoch;
        v134.duration.CMTimeValue value = v88;
        *(void *)&v134.duration.CMTimeScale timescale = v89;
        v134.duration.CMTimeEpoch epoch = v95;
        CFDictionaryRef v105 = CMTimeRangeCopyAsDictionary(&v134, v104);
        if (v105)
        {
          CFDictionaryRef v106 = v105;
          [v92 setObject:v105 forKeyedSubscript:@"PhotoProcessingTimeRange"];
          CFRelease(v106);
        }
        captureSession_postNotificationWithPayload(v91->_captureSession, @"IrisWillBeginCapture", v92);
        return;
      }
    }
LABEL_155:
    CMTimeMakeWithSeconds(&start, 0.1, 1000000000);
    CMTimeMakeWithSeconds(&v131, 1.5, 1000000000);
    CMTimeRangeMake(&v134, &start, &v131);
    CMTimeValue value = v134.start.value;
    CMTimeFlags flags = v134.start.flags;
    CMTimeScale timescale = v134.start.timescale;
    CMTimeEpoch epoch = v134.start.epoch;
    CMTimeValue v88 = v134.duration.value;
    uint64_t v89 = *(void *)&v134.duration.timescale;
    CMTimeEpoch v95 = v134.duration.epoch;
    goto LABEL_156;
  }
}

- (void)stillImageCoordinator:(id)a3 willCapturePhotoForSettings:(id)a4 error:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v7 = self;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v8 = (void *)[(BWFigCaptureSession *)self stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  [a4 requestedSettings];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  BOOL v10 = objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") != 4
     && objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") != 5;
  uint64_t v11 = (void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "settingsID"), v5);
  if (isKindOfClass) {
    int v12 = @"IrisWillCaptureStillImage";
  }
  else {
    int v12 = @"WillCaptureStillImage";
  }
  if (((isKindOfClass | v10) & 1) == 0)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
    [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"StillImageStabilizationActive"];
    int v12 = @"WillCaptureStillImage";
  }
  captureSession = v7->_captureSession;
  captureSession_postNotificationWithPayload(captureSession, v12, v11);
}

- (void)stillImageCoordinator:(id)a3 didResolveStillImagePTS:(id *)a4 forSettings:(id)a5 isPreBracketedEV0:(BOOL)a6
{
  unsigned int v6 = a6;
  uint64_t v9 = self;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  BOOL v10 = (void *)[(BWFigCaptureSession *)self stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  [a5 requestedSettings];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v6 || objc_msgSend((id)objc_msgSend(a5, "captureSettings"), "deliverOriginalImage")))
  {
    captureSession = v9->_captureSession;
    pipelines = v9->_pipelines;
    unint64_t v13 = (void *)[a5 requestedSettings];
    BOOL v14 = (void *)[a5 captureSettings];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
    captureSession_didCaptureIrisStill(captureSession, pipelines, v10, v13, v14, (CMTime *)&v15, v6, 0);
  }
}

- (void)stillImageCoordinator:(id)a3 didSelectNewReferenceFrameWithPTS:(id *)a4 transform:(id)a5 forSettings:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CMBaseObjectGetDerivedStorage();
  id v10 = -[FigCaptureSessionPipelines movieFileSinkPipelineWithSinkID:](self->_pipelines, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(-[FigCaptureSessionPipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:](self->_pipelines, "stillImageSinkPipelineSessionStorageWithStillImageCoordinator:", a3), "stillImageSinkPipeline"), "sinkID"));
  if (a5)
  {
    uint64_t v11 = (uint64_t)v10;
    if (dword_1EB4C5110)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    unint64_t v13 = objc_msgSend((id)objc_msgSend((id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes](v11), "firstObject"), "irisStillImageMovieMetadataCache");
    if (v13) {
      objc_msgSend(v13, "cacheStillImageVideoToPhotoTransform:forSettingsID:", a5, +[BWIrisMovieInfo livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:isOriginalPhotoRecording:](BWIrisMovieInfo, "livePhotoMetadataStillImageKeyFrameSettingsIDForSettingsID:isOriginalPhotoRecording:", objc_msgSend((id)objc_msgSend(a6, "requestedSettings"), "settingsID"), 0));
    }
  }
}

- (void)stillImageCoordinator:(id)a3 didCapturePhotoForSettings:(id)a4
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v8 = [(FigCaptureSessionPipelines *)self->_pipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  if (objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "captureType") == 2
    && BWCaptureDevicePositionFromPortType(objc_msgSend((id)objc_msgSend(a4, "captureSettings"), "masterPortType")) == 1&& (objc_msgSend(*(id *)(DerivedStorage + 88), "isEqualToString:", 0x1EFA44100) & 1) == 0&& (objc_msgSend(*(id *)(DerivedStorage + 88), "isEqualToString:", 0x1EFA55880) & 1) == 0&& (objc_msgSend(*(id *)(DerivedStorage + 88), "isEqualToString:", 0x1EFA55980) & 1) == 0&& objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "flashMitigationRequired"))
  {
    -[BWFigCaptureSession _doFlashMitigation]((uint64_t)self);
  }
  cs_setSceneClassifierSuspended(self->_pipelines, v8, 0);
  [a4 requestedSettings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = kFigCaptureSessionIrisStillImageSinkNotification_DidCaptureStillImage;
  if ((isKindOfClass & 1) == 0) {
    id v10 = kFigCaptureSessionStillImageSinkNotification_DidCaptureStillImage;
  }
  uint64_t v11 = *v10;
  int v12 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "settingsID"), 0);
  captureSession_postNotificationWithPayload(self->_captureSession, v11, v12);
  unint64_t v13 = (void *)[a4 requestedSettings];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "responsiveShutterEnabled"))objc_msgSend(v13, "resolutionFlavor"); {
  if (isKindOfClass)
  }
  {
    if (objc_msgSend((id)objc_msgSend(a4, "requestedSettings"), "movieMode"))
    {
      captureSession = self->_captureSession;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__BWFigCaptureSession_stillImageCoordinator_didCapturePhotoForSettings___block_invoke;
      v15[3] = &unk_1E5C285A0;
      v15[4] = self;
      v15[5] = v8;
      v15[6] = a4;
      v15[7] = DerivedStorage;
      captureSession_performBlockOnWorkerQueue(captureSession, (uint64_t)v15);
    }
  }
}

- (uint64_t)_doFlashMitigation
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  int v2 = objc_msgSend(+[BWFigCaptureAttachedAccessoriesMonitor sharedAttachedAccessoriesMonitor](BWFigCaptureAttachedAccessoriesMonitor, "sharedAttachedAccessoriesMonitor"), "batteryPackAccessoryConnected");
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  uint64_t v5 = (id)CFPreferencesCopyValue(@"FlashMitigationInfo", @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"NumPostedNotifications"), "intValue");
  int v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"LastNotificationTime"), "intValue");
  int v8 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FlashCaptureCountWhileBatteryAccessoryAttached"), "intValue");
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSince1970");
  double v10 = v9;
  if (v2)
  {
    uint64_t v11 = (v8 + 1);
    int v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
    if (v6) {
      int v13 = 10;
    }
    else {
      int v13 = 1;
    }
    if ((int)v11 < v13 || v10 - (double)v7 <= (float)(powf(5.0, (float)(v6 - 1)) * 1209600.0))
    {
      uint64_t v14 = (void *)[NSNumber numberWithInt:v11];
    }
    else
    {
      -[BWFigCaptureSession _postFlashMitigationUserNotification](v1);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v6 + 1)), @"NumPostedNotifications");
      objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v10), @"LastNotificationTime");
      uint64_t v14 = &unk_1EFAFFD08;
    }
    [v12 setObject:v14 forKeyedSubscript:@"FlashCaptureCountWhileBatteryAccessoryAttached"];
    int v18 = @"FlashCaptureCountWhileBatteryAccessoryDetached";
    int v19 = v12;
    goto LABEL_20;
  }
  if (v6 <= 0 && v8 < 1) {
    return result;
  }
  int v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  int v16 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FlashCaptureCountWhileBatteryAccessoryDetached"), "intValue");
  if (!v16) {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v10), @"FirstFlashCaptureTimeWhileBatteryAccessoryDetached");
  }
  int v17 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"FirstFlashCaptureTimeWhileBatteryAccessoryDetached"), "intValue");
  result = objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", (v16 + 1)), @"FlashCaptureCountWhileBatteryAccessoryDetached");
  if (v16 >= 9 && v10 - (double)v17 > 86400.0)
  {
    [v12 setObject:&unk_1EFAFFD08 forKeyedSubscript:@"FlashCaptureCountWhileBatteryAccessoryDetached"];
    [v12 setObject:&unk_1EFAFFD08 forKeyedSubscript:@"FlashCaptureCountWhileBatteryAccessoryAttached"];
    [v12 setObject:&unk_1EFAFFD08 forKeyedSubscript:@"NumPostedNotifications"];
    int v18 = @"LastNotificationTime";
    int v19 = v12;
LABEL_20:
    result = [v19 setObject:&unk_1EFAFFD08 forKeyedSubscript:v18];
  }
  if (v12)
  {
    CFPreferencesSetValue(@"FlashMitigationInfo", v12, @"com.apple.cameracapture.volatile", v3, v4);
    return CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v3, v4);
  }
  return result;
}

unint64_t __72__BWFigCaptureSession_stillImageCoordinator_didCapturePhotoForSettings___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    CFStringRef v3 = *(void **)(v2 + 16);
  }
  else {
    CFStringRef v3 = 0;
  }
  CFStringRef v4 = objc_msgSend(v3, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSinkPipeline"), "sinkID"));
  obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  CFAllocatorRef v22 = v4;
  uint64_t v5 = (void *)[v4 pendingIrisRecordings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "settings"), "settingsID");
        if (v11 == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "settingsID")
          && [v10 isEmpty])
        {
          [obj addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        id v15 = +[BWIrisMovieInfo emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:](BWIrisMovieInfo, "emptyIrisMovieInfoWithFigCaptureMovieFileRecordingSettings:", [*(id *)(*((void *)&v23 + 1) + 8 * j) settings]);
        if (dword_1EB4C5110)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        captureSession_postNotificationsForIrisRequestCompletedWithError(*(const void **)(*(void *)(a1 + 32) + 8), objc_msgSend(v22, "sinkID", v18, v19), v15, 4294951756);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v13);
  }
  return cs_removeEmptyPendingIrisRecording(*(const void **)(*(void *)(a1 + 32) + 8), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "stillImageSinkPipeline"), "sinkID"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "requestedSettings"), "settingsID"));
}

- (void)stillImageCoordinator:(id)a3 readyToRespondToRequestAfterRequestWithSettings:(id)a4
{
  uint64_t v5 = self;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v6 = (void *)[(BWFigCaptureSession *)self stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  uint64_t v7 = (void *)[a4 requestedSettings];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "stillImageSinkPipeline"), "stillImageCoordinatorNode"), "responsiveShutterEnabled")&& objc_msgSend(v7, "resolutionFlavor") != 2)
  {
    uint64_t v8 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)objc_msgSend(v6, "stillImageSinkPipeline"), "sinkID"), objc_msgSend(a4, "settingsID"), 0);
    captureSession = v5->_captureSession;
    captureSession_postNotificationWithPayload(captureSession, @"ReadyForResponsiveRequest", v8);
  }
}

- (void)_postFlashMitigationUserNotification
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AVFCapture"];
    uint64_t v2 = [v1 localizedStringForKey:@"OK" value:&stru_1EFA403E0 table:@"FlashMitigationNotification-A149"];
    uint64_t v3 = [v1 localizedStringForKey:@"Alert Message" value:&stru_1EFA403E0 table:@"FlashMitigationNotification-A149"];
    uint64_t v4 = *MEMORY[0x1E4F1D9A8];
    v10[0] = *MEMORY[0x1E4F1D9E0];
    v10[1] = v4;
    v11[0] = v2;
    v11[1] = v3;
    CFDictionaryRef v5 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    CFUserNotificationRef v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0, 0, v5);
    if (v6)
    {
      CFUserNotificationRef v7 = v6;
      global_queue = dispatch_get_global_queue(0, 0);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__BWFigCaptureSession__postFlashMitigationUserNotification__block_invoke;
      v9[3] = &__block_descriptor_40_e5_v8__0l;
      v9[4] = v7;
      dispatch_async(global_queue, v9);
    }
  }
}

void __59__BWFigCaptureSession__postFlashMitigationUserNotification__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 32), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)stillImageCoordinator:(id)a3 didCancelMomentCaptureForSettingsID:(int64_t)a4 streamingDisruptionEndPTS:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v35 = 0;
  float v36 = &v35;
  uint64_t v37 = 0x3052000000;
  float v38 = __Block_byref_object_copy__24;
  float v39 = __Block_byref_object_dispose__24;
  id v40 = 0;
  id v40 = [(FigCaptureSessionPipelines *)self->_pipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  if (dword_1EB4C5110)
  {
    *(_DWORD *)double v32 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
  if ([*(id *)(DerivedStorage + 616) settingsID] == a4
    && [*(id *)(DerivedStorage + 616) movieMode] == 2)
  {
    id v11 = *(id *)(DerivedStorage + 616);
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
    if (v11)
    {
      uint64_t v12 = [(id)v36[5] cameraSourcePipeline];
      *(void *)double v42 = 0;
      *(void *)&v42[8] = v42;
      *(void *)&v42[16] = 0x3052000000;
      *(void *)&long long v43 = __Block_byref_object_copy__24;
      *((void *)&v43 + 1) = __Block_byref_object_dispose__24;
      uint64_t v44 = 0;
      uint64_t v44 = -[FigCaptureCameraSourcePipeline captureDevice](v12);
      int v13 = [v11 flashMode];
      if (v13)
      {
        if (v13 != 1)
        {
          if (v13 == 2) {
            [*(id *)(*(void *)&v42[8] + 40) setAutomaticallyAdjustsTorch:1];
          }
          goto LABEL_23;
        }
        float v21 = 1.0;
        [*(id *)(*(void *)&v42[8] + 40) setAutomaticallyAdjustsTorch:0];
      }
      else
      {
        float v21 = 0.0;
        [*(id *)(*(void *)&v42[8] + 40) setAutomaticallyAdjustsTorch:0];
      }
      *(float *)&double v22 = v21;
      objc_msgSend(*(id *)(*(void *)&v42[8] + 40), "setTorchLevel:", v22, v26, v27);
LABEL_23:
      if (dword_1EB4C5110)
      {
        *(_DWORD *)os_log_type_t type = 0;
        os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
        long long v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      captureSession = self->_captureSession;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke;
      v29[3] = &unk_1E5C28798;
      v29[4] = self;
      v29[5] = v11;
      long long v30 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      v29[6] = &v35;
      v29[7] = v42;
      v29[8] = DerivedStorage;
      v29[9] = a4;
      uint64_t v25 = CMBaseObjectGetDerivedStorage();
      captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, *(void *)(v25 + 640), (uint64_t)v29, 0.0);

      _Block_object_dispose(v42, 8);
      goto LABEL_19;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
  }
  uint64_t v14 = objc_msgSend((id)objc_msgSend((id)v36[5], "stillImageSinkPipeline", v26, v27), "sinkID");
  if (dword_1EB4C5110)
  {
    LODWORD(time.value) = 0;
    v32[0] = OS_LOG_TYPE_DEFAULT;
    id v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int value = time.value;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v17 = value;
    }
    else {
      unsigned int v17 = value & 0xFFFFFFFE;
    }
    if (v17)
    {
      uint64_t v18 = *(void *)(DerivedStorage + 104);
      *(_DWORD *)double v42 = 136315906;
      *(void *)&v42[4] = "-[BWFigCaptureSession stillImageCoordinator:didCancelMomentCaptureForSettingsID:streamingDisruptionEndPTS:]";
      *(_WORD *)&v42[12] = 2114;
      *(void *)&v42[14] = v18;
      *(_WORD *)&v42[22] = 1024;
      LODWORD(v43) = -16418;
      WORD2(v43) = 2048;
      *(void *)((char *)&v43 + 6) = a4;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v19 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(v14, a4, 4294950878);
  captureSession_postNotificationWithPayload(self->_captureSession, @"DidBeginRecordingMomentCaptureMovie", v19);
  uint64_t v20 = self->_captureSession;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_94;
  v28[3] = &unk_1E5C249A0;
  v28[4] = self;
  v28[5] = v14;
  v28[6] = a4;
  captureSession_performBlockOnWorkerQueue(v20, (uint64_t)v28);
LABEL_19:
  _Block_object_dispose(&v35, 8);
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void **)(v3 + 16);
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = objc_msgSend(v4, "movieFileSinkPipelineWithSinkID:", objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "stillImageSinkPipeline"), "sinkID"));
    CFUserNotificationRef v6 = (void *)v5;
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x3052000000;
    uint64_t v26 = __Block_byref_object_copy__24;
    uint64_t v27 = __Block_byref_object_dispose__24;
    uint64_t v28 = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 16);
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = -[FigCaptureMovieFileSinkPipeline videoSourceID](v5);
    uint64_t v28 = [v8 previewSinkPipelineWithSourceID:v9 sourceDeviceType:-[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v6)];
    [(id)v24[5] setVideoStabilizationOverscanCropEnabled:1 momentMovieRecordingEnabled:1];
    [(id)v24[5] setSemanticStyleRenderingSuspended:1 animated:1];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setVideoStabilizationOverscanCropEnabled:1];
    uint64_t v10 = [v6 sinkID];
    id v11 = (void *)-[FigCaptureMovieFileSinkPipeline captureDevice]((uint64_t)v6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    long long v12 = *(_OWORD *)(a1 + 48);
    long long v15 = *(_OWORD *)(a1 + 32);
    long long v21 = *(_OWORD *)(a1 + 80);
    v14[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_2;
    v14[3] = &unk_1E5C28770;
    uint64_t v22 = *(void *)(a1 + 96);
    uint64_t v16 = v10;
    unsigned int v17 = &v23;
    long long v18 = v12;
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v19 = *(void *)(a1 + 64);
    uint64_t v20 = v13;
    [v11 setAutoImageControlMode:2 completionHandler:v14];
    _Block_object_dispose(&v23, 8);
  }
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_2(uint64_t a1, char a2, long long *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5110)
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12[0] = MEMORY[0x1E4F143A8];
  char v22 = a2;
  long long v7 = *(_OWORD *)(a1 + 48);
  int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v9 = *(const void **)(*(void *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  long long v18 = *(_OWORD *)(a1 + 96);
  long long v20 = *a3;
  void v12[2] = __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_90;
  v12[3] = &unk_1E5C28748;
  uint64_t v19 = *(void *)(a1 + 112);
  uint64_t v21 = *((void *)a3 + 2);
  int8x16_t v13 = v8;
  long long v14 = v7;
  long long v15 = *(_OWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 80);
  uint64_t v17 = v10;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(v9, *(void *)(DerivedStorage + 640), (uint64_t)v12, 0.0);
}

void __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_90(uint64_t a1, char a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 80) + 360));
  uint64_t v4 = [*(id *)(a1 + 32) settingsID];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 80) + 616) settingsID];
  uint64_t v6 = *(void *)(a1 + 80);
  if (v4 == v5)
  {

    uint64_t v6 = *(void *)(a1 + 80);
    *(void *)(v6 + 616) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 360));
  if (a2)
  {
    if (dword_1EB4C5110)
    {
      LODWORD(time2.value) = 0;
      LOBYTE(value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (v4 != v5 || *(unsigned char *)(a1 + 144) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setVideoStabilizationOverscanCropEnabled:0 momentMovieRecordingEnabled:0];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSemanticStyleRenderingSuspended:0 animated:1];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setVideoStabilizationOverscanCropEnabled:0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setAutomaticallyAdjustsTorch:0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTorchLevel:0.0];
    if (dword_1EB4C5110)
    {
      LODWORD(time2.value) = 0;
      LOBYTE(value) = 0;
      uint64_t v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v21 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(*(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "settingsID", p_time1, v32), 4294950878);
    captureSession_postNotificationWithPayload(*(const void **)(*(void *)(a1 + 40) + 8), @"DidBeginRecordingMomentCaptureMovie", v21);
    cs_removeEmptyPendingIrisRecording(*(const void **)(*(void *)(a1 + 40) + 8), objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "stillImageSinkPipeline"), "sinkID"), *(void *)(a1 + 88));
  }
  else
  {
    CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
    uint64_t v10 = (_OWORD *)(a1 + 96);
    CMTimeFlags flags = *(_DWORD *)(a1 + 108);
    if (flags)
    {
      if (*(unsigned char *)(a1 + 132))
      {
        *(_OWORD *)&time1.CMTimeValue value = *v10;
        time1.CMTimeEpoch epoch = *(void *)(a1 + 112);
        CMTime time2 = *(CMTime *)(a1 + 120);
        CMTimeMaximum(&time, &time1, &time2);
        CMTimeValue value = time.value;
        CMTimeFlags flags = time.flags;
        CMTimeScale timescale = time.timescale;
        CMTimeEpoch epoch = time.epoch;
      }
      else
      {
        CMTimeValue value = *(void *)v10;
        CMTimeScale timescale = *(_DWORD *)(a1 + 104);
        CMTimeEpoch epoch = *(void *)(a1 + 112);
      }
    }
    else
    {
      CMTimeFlags flags = *(_DWORD *)(a1 + 132);
      if (flags)
      {
        CMTimeValue value = *(void *)(a1 + 120);
        CMTimeScale timescale = *(_DWORD *)(a1 + 128);
        CMTimeEpoch epoch = *(void *)(a1 + 136);
      }
      else
      {
        CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
      }
    }
    if (dword_1EB4C5110)
    {
      LODWORD(time2.value) = 0;
      HIBYTE(v32) = 0;
      int8x16_t v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v14 = time2.value;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 104);
        int v17 = *(unsigned __int8 *)(a1 + 144);
        *(_OWORD *)&time.CMTimeValue value = *v10;
        time.CMTimeEpoch epoch = *(void *)(a1 + 112);
        Float64 Seconds = CMTimeGetSeconds(&time);
        CMTime time = *(CMTime *)(a1 + 120);
        Float64 v19 = CMTimeGetSeconds(&time);
        time.CMTimeValue value = value;
        time.CMTimeScale timescale = timescale;
        time.CMTimeFlags flags = flags;
        time.CMTimeEpoch epoch = epoch;
        Float64 v20 = CMTimeGetSeconds(&time);
        LODWORD(time1.value) = 136316418;
        *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)"-[BWFigCaptureSession stillImageCoordinator:didCancelM"
                                                                  "omentCaptureForSettingsID:streamingDisruptionEndPTS:]_block_invoke";
        LOWORD(time1.flags) = 2114;
        *(void *)((char *)&time1.flags + 2) = v16;
        HIWORD(time1.epoch) = 1024;
        int v35 = v17;
        __int16 v36 = 2048;
        Float64 v37 = Seconds;
        __int16 v38 = 2048;
        Float64 v39 = v19;
        __int16 v40 = 2048;
        Float64 v41 = v20;
        LODWORD(v32) = 58;
        p_CMTime time1 = &time1;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v23 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    int v24 = *(const void **)(v22 + 8);
    uint64_t v25 = *(void **)(v22 + 16);
    uint64_t v26 = objc_msgSend(v25, "stillImageSinkPipelineSessionStorageWithSinkID:", *(void *)(a1 + 48), p_time1, v32);
    uint64_t v27 = (void *)[v26 previewSinkNode];
    unint64_t v28 = [v23 stillImageUserInitiatedRequestTime];
    if (objc_msgSend((id)objc_msgSend(v23, "movieRecordingSettings"), "movieStartTimeOverride") > v28) {
      unint64_t v28 = objc_msgSend((id)objc_msgSend(v23, "movieRecordingSettings"), "movieStartTimeOverride");
    }
    memset(&time, 0, sizeof(time));
    if (!v27
      || ([v27 previewPTSDisplayedAtHostTime:v28 allowingExtrapolation:1], (time.flags & 1) == 0))
    {
      int64_t v29 = FigHostTimeToNanoseconds();
      CMTimeMake(&time1, v29, 1000000000);
      CMTime time = time1;
    }
    if ((flags & 0x1D) == 1)
    {
      time1.CMTimeValue value = value;
      time1.CMTimeScale timescale = timescale;
      time1.CMTimeFlags flags = flags;
      time1.CMTimeEpoch epoch = epoch;
      CMTime time2 = time;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time.CMTimeValue value = value;
        time.CMTimeScale timescale = timescale;
        time.CMTimeFlags flags = flags;
        time.CMTimeEpoch epoch = epoch;
      }
    }
    LOBYTE(time2.value) = 0;
    if (*MEMORY[0x1E4F1EBA8])
    {
      long long v30 = fig_log_handle();
      if (os_signpost_enabled(v30))
      {
        LOWORD(time1.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A5887000, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CameraCaptureFirstQuickTakeVideoFrame", (const char *)&unk_1A5F8B35A, (uint8_t *)&time1, 2u);
      }
    }
    CMTime time1 = time;
    captureSession_didCaptureIrisStill(v24, v25, v26, v23, 0, &time1, 0, &time2);
  }
}

unint64_t __107__BWFigCaptureSession_stillImageCoordinator_didCancelMomentCaptureForSettingsID_streamingDisruptionEndPTS___block_invoke_94(void *a1)
{
  return cs_removeEmptyPendingIrisRecording(*(const void **)(a1[4] + 8), a1[5], a1[6]);
}

- (void)stillImageCoordinator:(id)a3 willPrepareStillImageCaptureWithSettings:(id)a4 clientInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  id v10 = [(FigCaptureSessionPipelines *)self->_pipelines stillImageSinkPipelineSessionStorageWithStillImageCoordinator:a3];
  uint64_t v11 = [v10 cameraSourcePipeline];
  id v46 = a4;
  long long v12 = (void *)[a4 requestedSettings];
  unsigned int v13 = [v12 outputWidth];
  uint64_t v14 = [v12 outputHeight];
  uint64_t v15 = objc_msgSend((id)objc_msgSend(v10, "stillImageSinkPipeline"), "sinkID");
  uint64_t v44 = v15;
  uint64_t v45 = self;
  BOOL v47 = v5;
  unsigned int v43 = v13;
  uint64_t v42 = v14;
  if ([v12 settingsProvider])
  {
    if (v5)
    {
      uint64_t v16 = v15;
      int v17 = (void *)[v12 figCaptureIrisPreparedSettingsRepresentation];
      os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
      id v18 = (id)[*(id *)(DerivedStorage + 488) objectForKeyedSubscript:v15];
      [*(id *)(DerivedStorage + 488) setObject:v17 forKeyedSubscript:v16];
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));

      uint64_t v19 = v11;
      Float64 v20 = v46;
      if (!v17) {
        goto LABEL_22;
      }
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 360));
      uint64_t v21 = (void *)[*(id *)(DerivedStorage + 488) objectForKeyedSubscript:v15];
      objc_msgSend(v21, "setSettingsID:", objc_msgSend(v12, "settingsID"));
      unsigned int v22 = [v12 bracketImageCount];
      uint64_t v19 = v11;
      if (v22 > [v21 bracketedImageCount]) {
        objc_msgSend(v21, "setBracketedImageCount:", objc_msgSend(v12, "bracketImageCount"));
      }
      Float64 v20 = v46;
      if ([v12 rawOutputFormat]) {
        objc_msgSend(v21, "setRawOutputFormat:", objc_msgSend(v12, "rawOutputFormat"));
      }
      if ([v12 outputFormat]) {
        objc_msgSend(v21, "setProcessedOutputFormat:", objc_msgSend(v12, "outputFormat"));
      }
      int v23 = [v12 HDRMode];
      if (v23 > (int)[v21 HDRMode]) {
        objc_msgSend(v21, "setHDRMode:", objc_msgSend(v12, "HDRMode"));
      }
      int v24 = [v12 qualityPrioritization];
      if (v24 > (int)[v21 qualityPrioritization]) {
        objc_msgSend(v21, "setQualityPrioritization:", objc_msgSend(v12, "qualityPrioritization"));
      }
      int v25 = [v12 digitalFlashMode];
      if (v25 > (int)[v21 digitalFlashMode]) {
        objc_msgSend(v21, "setDigitalFlashMode:", objc_msgSend(v12, "digitalFlashMode"));
      }
      unint64_t v26 = objc_msgSend((id)objc_msgSend(v12, "bravoConstituentImageDeliveryDeviceTypes"), "count");
      if (v26 > objc_msgSend((id)objc_msgSend(v21, "bravoConstituentImageDeliveryDeviceTypes"), "count")) {
        objc_msgSend(v21, "setBravoConstituentImageDeliveryDeviceTypes:", objc_msgSend(v12, "bravoConstituentImageDeliveryDeviceTypes"));
      }
      objc_msgSend(v21, "setOutputWidth:", objc_msgSend(v12, "outputWidth"));
      objc_msgSend(v21, "setOutputHeight:", objc_msgSend(v12, "outputHeight"));
      int v17 = (void *)[v21 copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 360));
      id v27 = v17;
      if (!v17) {
        goto LABEL_22;
      }
    }
    uint64_t v28 = [v17 bracketedImageCount];
    char v29 = 0;
    goto LABEL_23;
  }
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setOutputFormat:", objc_msgSend(v12, "outputFormat"));
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setOutputDimensions:", v13 | (unint64_t)(v14 << 32));
  objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setImageCount:", objc_msgSend(v12, "bracketImageCount"));
  uint64_t v19 = v11;
  Float64 v20 = v46;
LABEL_22:
  uint64_t v28 = [v12 bracketImageCount];
  int v17 = 0;
  char v29 = 1;
LABEL_23:
  long long v30 = (void *)-[FigCaptureCameraSourcePipeline captureDevice](v19);
  uint64_t IsBayerRaw = FigCapturePixelFormatIsBayerRaw([v17 rawOutputFormat]);
  +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:](BWStillImageCoordinatorNode, "worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:", v17, [v20 captureSettings], v30);
  uint64_t v32 = -[FigCaptureCameraSourcePipeline prepareForStillImageCaptureWithStillImageOutputRetainedBufferCountOverride:infraRedStillImageOutputRetainedBufferCountOverride:clientBracketCount:enableSushiRawAttachmentOption:](v19, 0, 0, v28, IsBayerRaw);
  if (v32)
  {
    uint64_t v33 = v32;
    FigDebugAssert3();
  }
  else
  {
    uint64_t v33 = [v30 updateStillImageSensorRawBufferPoolsWithRetainedBufferCount:0 zoomBasedRetainedBufferCount:0 ultraHighResolutionRetainedBufferCount:0];
    if ([v10 pixelConverter]
      && [v12 outputFormat]
      && [v12 outputFormat] != 1785750887
      && [v12 outputFormat] != 1752589105
      && [v12 outputFormat] != 1635148593)
    {
      uint64_t v34 = cs_figCaptureColorSpaceFromSourcePipeline(v19);
      int v35 = (void *)-[FigCaptureCameraSourcePipeline captureSourceVideoFormat](v19);
      uint64_t v36 = +[BWVideoFormat colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:](BWVideoFormat, "colorSpacePropertiesForSourceThatSupportsWideColor:sourceColorSpace:sourcePixelFormat:sourceDimensions:requestedPixelFormat:", [v30 supportsWideColor], v34, objc_msgSend(v35, "format"), objc_msgSend(v35, "dimensions"), objc_msgSend(v12, "outputFormat"));
      if (![v12 settingsProvider]) {
        objc_msgSend((id)objc_msgSend(v10, "preparedBracket"), "setColorSpaceProperties:", v36);
      }
      if (v29) {
        Float64 v37 = v12;
      }
      else {
        Float64 v37 = v17;
      }
      __int16 v38 = (void *)[v37 bravoConstituentImageDeliveryDeviceTypes];
      if ([v38 count]) {
        uint64_t v28 = v28 * [v38 count];
      }
      uint64_t v33 = objc_msgSend((id)objc_msgSend(v10, "pixelConverter"), "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", objc_msgSend(v12, "outputFormat"), v43 | (unint64_t)(v42 << 32), v28, v36, v36 != 0);
    }
  }
  if (v47)
  {
    Float64 v39 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(v44, [v12 settingsID], v33);
    int v40 = [v12 settingsProvider];
    Float64 v41 = kFigCaptureSessionIrisStillImageSinkNotification_PreparationComplete;
    if (v40 != 1) {
      Float64 v41 = kFigCaptureSessionStillImageSinkNotification_BracketPreparationComplete;
    }
    captureSession_postNotificationWithPayload(v45->_captureSession, *v41, v39);
  }
}

- (void)stagingNode:(id)a3 willEmitIrisRequest:(id)a4
{
  BOOL v5 = self;
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v6 = (const void *)cs_notificationPayloadWithSectionIDAndSettingsIDAndErrorStatus(objc_msgSend((id)-[BWFigCaptureSession movieFileSinkPipelineWithIrisStagingNode:](self, "movieFileSinkPipelineWithIrisStagingNode:", a3), "sinkID"), objc_msgSend((id)objc_msgSend(a4, "settings"), "settingsID"), 0);
  if ((int)[a4 numberOfRequestedVariants] >= 1)
  {
    int v7 = 0;
    do
    {
      captureSession_postNotificationWithPayload(v5->_captureSession, @"IrisDidRecordIrisMovie", v6);
      ++v7;
    }
    while (v7 < (int)[a4 numberOfRequestedVariants]);
  }
}

- (void)stagingNode:(id)a3 waitingToEmitFrameWithPTS:(id *)a4
{
  if (self) {
    self = (BWFigCaptureSession *)self->_pipelines;
  }
  uint64_t v4 = (void *)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode](-[BWFigCaptureSession movieFileSinkPipelineWithIrisStagingNode:](self, "movieFileSinkPipelineWithIrisStagingNode:", a3, a4));
  [v4 tryToEmitFramesWaitingForMotion];
}

- (void)stagingNode:(id)a3 valveClosedWithPendingIrisRequests:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CMBaseObjectGetDerivedStorage();
  uint64_t v16 = self;
  id v15 = [(FigCaptureSessionPipelines *)self->_pipelines movieFileSinkPipelineWithIrisStagingNode:a3];
  mach_absolute_time();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(a4);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "enqueuedHostTime", v13, v14);
        [v11 setProcessingTimeInMilliseconds:(double)FigHostTimeToNanoseconds() / 1000000.0];
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        captureSession_postNotificationsForIrisRequestCompletedWithError(v16->_captureSession, [v15 sinkID], v11, 4294951754);
      }
      uint64_t v8 = [a4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)remoteQueueSinkNode:(id)a3 localQueueBecameReady:(localQueueOpaque *)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 sinkID];
  if (a4 && v6)
  {
    v8[0] = @"SectionID";
    v8[1] = @"LocalQueue";
    v9[0] = v6;
    v9[1] = a4;
    uint64_t v7 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
    if (v7) {
      captureSession_postNotificationWithPayload(self->_captureSession, @"LocalQueueUpdated", v7);
    }
  }
}

- (void)remoteQueueSinkNode:(id)a3 dumpStateForReason:(id)a4
{
  v12[20] = *MEMORY[0x1E4F143B8];
  captureSession = self->_captureSession;
  if (dword_1EB4C5110)
  {
    LODWORD(v12[0]) = 0;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  uint64_t v8 = objc_msgSend(v7, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
  uint64_t v9 = [NSString stringWithFormat:@"%@/%@-%@.plist", FigCaptureStateDumpDirectory(), a4, v8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v9)
    || (v12[0] = 0,
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", FigCaptureStateDumpDirectory(), 1, 0, v12), v12[0])|| (OSStateData = FigCaptureSessionGetOSStateData((uint64_t)captureSession, 1)) != 0&& (objc_msgSend(OSStateData, "writeToURL:atomically:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v9), 1) & 1) == 0)
  {
    FigDebugAssert3();
  }
  if (dword_1EB4C5110)
  {
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) preparedPixelBufferPool];
  return [v1 registerSurfacesFromSourcePool:v2];
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) preparedPixelBufferPool];
  return [v1 registerSurfacesFromSourcePool:v2];
}

uint64_t __44__BWFigCaptureSession_graphDidPrepareNodes___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) preparedPixelBufferPool];
  return [v1 registerSurfacesFromSourcePool:v2];
}

- (void)graph:(id)a3 didStartSourceNode:(id)a4 error:(int)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  uint64_t v8 = [(FigCaptureSessionPipelines *)self->_pipelines firstColorCameraSourcePipeline];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = (void *)-[FigCaptureCameraSourcePipeline sourceNodes]((uint64_t)v8);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      if (*(id *)(*((void *)&v16 + 1) + 8 * v13) == a4) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    a4 = 0;
  }
  if (*(void *)(DerivedStorage + 744))
  {
    if (!-[FigCaptureCameraSourcePipeline trueVideoCaptureEnabled]((BOOL)v8))
    {
      uint64_t v14 = (void *)[a4 portType];
      if ([v14 isEqual:*MEMORY[0x1E4F52DD8]])
      {
        if (dword_1EB4C5110)
        {
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }

        *(void *)(DerivedStorage + 744) = 0;
      }
    }
  }
}

uint64_t __72__BWFigCaptureSession_previewStitcherReadyForPrimaryCaptureRectUpdates___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C5110)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "imageQueueSinkNode", v4, v5), "input"), "connection"), "attachNow");
}

- (void)previewStitcherTrueVideoExitTransitionDidComplete:(id)a3
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  captureSession = self->_captureSession;
  int64_t graphID = self->_graphID;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__BWFigCaptureSession_previewStitcherTrueVideoExitTransitionDidComplete___block_invoke;
  void v7[3] = &unk_1E5C287C0;
  v7[4] = self;
  v7[5] = DerivedStorage;
  captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(captureSession, graphID, (uint64_t)v7, 0.0);
}

void __73__BWFigCaptureSession_previewStitcherTrueVideoExitTransitionDidComplete___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    captureSession_updateDeferredGraphSetupStartCondition(*(const void **)(*(void *)(a1 + 32) + 8), (unsigned char *)(*(void *)(a1 + 40) + 539), 0);
  }
}

- (void)_continuityDisplay:(uint64_t)a1 didUpdateLayout:(void *)a2
{
  if (a1)
  {
    char v3 = [a2 isDisplayConnected];
    uint64_t v4 = *(const void **)(a1 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __58__BWFigCaptureSession__continuityDisplay_didUpdateLayout___block_invoke;
    v6[3] = &unk_1E5C28808;
    v6[4] = a1;
    char v7 = v3;
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    captureSession_dispatchGraphCalloutWithGraphIDToWorkerQueueAfter(v4, *(void *)(DerivedStorage + 640), (uint64_t)v6, 0.0);
  }
}

uint64_t __58__BWFigCaptureSession__continuityDisplay_didUpdateLayout___block_invoke(uint64_t result, char a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v3 = *(void *)(result + 32);
    uint64_t v4 = v3 ? *(void **)(v3 + 16) : 0;
    uint64_t v5 = objc_msgSend(v4, "cameraSourcePipelines", (void)v9);
    result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          -[FigCaptureCameraSourcePipeline setBlackenFramesForContinuityDisplayConnected:](*(void *)(*((void *)&v9 + 1) + 8 * v8++), *(unsigned __int8 *)(v2 + 40));
        }
        while (v6 != v8);
        result = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v6 = result;
      }
      while (result);
    }
  }
  return result;
}

@end