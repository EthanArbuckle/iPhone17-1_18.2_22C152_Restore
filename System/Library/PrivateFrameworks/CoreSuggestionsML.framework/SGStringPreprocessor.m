@interface SGStringPreprocessor
- (SGStringPreprocessor)init;
- (id)characterSetFromString:(id)a3;
- (unsigned)bufferPtrWithMinimumLength:(unint64_t)a3;
- (void)addToEnd:(id)a3 withValue:(id)a4;
- (void)addToStart:(id)a3 withValue:(id)a4;
- (void)combineDakutenAndHandakuten:(id)a3;
- (void)decomposeAndRecomposeStringWithCompatibilityMapping:(id)a3;
- (void)decomposeStringWithCompatibilityMapping:(id)a3;
- (void)finalizeForWordPieceCaseInsensitive:(id)a3;
- (void)finalizeForWordPieceCaseSensitive:(id)a3;
- (void)lowerCase:(id)a3;
- (void)mergeAnyConsecutiveCharacters:(id)a3;
- (void)mergeAnyConsecutiveNonalphabeticCharacters:(id)a3;
- (void)mergeAnyConsecutiveNonalphabeticCharactersWithExceptions:(id)a3 withValue:(id)a4;
- (void)mergeNumbersSeparatedByASCIISpace:(id)a3;
- (void)mergeTwoOrMoreConsecutiveCharacters:(id)a3;
- (void)removeCharacters:(id)a3 withExceptions:(id)a4 fromString:(id)a5;
- (void)removeCharacters:(id)a3 withValue:(id)a4;
- (void)removeDuplicateWhitespace:(id)a3;
- (void)removeEmojiModifyingCharacters:(id)a3;
- (void)removeEmojiModifyingCharactersWithExceptions:(id)a3 withValue:(id)a4;
- (void)removeEmojis:(id)a3;
- (void)removeEmojisWithExceptions:(id)a3 withValue:(id)a4;
- (void)removeNonASCII:(id)a3;
- (void)removeNonBaseCharacters:(id)a3;
- (void)removeNonBasicMultilingualPlane:(id)a3;
- (void)removeNonEmojiSymbols:(id)a3;
- (void)removeNonEmojiSymbolsWithExceptions:(id)a3 withValue:(id)a4;
- (void)removePunctuation:(id)a3;
- (void)removePunctuationWithExceptions:(id)a3 withValue:(id)a4;
- (void)removeSpacingModifierLetters:(id)a3;
- (void)removeSymbols:(id)a3;
- (void)removeSymbolsWithExceptions:(id)a3 withValue:(id)a4;
- (void)replace:(id)a3 withBuffer:(unsigned __int16 *)a4 toIndex:(unint64_t)a5;
- (void)replaceAllWhitespaceWithSpaces:(id)a3;
- (void)replaceCharactersWithSpaces:(id)a3 withValue:(id)a4;
- (void)replaceContactNamesWithString:(id)a3 withValue:(id)a4;
- (void)replaceLinksWithString:(id)a3 withValue:(id)a4;
- (void)replaceNumbersWithString:(id)a3 withValue:(id)a4;
- (void)separateCharacter:(id)a3 withValue:(id)a4;
- (void)separateFrenchElisions:(id)a3;
- (void)stripCombiningMarks:(id)a3;
- (void)stripNonBaseCharacters:(id)a3;
- (void)transformFullwidthToHalfwidth:(id)a3;
- (void)transformFullwidthToHalfwidthASCII:(id)a3;
- (void)transformHalfwidthToFullwidthCJK:(id)a3;
- (void)trimWhitespace:(id)a3;
@end

@implementation SGStringPreprocessor

- (void).cxx_destruct
{
}

- (void)finalizeForWordPieceCaseSensitive:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stringByFoldingWithOptions:128 locale:0];
  [v3 setString:v4];
}

- (void)finalizeForWordPieceCaseInsensitive:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = [(__CFString *)v3 stringByFoldingWithOptions:128 locale:0];
  [(__CFString *)v3 setString:v4];
  CFStringLowercase(v3, 0);
}

- (void)addToEnd:(id)a3 withValue:(id)a4
{
}

- (void)addToStart:(id)a3 withValue:(id)a4
{
}

- (void)replaceContactNamesWithString:(id)a3 withValue:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 componentsSeparatedByString:@";"];
  if ([v7 count] == 2)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    v9 = [v7 objectAtIndexedSubscript:1];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)getSGNameDetectorClass_softClass;
    uint64_t v24 = getSGNameDetectorClass_softClass;
    if (!getSGNameDetectorClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v26 = (uint64_t)__getSGNameDetectorClass_block_invoke;
      v27 = &unk_2647EB178;
      v28 = &v21;
      __getSGNameDetectorClass_block_invoke((uint64_t)&buf);
      v10 = (void *)v22[3];
    }
    v11 = v10;
    _Block_object_dispose(&v21, 8);
    v12 = (void *)[[v11 alloc] initWithLanguage:v8];
    v13 = [v12 detectNames:v5 algorithm:0];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    v27 = 0;
    uint64_t v14 = [v9 length];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__SGStringPreprocessor_replaceContactNamesWithString_withValue___block_invoke;
    v16[3] = &unk_2647EA3C8;
    p_long long buf = &buf;
    id v17 = v5;
    id v15 = v9;
    id v18 = v15;
    uint64_t v20 = v14;
    [v13 enumerateObjectsUsingBlock:v16];

    _Block_object_dispose(&buf, 8);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[SGStringPreprocessingTransformer replaceContactNamesWithString:withValue:] - Incorrect format for value: %@", (uint8_t *)&buf, 0xCu);
  }
}

void __64__SGStringPreprocessor_replaceContactNamesWithString_withValue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v4 = a2;
  uint64_t v5 = [v4 range] + v3;
  [v4 range];
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v5, v6, *(void *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 56);
  [v4 range];
  uint64_t v9 = v8;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v7 - v9;
}

