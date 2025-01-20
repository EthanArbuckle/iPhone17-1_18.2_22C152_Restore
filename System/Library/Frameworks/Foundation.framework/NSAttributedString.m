@interface NSAttributedString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSAttributedString)allocWithZone:(_NSZone *)a3;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format context:(NSDictionary *)context;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options;
+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options context:(NSDictionary *)context;
+ (id)_attributedStringWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7;
+ (id)_attributedStringWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6;
+ (id)_localizedAttributedStringWithFormat:(id)a3;
+ (id)_localizedAttributedStringWithFormat:(id)a3 options:(unint64_t)a4;
+ (void)_setAttributedDictionaryClass:(Class)a3;
- (BOOL)_mayRequireIntentResolution;
- (BOOL)_willRequireIntentResolutionWhenContainingAttribute:(id)a3 value:(id)a4;
- (BOOL)_willRequireIntentResolutionWhenContainingAttributes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributedString:(NSAttributedString *)other;
- (Class)classForCoder;
- (NSAttributedString)attributedStringByInflectingString;
- (NSAttributedString)attributedSubstringFromRange:(NSRange)range;
- (NSAttributedString)initWithCoder:(id)a3;
- (NSAttributedString)initWithContentsOfMarkdownFileAtURL:(NSURL *)markdownFile options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context;
- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context arguments:(va_list)arguments;
- (NSAttributedString)initWithMarkdown:(NSData *)markdown options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSAttributedString)initWithMarkdownString:(NSString *)markdownString options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error;
- (NSDictionary)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (NSDictionary)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (NSString)string;
- (NSUInteger)length;
- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7;
- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 context:(id)a7 arguments:(char *)a8;
- (id)_createAttributedSubstringWithRange:(_NSRange)a3;
- (id)_firstValueOfAttributeWithKey:(id)a3 inRange:(_NSRange)a4;
- (id)_identicalAttributesInRange:(_NSRange)a3;
- (id)_inflectedAttributedString;
- (id)_initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6;
- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5;
- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6;
- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
- (id)attributedStringByWeaklyAddingAttributes:(id)a3;
- (id)attributedSubstringFromRange:(_NSRange)a3 replacingCharactersInRanges:(const _NSRange *)a4 numberOfRanges:(int64_t)a5 withString:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_markIntentsResolved;
- (void)_markRequiringIntentResolution;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block;
- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block;
@end

@implementation NSAttributedString

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  v6 = [(NSAttributedString *)self attributesAtIndex:location effectiveRange:range];

  return [(NSDictionary *)v6 objectForKey:attrName];
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttributes:(id)a3
{
  v4 = (void *)[a3 objectForKeyedSubscript:@"NSInlinePresentationIntent"];
  return v4 && ![v4 isEqual:&off_1ECAB4EC8]
      || [a3 objectForKeyedSubscript:@"NSPresentationIntent"] != 0;
}

- (BOOL)isEqualToAttributedString:(NSAttributedString *)other
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (other == self) {
    goto LABEL_15;
  }
  BOOL v5 = [(NSString *)[(NSAttributedString *)self string] isEqual:[(NSAttributedString *)other string]];
  if (!v5) {
    return v5;
  }
  NSUInteger v6 = [(NSAttributedString *)self length];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (!v6)
  {
LABEL_15:
    LOBYTE(v5) = 1;
    return v5;
  }
  NSUInteger v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v12 = 0;
  v13 = 0;
  for (NSUInteger i = 0; i < v7; NSUInteger i = v16 + v17 >= (unint64_t)(v18 + v19) ? v18 + v19 : v16 + v17)
  {
    if (i >= v11 + v10)
    {
      v13 = [(NSAttributedString *)self attributesAtIndex:i effectiveRange:&v18];
      uint64_t v8 = v16;
      uint64_t v9 = v17;
    }
    if (i >= v9 + v8) {
      v12 = [(NSAttributedString *)other attributesAtIndex:i effectiveRange:&v16];
    }
    BOOL v5 = [(NSDictionary *)v13 isEqualToDictionary:v12];
    if (!v5) {
      break;
    }
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    uint64_t v10 = v18;
    uint64_t v11 = v19;
  }
  return v5;
}

- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (enumerationRange.length)
  {
    int v6 = opts;
    NSUInteger length = enumerationRange.length;
    NSUInteger location = enumerationRange.location;
    NSUInteger v10 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    char v25 = 0;
    NSUInteger v11 = [(NSAttributedString *)self length];
    while (1)
    {
      NSUInteger v23 = 0;
      uint64_t v24 = 0;
      if ((v6 & 0x100000) != 0)
      {
        v12 = [(NSAttributedString *)self attributesAtIndex:v10 effectiveRange:&v23];
        NSUInteger v13 = v23;
        if (v24 + v23 >= length + location) {
          NSUInteger v14 = length + location;
        }
        else {
          NSUInteger v14 = v24 + v23;
        }
        NSUInteger v15 = v14 - location;
        BOOL v16 = v23 > location || location >= v24 + v23;
        if (v16) {
          NSUInteger v17 = 0;
        }
        else {
          NSUInteger v17 = location;
        }
        if (v16) {
          NSUInteger v15 = 0;
        }
        NSUInteger v18 = v14 - v23;
        if (location > v23 || v23 >= length + location)
        {
          NSUInteger v13 = v17;
          NSUInteger v20 = v15;
        }
        else
        {
          NSUInteger v20 = v18;
        }
        NSUInteger v23 = v13;
        uint64_t v24 = v20;
      }
      else
      {
        v12 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v10, &v23, location, length);
      }
      v21 = v12;
      (*((void (**)(void *, NSDictionary *, NSUInteger, uint64_t, char *))block + 2))(block, v21, v23, v24, &v25);

      if (v25) {
        break;
      }
      if ((v6 & 2) != 0)
      {
        if (v23 <= location) {
          return;
        }
        NSUInteger v10 = v23 - 1;
      }
      else
      {
        NSUInteger v22 = [(NSAttributedString *)self length];
        if (v22 == v11) {
          NSUInteger v10 = v24 + v23;
        }
        else {
          NSUInteger v10 = v24 + v23 - v11 + v22;
        }
        if (v22 != v11) {
          NSUInteger length = length - v11 + v22;
        }
        if (v10 >= length + location) {
          return;
        }
        NSUInteger v11 = v22;
      }
    }
  }
}

- (void)enumerateAttribute:(NSAttributedStringKey)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void *)block
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (enumerationRange.length)
  {
    int v7 = opts;
    NSUInteger length = enumerationRange.length;
    NSUInteger location = enumerationRange.location;
    NSUInteger v12 = ((enumerationRange.length - 1) & ((uint64_t)(opts << 62) >> 63)) + enumerationRange.location;
    char v27 = 0;
    NSUInteger v13 = [(NSAttributedString *)self length];
    while (1)
    {
      NSUInteger v25 = 0;
      uint64_t v26 = 0;
      if ((v7 & 0x100000) != 0)
      {
        id v14 = [(NSAttributedString *)self attribute:attrName atIndex:v12 effectiveRange:&v25];
        NSUInteger v15 = v25;
        if (v26 + v25 >= length + location) {
          NSUInteger v16 = length + location;
        }
        else {
          NSUInteger v16 = v26 + v25;
        }
        NSUInteger v17 = v16 - location;
        BOOL v18 = v25 > location || location >= v26 + v25;
        if (v18) {
          NSUInteger v19 = 0;
        }
        else {
          NSUInteger v19 = location;
        }
        if (v18) {
          NSUInteger v17 = 0;
        }
        NSUInteger v20 = v16 - v25;
        if (location > v25 || v25 >= length + location)
        {
          NSUInteger v15 = v19;
          NSUInteger v22 = v17;
        }
        else
        {
          NSUInteger v22 = v20;
        }
        NSUInteger v25 = v15;
        uint64_t v26 = v22;
      }
      else
      {
        id v14 = -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self, "attribute:atIndex:longestEffectiveRange:inRange:", attrName, v12, &v25, location, length);
      }
      id v23 = v14;
      (*((void (**)(void *, id, NSUInteger, uint64_t, char *))block + 2))(block, v23, v25, v26, &v27);

      if (v27) {
        break;
      }
      if ((v7 & 2) != 0)
      {
        if (v25 <= location) {
          return;
        }
        NSUInteger v12 = v25 - 1;
      }
      else
      {
        NSUInteger v24 = [(NSAttributedString *)self length];
        if (v24 == v13) {
          NSUInteger v12 = v26 + v25;
        }
        else {
          NSUInteger v12 = v26 + v25 - v13 + v24;
        }
        if (v24 != v13) {
          NSUInteger length = length - v13 + v24;
        }
        if (v12 >= length + location) {
          return;
        }
        NSUInteger v13 = v24;
      }
    }
  }
}

