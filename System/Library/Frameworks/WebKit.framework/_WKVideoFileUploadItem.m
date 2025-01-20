@interface _WKVideoFileUploadItem
- (BOOL)isVideo;
- (RetainPtr<UIImage>)displayImage;
@end

@implementation _WKVideoFileUploadItem

- (BOOL)isVideo
{
  return 1;
}

- (RetainPtr<UIImage>)displayImage
{
  v3 = v2;
  v4 = [(_WKFileUploadItem *)self fileURL];

  WebKit::iconForVideoFile(v4, v5, v3);
  return v6;
}

@end