- (void)combineDakutenAndHandakuten:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (!v5) {
    goto LABEL_43;
  }
  uint64_t v6 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
  uint64_t v7 = (__CFString *)v4;
  uint64_t v8 = self;

  if (!v8) {
    goto LABEL_40;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v31 = 0u;
  CFIndex Length = CFStringGetLength(v7);
  CFStringRef theString = v7;
  uint64_t v41 = 0;
  CFIndex v42 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  v39 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  int64_t v43 = 0;
  int64_t v44 = 0;
  v40 = CStringPtr;
  if (Length < 1)
  {
LABEL_40:

    goto LABEL_43;
  }
  v28 = v7;
  uint64_t v29 = self;
  uint64_t v12 = 0;
  int64_t v13 = 0;
  int64_t v14 = 0;
  int64_t v15 = 0;
  char v16 = 0;
  uint64_t v17 = 0;
  __int16 v18 = 0;
  uint64_t v19 = 64;
  do
  {
    if ((unint64_t)v15 >= 4) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = v15;
    }
    if (v42 <= v15)
    {
      UniChar v21 = 0;
LABEL_31:
      uint64_t v27 = v17++;
      __int16 v18 = v21;
      goto LABEL_32;
    }
    if (v39)
    {
      UniChar v21 = v39[v15 + v41];
    }
    else if (v40)
    {
      UniChar v21 = v40[v41 + v15];
    }
    else
    {
      if (v44 <= v15 || v14 > v15)
      {
        uint64_t v23 = v20 + v12;
        uint64_t v24 = v19 - v20;
        int64_t v25 = v15 - v20;
        CFIndex v26 = v25 + 64;
        if (v25 + 64 >= v42) {
          CFIndex v26 = v42;
        }
        int64_t v43 = v25;
        int64_t v44 = v26;
        if (v42 < v24) {
          uint64_t v24 = v42;
        }
        v45.length = v24 + v23;
        v45.location = v25 + v41;
        CFStringGetCharacters(theString, v45, buffer);
        int64_t v13 = v43;
      }
      UniChar v21 = buffer[v15 - v13];
      int64_t v14 = v13;
    }
    if (v21 == 12442)
    {
      if ((unsigned __int16)(v18 - 12399) <= 0xCu)
      {
        UniChar v21 = v18 + 2;
        uint64_t v27 = v17 - 1;
        char v16 = 1;
        __int16 v18 = 12442;
      }
      else
      {
        uint64_t v27 = v17++;
        char v16 = 1;
        __int16 v18 = 12442;
        UniChar v21 = 12444;
      }
    }
    else
    {
      if (v21 != 12441) {
        goto LABEL_31;
      }
      switch(v18)
      {
        case 12358:
        case 12454:
          v6[v17 - 1] = v18 + 78;
          goto LABEL_39;
        case 12363:
        case 12364:
        case 12365:
        case 12366:
        case 12367:
        case 12368:
        case 12369:
        case 12370:
        case 12371:
        case 12372:
        case 12373:
        case 12374:
        case 12375:
        case 12376:
        case 12377:
        case 12378:
        case 12379:
        case 12380:
        case 12381:
        case 12382:
        case 12383:
        case 12384:
        case 12385:
        case 12386:
        case 12387:
        case 12388:
        case 12389:
        case 12390:
        case 12391:
        case 12392:
        case 12393:
        case 12394:
        case 12395:
        case 12396:
        case 12397:
        case 12398:
        case 12399:
        case 12400:
        case 12401:
        case 12402:
        case 12403:
        case 12404:
        case 12405:
        case 12406:
        case 12407:
        case 12408:
        case 12409:
        case 12410:
        case 12411:
        case 12445:
        case 12459:
        case 12460:
        case 12461:
        case 12462:
        case 12463:
        case 12464:
        case 12465:
        case 12466:
        case 12467:
        case 12468:
        case 12469:
        case 12470:
        case 12471:
        case 12472:
        case 12473:
        case 12474:
        case 12475:
        case 12476:
        case 12477:
        case 12478:
        case 12479:
        case 12480:
        case 12481:
        case 12482:
        case 12483:
        case 12484:
        case 12485:
        case 12486:
        case 12487:
        case 12488:
        case 12489:
        case 12490:
        case 12491:
        case 12492:
        case 12493:
        case 12494:
        case 12495:
        case 12496:
        case 12497:
        case 12498:
        case 12499:
        case 12500:
        case 12501:
        case 12502:
        case 12503:
        case 12504:
        case 12505:
        case 12506:
        case 12507:
        case 12541:
          UniChar v21 = v18 + 1;
          goto LABEL_30;
        case 12527:
        case 12528:
        case 12529:
        case 12530:
          UniChar v21 = v18 + 8;
LABEL_30:
          uint64_t v27 = v17 - 1;
          char v16 = 1;
          __int16 v18 = 12441;
          break;
        default:
LABEL_39:
          uint64_t v27 = v17++;
          char v16 = 1;
          __int16 v18 = 12441;
          UniChar v21 = 12443;
          break;
      }
    }
LABEL_32:
    v6[v27] = v21;
    ++v15;
    --v12;
    ++v19;
  }
  while (Length != v15);

  if (v16) {
    [(SGStringPreprocessor *)v29 replace:v28 withBuffer:v6 toIndex:v17];
  }
LABEL_43:
}

