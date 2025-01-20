@interface SGTokenizerML
+ (id)tokenize:(id)a3;
+ (void)enumerateTokensInString:(id)a3 block:(id)a4;
+ (void)enumerateTokensInString:(id)a3 withRange:(_NSRange)a4 block:(id)a5;
@end

@implementation SGTokenizerML

+ (id)tokenize:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__SGTokenizerML_tokenize___block_invoke;
  v8[3] = &unk_2647EAE68;
  id v6 = v5;
  id v9 = v6;
  [a1 enumerateTokensInString:v4 block:v8];

  return v6;
}

uint64_t __26__SGTokenizerML_tokenize___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (void)enumerateTokensInString:(id)a3 withRange:(_NSRange)a4 block:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"SGFutureFoundationFramework.m", 41, @"Invalid parameter not satisfying: %@", @"str" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x263F08690] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"SGFutureFoundationFramework.m", 42, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (enumerateTokensInString_withRange_block___pasOnceToken2 != -1) {
    dispatch_once(&enumerateTokensInString_withRange_block___pasOnceToken2, block);
  }
  id v13 = (id)enumerateTokensInString_withRange_block___pasExprOnceResult;
  v14 = [v13 result];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_3;
  v19[3] = &unk_2647EAE40;
  NSUInteger v22 = location;
  NSUInteger v23 = length;
  id v20 = v10;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  [v14 runWithLockAcquired:v19];
}

void __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A66BDC0]();
  id v3 = objc_alloc(MEMORY[0x263F61E60]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_2;
  v6[3] = &__block_descriptor_48_e20____PASQueueLock_8__0l;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = [v3 initWithBlock:v6 idleTimeout:1.0];
  v5 = (void *)enumerateTokensInString_withRange_block___pasExprOnceResult;
  enumerateTokensInString_withRange_block___pasExprOnceResult = v4;
}

void __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringTokenizerSetString(v3, *(CFStringRef *)(a1 + 32), *(CFRange *)(a1 + 48));
  while (CFStringTokenizerAdvanceToNextToken(v3))
  {
    uint64_t v4 = (void *)MEMORY[0x22A66BDC0]();
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v3);
    id v6 = *(void **)(a1 + 32);
    long long v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v8 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v7, 0, CurrentTokenRange.location, CurrentTokenRange.length);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  v10.NSUInteger location = 0;
  v10.NSUInteger length = 1;
  CFStringTokenizerSetString(v3, @"⌘", v10);
  CFRelease(v3);
}

id __57__SGTokenizerML_enumerateTokensInString_withRange_block___block_invoke_2(uint64_t a1)
{
  CFArrayRef v2 = CFLocaleCopyPreferredLanguages();
  if (v2)
  {
    CFArrayRef v3 = v2;
    if (CFArrayGetCount(v2))
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, 0);
      CFLocaleRef v5 = CFLocaleCreate(0, ValueAtIndex);
      CFRelease(v3);
      if (v5) {
        goto LABEL_8;
      }
    }
    else
    {
      CFRelease(v3);
    }
  }
  CFLocaleRef v5 = CFLocaleCopyCurrent();
  if (!v5)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGFutureFoundationFramework.m", 60, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];
  }
LABEL_8:
  v15.NSUInteger location = 0;
  v15.NSUInteger length = 0;
  CFStringTokenizerRef v6 = CFStringTokenizerCreate(0, 0, v15, 0x810004uLL, v5);
  CFRelease(v5);
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"SGFutureFoundationFramework.m", 66, @"Invalid parameter not satisfying: %@", @"guardedTokenizer" object file lineNumber description];
  }
  id v7 = objc_alloc(MEMORY[0x263F61E80]);
  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("SGTokenizerML", v8);
  CFRange v10 = (void *)[v7 initWithGuardedData:v6 serialQueue:v9];

  return v10;
}

+ (void)enumerateTokensInString:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_msgSend((id)objc_opt_class(), "enumerateTokensInString:withRange:block:", v6, 0, objc_msgSend(v6, "length"), v5);
}

@end