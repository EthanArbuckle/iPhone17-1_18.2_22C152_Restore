@interface EMFStringUtilities
+ (BOOL)_emojiString:(id)a3 containsSubstring:(id)a4;
+ (BOOL)_genderEmojiBaseStringNeedVariantSelector:(id)a3;
+ (BOOL)_hasSkinToneVariantsForString:(id)a3;
+ (id)_baseFirstCharacterString:(id)a3;
+ (id)_baseStringForEmojiString:(id)a3;
+ (id)_coupleSkinToneChooserVariantsForString:(id)a3;
+ (id)_coupleStringWithLeftPerson:(id)a3 leftVariant:(id)a4 joiningString:(id)a5 rightPerson:(id)a6 rightVariant:(id)a7;
+ (id)_joiningStringForCoupleString:(id)a3;
+ (id)_multiPersonStringForString:(id)a3 skinToneVariantSpecifier:(id)a4;
+ (id)_normalizeMultiPersonGroupToLongFormEncoding:(id)a3;
+ (id)_normalizeMultiPersonGroupToShortFormEncoding:(id)a3;
+ (id)_preferenceIndexString:(id)a3;
+ (id)_skinToneChooserArraysForCoupleType:(int64_t)a3 joiner:(id)a4;
+ (id)_skinToneChooserVariantsForHandHoldingCoupleType:(int64_t)a3;
+ (id)_skinToneChooserVariantsForString:(id)a3;
+ (id)_skinToneChooserVariantsForString:(id)a3 usesSilhouetteSpecifiers:(BOOL)a4;
+ (id)_skinToneSpecifiersForString:(id)a3;
+ (id)_skinToneSuffixFromSpecifierType:(id)a3;
+ (id)_skinToneVariantsForCouple:(int64_t)a3 joiner:(id)a4;
+ (id)_skinToneVariantsForMultiPersonType:(int64_t)a3;
+ (id)_skinToneVariantsForString:(id)a3;
+ (id)_stringWithUnichar:(unsigned int)a3;
+ (id)_tokenizedHandshakeFromString:(id)a3;
+ (id)_tokenizedMultiPersonFromString:(id)a3;
+ (id)professionSkinToneEmojiBaseKey:(id)a3;
+ (id)skinToneSpecifierTypeFromEmojiFitzpatrickModifier:(int)a3;
+ (int)_skinToneForString:(id)a3;
+ (int)_skinToneModifierFromSpecifierType:(id)a3;
+ (int64_t)multiPersonTypeForString:(id)a3;
+ (unsigned)_firstLongCharacterOfString:(id)a3;
@end

@implementation EMFStringUtilities

+ (id)_stringWithUnichar:(unsigned int)a3
{
  if ((a3 - 0x10000) >> 20)
  {
    uint64_t v4 = 1;
    LOWORD(v3) = a3;
  }
  else
  {
    unsigned int v3 = (a3 >> 10) - 10304;
    v7[1] = a3 & 0x3FF | 0xDC00;
    uint64_t v4 = 2;
  }
  v7[0] = v3;
  v5 = [NSString stringWithCharacters:v7 length:v4];
  return v5;
}

+ (id)_preferenceIndexString:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 1
    && +[EMFEmojiCategory _isDingbatsVariantEmoji:v3])
  {
    id v4 = [v3 stringByAppendingString:@"️"];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (unsigned)_firstLongCharacterOfString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unsigned int v4 = [v3 characterAtIndex:0];
    if ((v4 & 0xFC00) == 0xD800 && (unint64_t)[v3 length] >= 2)
    {
      int v5 = [v3 characterAtIndex:1];
      if ((v5 & 0xFC00) == 0xDC00) {
        unsigned int v4 = v5 + (v4 << 10) - 56613888;
      }
    }
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

+ (id)_baseFirstCharacterString:(id)a3
{
  uint64_t v4 = [a1 _firstLongCharacterOfString:a3];
  return (id)[a1 _stringWithUnichar:v4];
}

+ (BOOL)_emojiString:(id)a3 containsSubstring:(id)a4
{
  return [a3 rangeOfString:a4 options:2] != 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)_genderEmojiBaseStringNeedVariantSelector:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"⛹"] & 1) != 0
    || ([v3 isEqualToString:@"🏋"] & 1) != 0
    || ([v3 isEqualToString:@"🏌"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"🕵"];
  }

  return v4;
}

+ (id)professionSkinToneEmojiBaseKey:(id)a3
{
  id v4 = a3;
  if ([a1 _emojiString:v4 containsSubstring:@"🏻"])
  {
    uint64_t v5 = [v4 length];
    v6 = @"🏻";
LABEL_11:
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1F126FA78, 2, 0, v5);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([a1 _emojiString:v4 containsSubstring:@"🏼"])
  {
    uint64_t v5 = [v4 length];
    v6 = @"🏼";
    goto LABEL_11;
  }
  if ([a1 _emojiString:v4 containsSubstring:@"🏽"])
  {
    uint64_t v5 = [v4 length];
    v6 = @"🏽";
    goto LABEL_11;
  }
  if ([a1 _emojiString:v4 containsSubstring:@"🏾"])
  {
    uint64_t v5 = [v4 length];
    v6 = @"🏾";
    goto LABEL_11;
  }
  if ([a1 _emojiString:v4 containsSubstring:@"🏿"])
  {
    uint64_t v5 = [v4 length];
    v6 = @"🏿";
    goto LABEL_11;
  }
  id v7 = v4;
LABEL_12:
  v8 = v7;

  return v8;
}

