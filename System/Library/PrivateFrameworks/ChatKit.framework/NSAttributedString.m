@interface NSAttributedString
@end

@implementation NSAttributedString

void __94__NSAttributedString_CKUtilities____ck_bigEmojiStyleWithSingleBigEmojiSupported_mediaObjects___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v24 = a2;
  int IsSingleEmoji = CEMStringIsSingleEmoji();
  int v11 = [v24 isEqualToString:*MEMORY[0x1E4F6C110]];
  if (v11) {
    int v12 = objc_msgSend(*(id *)(a1 + 32), "__ck_hasAdaptiveImageGlyphAtIndex:", a3);
  }
  else {
    int v12 = 0;
  }
  v13 = [v24 stringByTrimmingCharactersInSet:*(void *)(a1 + 40)];
  uint64_t v14 = [v13 length];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v15 = objc_msgSend(*(id *)(a1 + 32), "__ck_fileTransferGUIDAtIndex:", a3);
    if (v15) {
      int v16 = 0;
    }
    else {
      int v16 = v12;
    }
    if (v16 == 1)
    {
      if (*(void *)(a1 + 48))
      {
        v17 = objc_msgSend(*(id *)(a1 + 32), "__ck_adaptiveImageGlyphAtIndex:", a3);
        v18 = *(void **)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 48);
        v20 = [v17 contentIdentifier];
        v15 = [v18 _fileTransferForMediaObjectInMediaObjects:v19 matchingAdaptiveGlyphContentIdentifier:v20];
      }
      else
      {
        v15 = 0;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _fileTransferGUIDIsForGenmojiOrAnimojiSticker:v15];
  }
  if (IsSingleEmoji) {
    int v21 = 1;
  }
  else {
    int v21 = v12;
  }
  if (v21 == 1)
  {
    if (IsSingleEmoji) {
      char v22 = 0;
    }
    else {
      char v22 = v12;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22;
    if (++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) <= *(void *)(a1 + 88)) {
      goto LABEL_28;
    }
  }
  else
  {
    if (v14) {
      char v23 = v11;
    }
    else {
      char v23 = 1;
    }
    if (v23) {
      goto LABEL_28;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  *a7 = 1;
LABEL_28:
}

void __65__NSAttributedString_TextEffects__ck_actionForIMTextStyle_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7 = a2;
  if (v7)
  {
    id v11 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v11;
    if (isKindOfClass)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      v10.location = *(void *)(v9 + 32);
      if (v10.location == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(void *)(v9 + 32) = a3;
        *(void *)(v9 + 40) = a4;
      }
      else
      {
        v10.length = *(void *)(v9 + 40);
        v13.location = a3;
        v13.length = a4;
        *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = NSUnionRange(v10, v13);
        id v7 = v11;
      }
    }
  }
}

void __116__NSAttributedString_RichLinks____ck_attributedStringByApplyingRichLinkInteraction_toRichLinkItems_stringDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = v7;
    if (![*(id *)(a1 + 32) containsObject:v8])
    {
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9 == 2)
    {
      v15 = [v8 urlText];
      BOOL v14 = 0;
      if (v15)
      {
LABEL_8:
        uint64_t v16 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "__ck_rangeOfRichLinkItem:", v8);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled())
          {
            v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = [*(id *)(a1 + 32) count];
              int v24 = 134217984;
              uint64_t v25 = v19;
              _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "String inconsistency! While traversing a string with {%ld} targeted rich links, the text attachment was not found in the output string.", (uint8_t *)&v24, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v20 = v16;
          uint64_t v21 = v17 + v14;
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], v16, v21);
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "replaceCharactersInRange:withString:", v20, v21, v15);
          uint64_t v22 = [(__CFString *)v15 length];
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addAttribute:value:range:", *MEMORY[0x1E4F6D4F8], MEMORY[0x1E4F1CC28], v20, v22);
          char v23 = *(unsigned char **)(a1 + 64);
          if (v23) {
            *char v23 = 1;
          }
        }
      }
    }
    else
    {
      if (!v9)
      {
        uint64_t v10 = a3 + a4;
        BOOL v11 = v10 + 1 <= (unint64_t)[*(id *)(a1 + 40) length];
        int v12 = [*(id *)(a1 + 40) string];
        NSRange v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
        BOOL v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v13, 12, v10, v11) != 0x7FFFFFFFFFFFFFFFLL;

        v15 = &stru_1EDE4CA38;
        goto LABEL_8;
      }
      v15 = 0;
    }

    goto LABEL_17;
  }
LABEL_18:
}

void __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:a2];
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", @"EmbeddedRichLinkConfiguration", v7, a3, a4);
  }
}

uint64_t __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "replaceCharactersInRange:withString:", a3, a4, *MEMORY[0x1E4F6C110]);
  }
  return result;
}

void __70__NSAttributedString_RichLinks__ck_linkPreviewTextAttachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

uint64_t __58__NSAttributedString_RichLinks____ck_rangeOfRichLinkItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    if (*(void *)(result + 32) == a2)
    {
      uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
      *(void *)(v5 + 32) = a3;
      *(void *)(v5 + 40) = a4;
      *a5 = 1;
    }
  }
  return result;
}

void __99__NSAttributedString_MentionsHelper__ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __99__NSAttributedString_MentionsHelper__ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __109__NSAttributedString_CKMessageEntryRichTextViewHelper__ck_enumerateAllMentionAnimationIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    int v12 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v12;
    if (isKindOfClass)
    {
      id v9 = v12;
      if ([v9 length])
      {
        uint64_t v10 = *(void *)(a1 + 32);
        BOOL v11 = (void *)[v9 copy];
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v10 + 16))(v10, v11, a3, a4);
      }
      id v7 = v12;
    }
  }
}

void __86__NSAttributedString_CompositionSanitizing__ck_defaultAllowedAttributesForComposition__block_invoke()
{
  v10[14] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4FB06B0];
  v10[0] = *MEMORY[0x1E4FB06B8];
  v10[1] = v1;
  v10[2] = @"com.apple.messages.mapattribute";
  v10[3] = @"com.apple.MobileSMS.PluginPayload";
  uint64_t v2 = *MEMORY[0x1E4F6E400];
  v10[4] = @"com.apple.MobileSMS.appendedURL";
  v10[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F6E408];
  v10[6] = *MEMORY[0x1E4F6E3F8];
  v10[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F6E410];
  v10[8] = *MEMORY[0x1E4F6E420];
  v10[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB0768];
  v10[10] = *MEMORY[0x1E4FB0808];
  v10[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F6D538];
  v10[12] = *MEMORY[0x1E4FB06F8];
  v10[13] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
  uint64_t v8 = [v0 setWithArray:v7];
  id v9 = (void *)ck_defaultAllowedAttributesForComposition_sAttributes;
  ck_defaultAllowedAttributesForComposition_sAttributes = v8;
}

@end