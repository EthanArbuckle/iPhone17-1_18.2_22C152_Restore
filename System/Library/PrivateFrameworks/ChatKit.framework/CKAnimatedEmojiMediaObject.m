@interface CKAnimatedEmojiMediaObject
+ (BOOL)shouldScaleUpPreview;
+ (BOOL)shouldShadePreview;
+ (id)UTITypes;
- (Class)previewBalloonViewClass;
- (id)attachmentSummary:(unint64_t)a3;
- (id)backgroundColorOverride;
- (id)icon;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewItemTitle;
@end

@implementation CKAnimatedEmojiMediaObject

+ (id)UTITypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], @"emoji.gif", (CFStringRef)*MEMORY[0x1E4F225D8]);
  v5[0] = PreferredIdentifierForTag;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)previewItemTitle
{
  v2 = CKFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_ANIMATED_EMOJI" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (id)backgroundColorOverride
{
  return (id)[MEMORY[0x1E4F428B8] blackColor];
}

- (id)icon
{
  id v2 = (id)*MEMORY[0x1E4F225D8];
  if (v2)
  {
    v3 = +[CKMediaObject iconCache];
    v4 = [v3 objectForKey:v2];

    if (!v4)
    {
      v5 = [MEMORY[0x1E4F22430] documentProxyForName:0 type:v2 MIMEType:0];
      v4 = [MEMORY[0x1E4F42A80] _iconForResourceProxy:v5 format:3];
      if (v4)
      {
        v6 = +[CKMediaObject iconCache];
        [v6 setObject:v4 forKey:v2];
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)attachmentSummary:(unint64_t)a3
{
  v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Animated Emoji" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

+ (BOOL)shouldShadePreview
{
  return 0;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 emojiPreviewMaxWidth];
  double v9 = v8;

  if (v9 <= a3) {
    double v10 = v9;
  }
  else {
    double v10 = a3;
  }
  v13.receiver = self;
  v13.super_class = (Class)CKAnimatedEmojiMediaObject;
  v11 = [(CKAnimatedImageMediaObject *)&v13 previewForWidth:v4 orientation:v10];

  return v11;
}

@end