+ (id)_baseStringForEmojiString:(id)a3
{
  id v4 = a3;
  if (+[EMFEmojiCategory _isProfessionEmoji:v4]
    || +[EMFEmojiCategory _isFlagEmoji:v4]
    || +[EMFEmojiCategory _isMultiPersonFamilySkinToneEmoji:](EMFEmojiCategory, "_isMultiPersonFamilySkinToneEmoji:", v4)|| +[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v4)&& !+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4])
  {
    v8 = (__CFString *)v4;
    goto LABEL_13;
  }
  uint64_t v5 = [(id)objc_opt_class() multiPersonTypeForString:v4];
  if (!v5) {
    goto LABEL_17;
  }
  unint64_t v6 = v5;
  id v7 = [a1 _joiningStringForCoupleString:v4];
  if (v7
    && !+[EMFEmojiCategory _isHandholdingCoupleEmoji:v4]
    && !+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4])
  {
    if (v6 == 4)
    {
      if ([v7 isEqualToString:@"‍❤️‍"])
      {
        v8 = @"💑";
        goto LABEL_41;
      }
      if ([v7 isEqualToString:@"‍❤️‍💋‍"])
      {
        v8 = @"💏";
        goto LABEL_41;
      }
    }
    v13 = [a1 _tokenizedMultiPersonFromString:v4];
    v16 = [(__CFString *)v13 firstObject];
    v19 = [(__CFString *)v13 lastObject];
    v8 = [a1 _coupleStringWithLeftPerson:v16 leftVariant:0 joiningString:v7 rightPerson:v19 rightVariant:0];

    goto LABEL_39;
  }
  if (v6 > 5)
  {

LABEL_17:
    id v7 = [a1 professionSkinToneEmojiBaseKey:v4];
    if (+[EMFEmojiCategory _isProfessionEmoji:v7])
    {
      v8 = v7;
      goto LABEL_41;
    }
    if (([a1 _emojiString:v4 containsSubstring:@"♀"] & 1) == 0
      && ![a1 _emojiString:v4 containsSubstring:@"♂"])
    {
      v8 = [a1 _baseFirstCharacterString:v4];
      if (([(__CFString *)v8 isEqualToString:@"☝"] & 1) != 0
        || ([(__CFString *)v8 isEqualToString:@"✌"] & 1) != 0
        || [(__CFString *)v8 isEqualToString:@"✍"])
      {
        uint64_t v18 = [(__CFString *)v8 stringByAppendingString:@"️"];

        v8 = (__CFString *)v18;
      }
      goto LABEL_41;
    }
    v10 = [a1 _baseFirstCharacterString:v4];
    int v11 = [a1 _genderEmojiBaseStringNeedVariantSelector:v10];
    v12 = &stru_1F126FA78;
    if (v11) {
      v12 = @"️";
    }
    v13 = v12;

    if ([a1 _emojiString:v4 containsSubstring:@"♀"])
    {
      v14 = NSString;
      uint64_t v15 = [a1 _baseFirstCharacterString:v4];
      v16 = (void *)v15;
      v17 = @"‍♀️";
    }
    else
    {
      if (![a1 _emojiString:v4 containsSubstring:@"♂"])
      {
        v8 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v14 = NSString;
      uint64_t v15 = [a1 _baseFirstCharacterString:v4];
      v16 = (void *)v15;
      v17 = @"‍♂️";
    }
    v8 = [v14 stringWithFormat:@"%@%@%@", v15, v13, v17];
LABEL_39:

    goto LABEL_40;
  }
  v8 = off_1E61A96B0[v6 - 1];
LABEL_41:

LABEL_13:
  return v8;
}

+ (BOOL)_hasSkinToneVariantsForString:(id)a3
{
  id v4 = a3;
  if (+[EMFEmojiCategory _isMultiPersonFamilySkinToneEmoji:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v6 = [a1 _baseFirstCharacterString:v4];
    BOOL v5 = +[EMFEmojiCategory _isSkinToneEmoji:v6]
      || +[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:v6];
  }
  return v5;
}

+ (id)skinToneSpecifierTypeFromEmojiFitzpatrickModifier:(int)a3
{
  if ((a3 - 1) > 5) {
    return @"EMFSkinToneSpecifierTypeFitzpatrickNone";
  }
  else {
    return off_1E61A96D8[a3 - 1];
  }
}

+ (int)_skinToneModifierFromSpecifierType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick1_2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick6"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)_skinToneSuffixFromSpecifierType:(id)a3
{
  id v3 = a3;
  int v4 = &stru_1F126FA78;
  if (([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickNone"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick1_2"])
    {
      int v4 = @"🏻";
    }
    else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick3"])
    {
      int v4 = @"🏼";
    }
    else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick4"])
    {
      int v4 = @"🏽";
    }
    else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick5"])
    {
      int v4 = @"🏾";
    }
    else if ([v3 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrick6"])
    {
      int v4 = @"🏿";
    }
  }

  return v4;
}

+ (int)_skinToneForString:(id)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16[0] = &unk_1F1286848;
  v16[1] = &unk_1F1286860;
  v17[0] = @"🏻";
  v17[1] = @"🏼";
  v16[2] = &unk_1F1286878;
  v16[3] = &unk_1F1286890;
  v17[2] = @"🏽";
  v17[3] = @"🏾";
  v16[4] = &unk_1F12868A8;
  v17[4] = @"🏿";
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__EMFStringUtilities__skinToneForString___block_invoke;
  v8[3] = &unk_1E61A9690;
  id v11 = a1;
  id v6 = v4;
  id v9 = v6;
  v10 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  LODWORD(v4) = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return (int)v4;
}

void __41__EMFStringUtilities__skinToneForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 48) _emojiString:*(void *)(a1 + 32) containsSubstring:a3])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 intValue];
    *a4 = 1;
  }
}

+ (id)_tokenizedMultiPersonFromString:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v5 = [v3 rangeOfString:@"‍🤝‍" options:2];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v5 = [v3 rangeOfString:@"‍❤️‍💋‍" options:2], v5 != 0x7FFFFFFFFFFFFFFFLL)
    || (uint64_t v5 = [v3 rangeOfString:@"‍❤️‍" options:2], v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    id v9 = [v3 substringToIndex:v5];
    [v4 addObject:v9];
    v10 = [v3 substringFromIndex:v8 + v7];
    [v4 addObject:v10];
  }
  return v4;
}

