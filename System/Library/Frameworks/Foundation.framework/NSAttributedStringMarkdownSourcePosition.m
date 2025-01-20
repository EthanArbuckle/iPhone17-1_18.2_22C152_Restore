@interface NSAttributedStringMarkdownSourcePosition
+ ($915FBD377EA738B5CB203B2EF22C919A)calculateOffsetsForLine:(SEL)a3 column:(int64_t)a4 inString:(int64_t)a5 size:(const char *)a6 withExistingOffsets:(unint64_t)a7;
+ (BOOL)supportsSecureCoding;
- ($915FBD377EA738B5CB203B2EF22C919A)endOffsets;
- ($915FBD377EA738B5CB203B2EF22C919A)startOffsets;
- (BOOL)isEqual:(id)a3;
- (NSAttributedStringMarkdownSourcePosition)initWithCoder:(id)a3;
- (NSAttributedStringMarkdownSourcePosition)initWithStart:(id *)a3 end:(id *)a4;
- (NSAttributedStringMarkdownSourcePosition)initWithStartLine:(NSInteger)startLine startColumn:(NSInteger)startColumn endLine:(NSInteger)endLine endColumn:(NSInteger)endColumn;
- (NSInteger)endColumn;
- (NSInteger)endLine;
- (NSInteger)startColumn;
- (NSInteger)startLine;
- (NSRange)rangeInString:(NSString *)string;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOffsetsFromUTF8:(const char *)a3 size:(unint64_t)a4 usingCache:(id *)a5;
@end

@implementation NSAttributedStringMarkdownSourcePosition

- (NSInteger)startLine
{
  return self->_startOffsets.line;
}

- (NSInteger)startColumn
{
  return self->_startOffsets.column;
}

- (NSInteger)endLine
{
  return self->_endOffsets.line;
}

- (NSInteger)endColumn
{
  return self->_endOffsets.column;
}

- (NSAttributedStringMarkdownSourcePosition)initWithStartLine:(NSInteger)startLine startColumn:(NSInteger)startColumn endLine:(NSInteger)endLine endColumn:(NSInteger)endColumn
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  result = [(NSAttributedStringMarkdownSourcePosition *)&v12 init];
  if (result)
  {
    int64x2_t v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&result->_startOffsets.utf8Offset = v11;
    *(int64x2_t *)&result->_startOffsets.utf8NextCodePoint = v11;
    result->_startOffsets.line = startLine;
    result->_startOffsets.column = startColumn;
    *(int64x2_t *)&result->_endOffsets.utf8Offset = v11;
    *(int64x2_t *)&result->_endOffsets.utf8NextCodePoint = v11;
    result->_endOffsets.line = endLine;
    result->_endOffsets.column = endColumn;
  }
  return result;
}

- (NSAttributedStringMarkdownSourcePosition)initWithStart:(id *)a3 end:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  result = [(NSAttributedStringMarkdownSourcePosition *)&v11 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    long long v8 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->_startOffsets.line = *(_OWORD *)&a3->var4;
    *(_OWORD *)&result->_startOffsets.utf8NextCodePoint = v8;
    *(_OWORD *)&result->_startOffsets.utf8Offset = v7;
    long long v9 = *(_OWORD *)&a4->var0;
    long long v10 = *(_OWORD *)&a4->var2;
    *(_OWORD *)&result->_endOffsets.line = *(_OWORD *)&a4->var4;
    *(_OWORD *)&result->_endOffsets.utf8NextCodePoint = v10;
    *(_OWORD *)&result->_endOffsets.utf8Offset = v9;
  }
  return result;
}

- ($915FBD377EA738B5CB203B2EF22C919A)startOffsets
{
  long long v3 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var5;
  return self;
}

- ($915FBD377EA738B5CB203B2EF22C919A)endOffsets
{
  long long v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var5;
  return self;
}

- (void)setOffsetsFromUTF8:(const char *)a3 size:(unint64_t)a4 usingCache:(id *)a5
{
  updateOffsetsForPosition((uint64_t)a3, (unsigned __int8 *)a4, self->_startOffsets.line, self->_startOffsets.column, (unsigned __int8 **)a5);
  long long v9 = *(_OWORD *)&a5->var0;
  long long v10 = *(_OWORD *)&a5->var2;
  *(_OWORD *)&self->_startOffsets.line = *(_OWORD *)&a5->var4;
  *(_OWORD *)&self->_startOffsets.utf8NextCodePoint = v10;
  *(_OWORD *)&self->_startOffsets.utf8Offset = v9;
  updateOffsetsForPosition((uint64_t)a3, (unsigned __int8 *)a4, self->_endOffsets.line, self->_endOffsets.column, (unsigned __int8 **)a5);
  long long v11 = *(_OWORD *)&a5->var0;
  long long v12 = *(_OWORD *)&a5->var2;
  *(_OWORD *)&self->_endOffsets.line = *(_OWORD *)&a5->var4;
  *(_OWORD *)&self->_endOffsets.utf8NextCodePoint = v12;
  *(_OWORD *)&self->_endOffsets.utf8Offset = v11;
}

