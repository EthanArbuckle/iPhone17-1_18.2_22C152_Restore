@interface NSMutableAttributedString(TextEffects)
- (id)_ck_intersectingTextAnimationOnRange:()TextEffects getExistingAnimationRange:;
- (uint64_t)ck_applyTextStyle:()TextEffects options:range:;
- (uint64_t)ck_applyTextStyle:()TextEffects range:;
- (uint64_t)ck_canApplyTextEffectInRange:()TextEffects;
- (uint64_t)ck_removeAnimatedTextEffectsFromRange:()TextEffects;
- (void)ck_addTextStyle:()TextEffects options:range:;
- (void)ck_applyTextEffectType:()TextEffects range:;
- (void)ck_convertAttributesUsingConversionHandler:()TextEffects range:;
- (void)ck_toggleTextEffectNamed:()TextEffects range:getAdded:;
- (void)ck_toggleTextEffectType:()TextEffects range:getAdded:;
@end

@implementation NSMutableAttributedString(TextEffects)

- (void)ck_toggleTextEffectType:()TextEffects range:getAdded:
{
  IMTextEffectNameFromType();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ck_toggleTextEffectNamed:range:getAdded:", v10, a4, a5, a6);
}

- (void)ck_toggleTextEffectNamed:()TextEffects range:getAdded:
{
  id v10 = a3;
  uint64_t v11 = IMTextEffectTypeFromName();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = *MEMORY[0x1E4F6E400];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__NSMutableAttributedString_TextEffects__ck_toggleTextEffectNamed_range_getAdded___block_invoke;
  v15[3] = &unk_1E5624838;
  v15[4] = &v16;
  v15[5] = v11;
  v15[6] = a4;
  v15[7] = a5;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, 0, v15);
  v13 = v17;
  if (a6) {
    *a6 = *((unsigned char *)v17 + 24);
  }
  if (*((unsigned char *)v13 + 24)) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0;
  }
  objc_msgSend(a1, "ck_applyTextEffectType:range:", v14, a4, a5);
  _Block_object_dispose(&v16, 8);
}

- (uint64_t)ck_canApplyTextEffectInRange:()TextEffects
{
  uint64_t result = [a1 length];
  if (result) {
    return a3 < [a1 length] && a3 + a4 <= objc_msgSend(a1, "length");
  }
  return result;
}

- (uint64_t)ck_removeAnimatedTextEffectsFromRange:()TextEffects
{
  uint64_t result = objc_msgSend(a1, "ck_canApplyTextEffectInRange:");
  if (result)
  {
    uint64_t v8 = *MEMORY[0x1E4F6E400];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke;
    v11[3] = &unk_1E5624860;
    v11[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a3, a4, 0, v11);
    uint64_t v9 = *MEMORY[0x1E4FB0788];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke_2;
    v10[3] = &unk_1E5624860;
    v10[4] = a1;
    return objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v9, a3, a4, 0, v10);
  }
  return result;
}

- (id)_ck_intersectingTextAnimationOnRange:()TextEffects getExistingAnimationRange:
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3010000000;
  v22 = "";
  long long v23 = xmmword_18F81B060;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  id v18 = 0;
  uint64_t v9 = [a1 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__NSMutableAttributedString_TextEffects___ck_intersectingTextAnimationOnRange_getExistingAnimationRange___block_invoke;
  v12[3] = &unk_1E5624888;
  v12[6] = a3;
  v12[7] = a4;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(a1, "ck_enumerateTextAnimationsIn:options:using:", 0, v9, 0, v12);
  if (a5) {
    *a5 = *((_OWORD *)v20 + 2);
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

- (void)ck_applyTextEffectType:()TextEffects range:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ck_canApplyTextEffectInRange:", a4, a5))
  {
    long long v54 = xmmword_18F81B060;
    v36 = objc_msgSend(a1, "_ck_intersectingTextAnimationOnRange:getExistingAnimationRange:", 0, objc_msgSend(a1, "length"), &v54);
    uint64_t v38 = *MEMORY[0x1E4F6E400];
    objc_msgSend(a1, "removeAttribute:range:");
    uint64_t v39 = *MEMORY[0x1E4FB0788];
    objc_msgSend(a1, "removeAttribute:range:");
    objc_msgSend(a1, "ck_removeTextStyles:options:range:", *MEMORY[0x1E4F6E418], 3, a4, a5);
    if (a3)
    {
      uint64_t v8 = *MEMORY[0x1E4F6D538];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke;
      v53[3] = &unk_1E5624860;
      v53[4] = a1;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a4, a5, 0, v53);
      uint64_t v33 = 0;
      uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      if ((void)v54 != 0x7FFFFFFFFFFFFFFFLL && a4 > (unint64_t)v54)
      {
        unint64_t v9 = a4 + a5;
        unint64_t v10 = *((void *)&v54 + 1) + v54;
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        if (a4 + a5 < *((void *)&v54 + 1) + (void)v54) {
          uint64_t v11 = a4 + a5;
        }
        BOOL v12 = v10 >= v9;
        uint64_t v13 = v10 - v9;
        if (!v12) {
          uint64_t v13 = 0;
        }
        uint64_t v33 = v13;
        uint64_t v35 = v11;
      }
      v41 = IMTextEffectNameFromType();
      uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v49 = 0;
      v50 = &v49;
      uint64_t v51 = 0x2020000000;
      unint64_t v52 = a4;
      uint64_t v15 = *MEMORY[0x1E4FB06B8];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke_2;
      v46[3] = &unk_1E56248B0;
      v48 = &v49;
      id v16 = v14;
      id v47 = v16;
      objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v15, a4, a5, 0, v46);
      if (a4 + a5 > v50[3])
      {
        v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
        [v16 addObject:v17];
      }
      if (!objc_msgSend(v16, "count", v33))
      {
        id v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4, a5);
        [v16 addObject:v18];
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v16;
      uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = [*(id *)(*((void *)&v42 + 1) + 8 * i) rangeValue];
            uint64_t v24 = v23;
            v25 = [MEMORY[0x1E4F43368] animationWithName:v41];
            if (v25)
            {
              objc_msgSend(a1, "addAttribute:value:range:", v39, v25, v22, v24);
              v26 = [NSNumber numberWithInteger:a3];
              objc_msgSend(a1, "addAttribute:value:range:", v38, v26, v22, v24);
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v42 objects:v55 count:16];
        }
        while (v19);
      }

      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = (void *)MEMORY[0x1E4F43368];
        v28 = [v36 name];
        v29 = [v27 animationWithName:v28];

        if (v29)
        {
          objc_msgSend(a1, "removeAttribute:range:", v38, v35, v34);
          objc_msgSend(a1, "removeAttribute:range:", v39, v35, v34);
          objc_msgSend(a1, "addAttribute:value:range:", v39, v29, v35, v34);
          v30 = [v36 name];
          uint64_t v31 = IMTextEffectTypeFromName();

          v32 = [NSNumber numberWithInteger:v31];
          objc_msgSend(a1, "addAttribute:value:range:", v38, v32, v35, v34);
        }
      }

      _Block_object_dispose(&v49, 8);
    }
  }
}

