@interface QuickTypeMecabraEvaluator
- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (QuickTypeMecabraEvaluator)init;
- (id)evaluateChineseText:(id)a3;
- (id)evaluateJapaneseText:(id)a3;
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation QuickTypeMecabraEvaluator

- (QuickTypeMecabraEvaluator)init
{
  v3.receiver = self;
  v3.super_class = (Class)QuickTypeMecabraEvaluator;
  return [(QuickTypeMecabraEvaluator *)&v3 init];
}

- (BOOL)matchRecordInfo:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [a4 objectForKey:@"localeIdentifier"];
  v8 = [v6 objectForKey:@"localeIdentifier"];
  BOOL v9 = 0;
  if (v8 && v7)
  {
    v10 = +[NSLocale localeWithLocaleIdentifier:v7];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 languageCode];
      v13 = v12;
      if (v12
        && (([v12 isEqualToString:@"zh"] & 1) != 0
         || ([v13 isEqualToString:@"ja"] & 1) != 0))
      {
        BOOL v9 = +[QuickTypeEvaluatorUtils isMatchingRecipeLocale:v7 withRecordLocale:v8];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 0;
}

- (id)evaluateJapaneseText:(id)a3
{
  theString = (__CFString *)a3;
  objc_super v3 = (__CFStringTokenizer *)sub_A6E0(@"ja");
  uint64_t v33 = sub_A808(@"ja");
  v41.length = CFStringGetLength(theString);
  v41.CFIndex location = 0;
  CFStringTokenizerSetString(v3, theString, v41);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v30 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  CFIndex v7 = 0;
  cf = Mutable;
  do
  {
    uint64_t v8 = v5;
    CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v3);
    CFStringRef v36 = 0;
    CFIndex Length = CFStringGetLength(theString);
    if (Token)
    {
      CFStringRef v12 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v3, 0x400000uLL);
      CFStringRef v36 = v12;
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v3);
      CFIndex location = CurrentTokenRange.location;
      CFIndex v15 = CurrentTokenRange.length;
      if (v12)
      {
        int CharacterAtIndex = CFStringGetCharacterAtIndex(v12, 0);
        if ((CharacterAtIndex - 12449) < 0x5A
          || CharacterAtIndex == 12316
          || CharacterAtIndex == 12540
          || (CharacterAtIndex - 12353) < 0x56)
        {
          CFStringAppend(Mutable, v12);
          CFStringRef v17 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, CurrentTokenRange);
          uint64_t v18 = sub_A894(v33, 10, (uint64_t)v12, v17);
          if (v18) {
            uint64_t v19 = v31;
          }
          else {
            uint64_t v19 = v31 + 1;
          }
          uint64_t v20 = v30;
          if (v18 < 2) {
            uint64_t v20 = v30 + 1;
          }
          uint64_t v30 = v20;
          uint64_t v31 = v19;
          if (v17) {
            CFRelease(v17);
          }
          ++v32;
          goto LABEL_25;
        }
      }
    }
    else
    {
      CFIndex location = Length;
      CFStringRef v12 = 0;
      CFIndex v15 = 0;
    }
    if (location - v7 >= 1)
    {
      v42.CFIndex location = v7;
      v42.length = location - v7;
      CFStringRef v35 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, v42);
      if (sub_A894(v33, 8, (uint64_t)Mutable, v35) != -1) {
        ++v6;
      }
      Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
      if (cf) {
        CFRelease(cf);
      }
      cf = Mutable;
      if (v35) {
        CFRelease(v35);
      }
      ++v8;
      CFIndex v7 = location + v15;
      CFStringRef v12 = v36;
    }
LABEL_25:
    if (v12) {
      CFRelease(v12);
    }
    uint64_t v5 = v8;
  }
  while (Token);
  if (!v32)
  {
    v28 = 0;
    if (!Mutable) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  *(float *)&double v11 = (float)v31 / (float)v32;
  v21 = +[NSNumber numberWithFloat:v11];
  *(float *)&double v22 = (float)v30 / (float)v32;
  v23 = +[NSNumber numberWithFloat:v22];
  v24 = +[NSNumber numberWithInteger:v32];
  *(float *)&double v25 = (float)v6 / (float)v8;
  v26 = +[NSNumber numberWithFloat:v25];
  v38[0] = @"TopCandidateAccuracy";
  v38[1] = @"Top2CandidateAccuracy";
  v39[0] = v21;
  v39[1] = v23;
  v38[2] = @"WordCount";
  v38[3] = @"SentenceAccuracy";
  v39[2] = v24;
  v39[3] = v26;
  v38[4] = @"SentenceCount";
  v27 = +[NSNumber numberWithLong:v8];
  v39[4] = v27;
  v28 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];

  if (Mutable) {
LABEL_32:
  }
    CFRelease(Mutable);
