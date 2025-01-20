@interface AVCaptureOutput
+ (id)allOutputSubclasses;
+ (id)availableVideoCodecTypesForSourceDevice:(id)a3 sourceFormat:(id)a4 outputDimensions:(id)a5 fileType:(id)a6 videoCodecTypesAllowList:(id)a7;
+ (id)supportedProResCodecTypes;
+ (int64_t)dataDroppedReasonFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (void)initialize;
- (AVCaptureConnection)connectionWithMediaType:(AVMediaType)mediaType;
- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject connection:(AVCaptureConnection *)connection;
- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3;
- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)hasRequiredOutputFormatForConnection:(id)a3;
- (BOOL)updateVideoSettingsForConnection:(id)a3;
- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInOutputCoordinates;
- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates;
- (CGSize)outputSizeForSourceFormat:(id)a3;
- (NSArray)connections;
- (id)_inputForConnection:(id)a3;
- (id)_recommendedAudioOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 fileType:(id)a5;
- (id)_recommendedVideoOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodec:(id)a5 isIris:(BOOL)a6 outputFileURL:(id)a7;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)firstEnabledConnectionForMediaType:(id)a3;
- (id)initSubclass;
- (id)liveConnections;
- (id)recommendedCinematicAudioOutputSettingsForConnection:(id)a3 fileType:(id)a4 isProResCapture:(BOOL)a5;
- (id)recommendedOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodecType:(id)a5 fileType:(id)a6 isIris:(BOOL)a7 outputFileURL:(id)a8;
- (id)session;
- (id)sinkID;
- (int)changeSeed;
- (unsigned)requiredOutputFormatForConnection:(id)a3;
- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)bumpChangeSeed;
- (void)dealloc;
- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)getTransform:(CGAffineTransform *)a3 mirroredOut:(BOOL *)a4 rollAdjustmentOut:(double *)a5 forConnection:(id)a6;
- (void)handleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)performBlockOnSessionNotifyingThread:(id)a3;
- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3;
- (void)removeConnection:(id)a3;
- (void)setSession:(id)a3;
- (void)setSinkID:(id)a3;
- (void)updateMetadataTransformForSourceFormat:(id)a3;
@end

@implementation AVCaptureOutput

- (int)changeSeed
{
  return self->_outputInternal->changeSeed;
}

- (id)sinkID
{
  v2 = self->_outputInternal->sinkID;

  return v2;
}

- (AVCaptureConnection)connectionWithMediaType:(AVMediaType)mediaType
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(AVCaptureOutput *)self connections];
  result = (AVCaptureConnection *)[(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (result)
  {
    v6 = result;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (AVCaptureConnection *)((char *)i + 1))
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v10 = objc_msgSend(v9, "inputPorts", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          while (2)
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "mediaType"), "isEqual:", mediaType))return (AVCaptureConnection *)v9; {
              ++v14;
              }
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      v6 = (AVCaptureConnection *)[(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      result = 0;
    }
    while (v6);
  }
  return result;
}

- (NSArray)connections
{
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  v4 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_outputInternal->connections];
  objc_sync_exit(outputInternal);
  return v4;
}

- (BOOL)hasRequiredOutputFormatForConnection:(id)a3
{
  return 0;
}

+ (id)allOutputSubclasses
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:11];
}

- (id)session
{
  return self->_outputInternal->session;
}

- (void)setSession:(id)a3
{
  self->_outputInternal->session = (AVCaptureSession *)a3;
}

uint64_t __69__AVCaptureOutput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16));
}

uint64_t __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(void *)(v1 + 16)) {
    __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke_cold_1();
  }
  v3 = *(const void **)(a1 + 40);
  *(void *)(v1 + 16) = v3;
  if (v3) {
    CFRetain(v3);
  }
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 attachSafelyToFigCaptureSession:v5];
}

- (void)updateMetadataTransformForSourceFormat:(id)a3
{
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  uint64_t v6 = [a3 sensorDimensions];
  [(AVCaptureOutput *)self outputSizeForSourceFormat:a3];
  CGFloat v9 = v7;
  CGFloat v10 = v8;
  BOOL v11 = *MEMORY[0x1E4F1DB30] == (double)(int)v6;
  BOOL v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == (double)SHIDWORD(v6);
  if (v11 && v12) {
    double v13 = v7;
  }
  else {
    double v13 = (double)(int)v6;
  }
  if (v11 && v12) {
    double v14 = v8;
  }
  else {
    double v14 = (double)SHIDWORD(v6);
  }
  long long v15 = (void *)[a3 vtScalingMode];
  if (a3) {
    long long v16 = -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", [a3 mediaType]);
  }
  else {
    long long v16 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  }
  long long v17 = v16;
  self->_outputInternal->BOOL physicallyMirrorsVideo = [(AVCaptureOutput *)self appliesMirroringWithPhysicalFlipForConnection:v16];
  long long v18 = self->_outputInternal;
  int v19 = [(AVCaptureConnection *)v17 sourcesFromFrontFacingCamera];
  int v20 = [(AVCaptureConnection *)v17 sourcesFromExternalCamera];
  int v21 = [(AVCaptureOutput *)self appliesOrientationWithPhysicalRotationForConnection:v17];
  uint64_t v22 = [(AVCaptureConnection *)v17 _videoOrientation];
  v23 = self->_outputInternal;
  BOOL physicallyMirrorsVideo = v23->physicallyMirrorsVideo;
  char v25 = [(AVCaptureConnection *)v17 isVideoMirrored];
  AVCaptureVideoTransformForCaptureDevice(v15, v19, v20, v21, v22, (uint64_t *)&v23->rollAdjustment, 0, 0, (uint64_t)v27, v13, v14, v9, v10, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24), physicallyMirrorsVideo, v25);
  long long v26 = v27[1];
  *(_OWORD *)&v18->metadataTransform.a = v27[0];
  *(_OWORD *)&v18->metadataTransform.c = v26;
  *(_OWORD *)&v18->metadataTransform.tx = v27[2];
  objc_sync_exit(outputInternal);
}

