@interface GCFLocalizedString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_allowsDirectEncoding;
- (GCFLocalizedString)init;
- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6;
- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6;
- (GCFLocalizedString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (GCFLocalizedString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5;
- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5;
- (GCFLocalizedString)initWithCoder:(id)a3;
- (GCFLocalizedString)initWithFormat:(id)a3 arg:(id)a4;
- (GCFLocalizedString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5;
- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4;
- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6;
- (GCFLocalizedString)initWithString:(id)a3;
- (GCFLocalizedString)initWithUTF8String:(const char *)a3;
- (GCFLocalizedString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7;
- (NSBundle)bundle;
- (NSString)key;
- (NSString)table;
- (id)_realizedString;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation GCFLocalizedString

- (id)_realizedString
{
  return 0;
}

- (unint64_t)length
{
  id v2 = [(GCFLocalizedString *)self _realizedString];

  return [v2 length];
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(GCFLocalizedString *)self _realizedString];

  objc_msgSend(v7, "getCharacters:range:", a3, location, length);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4 = [(GCFLocalizedString *)self _realizedString];

  return [v4 characterAtIndex:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (GCFLocalizedString)initWithCoder:(id)a3
{
  id v4 = [_GCFLocalizedString alloc];

  return (GCFLocalizedString *)[(_GCFLocalizedString *)v4 initWithCoder:a3];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    self;
    return &sharedPlaceholderString_PlaceholderString;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___GCFLocalizedString;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4 table:(id)a5 locale:(id)a6
{
  v10 = [_GCFLocalizedString alloc];

  return (GCFLocalizedString *)[(_GCFLocalizedString *)v10 initWithKey:a3 sourceBundle:a4 table:a5 locale:a6];
}

- (GCFLocalizedString)initWithKey:(id)a3 sourceBundle:(id)a4
{
  return [(GCFLocalizedString *)self initWithKey:a3 sourceBundle:a4 table:0 locale:0];
}

- (GCFLocalizedString)initWithFormat:(id)a3 arg:(id)a4
{
  v6 = [_GCFFormattedLocalizedString alloc];

  return (GCFLocalizedString *)[(_GCFFormattedLocalizedString *)v6 initWithFormat:a3 arg:a4];
}

- (GCFLocalizedString)init
{
  id v2 = [_GCFLocalizedString alloc];

  return (GCFLocalizedString *)[(_GCFLocalizedString *)v2 initWithKey:&stru_26BED82A0 sourceBundle:0 table:0 locale:0];
}

- (GCFLocalizedString)initWithString:(id)a3
{
  id v4 = [_GCFLocalizedString alloc];

  return (GCFLocalizedString *)[(_GCFLocalizedString *)v4 initWithKey:a3 sourceBundle:0 table:0 locale:0];
}

- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;

  v8 = [[NSString_0 alloc] initWithCharactersNoCopy:a3 length:a4 freeWhenDone:v5];
  v9 = [[_GCFLocalizedString alloc] initWithKey:v8 sourceBundle:0 table:0 locale:0];

  return &v9->super;
}

- (GCFLocalizedString)initWithCharactersNoCopy:(unsigned __int16 *)a3 length:(unint64_t)a4 deallocator:(id)a5
{
  v8 = [[NSString_0 alloc] initWithCharactersNoCopy:a3 length:a4 deallocator:a5];
  v9 = [[_GCFLocalizedString alloc] initWithKey:v8 sourceBundle:0 table:0 locale:0];

  return &v9->super;
}

- (GCFLocalizedString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  v6 = [[NSString_0 alloc] initWithCharacters:a3 length:a4];
  objc_super v7 = [[_GCFLocalizedString alloc] initWithKey:v6 sourceBundle:0 table:0 locale:0];

  return &v7->super;
}

- (GCFLocalizedString)initWithUTF8String:(const char *)a3
{
  id v4 = [[NSString_0 alloc] initWithUTF8String:a3];
  BOOL v5 = [[_GCFLocalizedString alloc] initWithKey:v4 sourceBundle:0 table:0 locale:0];

  return &v5->super;
}

- (GCFLocalizedString)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  v8 = [[NSString_0 alloc] initWithFormat:a3 locale:a4 arguments:a5];
  v9 = [[_GCFLocalizedString alloc] initWithKey:v8 sourceBundle:0 table:0 locale:a4];

  return &v9->super;
}

- (GCFLocalizedString)initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 arguments:(char *)a6 error:(id *)a7
{
  v12 = [[NSString_0 alloc] initWithValidatedFormat:a3 validFormatSpecifiers:a4 locale:a5 arguments:a6 error:a7];
  v13 = [[_GCFLocalizedString alloc] initWithKey:v12 sourceBundle:0 table:0 locale:a5];

  return &v13->super;
}

- (GCFLocalizedString)initWithCStringNoCopy:(char *)a3 length:(unint64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;

  v8 = [[NSString_0 alloc] initWithCStringNoCopy:a3 length:a4 freeWhenDone:v5];
  v9 = [[_GCFLocalizedString alloc] initWithKey:v8 sourceBundle:0 table:0 locale:0];

  return &v9->super;
}

- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 freeWhenDone:(BOOL)a6
{
  BOOL v6 = a6;

  v10 = [[NSString_0 alloc] initWithBytesNoCopy:a3 length:a4 encoding:a5 freeWhenDone:v6];
  v11 = [[_GCFLocalizedString alloc] initWithKey:v10 sourceBundle:0 table:0 locale:0];

  return &v11->super;
}

- (GCFLocalizedString)initWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5 deallocator:(id)a6
{
  v10 = [[NSString_0 alloc] initWithBytesNoCopy:a3 length:a4 encoding:a5 deallocator:a6];
  v11 = [[_GCFLocalizedString alloc] initWithKey:v10 sourceBundle:0 table:0 locale:0];

  return &v11->super;
}

- (NSString)key
{
  return 0;
}

- (NSBundle)bundle
{
  return 0;
}

- (NSString)table
{
  return 0;
}

@end