+ (id)_tokenizedHandshakeFromString:(id)a3
{
  uint64_t v3 = _tokenizedHandshakeFromString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_tokenizedHandshakeFromString__onceToken, &__block_literal_global_2);
  }
  uint64_t v5 = [v4 componentsSeparatedByCharactersInSet:_tokenizedHandshakeFromString__zwjCharacterSet];

  return v5;
}

void __52__EMFStringUtilities__tokenizedHandshakeFromString___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"‍"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)_tokenizedHandshakeFromString__zwjCharacterSet;
  _tokenizedHandshakeFromString__zwjCharacterSet = v0;
}

+ (id)_skinToneSpecifiersForString:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v4)&& !+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4])
  {
    v47[0] = @"EMFSkinToneSpecifierTypeFitzpatrickNone";
    v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = (__CFString **)v47;
LABEL_12:
    uint64_t v12 = [v13 arrayWithObjects:v14 count:1];
    goto LABEL_13;
  }
  uint64_t v5 = [a1 _baseFirstCharacterString:v4];
  if ([v5 isEqualToString:@"👫"]) {
    goto LABEL_6;
  }
  uint64_t v6 = [a1 _baseFirstCharacterString:v4];
  if ([v6 isEqualToString:@"👬"])
  {

LABEL_6:
LABEL_7:
    uint64_t v7 = [(id)objc_opt_class() _skinToneForString:v4];
    if (v7)
    {
      uint64_t v8 = [(id)objc_opt_class() skinToneSpecifierTypeFromEmojiFitzpatrickModifier:v7];
      v45[0] = v8;
      v45[1] = v8;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      v10 = (void **)v45;
      uint64_t v11 = 2;
LABEL_9:
      uint64_t v12 = [v9 arrayWithObjects:v10 count:v11];

      goto LABEL_13;
    }
    v46 = @"EMFSkinToneSpecifierTypeFitzpatrickNone";
    v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = &v46;
    goto LABEL_12;
  }
  v16 = [a1 _baseFirstCharacterString:v4];
  char v17 = [v16 isEqualToString:@"👭"];

  if (v17) {
    goto LABEL_7;
  }
  if (+[EMFEmojiCategory _isComposedCoupleMultiSkinToneEmoji:v4])
  {
    uint64_t v18 = [(id)objc_opt_class() _tokenizedMultiPersonFromString:v4];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [(id)objc_opt_class() _skinToneForString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v24)
          {
            v25 = [(id)objc_opt_class() skinToneSpecifierTypeFromEmojiFitzpatrickModifier:v24];
            [v12 addObject:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v21);
    }
  }
  else
  {
    if (!+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4])
    {
      uint64_t v33 = [(id)objc_opt_class() _skinToneForString:v4];
      uint64_t v8 = [(id)objc_opt_class() skinToneSpecifierTypeFromEmojiFitzpatrickModifier:v33];
      v42 = v8;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      v10 = &v42;
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    v26 = [a1 _tokenizedHandshakeFromString:v4];
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v26;
    uint64_t v27 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v19);
          }
          uint64_t v31 = objc_msgSend((id)objc_opt_class(), "_skinToneForString:", *(void *)(*((void *)&v34 + 1) + 8 * j), (void)v34);
          if (v31)
          {
            v32 = [(id)objc_opt_class() skinToneSpecifierTypeFromEmojiFitzpatrickModifier:v31];
            [v12 addObject:v32];
          }
        }
        uint64_t v28 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }
  }

LABEL_13:
  return v12;
}

