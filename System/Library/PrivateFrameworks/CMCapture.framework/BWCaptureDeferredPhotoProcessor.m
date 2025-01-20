@interface BWCaptureDeferredPhotoProcessor
- (BWCaptureDeferredPhotoProcessor)initWithFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3;
- (void)_prepareToTerminateImmediatelyDueToError:(int)a3;
- (void)dealloc;
- (void)job:(id)a3 completedWithSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)job:(id)a3 failedWithError:(int)a4;
- (void)request:(id)a3 failedWithError:(int)a4;
@end

@implementation BWCaptureDeferredPhotoProcessor

- (BWCaptureDeferredPhotoProcessor)initWithFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWCaptureDeferredPhotoProcessor;
  v4 = [(BWCaptureDeferredPhotoProcessor *)&v6 init];
  if (v4) {
    v4->_weakDeferredPhotoProcessorReference = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCaptureDeferredPhotoProcessor;
  [(BWCaptureDeferredPhotoProcessor *)&v3 dealloc];
}

- (void)request:(id)a3 failedWithError:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v20[28] = *MEMORY[0x1E4F143B8];
  id v6 = [(FigWeakReference *)self->_weakDeferredPhotoProcessorReference referencedObject];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v8 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (dword_1EB4C4F10)
      {
        int v17 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "container", v13, v14), "abortingProcessingDueToError:", v4);
      v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        uint64_t v10 = kdebug_trace();
      }
      v12 = (void *)MEMORY[0x1A6272C70](v10);
      if (![a3 parent])
      {
        v19[0] = @"CaptureRequestIdentifier";
        v20[0] = [a3 captureRequestIdentifier];
        v19[1] = @"PhotoIdentifiers";
        uint64_t v18 = [a3 photoIdentifier];
        v20[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        v19[2] = @"ErrorStatus";
        v20[2] = [NSNumber numberWithInt:v4];
        captureDeferredPhotoProcessor_sendXPCNotificationWithPayload((uint64_t)v6, @"DidFinishProcessingPhotoProxy", (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3]);
      }
      if (!v8[57])
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__BWCaptureDeferredPhotoProcessor_request_failedWithError___block_invoke;
        v15[3] = &unk_1E5C264A0;
        v15[4] = a3;
        v15[5] = v8;
        v15[6] = v6;
        captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v6, (uint64_t)v15);
      }
      if (*v11 == 1) {
        kdebug_trace();
      }
    }
  }
}

void __59__BWCaptureDeferredPhotoProcessor_request_failedWithError___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 48)) {
    captureDeferredPhotoProcessor_cleanupForCurrentProcessingRequest(*(const void **)(a1 + 48));
  }
}

- (void)job:(id)a3 failedWithError:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 processorRequest];
  [(BWCaptureDeferredPhotoProcessor *)self request:v6 failedWithError:v4];
}

