BOOL BOOLDefaultForKey(uint64_t a1)
{
  id v1;
  const char *v2;

  v1 = [NSString stringWithFormat:@"NL%@", a1];
  v2 = (const char *)[v1 UTF8String];

  return getenv(v2) != 0;
}

id stringDefaultForKey(uint64_t a1)
{
  id v1 = [NSString stringWithFormat:@"NL%@", a1];
  v2 = (const char *)[v1 UTF8String];

  v3 = getenv(v2);
  if (v3)
  {
    v3 = [NSString stringWithUTF8String:v3];
  }

  return v3;
}

uint64_t BOOLForKey(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = [a1 objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v4 isEqualToString:@"YES"])
    {
      a3 = 1;
    }
    else
    {
      if (([v4 isEqualToString:@"NO"] & 1) == 0)
      {
        uint64_t v5 = [v4 length];
        a3 = 1;
        if (!objc_msgSend(v4, "compare:options:range:", @"YES", 1, 0, v5)) {
          goto LABEL_13;
        }
        if (objc_msgSend(v4, "compare:options:range:", @"NO", 1, 0, v5))
        {
          a3 = 1;
          if (!objc_msgSend(v4, "compare:options:range:", @"Y", 1, 0, v5)) {
            goto LABEL_13;
          }
          if (objc_msgSend(v4, "compare:options:range:", @"N", 1, 0, v5))
          {
            a3 = [v4 integerValue] != 0;
            goto LABEL_13;
          }
        }
      }
      a3 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a3 = [v4 BOOLValue];
    }
  }
LABEL_13:

  return a3;
}

uint64_t BOOLForKeyWithDefault(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  BOOL v5 = BOOLDefaultForKey((uint64_t)v3);
  uint64_t v6 = BOOLForKey(v4, (uint64_t)v3, v5);

  return v6;
}

uint64_t unsignedIntegerForKey(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = [a1 objectForKey:a2];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a3 = [v4 unsignedIntegerValue];
    }
  }

  return a3;
}

id stringForKey(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 objectForKey:a2];
  id v7 = v5;
  if (v6)
  {
    objc_opt_class();
    id v7 = v5;
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
  }

  return v7;
}

id stringForKeyWithDefault(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  stringDefaultForKey((uint64_t)v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = [v7 objectForKey:v6];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v10 = v9;

    id v8 = v10;
  }
  else if (!v8)
  {
    id v8 = v5;
  }

  return v8;
}

id localizationForOptions(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKey:@"Localization"];
  if (!v2)
  {
    id v3 = [v1 objectForKey:@"Locale"];
    id v4 = v3;
    if (!v3 || ([v3 localeIdentifier], (v2 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v2 = [v1 objectForKey:@"Language"];
    }
  }

  return v2;
}

uint64_t granularityForOptions(void *a1)
{
  id v1 = [a1 objectForKey:@"Granularity"];
  v2 = v1;
  if (v1)
  {
    if ([v1 integerValue] == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 2;
  }

  return v3;
}

id splitIndexes(unint64_t a1, double a2, double a3)
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(NLNumberGenerator);
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = 0;
  if (a2 >= 0.0 && a3 >= 0.0 && a2 + a3 <= 1.0)
  {
    unint64_t v10 = (unint64_t)((double)a1 * a2);
    unint64_t v11 = (unint64_t)((double)a1 * a3);
    unint64_t v12 = a1 - (v10 + v11);
    if (a1)
    {
      uint64_t v13 = 0;
      do
      {
        v14 = [NSNumber numberWithUnsignedInteger:v13];
        [v7 addObject:v14];

        ++v13;
      }
      while (a1 != v13);
      if (a1 >= 2)
      {
        do
        {
          unint64_t v15 = a1--;
          uint64_t v16 = -[NLNumberGenerator numberInRange:](v6, "numberInRange:", 0, v15);
          if (a1 != v16) {
            [v7 exchangeObjectAtIndex:a1 withObjectAtIndex:v16];
          }
        }
        while (a1 > 1);
      }
    }
    v17 = objc_msgSend(v7, "subarrayWithRange:", 0, v12);
    v18 = [v17 sortedArrayUsingSelector:sel_compare_];

    v19 = objc_msgSend(v7, "subarrayWithRange:", v12, v10);
    v20 = [v19 sortedArrayUsingSelector:sel_compare_];

    v21 = objc_msgSend(v7, "subarrayWithRange:", v12 + v10, v11);
    v22 = [v21 sortedArrayUsingSelector:sel_compare_];

    v24[0] = v18;
    v24[1] = v20;
    v24[2] = v22;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  }

  return v8;
}

uint64_t tokenIsSentenceTerminator(void *a1)
{
  id v1 = a1;
  if (tokenIsSentenceTerminator_onceToken != -1) {
    dispatch_once(&tokenIsSentenceTerminator_onceToken, &__block_literal_global);
  }
  [v1 rangeOfCharacterFromSet:tokenIsSentenceTerminator_sentenceTerminatorCharacterSet];
  if (!v2
    || ([v1 rangeOfCharacterFromSet:tokenIsSentenceTerminator_nonSentenceTerminatorCharacterSet], v3)
    || ([v1 isEqualToString:@".."] & 1) != 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [v1 isEqualToString:@"..."] ^ 1;
  }

  return v4;
}

uint64_t __tokenIsSentenceTerminator_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".?!。！．？｡"];
  id v1 = (void *)tokenIsSentenceTerminator_sentenceTerminatorCharacterSet;
  tokenIsSentenceTerminator_sentenceTerminatorCharacterSet = v0;

  tokenIsSentenceTerminator_nonSentenceTerminatorCharacterSet = [(id)tokenIsSentenceTerminator_sentenceTerminatorCharacterSet invertedSet];

  return MEMORY[0x1F41817F8]();
}

id normalizedWord(void *a1)
{
  id v1 = a1;
  if (normalizedWord_onceToken != -1) {
    dispatch_once(&normalizedWord_onceToken, &__block_literal_global_29);
  }
  [v1 rangeOfCharacterFromSet:normalizedWord_nonLatinBasicExtendedABCharacterSet];
  if (v2)
  {
    id v3 = [v1 precomposedStringWithCanonicalMapping];
  }
  else
  {
    id v3 = v1;
  }
  uint64_t v4 = v3;

  return v4;
}

uint64_t __normalizedWord_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 0, 591);
  id v1 = (void *)normalizedWord_latinBasicExtendedABCharacterSet;
  normalizedWord_latinBasicExtendedABCharacterSet = v0;

  normalizedWord_nonLatinBasicExtendedABCharacterSet = [(id)normalizedWord_latinBasicExtendedABCharacterSet invertedSet];

  return MEMORY[0x1F41817F8]();
}

uint64_t tokenIDFromTokenAndVocabularyMap(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = normalizedWord(a1);
  id v5 = [v3 objectForKey:v4];

  if (v5) {
    uint64_t v6 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v6 = 3;
  }

  return v6;
}

id wordRangesFromSentence(void *a1, __CFStringTokenizer *a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = [(__CFString *)v3 length];
  if (wordRangesFromSentence_onceToken != -1)
  {
    dispatch_once(&wordRangesFromSentence_onceToken, &__block_literal_global_31);
    if (a2) {
      goto LABEL_3;
    }
LABEL_5:
    v24.location = 0;
    v24.length = 0;
    CFStringTokenizerRef v6 = CFStringTokenizerCreate(0, &stru_1EFB303D0, v24, 0, 0);
    a2 = v6;
    goto LABEL_6;
  }
  if (!a2) {
    goto LABEL_5;
  }
LABEL_3:
  CFStringTokenizerRef v6 = 0;
LABEL_6:
  v25.location = 0;
  v25.length = v5;
  CFStringTokenizerSetString(a2, v3, v25);
  while (CFStringTokenizerAdvanceToNextToken(a2))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(a2);
    if (CurrentTokenRange.length < 1) {
      break;
    }
    id v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    [v4 addObject:v8];
  }
  v26.location = 0;
  v26.length = 0;
  CFStringTokenizerSetString(a2, &stru_1EFB303D0, v26);
  if (v6) {
    CFRelease(v6);
  }
  if ([v4 count])
  {
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = v9;
      unint64_t v11 = [v4 objectAtIndex:v9];
      uint64_t v12 = [v11 rangeValue];
      uint64_t v14 = v13;

      unint64_t v9 = v10 + 1;
      while (v9 < [v4 count])
      {
        unint64_t v15 = v14 + v12;
        if (v15 >= v5) {
          break;
        }
        -[__CFString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", wordRangesFromSentence_wordJoinerCharacterSet, 8, v15, 1);
        if (!v16) {
          break;
        }
        v17 = [v4 objectAtIndex:v10 + 1];
        uint64_t v18 = [v17 rangeValue];
        uint64_t v20 = v19;

        if (v18 != v15 + 1) {
          break;
        }
        uint64_t v14 = v20 - v12 + v18;
        v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v12, v14);
        [v4 replaceObjectAtIndex:v10 withObject:v21];

        [v4 removeObjectAtIndex:v10 + 1];
      }
    }
    while (v9 < [v4 count]);
  }

  return v4;
}

uint64_t __wordRangesFromSentence_block_invoke()
{
  wordRangesFromSentence_wordJoinerCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".-'_‐‑’"];

  return MEMORY[0x1F41817F8]();
}

id tokenRangesFromSentence(void *a1, __CFStringTokenizer *a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = wordRangesFromSentence(v3, a2);
  unint64_t v6 = [v3 length];
  uint64_t v7 = [v5 count];
  unint64_t v8 = v7;
  if (tokenRangesFromSentence_onceToken == -1)
  {
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&tokenRangesFromSentence_onceToken, &__block_literal_global_40);
    if (!v8) {
      goto LABEL_10;
    }
  }
  unint64_t v23 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  CFRange v24 = v28;
  do
  {
    unint64_t v12 = v11;
    uint64_t v13 = v9;
    uint64_t v14 = objc_msgSend(v5, "objectAtIndex:", v10, v23, v24);
    unint64_t v11 = [v14 rangeValue];
    uint64_t v9 = v15;

    uint64_t v16 = v12 + v13;
    BOOL v17 = v11 >= v12 + v13;
    unint64_t v18 = v11 - (v12 + v13);
    if (v18 != 0 && v17)
    {
      objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet, 0, v16, v18);
      if (v19)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v28[0] = __tokenRangesFromSentence_block_invoke_2;
        v28[1] = &unk_1E5C53740;
        id v29 = v4;
        objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", v16, v18, 2, v27);
      }
    }
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v9);
    [v4 addObject:v20];

    ++v10;
  }
  while (v8 != v10);
  unint64_t v8 = v11 + v9;
  unint64_t v6 = v23;
LABEL_10:
  if (v6 > v8)
  {
    objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet, 0, v8, v6 - v8);
    if (v21)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __tokenRangesFromSentence_block_invoke_3;
      v25[3] = &unk_1E5C53740;
      id v26 = v4;
      objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", v8, v6 - v8, 2, v25);
    }
  }

  return v4;
}

void __tokenRangesFromSentence_block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  id v1 = (void *)tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet;
  tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet = v0;
}

void __tokenRangesFromSentence_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  if (a4 != 1 || (BOOL v7 = [v12 characterAtIndex:0] == 32, v8 = v12, !v7))
  {
    [v12 rangeOfCharacterFromSet:tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet];
    unint64_t v8 = v12;
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
      [v10 addObject:v11];

      unint64_t v8 = v12;
    }
  }
}

void __tokenRangesFromSentence_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  if (a4 != 1 || (BOOL v7 = [v12 characterAtIndex:0] == 32, v8 = v12, !v7))
  {
    [v12 rangeOfCharacterFromSet:tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet];
    unint64_t v8 = v12;
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
      [v10 addObject:v11];

      unint64_t v8 = v12;
    }
  }
}

void generateTokenSequence(void *a1, __CFStringTokenizer *a2, void *a3, void *a4, void *a5)
{
  id v25 = a1;
  id v24 = a3;
  id v23 = a4;
  id v9 = a5;
  uint64_t v10 = tokenRangesFromSentence(v25, a2);
  uint64_t v11 = [v10 count];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = v14;
      uint64_t v16 = [v10 objectAtIndex:v13];
      uint64_t v17 = [v16 rangeValue];
      uint64_t v19 = v18;

      uint64_t v20 = objc_msgSend(v25, "substringWithRange:", v17, v19);
      uint64_t v14 = normalizedWord(v20);

      if (v14)
      {
        [v24 addObject:v14];
        uint64_t v21 = [NSNumber numberWithUnsignedInteger:v17];
        [v23 addObject:v21];

        v22 = [NSNumber numberWithUnsignedInteger:v19];
        [v9 addObject:v22];
      }
      ++v13;
    }
    while (v12 != v13);
  }
}

id inputSequenceFromSentence(void *a1, __CFStringTokenizer *a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v5 = tokenRangesFromSentence(v3, a2);
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    id v9 = 0;
    do
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v5 objectAtIndex:v8];
      uint64_t v12 = [v11 rangeValue];
      uint64_t v14 = v13;

      uint64_t v15 = objc_msgSend(v3, "substringWithRange:", v12, v14);
      id v9 = normalizedWord(v15);

      if (v9) {
        [v4 addObject:v9];
      }
      ++v8;
    }
    while (v7 != v8);
  }

  return v4;
}

id formattedOutputFromSentence(void *a1, __CFStringTokenizer *a2, void *a3)
{
  id v5 = a1;
  id v24 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28E78] string];
  uint64_t v7 = tokenRangesFromSentence(v5, a2);
  uint64_t v8 = [v7 count];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 1);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u", 2);
  [v6 appendString:v9];
  [v6 appendString:@" "];
  if (!v8)
  {
    [v6 appendString:v10];
    uint64_t v12 = 0;
    uint64_t v13 = 1;
LABEL_9:
    uint64_t v20 = [&stru_1EFB303D0 stringByPaddingToLength:62 - 2 * v13 withString:@"0 " startingAtIndex:0];
    [v6 insertString:v20 atIndex:0];

    goto LABEL_10;
  }
  v22 = v10;
  id v23 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 1;
  do
  {
    uint64_t v14 = v12;
    uint64_t v15 = [v7 objectAtIndex:v11];
    uint64_t v16 = [v15 rangeValue];
    uint64_t v18 = v17;

    uint64_t v19 = objc_msgSend(v5, "substringWithRange:", v16, v18);
    uint64_t v12 = normalizedWord(v19);

    if ((unint64_t)(v13 + 2) <= 0x1F)
    {
      objc_msgSend(v6, "appendFormat:", @"%llu ", tokenIDFromTokenAndVocabularyMap(v12, v24));
      ++v13;
    }
    ++v11;
  }
  while (v8 != v11);
  uint64_t v10 = v22;
  [v6 appendString:v22];
  id v9 = v23;
  if ((unint64_t)(v13 + 1) <= 0x1F) {
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

id labelFromFormattedOutput(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F28E78] string];
  if (labelFromFormattedOutput_onceToken != -1) {
    dispatch_once(&labelFromFormattedOutput_onceToken, &__block_literal_global_56);
  }
  uint64_t v6 = [v3 stringByTrimmingCharactersInSet:labelFromFormattedOutput_whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 componentsSeparatedByString:@" "];
  unint64_t v8 = [v7 count];

  if (!v4) {
    id v4 = &unk_1EFB3A970;
  }
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v4, "unsignedIntegerValue"));
      [v5 appendString:v10];

      if (++v9 < v8) {
        [v5 appendString:@" "];
      }
    }
    while (v8 != v9);
  }

  return v5;
}

uint64_t __labelFromFormattedOutput_block_invoke()
{
  labelFromFormattedOutput_whitespaceAndNewlineCharacterSet = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];

  return MEMORY[0x1F41817F8]();
}

void reportInstanceCompletionToTrainer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  if (v7)
  {
    unint64_t v8 = 3 * a3;
    if ((unint64_t)(3 * a3) >= 0x2EE)
    {
      unint64_t v9 = a2 + a4 * a3 + 1;
      unint64_t v10 = v8 / 0xA;
      if (v8 >> 2 < 0x753) {
        unint64_t v10 = (unsigned __int16)(3 * a3) / 5u;
      }
      if (v10 < 0x2EE) {
        unint64_t v10 = v8 >> 2;
      }
      if (v10 < 0x2EE) {
        unint64_t v10 = v8 >> 1;
      }
      if (!(v9 % v10))
      {
        id v12 = v7;
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%u%% complete", vcvtmd_u64_f64((double)v9 / (double)v8 * 100.0 + 0.5) | 0x4059000000000000);
        [v12 logMessage:v11];

        id v7 = v12;
      }
    }
  }
}

id topHypotheses(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 allKeys];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __topHypotheses_block_invoke;
  v12[3] = &unk_1E5C53768;
  id v6 = v3;
  id v13 = v6;
  id v7 = [v5 sortedArrayUsingComparator:v12];

  if (a2)
  {
    unint64_t v8 = 0;
    do
    {
      if ([v7 count] <= v8) {
        break;
      }
      unint64_t v9 = [v7 objectAtIndex:v8];
      unint64_t v10 = [v6 objectForKey:v9];
      [v4 setObject:v10 forKey:v9];

      ++v8;
    }
    while (a2 != v8);
  }

  return v4;
}

uint64_t __topHypotheses_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:a2];
  [v7 doubleValue];
  double v9 = v8;

  unint64_t v10 = [*(id *)(a1 + 32) objectForKey:v6];

  [v10 doubleValue];
  double v12 = v11;

  if (v9 > v12) {
    return -1;
  }
  else {
    return v9 < v12;
  }
}

double ME_Model::FunctionGradient(ME_Model *this, uint64_t a2, double **a3)
{
  id v6 = *(uint64_t **)a2;
  uint64_t v7 = *(void *)(a2 + 8) - *(void *)a2;
  if (v7)
  {
    unint64_t v8 = v7 >> 3;
    double v9 = (void *)*((void *)this + 24);
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    do
    {
      uint64_t v10 = *v6++;
      *v9++ = v10;
      --v8;
    }
    while (v8);
  }
  ME_Model::update_model_expectation(this);
  double v12 = *((double *)this + 5);
  uint64_t v14 = *(uint64_t **)a2;
  uint64_t v13 = *(void *)(a2 + 8);
  if (v12 == 0.0)
  {
    uint64_t v15 = v13 - (void)v14;
    if (v15)
    {
      unint64_t v16 = v15 >> 3;
      uint64_t v17 = (double *)*((void *)this + 36);
      uint64_t v18 = (double *)*((void *)this + 39);
      uint64_t v19 = *a3;
      if (v16 <= 1) {
        unint64_t v16 = 1;
      }
      do
      {
        double v20 = *v17++;
        double v21 = v20;
        double v22 = *v18++;
        *v19++ = -(v21 - v22);
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    uint64_t v23 = v13 - (void)v14;
    if (v23)
    {
      unint64_t v24 = v23 >> 3;
      id v25 = (double *)*((void *)this + 36);
      id v26 = (double *)*((void *)this + 39);
      v27 = (double *)*((void *)this + 24);
      double v28 = v12 * -2.0;
      id v29 = *a3;
      if (v24 <= 1) {
        unint64_t v24 = 1;
      }
      do
      {
        double v30 = *v25++;
        double v31 = v30;
        double v32 = *v26++;
        double v33 = v31 - v32;
        double v34 = *v27++;
        *v29++ = -(v33 + v28 * v34);
        --v24;
      }
      while (v24);
    }
  }
  return -v11;
}

void ME_Model::update_model_expectation(ME_Model *this)
{
  id v2 = (void **)((char *)this + 312);
  std::vector<double>::resize((uint64_t)this + 312, (int)((uint64_t)(*((void *)this + 33) - *((void *)this + 32)) >> 2));
  unint64_t v3 = *((void *)this + 33) - *((void *)this + 32);
  unint64_t v4 = v3 >> 2;
  if ((int)(v3 >> 2) >= 1) {
    bzero(*v2, (2 * v3) & 0x7FFFFFFF8);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5 == *((void *)this + 7))
  {
    double v31 = 0.0;
    unint64_t v8 = (void *)*((void *)this + 6);
    double v7 = 0.0;
  }
  else
  {
    int v6 = 0;
    double v7 = 0.0;
    unint64_t v8 = (void *)*((void *)this + 6);
    do
    {
      std::vector<double>::vector(v40, *((int *)this + 70));
      int v9 = ME_Model::conditional_probability((uint64_t)this, v8, v40);
      uint64_t v10 = *(int *)v8;
      double v11 = v40[0];
      double v12 = log(v40[0][v10]);
      if (v9 == v10) {
        ++v6;
      }
      uint64_t v13 = (int *)v8[1];
      uint64_t v14 = (int *)v8[2];
      if (v13 != v14)
      {
        uint64_t v15 = *((void *)this + 42);
        do
        {
          unint64_t v16 = (int **)(v15 + 24 * *v13);
          uint64_t v17 = *v16;
          uint64_t v18 = v16[1];
          if (v17 != v18)
          {
            uint64_t v19 = *((void *)this + 32);
            uint64_t v20 = *((void *)this + 39);
            do
            {
              uint64_t v21 = *v17++;
              *(double *)(v20 + 8 * v21) = v11[*(unsigned __int8 *)(v19 + 4 * v21)] + *(double *)(v20 + 8 * v21);
            }
            while (v17 != v18);
          }
          ++v13;
        }
        while (v13 != v14);
      }
      double v22 = (double *)v8[4];
      uint64_t v23 = (int *)v8[5];
      if (v22 != (double *)v23)
      {
        uint64_t v24 = *((void *)this + 42);
        do
        {
          id v25 = (int **)(v24 + 24 * *(int *)v22);
          id v26 = *v25;
          v27 = v25[1];
          if (v26 != v27)
          {
            uint64_t v28 = *((void *)this + 32);
            uint64_t v29 = *((void *)this + 39);
            do
            {
              uint64_t v30 = *v26++;
              *(double *)(v29 + 8 * v30) = *(double *)(v29 + 8 * v30)
                                         + v11[*(unsigned __int8 *)(v28 + 4 * v30)] * v22[1];
            }
            while (v26 != v27);
          }
          v22 += 2;
        }
        while (v22 != (double *)v23);
      }
      if (v11)
      {
        v40[1] = v11;
        operator delete(v11);
      }
      double v7 = v7 + v12;
      v8 += 10;
    }
    while (v8 != *((void **)this + 7));
    uint64_t v5 = *((void *)this + 6);
    unint64_t v4 = (*((void *)this + 33) - *((void *)this + 32)) >> 2;
    double v31 = (double)v6;
  }
  double v32 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v8 - v5) >> 4));
  uint64_t v33 = v4;
  if ((int)v4 >= 1)
  {
    double v34 = (double *)*v2;
    uint64_t v35 = v4;
    do
    {
      *double v34 = *v34 / v32;
      ++v34;
      --v35;
    }
    while (v35);
  }
  *((double *)this + 48) = 1.0 - v31 / v32;
  double v36 = v7 / v32;
  double v37 = *((double *)this + 5);
  if (v37 > 0.0 && (int)v4 >= 1)
  {
    v38 = (double *)*((void *)this + 24);
    do
    {
      double v39 = *v38++;
      double v36 = v36 + -(v39 * v39) * v37;
      --v33;
    }
    while (v33);
  }
}

void sub_1A641E120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::perform_GIS(ME_Model *this)
{
  int v2 = 0;
  __p = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  unint64_t v3 = (void **)((char *)this + 192);
  int v4 = 1;
  double v5 = -999999.0;
  do
  {
    ME_Model::update_model_expectation(this);
    double v7 = v6;
    if (v6 >= v5)
    {
      HIDWORD(v8) = -858993459 * v2 + 429496728;
      LODWORD(v8) = HIDWORD(v8);
      BOOL v9 = (v8 >> 1) >= 0x19999999 || v4 <= 1;
      int v10 = !v9;
      if (&__p != v3) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&__p, *((char **)this + 24), *((void *)this + 25), (uint64_t)(*((void *)this + 25) - *((void *)this + 24)) >> 3);
      }
      v4 -= v10;
      unint64_t v11 = *((void *)this + 33) - *((void *)this + 32);
      if ((int)(v11 >> 2) >= 1)
      {
        double v12 = (double *)*((void *)this + 36);
        uint64_t v13 = (double *)*((void *)this + 39);
        uint64_t v14 = (v11 >> 2);
        uint64_t v15 = (long double *)*((void *)this + 24);
        do
        {
          double v16 = *v12++;
          double v17 = v16;
          double v18 = *v13++;
          *uint64_t v15 = *v15 + log(v17 / v18) / (double)v4;
          ++v15;
          --v14;
        }
        while (v14);
      }
      double v5 = v7;
    }
    else
    {
      if (&__p != v3) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v3, (char *)__p, (uint64_t)v21, (v21 - (unsigned char *)__p) >> 3);
      }
      ++v4;
      --v2;
    }
    BOOL v9 = v2++ < 199;
  }
  while (v9);
  if (__p)
  {
    uint64_t v21 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_1A641E2AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::perform_QUASI_NEWTON(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 264) - *(void *)(a1 + 256);
  unint64_t v5 = (unint64_t)v4 >> 2;
  std::vector<double>::vector(v18, (int)(v4 >> 2));
  uint64_t v6 = ((unint64_t)v4 >> 2);
  if ((int)v5 >= 1)
  {
    double v7 = *(uint64_t **)(a1 + 192);
    unint64_t v8 = v18[0];
    uint64_t v9 = v6;
    do
    {
      uint64_t v10 = *v7++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
  double v11 = *(double *)(a1 + 32);
  if (v11 <= 0.0) {
    ME_Model::perform_LBFGS(a1, (uint64_t)v18, a2, __p);
  }
  else {
    ME_Model::perform_OWLQN((int *)a1, (uint64_t)v18, __p, v11);
  }
  double v12 = __p[0];
  if ((int)v5 < 1)
  {
    if (!__p[0]) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v13 = *(void **)(a1 + 192);
    uint64_t v14 = (uint64_t *)__p[0];
    do
    {
      uint64_t v15 = *v14++;
      *v13++ = v15;
      --v6;
    }
    while (v6);
  }
  operator delete(v12);
LABEL_13:
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }
  return 0;
}

void sub_1A641E3B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::conditional_probability(uint64_t a1, void *a2, double **a3)
{
  unint64_t v6 = *(int *)(a1 + 280);
  uint64_t v47 = 0;
  std::vector<double>::vector(&v48, v6, &v47);
  double v7 = (int *)a2[1];
  unint64_t v8 = (int *)a2[2];
  uint64_t v9 = v48;
  if (v7 != v8)
  {
    uint64_t v10 = *(void *)(a1 + 336);
    do
    {
      double v11 = (int **)(v10 + 24 * *v7);
      double v12 = *v11;
      uint64_t v13 = v11[1];
      if (v12 != v13)
      {
        uint64_t v14 = *(void *)(a1 + 192);
        uint64_t v15 = *(void *)(a1 + 256);
        do
        {
          uint64_t v16 = *v12++;
          v9[*(unsigned __int8 *)(v15 + 4 * v16)] = *(double *)(v14 + 8 * v16) + v9[*(unsigned __int8 *)(v15 + 4 * v16)];
        }
        while (v12 != v13);
      }
      ++v7;
    }
    while (v7 != v8);
    uint64_t v9 = v48;
  }
  double v17 = (double *)a2[4];
  double v18 = (int *)a2[5];
  if (v17 != (double *)v18)
  {
    uint64_t v19 = *(void *)(a1 + 336);
    do
    {
      uint64_t v20 = (int **)(v19 + 24 * *(int *)v17);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      if (v21 != v22)
      {
        uint64_t v23 = *(void *)(a1 + 192);
        uint64_t v24 = *(void *)(a1 + 256);
        do
        {
          uint64_t v25 = *v21++;
          v9[*(unsigned __int8 *)(v24 + 4 * v25)] = v9[*(unsigned __int8 *)(v24 + 4 * v25)]
                                                  + *(double *)(v23 + 8 * v25) * v17[1];
        }
        while (v21 != v22);
      }
      v17 += 2;
    }
    while (v17 != (double *)v18);
  }
  id v26 = v9 + 1;
  BOOL v27 = v9 == v49 || v26 == v49;
  uint64_t v28 = v9;
  if (!v27)
  {
    double v29 = *v9;
    uint64_t v28 = v9;
    uint64_t v30 = v9 + 1;
    do
    {
      double v31 = *v30++;
      double v32 = v31;
      if (v29 < v31)
      {
        double v29 = v32;
        uint64_t v28 = v26;
      }
      id v26 = v30;
    }
    while (v30 != v49);
  }
  uint64_t v33 = *(unsigned int *)(a1 + 280);
  if ((int)v33 < 1)
  {
    uint64_t v43 = 0;
    if (!v9) {
      return v43;
    }
    goto LABEL_33;
  }
  double v34 = 0.0;
  double v35 = fmax(*v28 + -700.0, 0.0);
  uint64_t v36 = *(void *)(a1 + 432);
  double v37 = (double *)a2[7];
  v38 = *a3;
  uint64_t v39 = v33;
  v40 = v9;
  do
  {
    double v41 = exp(*v40 - v35);
    if (v36) {
      double v41 = v41 * *v37;
    }
    *v38++ = v41;
    double v34 = v34 + v41;
    ++v40;
    ++v37;
    --v39;
  }
  while (v39);
  uint64_t v42 = 0;
  LODWORD(v43) = 0;
  v44 = *a3;
  do
  {
    double v45 = v44[v42] / v34;
    v44[v42] = v45;
    if (v45 <= v44[(int)v43]) {
      uint64_t v43 = v43;
    }
    else {
      uint64_t v43 = v42;
    }
    ++v42;
  }
  while (v33 != v42);
  if (v9)
  {
LABEL_33:
    v49 = v9;
    operator delete(v9);
  }
  return v43;
}

uint64_t ME_Model::make_feature_bag(ME_Model *this, int a2)
{
  memset(v20, 0, sizeof(v20));
  int v21 = 1065353216;
  if (a2 <= 0)
  {
    uint64_t i = *((void *)this + 7);
  }
  else
  {
    for (uint64_t i = *((void *)this + 6); i != *((void *)this + 7); i += 80)
    {
      for (j = *(_DWORD **)(i + 8); j != *(_DWORD **)(i + 16); ++j)
      {
        int v19 = *(_DWORD *)i + (*j << 8);
        uint64_t v22 = &v19;
        unint64_t v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v22);
        ++*((_DWORD *)v6 + 5);
      }
      for (k = *(_DWORD **)(i + 32); k != *(_DWORD **)(i + 40); k += 4)
      {
        int v19 = *(_DWORD *)i + (*k << 8);
        uint64_t v22 = &v19;
        unint64_t v8 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v22);
        ++*((_DWORD *)v8 + 5);
      }
    }
  }
  uint64_t v9 = *((void *)this + 6);
  if (v9 == i)
  {
    uint64_t v10 = 0;
  }
  else
  {
    LODWORD(v10) = 0;
    do
    {
      double v12 = *(char **)(v9 + 8);
      double v11 = *(char **)(v9 + 16);
      unint64_t v13 = (unint64_t)(v11 - v12) >> 2;
      if ((int)v10 <= (int)v13) {
        uint64_t v10 = v13;
      }
      else {
        uint64_t v10 = v10;
      }
      if (v11 != v12)
      {
        do
        {
          int v14 = *(_DWORD *)v9 + (*(_DWORD *)v12 << 8);
          int v19 = v14;
          if (a2 < 1
            || (int v18 = v14,
                uint64_t v22 = &v18,
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v22)+ 5) > a2))
          {
            ME_Model::ME_FeatureBag::Put((void *)this + 27, &v19);
          }
          v12 += 4;
        }
        while (v12 != *(char **)(v9 + 16));
      }
      for (m = *(_DWORD **)(v9 + 32); m != *(_DWORD **)(v9 + 40); m += 4)
      {
        int v16 = *(_DWORD *)v9 + (*m << 8);
        int v19 = v16;
        if (a2 >= 1)
        {
          int v18 = v16;
          uint64_t v22 = &v18;
          if (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v22)+ 5) <= a2)continue; {
        }
          }
        ME_Model::ME_FeatureBag::Put((void *)this + 27, &v19);
      }
      v9 += 80;
    }
    while (v9 != *((void *)this + 7));
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(v20);
  ME_Model::init_feature2mef(this);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v20);
  return v10;
}

void sub_1A641E860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ME_Model::ME_FeatureBag::Put(void *a1, _DWORD *a2)
{
  LODWORD(v19) = *a2;
  uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1, (unsigned int *)&v19);
  if (v4) {
    return *((unsigned int *)v4 + 5);
  }
  unint64_t v6 = (char *)a1[5];
  double v7 = (char *)a1[6];
  uint64_t v5 = (v7 - v6) >> 2;
  unint64_t v8 = a1[7];
  if ((unint64_t)v7 >= v8)
  {
    if ((unint64_t)(v5 + 1) >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v8 - (void)v6;
    unint64_t v11 = (uint64_t)(v8 - (void)v6) >> 1;
    if (v11 <= v5 + 1) {
      unint64_t v11 = v5 + 1;
    }
    if (v10 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)(a1 + 7), v12);
      unint64_t v6 = (char *)a1[5];
      double v7 = (char *)a1[6];
    }
    else
    {
      unint64_t v13 = 0;
    }
    int v14 = &v13[4 * v5];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)int v14 = *a2;
    uint64_t v9 = v14 + 4;
    while (v7 != v6)
    {
      int v16 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    a1[5] = v14;
    a1[6] = v9;
    a1[7] = v15;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *(_DWORD *)double v7 = *a2;
    uint64_t v9 = v7 + 4;
  }
  a1[6] = v9;
  unsigned int v18 = *a2;
  int v19 = &v18;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)a1, &v18, (uint64_t)&std::piecewise_construct, &v19)+ 5) = v5;
  return v5;
}

