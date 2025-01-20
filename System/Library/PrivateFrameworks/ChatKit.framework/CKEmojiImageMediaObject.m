@interface CKEmojiImageMediaObject
+ (BOOL)shouldShadePreview;
+ (id)UTITypes;
- (BOOL)canDeleteFromStickerDetails;
- (BOOL)hasGenmojiBundleID;
- (IMSticker)saveableSticker;
- (NSDate)stickerDetailsDateAdded;
- (NSString)stickerDetailsSubtitleText;
- (NSString)stickerDetailsTitleText;
- (id)attachmentSummary:(unint64_t)a3;
- (id)inProcessGenerateAdaptiveImageGlyph;
- (id)outOfProcessGenerateAdaptiveImageGlyph;
- (id)previewDispatchCache;
- (id)stickerDetailsPreview;
- (id)strikeImageAtPreviewSize:(double)a3 scaleFactor:(double)a4;
- (void)inProcessGenerateAdaptiveImageGlyph;
- (void)outOfProcessGenerateAdaptiveImageGlyph;
@end

@implementation CKEmojiImageMediaObject

+ (id)UTITypes
{
  return &unk_1EDF15158;
}

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

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache genmojiPreviewCache];
}

- (id)inProcessGenerateAdaptiveImageGlyph
{
  v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph]();
  }

  v4 = [(CKMediaObject *)self data];
  if (v4)
  {
    v5 = [objc_alloc(MEMORY[0x1E4FB0820]) initWithImageContent:v4];
    v6 = v5;
    if (v5)
    {
      v6 = v5;
      v7 = v6;
    }
    else
    {
      v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph]();
      }

      v7 = 0;
    }
  }
  else
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKEmojiImageMediaObject inProcessGenerateAdaptiveImageGlyph]();
    }
    v7 = 0;
  }

  return v7;
}

- (id)outOfProcessGenerateAdaptiveImageGlyph
{
  v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph].cold.4();
  }

  v4 = [(CKMediaObject *)self fileURL];
  v5 = [(CKMediaObject(Display) *)self senderContext];
  v6 = [MEMORY[0x1E4F6E5C0] generateEmojiImageAssetFromSourceURL:v4 senderContext:v5];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 imageData];
    if ([v8 length])
    {
      v9 = [objc_alloc(MEMORY[0x1E4FB0820]) initWithImageContent:v8];
      v10 = v9;
      if (v9)
      {
        v10 = v9;
        v11 = v10;
      }
      else
      {
        v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph]();
        }

        v11 = 0;
      }
    }
    else
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph]();
      }
      v11 = 0;
    }
  }
  else
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKEmojiImageMediaObject outOfProcessGenerateAdaptiveImageGlyph]();
    }
    v11 = 0;
  }

  return v11;
}

- (id)strikeImageAtPreviewSize:(double)a3 scaleFactor:(double)a4
{
  v6 = [(CKMediaObject *)self adaptiveImageGlyph];
  v7 = v6;
  if (v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v10[0] = 0;
    v10[1] = 0;
    v8 = objc_msgSend(v6, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", v11, v10, a3, a3, a4);
    if (v8) {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v8];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)stickerDetailsTitleText
{
  v2 = [(CKMediaObject *)self transfer];
  v3 = +[CKStickerDetailViewController localizedAppNameForStickerDetailsFromFileTransfer:v2];

  return (NSString *)v3;
}

- (NSString)stickerDetailsSubtitleText
{
  if ([(CKEmojiImageMediaObject *)self hasGenmojiBundleID])
  {
    v3 = [(CKMediaObject *)self transfer];
    [v3 adaptiveImageGlyphContentDescription];
  }
  else
  {
    v3 = [(CKImageMediaObject *)self sticker];
    [v3 accessibilityLabel];
  v4 = };

  return (NSString *)v4;
}

- (NSDate)stickerDetailsDateAdded
{
  return 0;
}

- (IMSticker)saveableSticker
{
  return (IMSticker *)+[CKUtilities saveableStickerForMediaObject:self];
}

- (BOOL)canDeleteFromStickerDetails
{
  return 0;
}

- (BOOL)hasGenmojiBundleID
{
  v2 = [(CKMediaObject *)self transfer];
  BOOL v3 = +[CKStickerDetailViewController isGenmojiBundleIDFromFileTransfer:v2];

  return v3;
}

- (id)stickerDetailsPreview
{
  v2 = [(CKMediaObject *)self adaptiveImageGlyph];
  if (v2)
  {
    BOOL v3 = +[CKUIBehavior sharedBehaviors];
    [v3 previewMaxWidth];
    double v5 = v4;

    v9[0] = 0;
    v9[1] = 0;
    v8[0] = 0;
    v8[1] = 0;
    v6 = objc_msgSend(v2, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", v9, v8, v5, v5, 3.0);
    if (v6) {
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v6];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)inProcessGenerateAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "In process generating adaptive image glyph", v1, 2u);
}

- (void)outOfProcessGenerateAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "OOP generating adaptive image glyph", v1, 2u);
}

@end