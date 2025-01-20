@interface UIFont(CKMessageEntryTextViewFontType)
+ (id)ck_fontWithMessageEntryTextViewFontType:()CKMessageEntryTextViewFontType;
@end

@implementation UIFont(CKMessageEntryTextViewFontType)

+ (id)ck_fontWithMessageEntryTextViewFontType:()CKMessageEntryTextViewFontType
{
  v4 = +[CKUIBehavior sharedBehaviors];
  v5 = v4;
  switch((unint64_t)a3)
  {
    case 0uLL:
      uint64_t v6 = [v4 balloonTextFont];
      goto LABEL_6;
    case 1uLL:
      uint64_t v6 = [v4 singleBigEmojiFont];
      goto LABEL_6;
    case 2uLL:
      uint64_t v6 = [v4 multipleBigEmojiFont];
      goto LABEL_6;
    case 3uLL:
      uint64_t v6 = [v4 singleBigAssetFont];
LABEL_6:
      a3 = (void *)v6;
      break;
    default:
      break;
  }

  return a3;
}

@end