- (id)attribute:(NSAttributedStringKey)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  unint64_t v7 = rangeLimit.location;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = -[NSAttributedString attribute:atIndex:effectiveRange:](self, "attribute:atIndex:effectiveRange:", attrName, location);
  if (range)
  {
    NSRange v22 = *range;
    unint64_t v12 = v7 + length;
    do
    {
      unint64_t v13 = v22.length + v22.location;
      if (v22.length + v22.location >= v12) {
        break;
      }
      id v14 = [(NSAttributedString *)self attribute:attrName atIndex:v22.length + v22.location effectiveRange:&v22];
    }
    while (v14 == v11 || [v14 isEqual:v11]);
    NSRange v22 = *range;
    do
    {
      NSUInteger v15 = v22.location;
      if (v22.location <= v7) {
        break;
      }
      id v16 = [(NSAttributedString *)self attribute:attrName atIndex:v22.location - 1 effectiveRange:&v22];
    }
    while (v16 == v11 || [v16 isEqual:v11]);
    if (v12 >= v13) {
      unint64_t v17 = v13;
    }
    else {
      unint64_t v17 = v12;
    }
    if (v7 >= v13 || v15 > v7)
    {
      NSUInteger v18 = v17 - v15;
      if (v15 < v12) {
        unint64_t v19 = v15;
      }
      else {
        unint64_t v19 = 0;
      }
      if (v15 >= v12) {
        NSUInteger v18 = 0;
      }
      BOOL v20 = v7 > v15;
      if (v7 <= v15) {
        unint64_t v7 = v19;
      }
      else {
        unint64_t v7 = 0;
      }
      if (v20) {
        NSUInteger v18 = 0;
      }
    }
    else
    {
      NSUInteger v18 = v17 - v7;
    }
    range->NSUInteger location = v7;
    range->NSUInteger length = v18;
  }
  return v11;
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit
{
  NSUInteger length = rangeLimit.length;
  unint64_t v6 = rangeLimit.location;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = -[NSAttributedString attributesAtIndex:effectiveRange:](self, "attributesAtIndex:effectiveRange:", location);
  if (range)
  {
    NSRange v17 = *range;
    unint64_t v10 = v6 + length;
    do
      unint64_t v11 = v17.length + v17.location;
    while (v17.length + v17.location < v10
         && [(NSDictionary *)[(NSAttributedString *)self attributesAtIndex:v17.length + v17.location effectiveRange:&v17] isEqualToDictionary:v9]);
    NSRange v17 = *range;
    do
      NSUInteger v12 = v17.location;
    while (v17.location > v6
         && [(NSDictionary *)[(NSAttributedString *)self attributesAtIndex:v17.location - 1 effectiveRange:&v17] isEqualToDictionary:v9]);
    if (v10 >= v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v6 >= v11 || v12 > v6)
    {
      NSUInteger v14 = v13 - v12;
      BOOL v15 = v6 > v12 || v12 >= v10;
      if (v15) {
        unint64_t v6 = 0;
      }
      else {
        unint64_t v6 = v12;
      }
      if (v15) {
        NSUInteger v14 = 0;
      }
    }
    else
    {
      NSUInteger v14 = v13 - v6;
    }
    range->NSUInteger location = v6;
    range->NSUInteger length = v14;
  }
  return v9;
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"NSInflect"];
  if (result
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]) != 0
    || (uint64_t result = [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"]) != 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ([a2 objectForKeyedSubscript:@"NSInflect"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]
    || [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]
    || [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  uint64_t v8 = a1[6] + a3 - a1[7];
  uint64_t v9 = (void *)a1[4];

  return objc_msgSend(v9, "addAttributes:range:", a2, v8, a4);
}

uint64_t __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if ([a2 objectForKeyedSubscript:@"NSInflect"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAlternative"]
    || [a2 objectForKeyedSubscript:@"NSInflectionReferentConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementConcept"]
    || [a2 objectForKeyedSubscript:@"NSInflectionAgreementArgument"]
    || [a2 objectForKeyedSubscript:@"NSLocalizedNumberFormat"])
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  uint64_t v8 = a1[6] + a3;
  uint64_t v9 = (void *)a1[4];

  return objc_msgSend(v9, "addAttributes:range:", a2, v8, a4);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format
{
  va_start(va, format);
  id v4 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v4, "_initWithFormat:options:locale:arguments:", format, 0, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), va);
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 context:(id)a7 arguments:(char *)a8
{
  char obj = a4;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v79[1] = 0;
  id v80 = 0;
  v79[0] = 0;
  objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSFormatSpecifierConfiguration", 0, v79, 0, objc_msgSend(a3, "length"));
  [a3 length];
  [a5 pluralizationNumber];
  [a3 string];
  v55 = a8;
  uint64_t v11 = _CFStringCreateWithFormatAndArgumentsReturningMetadata();
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  if (v11)
  {
    v70 = -[NSMutableAttributedString initWithString:]([NSMutableAttributedString alloc], "initWithString:", v11, v55);
    uint64_t v66 = [a3 length];
    v56 = self;
    v57 = (void *)v11;
    uint64_t v67 = [v80 count];
    if ((v67 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v65 = *MEMORY[0x1E4F1CD08];
      uint64_t v64 = *MEMORY[0x1E4F1CD00];
      uint64_t v63 = *MEMORY[0x1E4F1CCF8];
      uint64_t v61 = *MEMORY[0x1E4F1CCE0];
      uint64_t v62 = *MEMORY[0x1E4F1CCF0];
      uint64_t v60 = *MEMORY[0x1E4F1CCD0];
      do
      {
        if (v14 >= v67) {
          BOOL v15 = 0;
        }
        else {
          BOOL v15 = (void *)[v80 objectAtIndexedSubscript:v14];
        }
        id v16 = (void *)[v15 objectForKeyedSubscript:v65];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          id v16 = 0;
        }
        uint64_t v17 = [v15 objectForKeyedSubscript:v64];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v18 = (void *)v17;
        }
        else {
          uint64_t v18 = 0;
        }
        if (v16) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v20 = [v16 integerValue];
          uint64_t v21 = [v18 integerValue];
        }
        v74[8] = MEMORY[0x1E4F143A8];
        v74[9] = 3221225472;
        uint64_t v22 = v66;
        if (v15) {
          uint64_t v22 = v20;
        }
        v74[10] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke;
        v74[11] = &unk_1E51F8B28;
        v74[14] = v13;
        v74[15] = v12;
        v74[16] = v22 - v12;
        v74[13] = &v75;
        v74[12] = v70;
        objc_msgSend(a3, "enumerateAttributesInRange:options:usingBlock:", v12);
        if (!v15) {
          break;
        }
        uint64_t v23 = [v15 objectForKeyedSubscript:v63];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          NSUInteger v24 = (void *)v23;
        }
        else {
          NSUInteger v24 = 0;
        }
        uint64_t v25 = [v15 objectForKeyedSubscript:v62];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v26 = (void *)v25;
        }
        else {
          uint64_t v26 = 0;
        }
        uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        if (v24 && v26)
        {
          uint64_t v27 = [v24 integerValue];
          uint64_t v28 = [v26 integerValue];
        }
        v29 = (void *)[v15 objectForKeyedSubscript:v61];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & (v29 != 0)) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v30 = v29;
          }
          else {
            v30 = 0;
          }
          v29 = objc_msgSend(v30, "__baseAttributedString");
        }
        uint64_t v31 = [v15 objectForKeyedSubscript:v60];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v32 = (void *)v31;
        }
        else {
          v32 = 0;
        }
        unsigned int v33 = [v32 BOOLValue];
        uint64_t v34 = [a3 attributesAtIndex:v20 effectiveRange:0];
        char v35 = obj & (v29 != 0);
        if (!v34) {
          char v35 = 1;
        }
        if ((v35 & 1) == 0) {
          -[NSMutableAttributedString addAttributes:range:](v70, "addAttributes:range:", v34, v27, v28);
        }
        if (v33)
        {
          -[NSMutableAttributedString addAttributes:range:](v70, "addAttributes:range:", v34, v27 - 1, 1);
          -[NSMutableAttributedString addAttributes:range:](v70, "addAttributes:range:", v34, v27 + v28, 1);
        }
        if (v29)
        {
          uint64_t v36 = [v29 length];
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_2;
          v74[3] = &unk_1E51F8B50;
          v74[6] = v27;
          v74[7] = v28;
          v74[5] = &v75;
          v74[4] = v70;
          objc_msgSend(v29, "enumerateAttributesInRange:options:usingBlock:", 0, v36, 0x100000, v74);
        }
        uint64_t v37 = v27 + v28;
        uint64_t v12 = v20 + v21;
        ++v14;
        uint64_t v13 = v37 + v33;
      }
      while (v67 + 1 != v14);
    }
    if ((obj & 2) != 0)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id obja = v80;
      uint64_t v38 = [v80 countByEnumeratingWithState:&v84 objects:v83 count:16];
      if (v38)
      {
        uint64_t v72 = *(void *)v85;
        uint64_t v39 = *MEMORY[0x1E4F1CCE8];
        uint64_t v40 = *MEMORY[0x1E4F1CCF8];
        uint64_t v41 = *MEMORY[0x1E4F1CCF0];
        do
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v85 != v72) {
              objc_enumerationMutation(obja);
            }
            v43 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            uint64_t v44 = [v43 objectForKeyedSubscript:v39];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v45 = v44;
            }
            else {
              uint64_t v45 = 0;
            }
            v46 = (void *)[v43 objectForKeyedSubscript:v40];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              v46 = 0;
            }
            uint64_t v47 = [v43 objectForKeyedSubscript:v41];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v48 = (void *)v47;
            }
            else {
              v48 = 0;
            }
            if (v46) {
              BOOL v49 = v48 == 0;
            }
            else {
              BOOL v49 = 1;
            }
            if (v49)
            {
              uint64_t v51 = 0x7FFFFFFFFFFFFFFFLL;
              uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
              if (!v45) {
                continue;
              }
            }
            else
            {
              uint64_t v51 = [v46 integerValue];
              uint64_t v50 = [v48 integerValue];
              if (!v45) {
                continue;
              }
            }
            if (v51 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v81 = @"NSReplacementIndex";
              uint64_t v82 = v45;
              -[NSMutableAttributedString addAttributes:range:](v70, "addAttributes:range:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1], v51, v50);
            }
          }
          uint64_t v38 = [obja countByEnumeratingWithState:&v84 objects:v83 count:16];
        }
        while (v38);
      }
    }

    if (*((unsigned char *)v76 + 24)
      || (uint64_t v52 = [(NSAttributedString *)v70 length],
          v73[0] = MEMORY[0x1E4F143A8],
          v73[1] = 3221225472,
          v73[2] = __132__NSAttributedString_NSAttributedStringFormattingSPI____initWithFormat_attributeOptions_formattingOptions_locale_context_arguments___block_invoke_3,
          v73[3] = &unk_1E51F8628,
          v73[4] = &v75,
          -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v70, "enumerateAttributesInRange:options:usingBlock:", 0, v52, 0x100000, v73), *((unsigned char *)v76 + 24)))
    {
      -[NSMutableAttributedString _inflectWithLocale:replacements:concepts:preflight:](v70, "_inflectWithLocale:replacements:concepts:preflight:", a6, +[_NSAttributedStringReplacement _replacementsFromMetadataArray:](_NSAttributedStringReplacement, "_replacementsFromMetadataArray:", v80), [a7 objectForKeyedSubscript:@"NSContextInflectionConcepts"], 0);
    }
    [(NSMutableAttributedString *)v70 removeAttribute:@"NSFormatSpecifierConfiguration", 0, [(NSAttributedString *)v70 length] range];
    v53 = [(NSAttributedString *)v56 initWithAttributedString:v70];
  }
  else
  {

    v53 = -[NSAttributedString initWithString:](self, "initWithString:", &stru_1ECA5C228, v55);
  }
  _Block_object_dispose(&v75, 8);
  return v53;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[NSMutableAttributedString allocWithZone:a3];

  return [(NSConcreteMutableAttributedString *)v4 initWithAttributedString:self];
}

