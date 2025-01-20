@interface CKAnimatedStickerMediaObject
+ (BOOL)shouldShadePreview;
- (id)attachmentSummary:(unint64_t)a3;
@end

@implementation CKAnimatedStickerMediaObject

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Stickers" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

@end