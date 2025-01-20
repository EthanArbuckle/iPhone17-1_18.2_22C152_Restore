@interface AVURLAsset(HKAdditions)
- (double)hk_assetSize;
- (id)hk_thumbnailImage;
@end

@implementation AVURLAsset(HKAdditions)

- (double)hk_assetSize
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = &unk_1E0F50A5E;
  long long v14 = *MEMORY[0x1E4F1DB30];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *MEMORY[0x1E4F15C18];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__AVURLAsset_HKAdditions__hk_assetSize__block_invoke;
  v7[3] = &unk_1E6D55F70;
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

- (id)hk_thumbnailImage
{
  dispatch_semaphore_t v2 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:a1];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AVURLAsset_HKAdditions__hk_thumbnailImage__block_invoke;
  v9[3] = &unk_1E6D55F98;
  v11 = &v12;
  v9[4] = a1;
  v4 = v3;
  uint64_t v10 = v4;
  long long v7 = *MEMORY[0x1E4F1FA48];
  uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 generateCGImageAsynchronouslyForTime:&v7 completionHandler:v9];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v5;
}

@end