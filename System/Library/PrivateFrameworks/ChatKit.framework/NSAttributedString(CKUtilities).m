@interface NSAttributedString(CKUtilities)
- (BOOL)__ck_hasAdaptiveImageGlyphAtIndex:()CKUtilities;
- (BOOL)_fileTransferGUIDIsForGenmojiOrAnimojiSticker:()CKUtilities;
- (id)__ck_adaptiveImageGlyphAtIndex:()CKUtilities;
- (id)__ck_attributedStringByRemovingAllAttributesExcept:()CKUtilities;
- (id)__ck_attributedStringByTrimmingCharactersInSet:()CKUtilities;
- (id)__ck_fileTransferGUIDAtIndex:()CKUtilities;
- (id)_fileTransferForMediaObjectInMediaObjects:()CKUtilities matchingAdaptiveGlyphContentIdentifier:;
- (uint64_t)__ck_bigEmojiStyle;
- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities;
- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities mediaObjects:;
- (uint64_t)__ck_isOnlyAdaptiveImageGlyphs;
- (uint64_t)containsAttribute:()CKUtilities;
@end

@implementation NSAttributedString(CKUtilities)

- (uint64_t)containsAttribute:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "attribute:existsInRange:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (uint64_t)__ck_bigEmojiStyle
{
  return objc_msgSend(a1, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:", 1);
}

- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities
{
  return objc_msgSend(a1, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:mediaObjects:", a3, 0);
}

- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities mediaObjects:
{
  id v6 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v7 = +[CKUIBehavior sharedBehaviors];
  unint64_t v8 = [v7 maximumEmojiCountForMultipleBigEmojiFont];
  v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v10 = [a1 string];
  uint64_t v11 = [v10 length];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__NSAttributedString_CKUtilities____ck_bigEmojiStyleWithSingleBigEmojiSupported_mediaObjects___block_invoke;
  v16[3] = &unk_1E5623FF0;
  v16[4] = a1;
  id v12 = v9;
  id v17 = v12;
  v19 = &v28;
  id v13 = v6;
  id v18 = v13;
  v20 = &v24;
  v21 = &v36;
  v22 = &v32;
  unint64_t v23 = v8;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v16);
  if (*((unsigned char *)v33 + 24))
  {
    uint64_t v14 = 0;
  }
  else if (v37[3] == 1 && a3)
  {
    if (*((unsigned char *)v25 + 24))
    {
      if (*((unsigned char *)v29 + 24)) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 3;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 2 * (v37[3] - 1 < v8);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v14;
}

- (id)_fileTransferForMediaObjectInMediaObjects:()CKUtilities matchingAdaptiveGlyphContentIdentifier:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      id v20 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "transfer", v20);
          uint64_t v14 = [v13 adaptiveImageGlyphContentIdentifier];
          if ([v14 length] && objc_msgSend(v14, "isEqualToString:", v6))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v12;

              goto LABEL_18;
            }
            v15 = IMLogHandleForCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[NSAttributedString(CKUtilities) _fileTransferForMediaObjectInMediaObjects:matchingAdaptiveGlyphContentIdentifier:](&buf, v22, v15);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      id v16 = 0;
LABEL_18:
      id v5 = v20;
    }
    else
    {
      id v16 = 0;
    }

    id v18 = [v16 transfer];
    id v17 = [v18 guid];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_fileTransferGUIDIsForGenmojiOrAnimojiSticker:()CKUtilities
{
  v3 = (void *)MEMORY[0x1E4F6BCC8];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  id v6 = [v5 transferForGUID:v4];

  if (v6)
  {
    id v7 = [v6 stickerUserInfo];
    uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F6E3B8]];

    BOOL v9 = ([v8 isEqualToString:*MEMORY[0x1E4F6CBD0]] & 1) != 0
      || ([v8 isEqualToString:*MEMORY[0x1E4F6CB78]] & 1) != 0
      || [v8 isEqualToString:*MEMORY[0x1E4F6CBE0]];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (uint64_t)__ck_isOnlyAdaptiveImageGlyphs
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 1;
  }
  unint64_t v3 = v2;
  uint64_t result = objc_msgSend(a1, "__ck_hasAdaptiveImageGlyphAtIndex:", 0);
  if (result)
  {
    uint64_t v5 = 1;
    do
    {
      unint64_t v6 = v5;
      if (v3 == v5) {
        break;
      }
      char v7 = objc_msgSend(a1, "__ck_hasAdaptiveImageGlyphAtIndex:", v5);
      uint64_t v5 = v6 + 1;
    }
    while ((v7 & 1) != 0);
    return v6 >= v3;
  }
  return result;
}

- (BOOL)__ck_hasAdaptiveImageGlyphAtIndex:()CKUtilities
{
  uint64_t v5 = [a1 attribute:*MEMORY[0x1E4FB06B8] atIndex:a3 effectiveRange:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [a1 attribute:*MEMORY[0x1E4FB06B0] atIndex:a3 effectiveRange:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v8 = [a1 attribute:*MEMORY[0x1E4F6C170] atIndex:a3 effectiveRange:0];
      BOOL v6 = v8 != 0;
    }
  }

  return v6;
}

- (id)__ck_adaptiveImageGlyphAtIndex:()CKUtilities
{
  unint64_t v3 = [a1 attribute:*MEMORY[0x1E4FB06B0] atIndex:a3 effectiveRange:0];
  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }

  return v4;
}

- (id)__ck_fileTransferGUIDAtIndex:()CKUtilities
{
  unint64_t v3 = [a1 attribute:*MEMORY[0x1E4F6C188] atIndex:a3 effectiveRange:0];
  objc_opt_class();
  id v4 = 0;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }

  return v4;
}

- (id)__ck_attributedStringByRemovingAllAttributesExcept:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  objc_msgSend(v5, "__ck_removeAllAttributesExcept:", v4);

  BOOL v6 = (void *)[v5 copy];

  return v6;
}

- (id)__ck_attributedStringByTrimmingCharactersInSet:()CKUtilities
{
  id v4 = a3;
  uint64_t v5 = [a1 string];
  for (unint64_t i = 0; i < [v5 length]; ++i)
  {
    if (!objc_msgSend(v4, "characterIsMember:", (unsigned __int16)(char)objc_msgSend(v5, "characterAtIndex:", i)))break; {
  }
    }
  uint64_t v7 = [v5 length];
  do
    uint64_t v8 = v7--;
  while (v7 >= 0
       && (objc_msgSend(v4, "characterIsMember:", (unsigned __int16)(char)objc_msgSend(v5, "characterAtIndex:", v7)) & 1) != 0);
  if ((uint64_t)i <= v7)
  {
    uint64_t v9 = objc_msgSend(a1, "attributedSubstringFromRange:", i, v8 - i);
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDE4CA38];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (void)_fileTransferForMediaObjectInMediaObjects:()CKUtilities matchingAdaptiveGlyphContentIdentifier:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Found media object matching adaptive image glyph content identifier, but not of the correct media object class", buf, 2u);
}

@end