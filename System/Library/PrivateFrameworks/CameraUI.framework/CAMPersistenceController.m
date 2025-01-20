@interface CAMPersistenceController
+ (id)_pathForIncomingDirectory;
+ (id)clientVideoMetadataForLocation:(id)a3 withCreationDate:(id)a4;
+ (id)clientVideoMetadataForRequest:(id)a3 withCreationDate:(id)a4 isEV0ForHDR:(BOOL)a5 livePhotoIdentifierOverride:(id)a6 slomoPlayback:(BOOL)a7;
+ (id)delimiterForIncomingAssetFilenames;
+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5;
+ (id)uniquePathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5 usingIncomingDirectory:(BOOL)a6;
+ (id)videoMetadataDateFormatter;
- (BOOL)_writeDataToURL:(id)a3 withData:(id)a4 duringBurst:(BOOL)a5 error:(id *)a6;
- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7 error:(id *)a8;
- (BOOL)resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest;
- (BOOL)writePrivateMetadataFileToURL:(id)a3 withPrivateClientMetadata:(id)a4 sharedLibraryMode:(int64_t)a5 contactIDsInProximity:(id)a6 sharedLibraryDiagnostics:(id)a7;
- (CAMBurstController)_burstController;
- (CAMIrisVideoController)_irisVideoController;
- (CAMLocationController)_locationController;
- (CAMPersistenceController)init;
- (CAMPersistenceController)initWithLocationController:(id)a3 burstController:(id)a4 protectionController:(id)a5 powerController:(id)a6 irisVideoController:(id)a7;
- (CAMPersistenceResultDelegate)resultDelegate;
- (CAMPowerController)_powerController;
- (CAMProtectionController)_protectionController;
- (CAMThumbnailGenerator)_localPersistenceThumbnailGenerator;
- (CAMThumbnailGenerator)_remotePersistenceThumbnailGenerator;
- (CGAffineTransform)_affineTransformForRotationDegrees:(SEL)a3 mirrored:(int)a4;
- (NSMapTable)_coordinationQueueGroupsByIdentifier;
- (NSMutableArray)_pendingLocalPersistenceWrappers;
- (NSMutableArray)_pendingRemotePersistenceWrappers;
- (NSMutableDictionary)_coordinationQueue_stillImagePersistenceCoordinators;
- (NSMutableDictionary)_coordinationQueue_videoPersistenceCoordinators;
- (OS_dispatch_queue)_coordinationQueue;
- (OS_dispatch_queue)_localPersistenceQueue;
- (OS_dispatch_queue)_remotePersistenceQueue;
- (OS_dispatch_queue)_resultDelegateIsolationQueue;
- (__CFWriteStream)_createOpenWriteStreamWithURL:(id)a3 forBurst:(BOOL)a4 error:(id *)a5;
- (id)_adjustmentsDataForCinematicVideoRequest:(id)a3 result:(id)a4;
- (id)_adjustmentsDataForRequest:(id)a3 captureDimensions:(id)a4 portraitMetadata:(id)a5;
- (id)_adjustmentsDataForSloMoVideoRequest:(id)a3;
- (id)_adjustmentsDataForVideoRequest:(id)a3;
- (id)_coordinationGroupForIdentifier:(id)a3;
- (id)_createMetadataForPhysicallyOrientedImage:(id)a3;
- (id)_ensureCoordinationGroupForIdentifier:(id)a3;
- (id)_extensionForUniformType:(id)a3;
- (id)_jobDictionaryForStillImageLocalResult:(id)a3 filteredLocalResult:(id)a4 fromRequest:(id)a5 loggingIdentifier:(id)a6;
- (id)_jobDictionaryForTimelapsePlaceholderResult:(id)a3;
- (id)_jobDictionaryForVideoLocalResult:(id)a3 fromRequest:(id)a4 loggingIdentifier:(id)a5;
- (id)_persistStillImageCaptureSurfaceResult:(id)a3 withRequest:(id)a4;
- (id)_persistVideoCaptureResult:(id)a3 withRequest:(id)a4;
- (id)_persistenceErrorForWriteStream:(__CFWriteStream *)a3 url:(id)a4 code:(int64_t)a5;
- (id)_physicallyRotatedJPEGDataFromCapturePhoto:(id)a3;
- (id)_stillPersistenceUUIDForRequest:(id)a3 withVideoResult:(id)a4;
- (id)_uniformTypeForStillImageRequest:(id)a3 result:(id)a4;
- (id)_videoPersistenceUUIDForRequest:(id)a3 withResult:(id)a4;
- (id)_xmpEncodedDiagnosticDataFromDictionary:(id)a3;
- (unsigned)_stillImageLocalPowerAssertionReasonForCoordinationInfo:(id)a3;
- (unsigned)_videoLocalPowerAssertionReasonForCoordinationInfo:(id)a3;
- (unsigned)_videoRemotePowerAssertionReasonForCoordinationInfo:(id)a3;
- (void)_coordinateRemotePersistenceForStillImageLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5;
- (void)_coordinateRemotePersistenceForVideoLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5;
- (void)_dispatchRemotePersistenceForLocalPersistenceResult:(id)a3 filteredLocalResult:(id)a4 request:(id)a5 powerAssertionReason:(unsigned int)a6 loggingIdentifier:(id)a7;
- (void)_dispatchRemotePersistenceForLocalVideoPersistenceResult:(id)a3 request:(id)a4 powerAssertionReason:(unsigned int)a5 loggingIdentifier:(id)a6;
- (void)_handleCompletedStillImageJobForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 completionHandler:(id)a6 error:(id)a7;
- (void)_handleCompletedVideoJobForRequest:(id)a3 withReply:(id)a4 completionHandler:(id)a5 error:(id)a6;
- (void)_handleStillImagePersistenceForRequest:(id)a3 withResult:(id)a4;
- (void)_handleVideoPersistenceForRequest:(id)a3 withResult:(id)a4;
- (void)_locallyPersistStillImageResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)_locallyPersistVideoCaptureResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)_mainThread_handleApplicationDidEnterBackground:(id)a3;
- (void)_notifyDelegateOfCompletedStillImageLocalPersistenceForRequest:(id)a3 withResult:(id)a4;
- (void)_notifyDelegateOfCompletedStillImageRemotePersistenceForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 error:(id)a6;
- (void)_notifyDelegateOfCompletedVideoLocalPersistenceForRequest:(id)a3 withResult:(id)a4;
- (void)_notifyDelegateOfCompletedVideoRemotePersistenceForRequest:(id)a3 withReply:(id)a4 error:(id)a5;
- (void)_remotelyPersistStillImageJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 completionHandler:(id)a6;
- (void)_remotelyPersistVideoJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 withSendHandler:(id)a6 completionHandler:(id)a7;
- (void)_removeCoordinationGroupForIdentifier:(id)a3;
- (void)dealloc;
- (void)emptyLocalPersistenceStorageWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)performDeferredRemotePersistenceWithCompletionHandler:(id)a3;
- (void)persistBurstWithIdentifier:(id)a3 result:(id)a4 completionHandler:(id)a5;
- (void)persistPlaceholderTimelapseVideoWithResult:(id)a3 completionHandler:(id)a4;
- (void)setResultDelegate:(id)a3;
- (void)stillImagePersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 filteredLocalResult:(id)a5 request:(id)a6 powerAssertionReason:(unsigned int)a7;
- (void)stillImagePersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5;
- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4;
- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4;
- (void)videoPersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 captureRequest:(id)a5 powerAssertionReason:(unsigned int)a6;
- (void)videoPersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5;
@end

@implementation CAMPersistenceController

- (void)_handleStillImagePersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 persistenceOptions];
  if (v8)
  {
    uint64_t v9 = v8;
    CAMSignpostWithIDAndArgs(49, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    v10 = [v7 error];
    if (v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CAMPersistenceController _handleStillImagePersistenceForRequest:withResult:]();
      }

      if ([v6 conformsToProtocol:&unk_26BE66418])
      {
        v12 = [[CAMStillImageLocalPersistenceResult alloc] initWithCaptureResult:v7 atURL:0 linkedURL:0 localAdjustmentsURL:0 diagnosticsPath:0 filteredPreviewPath:0 withUUID:0 creationDate:0 uniformTypeIdentifier:0 orientation:0 metadata:0 adjustmentsData:0 localPrivateMetadataFileURL:0 error:v10];
        id v13 = v6;
        v14 = [v13 burstIdentifier];

        if (v14)
        {
          v15 = [(CAMPersistenceController *)self _burstController];
          [v15 processPersistedRequest:v13 withResult:v12];
        }
      }
      if (v9 != 2) {
        goto LABEL_19;
      }
      v16 = [v7 coordinationInfo];
      [(CAMPersistenceController *)self _coordinateRemotePersistenceForStillImageLocalResult:0 coordinationInfo:v16 request:v6];
    }
    else
    {
      v16 = [v7 coordinationInfo];
      uint64_t v17 = [(CAMPersistenceController *)self _stillImageLocalPowerAssertionReasonForCoordinationInfo:v16];
      v18 = [(CAMPersistenceController *)self _powerController];
      uint64_t v19 = [v6 assertionIdentifier];
      [v18 addAssertionForIndentifier:v19 withReason:v17];
      if ([(CAMPersistenceController *)self resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest])
      {
        v20 = [v6 persistenceUUID];
        v21 = [(CAMPersistenceController *)self _ensureCoordinationGroupForIdentifier:v20];

        if (v21) {
          dispatch_group_enter(v21);
        }
      }
      else
      {
        v21 = 0;
      }
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke;
      aBlock[3] = &unk_263FA3B20;
      int v33 = v19;
      int v34 = v17;
      id v31 = v18;
      v32 = v21;
      v22 = v21;
      id v23 = v18;
      v24 = _Block_copy(aBlock);
      if ([v6 shouldProtectPersistence])
      {
        v25 = [(CAMPersistenceController *)self _protectionController];
        [v25 startProtectingPersistenceForRequest:v6];
      }
      v26 = [(CAMPersistenceController *)self _localPersistenceQueue];
      id v28 = v6;
      id v29 = v7;
      id v27 = v24;
      pl_dispatch_async();
    }
LABEL_19:
  }
}

- (unsigned)_stillImageLocalPowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isHDR];
  int v5 = [v3 isFiltered];

  if (v4) {
    unsigned int v6 = 64;
  }
  else {
    unsigned int v6 = 32;
  }
  if (v4) {
    unsigned int v7 = 256;
  }
  else {
    unsigned int v7 = 128;
  }
  if (v5) {
    return v7;
  }
  else {
    return v6;
  }
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (BOOL)resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest
{
  v2 = self;
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(CAMPersistenceController *)self _resultDelegateIsolationQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __92__CAMPersistenceController_resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest__block_invoke;
  v5[3] = &unk_263FA35E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)_resultDelegateIsolationQueue
{
  return self->__resultDelegateIsolationQueue;
}

uint64_t __92__CAMPersistenceController_resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (OS_dispatch_queue)_localPersistenceQueue
{
  return self->__localPersistenceQueue;
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAMPersistenceController *)self _irisVideoController];
  if ([v8 shouldHandleLivePhotoRenderingForRequest:v6]) {
    [v8 stillImageRequestDidCompleteCapture:v6 error:v7];
  }
  if ([(CAMPersistenceController *)self resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest])
  {
    char v9 = [v6 persistenceUUID];
    v10 = [(CAMPersistenceController *)self _coordinationGroupForIdentifier:v9];
    v11 = [(CAMPersistenceController *)self resultDelegate];
    if (v10)
    {
      v12 = [(CAMPersistenceController *)self _localPersistenceQueue];
      id v13 = v11;
      id v14 = v6;
      pl_dispatch_group_notify();

      [(CAMPersistenceController *)self _removeCoordinationGroupForIdentifier:v9];
    }
    else if ([v6 persistenceOptions])
    {
      [v11 persistenceController:self didCompleteAllLocalPersistenceForRequest:v6];
    }
  }
}

- (CAMIrisVideoController)_irisVideoController
{
  return self->__irisVideoController;
}

- (void)_locallyPersistStillImageResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 persistenceOptions];
  v12 = (void *)MEMORY[0x21050BCA0]();
  id v13 = [(CAMPersistenceController *)self _persistStillImageCaptureSurfaceResult:v8 withRequest:v9];
  id v14 = [(CAMPersistenceController *)self resultDelegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 persistenceController:self didGenerateStillImageLocalPersistenceResult:v13 forCaptureResult:v8 fromRequest:v9];
  }
  CAMSignpostWithIDAndArgs(50, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v11 == 2)
  {
    v15 = [v8 coordinationInfo];
    [(CAMPersistenceController *)self _coordinateRemotePersistenceForStillImageLocalResult:v13 coordinationInfo:v15 request:v9];
  }
  uint64_t v19 = v9;
  v20 = v10;
  id v16 = v10;
  id v17 = v13;
  id v18 = v9;
  pl_dispatch_async();
}

- (id)_persistStillImageCaptureSurfaceResult:(id)a3 withRequest:(id)a4
{
  uint64_t v190 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 coordinationInfo];
  v148 = [v6 deferredPhotoIdentifier];

  int v9 = [v6 representsDeferredFilteredProxy];
  uint64_t v158 = [v6 stillImageFilteredPreviewSurface];
  uint64_t v10 = [v6 metadata];
  uint64_t v165 = [v6 persistenceUUID];
  v176 = v7;
  uint64_t v11 = [(CAMPersistenceController *)self _uniformTypeForStillImageRequest:v7 result:v6];
  if (v8) {
    int v172 = [v8 isFilteredImageForFilteredPair];
  }
  else {
    int v172 = 0;
  }
  v171 = (void *)v10;
  v168 = [v7 localDestinationURL];
  v12 = [v168 path];
  id v13 = v12;
  if (v12) {
    BOOL v14 = [v12 length] != 0;
  }
  else {
    BOOL v14 = 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  int64_t v151 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v6, [v7 captureDevice], objc_msgSend(v7, "captureOrientation"));
  v170 = [v6 captureDate];
  v174 = self;
  v155 = [(CAMPersistenceController *)self _localPersistenceThumbnailGenerator];
  uint64_t v16 = [v6 stillImageUnfilteredPreviewSurface];
  id v17 = [v6 capturePhoto];
  v167 = v17;
  if (!v17)
  {
    if (![v7 photoEncodingBehavior])
    {
      int v33 = (void *)[v171 mutableCopy];
      +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:v33];
      v163 = (void *)[v33 copy];
      v157 = v13;
      int v34 = v11;
      v35 = v8;
      uint64_t v36 = [v6 stillImageFullsizeSurface];
      uint64_t v37 = [v6 stillImageFullsizeSurfaceSize];
      id v38 = objc_alloc(MEMORY[0x263F5DB60]);
      uint64_t v39 = v36;
      id v8 = v35;
      uint64_t v11 = v34;
      id v13 = v157;
      uint64_t v40 = v37;
      id v17 = 0;
      v166 = (void *)[v38 initWithIOSurface:v39 length:v40];
      v162 = (void *)[v155 newJPEGDataOfFormat:3039 inOrientation:0 usingSurface:v16 withMetadata:v171];

      goto LABEL_16;
    }
LABEL_15:
    v162 = 0;
    v163 = 0;
    v166 = 0;
    goto LABEL_16;
  }
  if (!v172) {
    goto LABEL_15;
  }
  id v18 = (void *)*MEMORY[0x263F1DB40];
  if (([v11 conformsToType:*MEMORY[0x263F1DB40]] & 1) == 0 && v14)
  {
    uint64_t v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.9();
    }

    goto LABEL_15;
  }
  v166 = [(CAMPersistenceController *)v174 _physicallyRotatedJPEGDataFromCapturePhoto:v17];
  if (v166)
  {
    v163 = [(CAMPersistenceController *)v174 _createMetadataForPhysicallyOrientedImage:v171];
    id v32 = v18;

    v162 = (void *)[v155 newJPEGDataOfFormat:3039 inOrientation:v151 usingSurface:v16 withMetadata:v171];
    uint64_t v11 = v32;
  }
  else
  {
    v162 = 0;
    v163 = 0;
    v166 = 0;
  }
LABEL_16:
  v161 = v8;
  if (v14)
  {
    v156 = v13;
    v20 = [v13 stringByDeletingLastPathComponent];
    v21 = [MEMORY[0x263F08850] defaultManager];
    char v22 = [v21 fileExistsAtPath:v20];

    if (v22)
    {
      id v23 = v168;
      goto LABEL_34;
    }
    id v28 = [MEMORY[0x263F08850] defaultManager];
    id v183 = 0;
    char v29 = [v28 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v183];
    id v30 = v183;

    id v23 = v168;
    if ((v29 & 1) == 0)
    {
      id v31 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.8();
      }
    }
  }
  else
  {
    uint64_t v24 = [v7 shouldPersistToIncomingDirectory];
    v20 = [(CAMPersistenceController *)v174 _extensionForUniformType:v11];
    if (v172)
    {
      v25 = v13;
      v26 = v168;
      if (v9)
      {
        id v27 = (id)*MEMORY[0x263F5DC00];
      }
      else
      {
        id v27 = [(id)*MEMORY[0x263F5DBF8] stringByAppendingPathExtension:v20];
      }
      id v41 = v27;

      v20 = v41;
      id v13 = v25;
    }
    else
    {
      v26 = v168;
    }
    uint64_t v42 = +[CAMPersistenceController uniquePathForAssetWithUUID:v165 captureTime:v20 extension:v24 usingIncomingDirectory:Current];

    id v23 = [NSURL fileURLWithPath:v42];
    id v30 = v26;
    v156 = (void *)v42;
  }

  id v17 = v167;