- (void)transformHalfwidthToFullwidthCJK:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (!v5) {
    goto LABEL_34;
  }
  uint64_t v6 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
  uint64_t v7 = (__CFString *)v4;
  uint64_t v8 = self;

  if (!v8) {
    goto LABEL_33;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v28 = 0u;
  CFIndex Length = CFStringGetLength(v7);
  CFStringRef theString = v7;
  uint64_t v38 = 0;
  CFIndex v39 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v7);
  CStringPtr = 0;
  long long v36 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  }
  int64_t v40 = 0;
  int64_t v41 = 0;
  long long v37 = CStringPtr;
  if (Length < 1)
  {
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v12 = 0;
  int64_t v13 = 0;
  char v14 = 0;
  uint64_t v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v13;
    }
    CFIndex v17 = v39;
    if (v39 <= v13)
    {
      UniChar v18 = 0;
      goto LABEL_30;
    }
    if (v36)
    {
      UniChar v18 = v36[v13 + v38];
    }
    else if (v37)
    {
      UniChar v18 = v37[v38 + v13];
    }
    else
    {
      int64_t v19 = v40;
      if (v41 <= v13 || v40 > v13)
      {
        uint64_t v21 = v16 + v12;
        uint64_t v22 = v15 - v16;
        int64_t v23 = v13 - v16;
        CFIndex v24 = v23 + 64;
        if (v23 + 64 >= v39) {
          CFIndex v24 = v39;
        }
        int64_t v40 = v23;
        int64_t v41 = v24;
        if (v39 >= v22) {
          CFIndex v17 = v22;
        }
        v42.length = v17 + v21;
        v42.location = v23 + v38;
        CFStringGetCharacters(theString, v42, buffer);
        int64_t v19 = v40;
      }
      UniChar v18 = buffer[v13 - v19];
    }
    if ((unsigned __int16)(v18 + 159) >= 0x3Fu)
    {
      int v25 = -65440;
      CFIndex v26 = @"ᅠᄀᄁᆪᄂᆬᆭᄃᄄᄅᆰᆱᆲᆳᆴᆵᄚᄆᄇᄈᄡᄉᄊᄋᄌᄍᄎᄏᄐᄑ하ᅢᅣᅤᅥᅦᅧᅨᅩᅪᅫᅬᅭᅮᅯᅰᅱᅲᅳᅴᅵ";
      if ((unsigned __int16)(v18 + 96) > 0x3Cu) {
        goto LABEL_30;
      }
    }
    else
    {
      int v25 = -65377;
      CFIndex v26 = @"。「」、・ヲァィゥェォャュョッーアイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワン゙゚";
    }
    UniChar v18 = [(__CFString *)v26 characterAtIndex:v25 + v18];
    char v14 = 1;
LABEL_30:
    v6[v13++] = v18;
    --v12;
    ++v15;
  }
  while (Length != v13);

  if (v14) {
    [(SGStringPreprocessor *)self replace:v7 withBuffer:v6 toIndex:Length];
  }
LABEL_34:
}

- (void)transformFullwidthToHalfwidthASCII:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = self;

  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v26 = 0u;
    CFIndex Length = CFStringGetLength(v3);
    long long v33 = v3;
    uint64_t v36 = 0;
    CFIndex v37 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    long long v34 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    }
    long long v35 = CStringPtr;
    int64_t v38 = 0;
    int64_t v39 = 0;
    if (Length >= 1)
    {
      uint64_t v8 = 0;
      int64_t v9 = 0;
      v10 = buffer;
      uint64_t v11 = 64;
      do
      {
        if ((unint64_t)v9 >= 4) {
          uint64_t v12 = 4;
        }
        else {
          uint64_t v12 = v9;
        }
        CFIndex v13 = v37;
        if (v37 > v9)
        {
          if (v34)
          {
            char v14 = (unsigned __int16 *)&v34[v9 + v36];
LABEL_12:
            unsigned __int16 v15 = *v14;
            int v16 = v15;
            if ((unsigned __int16)(v15 + 255) < 0x5Eu) {
              v15 += 288;
            }
            if (v16 == 12288) {
              unsigned __int16 v15 = 32;
            }
            unsigned __int16 v24 = v15;
            if (v16 != v15)
            {
              CFIndex v17 = (void *)[[NSString alloc] initWithCharactersNoCopy:&v24 length:1 freeWhenDone:0];
              -[__CFString replaceCharactersInRange:withString:](v3, "replaceCharactersInRange:withString:", v9, 1, v17);
            }
            goto LABEL_19;
          }
          if (!v35)
          {
            int64_t v18 = v38;
            if (v39 <= v9 || v38 > v9)
            {
              uint64_t v20 = v12 + v8;
              uint64_t v21 = v11 - v12;
              int64_t v22 = v9 - v12;
              CFIndex v23 = v22 + 64;
              if (v22 + 64 >= v37) {
                CFIndex v23 = v37;
              }
              int64_t v38 = v22;
              int64_t v39 = v23;
              if (v37 >= v21) {
                CFIndex v13 = v21;
              }
              v40.length = v13 + v20;
              v40.location = v22 + v36;
              CFStringGetCharacters(v33, v40, buffer);
              int64_t v18 = v38;
            }
            char v14 = &v10[-v18];
            goto LABEL_12;
          }
        }
LABEL_19:
        ++v9;
        --v8;
        ++v11;
        ++v10;
      }
      while (Length != v9);
    }
  }
}

- (void)transformFullwidthToHalfwidth:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  v4.location = 0;
  v4.length = [(__CFString *)v3 length];
  CFStringTransform(v3, &v4, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
}

- (void)removeSymbolsWithExceptions:(id)a3 withValue:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 symbolCharacterSet];
  int64_t v9 = [(SGStringPreprocessor *)self characterSetFromString:v7];

  [(SGStringPreprocessor *)self removeCharacters:v10 withExceptions:v9 fromString:v8];
}

- (void)removeSymbols:(id)a3
{
  CFRange v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 symbolCharacterSet];
  [(SGStringPreprocessor *)self removeCharacters:v6 withExceptions:0 fromString:v5];
}

- (void)removePunctuationWithExceptions:(id)a3 withValue:(id)a4
{
  id v6 = (void *)MEMORY[0x263F08708];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 punctuationCharacterSet];
  int64_t v9 = [(SGStringPreprocessor *)self characterSetFromString:v7];

  [(SGStringPreprocessor *)self removeCharacters:v10 withExceptions:v9 fromString:v8];
}

