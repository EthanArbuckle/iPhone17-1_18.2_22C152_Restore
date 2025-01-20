@interface BRLTJJapaneseProcessor
- (BOOL)isWordDescriptionLike:(id)a3;
- (BRLTJJapaneseProcessor)init;
- (id)longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4;
- (id)replaceKataWithHira:(id)a3;
- (id)spacedYomiOfWordDescription:(id)a3;
@end

@implementation BRLTJJapaneseProcessor

- (BRLTJJapaneseProcessor)init
{
  v8.receiver = self;
  v8.super_class = (Class)BRLTJJapaneseProcessor;
  v2 = [(BRLTJJapaneseProcessor *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 pathForResource:@"KataToHira" ofType:@"plist"];

    uint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:v4];
    kataToHira = v2->_kataToHira;
    v2->_kataToHira = (NSDictionary *)v5;
  }
  return v2;
}

- (id)longVowelExpressedFor:(id)a3 partOfSpeech:(int64_t)a4
{
  id v5 = a3;
  if (([v5 isEqual:@"うろうろ"] & 1) != 0
    || [v5 isEqual:@"こうり"])
  {
    id v6 = v5;
    goto LABEL_4;
  }
  id v6 = (id)objc_opt_new();
  if ([v5 length])
  {
    char v8 = 0;
    for (unint64_t i = 0; i < [v5 length]; ++i)
    {
      objc_msgSend(v5, "substringWithRange:", i, 1);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8) {
        int v12 = [(__CFString *)v10 isEqual:@"う"];
      }
      else {
        int v12 = 0;
      }
      if (a4 == 1)
      {
        BOOL v13 = i == [v5 length] - 1;
        if (!v12) {
          goto LABEL_18;
        }
      }
      else
      {
        BOOL v13 = 0;
        if (!v12) {
          goto LABEL_18;
        }
      }
      if (v13)
      {
LABEL_18:
        v14 = v6;
        v15 = v11;
        goto LABEL_19;
      }
      v14 = v6;
      v15 = @"ー";
LABEL_19:
      [v14 appendString:v15];
      if ([&unk_26CCC2A40 containsObject:v11]) {
        char v8 = 1;
      }
      else {
        char v8 = [&unk_26CCC2A58 containsObject:v11];
      }
    }
  }
LABEL_4:

  return v6;
}

- (BOOL)isWordDescriptionLike:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_kataToHira && (unint64_t)[v4 length] >= 2)
  {
    if ([v5 length])
    {
      for (unint64_t i = 0; i < [v5 length]; ++i)
      {
        char v8 = objc_msgSend(v5, "substringWithRange:", i, 1);
        v9 = [(NSDictionary *)self->_kataToHira objectForKey:v8];
        if (v9 || ([v8 isEqual:@"、"] & 1) != 0)
        {
        }
        else if (([v8 isEqual:@" "] & 1) == 0)
        {

          goto LABEL_3;
        }
      }
    }
    BOOL v6 = 1;
  }
  else
  {
LABEL_3:
    BOOL v6 = 0;
  }

  return v6;
}