- (NSAttributedString)attributedSubstringFromRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = range.location + range.length;
  uint64_t v8 = [(NSAttributedString *)self string];
  unint64_t v9 = [(NSString *)v8 length];
  if (v7 > v9)
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = _NSNameOfClass(v17);
    BOOL v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: Out of bounds", v18, sel_getName(a2)), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  if (length == v9)
  {
    id v10 = [(NSAttributedString *)self copyWithZone:0];
    return (NSAttributedString *)v10;
  }
  else
  {
    uint64_t v12 = (NSAttributedString *)(id)objc_msgSend(objc_allocWithZone((Class)NSConcreteMutableAttributedString), "initWithString:", -[NSString substringWithRange:](v8, "substringWithRange:", location, length));
    if (location < v7)
    {
      NSUInteger v13 = location;
      do
      {
        uint64_t v20 = 0;
        NSUInteger v21 = 0;
        uint64_t v14 = [(NSAttributedString *)self attributesAtIndex:v13 effectiveRange:&v20];
        if (v21 + v20 <= v7) {
          NSUInteger v15 = v20 - v13 + v21;
        }
        else {
          NSUInteger v15 = v7 - v13;
        }
        if (v20 != v13 || v21 + v20 > v7) {
          NSUInteger v21 = v15;
        }
        -[NSAttributedString addAttributes:range:](v12, "addAttributes:range:", v14, v13 - location, v15);
        v13 += v21;
      }
      while (v13 < v7);
    }
    return v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NSAttributedString allocWithZone:a3];

  return [(NSConcreteAttributedString *)v4 initWithAttributedString:self];
}

