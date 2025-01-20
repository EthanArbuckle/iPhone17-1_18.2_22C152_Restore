@interface AVAsset(MediaAnalysis)
- (BOOL)vcp_isShortMovie;
- (CFTypeRef)vcp_frameAtTimeStamp:()MediaAnalysis withMaxDimension:;
- (CFTypeRef)vcp_keyFrameWithMaxDimension:()MediaAnalysis;
- (id)vcp_enabledTracksWithMediaType:()MediaAnalysis;
- (id)vcp_firstEnabledTrackWithMediaType:()MediaAnalysis;
- (uint64_t)vcp_isMontage;
- (void)vcp_livePhotoStillDisplayTime;
@end

@implementation AVAsset(MediaAnalysis)

- (id)vcp_firstEnabledTrackWithMediaType:()MediaAnalysis
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = [a1 tracksWithMediaType:0];
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if ([v5 isEnabled])
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (id)vcp_enabledTracksWithMediaType:()MediaAnalysis
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = objc_msgSend(a1, "tracksWithMediaType:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isEnabled]) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

- (BOOL)vcp_isShortMovie
{
  [a1 duration];
  return CMTimeGetSeconds(&time) < 1.0;
}

- (uint64_t)vcp_isMontage
{
  id v2 = [a1 availableMetadataFormats];
  uint64_t v3 = *MEMORY[0x1E4F15D18];
  int v4 = [v2 containsObject:*MEMORY[0x1E4F15D18]];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F15D78];
  v6 = [a1 metadataForFormat:v3];
  uint64_t v7 = *MEMORY[0x1E4F15DF8];
  uint64_t v8 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v6 withKey:v5 keySpace:*MEMORY[0x1E4F15DF8]];
  if (![v8 count])
  {
    uint64_t v9 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v6 withKey:*MEMORY[0x1E4F15E88] keySpace:v7];

    uint64_t v8 = (void *)v9;
  }
  if (![v8 count])
  {
LABEL_13:

    return 0;
  }
  long long v10 = [v8 firstObject];
  v11 = [v10 stringValue];

  if (([v11 isEqualToString:@"Memories"] & 1) == 0
    && ![v11 isEqualToString:@"iMovie"])
  {

    goto LABEL_13;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "AVAsset: Montage asset detected", v14, 2u);
    }
  }
  return 1;
}

- (void)vcp_livePhotoStillDisplayTime
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [a1 tracksWithMediaType:*MEMORY[0x1E4F15BE0]];
  uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (!v2)
  {

LABEL_30:
    uint64_t v25 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a2 + 16) = *(void *)(v25 + 16);
    return;
  }
  v32 = 0;
  uint64_t v3 = *(void *)v39;
  uint64_t v4 = *MEMORY[0x1E4F218A0];
  do
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if (*(void *)v39 != v3) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v7 = [v6 formatDescriptions];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v35;
        while (2)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v35 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = CMMetadataFormatDescriptionGetIdentifiers(*(CMMetadataFormatDescriptionRef *)(*((void *)&v34 + 1) + 8 * j));
            if ([v11 containsObject:v4])
            {
              id v12 = v6;

              v32 = v12;
              goto LABEL_16;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    uint64_t v2 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  }
  while (v2);

  if (!v32) {
    goto LABEL_30;
  }
  long long v13 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v32 outputSettings:0];
  long long v14 = [MEMORY[0x1E4F16378] assetReaderWithAsset:a1 error:0];
  long long v15 = v14;
  if (v14)
  {
    [v14 addOutput:v13];
    if (![v15 startReading])
    {
      uint64_t v26 = MEMORY[0x1E4F1F9F8];
      uint64_t v23 = a2;
      *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
      CMTimeEpoch v24 = *(void *)(v26 + 16);
      goto LABEL_32;
    }
    do
    {
      v16 = (opaqueCMSampleBuffer *)[v13 copyNextSampleBuffer];
      uint64_t v17 = v16;
      if (!v16) {
        break;
      }
      if (CMSampleBufferGetNumSamples(v16))
      {
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F166C0]) initWithSampleBuffer:v17];
        v19 = (void *)MEMORY[0x1E4F16558];
        v20 = [v18 items];
        v21 = [v19 metadataItemsFromArray:v20 filteredByIdentifier:v4];
        v22 = [v21 firstObject];

        if (v22)
        {
          CMSampleBufferGetOutputPresentationTimeStamp(&v33, v17);
          CMTimeValue value = v33.value;
          CMTimeFlags flags = v33.flags;
          CMTimeScale timescale = v33.timescale;
          CMTimeEpoch epoch = v33.epoch;
        }
      }
      CFRelease(v17);
    }
    while ((flags & 1) == 0);
    [v15 cancelReading];
  }
  uint64_t v23 = a2;
  *(void *)a2 = value;
  *(_DWORD *)(a2 + 8) = timescale;
  *(_DWORD *)(a2 + 12) = flags;
  CMTimeEpoch v24 = epoch;
