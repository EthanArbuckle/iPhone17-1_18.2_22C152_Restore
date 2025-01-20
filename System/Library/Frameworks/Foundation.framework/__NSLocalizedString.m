@interface __NSLocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsDirectEncoding;
- (BOOL)isEqualToString:(id)a3;
- (Class)classForCoder;
- (__NSLocalizedString)initWithCoder:(id)a3;
- (__NSLocalizedString)initWithString:(id)a3 withFormatConfiguration:(id)a4;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (id)baseString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatConfiguration;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)substringFromIndex:(unint64_t)a3;
- (id)substringToIndex:(unint64_t)a3;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (unint64_t)fastestEncoding;
- (unint64_t)length;
- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setString:(id)a3;
@end

@implementation __NSLocalizedString

- (unint64_t)fastestEncoding
{
  return [(NSString *)self->original fastestEncoding];
}

- (const)_fastCStringContents:(BOOL)a3
{
  return [(NSString *)self->original _fastCStringContents:a3];
}

- (__NSLocalizedString)initWithString:(id)a3 withFormatConfiguration:(id)a4
{
  self->original = (NSMutableString *)[a3 mutableCopyWithZone:0];
  self->config = (NSDictionary *)[a4 copyWithZone:0];
  return self;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (id)formatConfiguration
{
  return self->config;
}

- (const)_fastCharacterContents
{
  return CFStringGetCharactersPtr((CFStringRef)self->original);
}

- (unint64_t)length
{
  return [(NSString *)self->original length];
}

- (BOOL)isEqualToString:(id)a3
{
  return [(NSString *)self->original isEqualToString:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [__NSLocalizedString alloc];
  original = self->original;
  config = self->config;

  return [(__NSLocalizedString *)v4 initWithString:original withFormatConfiguration:config];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)__NSLocalizedString;
  [(__NSLocalizedString *)&v3 dealloc];
}

- (id)substringWithRange:(_NSRange)a3
{
  return -[NSString substringWithRange:](self->original, "substringWithRange:", a3.location, a3.length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->original characterAtIndex:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [__NSLocalizedString alloc];
  original = self->original;
  config = self->config;

  return [(__NSLocalizedString *)v4 initWithString:original withFormatConfiguration:config];
}

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  config = self->config;
  self->config = 0;

  original = self->original;

  return -[NSMutableString replaceOccurrencesOfString:withString:options:range:](original, "replaceOccurrencesOfString:withString:options:range:", a3, a4, a5, location, length);
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (__NSLocalizedString)initWithCoder:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"__NSLocalizedString cannot be decoded by non-keyed archivers!" userInfo:0]);
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.originalString"];
  if (!v5)
  {
    if ([a3 containsValueForKey:@"NS.originalString"]) {
      uint64_t v17 = 4864;
    }
    else {
      uint64_t v17 = 4865;
    }

    v20 = @"NSDebugDescription";
    v21[0] = @"Unable to decode NS.originalString.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v15 = v17;
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), @"NS.configDict");
  if (!v13 && [a3 containsValueForKey:@"NS.configDict"])
  {

    v18 = @"NSDebugDescription";
    v19 = @"Unable to decode NS.configDict as a plist type despite data being present.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v15 = 4864;
LABEL_13:
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", v15, v14));
    return 0;
  }

  return [(__NSLocalizedString *)self initWithString:v6 withFormatConfiguration:v13];
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Encoder does not allow keyed coding!" userInfo:0]);
  }
  [a3 encodeObject:self->original forKey:@"NS.originalString"];
  if (self->config)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (id)baseString
{
  return self->original;
}

- (id)substringFromIndex:(unint64_t)a3
{
  return [(NSString *)self->original substringFromIndex:a3];
}

- (id)substringToIndex:(unint64_t)a3
{
  return [(NSString *)self->original substringToIndex:a3];
}

- (int64_t)compare:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  return -[NSString compare:options:range:locale:](self->original, "compare:options:range:locale:", a3, a4, a5.location, a5.length, a6);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  config = self->config;
  self->config = 0;

  original = self->original;

  -[NSMutableString replaceCharactersInRange:withString:](original, "replaceCharactersInRange:withString:", location, length, a4);
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  config = self->config;
  self->config = 0;

  original = self->original;

  [(NSMutableString *)original insertString:a3 atIndex:a4];
}

- (void)appendString:(id)a3
{
  config = self->config;
  self->config = 0;

  original = self->original;

  [(NSMutableString *)original appendString:a3];
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  config = self->config;
  self->config = 0;

  original = self->original;

  -[NSMutableString deleteCharactersInRange:](original, "deleteCharactersInRange:", location, length);
}

- (void)appendFormat:(id)a3
{
  config = self->config;
  self->config = 0;

  _CFStringAppendFormatAndArgumentsAux2();
}

- (void)setString:(id)a3
{
  config = self->config;
  self->config = 0;

  original = self->original;

  [(NSMutableString *)original setString:a3];
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  config = self->config;
  self->config = 0;

  original = self->original;
  uint64_t v9 = [(NSString *)original length];

  -[NSMutableString replaceCharactersInRange:withCharacters:length:](original, "replaceCharactersInRange:withCharacters:length:", v9, 0, a3, a4);
}

@end