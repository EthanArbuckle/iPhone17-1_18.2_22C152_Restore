@interface NSString(AXExtensions)
- (AXAttributedString)axAttributedStringWithAttributes:()AXExtensions;
- (uint64_t)_axUnit:()AXExtensions fromPosition:inDirection:;
- (uint64_t)_ax_rangeOfNextUnitWithStartPosition:()AXExtensions direction:withCharacterSet:;
- (uint64_t)ax_lineFromPosition:()AXExtensions inDirection:;
- (uint64_t)ax_lineRangeForPosition:()AXExtensions;
- (uint64_t)ax_paragraphFromPosition:()AXExtensions inDirection:;
- (uint64_t)ax_sentenceFromPosition:()AXExtensions inDirection:;
- (uint64_t)ax_wordFromPosition:()AXExtensions inDirection:;
@end

@implementation NSString(AXExtensions)

- (uint64_t)_ax_rangeOfNextUnitWithStartPosition:()AXExtensions direction:withCharacterSet:
{
  id v8 = a5;
  uint64_t v9 = [a1 length];
  if (v9 && ((uint64_t v10 = v9, a3 > 0) || a4 != 1) && (a4 || v9 > a3))
  {
    if (v9 >= a3) {
      uint64_t v13 = a3;
    }
    else {
      uint64_t v13 = v9;
    }
    if (a3 >= 0) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    if (a4) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = 0;
    }
    if (a4) {
      uint64_t v16 = -1;
    }
    else {
      uint64_t v16 = 1;
    }
    uint64_t v11 = 0x7FFFFFFFLL;
    while (objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v15 + v14)))
    {
      v14 += v16;
      if (v14 >= v10 || v14 < 1) {
        goto LABEL_7;
      }
    }
    if (a4 == 1) {
      uint64_t v17 = 6;
    }
    else {
      uint64_t v17 = 2;
    }
    if (a4) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v14;
    }
    if (a4) {
      uint64_t v19 = v14;
    }
    else {
      uint64_t v19 = v10 - v14;
    }
    if (a4) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v10;
    }
    uint64_t v21 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v8, v17, v18, v19);
    if (a4 == 1) {
      uint64_t v22 = v21 + 1;
    }
    else {
      uint64_t v22 = v21;
    }
    if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v22 = v20;
    }
    uint64_t v23 = v22 - v18;
    if (a4) {
      uint64_t v23 = v18 + v19 - v22;
    }
    else {
      uint64_t v22 = v14;
    }
    if (v23 + v22 <= (unint64_t)v10) {
      uint64_t v11 = v22;
    }
    else {
      uint64_t v11 = 0x7FFFFFFFLL;
    }
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFLL;
  }
LABEL_7:

  return v11;
}

- (uint64_t)ax_lineFromPosition:()AXExtensions inDirection:
{
  v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v8 = objc_msgSend(a1, "_ax_rangeOfNextUnitWithStartPosition:direction:withCharacterSet:", a3, a4, v7);

  return v8;
}

- (uint64_t)ax_paragraphFromPosition:()AXExtensions inDirection:
{
  return [a1 _axUnit:2 fromPosition:a3 inDirection:a4];
}

- (uint64_t)ax_sentenceFromPosition:()AXExtensions inDirection:
{
  return [a1 _axUnit:1 fromPosition:a3 inDirection:a4];
}

- (uint64_t)ax_wordFromPosition:()AXExtensions inDirection:
{
  return [a1 _axUnit:0 fromPosition:a3 inDirection:a4];
}

- (uint64_t)ax_lineRangeForPosition:()AXExtensions
{
  uint64_t v5 = [a1 length];
  uint64_t v6 = 0x7FFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = v5;
    if (v5 >= a3)
    {
      uint64_t v8 = objc_msgSend(a1, "ax_lineFromPosition:inDirection:", a3, 0);
      uint64_t v6 = objc_msgSend(a1, "ax_lineFromPosition:inDirection:", a3, 1);
      if (v7 <= a3
        || ([MEMORY[0x1E4F28B88] newlineCharacterSet],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            char v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)),
            v9,
            (v10 & 1) == 0))
      {
        if (a3)
        {
          uint64_t v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          char v12 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3 - 1));
        }
        else
        {
          char v12 = 0;
        }
        if (v6 == 0x7FFFFFFF) {
          uint64_t v13 = v8;
        }
        else {
          uint64_t v13 = v6;
        }
        if (v12) {
          return v8;
        }
        else {
          return v13;
        }
      }
    }
  }
  return v6;
}