LABEL_34:

  v43 = [v23 path];

  if (!v43)
  {
    v44 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.7();
    }
  }
  if ([v7 conformsToProtocol:&unk_26BE663A8])
  {
    uint64_t v45 = [v7 burstIdentifier];
  }
  else
  {
    uint64_t v45 = 0;
  }
  v164 = v11;
  v154 = (void *)v45;
  v152 = v6;
  if (v166)
  {
    v182[1] = 0;
    BOOL v46 = -[CAMPersistenceController _writeJPEGToURL:withData:thumbnail:properties:duringBurst:error:](v174, "_writeJPEGToURL:withData:thumbnail:properties:duringBurst:error:", v23);
    id v153 = 0;
    if (v46) {
      goto LABEL_43;
    }
LABEL_52:
    v59 = os_log_create("com.apple.camera", "Camera");
    v60 = v153;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.6();
    }

    v61 = [MEMORY[0x263F08850] defaultManager];
    v62 = [v23 path];
    v159 = v61;
    if ([v61 fileExistsAtPath:v62])
    {
      id v177 = 0;
      char v63 = [v61 removeItemAtURL:v23 error:&v177];
      id v64 = v177;

      if (v63)
      {
        v65 = v23;
        v66 = v171;
LABEL_61:
        v67 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
        [v67 setObject:v176 forKeyedSubscript:@"request"];
        [v67 setObject:v6 forKeyedSubscript:@"result"];
        [v67 setObject:v153 forKeyedSubscript:*MEMORY[0x263F08608]];
        [MEMORY[0x263F087E8] errorWithDomain:@"CAMPersistenceControllerLocalPersistenceErrorDomain" code:-22500 userInfo:v67];
        v69 = id v68 = v6;
        v173 = [[CAMStillImageLocalPersistenceResult alloc] initWithCaptureResult:v68 atURL:0 linkedURL:0 localAdjustmentsURL:0 diagnosticsPath:0 filteredPreviewPath:0 withUUID:0 creationDate:0 uniformTypeIdentifier:0 orientation:0 metadata:0 adjustmentsData:0 localPrivateMetadataFileURL:0 error:v69];
        v175 = 0;
        v70 = v156;
        v71 = v159;
        v72 = v161;
        v73 = (void *)v165;
        goto LABEL_140;
      }
      v62 = os_log_create("com.apple.camera", "Camera");
      v65 = v23;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.5();
      }
    }
    else
    {
      v65 = v23;
      id v64 = 0;
    }
    v66 = v171;

    goto LABEL_61;
  }
  if (v17)
  {
    uint64_t v54 = [v17 fileDataRepresentation];
  }
  else
  {
    uint64_t v55 = [v6 stillImageFullsizeSurface];
    uint64_t v56 = [v6 stillImageFullsizeSurfaceSize];
    uint64_t v54 = [objc_alloc(MEMORY[0x263F5DB60]) initWithIOSurface:v55 length:v56];
  }
  v57 = (void *)v54;
  v182[0] = 0;
  BOOL v58 = [(CAMPersistenceController *)v174 _writeDataToURL:v23 withData:v54 duringBurst:v45 != 0 error:v182];
  id v153 = v182[0];

  if (!v58) {
    goto LABEL_52;
  }
LABEL_43:
  v47 = 0;
  if (v158 && !v45)
  {
    v48 = [v23 URLByDeletingPathExtension];
    v49 = [v48 URLByAppendingPathExtension:*MEMORY[0x263F5DC00]];
    v47 = [v49 path];

    v50 = [(CAMPersistenceController *)v174 _localPersistenceThumbnailGenerator];
    v51 = (void *)[v50 newJPEGDataInOrientation:v151 usingSurface:v158 withMetadata:v171];
    if ([v51 length])
    {
      CGImageWriteEXIFJPEGToPath();
      v52 = [MEMORY[0x263F08850] defaultManager];
      char v53 = [v52 fileExistsAtPath:v47];

      if (v53) {
        goto LABEL_69;
      }
      v74 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v185 = v47;
        v75 = "Failed to write JPEG data for preview surface for %{public}@";
        goto LABEL_66;
      }
    }
    else
    {
      v74 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v185 = v47;
        v75 = "Failed to create JPEG data for preview surface for %{public}@";
LABEL_66:
        _os_log_impl(&dword_2099F8000, v74, OS_LOG_TYPE_DEFAULT, v75, buf, 0xCu);
      }
    }

    v47 = 0;
LABEL_69:

    id v17 = v167;
  }
  if ([v161 isUnfilteredImageForFilteredPair])
  {
    uint64_t v160 = 0;
  }
  else
  {
    uint64_t v76 = [v6 predictedFinalAssetPhotoDimensions];
    v77 = [v17 portraitMetadata];
    uint64_t v160 = [(CAMPersistenceController *)v174 _adjustmentsDataForRequest:v176 captureDimensions:v76 portraitMetadata:v77];
  }
  v78 = v170;
  int v79 = [v6 shouldPersistAdjustmentSidecar];
  v80 = [MEMORY[0x263F5DB50] filesystemPersistenceBatchItemForFileAtURL:v23];
  if (v80)
  {
    v81 = [MEMORY[0x263F086E0] mainBundle];
    v82 = [v81 bundleIdentifier];

    [v80 setUUIDString:v82 forKey:*MEMORY[0x263F5DBB0]];
    if (v45) {
      [v80 setUUIDString:v45 forKey:*MEMORY[0x263F5DBA8]];
    }
    [v80 setUInt16:1 forKey:*MEMORY[0x263F5DBC8]];
    if (v160) {
      char v83 = v79;
    }
    else {
      char v83 = 1;
    }
    if ((v83 & 1) == 0) {
      [v80 setData:v160 forKey:*MEMORY[0x263F5DBB8]];
    }
    if (v47) {
      [v80 setString:v47 forKey:*MEMORY[0x263F5DBC0]];
    }
    uint64_t v84 = [v6 semanticEnhancement];
    if (v84) {
      [v80 setInt32:v84 forKey:*MEMORY[0x263F5DBD0]];
    }
    [v80 persist];

    v78 = v170;
  }
  int v141 = v79;
  id v85 = v6;
  [v23 setResourceValue:v78 forKey:*MEMORY[0x263EFF610] error:0];
  v147 = [v171 objectForKey:@"{Diagnostic}"];
  v144 = [v171 objectForKey:*MEMORY[0x263F20830]];
  uint64_t v86 = [v144 objectForKey:*MEMORY[0x263F2EBC0]];
  v87 = 0;
  v150 = (void *)v86;
  if ((v172 & 1) == 0)
  {
    v87 = 0;
    if ([v176 shouldPersistDiagnosticsToSidecar])
    {
      if (!v148)
      {
        v88 = [(CAMPersistenceController *)v174 _xmpEncodedDiagnosticDataFromDictionary:v147];
        if ([v88 length])
        {
          v89 = [v23 URLByDeletingPathExtension];
          uint64_t v90 = [v89 URLByAppendingPathExtension:@"DBG"];

          id v181 = 0;
          v87 = (void *)v90;
          LOBYTE(v90) = [v88 writeToURL:v90 options:0 error:&v181];
          id v91 = v181;
          if ((v90 & 1) == 0)
          {
            v92 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
              -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:].cold.4();
            }

            v87 = 0;
          }

          uint64_t v86 = (uint64_t)v150;
        }
        else
        {
          v87 = 0;
        }
      }
    }
  }
  v149 = v87;
  v93 = v85;
  v145 = v80;
  if (v86)
  {
    v94 = [v23 URLByDeletingPathExtension];
    v95 = [v94 URLByAppendingPathExtension:@"tvis"];

    v96 = [MEMORY[0x263F08AC0] dataWithPropertyList:v150 format:200 options:0 error:0];
    if ([v96 length])
    {
      id v180 = 0;
      char v97 = [v96 writeToURL:v95 options:0 error:&v180];
      id v98 = v180;
      if ((v97 & 1) == 0)
      {
        v99 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
          -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:]();
        }

        v95 = 0;
      }
    }
  }
  v146 = v47;
  uint64_t v100 = [v17 privateClientMetadata];
  if (v100) {
    int v101 = v172;
  }
  else {
    int v101 = 1;
  }
  v102 = [v23 URLByDeletingPathExtension];
  uint64_t v103 = [v102 URLByAppendingPathExtension:@"MDATA"];

  BOOL v104 = v101 == 0;
  v105 = (void *)v103;
  v143 = (void *)v100;
  if (v104) {
    uint64_t v106 = v100;
  }
  else {
    uint64_t v106 = 0;
  }
  uint64_t v107 = [v176 sharedLibraryMode];
  v108 = [v176 contactIDsInProximity];
  v109 = [v176 sharedLibraryDiagnostics];
  BOOL v110 = [(CAMPersistenceController *)v174 writePrivateMetadataFileToURL:v105 withPrivateClientMetadata:v106 sharedLibraryMode:v107 contactIDsInProximity:v108 sharedLibraryDiagnostics:v109];

  if (!v110)
  {

    v105 = 0;
  }
  unint64_t v111 = 0x263F08000uLL;
  v140 = v105;
  uint64_t v112 = [v93 adjustmentFilters];
  if (v112) {
    int v113 = v141;
  }
  else {
    int v113 = 0;
  }
  if ((v113 & v172) == 1)
  {
    v114 = [v17 portraitMetadata];
    id v179 = 0;
    v115 = [MEMORY[0x263F5DEE8] serializedDictionaryForFilters:v112 portraitMetadata:v114 error:&v179];
    id v116 = v179;
    if (v115)
    {
      id v117 = v23;
      v118 = 0;
      do
      {
        v119 = v118;
        v120 = v117;
        v118 = [v117 pathExtension];

        id v117 = [v117 URLByDeletingPathExtension];
      }
      while ([v118 length]);
      v121 = [v117 URLByAppendingPathExtension:*MEMORY[0x263F5DBF0]];

      if (([v115 writeToURL:v121 atomically:1] & 1) == 0)
      {
        v122 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
          -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:]();
        }

        v121 = 0;
      }
      unint64_t v111 = 0x263F08000;
    }
    else
    {
      v118 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
        -[CAMPersistenceController _persistStillImageCaptureSurfaceResult:withRequest:]();
      }
      v121 = 0;
    }
  }
  else
  {
    v121 = 0;
  }
  v169 = v23;
  v142 = (void *)v112;
  if ([v176 temporaryPersistenceOptions] == 2)
  {
    v123 = [(CAMPersistenceController *)v174 _extensionForUniformType:v164];
    v125 = v121;
    if (v172)
    {
      uint64_t v124 = [(id)*MEMORY[0x263F5DBF8] stringByAppendingPathExtension:v123];

      v123 = (void *)v124;
    }
    v127 = +[CAMPersistenceController uniquePathForAssetWithUUID:v165 captureTime:v123 extension:0 usingIncomingDirectory:Current];
    v128 = [NSURL fileURLWithPath:v127];
    v129 = [*(id *)(v111 + 2128) defaultManager];
    id v178 = 0;
    char v130 = [v129 copyItemAtURL:v169 toURL:v128 error:&v178];
    id v131 = v178;

    if ((v130 & 1) == 0)
    {
      v132 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v185 = v169;
        __int16 v186 = 2114;
        v187 = v128;
        __int16 v188 = 2114;
        id v189 = v131;
        _os_log_error_impl(&dword_2099F8000, v132, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
      }

      v128 = 0;
    }
    v175 = v128;
    v126 = v93;
  }
  else
  {
    v125 = v121;
    v126 = v93;
    v175 = 0;
  }
  v60 = v153;
  v69 = v149;
  v133 = [v149 path];
  v134 = [CAMStillImageLocalPersistenceResult alloc];
  v135 = [v164 identifier];
  v71 = (void *)v160;
  v136 = v134;
  v137 = v125;
  v138 = v125;
  id v64 = v146;
  v173 = [(CAMStillImageLocalPersistenceResult *)v136 initWithCaptureResult:v126 atURL:v169 linkedURL:v175 localAdjustmentsURL:v138 diagnosticsPath:v133 filteredPreviewPath:v146 withUUID:v165 creationDate:v170 uniformTypeIdentifier:v135 orientation:v151 metadata:v171 adjustmentsData:v160 localPrivateMetadataFileURL:v140 error:v153];

  v65 = v169;
  v73 = (void *)v165;

  v72 = v161;
  v70 = v156;
  v66 = v171;
  v67 = v145;
LABEL_140:

  return v173;
}

- (CAMThumbnailGenerator)_localPersistenceThumbnailGenerator
{
  return self->__localPersistenceThumbnailGenerator;
}

+ (id)uniquePathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5 usingIncomingDirectory:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  if ([v10 length])
  {
    if (a6)
    {
LABEL_3:
      uint64_t v12 = [a1 _pathForIncomingDirectory];
      goto LABEL_6;
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];

    id v10 = (id)v14;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = NSTemporaryDirectory();
LABEL_6:
  v15 = (void *)v12;
  uint64_t v16 = [a1 delimiterForIncomingAssetFilenames];
  id v17 = [NSString stringWithFormat:@"%.f%@%@", a4 * 100.0, v16, v10];
  id v18 = [v15 stringByAppendingPathComponent:v17];

  if (v11)
  {
    uint64_t v19 = [v18 stringByAppendingPathExtension:v11];

    id v18 = (void *)v19;
  }
  if (!a6)
  {
    v20 = NSTemporaryDirectory();
    v21 = [MEMORY[0x263F08850] defaultManager];
    char v22 = [v21 fileExistsAtPath:v20];

    if ((v22 & 1) == 0)
    {
      id v23 = [MEMORY[0x263F08850] defaultManager];
      id v28 = 0;
      char v24 = [v23 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v28];
      id v25 = v28;

      if ((v24 & 1) == 0)
      {
        v26 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:]();
        }
      }
    }
  }
  return v18;
}

+ (id)_pathForIncomingDirectory
{
  if (_pathForIncomingDirectory_onceToken != -1) {
    dispatch_once(&_pathForIncomingDirectory_onceToken, &__block_literal_global_303);
  }
  v2 = (void *)__cachedPathForIncomingDirectory;
  return v2;
}

void __53__CAMPersistenceController__pathForIncomingDirectory__block_invoke()
{
  CPSharedResourcesDirectory();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v5 stringByAppendingPathComponent:@"Media/DCIM/.MISC/Incoming"];
  v1 = (void *)__cachedPathForIncomingDirectory;
  __cachedPathForIncomingDirectory = v0;

  v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:__cachedPathForIncomingDirectory];

  if ((v3 & 1) == 0)
  {
    int v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 createDirectoryAtPath:__cachedPathForIncomingDirectory withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (id)delimiterForIncomingAssetFilenames
{
  return @"__";
}

- (BOOL)_writeDataToURL:(id)a3 withData:(id)a4 duringBurst:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v18 = 0;
  id v11 = [(CAMPersistenceController *)self _createOpenWriteStreamWithURL:a3 forBurst:v7 error:&v18];
  CFErrorRef v12 = (CFErrorRef)v18;
  if (!v11)
  {
    BOOL v15 = 0;
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v13 = v10;
  CFIndex v14 = CFWriteStreamWrite(v11, (const UInt8 *)[v13 bytes], objc_msgSend(v13, "length"));
  BOOL v15 = v14 > 0;
  if (v14 <= 0)
  {
    CFErrorRef v16 = CFWriteStreamCopyError(v11);

    CFErrorRef v12 = v16;
  }
  CFWriteStreamClose(v11);
  CFRelease(v11);
  if (a6) {
LABEL_5:
  }
    *a6 = v12;
LABEL_6:

  return v15;
}

- (id)_xmpEncodedDiagnosticDataFromDictionary:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    int v4 = (void *)MEMORY[0x21050BCA0]();
    id v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:200 options:0 error:0];
    id v6 = [v5 base64EncodedStringWithOptions:0];
    Mutable = CGImageMetadataCreateMutable();
    if (Mutable)
    {
      id v8 = Mutable;
      CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/ios_debug", @"ios_debug", 0);
      CGImageMetadataSetValueWithPath(v8, 0, @"ios_debug:camera_diagnostics_bplist", v6);
      CFDataRef XMPData = CGImageMetadataCreateXMPData(v8, 0);
      CFRelease(v8);
    }
    else
    {
      CFDataRef XMPData = 0;
    }
  }
  else
  {
    CFDataRef XMPData = 0;
  }

  return XMPData;
}

- (CAMPersistenceResultDelegate)resultDelegate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11;
  id v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  id v3 = [(CAMPersistenceController *)self _resultDelegateIsolationQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMPersistenceController_resultDelegate__block_invoke;
  v6[3] = &unk_263FA35E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CAMPersistenceResultDelegate *)v4;
}

uint64_t __42__CAMPersistenceController_resultDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
  return MEMORY[0x270F9A758](WeakRetained, v4);
}

- (void)_coordinateRemotePersistenceForStillImageLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CAMSignpostWithIDAndArgs(51, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v9)
  {
    id v11 = [(CAMPersistenceController *)self _coordinationQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __106__CAMPersistenceController__coordinateRemotePersistenceForStillImageLocalResult_coordinationInfo_request___block_invoke;
    v13[3] = &unk_263FA0A60;
    id v14 = v9;
    BOOL v15 = self;
    id v16 = v8;
    id v17 = v10;
    dispatch_barrier_sync(v11, v13);
  }
  else
  {
    id v12 = [0 identifier];
    [(CAMPersistenceController *)self _dispatchRemotePersistenceForLocalPersistenceResult:v8 filteredLocalResult:0 request:v10 powerAssertionReason:512 loggingIdentifier:v12];
  }
}

- (OS_dispatch_queue)_coordinationQueue
{
  return self->__coordinationQueue;
}

void __106__CAMPersistenceController__coordinateRemotePersistenceForStillImageLocalResult_coordinationInfo_request___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) identifier];
  v2 = objc_msgSend(*(id *)(a1 + 40), "_coordinationQueue_stillImagePersistenceCoordinators");
  uint64_t v3 = [v2 objectForKeyedSubscript:v4];
  if (!v3)
  {
    uint64_t v3 = [[CAMStillImagePersistenceCoordinator alloc] initWithDelegate:*(void *)(a1 + 40) loggingIdentifier:v4];
    [v2 setObject:v3 forKeyedSubscript:v4];
  }
  [(CAMStillImagePersistenceCoordinator *)v3 updateForCoordinationInfo:*(void *)(a1 + 32) localPersistenceResult:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
  if ([(CAMStillImagePersistenceCoordinator *)v3 hasReceivedAllExpectedResponses]) {
    [v2 setObject:0 forKeyedSubscript:v4];
  }
}

- (OS_dispatch_queue)_remotePersistenceQueue
{
  return self->__remotePersistenceQueue;
}

- (CAMThumbnailGenerator)_remotePersistenceThumbnailGenerator
{
  return self->__remotePersistenceThumbnailGenerator;
}

