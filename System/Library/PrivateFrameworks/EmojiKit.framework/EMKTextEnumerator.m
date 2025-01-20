@interface EMKTextEnumerator
- (EMKTextEnumerator)init;
- (EMKTextEnumerator)initWithEmojiPreferences:(id)a3;
- (id)emojiDataForLanguage:(id)a3;
- (void)enumerateEmojiSignifiersInString:(id)a3 touchingRange:(_NSRange)a4 language:(id)a5 usingBlock:(id)a6;
@end

@implementation EMKTextEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_emojiDatasByLanguage, 0);
}

- (EMKTextEnumerator)initWithEmojiPreferences:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMKTextEnumerator;
  v6 = [(EMKTextEnumerator *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    emojiDatasByLanguage = v6->_emojiDatasByLanguage;
    v6->_emojiDatasByLanguage = v7;

    objc_storeStrong((id *)&v6->_emojiPreferences, a3);
  }

  return v6;
}

- (EMKTextEnumerator)init
{
  return [(EMKTextEnumerator *)self initWithEmojiPreferences:0];
}

- (id)emojiDataForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_emojiDatasByLanguage objectForKey:v4];
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F61078] emojiLocaleDataWithLocaleIdentifier:v4];
    emojiDatasByLanguage = self->_emojiDatasByLanguage;
    if (v9)
    {
      v6 = (void *)v9;
      [(NSMutableDictionary *)emojiDatasByLanguage setObject:v9 forKey:v4];
      goto LABEL_8;
    }
    v6 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)emojiDatasByLanguage setObject:v6 forKey:v4];
    goto LABEL_7;
  }
  v6 = (void *)v5;
  v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
LABEL_7:

    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (void)enumerateEmojiSignifiersInString:(id)a3 touchingRange:(_NSRange)a4 language:(id)a5 usingBlock:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__onceToken != -1) {
    dispatch_once(&enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__onceToken, &__block_literal_global_2);
  }
  if (location) {
    NSUInteger v14 = location - 1;
  }
  else {
    NSUInteger v14 = 0;
  }
  if (location) {
    ++length;
  }
  if (length + v14 >= [v11 length]) {
    NSUInteger v15 = length;
  }
  else {
    NSUInteger v15 = length + 1;
  }
  uint64_t v16 = objc_msgSend(v11, "paragraphRangeForRange:", v14, v15);
  uint64_t v18 = v17;
  objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet, 0, v16, v17);
  if (v19)
  {
    v20 = [(EMKTextEnumerator *)self emojiDataForLanguage:v12];
    if (v20 && v18)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke_2;
      v21[3] = &unk_1E6E97278;
      NSUInteger v25 = v14;
      NSUInteger v26 = v15;
      v21[4] = self;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      objc_msgSend(v20, "enumerateSearchResultsInText:range:options:searchType:usingBlock:", v22, v16, v18, 17, 1, v21);
    }
  }
  else
  {
    v20 = 0;
  }
}

void __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke()
{
  id v3 = [MEMORY[0x1E4F28E58] controlCharacterSet];
  v0 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v0];

  objc_msgSend(v3, "addCharactersInRange:", 65532, 4);
  [v3 invert];
  uint64_t v1 = [v3 copy];
  v2 = (void *)enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet;
  enumerateEmojiSignifiersInString_touchingRange_language_usingBlock__searchableCharacterSet = v1;
}

void __88__EMKTextEnumerator_enumerateEmojiSignifiersInString_touchingRange_language_usingBlock___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (a4)
  {
    unint64_t v8 = *(void *)(a1 + 64);
    if (a3 <= *(void *)(a1 + 72) + v8 && v8 <= a3 + a4)
    {
      id v13 = v7;
      if ([v7 count])
      {
        if (*(void *)(*(void *)(a1 + 32) + 16))
        {
          objc_super v10 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
          uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 16) copySortedEmojis:v13 keyword:v10 localeIdentifier:*(void *)(a1 + 48)];

          id v13 = (id)v11;
        }
        id v12 = [[EMKEmojiTokenList alloc] initWithEmojiTokenArray:v13];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      id v7 = v13;
    }
  }
}

@end