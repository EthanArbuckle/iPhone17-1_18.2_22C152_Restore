@interface DDURLifier
+ (BOOL)urlIfyNode:(id)a3;
+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4;
+ (BOOL)urlIfyTextNode:(id)a3 inNode:(id)a4 forMatches:(id)a5;
+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5;
+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5 withReferenceDate:(id)a6 andTimeZone:(id)a7;
+ (id)urlMatchesForString:(id)a3;
+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4;
+ (id)urlMatchesForString:(id)a3 phoneNumberTypes:(unint64_t)a4;
+ (id)urlMatchesForString:(id)a3 usingScanner:(__DDScanner *)a4 withPhoneNumberTypes:(unint64_t)a5 referenceDate:(id)a6 timeZone:(id)a7 storingResultsIn:(id)a8;
@end

@implementation DDURLifier

+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5 withReferenceDate:(id)a6 andTimeZone:(id)a7
{
  if (!a4)
  {
    if (urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone__sOnce == -1) {
      return 0;
    }
    dispatch_once(&urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone__sOnce, &__block_literal_global_42);
    return 0;
  }
  if (!shouldURLifyNode(a3)) {
    return 0;
  }
  if (a6)
  {
    if (a7) {
      goto LABEL_5;
    }
  }
  else
  {
    a6 = (id)[MEMORY[0x1E4F1C9C8] date];
    if (a7) {
      goto LABEL_5;
    }
  }
  a7 = (id)[MEMORY[0x1E4F1CAF0] defaultTimeZone];
LABEL_5:
  v13 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = [a3 firstChild];
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      uint64_t v16 = [v15 nextSibling];
      objc_msgSend(v13, "addObjectsFromArray:", objc_msgSend(a1, "urlIfyNode:usingScanner:phoneNumberTypes:withReferenceDate:andTimeZone:", v15, a4, a5, a6, a7));
      if ([v15 nodeType] == 3) {
        objc_msgSend(a1, "urlIfyTextNode:inNode:forMatches:", v15, a3, objc_msgSend(a1, "urlMatchesForString:usingScanner:withPhoneNumberTypes:referenceDate:timeZone:storingResultsIn:", objc_msgSend(v15, "nodeValue"), a4, a5, a6, a7, v13));
      }
      v15 = (void *)v16;
    }
    while (v16);
  }
  return v13;
}

void __85__DDURLifier_urlIfyNode_usingScanner_phoneNumberTypes_withReferenceDate_andTimeZone___block_invoke()
{
}

+ (id)urlIfyNode:(id)a3 usingScanner:(__DDScanner *)a4 phoneNumberTypes:(unint64_t)a5
{
  return (id)[a1 urlIfyNode:a3 usingScanner:a4 phoneNumberTypes:a5 withReferenceDate:0 andTimeZone:0];
}

+ (BOOL)urlIfyNode:(id)a3
{
  return [a1 urlIfyNode:a3 phoneNumberTypes:2];
}

+ (BOOL)urlIfyNode:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  if (shouldURLifyNode(a3) && (uint64_t v7 = [a3 firstChild]) != 0)
  {
    v8 = (void *)v7;
    int v9 = 0;
    do
    {
      uint64_t v10 = [v8 nextSibling];
      v9 |= [a1 urlIfyNode:v8 phoneNumberTypes:a4];
      if ([v8 nodeType] == 3) {
        v9 |= objc_msgSend(a1, "urlIfyTextNode:inNode:forMatches:", v8, a3, +[DDURLifier urlMatchesForString:phoneNumberTypes:](DDURLifier, "urlMatchesForString:phoneNumberTypes:", objc_msgSend(v8, "nodeValue"), a4));
      }
      v8 = (void *)v10;
    }
    while (v10);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9 & 1;
}

+ (BOOL)urlIfyTextNode:(id)a3 inNode:(id)a4 forMatches:(id)a5
{
  unint64_t v8 = [a5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    unsigned int v11 = 1;
    id v12 = a3;
    do
    {
      v13 = (void *)[a5 objectAtIndex:v9];
      unint64_t v14 = [v13 range];
      if (v14 >= v10)
      {
        unint64_t v16 = v14;
        unint64_t v17 = v15;
        if (v14 < objc_msgSend((id)objc_msgSend(v12, "data"), "length") + v10)
        {
          if (v16 != v10) {
            a3 = (id)[v12 splitText:(v16 - v10)];
          }
          if (v17 < objc_msgSend((id)objc_msgSend(a3, "data"), "length")) {
            id v12 = (id)[a3 splitText:v17];
          }
          unint64_t v10 = v16 + v17;
          v18 = objc_msgSend((id)objc_msgSend(a3, "ownerDocument"), "createElement:", @"a");
          objc_msgSend(v18, "setAttribute:value:", @"href", objc_msgSend(v13, "url"));
          [a4 insertBefore:v18 refChild:a3];
          [v18 appendChild:a3];
          a3 = v12;
        }
      }
      uint64_t v9 = v11;
    }
    while (v8 > v11++);
  }
  return v8 != 0;
}