uint64_t __93__CAMPersistenceController__locallyPersistStillImageResult_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfCompletedStillImageLocalPersistenceForRequest:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_notifyDelegateOfCompletedStillImageLocalPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v42 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 localPersistenceUUID];
  uint64_t v8 = [v6 creationDate];
  if ([v42 conformsToProtocol:&unk_26BE66418])
  {
    id v9 = [(CAMPersistenceController *)self _burstController];
    id v41 = [v42 burstIdentifier];
    uint64_t v10 = objc_msgSend(v9, "estimatedCountForIdentifier:");
  }
  else
  {
    uint64_t v10 = 0;
    id v41 = 0;
  }
  id v11 = [v6 captureResult];
  id v12 = [v11 metadata];
  uint64_t v39 = [v6 localDestinationURL];
  uint64_t v13 = [v42 sessionIdentifier];
  char v14 = [v11 isExpectingPairedVideo];
  uint64_t v15 = [v42 type];
  id v38 = v11;
  uint64_t v40 = v6;
  uint64_t v16 = v10;
  id v17 = (void *)v7;
  if (v15) {
    double v18 = CAMSizeForPhotoMetadata(v12);
  }
  else {
    +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithPhotoMetadata:aspectRatio:", v12, [v42 aspectRatioCrop]);
  }
  double v20 = v18;
  double v21 = v19;
  char v22 = [CAMStillImagePersistenceResponse alloc];
  id v23 = [v40 captureResult];
  char v24 = [v23 coordinationInfo];
  LOBYTE(v37) = v14;
  id v25 = v22;
  v26 = v17;
  id v27 = v17;
  uint64_t v28 = v13;
  char v29 = (void *)v39;
  id v30 = (void *)v8;
  id v31 = -[CAMStillImagePersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:](v25, "initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:", v27, v28, v39, v8, 0, v12, v20, v21, v41, v16, v37, v24);

  if (v15 == 2)
  {
    id v36 = v42;
    int v34 = [v36 delegate];
    if (!v34)
    {
      id v32 = v40;
      goto LABEL_17;
    }
    id v32 = v40;
    if (objc_opt_respondsToSelector())
    {
      v35 = [v40 error];
      [v34 panoramaRequestDidCompleteLocalPersistence:v36 withResponse:v31 error:v35];
      goto LABEL_15;
    }
  }
  else
  {
    id v32 = v40;
    if (v15) {
      goto LABEL_18;
    }
    id v33 = v42;
    int v34 = [v33 delegate];
    if (v34 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v35 = [v40 error];
      [v34 stillImageRequestDidCompleteStillImageLocalPersistence:v33 withResponse:v31 error:v35];
LABEL_15:

      char v29 = (void *)v39;
    }
  }
LABEL_17:

LABEL_18:
}

- (CAMBurstController)_burstController
{
  return self->__burstController;
}

- (void)_handleCompletedStillImageJobForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 completionHandler:(id)a6 error:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    uint64_t v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v26 = v15;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2114;
      id v30 = v13;
      __int16 v31 = 2048;
      unint64_t v32 = a5;
      _os_log_error_impl(&dword_2099F8000, v16, OS_LOG_TYPE_ERROR, "Failed to remotely persist still image, error=%{public}@, request=%{public}@, reply=%{public}@, batchSize:%ld", buf, 0x2Au);
    }
  }
  uint64_t v22 = MEMORY[0x263EF8330];
  id v17 = v12;
  id v23 = v13;
  char v24 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v13;
  pl_dispatch_async();
  if (objc_msgSend(v17, "shouldProtectPersistence", v22, 3221225472, __118__CAMPersistenceController__handleCompletedStillImageJobForRequest_withReply_fromBatchOfSize_completionHandler_error___block_invoke, &unk_263FA3BE8, self))
  {
    double v21 = [(CAMPersistenceController *)self _protectionController];
    [v21 stopProtectingPersistenceForRequest:v17];
  }
  CAMSignpostWithIDAndArgs(52, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

- (void)_notifyDelegateOfCompletedStillImageRemotePersistenceForRequest:(id)a3 withReply:(id)a4 fromBatchOfSize:(unint64_t)a5 error:(id)a6
{
  id v31 = a3;
  id v9 = a4;
  id v30 = a6;
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F5DC80]];
  id v11 = [v9 objectForKey:*MEMORY[0x263F5DC88]];
  id v12 = [v9 objectForKey:*MEMORY[0x263F5DCA0]];
  id v13 = [v9 objectForKey:*MEMORY[0x263F5DD50]];
  char v14 = [v13 BOOLValue];

  if ([v31 conformsToProtocol:&unk_26BE66418])
  {
    id v15 = [v31 burstIdentifier];
  }
  else
  {
    a5 = 0;
    id v15 = 0;
  }
  uint64_t v16 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5DCC8]];
  [v16 doubleValue];
  double v18 = v17;

  id v19 = [v9 objectForKeyedSubscript:*MEMORY[0x263F5DCB8]];
  [v19 doubleValue];
  double v21 = v20;

  uint64_t v22 = [v9 objectForKey:*MEMORY[0x263F5DD28]];
  if (v22)
  {
    id v23 = [NSURL fileURLWithPath:v22];
  }
  else
  {
    id v23 = 0;
  }
  LOBYTE(v29) = v14;
  char v24 = -[CAMStillImagePersistenceResponse initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:]([CAMStillImagePersistenceResponse alloc], "initWithUUID:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:metadata:burstIdentifier:burstRepresentedCount:expectingPairedVideo:coordinationInfo:", v10, [v31 sessionIdentifier], v23, v11, 0, v12, v18, v21, v15, a5, v29, 0);
  uint64_t v25 = [v31 type];
  if (v25 == 2)
  {
    id v28 = v31;
    __int16 v27 = [v28 delegate];
    if (v27 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v27 panoramaRequestDidCompleteRemotePersistence:v28 withResponse:v24 error:v30];
    }
  }
  else
  {
    if (v25) {
      goto LABEL_16;
    }
    id v26 = v31;
    __int16 v27 = [v26 delegate];
    if (v27 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v27 stillImageRequestDidCompleteStillImageRemotePersistence:v26 withResponse:v24 error:v30];
    }
  }

LABEL_16:
}

- (CAMPersistenceController)initWithLocationController:(id)a3 burstController:(id)a4 protectionController:(id)a5 powerController:(id)a6 irisVideoController:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v45 = a7;
  v48.receiver = self;
  v48.super_class = (Class)CAMPersistenceController;
  double v17 = [(CAMPersistenceController *)&v48 init];
  double v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->__locationController, a3);
    objc_storeStrong((id *)&v18->__burstController, a4);
    objc_storeStrong((id *)&v18->__protectionController, a5);
    objc_storeStrong((id *)&v18->__powerController, a6);
    objc_storeStrong((id *)&v18->__irisVideoController, a7);
    id v19 = MEMORY[0x263EF83A8];
    v44 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.persistence-controller.local-persistence", v44);
    localPersistenceQueue = v18->__localPersistenceQueue;
    v18->__localPersistenceQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.persistence-controller.remote-persistence", v22);
    remotePersistenceQueue = v18->__remotePersistenceQueue;
    v18->__remotePersistenceQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = objc_alloc_init(CAMThumbnailGenerator);
    localPersistenceThumbnailGenerator = v18->__localPersistenceThumbnailGenerator;
    v18->__localPersistenceThumbnailGenerator = v25;

    __int16 v27 = objc_alloc_init(CAMThumbnailGenerator);
    remotePersistenceThumbnailGenerator = v18->__remotePersistenceThumbnailGenerator;
    v18->__remotePersistenceThumbnailGenerator = v27;

    uint64_t v29 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.persistence-controller.result-delegate-isolation", v29);
    resultDelegateIsolationQueue = v18->__resultDelegateIsolationQueue;
    v18->__resultDelegateIsolationQueue = (OS_dispatch_queue *)v30;

    unint64_t v32 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v33 = dispatch_queue_create("com.apple.persistence-controller.coordination", v32);
    coordinationQueue = v18->__coordinationQueue;
    v18->__coordinationQueue = (OS_dispatch_queue *)v33;

    v35 = v18->__coordinationQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __128__CAMPersistenceController_initWithLocationController_burstController_protectionController_powerController_irisVideoController___block_invoke;
    block[3] = &unk_263FA0208;
    id v36 = v16;
    id v37 = v15;
    id v38 = v14;
    id v39 = v13;
    uint64_t v40 = v18;
    v47 = v40;
    dispatch_barrier_sync(v35, block);
    id v41 = +[CAMPriorityNotificationCenter defaultCenter];
    [v41 addObserver:v40 selector:sel__mainThread_handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    id v42 = v40;
    id v13 = v39;
    id v14 = v38;
    id v15 = v37;
    id v16 = v36;
  }
  return v18;
}

uint64_t __128__CAMPersistenceController_initWithLocationController_burstController_protectionController_powerController_irisVideoController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 128);
  *(void *)(v3 + 128) = v2;

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v5;

  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 144);
  *(void *)(v9 + 144) = v8;
  return MEMORY[0x270F9A758](v8, v10);
}

- (CAMPersistenceController)init
{
  [(CAMPersistenceController *)self doesNotRecognizeSelector:a2];
  return [(CAMPersistenceController *)self initWithLocationController:0 burstController:0 protectionController:0 powerController:0 irisVideoController:0];
}

- (void)dealloc
{
  uint64_t v3 = +[CAMPriorityNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMPersistenceController;
  [(CAMPersistenceController *)&v4 dealloc];
}

- (NSMutableArray)_pendingLocalPersistenceWrappers
{
  pendingLocalPersistenceWrappers = self->_pendingLocalPersistenceWrappers;
  if (!pendingLocalPersistenceWrappers)
  {
    objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = self->_pendingLocalPersistenceWrappers;
    self->_pendingLocalPersistenceWrappers = v4;

    pendingLocalPersistenceWrappers = self->_pendingLocalPersistenceWrappers;
  }
  return pendingLocalPersistenceWrappers;
}

- (NSMutableArray)_pendingRemotePersistenceWrappers
{
  pendingRemotePersistenceWrappers = self->_pendingRemotePersistenceWrappers;
  if (!pendingRemotePersistenceWrappers)
  {
    objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = self->_pendingRemotePersistenceWrappers;
    self->_pendingRemotePersistenceWrappers = v4;

    pendingRemotePersistenceWrappers = self->_pendingRemotePersistenceWrappers;
  }
  return pendingRemotePersistenceWrappers;
}

- (void)setResultDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMPersistenceController *)self _resultDelegateIsolationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__CAMPersistenceController_setResultDelegate___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

uint64_t __46__CAMPersistenceController_setResultDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t result = objc_opt_respondsToSelector();
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result & 1;
  return result;
}

- (void)_mainThread_handleApplicationDidEnterBackground:(id)a3
{
}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(CAMPersistenceController *)self _irisVideoController];
  if ([v7 shouldHandleLivePhotoRenderingForRequest:v9])
  {
    if ([v9 shouldProtectPersistenceForVideo])
    {
      id v8 = [(CAMPersistenceController *)self _protectionController];
      [v8 stopProtectingPersistenceForRequest:v9];
    }
    [v7 stillImageRequest:v9 didCompleteVideoCaptureWithResult:v6];
  }
  else
  {
    [(CAMPersistenceController *)self _handleVideoPersistenceForRequest:v9 withResult:v6];
  }
}

uint64_t __70__CAMPersistenceController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistenceController:*(void *)(a1 + 40) didCompleteAllLocalPersistenceForRequest:*(void *)(a1 + 48)];
}

- (unsigned)_videoLocalPowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isHDR];
  int v5 = [v3 isFiltered];

  if (v4) {
    unsigned int v6 = 0x4000;
  }
  else {
    unsigned int v6 = 0x2000;
  }
  if (v4) {
    unsigned int v7 = 0x10000;
  }
  else {
    unsigned int v7 = 0x8000;
  }
  if (v5) {
    return v7;
  }
  else {
    return v6;
  }
}

- (unsigned)_videoRemotePowerAssertionReasonForCoordinationInfo:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isHDR];
  int v5 = [v3 isFiltered];

  if (v4) {
    unsigned int v6 = 0x40000;
  }
  else {
    unsigned int v6 = 0x20000;
  }
  if (v4) {
    unsigned int v7 = 0x100000;
  }
  else {
    unsigned int v7 = 0x80000;
  }
  if (v5) {
    return v7;
  }
  else {
    return v6;
  }
}

void __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 48) withReason:*(unsigned int *)(a1 + 52)];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

void __78__CAMPersistenceController__handleStillImagePersistenceForRequest_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deferredPersistenceOptions])
  {
    unsigned int v7 = [[CAMPendingLocalPersistenceWrapper alloc] initWithRequest:*(void *)(a1 + 32) result:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
    unsigned int v6 = [*(id *)(a1 + 48) _pendingLocalPersistenceWrappers];
    [v6 addObject:v7];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    int v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v4 _locallyPersistStillImageResult:v2 forRequest:v3 withCompletionHandler:v5];
  }
}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 filteredLocalResult:(id)a5 request:(id)a6 powerAssertionReason:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [a3 loggingIdentifier];
  [(CAMPersistenceController *)self _dispatchRemotePersistenceForLocalPersistenceResult:v14 filteredLocalResult:v13 request:v12 powerAssertionReason:v7 loggingIdentifier:v15];
}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_time(0, 10000000000);
  id v9 = [(CAMPersistenceController *)self _localPersistenceQueue];
  id v12 = v8;
  id v10 = v8;
  id v11 = v7;
  pl_dispatch_after();
}

void __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _coordinationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2;
  block[3] = &unk_263FA0CD0;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_barrier_sync(v2, block);
}

void __141__CAMPersistenceController_stillImagePersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_stillImagePersistenceCoordinators");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [v4 objectForKeyedSubscript:v2];
  [v3 updateForTimeoutTimerFiredForCoordinationInfo:*(void *)(a1 + 40) request:*(void *)(a1 + 48)];
}

- (void)_dispatchRemotePersistenceForLocalPersistenceResult:(id)a3 filteredLocalResult:(id)a4 request:(id)a5 powerAssertionReason:(unsigned int)a6 loggingIdentifier:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12)
  {
    id v16 = [v12 error];

    if (!v16)
    {
      uint64_t v17 = [v14 assertionIdentifier];
      double v18 = [(CAMPersistenceController *)self _powerController];
      [v18 addAssertionForIndentifier:v17 withReason:v8];
      int v19 = [v14 shouldProtectPersistence];
      if (v13 && v19)
      {
        dispatch_queue_t v20 = [(CAMPersistenceController *)self _protectionController];
        [v20 stopProtectingPersistenceForRequest:v14];
      }
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke;
      aBlock[3] = &unk_263FA3B98;
      id v39 = v18;
      int v40 = v17;
      int v41 = v8;
      id v21 = v18;
      uint64_t v22 = _Block_copy(aBlock);
      uint64_t v28 = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      dispatch_queue_t v30 = __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2;
      id v31 = &unk_263FA3BC0;
      unint64_t v32 = self;
      id v33 = v12;
      id v34 = v13;
      id v23 = v14;
      id v35 = v23;
      id v36 = v15;
      id v37 = v22;
      id v24 = v22;
      uint64_t v25 = _Block_copy(&v28);
      if (objc_msgSend(v23, "shouldDelayRemotePersistence", v28, v29, v30, v31, v32))
      {
        dispatch_time_t v26 = dispatch_time(0, 5000000000);
        __int16 v27 = [(CAMPersistenceController *)self _remotePersistenceQueue];
        dispatch_after(v26, v27, v25);
      }
      else
      {
        __int16 v27 = [(CAMPersistenceController *)self _remotePersistenceQueue];
        pl_dispatch_async();
      }
    }
  }
}

uint64_t __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 40) withReason:*(unsigned int *)(a1 + 44)];
}

void __147__CAMPersistenceController__dispatchRemotePersistenceForLocalPersistenceResult_filteredLocalResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _jobDictionaryForStillImageLocalResult:*(void *)(a1 + 40) filteredLocalResult:*(void *)(a1 + 48) fromRequest:*(void *)(a1 + 56) loggingIdentifier:*(void *)(a1 + 64)];
  if (([*(id *)(a1 + 56) deferredPersistenceOptions] & 2) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) creationDate];
    uint64_t v3 = [[CAMPendingRemotePersistenceWrapper alloc] initWithRequest:*(void *)(a1 + 56) creationDate:v2 job:v8 loggingIdentifier:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
    id v4 = [*(id *)(a1 + 32) _pendingRemotePersistenceWrappers];
    [v4 addObject:v3];
  }
  else
  {
    [*(id *)(a1 + 32) _remotelyPersistStillImageJob:v8 forRequest:*(void *)(a1 + 56) loggingIdentifier:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
  }
  if ([*(id *)(a1 + 56) conformsToProtocol:&unk_26BE66418])
  {
    id v5 = *(id *)(a1 + 56);
    id v6 = [v5 burstIdentifier];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) _burstController];
      [v7 processPersistedRequest:v5 withResult:*(void *)(a1 + 40)];
    }
  }
}

- (id)_extensionForUniformType:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToType:*MEMORY[0x263F1DB40]])
  {
    id v4 = @"JPG";
  }
  else
  {
    id v5 = [v3 preferredFilenameExtension];
    id v4 = [v5 uppercaseString];
  }
  return v4;
}

- (id)_uniformTypeForStillImageRequest:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = [a4 capturePhoto];
  id v7 = [v6 processedFileType];

  if (!v7)
  {
    id v7 = (id)*MEMORY[0x263EF9880];
    uint64_t v8 = [v5 photoEncodingBehavior];
    if (v8 == 1)
    {
      id v9 = (id *)MEMORY[0x263EF9870];
    }
    else
    {
      if (v8 != 2) {
        goto LABEL_7;
      }
      id v9 = (id *)MEMORY[0x263EF9868];
    }
    id v10 = *v9;

    id v7 = v10;
  }
LABEL_7:
  id v11 = [MEMORY[0x263F1D920] typeWithIdentifier:v7];

  return v11;
}

- (id)_physicallyRotatedJPEGDataFromCapturePhoto:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 fileDataRepresentation];
  id v5 = [v3 metadata];
  uint64_t v9 = *MEMORY[0x263F2F940];
  v10[0] = MEMORY[0x263EFFA88];
  id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  CMPhotoDecompressionCreateCVPixelBufferForIndex();
  id v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CAMPersistenceController _physicallyRotatedJPEGDataFromCapturePhoto:]();
  }

  return 0;
}

