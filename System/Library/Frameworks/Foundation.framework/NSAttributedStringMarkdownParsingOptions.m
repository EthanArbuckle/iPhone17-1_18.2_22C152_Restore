@interface NSAttributedStringMarkdownParsingOptions
+ (id)_localizedAttributedStringParsingOptions;
+ (id)allowingExtendedAttributes;
- (BOOL)allowsExtendedAttributes;
- (BOOL)appliesSourcePositionAttributes;
- (BOOL)isEqual:(id)a3;
- (NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax;
- (NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy;
- (NSAttributedStringMarkdownParsingOptions)init;
- (NSString)languageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAllowsExtendedAttributes:(BOOL)allowsExtendedAttributes;
- (void)setAppliesSourcePositionAttributes:(BOOL)appliesSourcePositionAttributes;
- (void)setFailurePolicy:(NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy;
- (void)setInterpretedSyntax:(NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax;
- (void)setLanguageCode:(NSString *)languageCode;
@end

@implementation NSAttributedStringMarkdownParsingOptions

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownParsingOptions;
  [(NSAttributedStringMarkdownParsingOptions *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAllowsExtendedAttributes:", -[NSAttributedStringMarkdownParsingOptions allowsExtendedAttributes](self, "allowsExtendedAttributes"));
  objc_msgSend(v4, "setInterpretedSyntax:", -[NSAttributedStringMarkdownParsingOptions interpretedSyntax](self, "interpretedSyntax"));
  objc_msgSend(v4, "setFailurePolicy:", -[NSAttributedStringMarkdownParsingOptions failurePolicy](self, "failurePolicy"));
  objc_msgSend(v4, "setLanguageCode:", -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode"));
  objc_msgSend(v4, "setAppliesSourcePositionAttributes:", -[NSAttributedStringMarkdownParsingOptions appliesSourcePositionAttributes](self, "appliesSourcePositionAttributes"));
  return v4;
}

- (void)setLanguageCode:(NSString *)languageCode
{
}

- (void)setInterpretedSyntax:(NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  self->_interpretedSyntax = interpretedSyntax;
}

- (void)setFailurePolicy:(NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  self->_failurePolicy = failurePolicy;
}

- (void)setAllowsExtendedAttributes:(BOOL)allowsExtendedAttributes
{
  self->_allowsExtendedAttributes = allowsExtendedAttributes;
}

- (NSAttributedStringMarkdownParsingOptions)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSAttributedStringMarkdownParsingOptions;
  result = [(NSAttributedStringMarkdownParsingOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_allowsExtendedAttributes = 0;
    result->_failurePolicy = 0;
    result->_languageCode = 0;
    result->_interpretedSyntax = 0;
  }
  return result;
}

- (void)setAppliesSourcePositionAttributes:(BOOL)appliesSourcePositionAttributes
{
  self->_appliesSourcePositionAttributes = appliesSourcePositionAttributes;
}

- (BOOL)appliesSourcePositionAttributes
{
  return self->_appliesSourcePositionAttributes;
}

- (NSAttributedStringMarkdownInterpretedSyntax)interpretedSyntax
{
  return self->_interpretedSyntax;
}

- (NSString)languageCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSAttributedStringMarkdownParsingFailurePolicy)failurePolicy
{
  return self->_failurePolicy;
}

- (BOOL)allowsExtendedAttributes
{
  return self->_allowsExtendedAttributes;
}

+ (id)_localizedAttributedStringParsingOptions
{
  if (qword_1EB1ED180 != -1) {
    dispatch_once(&qword_1EB1ED180, &__block_literal_global_57);
  }
  return (id)qword_1EB1ED178;
}

+ (id)allowingExtendedAttributes
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setAllowsExtendedAttributes:1];

  return v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  uint64_t v4 = [(NSAttributedStringMarkdownParsingOptions *)self allowsExtendedAttributes];
  uint64_t v5 = v3 ^ [(NSAttributedStringMarkdownParsingOptions *)self interpretedSyntax] ^ v4;
  NSAttributedStringMarkdownParsingFailurePolicy v6 = [(NSAttributedStringMarkdownParsingOptions *)self failurePolicy];
  NSUInteger v7 = v6 ^ [(NSString *)[(NSAttributedStringMarkdownParsingOptions *)self languageCode] hash];
  return v5 ^ v7 ^ [(NSAttributedStringMarkdownParsingOptions *)self appliesSourcePositionAttributes];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [a3 allowsExtendedAttributes],
        v5 == [(NSAttributedStringMarkdownParsingOptions *)self allowsExtendedAttributes])
    && (uint64_t v6 = [a3 interpretedSyntax],
        v6 == [(NSAttributedStringMarkdownParsingOptions *)self interpretedSyntax])
    && (uint64_t v7 = [a3 failurePolicy],
        v7 == [(NSAttributedStringMarkdownParsingOptions *)self failurePolicy]))
  {
    v8 = (NSString *)[a3 languageCode];
    if (v8 == [(NSAttributedStringMarkdownParsingOptions *)self languageCode]
      || (v9 = [(NSAttributedStringMarkdownParsingOptions *)self languageCode]) != 0
      && (LODWORD(v9) = objc_msgSend((id)objc_msgSend(a3, "languageCode"), "isEqual:", -[NSAttributedStringMarkdownParsingOptions languageCode](self, "languageCode")), v9))
    {
      char v10 = [a3 appliesSourcePositionAttributes];
      LOBYTE(v9) = v10 ^ [(NSAttributedStringMarkdownParsingOptions *)self appliesSourcePositionAttributes] ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

@end