- (uint64_t)_axUnit:()AXExtensions fromPosition:inDirection:
{
  uint64_t v9 = [(__CFString *)a1 length];
  CFIndex v10 = v9;
  if (a4 < 0 && a5 == 1 || !a5 && v9 <= a4) {
    return 0x7FFFFFFFLL;
  }
  if (v9 >= a4) {
    CFIndex v12 = a4;
  }
  else {
    CFIndex v12 = v9;
  }
  if (a4 >= 0) {
    CFIndex v13 = v12;
  }
  else {
    CFIndex v13 = 0;
  }
  uint64_t v14 = (UniChar *)malloc_type_malloc(2 * v9, 0x1000040BDFB0063uLL);
  v27.CFIndex length = [(__CFString *)a1 length];
  v27.CFIndex location = 0;
  CFStringGetCharacters(a1, v27, v14);
  v28.CFIndex location = 0;
  v28.CFIndex length = v10;
  uint64_t v15 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v28, a3, 0);
  if (a5)
  {
    if (v13 >= 1)
    {
      CFIndex v13 = v12 - 1;
      uint64_t v16 = 1;
      while ((__int16)v14[v13] != -4)
      {
        CFStringTokenizerGoToTokenAtIndex(v15, v13);
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v15);
        CFIndex length = CurrentTokenRange.length;
        CFIndex location = CurrentTokenRange.location;
        if (CurrentTokenRange.location != -1) {
          goto LABEL_26;
        }
        unint64_t v20 = v13-- + 1;
        if (v20 < 2) {
          goto LABEL_24;
        }
      }
      goto LABEL_28;
    }
  }
  else if (v13 < v10)
  {
    uint64_t v16 = 1;
    while (1)
    {
      if ((__int16)v14[v13] == -4) {
        goto LABEL_28;
      }
      CFStringTokenizerGoToTokenAtIndex(v15, v13);
      CFRange v21 = CFStringTokenizerGetCurrentTokenRange(v15);
      CFIndex length = v21.length;
      CFIndex location = v21.location;
      if (v21.location != -1) {
        break;
      }
      if (v10 == ++v13)
      {
LABEL_24:
        CFIndex v13 = -1;
LABEL_27:
        uint64_t v16 = length;
        goto LABEL_28;
      }
    }
LABEL_26:
    CFIndex v13 = location;
    goto LABEL_27;
  }
  uint64_t v16 = 0;
  CFIndex v13 = -1;
LABEL_28:
  free(v14);
  if (a3 || v13 == -1)
  {
    CFIndex v25 = v13;
  }
  else
  {
    CFIndex v22 = v16 + v13;
    uint64_t v23 = [MEMORY[0x1E4F28E58] punctuationCharacterSet];
    v24 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
    [v23 formUnionWithCharacterSet:v24];

    for (; v22 < v10; ++v22)
    {
      if (!objc_msgSend(v23, "characterIsMember:", -[__CFString characterAtIndex:](a1, "characterAtIndex:", v22)))break; {
    }
      }
    do
    {
      CFIndex v25 = v13;
      BOOL v26 = v13-- < 1;
    }
    while (!v26
         && (objc_msgSend(v23, "characterIsMember:", -[__CFString characterAtIndex:](a1, "characterAtIndex:", v13)) & 1) != 0);
  }
  CFRelease(v15);
  if (v25 == -1) {
    return 0x7FFFFFFFLL;
  }
  else {
    return v25;
  }
}

- (AXAttributedString)axAttributedStringWithAttributes:()AXExtensions
{
  id v4 = a3;
  uint64_t v5 = [[AXAttributedString alloc] initWithString:a1];
  [(AXAttributedString *)v5 setAttributes:v4];

  return v5;
}

@end