- (id)_createMetadataForPhysicallyOrientedImage:(id)a3
{
  v138[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F0F4C8];
  id v5 = [v3 objectForKey:*MEMORY[0x263F0F4C8]];
  uint64_t v6 = *MEMORY[0x263F0F248];
  id v7 = [v3 objectForKey:*MEMORY[0x263F0F248]];
  uint64_t v8 = *MEMORY[0x263F0F2E8];
  uint64_t v9 = [v7 objectForKey:*MEMORY[0x263F0F2E8]];
  uint64_t v10 = *MEMORY[0x263F0F2F0];
  id v11 = [v7 objectForKey:*MEMORY[0x263F0F2F0]];
  id v12 = (void *)[v3 mutableCopy];
  [v12 setObject:&unk_26BDDE478 forKeyedSubscript:v4];
  v115 = v5;
  [v5 shortValue];
  PLImageOrientationFromExifOrientation();
  uint64_t v13 = PLDegreesForImageOrientation();
  id v14 = v12;
  uint64_t IsMirrored = PLImageOrientationIsMirrored();
  if ((int)v13 > 0 || IsMirrored != 0)
  {
    uint64_t v126 = v10;
    uint64_t v17 = IsMirrored;
    double v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
    [v14 setObject:v18 forKeyedSubscript:v6];
    v114 = v9;
    [v9 floatValue];
    double v20 = v19;
    int v113 = v11;
    [v11 floatValue];
    double v22 = v21;
    memset(&v136, 0, sizeof(v136));
    int v117 = v17;
    [(CAMPersistenceController *)self _affineTransformForRotationDegrees:v13 mirrored:v17];
    double v23 = fabs(0.0 * v22 + 0.0 * v20);
    id v24 = [NSNumber numberWithDouble:v23];
    [v14 setObject:v24 forKeyedSubscript:*MEMORY[0x263F0F4F8]];

    uint64_t v25 = [NSNumber numberWithDouble:v23];
    [v14 setObject:v25 forKeyedSubscript:*MEMORY[0x263F0F4F0]];

    dispatch_time_t v26 = [NSNumber numberWithDouble:v23];
    [v18 setObject:v26 forKeyedSubscript:v8];

    __int16 v27 = v18;
    uint64_t v28 = [NSNumber numberWithDouble:v23];
    [v18 setObject:v28 forKeyedSubscript:v126];

    uint64_t v29 = v9;
    uint64_t v30 = *MEMORY[0x263F0F328];
    id v31 = [v7 objectForKeyedSubscript:*MEMORY[0x263F0F328]];
    unint64_t v32 = v31;
    id v111 = v3;
    uint64_t v112 = v14;
    BOOL v110 = v18;
    int v118 = v13;
    if (v31)
    {
      v127 = [v31 objectAtIndexedSubscript:0];
      uint64_t v130 = v30;
      id v33 = [v32 objectAtIndexedSubscript:1];
      uint64_t v124 = v33;
      id v34 = [v32 objectAtIndexedSubscript:2];
      id v35 = [v32 objectAtIndexedSubscript:3];
      [v127 floatValue];
      double v37 = v36;
      v122 = v34;
      [v34 floatValue];
      CGFloat v39 = (v37 - v38 * 0.5) / v20;
      [v33 floatValue];
      double v41 = v40;
      [v35 floatValue];
      CGFloat v43 = (v41 - v42 * 0.5) / v22;
      [v34 floatValue];
      CGFloat v45 = v44 / v20;
      [v35 floatValue];
      CGAffineTransform v135 = v136;
      v140.size.CGFloat height = v46 / v22;
      v140.origin.CGFloat x = v39;
      v140.origin.CGFloat y = v43;
      v140.size.CGFloat width = v45;
      CGRect v141 = CGRectApplyAffineTransform(v140, &v135);
      CGFloat x = v141.origin.x;
      CGFloat y = v141.origin.y;
      CGFloat width = v141.size.width;
      CGFloat height = v141.size.height;
      LODWORD(v3) = llround(v23 * CGRectGetMidX(v141));
      v142.origin.CGFloat x = x;
      v142.origin.CGFloat y = y;
      v142.size.CGFloat width = width;
      v142.size.CGFloat height = height;
      unint64_t v51 = __PAIR64__(HIDWORD(v127), llround(v23 * CGRectGetMidY(v142)));
      v143.origin.CGFloat x = x;
      v143.origin.CGFloat y = y;
      v143.size.CGFloat width = width;
      v143.size.CGFloat height = height;
      v52 = v32;
      char v53 = v7;
      LODWORD(v7) = llround(v23 * CGRectGetWidth(v143));
      v144.origin.CGFloat x = x;
      v144.origin.CGFloat y = y;
      v144.size.CGFloat width = width;
      v144.size.CGFloat height = height;
      LODWORD(v33) = llround(v23 * CGRectGetHeight(v144));
      uint64_t v54 = [NSNumber numberWithShort:v3];
      v138[0] = v54;
      uint64_t v55 = [NSNumber numberWithShort:v51];
      v138[1] = v55;
      uint64_t v56 = [NSNumber numberWithShort:v7];
      v138[2] = v56;
      v57 = [NSNumber numberWithShort:v33];
      v138[3] = v57;
      BOOL v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:4];

      id v7 = v53;
      unint64_t v32 = v52;

      __int16 v27 = v110;
      id v3 = v111;
      [v110 setObject:v58 forKeyedSubscript:v130];
    }
    v59 = v27;
    uint64_t v9 = v29;
    id v11 = v113;
    uint64_t v60 = *MEMORY[0x263F0F1C0];
    [v7 objectForKeyedSubscript:*MEMORY[0x263F0F1C0]];
    v62 = v61 = v7;
    char v63 = [v62 objectForKeyedSubscript:@"Regions"];
    uint64_t v109 = *MEMORY[0x263F0F1F0];
    id v64 = objc_msgSend(v63, "objectForKeyedSubscript:");
    if ([v64 count])
    {
      uint64_t v104 = v60;
      uint64_t v106 = v63;
      uint64_t v107 = v32;
      v108 = v61;
      v121 = [MEMORY[0x263EFF980] array];
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      v105 = v64;
      id obj = v64;
      uint64_t v123 = [obj countByEnumeratingWithState:&v131 objects:v137 count:16];
      if (v123)
      {
        uint64_t v120 = *(void *)v132;
        uint64_t v119 = *MEMORY[0x263F0F208];
        uint64_t v66 = *MEMORY[0x263F0F200];
        uint64_t v65 = *MEMORY[0x263F0F210];
        uint64_t v67 = *MEMORY[0x263F0F1E8];
        do
        {
          for (uint64_t i = 0; i != v123; ++i)
          {
            if (*(void *)v132 != v120) {
              objc_enumerationMutation(obj);
            }
            v69 = *(void **)(*((void *)&v131 + 1) + 8 * i);
            v70 = [v69 objectForKeyedSubscript:v119];
            v71 = [v69 objectForKeyedSubscript:v65];
            v72 = [v69 objectForKeyedSubscript:v66];
            v73 = [v69 objectForKeyedSubscript:v67];
            [v70 floatValue];
            double v75 = v74;
            [v72 floatValue];
            CGFloat v77 = v75 - v76 * 0.5;
            v128 = v71;
            [v71 floatValue];
            double v79 = v78;
            [v73 floatValue];
            CGFloat v81 = v79 - v80 * 0.5;
            v125 = v72;
            [v72 floatValue];
            CGFloat v83 = v82;
            [v73 floatValue];
            v145.size.CGFloat height = v84;
            CGAffineTransform v135 = v136;
            v145.origin.CGFloat x = v77;
            v145.origin.CGFloat y = v81;
            v145.size.CGFloat width = v83;
            CGRect v146 = CGRectApplyAffineTransform(v145, &v135);
            CGFloat v85 = v146.origin.x;
            CGFloat v86 = v146.origin.y;
            CGFloat v87 = v146.size.width;
            CGFloat v88 = v146.size.height;
            v89 = (void *)[v69 mutableCopy];
            v147.origin.CGFloat x = v85;
            v147.origin.CGFloat y = v86;
            v147.size.CGFloat width = v87;
            v147.size.CGFloat height = v88;
            uint64_t v90 = [NSNumber numberWithDouble:CGRectGetMidX(v147)];
            [v89 setObject:v90 forKeyedSubscript:v119];

            v148.origin.CGFloat x = v85;
            v148.origin.CGFloat y = v86;
            v148.size.CGFloat width = v87;
            v148.size.CGFloat height = v88;
            id v91 = [NSNumber numberWithDouble:CGRectGetMidY(v148)];
            [v89 setObject:v91 forKeyedSubscript:v65];

            v149.origin.CGFloat x = v85;
            v149.origin.CGFloat y = v86;
            v149.size.CGFloat width = v87;
            v149.size.CGFloat height = v88;
            v92 = [NSNumber numberWithDouble:CGRectGetWidth(v149)];
            [v89 setObject:v92 forKeyedSubscript:v66];

            v150.origin.CGFloat x = v85;
            v150.origin.CGFloat y = v86;
            v150.size.CGFloat width = v87;
            v150.size.CGFloat height = v88;
            v93 = [NSNumber numberWithDouble:CGRectGetHeight(v150)];
            [v89 setObject:v93 forKeyedSubscript:v67];

            v94 = [v69 objectForKeyedSubscript:@"AngleInfoRoll"];
            v95 = v94;
            if (v94)
            {
              int v96 = [v94 intValue] + v118;
              if (v117) {
                int v96 = -v96;
              }
              char v97 = [NSNumber numberWithInt:(v96 % 360)];
              [v89 setObject:v97 forKeyedSubscript:@"AngleInfoRoll"];
            }
            [v121 addObject:v89];
          }
          uint64_t v123 = [obj countByEnumeratingWithState:&v131 objects:v137 count:16];
        }
        while (v123);
      }

      v59 = v110;
      char v63 = v106;
      if ([v121 count])
      {
        id v98 = (void *)[v106 mutableCopy];
        [v98 setObject:v121 forKeyedSubscript:v109];
        v99 = [NSNumber numberWithDouble:v23];
        [v98 setObject:v99 forKeyedSubscript:*MEMORY[0x263F0F1D0]];

        uint64_t v100 = [NSNumber numberWithDouble:v23];
        [v98 setObject:v100 forKeyedSubscript:*MEMORY[0x263F0F1C8]];

        int v101 = (void *)[v62 mutableCopy];
        [v101 setObject:v98 forKeyedSubscript:@"Regions"];
        [v110 setObject:v101 forKeyedSubscript:v104];
        [v112 setObject:v101 forKeyedSubscript:v104];
      }
      id v3 = v111;
      unint64_t v32 = v107;
      v61 = v108;
      id v11 = v113;
      uint64_t v9 = v114;
      id v64 = v105;
    }

    id v7 = v61;
    id v14 = v112;
  }
  +[CAMCaptureMetadataUtilities removeUnwantedKeysForPersistenceFromMetadata:v14];
  v102 = (void *)[v14 copy];

  return v102;
}

- (CGAffineTransform)_affineTransformForRotationDegrees:(SEL)a3 mirrored:(int)a4
{
  BOOL v5 = a5;
  uint64_t v8 = MEMORY[0x263F000D0];
  long long v17 = *MEMORY[0x263F000D0];
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v18;
  long long v16 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v16;
  CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
  *(_OWORD *)&t1.a = v17;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tCGFloat x = v16;
  CGAffineTransformConcat(retstr, &t1, &t2);
  if (v5)
  {
    CGAffineTransformMakeScale(&v23, -1.0, 1.0);
    long long v9 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v22.c = v9;
    *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&t1, &v22, &v23);
    long long v10 = *(_OWORD *)&t1.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  }
  if (a4 >= 1)
  {
    memset(&t1, 0, sizeof(t1));
    CGAffineTransformMakeRotation(&t1, (double)a4 * 0.0174532925);
    long long v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v21.c = v11;
    *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransform v20 = t1;
    CGAffineTransformConcat(&v22, &v21, &v20);
    long long v12 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v22.tx;
  }
  CGAffineTransformMakeTranslation(&v19, 0.5, 0.5);
  long long v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v22.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v22.c = v13;
  *(_OWORD *)&v22.tCGFloat x = *(_OWORD *)&retstr->tx;
  uint64_t result = CGAffineTransformConcat(&t1, &v22, &v19);
  long long v15 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&t1.tx;
  return result;
}

- (id)_persistenceErrorForWriteStream:(__CFWriteStream *)a3 url:(id)a4 code:(int64_t)a5
{
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (!a3 || (uint64_t v8 = CFWriteStreamCopyError(a3)) == 0)
  {
    long long v9 = (void *)MEMORY[0x263F087E8];
    long long v12 = @"url";
    v13[0] = v7;
    long long v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v9 errorWithDomain:@"CAMPersistenceControllerLocalPersistenceErrorDomain" code:a5 userInfo:v10];
  }
  return v8;
}

- (__CFWriteStream)_createOpenWriteStreamWithURL:(id)a3 forBurst:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  CFURLRef v8 = (const __CFURL *)a3;
  long long v9 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], v8);
  long long v10 = v9;
  if (!v9)
  {
    long long v13 = [(CAMPersistenceController *)self _persistenceErrorForWriteStream:0 url:v8 code:-22499];
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!CFWriteStreamOpen(v9))
  {
    id v14 = self;
    long long v15 = v10;
    CFURLRef v16 = v8;
    uint64_t v17 = -22498;
    goto LABEL_12;
  }
  CFDataRef v11 = (const __CFData *)CFWriteStreamCopyProperty(v10, @"_kCFStreamPropertyFileNativeHandle");
  if (!v11)
  {
    id v14 = self;
    long long v15 = v10;
    CFURLRef v16 = v8;
    uint64_t v17 = -22497;
LABEL_12:
    long long v13 = [(CAMPersistenceController *)v14 _persistenceErrorForWriteStream:v15 url:v16 code:v17];
    CFRelease(v10);
    long long v10 = 0;
    if (!a5) {
      goto LABEL_14;
    }
LABEL_13:
    *a5 = v13;
    goto LABEL_14;
  }
  CFDataRef v12 = v11;
  *(_DWORD *)buffer = 0;
  v20.location = 0;
  v20.length = 4;
  CFDataGetBytes(v11, v20, buffer);
  fcntl(*(int *)buffer, 48, 1);
  fcntl(*(int *)buffer, 62, 1);
  if (v6) {
    fcntl(*(int *)buffer, 82, 1);
  }
  CFRelease(v12);
  long long v13 = 0;
  if (a5) {
    goto LABEL_13;
  }
LABEL_14:

  return v10;
}

- (BOOL)_writeJPEGToURL:(id)a3 withData:(id)a4 thumbnail:(id)a5 properties:(id)a6 duringBurst:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v21 = 0;
  uint64_t v17 = [(CAMPersistenceController *)self _createOpenWriteStreamWithURL:a3 forBurst:v9 error:&v21];
  id v18 = v21;
  if (!v17)
  {
    char v19 = 0;
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  char v19 = CGImageWriteEXIFJPEGWithMetadata();
  CFWriteStreamClose(v17);
  CFRelease(v17);

  id v18 = 0;
  if (a8) {
LABEL_3:
  }
    *a8 = v18;
LABEL_4:

  return v19;
}

- (id)_adjustmentsDataForCinematicVideoRequest:(id)a3 result:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = (objc_class *)MEMORY[0x263F5DF28];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setDepthEnabled:1];
  objc_msgSend(v8, "setCinematicVideoRenderingVersion:", objc_msgSend(MEMORY[0x263F5D558], "currentSystemRenderingVersion"));
  uint64_t v9 = [v7 audioConfiguration];

  if (v9 == 3)
  {
    id v10 = objc_alloc(MEMORY[0x263F5DF20]);
    CFDataRef v11 = [v5 localDestinationURL];
    CFDataRef v12 = (void *)[v10 initWithAVURL:v11 options:13 timeZoneLookup:0];

    uint64_t v13 = [v12 hasSpatialAudio];
    if ((v13 & 1) == 0)
    {
      id v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "Cinematic video does not have spatial audio, possibly due to DSTM.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v8 setIsEligibleForCinematicAudioEffectProcessing:v13];
  id v19 = 0;
  id v15 = [MEMORY[0x263F5DEE8] serializedAdjustments:v8 error:&v19];
  id v16 = v19;
  if (!v15)
  {
    uint64_t v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for cinematic video error: %{public}@", buf, 0xCu);
    }
  }
  return v15;
}

- (id)_adjustmentsDataForVideoRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F5DF28];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 audioConfiguration];

  [v5 setIsEligibleForCinematicAudioEffectProcessing:v6 == 3];
  id v11 = 0;
  id v7 = [MEMORY[0x263F5DEE8] serializedAdjustments:v5 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for video error: %{public}@", buf, 0xCu);
    }
  }
  return v7;
}

- (id)_adjustmentsDataForSloMoVideoRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F5DF28]);
  if (objc_opt_respondsToSelector())
  {
    [v3 setSloMoEnabled:1];
    id v8 = 0;
    id v4 = [MEMORY[0x263F5DEE8] serializedAdjustments:v3 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      uint64_t v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v5;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for sloMo video error: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_adjustmentsDataForRequest:(id)a3 captureDimensions:(id)a4 portraitMetadata:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  if ([v10 captureMode] == 1 || objc_msgSend(v10, "captureMode") == 8)
  {
    uint64_t v11 = [(CAMPersistenceController *)self _adjustmentsDataForVideoRequest:v10];
LABEL_4:
    CFDataRef v12 = (void *)v11;
    goto LABEL_5;
  }
  if ([v10 captureMode] == 2 && objc_msgSend(v10, "type") == 1)
  {
    uint64_t v11 = [(CAMPersistenceController *)self _adjustmentsDataForSloMoVideoRequest:v10];
    goto LABEL_4;
  }
  if ([v10 conformsToProtocol:&unk_26BE66348]
    && [v10 hasAdjustments])
  {
    uint64_t v14 = +[CAMCaptureCapabilities capabilities];
    uint64_t v15 = [v14 supportedPortraitLightingVersion];

    id v16 = objc_msgSend(MEMORY[0x263F306D8], "ciFilterNameForLightingType:version:", objc_msgSend(v10, "lightingEffectType"), v15);
    uint64_t v17 = +[CAMEffectFilterManager ciFilterNameForFilterType:](CAMEffectFilterManager, "ciFilterNameForFilterType:", [v10 effectFilterType]);
    unint64_t v18 = [v10 aspectRatioCrop];
    uint64_t v19 = *MEMORY[0x263F5DFC0];
    double v20 = *(double *)(MEMORY[0x263F5DFC0] + 8);
    double v21 = *(double *)(MEMORY[0x263F5DFC0] + 16);
    double v22 = *(double *)(MEMORY[0x263F5DFC0] + 24);
    double v23 = v22;
    double v24 = v21;
    double v25 = v20;
    double v26 = *MEMORY[0x263F5DFC0];
    if (v18)
    {
      double v41 = *(double *)(MEMORY[0x263F5DFC0] + 8);
      uint64_t v42 = *MEMORY[0x263F5DFC0];
      double var0 = (double)a4.var0;
      double var1 = (double)a4.var1;
      +[CAMAspectCropUtilities cropRectForAspectRatio:inImageBounds:](CAMAspectCropUtilities, "cropRectForAspectRatio:inImageBounds:", v18, 0.0, 0.0, (double)a4.var0, (double)a4.var1);
      double v26 = v29;
      double v25 = v30;
      double v24 = v31;
      double v23 = v32;
      v54.origin.CGFloat x = 0.0;
      v54.origin.CGFloat y = 0.0;
      v54.size.CGFloat width = (double)a4.var0;
      v54.size.CGFloat height = (double)a4.var1;
      v56.origin.CGFloat x = v26;
      v56.origin.CGFloat y = v25;
      v56.size.CGFloat width = v24;
      v56.size.CGFloat height = v23;
      if (CGRectEqualToRect(v54, v56))
      {
        id v33 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[CAMPersistenceController _adjustmentsDataForRequest:captureDimensions:portraitMetadata:](v18, v33, 0.0, 0.0, var0, var1);
        }
      }
      double v20 = v41;
      uint64_t v19 = v42;
    }
    if (v9
      || v17
      || v16
      || (v55.origin.CGFloat x = v26,
          v55.origin.CGFloat y = v25,
          v55.size.CGFloat width = v24,
          v55.size.CGFloat height = v23,
          double v34 = v21,
          double v35 = v22,
          !CGRectEqualToRect(v55, *(CGRect *)&v19)))
    {
      os_log_t v36 = (os_log_t)objc_alloc_init(MEMORY[0x263F5DF28]);
      [v36 setEffectFilterName:v17];
      [v36 setPortraitEffectFilterName:v16];
      [v36 setPortraitMetadata:v9];
      [v36 setDepthEnabled:v9 != 0];
      -[NSObject setCropRect:](v36, "setCropRect:", v26, v25, v24, v23);
      id v43 = 0;
      CFDataRef v12 = [MEMORY[0x263F5DEE8] serializedAdjustments:v36 error:&v43];
      id v38 = v43;
      if (!v12)
      {
        CGFloat v39 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          if (v18 > 3) {
            float v40 = 0;
          }
          else {
            float v40 = off_263FA3E10[v18];
          }
          *(_DWORD *)buf = 138544130;
          CGFloat v45 = v17;
          __int16 v46 = 2114;
          v47 = v16;
          __int16 v48 = 2114;
          v49 = v40;
          __int16 v50 = 2114;
          id v51 = v38;
          _os_log_impl(&dword_2099F8000, v39, OS_LOG_TYPE_DEFAULT, "Failed to serialize camera adjustments data for filter name: %{public}@; lighting name: %{public}@; crop asp"
            "ect: %{public}@; error: %{public}@",
            buf,
            0x2Au);
        }
      }
    }
    else
    {
      os_log_t v36 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        double v37 = objc_msgSend(MEMORY[0x263F306D8], "displayNameForLightingType:", objc_msgSend(v10, "lightingEffectType"));
        *(_DWORD *)buf = 138543362;
        CGFloat v45 = v37;
        _os_log_impl(&dword_2099F8000, v36, OS_LOG_TYPE_DEFAULT, "No adjustments needed for request even though hasAdjustments=YES: %{public}@", buf, 0xCu);
      }
      CFDataRef v12 = 0;
    }
  }
  else
  {
    CFDataRef v12 = 0;
  }