+ ($915FBD377EA738B5CB203B2EF22C919A)calculateOffsetsForLine:(SEL)a3 column:(int64_t)a4 inString:(int64_t)a5 size:(const char *)a6 withExistingOffsets:(unint64_t)a7
{
  long long v8 = *(_OWORD *)&a8->var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a8->var0;
  *(_OWORD *)&retstr->var2 = v8;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&a8->var4;
  return ($915FBD377EA738B5CB203B2EF22C919A *)updateOffsetsForPosition((uint64_t)a6, (unsigned __int8 *)a7, a4, a5, (unsigned __int8 **)retstr);
}

- (NSRange)rangeInString:(NSString *)string
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t utf16Offset = self->_startOffsets.utf16Offset;
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (utf16Offset == 0x7FFFFFFFFFFFFFFFLL || (int64_t v6 = self->_endOffsets.utf16Offset, v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    long long v7 = [(NSString *)string UTF8String];
    long long v8 = (unsigned __int8 *)strlen(v7);
    int64_t line = self->_startOffsets.line;
    int64_t column = self->_startOffsets.column;
    long long v16 = 0u;
    long long v17 = 0u;
    int64x2_t v18 = vdupq_n_s64(1uLL);
    updateOffsetsForPosition((uint64_t)v7, v8, line, column, (unsigned __int8 **)&v16);
    int64_t v11 = *((void *)&v16 + 1);
    updateOffsetsForPosition((uint64_t)v7, v8, self->_endOffsets.line, self->_endOffsets.column, (unsigned __int8 **)&v16);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      NSUInteger v12 = 0x7FFFFFFFFFFFFFFFLL;
      if (*((void *)&v16 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = *((void *)&v17 + 1);
        if ((void)v16 + 1 != (void)v17) {
          uint64_t v13 = 0;
        }
        NSUInteger v12 = *((void *)&v16 + 1) - v11 + v13;
        int64_t v5 = v11;
      }
    }
  }
  else
  {
    int64_t utf16CurrentCodePointLength = self->_endOffsets.utf16CurrentCodePointLength;
    if (self->_endOffsets.utf8Offset + 1 != self->_endOffsets.utf8NextCodePoint) {
      int64_t utf16CurrentCodePointLength = 0;
    }
    NSUInteger v12 = v6 - utf16Offset + utf16CurrentCodePointLength;
    int64_t v5 = self->_startOffsets.utf16Offset;
  }
  NSUInteger v15 = v5;
  result.length = v12;
  result.location = v15;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownSourcePosition;
  return +[NSString stringWithFormat:@"%@{startLine=%lu, startColumn=%lu, endLine=%lu, endColumn=%lu}", [(NSAttributedStringMarkdownSourcePosition *)&v3 description], self->_startOffsets.line, self->_startOffsets.column, self->_endOffsets.line, self->_endOffsets.column];
}

- (id)debugDescription
{
  return +[NSString stringWithFormat:@"<%@ %p>{ startPosition = (%lu, %lu), endPosition = (%lu, %lu), utf8Offsets = (%lu, %lu), utf16Offsets = (%lu, %lu), nextCodePoints = (%lu, %lu), currentCodePointUTF16Lengths = (%lu, %lu) }", objc_opt_class(), self, self->_startOffsets.line, self->_startOffsets.column, self->_endOffsets.line, self->_endOffsets.column, self->_startOffsets.utf8Offset, self->_endOffsets.utf8Offset, self->_startOffsets.utf16Offset, self->_endOffsets.utf16Offset, self->_startOffsets.utf8NextCodePoint, self->_endOffsets.utf8NextCodePoint, self->_startOffsets.utf16CurrentCodePointLength, self->_endOffsets.utf16CurrentCodePointLength];
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding])
  {
    int64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition startLine](self, "startLine"), @"NSStartLine");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition startColumn](self, "startColumn"), @"NSStartColumn");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition endLine](self, "endLine"), @"NSEndLine");
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSAttributedStringMarkdownSourcePosition endColumn](self, "endColumn"), @"NSEndColumn");
  [a3 encodeInteger:self->_startOffsets.utf8Offset forKey:@"NSStartUTF8Offset"];
  [a3 encodeInteger:self->_endOffsets.utf8Offset forKey:@"NSEndUTF8Offset"];
  [a3 encodeInteger:self->_startOffsets.utf16Offset forKey:@"NSStartUTF16Offset"];
  [a3 encodeInteger:self->_endOffsets.utf16Offset forKey:@"NSEndUTF16Offset"];
  [a3 encodeInteger:self->_startOffsets.utf8NextCodePoint forKey:@"NSStartUTF8NextCodePoint"];
  [a3 encodeInteger:self->_endOffsets.utf8NextCodePoint forKey:@"NSEndUTF8NextCodePoint"];
  [a3 encodeInteger:self->_startOffsets.utf16CurrentCodePointLength forKey:@"NSStartUTF16CurrentCodePointLength"];
  int64_t utf16CurrentCodePointLength = self->_endOffsets.utf16CurrentCodePointLength;

  [a3 encodeInteger:utf16CurrentCodePointLength forKey:@"NSEndUTF16CurrentCodePointLength"];
}

