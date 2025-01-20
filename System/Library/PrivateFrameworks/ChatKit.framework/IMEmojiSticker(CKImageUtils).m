@interface IMEmojiSticker(CKImageUtils)
- (CKEmojiStickerLabel)stickerView;
- (id)generateImage;
- (id)generateImageForFontSize:()CKImageUtils imageGenerationScale:;
- (id)image;
- (uint64_t)prepareToSend;
- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils error:;
- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:;
- (void)prepareToSend;
@end

@implementation IMEmojiSticker(CKImageUtils)

- (id)generateImageForFontSize:()CKImageUtils imageGenerationScale:
{
  v5 = [a1 emojiString];
  v6 = objc_msgSend(v5, "__ck_generateImageForFontSize:imageGenerationScale:", a2, a3);

  return v6;
}

- (id)generateImage
{
  v1 = [a1 emojiString];
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 emojiStickerImageGenerationFontSize];
  double v4 = v3;
  v5 = +[CKUIBehavior sharedBehaviors];
  [v5 stickerScreenScale];
  v7 = objc_msgSend(v1, "__ck_generateImageForFontSize:imageGenerationScale:", v4, v6);

  return v7;
}

- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils error:
{
  id v6 = a3;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 emojiStickerImageGenerationFontSize];
  double v9 = v8;
  v10 = +[CKUIBehavior sharedBehaviors];
  [v10 stickerScreenScale];
  uint64_t v12 = [a1 writeGeneratedImageToFileURL:v6 fontSize:a4 imageGenerationScale:v9 error:v11];

  return v12;
}

- (uint64_t)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  if (v10)
  {
    double v11 = [a1 generateImageForFontSize:a2 imageGenerationScale:a3];
    uint64_t v12 = v11;
    if (v11)
    {
      id v18 = 0;
      uint64_t v13 = [v11 __ck_writePNGToURL:v10 error:&v18];
      v14 = v18;
      v15 = v14;
      if (v13)
      {
        v16 = IMLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v20 = (uint64_t)a2;
          __int16 v21 = 2048;
          uint64_t v22 = (uint64_t)a3;
          __int16 v23 = 2112;
          id v24 = v10;
          __int16 v25 = 2112;
          v26 = a1;
          _os_log_debug_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "Wrote image (size: %ld, scale: %ld) to %@ for sticker: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (a6) {
          *a6 = v14;
        }
        v16 = IMLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134219010;
          uint64_t v20 = (uint64_t)a2;
          __int16 v21 = 2048;
          uint64_t v22 = (uint64_t)a3;
          __int16 v23 = 2112;
          id v24 = v10;
          __int16 v25 = 2112;
          v26 = v15;
          __int16 v27 = 2112;
          v28 = a1;
          _os_log_error_impl(&dword_18EF18000, v16, OS_LOG_TYPE_ERROR, "Writing image (size: %ld, scale: %ld) to %@ FAILED with error: %@ for sticker: %@", buf, 0x34u);
        }
      }
    }
    else
    {
      v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[IMEmojiSticker(CKImageUtils) writeGeneratedImageToFileURL:fontSize:imageGenerationScale:error:]();
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[IMEmojiSticker(CKImageUtils) writeGeneratedImageToFileURL:fontSize:imageGenerationScale:error:]();
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (uint64_t)prepareToSend
{
  v2 = [a1 fileURL];
  id v8 = 0;
  uint64_t v3 = [a1 writeGeneratedImageToFileURL:v2 error:&v8];
  id v4 = v8;

  v5 = IMLogHandleForCategory();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[IMEmojiSticker(CKImageUtils) prepareToSend]();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[IMEmojiSticker(CKImageUtils) prepareToSend]();
  }

  return v3;
}

- (id)image
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [a1 fileURL];
  id v4 = [v3 path];
  char v5 = [v2 fileExistsAtPath:v4];

  if ((v5 & 1) == 0) {
    [a1 prepareToSend];
  }
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EE0D0BA0;
  id v6 = objc_msgSendSuper2(&v8, sel_image);

  return v6;
}

- (CKEmojiStickerLabel)stickerView
{
  v2 = [CKEmojiStickerLabel alloc];
  uint64_t v3 = -[CKEmojiStickerLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v4 = [a1 emojiString];
  [(CKEmojiStickerLabel *)v3 setText:v4];

  [(CKEmojiStickerLabel *)v3 sizeToFit];

  return v3;
}

- (void)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "Can't write image to nil url for emoji sticker: %@", v1, 0xCu);
}

- (void)writeGeneratedImageToFileURL:()CKImageUtils fontSize:imageGenerationScale:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "Failed to generate image for emoji sticker: %@", v1, 0xCu);
}

- (void)prepareToSend
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "Preparing to send failed for Emoji Sticker: %@, with error: %@", v2, 0x16u);
}

@end