- (CGSize)outputSizeForSourceFormat:(id)a3
{
  v3 = (const opaqueCMFormatDescription *)[a3 formatDescription];
  if (v3)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v3);
    double width = (double)Dimensions.width;
    double height = (double)Dimensions.height;
  }
  else
  {
    double width = 0.0;
    double height = 0.0;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  [(AVCaptureOutput *)self willChangeValueForKey:@"connections"];
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if ([(NSMutableArray *)self->_outputInternal->connections containsObject:a3])
  {
    a3 = 0;
    if (a4) {
      *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    }
  }
  else
  {
    [(NSMutableArray *)self->_outputInternal->connections addObject:a3];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = objc_msgSend(a3, "inputPorts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
LABEL_8:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        [v12 input];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            goto LABEL_8;
          }
          goto LABEL_21;
        }
      }
      double v13 = (void *)[v12 mediaType];
      if ([v13 isEqualToString:*MEMORY[0x1E4F47C68]])
      {
        uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeFormat");
      }
      else
      {
        long long v15 = (void *)[v12 mediaType];
        if (![v15 isEqualToString:*MEMORY[0x1E4F47C48]]) {
          goto LABEL_21;
        }
        uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "activeDepthDataFormat");
      }
      [(AVCaptureOutput *)self updateMetadataTransformForSourceFormat:v14];
    }
  }
LABEL_21:
  objc_sync_exit(outputInternal);
  [(AVCaptureOutput *)self didChangeValueForKey:@"connections"];
  return a3;
}

+ (id)availableVideoCodecTypesForSourceDevice:(id)a3 sourceFormat:(id)a4 outputDimensions:(id)a5 fileType:(id)a6 videoCodecTypesAllowList:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = *MEMORY[0x1E4F47C08];
  if (([a6 isEqual:*MEMORY[0x1E4F47C08]] & 1) == 0
    && ([a6 isEqual:*MEMORY[0x1E4F47C00]] & 1) == 0
    && ([a6 isEqual:*MEMORY[0x1E4F47BD0]] & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v13;
  }
  if (a4 || (a4 = (id)[a3 activeFormat]) != 0)
  {
    objc_msgSend((id)objc_msgSend(a4, "figCaptureSourceVideoFormat"), "format");
    if FigCapturePixelFormatIsTenBit() && (FigCapturePixelFormatIs422())
    {
      if ([a3 isProResSupported])
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v15 = (void *)[a1 supportedProResCodecTypes];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              if (!a7 || [a7 containsObject:*(void *)(*((void *)&v33 + 1) + 8 * i)]) {
                [v13 insertObject:v20 atIndex:0];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v17);
        }
      }
      return v13;
    }
    if (!a5.var0 || (unint64_t v21 = HIDWORD(*(unint64_t *)&a5), !a5.var1))
    {
      unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a4 formatDescription]);
      unint64_t v21 = HIDWORD(Dimensions);
      a5.var0 = Dimensions;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
    double v24 = v23;
    if (a5.var0 >= -15) {
      int v25 = a5.var0 + 15;
    }
    else {
      int v25 = a5.var0 + 30;
    }
    if ((int)v21 >= -15) {
      int v26 = v21 + 15;
    }
    else {
      int v26 = v21 + 30;
    }
    if ([a3 isHEVCSupported] && v24 * (double)((v25 >> 4) * (v26 >> 4)) > 1000000.0) {
      goto LABEL_39;
    }
    uint64_t v27 = *MEMORY[0x1E4F47D28];
    if (a7 && ![a7 containsObject:*MEMORY[0x1E4F47D28]])
    {
      if (([a6 isEqual:v14] & 1) == 0) {
        goto LABEL_39;
      }
    }
    else
    {
      [v13 addObject:v27];
      if (([a6 isEqual:v14] & 1) == 0) {
        goto LABEL_39;
      }
      if (!a7)
      {
        uint64_t v28 = *MEMORY[0x1E4F47D38];
LABEL_38:
        [v13 addObject:v28];
LABEL_39:
        if ([a3 isHEVCSupported])
        {
          v29 = (uint64_t *)MEMORY[0x1E4F47D30];
          if (!a7 || [a7 containsObject:*MEMORY[0x1E4F47D30]])
          {
            int v30 = [a3 isHEVCPreferred];
            uint64_t v31 = *v29;
            if (v30) {
              [v13 insertObject:v31 atIndex:0];
            }
            else {
              [v13 addObject:v31];
            }
          }
        }
        [a3 isProResSupported];
        return v13;
      }
    }
    uint64_t v28 = *MEMORY[0x1E4F47D38];
    if (![a7 containsObject:*MEMORY[0x1E4F47D38]]) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  return v13;
}

- (void)performFigCaptureSessionOperationSafelyUsingBlock:(id)a3
{
  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AVCaptureOutput_performFigCaptureSessionOperationSafelyUsingBlock___block_invoke;
  v4[3] = &unk_1E5A73288;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

- (void)performBlockOnSessionNotifyingThread:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    uint64_t FigRunLoopMode = AVCaptureGetFigRunLoopMode();
    uint64_t v6 = *MEMORY[0x1E4F1D410];
    v9[0] = FigRunLoopMode;
    v9[1] = v6;
    CFRunLoopPerformBlock(Main, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2], a3);
    double v7 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v7);
  }
  else
  {
    double v8 = (void (*)(id))*((void *)a3 + 2);
    v8(a3);
  }
}

- (void)bumpChangeSeed
{
  [(AVCaptureOutput *)self willChangeValueForKey:@"changeSeed"];
  ++self->_outputInternal->changeSeed;

  [(AVCaptureOutput *)self didChangeValueForKey:@"changeSeed"];
}

- (void)attachToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

+ (id)supportedProResCodecTypes
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F47D18];
  v5[0] = *MEMORY[0x1E4F47D20];
  v5[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F47D10];
  v5[2] = *MEMORY[0x1E4F47D08];
  v5[3] = v3;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
}

- (id)initSubclass
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureOutput;
  uint64_t v2 = [(AVCaptureOutput *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(AVCaptureOutputInternal);
    v2->_outputInternal = v3;
    if (!v3)
    {

      uint64_t v2 = 0;
    }
    if (AVCaptureSessionIsLaunchPrewarmingEnabled())
    {
      v4 = NSString;
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v6 = (id)[v4 stringWithFormat:@"<%@>", NSStringFromClass(v5)];
    }
    else
    {
      id v6 = AVIdentifierForObject((uint64_t)v2);
    }
    [(AVCaptureOutput *)v2 setSinkID:v6];
  }
  return v2;
}

- (void)setSinkID:(id)a3
{
  self->_outputInternal->sinkID = (NSString *)[a3 copy];
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)detachFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  objc_super v3 = *(const void **)(v4 + 8);
  if (v3 != *(const void **)(v2[1] + 16)) {
    __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke_cold_1();
  }
  if (v3)
  {
    CFRelease(v3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16) = 0;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return [v2 detachSafelyFromFigCaptureSession:v5];
}