void ME_Model::init_feature2mef(ME_Model *this)
{
  unsigned int v18 = (uint64_t *)((char *)this + 336);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 42);
  if (*((int *)this + 36) >= 1)
  {
    int v2 = 0;
    do
    {
      __p = 0;
      uint64_t v20 = 0;
      int v21 = 0;
      if (*((int *)this + 70) >= 1)
      {
        int v3 = 0;
        do
        {
          unsigned int v22 = v3 + (v2 << 8);
          uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>((void *)this + 27, &v22);
          if (v4)
          {
            int v5 = *((_DWORD *)v4 + 5);
            if ((v5 & 0x80000000) == 0)
            {
              unint64_t v6 = v20;
              if (v20 >= v21)
              {
                unint64_t v8 = (char *)__p;
                uint64_t v9 = (v20 - (unsigned char *)__p) >> 2;
                unint64_t v10 = v9 + 1;
                if ((unint64_t)(v9 + 1) >> 62) {
                  std::vector<double>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v11 = v21 - (unsigned char *)__p;
                if ((v21 - (unsigned char *)__p) >> 1 > v10) {
                  unint64_t v10 = v11 >> 1;
                }
                if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v12 = v10;
                }
                if (v12)
                {
                  unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&v21, v12);
                  unint64_t v8 = (char *)__p;
                  unint64_t v6 = v20;
                }
                else
                {
                  unint64_t v13 = 0;
                }
                int v14 = &v13[4 * v9];
                *(_DWORD *)int v14 = v5;
                double v7 = v14 + 4;
                while (v6 != v8)
                {
                  int v15 = *((_DWORD *)v6 - 1);
                  v6 -= 4;
                  *((_DWORD *)v14 - 1) = v15;
                  v14 -= 4;
                }
                __p = v14;
                uint64_t v20 = v7;
                int v21 = &v13[4 * v12];
                if (v8) {
                  operator delete(v8);
                }
              }
              else
              {
                *(_DWORD *)uint64_t v20 = v5;
                double v7 = v6 + 4;
              }
              uint64_t v20 = v7;
            }
          }
          ++v3;
        }
        while (v3 < *((_DWORD *)this + 70));
      }
      unint64_t v16 = *((void *)this + 43);
      if (v16 >= *((void *)this + 44))
      {
        uint64_t v17 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v18, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v18, (uint64_t)&__p);
        uint64_t v17 = v16 + 24;
      }
      *((void *)this + 43) = v17;
      if (__p)
      {
        uint64_t v20 = (char *)__p;
        operator delete(__p);
      }
      ++v2;
    }
    while (v2 < *((_DWORD *)this + 36));
  }
}

void sub_1A641EB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double ME_Model::heldout_likelihood(ME_Model *this)
{
  uint64_t v2 = *((void *)this + 45);
  if (v2 == *((void *)this + 46))
  {
    double v9 = 0.0;
    double v4 = 0.0;
    int v5 = (void *)*((void *)this + 45);
  }
  else
  {
    int v3 = 0;
    double v4 = 0.0;
    int v5 = (void *)*((void *)this + 45);
    do
    {
      std::vector<double>::vector(v12, *((int *)this + 70));
      int v6 = ME_Model::classify((uint64_t)this, v5, (uint64_t)v12);
      uint64_t v7 = *(int *)v5;
      v5 += 10;
      unint64_t v8 = (void *)v12[0];
      double v4 = v4 + log(*(long double *)(v12[0] + 8 * v7));
      if (v6 == v7) {
        ++v3;
      }
      v12[1] = v8;
      operator delete(v8);
    }
    while (v5 != *((void **)this + 46));
    uint64_t v2 = *((void *)this + 45);
    double v9 = (double)v3;
  }
  double v10 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v5 - v2) >> 4));
  *((double *)this + 49) = 1.0 - v9 / v10;
  return v4 / v10;
}

void sub_1A641ECA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::classify(uint64_t a1, void *a2, uint64_t a3)
{
  ME_Model::conditional_probability(a1, a2, (double **)a3);
  unint64_t v4 = *(void *)(a3 + 8) - *(void *)a3;
  if ((int)(v4 >> 3) < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  LODWORD(result) = 0;
  uint64_t v7 = (v4 >> 3);
  double v8 = 0.0;
  do
  {
    double v9 = *(double *)(*(void *)a3 + 8 * v5);
    if (v9 <= v8) {
      uint64_t result = result;
    }
    else {
      uint64_t result = v5;
    }
    if (v9 > v8) {
      double v8 = *(double *)(*(void *)a3 + 8 * v5);
    }
    ++v5;
  }
  while (v7 != v5);
  return result;
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

uint64_t ME_Model::train(ME_Model *this, const ME_Sample **a2, uint64_t a3)
{
  uint64_t v7 = (void *)*((void *)this + 6);
  for (uint64_t i = (void *)*((void *)this + 7); i != v7; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(i))
    i -= 10;
  *((void *)this + 7) = v7;
  for (j = *a2; j != a2[1]; j = (const ME_Sample *)((char *)j + 72))
    ME_Model::add_training_sample(this, j);
  ME_Model::train(this, a3);
  return 0;
}

void ME_Model::add_training_sample(ME_Model *this, const ME_Sample *a2)
{
  uint64_t v43 = 0;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  *(_OWORD *)__p = 0u;
  int v38 = ME_Model::StringBag::Put((void *)this + 9, (uint64_t *)a2);
  if (v38 >= 256) {
    exit(1);
  }
  for (uint64_t i = (uint64_t *)*((void *)a2 + 3); i != *((uint64_t **)a2 + 4); i += 3)
  {
    int v5 = ME_Model::MiniStringBag::Put((unsigned int *)this + 36, i);
    int v6 = v5;
    uint64_t v7 = (char *)__p[1];
    if (__p[1] >= (void *)v40)
    {
      double v9 = (char *)__p[0];
      int64_t v10 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      unint64_t v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 62) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v40 - (unint64_t)__p[0];
      if ((uint64_t)(v40 - (unint64_t)__p[0]) >> 1 > v11) {
        unint64_t v11 = v12 >> 1;
      }
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&v40, v13);
        double v9 = (char *)__p[0];
        uint64_t v7 = (char *)__p[1];
      }
      else
      {
        int v14 = 0;
      }
      int v15 = &v14[4 * v10];
      *(_DWORD *)int v15 = v6;
      double v8 = v15 + 4;
      while (v7 != v9)
      {
        int v16 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v15 - 1) = v16;
        v15 -= 4;
      }
      __p[0] = v15;
      __p[1] = v8;
      *(void *)&long long v40 = &v14[4 * v13];
      if (v9) {
        operator delete(v9);
      }
    }
    else
    {
      *(_DWORD *)__p[1] = v5;
      double v8 = v7 + 4;
    }
    __p[1] = v8;
  }
  for (j = (uint64_t *)*((void *)a2 + 6); j != *((uint64_t **)a2 + 7); j += 4)
  {
    int v18 = ME_Model::MiniStringBag::Put((unsigned int *)this + 36, j);
    int v19 = v18;
    uint64_t v20 = j[3];
    int v21 = (void *)v41;
    if ((unint64_t)v41 >= *((void *)&v41 + 1))
    {
      uint64_t v23 = (void *)*((void *)&v40 + 1);
      uint64_t v24 = (uint64_t)(v41 - *((void *)&v40 + 1)) >> 4;
      unint64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 60) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v26 = *((void *)&v41 + 1) - *((void *)&v40 + 1);
      if ((uint64_t)(*((void *)&v41 + 1) - *((void *)&v40 + 1)) >> 3 > v25) {
        unint64_t v25 = v26 >> 3;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v25;
      }
      if (v27)
      {
        uint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)&v41 + 8, v27);
        uint64_t v23 = (void *)*((void *)&v40 + 1);
        int v21 = (void *)v41;
      }
      else
      {
        uint64_t v28 = 0;
      }
      double v29 = &v28[16 * v24];
      *(_DWORD *)double v29 = v19;
      *((void *)v29 + 1) = v20;
      uint64_t v30 = v29;
      if (v21 != v23)
      {
        do
        {
          *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
          v30 -= 16;
          v21 -= 2;
        }
        while (v21 != v23);
        uint64_t v23 = (void *)*((void *)&v40 + 1);
      }
      unsigned int v22 = v29 + 16;
      *((void *)&v40 + 1) = v30;
      *(void *)&long long v41 = v29 + 16;
      *((void *)&v41 + 1) = &v28[16 * v27];
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *(_DWORD *)long long v41 = v18;
      v21[1] = v20;
      unsigned int v22 = (char *)(v21 + 2);
    }
    *(void *)&long long v41 = v22;
  }
  if (*((void *)this + 54))
  {
    if (*((char *)a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else {
      std::string v35 = *(std::string *)a2;
    }
    memset(&v36, 0, sizeof(v36));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v36, *((long long **)a2 + 3), *((long long **)a2 + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 4) - *((void *)a2 + 3)) >> 3));
    memset(&v37, 0, sizeof(v37));
    std::vector<std::pair<std::string,double>>::__init_with_size[abi:ne180100]<std::pair<std::string,double>*,std::pair<std::string,double>*>(&v37, *((long long **)a2 + 6), *((long long **)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 5);
    ME_Model::classify(*((ME_Model **)this + 54), (ME_Sample *)&v35, &v33);
    if ((void)v42)
    {
      *((void *)&v42 + 1) = v42;
      operator delete((void *)v42);
    }
    long long v42 = v33;
    uint64_t v43 = v34;
    *(void *)&long long v33 = &v37;
    std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    *(void *)&long long v33 = &v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
  }
  unint64_t v31 = *((void *)this + 7);
  if (v31 >= *((void *)this + 8))
  {
    uint64_t v32 = std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>((uint64_t *)this + 6, (uint64_t)&v38);
  }
  else
  {
    std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(*((void *)this + 7), (uint64_t)&v38);
    uint64_t v32 = v31 + 80;
    *((void *)this + 7) = v31 + 80;
  }
  *((void *)this + 7) = v32;
  if ((void)v42)
  {
    *((void *)&v42 + 1) = v42;
    operator delete((void *)v42);
  }
  if (*((void *)&v40 + 1))
  {
    *(void *)&long long v41 = *((void *)&v40 + 1);
    operator delete(*((void **)&v40 + 1));
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1A641F1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t ME_Model::train(ME_Model *this, uint64_t a2)
{
  if (*((double *)this + 4) <= 0.0 || *((double *)this + 5) <= 0.0)
  {
    unint64_t v4 = (ME_Model::Sample *)*((void *)this + 6);
    int v5 = (ME_Model::Sample *)*((void *)this + 7);
    if (v5 != v4 && *((_DWORD *)this + 100) < (signed int)(-858993459 * ((unint64_t)(v5 - v4) >> 4)))
    {
      int v6 = 0;
      uint64_t v7 = (ME_Model::Sample *)*((void *)this + 6);
      do
      {
        int v9 = *(_DWORD *)v7;
        uint64_t v7 = (ME_Model::Sample *)((char *)v7 + 80);
        int v8 = v9;
        if (v6 <= v9) {
          int v6 = v8;
        }
      }
      while (v7 != v5);
      *((_DWORD *)this + 70) = v6 + 1;
      uint64_t v10 = *((void *)this + 54);
      if (v10)
      {
        if (*(int *)(v10 + 280) >= 1)
        {
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          do
          {
            unint64_t v13 = (long long *)(*(void *)(v10 + 120) + v11);
            if (*((char *)v13 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v13, *((void *)v13 + 1));
            }
            else
            {
              long long v14 = *v13;
              __p.__r_.__value_.__r.__words[2] = *((void *)v13 + 2);
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
            }
            ME_Model::StringBag::Put((void *)this + 9, (uint64_t *)&__p);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            ++v12;
            uint64_t v10 = *((void *)this + 54);
            v11 += 24;
          }
          while (v12 < *(int *)(v10 + 280));
          unint64_t v4 = (ME_Model::Sample *)*((void *)this + 6);
          int v5 = (ME_Model::Sample *)*((void *)this + 7);
        }
        *((_DWORD *)this + 70) = -1431655765 * ((*((void *)this + 16) - *((void *)this + 15)) >> 3);
        if (v4 != v5)
        {
          int v5 = v4;
          do
          {
            ME_Model::set_ref_dist(this, v5);
            int v5 = (ME_Model::Sample *)((char *)v5 + 80);
          }
          while (v5 != *((ME_Model::Sample **)this + 7));
        }
      }
      if (*((int *)this + 100) >= 1)
      {
        int v15 = 0;
        do
        {
          uint64_t v16 = (uint64_t)v5 - 80;
          unint64_t v17 = *((void *)this + 46);
          if (v17 >= *((void *)this + 47))
          {
            uint64_t v18 = std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>((uint64_t *)this + 45, v16);
          }
          else
          {
            std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(*((void *)this + 46), v16);
            uint64_t v18 = v17 + 80;
            *((void *)this + 46) = v17 + 80;
          }
          *((void *)this + 46) = v18;
          int v5 = (ME_Model::Sample *)(*((void *)this + 7) - 80);
          std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(v5);
          *((void *)this + 7) = v5;
          ++v15;
        }
        while (v15 < *((_DWORD *)this + 100));
      }
      int v19 = (std::vector<int> *)*((void *)this + 6);
      unint64_t v20 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v5 - (ME_Model::Sample *)v19) >> 4));
      if (v5 == (ME_Model::Sample *)v19) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = v20;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(v19, (std::vector<int> *)v5, (uint64_t)&__p, v21, 1);
      *((float64x2_t *)this + 2) = vdivq_f64(*((float64x2_t *)this + 2), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(0xCCCCCCCCCCCCCCCDLL* ((uint64_t)(*((void *)this + 7)- *((void *)this + 6)) >> 4))), 0));
      ME_Model::make_feature_bag(this, 0);
      unsigned int v22 = (void **)((char *)this + 288);
      std::vector<double>::resize((uint64_t)this + 288, (int)((uint64_t)(*((void *)this + 33) - *((void *)this + 32)) >> 2));
      uint64_t v23 = *((void *)this + 32);
      unint64_t v24 = *((void *)this + 33) - v23;
      if ((int)(v24 >> 2) >= 1) {
        bzero(*v22, (2 * v24) & 0x7FFFFFFF8);
      }
      uint64_t v25 = *((void *)this + 6);
      unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 7) - v25) >> 4);
      if ((int)v26 >= 1)
      {
        uint64_t v27 = 0;
        do
        {
          uint64_t v28 = (int *)(v25 + 80 * v27);
          double v29 = (int *)*((void *)v28 + 1);
          uint64_t v30 = (int *)*((void *)v28 + 2);
          if (v29 != v30)
          {
            uint64_t v31 = *((void *)this + 42);
            do
            {
              uint64_t v32 = (int **)(v31 + 24 * *v29);
              long long v33 = *v32;
              uint64_t v34 = v32[1];
              if (v33 != v34)
              {
                int v35 = *v28;
                do
                {
                  uint64_t v36 = *v33;
                  if (*(unsigned __int8 *)(v23 + 4 * v36) == v35) {
                    *((double *)*v22 + v36) = *((double *)*v22 + v36) + 1.0;
                  }
                  ++v33;
                }
                while (v33 != v34);
              }
              ++v29;
            }
            while (v29 != v30);
          }
          uint64_t v37 = v25 + 80 * v27;
          int v38 = *(double **)(v37 + 32);
          uint64_t v39 = *(int **)(v37 + 40);
          if (v38 != (double *)v39)
          {
            uint64_t v40 = *((void *)this + 42);
            do
            {
              long long v41 = (int **)(v40 + 24 * *(int *)v38);
              long long v42 = *v41;
              uint64_t v43 = v41[1];
              if (v42 != v43)
              {
                int v44 = *v28;
                do
                {
                  uint64_t v45 = *v42;
                  if (*(unsigned __int8 *)(v23 + 4 * v45) == v44) {
                    *((double *)*v22 + v45) = v38[1] + *((double *)*v22 + v45);
                  }
                  ++v42;
                }
                while (v42 != v43);
              }
              v38 += 2;
            }
            while (v38 != (double *)v39);
          }
          ++v27;
        }
        while (v27 != v26);
      }
      if ((int)(v24 >> 2) >= 1)
      {
        double v46 = (double)v26;
        uint64_t v47 = (double *)*v22;
        uint64_t v48 = (v24 >> 2);
        do
        {
          *uint64_t v47 = *v47 / v46;
          ++v47;
          --v48;
        }
        while (v48);
      }
      std::vector<double>::resize((uint64_t)this + 192, (int)((uint64_t)v24 >> 2));
      unint64_t v49 = *((void *)this + 33) - *((void *)this + 32);
      if ((int)(v49 >> 2) >= 1) {
        bzero(*((void **)this + 24), (2 * v49) & 0x7FFFFFFF8);
      }
      if (*(_DWORD *)this == 2) {
        ME_Model::perform_SGD(this);
      }
      else {
        ME_Model::perform_QUASI_NEWTON((uint64_t)this, a2);
      }
    }
  }
  return 0;
}

void sub_1A641F634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *(void *)(v14 + 368) = v15;
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::StringBag::Put(void *a1, uint64_t *a2)
{
  uint64_t v4 = (uint64_t)(a1 + 1);
  int v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a1 + 1, a2);
  if (v5) {
    return *((unsigned int *)v5 + 10);
  }
  unint64_t v8 = a1[7];
  uint64_t v7 = a1 + 6;
  uint64_t v6 = -1431655765 * ((v8 - a1[6]) >> 3);
  if (v8 >= a1[8])
  {
    uint64_t v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v7, (long long *)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (long long *)a2);
    uint64_t v9 = v8 + 24;
  }
  a1[7] = v9;
  uint64_t v11 = (long long *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, &v11)+ 10) = v6;
  return v6;
}

uint64_t ME_Model::MiniStringBag::Put(unsigned int *a1, uint64_t *a2)
{
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)a1 + 1, a2);
  if (v5) {
    return *((unsigned int *)v5 + 10);
  }
  uint64_t v6 = *a1;
  *a1 = v6 + 1;
  unint64_t v8 = (long long *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, &v8)+ 10) = v6;
  return v6;
}

void ME_Model::classify(ME_Model *this@<X0>, ME_Sample *a2@<X1>, void *a3@<X8>)
{
  memset(v40, 0, sizeof(v40));
  *(_OWORD *)uint64_t v39 = 0u;
  *(_OWORD *)std::string __p = 0u;
  for (uint64_t i = (uint64_t *)*((void *)a2 + 3); i != *((uint64_t **)a2 + 4); i += 3)
  {
    uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)this + 19, i);
    if (v7)
    {
      int v8 = *((_DWORD *)v7 + 10);
      if ((v8 & 0x80000000) == 0)
      {
        uint64_t v9 = (char *)__p[1];
        if (__p[1] >= v39[0])
        {
          uint64_t v11 = (char *)__p[0];
          int64_t v12 = ((char *)__p[1] - (char *)__p[0]) >> 2;
          unint64_t v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 62) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          int64_t v14 = (char *)v39[0] - (char *)__p[0];
          if (((char *)v39[0] - (char *)__p[0]) >> 1 > v13) {
            unint64_t v13 = v14 >> 1;
          }
          if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v13;
          }
          if (v15)
          {
            uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)v39, v15);
            uint64_t v11 = (char *)__p[0];
            uint64_t v9 = (char *)__p[1];
          }
          else
          {
            uint64_t v16 = 0;
          }
          unint64_t v17 = &v16[4 * v12];
          *(_DWORD *)unint64_t v17 = v8;
          uint64_t v10 = v17 + 4;
          while (v9 != v11)
          {
            int v18 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v17 - 1) = v18;
            v17 -= 4;
          }
          __p[0] = v17;
          __p[1] = v10;
          v39[0] = &v16[4 * v15];
          if (v11) {
            operator delete(v11);
          }
        }
        else
        {
          *(_DWORD *)__p[1] = v8;
          uint64_t v10 = v9 + 4;
        }
        __p[1] = v10;
      }
    }
  }
  for (j = (uint64_t *)*((void *)a2 + 6); j != *((uint64_t **)a2 + 7); j += 4)
  {
    unint64_t v20 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)this + 19, j);
    if (v20)
    {
      int v21 = *((_DWORD *)v20 + 10);
      if ((v21 & 0x80000000) == 0)
      {
        uint64_t v22 = j[3];
        uint64_t v23 = *(void **)v40;
        if (*(void *)v40 >= *(void *)&v40[8])
        {
          uint64_t v25 = v39[1];
          uint64_t v26 = (uint64_t)(*(void *)v40 - (unint64_t)v39[1]) >> 4;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          int64_t v28 = *(void *)&v40[8] - (unint64_t)v39[1];
          if ((uint64_t)(*(void *)&v40[8] - (unint64_t)v39[1]) >> 3 > v27) {
            unint64_t v27 = v28 >> 3;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            uint64_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)&v40[8], v29);
            uint64_t v25 = v39[1];
            uint64_t v23 = *(void **)v40;
          }
          else
          {
            uint64_t v30 = 0;
          }
          uint64_t v31 = &v30[16 * v26];
          *(_DWORD *)uint64_t v31 = v21;
          *((void *)v31 + 1) = v22;
          uint64_t v32 = v31;
          if (v23 != v25)
          {
            do
            {
              *((_OWORD *)v32 - 1) = *((_OWORD *)v23 - 1);
              v32 -= 16;
              v23 -= 2;
            }
            while (v23 != v25);
            uint64_t v25 = v39[1];
          }
          unint64_t v24 = v31 + 16;
          v39[1] = v32;
          *(void *)uint64_t v40 = v31 + 16;
          *(void *)&v40[8] = &v30[16 * v29];
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          **(_DWORD **)uint64_t v40 = v21;
          v23[1] = v22;
          unint64_t v24 = (char *)(v23 + 2);
        }
        *(void *)uint64_t v40 = v24;
      }
    }
  }
  long long v33 = (ME_Model *)*((void *)this + 54);
  if (v33)
  {
    ME_Model::classify((uint64_t *)&v36, v33, a2);
    if (*(void *)&v40[16])
    {
      *(void *)&v40[24] = *(void *)&v40[16];
      operator delete(*(void **)&v40[16]);
    }
    *(std::string *)&v40[16] = v36;
    ME_Model::set_ref_dist(this, (ME_Model::Sample *)&v37);
  }
  std::vector<double>::vector(a3, *((int *)this + 70));
  uint64_t v34 = *((void *)this + 15) + 24 * (int)ME_Model::classify((uint64_t)this, &v37, (uint64_t)a3);
  if (*(char *)(v34 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)v34, *(void *)(v34 + 8));
  }
  else
  {
    long long v35 = *(_OWORD *)v34;
    v36.__r_.__value_.__r.__words[2] = *(void *)(v34 + 16);
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v35;
  }
  if (*((char *)a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(std::string *)a2 = v36;
  if (*(void *)&v40[16])
  {
    *(void *)&v40[24] = *(void *)&v40[16];
    operator delete(*(void **)&v40[16]);
  }
  if (v39[1])
  {
    *(void **)uint64_t v40 = v39[1];
    operator delete(v39[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1A641FAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  uint64_t v9 = *(void **)v7;
  if (*(void *)v7)
  {
    *(void *)(v7 + 8) = v9;
    operator delete(v9);
  }
  ME_Model::Sample::~Sample((ME_Model::Sample *)va);
  _Unwind_Resume(a1);
}

void ME_Sample::~ME_Sample(void **this)
{
  unint64_t v2 = this + 6;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v2);
  unint64_t v2 = this + 3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void ME_Model::Sample::~Sample(ME_Model::Sample *this)
{
  unint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }
  int v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 1);
  if (v4)
  {
    *((void *)this + 2) = v4;
    operator delete(v4);
  }
}

void ME_Model::set_ref_dist(ME_Model *this, ME_Model::Sample *a2)
{
  uint64_t v4 = (const void *)*((void *)a2 + 7);
  uint64_t v5 = *((void *)a2 + 8);
  uint64_t v6 = (char *)a2 + 56;
  unint64_t v20 = 0;
  int v21 = 0;
  uint64_t v22 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v20, v4, v5, (v5 - (uint64_t)v4) >> 3);
  std::vector<double>::vector(&v18, *((int *)this + 70));
  uint64_t v7 = v19;
  if (v19 == v18)
  {
    unint64_t v15 = (v19 - (unsigned char *)v18) >> 3;
    uint64_t v14 = (uint64_t)v19;
  }
  else
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    uint64_t v7 = (char *)v18;
    do
    {
      *(void *)&v7[8 * v8] = 0;
      uint64_t v10 = *((void *)this + 15) + 24 * (int)(v9 - 1);
      if (*(char *)(v10 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v10, *(void *)(v10 + 8));
      }
      else
      {
        long long v11 = *(_OWORD *)v10;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v10 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
      }
      int64_t v12 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(*((void *)this + 54) + 80), (uint64_t *)&__p);
      if (v12)
      {
        uint64_t v13 = *((int *)v12 + 10);
        uint64_t v7 = (char *)v18;
        if (v13 != -1) {
          *((void *)v18 + v8) = *((void *)v20 + v13);
        }
      }
      else
      {
        uint64_t v7 = (char *)v18;
      }
      if (*(double *)&v7[8 * v8] == 0.0) {
        *(void *)&v7[8 * v8] = 0x3F50624DD2F1A9FCLL;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        uint64_t v7 = (char *)v18;
      }
      uint64_t v8 = v9;
      uint64_t v14 = (uint64_t)v19;
      unint64_t v15 = (v19 - v7) >> 3;
    }
    while (v15 > v9++);
  }
  if (v6 != (char *)&v18)
  {
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v6, v7, v14, v15);
    uint64_t v7 = (char *)v18;
  }
  if (v7)
  {
    int v19 = v7;
    operator delete(v7);
  }
  if (v20)
  {
    int v21 = v20;
    operator delete(v20);
  }
}

void sub_1A641FD78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

void ME_Model::get_features(void *a1, uint64_t *a2)
{
  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(a2);
  uint64_t v4 = (uint64_t *)a1[21];
  if (v4)
  {
    uint64_t v5 = a1[15];
    uint64_t v6 = a1[16];
    do
    {
      if ((int)(-1431655765 * ((unint64_t)(v6 - v5) >> 3)) >= 1)
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        do
        {
          unsigned int v9 = (long long *)(v5 + v7);
          if (*((char *)v9 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)v9, *((void *)v9 + 1));
          }
          else
          {
            long long v10 = *v9;
            v25.__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
            *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v10;
          }
          if (*((char *)v4 + 39) < 0) {
            std::string::__init_copy_ctor_external(&v24, (const std::string::value_type *)v4[2], v4[3]);
          }
          else {
            std::string v24 = *(std::string *)(v4 + 2);
          }
          LODWORD(v20.__r_.__value_.__l.__data_) = v8 + (*((_DWORD *)v4 + 10) << 8);
          long long v11 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1 + 27, (unsigned int *)&v20);
          if (v11)
          {
            uint64_t v12 = *((unsigned int *)v11 + 5);
            if ((v12 & 0x80000000) == 0)
            {
              std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(&v17, (long long *)&v25, (long long *)&v24);
              uint64_t v13 = a1[24];
              std::string v20 = v17;
              memset(&v17, 0, sizeof(v17));
              long long v21 = __p;
              uint64_t v22 = v19;
              long long __p = 0uLL;
              uint64_t v19 = 0;
              uint64_t v23 = *(void *)(v13 + 8 * v12);
              uint64_t v14 = v23;
              unint64_t v15 = (char *)operator new(0x48uLL);
              *(std::string *)(v15 + 16) = v20;
              memset(&v20, 0, sizeof(v20));
              *((void *)v15 + 7) = v22;
              *(_OWORD *)(v15 + 40) = v21;
              *((void *)v15 + 8) = v14;
              uint64_t v16 = *a2;
              *(void *)unint64_t v15 = *a2;
              *((void *)v15 + 1) = a2;
              *(void *)(v16 + 8) = v15;
              *a2 = (uint64_t)v15;
              ++a2[2];
              if (SHIBYTE(v19) < 0) {
                operator delete((void *)__p);
              }
              if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v17.__r_.__value_.__l.__data_);
              }
            }
          }
          if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v24.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v25.__r_.__value_.__l.__data_);
          }
          ++v8;
          uint64_t v5 = a1[15];
          uint64_t v6 = a1[16];
          v7 += 24;
        }
        while (v8 < (int)(-1431655765 * ((unint64_t)(v6 - v5) >> 3)));
      }
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
}

void sub_1A641FFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  std::pair<std::pair<std::string,std::string>,double>::~pair((uint64_t)&a15);
  std::pair<std::pair<std::string,std::string>,double>::~pair((uint64_t)&a9);
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 105) < 0) {
    operator delete(*(void **)(v28 - 128));
  }
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::pair<std::string,std::string>,double>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ME_Model::clear(ME_Model *this)
{
  *((void *)this + 25) = *((void *)this + 24);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 80);
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 15);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 152);
  *((_DWORD *)this + 36) = 0;
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((void *)this + 27);
  *((void *)this + 33) = *((void *)this + 32);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 42);
  *((void *)this + 37) = *((void *)this + 36);
  *((void *)this + 40) = *((void *)this + 39);
  int v3 = (void *)*((void *)this + 6);
  for (uint64_t i = (void *)*((void *)this + 7); i != v3; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(i))
    i -= 10;
  *((void *)this + 7) = v3;
  uint64_t v5 = (void *)*((void *)this + 45);
  for (j = (void *)*((void *)this + 46); j != v5; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(j))
    j -= 10;
  *((void *)this + 46) = v5;
}

BOOL ME_Model::load_from_file(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(char *)(a2 + 23) >= 0) {
    int v3 = (const char *)a2;
  }
  else {
    int v3 = *(const char **)a2;
  }
  uint64_t v4 = fopen(v3, "r");
  if (v4)
  {
    uint64_t v5 = (void **)(a1 + 192);
    *(void *)(a1 + 200) = *(void *)(a1 + 192);
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(a1 + 80);
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)(a1 + 120));
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(a1 + 152);
    *(_DWORD *)(a1 + 144) = 0;
    std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((void *)(a1 + 216));
    *(void *)(a1 + 264) = *(void *)(a1 + 256);
    while (fgets(__s, 1024, v4))
    {
      std::string::basic_string[abi:ne180100]<0>(&__str, __s);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else {
        size_t size = __str.__r_.__value_.__l.__size_;
      }
      if (size)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_str = &__str;
        }
        else {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        uint64_t v8 = memchr(p_str, 9, size);
        if (v8) {
          std::string::size_type v9 = v8 - (unsigned char *)p_str;
        }
        else {
          std::string::size_type v9 = -1;
        }
        while (size)
        {
          int v10 = *((unsigned __int8 *)&p_str[-1].__r_.__value_.__r.__words[2] + size-- + 7);
          if (v10 == 9) {
            goto LABEL_21;
          }
        }
      }
      else
      {
        std::string::size_type v9 = -1;
      }
      size_t size = -1;
LABEL_21:
      std::string::basic_string(&v30, &__str, 0, v9, (std::allocator<char> *)&v29);
      std::string::basic_string(&v29, &__str, v9 + 1, size - (v9 + 1), (std::allocator<char> *)&v27);
      float v28 = 0.0;
      std::string::basic_string(&v27, &__str, size + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v26);
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v11 = &v27;
      }
      else {
        long long v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }
      sscanf((const char *)v11, "%f", &v28);
      int v12 = ME_Model::StringBag::Put((void *)(a1 + 72), (uint64_t *)&v30);
      int v26 = v12 + (ME_Model::MiniStringBag::Put((unsigned int *)(a1 + 144), (uint64_t *)&v29) << 8);
      ME_Model::ME_FeatureBag::Put((void *)(a1 + 216), &v26);
      double v13 = v28;
      unint64_t v15 = *(double **)(a1 + 200);
      unint64_t v14 = *(void *)(a1 + 208);
      if ((unint64_t)v15 >= v14)
      {
        std::string v17 = (double *)*v5;
        uint64_t v18 = ((char *)v15 - (unsigned char *)*v5) >> 3;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v14 - (void)v17;
        if (v20 >> 2 > v19) {
          unint64_t v19 = v20 >> 2;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        if (v21)
        {
          uint64_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 208, v21);
          std::string v17 = *(double **)(a1 + 192);
          unint64_t v15 = *(double **)(a1 + 200);
        }
        else
        {
          uint64_t v22 = 0;
        }
        uint64_t v23 = (double *)&v22[8 * v18];
        *uint64_t v23 = v13;
        uint64_t v16 = v23 + 1;
        while (v15 != v17)
        {
          uint64_t v24 = *((void *)v15-- - 1);
          *((void *)v23-- - 1) = v24;
        }
        *(void *)(a1 + 192) = v23;
        *(void *)(a1 + 200) = v16;
        *(void *)(a1 + 208) = &v22[8 * v21];
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        *unint64_t v15 = v13;
        uint64_t v16 = v15 + 1;
      }
      *(void *)(a1 + 200) = v16;
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v29.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
    }
    *(_DWORD *)(a1 + 280) = -1431655765 * ((*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 3);
    ME_Model::init_feature2mef((ME_Model *)a1);
    fclose(v4);
  }
  return v4 != 0;
}

