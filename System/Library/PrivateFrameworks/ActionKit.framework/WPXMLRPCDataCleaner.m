@interface WPXMLRPCDataCleaner
- (WPXMLRPCDataCleaner)initWithData:(id)a3;
- (_NSRange)rangeOfLastValidClosingTagInString:(id)a3;
- (id)appendClosingTags:(id)a3 toResponseString:(id)a4;
- (id)cleanCharactersBeforePreamble:(id)a3;
- (id)cleanClosingTagIfNeeded:(id)a3 lengthOfCharactersPrecedingPreamble:(int64_t)a4;
- (id)cleanData;
- (id)cleanInvalidUTF8:(id)a3;
- (id)cleanInvalidXMLCharacters:(id)a3;
- (id)cleanWithTidyIfPresent:(id)a3;
- (id)cloingTagsForString:(id)a3;
- (id)repairTruncatedClosingTags:(id)a3 inResponseString:(id)a4;
@end

@implementation WPXMLRPCDataCleaner

- (void).cxx_destruct
{
}

- (id)cleanData
{
  if (self->xmlData)
  {
    v3 = -[WPXMLRPCDataCleaner cleanInvalidUTF8:](self, "cleanInvalidUTF8:");
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    if (!v4) {
      v4 = (void *)[[NSString alloc] initWithData:v3 encoding:5];
    }
    uint64_t v5 = [v4 length];
    v6 = [(WPXMLRPCDataCleaner *)self cleanCharactersBeforePreamble:v4];

    uint64_t v7 = v5 - [v6 length];
    v8 = [(WPXMLRPCDataCleaner *)self cleanInvalidXMLCharacters:v6];

    v9 = [(WPXMLRPCDataCleaner *)self cleanWithTidyIfPresent:v8];

    v10 = [(WPXMLRPCDataCleaner *)self cleanClosingTagIfNeeded:v9 lengthOfCharactersPrecedingPreamble:v7];

    v11 = [v10 dataUsingEncoding:4];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (WPXMLRPCDataCleaner)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WPXMLRPCDataCleaner;
  v6 = [(WPXMLRPCDataCleaner *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->xmlData, a3);
  }

  return v7;
}

- (id)appendClosingTags:(id)a3 toResponseString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 rangeOfString:@"<" options:4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v6;
  }
  else
  {
    objc_super v9 = [v6 substringFromIndex:v7];
    uint64_t v10 = [v5 rangeOfString:v9];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v10 + v11;
    }
    v13 = NSString;
    v14 = [v5 substringFromIndex:v12];
    id v8 = [v13 stringWithFormat:@"%@%@", v6, v14];
  }
  return v8;
}

- (id)repairTruncatedClosingTags:(id)a3 inResponseString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WPXMLRPCDataCleaner *)self rangeOfLastValidClosingTagInString:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v7;
  }
  else
  {
    uint64_t v11 = v8;
    uint64_t v12 = objc_msgSend(v7, "substringWithRange:", v8, v9);
    uint64_t v13 = [v6 rangeOfString:v12];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = 0;
    }
    else
    {
      uint64_t v14 = v13;
      v15 = [v7 substringToIndex:v11];
      v16 = [v6 substringFromIndex:v14];
      id v10 = [NSString stringWithFormat:@"%@%@", v15, v16];
    }
  }

  return v10;
}

- (_NSRange)rangeOfLastValidClosingTagInString:(id)a3
{
  uint64_t v3 = rangeOfLastValidClosingTagInString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&rangeOfLastValidClosingTagInString__onceToken, &__block_literal_global_17201);
  }
  uint64_t v5 = objc_msgSend((id)rangeOfLastValidClosingTagInString__regex, "rangeOfFirstMatchInString:options:range:", v4, 2, 0, objc_msgSend(v4, "length"));
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