- (void)handleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  figCaptureSessionSyncQueue = self->_outputInternal->figCaptureSessionSyncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__AVCaptureOutput_handleServerConnectionDeathForFigCaptureSession___block_invoke;
  v4[3] = &unk_1E5A72F98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(figCaptureSessionSyncQueue, v4);
}

uint64_t __67__AVCaptureOutput_handleServerConnectionDeathForFigCaptureSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) safelyHandleServerConnectionDeathForFigCaptureSession:*(void *)(a1 + 40)];
}

- (unsigned)requiredOutputFormatForConnection:(id)a3
{
  if (![(AVCaptureOutput *)self hasRequiredOutputFormatForConnection:a3]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"requiredOutputFormatForConnection: failed since this output has no required output format for that connection." userInfo:0]);
  }
  return 0;
}

- (id)connectionMediaTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  return 1;
}

- (id)_inputForConnection:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "inputPorts", 0), "countByEnumeratingWithState:objects:count:", v4, v5, 16);
  if (result) {
    return (id)[**((id **)&v4[0] + 1) input];
  }
  return result;
}

- (AVMetadataObject)transformedMetadataObjectForMetadataObject:(AVMetadataObject *)metadataObject connection:(AVCaptureConnection *)connection
{
  if (![(NSArray *)[(AVCaptureOutput *)self connections] containsObject:connection])
  {
    long long v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v15);
    }
    NSLog(&cfstr_SuppressingExc.isa, v15);
    return 0;
  }
  id v7 = [(AVMetadataObject *)metadataObject input];
  if (v7 != [(AVCaptureOutput *)self _inputForConnection:connection]) {
    return 0;
  }
  id v8 = [(AVMetadataObject *)metadataObject originalMetadataObject];
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  uint64_t v10 = self->_outputInternal;
  long long v11 = *(_OWORD *)&v10->metadataTransform.c;
  long long v19 = *(_OWORD *)&v10->metadataTransform.a;
  long long v20 = v11;
  long long v21 = *(_OWORD *)&v10->metadataTransform.tx;
  BOOL v12 = [(AVCaptureConnection *)connection isVideoMirrored];
  double v13 = self->_outputInternal;
  BOOL v14 = v12 && v13->physicallyMirrorsVideo;
  double rollAdjustment = v13->rollAdjustment;
  objc_sync_exit(outputInternal);
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  return (AVMetadataObject *)+[AVMetadataObject derivedMetadataObjectFromMetadataObject:v8 withTransform:v18 isVideoMirrored:v14 rollAdjustment:rollAdjustment];
}

- (CGRect)metadataOutputRectOfInterestForRect:(CGRect)rectInOutputCoordinates
{
  CGFloat height = rectInOutputCoordinates.size.height;
  CGFloat width = rectInOutputCoordinates.size.width;
  CGFloat y = rectInOutputCoordinates.origin.y;
  CGFloat x = rectInOutputCoordinates.origin.x;
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  uint64_t v9 = self->_outputInternal;
  long long v10 = *(_OWORD *)&v9->metadataTransform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&v9->metadataTransform.a;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&v9->metadataTransform.tx;
  objc_sync_exit(outputInternal);
  CGAffineTransform v11 = v12;
  CGAffineTransformInvert(&v12, &v11);
  CGAffineTransform v11 = v12;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v13, &v11);
}

- (CGRect)rectForMetadataOutputRectOfInterest:(CGRect)rectInMetadataOutputCoordinates
{
  CGFloat height = rectInMetadataOutputCoordinates.size.height;
  CGFloat width = rectInMetadataOutputCoordinates.size.width;
  CGFloat y = rectInMetadataOutputCoordinates.origin.y;
  CGFloat x = rectInMetadataOutputCoordinates.origin.x;
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  uint64_t v9 = self->_outputInternal;
  long long v10 = *(_OWORD *)&v9->metadataTransform.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&v9->metadataTransform.a;
  *(_OWORD *)&v11.c = v10;
  *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)&v9->metadataTransform.tx;
  objc_sync_exit(outputInternal);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v12, &v11);
}

- (void)removeConnection:(id)a3
{
  [(AVCaptureOutput *)self willChangeValueForKey:@"connections"];
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if ([(NSMutableArray *)self->_outputInternal->connections containsObject:a3]) {
    [(NSMutableArray *)self->_outputInternal->connections removeObject:a3];
  }
  objc_sync_exit(outputInternal);

  [(AVCaptureOutput *)self didChangeValueForKey:@"connections"];
}

- (id)firstEnabledConnectionForMediaType:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVCaptureOutput *)self connections];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v9 isEnabled])
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v10 = objc_msgSend(v9, "inputPorts", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
LABEL_9:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "mediaType"), "isEqual:", a3)) {
              return v9;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
              if (v12) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
      }
    }
    uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    uint64_t v9 = 0;
    if (v6) {
      continue;
    }
    return v9;
  }
}