void sub_1A6420494(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::load_from_array(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = (void **)(a1 + 192);
  *(void *)(a1 + 200) = *(void *)(a1 + 192);
  uint64_t v6 = (void *)(a1 + 72);
  uint64_t v7 = (unsigned int *)(a1 + 144);
  uint64_t v8 = (void *)(a1 + 216);
  uint64_t v31 = a1 + 208;
  while (1)
  {
    std::string::size_type v9 = (char **)(a2 + 24 * v4);
    std::string::basic_string[abi:ne180100]<0>(__p, *v9);
    unint64_t v10 = v33;
    if ((v33 & 0x80u) != 0) {
      unint64_t v10 = (unint64_t)__p[1];
    }
    if (v10 != 3)
    {
      BOOL v15 = 0;
      if (((char)v33 & 0x80000000) == 0) {
        goto LABEL_17;
      }
LABEL_16:
      operator delete(__p[0]);
      goto LABEL_17;
    }
    long long v11 = (void **)__p[0];
    if ((v33 & 0x80u) == 0) {
      long long v11 = __p;
    }
    int v12 = *(unsigned __int16 *)v11;
    int v13 = *((unsigned __int8 *)v11 + 2);
    BOOL v15 = v12 == 12079 && v13 == 47;
    if ((char)v33 < 0) {
      goto LABEL_16;
    }
LABEL_17:
    if (v15) {
      break;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, *v9);
    int v16 = ME_Model::StringBag::Put(v6, (uint64_t *)__p);
    if ((char)v33 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a2 + 24 * v4 + 8));
    int v17 = ME_Model::MiniStringBag::Put(v7, (uint64_t *)__p);
    if ((char)v33 < 0) {
      operator delete(__p[0]);
    }
    LODWORD(__p[0]) = v16 + (v17 << 8);
    ME_Model::ME_FeatureBag::Put(v8, __p);
    uint64_t v18 = (void *)(a2 + 24 * v4 + 16);
    uint64_t v20 = *(char **)(a1 + 200);
    unint64_t v19 = *(void *)(a1 + 208);
    if ((unint64_t)v20 >= v19)
    {
      uint64_t v22 = (char *)*v5;
      uint64_t v23 = (v20 - (unsigned char *)*v5) >> 3;
      unint64_t v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 61) {
        std::vector<double>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v25 = v19 - (void)v22;
      if (v25 >> 2 > v24) {
        unint64_t v24 = v25 >> 2;
      }
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v26)
      {
        std::string v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v31, v26);
        uint64_t v22 = *(char **)(a1 + 192);
        uint64_t v20 = *(char **)(a1 + 200);
      }
      else
      {
        std::string v27 = 0;
      }
      float v28 = &v27[8 * v23];
      *(void *)float v28 = *v18;
      unint64_t v21 = v28 + 8;
      while (v20 != v22)
      {
        uint64_t v29 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v28 - 1) = v29;
        v28 -= 8;
      }
      *(void *)(a1 + 192) = v28;
      *(void *)(a1 + 200) = v21;
      *(void *)(a1 + 208) = &v27[8 * v26];
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      *(void *)uint64_t v20 = *v18;
      unint64_t v21 = v20 + 8;
    }
    *(void *)(a1 + 200) = v21;
    ++v4;
  }
  *(_DWORD *)(a1 + 280) = -1431655765 * ((*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 3);
  ME_Model::init_feature2mef((ME_Model *)a1);
  return 1;
}

void sub_1A6420754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL ME_Model::save_to_file(void *a1, uint64_t a2, double a3)
{
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v5 = (const char *)a2;
  }
  else {
    uint64_t v5 = *(const char **)a2;
  }
  uint64_t v6 = fopen(v5, "w");
  if (v6)
  {
    uint64_t v7 = (uint64_t *)a1[21];
    if (v7)
    {
      uint64_t v8 = a1[15];
      uint64_t v9 = a1[16];
      do
      {
        if ((int)(-1431655765 * ((unint64_t)(v9 - v8) >> 3)) >= 1)
        {
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          do
          {
            int v12 = (long long *)(v8 + v10);
            if (*((char *)v12 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v12, *((void *)v12 + 1));
            }
            else
            {
              long long v13 = *v12;
              v23.__r_.__value_.__r.__words[2] = *((void *)v12 + 2);
              *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v13;
            }
            if (*((char *)v7 + 39) < 0) {
              std::string::__init_copy_ctor_external(&v22, (const std::string::value_type *)v7[2], v7[3]);
            }
            else {
              std::string v22 = *(std::string *)(v7 + 2);
            }
            unsigned int v24 = v11 + (*((_DWORD *)v7 + 10) << 8);
            unint64_t v14 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1 + 27, &v24);
            if (v14)
            {
              uint64_t v15 = *((unsigned int *)v14 + 5);
              if ((v15 & 0x80000000) == 0)
              {
                double v16 = *(double *)(a1[24] + 8 * v15);
                double v17 = fabs(v16);
                if (v16 != 0.0 && v17 >= a3)
                {
                  unint64_t v19 = &v23;
                  if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    unint64_t v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
                  }
                  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    uint64_t v20 = &v22;
                  }
                  else {
                    uint64_t v20 = (std::string *)v22.__r_.__value_.__r.__words[0];
                  }
                  fprintf(v6, "%s\t%s\t%f\n", (const char *)v19, (const char *)v20, v16);
                }
              }
            }
            if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v22.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v23.__r_.__value_.__l.__data_);
            }
            ++v11;
            uint64_t v8 = a1[15];
            uint64_t v9 = a1[16];
            v10 += 24;
          }
          while (v11 < (int)(-1431655765 * ((unint64_t)(v9 - v8) >> 3)));
        }
        uint64_t v7 = (uint64_t *)*v7;
      }
      while (v7);
    }
    fclose(v6);
  }
  return v6 != 0;
}

void sub_1A6420950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    long long v13 = (char *)v7[1];
    int v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  double v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *int v12 = &v9[v17];
  return result;
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5C53450, MEMORY[0x1E4FBA1C8]);
}

void sub_1A6420B80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1A6420C58(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::vector<double>::__move_assign(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void *std::vector<double>::vector(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A6420D30(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (__n128 result = *v6; result; __n128 result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[8 * v11];
    double v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    size_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(void *a1)
{
  int8x8_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a1[1];
  if (v4)
  {
    a1[2] = v4;
    operator delete(v4);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(void *a1, uint64_t *a2)
{
  unint64_t v4 = ME_Model::hashfun_str::operator()((uint64_t)(a1 + 3), a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, (unsigned __int8 *)a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  unint64_t v4 = ME_Model::hashfun_str::operator()((uint64_t)(a1 + 3), a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  unint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, (unsigned __int8 *)a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t ME_Model::hashfun_str::operator()(uint64_t a1, uint64_t *a2)
{
  LODWORD(v2) = *((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = a2[1];
  }
  if ((int)v2 < 4)
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t result = 0;
    if (v3 >= 0) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (uint64_t *)*a2;
    }
    int v7 = (int)v2 / 4;
    do
    {
      result ^= (int)(*(_DWORD *)((char *)v6 + v4) << (v4 & 4));
      v4 += 4;
      --v7;
    }
    while (v7);
  }
  if ((v2 & 3) != 0)
  {
    uint64_t v8 = 0;
    int v9 = 4 * ((int)v2 / 4);
    uint64_t v10 = v2 & 3;
    if (v3 >= 0) {
      uint64_t v11 = a2;
    }
    else {
      uint64_t v11 = (uint64_t *)*a2;
    }
    uint64_t v12 = (char *)v11 + v9;
    do
    {
      int v13 = *v12++;
      result ^= v13 << v8;
      v8 += 8;
    }
    while (8 * v10 != v8);
  }
  return result;
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    int v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_1A642126C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_1A6421384(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = ME_Model::hashfun_str::operator()(a1 + 24, a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    long long v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, (unsigned __int8 *)a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  std::string v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *std::string v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_1A642187C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_DWORD *)v8 + 10) = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_1A6421930(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      long long v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *long long v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            long long v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          long long v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_1A6421C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  long long v11 = this;
  unint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      unint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_1A6421DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

std::string *std::vector<std::pair<std::string,double>>::__init_with_size[abi:ne180100]<std::pair<std::string,double>*,std::pair<std::string,double>*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::pair<std::string,double>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*,std::pair<std::string,double>*,std::pair<std::string,double>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_1A6421F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,double>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*,std::pair<std::string,double>*,std::pair<std::string,double>*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  unint64_t v12 = this;
  unint64_t v13 = this;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  char v11 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        unint64_t v8 = v13;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        unint64_t v8 = v4;
      }
      v4[1].__r_.__value_.__r.__words[0] = *((void *)v6 + 3);
      v6 += 2;
      uint64_t v4 = (std::string *)((char *)v8 + 32);
      unint64_t v13 = (std::string *)((char *)v8 + 32);
    }
    while (v6 != a3);
  }
  char v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A64220AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 9) < 0) {
      operator delete(*(void **)(v1 - 32));
    }
    v1 -= 32;
  }
}

void std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::pair<std::string,double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

uint64_t std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x199999999999999) {
    unint64_t v9 = 0x333333333333333;
  }
  else {
    unint64_t v9 = v5;
  }
  float v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::Sample>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v13 = v10;
  long long v14 = &v10[80 * v4];
  unint64_t v16 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>((uint64_t)v14, a2);
  long long v15 = v14 + 80;
  std::vector<ME_Model::Sample>::__swap_out_circular_buffer(a1, &v13);
  uint64_t v11 = a1[1];
  std::__split_buffer<ME_Model::Sample>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A64222D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ME_Model::Sample>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>((void *)(a1 + 8), *(const void **)(a2 + 8), *(void *)(a2 + 16), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 2);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>((char *)(a1 + 32), *(long long **)(a2 + 32), *(long long **)(a2 + 40), (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 4);
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((void *)(a1 + 56), *(const void **)(a2 + 56), *(void *)(a2 + 64), (uint64_t)(*(void *)(a2 + 64) - *(void *)(a2 + 56)) >> 3);
  return a1;
}

void sub_1A6422384(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 40) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A6422418(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

char *std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_1A64224D0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<ME_Model::Sample>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 80;
    v4 -= 80;
    std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample,ME_Model::Sample*>(v6, v4);
  }
  a2[1] = v6;
  uint64_t v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::Sample>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

__n128 std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample,ME_Model::Sample*>(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(a1 + 56) = result;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  return result;
}

uint64_t std::__split_buffer<ME_Model::Sample>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>((void *)(i - 80));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(std::vector<int> *a1, std::vector<int> *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)v11) >> 4);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if (ME_Model::Sample::operator<((uint64_t)&a2[-4].__end_cap_, (uint64_t)v11))
          {
            std::swap[abi:ne180100]<ME_Model::Sample>(v11, (uint64_t)&a2[-4].__end_cap_);
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v11, (std::vector<int> *)((char *)v11 + 80), (uint64_t)&a2[-4].__end_cap_);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v11, (std::vector<int> *)((char *)v11 + 80), (std::vector<int> *)((char *)v11 + 160), (uint64_t)&a2[-4].__end_cap_);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v11, (std::vector<int> *)((char *)v11 + 80), (std::vector<int> *)((char *)v11 + 160), v11 + 10, (uint64_t)&a2[-4].__end_cap_);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 1919) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,ME_Model::Sample *>((uint64_t)v11, (uint64_t)a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    float v17 = (std::vector<int> *)((char *)v11 + 80 * (v15 >> 1));
    if ((unint64_t)v14 >= 0x2801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v11, (std::vector<int> *)((char *)v11 + 80 * (v15 >> 1)), (uint64_t)&a2[-4].__end_cap_);
      uint64_t v18 = 5 * v16;
      BOOL v19 = (std::vector<int> *)((char *)v11 + 80 * v16 - 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)((char *)v11 + 80), v19, (uint64_t)&a2[-7].__end_);
      unint64_t v20 = (std::vector<int> *)((char *)v11 + 160);
      unint64_t v21 = (std::vector<int> *)((char *)v11 + 16 * v18 + 80);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v20, v21, (uint64_t)&a2[-10]);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v19, v17, (uint64_t)v21);
      std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)v17);
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)((char *)v11 + 80 * (v15 >> 1)), v11, (uint64_t)&a2[-4].__end_cap_);
      if (a5) {
        goto LABEL_13;
      }
    }
    if ((ME_Model::Sample::operator<((uint64_t)&a1[-4].__end_cap_, (uint64_t)a1) & 1) == 0)
    {
      uint64_t v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
      goto LABEL_18;
    }
LABEL_13:
    size_t v22 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
    if ((v23 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v24 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)a1, (uint64_t)v22);
    uint64_t v11 = (std::vector<int> *)&v22[10];
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)&v22[10], (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (std::vector<int> *)v22;
      if (v24) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v24)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(a1, v22, a3, -v13, a5 & 1);
      uint64_t v11 = (std::vector<int> *)&v22[10];
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)v11, (int *)a2);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)v11, (unsigned __int32 *)a2);
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, int *a2)
{
  if ((int *)a1 != a2)
  {
    uint64_t v34 = v2;
    uint64_t v35 = v3;
    uint64_t v6 = a1 + 80;
    if ((int *)(a1 + 80) != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = a1;
      do
      {
        uint64_t v9 = (int *)v6;
        if (ME_Model::Sample::operator<(v6, v8))
        {
          int v27 = *v9;
          *(_OWORD *)float v28 = *(_OWORD *)(v8 + 88);
          uint64_t v29 = *(void *)(v8 + 104);
          *(void *)(v8 + 88) = 0;
          *(void *)(v8 + 96) = 0;
          *(_OWORD *)long long __p = *(_OWORD *)(v8 + 112);
          uint64_t v31 = *(void *)(v8 + 128);
          *(void *)(v8 + 104) = 0;
          *(void *)(v8 + 112) = 0;
          *(void *)(v8 + 120) = 0;
          *(void *)(v8 + 128) = 0;
          long long v32 = *(_OWORD *)(v8 + 136);
          uint64_t v33 = *(void *)(v8 + 152);
          *(void *)(v8 + 136) = 0;
          *(void *)(v8 + 144) = 0;
          uint64_t v10 = v7;
          *(void *)(v8 + 152) = 0;
          while (1)
          {
            uint64_t v11 = a1 + v10;
            *(_DWORD *)(a1 + v10 + 80) = *(_DWORD *)(a1 + v10);
            std::vector<double>::__move_assign(a1 + v10 + 88, (__n128 *)(a1 + v10 + 8));
            std::vector<double>::__move_assign(v11 + 112, (__n128 *)(v11 + 32));
            std::vector<double>::__move_assign(v11 + 136, (__n128 *)(v11 + 56));
            if (!v10) {
              break;
            }
            v10 -= 80;
            if ((ME_Model::Sample::operator<((uint64_t)&v27, v10 + a1) & 1) == 0)
            {
              uint64_t v12 = a1 + v10 + 80;
              goto LABEL_10;
            }
          }
          uint64_t v12 = a1;
LABEL_10:
          *(_DWORD *)uint64_t v12 = v27;
          unint64_t v15 = *(void **)(v11 + 8);
          uint64_t v14 = (void *)(v11 + 8);
          uint64_t v13 = v15;
          if (v15)
          {
            *(void *)(v12 + 16) = v13;
            operator delete(v13);
            void *v14 = 0;
            v14[1] = 0;
            v14[2] = 0;
          }
          unint64_t v16 = v14 + 3;
          float v17 = v28[1];
          void *v14 = v28[0];
          uint64_t v18 = v29;
          *(void *)(v12 + 16) = v17;
          *(void *)(v12 + 24) = v18;
          v28[1] = 0;
          uint64_t v29 = 0;
          v28[0] = 0;
          BOOL v19 = (void *)v14[3];
          if (v19)
          {
            *(void *)(v12 + 40) = v19;
            operator delete(v19);
            *unint64_t v16 = 0;
            v14[4] = 0;
            v14[5] = 0;
          }
          unint64_t v20 = __p[1];
          *unint64_t v16 = __p[0];
          uint64_t v21 = v31;
          *(void *)(v12 + 40) = v20;
          *(void *)(v12 + 48) = v21;
          __p[1] = 0;
          uint64_t v31 = 0;
          __p[0] = 0;
          BOOL v24 = (void *)v14[6];
          char v23 = v14 + 6;
          size_t v22 = v24;
          if (v24)
          {
            *(void *)(v12 + 64) = v22;
            operator delete(v22);
            *char v23 = 0;
            v23[1] = 0;
            v23[2] = 0;
            size_t v22 = __p[0];
          }
          uint64_t v25 = *((void *)&v32 + 1);
          *char v23 = v32;
          uint64_t v26 = v33;
          *(void *)(v12 + 64) = v25;
          *(void *)(v12 + 72) = v26;
          uint64_t v33 = 0;
          long long v32 = 0uLL;
          if (v22)
          {
            __p[1] = v22;
            operator delete(v22);
          }
          if (v28[0])
          {
            v28[1] = v28[0];
            operator delete(v28[0]);
          }
        }
        uint64_t v6 = (uint64_t)(v9 + 20);
        v7 += 80;
        uint64_t v8 = (uint64_t)v9;
      }
      while (v9 + 20 != a2);
    }
  }
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, unsigned __int32 *a2)
{
  if ((unsigned __int32 *)a1 != a2)
  {
    uint64_t v21 = v2;
    uint64_t v22 = v3;
    uint64_t v5 = a1;
    uint64_t v6 = a1 + 80;
    if ((unsigned __int32 *)(a1 + 80) != a2)
    {
      uint64_t v7 = (__n128 *)(a1 + 152);
      do
      {
        uint64_t v8 = (unsigned __int32 *)v6;
        if (ME_Model::Sample::operator<(v6, v5))
        {
          unsigned __int32 v14 = *v8;
          *(_OWORD *)unint64_t v15 = *(_OWORD *)(v5 + 88);
          unint64_t v16 = *(void *)(v5 + 104);
          *(void *)(v5 + 88) = 0;
          *(void *)(v5 + 96) = 0;
          *(_OWORD *)long long __p = *(_OWORD *)(v5 + 112);
          unint64_t v18 = *(void *)(v5 + 128);
          *(void *)(v5 + 104) = 0;
          *(void *)(v5 + 112) = 0;
          *(void *)(v5 + 120) = 0;
          *(void *)(v5 + 128) = 0;
          __n128 v19 = *(__n128 *)(v5 + 136);
          unint64_t v20 = *(void *)(v5 + 152);
          *(void *)(v5 + 136) = 0;
          *(void *)(v5 + 144) = 0;
          uint64_t v9 = v7;
          *(void *)(v5 + 152) = 0;
          do
          {
            v9[-5].n128_u32[2] = v9[-10].n128_u32[2];
            std::vector<double>::__move_assign((uint64_t)&v9[-4], v9 - 9);
            std::vector<double>::__move_assign((uint64_t)&v9[-3].n128_i64[1], (__n128 *)((char *)v9 - 120));
            std::vector<double>::__move_assign((uint64_t)&v9[-1], v9 - 6);
            char v10 = ME_Model::Sample::operator<((uint64_t)&v14, (uint64_t)&v9[-15].n128_i64[1]);
            v9 -= 5;
          }
          while ((v10 & 1) != 0);
          uint64_t v11 = (void *)v9[-4].n128_u64[0];
          v9[-5].n128_u32[2] = v14;
          if (v11)
          {
            v9[-4].n128_u64[1] = (unint64_t)v11;
            operator delete(v11);
            v9[-4].n128_u64[0] = 0;
            v9[-4].n128_u64[1] = 0;
            v9[-3].n128_u64[0] = 0;
          }
          v9[-4] = *(__n128 *)v15;
          v9[-3].n128_u64[0] = v16;
          v15[1] = 0;
          unint64_t v16 = 0;
          v15[0] = 0;
          uint64_t v12 = (void *)v9[-3].n128_u64[1];
          if (v12)
          {
            v9[-2].n128_u64[0] = (unint64_t)v12;
            operator delete(v12);
            v9[-3].n128_u64[1] = 0;
            v9[-2].n128_u64[0] = 0;
            v9[-2].n128_u64[1] = 0;
          }
          *(__n128 *)((char *)v9 - 40) = *(__n128 *)__p;
          v9[-2].n128_u64[1] = v18;
          __p[1] = 0;
          unint64_t v18 = 0;
          __p[0] = 0;
          uint64_t v13 = (void *)v9[-1].n128_u64[0];
          if (v13)
          {
            v9[-1].n128_u64[1] = (unint64_t)v13;
            operator delete(v13);
            v9[-1].n128_u64[0] = 0;
            v9[-1].n128_u64[1] = 0;
            v9->n128_u64[0] = 0;
            uint64_t v13 = __p[0];
          }
          v9[-1] = v19;
          v9->n128_u64[0] = v20;
          unint64_t v20 = 0;
          __n128 v19 = 0uLL;
          if (v13)
          {
            __p[1] = v13;
            operator delete(v13);
          }
          if (v15[0])
          {
            v15[1] = v15[0];
            operator delete(v15[0]);
          }
        }
        uint64_t v6 = (uint64_t)(v8 + 20);
        v7 += 5;
        uint64_t v5 = (uint64_t)v8;
      }
      while (v8 + 20 != a2);
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, uint64_t a3)
{
  char v6 = ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1);
  uint64_t result = ME_Model::Sample::operator<(a3, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    std::swap[abi:ne180100]<ME_Model::Sample>(a2, a3);
    if (!ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1)) {
      return 1;
    }
    uint64_t v8 = a1;
    uint64_t v9 = (uint64_t)a2;
    goto LABEL_9;
  }
  if (!result)
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2);
    if (!ME_Model::Sample::operator<(a3, (uint64_t)a2)) {
      return 1;
    }
    uint64_t v8 = a2;
    uint64_t v9 = a3;
LABEL_9:
    std::swap[abi:ne180100]<ME_Model::Sample>(v8, v9);
    return 2;
  }
  std::swap[abi:ne180100]<ME_Model::Sample>(a1, a3);
  return 1;
}

std::vector<int> *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int value = (int)a1->__value_;
  uint64_t v4 = (uint64_t)&a1[1];
  *(_OWORD *)unint64_t v15 = *(_OWORD *)&a1[1].__value_;
  unint64_t v16 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  uint64_t v5 = (uint64_t)&a1[4];
  *(_OWORD *)long long __p = *(_OWORD *)&a1[4].__value_;
  unint64_t v18 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  uint64_t v6 = (uint64_t)&a1[7];
  long long v19 = *(_OWORD *)&a1[7].__value_;
  unint64_t v20 = a1[9].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  if (ME_Model::Sample::operator<((uint64_t)&value, a2 - 80))
  {
    uint64_t v7 = (std::vector<int> *)a1;
    do
      uint64_t v7 = (std::vector<int> *)((char *)v7 + 80);
    while ((ME_Model::Sample::operator<((uint64_t)&value, (uint64_t)v7) & 1) == 0);
  }
  else
  {
    p_std::__split_buffer<std::string>::pointer end = (unint64_t)&a1[10];
    do
    {
      uint64_t v7 = (std::vector<int> *)p_end;
      if (p_end >= v2) {
        break;
      }
      int v9 = ME_Model::Sample::operator<((uint64_t)&value, p_end);
      p_std::__split_buffer<std::string>::pointer end = (unint64_t)&v7[3].__end_;
    }
    while (!v9);
  }
  if ((unint64_t)v7 < v2)
  {
    do
      v2 -= 80;
    while ((ME_Model::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  while ((unint64_t)v7 < v2)
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(v7, v2);
    do
      uint64_t v7 = (std::vector<int> *)((char *)v7 + 80);
    while (!ME_Model::Sample::operator<((uint64_t)&value, (uint64_t)v7));
    do
      v2 -= 80;
    while ((ME_Model::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  if (&v7[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v7[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v4, (__n128 *)&v7[-3]);
    std::vector<double>::__move_assign(v5, (__n128 *)&v7[-2]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v7[-1]);
  }
  begin = v7[-3].__begin_;
  LODWORD(v7[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v7[-3].__end_ = begin;
    operator delete(begin);
    v7[-3].__begin_ = 0;
    v7[-3].__end_ = 0;
    v7[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-3].__begin_ = *(_OWORD *)v15;
  v7[-3].__end_cap_.__value_ = v16;
  v15[0] = 0;
  v15[1] = 0;
  unint64_t v16 = 0;
  uint64_t v11 = v7[-2].__begin_;
  if (v11)
  {
    v7[-2].__end_ = v11;
    operator delete(v11);
    v7[-2].__begin_ = 0;
    v7[-2].__end_ = 0;
    v7[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-2].__begin_ = *(_OWORD *)__p;
  v7[-2].__end_cap_.__value_ = v18;
  __p[0] = 0;
  __p[1] = 0;
  unint64_t v18 = 0;
  uint64_t v12 = v7[-1].__begin_;
  if (v12)
  {
    v7[-1].__end_ = v12;
    operator delete(v12);
    v7[-1].__begin_ = 0;
    v7[-1].__end_ = 0;
    v7[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-1].__begin_ = v19;
  v7[-1].__end_cap_.__value_ = v20;
  long long v19 = 0uLL;
  unint64_t v20 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v15[0])
  {
    v15[1] = v15[0];
    operator delete(v15[0]);
  }
  return v7;
}

std::__compressed_pair<int *> *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  int value = (int)a1->__value_;
  uint64_t v5 = (uint64_t)&a1[1];
  *(_OWORD *)unint64_t v16 = *(_OWORD *)&a1[1].__value_;
  float v17 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  uint64_t v6 = (uint64_t)&a1[4];
  *(_OWORD *)long long __p = *(_OWORD *)&a1[4].__value_;
  long long v19 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  uint64_t v21 = a1[9].__value_;
  uint64_t v7 = (uint64_t)&a1[7];
  long long v20 = *(_OWORD *)&a1[7].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  do
    v4 += 10;
  while ((ME_Model::Sample::operator<((uint64_t)&a1[v4], (uint64_t)&value) & 1) != 0);
  unint64_t v8 = (unint64_t)&a1[v4];
  if (v4 == 10)
  {
    do
    {
      if (v8 >= a2) {
        break;
      }
      a2 -= 80;
    }
    while ((ME_Model::Sample::operator<(a2, (uint64_t)&value) & 1) == 0);
  }
  else
  {
    do
      a2 -= 80;
    while (!ME_Model::Sample::operator<(a2, (uint64_t)&value));
  }
  int v9 = (std::vector<int> *)&a1[v4];
  if (v8 < a2)
  {
    unint64_t v10 = a2;
    do
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(v9, v10);
      do
        int v9 = (std::vector<int> *)((char *)v9 + 80);
      while ((ME_Model::Sample::operator<((uint64_t)v9, (uint64_t)&value) & 1) != 0);
      do
        v10 -= 80;
      while (!ME_Model::Sample::operator<(v10, (uint64_t)&value));
    }
    while ((unint64_t)v9 < v10);
  }
  if (&v9[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v9[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v5, (__n128 *)&v9[-3]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v9[-2]);
    std::vector<double>::__move_assign(v7, (__n128 *)&v9[-1]);
  }
  begin = v9[-3].__begin_;
  LODWORD(v9[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v9[-3].__end_ = begin;
    operator delete(begin);
    v9[-3].__begin_ = 0;
    v9[-3].__end_ = 0;
    v9[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-3].__begin_ = *(_OWORD *)v16;
  v9[-3].__end_cap_.__value_ = v17;
  v16[0] = 0;
  v16[1] = 0;
  float v17 = 0;
  uint64_t v12 = v9[-2].__begin_;
  if (v12)
  {
    v9[-2].__end_ = v12;
    operator delete(v12);
    v9[-2].__begin_ = 0;
    v9[-2].__end_ = 0;
    v9[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-2].__begin_ = *(_OWORD *)__p;
  v9[-2].__end_cap_.__value_ = v19;
  __p[0] = 0;
  __p[1] = 0;
  long long v19 = 0;
  uint64_t v13 = v9[-1].__begin_;
  if (v13)
  {
    v9[-1].__end_ = v13;
    operator delete(v13);
    v9[-1].__begin_ = 0;
    v9[-1].__end_ = 0;
    v9[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-1].__begin_ = v20;
  v9[-1].__end_cap_.__value_ = v21;
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }
  return &v9[-4].__end_cap_;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(0xCCCCCCCCCCCCCCCDLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = a2 - 80;
      if (ME_Model::Sample::operator<(a2 - 80, a1)) {
        std::swap[abi:ne180100]<ME_Model::Sample>((std::vector<int> *)a1, v6);
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a2 - 80);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), a2 - 80);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), (std::vector<int> *)(a1 + 240), a2 - 80);
      return 1;
    default:
      uint64_t v7 = a1 + 160;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a1 + 160);
      uint64_t v8 = a1 + 240;
      if (a1 + 240 == a2) {
        return 1;
      }
      uint64_t v9 = 0;
      int v10 = 0;
      break;
  }
  while (1)
  {
    if (ME_Model::Sample::operator<(v8, v7))
    {
      int v28 = *(_DWORD *)v8;
      *(_OWORD *)uint64_t v29 = *(_OWORD *)(v8 + 8);
      uint64_t v30 = *(void *)(v8 + 24);
      *(void *)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
      *(_OWORD *)long long __p = *(_OWORD *)(v8 + 32);
      uint64_t v32 = *(void *)(v8 + 48);
      *(void *)(v8 + 24) = 0;
      *(void *)(v8 + 32) = 0;
      *(void *)(v8 + 40) = 0;
      *(void *)(v8 + 48) = 0;
      long long v33 = *(_OWORD *)(v8 + 56);
      uint64_t v34 = *(void *)(v8 + 72);
      *(void *)(v8 + 64) = 0;
      *(void *)(v8 + 72) = 0;
      uint64_t v11 = v9;
      *(void *)(v8 + 56) = 0;
      while (1)
      {
        uint64_t v12 = a1 + v11;
        *(_DWORD *)(a1 + v11 + 240) = *(_DWORD *)(a1 + v11 + 160);
        std::vector<double>::__move_assign(a1 + v11 + 248, (__n128 *)(a1 + v11 + 168));
        std::vector<double>::__move_assign(v12 + 272, (__n128 *)(v12 + 192));
        std::vector<double>::__move_assign(v12 + 296, (__n128 *)(v12 + 216));
        if (v11 == -160) {
          break;
        }
        v11 -= 80;
        if ((ME_Model::Sample::operator<((uint64_t)&v28, v12 + 80) & 1) == 0)
        {
          uint64_t v13 = a1 + v11 + 240;
          goto LABEL_12;
        }
      }
      uint64_t v13 = a1;
LABEL_12:
      *(_DWORD *)uint64_t v13 = v28;
      unint64_t v16 = *(void **)(v12 + 168);
      unint64_t v15 = (void *)(v12 + 168);
      unsigned __int32 v14 = v16;
      if (v16)
      {
        *(void *)(v13 + 16) = v14;
        operator delete(v14);
        *unint64_t v15 = 0;
        v15[1] = 0;
        v15[2] = 0;
      }
      float v17 = v15 + 3;
      unint64_t v18 = v29[1];
      *unint64_t v15 = v29[0];
      uint64_t v19 = v30;
      *(void *)(v13 + 16) = v18;
      *(void *)(v13 + 24) = v19;
      v29[1] = 0;
      uint64_t v30 = 0;
      v29[0] = 0;
      long long v20 = (void *)v15[3];
      if (v20)
      {
        *(void *)(v13 + 40) = v20;
        operator delete(v20);
        void *v17 = 0;
        v15[4] = 0;
        v15[5] = 0;
      }
      uint64_t v21 = __p[1];
      void *v17 = __p[0];
      uint64_t v22 = v32;
      *(void *)(v13 + 40) = v21;
      *(void *)(v13 + 48) = v22;
      __p[1] = 0;
      uint64_t v32 = 0;
      __p[0] = 0;
      uint64_t v25 = (void *)v15[6];
      BOOL v24 = v15 + 6;
      char v23 = v25;
      if (v25)
      {
        *(void *)(v13 + 64) = v23;
        operator delete(v23);
        *BOOL v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        char v23 = __p[0];
      }
      uint64_t v26 = *((void *)&v33 + 1);
      *BOOL v24 = v33;
      uint64_t v27 = v34;
      *(void *)(v13 + 64) = v26;
      *(void *)(v13 + 72) = v27;
      uint64_t v34 = 0;
      long long v33 = 0uLL;
      if (v23)
      {
        __p[1] = v23;
        operator delete(v23);
      }
      if (v29[0])
      {
        v29[1] = v29[0];
        operator delete(v29[0]);
      }
      if (++v10 == 8) {
        return v8 + 80 == a2;
      }
    }
    uint64_t v7 = v8;
    v9 += 80;
    v8 += 80;
    if (v8 == a2) {
      return 1;
    }
  }
}

uint64_t ME_Model::Sample::operator<(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16) - v2;
  if (v3)
  {
    unint64_t v4 = 0;
    unint64_t v5 = v3 >> 2;
    uint64_t v6 = *(void *)(a2 + 8);
    unsigned int v7 = 1;
    while ((*(void *)(a2 + 16) - v6) >> 2 > v4)
    {
      int v8 = *(_DWORD *)(v2 + 4 * v4);
      int v9 = *(_DWORD *)(v6 + 4 * v4);
      if (v8 < v9) {
        return 1;
      }
      unint64_t v4 = v7++;
      if (v8 > v9 || v5 <= v4) {
        return 0;
      }
    }
  }
  return 0;
}

__n128 std::swap[abi:ne180100]<ME_Model::Sample>(std::vector<int> *this, uint64_t a2)
{
  int begin = (int)this->__begin_;
  long long v4 = *(_OWORD *)&this->__end_;
  std::vector<int>::pointer v5 = this[1].__begin_;
  this->__end_ = 0;
  p_std::__split_buffer<std::string>::pointer end = &this[1].__end_;
  long long v14 = v4;
  long long v15 = *(_OWORD *)&this[1].__end_;
  this[1].__end_ = 0;
  this->__end_cap_.__value_ = 0;
  this[1].__begin_ = 0;
  std::vector<int>::pointer v7 = this[2].__begin_;
  this[1].__end_cap_.__value_ = 0;
  this[2].__begin_ = 0;
  int v8 = &this[2].__end_;
  __n128 v16 = *(__n128 *)&this[2].__end_;
  std::vector<int>::pointer v9 = this[3].__begin_;
  this[2].__end_ = 0;
  this[2].__end_cap_.__value_ = 0;
  this[3].__begin_ = 0;
  LODWORD(this->__begin_) = *(_DWORD *)a2;
  std::vector<double>::__move_assign((uint64_t)&this->__end_, (__n128 *)(a2 + 8));
  std::vector<double>::__move_assign((uint64_t)p_end, (__n128 *)(a2 + 32));
  std::vector<double>::__move_assign((uint64_t)v8, (__n128 *)(a2 + 56));
  *(_DWORD *)a2 = begin;
  int v10 = *(void **)(a2 + 8);
  if (v10)
  {
    *(void *)(a2 + 16) = v10;
    operator delete(v10);
  }
  *(_OWORD *)(a2 + 8) = v14;
  *(void *)(a2 + 24) = v5;
  uint64_t v11 = *(void **)(a2 + 32);
  if (v11)
  {
    *(void *)(a2 + 40) = v11;
    operator delete(v11);
  }
  *(_OWORD *)(a2 + 32) = v15;
  *(void *)(a2 + 48) = v7;
  uint64_t v12 = *(void **)(a2 + 56);
  if (v12)
  {
    *(void *)(a2 + 64) = v12;
    operator delete(v12);
  }
  __n128 result = v16;
  *(__n128 *)(a2 + 56) = v16;
  *(void *)(a2 + 72) = v9;
  return result;
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a2, (uint64_t)a3);
  if (ME_Model::Sample::operator<(a4, (uint64_t)a3))
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a3, a4);
    if (ME_Model::Sample::operator<((uint64_t)a3, (uint64_t)a2))
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(a2, (uint64_t)a3);
      if (ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1))
      {
        *(void *)&double result = std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2).n128_u64[0];
      }
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, std::vector<int> *a4, uint64_t a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a2, a3, (uint64_t)a4);
  if (ME_Model::Sample::operator<(a5, (uint64_t)a4))
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a4, a5);
    if (ME_Model::Sample::operator<((uint64_t)a4, (uint64_t)a3))
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(a3, (uint64_t)a4);
      if (ME_Model::Sample::operator<((uint64_t)a3, (uint64_t)a2))
      {
        std::swap[abi:ne180100]<ME_Model::Sample>(a2, (uint64_t)a3);
        if (ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1))
        {
          *(void *)&double result = std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2).n128_u64[0];
        }
      }
    }
  }
  return result;
}