- (uint64_t)ck_applyTextStyle:()TextEffects range:
{
  return objc_msgSend(a1, "ck_applyTextStyle:options:range:", a3, 1, a4, a5);
}

- (uint64_t)ck_applyTextStyle:()TextEffects options:range:
{
  uint64_t result = objc_msgSend(a1, "ck_actionForIMTextStyle:range:", a3, a5, a6);
  if (result == 1)
  {
    return objc_msgSend(a1, "ck_removeTextStyle:options:range:", a3, a4, a5, a6);
  }
  else if (!result)
  {
    return objc_msgSend(a1, "ck_addTextStyle:options:range:", a3, a4, a5, a6);
  }
  return result;
}

- (void)ck_addTextStyle:()TextEffects options:range:
{
  if (a4)
  {
    uint64_t v11 = *MEMORY[0x1E4F6E400];
    uint64_t v12 = [a1 length];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke;
    v31[3] = &unk_1E56248D8;
    v31[5] = a5;
    v31[6] = a6;
    v31[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v31);
  }
  if ((a4 & 2) != 0)
  {
    uint64_t v13 = *MEMORY[0x1E4FB0788];
    uint64_t v14 = [a1 length];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2;
    v30[3] = &unk_1E56248D8;
    v30[5] = a5;
    v30[6] = a6;
    v30[4] = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, v30);
  }
  switch(a3)
  {
    case 1:
      if (a4) {
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4F6E3F8], &unk_1EDF16310, a5, a6);
      }
      if ((a4 & 2) != 0)
      {
        uint64_t v15 = (void *)[a1 copy];
        id v16 = v15;
        uint64_t v17 = *MEMORY[0x1E4FB06F8];
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_103;
        v28 = &unk_1E5624900;
        v29 = a1;
        id v18 = &v25;
        goto LABEL_14;
      }
      break;
    case 2:
      if (a4) {
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4F6E408], &unk_1EDF16310, a5, a6);
      }
      if ((a4 & 2) != 0)
      {
        uint64_t v15 = (void *)[a1 copy];
        id v16 = v15;
        uint64_t v17 = *MEMORY[0x1E4FB06F8];
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2_106;
        uint64_t v23 = &unk_1E5624900;
        uint64_t v24 = a1;
        id v18 = &v20;
LABEL_14:
        objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v17, a5, a6, 0, v18, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
      }
      break;
    case 4:
      if (a4) {
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4F6E420], &unk_1EDF16310, a5, a6);
      }
      if ((a4 & 2) != 0)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4FB0808];
        goto LABEL_23;
      }
      break;
    case 8:
      if (a4) {
        objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4F6E410], &unk_1EDF16310, a5, a6);
      }
      if ((a4 & 2) != 0)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4FB0768];
LABEL_23:
        objc_msgSend(a1, "addAttribute:value:range:", *v19, &unk_1EDF16328, a5, a6);
      }
      break;
    default:
      return;
  }
}

- (void)ck_convertAttributesUsingConversionHandler:()TextEffects range:
{
  uint64_t v8 = a3;
  id v10 = [a1 attributesAtIndex:a4 effectiveRange:0];
  unint64_t v9 = v8[2](v8, v10);

  objc_msgSend(a1, "setAttributes:range:", v9, a4, a5);
}

@end