void __73__WPXMLRPCDataCleaner_CleaningSteps__rangeOfLastValidClosingTagInString___block_invoke()
{
  id v3 = 0;
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"</[^>]+>[^>]*$" options:1 error:&v3];
  id v1 = v3;
  v2 = (void *)rangeOfLastValidClosingTagInString__regex;
  rangeOfLastValidClosingTagInString__regex = v0;
}

- (id)cloingTagsForString:(id)a3
{
  if ([a3 rangeOfString:@"<params>"] == 0x7FFFFFFFFFFFFFFFLL) {
    return @"</value></fault></methodResponse>";
  }
  else {
    return @"</param></params></methodResponse>";
  }
}

- (id)cleanClosingTagIfNeeded:(id)a3 lengthOfCharactersPrecedingPreamble:(int64_t)a4
{
  id v6 = a3;
  if ([v6 rangeOfString:@"methodResponse"] == 0x7FFFFFFFFFFFFFFFLL
    || [v6 rangeOfString:@"</methodResponse>"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = v6;
  }
  else
  {
    NSUInteger v7 = [(WPXMLRPCDataCleaner *)self cloingTagsForString:v6];
    if ([v7 length] >= (unint64_t)a4)
    {
      NSUInteger v9 = [(WPXMLRPCDataCleaner *)self repairTruncatedClosingTags:v7 inResponseString:v6];
      if (!v9)
      {
        NSUInteger v9 = [(WPXMLRPCDataCleaner *)self appendClosingTags:v7 toResponseString:v6];
      }
      id v8 = v9;
    }
    else
    {
      id v8 = v6;
    }
  }
  return v8;
}

- (id)cleanWithTidyIfPresent:(id)a3
{
  id v3 = a3;
  id v4 = NSClassFromString(&cfstr_Ctidy.isa);
  SEL v5 = NSSelectorFromString(&cfstr_Tidy.isa);
  SEL v6 = NSSelectorFromString(&cfstr_TidystringInpu.isa);
  if (v4)
  {
    SEL v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v4 performSelector:v5];
      if (v8)
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = 0;
          uint64_t v9 = ((void (*)(void *, SEL, id, uint64_t, uint64_t, __CFString *, uint64_t *))[v8 methodForSelector:v7])(v8, v7, v3, 1, 1, @"utf8", &v12);
          if (v9)
          {
            id v10 = (id)v9;

            goto LABEL_9;
          }
        }
      }
    }
  }
  id v10 = v3;
LABEL_9:

  return v10;
}

- (id)cleanInvalidXMLCharacters:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  SEL v5 = [MEMORY[0x263F089D8] stringWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [v3 characterAtIndex:i];
      BOOL v8 = v7 > 0xD || ((1 << v7) & 0x2600) == 0;
      if (!v8
        || (unsigned __int16)((unsigned __int16)(v7 - 32) >> 5) < 0x6BFu
        || (unsigned __int16)((unsigned __int16)(v7 + 0x2000) >> 1) <= 0xFFEu)
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%C", v7);
        [v5 appendString:v9];
      }
    }
  }

  return v5;
}

- (id)cleanCharactersBeforePreamble:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"<?xml"];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v3 substringFromIndex:v4];

    id v3 = (id)v8;
  }
  return v3;
}

- (id)cleanInvalidUTF8:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MEMORY[0x23ECE5F60]("UTF-8", "UTF-8");
  int v16 = 1;
  MEMORY[0x23ECE5F70](v4, 4, &v16);
  uint64_t v14 = [v3 length];
  uint64_t v15 = v14;
  id v5 = v3;
  uint64_t v13 = [v5 bytes];
  BOOL v6 = malloc_type_malloc([v5 length], 0x100004077774924uLL);
  uint64_t v12 = v6;
  if (MEMORY[0x23ECE5F40](v4, &v13, &v15, &v12, &v14) == -1)
  {
    id v9 = v5;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF8F8];
    uint64_t v8 = [v5 length];
    id v9 = [v7 dataWithBytes:v6 length:v8 - v14];
  }
  id v10 = v9;
  MEMORY[0x23ECE5F50](v4);
  free(v6);

  return v10;
}

@end