std::vector<int> *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,ME_Model::Sample *>(uint64_t a1, uint64_t a2, std::vector<int> *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) / 80;
    if (a2 - a1 >= 81)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = a1 + 80 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a4, v9, v12);
        v12 -= 80;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = v6;
    if ((std::vector<int> *)v6 != a3)
    {
      long long v14 = (std::vector<int> *)v6;
      do
      {
        if (ME_Model::Sample::operator<((uint64_t)v14, a1))
        {
          std::swap[abi:ne180100]<ME_Model::Sample>(v14, a1);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a4, v9, a1);
        }
        long long v14 = (std::vector<int> *)((char *)v14 + 80);
      }
      while (v14 != a3);
      uint64_t v13 = (uint64_t)a3;
    }
    if (v8 >= 81)
    {
      unint64_t v15 = v8 / 0x50uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Model::Sample *>(a1, v6, a4, v15);
        v6 -= 80;
      }
      while (v15-- > 2);
    }
    return (std::vector<int> *)v13;
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v28 = v4;
    uint64_t v29 = v5;
    uint64_t v7 = a4;
    int64_t v20 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((a4 - a1) >> 4)))
    {
      int64_t v10 = (0x999999999999999ALL * ((a4 - a1) >> 4)) | 1;
      uint64_t v11 = a1 + 80 * v10;
      int64_t v12 = 0x999999999999999ALL * ((a4 - a1) >> 4) + 2;
      if (v12 < a3 && ME_Model::Sample::operator<(a1 + 80 * v10, v11 + 80))
      {
        v11 += 80;
        int64_t v10 = v12;
      }
      if ((ME_Model::Sample::operator<(v11, v7) & 1) == 0)
      {
        int v21 = *(_DWORD *)v7;
        *(_OWORD *)uint64_t v22 = *(_OWORD *)(v7 + 8);
        uint64_t v23 = *(void *)(v7 + 24);
        *(void *)(v7 + 8) = 0;
        *(void *)(v7 + 16) = 0;
        *(_OWORD *)long long __p = *(_OWORD *)(v7 + 32);
        uint64_t v25 = *(void *)(v7 + 48);
        *(void *)(v7 + 24) = 0;
        *(void *)(v7 + 32) = 0;
        *(void *)(v7 + 40) = 0;
        *(void *)(v7 + 48) = 0;
        long long v26 = *(_OWORD *)(v7 + 56);
        uint64_t v27 = *(void *)(v7 + 72);
        *(void *)(v7 + 64) = 0;
        *(void *)(v7 + 72) = 0;
        *(void *)(v7 + 56) = 0;
        do
        {
          uint64_t v13 = v11;
          long long v14 = (void *)(v11 + 56);
          *(_DWORD *)uint64_t v7 = *(_DWORD *)v11;
          std::vector<double>::__move_assign(v7 + 8, (__n128 *)(v11 + 8));
          std::vector<double>::__move_assign(v7 + 32, (__n128 *)(v11 + 32));
          std::vector<double>::__move_assign(v7 + 56, (__n128 *)(v11 + 56));
          if (v20 < v10) {
            break;
          }
          uint64_t v15 = (2 * v10) | 1;
          uint64_t v11 = a1 + 80 * v15;
          uint64_t v16 = 2 * v10 + 2;
          if (v16 < a3 && ME_Model::Sample::operator<(a1 + 80 * v15, v11 + 80))
          {
            v11 += 80;
            uint64_t v15 = v16;
          }
          uint64_t v7 = v13;
          int64_t v10 = v15;
        }
        while (!ME_Model::Sample::operator<(v11, (uint64_t)&v21));
        *(_DWORD *)uint64_t v13 = v21;
        float v17 = *(void **)(v13 + 8);
        if (v17)
        {
          *(void *)(v13 + 16) = v17;
          operator delete(v17);
          *(void *)(v13 + 8) = 0;
          *(void *)(v13 + 16) = 0;
          *(void *)(v13 + 24) = 0;
        }
        *(_OWORD *)(v13 + 8) = *(_OWORD *)v22;
        *(void *)(v13 + 24) = v23;
        v22[0] = 0;
        v22[1] = 0;
        uint64_t v23 = 0;
        unint64_t v18 = *(void **)(v13 + 32);
        if (v18)
        {
          *(void *)(v13 + 40) = v18;
          operator delete(v18);
          *(void *)(v13 + 32) = 0;
          *(void *)(v13 + 40) = 0;
          *(void *)(v13 + 48) = 0;
        }
        *(_OWORD *)(v13 + 32) = *(_OWORD *)__p;
        *(void *)(v13 + 48) = v25;
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v25 = 0;
        uint64_t v19 = *(void **)(v13 + 56);
        if (v19)
        {
          *(void *)(v13 + 64) = v19;
          operator delete(v19);
          void *v14 = 0;
          v14[1] = 0;
          v14[2] = 0;
          uint64_t v19 = __p[0];
        }
        *(_OWORD *)(v13 + 56) = v26;
        *(void *)(v13 + 72) = v27;
        long long v26 = 0uLL;
        uint64_t v27 = 0;
        if (v19)
        {
          __p[1] = v19;
          operator delete(v19);
        }
        if (v22[0])
        {
          v22[1] = v22[0];
          operator delete(v22[0]);
        }
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    int v7 = *(_DWORD *)a1;
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v25 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    uint64_t v10 = *(void *)(a1 + 24);
    uint64_t v9 = *(void *)(a1 + 32);
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 32) = 0;
    uint64_t v28 = v9;
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 40);
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0;
    uint64_t v14 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((_DWORD *)a1, a3, a4);
    uint64_t v15 = (void *)v14;
    if (v14 == a2 - 80)
    {
      *(_DWORD *)uint64_t v14 = v7;
      int v21 = (void *)(v14 + 8);
      int64_t v20 = *(void **)(v14 + 8);
      if (v20)
      {
        v15[2] = v20;
        operator delete(v20);
        void *v21 = 0;
        v15[2] = 0;
        v15[3] = 0;
      }
      uint64_t v22 = (void *)v15[4];
      v15[1] = v25;
      v15[2] = v8;
      v15[3] = v10;
      if (v22)
      {
        v15[5] = v22;
        operator delete(v22);
        v15[4] = 0;
        v15[5] = 0;
        v15[6] = 0;
      }
      uint64_t v23 = (void *)v15[7];
      v15[4] = v28;
      v15[5] = v27;
      v15[6] = v26;
      if (v23)
      {
        v15[8] = v23;
        operator delete(v23);
        v15[7] = 0;
        v15[8] = 0;
        v15[9] = 0;
      }
      v15[7] = v11;
      v15[8] = v12;
      v15[9] = v13;
    }
    else
    {
      uint64_t v24 = v11;
      *(_DWORD *)uint64_t v14 = *(_DWORD *)(a2 - 80);
      uint64_t v16 = v14 + 80;
      std::vector<double>::__move_assign(v14 + 8, (__n128 *)(a2 - 72));
      std::vector<double>::__move_assign((uint64_t)(v15 + 4), (__n128 *)(a2 - 48));
      std::vector<double>::__move_assign((uint64_t)(v15 + 7), (__n128 *)(a2 - 24));
      *(_DWORD *)(a2 - 80) = v7;
      float v17 = *(void **)(a2 - 72);
      if (v17)
      {
        *(void *)(a2 - 64) = v17;
        operator delete(v17);
        *(void *)(a2 - 72) = 0;
        *(void *)(a2 - 64) = 0;
        *(void *)(a2 - 56) = 0;
      }
      *(void *)(a2 - 72) = v25;
      *(void *)(a2 - 64) = v8;
      *(void *)(a2 - 56) = v10;
      unint64_t v18 = *(void **)(a2 - 48);
      if (v18)
      {
        *(void *)(a2 - 40) = v18;
        operator delete(v18);
        *(void *)(a2 - 48) = 0;
        *(void *)(a2 - 40) = 0;
        *(void *)(a2 - 32) = 0;
      }
      *(void *)(a2 - 48) = v28;
      *(void *)(a2 - 40) = v27;
      *(void *)(a2 - 32) = v26;
      uint64_t v19 = *(void **)(a2 - 24);
      if (v19)
      {
        *(void *)(a2 - 16) = v19;
        operator delete(v19);
        *(void *)(a2 - 24) = 0;
        *(void *)(a2 - 16) = 0;
        *(void *)(a2 - 8) = 0;
      }
      *(void *)(a2 - 24) = v24;
      *(void *)(a2 - 16) = v12;
      *(void *)(a2 - 8) = v13;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, v16, a3, 0xCCCCCCCCCCCCCCCDLL * ((v16 - a1) >> 4));
    }
  }
}

void sub_1A642407C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  ME_Model::Sample::~Sample((ME_Model::Sample *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = (uint64_t)&a1[20 * v5 + 20];
    uint64_t v9 = (2 * v5) | 1;
    uint64_t v10 = 2 * v5 + 2;
    if (v10 < a3 && ME_Model::Sample::operator<((uint64_t)&a1[20 * v5 + 20], (uint64_t)&a1[20 * v5 + 40]))
    {
      v8 += 80;
      uint64_t v9 = v10;
    }
    *a1 = *(_DWORD *)v8;
    std::vector<double>::__move_assign((uint64_t)(a1 + 2), (__n128 *)(v8 + 8));
    std::vector<double>::__move_assign((uint64_t)(a1 + 8), (__n128 *)(v8 + 32));
    std::vector<double>::__move_assign((uint64_t)(a1 + 14), (__n128 *)(v8 + 56));
    a1 = (_DWORD *)v8;
    uint64_t v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v24 = v4;
    uint64_t v25 = v5;
    unint64_t v8 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v9 = a1 + 80 * v8;
    uint64_t v10 = (_DWORD *)(a2 - 80);
    if (ME_Model::Sample::operator<(v9, a2 - 80))
    {
      int v17 = *(_DWORD *)(a2 - 80);
      *(_OWORD *)unint64_t v18 = *(_OWORD *)(a2 - 72);
      uint64_t v19 = *(void *)(a2 - 56);
      *(void *)(a2 - 72) = 0;
      *(void *)(a2 - 64) = 0;
      *(_OWORD *)long long __p = *(_OWORD *)(a2 - 48);
      uint64_t v21 = *(void *)(a2 - 32);
      *(void *)(a2 - 56) = 0;
      *(void *)(a2 - 48) = 0;
      *(void *)(a2 - 40) = 0;
      *(void *)(a2 - 32) = 0;
      long long v22 = *(_OWORD *)(a2 - 24);
      uint64_t v23 = *(void *)(a2 - 8);
      *(void *)(a2 - 16) = 0;
      *(void *)(a2 - 8) = 0;
      *(void *)(a2 - 24) = 0;
      do
      {
        uint64_t v11 = v9;
        uint64_t v12 = (void *)(v9 + 56);
        *uint64_t v10 = *(_DWORD *)v9;
        uint64_t v13 = (void *)(v9 + 8);
        std::vector<double>::__move_assign((uint64_t)(v10 + 2), (__n128 *)(v9 + 8));
        std::vector<double>::__move_assign((uint64_t)(v10 + 8), (__n128 *)(v9 + 32));
        std::vector<double>::__move_assign((uint64_t)(v10 + 14), (__n128 *)(v9 + 56));
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = a1 + 80 * v8;
        uint64_t v10 = (_DWORD *)v11;
      }
      while ((ME_Model::Sample::operator<(v9, (uint64_t)&v17) & 1) != 0);
      *(_DWORD *)uint64_t v11 = v17;
      uint64_t v14 = *(void **)(v11 + 8);
      if (v14)
      {
        *(void *)(v11 + 16) = v14;
        operator delete(v14);
        *uint64_t v13 = 0;
        *(void *)(v11 + 16) = 0;
        *(void *)(v11 + 24) = 0;
      }
      *(_OWORD *)(v11 + 8) = *(_OWORD *)v18;
      *(void *)(v11 + 24) = v19;
      v18[1] = 0;
      uint64_t v19 = 0;
      v18[0] = 0;
      uint64_t v15 = *(void **)(v11 + 32);
      if (v15)
      {
        *(void *)(v11 + 40) = v15;
        operator delete(v15);
        *(void *)(v11 + 32) = 0;
        *(void *)(v11 + 40) = 0;
        *(void *)(v11 + 48) = 0;
      }
      *(_OWORD *)(v11 + 32) = *(_OWORD *)__p;
      *(void *)(v11 + 48) = v21;
      __p[1] = 0;
      uint64_t v21 = 0;
      __p[0] = 0;
      uint64_t v16 = *(void **)(v11 + 56);
      if (v16)
      {
        *(void *)(v11 + 64) = v16;
        operator delete(v16);
        *uint64_t v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
        uint64_t v16 = __p[0];
      }
      *(_OWORD *)(v11 + 56) = v22;
      *(void *)(v11 + 72) = v23;
      uint64_t v23 = 0;
      long long v22 = 0uLL;
      if (v16)
      {
        __p[1] = v16;
        operator delete(v16);
      }
      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
    }
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

std::string *std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(std::string *this, long long *a2, long long *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::string::size_type v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_1A642449C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::vector<std::vector<int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      std::string::size_type v6 = *(void **)(v4 - 24);
      v4 -= 24;
      long long v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  void *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  double result = std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_1A64246B4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<double>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_1A64247C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A6424A64(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  uint64_t v11 = operator new(0x18uLL);
  *uint64_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  int64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t v11 = *v20;
LABEL_38:
    void *v20 = v11;
    goto LABEL_39;
  }
  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    int64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_1A6424DE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        std::__destroy_at[abi:ne180100]<std::pair<std::pair<std::string,std::string>,double>,0>((uint64_t)(v3 + 2));
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::pair<std::string,std::string>,double>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t modelMethodTypeForImplClass(void *a1)
{
  if (([a1 isEqual:objc_opt_class()] & 1) != 0
    || ([a1 isEqual:objc_opt_class()] & 1) != 0)
  {
    return 4;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 2;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 1;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 9;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 0;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 6;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 7;
  }
  if ([a1 isEqual:objc_opt_class()]) {
    return 8;
  }
  return 4;
}

id stringArrayRepresentationFromData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (const char *)[v1 bytes];
  uint64_t v3 = [v1 length];
  if ((unint64_t)v3 < 9
    || strncmp(v2, "bplist00", 8uLL)
    || ([MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:0 error:0],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    if (v3 >= 1)
    {
      uint64_t v5 = &v2[v3];
      do
      {
        size_t v6 = strnlen(v2, v5 - v2);
        unint64_t v7 = (void *)[[NSString alloc] initWithBytes:v2 length:v6 encoding:4];
        if (v7) {
          [v4 addObject:v7];
        }
        v2 += v6 + 1;
      }
      while (v2 < v5);
    }
  }

  return v4;
}

id stringArrayRepresentationFromInverseMap(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = objc_msgSend(v1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) unsignedIntegerValue];
        if (v9 > v6) {
          unint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  unint64_t v10 = 0;
  do
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10];
    unint64_t v12 = [v1 objectForKey:v11];

    if (v12) {
      float v13 = v12;
    }
    else {
      float v13 = &stru_1EFB303D0;
    }
    [v2 addObject:v13];

    ++v10;
  }
  while (v10 <= v6);

  return v2;
}

id dataFromStringArrayRepresentation(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = (const char *)[*(id *)(*((void *)&v25 + 1) + 8 * i) UTF8String];
        if (v7) {
          v4 += strlen(v7) + 1;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v4];
  unint64_t v9 = (char *)[v8 mutableBytes];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v1;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(id *)(*((void *)&v21 + 1) + 8 * j);
        long long v16 = (const char *)objc_msgSend(v15, "UTF8String", (void)v21);
        if (v16)
        {
          long long v17 = v16;
          size_t v18 = strlen(v16);
          strncpy(v9, v17, v18);
          uint64_t v19 = &v9[v18];
          char *v19 = 0;
          unint64_t v9 = v19 + 1;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v12);
  }

  return v8;
}

void sub_1A642775C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A642790C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t isAcceptableTokenArray(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_16;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_16:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1A6427D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6427ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A642812C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MurmurHash3_x86_32(uint64_t result, int a2, int a3, unsigned int *a4)
{
  if (a2 >= 0) {
    int v4 = a2;
  }
  else {
    int v4 = a2 + 3;
  }
  uint64_t v5 = (unsigned __int8 *)(result + (int)(v4 & 0xFFFFFFFC));
  if ((a2 + 3) >= 7)
  {
    uint64_t v6 = -(v4 >> 2);
    do
    {
      HIDWORD(v7) = (461845907
                   * ((380141568 * *(_DWORD *)&v5[4 * v6]) | ((-862048943 * *(_DWORD *)&v5[4 * v6]) >> 17))) ^ a3;
      LODWORD(v7) = HIDWORD(v7);
      a3 = 5 * (v7 >> 19) - 430675100;
    }
    while (!__CFADD__(v6++, 1));
  }
  int v9 = 0;
  int v10 = a2 & 3;
  switch(v10)
  {
    case 1:
      goto LABEL_13;
    case 2:
LABEL_12:
      v9 |= v5[1] << 8;
LABEL_13:
      a3 ^= 461845907 * ((380141568 * (v9 ^ *v5)) | ((-862048943 * (v9 ^ *v5)) >> 17));
      break;
    case 3:
      int v9 = v5[2] << 16;
      goto LABEL_12;
  }
  unsigned int v11 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  *a4 = (-1028477387 * (v11 ^ (v11 >> 13))) ^ ((-1028477387 * (v11 ^ (v11 >> 13))) >> 16);
  return result;
}

uint64_t MurmurHash3_x86_128(char *a1, int a2, int a3, int *a4)
{
  if (a2 >= 0) {
    int v4 = a2;
  }
  else {
    int v4 = a2 + 15;
  }
  uint64_t v5 = (unsigned __int8 *)&a1[v4 & 0xFFFFFFF0];
  if ((a2 + 15) >= 0x1F)
  {
    int v9 = v4 >> 4;
    uint64_t v10 = v4 >> 4;
    int v8 = a3;
    int v7 = a3;
    int v6 = a3;
    int v11 = -4 * v9;
    do
    {
      int v12 = *(_DWORD *)&v5[4 * v11 + 4];
      int v13 = *(_DWORD *)&v5[4 * v11 + 8];
      int v14 = *(_DWORD *)&v5[4 * v11 + 12];
      HIDWORD(v15) = (-1425107063
                    * ((-888307712 * *(_DWORD *)&v5[4 * v11]) | ((597399067 * *(_DWORD *)&v5[4 * v11]) >> 17))) ^ a3;
      LODWORD(v15) = HIDWORD(v15);
      a3 = 5 * ((v15 >> 13) + v8) + 1444728091;
      HIDWORD(v15) = (951274213 * ((-1752629248 * v12) | ((-1425107063 * v12) >> 16))) ^ v8;
      LODWORD(v15) = HIDWORD(v15);
      int v8 = 5 * ((v15 >> 15) + v7) + 197830471;
      HIDWORD(v15) = (-1578923117 * ((-1781923840 * v13) | ((951274213 * v13) >> 15))) ^ v7;
      LODWORD(v15) = HIDWORD(v15);
      int v16 = 5 * ((v15 >> 17) + v6);
      HIDWORD(v15) = (597399067 * ((776732672 * v14) | ((-1578923117 * v14) >> 14))) ^ v6;
      LODWORD(v15) = HIDWORD(v15);
      int v7 = v16 - 1764942795;
      int v6 = 5 * ((v15 >> 19) + a3) + 850148119;
      v11 += 4;
      --v10;
    }
    while (v10);
  }
  else
  {
    int v6 = a3;
    int v7 = a3;
    int v8 = a3;
  }
  uint64_t result = 0;
  int v18 = 0;
  int v19 = 0;
  int v20 = 0;
  int v21 = 0;
  int v22 = 0;
  int v23 = 0;
  int v24 = 0;
  int v25 = 0;
  int v26 = 0;
  int v27 = 0;
  switch(a2 & 0xF)
  {
    case 1:
      goto LABEL_23;
    case 2:
      goto LABEL_22;
    case 3:
      goto LABEL_21;
    case 4:
      goto LABEL_20;
    case 5:
      goto LABEL_19;
    case 6:
      goto LABEL_18;
    case 7:
      goto LABEL_17;
    case 8:
      goto LABEL_16;
    case 9:
      goto LABEL_15;
    case 0xA:
      goto LABEL_14;
    case 0xB:
      goto LABEL_13;
    case 0xC:
      goto LABEL_12;
    case 0xD:
      goto LABEL_11;
    case 0xE:
      goto LABEL_10;
    case 0xF:
      LODWORD(result) = v5[14] << 16;
LABEL_10:
      int v18 = result | (v5[13] << 8);
LABEL_11:
      v6 ^= 597399067 * ((776732672 * (v18 ^ v5[12])) | ((-1578923117 * (v18 ^ v5[12])) >> 14));
LABEL_12:
      int v19 = v5[11] << 24;
LABEL_13:
      int v20 = v19 | (v5[10] << 16);
LABEL_14:
      int v21 = v20 ^ (v5[9] << 8);
LABEL_15:
      uint64_t result = 2513043456;
      v7 ^= -1578923117 * ((-1781923840 * (v21 ^ v5[8])) | ((951274213 * (v21 ^ v5[8])) >> 15));
LABEL_16:
      int v22 = v5[7] << 24;
LABEL_17:
      int v23 = v22 | (v5[6] << 16);
LABEL_18:
      int v24 = v23 ^ (v5[5] << 8);
LABEL_19:
      v8 ^= 951274213 * ((-1752629248 * (v24 ^ v5[4])) | ((-1425107063 * (v24 ^ v5[4])) >> 16));
LABEL_20:
      int v25 = v5[3] << 24;
LABEL_21:
      int v26 = v25 | (v5[2] << 16);
LABEL_22:
      int v27 = v26 ^ (v5[1] << 8);
LABEL_23:
      a3 ^= -1425107063 * ((-888307712 * (v27 ^ *v5)) | ((597399067 * (v27 ^ *v5)) >> 17));
      break;
    default:
      break;
  }
  unsigned int v28 = (v7 ^ a2) + (v6 ^ a2) + (v8 ^ a2) + (a3 ^ a2);
  unsigned int v29 = v28 + (v8 ^ a2);
  unsigned int v30 = v28 + (v7 ^ a2);
  unsigned int v31 = v28 + (v6 ^ a2);
  unsigned int v32 = -1028477387 * ((-2048144789 * (v28 ^ HIWORD(v28))) ^ ((-2048144789 * (v28 ^ HIWORD(v28))) >> 13));
  unsigned int v33 = -1028477387 * ((-2048144789 * (v29 ^ HIWORD(v29))) ^ ((-2048144789 * (v29 ^ HIWORD(v29))) >> 13));
  int v34 = v33 ^ HIWORD(v33);
  unsigned int v35 = -1028477387 * ((-2048144789 * (v30 ^ HIWORD(v30))) ^ ((-2048144789 * (v30 ^ HIWORD(v30))) >> 13));
  int v36 = v35 ^ HIWORD(v35);
  unsigned int v37 = -1028477387 * ((-2048144789 * (v31 ^ HIWORD(v31))) ^ ((-2048144789 * (v31 ^ HIWORD(v31))) >> 13));
  int v38 = v37 ^ HIWORD(v37);
  int v39 = v34 + (v32 ^ HIWORD(v32)) + v36 + v38;
  *a4 = v39;
  a4[1] = v39 + v34;
  a4[2] = v39 + v36;
  a4[3] = v39 + v38;
  return result;
}

uint64_t MurmurHash3_x64_128(uint64_t result, int a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4 = a3;
  if (a2 < 16)
  {
    uint64_t v7 = a3;
  }
  else
  {
    uint64_t v5 = (void *)(result + 8);
    uint64_t v6 = (a2 / 16);
    uint64_t v7 = v4;
    do
    {
      uint64_t v4 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v5 - 1)) | ((0x87C37B91114253D5 * *(v5 - 1)) >> 33))) ^ v4, 37)+ v7)+ 1390208809;
      uint64_t v7 = 5
         * (v4
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v5) | ((unint64_t)(0x4CF5AD432745937FLL * *v5) >> 31))) ^ v7, 33))+ 944331445;
      v5 += 2;
      --v6;
    }
    while (v6);
  }
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  int v21 = (unsigned __int8 *)(result + 16 * (a2 / 16));
  switch(a2 & 0xF)
  {
    case 1:
      goto LABEL_21;
    case 2:
      goto LABEL_20;
    case 3:
      goto LABEL_19;
    case 4:
      goto LABEL_18;
    case 5:
      goto LABEL_17;
    case 6:
      goto LABEL_16;
    case 7:
      goto LABEL_15;
    case 8:
      goto LABEL_14;
    case 9:
      goto LABEL_13;
    case 0xA:
      goto LABEL_12;
    case 0xB:
      goto LABEL_11;
    case 0xC:
      goto LABEL_10;
    case 0xD:
      goto LABEL_9;
    case 0xE:
      goto LABEL_8;
    case 0xF:
      unint64_t v8 = (unint64_t)v21[14] << 48;
LABEL_8:
      unint64_t v9 = v8 | ((unint64_t)v21[13] << 40);
LABEL_9:
      unint64_t v10 = v9 ^ ((unint64_t)v21[12] << 32);
LABEL_10:
      unint64_t v11 = v10 ^ ((unint64_t)v21[11] << 24);
LABEL_11:
      unint64_t v12 = v11 ^ ((unint64_t)v21[10] << 16);
LABEL_12:
      unint64_t v13 = v12 ^ ((unint64_t)v21[9] << 8);
LABEL_13:
      v7 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v13 ^ v21[8])) | ((0x4CF5AD432745937FLL * (v13 ^ v21[8])) >> 31));
LABEL_14:
      unint64_t v14 = (unint64_t)v21[7] << 56;
LABEL_15:
      unint64_t v15 = v14 | ((unint64_t)v21[6] << 48);
LABEL_16:
      unint64_t v16 = v15 ^ ((unint64_t)v21[5] << 40);
LABEL_17:
      unint64_t v17 = v16 ^ ((unint64_t)v21[4] << 32);
LABEL_18:
      unint64_t v18 = v17 ^ ((unint64_t)v21[3] << 24);
LABEL_19:
      unint64_t v19 = v18 ^ ((unint64_t)v21[2] << 16);
LABEL_20:
      unint64_t v20 = v19 ^ ((unint64_t)v21[1] << 8);
LABEL_21:
      v4 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v20 ^ *v21)) | ((0x87C37B91114253D5 * (v20 ^ *v21)) >> 33));
      break;
    default:
      break;
  }
  uint64_t v22 = v7 ^ a2;
  unint64_t v23 = (v4 ^ a2) + v22;
  unint64_t v24 = v23 + v22;
  unint64_t v25 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) >> 33));
  unint64_t v26 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) >> 33));
  unint64_t v27 = v26 ^ (v26 >> 33);
  unint64_t v28 = v27 + (v25 ^ (v25 >> 33));
  *a4 = v28;
  a4[1] = v28 + v27;
  return result;
}

uint64_t ME_Model::perform_SGD(ME_Model *this)
{
  if (*((double *)this + 5) > 0.0)
  {
    v65 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x1E4FBA240], "error: L2 regularization is currently not supported in SGD mode.");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v65);
    exit(1);
  }
  double v2 = *((double *)this + 4);
  uint64_t v3 = *((void *)this + 33) - *((void *)this + 32);
  std::vector<int>::vector(&v77, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 4));
  std::vector<int>::pointer begin = v77.__begin_;
  if (v77.__end_ != v77.__begin_)
  {
    uint64_t v5 = 0;
    unint64_t v6 = v77.__end_ - v77.__begin_;
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    do
    {
      begin[v5] = v5;
      ++v5;
    }
    while (v6 != v5);
  }
  unint64_t v7 = (int)(v3 >> 2);
  std::vector<double>::vector(v76, v7);
  double v8 = *((double *)this + 1);
  *(void *)__x = 0;
  std::vector<double>::vector(v75, v7, __x);
  __x[0] = 0;
  std::vector<int>::vector(&v74, v7, __x);
  unint64_t v9 = (double *)operator new(8uLL);
  double *v9 = 0.0;
  v73 = (char *)(v9 + 1);
  int v10 = *((_DWORD *)this + 1);
  long long __p = v9;
  v72 = v9 + 1;
  if (v10 < 1)
  {
LABEL_63:
    v72 = v9;
    operator delete(v9);
    goto LABEL_64;
  }
  int v11 = 0;
  int v12 = 0;
  double v13 = 0.0;
  do
  {
    std::random_device::random_device[abi:ne180100](&v70);
    unsigned int v14 = MEMORY[0x1AD0BB4F0](&v70);
    __x[0] = v14;
    for (uint64_t i = 1; i != 624; ++i)
    {
      unsigned int v14 = i + 1812433253 * (v14 ^ (v14 >> 30));
      __x[i] = v14;
    }
    uint64_t v69 = 0;
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u> &>((unint64_t)v77.__begin_, (uint64_t)v77.__end_, (uint64_t)__x);
    int v66 = v12;
    uint64_t v16 = *((void *)this + 6);
    if (*((void *)this + 7) != v16)
    {
      unint64_t v17 = 0;
      while (1)
      {
        int v18 = v77.__begin_[v17];
        std::vector<double>::vector(v67, *((int *)this + 70));
        ME_Model::conditional_probability((uint64_t)this, (void *)(v16 + 80 * v18), (double **)v67);
        double v19 = v8
            * pow(*((long double *)this + 2), (double)v11/ (double)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 4)));
        unint64_t v20 = v72;
        double v21 = *(v72 - 1) + v19 * v2;
        if (v72 >= (double *)v73)
        {
          unint64_t v23 = (double *)__p;
          uint64_t v24 = ((char *)v72 - (unsigned char *)__p) >> 3;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 61) {
            std::vector<double>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = v73 - (unsigned char *)__p;
          if ((v73 - (unsigned char *)__p) >> 2 > v25) {
            unint64_t v25 = v26 >> 2;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            unint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v73, v27);
            unint64_t v20 = v72;
            unint64_t v23 = (double *)__p;
          }
          else
          {
            unint64_t v28 = 0;
          }
          unsigned int v29 = (double *)&v28[8 * v24];
          *unsigned int v29 = v21;
          uint64_t v22 = v29 + 1;
          while (v20 != v23)
          {
            uint64_t v30 = *((void *)v20-- - 1);
            *((void *)v29-- - 1) = v30;
          }
          long long __p = v29;
          v72 = v22;
          v73 = &v28[8 * v27];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          double *v72 = v21;
          uint64_t v22 = v20 + 1;
        }
        double v13 = v13 + v19 * v2;
        v72 = v22;
        int v31 = *(_DWORD *)(v16 + 80 * v18);
        unsigned int v32 = (double *)v67[0];
        uint64_t v33 = v16 + 80 * v18;
        int v34 = *(int **)(v33 + 8);
        unsigned int v35 = *(int **)(v33 + 16);
        double v36 = -v19;
        if (v34 != v35) {
          break;
        }
