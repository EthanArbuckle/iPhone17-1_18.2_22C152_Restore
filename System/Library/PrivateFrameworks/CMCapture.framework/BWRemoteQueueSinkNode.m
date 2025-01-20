@interface BWRemoteQueueSinkNode
+ (void)initialize;
- (BOOL)attachPanoramaMetadata;
- (BOOL)cameraSupportsFlash;
- (BOOL)discardsLateSampleBuffers;
- (BOOL)frameSenderSupportEnabled;
- (BOOL)panoramaRequiresLTMLocking;
- (BOOL)removeCameraIntrinsicMatrixAttachment;
- (BOOL)sceneStabilityMetadataEnabled;
- (BWRemoteQueueSinkNode)initWithMediaType:(unsigned int)a3 clientAuditToken:(id *)a4 sinkID:(id)a5;
- (BWRemoteQueueSinkNodeDelegate)delegate;
- (id)nodeSubType;
- (id)requestedBufferAttachmentsTrie;
- (int)clientVideoRetainedBufferCount;
- (uint64_t)_finishRenderingSampleBufferUsingTheLocalQueue:(uint64_t)result;
- (uint64_t)_finishRenderingSampleBufferUsingTheRemoteCaptureStack:(int)a3 isDroppedSample:;
- (uint64_t)_sendAndClearCoreAnalyticsData;
- (void)_handlePeerTerminated;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)registerSurfacesFromSourcePool:(id)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAttachPanoramaMetadata:(BOOL)a3;
- (void)setCameraSupportsFlash:(BOOL)a3;
- (void)setClientVideoRetainedBufferCount:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscardsLateSampleBuffers:(BOOL)a3;
- (void)setFrameSenderSupportEnabled:(BOOL)a3;
- (void)setPanoramaRequiresLTMLocking:(BOOL)a3;
- (void)setRemoveCameraIntrinsicMatrixAttachment:(BOOL)a3;
- (void)setRequestedBufferAttachmentsTrie:(id)a3;
- (void)setSceneStabilityMetadataEnabled:(BOOL)a3;
- (void)updateClientAuditToken:(id *)a3;
@end

@implementation BWRemoteQueueSinkNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  CFTypeRef v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F240], 0);
  memset(&v83, 0, sizeof(v83));
  CMSampleBufferGetPresentationTimeStamp(&v83, a3);
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  CVPixelBufferGetPixelFormatType(ImageBuffer);
  BOOL v8 = self->_mediaTypeIsVideo && v6 == 0;
  if (v8 && (v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) != 0)
  {
    v10 = (void *)[v9 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    BWActiveDeviceTypeFromPortType(v10);
  }
  else
  {
    v10 = 0;
  }
  v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    time[0] = v83;
    CMTimeGetSeconds(time);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    IOSurfaceGetID(IOSurface);
    kdebug_trace();
  }
  if (self->_remoteQueueSender || self->_localQueue)
  {
    if (!self->_mediaTypeIsAudio && v6 == 0)
    {
      frameCounter = self->_frameCounter;
      time[0] = v83;
      [(FigCaptureFrameCounter *)frameCounter incrementWithPTS:time];
    }
    if (!self->_mediaTypeIsVideo || v6 != 0)
    {
      BOOL v16 = 0;
      if (v6) {
        goto LABEL_87;
      }
      goto LABEL_83;
    }
    int64_t totalNumberOfFrames = self->_totalNumberOfFrames;
    BOOL v76 = totalNumberOfFrames == 0;
    self->_int64_t totalNumberOfFrames = totalNumberOfFrames + 1;
    if (v10) {
      [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setDeviceMask:[(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload deviceMask] | BWActiveDeviceTypeFromPortType(v10)];
    }
    CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F53070];
    CFDictionaryRef v19 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    v77 = v10;
    if (v19)
    {
      time[0].unsigned int value = 0;
      uint64_t v20 = *MEMORY[0x1E4F54120];
      if (CFDictionaryGetValueIfPresent(v19, (const void *)*MEMORY[0x1E4F54120], (const void **)time))
      {
        CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F52FD8];
        CFTypeRef v22 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FD8], 0);
        if (v22) {
          id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v22];
        }
        else {
          id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        id v24 = v23;
        [v24 setObject:time[0].value forKeyedSubscript:v20];
        CMSetAttachment(a3, v21, v24, 1u);
      }
    }
    if (self->_removeCameraIntrinsicMatrixAttachment) {
      CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E4F1F218]);
    }
    if (self->_attachPanoramaMetadata)
    {
      id ClientSpecifiedMetadataForPanorama = FigCaptureMetadataUtilitiesCreateClientSpecifiedMetadataForPanorama(a3, self->_panoramaRequiresLTMLocking);
      if (ClientSpecifiedMetadataForPanorama)
      {
        v26 = ClientSpecifiedMetadataForPanorama;
        CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F52FD8];
        CFTypeRef v28 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FD8], 0);
        if (v28) {
          id v29 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v28];
        }
        else {
          id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        id v30 = v29;
        [v30 addEntriesFromDictionary:v26];
        CMSetAttachment(a3, v27, v30, 1u);
        CFRelease(v26);
      }
    }
    v78 = ImageBuffer;
    CFTypeRef v79 = v6;
    if (ImageBuffer)
    {
      if (self->_stabilityMonitor)
      {
        v31 = (void *)CMGetAttachment(a3, v18, 0);
        [v31 objectForKeyedSubscript:*MEMORY[0x1E4F53BC0]];
        stabilityMonitor = self->_stabilityMonitor;
        CMSampleBufferGetPresentationTimeStamp(&v82, a3);
        [(BWSceneStabilityMonitor *)stabilityMonitor calculateStabilityWithPixelBuffer:ImageBuffer pts:&v82 metadataDictionary:v31 forceSceneMotion:0];
        v33 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[BWSceneStabilityMonitor isStable](self->_stabilityMonitor, "isStable"));
        [v33 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F53140]];
        v35 = NSNumber;
        [(BWSceneStabilityMonitor *)self->_stabilityMonitor stabilityMetric];
        uint64_t v36 = objc_msgSend(v35, "numberWithFloat:");
        [v33 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F53138]];
      }
      else
      {
        v33 = 0;
      }
      if (self->_requestedBufferAttachmentsTrie)
      {
        CFDictionaryRef v38 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 1u);
        if (v38)
        {
          CFDictionaryRef v39 = v38;
          if (!v33) {
            v33 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          }
          [(FigCaptureTrie *)self->_requestedBufferAttachmentsTrie extractFrom:v39 writeInto:v33 assumeMutable:0 overwrite:0];
        }
      }
      if (self->_frameSenderSupportEnabled)
      {
        frameSender = self->_frameSender;
        if (!frameSender)
        {
          uint64_t v41 = getpid();
          unsigned int receiverPID = self->_receiverPID;
          uint64_t v42 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_receiverAuditToken length:32];
          if (self->_receiverPID == v41)
          {
            uint64_t v41 = 0;
            uint64_t v43 = 0;
          }
          else
          {
            memset(time, 0, 32);
            uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", time, 32, FigCaptureGetCurrentProcessAuditToken(time));
          }
          frameSender = [[CMCaptureFrameSenderService alloc] initWithEndpointType:@"VideoDataOutput" endpointPID:receiverPID endpointProxyPID:v41 endpointAuditToken:v42 endpointProxyAuditToken:v43 endpointCameraUniqueID:@"unknown"];
          self->_frameSender = frameSender;
        }
        [(CMCaptureFrameSenderService *)frameSender sendFrame:a3];
      }
      memset(&v85, 0, sizeof(v85));
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v85, HostTimeClock);
      if (*v11 == 1)
      {
        time[0] = v83;
        CMTimeGetSeconds(time);
        time[0] = v85;
        CMTime rhs = v83;
        CMTimeSubtract(&v81, time, &rhs);
        time[0] = v81;
        CMTimeGetSeconds(time);
        kdebug_trace();
      }
      v37 = v33;
    }
    else
    {
      v37 = 0;
    }
    sharedMemoryPoolCFAllocator = self->_sharedMemoryPoolCFAllocator;
    BOOL cameraSupportsFlash = self->_cameraSupportsFlash;
    char attachDetectedObjectsInfo = self->_attachDetectedObjectsInfo;
    BOOL disableFlatDictionaryVDOMetadata = self->_disableFlatDictionaryVDOMetadata;
    char v48 = [(BWGraph *)[(BWNode *)self graph] clientExpectsCameraMountedInLandscapeOrientation];
    v49 = (void *)CMGetAttachment(a3, v18, 0);
    if (!v49)
    {
      v10 = v77;
      ImageBuffer = v78;
      BOOL v16 = v76;
      CFTypeRef v6 = v79;
LABEL_83:
      if (!self->_cachedFormatDescription)
      {
        FormatDescription = CMSampleBufferGetFormatDescription(a3);
        if (FormatDescription) {
          FormatDescription = (void *)CFRetain(FormatDescription);
        }
        self->_cachedFormatDescription = (opaqueCMFormatDescription *)FormatDescription;
      }
LABEL_87:
      BWSampleBufferRemoveAllAttachedMedia(a3);
      BWNodeSanitizeMetadataIfNecessary(a3);
      if (self->_remoteQueueSender)
      {
        if (-[BWRemoteQueueSinkNode _finishRenderingSampleBufferUsingTheRemoteCaptureStack:isDroppedSample:]((uint64_t)self, a3, v6 != 0))goto LABEL_89; {
      }
        }
      else if (self->_localQueue {
             && -[BWRemoteQueueSinkNode _finishRenderingSampleBufferUsingTheLocalQueue:]((uint64_t)self, a3))
      }
      {
LABEL_89:
        if (!v16) {
          return;
        }
LABEL_94:
        if (dword_1EB4C52D0)
        {
          LODWORD(rhs.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int value = rhs.value;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v60 = value;
          }
          else {
            unsigned int v60 = value & 0xFFFFFFFE;
          }
          if (v60)
          {
            LODWORD(v85.value) = 136315394;
            *(CMTimeValue *)((char *)&v85.value + 4) = (CMTimeValue)"-[BWRemoteQueueSinkNode renderSampleBuffer:forInput:]";
            LOWORD(v85.flags) = 2114;
            *(void *)((char *)&v85.flags + 2) = self;
            LODWORD(v73) = 22;
            v72 = &v85;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        self->_firstPTS = ($95D729B680665BEAEFA1D6FCA8238556)v83;
        -[BWVideoDataOutputAnalyticsPayload setClientApplicationID:](self->_analyticsPayload, "setClientApplicationID:", self->_clientApplicationID, v72, v73);
        v61 = CMSampleBufferGetFormatDescription(a3);
        unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(v61);
        FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v61);
        if (v10) {
          [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setDevicePosition:BWCaptureDevicePositionFromPortType(v10)];
        }
        [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setHeight:HIDWORD(Dimensions)];
        [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setWidth:Dimensions];
        CVImageBufferRef v64 = CMSampleBufferGetImageBuffer(a3);
        if (v64)
        {
          CVImageBufferRef v65 = v64;
          int v66 = objc_msgSend((id)CMGetAttachment(v64, @"MirroredHorizontal", 0), "BOOLValue");
          uint64_t v67 = v66 ^ objc_msgSend((id)CMGetAttachment(v65, @"MirroredVertical", 0), "BOOLValue");
        }
        else
        {
          uint64_t v67 = 0;
        }
        [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setVideoMirrored:v67];
        v68 = CMSampleBufferGetImageBuffer(a3);
        if (v68 && (CFDictionaryRef v69 = CVBufferCopyAttachments(v68, kCVAttachmentMode_ShouldPropagate)) != 0)
        {
          CFDictionaryRef v70 = v69;
          BOOL IsHDR = BWColorSpacePropertiesIsHDR(+[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:v69]);
          CFRelease(v70);
        }
        else
        {
          BOOL IsHDR = 0;
        }
        [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setHdrVideo:IsHDR];
        if (ImageBuffer) {
          [(BWVideoDataOutputAnalyticsPayload *)self->_analyticsPayload setColorSpace:BWPixelBufferColorSpace(ImageBuffer)];
        }
        self->_proresVideo = FigCapturePixelFormatIs422(MediaSubType);
        return;
      }
      self->_lastPTS = ($95D729B680665BEAEFA1D6FCA8238556)v83;
      if (!v16) {
        return;
      }
      goto LABEL_94;
    }
    v50 = v49;
    p_makerNoteKeySpec = &self->_makerNoteKeySpec;
    BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v49, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
    if (FigCapturePlatformMountsCamerasInLandscapeOrientation())
    {
      [v50 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
      if (FigCFEqual() || FigCFEqual())
      {
        if (IsExtensionDeviceType) {
          int v53 = 3;
        }
        else {
          int v53 = 4;
        }
      }
      else
      {
        int v53 = 3;
      }
    }
    else
    {
      int v53 = 1;
    }
    MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a3, v53, 0, cameraSupportsFlash, 0, 0, 0, 0, attachDetectedObjectsInfo, disableFlatDictionaryVDOMetadata, 0, 1, 1, 1, v37, 0, 0, 0, 0,
                            v48);
    if (disableFlatDictionaryVDOMetadata) {
      MakerNoteFlatDictionary = 0;
    }
    else {
      MakerNoteFlatDictionary = (const void *)FigCaptureMetadataUtilitiesCreateMakerNoteFlatDictionary(a3, (const __CFAllocator *)*MEMORY[0x1E4F1CF80], sharedMemoryPoolCFAllocator, (const void **)p_makerNoteKeySpec);
    }
    CFTypeRef v6 = v79;
    CMRemoveAllAttachments(a3);
    CMSetAttachments(a3, MetadataAttachments, 1u);
    if (MetadataAttachments) {
      CFRelease(MetadataAttachments);
    }
    if (disableFlatDictionaryVDOMetadata)
    {
      ImageBuffer = v78;
    }
    else
    {
      ImageBuffer = v78;
      if (MakerNoteFlatDictionary)
      {
        v10 = v77;
        if (*p_makerNoteKeySpec)
        {
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F55BA0], *p_makerNoteKeySpec);
          CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F55B98], MakerNoteFlatDictionary);
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F2FC20], Mutable, 1u);
          if (Mutable) {
            CFRelease(Mutable);
          }
          CFRelease(MakerNoteFlatDictionary);
        }
        goto LABEL_82;
      }
    }
    v10 = v77;
