@interface PHMemoryFeatureDecoder
- (PHPhotoLibrary)photoLibrary;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PHMemoryFeatureDecoder

- (void).cxx_destruct
{
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 144, 1);
}

@end