+ (int64_t)multiPersonTypeForString:(id)a3
{
  id v4 = a3;
  if (+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:v4])
  {
    int64_t v5 = 5;
    goto LABEL_25;
  }
  uint64_t v6 = [a1 _baseFirstCharacterString:v4];
  BOOL v7 = +[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:v6];

  if (!v7)
  {
    if (v4
      && (+[EMFEmojiCategory _isComposedCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isComposedCoupleMultiSkinToneEmoji:", v4)|| +[EMFEmojiCategory _supportsCoupleSkinToneSelection:v4]))
    {
      v10 = [(id)objc_opt_class() _tokenizedMultiPersonFromString:v4];
      uint64_t v11 = [v10 objectAtIndex:0];
      uint64_t v12 = [a1 _baseFirstCharacterString:v11];
      int v13 = [v12 isEqualToString:@"👩"];

      if (v13)
      {
        uint64_t v14 = [v10 objectAtIndex:1];
        int v15 = [a1 _baseFirstCharacterString:v14];
        char v16 = [v15 isEqualToString:@"👩"];

        if (v16)
        {
          int64_t v5 = 2;
LABEL_24:

          goto LABEL_25;
        }
        int64_t v5 = 1;
        uint64_t v27 = [v10 objectAtIndex:1];
        uint64_t v28 = [a1 _baseFirstCharacterString:v27];
        char v29 = [v28 isEqualToString:@"👨"];

        if (v29) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v21 = [v10 objectAtIndex:0];
        uint64_t v22 = [a1 _baseFirstCharacterString:v21];
        int v23 = [v22 isEqualToString:@"👨"];

        if (!v23)
        {
          int64_t v5 = 4;
          goto LABEL_24;
        }
        uint64_t v24 = [v10 objectAtIndex:1];
        v25 = [a1 _baseFirstCharacterString:v24];
        int v26 = [v25 isEqualToString:@"👨"];

        if (v26)
        {
          int64_t v5 = 3;
          goto LABEL_24;
        }
      }
    }
    int64_t v5 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = [a1 _baseFirstCharacterString:v4];
  char v9 = [v8 isEqualToString:@"👫"];

  if (v9)
  {
    int64_t v5 = 1;
  }
  else
  {
    char v17 = [a1 _baseFirstCharacterString:v4];
    char v18 = [v17 isEqualToString:@"👭"];

    if (v18)
    {
      int64_t v5 = 2;
    }
    else
    {
      id v19 = [a1 _baseFirstCharacterString:v4];
      int v20 = [v19 isEqualToString:@"👬"];

      if (v20) {
        int64_t v5 = 3;
      }
      else {
        int64_t v5 = 4;
      }
    }
  }
LABEL_25:

  return v5;
}

+ (id)_joiningStringForCoupleString:(id)a3
{
  id v3 = a3;
  id v4 = @"‍🤝‍";
  if ([v3 rangeOfString:@"‍🤝‍" options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = @"‍❤️‍💋‍";
    if ([v3 rangeOfString:@"‍❤️‍💋‍" options:2] == 0x7FFFFFFFFFFFFFFFLL
      && [v3 rangeOfString:@"💏" options:2] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v4 = @"‍❤️‍";
      if ([v3 rangeOfString:@"‍❤️‍" options:2] == 0x7FFFFFFFFFFFFFFFLL
        && [v3 rangeOfString:@"💑" options:2] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v3 isEqualToString:@"🤝"]) {
          id v4 = @"‍";
        }
        else {
          id v4 = 0;
        }
      }
    }
  }

  return v4;
}

+ (id)_skinToneChooserVariantsForHandHoldingCoupleType:(int64_t)a3
{
  v77[5] = *MEMORY[0x1E4F143B8];
  v77[0] = @"🏻";
  v77[1] = @"🏼";
  v77[2] = @"🏽";
  v77[3] = @"🏾";
  v77[4] = @"🏿";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:5];
  int64_t v5 = v4;
  switch(a3)
  {
    case 1:
      v49 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v39 = v5;
      obuint64_t j = v5;
      uint64_t v6 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        id v41 = *(id *)v66;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(id *)v66 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            v10 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", v9, @"‍🤝‍", @"👨", @"‍"];
            [v49 addObject:v10];

            uint64_t v11 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", @"‍", @"‍🤝‍", @"👨", v9];
            [v45 addObject:v11];
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
        }
        while (v7);
      }

      int v13 = v45;
      uint64_t v12 = v49;
      v75[0] = v49;
      v75[1] = v45;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      int v15 = v75;
      goto LABEL_36;
    case 2:
      v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v39 = v5;
      id v42 = v5;
      uint64_t v17 = [v42 countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v62;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v62 != v19) {
              objc_enumerationMutation(v42);
            }
            uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * j);
            uint64_t v22 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", v21, @"‍🤝‍", @"👩", @"‍"];
            [v50 addObject:v22];

            int v23 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", @"‍", @"‍🤝‍", @"👩", v21];
            [v46 addObject:v23];
          }
          uint64_t v18 = [v42 countByEnumeratingWithState:&v61 objects:v74 count:16];
        }
        while (v18);
      }

      int v13 = v46;
      uint64_t v12 = v50;
      v73[0] = v50;
      v73[1] = v46;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      int v15 = v73;
      goto LABEL_36;
    case 3:
      v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v39 = v5;
      id v43 = v5;
      uint64_t v24 = [v43 countByEnumeratingWithState:&v57 objects:v72 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v58;
        do
        {
          for (uint64_t k = 0; k != v25; ++k)
          {
            if (*(void *)v58 != v26) {
              objc_enumerationMutation(v43);
            }
            uint64_t v28 = *(void *)(*((void *)&v57 + 1) + 8 * k);
            char v29 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👨", v28, @"‍🤝‍", @"👨", @"‍"];
            [v51 addObject:v29];

            v30 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👨", @"‍", @"‍🤝‍", @"👨", v28];
            [v47 addObject:v30];
          }
          uint64_t v25 = [v43 countByEnumeratingWithState:&v57 objects:v72 count:16];
        }
        while (v25);
      }

      int v13 = v47;
      uint64_t v12 = v51;
      v71[0] = v51;
      v71[1] = v47;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      int v15 = v71;
      goto LABEL_36;
    case 4:
      char v16 = [(id)objc_opt_class() _skinToneChooserArraysForCoupleType:4 joiner:@"‍🤝‍"];
      break;
    case 5:
      v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v39 = v5;
      id v44 = v5;
      uint64_t v31 = [v44 countByEnumeratingWithState:&v53 objects:v70 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v54;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v44);
            }
            uint64_t v35 = *(void *)(*((void *)&v53 + 1) + 8 * m);
            long long v36 = [NSString stringWithFormat:@"%@%@%@%@%@", @"🫱", v35, @"‍", @"🫲", @"‍"];
            [v52 addObject:v36];

            long long v37 = [NSString stringWithFormat:@"%@%@%@%@%@", @"🫱", @"‍", @"🫲", v35, @"‍"];
            [v48 addObject:v37];
          }
          uint64_t v32 = [v44 countByEnumeratingWithState:&v53 objects:v70 count:16];
        }
        while (v32);
      }

      int v13 = v48;
      uint64_t v12 = v52;
      v69[0] = v52;
      v69[1] = v48;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      int v15 = v69;
LABEL_36:
      char v16 = [v14 arrayWithObjects:v15 count:2];

      int64_t v5 = v39;
      break;
    default:
      char v16 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }

  return v16;
}

+ (id)_skinToneChooserArraysForCoupleType:(int64_t)a3 joiner:(id)a4
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v30[0] = @"🏻";
  v30[1] = @"🏼";
  v30[2] = @"🏽";
  v30[3] = @"🏾";
  v30[4] = @"🏿";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
  uint64_t v7 = v6;
  int64_t v8 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 4)
  {
    uint64_t v9 = 0;
    v10 = 0;
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v9 = off_1E61A9708[v8];
    v10 = off_1E61A9730[v8];
    uint64_t v22 = off_1E61A9758[v8];
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (v5) {
          [a1 _coupleStringWithLeftPerson:v10 leftVariant:v18 joiningString:v5 rightPerson:v9 rightVariant:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        else {
        uint64_t v19 = [NSString stringWithFormat:@"%@%@", v22, v18];
        }
        [v11 addObject:v19];
        [v12 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v15);
  }

  v28[0] = v11;
  v28[1] = v12;
  int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];

  return v20;
}