LABEL_82:
    BOOL v16 = v76;
    goto LABEL_83;
  }
}

- (uint64_t)_finishRenderingSampleBufferUsingTheRemoteCaptureStack:(int)a3 isDroppedSample:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  char v3 = a3;
  long long v23 = 0u;
  long long v22 = 0u;
  v21[0] = 6;
  v21[1] = a3 ^ 1;
  *(void *)&long long v23 = a2;
  v25[0] = *MEMORY[0x1E4F53070];
  v25[1] = @"ReactionEffectComplexity";
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v6 = FigRemoteOperationSenderEnqueueOperation(*(void **)(a1 + 176), v21);
  uint64_t v7 = v6;
  if (v6 == -16665)
  {
    -[BWRemoteQueueSinkNode _handlePeerTerminated](a1);
    return 4294950631;
  }
  else if (v6 == -16669)
  {
    if ((v3 & 1) != 0 || !*(unsigned char *)(a1 + 244))
    {
      return 4294950627;
    }
    else
    {
      uint64_t v17 = 0;
      CFStringRef v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 0;
      uint64_t v8 = *(void *)(a1 + 176);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __96__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheRemoteCaptureStack_isDroppedSample___block_invoke;
      v16[3] = &unk_1E5C2D458;
      v16[4] = &v17;
      FigRemoteOperationSenderResetWithApplier(v8, (uint64_t)v16);
      if (*((unsigned char *)v18 + 24))
      {
        CFTypeRef cf = 0;
        FormatDescription = CMSampleBufferGetFormatDescription(a2);
        CMTime v11 = *(CMTime *)(a1 + 280);
        BWSampleBufferCreateForDroppedFrame(&v11, FormatDescription, @"LateFrame", &cf);
        LODWORD(v11.value) = 3;
        memset((char *)&v11.value + 4, 0, 20);
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        CFTypeRef v12 = cf;
        FigRemoteOperationSenderEnqueueOperation(*(void **)(a1 + 176), (unsigned int *)&v11);
        if (cf) {
          CFRelease(cf);
        }
      }
      uint64_t v7 = FigRemoteOperationSenderEnqueueOperation(*(void **)(a1 + 176), v21);
      if (v7) {
        FigDebugAssert3();
      }
      _Block_object_dispose(&v17, 8);
    }
  }
  return v7;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)BWRemoteQueueSinkNode;
  [(BWNode *)&v8 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_mediaTypeIsAudio)
  {
    char v3 = -[FigCaptureFrameCounter initWithTitle:]([FigCaptureFrameCounter alloc], "initWithTitle:", [NSString stringWithFormat:@"%@ (%@)", -[BWNode name](self, "name"), -[BWSinkNode sinkID](self, "sinkID")]);
    self->_frameCounter = v3;
    [(FigCaptureFrameCounter *)v3 start];
  }
  if (self->_clientIsRunningInMediaserverd)
  {
    self->_numberOfMediaBuffersLocallyEnqueued = 0;
    self->_numberOfMediaBuffersLocallyDequeued = 0;
    if (!self->_localQueue)
    {
      if (!FigLocalQueueCreate(*MEMORY[0x1E4F1CF80], 14, &self->_localQueue))
      {
        [(BWRemoteQueueSinkNodeDelegate *)self->_delegate remoteQueueSinkNode:self localQueueBecameReady:self->_localQueue];
        return;
      }
      goto LABEL_17;
    }
  }
  else if (!self->_remoteQueueSender)
  {
    p_sharedMemoryPool = (void **)&self->_sharedMemoryPool;
    if (!self->_sharedMemoryPool)
    {
      long long v5 = *(_OWORD *)&self->_receiverAuditToken.val[4];
      v9[0] = *(_OWORD *)self->_receiverAuditToken.val;
      v9[1] = v5;
      if (!FigCaptureAuditTokenIsValid((uint64_t)v9))
      {
        [(BWRemoteQueueSinkNodeDelegate *)self->_delegate remoteQueueSinkNode:self dumpStateForReason:@"rqsn_invalidClientToken"];
        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"RemoteQueueSinkNode needs to have a valid client token before prepareForCurrentConfigurationToBecomeLive can be called" userInfo:0]);
      }
      if (self->_discardsLateSampleBuffers) {
        unsigned int v6 = 1;
      }
      else {
        unsigned int v6 = 100;
      }
      LODWORD(v9[0]) = 100;
      *(void *)((char *)v9 + 4) = v6;
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (FigSharedMemPoolCreate(*MEMORY[0x1E4F1CF80], 0x80000uLL, 0, 0, (uint64_t *)&self->_sharedMemoryPool)|| (self->_sharedMemoryPoolCFAllocator = FigSharedMemPoolAllocatorCreate(v7, *p_sharedMemoryPool), FigRemoteQueueSenderCreate(v7, self->_receiverPID, *p_sharedMemoryPool, (int *)v9, 3uLL, 14, (uint64_t *)&self->_remoteQueueSender)))
      {
LABEL_17:
        FigDebugAssert3();
        return;
      }
      [(BWRemoteQueueSinkNodeDelegate *)self->_delegate remoteQueueSinkNode:self queueBecameReady:self->_remoteQueueSender];
    }
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  BOOL mediaTypeIsVideo = self->_mediaTypeIsVideo;
  if (!*(_WORD *)&self->_mediaTypeIsVideo) {
    return;
  }
  CFTypeRef cf = 0;
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription)
  {
    CMVideoFormatDescriptionRef formatDescriptionOut = (CMVideoFormatDescriptionRef)CFRetain(cachedFormatDescription);
    BOOL mediaTypeIsVideo = self->_mediaTypeIsVideo;
    if (formatDescriptionOut)
    {
      if (!self->_mediaTypeIsVideo) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  else
  {
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  }
  if (mediaTypeIsVideo)
  {
    v9 = (void *)[a4 liveFormat];
    if (v9) {
      CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [v9 pixelFormat], objc_msgSend(v9, "width"), objc_msgSend(v9, "height"), 0, &formatDescriptionOut);
    }
  }
  else if (self->_mediaTypeIsPointCloud)
  {
    CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x70636C64u, 0, 0, &formatDescriptionOut);
  }
  if (formatDescriptionOut)
  {
    if (!self->_mediaTypeIsVideo)
    {
LABEL_5:
      if (a3)
      {
LABEL_6:
        [a3 pts];
LABEL_23:
        BWSampleBufferCreateForDroppedFrame(&v11, formatDescriptionOut, (void *)[a3 reason], &cf);
        [(BWRemoteQueueSinkNode *)self renderSampleBuffer:cf forInput:a4];
        if (cf) {
          CFRelease(cf);
        }
        if (formatDescriptionOut) {
          CFRelease(formatDescriptionOut);
        }
        return;
      }
LABEL_22:
      memset(&v11, 0, sizeof(v11));
      goto LABEL_23;
    }
LABEL_15:
    if ([a3 reason] == 0x1EFA67EA0)
    {
      uint64_t v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfISPFramesDropped;
    }
    else
    {
      uint64_t v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfISPFramesDropped;
      if ((__CFString *)[a3 reason] != @"VideoDeviceDiscontinuity"
        && (__CFString *)[a3 reason] != @"HighFrameRateAutoFocusDiscontinuity")
      {
        uint64_t v10 = &OBJC_IVAR___BWRemoteQueueSinkNode__totalNumberOfFramesDropped;
      }
    }
    ++*(Class *)((char *)&self->super.super.super.isa + *v10);
    if (a3) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
}

