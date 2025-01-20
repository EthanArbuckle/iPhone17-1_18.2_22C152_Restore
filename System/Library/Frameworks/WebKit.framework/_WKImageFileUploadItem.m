@interface _WKImageFileUploadItem
- (BOOL)isVideo;
- (RetainPtr<UIImage>)displayImage;
@end

@implementation _WKImageFileUploadItem

- (BOOL)isVideo
{
  return 0;
}

- (RetainPtr<UIImage>)displayImage
{
  v3 = v2;
  v4 = [(_WKFileUploadItem *)self fileURL];

  WebKit::iconForImageFile(v4, v3);
  return v5;
}

@end