@interface UIImage(MailUI)
+ (id)mui_imageFromSuggestionToken:()MailUI;
+ (uint64_t)mui_imageWithPrivateSystemSymbolName:()MailUI;
+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI;
+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI accessibilityDescription:;
@end

@implementation UIImage(MailUI)

+ (id)mui_imageFromSuggestionToken:()MailUI
{
  id v4 = a3;
  v5 = @"magnifyingglass";
  switch([v4 tokenKind])
  {
    case 0:
      break;
    case 2:
      v6 = MFImageGlyphSearchAttachment;
      goto LABEL_22;
    case 3:
      v6 = MFImageGlyphSearchAudio;
      goto LABEL_22;
    case 5:
    case 7:
      v6 = MFImageGlyphSearchDate;
      goto LABEL_22;
    case 6:
      v6 = MFImageGlyphSearchDocument;
      goto LABEL_22;
    case 9:
      v6 = MFImageGlyphSearchIgnore;
      goto LABEL_22;
    case 10:
    case 17:
      v6 = MFImageGlyphSearchImage;
      goto LABEL_22;
    case 11:
    case 14:
      v6 = MFImageGlyphSearchEmail;
      goto LABEL_22;
    case 12:
      v6 = MFImageGlyphSearchMailbox;
      goto LABEL_22;
    case 13:
      v6 = MFImageGlyphSearchDefaultLocation;
      goto LABEL_22;
    case 16:
    case 46:
      v6 = MFImageGlyphSearchPersonCompletion;
      goto LABEL_22;
    case 19:
      v6 = MFImageGlyphSearchReadIndicator;
      goto LABEL_22;
    case 20:
      v6 = MFImageGlyphSearchReply;
      goto LABEL_22;
    case 22:
      v6 = MFImageGlyphSearchSourceCode;
      goto LABEL_22;
    case 24:
    case 25:
    case 33:
      v6 = MFImageGlyphSearchFlag;
      goto LABEL_22;
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      v6 = MFImageGlyphSearchFlagFilled;
      goto LABEL_22;
    case 36:
      v6 = MFImageGlyphSearchMovie;
      goto LABEL_22;
    case 37:
      v6 = MFImageGlyphSearchDefaultLink;
LABEL_22:
      v8 = *v6;

      v5 = v8;
      break;
    default:
      v7 = _ef_log_UIImage();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[UIImage(MailUI) mui_imageFromSuggestionToken:](v4, v7);
      }

      break;
  }
  v9 = objc_msgSend(a1, "mui_imageWithSystemSymbolName:", v5);

  return v9;
}

+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:");
}

+ (uint64_t)mui_imageWithPrivateSystemSymbolName:()MailUI
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");
}

+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI accessibilityDescription:
{
  return objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:");
}

+ (void)mui_imageFromSuggestionToken:()MailUI .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218242;
  uint64_t v5 = [a1 tokenKind];
  __int16 v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "Detected unsupported kind: %ld for token: %@", (uint8_t *)&v4, 0x16u);
}

@end