- (BWRemoteQueueSinkNode)initWithMediaType:(unsigned int)a3 clientAuditToken:(id *)a4 sinkID:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v21.receiver = self;
  v21.super_class = (Class)BWRemoteQueueSinkNode;
  CFAllocatorRef v7 = [(BWSinkNode *)&v21 initWithSinkID:a5];
  if (v7)
  {
    objc_super v8 = [[BWNodeInput alloc] initWithMediaType:v6 node:v7];
    v9 = (long long *)MEMORY[0x1E4F1F9F8];
    if (v6 != 1885564004)
    {
      if (v6 == 1936684398)
      {
        v7[170] = 1;
      }
      else if (v6 == 1986618469)
      {
        uint64_t v10 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v10 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess]];
        [(BWVideoFormatRequirements *)v10 setSupportedPixelFormats:&unk_1EFB04970];
        [(BWVideoFormatRequirements *)v10 setMemoryPoolUseAllowed:0];
        [(BWNodeInput *)v8 setFormatRequirements:v10];

        v7[168] = 1;
        v7[244] = 1;
        *((_DWORD *)v7 + 60) = 1;
        [*((id *)v7 + 1) setRetainedBufferCount:1];
        *(_OWORD *)(v7 + 280) = *v9;
        *((void *)v7 + 37) = *((void *)v9 + 2);
        v7[266] = 1;
        long long v11 = *(_OWORD *)&a4->var0[4];
        long long v19 = *(_OWORD *)a4->var0;
        long long v20 = v11;
        v7[265] = FigCaptureClientIsContinuityCapture(&v19) != 0;
LABEL_9:
        v7[368] = 0;
        long long v13 = *(_OWORD *)&a4->var0[4];
        long long v19 = *(_OWORD *)a4->var0;
        long long v20 = v13;
        *((_DWORD *)v7 + 76) = FigCaptureGetPIDFromAuditToken(&v19);
        long long v14 = *(_OWORD *)&a4->var0[4];
        *(_OWORD *)(v7 + 308) = *(_OWORD *)a4->var0;
        *(_OWORD *)(v7 + 324) = v14;
        long long v15 = *(_OWORD *)&a4->var0[4];
        long long v19 = *(_OWORD *)a4->var0;
        long long v20 = v15;
        v7[340] = FigCaptureClientIsRunningInMediaserverd(&v19) != 0;
        *((void *)v7 + 23) = FigSimpleMutexCreate();
        v7[208] = 0;
        v7[248] = 0;
        *((void *)v7 + 52) = objc_alloc_init(BWVideoDataOutputAnalyticsPayload);
        long long v16 = *v9;
        *(_OWORD *)(v7 + 424) = *v9;
        uint64_t v17 = *((void *)v9 + 2);
        *((void *)v7 + 55) = v17;
        *(_OWORD *)(v7 + 280) = v16;
        *((void *)v7 + 37) = v17;
        [v7 addInput:v8];

        v7[245] = 0;
        v7[341] = 1;
        v7[448] = 0;
        return (BWRemoteQueueSinkNode *)v7;
      }
      v7[244] = 0;
      goto LABEL_9;
    }
    CFTypeRef v12 = objc_alloc_init(BWPointCloudFormatRequirements);
    [(BWPointCloudFormatRequirements *)v12 setSupportedDataFormats:&unk_1EFB04988];
    [(BWPointCloudFormatRequirements *)v12 setMemoryPoolUseAllowed:0];
    [(BWNodeInput *)v8 setFormatRequirements:v12];

    v7[169] = 1;
    v7[244] = 1;
    *((_DWORD *)v7 + 60) = 1;
    [*((id *)v7 + 1) setRetainedBufferCount:1];
    *(_OWORD *)(v7 + 280) = *v9;
    *((void *)v7 + 37) = *((void *)v9 + 2);
    goto LABEL_9;
  }
  return (BWRemoteQueueSinkNode *)v7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (BWRemoteQueueSinkNodeDelegate *)a3;
}