LABEL_42:
        uint64_t v49 = v16 + 80 * v18;
        v50 = *(double **)(v49 + 32);
        v51 = *(int **)(v49 + 40);
        if (v50 != (double *)v51)
        {
          uint64_t v52 = *((void *)this + 42);
          v53 = (double *)v75[0];
          while (1)
          {
            v54 = (int **)(v52 + 24 * *(int *)v50);
            v55 = *v54;
            v56 = v54[1];
            if (v55 != v56) {
              break;
            }
LABEL_55:
            v50 += 2;
            if (v50 == (double *)v51) {
              goto LABEL_56;
            }
          }
          uint64_t v57 = *((void *)this + 32);
          uint64_t v58 = *((void *)this + 24);
          while (2)
          {
            uint64_t v59 = *v55;
            uint64_t v60 = *(unsigned __int8 *)(v57 + 4 * v59);
            if (v60 == v31) {
              double v61 = 1.0;
            }
            else {
              double v61 = 0.0;
            }
            double v62 = *(double *)(v58 + 8 * v59) + v36 * (v50[1] * (v32[v60] - v61));
            *(double *)(v58 + 8 * v59) = v62;
            if (v62 > 0.0)
            {
              double v63 = fmax(v62 - (v13 + v53[v59]), 0.0);
              goto LABEL_53;
            }
            double v63 = v62;
            if (v62 < 0.0)
            {
              double v63 = fmin(v62 + v13 - v53[v59], 0.0);
LABEL_53:
              *(double *)(v58 + 8 * v59) = v63;
            }
            v53[v59] = v53[v59] + v63 - v62;
            if (++v55 == v56) {
              goto LABEL_55;
            }
            continue;
          }
        }
LABEL_56:
        if (v32)
        {
          v67[1] = v32;
          operator delete(v32);
        }
        ++v17;
        ++v11;
        uint64_t v16 = *((void *)this + 6);
        if (v17 >= 0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 7) - v16) >> 4)) {
          goto LABEL_59;
        }
      }
      uint64_t v37 = *((void *)this + 42);
      int v38 = (double *)v75[0];
      while (1)
      {
        int v39 = (int **)(v37 + 24 * *v34);
        uint64_t v40 = *v39;
        long long v41 = v39[1];
        if (v40 != v41) {
          break;
        }
LABEL_41:
        if (++v34 == v35) {
          goto LABEL_42;
        }
      }
      uint64_t v42 = *((void *)this + 32);
      uint64_t v43 = *((void *)this + 24);
      while (1)
      {
        uint64_t v44 = *v40;
        uint64_t v45 = *(unsigned __int8 *)(v42 + 4 * v44);
        double v46 = v45 == v31 ? 1.0 : 0.0;
        double v47 = *(double *)(v43 + 8 * v44) + v36 * (v32[v45] - v46);
        *(double *)(v43 + 8 * v44) = v47;
        if (v47 > 0.0) {
          break;
        }
        double v48 = v47;
        if (v47 < 0.0)
        {
          double v48 = fmin(v47 + v13 - v38[v44], 0.0);
          goto LABEL_39;
        }
LABEL_40:
        v38[v44] = v38[v44] + v48 - v47;
        if (++v40 == v41) {
          goto LABEL_41;
        }
      }
      double v48 = fmax(v47 - (v13 + v38[v44]), 0.0);
LABEL_39:
      *(double *)(v43 + 8 * v44) = v48;
      goto LABEL_40;
    }
LABEL_59:
    if (*((int *)this + 100) > 0) {
      ME_Model::heldout_likelihood(this);
    }
    std::random_device::~random_device(&v70);
    int v12 = v66 + 1;
  }
  while (v66 + 1 < *((_DWORD *)this + 1));
  unint64_t v9 = (double *)__p;
  if (__p) {
    goto LABEL_63;
  }
LABEL_64:
  if (v74.__begin_)
  {
    v74.__end_ = v74.__begin_;
    operator delete(v74.__begin_);
  }
  if (v75[0])
  {
    v75[1] = v75[0];
    operator delete(v75[0]);
  }
  if (v76[0])
  {
    v76[1] = v76[0];
    operator delete(v76[0]);
  }
  if (v77.__begin_)
  {
    v77.__end_ = v77.__begin_;
    operator delete(v77.__begin_);
  }
  return 0;
}

void sub_1A642B4DC(_Unwind_Exception *a1)
{
  uint64_t v3 = *(void **)(v1 - 248);
  if (v3)
  {
    *(void *)(v1 - 240) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)(v1 - 224);
  if (v4)
  {
    *(void *)(v1 - 216) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(v1 - 200);
  if (v5)
  {
    *(void *)(v1 - 192) = v5;
    operator delete(v5);
  }
  unint64_t v6 = *(void **)(v1 - 176);
  if (v6)
  {
    *(void *)(v1 - 168) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(a1);
}

void *std::operator<<[abi:ne180100]<std::char_traits<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);

  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

void *std::endl[abi:ne180100]<char,std::char_traits<char>>(void *a1)
{
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
  double v2 = std::locale::use_facet(&v4, MEMORY[0x1E4FBA258]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_1A642B67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

std::random_device *std::random_device::random_device[abi:ne180100](std::random_device *a1)
{
  std::string::basic_string[abi:ne180100]<0>(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_1A642B6E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_1A642B760(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    unint64_t v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_1A642B7E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1AD0BB4B0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&v14, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1AD0BB4C0](v13);
  return a1;
}

void sub_1A642B93C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x1AD0BB4C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1A642B91CLL);
}

void sub_1A642B990(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      double v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_1A642BB10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u> &>(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((uint64_t)(a2 - a1) >= 5)
  {
    std::locale v4 = (int *)a1;
    long long v12 = xmmword_1A646D4F0;
    unint64_t v5 = a2 - 4;
    if (a2 - 4 > a1)
    {
      uint64_t v7 = ((a2 - a1) >> 2) - 1;
      do
      {
        v11[0] = 0;
        v11[1] = v7;
        uint64_t v8 = std::uniform_int_distribution<long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v12, a3, v11);
        if (v8)
        {
          int v9 = *v4;
          int *v4 = v4[v8];
          v4[v8] = v9;
        }
        ++v4;
        --v7;
      }
      while ((unint64_t)v4 < v5);
    }
  }
  return a2;
}

uint64_t std::uniform_int_distribution<long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = a3[1];
  uint64_t v4 = result - *a3;
  if (result != *a3)
  {
    unint64_t v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, 0x40uLL);
      return std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
    }
    else
    {
      unint64_t v7 = __clz(v5);
      uint64_t v8 = 63;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        uint64_t v8 = 64;
      }
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, v8 - v7);
      do
        unint64_t v9 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine(uint64_t result, uint64_t a2, unint64_t a3)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0) {
    unint64_t v3 = (a3 >> 5) + 1;
  }
  else {
    unint64_t v3 = a3 >> 5;
  }
  unint64_t v4 = a3 / v3;
  *(void *)(result + 16) = a3 / v3;
  *(void *)(result + 24) = v3;
  unint64_t v5 = (-1 << (a3 / v3)) & 0x100000000;
  if (a3 / v3 >= 0x40) {
    unint64_t v5 = 0;
  }
  *(void *)(result + 40) = v5;
  if ((v5 ^ 0x100000000) > v5 / v3)
  {
    ++v3;
    unint64_t v4 = a3 / v3;
    *(void *)(result + 16) = a3 / v3;
    *(void *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      unint64_t v6 = 0;
      *(void *)(result + 32) = v3 + v4 * v3 - a3;
      *(void *)(result + 40) = 0;
      goto LABEL_13;
    }
    *(void *)(result + 40) = (-1 << v4) & 0x100000000;
  }
  *(void *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = 0x80000000uLL >> v4 << (v4 + 1);
  }
LABEL_13:
  *(void *)(result + 48) = v6;
  unsigned int v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4) {
    unsigned int v7 = 0;
  }
  if (v4 >= 0x1F) {
    unsigned int v8 = -1;
  }
  else {
    unsigned int v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  }
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      do
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v4 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
      while (*(void *)(a1 + 40) <= (unint64_t)v4);
      unint64_t v5 = *(void *)(a1 + 16);
      if (v5 >= 0x40) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v2 << v5;
      }
      uint64_t v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      unint64_t v7 = *(void *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    uint64_t v2 = 0;
    unint64_t v7 = 0;
  }
  for (; v7 < *(void *)(a1 + 24); ++v7)
  {
    do
      std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
    while (*(void *)(a1 + 48) <= (unint64_t)v8);
    unint64_t v9 = *(void *)(a1 + 16);
    if (v9 >= 0x3F) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v2 << (v9 + 1);
    }
    uint64_t v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

void sub_1A642CF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A642D16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A642D96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)NLE5Embedding;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A642DF20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2)
  {

    if (a2 == 3)
    {
      char v18 = __cxa_begin_catch(exception_object);
      double v19 = (void *)MEMORY[0x1AD0BB930]();
      unint64_t v20 = NLGetLogCategory(0);
      double v21 = [v20 internal];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = NLGetLogIdentifier(0);
        unint64_t v23 = NSString;
        (*(void (**)(void *))(*(void *)v18 + 16))(v18);
        uint64_t v24 = [v23 stringWithFormat:@"Unexpected Espresso E5 error during embedding load: %s"];
        LODWORD(buf) = 138543618;
        *(void *)((char *)&buf + 4) = v22;
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v24;
        _os_log_impl(&dword_1A6419000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
      }
    }
    else
    {
      unint64_t v25 = __cxa_begin_catch(exception_object);
      double v19 = (void *)MEMORY[0x1AD0BB930]();
      if (a2 == 2)
      {
        uint64_t v26 = NLGetLogCategory(0);
        double v21 = [v26 internal];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v27 = NLGetLogIdentifier(0);
          unint64_t v28 = NSString;
          (*(void (**)(void *))(*(void *)v25 + 16))(v25);
          unsigned int v29 = [v28 stringWithFormat:@"Failed to load embedding from MIL representation: %s"];
          LODWORD(buf) = 138543618;
          *(void *)((char *)&buf + 4) = v27;
          WORD6(buf) = 2114;
          *(void *)((char *)&buf + 14) = v29;
          _os_log_impl(&dword_1A6419000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
        }
      }
      else
      {
        uint64_t v30 = NLGetLogCategory(0);
        double v21 = [v30 internal];

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = NLGetLogIdentifier(0);
          unsigned int v32 = [NSString stringWithFormat:@"Failed to load embedding from MIL representation"];
          LODWORD(buf) = 138543618;
          *(void *)((char *)&buf + 4) = v31;
          WORD6(buf) = 2114;
          *(void *)((char *)&buf + 14) = v32;
          _os_log_impl(&dword_1A6419000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
        }
      }
    }

    __cxa_end_catch();
    JUMPOUT(0x1A642DD38);
  }
  _Unwind_Resume(exception_object);
}

void compileModel(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  MEMORY[0x1AD0BB2B0](v9);
  std::string::basic_string[abi:ne180100]<0>(&__p, "/private/var/db/com.apple.naturallanguaged");
  E5RT::E5CompilerConfigOptions::SetBundleCacheLocation();
  if (v8 < 0) {
    operator delete(__p);
  }
  E5RT::E5Compiler::MakeCompiler();
  createE5CompilerOptions(a2, v4);
  E5RT::E5Compiler::Compile();
  if (v6) {
    (*(void (**)())(*(void *)v6 + 8))();
  }
  unint64_t v5 = __p;
  long long __p = 0;
  if (v5) {
    (*(void (**)(void *))(*(void *)v5 + 8))(v5);
  }
  MEMORY[0x1AD0BB2C0](v9);
}

void sub_1A642E5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a9) {
    compileModel();
  }
  if (__p) {
    (*(void (**)(void *))(*(void *)__p + 8))(__p);
  }
  MEMORY[0x1AD0BB2C0](&a16);

  _Unwind_Resume(a1);
}

void sub_1A642E648()
{
}

void sub_1A642E8E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, __CFString *a20,long long buf)
{
  if (a2)
  {

    if (a11) {
      (*(void (**)(uint64_t))(*(void *)a11 + 8))(a11);
    }
    if (a12) {
      (*(void (**)(uint64_t))(*(void *)a12 + 8))(a12);
    }
    MEMORY[0x1AD0BB2C0](&a13);
    if (a2 == 3)
    {
      uint64_t v26 = __cxa_begin_catch(exception_object);
      unint64_t v27 = (void *)MEMORY[0x1AD0BB930]();
      unint64_t v28 = NLGetLogCategory(0);
      unsigned int v29 = [v28 internal];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = NLGetLogIdentifier(0);
        int v31 = NSString;
        (*(void (**)(void *))(*(void *)v26 + 16))(v26);
        unsigned int v32 = [v31 stringWithFormat:@"%s"];
        LODWORD(buf) = 138543618;
        *(void *)((char *)&buf + 4) = v30;
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v32;
        _os_log_impl(&dword_1A6419000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
      }
      if (v21)
      {
        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        a15 = *MEMORY[0x1E4F28568];
        int v34 = NSString;
        (*(void (**)(void *))(*(void *)v26 + 16))(v26);
        unsigned int v35 = [v34 stringWithFormat:@"Compilation failed: %s"];
        a16 = (uint64_t)v35;
        double v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a16 forKeys:&a15 count:1];
        void *v21 = [v33 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v36];
      }
    }
    else
    {
      uint64_t v37 = __cxa_begin_catch(exception_object);
      if (a2 == 2)
      {
        int v38 = v37;
        int v39 = (void *)MEMORY[0x1AD0BB930]();
        uint64_t v40 = NLGetLogCategory(0);
        long long v41 = [v40 internal];

        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v42 = NLGetLogIdentifier(0);
          uint64_t v43 = NSString;
          (*(void (**)(void *))(*(void *)v38 + 16))(v38);
          uint64_t v44 = [v43 stringWithFormat:@"%s"];
          LODWORD(buf) = 138543618;
          *(void *)((char *)&buf + 4) = v42;
          WORD6(buf) = 2114;
          *(void *)((char *)&buf + 14) = v44;
          _os_log_impl(&dword_1A6419000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
        }
        if (v21)
        {
          uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
          a17 = *MEMORY[0x1E4F28568];
          double v46 = NSString;
          (*(void (**)(void *))(*(void *)v38 + 16))(v38);
          double v47 = [v46 stringWithFormat:@"Compilation failed: %s"];
          a18 = (uint64_t)v47;
          double v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a18 forKeys:&a17 count:1];
          void *v21 = [v45 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v48];
        }
      }
      else if (v21)
      {
        uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
        a19 = *MEMORY[0x1E4F28568];
        a20 = @"Compilation failed";
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&a20 forKeys:&a19 count:1];
        void *v21 = [v49 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v50];
      }
    }
    __cxa_end_catch();
    JUMPOUT(0x1A642E89CLL);
  }
  _Unwind_Resume(exception_object);
}

void createE5CompilerOptions(int a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = a2;
  E5RT::E5CompilerOptions::Create(v24);
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = (char *)operator new(8uLL);
  unsigned int v32 = v3;
  *(void *)std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = 1;
  uint64_t v33 = v3 + 8;
  int v34 = v3 + 8;
  if (a1)
  {
    unint64_t v5 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v34, 2uLL);
    uint64_t v6 = (char *)v32;
    unint64_t v7 = v33;
    v5[1] = 4;
    char v8 = (char *)(v5 + 1);
    uint64_t v9 = (char *)(v5 + 2);
    while (v7 != v6)
    {
      uint64_t v10 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v8 - 1) = v10;
      v8 -= 8;
    }
    unsigned int v32 = v8;
    uint64_t v33 = (char *)(v5 + 2);
    int v34 = &v5[v4];
    if (v6) {
      operator delete(v6);
    }
    uint64_t v33 = v9;
  }
  if ([(E5RT::E5CompilerOptions *)v24 count])
  {
    std::string::basic_string[abi:ne180100]<0>(&__v, "main");
    memset(&v31, 0, sizeof(v31));
    __p[0] = &v31;
    LOBYTE(__p[1]) = 0;
    v31.__begin_ = (std::vector<std::string>::pointer)operator new(0x18uLL);
    v31.__end_ = v31.__begin_;
    v31.__end_cap_.__value_ = v31.__begin_ + 1;
    v31.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v31.__end_cap_, (long long *)&__v, (long long *)&__v.__end_cap_, v31.__begin_);
    if (SHIBYTE(__v.__end_) < 0) {
      operator delete(__v.__first_);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = v24;
    uint64_t v12 = [(E5RT::E5CompilerOptions *)v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v27 + 1) + 8 * i) UTF8String]);
          std::vector<std::string>::pointer end = v31.__end_;
          if (v31.__end_ >= v31.__end_cap_.__value_)
          {
            unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_ - (char *)v31.__begin_) >> 3);
            unint64_t v18 = v17 + 1;
            if (v17 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            if (0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) > v18) {
              unint64_t v18 = 0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) >= 0x555555555555555) {
              unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v19 = v18;
            }
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v31.__end_cap_;
            if (v19) {
              unint64_t v20 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v31.__end_cap_, v19);
            }
            else {
              unint64_t v20 = 0;
            }
            double v21 = v20 + v17;
            __v.__first_ = v20;
            __v.__begin_ = v21;
            __v.__end_cap_.__value_ = &v20[v19];
            long long v22 = *(_OWORD *)__p;
            v21->__r_.__value_.__r.__words[2] = v26;
            *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
            __p[1] = 0;
            std::string::size_type v26 = 0;
            __p[0] = 0;
            __v.__end_ = v21 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v31, &__v);
            unint64_t v23 = v31.__end_;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            v31.__end_ = v23;
            if (SHIBYTE(v26) < 0) {
              operator delete(__p[0]);
            }
          }
          else
          {
            long long v16 = *(_OWORD *)__p;
            v31.__end_->__r_.__value_.__r.__words[2] = v26;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v16;
            v31.__end_ = end + 1;
          }
        }
        uint64_t v12 = [(E5RT::E5CompilerOptions *)v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v12);
    }

    E5RT::E5CompilerOptions::SetMilEntryPoints();
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed();
  std::string::basic_string[abi:ne180100]<0>(&__v, "bnns");
  E5RT::E5CompilerOptions::SetPreferredCpuBackend();
  if (SHIBYTE(__v.__end_) < 0) {
    operator delete(__v.__first_);
  }
  if (v32)
  {
    uint64_t v33 = (char *)v32;
    operator delete(v32);
  }
}

void sub_1A642F2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v32 = *a10;
  *a10 = 0;
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
  }

  _Unwind_Resume(a1);
}

void sub_1A642F594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, int a14, __int16 a15, uint64_t a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void sub_1A6430618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  if (a13) {
    (*(void (**)(uint64_t))(*(void *)a13 + 8))(a13);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<E5RT::ExecutionStreamOperation>::operator=[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>(void *a1, uint64_t *a2)
{
  std::shared_ptr<E5RT::ExecutionStreamOperation>::shared_ptr[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>((uint64_t *)&v6, a2);
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = (std::__shared_weak_count *)a1[1];
  long long v4 = v6;
  *(void *)&long long v6 = *a1;
  *((void *)&v6 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void sub_1A6430A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A6430AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6430D38(_Unwind_Exception *a1)
{
  long long v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A6430E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A64311B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A643192C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31)
{
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_1A6432068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a10);

  _Unwind_Resume(a1);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void sub_1A643232C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A64324D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  long long v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    long long v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        long long v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      long long v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_1A6432710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0BB430](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  return this;
}

void sub_1A64327AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

int *std::vector<int>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(std::vector<int> *a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  unint64_t v5 = (int *)__dst;
  if (a5 < 1) {
    return v5;
  }
  long long v7 = (int *)__src;
  int value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<int> *)&a1->__end_cap_;
  char v10 = value;
  unint64_t v12 = *((void *)p_end_cap - 1);
  if (a5 > (uint64_t)((uint64_t)value - v12) >> 2)
  {
    std::vector<int>::pointer begin = a1->__begin_;
    unint64_t v14 = a5 + ((uint64_t)(v12 - (unint64_t)a1->__begin_) >> 2);
    if (v14 >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)begin) >> 2;
    uint64_t v16 = (char *)v10 - (char *)begin;
    if (v16 >> 1 > v14) {
      unint64_t v14 = v16 >> 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v17) {
      unint64_t v18 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    long long v28 = &v18[v15];
    __v.__first_ = v18;
    __v.__begin_ = v28;
    __v.__end_cap_.__value_ = &v18[v17];
    uint64_t v29 = 4 * a5;
    long long v30 = &v28[a5];
    do
    {
      int v31 = *v7++;
      *v28++ = v31;
      v29 -= 4;
    }
    while (v29);
    __v.__end_ = v30;
    unint64_t v5 = std::vector<int>::__swap_out_circular_buffer(a1, &__v, v5);
    if (__v.__end_ != __v.__begin_) {
      __v.__end_ = (std::__split_buffer<int>::pointer)((char *)__v.__end_
    }
                                                     + (((char *)__v.__begin_ - (char *)__v.__end_ + 3) & 0xFFFFFFFFFFFFFFFCLL));
    if (__v.__first_) {
      operator delete(__v.__first_);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 2;
  if (v20 >= a5)
  {
    double v21 = &__src[4 * a5];
    unint64_t v23 = (int *)*((void *)p_end_cap - 1);
LABEL_17:
    uint64_t v24 = &v5[a5];
    unint64_t v25 = &v23[-a5];
    std::string::size_type v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      std::string::size_type v26 = v23;
      do
      {
        int v27 = *v25++;
        *v26++ = v27;
      }
      while ((unint64_t)v25 < v12);
    }
    a1->__end_ = v26;
    if (v23 != v24) {
      memmove(&v23[-(v23 - v24)], v5, (char *)v23 - (char *)v24);
    }
    if (v21 != (char *)v7) {
      memmove(v5, v7, v21 - (char *)v7);
    }
    return v5;
  }
  double v21 = &__src[4 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*((void **)p_end_cap - 1), &__src[4 * v20], a4 - v21);
  }
  unint64_t v23 = (int *)(v12 + v22);
  a1->__end_ = (std::vector<int>::pointer)(v12 + v22);
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_1A64329B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::vector<int>::pointer std::vector<int>::__swap_out_circular_buffer(std::vector<int> *this, std::__split_buffer<int> *__v, std::vector<int>::pointer __p)
{
  std::vector<int>::pointer begin = __v->__begin_;
  std::vector<int>::pointer v6 = this->__begin_;
  long long v7 = begin;
  if (this->__begin_ != __p)
  {
    std::vector<int>::pointer v8 = __p;
    long long v7 = __v->__begin_;
    do
    {
      int v9 = *--v8;
      *--long long v7 = v9;
    }
    while (v8 != v6);
  }
  __v->__begin_ = v7;
  std::vector<std::string>::pointer end = this->__end_;
  std::__split_buffer<int>::pointer v11 = __v->__end_;
  int64_t v12 = (char *)end - (char *)__p;
  if (end != __p)
  {
    memmove(__v->__end_, __p, (char *)end - (char *)__p);
    long long v7 = __v->__begin_;
  }
  __v->__end_ = (std::__split_buffer<int>::pointer)((char *)v11 + v12);
  uint64_t v13 = this->__begin_;
  this->__begin_ = v7;
  __v->__begin_ = v13;
  unint64_t v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  int value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  int value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  unint64_t v5 = value;
  std::vector<std::string>::pointer end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      std::vector<std::string>::pointer end = this->__end_;
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = &v14[4 * v11];
    uint64_t v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    unint64_t v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t std::unordered_map<std::string,std::shared_ptr<E5RT::ProgramFunction>>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(a1, i + 16, (long long *)i + 1);
  return a1;
}

void sub_1A6432C30(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(uint64_t a1, unsigned __int8 *a2, long long *a3)
{
  long long v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__construct_node_hash<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  int64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    void *v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_1A6432EB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__construct_node_hash<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x38uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  uint64_t result = std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(unsigned char *)(a4 + 16) = 1;
  return result;
}

void sub_1A6432F2C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      int64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

std::string *std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  std::string::size_type v5 = *((void *)a2 + 4);
  this[1].__r_.__value_.__r.__words[0] = *((void *)a2 + 3);
  this[1].__r_.__value_.__l.__size_ = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5C53458, MEMORY[0x1E4FBA1D0]);
}

void sub_1A6433744(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

uint64_t *std::shared_ptr<E5RT::ExecutionStreamOperation>::shared_ptr[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *unint64_t result = *a2;
  if (v2) {
    operator new();
  }
  result[1] = 0;
  *a2 = 0;
  return result;
}

void std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0BB590);
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>(uint64_t a1, unsigned __int8 *a2, long long *a3, uint64_t *a4)
{
  unint64_t v9 = (void *)(a1 + 24);
  unint64_t v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::string const&,std::unique_ptr<E5RT::BufferObject>>(a1, v11, a3, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    *unint64_t v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_1A6433C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::string const&,std::unique_ptr<E5RT::BufferObject>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  unint64_t v10 = (char *)operator new(0x38uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)unint64_t v10 = 0;
  *((void *)v10 + 1) = a2;
  uint64_t result = std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>::pair[abi:ne180100]<std::string const&,std::unique_ptr<E5RT::BufferObject>,0>((std::string *)(v10 + 16), a3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_1A6433D0C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>::pair[abi:ne180100]<std::string const&,std::unique_ptr<E5RT::BufferObject>,0>(std::string *this, long long *a2, uint64_t *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::shared_ptr<E5RT::BufferObject>::shared_ptr[abi:ne180100]<E5RT::BufferObject,std::default_delete<E5RT::BufferObject>,void>((uint64_t *)&this[1], a3);
  return this;
}

void sub_1A6433D84(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::shared_ptr<E5RT::BufferObject>::shared_ptr[abi:ne180100]<E5RT::BufferObject,std::default_delete<E5RT::BufferObject>,void>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *uint64_t result = *a2;
  if (v2) {
    operator new();
  }
  result[1] = 0;
  *a2 = 0;
  return result;
}

void std::__shared_ptr_pointer<E5RT::BufferObject  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1AD0BB590);
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  size_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *size_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_1A6434154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = operator new(0x38uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *unint64_t v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_1A64341F4(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    unint64_t v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  float v17 = operator new(0x38uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  void *v17 = 0;
  v17[1] = v10;
  float v18 = *a4;
  long long v19 = **a4;
  v17[4] = *((void *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)float v18 = 0;
  v17[5] = 0;
  v17[6] = 0;
  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    BOOL v22 = 1;
    if (v11 >= 3) {
      BOOL v22 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v11);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v25);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v26 = *(void **)(*(void *)a1 + 8 * v4);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    *uint64_t v26 = v29[0];
  }
  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11) {
          v27 %= v11;
        }
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v29, 0);
  return i;
}

void sub_1A6434498(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_to<std::vector<int>,0>(const void *a1@<X0>, std::vector<int> *a2@<X8>)
{
  if (!a1 || (CFTypeID TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  applesauce::CF::details::CFArray_get_value_to<std::vector<int>>((const __CFArray *)a1, a2);
}

void sub_1A6434524()
{
  __cxa_throw(v0, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
}

void sub_1A6434544(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
}

void applesauce::CF::details::CFArray_get_value_to<std::vector<int>>(const __CFArray *a1@<X0>, std::vector<int> *a2@<X8>)
{
  int Count = CFArrayGetCount(a1);
  a2->__end_ = 0;
  a2->__end_cap_.__value_ = 0;
  a2->__begin_ = 0;
  std::vector<int>::reserve(a2, Count);
  if (Count >= 1)
  {
    CFIndex v5 = 0;
    uint64_t v6 = Count;
    do
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, v5);
      int v8 = applesauce::CF::convert_to<int,0>(ValueAtIndex);
      int v9 = v8;
      std::vector<int>::pointer end = a2->__end_;
      int value = a2->__end_cap_.__value_;
      if (end >= value)
      {
        std::vector<int>::pointer begin = a2->__begin_;
        uint64_t v14 = end - a2->__begin_;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v16 = (char *)value - (char *)begin;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          float v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&a2->__end_cap_, v17);
          std::vector<int>::pointer begin = a2->__begin_;
          std::vector<int>::pointer end = a2->__end_;
        }
        else
        {
          float v18 = 0;
        }
        long long v19 = (int *)&v18[4 * v14];
        int *v19 = v9;
        uint8x8_t v12 = v19 + 1;
        while (end != begin)
        {
          int v20 = *--end;
          *--long long v19 = v20;
        }
        a2->__begin_ = v19;
        a2->__end_ = v12;
        a2->__end_cap_.__value_ = (int *)&v18[4 * v17];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *std::vector<int>::pointer end = v8;
        uint8x8_t v12 = end + 1;
      }
      a2->__end_ = v12;
      ++v5;
    }
    while (v5 != v6);
  }
}

void sub_1A64346AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  int value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, __n);
    uint64_t v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int v9 = (int *)&v6[4 * v8];
    std::vector<int>::pointer begin = this->__begin_;
    std::vector<int>::pointer end = this->__end_;
    uint8x8_t v12 = v7;
    if (end != this->__begin_)
    {
      uint8x8_t v12 = v7;
      do
      {
        int v13 = *--end;
        *--uint8x8_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t applesauce::CF::convert_to<int,0>(const __CFNumber *a1)
{
  uint64_t result = applesauce::CF::convert_as<int,0>(a1);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return result;
}

void sub_1A64347B4()
{
  __cxa_throw(v0, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
}

void sub_1A64347D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::CF::convert_as<int,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<int>(a1);
    }
  }

  return applesauce::CF::details::treat_as_BOOL_for_convert_as<int>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<int>(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t Value = CFBooleanGetValue(a1);
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t Value = 0;
    uint64_t v4 = 0;
  }
  return v4 | Value;
}

uint64_t applesauce::CF::details::number_convert_as<int>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      uint64_t v16 = Value != 0;
      if (Value) {
        unsigned __int8 v17 = LOBYTE(valuePtr);
      }
      else {
        unsigned __int8 v17 = 0;
      }
      int v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0) {
        int v18 = 0;
      }
      uint64_t v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      int v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr)) {
        uint64_t v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_24:
      int v19 = CFNumberGetValue(v11, v12, &valuePtr);
      uint64_t v20 = (int)*(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_28:
      int v19 = CFNumberGetValue(v9, v10, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_30:
      int v19 = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = (int)valuePtr;
LABEL_31:
      uint64_t v6 = v20 | 0x100000000;
      if (!v19) {
        uint64_t v6 = 0;
      }
LABEL_33:
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

void predictedMRLModelLabelForString(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  MRLModelGetOutputSize();
  operator new[]();
}

void sub_1A6434CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void fillOutputProbabilities(const void *a1, BOOL a2, NSDictionary *a3, NSString *a4, float *a5)
{
  a3;
  id v7 = a4;
  MRLModelGetOutputSize();
  inputSequenceFromSentence(v7, 0);
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "count", a1);
  operator new[]();
}

void sub_1A6434F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void predictedMRLModelLabelHypothesesForString(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [MEMORY[0x1E4F1CA60] dictionary];
  objc_claimAutoreleasedReturnValue();
  MRLModelGetOutputSize();
  operator new[]();
}

void sub_1A6435100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t createMRLModelFromURL(void *a1)
{
  id v1 = a1;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F78EC8], (const void *)[v1 path]);
  uint64_t v3 = MRLModelCreate();
  CFRelease(Mutable);

  return v3;
}

void sub_1A64351F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t createMRLModelFromData(void *a1)
{
  id v1 = a1;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F78EB8], v1);
  uint64_t v3 = MRLModelCompile();
  MRLModelSetMaxSequenceLength();
  CFRelease(Mutable);

  return v3;
}

void sub_1A6435294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id dataFromMRLModel()
{
  uint64_t v0 = (void *)MRLModelCopyQuantizedSerializedData();

  return v0;
}

uint64_t releaseMRLModel()
{
  return MEMORY[0x1F4130398]();
}

id tagForNLTag(void *a1)
{
  id v1 = a1;
  CFNumberRef v2 = v1;
  if (tagForNLTag_onceToken == -1)
  {
    if (v1) {
      goto LABEL_3;
    }
LABEL_6:
    id v3 = 0;
    goto LABEL_7;
  }
  dispatch_once(&tagForNLTag_onceToken, &__block_literal_global_159);
  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  id v3 = [(id)tagForNLTag_tagDictionary objectForKey:v2];
  if (!v3) {
    id v3 = v2;
  }
LABEL_7:

  return v3;
}

void sub_1A64379B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id _NSPathForSystemFramework(void *a1)
{
  id v1 = a1;
  CFNumberRef v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  id v4 = (id)[v3 count];
  if (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = [v3 objectAtIndex:v5];
      id v7 = [v6 stringByAppendingPathComponent:@"Frameworks"];
      id v8 = [v7 stringByAppendingPathComponent:v1];

      if ([v2 fileExistsAtPath:v8]) {
        break;
      }
      id v9 = [v6 stringByAppendingPathComponent:@"PrivateFrameworks"];
      CFNumberType v10 = [v9 stringByAppendingPathComponent:v1];

      if ([v2 fileExistsAtPath:v10])
      {
        id v8 = v10;
        break;
      }

      if (v4 == (id)++v5)
      {
        id v4 = 0;
        goto LABEL_9;
      }
    }
    id v4 = v8;
  }
LABEL_9:

  return v4;
}