- (void)replaceAllWhitespaceWithSpaces:(id)a3
{
  id v3 = a3;
  CFCharacterSetRef v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v5 = (__CFString *)v3;
  id v6 = self;

  if (v6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    CFIndex Length = CFStringGetLength(v5);
    CFStringRef theString = v5;
    uint64_t v33 = 0;
    CFIndex v34 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    long long v31 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    int64_t v35 = 0;
    int64_t v36 = 0;
    long long v32 = CStringPtr;
    if (Length >= 1)
    {
      uint64_t v10 = 0;
      int64_t v11 = 0;
      uint64_t v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = v11;
        }
        CFIndex v14 = v34;
        if (v34 <= v11)
        {
          UniChar v15 = 0;
        }
        else if (v31)
        {
          UniChar v15 = v31[v11 + v33];
        }
        else if (v32)
        {
          UniChar v15 = v32[v33 + v11];
        }
        else
        {
          int64_t v16 = v35;
          if (v36 <= v11 || v35 > v11)
          {
            uint64_t v18 = v13 + v10;
            uint64_t v19 = v12 - v13;
            int64_t v20 = v11 - v13;
            CFIndex v21 = v20 + 64;
            if (v20 + 64 >= v34) {
              CFIndex v21 = v34;
            }
            int64_t v35 = v20;
            int64_t v36 = v21;
            if (v34 >= v19) {
              CFIndex v14 = v19;
            }
            v37.length = v14 + v18;
            v37.location = v20 + v33;
            CFStringGetCharacters(theString, v37, (UniChar *)&v22);
            int64_t v16 = v35;
          }
          UniChar v15 = *((_WORD *)&v22 + v11 - v16);
        }
        if (CFCharacterSetIsCharacterMember(v4, v15)) {
          [(__CFString *)v5 replaceCharactersInRange:v11, 1, @" ", v22, v23, v24, v25, v26, v27, v28, v29 withString];
        }
        ++v11;
        --v10;
        ++v12;
      }
      while (Length != v11);
    }
  }
}

- (void)removeNonEmojiSymbols:(id)a3
{
}

- (void)removeNonEmojiSymbolsWithExceptions:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  int64_t v9 = [MEMORY[0x263F08708] symbolCharacterSet];
  if (v8)
  {
    uint64_t v10 = _PASCharacterSetWithCharactersInString();
  }
  else
  {
    uint64_t v10 = 0;
  }
  int64_t v11 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v14 = MEMORY[0x263EF8330];
  id v12 = v9;
  UniChar v15 = v12;
  id v13 = v10;
  int64_t v16 = v13;
  _PASIterateLongChars();
  if (v18[3] != v8) {
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v11, v14, 3221225472, __70__SGStringPreprocessor_removeNonEmojiSymbolsWithExceptions_withValue___block_invoke, &unk_2647EA210, v12, v13, &v17, v11);
  }

  _Block_object_dispose(&v17, 8);
}

CFCharacterSetRef __70__SGStringPreprocessor_removeNonEmojiSymbolsWithExceptions_withValue___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2)
    || (SGIsEmoji(a2) & 1) != 0
    || (CFCharacterSetRef result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (CFCharacterSetRef result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), result))
  {
    CFCharacterSetRef result = (const __CFCharacterSet *)memcpy((void *)(*(void *)(a1 + 56)+ 2 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a5;
  }
  return result;
}

- (void)removeEmojis:(id)a3
{
}

- (void)removeEmojisWithExceptions:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    int64_t v9 = _PASCharacterSetWithCharactersInString();
  }
  else
  {
    int64_t v9 = 0;
  }
  uint64_t v10 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v8];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v11 = v9;
  _PASIterateLongChars();
  if (v13[3] != v8) {
    -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v10);
  }

  _Block_object_dispose(&v12, 8);
}

CFCharacterSetRef __61__SGStringPreprocessor_removeEmojisWithExceptions_withValue___block_invoke(void *a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  if (!SGIsEmoji(a2)
    || (CFCharacterSetRef result = (const __CFCharacterSet *)a1[4]) != 0
    && (CFCharacterSetRef result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), result))
  {
    CFCharacterSetRef result = (const __CFCharacterSet *)memcpy((void *)(a1[6] + 2 * *(void *)(*(void *)(a1[5] + 8) + 24)), a3, 2 * a5);
    *(void *)(*(void *)(a1[5] + 8) + 24) += a5;
  }
  return result;
}

- (void)removeEmojiModifyingCharacters:(id)a3
{
}

- (void)removeEmojiModifyingCharactersWithExceptions:(id)a3 withValue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = _PASCharacterSetWithCharactersInString();
  if ([v6 length])
  {
    uint64_t v8 = _PASCharacterSetWithCharactersInString();
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(SGStringPreprocessor *)self removeCharacters:v7 withExceptions:v8 fromString:v9];
}

- (void)removeNonBaseCharacters:(id)a3
{
  CFCharacterSetRef v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 nonBaseCharacterSet];
  [(SGStringPreprocessor *)self removeCharacters:v6 withExceptions:0 fromString:v5];
}

- (void)stripNonBaseCharacters:(id)a3
{
  id v4 = a3;
  [(SGStringPreprocessor *)self decomposeStringWithCompatibilityMapping:v4];
  [(SGStringPreprocessor *)self removeNonBaseCharacters:v4];
}

- (void)stripCombiningMarks:(id)a3
{
  id v3 = (__CFString *)a3;
  v4.location = 0;
  v4.length = [(__CFString *)v3 length];
  CFStringTransform(v3, &v4, (CFStringRef)*MEMORY[0x263EFFF48], 0);
}

- (void)decomposeAndRecomposeStringWithCompatibilityMapping:(id)a3
{
}

- (void)decomposeStringWithCompatibilityMapping:(id)a3
{
}

- (void)removeNonBasicMultilingualPlane:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
    uint64_t v8 = (__CFString *)v4;
    id v9 = self;

    if (v9)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v27 = 0u;
      CFIndex Length = CFStringGetLength(v8);
      CFStringRef theString = v8;
      uint64_t v37 = 0;
      CFIndex v38 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      int64_t v35 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      }
      int64_t v39 = 0;
      int64_t v40 = 0;
      int64_t v36 = CStringPtr;
      if (Length >= 1)
      {
        uint64_t v13 = 0;
        int64_t v14 = 0;
        int64_t v15 = 0;
        int64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 64;
        while (1)
        {
          if ((unint64_t)v16 >= 4) {
            uint64_t v19 = 4;
          }
          else {
            uint64_t v19 = v16;
          }
          if (v38 <= v16)
          {
            UniChar v20 = 0;
          }
          else
          {
            if (v35)
            {
              UniChar v20 = v35[v16 + v37];
            }
            else if (v36)
            {
              UniChar v20 = v36[v37 + v16];
            }
            else
            {
              if (v40 <= v16 || v15 > v16)
              {
                uint64_t v22 = v19 + v13;
                uint64_t v23 = v18 - v19;
                int64_t v24 = v16 - v19;
                CFIndex v25 = v24 + 64;
                if (v24 + 64 >= v38) {
                  CFIndex v25 = v38;
                }
                int64_t v39 = v24;
                int64_t v40 = v25;
                if (v38 < v23) {
                  uint64_t v23 = v38;
                }
                v41.length = v23 + v22;
                v41.location = v24 + v37;
                CFStringGetCharacters(theString, v41, buffer);
                int64_t v14 = v39;
              }
              UniChar v20 = buffer[v16 - v14];
              int64_t v15 = v14;
            }
            if ((unsigned __int16)((unsigned __int16)(v20 + 0x2000) >> 11) > 0x1Eu) {
              goto LABEL_28;
            }
          }
          v7[v17++] = v20;
LABEL_28:
          ++v16;
          --v13;
          ++v18;
          if (Length == v16) {
            goto LABEL_32;
          }
        }
      }
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 0;
    }