- (void)job:(id)a3 completedWithSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F10)
  {
    int v71 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v4 = a4;
  }
  id v8 = [(FigWeakReference *)self->_weakDeferredPhotoProcessorReference referencedObject];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage && *DerivedStorage)
  {
    uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1) {
      DerivedStorage = (unsigned char *)kdebug_trace();
    }
    v11 = (void *)MEMORY[0x1A6272C70](DerivedStorage);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (objc_msgSend((id)objc_msgSend(v5, "processorRequest"), "parent"))
    {

LABEL_44:
      if (*v10 == 1) {
        kdebug_trace();
      }
      return;
    }
    v61 = self;
    v66 = v12;
    v64 = v11;
    memset(&v69, 0, sizeof(v69));
    CMSampleBufferGetPresentationTimeStamp(&v69, v4);
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v72 = v69;
    CFDictionaryRef v14 = CMTimeCopyAsDictionary(&v72, v13);
    if (v14)
    {
      CFDictionaryRef v15 = v14;
      uint64_t v63 = (uint64_t)v8;
      v62 = (void *)CMGetAttachment(v4, @"PhotoManifest", 0);
      v16 = (void *)[v62 descriptorForSampleBuffer:v4];
      BOOL v17 = FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata() != 0;
      uint64_t v18 = (void *)CMGetAttachment(v4, @"StillImageSettings", 0);
      int v19 = [v18 outputOrientation];
      int v20 = [v18 outputMirroring];
      int v21 = [v18 flashMode];
      StillImageMetadataInSettingsForSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetStillImageMetadataInSettingsForSampleBuffer(v18, v4);
      IrisAssetIdentifierForSettingsAndSampleBuffer = (const void *)FigCaptureMetadataUtilitiesGetIrisAssetIdentifierForSettingsAndSampleBuffer(v18, v4);
      uint64_t v24 = [v18 imageGroupIdentifier];
      uint64_t v25 = [v16 time];
      v59 = (const void *)v24;
      v26 = a4;
      int v27 = v21;
      id v5 = a3;
      v28 = objc_autorelease(FigCaptureMetadataUtilitiesCreateMetadataAttachments(a4, v19, v20, 1, 1, v27, v17, 1, 0, 1, 0, 0, 0, 0, StillImageMetadataInSettingsForSampleBuffer, IrisAssetIdentifierForSettingsAndSampleBuffer, v59, 0,
                v25,
                0));
      [v66 setObject:v15 forKeyedSubscript:@"PresentationTimestamp"];
      objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "processorRequest"), "captureRequestIdentifier"), @"CaptureRequestIdentifier");
      objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(v16, "photoIdentifier"), @"PhotoIdentifier");
      if (([v16 processingFlags] & 0x10000) == 0)
      {
        CFTypeRef v29 = CMGetAttachment(a4, @"EncodedImageSurface", 0);
        uint64_t v30 = objc_msgSend((id)CMGetAttachment(a4, @"EncodedImageSurfaceSize", 0), "unsignedLongValue");
        uint64_t v31 = objc_msgSend((id)CMGetAttachment(a4, @"EncodedImageCodecType", 0), "intValue");
        uint64_t v32 = objc_msgSend((id)CMGetAttachment(a4, @"EncodedImageFileType", 0), "intValue");
LABEL_13:
        uint64_t v46 = 4294950471;
        if (v29 && v30 && v31 && v32 && v28)
        {
          [v66 setObject:v29 forKeyedSubscript:@"Surface"];
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v30), @"SurfaceSize");
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v31), @"PhotoCodec");
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v32), @"PhotoFileType");
          [v66 setObject:v28 forKeyedSubscript:@"Metadata"];
          if ([v18 depthDataDeliveryEnabled]
            && ([v18 embedsDepthDataInImage] & 1) == 0)
          {
            fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, @"Depth", (const __CFString *)*MEMORY[0x1E4F55B40], 0, v66, @"DepthDataSurface", @"DepthMetadata");
          }
          if ([v18 portraitEffectsMatteDeliveryEnabled]
            && ([v18 embedsPortraitEffectsMatteInImage] & 1) == 0)
          {
            fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, 0x1EFA74420, (const __CFString *)*MEMORY[0x1E4F55B80], 1, v66, @"PortraitEffectsMatteSurface", @"PortraitEffectsMatteMetadata");
          }
          v11 = v64;
          if (([v18 embedsSemanticSegmentationMattesInImage] & 1) == 0)
          {
            v47 = (void *)[v18 enabledSemanticSegmentationMatteURNs];
            if ([v47 containsObject:*MEMORY[0x1E4F55FC8]]) {
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, @"PersonSemanticsHair", (const __CFString *)*MEMORY[0x1E4F55B88], 1, v66, @"HairSegmentationMatteSurface", @"HairSegmentationMatteMetadata");
            }
            v48 = (void *)[v18 enabledSemanticSegmentationMatteURNs];
            if ([v48 containsObject:*MEMORY[0x1E4F55FD0]]) {
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, @"PersonSemanticsSkin", (const __CFString *)*MEMORY[0x1E4F55B88], 1, v66, @"SkinSegmentationMatteSurface", @"SkinSegmentationMatteMetadata");
            }
            v49 = (void *)[v18 enabledSemanticSegmentationMatteURNs];
            if ([v49 containsObject:*MEMORY[0x1E4F55FE0]]) {
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, @"PersonSemanticsTeeth", (const __CFString *)*MEMORY[0x1E4F55B88], 1, v66, @"TeethSegmentationMatteSurface", @"TeethSegmentationMatteMetadata");
            }
            v50 = (void *)[v18 enabledSemanticSegmentationMatteURNs];
            if ([v50 containsObject:*MEMORY[0x1E4F55FC0]]) {
              fcdpp_copyAttachedMediaSurfaceDataFromSampleBufferIntoNotificationPayload(v26, @"PersonSemanticsGlasses", (const __CFString *)*MEMORY[0x1E4F55B88], 1, v66, @"GlassesSegmentationMatteSurface", @"GlassesSegmentationMatteMetadata");
            }
          }
          if ([v18 previewEnabled])
          {
            v51 = (__IOSurface *)CMGetAttachment(v26, @"PreviewSurface", 0);
            if (!v51)
            {
              FigDebugAssert3();
              v55 = (const void *)v63;
LABEL_41:

              uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
              if (v62)
              {
                int v56 = [v5 numberOfPhotosDelivered];
                if (objc_msgSend((id)objc_msgSend(v62, "photoDescriptors"), "count") == v56)
                {
                  v68[0] = MEMORY[0x1E4F143A8];
                  v68[1] = 3221225472;
                  v68[2] = __65__BWCaptureDeferredPhotoProcessor_job_completedWithSampleBuffer___block_invoke;
                  v68[3] = &__block_descriptor_40_e5_v8__0l;
                  v68[4] = v55;
                  captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v55, (uint64_t)v68);
                }
              }
              goto LABEL_44;
            }
            v52 = v51;
            [v66 setObject:v51 forKeyedSubscript:@"PreviewSurface"];
            objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", IOSurfaceGetAllocSize(v52)), @"PreviewSurfaceSize");
          }
          if ([v18 cameraCalibrationDataDeliveryEnabled])
          {
            if (![v66 objectForKeyedSubscript:@"DepthMetadata"])
            {
              CFTypeRef v53 = CMGetAttachment(v26, @"CameraCalibrationDataMetadata", 0);
              if (v53) {
                [v66 setObject:v53 forKeyedSubscript:@"DepthMetadata"];
              }
            }
          }
          [v66 setObject:0 forKeyedSubscript:@"ThumbnailSurface"];
          CFDictionaryRef v54 = (const __CFDictionary *)[v66 copy];
          v55 = (const void *)v63;
          captureDeferredPhotoProcessor_sendXPCNotificationWithPayload(v63, @"DidFinishProcessingPhotoProxy", v54);

          goto LABEL_41;
        }
        goto LABEL_48;
      }
      CFTypeRef v33 = CMGetAttachment(a4, @"RawImageSurface", 0);
      uint64_t v30 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a4, @"RawImageAssetSizes", 0), "objectForKeyedSubscript:", 0x1EFA74140), "unsignedLongValue");
      unsigned int v34 = [v18 rawOutputFormat];
      uint64_t v32 = objc_msgSend((id)CMGetAttachment(a4, @"RawImageFileType", 0), "intValue");
      CFTypeRef v35 = CMGetAttachment(a4, @"RawDNGDictionary", 0);
      if (v35)
      {
        v36 = (void *)v35;
        unsigned int v60 = v34;
        CFTypeRef v37 = v33;
        CFTypeRef v38 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        uint64_t v39 = objc_msgSend((id)CMGetAttachment(a4, @"RawImageContainsDepthData", 0), "BOOLValue");
        uint64_t v40 = objc_msgSend((id)CMGetAttachment(a4, @"RawImageContainsSemanticSegmentationMattes", 0), "BOOLValue");
        int v41 = [v18 rawOutputFileCodec];
        v42 = (void *)v38;
        CFTypeRef v29 = v37;
        uint64_t v31 = v60;
        uint64_t v43 = [v42 objectForKeyedSubscript:*MEMORY[0x1E4F53D70]];
        uint64_t v44 = v40;
        v26 = a4;
        int v45 = v41;
        id v5 = a3;
        v28 = BWCreateRawMetadataFromMetadata(v28, v36, 0x10000u, v43, v39, v44, v45);
        goto LABEL_13;
      }
    }
    uint64_t v46 = 4294954516;
