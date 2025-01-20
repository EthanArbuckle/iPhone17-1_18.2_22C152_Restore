@interface IMAttributedStringParser
+ (id)sharedInstance;
- (void)_preprocessWithContext:(id)a3 string:(id *)a4;
- (void)parseContext:(id)a3;
@end

@implementation IMAttributedStringParser

+ (id)sharedInstance
{
  if (qword_1EB4A6718 != -1) {
    dispatch_once(&qword_1EB4A6718, &unk_1EF2BF880);
  }
  return (id)qword_1EB4A6680;
}

- (void)_preprocessWithContext:(id)a3 string:(id *)a4
{
  uint64_t v7 = [*a4 length];
  if (v7)
  {
    unint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = 0;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v11 = objc_msgSend(*a4, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v16, v10, v8 - v10);
      uint64_t v12 = objc_msgSend(a3, "parser:preprocessedAttributesForAttributes:range:", self, v11, v16, v17);
      if (v11 != v12)
      {
        uint64_t v13 = v12;
        id v14 = *a4;
        if ((v9 & 1) == 0)
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          id v14 = *a4;
          if ((isKindOfClass & 1) == 0)
          {
            id v14 = (id)[*a4 mutableCopy];
            *a4 = v14;
          }
        }
        objc_msgSend(v14, "setAttributes:range:", v13, v16, v17);
        char v9 = 1;
      }
      uint64_t v10 = v17 + v16;
    }
    while (v17 + v16 < v8);
  }
}

- (void)parseContext:(id)a3
{
  id v5 = (id)[a3 inString];
  id v12 = v5;
  [a3 parserDidStart:self];
  if ([a3 shouldPreprocess])
  {
    [(IMAttributedStringParser *)self _preprocessWithContext:a3 string:&v12];
    id v5 = v12;
  }
  uint64_t v6 = [v5 length];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v9 = objc_msgSend(v12, "attributesAtIndex:longestEffectiveRange:inRange:", v8, &v10, v8, v7 - v8);
      objc_msgSend(a3, "parser:foundAttributes:inRange:", self, v9, v10, v11);
      uint64_t v8 = v11 + v10;
    }
    while (v11 + v10 < v7);
  }
  [a3 parserDidEnd:self];
}

@end