- (NSAttributedStringMarkdownSourcePosition)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![a3 allowsKeyedCoding])
  {
    v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be decoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [&unk_1ECAB7EE0 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(&unk_1ECAB7EE0);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (![a3 containsValueForKey:v10])
        {
          [a3 failWithError:+[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"%@: missing key %@", _NSMethodExceptionProem((objc_class *)self, a2), v10)];
          return 0;
        }
      }
      uint64_t v7 = [&unk_1ECAB7EE0 countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = [a3 decodeIntegerForKey:@"NSStartLine"];
  if ([a3 error]) {
    return 0;
  }
  uint64_t v12 = [a3 decodeIntegerForKey:@"NSStartColumn"];
  if ([a3 error]) {
    return 0;
  }
  uint64_t v13 = [a3 decodeIntegerForKey:@"NSEndLine"];
  if ([a3 error]) {
    return 0;
  }
  uint64_t v14 = [a3 decodeIntegerForKey:@"NSEndColumn"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v15 = [a3 decodeIntegerForKey:@"NSStartUTF8Offset"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v16 = [a3 decodeIntegerForKey:@"NSEndUTF8Offset"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v17 = [a3 decodeIntegerForKey:@"NSStartUTF16Offset"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v18 = [a3 decodeIntegerForKey:@"NSEndUTF16Offset"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v19 = [a3 decodeIntegerForKey:@"NSStartUTF8NextCodePoint"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v24 = [a3 decodeIntegerForKey:@"NSEndUTF8NextCodePoint"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v23 = [a3 decodeIntegerForKey:@"NSStartUTF16CurrentCodePointLength"];
  if ([a3 error]) {
    return 0;
  }
  int64_t v22 = [a3 decodeIntegerForKey:@"NSEndUTF16CurrentCodePointLength"];
  if ([a3 error]) {
    return 0;
  }
  NSRange result = [[NSAttributedStringMarkdownSourcePosition alloc] initWithStartLine:v11 startColumn:v12 endLine:v13 endColumn:v14];
  result->_startOffsets.utf8Offset = v15;
  result->_startOffsets.int64_t utf16Offset = v17;
  result->_endOffsets.utf8Offset = v16;
  result->_endOffsets.int64_t utf16Offset = v18;
  result->_startOffsets.utf8NextCodePoint = v19;
  result->_startOffsets.int64_t utf16CurrentCodePointLength = v23;
  result->_endOffsets.utf8NextCodePoint = v24;
  result->_endOffsets.int64_t utf16CurrentCodePointLength = v22;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  NSInteger v4 = [(NSAttributedStringMarkdownSourcePosition *)self startLine];
  NSInteger v5 = [(NSAttributedStringMarkdownSourcePosition *)self startColumn];
  NSInteger v6 = [(NSAttributedStringMarkdownSourcePosition *)self endLine];
  NSInteger v7 = [(NSAttributedStringMarkdownSourcePosition *)self endColumn];
  int8x16_t v8 = veorq_s8(*(int8x16_t *)&self->_startOffsets.utf8NextCodePoint, *(int8x16_t *)&self->_endOffsets.utf8NextCodePoint);
  return *(void *)&veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)) ^ self->_startOffsets.utf8Offset ^ self->_endOffsets.utf8Offset ^ self->_startOffsets.utf16Offset ^ self->_endOffsets.utf16Offset ^ v7 ^ v6 ^ v5 ^ v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 startLine];
  if (v5 != [(NSAttributedStringMarkdownSourcePosition *)self startLine]) {
    return 0;
  }
  uint64_t v6 = [a3 endLine];
  if (v6 != [(NSAttributedStringMarkdownSourcePosition *)self endLine]) {
    return 0;
  }
  uint64_t v7 = [a3 startColumn];
  if (v7 != [(NSAttributedStringMarkdownSourcePosition *)self startColumn]) {
    return 0;
  }
  uint64_t v8 = [a3 endColumn];
  return v8 == [(NSAttributedStringMarkdownSourcePosition *)self endColumn];
}

@end