+ (id)urlMatchesForString:(id)a3 usingScanner:(__DDScanner *)a4 withPhoneNumberTypes:(unint64_t)a5 referenceDate:(id)a6 timeZone:(id)a7 storingResultsIn:(id)a8
{
  char v9 = a5;
  DDScannerScanString((uint64_t)a4, (CFStringRef)a3);
  CFArrayRef v11 = DDScannerCopyResultsWithOptions((uint64_t)a4, 0x7C5u);
  if (!v11) {
    return 0;
  }
  CFArrayRef v12 = v11;
  CFIndex Count = CFArrayGetCount(v11);
  if (Count)
  {
    uint64_t v14 = Count;
    unint64_t v15 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    uint64_t v16 = [a8 count];
    if (v14 >= 1)
    {
      uint64_t v17 = v16;
      for (CFIndex i = 0; i != v14; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v12, i);
        uint64_t v20 = DDURLStringForResult((uint64_t)ValueAtIndex, objc_msgSend(NSString, "stringWithFormat:", @"%lu", v17), v9, a6, (const __CFTimeZone *)a7);
        if (v20)
        {
          uint64_t v21 = v20;
          ++v17;
          [a8 addObject:ValueAtIndex];
          v22 = -[DDURLMatch initWithRange:url:]([DDURLMatch alloc], "initWithRange:url:", ValueAtIndex[4], ValueAtIndex[5], v21);
          [v15 addObject:v22];
        }
      }
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  CFRelease(v12);
  return v15;
}

+ (id)urlMatchesForString:(id)a3 phoneNumberTypes:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([a3 length])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke;
    v19[3] = &unk_1E5985760;
    v19[4] = a1;
    if (urlMatchesForString_phoneNumberTypes__sOnce != -1) {
      dispatch_once(&urlMatchesForString_phoneNumberTypes__sOnce, v19);
    }
    if (urlMatchesForString_phoneNumberTypes__sOnce_26 != -1) {
      dispatch_once(&urlMatchesForString_phoneNumberTypes__sOnce_26, &__block_literal_global_1201);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_3;
    block[3] = &unk_1E59853D8;
    block[4] = a3;
    block[5] = &v20;
    dispatch_sync((dispatch_queue_t)urlMatchesForString_phoneNumberTypes__sQueue, block);
    CFArrayRef v8 = (const __CFArray *)v21[3];
    if (v8)
    {
      CFIndex Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v21[3], i);
          uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", i);
          if (DDResultGetCategory((uint64_t)ValueAtIndex) - 1 <= 1)
          {
            uint64_t v13 = DDURLStringForResult((uint64_t)ValueAtIndex, v12, v4, 0, 0);
            if (v13)
            {
              uint64_t RangeForURLification = DDResultGetRangeForURLification((uint64_t)ValueAtIndex);
              uint64_t v16 = -[DDURLMatch initWithRange:url:]([DDURLMatch alloc], "initWithRange:url:", RangeForURLification, v15, v13);
              [v7 addObject:v16];
            }
          }
        }
      }
      CFRelease((CFTypeRef)v21[3]);
    }
    _Block_object_dispose(&v20, 8);
  }
  return v7;
}

uint64_t __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t result = objc_opt_class();
  if (v1 == result)
  {
    uint64_t result = DDScannerCreateWithTypeAndLocale(1, 0, 0);
    _sharedURLifier = result;
  }
  return result;
}

CFArrayRef __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_3(uint64_t a1)
{
  CFArrayRef result = (CFArrayRef)_sharedURLifier;
  if (_sharedURLifier)
  {
    CFArrayRef result = (CFArrayRef)DDScannerScanString(_sharedURLifier, *(CFStringRef *)(a1 + 32));
    if (result)
    {
      CFArrayRef result = DDScannerCopyResultsWithOptions(_sharedURLifier, 0x7C5u);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

dispatch_queue_t __51__DDURLifier_urlMatchesForString_phoneNumberTypes___block_invoke_2()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.datadetectors.urlifier", 0);
  urlMatchesForString_phoneNumberTypes__sQueue = (uint64_t)result;
  return result;
}

+ (id)urlMatchesForString:(id)a3 includingTel:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  return (id)[a1 urlMatchesForString:a3 phoneNumberTypes:v4];
}

+ (id)urlMatchesForString:(id)a3
{
  return (id)[a1 urlMatchesForString:a3 phoneNumberTypes:2];
}

@end