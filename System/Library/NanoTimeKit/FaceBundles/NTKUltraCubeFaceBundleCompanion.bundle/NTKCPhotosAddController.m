@interface NTKCPhotosAddController
+ (id)ultraCubeConfigurationWithLimit:(unint64_t)a3;
@end

@implementation NTKCPhotosAddController

+ (id)ultraCubeConfigurationWithLimit:(unint64_t)a3
{
  v4 = +[PHPhotoLibrary sharedPhotoLibrary];
  id v5 = [objc_alloc((Class)PHPickerConfiguration) initWithPhotoLibrary:v4];
  v6 = +[PHPickerFilter imagesFilter];
  [v5 setFilter:v6];
  [v5 setSelectionLimit:a3];

  return v5;
}

@end