+ (id)_skinToneChooserVariantsForString:(id)a3 usesSilhouetteSpecifiers:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() multiPersonTypeForString:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = objc_opt_class();
    if (v4)
    {
      uint64_t v9 = [v8 _skinToneChooserVariantsForHandHoldingCoupleType:v7];
    }
    else
    {
      uint64_t v10 = [v8 _joiningStringForCoupleString:v5];
      if (v10) {
        uint64_t v11 = (__CFString *)v10;
      }
      else {
        uint64_t v11 = @"‍🤝‍";
      }
      uint64_t v9 = [(id)objc_opt_class() _skinToneChooserArraysForCoupleType:v7 joiner:v11];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_coupleSkinToneChooserVariantsForString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() multiPersonTypeForString:v3];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(id)objc_opt_class() _joiningStringForCoupleString:v3];
    if (v6) {
      uint64_t v7 = (__CFString *)v6;
    }
    else {
      uint64_t v7 = @"‍🤝‍";
    }
    int64_t v8 = [(id)objc_opt_class() _skinToneChooserArraysForCoupleType:v5 joiner:v7];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (id)_skinToneChooserVariantsForString:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() multiPersonTypeForString:v3])
  {
    uint64_t v4 = [(id)objc_opt_class() _skinToneChooserVariantsForString:v3 usesSilhouetteSpecifiers:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_coupleStringWithLeftPerson:(id)a3 leftVariant:(id)a4 joiningString:(id)a5 rightPerson:(id)a6 rightVariant:(id)a7
{
  id v11 = a3;
  uint64_t v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (__CFString *)a7;
  if (!v12 || ![(__CFString *)v12 length])
  {
    uint64_t v16 = [(id)objc_opt_class() _baseStringForEmojiString:v11];

    uint64_t v12 = &stru_1F126FA78;
    id v11 = (id)v16;
  }
  if (!v15 || ![(__CFString *)v15 length])
  {
    uint64_t v17 = [(id)objc_opt_class() _baseStringForEmojiString:v14];

    uint64_t v15 = &stru_1F126FA78;
    id v14 = (id)v17;
  }
  uint64_t v18 = [NSString stringWithFormat:@"%@%@%@%@%@", v11, v12, v13, v14, v15];

  return v18;
}

+ (id)_skinToneVariantsForMultiPersonType:(int64_t)a3
{
  v102[5] = *MEMORY[0x1E4F143B8];
  v102[0] = @"🏻";
  v102[1] = @"🏼";
  v102[2] = @"🏽";
  v102[3] = @"🏾";
  v102[4] = @"🏿";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:5];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v45 = v4;
  switch(a3)
  {
    case 1:
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v6 = v4;
      uint64_t v54 = [v6 countByEnumeratingWithState:&v90 objects:v101 count:16];
      if (!v54) {
        goto LABEL_76;
      }
      uint64_t v46 = *(void *)v91;
      id v50 = v6;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v91 != v46) {
            objc_enumerationMutation(v6);
          }
          uint64_t v58 = v7;
          int64_t v8 = *(void **)(*((void *)&v90 + 1) + 8 * v7);
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v9 = v6;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v86 objects:v100 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v87;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v87 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v86 + 1) + 8 * i);
                if ([v8 isEqualToString:v14]) {
                  [NSString stringWithFormat:@"%@%@", @"👫", v8, v42, v43, v44];
                }
                else {
                uint64_t v15 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", v8, @"‍🤝‍", @"👨", v14];
                }
                [v5 addObject:v15];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v86 objects:v100 count:16];
            }
            while (v11);
          }

          uint64_t v7 = v58 + 1;
          id v6 = v50;
        }
        while (v58 + 1 != v54);
        uint64_t v54 = [v9 countByEnumeratingWithState:&v90 objects:v101 count:16];
      }
      while (v54);
      goto LABEL_77;
    case 2:
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v16 = v4;
      uint64_t v55 = [v16 countByEnumeratingWithState:&v82 objects:v99 count:16];
      if (!v55) {
        goto LABEL_75;
      }
      uint64_t v47 = *(void *)v83;
      id v51 = v16;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v83 != v47) {
            objc_enumerationMutation(v16);
          }
          uint64_t v59 = v17;
          uint64_t v18 = *(void **)(*((void *)&v82 + 1) + 8 * v17);
          long long v78 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v9 = v16;
          uint64_t v19 = [v9 countByEnumeratingWithState:&v78 objects:v98 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v79 != v21) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v23 = *(void *)(*((void *)&v78 + 1) + 8 * j);
                if ([v18 isEqualToString:v23]) {
                  [NSString stringWithFormat:@"%@%@", @"👭", v18, v42, v43, v44];
                }
                else {
                long long v24 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👩", v18, @"‍🤝‍", @"👩", v23];
                }
                [v5 addObject:v24];
              }
              uint64_t v20 = [v9 countByEnumeratingWithState:&v78 objects:v98 count:16];
            }
            while (v20);
          }

          uint64_t v17 = v59 + 1;
          id v16 = v51;
        }
        while (v59 + 1 != v55);
        uint64_t v55 = [v9 countByEnumeratingWithState:&v82 objects:v99 count:16];
      }
      while (v55);
      goto LABEL_77;
    case 3:
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v16 = v4;
      uint64_t v56 = [v16 countByEnumeratingWithState:&v74 objects:v97 count:16];
      if (v56)
      {
        uint64_t v48 = *(void *)v75;
        id v52 = v16;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v75 != v48) {
              objc_enumerationMutation(v16);
            }
            uint64_t v60 = v25;
            long long v26 = *(void **)(*((void *)&v74 + 1) + 8 * v25);
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v9 = v16;
            uint64_t v27 = [v9 countByEnumeratingWithState:&v70 objects:v96 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v71;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v71 != v29) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v70 + 1) + 8 * k);
                  if ([v26 isEqualToString:v31]) {
                    [NSString stringWithFormat:@"%@%@", @"👬", v26, v42, v43, v44];
                  }
                  else {
                  uint64_t v32 = [NSString stringWithFormat:@"%@%@%@%@%@", @"👨", v26, @"‍🤝‍", @"👨", v31];
                  }
                  [v5 addObject:v32];
                }
                uint64_t v28 = [v9 countByEnumeratingWithState:&v70 objects:v96 count:16];
              }
              while (v28);
            }

            uint64_t v25 = v60 + 1;
            id v16 = v52;
          }
          while (v60 + 1 != v56);
          uint64_t v56 = [v9 countByEnumeratingWithState:&v74 objects:v97 count:16];
        }
        while (v56);
      }
      else
      {
LABEL_75:
        id v9 = v16;
      }
      goto LABEL_77;
    case 4:
      id v9 = [(id)objc_opt_class() _skinToneVariantsForCouple:4 joiner:@"‍🤝‍"];
      [v5 addObjectsFromArray:v9];
      goto LABEL_77;
    case 5:
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v6 = v4;
      uint64_t v57 = [v6 countByEnumeratingWithState:&v66 objects:v95 count:16];
      if (v57)
      {
        uint64_t v49 = *(void *)v67;
        id v53 = v6;
        do
        {
          uint64_t v33 = 0;
          do
          {
            if (*(void *)v67 != v49) {
              objc_enumerationMutation(v6);
            }
            uint64_t v61 = v33;
            long long v34 = *(void **)(*((void *)&v66 + 1) + 8 * v33);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v9 = v6;
            uint64_t v35 = [v9 countByEnumeratingWithState:&v62 objects:v94 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v63;
              do
              {
                for (uint64_t m = 0; m != v36; ++m)
                {
                  if (*(void *)v63 != v37) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v39 = *(void *)(*((void *)&v62 + 1) + 8 * m);
                  if ([v34 isEqualToString:v39]) {
                    [NSString stringWithFormat:@"%@%@", @"🤝", v34, v42, v43, v44];
                  }
                  else {
                  long long v40 = [NSString stringWithFormat:@"%@%@%@%@%@", @"🫱", v34, @"‍", @"🫲", v39];
                  }
                  [v5 addObject:v40];
                }
                uint64_t v36 = [v9 countByEnumeratingWithState:&v62 objects:v94 count:16];
              }
              while (v36);
            }

            uint64_t v33 = v61 + 1;
            id v6 = v53;
          }
          while (v61 + 1 != v57);
          uint64_t v57 = [v9 countByEnumeratingWithState:&v66 objects:v95 count:16];
        }
        while (v57);
      }
      else
      {
LABEL_76:
        id v9 = v6;
      }
