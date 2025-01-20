@interface CSQueryResultMatchingHint
+ (id)_snippetHintAttributeSet;
+ (id)randomTokensFromText:(id)a3 maxTokens:(unint64_t)a4 maxTextLength:(unint64_t)a5;
- (BOOL)isValidAttributeForSnippetHint:(id)a3;
- (CSQueryResultMatchingHint)initWithAttribute:(id)a3 tokens:(id)a4;
- (CSQueryResultMatchingHint)initWithBackingHint:(id)a3;
- (NSArray)tokens;
- (NSString)attribute;
- (id)description;
- (id)flattenedHints;
@end

@implementation CSQueryResultMatchingHint

+ (id)randomTokensFromText:(id)a3 maxTokens:(unint64_t)a4 maxTextLength:(unint64_t)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v9 = [v7 length];
  if (v9 >= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = v9;
  }
  v11 = objc_msgSend(v7, "substringWithRange:", 0, v10);
  v12 = [v11 componentsSeparatedByString:@" "];
  v13 = (void *)[v12 mutableCopy];

  id v14 = 0;
  if ((unint64_t)[v13 count] >= 2)
  {
    id v30 = v7;
    [v13 removeLastObject];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (a4)
    {
      unint64_t v16 = 0;
      do
      {
        unint64_t v17 = [v15 count];
        if (v17 >= [v13 count]) {
          break;
        }
        unint64_t v18 = arc4random();
        unint64_t v19 = v18 % [v13 count];
        v20 = [NSNumber numberWithUnsignedInteger:v19];
        char v21 = [v15 containsObject:v20];

        if ((v21 & 1) == 0)
        {
          v22 = [NSNumber numberWithUnsignedInteger:v19];
          [v15 addObject:v22];

          v23 = [v13 objectAtIndexedSubscript:v19];
          v24 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          v25 = [v23 stringByTrimmingCharactersInSet:v24];
          int v26 = [v25 isEqualToString:&stru_1EDBB3A50];

          if (v26)
          {
            v27 = [v13 objectAtIndexedSubscript:v19];
            v28 = [v27 lowercaseString];
            [v8 addObject:v28];

            ++v16;
          }
        }
      }
      while (v16 < a4);
    }
    if ([v8 count]) {
      id v14 = v8;
    }
    else {
      id v14 = 0;
    }
    id v7 = v30;
  }

  return v14;
}

- (CSQueryResultMatchingHint)initWithAttribute:(id)a3 tokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSQueryResultMatchingHint;
  id v8 = [(CSQueryResultMatchingHint *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    attribute = v8->_attribute;
    v8->_attribute = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v11;
  }
  return v8;
}

+ (id)_snippetHintAttributeSet
{
  if (_snippetHintAttributeSet_onceToken != -1) {
    dispatch_once(&_snippetHintAttributeSet_onceToken, &__block_literal_global_755);
  }
  v2 = (void *)_snippetHintAttributeSet_snippetHintAttributeSet;

  return v2;
}

uint64_t __53__CSQueryResultMatchingHint__snippetHintAttributeSet__block_invoke()
{
  _snippetHintAttributeSet_snippetHintAttributeSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"kMDItemAuthors", @"kMDItemAuthorEmailAddresses", @"kMDItemSubject", @"kMDItemTextContent", @"kMDItemRecipients", @"kMDItemRecipientEmailAddresses", @"kMDItemEmailAddresses", @"com_apple_mail_attachmentNames", @"com_apple_mail_attachmentTypes", @"kMDItemAttachmentNames", @"kMDItemAttachmentTypes", @"kMDItemComment", @"kMDItemTitle", @"kMDItemPath", 0);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isValidAttributeForSnippetHint:(id)a3
{
  id v3 = a3;
  v4 = +[CSQueryResultMatchingHint _snippetHintAttributeSet];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (CSQueryResultMatchingHint)initWithBackingHint:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSQueryResultMatchingHint;
  char v5 = [(CSQueryResultMatchingHint *)&v15 init];
  if (v5)
  {
    if ((unint64_t)[v4 count] < 2
      || ([v4 firstObject],
          id v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = [(CSQueryResultMatchingHint *)v5 isValidAttributeForSnippetHint:v6],
          v6,
          !v7))
    {
      v13 = 0;
      goto LABEL_7;
    }
    id v8 = [v4 firstObject];
    uint64_t v9 = [v8 copy];
    attribute = v5->_attribute;
    v5->_attribute = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v11;
  }
  v13 = v5;
LABEL_7:

  return v13;
}

- (id)flattenedHints
{
  id v3 = objc_opt_new();
  [v3 addObject:self->_attribute];
  [v3 addObjectsFromArray:self->_tokens];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  char v5 = [(CSQueryResultMatchingHint *)self attribute];
  id v6 = [(CSQueryResultMatchingHint *)self tokens];
  BOOL v7 = (void *)[v3 initWithFormat:@"<%@:%p attribute: %@ tokens: %@>", v4, self, v5, v6];

  return v7;
}

- (NSString)attribute
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);

  objc_storeStrong((id *)&self->_attribute, 0);
}

@end