- (id)liveConnections
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(AVCaptureOutput *)self connections];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v2, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isLive]) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)_recommendedVideoOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodec:(id)a5 isIris:(BOOL)a6 outputFileURL:(id)a7
{
  BOOL v8 = a6;
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  long long v12 = (void *)[a3 sourceDevice];
  long long v13 = (void *)[v12 activeFormat];
  uint64_t v14 = (id *)MEMORY[0x1E4F47D28];
  if (a5 && ![a5 isEqual:*MEMORY[0x1E4F47D28]]) {
    goto LABEL_10;
  }
  uint64_t v15 = objc_msgSend(v12, "AVVideoSettingsForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  if (!v15) {
    goto LABEL_10;
  }
  long long v16 = (void *)v15;
  uint64_t v17 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset");
  if (v13)
  {
    [v13 defaultActiveMinFrameDurationForSessionPreset:v17];
    if (v12)
    {
LABEL_6:
      [v12 activeVideoMinFrameDuration];
      goto LABEL_9;
    }
  }
  else
  {
    memset(&time1, 0, sizeof(time1));
    if (v12) {
      goto LABEL_6;
    }
  }
  memset(&time2, 0, sizeof(time2));
LABEL_9:
  if (!CMTimeCompare(&time1, &time2)) {
    return v16;
  }
LABEL_10:
  BOOL v141 = v8;
  long long v18 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v151 = *v14;
  if (!a5) {
    a5 = *v14;
  }
  uint64_t width = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
  uint64_t height = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue");
  if (v12)
  {
    [v12 activeVideoMinFrameDuration];
    int v21 = v155;
    [v12 activeVideoMinFrameDuration];
    uint64_t v22 = v154;
  }
  else
  {
    uint64_t v22 = 0;
    int v21 = 0;
  }
  double v23 = (double)v21;
  double v24 = (double)v22;
  uint64_t v143 = *MEMORY[0x1E4F47D90];
  uint64_t v25 = objc_msgSend(a4, "objectForKeyedSubscript:");
  if (width) {
    BOOL v26 = height == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (v26)
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v13 formatDescription]);
    if (width) {
      uint64_t width = width;
    }
    else {
      uint64_t width = Dimensions.width;
    }
    if (height) {
      uint64_t height = height;
    }
    else {
      uint64_t height = Dimensions.height;
    }
  }
  double v28 = v23 / v24;
  if ([v13 isPhotoFormat]) {
    uint64_t v29 = [v12 maxH264PhotoDimensions];
  }
  else {
    uint64_t v29 = [v12 maxH264VideoDimensions];
  }
  float v30 = v28;
  v150 = self;
  if ((int)width > (int)v29 || (int)height > SHIDWORD(v29))
  {
    v169.uint64_t width = (double)(int)width;
    v169.uint64_t height = (double)(int)height;
    v171.size.uint64_t width = (double)(int)v29;
    v171.size.uint64_t height = (double)SHIDWORD(v29);
    v171.origin.CGFloat x = 0.0;
    v171.origin.CGFloat y = 0.0;
    CGRect v170 = AVMakeRectWithAspectRatioInsideRect(v169, v171);
    uint64_t width = vcvtmd_s64_f64(v170.size.width) & 0xFFFFFFFE;
    uint64_t height = vcvtmd_s64_f64(v170.size.height) & 0xFFFFFFFE;
    uint64_t v145 = *MEMORY[0x1E4F47DA8];
  }
  else
  {
    uint64_t v145 = v25;
  }
  objc_msgSend((id)objc_msgSend(v13, "figCaptureSourceVideoFormat"), "format");
  int IsTenBit = FigCapturePixelFormatIsTenBit();
  BOOL v31 = (int)FigCapturePlatformIdentifier() > 5;
  int v149 = width * height;
  BOOL v32 = v30 <= 60.0 || (int)width * (int)height < 8294400;
  char v33 = v32;
  char v140 = v33;
  if (!v32) {
    BOOL v31 = 0;
  }
  BOOL v142 = v31;
  if (([a5 isEqualToString:v151] & 1) == 0)
  {
    uint64_t v34 = *MEMORY[0x1E4F47D30];
    if (![a5 isEqualToString:*MEMORY[0x1E4F47D30]]) {
      goto LABEL_213;
    }
  }
  BOOL v36 = (int)width > 1919 && (int)height > 1079;
  BOOL v38 = (int)width > 640 && (int)height > 480;
  BOOL v39 = v30 > 30.0 && v38;
  int v146 = (((int)width + 15) >> 4) * (((int)height + 15) >> 4);
  if ([v12 minMacroblocksForHighProfileUpTo30fps]
    && [v12 minMacroblocksForHighProfileAbove30fps])
  {
    if (v146 >= (int)[v12 minMacroblocksForHighProfileUpTo30fps] && v30 <= 30.0)
    {
      int v40 = v36 || v39;
      BOOL v41 = 1;
      goto LABEL_72;
    }
    int v42 = [v12 minMacroblocksForHighProfileAbove30fps];
    BOOL v41 = v30 > 30.0 && v146 >= v42;
  }
  else
  {
    BOOL v41 = 0;
  }
  int v40 = v36 || v39;
  if ((v40 & 1) == 0 && !v41)
  {
LABEL_84:
    float v53 = v30 * 11.3999996 / 30.0;
    if (v30 >= 120.0) {
      float v53 = 45.6;
    }
    if (v30 <= 120.0)
    {
      float v55 = v53;
    }
    else
    {
      float v54 = v53 + (v30 + -120.0) * 0.0900000254;
      float v55 = v54;
    }
    if ([a5 isEqualToString:*MEMORY[0x1E4F47D30]])
    {
      float v55 = v55 * 0.8;
      [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F47CE0]];
    }
    v49 = v150;
    [v18 setObject:*MEMORY[0x1E4F47D70] forKeyedSubscript:*MEMORY[0x1E4F47D80]];
    goto LABEL_130;
  }