LABEL_77:

      uint64_t v4 = v45;
      break;
    default:
      break;
  }

  return v5;
}

+ (id)_skinToneVariantsForCouple:(int64_t)a3 joiner:(id)a4
{
  v34[5] = *MEMORY[0x1E4F143B8];
  id v23 = a4;
  v34[0] = @"🏻";
  v34[1] = @"🏼";
  v34[2] = @"🏽";
  v34[3] = @"🏾";
  v34[4] = @"🏿";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
  int64_t v6 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 3)
  {
    uint64_t v7 = 0;
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = off_1E61A9780[v6];
    int64_t v8 = off_1E61A97A0[v6];
  }
  id v9 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v5;
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v10;
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v12 = obj;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = [(id)objc_opt_class() _coupleStringWithLeftPerson:v8 leftVariant:v11 joiningString:v23 rightPerson:v7 rightVariant:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              [v9 addObject:v17];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v22 + 1;
      }
      while (v22 + 1 != v20);
      uint64_t v20 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }

  return v9;
}

+ (id)_skinToneVariantsForString:(id)a3
{
  v34[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() multiPersonTypeForString:v4];
  if (!v5)
  {
    int64_t v8 = [a1 _baseFirstCharacterString:v4];
    unint64_t v9 = 0x1E6196000uLL;
    if (!+[EMFEmojiCategory _isSkinToneEmoji:v8])
    {
      uint64_t v7 = 0;
      goto LABEL_39;
    }
    uint64_t v10 = [a1 _baseStringForEmojiString:v4];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v34[0] = @"🏻";
    v34[1] = @"🏼";
    v34[2] = @"🏽";
    v34[3] = @"🏾";
    v34[4] = @"🏿";
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
    uint64_t v11 = -1;
    while (![*(id *)(v9 + 2640) _isGenderEmoji:v8])
    {
      if (![*(id *)(v9 + 2640) _isProfessionEmoji:v10])
      {
        if (v11 == -1)
        {
          if ([*(id *)(v9 + 2640) _isDingbatsVariantEmoji:v8])
          {
            id v28 = [NSString stringWithFormat:@"%@%@", v8, @"️"];
          }
          else
          {
LABEL_27:
            id v28 = v10;
          }
          uint64_t v19 = v28;
          goto LABEL_29;
        }
        long long v26 = NSString;
        id v16 = [v33 objectAtIndex:v11];
        uint64_t v19 = [v26 stringWithFormat:@"%@%@", v8, v16];
        goto LABEL_24;
      }
      if (v11 == -1) {
        goto LABEL_27;
      }
      uint64_t v20 = [v10 rangeOfString:v8 options:2];
      uint64_t v22 = v21;
      id v23 = NSString;
      long long v24 = [v33 objectAtIndex:v11];
      long long v25 = [v23 stringWithFormat:@"%@%@", v8, v24];

      uint64_t v19 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v20, v22, v25);

      unint64_t v9 = 0x1E6196000;
LABEL_29:
      [v7 addObject:v19];

      if (++v11 == 5)
      {

        goto LABEL_39;
      }
    }
    id v12 = @"‍♀️";
    if (([a1 _emojiString:v4 containsSubstring:@"♀"] & 1) == 0)
    {
      if ([a1 _emojiString:v4 containsSubstring:@"♂"]) {
        id v12 = @"‍♂️";
      }
      else {
        id v12 = &stru_1F126FA78;
      }
    }
    int v13 = [a1 _genderEmojiBaseStringNeedVariantSelector:v8];
    uint64_t v14 = &stru_1F126FA78;
    if (v13) {
      uint64_t v14 = @"️";
    }
    uint64_t v15 = v14;
    id v16 = v15;
    uint64_t v17 = NSString;
    if (v11 == -1)
    {
      uint64_t v19 = [NSString stringWithFormat:@"%@%@%@", v8, v15, v12];
    }
    else
    {
      uint64_t v18 = [v33 objectAtIndex:v11];
      uint64_t v19 = [v17 stringWithFormat:@"%@%@%@", v8, v18, v12];
    }
    if ([v4 hasSuffix:@"‍➡️"])
    {
      uint64_t v27 = [v19 stringByAppendingString:@"‍➡️"];

      uint64_t v19 = (void *)v27;
    }
    unint64_t v9 = 0x1E6196000;
LABEL_24:

    goto LABEL_29;
  }
  uint64_t v6 = v5;
  if (v5 == 5)
  {
    uint64_t v7 = [(id)objc_opt_class() _skinToneVariantsForMultiPersonType:5];
    goto LABEL_40;
  }
  uint64_t v29 = [(id)objc_opt_class() _joiningStringForCoupleString:v4];
  if (v29) {
    int64_t v8 = (__CFString *)v29;
  }
  else {
    int64_t v8 = @"‍🤝‍";
  }
  BOOL v30 = +[EMFEmojiCategory _isHandholdingCoupleEmoji:v4];
  long long v31 = objc_opt_class();
  if (v30) {
    [v31 _skinToneVariantsForMultiPersonType:v6];
  }
  else {
  uint64_t v7 = [v31 _skinToneVariantsForCouple:v6 joiner:v8];
  }