LABEL_5:

  return v12;
}

- (id)_jobDictionaryForStillImageLocalResult:(id)a3 filteredLocalResult:(id)a4 fromRequest:(id)a5 loggingIdentifier:(id)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  CFDataRef v12 = (objc_class *)MEMORY[0x263EFF9A0];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  [v14 setObject:*MEMORY[0x263F5DCE8] forKey:*MEMORY[0x263F5DCD8]];
  CGFloat v87 = [v9 uniformTypeIdentifier];
  objc_msgSend(v14, "setObject:forKey:");
  CGFloat v86 = [v9 localDestinationURL];
  CGFloat v85 = [v86 path];
  objc_msgSend(v14, "setObject:forKey:");
  uint64_t v15 = [v10 captureResult];
  char v16 = [v15 representsDeferredFilteredProxy];

  char v84 = v16;
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [v10 localDestinationURL];
    unint64_t v18 = [v17 path];
    [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x263F5DD20]];
  }
  uint64_t v19 = [v9 imageOrientation];
  double v20 = [NSNumber numberWithInteger:v19];
  [v14 setObject:v20 forKey:*MEMORY[0x263F5DCD0]];

  double v21 = [v9 captureResult];
  double v22 = [v21 deferredPhotoIdentifier];
  [v14 setObject:v22 forKeyedSubscript:*MEMORY[0x263F5DC90]];

  [v14 setObject:v13 forKeyedSubscript:@"captureLogID"];
  double v23 = [v9 metadata];
  if ([v11 type])
  {
    double v24 = CAMSizeForPhotoMetadata(v23);
    double v26 = v25;
  }
  else
  {
    id v27 = v11;
    uint64_t v28 = [v9 captureResult];
    double v29 = [v28 capturePhoto];

    double v30 = [v9 captureResult];
    uint64_t v31 = [v30 predictedFinalAssetPhotoDimensions];

    uint64_t v32 = PLExifOrientationFromImageOrientation();
    uint64_t v33 = [v27 aspectRatioCrop];
    if (v29) {
      +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:v31 orientation:v32 aspectRatio:v33];
    }
    else {
      +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:v23 aspectRatio:v33];
    }
    double v24 = v34;
    double v26 = v35;
  }
  os_log_t v36 = [NSNumber numberWithDouble:v24];
  [v14 setObject:v36 forKeyedSubscript:*MEMORY[0x263F5DCC8]];

  double v37 = [NSNumber numberWithDouble:v26];
  [v14 setObject:v37 forKeyedSubscript:*MEMORY[0x263F5DCB8]];

  id v38 = [v10 localAdjustmentsURL];
  CGFloat v39 = v38;
  if (v38)
  {
    float v40 = [v38 path];
    [v14 setObject:v40 forKeyedSubscript:*MEMORY[0x263F5DD18]];
  }
  CGFloat v88 = [v9 localAdjustmentsURL];
  if (v88)
  {
    double v41 = [MEMORY[0x263F08850] defaultManager];
    id v90 = 0;
    char v42 = [v41 removeItemAtURL:v88 error:&v90];
    id v43 = v90;

    if ((v42 & 1) == 0)
    {
      float v44 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v92 = (uint64_t)v88;
        __int16 v93 = 2114;
        uint64_t v94 = (uint64_t)v43;
        _os_log_impl(&dword_2099F8000, v44, OS_LOG_TYPE_DEFAULT, "Failed to delete adjustments file when ingesting fullsize render as stand-alone asset %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }
  CGFloat v83 = v39;
  CGFloat v45 = [v9 captureResult];
  __int16 v46 = [v45 coordinationInfo];
  float v80 = v46;
  v89 = v10;
  if (!v46)
  {
    uint64_t v49 = v19;
    uint64_t v48 = [v9 localPersistenceUUID];
    goto LABEL_23;
  }
  int v47 = [v46 isFilteredImageForFilteredPair];
  uint64_t v48 = [v9 localPersistenceUUID];
  uint64_t v49 = v19;
  if (!v47)
  {
LABEL_23:
    uint64_t v53 = v48;
    uint64_t v51 = [v9 localPersistenceUUID];
    goto LABEL_24;
  }
  __int16 v50 = [MEMORY[0x263F08C38] UUID];
  uint64_t v51 = [v50 UUIDString];

  uint64_t v52 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v92 = v48;
    __int16 v93 = 2114;
    uint64_t v94 = v51;
    _os_log_impl(&dword_2099F8000, v52, OS_LOG_TYPE_DEFAULT, "Persisting fullsize render for unfiltered+filtered pair %{public}@ as stand alone asset with new UUID %{public}@", buf, 0x16u);
  }
  uint64_t v53 = v48;

LABEL_24:
  float v78 = (void *)v51;
  [v14 setObject:v51 forKey:*MEMORY[0x263F5DC80]];
  CGRect v54 = [v45 compactMetadata];
  [v14 setObject:v54 forKeyedSubscript:*MEMORY[0x263F5DCA0]];

  uint64_t v55 = [v45 stillImageFilteredPreviewSurface];
  uint64_t v56 = [v45 stillImageUnfilteredPreviewSurface];
  if (!v55) {
    uint64_t v55 = v56;
  }
  float v82 = [(CAMPersistenceController *)self _remotePersistenceThumbnailGenerator];
  uint64_t v57 = objc_msgSend(v82, "newJPEGDataOfFormat:inOrientation:usingSurface:withMetadata:", objc_msgSend(MEMORY[0x263F5DB18], "masterThumbnailFormat"), v49, v55, v23);
  if (v57) {
    [v14 setObject:v57 forKey:*MEMORY[0x263F5DDA0]];
  }
  double v79 = (void *)v57;
  if ([v11 capturedFromPhotoBooth]) {
    uint64_t v58 = [MEMORY[0x263F5DB30] savedAssetTypeForPhotoBoothAsset];
  }
  else {
    uint64_t v58 = [MEMORY[0x263F5DB30] savedAssetTypeForCameraCapturedAsset];
  }
  v59 = (void *)v53;
  uint64_t v60 = [NSNumber numberWithShort:v58];
  [v14 setObject:v60 forKey:*MEMORY[0x263F5DDB0]];

  [v14 setObject:&unk_26BDDE4A8 forKey:*MEMORY[0x263F5DC20]];
  if ([v11 conformsToProtocol:&unk_26BE663A8])
  {
    v61 = [v11 burstIdentifier];
    if (v61)
    {
      [v14 setObject:v61 forKey:*MEMORY[0x263F5DC60]];
      [v14 setObject:&unk_26BDDE4C0 forKey:*MEMORY[0x263F5DC58]];
      [v14 setObject:&unk_26BDDE4D8 forKey:*MEMORY[0x263F5DC68]];
    }
  }
  uint64_t v62 = MEMORY[0x263EFFA88];
  [v14 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5DD80]];
  [v14 setObject:v62 forKey:*MEMORY[0x263F5DC10]];
  [v14 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F5DDA8]];
  char v63 = v11;
  unint64_t v64 = [v11 captureDevice];
  uint64_t v65 = [NSNumber numberWithBool:(v64 > 0xB) | (0xFDu >> v64) & 1];
  [v14 setObject:v65 forKey:*MEMORY[0x263F5DC70]];

  uint64_t v66 = [v89 adjustmentsData];
  if (v66 || ([v9 adjustmentsData], (uint64_t v66 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v14 setObject:v66 forKeyedSubscript:*MEMORY[0x263F5DC50]];
  }
  uint64_t v67 = v59;
  if ((v84 & 1) == 0)
  {
    v69 = [v9 localFilteredPreviewPath];
    if (!v69) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  id v68 = [v89 localDestinationURL];
  v69 = [v68 path];

  if (v69) {
LABEL_42:
  }
    [v14 setObject:v69 forKeyedSubscript:*MEMORY[0x263F5DD38]];
LABEL_43:
  v70 = [v9 localDiagnosticsPath];
  if (v70) {
    [v14 setObject:v70 forKeyedSubscript:*MEMORY[0x263F5DD30]];
  }
  v71 = [v9 localPrivateMetadataFileURL];
  v72 = [v71 path];
  [v14 setObject:v72 forKeyedSubscript:*MEMORY[0x263F5DC78]];

  if ([v63 conformsToProtocol:&unk_26BE66520])
  {
    uint64_t v73 = [v45 isExpectingPairedVideo];
    float v74 = [NSNumber numberWithBool:v73];
    [v14 setObject:v74 forKeyedSubscript:*MEMORY[0x263F5DD50]];

    if (v73)
    {
      double v75 = [v45 coordinationInfo];
      float v76 = objc_msgSend(v63, "irisIdentifierForEV0:", objc_msgSend(v75, "isEV0ForHDREV0Pair"));
      [v14 setObject:v76 forKeyedSubscript:*MEMORY[0x263F5DD60]];
    }
  }

  return v14;
}

uint64_t __118__CAMPersistenceController__handleCompletedStillImageJobForRequest_withReply_fromBatchOfSize_completionHandler_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfCompletedStillImageRemotePersistenceForRequest:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48) fromBatchOfSize:*(void *)(a1 + 72) error:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_remotelyPersistStillImageJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x263F5DC80];
  id v14 = a3;
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v17 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
  unint64_t v18 = [v17 resourceClient];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __105__CAMPersistenceController__remotelyPersistStillImageJob_forRequest_loggingIdentifier_completionHandler___block_invoke;
  v23[3] = &unk_263FA3C10;
  CFAbsoluteTime v29 = Current;
  id v24 = v11;
  id v25 = v15;
  double v26 = self;
  id v27 = v10;
  id v28 = v12;
  id v19 = v12;
  id v20 = v10;
  id v21 = v15;
  id v22 = v11;
  [v18 saveAssetWithJobDictionary:v14 imageSurface:0 previewImageSurface:0 completionHandler:v23];
}

void __105__CAMPersistenceController__remotelyPersistStillImageJob_forRequest_loggingIdentifier_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (a2)
  {
    double v10 = Current;
    double v11 = *(double *)(a1 + 72);
    id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5DCC0]];
    uint64_t v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      int v18 = 138544130;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      double v23 = v12;
      __int16 v24 = 2048;
      double v25 = v10 - v11;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added photo to library as %{public}@ %{public}@ (took %.3f seconds)", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    id v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      double v23 = v8;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: error adding photo to library %{public}@: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }

  [*(id *)(a1 + 48) _handleCompletedStillImageJobForRequest:*(void *)(a1 + 56) withReply:v7 fromBatchOfSize:1 completionHandler:*(void *)(a1 + 64) error:v8];
}

- (void)_handleVideoPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 persistenceOptions];
  if (v8)
  {
    uint64_t v9 = v8;
    if (v8 != 3)
    {
      double v10 = [v7 error];
      if (v10)
      {
        double v11 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CAMPersistenceController _handleStillImagePersistenceForRequest:withResult:]();
        }

        if ([v6 shouldProtectPersistenceForVideo])
        {
          id v12 = [(CAMPersistenceController *)self _protectionController];
          [v12 stopProtectingPersistenceForRequest:v6];
        }
        uint64_t v13 = [v7 coordinationInfo];
        uint64_t v14 = (void *)v13;
        if (v9 == 2 && v13) {
          [(CAMPersistenceController *)self _coordinateRemotePersistenceForVideoLocalResult:0 coordinationInfo:v13 request:v6];
        }
      }
      else
      {
        uint64_t v14 = [v7 coordinationInfo];
        uint64_t v15 = [(CAMPersistenceController *)self _videoLocalPowerAssertionReasonForCoordinationInfo:v14];
        uint64_t v16 = [(CAMPersistenceController *)self _powerController];
        uint64_t v17 = [v6 assertionIdentifier];
        [v16 addAssertionForIndentifier:v17 withReason:v15];
        if ([(CAMPersistenceController *)self resultDelegateRespondsToDidCompleteAllLocalPersistenceForRequest])
        {
          int v18 = [v6 persistenceUUID];
          uint64_t v19 = [(CAMPersistenceController *)self _ensureCoordinationGroupForIdentifier:v18];

          if (v19) {
            dispatch_group_enter(v19);
          }
        }
        else
        {
          uint64_t v19 = 0;
        }
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke;
        aBlock[3] = &unk_263FA3C38;
        int v30 = v17;
        int v31 = v15;
        id v28 = v16;
        CFAbsoluteTime v29 = v19;
        __int16 v20 = v19;
        id v21 = v16;
        __int16 v22 = _Block_copy(aBlock);
        double v23 = [(CAMPersistenceController *)self _localPersistenceQueue];
        id v25 = v6;
        id v26 = v7;
        id v24 = v22;
        pl_dispatch_async();
      }
    }
  }
}

void __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 48) withReason:*(unsigned int *)(a1 + 52)];
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
  }
}

void __73__CAMPersistenceController__handleVideoPersistenceForRequest_withResult___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deferredPersistenceOptions])
  {
    id v7 = [[CAMPendingLocalPersistenceWrapper alloc] initWithRequest:*(void *)(a1 + 32) result:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
    id v6 = [*(id *)(a1 + 48) _pendingLocalPersistenceWrappers];
    [v6 addObject:v7];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    [v4 _locallyPersistVideoCaptureResult:v2 forRequest:v3 withCompletionHandler:v5];
  }
}

- (void)videoPersistenceCoordinator:(id)a3 requestsRemotePersistenceForLocalPersistenceResult:(id)a4 captureRequest:(id)a5 powerAssertionReason:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [a3 loggingIdentifier];
  [(CAMPersistenceController *)self _dispatchRemotePersistenceForLocalVideoPersistenceResult:v11 request:v10 powerAssertionReason:v6 loggingIdentifier:v12];
}

- (void)videoPersistenceCoordinator:(id)a3 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:(id)a4 request:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_time(0, 10000000000);
  uint64_t v9 = [(CAMPersistenceController *)self _localPersistenceQueue];
  id v12 = v8;
  id v10 = v8;
  id v11 = v7;
  pl_dispatch_after();
}

void __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _coordinationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2;
  block[3] = &unk_263FA0CD0;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_barrier_sync(v2, block);
}

void __136__CAMPersistenceController_videoPersistenceCoordinator_requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo_request___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_videoPersistenceCoordinators");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [v4 objectForKeyedSubscript:v2];
  [v3 updateForTimeoutTimerFiredForCoordinationInfo:*(void *)(a1 + 40) request:*(void *)(a1 + 48)];
}

- (void)_notifyDelegateOfCompletedVideoLocalPersistenceForRequest:(id)a3 withResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 localPersistenceUUID];
  uint64_t v8 = [v5 sessionIdentifier];
  int v31 = [v6 localDestinationURL];
  uint64_t v9 = [v6 creationDate];
  long long v38 = 0uLL;
  uint64_t v39 = 0;
  if (v6) {
    [v6 duration];
  }
  int v30 = [v6 stillPersistenceUUID];
  long long v36 = 0uLL;
  uint64_t v37 = 0;
  if (v6) {
    [v6 stillDisplayTime];
  }
  uint64_t v10 = [v5 type];
  +[CAMOrientationUtilities imageOrientationForVideoRequest:v5];
  uint64_t v11 = PLExifOrientationFromImageOrientation();
  if (v10)
  {
    [v6 dimensions];
    CAMSizeForDimensions();
  }
  else
  {
    id v14 = v5;
    uint64_t v15 = [v6 dimensions];
    uint64_t v16 = [v14 aspectRatioCrop];

    +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:v15 orientation:v11 aspectRatio:v16];
  }
  double v17 = v12;
  double v18 = v13;
  uint64_t v19 = [CAMVideoPersistenceResponse alloc];
  uint64_t v20 = [v5 captureMode];
  id v21 = [v6 coordinationInfo];
  long long v34 = v38;
  uint64_t v35 = v39;
  long long v32 = v36;
  uint64_t v33 = v37;
  uint64_t v22 = v20;
  double v23 = (void *)v9;
  id v24 = -[CAMVideoPersistenceResponse initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:](v19, "initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:", v7, v22, v8, v31, v9, 0, v17, v18, &v34, v30, &v32, v21);

  if (v10 == 1)
  {
    id v29 = v5;
    id v26 = [v29 delegate];
    if (!v26 || (objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_17;
    }
    id v27 = v7;
    id v28 = [v6 error];
    [v26 videoRequestDidCompleteLocalPersistence:v29 withResponse:v24 error:v28];
    goto LABEL_16;
  }
  if (!v10)
  {
    id v25 = v5;
    id v26 = [v25 delegate];
    if (!v26 || (objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_17;
    }
    id v27 = v7;
    id v28 = [v6 error];
    [v26 stillImageRequestDidCompleteVideoLocalPersistence:v25 withResponse:v24 error:v28];
LABEL_16:

    id v7 = v27;
LABEL_17:
  }
}

- (void)_locallyPersistVideoCaptureResult:(id)a3 forRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 persistenceOptions];
  double v12 = [(CAMPersistenceController *)self _persistVideoCaptureResult:v8 withRequest:v9];
  double v13 = [v12 error];
  id v14 = [(CAMPersistenceController *)self resultDelegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 persistenceController:self didGenerateVideoLocalPersistenceResult:v12 forCaptureResult:v8 fromRequest:v9];
  }
  if (v11 == 2 && !v13)
  {
    uint64_t v15 = [v8 coordinationInfo];
    [(CAMPersistenceController *)self _coordinateRemotePersistenceForVideoLocalResult:v12 coordinationInfo:v15 request:v9];
  }
  uint64_t v19 = v9;
  uint64_t v20 = v10;
  id v16 = v10;
  id v17 = v12;
  id v18 = v9;
  pl_dispatch_async();
}

