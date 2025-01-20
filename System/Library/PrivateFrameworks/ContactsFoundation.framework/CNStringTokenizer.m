@interface CNStringTokenizer
+ (BOOL)isCharacterNonBreaking:(unsigned __int16)a3;
+ (id)adjustRanges:(id)a3 toIncludeNonBreakingCharactersInString:(id)a4;
+ (id)tokenizeString:(id)a3;
- (CNStringTokenizer)init;
- (CNStringTokenizer)initWithLocale:(id)a3;
- (CNUnfairLock)lock;
- (__CFStringTokenizer)tokenizer;
- (id)rangesOfWordTokensInString:(id)a3;
- (id)rangesOfWordUnitTokensInString:(id)a3;
- (id)tokenizeString:(id)a3;
- (void)dealloc;
@end

@implementation CNStringTokenizer

+ (id)tokenizeString:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CNStringTokenizer);
  v5 = [(CNStringTokenizer *)v4 tokenizeString:v3];

  return v5;
}

- (CNStringTokenizer)init
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [(CNStringTokenizer *)self initWithLocale:v3];

  return v4;
}

- (CNStringTokenizer)initWithLocale:(id)a3
{
  CFLocaleRef v4 = (const __CFLocale *)a3;
  v10.receiver = self;
  v10.super_class = (Class)CNStringTokenizer;
  v5 = [(CNStringTokenizer *)&v10 init];
  if (v5)
  {
    v11.location = -1;
    v11.length = 0;
    v5->_tokenizer = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &stru_1EE0267A8, v11, 0, v4);
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)CNStringTokenizer;
  [(CNStringTokenizer *)&v4 dealloc];
}

- (id)tokenizeString:(id)a3
{
  id v4 = a3;
  v5 = [(CNStringTokenizer *)self rangesOfWordTokensInString:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__CNStringTokenizer_tokenizeString___block_invoke;
  v9[3] = &unk_1E56A1048;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "_cn_map:", v9);

  return v7;
}

uint64_t __36__CNStringTokenizer_tokenizeString___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 rangeValue];

  return objc_msgSend(v2, "substringWithRange:", v4, v3);
}

- (id)rangesOfWordTokensInString:(id)a3
{
  id v4 = a3;
  v5 = [(CNStringTokenizer *)self rangesOfWordUnitTokensInString:v4];
  id v6 = [(id)objc_opt_class() adjustRanges:v5 toIncludeNonBreakingCharactersInString:v4];

  return v6;
}

- (id)rangesOfWordUnitTokensInString:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [(CNStringTokenizer *)self lock];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__CNStringTokenizer_rangesOfWordUnitTokensInString___block_invoke;
  v12[3] = &unk_1E569F988;
  v12[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  CNRunWithLock(v6, v12);

  v9 = v14;
  id v10 = v7;

  return v10;
}

CFStringTokenizerTokenType __52__CNStringTokenizer_rangesOfWordUnitTokensInString___block_invoke(uint64_t a1)
{
  v2 = (__CFStringTokenizer *)[*(id *)(a1 + 32) tokenizer];
  uint64_t v3 = *(__CFString **)(a1 + 40);
  v8.length = [(__CFString *)v3 length];
  v8.location = 0;
  CFStringTokenizerSetString(v2, v3, v8);
  for (CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)[*(id *)(a1 + 32) tokenizer]);
        result;
        CFStringTokenizerTokenType result = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)[*(id *)(a1 + 32) tokenizer]))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)[*(id *)(a1 + 32) tokenizer]);
    id v6 = *(void **)(a1 + 48);
    id v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    [v6 addObject:v7];
  }
  return result;
}

+ (id)adjustRanges:(id)a3 toIncludeNonBreakingCharactersInString:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  id v24 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v7 objectAtIndex:v8];
      uint64_t location = [v9 rangeValue];
      NSUInteger length = v11;

      NSUInteger v13 = [v6 length];
      if (++v8 >= [v7 count])
      {
        NSUInteger v16 = 0;
        if (location)
        {
LABEL_7:
          NSUInteger v17 = location + length;
          while (1)
          {
            uint64_t v18 = location - 1;
            if (!objc_msgSend(a1, "isCharacterNonBreaking:", objc_msgSend(v6, "characterAtIndex:", location - 1)))break; {
            ++length;
            }
            --location;
            if (!v18)
            {
              NSUInteger length = v17;
              break;
            }
          }
        }
      }
      else
      {
        id v14 = [v7 objectAtIndex:v8];
        NSUInteger v13 = [v14 rangeValue];
        NSUInteger v16 = v15;

        if (location) {
          goto LABEL_7;
        }
      }
      while (location + length < v13
           && objc_msgSend(a1, "isCharacterNonBreaking:", objc_msgSend(v6, "characterAtIndex:")))
      {
        ++length;
        if (location + length == v13 && v16)
        {
          v26.uint64_t location = location;
          v26.NSUInteger length = length;
          v27.uint64_t location = v13;
          v27.NSUInteger length = v16;
          NSRange v19 = NSUnionRange(v26, v27);
          uint64_t location = v19.location;
          NSUInteger length = v19.length;
          [v7 removeObjectAtIndex:v8];
          if (v8 < [v7 count])
          {
            v20 = [v7 objectAtIndex:v8];
            NSUInteger v13 = [v20 rangeValue];
            NSUInteger v16 = v21;
          }
        }
      }
      v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", location, length);
      [v24 addObject:v22];
    }
    while (v8 < [v7 count]);
  }

  return v24;
}

+ (BOOL)isCharacterNonBreaking:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (isCharacterNonBreaking__cn_once_token_1 != -1) {
    dispatch_once(&isCharacterNonBreaking__cn_once_token_1, &__block_literal_global_40);
  }
  id v4 = (void *)isCharacterNonBreaking__cn_once_object_1;

  return [v4 characterIsMember:v3];
}

uint64_t __44__CNStringTokenizer_isCharacterNonBreaking___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-@._+"];
  uint64_t v1 = isCharacterNonBreaking__cn_once_object_1;
  isCharacterNonBreaking__cn_once_object_1 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (CNUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
}

@end