- (void)setDiscardsLateSampleBuffers:(BOOL)a3
{
  self->_discardsLateSampleBuffers = a3;
}

- (void)setClientVideoRetainedBufferCount:(int)a3
{
  if (self->_clientVideoRetainedBufferCount != a3)
  {
    self->_clientVideoRetainedBufferCount = a3;
    -[BWNodeInput setRetainedBufferCount:](self->super.super._input, "setRetainedBufferCount:");
  }
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  stabilityMonitor = self->_stabilityMonitor;
  if (a3)
  {
    if (stabilityMonitor) {
      return;
    }
    long long v5 = objc_alloc_init(BWSceneStabilityMonitor);
  }
  else
  {
    if (!stabilityMonitor) {
      return;
    }

    long long v5 = 0;
  }
  self->_stabilityMonitor = v5;
}

- (void)setRequestedBufferAttachmentsTrie:(id)a3
{
  requestedBufferAttachmentsTrie = self->_requestedBufferAttachmentsTrie;
  self->_requestedBufferAttachmentsTrie = (FigCaptureTrie *)a3;
  if (a3) {
    CFRetain(a3);
  }
  if (requestedBufferAttachmentsTrie)
  {
    CFRelease(requestedBufferAttachmentsTrie);
  }
}

- (void)setRemoveCameraIntrinsicMatrixAttachment:(BOOL)a3
{
  self->_removeCameraIntrinsicMatrixAttachment = a3;
}