LABEL_32:

    if (v17 != v6) {
      [(SGStringPreprocessor *)self replace:v8 withBuffer:v7 toIndex:v17];
    }
  }
}

- (void)trimWhitespace:(id)a3
{
}

- (void)replaceLinksWithString:(id)a3 withValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v8 length];
  if (v9 >= 5)
  {
    long long v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 507, @"Invalid parameter not satisfying: %@", @"valueLen <= patternLen" object file lineNumber description];
  }
  uint64_t v10 = [v7 length];
  if (v10)
  {
    id v11 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v10];
    uint64_t v12 = (__CFString *)v7;
    uint64_t v13 = self;

    if (!v13) {
      goto LABEL_50;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v36 = 0u;
    CFIndex Length = CFStringGetLength(v12);
    CFStringRef theString = v12;
    uint64_t v46 = 0;
    CFIndex v47 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v12);
    CStringPtr = 0;
    int64_t v44 = (UniChar *)CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
    }
    int64_t v48 = 0;
    int64_t v49 = 0;
    CFRange v45 = CStringPtr;
    if (Length <= 0)
    {
LABEL_50:

      goto LABEL_53;
    }
    int64_t v17 = 0;
    char v34 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    while (1)
    {
      CFIndex v20 = v47;
      if (v47 <= v17)
      {
        unsigned __int16 v23 = 0;
        goto LABEL_15;
      }
      CFIndex v21 = v44;
      if (v44) {
        break;
      }
      if (!v45)
      {
        int64_t v30 = v48;
        if (v49 <= v17 || v48 > v17)
        {
          int64_t v32 = v17 - 4;
          if ((unint64_t)v17 < 4) {
            int64_t v32 = 0;
          }
          if (v32 + 64 < v47) {
            CFIndex v20 = v32 + 64;
          }
          int64_t v48 = v32;
          int64_t v49 = v20;
          v50.location = v46 + v32;
          v50.length = v20 - v32;
          CFStringGetCharacters(theString, v50, buffer);
          int64_t v30 = v48;
        }
        int64_t v22 = v17 - v30;
        CFIndex v21 = buffer;
LABEL_12:
        unsigned __int16 v23 = v21[v22];
        if (v18) {
          goto LABEL_15;
        }
        goto LABEL_33;
      }
      unsigned __int16 v23 = v45[v46 + v17];
      if (v18) {
        goto LABEL_15;
      }
LABEL_33:
      if (v23 == 104)
      {
        unsigned __int16 v23 = 104;
        uint64_t v18 = 1u;
LABEL_36:
        v11[v19] = v23;
LABEL_37:
        ++v19;
        goto LABEL_38;
      }
LABEL_15:
      if (v18 >= 1)
      {
        if (replaceLinksWithString_withValue__pattern[v18] != v23) {
          goto LABEL_35;
        }
        ++v18;
        v11[v19] = v23;
        if (v18 != 4) {
          goto LABEL_37;
        }
        uint64_t v29 = v19 - 3;
        objc_msgSend(v8, "getCharacters:range:", &v11[v29], 0, v9);
        uint64_t v19 = v29 + v9;
        char v34 = 1;
      }
      else
      {
        if (v18 != -1) {
          goto LABEL_36;
        }
        if (v23 - 48 < 0xA || (v23 & 0xFFDFu) - 65 < 0x1A) {
          goto LABEL_38;
        }
        int64_t v24 = ":/.?=&_-+$!*'(),;@";
        do
        {
          char v26 = *v24++;
          char v25 = v26;
          int v27 = v26;
          if (v26) {
            BOOL v28 = v27 == v23;
          }
          else {
            BOOL v28 = 1;
          }
        }
        while (!v28);
        if (!v25)
        {
LABEL_35:
          uint64_t v18 = 0;
          goto LABEL_36;
        }
      }
      uint64_t v18 = 0xFFFFFFFFFFFFFFFFLL;
LABEL_38:
      if (++v17 == Length)
      {

        if (v34) {
          [(SGStringPreprocessor *)self replace:v12 withBuffer:v11 toIndex:v19];
        }
        goto LABEL_53;
      }
    }
    int64_t v22 = v46 + v17;
    goto LABEL_12;
  }
LABEL_53:
}

- (void)mergeAnyConsecutiveNonalphabeticCharacters:(id)a3
{
}

- (void)mergeAnyConsecutiveNonalphabeticCharactersWithExceptions:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = [MEMORY[0x263F08708] letterCharacterSet];
    if ([v7 length])
    {
      id v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v7];
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v9];
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    int v16 = 0;
    id v13 = v10;
    id v14 = v11;
    _PASIterateLongChars();
    if (v18[3] != v9) {
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v6, v12);
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(&v17, 8);
  }
}

CFCharacterSetRef __91__SGStringPreprocessor_mergeAnyConsecutiveNonalphabeticCharactersWithExceptions_withValue___block_invoke(uint64_t a1, UTF32Char theChar, void *__src, uint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != theChar
    || CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), theChar)
    || (CFCharacterSetRef result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (CFCharacterSetRef result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, theChar), result))
  {
    CFCharacterSetRef result = (const __CFCharacterSet *)memcpy((void *)(*(void *)(a1 + 64)+ 2 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), __src, 2 * a5);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a5;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = theChar;
  return result;
}