void sub_1A6438720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __tagForNLTag_block_invoke()
{
  v3[40] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Word";
  v2[1] = @"Punctuation";
  v3[0] = @"Word";
  v3[1] = @"Punctuation";
  v2[2] = @"Whitespace";
  v2[3] = @"Other";
  v3[2] = @"Whitespace";
  v3[3] = @"Other";
  v2[4] = @"Noun";
  v2[5] = @"Verb";
  v3[4] = @"Noun";
  v3[5] = @"Verb";
  v2[6] = @"Adjective";
  v2[7] = @"Adverb";
  v3[6] = @"Adjective";
  v3[7] = @"Adverb";
  v2[8] = @"Pronoun";
  v2[9] = @"Determiner";
  v3[8] = @"Pronoun";
  v3[9] = @"Determiner";
  v2[10] = @"Particle";
  v2[11] = @"Preposition";
  v3[10] = @"Particle";
  v3[11] = @"Preposition";
  v2[12] = @"Number";
  v2[13] = @"Conjunction";
  v3[12] = @"Number";
  v3[13] = @"Conjunction";
  v2[14] = @"Interjection";
  v2[15] = @"Classifier";
  v3[14] = @"Interjection";
  v3[15] = @"Classifier";
  v2[16] = @"Idiom";
  v2[17] = @"OtherWord";
  v3[16] = @"Idiom";
  v3[17] = @"OtherWord";
  v2[18] = @"SentenceTerminator";
  v2[19] = @"OpenQuote";
  v3[18] = @"SentenceTerminator";
  v3[19] = @"OpenQuote";
  v2[20] = @"CloseQuote";
  v2[21] = @"OpenParenthesis";
  v3[20] = @"CloseQuote";
  v3[21] = @"OpenParenthesis";
  v2[22] = @"CloseParenthesis";
  v2[23] = @"WordJoiner";
  v3[22] = @"CloseParenthesis";
  v3[23] = @"WordJoiner";
  v2[24] = @"Dash";
  v2[25] = @"Punctuation";
  v3[24] = @"Dash";
  v3[25] = @"Punctuation";
  v2[26] = @"ParagraphBreak";
  v2[27] = @"Whitespace";
  v3[26] = @"ParagraphBreak";
  v3[27] = @"Whitespace";
  v2[28] = @"PersonalName";
  v2[29] = @"PlaceName";
  v3[28] = @"PersonalName";
  v3[29] = @"PlaceName";
  v2[30] = @"OrganizationName";
  v2[31] = 0x1EFB316F0;
  v3[30] = @"OrganizationName";
  v3[31] = @"1.0";
  v2[32] = 0x1EFB31710;
  v2[33] = @"Anger";
  v3[32] = @"-1.0";
  v3[33] = @"Anger";
  v2[34] = @"Fear";
  v2[35] = @"Happiness";
  v3[34] = @"Fear";
  v3[35] = @"Happiness";
  v2[36] = @"Love";
  v2[37] = @"Sadness";
  v3[36] = @"Love";
  v3[37] = @"Sadness";
  v2[38] = @"Surprise";
  v2[39] = @"OtherEmotion";
  v3[38] = @"Surprise";
  v3[39] = @"OtherEmotion";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:40];
  id v1 = (void *)tagForNLTag_tagDictionary;
  tagForNLTag_tagDictionary = v0;
}

void ___loadTextInput_block_invoke()
{
  uint64_t v0 = _NSPathForSystemFramework(@"TextInput.framework");
  id v3 = [v0 stringByAppendingPathComponent:@"TextInput"];

  if (v3)
  {
    id v1 = dlopen((const char *)[v3 fileSystemRepresentation], 256);
    if (v1)
    {
      _TILinguisticAssetDownloadClient = (uint64_t)NSClassFromString(&cfstr_Tilinguisticas.isa);
      if (_TILinguisticAssetDownloadClient) {
        goto LABEL_10;
      }
    }
    else if (_TILinguisticAssetDownloadClient)
    {
      goto LABEL_10;
    }
    CFNumberRef v2 = dlerror();
  }
  else
  {
    if (_TILinguisticAssetDownloadClient) {
      goto LABEL_10;
    }
    id v1 = 0;
    CFNumberRef v2 = "nil libraryPath";
  }
  NSLog(&cfstr_FailedToLoadTe.isa, v1, 0, v2);
LABEL_10:
}

void createMaxEntModelFromTrainingDataSet(void *a1, void *a2)
{
  id v3 = a1;
  a2;
  [v3 labelMap];
  objc_claimAutoreleasedReturnValue();
  [v3 inverseLabelMap];
  objc_claimAutoreleasedReturnValue();
  [v3 vocabularyMap];
  objc_claimAutoreleasedReturnValue();
  [v3 documentFrequencyMap];
  objc_claimAutoreleasedReturnValue();
  id v4 = [v3 dataProviderOfType:0];
  [v3 dataProviderOfType:1];
  objc_claimAutoreleasedReturnValue();
  v4;
  operator new();
}

void sub_1A6439510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void createSample(NSArray *a1@<X0>, NSDictionary *a2@<X1>, NSDictionary *a3@<X2>, NSDictionary *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  unint64_t v41 = a1;
  uint64_t v44 = a2;
  uint64_t v43 = a3;
  std::string::basic_string[abi:ne180100]<0>((void *)a5, "");
  *(_OWORD *)(a5 + 56) = 0u;
  *(_OWORD *)(a5 + 40) = 0u;
  *(_OWORD *)(a5 + 24) = 0u;
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v40 = a4;
  CFNumberType v10 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v41;
  uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = tokenIDFromTokenAndVocabularyMap(*(void **)(*((void *)&v54 + 1) + 8 * i), v44);
        if (v14 != 3)
        {
          uint64_t v15 = [NSNumber numberWithUnsignedInteger:v14];
          uint64_t v16 = [v9 objectForKey:v15];
          uint64_t v17 = [v16 unsignedIntegerValue];

          uint64_t v18 = [NSNumber numberWithUnsignedInteger:v17 + 1];
          [v9 setObject:v18 forKey:v15];
        }
      }
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v11);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v19 = [v9 allKeys];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(v19);
        }
        unint64_t v23 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        unint64_t v24 = [v9 objectForKey:v23];
        size_t v25 = [(NSDictionary *)v43 objectForKey:v23];
        [v24 doubleValue];
        double v27 = v26;
        if (v25) {
          [v25 doubleValue];
        }
        else {
          double v28 = 1.0;
        }
        if (v28 >= 1.0) {
          double v29 = v28;
        }
        else {
          double v29 = 1.0;
        }
        if (v27 >= 1.0) {
          double v30 = v27 + 1.0;
        }
        else {
          double v30 = 2.0;
        }
        double v31 = log(v30);
        double v32 = log((double)(unint64_t)v40 / v29);
        std::to_string(&v49, [v23 unsignedIntegerValue]);
        ME_Sample::add_feature((uint64_t *)a5, (uint64_t)&v49, v31 * v32);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v49.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v20);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v33 = [v10 allKeys];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v33);
        }
        uint64_t v37 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        unint64_t v38 = [v10 objectForKey:v37];
        std::to_string(&v49, [v37 unsignedIntegerValue] + 98304);
        [v38 doubleValue];
        ME_Sample::add_feature((uint64_t *)a5, (uint64_t)&v49, v39);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v49.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v34);
  }
}

void sub_1A6439AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  ME_Sample::~ME_Sample(v29);
  _Unwind_Resume(a1);
}

void __createMaxEntModelFromTrainingDataSet_block_invoke(uint64_t a1, uint64_t a2, int a3, float a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSString stringWithUTF8String:a2];
  [v7 logMessage:v8];

  id v9 = (void *)MEMORY[0x1AD0BB930]();
  CFNumberType v10 = NLGetLogCategory(0);
  uint64_t v11 = [v10 internal];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 40) - a3 + 1;
    int v16 = 134218496;
    uint64_t v17 = 2;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    double v21 = *(double *)&v12;
    _os_log_impl(&dword_1A6419000, v11, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %ld", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v13 = (void *)MEMORY[0x1AD0BB930]();
  uint64_t v14 = NLGetLogCategory(0);
  uint64_t v15 = [v14 internal];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218496;
    uint64_t v17 = 2;
    __int16 v18 = 2048;
    uint64_t v19 = 1;
    __int16 v20 = 2048;
    double v21 = a4;
    _os_log_impl(&dword_1A6419000, v15, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", (uint8_t *)&v16, 0x20u);
  }
}

void sub_1A6439DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id predictedMaxEntModelLabelForString(ME_Model *a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v11 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  inputSequenceFromSentence(a6, 0);
  uint64_t v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v14, v12, v13, a5, (uint64_t)v20);
  ME_Model::classify(a1, (ME_Sample *)v20, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v21 >= 0) {
    uint64_t v15 = v20;
  }
  else {
    uint64_t v15 = (void **)v20[0];
  }
  int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", strtoul((const char *)v15, 0, 10));
  uint64_t v17 = [v11 objectForKey:v16];

  unint64_t v24 = (void **)&v23;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v24);
  unint64_t v24 = (void **)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
  if (v21 < 0) {
    operator delete(v20[0]);
  }

  return v17;
}

void sub_1A6439F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  ME_Sample::~ME_Sample((void **)va);
  _Unwind_Resume(a1);
}

id predictedMaxEntModelLabelHypothesesForString(ME_Model *a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v11 = a2;
  uint64_t v12 = a3;
  unint64_t v24 = a4;
  inputSequenceFromSentence(a6, 0);
  uint64_t v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v12, v24, a5, (uint64_t)v28);
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  ME_Model::classify(a1, (ME_Sample *)v28, &__p);
  if ((int)((unint64_t)(v27 - (unsigned char *)__p) >> 3) >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = (long long *)(*((void *)a1 + 15) + v15);
      if (*((char *)v17 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)v17, *((void *)v17 + 1));
      }
      else
      {
        long long v18 = *v17;
        v25.__r_.__value_.__r.__words[2] = *((void *)v17 + 2);
        *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v18;
      }
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v19 = &v25;
      }
      else {
        uint64_t v19 = (std::string *)v25.__r_.__value_.__r.__words[0];
      }
      __int16 v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", strtoul((const char *)v19, 0, 10));
      char v21 = [v11 objectForKey:v20];

      if (v21)
      {
        uint64_t v22 = [NSNumber numberWithDouble:*((double *)__p + v16)];
        [v14 setObject:v22 forKey:v21];
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      ++v16;
      v15 += 24;
    }
    while (v16 < (int)((unint64_t)(v27 - (unsigned char *)__p) >> 3));
  }
  if (__p)
  {
    double v27 = __p;
    operator delete(__p);
  }
  long long __p = &v31;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  long long __p = &v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v29 < 0) {
    operator delete(v28[0]);
  }

  return v14;
}

void sub_1A643A198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21)
{
  ME_Sample::~ME_Sample(&a21);
  _Unwind_Resume(a1);
}

void createMaxEntModelFromData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  operator new();
}

void sub_1A643A440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id dataFromMaxEntModel(void *a1)
{
  uint64_t v16 = (uint64_t)&v16;
  uint64_t v17 = &v16;
  uint64_t v18 = 0;
  ME_Model::get_features(a1, &v16);
  id v1 = [MEMORY[0x1E4F1CA58] dataWithLength:8 * v18];
  uint64_t v2 = [v1 mutableBytes];
  id v3 = v17;
  if (v17 != &v16)
  {
    id v4 = (_DWORD *)(v2 + 4);
    do
    {
      if (*((char *)v3 + 39) < 0) {
        std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v3[2], v3[3]);
      }
      else {
        std::string v15 = *(std::string *)(v3 + 2);
      }
      if (*((char *)v3 + 63) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v3[5], v3[6]);
      }
      else {
        std::string __p = *(std::string *)(v3 + 5);
      }
      double v5 = *((double *)v3 + 8);
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v6 = &v15;
      }
      else {
        uint64_t v6 = (std::string *)v15.__r_.__value_.__r.__words[0];
      }
      int v7 = strtoul((const char *)v6, 0, 10);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      unsigned int v9 = strtoul((const char *)p_p, 0, 10);
      if ((v7 - 1) <= 0xFE && v9 != 0 && HIBYTE(v9) == 0)
      {
        *(float *)&unsigned int v12 = v5;
        *(v4 - 1) = v9 | (v7 << 24);
        _DWORD *v4 = bswap32(v12);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      id v3 = (uint64_t *)v3[1];
      v4 += 2;
    }
    while (v3 != &v16);
  }
  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(&v16);

  return v1;
}

void sub_1A643A614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(&a19);

  _Unwind_Resume(a1);
}

ME_Model *releaseMaxEntModel(ME_Model *result)
{
  if (result)
  {
    ME_Model::~ME_Model(result);
    JUMPOUT(0x1AD0BB590);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    id v4 = v1[1];
    double v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 10;
        std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(v4);
      }
      while (v4 != v2);
      double v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void ME_Sample::add_feature(uint64_t *a1, uint64_t a2, double a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  double v20 = a3;
  unint64_t v5 = a1[8];
  unint64_t v6 = a1[7];
  if (v6 >= v5)
  {
    uint64_t v8 = a1[6];
    uint64_t v9 = (uint64_t)(v6 - v8) >> 5;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 59) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - v8;
    if (v11 >> 4 > v10) {
      unint64_t v10 = v11 >> 4;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    v21[4] = a1 + 8;
    uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(a1 + 8), v12);
    uint64_t v14 = &v13[32 * v9];
    v21[0] = v13;
    v21[1] = v14;
    v21[3] = &v13[32 * v15];
    long long v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v14 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)uint64_t v14 = v16;
    memset(&__p, 0, sizeof(__p));
    *((double *)v14 + 3) = v20;
    v21[2] = v14 + 32;
    std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(a1 + 6, v21);
    uint64_t v17 = a1[7];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v21);
    int v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a1[7] = v17;
    if (v18 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v6 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v6 = v7;
    *(double *)(v6 + 24) = v20;
    a1[7] = v6 + 32;
  }
}

void sub_1A643A8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      long long v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 16) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(v8 - 8) = *(void *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,double>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void ME_Model::~ME_Model(ME_Model *this)
{
  uint64_t v2 = (void *)*((void *)this + 51);
  if (v2)
  {
    *((void *)this + 52) = v2;
    operator delete(v2);
  }
  uint64_t v7 = (void **)((char *)this + 360);
  std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](&v7);
  uint64_t v7 = (void **)((char *)this + 336);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v7);
  id v3 = (void *)*((void *)this + 39);
  if (v3)
  {
    *((void *)this + 40) = v3;
    operator delete(v3);
  }
  id v4 = (void *)*((void *)this + 36);
  if (v4)
  {
    *((void *)this + 37) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 32);
  if (v5)
  {
    *((void *)this + 33) = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this + 216);
  uint64_t v6 = (void *)*((void *)this + 24);
  if (v6)
  {
    *((void *)this + 25) = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 152);
  uint64_t v7 = (void **)((char *)this + 120);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v7);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 80);
  uint64_t v7 = (void **)((char *)this + 48);
  std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)v2);
    id v3 = **a1;
    operator delete(v3);
  }
}

id createCRFSuiteMaxEntModelDataFromTrainingDataSet(void *a1)
{
  id v19 = a1;
  uint64_t v1 = [v19 labelMap];
  int v18 = [v19 inverseLabelMap];
  uint64_t v22 = [v19 vocabularyMap];
  char v21 = [v19 documentFrequencyMap];
  uint64_t v17 = [v19 dataProviderOfType:0];
  double v20 = [v19 dataProviderOfType:1];
  id v2 = v17;
  maxent_model_create();
  id v3 = (NSDictionary *)[v2 numberOfInstances];
  [v20 numberOfInstances];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; uint64_t i = (NSDictionary *)((char *)i + 1))
    {
      uint64_t v5 = [v2 instanceAtIndex:i];
      uint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = [v5 label];
        uint64_t v8 = [v1 objectForKey:v7];

        if (v8)
        {
          long long v9 = [v6 tokens];
          createSample(v9, v22, v21, v3);

          std::to_string(&v23, [v8 unsignedIntegerValue]);
          maxent_sample_set_label();
          if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v23.__r_.__value_.__l.__data_);
          }
          maxent_add_training_sample();
          maxent_sample_release();
        }
      }
    }
  }
  maxent_use_l2_regularizer();
  maxent_train();
  uint64_t v10 = NSTemporaryDirectory();
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"maxentmodel_%d.dat", getpid());
  unint64_t v12 = [v10 stringByAppendingPathComponent:v11];

  id v13 = v12;
  [v13 fileSystemRepresentation];
  if (maxent_save_to_file())
  {
    long long v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v13];
    long long v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtPath:v13 error:0];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

void sub_1A643AF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

uint64_t createSample(NSArray *a1, NSDictionary *a2, NSDictionary *a3, NSDictionary *a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = a1;
  unint64_t v41 = a2;
  unint64_t v40 = a3;
  uint64_t v7 = maxent_sample_create();
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  double v39 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v37;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = tokenIDFromTokenAndVocabularyMap(*(void **)(*((void *)&v51 + 1) + 8 * i), v41);
        if (v12 != 3)
        {
          id v13 = [NSNumber numberWithUnsignedInteger:v12];
          long long v14 = [v8 objectForKey:v13];
          uint64_t v15 = [v14 unsignedIntegerValue];

          long long v16 = [NSNumber numberWithUnsignedInteger:v15 + 1];
          [v8 setObject:v16 forKey:v13];
        }
      }
      uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v9);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v17 = [v8 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v48;
    double v20 = (double)(unint64_t)a4;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        std::string v23 = [v8 objectForKey:v22];
        unint64_t v24 = [(NSDictionary *)v40 objectForKey:v22];
        [v23 doubleValue];
        double v26 = v25;
        if (v24) {
          [v24 doubleValue];
        }
        else {
          double v27 = 1.0;
        }
        if (v27 >= 1.0) {
          double v28 = v27;
        }
        else {
          double v28 = 1.0;
        }
        if (v26 >= 1.0) {
          double v29 = v26 + 1.0;
        }
        else {
          double v29 = 2.0;
        }
        log(v29);
        log(v20 / v28);
        std::to_string(&v46, [v22 unsignedIntegerValue]);
        maxent_sample_add_feature_with_value();
        if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v46.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v18);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v30 = [v39 allKeys];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = *(void **)(*((void *)&v42 + 1) + 8 * k);
        uint64_t v35 = [v39 objectForKey:v34];
        std::to_string(&v46, [v34 unsignedIntegerValue] + 98304);
        [v35 doubleValue];
        maxent_sample_add_feature_with_value();
        if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v46.__r_.__value_.__l.__data_);
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v55 count:16];
    }
    while (v31);
  }

  return v7;
}

void sub_1A643B460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  _Unwind_Resume(a1);
}

id predictedCRFSuiteMaxEntModelLabelForString(uint64_t a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  inputSequenceFromSentence(a6, 0);
  id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v11, v12, a5);
  maxent_classify();
  label = (const char *)maxent_sample_get_label();
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", strtoul(label, 0, 10));
  long long v16 = [v10 objectForKey:v15];

  maxent_sample_release();

  return v16;
}

void sub_1A643B694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id predictedCRFSuiteMaxEntModelLabelHypothesesForString(uint64_t a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  inputSequenceFromSentence(a6, 0);
  id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v11, v12, a5);
  long long v14 = [MEMORY[0x1E4F1CA60] dictionary];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  id v17 = v10;
  id v18 = v14;
  maxent_classify();
  maxent_sample_release();
  id v15 = v18;

  _Block_object_dispose(v19, 8);

  return v15;
}

void sub_1A643B850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __predictedCRFSuiteMaxEntModelLabelHypothesesForString_block_invoke(void *a1, double a2)
{
  class_label = (const char *)maxent_get_class_label();
  unint64_t v5 = strtoul(class_label, 0, 10);
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v11 = [v6 objectForKey:v7];

  uint64_t v8 = v11;
  if (v11)
  {
    uint64_t v9 = (void *)a1[5];
    id v10 = [NSNumber numberWithDouble:a2];
    [v9 setObject:v10 forKey:v11];

    uint64_t v8 = v11;
  }
  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
}

void sub_1A643B990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t createCRFSuiteMaxEntModelFromData(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];
  uint64_t v2 = maxent_load_with_bytes();

  return v2;
}

void sub_1A643BA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t releaseCRFSuiteMaxEntModel()
{
  return MEMORY[0x1F417A330]();
}

_DWORD *tokensForEntrySequence(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = [v1 objectAtIndex:i];
      v4[i] = [v6 tokenID];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_1A643F4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id entrySequenceForStringWithOptionalBOS(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = [v9 array];
  if (a4)
  {
    uint64_t v12 = [[NLLexiconEntry alloc] initWithString:&stru_1EFB303D0 tokenID:1 flags:0 probability:-30.0];
    [v11 addObject:v12];
  }
  [v10 setString:v7];
  uint64_t v13 = [v7 length];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  _OWORD v20[2] = __entrySequenceForStringWithOptionalBOS_block_invoke;
  v20[3] = &unk_1E5C54150;
  id v21 = v7;
  id v22 = v8;
  id v14 = v11;
  id v23 = v14;
  id v15 = v8;
  id v16 = v7;
  objc_msgSend(v10, "enumerateTokensInRange:usingBlock:", 0, v13, v20);

  id v17 = v23;
  id v18 = v14;

  return v18;
}

void __entrySequenceForStringWithOptionalBOS_block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1[4], "substringWithRange:", a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "entryForString:");
  id v4 = (NLLexiconEntry *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v5 = a1[5];
    uint64_t v6 = [v7 lowercaseString];
    id v4 = [v5 entryForString:v6];

    if (!v4) {
      id v4 = [[NLLexiconEntry alloc] initWithString:v7 tokenID:0 flags:0 probability:-30.0];
    }
  }
  [a1[6] addObject:v4];
}

void *NLPClassifierModelCreateTrainedModelWithData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v30 = 0;
  id v15 = a8;
  id v16 = +[NLModelConfiguration defaultModelConfigurationForType:0 options:a1 error:&v30];
  id v17 = v30;
  id v18 = [[NLPModelTrainingDelegate alloc] initWithLogHandler:v15];

  if (a2 >= 1 && v16)
  {
    uint64_t v19 = [[NLModelTrainingDataSet alloc] initWithConfiguration:v16 numberOfTrainingInstances:a2 numberOfValidationInstances:a3 trainingDataSource:a4 validationDataSource:a5 instanceDataProvider:v14];
    int v20 = +[NLModelTrainer modelTrainerWithConfiguration:v16 dataSet:v19 options:a1 delegate:v18];
    uint64_t v21 = [(NLDataSet *)v19 numberOfValidationInstances];
    if (!a3 && v21)
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Holding out %llu samples for validation\n", v21);
      [v20 logMessage:v22];
    }
    id v23 = [v20 trainedModel];
    if (!v23)
    {
      uint64_t v24 = [v20 trainingError];

      id v17 = (id)v24;
    }
  }
  else
  {
    if (!v16)
    {
      id v23 = 0;
      goto LABEL_11;
    }
    double v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Failed to train model, no training data supplied";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v25 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:9 userInfo:v19];
    id v23 = 0;
    int v20 = v17;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (!a6 || v23)
  {
    if (v23) {
      id v27 = v23;
    }
  }
  else
  {
    if (v17) {
      id v26 = v17;
    }
    *a6 = v17;
  }

  return v23;
}

NSUInteger NLPClassifierModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:0];
}

uint64_t NLPClassifierModelIsRevisionSupported(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v2 = +[NLModelConfiguration supportedRevisionsForType:0];
  uint64_t v3 = [v2 containsIndex:a1];

  return v3;
}

uint64_t NLPClassifierModelGetRevision(void *a1)
{
  id v1 = [a1 configuration];
  uint64_t v2 = [v1 revision];

  return v2;
}

NLModel *NLPClassifierModelCreateWithData(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithData:a1 error:&v9];
  id v4 = v9;
  id v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPClassifierModelCopyData(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

NLModel *NLPClassifierModelCreateWithURL(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithContentsOfURL:a1 error:&v9];
  id v4 = v9;
  id v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPClassifierModelWriteToURL(void *a1, uint64_t a2, void *a3)
{
  id v9 = 0;
  uint64_t v4 = [a1 writeToURL:a2 atomically:1 error:&v9];
  id v5 = v9;
  id v6 = v5;
  if (a3 && (v4 & 1) == 0)
  {
    if (v5) {
      id v7 = v5;
    }
    *a3 = v6;
  }

  return v4;
}

uint64_t NLPClassifierModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = 0;
  uint64_t v5 = [a1 writeMLModelToURL:a2 options:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6) {
      id v8 = v6;
    }
    *a4 = v7;
  }

  return v5;
}

uint64_t NLPClassifierModelWriteCoreMLModelToURL(void *a1, uint64_t a2, void *a3)
{
  return NLPClassifierModelWriteCoreMLModelToURLWithOptions(a1, a2, 0, a3);
}

void *NLPClassifierModelCopyPredictedLabelForText(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 predictedLabelForString:a2];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

uint64_t NLPClassifierModelCopyPredictedLabelHypothesesForText(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

void *NLPClassifierModelCopyTestResults(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = [NLPModelTrainingDataProvider alloc];
  id v10 = [v7 configuration];
  id v11 = [(NLPModelTrainingDataProvider *)v9 initWithConfiguration:v10 numberOfInstances:a2 dataSource:a3 instanceDataProvider:v8];

  uint64_t v12 = [v7 testResultsWithDataProvider:v11];

  if (v12) {
    id v13 = v12;
  }

  return v12;
}

void *NLPSequenceModelCreateTrainedModelWithData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v14 = a7;
  id v30 = 0;
  id v15 = a8;
  id v16 = +[NLModelConfiguration defaultModelConfigurationForType:1 options:a1 error:&v30];
  id v17 = v30;
  id v18 = [[NLPModelTrainingDelegate alloc] initWithLogHandler:v15];

  if (a2 >= 1 && v16)
  {
    uint64_t v19 = [[NLModelTrainingDataSet alloc] initWithConfiguration:v16 numberOfTrainingInstances:a2 numberOfValidationInstances:a3 trainingDataSource:a4 validationDataSource:a5 instanceDataProvider:v14];
    int v20 = +[NLModelTrainer modelTrainerWithConfiguration:v16 dataSet:v19 options:a1 delegate:v18];
    uint64_t v21 = [(NLDataSet *)v19 numberOfValidationInstances];
    if (!a3 && v21)
    {
      id v22 = objc_msgSend(NSString, "stringWithFormat:", @"Holding out %llu samples for validation\n", v21);
      [v20 logMessage:v22];
    }
    id v23 = [v20 trainedModel];
    if (!v23)
    {
      uint64_t v24 = [v20 trainingError];

      id v17 = (id)v24;
    }
  }
  else
  {
    if (!v16)
    {
      id v23 = 0;
      goto LABEL_11;
    }
    double v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"Failed to train model, no training data supplied";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v25 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:9 userInfo:v19];
    id v23 = 0;
    int v20 = v17;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (!a6 || v23)
  {
    if (v23) {
      id v27 = v23;
    }
  }
  else
  {
    if (v17) {
      id v26 = v17;
    }
    *a6 = v17;
  }

  return v23;
}

NSUInteger NLPSequenceModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:1];
}

uint64_t NLPSequenceModelIsRevisionSupported(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v2 = +[NLModelConfiguration supportedRevisionsForType:1];
  uint64_t v3 = [v2 containsIndex:a1];

  return v3;
}

uint64_t NLPSequenceModelGetRevision(void *a1)
{
  id v1 = [a1 configuration];
  uint64_t v2 = [v1 revision];

  return v2;
}

NLModel *NLPSequenceModelCreateWithData(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithData:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPSequenceModelCopyData(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

NLModel *NLPSequenceModelCreateWithURL(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithContentsOfURL:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPSequenceModelWriteToURL(void *a1, uint64_t a2, void *a3)
{
  id v9 = 0;
  uint64_t v4 = [a1 writeToURL:a2 atomically:1 error:&v9];
  id v5 = v9;
  id v6 = v5;
  if (a3 && (v4 & 1) == 0)
  {
    if (v5) {
      id v7 = v5;
    }
    *a3 = v6;
  }

  return v4;
}

uint64_t NLPSequenceModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = 0;
  uint64_t v5 = [a1 writeMLModelToURL:a2 options:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6) {
      id v8 = v6;
    }
    *a4 = v7;
  }

  return v5;
}

uint64_t NLPSequenceModelWriteCoreMLModelToURL(void *a1, uint64_t a2, void *a3)
{
  return NLPSequenceModelWriteCoreMLModelToURLWithOptions(a1, a2, 0, a3);
}

__CFDictionary *NLPSequenceModelCopyPredictedTokensAndLabelsForText(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a1;
  uint64_t v5 = [v3 array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  generateTokenSequence(a2, 0, v5, v6, v7);
  id v9 = [v4 predictedLabelsForTokens:v5];

  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenArrayKey, v5);
  CFDictionaryAddValue(Mutable, (const void *)kNLPLabelArrayKey, v9);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLocationArrayKey, v6);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLengthArrayKey, v7);

  return Mutable;
}

__CFDictionary *NLPSequenceModelCopyPredictedTokensAndLabelHypothesesForText(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a1;
  id v7 = [v5 array];
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  generateTokenSequence(a2, 0, v7, v8, v9);
  id v11 = [v6 predictedLabelHypothesesForTokens:v7 maximumCount:a3];

  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenArrayKey, v7);
  CFDictionaryAddValue(Mutable, (const void *)kNLPLabelHypothesesArrayKey, v11);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLocationArrayKey, v8);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLengthArrayKey, v9);

  return Mutable;
}

void *NLPSequenceModelCopyPredictedLabelsForTokens(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 predictedLabelsForTokens:a2];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

uint64_t NLPSequenceModelCopyPredictedLabelHypothesesForTokens(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

void *NLPSequenceModelCopyPredictedLabelArraysForTokenArrays(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 predictedLabelArraysForTokenArrays:a2];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

void *NLPSequenceModelCopyTestResults(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  id v9 = [NLPModelTrainingDataProvider alloc];
  id v10 = [v7 configuration];
  id v11 = [(NLPModelTrainingDataProvider *)v9 initWithConfiguration:v10 numberOfInstances:a2 dataSource:a3 instanceDataProvider:v8];

  uint64_t v12 = [v7 testResultsWithDataProvider:v11];

  if (v12) {
    id v13 = v12;
  }

  return v12;
}

NLModel *NLPGazetteerModelCreateWithData(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithData:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

NLModel *NLPGazetteerModelCreateWithURL(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithContentsOfURL:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPGazetteerModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = 0;
  uint64_t v5 = [a1 writeMLModelToURL:a2 options:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6) {
      id v8 = v6;
    }
    *a4 = v7;
  }

  return v5;
}

void *NLPGazetteerModelCopyLabelForString(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 predictedLabelForString:a2];
  uint64_t v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

NSUInteger NLPGazetteerModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:0];
}

uint64_t NLPGazetteerModelIsRevisionSupported(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v2 = +[NLModelConfiguration supportedRevisionsForType:0];
  uint64_t v3 = [v2 containsIndex:a1];

  return v3;
}

uint64_t NLPGazetteerModelGetRevision(void *a1)
{
  id v1 = [a1 configuration];
  uint64_t v2 = [v1 revision];

  return v2;
}