LABEL_39:

LABEL_40:
  return v7;
}

+ (id)_multiPersonStringForString:(id)a3 skinToneVariantSpecifier:(id)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() multiPersonTypeForString:v6];
  if (!v8)
  {
    uint64_t v17 = 0;
    goto LABEL_47;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(id)objc_opt_class() _joiningStringForCoupleString:v6];
  int v11 = [v7 containsObject:@"EMFSkinToneSpecifierTypeFitzpatrickSilhouette"];
  if (v11)
  {
    id v12 = [v7 firstObject];
    char v13 = [v12 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickSilhouette"];

    if (v13)
    {
      uint64_t v14 = [v7 lastObject];
      char v15 = [v14 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickSilhouette"];

      if (v15)
      {
        if (v10) {
          goto LABEL_12;
        }
        id v16 = @"EMFSkinToneSpecifierTypeFitzpatrick6";
LABEL_11:
        v50[0] = v16;
        v50[1] = v16;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];

        id v7 = (id)v19;
        goto LABEL_12;
      }
      uint64_t v18 = [v7 lastObject];
    }
    else
    {
      uint64_t v18 = [v7 firstObject];
    }
    id v16 = (__CFString *)v18;
    if (!v18) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = [v7 firstObject];
  uint64_t v22 = [v20 _skinToneSuffixFromSpecifierType:v21];

  if ([v7 count] == 2)
  {
    id v23 = objc_opt_class();
    long long v24 = [v7 lastObject];
    id v25 = [v23 _skinToneSuffixFromSpecifierType:v24];

    if (!v10) {
      goto LABEL_21;
    }
  }
  else
  {
    id v25 = v22;
    if (!v10) {
      goto LABEL_21;
    }
  }
  char v26 = [v10 isEqualToString:@"‍🤝‍"];
  if (v9 != 5 && (v26 & 1) == 0)
  {
    uint64_t v27 = [v22 length];
    id v28 = objc_opt_class();
    if (v9 == 4 || v27)
    {
      long long v34 = [v28 _tokenizedMultiPersonFromString:v6];
      if ((unint64_t)[v34 count] <= 1)
      {

        long long v34 = &unk_1F1286908;
      }
      uint64_t v48 = objc_opt_class();
      uint64_t v49 = [v34 firstObject];
      uint64_t v35 = [a1 _baseStringForEmojiString:v49];
      uint64_t v36 = [v34 lastObject];
      uint64_t v37 = [a1 _baseStringForEmojiString:v36];
      BOOL v30 = [v48 _coupleStringWithLeftPerson:v35 leftVariant:v22 joiningString:v10 rightPerson:v37 rightVariant:v25];
    }
    else
    {
      uint64_t v29 = [v28 _baseStringForEmojiString:v6];
LABEL_45:
      BOOL v30 = (__CFString *)v29;
    }
    goto LABEL_46;
  }
LABEL_21:
  BOOL v30 = 0;
  switch(v9)
  {
    case 1:
      BOOL v30 = @"👫";
      if (v22 && v25)
      {
        int v31 = v11 | [v22 isEqualToString:v25] ^ 1;
        uint64_t v32 = NSString;
        if ((v31 & 1) == 0) {
          goto LABEL_43;
        }
        v45 = @"👨";
        id v47 = v25;
        uint64_t v43 = @"‍🤝‍";
        uint64_t v33 = @"👩";
        goto LABEL_42;
      }
      break;
    case 2:
      BOOL v30 = @"👭";
      if (v22 && v25)
      {
        int v38 = v11 | [v22 isEqualToString:v25] ^ 1;
        uint64_t v32 = NSString;
        if ((v38 & 1) == 0) {
          goto LABEL_43;
        }
        id v47 = v25;
        uint64_t v33 = @"👩";
        goto LABEL_37;
      }
      break;
    case 3:
      BOOL v30 = @"👬";
      if (v22 && v25)
      {
        int v39 = v11 | [v22 isEqualToString:v25] ^ 1;
        uint64_t v32 = NSString;
        if ((v39 & 1) == 0) {
          goto LABEL_43;
        }
        id v47 = v25;
        uint64_t v33 = @"👨";
LABEL_37:
        uint64_t v43 = @"‍🤝‍";
        v45 = v33;
        goto LABEL_42;
      }
      break;
    case 5:
      BOOL v30 = @"🤝";
      if (v22 && v25)
      {
        int v40 = v11 | [v22 isEqualToString:v25] ^ 1;
        uint64_t v32 = NSString;
        if (v40)
        {
          v45 = @"🫲";
          id v47 = v25;
          uint64_t v43 = @"‍";
          uint64_t v33 = @"🫱";
LABEL_42:
          [v32 stringWithFormat:@"%@%@%@%@%@", v33, v22, v43, v45, v47];
        }
        else
        {
LABEL_43:
          [v32 stringWithFormat:@"%@%@", v30, v22, v42, v44, v46];
        uint64_t v29 = };
        goto LABEL_45;
      }
      break;
    default:
      break;
  }
LABEL_46:
  uint64_t v17 = v30;

LABEL_47:
  return v17;
}

+ (id)_normalizeMultiPersonGroupToShortFormEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1BA9C9AC0]();
  uint64_t v6 = [a1 multiPersonTypeForString:v4];
  if (!v6
    || (unint64_t v7 = v6, (unint64_t)[v4 length] < 3)
    || [v4 rangeOfString:@"‍❤️‍" options:2] != 0x7FFFFFFFFFFFFFFFLL
    || [v4 rangeOfString:@"‍❤️‍💋‍" options:2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v4;
    goto LABEL_9;
  }
  uint64_t v8 = [MEMORY[0x1E4F28E78] stringWithCapacity:4];
  uint64_t v9 = v8;
  if (v7 < 6 && ((0x17u >> (v7 - 1)) & 1) != 0)
  {
    [v8 appendString:off_1E61A97C0[v7 - 1]];
    id v12 = [a1 _skinToneSpecifiersForString:v4];
    if ([v12 count])
    {
      char v13 = [v12 firstObject];
      int v14 = [v13 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickNone"];

      if (!v14)
      {
        if ([v12 count] != 2
          || ([v12 objectAtIndexedSubscript:0],
              id v16 = objc_claimAutoreleasedReturnValue(),
              [v12 objectAtIndexedSubscript:1],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              v17,
              v16,
              v16 != v17))
        {
          id v15 = v4;
          goto LABEL_18;
        }
        uint64_t v18 = [v12 objectAtIndexedSubscript:0];
        uint64_t v19 = [a1 _skinToneSuffixFromSpecifierType:v18];
        [v9 appendString:v19];
      }
    }
    id v15 = (id)[v9 copy];
LABEL_18:
    id v10 = v15;

    goto LABEL_19;
  }
  id v10 = v4;
LABEL_19:

LABEL_9:

  return v10;
}

+ (id)_normalizeMultiPersonGroupToLongFormEncoding:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1BA9C9AC0]();
  uint64_t v6 = [a1 multiPersonTypeForString:v4];
  if (!v6
    || (unint64_t v7 = v6, (unint64_t)[v4 length] > 4)
    || [v4 rangeOfString:@"‍❤️‍" options:2] != 0x7FFFFFFFFFFFFFFFLL
    || [v4 rangeOfString:@"‍❤️‍💋‍" options:2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v4;
    goto LABEL_9;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v9 = v8;
  if (v7 < 6 && ((0x17u >> (v7 - 1)) & 1) != 0)
  {
    [v8 appendString:off_1E61A97E8[v7 - 1]];
    id v12 = [a1 _skinToneSpecifiersForString:v4];
    if (![v12 count]
      || ([v12 firstObject],
          char v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isEqualToString:@"EMFSkinToneSpecifierTypeFitzpatrickNone"],
          v13,
          v14))
    {
      id v10 = (id)[v9 copy];
LABEL_25:

      goto LABEL_26;
    }
    if ([v12 count] == 1)
    {
      id v15 = [v12 objectAtIndexedSubscript:0];
      id v16 = [a1 _skinToneSuffixFromSpecifierType:v15];

      v25[0] = v16;
      v25[1] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    }
    else
    {
      if ([v12 count] != 2)
      {
        uint64_t v17 = 0;
        goto LABEL_21;
      }
      id v16 = [v12 objectAtIndexedSubscript:0];
      uint64_t v18 = [a1 _skinToneSuffixFromSpecifierType:v16];
      v24[0] = v18;
      uint64_t v19 = [v12 objectAtIndexedSubscript:1];
      uint64_t v20 = [a1 _skinToneSuffixFromSpecifierType:v19];
      v24[1] = v20;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    }
LABEL_21:
    if (v7 == 5) {
      uint64_t v21 = 7;
    }
    else {
      uint64_t v21 = 10;
    }
    uint64_t v22 = [v17 objectAtIndexedSubscript:0];
    [v9 insertString:v22 atIndex:2];

    id v23 = [v17 objectAtIndexedSubscript:1];
    [v9 insertString:v23 atIndex:v21];

    id v10 = (id)[v9 copy];
    goto LABEL_25;
  }
  id v10 = v4;
LABEL_26:

LABEL_9:

  return v10;
}

@end