+ (NSAttributedString)allocWithZone:(_NSZone *)a3
{
  id v4 = (objc_class *)a1;
  if (self == a1) {
    id v4 = (objc_class *)self;
  }

  return (NSAttributedString *)NSAllocateObject(v4, 0, a3);
}

- (NSAttributedString)initWithMarkdownString:(NSString *)markdownString options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  v17[1] = *MEMORY[0x1E4F143B8];

  CFIndex v10 = [(NSString *)markdownString length];
  v17[0] = 0;
  v18.NSUInteger location = 0;
  v18.NSUInteger length = v10;
  CFIndex Bytes = CFStringGetBytes((CFStringRef)markdownString, v18, 0x8000100u, 0, 0, 0, 0, v17);
  if (Bytes < 1) {
    return 0;
  }
  CFIndex v12 = v17[0];
  if (v17[0] <= 0x80uLL)
  {
    if (v17[0])
    {
      MEMORY[0x1F4188790](Bytes);
      NSUInteger v15 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, v12);
    }
    else
    {
      NSUInteger v15 = 0;
    }
    v20.NSUInteger location = 0;
    v20.NSUInteger length = v10;
    if (CFStringGetBytes((CFStringRef)markdownString, v20, 0x8000100u, 0, 0, (UInt8 *)v15, v12, 0) >= 1) {
      return (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v15, v17[0], options, (uint64_t)baseURL, error);
    }
    goto LABEL_11;
  }
  NSUInteger v13 = malloc_type_malloc(v17[0], 0x100004077774924uLL);
  v19.NSUInteger location = 0;
  v19.NSUInteger length = v10;
  if (CFStringGetBytes((CFStringRef)markdownString, v19, 0x8000100u, 0, 0, (UInt8 *)v13, v17[0], 0) < 1)
  {
    free(v13);
LABEL_11:
    if (error)
    {
      uint64_t v14 = 0;
      *error = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:259 userInfo:0];
      return v14;
    }
    return 0;
  }
  uint64_t v14 = (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v13, v17[0], options, (uint64_t)baseURL, error);
  free(v13);
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  self;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSAttributedString *)self isEqualToAttributedString:a3];
}