NLModel *NLPEmbeddingModelCreateWithData(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithData:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

NLModel *NLPEmbeddingModelCreateWithURL(uint64_t a1, void *a2)
{
  id v9 = 0;
  uint64_t v3 = [[NLModel alloc] initWithContentsOfURL:a1 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (!a2 || v3)
  {
    if (v3) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    if (v4) {
      id v6 = v4;
    }
    id v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPEmbeddingModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = 0;
  uint64_t v5 = [a1 writeMLModelToURL:a2 options:a3 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6) {
      id v8 = v6;
    }
    *a4 = v7;
  }

  return v5;
}

id NLPEmbeddingModelCopyVectorForString(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 predictedLabelForString:a2];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = objc_msgSend(v2, "componentsSeparatedByString:", @",", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = NSNumber;
          [*(id *)(*((void *)&v12 + 1) + 8 * i) doubleValue];
          id v10 = objc_msgSend(v9, "numberWithDouble:");
          [v3 addObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    if (v3)
    {
      id v3 = v3;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

NSUInteger NLPEmbeddingModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:0];
}

uint64_t NLPEmbeddingModelIsRevisionSupported(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v2 = +[NLModelConfiguration supportedRevisionsForType:0];
  uint64_t v3 = [v2 containsIndex:a1];

  return v3;
}

uint64_t NLPEmbeddingModelGetRevision(void *a1)
{
  id v1 = [a1 configuration];
  uint64_t v2 = [v1 revision];

  return v2;
}

__CFString *_getLanguageTag(int a1)
{
  if ((a1 - 2) > 0x38)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = _languageTags[a1 - 1];
  }
  return v2;
}

void ME_Model::regularized_func_grad(ME_Model *this, double a2, double **a3, double **a4)
{
  double v6 = ME_Model::FunctionGradient(this, (uint64_t)a3, a4);
  uint64_t v7 = *a3;
  uint64_t v8 = (char *)a3[1] - (char *)*a3;
  if (v8)
  {
    unint64_t v9 = v8 >> 3;
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    do
    {
      double v10 = *v7++;
      double v6 = v6 + a2 * fabs(v10);
      --v9;
    }
    while (v9);
  }
}

double ME_Model::constrained_line_search(ME_Model *this, double a2, const Vec *a3, double **a4, double a5, const Vec *a6, Vec *a7, double **a8)
{
  long long v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v57, *(const void **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  id v16 = (double *)v57;
  if (v58 != v57)
  {
    unint64_t v17 = (v58 - (unsigned char *)v57) >> 3;
    id v18 = *a4;
    if (v17 <= 1) {
      unint64_t v17 = 1;
    }
    do
    {
      if (*v16 == 0.0) {
        *id v16 = -*v18;
      }
      ++v18;
      ++v16;
      --v17;
    }
    while (v17);
  }
  double v19 = 2.0;
  do
  {
    while (1)
    {
      Vec::Vec((Vec *)v54, (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3, 0.0);
      double v19 = v19 * 0.5;
      int v20 = *(double **)a6;
      uint64_t v21 = *((void *)a6 + 1) - *(void *)a6;
      if (v21)
      {
        unint64_t v22 = v21 >> 3;
        id v23 = (double *)v54[0];
        if (v22 <= 1) {
          unint64_t v22 = 1;
        }
        do
        {
          double v24 = *v20++;
          *v23++ = v19 * v24;
          --v22;
        }
        while (v22);
      }
      Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3, 0.0);
      double v25 = *(double **)a3;
      id v26 = (char *)__p;
      uint64_t v27 = *((void *)a3 + 1) - *(void *)a3;
      if (v27)
      {
        unint64_t v28 = v27 >> 3;
        double v29 = (double *)v54[0];
        if (v28 <= 1) {
          unint64_t v28 = 1;
        }
        id v30 = (double *)__p;
        do
        {
          double v31 = *v25++;
          double v32 = v31;
          double v33 = *v29++;
          *v30++ = v32 + v33;
          --v28;
        }
        while (v28);
      }
      if (&__p != (void **)a7)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a7, v26, (uint64_t)v56, (v56 - v26) >> 3);
        id v26 = (char *)__p;
      }
      if (v26)
      {
        long long v56 = v26;
        operator delete(v26);
      }
      if (v54[0])
      {
        v54[1] = v54[0];
        operator delete(v54[0]);
      }
      uint64_t v34 = *(double **)a7;
      uint64_t v35 = *((void *)a7 + 1) - *(void *)a7;
      if (v35)
      {
        unint64_t v36 = v35 >> 3;
        uint64_t v37 = (double *)v57;
        if (v36 <= 1) {
          unint64_t v36 = 1;
        }
        do
        {
          if (*v34 * *v37 <= 0.0) {
            *uint64_t v34 = 0.0;
          }
          ++v37;
          ++v34;
          --v36;
        }
        while (v36);
      }
      ME_Model::regularized_func_grad(this, a2, (double **)a7, a8);
      double v39 = v38;
      Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 3, 0.0);
      unint64_t v40 = *(double **)a7;
      uint64_t v41 = *((void *)a7 + 1) - *(void *)a7;
      if (v41)
      {
        unint64_t v42 = v41 >> 3;
        long long v43 = *(double **)a3;
        long long v44 = (double *)__p;
        if (v42 <= 1) {
          unint64_t v42 = 1;
        }
        do
        {
          double v45 = *v40++;
          double v46 = v45;
          double v47 = *v43++;
          *v44++ = v46 - v47;
          --v42;
        }
        while (v42);
      }
      int64_t v48 = v56 - (unsigned char *)__p;
      if (v56 == __p) {
        break;
      }
      uint64_t v49 = 0;
      uint64_t v50 = v48 >> 3;
      if ((unint64_t)(v48 >> 3) <= 1) {
        uint64_t v50 = 1;
      }
      double v51 = 0.0;
      do
      {
        double v51 = v51 + *((double *)__p + v49) * (*a4)[v49];
        ++v49;
      }
      while (v50 != v49);
      double v52 = a5 + v51 * 0.1;
      long long v56 = __p;
      operator delete(__p);
      if (v39 <= v52) {
        goto LABEL_43;
      }
    }
    if (v56) {
      operator delete(v56);
    }
  }
  while (v39 > a5 + 0.0);
LABEL_43:
  if (v57)
  {
    uint64_t v58 = v57;
    operator delete(v57);
  }
  return v39;
}

void sub_1A6445B6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a10) {
    operator delete(a10);
  }
  if (a16) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void ME_Model::perform_OWLQN(int *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(const void **)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  unint64_t v10 = (v8 - (uint64_t)v7) >> 3;
  v89 = 0;
  v90 = 0;
  uint64_t v91 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v89, v7, v8, v10);
  Vec::Vec((Vec *)&v87, v10, 0.0);
  Vec::Vec((Vec *)&v85, v10, 0.0);
  ME_Model::regularized_func_grad((ME_Model *)a1, a4, (double **)&v89, (double **)&v87);
  double v12 = v11;
  for (uint64_t i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v94[i], 0, 0.0);
  for (uint64_t j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v93[j], 0, 0.0);
  if (OWLQN_MAX_ITER >= 1)
  {
    unsigned int v15 = 0;
    while (1)
    {
      v82 = 0;
      v83 = 0;
      uint64_t v84 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v82, v87, (uint64_t)v88, (v88 - (unsigned char *)v87) >> 3);
      id v16 = (double *)v89;
      if (v90 != v89) {
        break;
      }
LABEL_23:
      if (a1[100] >= 1) {
        ME_Model::heldout_likelihood((ME_Model *)a1);
      }
      id v23 = v82;
      if (v83 == v82)
      {
        double v25 = 0.0;
      }
      else
      {
        unint64_t v24 = (v83 - (unsigned char *)v82) >> 3;
        if (v24 <= 1) {
          unint64_t v24 = 1;
        }
        double v25 = 0.0;
        id v26 = (double *)v82;
        do
        {
          double v27 = *v26++;
          double v25 = v25 + v27 * v27;
          --v24;
        }
        while (v24);
      }
      double v28 = sqrt(v25);
      if (v28 >= 0.0001)
      {
        approximate_Hg((const Vec *)&v82, (const Vec *)v94, (const Vec *)v93, v92, v15, (double **)&v78);
        Vec::Vec((Vec *)&__p, (v79 - (unsigned char *)v78) >> 3, 0.0);
        double v29 = (double *)v78;
        if (v79 != v78)
        {
          unint64_t v30 = (v79 - (unsigned char *)v78) >> 3;
          double v31 = (double *)__p;
          if (v30 <= 1) {
            unint64_t v30 = 1;
          }
          do
          {
            double v32 = *v29++;
            *v31++ = -v32;
            --v30;
          }
          while (v30);
        }
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v85, (char *)__p, (uint64_t)v81, (v81 - (unsigned char *)__p) >> 3);
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        if (v78)
        {
          v79 = v78;
          operator delete(v78);
        }
        double v33 = (double *)v85;
        if (v86 == v85) {
          goto LABEL_47;
        }
        unint64_t v34 = (v86 - (unsigned char *)v85) >> 3;
        if (v34 <= 1) {
          unint64_t v34 = 1;
        }
        double v35 = 0.0;
        unint64_t v36 = (double *)v82;
        do
        {
          double v37 = *v33++;
          double v38 = v37;
          double v39 = *v36++;
          double v35 = v35 + v38 * v39;
          --v34;
        }
        while (v34);
        if (v35 >= 0.0)
        {
LABEL_47:
          Vec::Vec((Vec *)&__p, (v83 - (unsigned char *)v82) >> 3, 0.0);
          unint64_t v40 = (double *)v82;
          if (v83 != v82)
          {
            unint64_t v41 = (v83 - (unsigned char *)v82) >> 3;
            unint64_t v42 = (double *)__p;
            if (v41 <= 1) {
              unint64_t v41 = 1;
            }
            do
            {
              double v43 = *v40++;
              *v42++ = -v43;
              --v41;
            }
            while (v41);
          }
          long long v44 = (double *)v85;
          double v45 = (double *)__p;
          if (v86 != v85)
          {
            unint64_t v46 = (v86 - (unsigned char *)v85) >> 3;
            if (v46 <= 1) {
              unint64_t v46 = 1;
            }
            do
            {
              if (*v44 * *v45 <= 0.0) {
                double *v44 = 0.0;
              }
              ++v45;
              ++v44;
              --v46;
            }
            while (v46);
            double v45 = (double *)__p;
          }
          if (v45)
          {
            v81 = v45;
            operator delete(v45);
          }
        }
        Vec::Vec((Vec *)&__p, v10, 0.0);
        Vec::Vec((Vec *)&v78, v10, 0.0);
        double v12 = ME_Model::constrained_line_search((ME_Model *)a1, a4, (const Vec *)&v89, (double **)&v82, v12, (const Vec *)&v85, (Vec *)&__p, (double **)&v78);
        Vec::Vec((Vec *)&v76, (v81 - (unsigned char *)__p) >> 3, 0.0);
        double v47 = (double *)__p;
        if (v81 != __p)
        {
          unint64_t v48 = (v81 - (unsigned char *)__p) >> 3;
          uint64_t v49 = (double *)v89;
          uint64_t v50 = (double *)v76;
          if (v48 <= 1) {
            unint64_t v48 = 1;
          }
          do
          {
            double v51 = *v47++;
            double v52 = v51;
            double v53 = *v49++;
            *v50++ = v52 - v53;
            --v48;
          }
          while (v48);
        }
        uint64_t v54 = v15 % 0xA;
        long long v55 = (void **)&v94[24 * v54];
        if (v55 != &v76) {
          std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v94[24 * v54], (char *)v76, (uint64_t)v77, (v77 - (unsigned char *)v76) >> 3);
        }
        if (v76)
        {
          std::vector<int> v77 = v76;
          operator delete(v76);
        }
        Vec::Vec((Vec *)&v76, (v79 - (unsigned char *)v78) >> 3, 0.0);
        long long v56 = (double *)v78;
        if (v79 != v78)
        {
          unint64_t v57 = (v79 - (unsigned char *)v78) >> 3;
          uint64_t v58 = (double *)v87;
          uint64_t v59 = (double *)v76;
          if (v57 <= 1) {
            unint64_t v57 = 1;
          }
          do
          {
            double v60 = *v56++;
            double v61 = v60;
            double v62 = *v58++;
            *v59++ = v61 - v62;
            --v57;
          }
          while (v57);
        }
        double v63 = (void **)&v93[24 * v54];
        if (v63 != &v76) {
          std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v93[24 * v54], (char *)v76, (uint64_t)v77, (v77 - (unsigned char *)v76) >> 3);
        }
        if (v76)
        {
          std::vector<int> v77 = v76;
          operator delete(v76);
        }
        v64 = (double *)*v63;
        uint64_t v65 = (unsigned char *)v63[1] - (unsigned char *)*v63;
        if (v65)
        {
          unint64_t v66 = v65 >> 3;
          v67 = (double *)*v55;
          if (v66 <= 1) {
            unint64_t v66 = 1;
          }
          double v68 = 0.0;
          do
          {
            double v69 = *v64++;
            double v70 = v69;
            double v71 = *v67++;
            double v68 = v68 + v70 * v71;
            --v66;
          }
          while (v66);
        }
        else
        {
          double v68 = 0.0;
        }
        v92[v54] = 1.0 / v68;
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v89, (char *)__p, (uint64_t)v81, (v81 - (unsigned char *)__p) >> 3);
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v87, (char *)v78, (uint64_t)v79, (v79 - (unsigned char *)v78) >> 3);
        if (v78)
        {
          v79 = v78;
          operator delete(v78);
        }
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        id v23 = v82;
      }
      if (v23)
      {
        v83 = v23;
        operator delete(v23);
      }
      if (v28 >= 0.0001 && (int)++v15 < OWLQN_MAX_ITER) {
        continue;
      }
      goto LABEL_92;
    }
    unint64_t v17 = (v90 - (unsigned char *)v89) >> 3;
    id v18 = (double *)v87;
    double v19 = (double *)v82;
    if (v17 <= 1) {
      unint64_t v17 = 1;
    }
    while (1)
    {
      if (*v16 == 0.0)
      {
        double v22 = *v18 - a4;
        if (v22 > 0.0)
        {
          double *v19 = v22;
          goto LABEL_22;
        }
        double v21 = *v18 + a4;
        if (v21 >= 0.0)
        {
          double *v19 = 0.0;
          goto LABEL_22;
        }
      }
      else
      {
        if (*v16 >= 0.0) {
          double v20 = 0.0;
        }
        else {
          double v20 = -1.0;
        }
        if (*v16 > 0.0) {
          double v20 = 1.0;
        }
        double v21 = *v19 + a4 * v20;
      }
      double *v19 = v21;
LABEL_22:
      ++v19;
      ++v18;
      ++v16;
      if (!--v17) {
        goto LABEL_23;
      }
    }
  }
LABEL_92:
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a3, v89, (uint64_t)v90, (v90 - (unsigned char *)v89) >> 3);
  for (uint64_t k = 0; k != -240; k -= 24)
  {
    v73 = *(void **)&v93[k + 216];
    if (v73)
    {
      *(void *)&v93[k + 224] = v73;
      operator delete(v73);
    }
  }
  for (uint64_t m = 0; m != -240; m -= 24)
  {
    v75 = *(void **)&v94[m + 216];
    if (v75)
    {
      *(void *)&v94[m + 224] = v75;
      operator delete(v75);
    }
  }
  if (v85)
  {
    v86 = v85;
    operator delete(v85);
  }
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
}

void sub_1A6446250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v72 = 0;
  while (1)
  {
    v73 = *(void **)(&a41 + v72 + 216);
    if (v73)
    {
      *(void *)(&a41 + v72 + 224) = v73;
      operator delete(v73);
    }
    v72 -= 24;
    if (v72 == -240)
    {
      uint64_t v74 = 0;
      while (1)
      {
        v75 = *(void **)(&a71 + v74 + 216);
        if (v75)
        {
          *(void *)(&a71 + v74 + 224) = v75;
          operator delete(v75);
        }
        v74 -= 24;
        if (v74 == -240)
        {
          if (__p) {
            operator delete(__p);
          }
          if (a25) {
            operator delete(a25);
          }
          if (a28) {
            operator delete(a28);
          }
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

void sub_1A64463A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  for (; v41; v41 -= 24)
  {
    unint64_t v42 = *(void **)(&a41 + v41 - 24);
    if (v42)
    {
      *(void *)(&a41 + v41 - 16) = v42;
      operator delete(v42);
    }
  }
  JUMPOUT(0x1A6446344);
}

void sub_1A64463D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  for (; v71; v71 -= 24)
  {
    uint64_t v72 = *(void **)(&a71 + v71 - 24);
    if (v72)
    {
      *(void *)(&a71 + v71 - 16) = v72;
      operator delete(v72);
    }
  }
  JUMPOUT(0x1A644636CLL);
}

void Vec::Vec(Vec *this, unint64_t a2, double a3)
{
  double v3 = a3;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = 0;
  std::vector<double>::resize((uint64_t)this, a2, &v3);
}

void sub_1A644643C(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<double>::__append(void **a1, unint64_t a2, void *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      unint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      std::vector<double>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      unsigned int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v14);
    }
    else {
      unsigned int v15 = 0;
    }
    id v18 = &v15[8 * v12];
    double v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    double v21 = v18;
    do
    {
      *(void *)double v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    double v22 = &v15[8 * v14];
    id v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void sub_1A64469AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,void *a29)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy((uint64_t)&a28, a29);

  _Unwind_Resume(a1);
}

uint64_t std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>(uint64_t a1, unsigned char *a2)
{
  if (*(_DWORD *)(a1 + 24)) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(a1, a2);
  }
  else {
    *(unsigned char *)a1 = *a2;
  }
  return a1;
}

void sub_1A6446AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A6446D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19, void *a20)
{
  std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy((uint64_t)&a19, a20);
  _Unwind_Resume(a1);
}

_DWORD *std::variant<language_modeling::v1::SessionType,std::string>::operator=[abi:ne180100]<language_modeling::v1::SessionType,0,language_modeling::v1::SessionType,0ul,0>(_DWORD *a1, _DWORD *a2)
{
  if (a1[6]) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<0ul,language_modeling::v1::SessionType>(a1, a2);
  }
  else {
    *a1 = *a2;
  }
  return a1;
}

void sub_1A6446EC8(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void makeContext(NSArray *a1@<X0>, language_modeling::v1::LinguisticContext *a2@<X8>)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1;
  language_modeling::v1::LinguisticContext::LinguisticContext(a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  int v16 = 1;
  MEMORY[0x1AD0BB170](a2, __p);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v10 + 1) + 8 * v7);
        unint64_t v9 = (char *)objc_msgSend(v8, "UTF8String", (void)v10);
        if (v9)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, v9);
          int v16 = 0;
          MEMORY[0x1AD0BB170](a2, __p);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }
    while (v5);
  }
}

void sub_1A6447068(_Unwind_Exception *a1)
{
  language_modeling::v1::LinguisticContext::~LinguisticContext(v1);
  _Unwind_Resume(a1);
}

void sub_1A64471BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id wordSequenceForString(NSString *a1, NLTokenizer *a2)
{
  unint64_t v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  [(NLTokenizer *)v4 setString:v3];
  uint64_t v6 = [(NSString *)v3 length];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unint64_t v14 = ___ZL21wordSequenceForStringP8NSStringP11NLTokenizer_block_invoke;
  char v15 = &unk_1E5C54348;
  uint64_t v7 = v3;
  int v16 = v7;
  id v8 = v5;
  id v17 = v8;
  -[NLTokenizer enumerateTokensInRange:usingBlock:](v4, "enumerateTokensInRange:usingBlock:", 0, v6, &v12);
  -[NLTokenizer setString:](v4, "setString:", &stru_1EFB303D0, v12, v13, v14, v15);
  unint64_t v9 = v17;
  id v10 = v8;

  return v10;
}

void sub_1A6447318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A644752C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(a1);
}

void sub_1A64476DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&a15);

  _Unwind_Resume(a1);
}

void sub_1A64477E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A64478D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A64479DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A6447A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL21wordSequenceForStringP8NSStringP11NLTokenizer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");
}

void sub_1A6447B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_1EFB30290 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSF_1EJbSD_EEEEEEDcSH_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    id v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    unint64_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    void *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((unsigned char *)v7 + 56) = 0;
    *((_DWORD *)v7 + 20) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  char v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        id v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        char v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      char v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(uint64_t a1, std::string *this, std::string *__str)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::operator=(this, __str);
  }
  else
  {
    v3[0] = a1;
    v3[1] = (uint64_t)__str;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(std::__variant_detail::__alt<1ul,std::string> &,std::string&)::{unnamed type#1}::operator()[abi:ne180100](v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(std::__variant_detail::__alt<1ul,std::string> &,std::string&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*(char *)(v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *(void *)(v1 + 8));
  }
  else
  {
    long long v3 = *(_OWORD *)v1;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v1 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v3;
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v2, (long long *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1A644816C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_1EFB30290 + v4))(&v7, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  long long v5 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_1EFB30290 + v4))(&v6, a1);
  }
  *(unsigned char *)a1 = *a2;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    uint64_t v4 = *a3;
    std::string::__assign_external(this, v4);
  }
  else
  {
    v5[0] = a1;
    v5[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v5);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (long long *)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1A6448318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    char v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    char v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

void std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))*(&off_1EFB302A0 + v2))(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJN17language_modeling2v111SessionTypeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSI_1EJSA_SG_EEEEEEDcSK_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  char v7 = *v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    char v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    unint64_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    void *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    *((_DWORD *)v7 + 20) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

_DWORD *std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<0ul,language_modeling::v1::SessionType>(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4 = a1[6];
  if (v4 != -1) {
    ((void (*)(char *, _DWORD *))*(&off_1EFB302A0 + v4))(&v6, a1);
  }
  *a1 = *a2;
  a1[6] = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    uint64_t v4 = *a3;
    std::string::__assign_external(this, v4);
  }
  else
  {
    v5[0] = a1;
    v5[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v5);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (long long *)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1A644878C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))*(&off_1EFB302A0 + v4))(&v7, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  long long v5 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

language_modeling::v1::LanguageModelSession *std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](language_modeling::v1::LanguageModelSession **a1, language_modeling::v1::LanguageModelSession *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModelSession::~LanguageModelSession(result);
    JUMPOUT(0x1AD0BB590);
  }
  return result;
}

void sub_1A6448A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<BOOL ()(language_modeling::v1::Prediction const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_1A644960C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 256), 8);
  _Block_object_dispose((const void *)(v55 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t copySampleDataEnumerator(void *a1, unsigned char *a2)
{
  char v3 = [a1 nextInstance];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 instanceDictionary];
  }
  else
  {
    uint64_t v5 = 0;
    *a2 = 1;
  }

  return v5;
}

uint64_t rangesMatch(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  BOOL v5 = a1 == a3 && a2 == a4;
  if (a3 >= a1 && !v5)
  {
    unint64_t v6 = a3 + a4;
    unint64_t v7 = a1 + a2;
    if (a3 + a4 > a1 + a2) {
      goto LABEL_14;
    }
    return 1;
  }
  if (v5) {
    return 1;
  }
  unint64_t v7 = a1 + a2;
  unint64_t v6 = a3 + a4;
LABEL_14:
  BOOL v9 = a3 > a1;
  BOOL v10 = a3 < v7 && v6 >= v7;
  unsigned int v11 = v10;
  if (v10) {
    BOOL v9 = 1;
  }
  BOOL v12 = v6 > a1;
  if (v9) {
    return v11;
  }
  else {
    return v12;
  }
}

id mostRecentEmbedding(void *a1)
{
  uint64_t v1 = [a1 sortedArrayUsingComparator:&__block_literal_global_346];
  if ([v1 count])
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1A644CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

unint64_t maxTokensFromBatchComponents(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  unint64_t v7 = 0;
  if (v5)
  {
    if (a2)
    {
      uint64_t v8 = [a2 count];
      uint64_t v9 = [v5 count];
      unint64_t v7 = 0;
      if (v6)
      {
        if (v8 == v9)
        {
          uint64_t v10 = [v6 count];
          if (v10 == [v5 count] && objc_msgSend(v5, "count"))
          {
            unint64_t v7 = 0;
            unint64_t v11 = 0;
            do
            {
              BOOL v12 = [v5 objectAtIndex:v11];
              char v13 = [v6 objectAtIndex:v11];
              unint64_t v14 = [v12 count];
              unint64_t v15 = [v13 count];
              if (v14 >= v15) {
                unint64_t v16 = v15;
              }
              else {
                unint64_t v16 = v14;
              }
              if (v16 > v7) {
                unint64_t v7 = v16;
              }

              ++v11;
            }
            while (v11 < [v5 count]);
          }
          else
          {
            unint64_t v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

void sub_1A644F7E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A644FC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A6450124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __mostRecentEmbedding_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 revision];
  unint64_t v6 = [v4 revision];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

id NLGetLogCategory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && [v1 conformsToProtocol:&unk_1EFB3CC28])
  {
    uint64_t v3 = [(id)objc_opt_class() logCategory];
  }
  else
  {
    uint64_t v3 = +[NLLogCategory defaultCategory];
  }
  id v4 = (void *)v3;

  return v4;
}

__CFString *NLGetLogIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && [v1 conformsToProtocol:&unk_1EFB3CC28]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v3 = NSString;
    id v4 = [v2 logIdentifier];
    unint64_t v5 = [v3 stringWithFormat:@"[%@] ", v4];
  }
  else
  {
    unint64_t v5 = &stru_1EFB303D0;
  }

  return v5;
}

__CFString *NLBooleanToString(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void ME_Model::backtracking_line_search(ME_Model *this, const Vec *a2, double **a3, double a4, const Vec *a5, Vec *a6, double **a7)
{
  uint64_t v15 = *(void *)a5;
  uint64_t v14 = *((void *)a5 + 1);
  double v16 = 2.0;
  do
  {
    double v16 = v16 * 0.5;
    Vec::Vec((Vec *)v39, (v14 - v15) >> 3, 0.0);
    uint64_t v17 = *(double **)a5;
    uint64_t v18 = *((void *)a5 + 1) - *(void *)a5;
    if (v18)
    {
      unint64_t v19 = v18 >> 3;
      uint64_t v20 = (double *)v39[0];
      if (v19 <= 1) {
        unint64_t v19 = 1;
      }
      do
      {
        double v21 = *v17++;
        *v20++ = v16 * v21;
        --v19;
      }
      while (v19);
    }
    Vec::Vec((Vec *)&__p, (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3, 0.0);
    double v22 = *(double **)a2;
    id v23 = (char *)__p;
    uint64_t v24 = *((void *)a2 + 1) - *(void *)a2;
    if (v24)
    {
      unint64_t v25 = v24 >> 3;
      id v26 = (double *)v39[0];
      if (v25 <= 1) {
        unint64_t v25 = 1;
      }
      double v27 = (double *)__p;
      do
      {
        double v28 = *v22++;
        double v29 = v28;
        double v30 = *v26++;
        *v27++ = v29 + v30;
        --v25;
      }
      while (v25);
    }
    if (&__p != (void **)a6)
    {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a6, v23, (uint64_t)v41, (v41 - v23) >> 3);
      id v23 = (char *)__p;
    }
    if (v23)
    {
      uint64_t v41 = v23;
      operator delete(v23);
    }
    if (v39[0])
    {
      v39[1] = v39[0];
      operator delete(v39[0]);
    }
    double v31 = ME_Model::FunctionGradient(this, (uint64_t)a6, a7);
    uint64_t v15 = *(void *)a5;
    uint64_t v14 = *((void *)a5 + 1);
    if (v14 == *(void *)a5)
    {
      double v34 = 0.0;
    }
    else
    {
      unint64_t v32 = (v14 - *(void *)a5) >> 3;
      double v33 = *a3;
      if (v32 <= 1) {
        unint64_t v32 = 1;
      }
      double v34 = 0.0;
      double v35 = *(double **)a5;
      do
      {
        double v36 = *v35++;
        double v37 = v36;
        double v38 = *v33++;
        double v34 = v34 + v37 * v38;
        --v32;
      }
      while (v32);
    }
  }
  while (v31 > a4 + v16 * 0.1 * v34);
}

void sub_1A6453BCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a9) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void approximate_Hg(const Vec *a1@<X1>, const Vec *a2@<X2>, const Vec *a3@<X3>, const double *a4@<X4>, int a5@<W0>, double **a6@<X8>)
{
  v71[10] = *MEMORY[0x1E4F143B8];
  unsigned int v66 = a5 - 1;
  if (a5 >= 11) {
    uint64_t v10 = 9;
  }
  else {
    uint64_t v10 = (a5 - 1);
  }
  if (a5 >= 11) {
    int v11 = a5 - 10;
  }
  else {
    int v11 = 0;
  }
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a6, *(const void **)a1, *((void *)a1 + 1), (uint64_t)(*((void *)a1 + 1) - *(void *)a1) >> 3);
  int v68 = v10;
  if ((v10 & 0x80000000) == 0)
  {
    do
    {
      int v12 = (v11 + (int)v10) % 10;
      uint64_t v13 = (double *)*((void *)a2 + 3 * v12);
      double v14 = 0.0;
      uint64_t v15 = *((void *)a2 + 3 * v12 + 1) - (void)v13;
      if (v15)
      {
        unint64_t v16 = v15 >> 3;
        uint64_t v17 = *a6;
        if (v16 <= 1) {
          unint64_t v16 = 1;
        }
        do
        {
          double v18 = *v13++;
          double v19 = v18;
          double v20 = *v17++;
          double v14 = v14 + v19 * v20;
          --v16;
        }
        while (v16);
      }
      double v21 = a4[v12];
      *(double *)&v71[v10] = v21 * v14;
      double v22 = (double **)((char *)a3 + 24 * v12);
      Vec::Vec((Vec *)&__p, v22[1] - *v22, 0.0);
      id v23 = *v22;
      uint64_t v24 = (char *)v22[1] - (char *)*v22;
      if (v24)
      {
        unint64_t v25 = v24 >> 3;
        id v26 = (double *)__p;
        if (v25 <= 1) {
          unint64_t v25 = 1;
        }
        do
        {
          double v27 = *v23++;
          *v26++ = v27 * -(v21 * v14);
          --v25;
        }
        while (v25);
      }
      double v28 = *a6;
      uint64_t v29 = (char *)a6[1] - (char *)*a6;
      if (v29)
      {
        unint64_t v30 = v29 >> 3;
        double v31 = (double *)__p;
        if (v30 <= 1) {
          unint64_t v30 = 1;
        }
        do
        {
          double v32 = *v31++;
          *double v28 = v32 + *v28;
          ++v28;
          --v30;
        }
        while (v30);
      }
      if (__p)
      {
        double v70 = __p;
        operator delete(__p);
      }
    }
    while (v10-- > 0);
  }
  if (a5 > 0)
  {
    double v34 = (double *)*((void *)a3 + 3 * (v66 % 0xA));
    uint64_t v35 = *((void *)a3 + 3 * (v66 % 0xA) + 1) - (void)v34;
    if (v35)
    {
      unint64_t v36 = v35 >> 3;
      if (v36 <= 1) {
        unint64_t v36 = 1;
      }
      double v37 = 0.0;
      do
      {
        double v38 = *v34++;
        double v37 = v37 + v38 * v38;
        --v36;
      }
      while (v36);
    }
    else
    {
      double v37 = 0.0;
    }
    double v39 = *a6;
    uint64_t v40 = (char *)a6[1] - (char *)*a6;
    if (v40)
    {
      double v41 = 1.0 / a4[v66 % 0xA] / v37;
      uint64_t v42 = v40 >> 3;
      if ((unint64_t)(v40 >> 3) <= 1) {
        uint64_t v42 = 1;
      }
      do
      {
        *double v39 = v41 * *v39;
        ++v39;
        --v42;
      }
      while (v42);
    }
  }
  if ((v68 & 0x80000000) == 0)
  {
    uint64_t v43 = 0;
    do
    {
      int v44 = (v11 + (int)v43) % 10;
      double v45 = (double *)*((void *)a3 + 3 * v44);
      double v46 = 0.0;
      uint64_t v47 = *((void *)a3 + 3 * v44 + 1) - (void)v45;
      if (v47)
      {
        unint64_t v48 = v47 >> 3;
        uint64_t v49 = *a6;
        if (v48 <= 1) {
          unint64_t v48 = 1;
        }
        do
        {
          double v50 = *v45++;
          double v51 = v50;
          double v52 = *v49++;
          double v46 = v46 + v51 * v52;
          --v48;
        }
        while (v48);
      }
      double v53 = a4[v44];
      uint64_t v54 = (double **)((char *)a2 + 24 * v44);
      double v55 = *(double *)&v71[v43];
      Vec::Vec((Vec *)&__p, v54[1] - *v54, 0.0);
      long long v56 = *v54;
      uint64_t v57 = (char *)v54[1] - (char *)*v54;
      if (v57)
      {
        unint64_t v58 = v57 >> 3;
        uint64_t v59 = (double *)__p;
        if (v58 <= 1) {
          unint64_t v58 = 1;
        }
        do
        {
          double v60 = *v56++;
          *v59++ = (v55 - v53 * v46) * v60;
          --v58;
        }
        while (v58);
      }
      double v61 = *a6;
      uint64_t v62 = (char *)a6[1] - (char *)*a6;
      if (v62)
      {
        unint64_t v63 = v62 >> 3;
        v64 = (double *)__p;
        if (v63 <= 1) {
          unint64_t v63 = 1;
        }
        do
        {
          double v65 = *v64++;
          *double v61 = v65 + *v61;
          ++v61;
          --v63;
        }
        while (v63);
      }
      if (__p)
      {
        double v70 = __p;
        operator delete(__p);
      }
      ++v43;
    }
    while (v43 != v68 + 1);
  }
}

void sub_1A6453FB4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void ME_Model::perform_LBFGS(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *(const void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  unint64_t v9 = (v7 - (uint64_t)v6) >> 3;
  unsigned int v66 = 0;
  v67 = 0;
  uint64_t v68 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v66, v6, v7, v9);
  Vec::Vec((Vec *)&v64, v9, 0.0);
  Vec::Vec((Vec *)v63, v9, 0.0);
  double v10 = ME_Model::FunctionGradient((ME_Model *)a1, (uint64_t)&v66, (double **)&v64);
  for (uint64_t i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v73[i], 0, 0.0);
  for (uint64_t j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v72[j], 0, 0.0);
  if (LBFGS_MAX_ITER >= 1)
  {
    int v13 = 0;
    uint64_t v14 = 1;
    double v15 = 1.0;
    do
    {
      int v16 = *(_DWORD *)(a1 + 24);
      if (v16 >= 1 && (int)v14 > v16) {
        break;
      }
      if (a3)
      {
        if ((v13 & 1) == 0)
        {
          double v18 = *(double *)(a1 + 384);
          if (v18 < v15 && (v18 > 0.0 || v15 > 0.05))
          {
            snprintf(__str, 0x100uLL, "Iteration %d training accuracy %.6f", v14, 1.0 - v18);
            float v19 = 1.0 - *(double *)(a1 + 384);
            (*(void (**)(uint64_t, char *, uint64_t, float))(a3 + 16))(a3, __str, v14, v19);
            double v15 = *(double *)(a1 + 384);
            uint64_t v14 = (v14 + 1);
          }
        }
      }
      double v20 = (double *)v64;
      if (v65 == v64)
      {
        double v22 = 0.0;
      }
      else
      {
        unint64_t v21 = (v65 - (unsigned char *)v64) >> 3;
        if (v21 <= 1) {
          unint64_t v21 = 1;
        }
        double v22 = 0.0;
        do
        {
          double v23 = *v20++;
          double v22 = v22 + v23 * v23;
          --v21;
        }
        while (v21);
      }
      if (sqrt(v22) < 0.0001) {
        break;
      }
      approximate_Hg((const Vec *)&v64, (const Vec *)v73, (const Vec *)v72, v71, v13, (double **)&__p);
      Vec::Vec((Vec *)__str, (v62 - (unsigned char *)__p) >> 3, 0.0);
      uint64_t v24 = (double *)__p;
      if (v62 != __p)
      {
        unint64_t v25 = (v62 - (unsigned char *)__p) >> 3;
        id v26 = *(char **)__str;
        if (v25 <= 1) {
          unint64_t v25 = 1;
        }
        do
        {
          double v27 = *v24++;
          *(double *)id v26 = -v27;
          v26 += 8;
          --v25;
        }
        while (v25);
      }
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v63, *(char **)__str, (uint64_t)v70, (uint64_t)&v70[-*(void *)__str] >> 3);
      if (*(void *)__str)
      {
        double v70 = *(char **)__str;
        operator delete(*(void **)__str);
      }
      if (__p)
      {
        uint64_t v62 = __p;
        operator delete(__p);
      }
      Vec::Vec((Vec *)__str, v9, 0.0);
      Vec::Vec((Vec *)&__p, v9, 0.0);
      ME_Model::backtracking_line_search((ME_Model *)a1, (const Vec *)&v66, (double **)&v64, v10, (const Vec *)v63, (Vec *)__str, (double **)&__p);
      double v10 = v28;
      Vec::Vec((Vec *)&v59, (uint64_t)&v70[-*(void *)__str] >> 3, 0.0);
      uint64_t v29 = *(char **)__str;
      if (v70 != *(char **)__str)
      {
        unint64_t v30 = (uint64_t)&v70[-*(void *)__str] >> 3;
        double v31 = (double *)v66;
        double v32 = (double *)v59;
        if (v30 <= 1) {
          unint64_t v30 = 1;
        }
        do
        {
          double v33 = *(double *)v29;
          v29 += 8;
          double v34 = v33;
          double v35 = *v31++;
          *v32++ = v34 - v35;
          --v30;
        }
        while (v30);
      }
      uint64_t v36 = v13 % 0xAu;
      double v37 = (void **)&v73[24 * v36];
      if (v37 != &v59) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v73[24 * v36], (char *)v59, (uint64_t)v60, (v60 - (unsigned char *)v59) >> 3);
      }
      if (v59)
      {
        double v60 = v59;
        operator delete(v59);
      }
      Vec::Vec((Vec *)&v59, (v62 - (unsigned char *)__p) >> 3, 0.0);
      double v38 = (double *)__p;
      if (v62 != __p)
      {
        unint64_t v39 = (v62 - (unsigned char *)__p) >> 3;
        uint64_t v40 = (double *)v64;
        double v41 = (double *)v59;
        if (v39 <= 1) {
          unint64_t v39 = 1;
        }
        do
        {
          double v42 = *v38++;
          double v43 = v42;
          double v44 = *v40++;
          *v41++ = v43 - v44;
          --v39;
        }
        while (v39);
      }
      double v45 = (void **)&v72[24 * v36];
      if (v45 != &v59) {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v72[24 * v36], (char *)v59, (uint64_t)v60, (v60 - (unsigned char *)v59) >> 3);
      }
      if (v59)
      {
        double v60 = v59;
        operator delete(v59);
      }
      double v46 = (double *)*v45;
      uint64_t v47 = (unsigned char *)v45[1] - (unsigned char *)*v45;
      if (v47)
      {
        unint64_t v48 = v47 >> 3;
        uint64_t v49 = (double *)*v37;
        if (v48 <= 1) {
          unint64_t v48 = 1;
        }
        double v50 = 0.0;
        do
        {
          double v51 = *v46++;
          double v52 = v51;
          double v53 = *v49++;
          double v50 = v50 + v52 * v53;
          --v48;
        }
        while (v48);
      }
      else
      {
        double v50 = 0.0;
      }
      v71[v36] = 1.0 / v50;
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v66, *(char **)__str, (uint64_t)v70, (uint64_t)&v70[-*(void *)__str] >> 3);
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v64, (char *)__p, (uint64_t)v62, (v62 - (unsigned char *)__p) >> 3);
      if (__p)
      {
        uint64_t v62 = __p;
        operator delete(__p);
      }
      if (*(void *)__str)
      {
        double v70 = *(char **)__str;
        operator delete(*(void **)__str);
      }
      ++v13;
    }
    while (v13 < LBFGS_MAX_ITER);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a4, v66, (uint64_t)v67, (v67 - (unsigned char *)v66) >> 3);
  for (uint64_t k = 0; k != -240; k -= 24)
  {
    double v55 = *(void **)&v72[k + 216];
    if (v55)
    {
      *(void *)&v72[k + 224] = v55;
      operator delete(v55);
    }
  }
  for (uint64_t m = 0; m != -240; m -= 24)
  {
    uint64_t v57 = *(void **)&v73[m + 216];
    if (v57)
    {
      *(void *)&v73[m + 224] = v57;
      operator delete(v57);
    }
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v64)
  {
    double v65 = v64;
    operator delete(v64);
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
}

