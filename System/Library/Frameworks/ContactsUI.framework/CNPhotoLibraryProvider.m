@interface CNPhotoLibraryProvider
+ (id)photoLibraryWithError:(id *)a3;
@end

@implementation CNPhotoLibraryProvider

+ (id)photoLibraryWithError:(id *)a3
{
  int v4 = [(objc_class *)getPHPhotoLibraryClass() isMultiLibraryModeEnabled];
  Class PHPhotoLibraryClass = getPHPhotoLibraryClass();
  if (v4) {
    [(objc_class *)PHPhotoLibraryClass openPhotoLibraryWithWellKnownIdentifier:1 error:a3];
  }
  else {
  v6 = [(objc_class *)PHPhotoLibraryClass sharedPhotoLibrary];
  }

  return v6;
}

@end