- (BOOL)_mayRequireIntentResolution
{
  return objc_getAssociatedObject(self, &_NSAttributedStringMayRequireIntentResolutionKey) != 0;
}

- (BOOL)_willRequireIntentResolutionWhenContainingAttribute:(id)a3 value:(id)a4
{
  int v6 = [a3 isEqual:@"NSInlinePresentationIntent"];
  if (a4 && v6 && ![a4 isEqual:&off_1ECAB4EC8]) {
    return 1;
  }
  BOOL result = [a3 isEqual:@"NSPresentationIntent"];
  if (!a4) {
    return 0;
  }
  return result;
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  return [(NSAttributedString *)self __initWithFormat:a3 attributeOptions:a4 formattingOptions:0 locale:a5 arguments:a6];
}

- (id)__initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  return [(NSAttributedString *)self __initWithFormat:a3 attributeOptions:a4 formattingOptions:a5 locale:a6 context:MEMORY[0x1E4F1CC08] arguments:a7];
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format context:(NSDictionary *)context
{
  va_start(va, context);
  id v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v6, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, 0, 0, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), context, va);
}

- (unint64_t)hash
{
  v2 = [(NSAttributedString *)self string];

  return [(NSString *)v2 hash];
}

+ (void)_setAttributedDictionaryClass:(Class)a3
{
  attributeDictionaryClass = (uint64_t)a3;
}

- (NSString)string
{
  id v4 = NSClassFromString((NSString *)@"NSAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
  id v6 = NSClassFromString((NSString *)@"NSAttributedString");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)attributedSubstringFromRange:(_NSRange)a3 replacingCharactersInRanges:(const _NSRange *)a4 numberOfRanges:(int64_t)a5 withString:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CFIndex v12 = objc_alloc_init(NSMutableAttributedString);
  _CFAutoreleasePoolPush();
  NSUInteger v13 = location;
  if (a5 >= 1)
  {
    do
    {
      -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
      -[NSMutableAttributedString replaceCharactersInRange:withString:](v12, "replaceCharactersInRange:withString:", [(NSAttributedString *)v12 length] - 1, 1, a6);
      NSUInteger v14 = a4->location;
      NSUInteger v15 = a4->length;
      ++a4;
      NSUInteger v13 = v15 + v14;
      --a5;
    }
    while (a5);
  }
  if (location + length > v13) {
    -[NSMutableAttributedString appendAttributedString:](v12, "appendAttributedString:", -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:"));
  }
  _CFAutoreleasePoolPop();
  return v12;
}

- (id)attributedStringByWeaklyAddingAttributes:(id)a3
{
  id v5 = [(NSAttributedString *)self mutableCopyWithZone:0];
  objc_msgSend(v5, "addAttributesWeakly:range:", a3, 0, -[NSAttributedString length](self, "length"));
  id v6 = (id)[v5 copyWithZone:0];

  return v6;
}

- (NSUInteger)length
{
  v2 = [(NSAttributedString *)self string];

  return [(NSString *)v2 length];
}

- (id)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSAttributedString *)self length];
  id v4 = +[NSMutableString stringWithCapacity:2 * v3];
  NSUInteger v10 = 0;
  uint64_t v11 = 0;
  if (v3)
  {
    for (i = 0; i < v3; NSUInteger v10 = i)
    {
      id v6 = [(NSAttributedString *)self attributesAtIndex:i effectiveRange:&v10];
      uint64_t v7 = [(NSString *)v4 length];
      uint64_t v8 = [(NSAttributedString *)self string];
      -[NSMutableString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", v7, 0, -[NSString substringWithRange:](v8, "substringWithRange:", v10, v11));
      -[NSMutableString replaceCharactersInRange:withString:](v4, "replaceCharactersInRange:withString:", [(NSString *)v4 length], 0, [(NSDictionary *)v6 description]);
      NSUInteger i = v10 + v11;
    }
  }
  return v4;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSAttributedString *)self length];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E4F1D530];
  *(_OWORD *)&keyCallBacks.release = v6;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  char v7 = [a3 allowsKeyedCoding];
  uint64_t v8 = [(NSAttributedString *)self string];
  if ((v7 & 1) == 0)
  {
    [a3 encodeObject:v8];
    if (!v5) {
      return;
    }
    CFDictionaryRef v13 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
    NSUInteger v14 = 0;
    int v15 = 1;
    do
    {
      id v16 = (void *)MEMORY[0x185308110]();
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v17 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v14, &v37, v14, v5 - v14);
      LODWORD(v34) = 0;
      LODWORD(v34) = CFDictionaryGetValue(v13, v17);
      LODWORD(value) = v38;
      if (v34)
      {
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
      }
      else
      {
        LODWORD(v34) = v15;
        CFDictionaryAddValue(v13, v17, (const void *)v15);
        objc_msgSend(a3, "encodeValuesOfObjCTypes:", "iI", &v34, &value);
        [a3 encodeObject:v17];
        ++v15;
      }
      v14 += v38;
    }
    while (v14 < v5);
    if (!v13) {
      return;
    }