- (void)mergeAnyConsecutiveCharacters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    int v9 = 0;
    _PASIterateLongChars();
    if (v11[3] != v6) {
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v7);
    }
    _Block_object_dispose(v8, 8);
    _Block_object_dispose(&v10, 8);
  }
}

void *__54__SGStringPreprocessor_mergeAnyConsecutiveCharacters___block_invoke(void *result, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(result[4] + 8);
  if (*(_DWORD *)(v6 + 24) != a2)
  {
    uint64_t v8 = result;
    CFCharacterSetRef result = memcpy((void *)(result[6] + 2 * *(void *)(*(void *)(result[5] + 8) + 24)), __src, 2 * a5);
    *(void *)(*(void *)(v8[5] + 8) + 24) += a5;
    uint64_t v6 = *(void *)(v8[4] + 8);
  }
  *(_DWORD *)(v6 + 24) = a2;
  return result;
}

- (void)mergeTwoOrMoreConsecutiveCharacters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    int v12 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    int v10 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    _PASIterateLongChars();
    if (v14[3] != v6) {
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v7, v8, 3221225472, __60__SGStringPreprocessor_mergeTwoOrMoreConsecutiveCharacters___block_invoke, &unk_2647EA328, v11, v9, &v13, v7);
    }
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v13, 8);
  }
}

void *__60__SGStringPreprocessor_mergeTwoOrMoreConsecutiveCharacters___block_invoke(void *result, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  id v7 = result;
  if (*(_DWORD *)(*(void *)(result[4] + 8) + 24) != a2
    || (uint64_t v8 = *(void *)(result[5] + 8), v9 = a2, *(_DWORD *)(v8 + 24) != a2))
  {
    CFCharacterSetRef result = memcpy((void *)(result[7] + 2 * *(void *)(*(void *)(result[6] + 8) + 24)), __src, 2 * a5);
    *(void *)(*(void *)(v7[6] + 8) + 24) += a5;
    int v9 = *(_DWORD *)(*(void *)(v7[4] + 8) + 24);
    uint64_t v8 = *(void *)(v7[5] + 8);
  }
  *(_DWORD *)(v8 + 24) = v9;
  *(_DWORD *)(*(void *)(v7[4] + 8) + 24) = a2;
  return result;
}

- (void)replaceNumbersWithString:(id)a3 withValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 length] != 1)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 400, @"Invalid parameter not satisfying: %@", @"value.length == 1" object file lineNumber description];
  }
  uint64_t v9 = [v7 length];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    if (([v8 characterAtIndex:0] & 0xF800 | 0x400) == 0xDC00)
    {
      uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 405, @"Invalid parameter not satisfying: %@", @"!CFUniCharIsSurrogateHighCharacter(replacement) && !CFUniCharIsSurrogateLowCharacter(replacement)" object file lineNumber description];
    }
    uint64_t v25 = 0;
    char v26 = &v25;
    uint64_t v27 = 0x2020000000;
    BOOL v28 = 0;
    BOOL v28 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v10];
    uint64_t v21 = 0;
    int64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    id v12 = v11;
    _PASIterateLongChars();
    if (*((unsigned char *)v16 + 24)) {
      [(SGStringPreprocessor *)self replace:v7 withBuffer:v26[3] toIndex:v22[3]];
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
}

void *__59__SGStringPreprocessor_replaceNumbersWithString_withValue___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  CFCharacterSetRef result = (void *)CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2);
  int v9 = (int)result;
  if (result)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      __int16 v10 = *(_WORD *)(a1 + 72);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void *)(v12 + 24);
      *(void *)(v12 + 24) = v13 + 1;
      *(_WORD *)(v11 + 2 * v13) = v10;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    CFCharacterSetRef result = memcpy((void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)+ 2 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9 != 0;
  return result;
}

- (void)mergeNumbersSeparatedByASCIISpace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    id v8 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v6];
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    int v13 = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    int v11 = 0;
    id v9 = v7;
    _PASIterateLongChars();
    if (v15[3] != v6) {
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v4, v8);
    }

    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(&v14, 8);
  }
}

void *__58__SGStringPreprocessor_mergeNumbersSeparatedByASCIISpace___block_invoke(uint64_t a1, UTF32Char a2, void *__src, uint64_t a4, uint64_t a5)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 32
    && CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))&& CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2))
  {
    --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  CFCharacterSetRef result = memcpy((void *)(*(void *)(a1 + 64) + 2 * *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)), __src, 2 * a5);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += a5;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return result;
}

- (void)removeDuplicateWhitespace:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v8 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v6];
    id v9 = (__CFString *)v4;
    __int16 v10 = self;

    if (v10)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v34 = 0u;
      CFIndex Length = CFStringGetLength(v9);
      CFStringRef theString = v9;
      uint64_t v44 = 0;
      CFIndex v45 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v9);
      CStringPtr = 0;
      long long v42 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
      }
      uint64_t v29 = v9;
      uint64_t v30 = v6;
      long long v31 = self;
      id v32 = v4;
      int64_t v46 = 0;
      int64_t v47 = 0;
      int64_t v43 = CStringPtr;
      if (Length < 1)
      {
        uint64_t v17 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        int64_t v15 = 0;
        int v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 64;
        do
        {
          if ((unint64_t)v15 >= 4) {
            uint64_t v19 = 4;
          }
          else {
            uint64_t v19 = v15;
          }
          CFIndex v20 = v45;
          if (v45 <= v15)
          {
            UniChar v21 = 0;
          }
          else if (v42)
          {
            UniChar v21 = v42[v15 + v44];
          }
          else if (v43)
          {
            UniChar v21 = v43[v44 + v15];
          }
          else
          {
            int64_t v23 = v46;
            if (v47 <= v15 || v46 > v15)
            {
              uint64_t v25 = v19 + v14;
              uint64_t v26 = v18 - v19;
              int64_t v27 = v15 - v19;
              CFIndex v28 = v27 + 64;
              if (v27 + 64 >= v45) {
                CFIndex v28 = v45;
              }
              int64_t v46 = v27;
              int64_t v47 = v28;
              if (v45 >= v26) {
                CFIndex v20 = v26;
              }
              v48.length = v20 + v25;
              v48.location = v27 + v44;
              CFStringGetCharacters(theString, v48, buffer);
              int64_t v23 = v46;
            }
            UniChar v21 = buffer[v15 - v23];
          }
          int v22 = objc_msgSend(v7, "characterIsMember:", v21, v29, v30, v31, v32, *(void *)buffer, *(void *)&buffer[4], v34, v35, v36, v37, v38, v39, v40);
          if ((v16 & v22 & 1) == 0) {
            v8[v17++] = v21;
          }
          ++v15;
          --v14;
          ++v18;
          int v16 = v22;
        }
        while (Length != v15);
      }
      self = v31;
      id v4 = v32;
      id v9 = v29;
      uint64_t v6 = v30;
    }
    else
    {
      uint64_t v17 = 0;
    }

    if (v17 != v6) {
      [(SGStringPreprocessor *)self replace:v9 withBuffer:v8 toIndex:v17];
    }
  }
}