LABEL_72:
  [v18 setObject:*MEMORY[0x1E4F47D78] forKeyedSubscript:*MEMORY[0x1E4F47D80]];
  [v18 setObject:*MEMORY[0x1E4F47D50] forKeyedSubscript:*MEMORY[0x1E4F47D58]];
  [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F47CE0]];
  if (v41)
  {
    LODWORD(v161) = 1110337126;
    long long v160 = xmmword_1A1636798;
    long long v158 = xmmword_1A16367AC;
    LODWORD(v159) = 1109576909;
    long long v166 = xmmword_1A16367C0;
    int v167 = 1106640896;
    if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
      && [a5 isEqualToString:v151])
    {
      [v18 setObject:&unk_1EF4FA0E8 forKeyedSubscript:*MEMORY[0x1E4F44AB8]];
      for (uint64_t i = 0; i != 20; i += 4)
      {
        float v45 = *(float *)((char *)&v160 + i) * 0.95;
        *(float *)((char *)&v160 + i) = v45;
        float v46 = *(float *)((char *)&v158 + i) * 0.9;
        *(float *)((char *)&v158 + i) = v46;
        float v47 = *(float *)((char *)&v166 + i) * 0.9;
        *(float *)((char *)&v166 + i) = v47;
      }
    }
    int v165 = 1103961784;
    long long v164 = xmmword_1A16367E8;
    long long v162 = xmmword_1A16367FC;
    int v163 = 1100674499;
    v49 = v150;
    if ((int)[v12 hevcTurboModeVersion] < 1)
    {
      double v50 = 959447.126;
      LODWORD(v48) = 1100166726;
    }
    else
    {
      int v165 = 1103155219;
      *((void *)&v162 + 1) = 0x412B74BC40C2511ALL;
      int v163 = 1100065171;
      double v50 = 618764.626;
      LODWORD(v48) = 1099587864;
    }
    if (v142)
    {
      *((double *)&v162 + 1) = v50;
      int v163 = LODWORD(v48);
    }
    int v56 = objc_msgSend(a5, "isEqualToString:", *MEMORY[0x1E4F47D30], v50, v48);
    v57 = (long long *)&unk_1A16367D4;
    if (v56)
    {
      v58 = &v164;
    }
    else
    {
      v57 = &v160;
      v58 = &v158;
    }
    if (v146 >= 3600)
    {
      int v59 = 3600;
    }
    else
    {
      v58 = v57;
      int v59 = 0;
    }
    if (v146 >= 3600) {
      int v60 = 8160;
    }
    else {
      int v60 = 3600;
    }
    if (v56) {
      v61 = &v164;
    }
    else {
      v61 = &v158;
    }
    v62 = &v162;
    if (!v56) {
      v62 = &v166;
    }
    if (v146 >= 8160) {
      v63 = v61;
    }
    else {
      v63 = v57;
    }
    if (v146 >= 8160) {
      v64 = v62;
    }
    else {
      v64 = v58;
    }
    if (v146 >= 8160) {
      int v65 = 8160;
    }
    else {
      int v65 = v59;
    }
    if (v146 >= 8160) {
      int v66 = 32400;
    }
    else {
      int v66 = v60;
    }
    unsigned int v67 = (float)(v30 / 30.0);
    if (v67)
    {
      unsigned int v68 = -1;
      do
      {
        ++v68;
        BOOL v32 = v67 > 1;
        v67 >>= 1;
      }
      while (v32);
      if (v68 > 2)
      {
        float v73 = (float)(v30 / 240.0) * *((float *)v63 + 4);
        float v74 = (float)(v30 / 240.0) * *((float *)v64 + 4);
        goto LABEL_129;
      }
      unsigned int v69 = v68 + 1;
    }
    else
    {
      unsigned int v69 = 0;
    }
    float v70 = flt_1A1636810[v69];
    float v71 = flt_1A1636810[v69 + 1] - v70;
    float v72 = v30 - v70;
    float v73 = *((float *)v63 + v69)
        + (float)((float)((float)(*((float *)v63 + v69 + 1) - *((float *)v63 + v69)) / v71) * v72);
    float v74 = *((float *)v64 + v69)
        + (float)((float)((float)(*((float *)v64 + v69 + 1) - *((float *)v64 + v69)) / v71) * v72);
LABEL_129:
    float v55 = v73 + (float)((float)((float)(v74 - v73) / (float)(v66 - v65)) * (float)(v146 - v65));
    goto LABEL_130;
  }
  if (!v40) {
    goto LABEL_84;
  }
  if (v36)
  {
    double v51 = v30;
    v49 = v150;
    if (v30 > 60.0)
    {
      double v52 = (v51 + -60.0) * 0.193666681 + 12.5;
    }
    else
    {
      if (v30 <= 30.0)
      {
        float v132 = v51 * 8.19999981 / 30.0;
        if (v30 >= 30.0) {
          float v132 = 8.2;
        }
LABEL_257:
        float v55 = (float)((float)((float)((float)v149 * -0.00000034899) + 8.9237) / 8.2) * v132;
        if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
          && [a5 isEqualToString:v151])
        {
          [v18 setObject:&unk_1EF4FA0E8 forKeyedSubscript:*MEMORY[0x1E4F44AB8]];
          double v130 = v55;
          double v131 = 0.9;
          goto LABEL_260;
        }
        goto LABEL_130;
      }
      double v52 = (v51 + -30.0) * 0.14333334 + 8.19999981;
    }
    float v132 = v52;
    goto LABEL_257;
  }
  float v128 = v30 * 8.19999981 / 30.0;
  if (v30 >= 120.0) {
    float v128 = 32.8;
  }
  if (v30 <= 120.0)
  {
    float v55 = v128;
  }
  else
  {
    float v129 = v128 + (v30 + -120.0) * 0.0899999936;
    float v55 = v129;
  }
  v49 = v150;
  if (objc_msgSend(v12, "usesQuantizationScalingMatrix_H264_Steep_16")
    && [a5 isEqualToString:v151])
  {
    [v18 setObject:&unk_1EF4FA0E8 forKeyedSubscript:*MEMORY[0x1E4F44AB8]];
    double v130 = v55;
    double v131 = 0.95;
LABEL_260:
    float v55 = v130 * v131;
  }
LABEL_130:
  if (IsTenBit)
  {
    float v75 = v55 * 1.1;
    float v55 = v75;
  }
  if (v12)
  {
    [v12 activeVideoMaxFrameDuration];
    int v138 = v153;
    [v12 activeVideoMaxFrameDuration];
    uint64_t v137 = v152;
  }
  else
  {
    uint64_t v137 = 0;
    int v138 = 0;
  }
  uint64_t v76 = (int)(float)((float)(v55 * (float)(int)width) * (float)(int)height);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(AVCaptureOutput *)v49 isSpatialVideoCaptureEnabled])
  {
    LODWORD(v76) = llround((double)(int)v76 + (double)(int)v76);
  }
  uint64_t v77 = [NSNumber numberWithInt:v76];
  uint64_t v139 = *MEMORY[0x1E4F47CF0];
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v77);
  uint64_t v78 = *MEMORY[0x1E4F47D68];
  [v18 setObject:&unk_1EF4FA100 forKeyedSubscript:*MEMORY[0x1E4F47D68]];
  uint64_t v34 = *MEMORY[0x1E4F47D30];
  if ([a5 isEqualToString:*MEMORY[0x1E4F47D30]])
  {
    if (!v142)
    {
      if ([v12 hevcAllowBFramesForHighCTUCount])
      {
        BOOL v80 = v30 <= 30.0 || v149 < 2073601;
        uint64_t v81 = [NSNumber numberWithBool:v80];
        [v18 setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F47CE0]];
        if (!v80) {
          goto LABEL_155;
        }
        goto LABEL_153;
      }
      if (v30 > 30.0 && (v30 > 120.0 || v149 >= 2073601))
      {
        uint64_t v84 = [NSNumber numberWithBool:0];
        uint64_t v83 = *MEMORY[0x1E4F47CE0];
        goto LABEL_154;
      }
    }
    uint64_t v82 = [NSNumber numberWithBool:1];
    [v18 setObject:v82 forKeyedSubscript:*MEMORY[0x1E4F47CE0]];
LABEL_153:
    uint64_t v83 = *MEMORY[0x1E4F447D8];
    uint64_t v84 = MEMORY[0x1E4F1CC38];
LABEL_154:
    [v18 setObject:v84 forKeyedSubscript:v83];