LABEL_32:
  *(void *)(v23 + 16) = v24;
}

- (CFTypeRef)vcp_keyFrameWithMaxDimension:()MediaAnalysis
{
  uint64_t v5 = (void *)MEMORY[0x1C186D320]();
  v6 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:a1];
  [v6 setAppliesPreferredTrackTransform:1];
  if (a3) {
    objc_msgSend(v6, "setMaximumSize:", (double)a3, (double)a3);
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3812000000;
  v20 = __Block_byref_object_copy__31;
  v21 = __Block_byref_object_dispose__31;
  v22 = &unk_1BC33760A;
  uint64_t v23 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  long long v15 = *MEMORY[0x1E4F1FA48];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__AVAsset_MediaAnalysis__vcp_keyFrameWithMaxDimension___block_invoke;
  v12[3] = &unk_1E629B088;
  long long v14 = &v17;
  uint64_t v8 = v7;
  long long v13 = v8;
  [v6 generateCGImageAsynchronouslyForTime:&v15 completionHandler:v12];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v9 = (const void *)v18[6];
  if (v9) {
    CFTypeRef v10 = CFRetain(v9);
  }
  else {
    CFTypeRef v10 = 0;
  }

  _Block_object_dispose(&v17, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v23);

  return v10;
}

- (CFTypeRef)vcp_frameAtTimeStamp:()MediaAnalysis withMaxDimension:
{
  dispatch_semaphore_t v7 = (void *)MEMORY[0x1C186D320]();
  uint64_t v8 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:a1];
  [v8 setAppliesPreferredTrackTransform:0];
  [v8 setApertureMode:*MEMORY[0x1E4F15790]];
  uint64_t v9 = (long long *)MEMORY[0x1E4F1FA48];
  long long v29 = *MEMORY[0x1E4F1FA48];
  uint64_t v30 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v8 setRequestedTimeToleranceBefore:&v29];
  long long v27 = *v9;
  uint64_t v28 = *((void *)v9 + 2);
  [v8 setRequestedTimeToleranceAfter:&v27];
  if (a4) {
    objc_msgSend(v8, "setMaximumSize:", (double)a4, (double)a4);
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3812000000;
  uint64_t v23 = __Block_byref_object_copy__31;
  CMTimeEpoch v24 = __Block_byref_object_dispose__31;
  uint64_t v25 = &unk_1BC33760A;
  uint64_t v26 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  long long v18 = *a3;
  uint64_t v19 = *((void *)a3 + 2);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__AVAsset_MediaAnalysis__vcp_frameAtTimeStamp_withMaxDimension___block_invoke;
  v15[3] = &unk_1E629B088;
  uint64_t v17 = &v20;
  v11 = v10;
  uint64_t v16 = v11;
  [v8 generateCGImageAsynchronouslyForTime:&v18 completionHandler:v15];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (const void *)v21[6];
  if (v12) {
    CFTypeRef v13 = CFRetain(v12);
  }
  else {
    CFTypeRef v13 = 0;
  }

  _Block_object_dispose(&v20, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v26);

  return v13;
}

@end