LABEL_14:
    CFRelease(v13);
    return;
  }
  [a3 encodeObject:v8 forKey:@"NSString"];
  if (v5)
  {
    uint64_t v34 = 0;
    unint64_t v35 = 0;
    unint64_t v9 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v34, 0, v5);
    NSUInteger v10 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    uint64_t v11 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    if (v9) {
      NSUInteger v10 = v9;
    }
    uint64_t v12 = v10;
    if (v35 == v5)
    {
      [a3 encodeObject:v12 forKey:@"NSAttributes"];
      CFDictionaryRef v13 = 0;
    }
    else
    {
      id v32 = a3;
      CFRange v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
      CFRange v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:100];
      CFDictionaryRef v13 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
      uint64_t v20 = 0;
      while (1)
      {
        NSUInteger v21 = (void *)MEMORY[0x185308110]();
        value = 0;
        if (!CFDictionaryGetValueIfPresent(v13, v12, (const void **)&value))
        {
          value = (void *)[v18 count];
          CFDictionaryAddValue(v13, v12, value);
          [v18 addObject:v12];
        }
        LOBYTE(v22) = v35;
        uint64_t v23 = &v37;
        if (v35 >= 0x80)
        {
          unint64_t v24 = v35;
          do
          {
            *(unsigned char *)uint64_t v23 = v24 | 0x80;
            uint64_t v23 = (uint64_t *)((char *)v23 + 1);
            unint64_t v22 = v24 >> 7;
            unint64_t v25 = v24 >> 14;
            v24 >>= 7;
          }
          while (v25);
        }
        *(unsigned char *)uint64_t v23 = v22;
        uint64_t v26 = (char *)v23 + 1;
        unint64_t v27 = (unint64_t)value;
        if ((unint64_t)value < 0x80)
        {
          LOBYTE(v28) = (_BYTE)value;
        }
        else
        {
          do
          {
            *v26++ = v27 | 0x80;
            unint64_t v28 = v27 >> 7;
            unint64_t v29 = v27 >> 14;
            v27 >>= 7;
          }
          while (v29);
        }
        *uint64_t v26 = v28;
        [v19 appendBytes:&v37 length:v26 - (unsigned char *)&v37 + 1];
        v20 += v35;
        if (v5 == v20) {
          break;
        }

        v30 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self, "attributesAtIndex:longestEffectiveRange:inRange:", v20, &v34, v20, v5 - v20);
        if (v30) {
          uint64_t v31 = v30;
        }
        else {
          uint64_t v31 = v11;
        }
        uint64_t v12 = v31;
      }
      [v32 encodeObject:v18 forKey:@"NSAttributes"];
      [v32 encodeObject:v19 forKey:@"NSAttributeInfo"];
    }
    if (v13) {
      goto LABEL_14;
    }
  }
}

- (NSAttributedString)initWithCoder:(id)a3
{
  NSUInteger v5 = (void *)[objc_allocWithZone((Class)NSMutableAttributedString) init];
  if (_NSReadMutableAttributedStringWithCoder(a3, v5))
  {
    long long v6 = [(NSAttributedString *)self initWithAttributedString:v5];
  }
  else
  {

    long long v6 = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_markRequiringIntentResolution
{
}

- (void)_markIntentsResolved
{
}

- (id)_createAttributedSubstringWithRange:(_NSRange)a3
{
  NSUInteger v3 = -[NSAttributedString attributedSubstringFromRange:](self, "attributedSubstringFromRange:", a3.location, a3.length);

  return v3;
}

- (id)_firstValueOfAttributeWithKey:(id)a3 inRange:(_NSRange)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  NSUInteger v10 = __Block_byref_object_copy__7;
  uint64_t v11 = __Block_byref_object_dispose__7;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke;
  v6[3] = &unk_1E51F8600;
  v6[4] = &v7;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](self, "enumerateAttribute:inRange:options:usingBlock:", a3, a4.location, a4.length, 0x100000, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__74__NSAttributedString_NSInflection___firstValueOfAttributeWithKey_inRange___block_invoke(void *result, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    long long v6 = result;
    BOOL result = a2;
    *(void *)(*(void *)(v6[4] + 8) + 40) = result;
    *a5 = 1;
  }
  return result;
}

- (id)_inflectedAttributedString
{
  v2 = (void *)[(NSAttributedString *)self mutableCopy];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 _inflectWithLocale:v3 replacements:MEMORY[0x1E4F1CBF0] concepts:MEMORY[0x1E4F1CBF0] preflight:1];

  return v2;
}

