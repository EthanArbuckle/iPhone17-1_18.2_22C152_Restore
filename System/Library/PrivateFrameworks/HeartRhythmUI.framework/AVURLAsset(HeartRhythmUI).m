@interface AVURLAsset(HeartRhythmUI)
- (double)hrui_assetSize;
- (id)hrui_thumbnailImage;
@end

@implementation AVURLAsset(HeartRhythmUI)

- (double)hrui_assetSize
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = "";
  long long v14 = *MEMORY[0x263F001B0];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *MEMORY[0x263EF9D48];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__AVURLAsset_HeartRhythmUI__hrui_assetSize__block_invoke;
  v7[3] = &unk_264581048;
  v9 = &v10;
  v7[4] = a1;
  v4 = v2;
  v8 = v4;
  [a1 loadTracksWithMediaType:v3 completionHandler:v7];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  double v5 = v11[4];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)hrui_thumbnailImage
{
  dispatch_semaphore_t v2 = [MEMORY[0x263EFA4B0] assetImageGeneratorWithAsset:a1];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__AVURLAsset_HeartRhythmUI__hrui_thumbnailImage__block_invoke;
  v9[3] = &unk_264581070;
  v11 = &v12;
  v9[4] = a1;
  v4 = v3;
  uint64_t v10 = v4;
  long long v7 = *MEMORY[0x263F010E0];
  uint64_t v8 = *(void *)(MEMORY[0x263F010E0] + 16);
  [v2 generateCGImageAsynchronouslyForTime:&v7 completionHandler:v9];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v5;
}

@end