LABEL_33:

  return v28;
}

- (id)evaluateChineseText:(id)a3
{
  theString = (__CFString *)a3;
  objc_super v3 = (__CFStringTokenizer *)sub_A6E0(@"zh");
  uint64_t v35 = sub_A808(@"zh-Hans");
  v40.length = CFStringGetLength(theString);
  v40.CFIndex location = 0;
  CFStringTokenizerSetString(v3, theString, v40);
  Mutable = CFStringCreateMutable(0, 0);
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  CFIndex v7 = 0;
  uint64_t v32 = 0;
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v3);
      if (!Token)
      {
        CFIndex Length = CFStringGetLength(theString);
        CFIndex v13 = 0;
        break;
      }
      CFStringRef v9 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v3, 0x200000uLL);
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v3);
      CFIndex Length = CurrentTokenRange.location;
      CFIndex v13 = CurrentTokenRange.length;
      if (!v9 || CFStringGetCharacterAtIndex(v9, 0) - 97 >= 0x1A) {
        break;
      }
      CFStringRef v31 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, CurrentTokenRange);
      CFMutableStringRef v14 = CFStringCreateMutable(0, 0);
      if (CFStringGetLength(v9) >= 2)
      {
        CFIndex v15 = 0;
        CFIndex v16 = 1;
        do
        {
          if (CFStringGetCharacterAtIndex(v9, v16) - 49 <= 4)
          {
            v41.length = v16 - v15;
            v41.CFIndex location = v15;
            CFStringRef v17 = CFStringCreateWithSubstring(kCFAllocatorDefault, v9, v41);
            CFStringAppend(v14, v17);
            CFRelease(v17);
            CFIndex v15 = ++v16;
          }
          ++v16;
        }
        while (v16 < CFStringGetLength(v9));
      }
      CFStringAppend(Mutable, v14);
      uint64_t v18 = sub_A894(v35, 0, (uint64_t)v14, v31);
      if (v18) {
        uint64_t v19 = v33;
      }
      else {
        uint64_t v19 = v33 + 1;
      }
      uint64_t v20 = v32;
      if (v18 < 2) {
        uint64_t v20 = v32 + 1;
      }
      uint64_t v32 = v20;
      uint64_t v33 = v19;
      CFRelease(v31);
      CFRelease(v14);
      ++v34;
      CFRelease(v9);
    }
    if (Length - v7 >= 1)
    {
      v42.CFIndex location = v7;
      v42.length = Length - v7;
      CFStringRef v21 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, v42);
      if (sub_A894(v35, 0, (uint64_t)Mutable, v21) != -1) {
        ++v6;
      }
      CFRelease(v21);
      CFRelease(Mutable);
      Mutable = CFStringCreateMutable(0, 0);
      ++v5;
    }
    CFIndex v7 = Length + v13;
  }
  while (Token);
  if (v34)
  {
    *(float *)&double v10 = (float)v33 / (float)v34;
    double v22 = +[NSNumber numberWithFloat:v10];
    *(float *)&double v23 = (float)v32 / (float)v34;
    v24 = +[NSNumber numberWithFloat:v23];
    double v25 = +[NSNumber numberWithInteger:v34];
    *(float *)&double v26 = (float)v6 / (float)v5;
    v27 = +[NSNumber numberWithFloat:v26];
    v37[0] = @"TopCandidateAccuracy";
    v37[1] = @"Top2CandidateAccuracy";
    v38[0] = v22;
    v38[1] = v24;
    v37[2] = @"WordCount";
    v37[3] = @"SentenceAccuracy";
    v38[2] = v25;
    v38[3] = v27;
    v37[4] = @"SentenceCount";
    v28 = +[NSNumber numberWithLong:v5];
    v38[4] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v9 = a5;
  double v10 = [a4 objectForKey:@"localeIdentifier"];
  double v11 = +[NSLocale localeWithLocaleIdentifier:v10];
  CFStringRef v12 = [v11 languageCode];
  id v13 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
  if ([v12 isEqualToString:@"zh"])
  {
    uint64_t v14 = [(QuickTypeMecabraEvaluator *)self evaluateChineseText:v13];
LABEL_5:
    CFIndex v15 = (void *)v14;
    goto LABEL_7;
  }
  if ([v12 isEqualToString:@"ja"])
  {
    uint64_t v14 = [(QuickTypeMecabraEvaluator *)self evaluateJapaneseText:v13];
    goto LABEL_5;
  }
  CFIndex v15 = 0;
LABEL_7:

  return v15;
}

@end