- (void)setPanoramaRequiresLTMLocking:(BOOL)a3
{
  self->_panoramaRequiresLTMLocking = a3;
}

- (void)setFrameSenderSupportEnabled:(BOOL)a3
{
  self->_frameSenderSupportEnabled = a3;
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_BOOL cameraSupportsFlash = a3;
}

- (void)setAttachPanoramaMetadata:(BOOL)a3
{
  self->_attachPanoramaMetadata = a3;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_remoteQueueSender)
  {
    BOOL v9 = 1;
    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    BOOL v9 = self->_localQueue != 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (self->_remoteQueueSender)
        {
          unsigned int v13 = 5;
          uint64_t v15 = 0;
          int64_t v14 = 0;
          int v16 = 0;
          uint64_t v19 = 0;
          int64_t v17 = a3;
          uint64_t v18 = [a4 formatDescription];
          if (FigRemoteOperationSenderEnqueueOperation(self->_remoteQueueSender, &v13) == -16665) {
            -[BWRemoteQueueSinkNode _handlePeerTerminated]((uint64_t)self);
          }
        }
        else if (self->_localQueue)
        {
          uint64_t v10 = [a4 formatDescription];
          localQueue = self->_localQueue;
          unsigned int v13 = 5;
          int64_t v14 = a3;
          uint64_t v15 = v10;
          FigLocalQueueEnqueue((uint64_t)localQueue, &v13, 0);
        }
      }
    }
  }
LABEL_13:
  v12.receiver = self;
  v12.super_class = (Class)BWRemoteQueueSinkNode;
  [(BWSinkNode *)&v12 configurationWithID:a3 updatedFormat:a4 didBecomeLiveForInput:a5];
}

