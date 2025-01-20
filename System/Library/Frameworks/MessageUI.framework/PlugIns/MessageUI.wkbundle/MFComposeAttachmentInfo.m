@interface MFComposeAttachmentInfo
- (BOOL)isImage;
@end

@implementation MFComposeAttachmentInfo

- (BOOL)isImage
{
  return [(MFComposeAttachmentInfo *)self isDisplayableImage];
}

@end