LABEL_155:
    if ((int)FigCapturePlatformIdentifier() >= 6) {
      [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F449F8]];
    }
    if (!objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue")) {
      objc_msgSend((id)objc_msgSend(v13, "figCaptureSourceVideoFormat"), "format");
    }
    if ([v12 isMotionCompensatedTemporalFilteringSupported]
      && FigCapturePixelFormatIs420()
      && (float)(v30 * (float)v149) <= 290300000.0)
    {
      [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F44B38]];
    }
  }
  [v18 setObject:&unk_1EF4FA118 forKeyedSubscript:*MEMORY[0x1E4F449E0]];
  [v18 setObject:&unk_1EF4FA130 forKeyedSubscript:*MEMORY[0x1E4F449B8]];
  if (![a5 isEqualToString:v34])
  {
    v88 = (uint64_t *)MEMORY[0x1E4F47CF8];
    if (v30 > 30.0) {
      [v18 setObject:&unk_1EF4FA148 forKeyedSubscript:*MEMORY[0x1E4F47CF8]];
    }
    if (v149 <= 2764800) {
      goto LABEL_181;
    }
    float v89 = (double)v138 / (double)v137;
    unint64_t v90 = llroundf(v30);
    uint64_t v86 = *v88;
    if (vabds_f32(v30, v89) < 0.5 && v90 == 24) {
      v87 = &unk_1EF4FA160;
    }
    else {
      v87 = &unk_1EF4FA118;
    }
    goto LABEL_180;
  }
  if (v30 > 30.0)
  {
    if (v140)
    {
      uint64_t v86 = *MEMORY[0x1E4F44828];
      v87 = &unk_1EF4FA148;
LABEL_180:
      [v18 setObject:v87 forKeyedSubscript:v86];
      goto LABEL_181;
    }
    v92 = NSNumber;
    *(float *)&double v85 = v30 * 0.25;
LABEL_178:
    v87 = (void *)[v92 numberWithFloat:v85];
    uint64_t v86 = *MEMORY[0x1E4F44828];
    goto LABEL_180;
  }
  if (v149 > 2764800)
  {
    v92 = NSNumber;
    *(float *)&double v85 = v30;
    goto LABEL_178;
  }
LABEL_181:
  long long v160 = 0uLL;
  uint64_t v161 = 0;
  if (v13)
  {
    [v13 lowestSupportedVideoFrameDuration];
    int v93 = DWORD2(v160);
    uint64_t v94 = v160;
  }
  else
  {
    uint64_t v94 = 0;
    int v93 = 0;
  }
  float v95 = (float)v93 / (float)v94;
  if (v95 < v30)
  {
    fig_log_get_emitter();
    uint64_t v135 = v7;
    LODWORD(v133) = 0;
    FigDebugAssert3();
  }
  *(float *)&double v85 = v95;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v85, v133, v135), @"MaximumRealTimeFrameRate");
  v96 = (void *)[a3 output];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v141)
  {
    long long v158 = 0uLL;
    uint64_t v159 = 0;
    if (v96)
    {
      [v96 livePhotoMovieVideoFrameDuration];
      int v97 = DWORD2(v158);
      uint64_t v98 = v158;
    }
    else
    {
      uint64_t v98 = 0;
      int v97 = 0;
    }
    float v99 = (float)v97 / (float)v98;
    if (v99 < v30)
    {
      fig_log_get_emitter();
      uint64_t v136 = v7;
      LODWORD(v134) = 0;
      FigDebugAssert3();
    }
    uint64_t v100 = MEMORY[0x1E4F1CC38];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", 0.6, v134, v136), v78);
    [v18 setObject:*MEMORY[0x1E4F47D78] forKeyedSubscript:*MEMORY[0x1E4F47D80]];
    if ([a5 isEqualToString:v34]) {
      [v18 removeObjectForKey:*MEMORY[0x1E4F447D8]];
    }
    int v101 = [a5 isEqualToString:v34];
    uint64_t v102 = MEMORY[0x1E4F1CC28];
    if (v101) {
      uint64_t v103 = v100;
    }
    else {
      uint64_t v103 = MEMORY[0x1E4F1CC28];
    }
    [v18 setObject:v103 forKeyedSubscript:*MEMORY[0x1E4F47CE0]];
    *(float *)&double v104 = v99;
    uint64_t v105 = [NSNumber numberWithFloat:v104];
    [v18 setObject:v105 forKeyedSubscript:*MEMORY[0x1E4F47D48]];
    [v18 setObject:v102 forKeyedSubscript:*MEMORY[0x1E4F47CD8]];
    if ([v13 isIrisVideoStabilizationSupported]) {
      int v106 = 1307;
    }
    else {
      int v106 = 1388;
    }
    if ([a5 isEqualToString:v151]) {
      [v18 setObject:&unk_1EF4FA0E8 forKeyedSubscript:*MEMORY[0x1E4F44AB8]];
    }
    unsigned int v107 = v106 * v146;
    int v108 = [a5 isEqualToString:v34];
    unsigned int v109 = vcvtpd_u64_f64((double)v107 * 0.75);
    if (!v108) {
      unsigned int v109 = v107;
    }
    if (v109 <= 0xF4240) {
      uint64_t v110 = 1000000;
    }
    else {
      uint64_t v110 = v109;
    }
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v110), v139);
  }
  if ([v12 isVariableFrameRateVideoCaptureEnabled])
  {
    if ([v13 isVariableFrameRateVideoCaptureSupported])
    {
      *(float *)&double v111 = v30;
      uint64_t v112 = [NSNumber numberWithFloat:v111];
      [v18 setObject:v112 forKeyedSubscript:*MEMORY[0x1E4F44910]];
      if (v149 >= 8294400) {
        [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F44A90]];
      }
    }
  }
