@interface NSMutableString(EmailFoundationDKIMAdditions)
- (uint64_t)ef_trimTrailingCharactersInSet:()EmailFoundationDKIMAdditions;
- (void)_trimTrailingCharactersInSet:()EmailFoundationDKIMAdditions ignoringCharactersInSet:;
- (void)ef_appendQuotedSQLEscapedString:()EmailFoundationDKIMAdditions;
- (void)ef_appendSQLEscapedString:()EmailFoundationDKIMAdditions;
- (void)ef_removeCharactersInSet:()EmailFoundationDKIMAdditions beforeOccurrencesOfString:;
- (void)ef_replaceContiguousSequencesOfCharactersInSet:()EmailFoundationDKIMAdditions withString:;
- (void)ef_rfc5322Unfold;
- (void)ef_trimLeadingCharactersInSet:()EmailFoundationDKIMAdditions;
- (void)ef_trimTrailingCharactersInSetIgnoringNewline:()EmailFoundationDKIMAdditions;
@end

@implementation NSMutableString(EmailFoundationDKIMAdditions)

- (void)ef_appendQuotedSQLEscapedString:()EmailFoundationDKIMAdditions
{
  objc_msgSend(a3, "ef_quotedSQLEscapedString");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:");
}

- (void)ef_rfc5322Unfold
{
  objc_msgSend(MEMORY[0x1E4F28B88], "ef_rfc6376WhitespaceCharacterSet");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)[a1 length] >= 3)
  {
    uint64_t v2 = [a1 length];
    if (v2 != 2)
    {
      uint64_t v3 = v2 - 1;
      do
      {
        if ((unint64_t)[a1 length] < 3) {
          break;
        }
        if ([a1 characterAtIndex:v3 - 2] == 13
          && [a1 characterAtIndex:v3 - 1] == 10
          && objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v3)))
        {
          objc_msgSend(a1, "deleteCharactersInRange:", v3 - 2, 2);
        }
        --v3;
      }
      while (v3 != 1);
    }
  }
}

- (void)ef_removeCharactersInSet:()EmailFoundationDKIMAdditions beforeOccurrencesOfString:
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 length];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v7 - 1;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
      if (!objc_msgSend(v13, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9))) {
        break;
      }
      ++v8;
LABEL_13:
      if (--v9 == -1) {
        goto LABEL_14;
      }
    }
    objc_msgSend(a1, "deleteCharactersInRange:", v9 + 1, v8);
    uint64_t v8 = 0;
LABEL_7:
    uint64_t v11 = [v6 length];
    if (v9 + v11 <= (unint64_t)[a1 length])
    {
      v12 = objc_msgSend(a1, "substringWithRange:", v9, objc_msgSend(v6, "length"));
      if ([v12 isEqualToString:v6]) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)ef_replaceContiguousSequencesOfCharactersInSet:()EmailFoundationDKIMAdditions withString:
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [a1 length];
  if (v7)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v7 - 1;
      if (objc_msgSend(v10, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7 - 1)))
      {
        ++v8;
        if (v7 == 1)
        {
          objc_msgSend(a1, "replaceCharactersInRange:withString:", 0, v8, v6);
          break;
        }
      }
      else if (v8)
      {
        objc_msgSend(a1, "replaceCharactersInRange:withString:", v7, v8, v6);
        uint64_t v8 = 0;
      }
      --v7;
    }
    while (v9);
  }
}

- (void)ef_trimLeadingCharactersInSet:()EmailFoundationDKIMAdditions
{
  id v5 = a3;
  for (unint64_t i = 0;
        i < [a1 length]
     && objc_msgSend(v5, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", i));
  if (i) {
    objc_msgSend(a1, "deleteCharactersInRange:", 0, i);
  }
}

- (uint64_t)ef_trimTrailingCharactersInSet:()EmailFoundationDKIMAdditions
{
  return [a1 _trimTrailingCharactersInSet:a3 ignoringCharactersInSet:0];
}

- (void)ef_trimTrailingCharactersInSetIgnoringNewline:()EmailFoundationDKIMAdditions
{
  id v5 = a3;
  id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [a1 _trimTrailingCharactersInSet:v5 ignoringCharactersInSet:v4];
}

- (void)_trimTrailingCharactersInSet:()EmailFoundationDKIMAdditions ignoringCharactersInSet:
{
  id v15 = a3;
  id v6 = a4;
  if (v6 && (uint64_t v7 = [a1 length], (v8 = v7) != 0))
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7 - 1;
    while (objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v10)))
    {
      ++v9;
      if (--v10 == -1)
      {
        uint64_t v9 = v8;
        break;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = [a1 length];
  uint64_t v12 = v11 + ~v9;
  if (v12 != -1)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v11 - v9;
    while (objc_msgSend(v15, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v12)))
    {
      ++v13;
      if (--v12 == -1)
      {
        uint64_t v13 = v14;
        break;
      }
    }
    if (v13) {
      objc_msgSend(a1, "deleteCharactersInRange:", objc_msgSend(a1, "length") - (v13 + v9), v13);
    }
  }
}

- (void)ef_appendSQLEscapedString:()EmailFoundationDKIMAdditions
{
  objc_msgSend(a3, "ef_SQLEscapedString");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendString:");
}

@end