uint64_t __95__CAMPersistenceController__locallyPersistVideoCaptureResult_forRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfCompletedVideoLocalPersistenceForRequest:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_coordinateRemotePersistenceForVideoLocalResult:(id)a3 coordinationInfo:(id)a4 request:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CAMSignpostWithIDAndArgs(55, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  if (v9)
  {
    uint64_t v11 = [(CAMPersistenceController *)self _coordinationQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __101__CAMPersistenceController__coordinateRemotePersistenceForVideoLocalResult_coordinationInfo_request___block_invoke;
    v12[3] = &unk_263FA0A60;
    id v13 = v9;
    id v14 = self;
    id v15 = v8;
    id v16 = v10;
    dispatch_barrier_sync(v11, v12);
  }
  else if (v8)
  {
    [(CAMPersistenceController *)self _dispatchRemotePersistenceForLocalVideoPersistenceResult:v8 request:v10 powerAssertionReason:0x20000 loggingIdentifier:&stru_26BD78BA0];
  }
}

void __101__CAMPersistenceController__coordinateRemotePersistenceForVideoLocalResult_coordinationInfo_request___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_coordinationQueue_videoPersistenceCoordinators");
  uint64_t v3 = [v2 objectForKeyedSubscript:v4];
  if (!v3)
  {
    uint64_t v3 = [[CAMVideoPersistenceCoordinator alloc] initWithDelegate:*(void *)(a1 + 40) loggingIdentifier:v4];
    [v2 setObject:v3 forKeyedSubscript:v4];
  }
  [(CAMVideoPersistenceCoordinator *)v3 updateForCoordinationInfo:*(void *)(a1 + 32) localPersistenceResult:*(void *)(a1 + 48) request:*(void *)(a1 + 56)];
  if ([(CAMVideoPersistenceCoordinator *)v3 hasReceivedAllExpectedResponses]) {
    [v2 setObject:0 forKeyedSubscript:v4];
  }
}

- (void)_dispatchRemotePersistenceForLocalVideoPersistenceResult:(id)a3 request:(id)a4 powerAssertionReason:(unsigned int)a5 loggingIdentifier:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v11 assertionIdentifier];
  id v14 = [(CAMPersistenceController *)self _powerController];
  [v14 addAssertionForIndentifier:v13 withReason:v7];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke;
  aBlock[3] = &unk_263FA3B98;
  id v30 = v14;
  int v31 = v13;
  int v32 = v7;
  id v15 = v14;
  id v16 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2;
  v24[3] = &unk_263FA3C60;
  v24[4] = self;
  id v25 = v10;
  id v17 = v11;
  id v26 = v17;
  id v27 = v12;
  id v28 = v16;
  id v18 = v16;
  id v19 = v12;
  id v20 = v10;
  id v21 = _Block_copy(v24);
  if ([v17 shouldDelayRemotePersistence])
  {
    dispatch_time_t v22 = dispatch_time(0, 5000000000);
    double v23 = [(CAMPersistenceController *)self _remotePersistenceQueue];
    dispatch_after(v22, v23, v21);
  }
  else
  {
    double v23 = [(CAMPersistenceController *)self _remotePersistenceQueue];
    pl_dispatch_async();
  }
}

uint64_t __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 40) withReason:*(unsigned int *)(a1 + 44)];
}

void __132__CAMPersistenceController__dispatchRemotePersistenceForLocalVideoPersistenceResult_request_powerAssertionReason_loggingIdentifier___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _jobDictionaryForVideoLocalResult:*(void *)(a1 + 40) fromRequest:*(void *)(a1 + 48) loggingIdentifier:*(void *)(a1 + 56)];
  if (([*(id *)(a1 + 48) deferredPersistenceOptions] & 2) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) creationDate];
    uint64_t v3 = [[CAMPendingRemotePersistenceWrapper alloc] initWithRequest:*(void *)(a1 + 48) creationDate:v2 job:v5 loggingIdentifier:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
    id v4 = [*(id *)(a1 + 32) _pendingRemotePersistenceWrappers];
    [v4 addObject:v3];
  }
  else
  {
    [*(id *)(a1 + 32) _remotelyPersistVideoJob:v5 forRequest:*(void *)(a1 + 48) loggingIdentifier:*(void *)(a1 + 56) withSendHandler:0 completionHandler:*(void *)(a1 + 64)];
  }
}

+ (id)videoMetadataDateFormatter
{
  if (videoMetadataDateFormatter_onceToken != -1) {
    dispatch_once(&videoMetadataDateFormatter_onceToken, &__block_literal_global_30);
  }
  uint64_t v2 = (void *)videoMetadataDateFormatter_formatter;
  return v2;
}

uint64_t __54__CAMPersistenceController_videoMetadataDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)videoMetadataDateFormatter_formatter;
  videoMetadataDateFormatter_formatter = (uint64_t)v0;

  uint64_t v2 = (void *)videoMetadataDateFormatter_formatter;
  uint64_t v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  id v4 = (void *)videoMetadataDateFormatter_formatter;
  id v5 = objc_alloc(MEMORY[0x263EFF8F0]);
  id v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  [v4 setCalendar:v6];

  uint64_t v7 = (void *)videoMetadataDateFormatter_formatter;
  return [v7 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
}

+ (id)clientVideoMetadataForLocation:(id)a3 withCreationDate:(id)a4
{
  id v5 = a3;
  id v6 = (objc_class *)MEMORY[0x263EFF980];
  id v32 = a4;
  id v7 = objc_alloc_init(v6);
  id v8 = objc_msgSend(v5, "cam_videoMetadataRepresentation");
  id v9 = v8;
  id v10 = (uint64_t *)MEMORY[0x263EF9E78];
  if (v5 && v8 && [v8 length])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFA790]);
    [v11 setKeySpace:*v10];
    [v11 setKey:*MEMORY[0x263EF9DA8]];
    [v11 setValue:v9];
    [v7 addObject:v11];
    id v12 = objc_alloc_init(MEMORY[0x263EFA790]);
    [v12 setIdentifier:*MEMORY[0x263EF9E58]];
    uint64_t v13 = NSString;
    [v5 horizontalAccuracy];
    id v15 = objc_msgSend(v13, "stringWithFormat:", @"%f", v14);
    [v12 setValue:v15];

    [v7 addObject:v12];
  }
  long long v36 = v5;
  id v16 = objc_alloc_init(MEMORY[0x263EFA790]);
  uint64_t v17 = *v10;
  [v16 setKeySpace:*v10];
  [v16 setKey:*MEMORY[0x263EF9DB0]];
  [v16 setValue:@"Apple"];
  [v7 addObject:v16];
  id v18 = [MEMORY[0x263F82670] currentDevice];
  id v19 = (void *)MGCopyAnswer();
  uint64_t v35 = v9;
  int v31 = v19;
  if (v19)
  {
    id v20 = v19;
  }
  else
  {
    id v20 = [v18 localizedModel];
  }
  id v21 = v20;
  id v30 = v20;
  id v22 = objc_alloc_init(MEMORY[0x263EFA790]);
  [v22 setKeySpace:v17];
  [v22 setKey:*MEMORY[0x263EF9DB8]];
  [v22 setValue:v21];
  [v7 addObject:v22];
  double v23 = [v18 systemVersion];
  id v24 = objc_alloc_init(MEMORY[0x263EFA790]);
  [v24 setKeySpace:v17];
  [v24 setKey:*MEMORY[0x263EF9DC0]];
  [v24 setValue:v23];
  [v7 addObject:v24];
  [a1 videoMetadataDateFormatter];
  v25 = long long v34 = v18;
  id v26 = [v25 stringFromDate:v32];

  id v27 = objc_alloc_init(MEMORY[0x263EFA790]);
  [v27 setKeySpace:v17];
  [v27 setKey:*MEMORY[0x263EF9D98]];
  [v27 setValue:v26];
  [v7 addObject:v27];
  id v28 = (void *)[v7 copy];

  return v28;
}

+ (id)clientVideoMetadataForRequest:(id)a3 withCreationDate:(id)a4 isEV0ForHDR:(BOOL)a5 livePhotoIdentifierOverride:(id)a6 slomoPlayback:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  id v14 = a4;
  id v15 = [v12 location];
  id v16 = [a1 clientVideoMetadataForLocation:v15 withCreationDate:v14];

  uint64_t v17 = (void *)[v16 mutableCopy];
  unint64_t v18 = 0x263F08000;
  if ([v12 conformsToProtocol:&unk_26BE66520])
  {
    id v19 = v12;
    id v20 = v19;
    if (v13)
    {
      id v21 = v13;
    }
    else
    {
      id v21 = [v19 irisIdentifierForEV0:v9];
    }
    double v23 = v21;
    id v24 = objc_alloc_init(MEMORY[0x263EFA790]);
    uint64_t v22 = *MEMORY[0x263EF9E88];
    [v24 setKeySpace:*MEMORY[0x263EF9E88]];
    [v24 setKey:*MEMORY[0x263EF9F78]];
    [v24 setValue:v23];
    [v17 addObject:v24];
    if ([v20 irisMode] == 2)
    {
      BOOL v31 = v7;
      id v25 = objc_alloc_init(MEMORY[0x263EFA790]);
      [v25 setIdentifier:*MEMORY[0x263EF9E38]];
      [v25 setDataType:*MEMORY[0x263F00F80]];
      id v26 = [NSNumber numberWithUnsignedChar:1];
      [v25 setValue:v26];

      [v17 addObject:v25];
      BOOL v7 = v31;
    }

    unint64_t v18 = 0x263F08000uLL;
  }
  else
  {
    uint64_t v22 = *MEMORY[0x263EF9E88];
  }
  id v27 = objc_alloc_init(MEMORY[0x263EFA790]);
  [v27 setKeySpace:v22];
  [v27 setKey:*MEMORY[0x263EF9F80]];
  id v28 = [*(id *)(v18 + 2584) numberWithInt:!v7];
  [v27 setValue:v28];

  [v17 addObject:v27];
  id v29 = (void *)[v17 copy];

  return v29;
}

- (id)_videoPersistenceUUIDForRequest:(id)a3 withResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 persistenceUUID];
  if (![v5 type])
  {
    id v8 = v5;
    if ([v8 isCTMVideo])
    {
      uint64_t v9 = [v8 persistenceUUID];
    }
    else
    {
      uint64_t v10 = [v6 localDestinationURL];
      uint64_t v9 = objc_msgSend(v8, "irisVideoPersistenceUUIDForEV0:", objc_msgSend(v8, "isEV0LocalVideoDestinationURL:", v10));

      BOOL v7 = (void *)v10;
    }

    BOOL v7 = (void *)v9;
  }

  return v7;
}

- (id)_stillPersistenceUUIDForRequest:(id)a3 withVideoResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 persistenceUUID];
  if (![v5 type])
  {
    id v8 = v5;
    uint64_t v9 = [v6 localDestinationURL];
    uint64_t v10 = objc_msgSend(v8, "irisStillImagePersistenceUUIDForEV0:", objc_msgSend(v8, "isEV0LocalVideoDestinationURL:", v9));

    BOOL v7 = (void *)v10;
  }

  return v7;
}

- (id)_persistVideoCaptureResult:(id)a3 withRequest:(id)a4
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  CGFloat v81 = [v5 localDestinationURL];
  double v79 = [v5 filteredLocalDestinationURL];
  float v76 = [(CAMPersistenceController *)self _videoPersistenceUUIDForRequest:v6 withResult:v5];
  long long v99 = 0uLL;
  uint64_t v100 = 0;
  if (v5) {
    [v5 duration];
  }
  double v75 = [(CAMPersistenceController *)self _stillPersistenceUUIDForRequest:v6 withVideoResult:v5];
  long long v97 = 0uLL;
  uint64_t v98 = 0;
  if (v5) {
    [v5 stillDisplayTime];
  }
  float v74 = [v5 captureDate];
  uint64_t v73 = [v5 error];
  *(void *)&v72[4] = [v6 type];
  if (*(void *)&v72[4]) {
    v72[0] = 0;
  }
  else {
    *(void *)v72 = [v6 ctmCaptureType] != 2;
  }
  uint64_t v77 = [v6 captureMode];
  uint64_t v91 = 0;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x3032000000;
  uint64_t v94 = __Block_byref_object_copy__11;
  uint64_t v95 = __Block_byref_object_dispose__11;
  id v96 = 0;
  uint64_t v7 = [v5 videoPreviewPixelBuffer];
  uint64_t v8 = v7;
  if (v77 == 7 && v7)
  {
    uint64_t v9 = [v81 URLByDeletingPathExtension];
    uint64_t v10 = [v9 URLByAppendingPathExtension:*MEMORY[0x263F5DC00]];
    uint64_t v11 = [v10 path];
    id v12 = (void *)v92[5];
    v92[5] = v11;

    id v13 = (void *)[objc_alloc(MEMORY[0x263F5D9C8]) initWithVideoURL:v81];
    id v14 = (void *)MEMORY[0x263F5D618];
    id v15 = (void *)[MEMORY[0x263F5D618] newComposition];
    id v16 = (void *)[v14 newCompositionControllerWithComposition:v15];

    uint64_t v17 = [v13 source];
    [v16 setSource:v17 mediaType:2];

    unint64_t v18 = [v16 adjustmentConstants];
    id v19 = [v18 PIPortraitVideoAdjustmentKey];
    [v16 modifyAdjustmentWithKey:v19 modificationBlock:&__block_literal_global_255];

    LODWORD(v19) = +[CAMOrientationUtilities exifOrientationForVideoRequest:v6];
    id v20 = [v16 adjustmentConstants];
    id v21 = [v20 PIOrientationAdjustmentKey];
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_2;
    v89[3] = &__block_descriptor_36_e43_v16__0__PIOrientationAdjustmentController_8l;
    int v90 = (int)v19;
    [v16 modifyAdjustmentWithKey:v21 modificationBlock:v89];

    id v22 = objc_alloc_init(MEMORY[0x263F5D568]);
    id v23 = objc_alloc_init(MEMORY[0x263F5D578]);
    id v24 = (void *)[objc_alloc(MEMORY[0x263F58660]) initWithTargetPixelCount:2073600];
    [v23 setScalePolicy:v24];

    id v25 = (void *)[objc_alloc(MEMORY[0x263F58670]) initWithLevel:1];
    [v23 setPriority:v25];

    dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
    id v27 = [v16 composition];
    v86[0] = MEMORY[0x263EF8330];
    v86[1] = 3221225472;
    v86[2] = __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_3;
    v86[3] = &unk_263FA3CC8;
    CGFloat v88 = &v91;
    id v28 = v26;
    CGFloat v87 = v28;
    [v22 exportImageToDataWithComposition:v27 options:v23 completion:v86];

    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
LABEL_20:

    goto LABEL_21;
  }
  if (!v7) {
    goto LABEL_22;
  }
  id v29 = [v81 URLByDeletingPathExtension];
  id v30 = [v29 URLByAppendingPathExtension:*MEMORY[0x263F5DC00]];
  uint64_t v31 = [v30 path];
  id v32 = (void *)v92[5];
  v92[5] = v31;

  id v13 = [(CAMPersistenceController *)self _localPersistenceThumbnailGenerator];
  id v16 = objc_msgSend(v13, "newJPEGDataInOrientation:usingPixelBuffer:", +[CAMOrientationUtilities imageOrientationForVideoRequest:](CAMOrientationUtilities, "imageOrientationForVideoRequest:", v6), v8);
  if (![v16 length])
  {
    uint64_t v35 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = v92[5];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v38;
      uint64_t v37 = "Failed to create JPEG data for preview surface for %{public}@";
      goto LABEL_18;
    }
