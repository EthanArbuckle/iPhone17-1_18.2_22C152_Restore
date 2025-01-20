@interface _NSAttributedStringFromMarkdownCreatorConcrete
- (_NSAttributedStringFromMarkdownCreatorConcrete)init;
- (id)parseExtendedAttributesFromData:(id)a3 error:(id *)a4;
- (id)result;
- (unsigned)lastCharacter;
- (void)appendString:(id)a3;
- (void)appendString:(id)a3 with:(id)a4;
- (void)dealloc;
- (void)finalizeWithLanguageIdentifier:(id)a3;
@end

@implementation _NSAttributedStringFromMarkdownCreatorConcrete

- (id)result
{
  v2 = self->_result;

  return v2;
}

- (_NSAttributedStringFromMarkdownCreatorConcrete)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_NSAttributedStringFromMarkdownCreatorConcrete;
  v2 = [(_NSAttributedStringFromMarkdownCreatorConcrete *)&v4 init];
  if (v2) {
    v2->_result = objc_alloc_init(NSMutableAttributedString);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringFromMarkdownCreatorConcrete;
  [(_NSAttributedStringFromMarkdownCreatorConcrete *)&v3 dealloc];
}

- (void)finalizeWithLanguageIdentifier:(id)a3
{
  v7[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    result = self->_result;
    uint64_t v6 = [(NSAttributedString *)result length];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81___NSAttributedStringFromMarkdownCreatorConcrete_finalizeWithLanguageIdentifier___block_invoke;
    v7[3] = &unk_1E51FAC60;
    v7[4] = self;
    v7[5] = a3;
    [(NSAttributedString *)result enumerateAttribute:@"NSLanguage", 0, v6, 0x100000, v7 inRange options usingBlock];
  }
}

- (void)appendString:(id)a3 with:(id)a4
{
  uint64_t v5 = [[NSAttributedString alloc] initWithString:a3 attributes:a4];
  [(NSMutableAttributedString *)self->_result appendAttributedString:v5];
}

- (unsigned)lastCharacter
{
  NSUInteger v3 = [(NSAttributedString *)self->_result length];
  if (v3)
  {
    uint64_t v4 = [(NSAttributedString *)self->_result string];
    NSUInteger v5 = [(NSAttributedString *)self->_result length] - 1;
    LOWORD(v3) = [(NSString *)v4 characterAtIndex:v5];
  }
  return v3;
}

- (void)appendString:(id)a3
{
  uint64_t v4 = [(NSMutableAttributedString *)self->_result mutableString];

  [(NSMutableString *)v4 appendString:a3];
}

- (id)parseExtendedAttributesFromData:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v5 = +[NSJSONSerialization JSONObjectWithData:a3 options:24 error:&v13];
  if (v5)
  {
    uint64_t v6 = v5;
    if (_NSIsNSDictionary())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __attributesFromKnownAttributeKeys_block_invoke;
      v14[3] = &unk_1E51FAC88;
      v14[4] = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:v14];
      return v7;
    }
    if (a4)
    {
      v15 = @"NSDebugDescription";
      v16 = @"JSON result was not a dictionary";
      v9 = (void *)MEMORY[0x1E4F1C9E8];
      v10 = &v16;
      v11 = &v15;
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v17 = @"NSUnderlyingError";
    v18[0] = v13;
    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = (__CFString **)v18;
    v11 = &v17;
LABEL_8:
    v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 259, [v9 dictionaryWithObjects:v10 forKeys:v11 count:1]);
    id result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

@end