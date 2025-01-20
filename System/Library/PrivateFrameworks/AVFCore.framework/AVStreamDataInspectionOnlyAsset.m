@interface AVStreamDataInspectionOnlyAsset
- (AVStreamDataInspectionOnlyAsset)initWithFigAsset:(OpaqueFigAsset *)a3;
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
@end

@implementation AVStreamDataInspectionOnlyAsset

- (AVStreamDataInspectionOnlyAsset)initWithFigAsset:(OpaqueFigAsset *)a3
{
  v4 = [[AVFigAssetInspectorLoader alloc] initWithFigAsset:a3 forAsset:0];
  if (v4 && (uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, 0x1EE5941B8, 0)) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVStreamDataInspectionOnlyAsset;
    return [(AVURLAsset *)&v7 initWithURL:0 options:v5];
  }
  else
  {

    return 0;
  }
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return 0;
}

- (BOOL)isCompatibleWithAirPlayVideo
{
  return 0;
}

- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3
{
  return 0;
}

@end