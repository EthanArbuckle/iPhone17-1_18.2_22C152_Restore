@interface NSAttributedString(RichLinks)
- (id)__ck_attributedStringByApplyingRichLinkInteraction:()RichLinks toRichLinkItems:stringDidChange:;
- (id)ck_attributedStringByPostProcessingURLTextForRichLinks;
- (id)ck_linkPreviewTextAttachmentsInRange:()RichLinks;
- (uint64_t)__ck_rangeOfRichLinkItem:()RichLinks;
@end

@implementation NSAttributedString(RichLinks)

- (id)__ck_attributedStringByApplyingRichLinkInteraction:()RichLinks toRichLinkItems:stringDidChange:
{
  id v8 = a4;
  id v9 = a1;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  id v27 = 0;
  id v27 = (id)[v9 mutableCopy];
  uint64_t v10 = [v9 length];
  uint64_t v11 = *MEMORY[0x1E4FB06B8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__NSAttributedString_RichLinks____ck_attributedStringByApplyingRichLinkInteraction_toRichLinkItems_stringDidChange___block_invoke;
  v16[3] = &unk_1E5625770;
  id v12 = v8;
  id v17 = v12;
  uint64_t v20 = a3;
  id v13 = v9;
  id v18 = v13;
  v19 = &v22;
  uint64_t v21 = a5;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v16);
  v14 = (void *)[(id)v23[5] copy];

  _Block_object_dispose(&v22, 8);

  return v14;
}

- (id)ck_attributedStringByPostProcessingURLTextForRichLinks
{
  v0 = IMAttributedStringByRemovingTrackingInformation();
  v1 = (void *)[v0 mutableCopy];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke;
  v14 = &unk_1E5625798;
  id v15 = v1;
  IMRichLinkUtilitiesEnumerateRichLinksInAttributedString();
  uint64_t v2 = [v15 length];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke_2;
  id v9 = &unk_1E5624860;
  id v10 = v15;
  id v3 = v15;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"EmbeddedRichLinkConfiguration", 0, v2, 0, &v6);
  v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

- (id)ck_linkPreviewTextAttachmentsInRange:()RichLinks
{
  v20.length = [a1 length];
  v19.location = a3;
  v19.length = a4;
  v20.location = 0;
  NSRange v7 = NSIntersectionRange(v19, v20);
  if (v7.length)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__26;
    v16 = __Block_byref_object_dispose__26;
    id v17 = 0;
    id v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = *MEMORY[0x1E4FB06B8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__NSAttributedString_RichLinks__ck_linkPreviewTextAttachmentsInRange___block_invoke;
    v11[3] = &unk_1E5624810;
    v11[4] = &v12;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, v7.location, v7.length, 0, v11);
    id v9 = (void *)[(id)v13[5] copy];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (uint64_t)__ck_rangeOfRichLinkItem:()RichLinks
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3010000000;
  v16 = "";
  long long v17 = xmmword_18F81B060;
  uint64_t v5 = [a1 length];
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NSAttributedString_RichLinks____ck_rangeOfRichLinkItem___block_invoke;
  v10[3] = &unk_1E5625748;
  id v7 = v4;
  id v11 = v7;
  uint64_t v12 = &v13;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v10);
  uint64_t v8 = v14[4];

  _Block_object_dispose(&v13, 8);
  return v8;
}

@end