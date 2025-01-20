@interface CKReviewLargePhotoAttachmentsViewController
- (id)attachmentClass;
- (id)navigationBarTitle;
@end

@implementation CKReviewLargePhotoAttachmentsViewController

- (id)navigationBarTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PHOTOS" value:&stru_1EDE4CA38 table:@"General"];

  return v3;
}

- (id)attachmentClass
{
  return (id)*MEMORY[0x1E4F6BEE8];
}

@end