- (void)updateClientAuditToken:(id *)a3
{
  long long v5 = *(_OWORD *)&a3->var0[4];
  long long v9 = *(_OWORD *)a3->var0;
  long long v10 = v5;
  self->_unsigned int receiverPID = FigCaptureGetPIDFromAuditToken(&v9);
  long long v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_receiverAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_receiverAuditToken.val[4] = v6;
  long long v7 = *(_OWORD *)&a3->var0[4];
  long long v9 = *(_OWORD *)a3->var0;
  long long v10 = v7;
  self->_clientIsRunningInMediaserverd = FigCaptureClientIsRunningInMediaserverd(&v9) != 0;
  long long v8 = *(_OWORD *)&a3->var0[4];
  long long v9 = *(_OWORD *)a3->var0;
  long long v10 = v8;
  self->_char attachDetectedObjectsInfo = FigCaptureClientIsContinuityCapture(&v9) != 0;
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
  remoteQueueSender = self->_remoteQueueSender;
  if (remoteQueueSender) {
    CFRelease(remoteQueueSender);
  }
  sharedMemoryPool = self->_sharedMemoryPool;
  if (sharedMemoryPool) {
    CFRelease(sharedMemoryPool);
  }
  sharedMemoryPoolCFAllocator = self->_sharedMemoryPoolCFAllocator;
  if (sharedMemoryPoolCFAllocator) {
    CFRelease(sharedMemoryPoolCFAllocator);
  }
  localQueue = self->_localQueue;
  if (localQueue) {
    CFRelease(localQueue);
  }
  makerNoteKeySpec = self->_makerNoteKeySpec;
  if (makerNoteKeySpec) {
    CFRelease(makerNoteKeySpec);
  }
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription) {
    CFRelease(cachedFormatDescription);
  }
  FigSimpleMutexDestroy();

  -[BWRemoteQueueSinkNode _sendAndClearCoreAnalyticsData]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)BWRemoteQueueSinkNode;
  [(BWSinkNode *)&v9 dealloc];
}

- (uint64_t)_sendAndClearCoreAnalyticsData
{
  if (result)
  {
    uint64_t v1 = result;
    CMTime time1 = *(CMTime *)(result + 424);
    CMTime time2 = *(CMTime *)(result + 280);
    result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0 || *(void *)(v1 + 392))
    {
      CMTime time1 = *(CMTime *)(v1 + 280);
      CMTime time2 = *(CMTime *)(v1 + 424);
      CMTimeSubtract(&time, &time1, &time2);
      double Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(*(id *)(v1 + 416), "setDuration:");
      [*(id *)(v1 + 416) setNumberOfFrames:*(void *)(v1 + 384)];
      [*(id *)(v1 + 416) setNumberOfFramesDropped:*(void *)(v1 + 392)];
      [*(id *)(v1 + 416) setNumberOfISPFramesDropped:*(void *)(v1 + 400)];
      double v3 = (double)(uint64_t)(*(void *)(v1 + 400) + *(void *)(v1 + 384) + *(void *)(v1 + 392)) / Seconds;
      *(float *)&double v3 = v3;
      [*(id *)(v1 + 416) setNominalFramerate:v3];
      [*(id *)(v1 + 416) setProresVideo:0];
      result = [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:*(void *)(v1 + 416)];
      if (*(unsigned char *)(v1 + 448))
      {
        [*(id *)(v1 + 416) setProresVideo:1];
        result = [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:*(void *)(v1 + 416)];
      }
      uint64_t v4 = MEMORY[0x1E4F1F9F8];
      long long v5 = *MEMORY[0x1E4F1F9F8];
      *(_OWORD *)(v1 + 424) = *MEMORY[0x1E4F1F9F8];
      uint64_t v6 = *(void *)(v4 + 16);
      *(void *)(v1 + 440) = v6;
      *(_OWORD *)(v1 + 280) = v5;
      *(void *)(v1 + 296) = v6;
    }
  }
  return result;
}

- (void)registerSurfacesFromSourcePool:(id)a3
{
  if (!self->_clientIsRunningInMediaserverd)
  {
    pthread_mutex_lock((pthread_mutex_t *)self->_peerTerminationMutex);
    if (self->_remoteQueueSender)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __56__BWRemoteQueueSinkNode_registerSurfacesFromSourcePool___block_invoke;
      v5[3] = &unk_1E5C2BEC0;
      v5[4] = self;
      [a3 enumerateSurfacesUsingBlock:v5];
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_peerTerminationMutex);
  }
}

uint64_t __56__BWRemoteQueueSinkNode_registerSurfacesFromSourcePool___block_invoke(uint64_t a1, __IOSurface *a2)
{
  return FigRemoteQueueSenderRegisterIOSurface(*(void *)(*(void *)(a1 + 32) + 176), a2);
}