LABEL_48:

    [(BWCaptureDeferredPhotoProcessor *)v61 job:v5 failedWithError:v46];
    uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    v11 = v64;
    goto LABEL_44;
  }
}

void __65__BWCaptureDeferredPhotoProcessor_job_completedWithSampleBuffer___block_invoke(uint64_t a1)
{
}

- (void)_prepareToTerminateImmediatelyDueToError:(int)a3
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(FigWeakReference *)self->_weakDeferredPhotoProcessorReference referencedObject];
  DerivedStorage = (unsigned char *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    v7 = DerivedStorage;
    if (*DerivedStorage)
    {
      if (!_FigIsCurrentDispatchQueue())
      {
        uint64_t v15 = v3;
        LODWORD(v14) = 0;
        FigDebugAssert3();
      }
      uint64_t v8 = *((void *)v7 + 6);
      if (v8)
      {
        [(BWCaptureDeferredPhotoProcessor *)self request:v8 failedWithError:v4];
        *((void *)v7 + 6) = 0;
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v9 = (void *)*((void *)v7 + 5);
      uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, v15);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            [(BWCaptureDeferredPhotoProcessor *)self request:*(void *)(*((void *)&v16 + 1) + 8 * i) failedWithError:v4];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }
      [*((id *)v7 + 5) removeAllObjects];
    }
  }
}

@end