- (id)_identicalAttributesInRange:(_NSRange)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__7;
  uint64_t v12 = __Block_byref_object_dispose__7;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke;
  v7[3] = &unk_1E51F8628;
  v7[4] = &v8;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", a3.location, a3.length, 0x100000, v7);
  uint64_t v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  NSUInteger v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __64__NSAttributedString_NSInflection___identicalAttributesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = (void *)[v7 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v14), "isEqual:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v14)) & 1) == 0)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "removeObjectForKey:", v14); {
        }
          }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }
      while (v11);
    }
    uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count];
    *a5 = result == 0;
  }
  else
  {
    uint64_t result = [a2 mutableCopy];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

- (NSAttributedString)attributedStringByInflectingString
{
  v2 = (void *)[(NSAttributedString *)self mutableCopy];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v2 _inflectWithLocale:v3 replacements:MEMORY[0x1E4F1CBF0] concepts:MEMORY[0x1E4F1CBF0] preflight:1];

  return (NSAttributedString *)v2;
}

- (id)_initWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5
{
  return -[NSAttributedString _initWithFormat:options:locale:arguments:](self, "_initWithFormat:options:locale:arguments:", a3, a4, 0, &v6, &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v4, "_initWithFormat:options:locale:arguments:", a3, 0, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), &v6);
}

+ (id)_localizedAttributedStringWithFormat:(id)a3 options:(unint64_t)a4
{
  id v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v6, "_initWithFormat:options:locale:arguments:", a3, a4, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), &v8);
}

+ (id)_attributedStringWithFormat:(id)a3 options:(unint64_t)a4 locale:(id)a5 arguments:(char *)a6
{
  id v6 = (void *)[objc_alloc((Class)a1) _initWithFormat:a3 options:a4 locale:a5 arguments:a6];

  return v6;
}

+ (id)_attributedStringWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6 arguments:(char *)a7
{
  uint64_t v7 = (void *)[objc_alloc((Class)a1) _initWithFormat:a3 attributeOptions:a4 formattingOptions:a5 locale:a6 arguments:a7];

  return v7;
}

- (id)_initWithFormat:(id)a3 attributeOptions:(unint64_t)a4 formattingOptions:(id)a5 locale:(id)a6
{
  return -[NSAttributedString _initWithFormat:attributeOptions:formattingOptions:locale:arguments:](self, "_initWithFormat:attributeOptions:formattingOptions:locale:arguments:", a3, a4, a5, a6, &v7, &v7);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale
{
  va_start(va, locale);
  return (NSAttributedString *)-[NSAttributedString _initWithFormat:options:locale:arguments:](self, "_initWithFormat:options:locale:arguments:", format, options, 0, va, va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context
{
  va_start(va, context);
  return (NSAttributedString *)-[NSAttributedString __initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:](self, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, options, 0, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", format, options, locale), context, va);
}

- (NSAttributedString)initWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(NSLocale *)locale context:(NSDictionary *)context arguments:(va_list)arguments
{
  return (NSAttributedString *)[(NSAttributedString *)self __initWithFormat:format attributeOptions:options formattingOptions:0 locale:locale context:context arguments:arguments];
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options
{
  va_start(va, options);
  id v6 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v6, "_initWithFormat:options:locale:arguments:", format, options, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), va);
}

+ (NSAttributedString)localizedAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options context:(NSDictionary *)context
{
  va_start(va, context);
  id v8 = objc_alloc((Class)a1);
  return (NSAttributedString *)(id)objc_msgSend(v8, "__initWithFormat:attributeOptions:formattingOptions:locale:context:arguments:", format, options, 0, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), context, va);
}

- (NSAttributedString)initWithContentsOfMarkdownFileAtURL:(NSURL *)markdownFile options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:markdownFile options:1 error:error];
  if (v10)
  {
    return [(NSAttributedString *)self initWithMarkdown:v10 options:options baseURL:baseURL error:error];
  }
  else
  {

    return 0;
  }
}

- (NSAttributedString)initWithMarkdown:(NSData *)markdown options:(NSAttributedStringMarkdownParsingOptions *)options baseURL:(NSURL *)baseURL error:(NSError *)error
{
  uint64_t v10 = [(NSData *)markdown bytes];
  uint64_t v11 = [(NSData *)markdown length];

  return (NSAttributedString *)newAttributedStringFromMarkdown((uint64_t)v10, v11, options, (uint64_t)baseURL, error);
}

@end