- (void)removeSpacingModifierLetters:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  objc_msgSend(v4, "characterSetWithRange:", 688, 64);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SGStringPreprocessor *)self removeCharacters:v6 withExceptions:0 fromString:v5];
}

- (void)removePunctuation:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  id v6 = [v4 punctuationCharacterSet];
  [(SGStringPreprocessor *)self removeCharacters:v6 withExceptions:0 fromString:v5];
}

- (void)removeNonASCII:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  objc_msgSend(v4, "characterSetWithRange:", 0, 128);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v7 invertedSet];
  [(SGStringPreprocessor *)self removeCharacters:v6 withExceptions:0 fromString:v5];
}

- (void)replaceCharactersWithSpaces:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v9 = [(SGStringPreprocessor *)self characterSetFromString:a4];
  id v7 = v6;
  id v8 = v9;
  _PASIterateLongChars();
}

uint64_t __62__SGStringPreprocessor_replaceCharactersWithSpaces_withValue___block_invoke(uint64_t a1, UTF32Char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2);
  if (result)
  {
    id v9 = *(void **)(a1 + 40);
    return objc_msgSend(v9, "replaceCharactersInRange:withString:", a4, a5, @" ");
  }
  return result;
}

- (void)removeCharacters:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = [(SGStringPreprocessor *)self characterSetFromString:a4];
  [(SGStringPreprocessor *)self removeCharacters:v7 withExceptions:0 fromString:v6];
}

- (void)separateFrenchElisions:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = v5;
    v43[4] = xmmword_2647EA270;
    v43[5] = *(_OWORD *)&off_2647EA280;
    v43[6] = xmmword_2647EA290;
    uint64_t v44 = 0;
    v43[0] = xmmword_2647EA230;
    v43[1] = *(_OWORD *)&off_2647EA240;
    v43[2] = xmmword_2647EA250;
    v43[3] = *(_OWORD *)&off_2647EA260;
    id v7 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v5];
    id v8 = (__CFString *)v4;
    id v9 = self;

    if (v9)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v29 = 0u;
      CFIndex Length = CFStringGetLength(v8);
      CFStringRef theString = v8;
      uint64_t v39 = 0;
      CFIndex v40 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      CStringPtr = 0;
      long long v37 = (UniChar *)CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
      }
      id v26 = v4;
      int64_t v27 = self;
      int64_t v41 = 0;
      int64_t v42 = 0;
      long long v38 = CStringPtr;
      if (Length >= 1)
      {
        int64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = v6;
        while (1)
        {
          CFIndex v16 = v40;
          if (v40 <= v13)
          {
            unsigned __int16 v19 = 0;
            goto LABEL_24;
          }
          uint64_t v17 = v37;
          if (v37)
          {
            int64_t v18 = v39 + v13;
          }
          else
          {
            if (v38)
            {
              unsigned __int16 v19 = v38[v39 + v13];
              goto LABEL_14;
            }
            int64_t v22 = v41;
            if (v42 <= v13 || v41 > v13)
            {
              int64_t v24 = v13 - 4;
              if ((unint64_t)v13 < 4) {
                int64_t v24 = 0;
              }
              if (v24 + 64 < v40) {
                CFIndex v16 = v24 + 64;
              }
              int64_t v41 = v24;
              int64_t v42 = v16;
              v46.location = v39 + v24;
              v46.length = v16 - v24;
              CFStringGetCharacters(theString, v46, buffer);
              int64_t v22 = v41;
            }
            int64_t v18 = v13 - v22;
            uint64_t v17 = buffer;
          }
          unsigned __int16 v19 = v17[v18];
LABEL_14:
          if (v19 > 0x2017u)
          {
            if (v19 - 8216 > 1) {
              goto LABEL_24;
            }
          }
          else if (v19 != 39 && v19 != 96 && v19 != 180)
          {
            goto LABEL_24;
          }
          if (*(void *)&v43[0])
          {
            CFIndex v20 = (void *)v43 + 1;
            while (-[__CFString rangeOfString:options:range:](v8, "rangeOfString:options:range:") == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*v20++) {
                goto LABEL_24;
              }
            }
            id v7 = [(SGStringPreprocessor *)v27 bufferPtrWithMinimumLength:++v15];
            v7[v14++] = 39;
            v7[v14] = 32;
            goto LABEL_25;
          }
LABEL_24:
          v7[v14] = v19;
LABEL_25:
          ++v14;
          if (++v13 == Length) {
            goto LABEL_40;
          }
        }
      }
      uint64_t v14 = 0;
LABEL_40:
      id v4 = v26;
      self = v27;
    }
    else
    {
      uint64_t v14 = 0;
    }

    if (v14 != v6) {
      [(SGStringPreprocessor *)self replace:v8 withBuffer:v7 toIndex:v14];
    }
    for (uint64_t i = 112; i != -8; i -= 8)
  }
}

