@interface _NSAttributedStringReplacement
+ (id)_replacementsFromMetadataArray:(id)a3;
- (_NSAttributedStringReplacement)initWithIndex:(int64_t)a3 specifierRangeInFormatString:(_NSRange)a4 replacementRangeInResult:(_NSRange)a5 replacementKind:(int64_t)a6 argument:(id)a7;
- (_NSRange)replacementRangeInResult;
- (_NSRange)specifierRangeInFormatString;
- (id)_initWithMetadata:(id)a3;
- (id)argument;
- (int64_t)index;
- (int64_t)replacementKind;
- (void)dealloc;
@end

@implementation _NSAttributedStringReplacement

- (id)_initWithMetadata:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)_NSAttributedStringReplacement;
  v4 = [(_NSAttributedStringReplacement *)&v21 init];
  if (v4)
  {
    v5 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F1CCE8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v5) {
      goto LABEL_24;
    }
    v4->_index = [v5 integerValue];
    uint64_t v6 = *MEMORY[0x1E4F1CD00];
    v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F1CD08]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v7 = 0;
    }
    v8 = (void *)[a3 objectForKeyedSubscript:v6];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v8 = 0;
    }
    if (!v7 || v8 == 0)
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v10 = [v7 integerValue];
      uint64_t v11 = [v8 integerValue];
    }
    v4->_specifierRangeInFormatString.location = v10;
    v4->_specifierRangeInFormatString.length = v11;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_24;
    }
    uint64_t v12 = *MEMORY[0x1E4F1CCF0];
    v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F1CCF8]];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v13 = 0;
    }
    uint64_t v14 = [a3 objectForKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = (void *)v14;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v13 && v15)
    {
      uint64_t v16 = [v13 integerValue];
      uint64_t v17 = [v15 integerValue];
    }
    v4->_replacementRangeInResult.location = v16;
    v4->_replacementRangeInResult.length = v17;
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4->_replacementKind = 2;
      v19 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F1CCE0]];
      if (v19)
      {
        v4->_argument = v19;
        v4->_replacementKind = 0;
      }
      else
      {
        v20 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F1CCD8]];
        if (v20)
        {
          v4->_argument = v20;
          v4->_replacementKind = 1;
        }
      }
    }
    else
    {
LABEL_24:

      return 0;
    }
  }
  return v4;
}

- (_NSAttributedStringReplacement)initWithIndex:(int64_t)a3 specifierRangeInFormatString:(_NSRange)a4 replacementRangeInResult:(_NSRange)a5 replacementKind:(int64_t)a6 argument:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v10 = a4.length;
  NSUInteger v11 = a4.location;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_NSAttributedStringReplacement;
  v13 = [(_NSAttributedStringReplacement *)&v17 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_index = a3;
    v13->_specifierRangeInFormatString.NSUInteger length = v10;
    v13->_replacementRangeInResult.NSUInteger location = location;
    v13->_replacementRangeInResult.NSUInteger length = length;
    v13->_replacementKind = a6;
    v13->_specifierRangeInFormatString.NSUInteger location = v11;
    if (a7) {
      id v15 = a7;
    }
    else {
      id v15 = 0;
    }
    v14->_argument = v15;
  }
  return v14;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringReplacement;
  [(_NSAttributedStringReplacement *)&v3 dealloc];
}

+ (id)_replacementsFromMetadataArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        id v9 = [[_NSAttributedStringReplacement alloc] _initWithMetadata:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        if (v9) {
          [v4 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v6);
  }
  return v4;
}

- (int64_t)index
{
  return self->_index;
}

- (_NSRange)specifierRangeInFormatString
{
  dest[2] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_specifierRangeInFormatString, 16, 1, 0);
  NSUInteger v2 = dest[0];
  NSUInteger v3 = dest[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (_NSRange)replacementRangeInResult
{
  dest[2] = *MEMORY[0x1E4F143B8];
  objc_copyStruct(dest, &self->_replacementRangeInResult, 16, 1, 0);
  NSUInteger v2 = dest[0];
  NSUInteger v3 = dest[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (id)argument
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int64_t)replacementKind
{
  return self->_replacementKind;
}

@end