@interface BRLTEmojiPrintPreprocessor
- (BRLTEmojiPrintPreprocessor)init;
- (BRLTEmojiPrintPreprocessor)initWithPrimaryLanguageCode:(id)a3;
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
- (void)_commonInit;
- (void)_setupLocale;
- (void)dealloc;
@end

@implementation BRLTEmojiPrintPreprocessor

- (BRLTEmojiPrintPreprocessor)initWithPrimaryLanguageCode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTEmojiPrintPreprocessor;
  v6 = [(BRLTEmojiPrintPreprocessor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primaryLanguageCode, a3);
    [(BRLTEmojiPrintPreprocessor *)v7 _commonInit];
  }

  return v7;
}

- (BRLTEmojiPrintPreprocessor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BRLTEmojiPrintPreprocessor;
  v2 = [(BRLTEmojiPrintPreprocessor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BRLTEmojiPrintPreprocessor *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  [(BRLTEmojiPrintPreprocessor *)self _setupLocale];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__setupLocale name:*MEMORY[0x263EFFCC8] object:0];
}

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  if (v8)
  {
    id v22 = v9;
    unint64_t v10 = [v8 length];
    v11 = [MEMORY[0x263F089D8] string];
    if (a4)
    {
      v12 = [MEMORY[0x263EFF990] dataWithLength:0];
    }
    else
    {
      v12 = 0;
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    [v8 length];
    id v14 = v8;
    id v15 = v11;
    id v16 = v12;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    unint64_t v17 = v24[3];
    if (v10 > v17)
    {
      id v18 = v15;
      id v19 = v16;
      v20 = objc_msgSend(v14, "substringWithRange:", v17, v10 - v17);
      [v18 appendString:v20];

      while (v10 != v17)
      {
        unint64_t v27 = v17;
        [v19 appendBytes:&v27 length:8];
        ++v17;
      }
    }
    if (a4) {
      *a4 = v16;
    }
    id v13 = v15;

    _Block_object_dispose(&v23, 8);
    id v9 = v22;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __100__BRLTEmojiPrintPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v8 = a3 - v7;
  if (a3 > v7)
  {
    id v9 = *(void **)(a1 + 32);
    unint64_t v10 = *(void **)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    id v12 = v10;
    id v13 = objc_msgSend(v9, "substringWithRange:", v7, v8);
    [v11 appendString:v13];

    do
    {
      unint64_t v20 = v7;
      [v12 appendBytes:&v20 length:8];
      ++v7;
    }
    while (a3 != v7);
  }
  id v14 = (void *)CEMEmojiTokenCopyName();
  if ([v14 length])
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v15 = @":";
    }
    else
    {
      id v15 = [NSString stringWithCharacters:&_TranscriberNoteStart length:5];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      id v16 = @":";
    }
    else
    {
      id v16 = [NSString stringWithCharacters:&_TranscriberNoteEnd length:5];
    }
    unint64_t v17 = [(__CFString *)v15 stringByAppendingString:v14];
    id v18 = [v17 stringByAppendingString:v16];

    uint64_t v19 = [v18 length];
    [*(id *)(a1 + 40) appendString:v18];
    for (; v19; --v19)
    {
      unint64_t v20 = a3;
      [*(id *)(a1 + 48) appendBytes:&v20 length:8];
    }

    id v14 = v18;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3 + a4;
}

- (void)_setupLocale
{
  CFLocaleRef v3 = CFLocaleCopyCurrent();
  locale = self->_locale;
  if (locale)
  {
    CFRelease(locale);
    self->_locale = 0;
  }
  objc_super v5 = CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  v6 = [v5 componentsSeparatedByString:@"-"];
  unint64_t v7 = [v6 firstObject];
  uint64_t v8 = [(NSString *)self->_primaryLanguageCode componentsSeparatedByString:@"-"];
  id v9 = [v8 firstObject];
  if ([v7 isEqual:v9])
  {

    primaryLanguageCode = (NSString *)v5;
  }
  else
  {
    NSUInteger v11 = [(NSString *)self->_primaryLanguageCode length];

    primaryLanguageCode = (NSString *)v5;
    if (v11) {
      primaryLanguageCode = self->_primaryLanguageCode;
    }
  }
  id v12 = primaryLanguageCode;
  self->_locale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
  if (v3) {
    CFRelease(v3);
  }
}

- (void)dealloc
{
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v4.receiver = self;
  v4.super_class = (Class)BRLTEmojiPrintPreprocessor;
  [(BRLTEmojiPrintPreprocessor *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end