LABEL_213:
  if ([a5 isEqualToString:v34])
  {
    [v18 removeObjectForKey:*MEMORY[0x1E4F47D58]];
    v113 = (void *)MEMORY[0x1E4F452D0];
    if (IsTenBit) {
      v113 = (void *)MEMORY[0x1E4F452A8];
    }
    [v18 setObject:*v113 forKeyedSubscript:*MEMORY[0x1E4F47D80]];
    if ([v12 isHEVCRelaxedAverageBitRateTargetSupported]) {
      [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F44AD0]];
    }
  }
  if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "supportedProResCodecTypes"), "containsObject:", a5))
  {
    uint64_t v114 = (uint64_t)(float)((float)((float)(flt_1A1636760[v149 > 2073600] * (float)(int)width) * (float)(int)height)
                          * v30);
    v115 = (void *)[a3 output];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v117 = objc_opt_isKindOfClass();
    id v118 = a7;
    if ((isKindOfClass & 1) == 0 && (v117 & 1) == 0) {
      goto LABEL_231;
    }
    if (isKindOfClass) {
      id v118 = (id)[v115 outputFileURL];
    }
    if (v118)
    {
      int IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
      if (v114 >= 3040000000) {
        uint64_t v120 = 3040000000;
      }
      else {
        uint64_t v120 = v114;
      }
      uint64_t v121 = 760000000;
      if (v114 < 760000000) {
        uint64_t v121 = v114;
      }
      if (!IsFileOnExternalStorageDevice) {
        uint64_t v120 = v121;
      }
    }
    else
    {
LABEL_231:
      if (v114 >= 760000000) {
        uint64_t v120 = 760000000;
      }
      else {
        uint64_t v120 = v114;
      }
    }
    [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F44A78]];
    if ([a5 isEqualToString:*MEMORY[0x1E4F47D10]])
    {
      [v18 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F44A90]];
      uint64_t v122 = [NSNumber numberWithLongLong:v120];
      [v18 setObject:v122 forKeyedSubscript:*MEMORY[0x1E4F47CF0]];
    }
  }
  if (([a5 isEqualToString:v34] & 1) != 0 || objc_msgSend(a5, "isEqualToString:", v151)) {
    [v18 setObject:&unk_1EF4FA178 forKeyedSubscript:*MEMORY[0x1E4F44A98]];
  }
  [v18 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F44AC0]];
  *(float *)&double v123 = v30;
  uint64_t v124 = [NSNumber numberWithFloat:v123];
  [v18 setObject:v124 forKeyedSubscript:*MEMORY[0x1E4F47D48]];
  long long v16 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:a5 forKeyedSubscript:*MEMORY[0x1E4F47D00]];
  uint64_t v125 = [NSNumber numberWithInt:width];
  [v16 setObject:v125 forKeyedSubscript:*MEMORY[0x1E4F47DB0]];
  uint64_t v126 = [NSNumber numberWithInt:height];
  [v16 setObject:v126 forKeyedSubscript:*MEMORY[0x1E4F47D60]];
  if (v145) {
    [v16 setObject:v145 forKeyedSubscript:v143];
  }
  if ([v18 count]) {
    [v16 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F47D40]];
  }
  return v16;
}

- (id)_recommendedAudioOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 fileType:(id)a5
{
  BOOL v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  uint64_t v9 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject"), "formatDescription");
  long long v10 = objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "figCaptureSourceAudioSettingsForSessionPreset:", objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"));
  objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CE0]), "doubleValue");
  double v12 = v11;
  size_t sizeOut = 0;
  objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CF8]), "doubleValue");
  double v14 = v13;
  LODWORD(v15) = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CF0]), "intValue");
  if (v9)
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v9);
    if (StreamBasicDescription)
    {
      uint64_t v17 = StreamBasicDescription;
      double mSampleRate = StreamBasicDescription->mSampleRate;
      UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (objc_msgSend((id)objc_msgSend(a3, "sourceDevice"), "fallbackAudioCaptureModeIfApplicableForCurrentRoute:", objc_msgSend((id)objc_msgSend(a3, "sourceDeviceInput"), "audioCaptureMode")) == 2)unsigned int v20 = 2; {
      else
      }
        unsigned int v20 = mChannelsPerFrame;
      uint64_t mBitsPerChannel = v17->mBitsPerChannel;
    }
    else
    {
      uint64_t mBitsPerChannel = 16;
      unsigned int v20 = 1;
      double mSampleRate = v12;
    }
    ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(v9, &sizeOut);
  }
  else
  {
    uint64_t v22 = (void *)[MEMORY[0x1E4F153E0] sharedInstance];
    double v23 = (void *)[v22 category];
    if (([v23 isEqualToString:*MEMORY[0x1E4F14F90]] & 1) != 0
      || [v23 isEqualToString:*MEMORY[0x1E4F14FA8]])
    {
      int v24 = [v22 inputNumberOfChannels];
      int v25 = 0;
      if (v24 <= 1) {
        unsigned int v20 = 1;
      }
      else {
        unsigned int v20 = v24;
      }
    }
    else
    {
      int v25 = 1;
      unsigned int v20 = 1;
    }
    if (!objc_msgSend(-[AVCaptureOutput session](self, "session"), "usesApplicationAudioSession")
      || ((v25 | objc_msgSend(-[AVCaptureOutput session](self, "session"), "automaticallyConfiguresApplicationAudioSession")) & 1) != 0|| (objc_msgSend(v22, "sampleRate"), v27 == 0.0))
    {
      ChannelLayout = 0;
      uint64_t mBitsPerChannel = 16;
      double mSampleRate = v12;
    }
    else
    {
      [v22 sampleRate];
      double mSampleRate = v28;
      ChannelLayout = 0;
      uint64_t mBitsPerChannel = 16;
    }
  }
  if (v15) {
    uint64_t v15 = v15;
  }
  else {
    uint64_t v15 = v20;
  }
  if (v14 == 0.0) {
    double v14 = mSampleRate;
  }
  if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "likelyToRecordProResMovies"))
  {
    double v14 = 48000.0;
LABEL_28:
    uint64_t v29 = 1819304813;
    uint64_t v30 = [NSNumber numberWithInt:mBitsPerChannel];
    [v8 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F151F0]];
    uint64_t v31 = MEMORY[0x1E4F1CC28];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F151F8]];
    uint64_t v32 = *MEMORY[0x1E4F15208];
LABEL_32:
    [v8 setObject:v31 forKeyedSubscript:v32];
    uint64_t v34 = *MEMORY[0x1E4F15218];
    long long v35 = v8;
    uint64_t v36 = v31;
