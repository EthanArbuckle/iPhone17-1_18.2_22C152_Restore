@interface NSLocalizableString
+ (BOOL)supportsSecureCoding;
+ (id)localizableStringWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4;
- (Class)classForCoder;
- (NSLocalizableString)initWithCoder:(id)a3;
- (NSLocalizableString)initWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4;
- (NSString)developmentLanguageString;
- (NSString)stringsFileKey;
- (id)awakeAfterUsingCoder:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDevelopmentLanguageString:(id)a3;
- (void)setStringsFileKey:(id)a3;
@end

@implementation NSLocalizableString

- (NSLocalizableString)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSLocalizableString;
  v4 = [(NSString *)&v6 init];
  if (v4)
  {
    v4->_stringsFileKey = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSKey"), "copy");
    v4->_developmentLanguageString = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSDev"), "copy");
  }
  return v4;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)+[NSBundle currentNibPath](NSBundle, "currentNibPath", a3), "lastPathComponent"), "stringByDeletingPathExtension");
  uint64_t v5 = +[NSBundle currentNibLoadingBundle];
  if (v4)
  {
    objc_super v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x185308110]();
    [v6 localizedStringsForTable:v4 localization:0];
    developmentLanguageString = (NSString *)[v6 localizedStringForKey:self->_stringsFileKey value:self->_developmentLanguageString table:v4];
  }
  else
  {
    developmentLanguageString = self->_developmentLanguageString;
  }
  v9 = developmentLanguageString;

  return developmentLanguageString;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSLocalizableString;
  [(NSLocalizableString *)&v3 dealloc];
}

- (unint64_t)length
{
  return [(NSString *)self->_developmentLanguageString length];
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return [(NSString *)self->_developmentLanguageString characterAtIndex:a3];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSLocalizableString;
  -[NSString encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_stringsFileKey forKey:@"NSKey"];
  [a3 encodeObject:self->_developmentLanguageString forKey:@"NSDev"];
}

- (NSLocalizableString)initWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSLocalizableString;
  uint64_t v6 = [(NSString *)&v8 init];
  if (v6)
  {
    v6->_stringsFileKey = (NSString *)[a3 copy];
    v6->_developmentLanguageString = (NSString *)[a4 copy];
  }
  return v6;
}

+ (id)localizableStringWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithStringsFileKey:a3 developmentLanguageString:a4];

  return v4;
}

- (NSString)stringsFileKey
{
  return self->_stringsFileKey;
}

- (void)setStringsFileKey:(id)a3
{
  stringsFileKey = self->_stringsFileKey;
  if (stringsFileKey != a3)
  {

    self->_stringsFileKey = (NSString *)[a3 copy];
  }
}

- (NSString)developmentLanguageString
{
  return self->_developmentLanguageString;
}

- (void)setDevelopmentLanguageString:(id)a3
{
  developmentLanguageString = self->_developmentLanguageString;
  if (developmentLanguageString != a3)
  {

    self->_developmentLanguageString = (NSString *)[a3 copy];
  }
}

@end