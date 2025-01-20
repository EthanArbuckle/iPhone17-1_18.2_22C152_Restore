@interface IMEmojiSticker
+ (NSString)defaultEmojiStickerPackID;
+ (id)stickerPackID;
+ (id)tempFileURLForStickerID:(id)a3;
- (BOOL)isEmojiSticker;
- (BOOL)isEqual:(id)a3;
- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerID:(id)a4 stickerPackID:(id)a5 fileURL:(id)a6 accessibilityLabel:(id)a7 moodCategory:(id)a8 stickerName:(id)a9 textToSpeechName:(id)a10;
- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4;
- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5;
- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 moodCategory:(id)a6;
- (NSString)emojiString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)tapbackEquivalent;
@end

@implementation IMEmojiSticker

+ (id)stickerPackID
{
  v2 = IMStickersExtensionIdentifier();
  v3 = IMBalloonExtensionIDWithSuffix((uint64_t)v2);

  return v3;
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4
{
  return (IMEmojiSticker *)MEMORY[0x1F4181798](self, sel_initWithEmojiString_stickerPackID_fileURL_moodCategory_);
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5
{
  return (IMEmojiSticker *)MEMORY[0x1F4181798](self, sel_initWithEmojiString_stickerPackID_fileURL_moodCategory_);
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerID:(id)a4 stickerPackID:(id)a5 fileURL:(id)a6 accessibilityLabel:(id)a7 moodCategory:(id)a8 stickerName:(id)a9 textToSpeechName:(id)a10
{
  id v16 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMEmojiSticker;
  v17 = [(IMSticker *)&v21 initWithStickerID:a4 stickerPackID:a5 fileURL:a6 accessibilityLabel:a7 accessibilityName:0 searchText:0 sanitizedPrompt:0 moodCategory:a8 stickerName:a9 textToSpeechName:a10];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    emojiString = v17->_emojiString;
    v17->_emojiString = (NSString *)v18;
  }
  return v17;
}

- (IMEmojiSticker)initWithEmojiString:(id)a3 stickerPackID:(id)a4 fileURL:(id)a5 moodCategory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = objc_msgSend(v10, "__im_emojiStickerID");
    if (!v12)
    {
      id v12 = +[IMEmojiSticker tempFileURLForStickerID:v14];
    }
    uint64_t v40 = 0;
    v41 = (id *)&v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_1A07777EC;
    v44 = sub_1A07776DC;
    id v45 = 0;
    uint64_t v34 = 0;
    v35 = (id *)&v34;
    uint64_t v36 = 0x3032000000;
    v37 = sub_1A07777EC;
    v38 = sub_1A07776DC;
    id v39 = 0;
    uint64_t v28 = 0;
    v29 = (id *)&v28;
    uint64_t v30 = 0x3032000000;
    v31 = sub_1A07777EC;
    v32 = sub_1A07776DC;
    id v33 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = sub_1A07777EC;
    v26 = sub_1A07776DC;
    id v27 = 0;
    v15 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v15 localeIdentifier];
    CEMCreateEmojiLocaleData();

    [v10 length];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    id v16 = (void *)v23[5];
    if (v16)
    {
      if (!v41[5]) {
        objc_storeStrong(v41 + 5, v16);
      }
      if (!v35[5]) {
        objc_storeStrong(v35 + 5, v41[5]);
      }
      if (!v29[5]) {
        objc_storeStrong(v29 + 5, v35[5]);
      }
      v17 = (void *)v23[5];
      uint64_t v18 = objc_msgSend(v17, "__im_emojiStickerID");
      self = -[IMEmojiSticker initWithEmojiString:stickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:](self, "initWithEmojiString:stickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:textToSpeechName:", v17, v18, v11, v12, v29[5], v13, v41[5], v35[5], v21, 3221225472, sub_1A07D1DEC, &unk_1E5A11480, &v22, &v34, &v40, &v28);
      v19 = self;
    }
    else
    {
      uint64_t v18 = IMLogHandleForCategory("IMEmojiSticker");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1A09EF8D8((uint64_t)v10, v18);
      }
      v19 = 0;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    v14 = IMLogHandleForCategory("IMEmojiSticker");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1A09EF894(v14);
    }
    v19 = 0;
  }

  return v19;
}

+ (id)tempFileURLForStickerID:(id)a3
{
  id v3 = a3;
  v4 = IMSafeTemporaryDirectory();
  v5 = [v4 path];
  v6 = [v5 stringByAppendingPathComponent:v3];

  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMEmojiSticker;
  if ([(IMSticker *)&v9 isEqual:v4])
  {
    v5 = [(IMEmojiSticker *)self emojiString];
    v6 = [v4 emojiString];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(IMEmojiSticker *)self emojiString];
  v6 = [(IMSticker *)self stickerGUID];
  char v7 = [(IMSticker *)self stickerPackGUID];
  v8 = [(IMSticker *)self fileURL];
  objc_super v9 = [(IMSticker *)self accessibilityLabel];
  id v10 = [(IMSticker *)self moodCategory];
  id v11 = [(IMSticker *)self stickerName];
  id v12 = [(IMSticker *)self textToSpeechName];
  id v13 = (void *)[v4 initWithEmojiString:v5 stickerID:v6 stickerPackID:v7 fileURL:v8 accessibilityLabel:v9 moodCategory:v10 stickerName:v11 textToSpeechName:v12];

  return v13;
}

- (BOOL)isEmojiSticker
{
  return 1;
}

- (id)description
{
  id v3 = [(IMSticker *)self fileURL];
  id v4 = @"NO";
  if (v3)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = [(IMSticker *)self fileURL];
    char v7 = [v6 path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8) {
      id v4 = @"YES";
    }
  }
  uint64_t v21 = v4;

  v20 = NSString;
  v19 = [(IMEmojiSticker *)self emojiString];
  objc_super v9 = [(IMSticker *)self stickerName];
  id v10 = [(IMSticker *)self stickerGUID];
  id v11 = [(IMSticker *)self stickerPackGUID];
  id v12 = [(IMSticker *)self fileURL];
  id v13 = [(IMSticker *)self accessibilityLabel];
  v14 = [(IMSticker *)self moodCategory];
  v15 = [(IMSticker *)self attributionInfo];
  id v16 = [(IMSticker *)self ballonBundleID];
  v17 = [(IMSticker *)self textToSpeechName];
  uint64_t v22 = [v20 stringWithFormat:@"<IMEmojiSticker: %@, Name: %@, guid %@, packID %@, fileURL %@, fileExists: %@, accessibilityLabel %@, moodCategory %@, attributionInfo: %@, balloonBundleID: %@, textToSpeechName: %@, self %p>", v19, v9, v10, v11, v12, v21, v13, v14, v15, v16, v17, self];

  return v22;
}

+ (NSString)defaultEmojiStickerPackID
{
  return (NSString *)@"com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension";
}

- (id)tapbackEquivalent
{
  v2 = [(IMEmojiSticker *)self emojiString];
  id v3 = [[IMEmojiTapback alloc] initWithEmoji:v2 isRemoved:0];

  return v3;
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (void).cxx_destruct
{
}

@end