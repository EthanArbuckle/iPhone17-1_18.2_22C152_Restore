@interface __NSCFLocalizedAttributedString
+ (__CFString)copyStringWithMarkdown:(__CFString *)a3 formatConfiguration:(__CFDictionary *)a4 bundle:(__CFBundle *)a5 tableURL:(__CFURL *)a6;
+ (__CFString)createStringRequiringInflectionWithFormat:(__CFString *)a3 formatOptions:(__CFDictionary *)a4 arguments:(char *)a5;
+ (id)stringEncapsulatingBaseAttributedString:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (Class)classForCoder;
- (__NSCFLocalizedAttributedString)initWithAttributedStringMarkdown:(id)a3 formatConfiguration:(id)a4 bundle:(__CFBundle *)a5 tableURL:(id)a6;
- (__NSCFLocalizedAttributedString)initWithCoder:(id)a3;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (id)__baseAttributedString;
- (id)_initWithAttributedString:(id)a3;
- (id)formatConfiguration;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)substringFromIndex:(unint64_t)a3;
- (id)substringToIndex:(unint64_t)a3;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation __NSCFLocalizedAttributedString

+ (__CFString)copyStringWithMarkdown:(__CFString *)a3 formatConfiguration:(__CFDictionary *)a4 bundle:(__CFBundle *)a5 tableURL:(__CFURL *)a6
{
  id v10 = objc_alloc((Class)a1);

  return (__CFString *)[v10 initWithAttributedStringMarkdown:a3 formatConfiguration:a4 bundle:a5 tableURL:a6];
}

+ (__CFString)createStringRequiringInflectionWithFormat:(__CFString *)a3 formatOptions:(__CFDictionary *)a4 arguments:(char *)a5
{
  result = (__CFString *)[(__CFString *)a3 __baseAttributedString];
  if (result)
  {
    v8 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      a4 = 0;
    }
    id v9 = [[NSAttributedString alloc] _initWithFormat:v8 options:0 locale:a4 arguments:a5];
    id v10 = (__CFString *)objc_msgSend((id)objc_msgSend(v9, "string"), "copy");

    return v10;
  }
  return result;
}

- (__NSCFLocalizedAttributedString)initWithCoder:(id)a3
{
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalizedAttributedString;
  [(NSString *)&v3 encodeWithCoder:a3];
}

- (__NSCFLocalizedAttributedString)initWithAttributedStringMarkdown:(id)a3 formatConfiguration:(id)a4 bundle:(__CFBundle *)a5 tableURL:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)__NSCFLocalizedAttributedString;
  id v10 = [(NSString *)&v13 init];
  if (v10)
  {
    v11 = _NSStringCreateByParsingMarkdownAndOptionallyInflecting(a3, a5, a6, a4, 0);
    v10->_original = &v11->super;
    if (v11) {
      a3 = (id)objc_msgSend(-[NSAttributedString _inflectedAttributedString](v11, "_inflectedAttributedString"), "string");
    }
    else {
      v10->_original = [[NSAttributedString alloc] initWithString:a3];
    }
    v10->_apparentString = (NSString *)[a3 copy];
    v10->_formatConfiguration = (NSDictionary *)[a4 copy];
  }
  return v10;
}

- (id)_initWithAttributedString:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)__NSCFLocalizedAttributedString;
  uint64_t v4 = [(NSString *)&v7 init];
  if (v4)
  {
    v5 = (NSAttributedString *)[a3 copy];
    v4->_original = v5;
    v4->_apparentString = (NSString *)objc_msgSend((id)objc_msgSend(-[NSAttributedString _inflectedAttributedString](v5, "_inflectedAttributedString"), "string"), "copy");
    v4->_formatConfiguration = (NSDictionary *)[MEMORY[0x1E4F1CC08] copy];
  }
  return v4;
}

+ (id)stringEncapsulatingBaseAttributedString:(id)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) _initWithAttributedString:a3];

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalizedAttributedString;
  [(__NSCFLocalizedAttributedString *)&v3 dealloc];
}

- (id)formatConfiguration
{
  return self->_formatConfiguration;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(NSString *)self->_apparentString mutableCopyWithZone:a3];
}

- (id)__baseAttributedString
{
  return self->_original;
}

- (unint64_t)length
{
  return [(NSString *)self->_apparentString length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_apparentString characterAtIndex:a3];
}

- (unint64_t)fastestEncoding
{
  return [(NSString *)self->_apparentString fastestEncoding];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (id)substringFromIndex:(unint64_t)a3
{
  return [(NSString *)self->_apparentString substringFromIndex:a3];
}

- (id)substringToIndex:(unint64_t)a3
{
  return [(NSString *)self->_apparentString substringToIndex:a3];
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->_apparentString, "substringWithRange:", a3.location, a3.length);
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->_apparentString, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (BOOL)isEqualToString:(id)a3
{
  return [(NSString *)self->_apparentString isEqualToString:a3];
}

- (const)_fastCharacterContents
{
  return CFStringGetCharactersPtr((CFStringRef)self->_apparentString);
}

- (const)_fastCStringContents:(BOOL)a3
{
  return [(NSString *)self->_apparentString _fastCStringContents:a3];
}

@end