- (void)separateCharacter:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length] != 1)
  {
    long long v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 256, @"Invalid parameter not satisfying: %@", @"value.length == 1" object file lineNumber description];
  }
  uint64_t v8 = [v6 length];
  if (!v8) {
    goto LABEL_43;
  }
  uint64_t v9 = v8;
  CFCharacterSetRef theSet = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  int v10 = [v7 characterAtIndex:0];
  if ((v10 & 0xF800 | 0x400) == 0xDC00)
  {
    long long v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"SGStringPreprocessingTransformer.m", 261, @"Invalid parameter not satisfying: %@", @"!CFUniCharIsSurrogateHighCharacter(separator) && !CFUniCharIsSurrogateLowCharacter(separator)" object file lineNumber description];
  }
  int v11 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v9];
  uint64_t v12 = (__CFString *)v6;
  int64_t v13 = self;

  if (!v13) {
    goto LABEL_39;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v41 = 0u;
  CFIndex Length = CFStringGetLength(v12);
  CFStringRef theString = v12;
  uint64_t v51 = 0;
  CFIndex v52 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v12);
  CStringPtr = 0;
  int64_t v49 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
  }
  int64_t v53 = 0;
  int64_t v54 = 0;
  CFRange v50 = CStringPtr;
  if (Length < 1)
  {
LABEL_39:

    goto LABEL_42;
  }
  long long v34 = v12;
  id v35 = v7;
  id v36 = v6;
  uint64_t v17 = 0;
  int64_t v18 = 0;
  char v37 = 0;
  char v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 64;
  do
  {
    if ((unint64_t)v18 >= 4) {
      uint64_t v22 = 4;
    }
    else {
      uint64_t v22 = v18;
    }
    CFIndex v23 = v52;
    if (v52 <= v18)
    {
      UniChar v24 = 0;
    }
    else if (v49)
    {
      UniChar v24 = v49[v18 + v51];
    }
    else if (v50)
    {
      UniChar v24 = v50[v51 + v18];
    }
    else
    {
      int64_t v26 = v53;
      if (v54 <= v18 || v53 > v18)
      {
        uint64_t v28 = v22 + v17;
        uint64_t v29 = v21 - v22;
        int64_t v30 = v18 - v22;
        CFIndex v31 = v30 + 64;
        if (v30 + 64 >= v52) {
          CFIndex v31 = v52;
        }
        int64_t v53 = v30;
        int64_t v54 = v31;
        if (v52 >= v29) {
          CFIndex v23 = v29;
        }
        v55.length = v23 + v28;
        v55.location = v30 + v51;
        CFStringGetCharacters(theString, v55, buffer);
        int64_t v26 = v53;
      }
      UniChar v24 = buffer[v18 - v26];
    }
    if (v10 == v24 || (v19 & 1) == 0)
    {
      if (v10 != v24)
      {
LABEL_24:
        char v19 = 0;
        v11[v20++] = v24;
        goto LABEL_25;
      }
    }
    else if (!CFCharacterSetIsCharacterMember(theSet, v24))
    {
      goto LABEL_24;
    }
    if ((v19 & 1) == 0)
    {
      v9 += 2;
      int v11 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v9];
      uint64_t v25 = &v11[v20];
      *uint64_t v25 = 32;
      v25[1] = v10;
      v20 += 3;
      v25[2] = 32;
      char v37 = 1;
    }
    char v19 = 1;
LABEL_25:
    ++v18;
    --v17;
    ++v21;
  }
  while (Length != v18);

  id v7 = v35;
  id v6 = v36;
  if (v37) {
    [(SGStringPreprocessor *)self replace:v34 withBuffer:v11 toIndex:v20];
  }
LABEL_42:

LABEL_43:
}

- (void)lowerCase:(id)a3
{
}

- (id)characterSetFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 1)
  {
    id v4 = (void *)MEMORY[0x263F08708];
    unsigned int v5 = [v3 characterAtIndex:0];

    id v6 = objc_msgSend(v4, "characterSetWithRange:", v5, 1);
  }
  else
  {
    id v6 = _PASCharacterSetWithCharactersInString();
  }
  return v6;
}

- (void)removeCharacters:(id)a3 withExceptions:(id)a4 fromString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 length];
  if (v11)
  {
    uint64_t v12 = v11;
    int64_t v13 = [(SGStringPreprocessor *)self bufferPtrWithMinimumLength:v11];
    uint64_t v17 = 0;
    int64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v14 = MEMORY[0x263EF8330];
    id v15 = v8;
    id v16 = v9;
    _PASIterateLongChars();
    if (v18[3] != v12) {
      -[SGStringPreprocessor replace:withBuffer:toIndex:](self, "replace:withBuffer:toIndex:", v10, v13, v14, 3221225472, __67__SGStringPreprocessor_removeCharacters_withExceptions_fromString___block_invoke, &unk_2647EA210, v15, v16, &v17, v13);
    }

    _Block_object_dispose(&v17, 8);
  }
}

CFCharacterSetRef __67__SGStringPreprocessor_removeCharacters_withExceptions_fromString___block_invoke(uint64_t a1, UTF32Char a2, const void *a3, uint64_t a4, uint64_t a5)
{
  if (!CFCharacterSetIsLongCharacterMember(*(CFCharacterSetRef *)(a1 + 32), a2)
    || (CFCharacterSetRef result = *(const __CFCharacterSet **)(a1 + 40)) != 0
    && (CFCharacterSetRef result = (const __CFCharacterSet *)CFCharacterSetIsLongCharacterMember(result, a2), result))
  {
    CFCharacterSetRef result = (const __CFCharacterSet *)memcpy((void *)(*(void *)(a1 + 56)+ 2 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), a3, 2 * a5);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a5;
  }
  return result;
}

- (void)replace:(id)a3 withBuffer:(unsigned __int16 *)a4 toIndex:(unint64_t)a5
{
  id v7 = (objc_class *)NSString;
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)[[v7 alloc] initWithCharactersNoCopy:a4 length:a5 freeWhenDone:0];
  CFStringReplaceAll(v8, v9);
}

- (unsigned)bufferPtrWithMinimumLength:(unint64_t)a3
{
  unint64_t v4 = 2 * a3;
  NSUInteger v5 = [(NSMutableData *)self->_buffer length];
  unint64_t v6 = v4 - v5;
  if (v4 > v5) {
    [(NSMutableData *)self->_buffer increaseLengthBy:v6];
  }
  buffer = self->_buffer;
  return (unsigned __int16 *)[(NSMutableData *)buffer mutableBytes];
}

- (SGStringPreprocessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGStringPreprocessor;
  v2 = [(SGStringPreprocessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;
  }
  return v2;
}

@end