LABEL_19:

    id v22 = (id)v92[5];
    v92[5] = 0;
    goto LABEL_20;
  }
  CGImageWriteEXIFJPEGToPath();
  uint64_t v33 = [MEMORY[0x263F08850] defaultManager];
  char v34 = [v33 fileExistsAtPath:v92[5]];

  if ((v34 & 1) == 0)
  {
    uint64_t v35 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v92[5];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      uint64_t v37 = "Failed to write JPEG data for preview surface for %{public}@";
LABEL_18:
      _os_log_impl(&dword_2099F8000, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:
  if ([v6 temporaryPersistenceOptions] != 2)
  {
    float v78 = 0;
    char v42 = 0;
    goto LABEL_36;
  }
  uint64_t v39 = NSTemporaryDirectory();
  float v40 = [v81 lastPathComponent];
  double v41 = [v39 stringByAppendingPathComponent:v40];

  char v42 = [NSURL fileURLWithPath:v41];
  id v43 = [MEMORY[0x263F08850] defaultManager];
  id v85 = 0;
  char v44 = [v43 copyItemAtURL:v81 toURL:v42 error:&v85];
  id v71 = v85;

  if (v44)
  {
    if (!v79)
    {
      float v78 = 0;
      goto LABEL_35;
    }
    CGFloat v45 = [v79 lastPathComponent];
    __int16 v46 = [v39 stringByAppendingPathComponent:v45];
    float v78 = [NSURL fileURLWithPath:v46];
    int v47 = [MEMORY[0x263F08850] defaultManager];
    id v84 = 0;
    char v48 = [v47 copyItemAtURL:v79 toURL:v78 error:&v84];
    id v49 = v84;

    if ((v48 & 1) == 0)
    {
      __int16 v50 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v79;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2114;
        id v102 = v49;
        _os_log_error_impl(&dword_2099F8000, v50, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
      }

      float v78 = 0;
    }
  }
  else
  {
    __int16 v46 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v81;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2114;
      id v102 = v71;
      _os_log_error_impl(&dword_2099F8000, v46, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@, external clients will not have a safe URL (%{public}@)", buf, 0x20u);
    }
    float v78 = 0;
    CGFloat v45 = v42;
    char v42 = 0;
  }

LABEL_35:
LABEL_36:
  uint64_t v51 = [v6 captureMode];
  uint64_t v52 = [v6 captureMode];
  uint64_t v53 = [v6 captureMode];
  if (v77 == 7)
  {
    uint64_t v54 = [(CAMPersistenceController *)self _adjustmentsDataForCinematicVideoRequest:v6 result:v5];
  }
  else
  {
    if (*(void *)&v72[4] && v51 != 1 && v52 != 8 && v53 != 2)
    {
      uint64_t v55 = 0;
      goto LABEL_45;
    }
    uint64_t v54 = -[CAMPersistenceController _adjustmentsDataForRequest:captureDimensions:portraitMetadata:](self, "_adjustmentsDataForRequest:captureDimensions:portraitMetadata:", v6, [v5 dimensions], 0);
  }
  uint64_t v55 = (void *)v54;
LABEL_45:
  if ((v72[0] & 1) == 0)
  {
    uint64_t v56 = [MEMORY[0x263F5DB50] filesystemPersistenceBatchItemForFileAtURL:v81];
    uint64_t v57 = v56;
    if (v56)
    {
      if (v55) {
        [v56 setData:v55 forKey:*MEMORY[0x263F5DBB8]];
      }
      uint64_t v58 = v92[5];
      if (v58) {
        [v57 setString:v58 forKey:*MEMORY[0x263F5DBC0]];
      }
      [v57 persist];
    }
  }
  v59 = [v81 URLByDeletingPathExtension];
  uint64_t v60 = [v59 URLByAppendingPathExtension:@"MDATA"];

  uint64_t v61 = [v6 sharedLibraryMode];
  uint64_t v62 = [v6 contactIDsInProximity];
  char v63 = [v6 sharedLibraryDiagnostics];
  LOBYTE(v61) = [(CAMPersistenceController *)self writePrivateMetadataFileToURL:v60 withPrivateClientMetadata:0 sharedLibraryMode:v61 contactIDsInProximity:v62 sharedLibraryDiagnostics:v63];

  if ((v61 & 1) == 0)
  {

    uint64_t v60 = 0;
  }
  unint64_t v64 = [CAMVideoLocalPersistenceResult alloc];
  uint64_t v65 = v92[5];
  uint64_t v66 = [v5 dimensions];
  uint64_t v67 = [v5 metadata];
  id v68 = [v5 coordinationInfo];
  *(_OWORD *)buf = v99;
  *(void *)&buf[16] = v100;
  long long v82 = v97;
  uint64_t v83 = v98;
  v69 = -[CAMVideoLocalPersistenceResult initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:](v64, "initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:", v81, v79, v42, v78, v65, v76, buf, v66, v75, &v82, v67, v74, v55, v68, v60,
          v73);

  _Block_object_dispose(&v91, 8);
  return v69;
}

uint64_t __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:1];
}

uint64_t __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(int *)(a1 + 32)];
}

void __67__CAMPersistenceController__persistVideoCaptureResult_withRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v16 = 0;
  uint64_t v3 = [a2 result:&v16];
  id v4 = v16;
  id v5 = [v3 data];
  if ([v5 length]) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6)
  {
    uint64_t v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to create JPEG data for preview surface for %{public}@", buf, 0xCu);
    }

    uint64_t v9 = a1 + 40;
LABEL_12:
    uint64_t v14 = *(void *)(*(void *)v9 + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    goto LABEL_13;
  }
  uint64_t v9 = a1 + 40;
  CGImageWriteEXIFJPEGToPath();
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  if ((v11 & 1) == 0)
  {
    id v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)v9 + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v13;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Failed to write JPEG data for preview surface for %{public}@", buf, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)writePrivateMetadataFileToURL:(id)a3 withPrivateClientMetadata:(id)a4 sharedLibraryMode:(int64_t)a5 contactIDsInProximity:(id)a6 sharedLibraryDiagnostics:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = +[CAMUserPreferences preferences];
  int v16 = [v15 sharedLibraryEnabled];

  if (v12 || v16)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F5DEF0]) initWithPrivateClientMetadata:v12 contactIDsInProximity:v13 sharedLibraryMode:a5];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v14 count])
    {
      uint64_t v19 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = [v14 count];
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Internal only: Persisting shared library diagnostics: %lu entries.", buf, 0xCu);
      }

      [v18 setSharedLibraryDiagnostics:v14];
    }
    id v27 = 0;
    id v20 = [MEMORY[0x263F5DEF8] serializedDataFromCameraClientMetadata:v18 error:&v27];
    id v21 = v27;
    if (v21)
    {
      id v22 = v21;
      id v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CAMPersistenceController writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:]();
      }
    }
    else
    {
      id v26 = 0;
      char v24 = [v20 writeToURL:v11 options:0 error:&v26];
      id v22 = v26;
      if (v24)
      {
        BOOL v17 = 1;
LABEL_17:

        goto LABEL_18;
      }
      id v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v29 = (uint64_t)v12;
        __int16 v30 = 2114;
        id v31 = v11;
        __int16 v32 = 2114;
        id v33 = v22;
        _os_log_error_impl(&dword_2099F8000, v23, OS_LOG_TYPE_ERROR, "Failed to persist private metadata %{public}@ to URL %{public}@ (%{public}@)", buf, 0x20u);
      }
    }

    BOOL v17 = 0;
    goto LABEL_17;
  }
  BOOL v17 = 0;
LABEL_18:

  return v17;
}

- (id)_jobDictionaryForVideoLocalResult:(id)a3 fromRequest:(id)a4 loggingIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a5;
  id v11 = objc_alloc_init(v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v12 = [v8 isTimelapse];
    id v13 = (id *)MEMORY[0x263F5DCF0];
    if (!v12) {
      id v13 = (id *)MEMORY[0x263F5DCF8];
    }
  }
  else
  {
    int v12 = 0;
    id v13 = (id *)MEMORY[0x263F5DCF8];
  }
  id v77 = *v13;
  objc_msgSend(v11, "setObject:forKey:");
  [v11 setObject:v10 forKeyedSubscript:@"captureLogID"];

  float v76 = [v7 localDestinationURL];
  id v14 = [v76 path];
  uint64_t v72 = *MEMORY[0x263F5DDD0];
  objc_msgSend(v11, "setObject:forKey:", v14);
  id v15 = [v7 filteredLocalDestinationURL];
  int v16 = v15;
  if (v15)
  {
    BOOL v17 = [v15 path];
    [v11 setObject:v17 forKey:*MEMORY[0x263F5DCB0]];
    uint64_t v18 = (void *)MEMORY[0x263F08910];
    [MEMORY[0x263EFF910] date];
    v20 = uint64_t v19 = v14;
    id v21 = [v18 archivedDataWithRootObject:v20 requiringSecureCoding:1 error:0];

    id v22 = (void *)[objc_alloc(MEMORY[0x263F5DED8]) initWithFormatIdentifier:@"com.apple.opaque" formatVersion:@"1.0" data:v21 baseVersion:0 editorBundleID:@"com.apple.camera" renderTypes:0];
    id v23 = [v22 propertyListDictionary];
    [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x263F5DDC0]];

    id v14 = v19;
  }
  v69 = v16;
  uint64_t v24 = [v14 pathExtension];
  [v11 setObject:v24 forKey:*MEMORY[0x263F5DCA8]];
  float v74 = [v7 localPersistenceUUID];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");
  uint64_t v25 = [v7 creationDate];
  if (v25) {
    [v11 setObject:v25 forKey:*MEMORY[0x263F5DC88]];
  }
  float v78 = (void *)v25;
  uint64_t v26 = [MEMORY[0x263F5DB30] savedAssetTypeForCameraCapturedAsset];
  id v27 = [NSNumber numberWithShort:v26];
  [v11 setObject:v27 forKey:*MEMORY[0x263F5DDB0]];

  [v11 setObject:&unk_26BDDE4F0 forKey:*MEMORY[0x263F5DC20]];
  if (v12) {
    [v11 setObject:&unk_26BDDE508 forKey:*MEMORY[0x263F5DC18]];
  }
  uint64_t v28 = MEMORY[0x263EFFA88];
  [v11 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5DD88]];
  [v11 setObject:v28 forKey:*MEMORY[0x263F5DC10]];
  [v11 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F5DDA8]];
  unint64_t v29 = [v8 captureDevice];
  uint64_t v30 = (v29 > 0xB) | (0xFDu >> v29) & 1;
  id v31 = [NSNumber numberWithBool:v30];
  uint64_t v32 = *MEMORY[0x263F5DC70];
  [v11 setObject:v31 forKey:*MEMORY[0x263F5DC70]];

  memset(&v83, 0, sizeof(v83));
  if (v7) {
    [v7 duration];
  }
  CMTime time = v83;
  id v33 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  [v11 setObject:v33 forKey:@"kCAMVideoDurationKey"];

  uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "captureOrientation"));
  uint64_t v35 = NSDictionary;
  uint64_t v36 = [NSNumber numberWithBool:v30];
  uint64_t v67 = v72;
  uint64_t v73 = (void *)v34;
  uint64_t v37 = objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, v32, v78, *MEMORY[0x263F5DC88], v34, *MEMORY[0x263F5DD08], v14, v67, 0);

  id v71 = (void *)v37;
  [v11 setObject:v37 forKey:*MEMORY[0x263F5DCA0]];
  +[CAMOrientationUtilities imageOrientationForVideoRequest:v8];
  uint64_t v38 = PLExifOrientationFromImageOrientation();
  double v75 = (void *)v24;
  if ([v8 type])
  {
    [v7 dimensions];
    CAMSizeForDimensions();
  }
  else
  {
    id v41 = v8;
    char v42 = v14;
    uint64_t v43 = [v7 dimensions];
    uint64_t v44 = [v41 aspectRatioCrop];

    uint64_t v45 = v43;
    id v14 = v42;
    +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:v45 orientation:v38 aspectRatio:v44];
  }
  double v46 = v40;
  int v47 = v69;
  if (v39 > 0.0 && v40 > 0.0)
  {
    char v48 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v11 setObject:v48 forKeyedSubscript:*MEMORY[0x263F5DCC8]];

    id v49 = [NSNumber numberWithDouble:v46];
    [v11 setObject:v49 forKeyedSubscript:*MEMORY[0x263F5DCB8]];
  }
  __int16 v50 = [v7 filteredVideoPreviewPath];
  [v11 setObject:v50 forKeyedSubscript:*MEMORY[0x263F5DD38]];

  uint64_t v51 = [v8 captureMode];
  uint64_t v52 = [v8 captureMode];
  if (![v8 type] && (objc_msgSend(v8, "isCTMVideo") & 1) != 0) {
    goto LABEL_32;
  }
  if ([v8 conformsToProtocol:&unk_26BE66520])
  {
    v70 = v14;
    id v53 = v8;
    id v68 = [v7 localDestinationURL];
    uint64_t v54 = objc_msgSend(v53, "isEV0LocalVideoDestinationURL:");
    uint64_t v55 = [v53 irisStillImagePersistenceUUIDForEV0:v54];
    if (v55) {
      [v11 setObject:v55 forKey:*MEMORY[0x263F5DD40]];
    }
    uint64_t v56 = [v53 irisIdentifierForEV0:v54];
    if (v56) {
      [v11 setObject:v56 forKey:*MEMORY[0x263F5DD60]];
    }
    CFAllocatorRef v57 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CMTime time = v83;
    CFDictionaryRef v58 = CMTimeCopyAsDictionary(&time, v57);
    [v11 setObject:v58 forKey:*MEMORY[0x263F5DD70]];
    CFRelease(v58);
    memset(&time, 0, sizeof(time));
    if (v7) {
      [v7 stillDisplayTime];
    }
    CMTime v81 = time;
    CFDictionaryRef v59 = CMTimeCopyAsDictionary(&v81, v57);
    [v11 setObject:v59 forKey:*MEMORY[0x263F5DD68]];
    CFRelease(v59);
    BOOL v60 = [v53 irisMode] == 2;
    uint64_t v61 = [NSNumber numberWithBool:v60];
    [v11 setObject:v61 forKeyedSubscript:*MEMORY[0x263F5DD48]];

    uint64_t v62 = [v7 metadataItems];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __92__CAMPersistenceController__jobDictionaryForVideoLocalResult_fromRequest_loggingIdentifier___block_invoke;
    v79[3] = &unk_263FA3CF0;
    id v80 = v11;
    [v62 enumerateObjectsUsingBlock:v79];

    id v14 = v70;
    goto LABEL_33;
  }
  if (v51 == 7 || v52 == 2)
  {
LABEL_32:
    id v53 = [v7 adjustmentsData];
    [v11 setObject:v53 forKeyedSubscript:*MEMORY[0x263F5DC50]];
LABEL_33:
  }
  char v63 = [v7 localPrivateMetadataFileURL];
  unint64_t v64 = [v63 path];
  [v11 setObject:v64 forKeyedSubscript:*MEMORY[0x263F5DC78]];

  id v65 = v11;
  return v65;
}

void __92__CAMPersistenceController__jobDictionaryForVideoLocalResult_fromRequest_loggingIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  BOOL v6 = [v9 identifier];
  int v7 = [v6 isEqualToString:*MEMORY[0x263EF9E50]];

  if (v7)
  {
    id v8 = [v9 value];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:*MEMORY[0x263F5DD58]];

    *a4 = 1;
  }
}

- (void)_notifyDelegateOfCompletedVideoRemotePersistenceForRequest:(id)a3 withReply:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 objectForKey:@"kCAMVideoDurationKey"];
  [v10 doubleValue];
  Float64 v12 = v11;

  memset(&v41, 0, sizeof(v41));
  CMTimeMakeWithSeconds(&v41, v12, 600);
  id v13 = [v8 objectForKey:*MEMORY[0x263F5DD40]];
  CFDictionaryRef v14 = [v8 objectForKey:*MEMORY[0x263F5DD68]];
  memset(&v40, 0, sizeof(v40));
  CMTimeMakeFromDictionary(&v40, v14);
  id v15 = [v8 objectForKey:*MEMORY[0x263F5DC80]];
  uint64_t v16 = [v7 sessionIdentifier];
  BOOL v17 = [v8 objectForKey:*MEMORY[0x263F5DDC8]];
  CFDictionaryRef v37 = v14;
  if (v17)
  {
    uint64_t v18 = [NSURL fileURLWithPath:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [v8 objectForKey:*MEMORY[0x263F5DC88]];
  id v20 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5DCC8]];
  [v20 doubleValue];
  double v22 = v21;

  id v23 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5DCB8]];
  [v23 doubleValue];
  double v25 = v24;

  uint64_t v26 = [CAMVideoPersistenceResponse alloc];
  uint64_t v27 = [v7 captureMode];
  CMTime v39 = v41;
  CMTime v38 = v40;
  uint64_t v28 = -[CAMVideoPersistenceResponse initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:](v26, "initWithUUID:captureMode:captureSession:url:creationDate:scrubberImage:finalExpectedPixelSize:duration:stillPersistenceUUID:stillDisplayTime:coordinationInfo:", v15, v27, v16, v18, v19, 0, v22, v25, &v39, v13, &v38, 0);
  uint64_t v29 = [v7 type];
  if (v29 == 1)
  {
    uint64_t v36 = v13;
    id v30 = v9;
    id v34 = v7;
    uint64_t v32 = [v34 delegate];
    if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v35 = v34;
      id v9 = v30;
      [v32 videoRequestDidCompleteRemotePersistence:v35 withResponse:v28 error:v30];
      goto LABEL_13;
    }
LABEL_12:
    id v9 = v30;
    goto LABEL_13;
  }
  if (!v29)
  {
    uint64_t v36 = v13;
    id v30 = v9;
    id v31 = v7;
    uint64_t v32 = [v31 delegate];
    if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v33 = v31;
      id v9 = v30;
      [v32 stillImageRequestDidCompleteVideoRemotePersistence:v33 withResponse:v28 error:v30];
LABEL_13:
      id v13 = v36;

      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (void)_handleCompletedVideoJobForRequest:(id)a3 withReply:(id)a4 completionHandler:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    CFDictionaryRef v14 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CAMPersistenceController _handleCompletedVideoJobForRequest:withReply:completionHandler:error:]();
    }
  }
  id v15 = v10;
  id v20 = v11;
  double v21 = v13;
  double v22 = v12;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  pl_dispatch_async();
  if ([v15 shouldProtectPersistenceForVideo])
  {
    uint64_t v19 = [(CAMPersistenceController *)self _protectionController];
    [v19 stopProtectingPersistenceForRequest:v15];
  }
  CAMSignpostWithIDAndArgs(56, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
}

uint64_t __97__CAMPersistenceController__handleCompletedVideoJobForRequest_withReply_completionHandler_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyDelegateOfCompletedVideoRemotePersistenceForRequest:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_remotelyPersistVideoJob:(id)a3 forRequest:(id)a4 loggingIdentifier:(id)a5 withSendHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(void))a6;
  id v16 = a7;
  id v17 = [v12 objectForKeyedSubscript:*MEMORY[0x263F5DD40]];
  id v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [v12 objectForKeyedSubscript:*MEMORY[0x263F5DC80]];
  }
  id v20 = v19;

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v22 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
  id v23 = [v22 resourceClient];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __116__CAMPersistenceController__remotelyPersistVideoJob_forRequest_loggingIdentifier_withSendHandler_completionHandler___block_invoke;
  v28[3] = &unk_263FA3C10;
  CFAbsoluteTime v34 = Current;
  id v29 = v14;
  id v30 = v20;
  id v31 = self;
  id v32 = v13;
  id v33 = v16;
  id v24 = v16;
  id v25 = v13;
  id v26 = v20;
  id v27 = v14;
  [v23 saveAssetWithJobDictionary:v12 imageSurface:0 previewImageSurface:0 completionHandler:v28];

  if (v15) {
    v15[2](v15);
  }
}

void __116__CAMPersistenceController__remotelyPersistVideoJob_forRequest_loggingIdentifier_withSendHandler_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (a2)
  {
    double v10 = Current;
    double v11 = *(double *)(a1 + 72);
    id v12 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5DDC8]];
    id v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      int v18 = 138544130;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      id v23 = v12;
      __int16 v24 = 2048;
      double v25 = v10 - v11;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added video to library as %{public}@ %{public}@ (took %.3f seconds)", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    id v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: error adding video to library %{public}@: %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }

  [*(id *)(a1 + 48) _handleCompletedVideoJobForRequest:*(void *)(a1 + 56) withReply:v7 completionHandler:*(void *)(a1 + 64) error:v8];
}

- (void)performDeferredRemotePersistenceWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPersistenceController *)self _remotePersistenceQueue];
  id v6 = v4;
  pl_dispatch_async();
}

void __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke(uint64_t a1)
{
  context = (void *)MEMORY[0x21050BCA0]();
  uint64_t v24 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) _pendingRemotePersistenceWrappers];
  [v2 sortUsingComparator:&__block_literal_global_293_0];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v2 objectAtIndex:v4];
      id v6 = [v5 request];
      id v7 = [v5 creationDate];
      id v8 = [v5 job];
      id v9 = [v5 loggingIdentifier];
      double v10 = [v5 completionHandler];
      [v3 addObject:v8];
      double v11 = [[CAMPendingRemotePersistenceWrapper alloc] initWithRequest:v6 creationDate:v7 job:0 loggingIdentifier:v9 completionHandler:v10];

      [v2 replaceObjectAtIndex:v4 withObject:v11];
      ++v4;
    }
    while (v4 < [v2 count]);
  }
  id v12 = (void *)[v2 copy];
  [v2 removeAllObjects];
  id v13 = [v3 firstObject];
  uint64_t v14 = [v3 count];
  uint64_t v15 = *MEMORY[0x263F5DC60];
  if (v14 == 1)
  {
    [v13 removeObjectForKey:v15];
    [v13 removeObjectForKey:*MEMORY[0x263F5DC58]];
    [v13 removeObjectForKey:*MEMORY[0x263F5DC68]];
  }
  else
  {
    uint64_t v16 = [v13 objectForKey:v15];

    if (v16)
    {
      [v13 setObject:&unk_26BDDE520 forKey:*MEMORY[0x263F5DC58]];
      [v13 setObject:&unk_26BDDE4A8 forKey:*MEMORY[0x263F5DC68]];
    }
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  int v18 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
  uint64_t v19 = [v18 resourceInternalClient];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_296;
  v25[3] = &unk_263FA3D38;
  CFAbsoluteTime v29 = Current;
  id v20 = v12;
  uint64_t v28 = v30;
  uint64_t v21 = *(void *)(v24 + 32);
  id v26 = v20;
  uint64_t v27 = v21;
  [v19 batchSaveAssetsWithJobDictionaries:v3 completionHandler:v25];

  [v18 waitUntilConnectionSendsAllMessages];
  uint64_t v22 = *(void *)(v24 + 40);
  if (v22) {
    (*(void (**)(uint64_t, void))(v22 + 16))(v22, 0);
  }

  _Block_object_dispose(v30, 8);
}

uint64_t __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __82__CAMPersistenceController_performDeferredRemotePersistenceWithCompletionHandler___block_invoke_296(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  double v9 = *(double *)(a1 + 56);
  double v10 = os_log_create("com.apple.camera", "Camera");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  CMTime v39 = v7;
  if (v7)
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    double v46 = *(double *)&v7;
    id v12 = "PersistenceController: received error for batch job: %{public}@";
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134217984;
    double v46 = Current - v9;
    id v12 = "PersistenceController: received reply for batch job after %.3f seconds.";
  }
  _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
LABEL_7:

  uint64_t v35 = [v6 count];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v40 = *(void *)v42;
    uint64_t v34 = *MEMORY[0x263F5DD40];
    uint64_t v37 = *MEMORY[0x263F5DC80];
    uint64_t v33 = *MEMORY[0x263F5DDC8];
    uint64_t v32 = *MEMORY[0x263F5DCC0];
    *(void *)&long long v14 = 138543874;
    long long v31 = v14;
    do
    {
      uint64_t v16 = 0;
      uint64_t v36 = v15;
      do
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
        int v18 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v31);
        uint64_t v19 = [v18 request];
        uint64_t v20 = [v19 type];
        uint64_t v21 = [v18 completionHandler];
        if (v20 == 1)
        {
          id v26 = [v17 objectForKeyedSubscript:v34];
          uint64_t v27 = v26;
          if (v26)
          {
            id v28 = v26;
          }
          else
          {
            id v28 = [v17 objectForKeyedSubscript:v37];
          }
          uint64_t v22 = v28;

          id v23 = [v17 objectForKeyedSubscript:v33];
          CFAbsoluteTime v29 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [v18 loggingIdentifier];
            *(_DWORD *)buf = v31;
            double v46 = *(double *)&v30;
            __int16 v47 = 2114;
            char v48 = v22;
            __int16 v49 = 2114;
            __int16 v50 = v23;
            _os_log_impl(&dword_2099F8000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added video to library as %{public}@ %{public}@", buf, 0x20u);

            uint64_t v15 = v36;
          }

          [*(id *)(a1 + 40) _handleCompletedVideoJobForRequest:v19 withReply:v17 completionHandler:v21 error:v39];
        }
        else
        {
          if (v20) {
            goto LABEL_24;
          }
          uint64_t v22 = [v17 objectForKeyedSubscript:v37];
          id v23 = [v17 objectForKeyedSubscript:v32];
          uint64_t v24 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            double v25 = [v18 loggingIdentifier];
            *(_DWORD *)buf = v31;
            double v46 = *(double *)&v25;
            __int16 v47 = 2114;
            char v48 = v22;
            __int16 v49 = 2114;
            __int16 v50 = v23;
            _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ PersistenceController: added photo to library as %{public}@ %{public}@", buf, 0x20u);

            uint64_t v15 = v36;
          }

          [*(id *)(a1 + 40) _handleCompletedStillImageJobForRequest:v19 withReply:v17 fromBatchOfSize:v35 completionHandler:v21 error:v39];
        }

LABEL_24:
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

        ++v16;
      }
      while (v15 != v16);
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v15);
  }
}

- (id)_ensureCoordinationGroupForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  id v5 = [(CAMPersistenceController *)self _coordinationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CAMPersistenceController__ensureCoordinationGroupForIdentifier___block_invoke;
  block[3] = &unk_263FA3D60;
  id v10 = v4;
  BOOL v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__CAMPersistenceController__ensureCoordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _coordinationQueueGroupsByIdentifier];
  uint64_t v2 = [v8 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    dispatch_group_t v5 = dispatch_group_create();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [v8 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];
  }
}

- (id)_coordinationGroupForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  dispatch_group_t v5 = [(CAMPersistenceController *)self _coordinationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CAMPersistenceController__coordinationGroupForIdentifier___block_invoke;
  block[3] = &unk_263FA3D60;
  id v10 = v4;
  BOOL v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__CAMPersistenceController__coordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _coordinationQueueGroupsByIdentifier];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_removeCoordinationGroupForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPersistenceController *)self _coordinationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CAMPersistenceController__removeCoordinationGroupForIdentifier___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __66__CAMPersistenceController__removeCoordinationGroupForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _coordinationQueueGroupsByIdentifier];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)persistBurstWithIdentifier:(id)a3 result:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(CAMPersistenceController *)self _powerController];
  objc_msgSend(v11, "addAssertionForIndentifier:withReason:", objc_msgSend(v11, "generateAssertionIdentifier"), 0x200000);
  uint64_t v12 = [(CAMPersistenceController *)self _remotePersistenceQueue];
  id v17 = v8;
  int v18 = v9;
  uint64_t v19 = v11;
  uint64_t v20 = v10;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  pl_dispatch_async();
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) allAssetIdentifiers];
    uint64_t v3 = [v2 count];

    if (v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v4 setObject:*MEMORY[0x263F5DCE0] forKey:*MEMORY[0x263F5DCD8]];
      [v4 setObject:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F5DDA8]];
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        [v4 setObject:v5 forKey:*MEMORY[0x263F5DC98]];
      }
      else
      {
        id v6 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_3();
        }
      }
      id v7 = [*(id *)(a1 + 40) allAssetIdentifiers];
      if (v7)
      {
        [v4 setObject:v7 forKey:*MEMORY[0x263F5DC38]];
      }
      else
      {
        id v8 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_2();
        }
      }
      id v9 = [*(id *)(a1 + 40) goodAssetIdentifiers];
      if (v9)
      {
        [v4 setObject:v9 forKey:*MEMORY[0x263F5DC40]];
      }
      else
      {
        id v10 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_1();
        }
      }
      BOOL v11 = [*(id *)(a1 + 40) bestAssetIdentifier];
      if (v11)
      {
        [v4 setObject:v11 forKey:*MEMORY[0x263F5DC48]];
      }
      else
      {
        uint64_t v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Missing best asset identifier while preparing burst analysis results for assetsd! The stack asset won't be ideal.", buf, 2u);
        }
      }
      id v13 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
      id v14 = [v13 resourceClient];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_298;
      v15[3] = &unk_263FA3D88;
      id v17 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 48);
      int v18 = *(_DWORD *)(a1 + 64);
      [v14 saveAssetWithJobDictionary:v4 imageSurface:0 previewImageSurface:0 completionHandler:v15];
    }
  }
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_298(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_298_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
  [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 48) withReason:0x200000];
}

- (void)persistPlaceholderTimelapseVideoWithResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 assetUUID];
  if (v8)
  {
    id v9 = [(CAMPersistenceController *)self _powerController];
    objc_msgSend(v9, "addAssertionForIndentifier:withReason:", objc_msgSend(v9, "generateAssertionIdentifier"), 0x400000);
    uint64_t v10 = [(CAMPersistenceController *)self _remotePersistenceQueue];
    id v12 = v6;
    id v13 = v7;
    id v11 = v9;
    pl_dispatch_async();
  }
}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _jobDictionaryForTimelapsePlaceholderResult:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 40) previewImageSurface];
  id v4 = [MEMORY[0x263F5DB40] sharedSystemLibraryAssetsdClient];
  uint64_t v5 = [v4 resourceClient];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2;
  v6[3] = &unk_263FA3D88;
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  int v9 = *(_DWORD *)(a1 + 64);
  [v5 saveAssetWithJobDictionary:v2 imageSurface:0 previewImageSurface:v3 completionHandler:v6];
}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    int v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
  }
  [*(id *)(a1 + 32) removeAssertionForIdentifier:*(unsigned int *)(a1 + 48) withReason:0x400000];
}

- (id)_jobDictionaryForTimelapsePlaceholderResult:(id)a3
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v4 setObject:*MEMORY[0x263F5DD00] forKey:*MEMORY[0x263F5DCD8]];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(MEMORY[0x263F5DB30], "savedAssetTypeForCameraCapturedAsset"));
  [v4 setObject:v5 forKey:*MEMORY[0x263F5DDB0]];

  [v4 setObject:&unk_26BDDE4F0 forKey:*MEMORY[0x263F5DC20]];
  [v4 setObject:&unk_26BDDE508 forKey:*MEMORY[0x263F5DC18]];
  id v6 = [v3 assetUUID];
  [v4 setObject:v6 forKey:*MEMORY[0x263F5DC80]];

  id v7 = [v3 creationDate];
  [v4 setObject:v7 forKey:*MEMORY[0x263F5DC88]];

  uint64_t v8 = MEMORY[0x263EFFA88];
  [v4 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5DD88]];
  [v4 setObject:v8 forKey:*MEMORY[0x263F5DC10]];
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F5DDA8]];
  [v3 videoDimensions];
  unint64_t v11 = (unint64_t)v10;
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:(unint64_t)v9];
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F5DD98]];

  id v13 = [NSNumber numberWithUnsignedInteger:v11];
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x263F5DD90]];

  unint64_t v14 = [v3 captureDevice];
  LODWORD(v12) = (v14 > 0xB) | (0xFDu >> v14);
  uint64_t v15 = [v3 captureOrientation];
  v22[0] = *MEMORY[0x263F5DC70];
  id v16 = [NSNumber numberWithBool:v12 & 1];
  v23[0] = v16;
  v22[1] = *MEMORY[0x263F5DD08];
  id v17 = [NSNumber numberWithInteger:v15];
  v23[1] = v17;
  int v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  [v4 setObject:v18 forKey:*MEMORY[0x263F5DCA0]];
  uint64_t v19 = [v3 localPrivateMetadataFileURL];
  uint64_t v20 = [v19 path];
  [v4 setObject:v20 forKeyedSubscript:*MEMORY[0x263F5DC78]];

  return v4;
}

+ (id)uniqueIncomingPathForAssetWithUUID:(id)a3 captureTime:(double)a4 extension:(id)a5
{
  return (id)[a1 uniquePathForAssetWithUUID:a3 captureTime:a5 extension:1 usingIncomingDirectory:a4];
}

- (void)emptyLocalPersistenceStorageWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(CAMPersistenceController *)self _localPersistenceQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke;
  v9[3] = &unk_263FA08C0;
  double v11 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__11;
  uint64_t v36 = __Block_byref_object_dispose__11;
  id v37 = 0;
  uint64_t v21 = NSTemporaryDirectory();
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if ([v2 fileExistsAtPath:v21])
  {
    uint64_t v3 = [NSURL URLWithString:v21];
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    CFAbsoluteTime v29 = __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2;
    id v30 = &unk_263FA3DD8;
    long long v31 = &v32;
    uint64_t v20 = (void *)v3;
    id v4 = objc_msgSend(v2, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
    double Current = CFAbsoluteTimeGetCurrent();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (CFAbsoluteTimeGetCurrent() - Current > *(double *)(a1 + 40))
          {
            int v18 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "Timed out deleting local persistence items", buf, 2u);
            }

            goto LABEL_19;
          }
          double v11 = (id *)(v33 + 5);
          id obj = (id)v33[5];
          int v12 = [v2 removeItemAtURL:v10 error:&obj];
          objc_storeStrong(v11, obj);
          id v13 = os_log_create("com.apple.camera", "Camera");
          unint64_t v14 = v13;
          if (v12)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = [v10 path];
              *(_DWORD *)buf = 138543362;
              CMTime v39 = v15;
              _os_log_impl(&dword_2099F8000, v14, OS_LOG_TYPE_DEFAULT, "Deleted local persistence item at %{public}@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v16 = [v10 path];
            uint64_t v17 = v33[5];
            *(_DWORD *)buf = 138543618;
            CMTime v39 = v16;
            __int16 v40 = 2114;
            uint64_t v41 = v17;
            _os_log_error_impl(&dword_2099F8000, v14, OS_LOG_TYPE_ERROR, "Failed to delete local persistence item at %{public}@: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v42 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_19:
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (v19) {
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v33[5]);
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  double v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  return 1;
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (NSMapTable)_coordinationQueueGroupsByIdentifier
{
  return self->__coordinationQueueGroupsByIdentifier;
}

- (NSMutableDictionary)_coordinationQueue_stillImagePersistenceCoordinators
{
  return self->__coordinationQueue_stillImagePersistenceCoordinators;
}

- (NSMutableDictionary)_coordinationQueue_videoPersistenceCoordinators
{
  return self->__coordinationQueue_videoPersistenceCoordinators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__coordinationQueue_videoPersistenceCoordinators, 0);
  objc_storeStrong((id *)&self->__coordinationQueue_stillImagePersistenceCoordinators, 0);
  objc_storeStrong((id *)&self->__coordinationQueueGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->__coordinationQueue, 0);
  objc_storeStrong((id *)&self->__resultDelegateIsolationQueue, 0);
  objc_storeStrong((id *)&self->__irisVideoController, 0);
  objc_storeStrong((id *)&self->__burstController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__remotePersistenceThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__localPersistenceThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__remotePersistenceQueue, 0);
  objc_storeStrong((id *)&self->__localPersistenceQueue, 0);
  objc_destroyWeak((id *)&self->_resultDelegate);
  objc_storeStrong((id *)&self->_pendingRemotePersistenceWrappers, 0);
  objc_storeStrong((id *)&self->_pendingLocalPersistenceWrappers, 0);
}

- (void)_handleStillImagePersistenceForRequest:withResult:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Persistence cannot continue due to a capture error. (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to serialize filters %{public}@: %{public}@");
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to persist adjustmentsDictionary %{public}@ to URL %{public}@");
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to persist timelapse vis metadata to URL %{public}@ (%{public}@)");
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to persist diagnostics to URL %{public}@", v2, v3, v4, v5, v6);
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to remove file from persistence failure: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Local persistence was attempted with invalid or missing JPEG data. We just lost someone's memories. (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Invalid localDestinationURL during local persistence %{public}@", v2, v3, v4, v5, v6);
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to create directory hierarchy for localDestinationPath %{public}@ (%{public}@)");
}

- (void)_persistStillImageCaptureSurfaceResult:withRequest:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot physically rotate non-JPEG fullsize image because destination path is already specified by client", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to physically rotate JPEG or HEIF data (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to close container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to get dictionary representation for rotated matte data", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to add matte to container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to add depth to container for rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to encode the rotated image as JPEG (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to create container for rotated pixel buffer (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_physicallyRotatedJPEGDataFromCapturePhoto:.cold.8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to create compression session for rotated pixel buffer (status=%d)", v2, v3, v4, v5, v6);
}

- (void)_adjustmentsDataForRequest:(double)a3 captureDimensions:(double)a4 portraitMetadata:(double)a5 .cold.1(unint64_t a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a1 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = off_263FA3DF8[a1 - 1];
  }
  uint64_t v8 = NSStringFromCGRect(*(CGRect *)&a3);
  int v9 = 138543618;
  id v10 = v7;
  __int16 v11 = 2114;
  int v12 = v8;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Could not calculate a crop rect for aspect: %{public}@; photo bounds: %{public}@",
    (uint8_t *)&v9,
    0x16u);
}

- (void)writePrivateMetadataFileToURL:withPrivateClientMetadata:sharedLibraryMode:contactIDsInProximity:sharedLibraryDiagnostics:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Unable to encode private metadata object %{public}@ for persistence with error %{public}@");
}

- (void)_handleCompletedVideoJobForRequest:withReply:completionHandler:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to remotely persist video! (%{public}@)", v2, v3, v4, v5, v6);
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Error preparing burst analysis results for assetsd: missing good asset identifiers!", v2, v3, v4, v5, v6);
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Error preparing burst analysis results for assetsd: missing all asset identifiers!", v2, v3, v4, v5, v6);
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Error preparing burst analysis results for assetsd: missing burst identifier!", v2, v3, v4, v5, v6);
}

void __80__CAMPersistenceController_persistBurstWithIdentifier_result_completionHandler___block_invoke_298_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Sending burst analysis results to assetsd failed with error %{public}@", v2, v3, v4, v5, v6);
}

void __89__CAMPersistenceController_persistPlaceholderTimelapseVideoWithResult_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Sending placeholder timelapse asset to assetsd failed with error %{public}@", v2, v3, v4, v5, v6);
}

+ (void)uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Failed to recreate missing NSTemporaryDirectory at %{public}@ (%{public}@)");
}

void __86__CAMPersistenceController_emptyLocalPersistenceStorageWithTimeout_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Could not iterate over local persistence item %{public}@: %{public}@");
}

@end