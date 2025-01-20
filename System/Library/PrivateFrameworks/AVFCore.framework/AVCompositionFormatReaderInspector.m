@interface AVCompositionFormatReaderInspector
- (BOOL)isCompatibleWithAirPlayVideo;
- (BOOL)isCompatibleWithPhotosTranscodingServiceWithOptions:(id)a3;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
@end

@implementation AVCompositionFormatReaderInspector

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)isExportable
{
  return 1;
}

- (BOOL)isReadable
{
  return 1;
}

- (BOOL)isComposable
{
  return 1;
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