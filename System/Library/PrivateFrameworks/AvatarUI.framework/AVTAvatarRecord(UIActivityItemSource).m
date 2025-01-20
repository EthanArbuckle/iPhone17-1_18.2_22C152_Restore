@interface AVTAvatarRecord(UIActivityItemSource)
- (__CFString)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:;
- (id)activityViewController:()UIActivityItemSource subjectForActivityType:;
- (id)activityViewController:()UIActivityItemSource thumbnailImageForActivityType:suggestedSize:;
@end

@implementation AVTAvatarRecord(UIActivityItemSource)

- (id)activityViewController:()UIActivityItemSource subjectForActivityType:
{
  v1 = NSString;
  v2 = [a1 identifier];
  v3 = [v1 stringWithFormat:@"avatar_%@.avt", v2];

  return v3;
}

- (__CFString)activityViewController:()UIActivityItemSource dataTypeIdentifierForActivityType:
{
  return @"com.apple.private.avatar";
}

- (id)activityViewController:()UIActivityItemSource thumbnailImageForActivityType:suggestedSize:
{
  v2 = objc_alloc_init(AVTAvatarRecordImageProvider);
  v3 = +[AVTRenderingScope gridThumbnailScope];
  v4 = [(AVTAvatarRecordImageProvider *)v2 imageForRecord:a1 scope:v3];

  return v4;
}

@end