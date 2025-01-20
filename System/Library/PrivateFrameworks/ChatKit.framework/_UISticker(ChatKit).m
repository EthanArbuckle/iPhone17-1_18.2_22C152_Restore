@interface _UISticker(ChatKit)
- (id)__ck_representationWithRole:()ChatKit;
- (id)_ck_plainStringEmojiText;
- (uint64_t)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph;
- (uint64_t)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph;
- (uint64_t)_ck_stickerType;
- (void)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph;
- (void)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph;
@end

@implementation _UISticker(ChatKit)

- (uint64_t)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph
{
  if ([a1 isAnimated])
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[_UISticker(ChatKit) _ck_shouldInsertInCompositionAsAdaptiveImageGlyph]();
    }

    return 0;
  }
  else
  {
    int v4 = [a1 hasLiveEffect];
    if (v4)
    {
      v5 = IMLogHandleForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[_UISticker(ChatKit) _ck_shouldInsertInCompositionAsAdaptiveImageGlyph]();
      }
    }
    return v4 ^ 1u;
  }
}

- (uint64_t)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph
{
  if ([a1 isAnimated])
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph]();
    }
LABEL_10:
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  if ([a1 hasLiveEffect])
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph]();
    }
    goto LABEL_10;
  }
  unint64_t v3 = objc_msgSend(a1, "_ck_stickerType");
  if (v3 < 5)
  {
    v2 = IMLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph].cold.4();
    }
    goto LABEL_10;
  }
  if (v3 != 5) {
    return 0;
  }
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph]();
  }
  uint64_t v4 = 1;
LABEL_11:

  return v4;
}

- (uint64_t)_ck_stickerType
{
  v2 = [a1 searchText];
  uint64_t v3 = [v2 length];

  if (!v3)
  {
    v5 = [a1 externalURI];
    if ([v5 length])
    {
      if ([v5 hasPrefix:@"sticker:///user/"])
      {
        v6 = objc_msgSend(a1, "__ck_representationWithRole:", @"com.apple.stickers.role.stillVariant_40");
        if (v6) {
          uint64_t v4 = 5;
        }
        else {
          uint64_t v4 = 1;
        }

        goto LABEL_16;
      }
      if ([v5 hasPrefix:@"sticker:///memoji/"])
      {
        uint64_t v4 = 3;
LABEL_16:

        return v4;
      }
      if ([v5 hasPrefix:@"sticker:///emoji/"])
      {
        uint64_t v4 = 4;
        goto LABEL_16;
      }
      if ([v5 hasPrefix:@"sticker:///third_party/"])
      {
        uint64_t v4 = 2;
        goto LABEL_16;
      }
    }
    uint64_t v4 = 0;
    goto LABEL_16;
  }
  return 5;
}

- (id)__ck_representationWithRole:()ChatKit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 representations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "role", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_ck_plainStringEmojiText
{
  v1 = [a1 externalURI];
  if ([v1 hasPrefix:@"sticker:///emoji/identifier/"])
  {
    v2 = [v1 substringFromIndex:objc_msgSend(@"sticker:///emoji/identifier/", "length")];
    if ([v2 length])
    {
      uint64_t v3 = [MEMORY[0x1E4F610A0] emojiTokenWithString:v2 localeData:0];
      id v4 = 0;
      if ([v3 isValid]) {
        id v4 = v2;
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Not inserting as adaptive image glyph in composition because sticker has a live effect", v2, v3, v4, v5, v6);
}

- (void)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Not inserting as adaptive image glyph in tapback due to non-genmoji sticker type", v2, v3, v4, v5, v6);
}

@end