- (id)replaceKataWithHira:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_kataToHira)
  {
    id v6 = (id)objc_opt_new();
    if ([v5 length])
    {
      unint64_t v7 = 0;
      do
      {
        char v8 = objc_msgSend(v5, "substringWithRange:", v7, 1);
        v9 = [(NSDictionary *)self->_kataToHira objectForKey:v8];
        if (v9) {
          v10 = v9;
        }
        else {
          v10 = v8;
        }
        [v6 appendString:v10];

        ++v7;
      }
      while (v7 < [v5 length]);
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)spacedYomiOfWordDescription:(id)a3
{
  v3 = [(BRLTJJapaneseProcessor *)self replaceKataWithHira:a3];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v5 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"ja");
  v48.location = 0;
  v48.length = 0;
  id v6 = CFStringTokenizerCreate(v4, 0, v48, 0, v5);
  CFRelease(v5);
  v49.length = CFStringGetLength(v3);
  v49.location = 0;
  CFStringTokenizerSetString(v6, v3, v49);
  unint64_t v7 = objc_opt_new();
  char v8 = objc_opt_new();
  CFIndex v9 = 0;
  if (CFStringTokenizerAdvanceToNextToken(v6))
  {
    int v43 = 0;
    unint64_t v10 = 0x263F08000uLL;
    v41 = v8;
    v42 = v7;
    v40 = v6;
    do
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      int v12 = -[__CFString substringWithRange:](v3, "substringWithRange:", v9, CurrentTokenRange.location - v9);
      [v7 appendString:v12];

      CFIndex v13 = v9;
      if (CurrentTokenRange.location > v9)
      {
        do
        {
          v14 = [*(id *)(v10 + 2584) numberWithInteger:v13];
          [v8 addObject:v14];

          ++v13;
        }
        while (CurrentTokenRange.location != v13);
      }
      v15 = (void *)CFStringTokenizerCopyCurrentTokenAttribute(v6, 0x400000uLL);
      int CurrentTokenPartOfSpeech = _CFStringTokenizerGetCurrentTokenPartOfSpeech();
      if ([v7 length] && CurrentTokenRange.location == v9 && ((v43 ^ 1) & 1) == 0)
      {
        [v7 appendString:@" "];
        v17 = [*(id *)(v10 + 2584) numberWithInteger:v9 - 1];
        [v8 addObject:v17];
      }
      unint64_t v18 = 0;
      uint64_t v44 = CurrentTokenPartOfSpeech;
      CFIndex v46 = CurrentTokenRange.length + CurrentTokenRange.location;
      uint64_t v19 = -1;
      while ((CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63)) != v18)
      {
        CFIndex v20 = v18;
        if (v18 < [v15 length])
        {
          v21 = v3;
          v22 = -[__CFString substringWithRange:](v3, "substringWithRange:", v46 + v19, 1);
          v23 = objc_msgSend(v15, "substringWithRange:", objc_msgSend(v15, "length") + v19, 1);
          v24 = [(NSDictionary *)self->_kataToHira objectForKey:v22];
          v25 = v24;
          if (v24)
          {
            id v26 = v24;

            v22 = v26;
          }
          char v27 = [v22 isEqual:v23];
          ++v18;

          --v19;
          v3 = v21;
          if (v27) {
            continue;
          }
        }
        goto LABEL_17;
      }
      CFIndex v20 = CurrentTokenRange.length & ~(CurrentTokenRange.length >> 63);
LABEL_17:
      char v8 = v41;
      if ([v15 length] != v20)
      {
        unint64_t v28 = 0;
        do
        {
          v29 = [NSNumber numberWithLong:CurrentTokenRange.location];
          [v41 addObject:v29];

          ++v28;
        }
        while (v28 < [v15 length] - v20);
      }
      CFIndex v9 = CurrentTokenRange.length + CurrentTokenRange.location;
      if (v20)
      {
        uint64_t v30 = v20 + 1;
        CFIndex v31 = CurrentTokenRange.length + CurrentTokenRange.location - v20;
        do
        {
          v32 = [NSNumber numberWithInteger:v31];
          [v41 addObject:v32];

          --v30;
          ++v31;
        }
        while (v30 > 1);
      }
      v33 = [(BRLTJJapaneseProcessor *)self longVowelExpressedFor:v15 partOfSpeech:v44];

      if (v46 == [(__CFString *)v3 length])
      {
        id v6 = v40;
        unint64_t v10 = 0x263F08000;
        unint64_t v7 = v42;
      }
      else
      {
        id v6 = v40;
        unint64_t v10 = 0x263F08000;
        unint64_t v7 = v42;
        if (!(v43 & 1 | ([(__CFString *)v3 characterAtIndex:v46] == 12289))
          && v44 == 4)
        {
          v34 = @"わ";
          if (([v33 isEqual:@"は"] & 1) != 0
            || (v34 = @"え", [v33 isEqual:@"へ"]))
          {

            v33 = v34;
          }
          unint64_t v10 = 0x263F08000;
        }
      }
      [v7 appendString:v33];
      int v35 = [v33 isEqual:@"の"];
      if (v44 == 4) {
        int v36 = v35;
      }
      else {
        int v36 = 0;
      }
      int v43 = v36;
    }
    while (CFStringTokenizerAdvanceToNextToken(v6));
  }
  CFRelease(v6);
  v37 = -[__CFString substringWithRange:](v3, "substringWithRange:", v9, [(__CFString *)v3 length] - v9);
  [v7 appendString:v37];

  for (; v9 < (unint64_t)[(__CFString *)v3 length]; ++v9)
  {
    v38 = [NSNumber numberWithInteger:v9];
    [v8 addObject:v38];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end