- (int)clientVideoRetainedBufferCount
{
  return self->_clientVideoRetainedBufferCount;
}

- (BOOL)discardsLateSampleBuffers
{
  return self->_discardsLateSampleBuffers;
}

- (BOOL)attachPanoramaMetadata
{
  return self->_attachPanoramaMetadata;
}

- (BOOL)panoramaRequiresLTMLocking
{
  return self->_panoramaRequiresLTMLocking;
}

- (BOOL)sceneStabilityMetadataEnabled
{
  return self->_stabilityMonitor != 0;
}

- (id)requestedBufferAttachmentsTrie
{
  return self->_requestedBufferAttachmentsTrie;
}

- (BOOL)frameSenderSupportEnabled
{
  return self->_frameSenderSupportEnabled;
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- (BOOL)removeCameraIntrinsicMatrixAttachment
{
  return self->_removeCameraIntrinsicMatrixAttachment;
}

- (id)nodeSubType
{
  return @"RemoteQueue";
}

- (void)_handlePeerTerminated
{
  if (a1)
  {
    *(unsigned char *)(a1 + 208) = 1;
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 184));
    v2 = *(const void **)(a1 + 176);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 176) = 0;
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 184));
    double v3 = *(const void **)(a1 + 192);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 192) = 0;
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (!self->_mediaTypeIsAudio)
  {
    [(FigCaptureFrameCounter *)self->_frameCounter stop];

    self->_frameCounter = 0;
  }

  self->_frameSender = 0;
  -[BWRemoteQueueSinkNode _sendAndClearCoreAnalyticsData]((uint64_t)self);
  cachedFormatDescription = self->_cachedFormatDescription;
  if (cachedFormatDescription)
  {
    CFRelease(cachedFormatDescription);
    self->_cachedFormatDescription = 0;
  }
  FigRemoteQueueSenderReleaseIOSurfaces((uint64_t)self->_remoteQueueSender, 0);
  v6.receiver = self;
  v6.super_class = (Class)BWRemoteQueueSinkNode;
  [(BWSinkNode *)&v6 didReachEndOfDataForInput:a3];
}

- (uint64_t)_finishRenderingSampleBufferUsingTheLocalQueue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(result + 244) && (CMSampleBufferGetImageBuffer(sbuf) || CMSampleBufferGetDataBuffer(sbuf)))
    {
      ++*(_DWORD *)(v3 + 224);
      FigMemoryBarrier();
      uint64_t v4 = *(void *)(v3 + 216);
      uint64_t v8 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      _OWORD v9[2] = __72__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheLocalQueue___block_invoke;
      v9[3] = &unk_1E5C2D480;
      v9[4] = v3;
      int v6 = 3;
      CMSampleBufferRef v7 = sbuf;
      long long v5 = v9;
    }
    else
    {
      uint64_t v4 = *(void *)(v3 + 216);
      int v6 = 3;
      CMSampleBufferRef v7 = sbuf;
      uint64_t v8 = 0;
      long long v5 = 0;
    }
    return FigLocalQueueEnqueue(v4, &v6, (uint64_t)v5);
  }
  return result;
}

uint64_t __96__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheRemoteCaptureStack_isDroppedSample___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Type = FigRemoteOperationGetType((_DWORD **)a4);
  if (Type == 6) {
    goto LABEL_4;
  }
  if (Type != 5)
  {
    if (Type != 3) {
      return 0;
    }
LABEL_4:
    uint64_t result = 1;
    if (*(_DWORD *)(a4 + 16) != 1) {
      return result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return 1;
}

void __72__BWRemoteQueueSinkNode__finishRenderingSampleBufferUsingTheLocalQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ++*(_DWORD *)(*(void *)(a1 + 32) + 228);
  FigMemoryBarrier();
  if (*(_DWORD *)(*(void *)(a1 + 32) + 228) == *(_DWORD *)(*(void *)(a1 + 32) + 224))
  {
    int v6 = *(void (**)(uint64_t, _OWORD *))(a3 + 16);
    v9[0] = *(_OWORD *)a2;
    LODWORD(v9[1]) = *(_DWORD *)(a2 + 16);
    v6(a3, v9);
  }
  else
  {
    CMAttachmentBearerRef v11 = 0;
    CMSampleBufferGetPresentationTimeStamp(&v10, *(CMSampleBufferRef *)(a2 + 4));
    FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a2 + 4));
    BWSampleBufferCreateForDroppedFrame(&v10, FormatDescription, @"LateFrame", &v11);
    uint64_t v8 = *(void (**)(uint64_t, _OWORD *))(a3 + 16);
    LODWORD(v9[0]) = 3;
    *(_OWORD *)((char *)v9 + 4) = (unint64_t)v11;
    v8(a3, v9);
    if (v11) {
      CFRelease(v11);
    }
  }
}

- (BWRemoteQueueSinkNodeDelegate)delegate
{
  return self->_delegate;
}

@end