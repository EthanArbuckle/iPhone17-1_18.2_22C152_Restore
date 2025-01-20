@interface JFXFaceTrackingPlaybackUtilities
+ (void)arDataForPlaybackElement:(id)a3 atPlaybackTime:(id *)a4 completion:(id)a5;
@end

@implementation JFXFaceTrackingPlaybackUtilities

+ (void)arDataForPlaybackElement:(id)a3 atPlaybackTime:(id *)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__JFXFaceTrackingPlaybackUtilities_arDataForPlaybackElement_atPlaybackTime_completion___block_invoke;
  block[3] = &unk_264C0A350;
  id v13 = v7;
  id v14 = v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __87__JFXFaceTrackingPlaybackUtilities_arDataForPlaybackElement_atPlaybackTime_completion___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = [*(id *)(a1 + 32) uuid];
  v4 = [v2 stringWithFormat:@"%@_%@", @"arDataForPlaybackElement", v3];

  v5 = +[JFXMediaDataReaderFactory sharedInstance];
  v6 = [v5 createARMetadataReaderWithCreationAttributesProvider:*(void *)(a1 + 32) name:v4];

  if (!v6) {
    goto LABEL_4;
  }
  int32_t v7 = +[JFXMediaSettings timeScale];
  memset(&v17, 0, sizeof(v17));
  CMTimeFromFrameTime([*(id *)(a1 + 32) presentationTime], v7, &rhs);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)(a1 + 48);
  lhs.start.epoch = *(void *)(a1 + 64);
  CMTimeSubtract(&v17, &lhs.start, &rhs);
  memset(&v15, 0, sizeof(v15));
  CMTimeFromFrameTime([*(id *)(a1 + 32) mediaStartOffset], v7, &v14);
  lhs.CMTimeRange start = v17;
  CMTimeAdd(&v15, &lhs.start, &v14);
  memset(&v13, 0, sizeof(v13));
  CMTimeMake(&v13, 1, v7);
  [v6 setIsScrubbing:1];
  memset(&lhs, 0, sizeof(lhs));
  start.CMTimeRange start = v15;
  CMTime duration = v13;
  CMTimeRangeMake(&lhs, &start.start, &duration);
  CMTimeRange start = lhs;
  if ([v6 beginReadingAtTimeRange:&start])
  {
    start.CMTimeRange start = v15;
    id v8 = [v6 arMetadataItemForTime:&start];
    v9 = [v8 arMetadata];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_4:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end