LABEL_33:
    [v35 setObject:v36 forKeyedSubscript:v34];
    goto LABEL_34;
  }
  if ([a5 isEqualToString:*MEMORY[0x1E4F47C18]]) {
    goto LABEL_28;
  }
  if (([a5 isEqualToString:*MEMORY[0x1E4F47BB0]] & 1) != 0
    || [a5 isEqualToString:*MEMORY[0x1E4F47BA8]])
  {
    uint64_t v29 = 1819304813;
    uint64_t v33 = [NSNumber numberWithInt:mBitsPerChannel];
    [v8 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F151F0]];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F151F8]];
    uint64_t v32 = *MEMORY[0x1E4F15208];
    uint64_t v31 = MEMORY[0x1E4F1CC28];
    goto LABEL_32;
  }
  uint64_t v29 = 1633772320;
  if (([a5 isEqualToString:*MEMORY[0x1E4F47C08]] & 1) == 0
    && ([a5 isEqualToString:*MEMORY[0x1E4F47C00]] & 1) == 0
    && ([a5 isEqualToString:*MEMORY[0x1E4F47BA0]] & 1) == 0
    && ([a5 isEqualToString:*MEMORY[0x1E4F47BD0]] & 1) == 0
    && ([a5 isEqualToString:*MEMORY[0x1E4F47BC8]] & 1) == 0
    && ![a5 isEqualToString:*MEMORY[0x1E4F47BD8]])
  {
    if ([a5 isEqualToString:*MEMORY[0x1E4F47BB8]])
    {
      uint64_t v15 = 1;
      uint64_t v29 = 1935764850;
      double v14 = 8000.0;
    }
    goto LABEL_34;
  }
  uint64_t v42 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CE8]), "intValue");
  if ((int)v15 >= 2) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = v15;
  }
  if (v42)
  {
    uint64_t v43 = v42;
    v44 = 0;
LABEL_49:
    uint64_t v45 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  if (v14 != v12) {
    goto LABEL_34;
  }
  uint64_t v43 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F51CD0]), "intValue");
  v44 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F51CD8]];
  if (![v44 isEqualToString:*MEMORY[0x1E4F14F48]]) {
    goto LABEL_49;
  }
  float v47 = (void *)[v10 objectForKeyedSubscript:*MEMORY[0x1E4F51D00]];
  if (!v47) {
    goto LABEL_49;
  }
  uint64_t v45 = [v47 intValue];
LABEL_50:
  if ((int)v43 >= 1)
  {
    uint64_t v46 = [NSNumber numberWithInt:v43];
    [v8 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F151C8]];
  }
  if (v44) {
    [v8 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F151D0]];
  }
  if (v45 != -1)
  {
    uint64_t v36 = [NSNumber numberWithInt:v45];
    uint64_t v34 = *MEMORY[0x1E4F151A0];
    long long v35 = v8;
    goto LABEL_33;
  }
LABEL_34:
  uint64_t v37 = [NSNumber numberWithInt:v29];
  [v8 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F151E0]];
  uint64_t v38 = [NSNumber numberWithDouble:v14];
  [v8 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F15270]];
  uint64_t v39 = [NSNumber numberWithInt:v15];
  [v8 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F15228]];
  if (v15 == v20 && ChannelLayout)
  {
    uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithBytes:ChannelLayout length:sizeOut];
    [v8 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F15198]];
  }
  return v8;
}

- (id)recommendedCinematicAudioOutputSettingsForConnection:(id)a3 fileType:(id)a4 isProResCapture:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  BOOL v8 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject"), "formatDescription");
  if (v5) {
    uint64_t v9 = 1819304813;
  }
  else {
    uint64_t v9 = 1634754915;
  }
  if (v8) {
    CMAudioFormatDescriptionGetStreamBasicDescription(v8);
  }
  uint64_t v10 = [NSNumber numberWithInt:v9];
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F151E0]];
  uint64_t v11 = [NSNumber numberWithInt:4];
  [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F15228]];
  if (v5)
  {
    [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F15218]];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F15208]];
  }
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  int v14 = 12451844;
  uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v14 length:32];
  [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F15198]];
  return v7;
}

- (id)recommendedOutputSettingsForConnection:(id)a3 sourceSettings:(id)a4 videoCodecType:(id)a5 fileType:(id)a6 isIris:(BOOL)a7 outputFileURL:(id)a8
{
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  BOOL v9 = a7;
  uint64_t v15 = (void *)[a3 mediaType];
  if ([v15 isEqualToString:*MEMORY[0x1E4F47C68]])
  {
    return [(AVCaptureOutput *)self _recommendedVideoOutputSettingsForConnection:a3 sourceSettings:a4 videoCodec:a5 isIris:v9 outputFileURL:a8];
  }
  uint64_t v17 = (void *)[a3 mediaType];
  if (![v17 isEqualToString:*MEMORY[0x1E4F47C40]]) {
    return 0;
  }

  return [(AVCaptureOutput *)self _recommendedAudioOutputSettingsForConnection:a3 sourceSettings:a4 fileType:a6];
}

+ (int64_t)dataDroppedReasonFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!a3) {
    return 0;
  }
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F240], 0);
  if (FigCFEqual()) {
    return 1;
  }
  if (FigCFEqual()) {
    return 2;
  }
  if (FigCFEqual()) {
    return 3;
  }
  return 0;
}

- (BOOL)updateVideoSettingsForConnection:(id)a3
{
  return 0;
}

- (void)getTransform:(CGAffineTransform *)a3 mirroredOut:(BOOL *)a4 rollAdjustmentOut:(double *)a5 forConnection:(id)a6
{
  outputInternal = self->_outputInternal;
  objc_sync_enter(outputInternal);
  if (a3)
  {
    uint64_t v12 = self->_outputInternal;
    long long v13 = *(_OWORD *)&v12->metadataTransform.a;
    long long v14 = *(_OWORD *)&v12->metadataTransform.tx;
    *(_OWORD *)&a3->c = *(_OWORD *)&v12->metadataTransform.c;
    *(_OWORD *)&a3->tCGFloat x = v14;
    *(_OWORD *)&a3->a = v13;
  }
  if (a4)
  {
    if ([a6 isVideoMirrored]) {
      BOOL physicallyMirrorsVideo = self->_outputInternal->physicallyMirrorsVideo;
    }
    else {
      BOOL physicallyMirrorsVideo = 0;
    }
    *a4 = physicallyMirrorsVideo;
  }
  if (a5) {
    *a5 = self->_outputInternal->rollAdjustment;
  }

  objc_sync_exit(outputInternal);
}

void __45__AVCaptureOutput_attachToFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureOutput attachToFigCaptureSession:]_block_invoke", "AVCaptureOutput.m", 364, "_outputInternal->figCaptureSession == NULL");
}

void __47__AVCaptureOutput_detachFromFigCaptureSession___block_invoke_cold_1()
{
  __assert_rtn("-[AVCaptureOutput detachFromFigCaptureSession:]_block_invoke", "AVCaptureOutput.m", 380, "figCaptureSession == _outputInternal->figCaptureSession");
}

@end