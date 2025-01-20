@interface NSString(SnippetGeneration)
- (BOOL)_snippetOptions:()SnippetGeneration hasOption:;
- (id)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:options:;
- (uint64_t)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:;
@end

@implementation NSString(SnippetGeneration)

- (uint64_t)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:
{
  return objc_msgSend(a1, "ck_trimmedStringWithPreferredLength:anchoredAroundSubstring:options:", a3, a4, 0);
}

- (id)ck_trimmedStringWithPreferredLength:()SnippetGeneration anchoredAroundSubstring:options:
{
  id v8 = a4;
  uint64_t v9 = [(__CFString *)a1 rangeOfString:v8 options:129];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (([(__CFString *)a1 _snippetOptions:a5 hasOption:4] & 1) == 0) {
      a3 = [(__CFString *)a1 length];
    }
    v11 = -[__CFString substringWithRange:](a1, "substringWithRange:", 0, a3);
    goto LABEL_30;
  }
  uint64_t v12 = v9;
  uint64_t v13 = v10;
  if ([(__CFString *)a1 _snippetOptions:a5 hasOption:2]) {
    a3 -= [v8 length];
  }
  CFLocaleRef v14 = CFLocaleCopyCurrent();
  v38.length = [(__CFString *)a1 length];
  v38.CFIndex location = 0;
  v15 = CFStringTokenizerCreate(0, a1, v38, 0, v14);
  if (v14) {
    CFRelease(v14);
  }
  uint64_t v16 = [(__CFString *)a1 length];
  if (v15)
  {
    unint64_t v17 = v16;
    CFIndex location = 0;
    if (CFStringTokenizerAdvanceToNextToken(v15))
    {
      uint64_t v19 = v12 + v13;
      CFIndex v20 = v12 - (a3 >> 1);
      CFIndex v21 = v19 + (a3 >> 1);
      do
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v15);
        CFIndex v23 = CurrentTokenRange.location + CurrentTokenRange.length;
        BOOL v24 = CurrentTokenRange.location + CurrentTokenRange.length >= v20;
        BOOL v25 = CurrentTokenRange.location <= v21;
        if (!location) {
          CFIndex v23 = v17;
        }
        char v26 = v24 && v25;
        if (v24 && v25) {
          unint64_t v17 = v23;
        }
        if (v24 && v25 && location == 0) {
          CFIndex location = CurrentTokenRange.location;
        }
      }
      while (CFStringTokenizerAdvanceToNextToken(v15));
    }
    else
    {
      char v26 = 1;
    }
    CFRelease(v15);
    BOOL v28 = location > 0;
    uint64_t v27 = location & ~(location >> 63);
    if ((v26 & 1) == 0 && v17 <= [(__CFString *)a1 length])
    {
      int v29 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v27 = 0;
    BOOL v28 = 0;
  }
  unint64_t v17 = [(__CFString *)a1 length];
  int v29 = 0;
LABEL_25:
  v30 = [MEMORY[0x1E4F28E78] string];
  if (v28)
  {
    v31 = CKFrameworkBundle();
    v32 = [v31 localizedStringForKey:@"ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v30 appendString:v32];
  }
  v33 = -[__CFString substringWithRange:](a1, "substringWithRange:", v27, v17 - v27);
  [v30 appendString:v33];

  if (v29)
  {
    v34 = CKFrameworkBundle();
    v35 = [v34 localizedStringForKey:@"ELLIPSES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v30 appendString:v35];
  }
  v11 = (void *)[v30 copy];

LABEL_30:

  return v11;
}

- (BOOL)_snippetOptions:()SnippetGeneration hasOption:
{
  return (a4 & ~a3) == 0;
}

@end