void sub_1A6454540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t v72 = 0;
  while (1)
  {
    v73 = *(void **)(&a71 + v72 + 216);
    if (v73)
    {
      *(void *)(&a71 + v72 + 224) = v73;
      operator delete(v73);
    }
    v72 -= 24;
    if (v72 == -240)
    {
      uint64_t v74 = 0;
      while (1)
      {
        v75 = *(void **)((char *)&STACK[0x2E0] + v74 + 216);
        if (v75)
        {
          *(unint64_t *)((char *)&STACK[0x2E0] + v74 + 224) = (unint64_t)v75;
          operator delete(v75);
        }
        v74 -= 24;
        if (v74 == -240)
        {
          if (__p) {
            operator delete(__p);
          }
          if (a23) {
            operator delete(a23);
          }
          if (a26) {
            operator delete(a26);
          }
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

void sub_1A6454678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  for (; v71; v71 -= 24)
  {
    uint64_t v72 = *(void **)(&a71 + v71 - 24);
    if (v72)
    {
      *(void *)(&a71 + v71 - 16) = v72;
      operator delete(v72);
    }
  }
  JUMPOUT(0x1A6454618);
}

void sub_1A64546A4()
{
  for (; v0; v0 -= 24)
  {
    uint64_t v1 = *(void **)((char *)&STACK[0x2E0] + v0 - 24);
    if (v1)
    {
      *(unint64_t *)((char *)&STACK[0x2E0] + v0 - 16) = (unint64_t)v1;
      operator delete(v1);
    }
  }
  JUMPOUT(0x1A6454640);
}

void requestContextualEmbeddingAssetsForEmbedding(void *a1)
{
  id v1 = a1;
  if (([v1 hasAvailableAssets] & 1) == 0)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __requestContextualEmbeddingAssetsForEmbedding_block_invoke;
    v2[3] = &unk_1E5C545D0;
    id v3 = v1;
    [v3 requestEmbeddingAssetsWithCompletionHandler:v2];
  }
}

void sub_1A64558FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 208), 8);
  _Block_object_dispose((const void *)(v65 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t copySampleDataEnumerator_0(void *a1, unsigned char *a2)
{
  id v3 = [a1 nextInstance];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 instanceDictionary];
  }
  else
  {
    uint64_t v5 = 0;
    *a2 = 1;
  }

  return v5;
}

void __requestContextualEmbeddingAssetsForEmbedding_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v6 = v5;
    NSLog(&cfstr_FailedToLoadAs.isa, *(void *)(a1 + 32), v5);
  }
  else if (a2 == 1)
  {
    id v6 = v5;
    NSLog(&cfstr_AssetsNotAvail.isa, *(void *)(a1 + 32));
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    id v6 = v5;
    NSLog(&cfstr_AssetsAreNowAv.isa, *(void *)(a1 + 32));
  }
  id v5 = v6;
LABEL_8:
}

id _parameterValuesForHyperTuneValues(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = a1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    unint64_t v6 = 0x1E4F28000uLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v9 = [v2 objectForKey:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 count] == 1)
          {
            [v10 firstObject];
            v12 = unint64_t v11 = v6;
            [v14 setObject:v12 forKey:v8];

            unint64_t v6 = v11;
          }
          else
          {
            [v14 setObject:v10 forKey:v8];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 setObject:v9 forKey:v8];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return v14;
}

void createMRLModelFromTrainingDataSet(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v28[3] = *(float **)MEMORY[0x1E4F143B8];
  id v6 = a1;
  id v22 = a4;
  v28[0] = 0;
  v27[0] = 0;
  v27[1] = 0;
  v26[1] = 0;
  v26[0] = [v6 numberOfTrainingInstances];
  unint64_t v25 = [v6 numberOfValidationInstances];
  [v6 numberOfLabels];
  [v6 numberOfVocabularyEntries];
  objc_alloc_init(NLNumberGenerator);
  uint64_t v23 = [v6 labelMap];
  uint64_t v24 = [v6 vocabularyMap];
  unint64_t v21 = [MEMORY[0x1E4F28E78] string];
  uint64_t v20 = [MEMORY[0x1E4F28E78] string];
  if (v26[0])
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = a3;
    do
    {
      id v10 = [v6 trainingInstanceAtIndex:v7];
      unint64_t v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 formattedLineWithLabelMap:v23 vocabularyMap:v24];
        int v13 = (void *)v12;
        if (v12)
        {
          [(NSString *)v21 appendFormat:@"%@\n", v12];
          unint64_t v14 = v9 / v26[0];
          if (v9 / v26[0] > v8) {
            reportInstanceCompletionToTrainer(v22, v9 / v26[0], a3, 2);
          }
        }
        else
        {
          unint64_t v14 = v8;
        }

        unint64_t v8 = v14;
      }

      ++v7;
      v9 += a3;
    }
    while (v7 < v26[0]);
  }
  if (v25)
  {
    for (unint64_t i = 0; i < v25; ++i)
    {
      long long v16 = [v6 validationInstanceAtIndex:i];
      long long v17 = v16;
      if (v16)
      {
        uint64_t v18 = [v16 formattedLineWithLabelMap:v23 vocabularyMap:v24];
        float v19 = (void *)v18;
        if (v18) {
          [(NSString *)v20 appendFormat:@"%@\n", v18];
        }
      }
    }
  }
  prepareData(v21, (const float **)v28, (const int **)v27, v26);
}

void sub_1A6461658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void prepareData(NSString *a1, const float **a2, const int **a3, unint64_t *a4)
{
  uint64_t v4 = a1;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke;
  v5[3] = &unk_1E5C54828;
  v5[4] = v7;
  [(NSString *)v4 enumerateLinesUsingBlock:v5];
  operator new[]();
}

void sub_1A6461918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 96), 8);

  _Unwind_Resume(a1);
}

void prepareInputVectors(const float *a1)
{
}

void prepareOutputLabels(const int *a1)
{
}

void *freeInputVectors(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    do
    {
      if (*v3) {
        MEMORY[0x1AD0BB570](*v3, 0xC0C80B8AA526DLL);
      }
      ++v3;
      --v2;
    }
    while (v2);
LABEL_8:
    JUMPOUT(0x1AD0BB570);
  }
  if (result) {
    goto LABEL_8;
  }
  return result;
}

uint64_t freeData(uint64_t result, const int *a2)
{
  if (result) {
    uint64_t result = MEMORY[0x1AD0BB570](result, 0x1000C8052888210);
  }
  if (a2)
  {
    JUMPOUT(0x1AD0BB570);
  }
  return result;
}

void ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 componentsSeparatedByString:@"\t"];
  if ([v7 count] == 2)
  {
    uint64_t v3 = [v7 objectAtIndex:0];
    uint64_t v4 = [v3 componentsSeparatedByString:@" "];

    uint64_t v5 = [v7 objectAtIndex:1];
    id v6 = [v5 componentsSeparatedByString:@" "];

    if ([v4 count] == 32 && objc_msgSend(v6, "count") == 32) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

void sub_1A6461CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke_2(void *a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = [v14 componentsSeparatedByString:@"\t"];
  if ([v3 count] == 2)
  {
    uint64_t v4 = [v3 objectAtIndex:0];
    uint64_t v5 = [v4 componentsSeparatedByString:@" "];

    id v6 = [v3 objectAtIndex:1];
    id v7 = [v6 componentsSeparatedByString:@" "];

    if ([v5 count] == 32 && objc_msgSend(v7, "count") == 32)
    {
      for (uint64_t i = 0; i != 32; ++i)
      {
        unint64_t v9 = [v5 objectAtIndex:i];
        [v9 floatValue];
        int v11 = v10;

        uint64_t v12 = [v7 objectAtIndex:i];
        int v13 = [v12 intValue];

        *(_DWORD *)(a1[5] + (*(void *)(*(void *)(a1[4] + 8) + 24) << 7) + 4 * i) = v11;
        *(_DWORD *)(a1[6] + (*(void *)(*(void *)(a1[4] + 8) + 24) << 7) + 4 * i) = v13;
      }
      ++*(void *)(*(void *)(a1[4] + 8) + 24);
    }
  }
}

void sub_1A6461EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void requestWordEmbeddingAssetsForLanguage(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  uint64_t v3[2] = __requestWordEmbeddingAssetsForLanguage_block_invoke;
  v3[3] = &unk_1E5C545D0;
  id v4 = v1;
  id v2 = v1;
  +[NLTagger requestAssetsForLanguage:v2 tagScheme:@"WordEmbedding" completionHandler:v3];
}

void requestContextualEmbeddingAssetsForEmbedding_0(void *a1)
{
  id v1 = a1;
  if (([v1 hasAvailableAssets] & 1) == 0)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __requestContextualEmbeddingAssetsForEmbedding_block_invoke_0;
    v2[3] = &unk_1E5C545D0;
    id v3 = v1;
    [v3 requestEmbeddingAssetsWithCompletionHandler:v2];
  }
}

void sub_1A6464004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

CFMutableDictionaryRef copySampleDataEnumerator_1(void *a1, unint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, unsigned char *a9)
{
  id v16 = a1;
  id v42 = a4;
  id v17 = a5;
  id v18 = a6;
  id v44 = a7;
  float v19 = [MEMORY[0x1E4F1CA48] array];
  double v45 = [MEMORY[0x1E4F1CA48] array];
  int value = [MEMORY[0x1E4F1CA48] array];
  if (a3) {
    [v16 rewindAndShuffle:a8];
  }
  uint64_t v20 = [v16 index];
  unint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%llu->%llu", v20, a2 + v20 - 1);
  CFDictionaryRef v22 = [v44 objectForKey:v21];

  if (v22)
  {
    for (CFMutableDictionaryRef i = CFDictionaryCreateMutableCopy(0, 0, v22); a2; --a2)
      id v24 = (id)[v16 nextInstance];
LABEL_20:
    uint64_t v36 = v42;
    goto LABEL_26;
  }
  uint64_t v41 = v20;
  uint64_t v40 = a2 + v20 - 1;
  if ([v19 count] < a2)
  {
    while (1)
    {
      unint64_t v25 = [v16 nextInstance];
      CFMutableDictionaryRef i = v25;
      if (!v25) {
        break;
      }
      id v26 = [(__CFDictionary *)v25 tokens];
      double v27 = v26;
      if (v17) {
        normalizedQuoteTokens(v26);
      }
      else {
      double v28 = formattedTokens(v26);
      }

      uint64_t v29 = [(__CFDictionary *)i label];
      unint64_t v30 = [v18 objectForKey:v29];

      uint64_t v31 = [v30 unsignedIntegerValue];
      if (v30)
      {
        uint64_t v32 = v31;
        if (v31)
        {
          if ([v28 count])
          {
            [v19 addObject:v28];
            double v33 = [(__CFDictionary *)i string];
            [v45 addObject:v33];

            double v34 = [NSNumber numberWithUnsignedInteger:v32 - 1];
            [value addObject:v34];

            CFDictionaryRef v22 = 0;
          }
        }
      }

      if ([v19 count] >= a2) {
        goto LABEL_17;
      }
    }
    *a9 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (v17)
  {
    double v35 = [v17 vectorsForTokenizedSentences:v19 untokenizedSentences:v45 maxTokens:50];
    uint64_t v36 = v42;
  }
  else
  {
    uint64_t v36 = v42;
    double v35 = [v42 vectorsForTokenizedSentences:v19 untokenizedSentences:v45 maxTokens:50];
  }
  if (v35)
  {
    CFMutableDictionaryRef i = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(i, (const void *)*MEMORY[0x1E4F78DD0], v35);
    CFDictionaryAddValue(i, (const void *)*MEMORY[0x1E4F78DD8], value);
    double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:i];
    double v38 = objc_msgSend(NSString, "stringWithFormat:", @"%llu->%llu", v41, v40);
    [v44 setObject:v37 forKey:v38];

    CFDictionaryRef v22 = 0;
  }
  else
  {
    CFMutableDictionaryRef i = 0;
  }

LABEL_26:
  return i;
}

id normalizedQuoteTokens(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      unint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      if ((unint64_t)objc_msgSend(v2, "count", (void)v13) > 0x27) {
        break;
      }
      id v9 = v8;
      [v9 rangeOfString:@"’"];
      if (v10)
      {
        uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        id v9 = (id)v11;
      }
      [v2 addObject:v9];

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v2;
}

id formattedTokens(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA48] array];
  if (formattedTokens_onceToken != -1) {
    dispatch_once(&formattedTokens_onceToken, &__block_literal_global_9);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      uint64_t v21 = v4;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        if ((unint64_t)objc_msgSend(v2, "count", v20) <= 0x31)
        {
          [v7 rangeOfCharacterFromSet:formattedTokens_alphanumericCharacterSet];
          if (v8)
          {
            uint64_t v23 = v6;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v9 = [v7 componentsSeparatedByCharactersInSet:formattedTokens_internalSeparatorCharacterSet];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v25;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v25 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                  if ((unint64_t)[v2 count] <= 0x31)
                  {
                    [v14 rangeOfCharacterFromSet:formattedTokens_alphanumericCharacterSet];
                    if (v15)
                    {
                      long long v16 = [v14 lowercaseString];
                      [v16 rangeOfString:@"’"];
                      if (v17)
                      {
                        uint64_t v18 = [v16 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

                        long long v16 = (void *)v18;
                      }
                      [v2 addObject:v16];
                    }
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v11);
            }

            uint64_t v5 = v20;
            uint64_t v4 = v21;
            uint64_t v6 = v23;
          }
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }

  return v2;
}

void __requestWordEmbeddingAssetsForLanguage_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v6 = v5;
    NSLog(&cfstr_FailedToLoadEm_5.isa, *(void *)(a1 + 32), v5);
  }
  else if (a2 == 1)
  {
    id v6 = v5;
    NSLog(&cfstr_EmbeddingAsset_0.isa, *(void *)(a1 + 32));
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    id v6 = v5;
    NSLog(&cfstr_EmbeddingAsset.isa, *(void *)(a1 + 32));
  }
  id v5 = v6;
LABEL_8:
}

void __requestContextualEmbeddingAssetsForEmbedding_block_invoke_0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 2)
  {
    id v6 = v5;
    NSLog(&cfstr_FailedToLoadAs.isa, *(void *)(a1 + 32), v5);
  }
  else if (a2 == 1)
  {
    id v6 = v5;
    NSLog(&cfstr_AssetsNotAvail.isa, *(void *)(a1 + 32));
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    id v6 = v5;
    NSLog(&cfstr_AssetsAreNowAv.isa, *(void *)(a1 + 32));
  }
  id v5 = v6;
LABEL_8:
}

uint64_t __formattedTokens_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  id v1 = (void *)formattedTokens_alphanumericCharacterSet;
  formattedTokens_alphanumericCharacterSet = v0;

  formattedTokens_internalSeparatorCharacterSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".,;-_/"];

  return MEMORY[0x1F41817F8]();
}

uint64_t compileModel()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1F4113C88]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t CoreLMCopyConditionalProbabilities()
{
  return MEMORY[0x1F4113EB0]();
}

uint64_t CoreLMCopyPredictions()
{
  return MEMORY[0x1F4113EB8]();
}

uint64_t CoreLMCopyTokenIdsForText()
{
  return MEMORY[0x1F4113EC0]();
}

uint64_t CoreLMCreate()
{
  return MEMORY[0x1F4113ED0]();
}

uint64_t CoreLMCreateCopy()
{
  return MEMORY[0x1F4113ED8]();
}

uint64_t CoreLMReset()
{
  return MEMORY[0x1F4113EF0]();
}

uint64_t CoreLMUpdateWithContext()
{
  return MEMORY[0x1F4113F00]();
}

uint64_t HTTuneParameters()
{
  return MEMORY[0x1F4130338]();
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x1F412A878]();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return MEMORY[0x1F412A148]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x1F412A158]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x1F412A170]();
}

uint64_t LMLanguageModelEnumeratePredictionsWithBlock()
{
  return MEMORY[0x1F412A188]();
}

uint64_t LMLanguageModelGetTokenIDForUTF8String()
{
  return MEMORY[0x1F412A1A8]();
}

uint64_t LMLanguageModelGetUsageCount()
{
  return MEMORY[0x1F412A1B0]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x1F412A1E0]();
}

uint64_t LMLanguageModelTokenSequenceIsBlocklisted()
{
  return MEMORY[0x1F412A220]();
}

uint64_t LXCursorCopyTraversedCharacters()
{
  return MEMORY[0x1F412A610]();
}

uint64_t LXCursorCreateByAdvancing()
{
  return MEMORY[0x1F412A618]();
}

uint64_t LXCursorEnumerateChildren()
{
  return MEMORY[0x1F412A628]();
}

uint64_t LXCursorEnumerateEntries()
{
  return MEMORY[0x1F412A630]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x1F412A638]();
}

uint64_t LXCursorHasChildren()
{
  return MEMORY[0x1F412A648]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x1F412A650]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D8]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1F412A6F0]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x1F412A700]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x1F412A750]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A768]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x1F412A778]();
}

uint64_t MLPModelTrainerCreate()
{
  return MEMORY[0x1F4130340]();
}

uint64_t MLPModelTrainerEvaluateModel()
{
  return MEMORY[0x1F4130348]();
}

uint64_t MLPModelTrainerTrainModel()
{
  return MEMORY[0x1F4130350]();
}

uint64_t MRLModelCompile()
{
  return MEMORY[0x1F4130358]();
}

uint64_t MRLModelCopyQuantizedSerializedData()
{
  return MEMORY[0x1F4130360]();
}

uint64_t MRLModelCreate()
{
  return MEMORY[0x1F4130368]();
}

uint64_t MRLModelEvaluate()
{
  return MEMORY[0x1F4130370]();
}

uint64_t MRLModelGetOutputSize()
{
  return MEMORY[0x1F4130380]();
}

uint64_t MRLModelInitEpoch()
{
  return MEMORY[0x1F4130388]();
}

uint64_t MRLModelRecognize()
{
  return MEMORY[0x1F4130390]();
}

uint64_t MRLModelSetMaxSequenceLength()
{
  return MEMORY[0x1F41303A8]();
}

uint64_t MRLModelTrainBatch()
{
  return MEMORY[0x1F41303C0]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x1F41303D8]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x1F41303E8]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x1F4130400]();
}

uint64_t MRLNeuralNetworkSetInput()
{
  return MEMORY[0x1F4130410]();
}

uint64_t NLEmbeddingSubwordVocabCopyTextForTokenIds()
{
  return MEMORY[0x1F4113F18]();
}

uint64_t NLEmbeddingSubwordVocabCopyTokenIdsForText()
{
  return MEMORY[0x1F4113F20]();
}

uint64_t NLEmbeddingSubwordVocabCreate()
{
  return MEMORY[0x1F4113F28]();
}

uint64_t NLGazetteerCopyAvailableLabels()
{
  return MEMORY[0x1F4113F30]();
}

uint64_t NLGazetteerCopyCompressedModel()
{
  return MEMORY[0x1F4113F38]();
}

uint64_t NLGazetteerCopyLabel()
{
  return MEMORY[0x1F4113F40]();
}

uint64_t NLGazetteerCreate()
{
  return MEMORY[0x1F4113F48]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1F4113F60]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1F4113F68]();
}

uint64_t NLLanguageIdentifierGetTopHypothesis()
{
  return MEMORY[0x1F4113F70]();
}

uint64_t NLLanguageIdentifierGetTopLanguage()
{
  return MEMORY[0x1F4113F78]();
}

uint64_t NLLanguageIdentifierRelease()
{
  return MEMORY[0x1F4113F80]();
}

uint64_t NLLanguageIdentifierSetLanguageConstraints()
{
  return MEMORY[0x1F4113F98]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1F4113FA0]();
}

uint64_t NLModelContainerCopyContainerData()
{
  return MEMORY[0x1F4113FA8]();
}

uint64_t NLModelContainerCopyInfoDictionary()
{
  return MEMORY[0x1F4113FB0]();
}

uint64_t NLModelContainerCopyModelDataAtIndex()
{
  return MEMORY[0x1F4113FB8]();
}

uint64_t NLModelContainerCreate()
{
  return MEMORY[0x1F4113FC0]();
}

uint64_t NLModelContainerCreateWithContainerData()
{
  return MEMORY[0x1F4113FC8]();
}

uint64_t NLModelContainerGetModelDataCount()
{
  return MEMORY[0x1F4113FD0]();
}

uint64_t NLModelContainerGetRevision()
{
  return MEMORY[0x1F4113FD8]();
}

uint64_t NLModelContainerGetSubtype()
{
  return MEMORY[0x1F4113FE0]();
}

uint64_t NLModelContainerGetType()
{
  return MEMORY[0x1F4113FE8]();
}

uint64_t NLModelCopyContainer()
{
  return MEMORY[0x1F4113FF0]();
}

uint64_t NLModelCopyPredictedLabels()
{
  return MEMORY[0x1F4113FF8]();
}

uint64_t NLModelCopyPredictedLabelsAndProbabilities()
{
  return MEMORY[0x1F4114000]();
}

uint64_t NLModelCreateWithContainer()
{
  return MEMORY[0x1F4114008]();
}

uint64_t NLModelTrainerCreate()
{
  return MEMORY[0x1F4114010]();
}

uint64_t NLModelTrainerTrainAndCopyContainer()
{
  return MEMORY[0x1F4114018]();
}

uint64_t NLStringEmbeddingCopyCurrentVersion()
{
  return MEMORY[0x1F4114020]();
}

uint64_t NLStringEmbeddingCopyData()
{
  return MEMORY[0x1F4114028]();
}

uint64_t NLStringEmbeddingCopyDataForTokenizedBatch()
{
  return MEMORY[0x1F4114030]();
}

uint64_t NLStringEmbeddingCopyModelLocale()
{
  return MEMORY[0x1F4114038]();
}

uint64_t NLStringEmbeddingCopyNeighborsForVectorWithDistances()
{
  return MEMORY[0x1F4114048]();
}

uint64_t NLStringEmbeddingCopyNeighborsWithDistances()
{
  return MEMORY[0x1F4114050]();
}

uint64_t NLStringEmbeddingCopySupportedVersions()
{
  return MEMORY[0x1F4114058]();
}

uint64_t NLStringEmbeddingCopyTextForTokenIDs()
{
  return MEMORY[0x1F4114060]();
}

uint64_t NLStringEmbeddingCopyTokenIDsForText()
{
  return MEMORY[0x1F4114068]();
}

uint64_t NLStringEmbeddingCopyVector()
{
  return MEMORY[0x1F4114070]();
}

uint64_t NLStringEmbeddingCopyVersion()
{
  return MEMORY[0x1F4114078]();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return MEMORY[0x1F4114080]();
}

uint64_t NLStringEmbeddingFillTokenVectorsWithShape()
{
  return MEMORY[0x1F4114088]();
}

uint64_t NLStringEmbeddingFillWordVectors()
{
  return MEMORY[0x1F4114090]();
}

uint64_t NLStringEmbeddingGetDimension()
{
  return MEMORY[0x1F4114098]();
}

uint64_t NLStringEmbeddingGetDistance()
{
  return MEMORY[0x1F41140A0]();
}

uint64_t NLStringEmbeddingSaveCompressedModel()
{
  return MEMORY[0x1F41140B0]();
}

uint64_t NLTaggerCopyAvailableTagSchemes()
{
  return MEMORY[0x1F41140E8]();
}

uint64_t NLTaggerCopyHypothesesAtIndex()
{
  return MEMORY[0x1F41140F0]();
}

uint64_t NLTaggerCopyTagAtIndex()
{
  return MEMORY[0x1F41140F8]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1F4114100]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1F4114108]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1F4114110]();
}

uint64_t NLTaggerGetTokenAtIndex()
{
  return MEMORY[0x1F4114118]();
}

uint64_t NLTaggerSetGazetteers()
{
  return MEMORY[0x1F4114120]();
}

uint64_t NLTaggerSetLocaleForRange()
{
  return MEMORY[0x1F4114128]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1F4114130]();
}

uint64_t NLTokenizerCreate()
{
  return MEMORY[0x1F4114138]();
}

uint64_t NLTokenizerGetNextToken()
{
  return MEMORY[0x1F4114158]();
}

uint64_t NLTokenizerGoToTokenAtIndex()
{
  return MEMORY[0x1F4114160]();
}

uint64_t NLTokenizerRelease()
{
  return MEMORY[0x1F4114168]();
}

uint64_t NLTokenizerSetLocale()
{
  return MEMORY[0x1F4114178]();
}

uint64_t NLTokenizerSetString()
{
  return MEMORY[0x1F4114180]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t language_modeling::v1::LanguageModel::deallocateInternalBuffers(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x1F412A390](this);
}

uint64_t language_modeling::v1::LanguageModel::init()
{
  return MEMORY[0x1F412A398]();
}

uint64_t language_modeling::v1::LanguageModel::LanguageModel(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x1F412A3A8](this);
}

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x1F412A438]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x1F412A450](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t language_modeling::v1::LanguageModelSession::adaptToToken()
{
  return MEMORY[0x1F412A480]();
}

uint64_t language_modeling::v1::LanguageModelSession::unAdaptToToken()
{
  return MEMORY[0x1F412A498]();
}

void language_modeling::v1::LanguageModelSession::~LanguageModelSession(language_modeling::v1::LanguageModelSession *this)
{
}

uint64_t E5RT::E5Compiler::MakeCompiler()
{
  return MEMORY[0x1F4117D30]();
}

uint64_t E5RT::E5Compiler::IsNewCompileRequired()
{
  return MEMORY[0x1F4117D38]();
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x1F4117D40]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1F4117D50](this);
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x1F4117D68](this);
}

uint64_t E5RT::ExecutionStream::ResetStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D80](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1F4117D88]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D90](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1F4117D98](this);
}

uint64_t E5RT::E5CompilerOptions::SetMilEntryPoints()
{
  return MEMORY[0x1F4117DA8]();
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackend()
{
  return MEMORY[0x1F4117DC0]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x1F4117DC8]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1F4117DD8](this);
}

uint64_t E5RT::E5CompilerConfigOptions::SetBundleCacheLocation()
{
  return MEMORY[0x1F4117DE8]();
}

uint64_t E5RT::E5CompilerConfigOptions::E5CompilerConfigOptions(E5RT::E5CompilerConfigOptions *this)
{
  return MEMORY[0x1F4117DF0](this);
}

void E5RT::E5CompilerConfigOptions::~E5CompilerConfigOptions(E5RT::E5CompilerConfigOptions *this)
{
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1F4117E18]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x1F4117E30]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1F4117E40]();
}

uint64_t language_modeling::v1::Prediction::contextSize(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1F412A500](this);
}

uint64_t language_modeling::v1::Prediction::probability(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1F412A508](this);
}

uint64_t language_modeling::v1::Prediction::string(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1F412A528](this);
}

uint64_t language_modeling::v1::LanguageModel::makeSession()
{
  return MEMORY[0x1F412A560]();
}

uint64_t language_modeling::v1::LanguageModel::blocklistStatus()
{
  return MEMORY[0x1F412A568]();
}

uint64_t language_modeling::v1::LanguageModelSession::enumeratePredictions()
{
  return MEMORY[0x1F412A5C8]();
}

uint64_t language_modeling::v1::LanguageModelSession::conditionalProbability()
{
  return MEMORY[0x1F412A5D8]();
}

uint64_t E5RT::TensorDataType::IsType<float>()
{
  return MEMORY[0x1F4117F20]();
}

uint64_t E5RT::TensorDataType::IsType<int>()
{
  return MEMORY[0x1F4117F28]();
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x1F4117F30]();
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1F4117F40](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataTypeRef(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1F4117F50](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1F4117F68](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F88](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1F4117F90](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x1F4117FA0](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1F417E908](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1F417E918](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint64_t maxent_add_training_sample()
{
  return MEMORY[0x1F417A308]();
}

uint64_t maxent_classify()
{
  return MEMORY[0x1F417A310]();
}

uint64_t maxent_get_class_label()
{
  return MEMORY[0x1F417A318]();
}

uint64_t maxent_load_with_bytes()
{
  return MEMORY[0x1F417A320]();
}

uint64_t maxent_model_create()
{
  return MEMORY[0x1F417A328]();
}

uint64_t maxent_sample_add_feature_with_value()
{
  return MEMORY[0x1F417A338]();
}

uint64_t maxent_sample_create()
{
  return MEMORY[0x1F417A340]();
}

uint64_t maxent_sample_get_label()
{
  return MEMORY[0x1F417A348]();
}

uint64_t maxent_sample_release()
{
  return MEMORY[0x1F417A350]();
}

uint64_t maxent_sample_set_label()
{
  return MEMORY[0x1F417A358]();
}

uint64_t maxent_save_to_file()
{
  return MEMORY[0x1F417A360]();
}

uint64_t maxent_train()
{
  return MEMORY[0x1F417A368]();
}

uint64_t maxent_use_l2_regularizer()
{
  return MEMORY[0x1F417A370]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}