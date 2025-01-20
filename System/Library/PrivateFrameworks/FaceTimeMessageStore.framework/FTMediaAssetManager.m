@interface FTMediaAssetManager
- (FTMediaAssetManager)init;
- (void)saveLivePhotoWithPhotoURL:(NSURL *)a3 videoURL:(NSURL *)a4 completion:(id)a5;
- (void)saveVideoWithURL:(NSURL *)a3 completion:(id)a4;
@end

@implementation FTMediaAssetManager

- (FTMediaAssetManager)init
{
  return (FTMediaAssetManager *)sub_24DE53068();
}

- (void)saveLivePhotoWithPhotoURL:(NSURL *)a3 videoURL:(NSURL *)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_24DEC89DC((uint64_t)&unk_269894F28, (uint64_t)v9);
}

- (void)saveVideoWithURL:(NSURL *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_24DEC89DC((uint64_t)&unk_269894F18, (uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end