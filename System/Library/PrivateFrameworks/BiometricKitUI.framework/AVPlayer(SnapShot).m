@interface AVPlayer(SnapShot)
- (id)bkui_snapshotImageAt:()SnapShot asset:error:;
@end

@implementation AVPlayer(SnapShot)

- (id)bkui_snapshotImageAt:()SnapShot asset:error:
{
  v7 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:a4];
  long long v12 = *a3;
  uint64_t v13 = *((void *)a3 + 2);
  uint64_t v8 = [v7 copyCGImageAtTime:&v12 actualTime:0 error:a5];
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = [MEMORY[0x1E4F42A80] imageWithCGImage:v8];
    CFAutorelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end