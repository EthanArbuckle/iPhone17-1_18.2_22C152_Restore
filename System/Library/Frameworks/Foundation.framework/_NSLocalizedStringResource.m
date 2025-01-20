@interface _NSLocalizedStringResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (NSString)defaultValue;
- (NSString)key;
- (NSString)table;
- (NSURL)bundleURL;
- (_NSLocalizedStringResource)initWithCoder:(id)a3;
- (_NSLocalizedStringResource)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7;
- (_NSLocalizedStringResource)initWithKey:(id)a3 table:(id)a4 locale:(id)a5 bundleURL:(id)a6;
- (_NSLocalizedStringResource)initWithResource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localize;
- (id)localizeWithOptions:(id)a3;
- (id)resource;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation _NSLocalizedStringResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding])
  {
    v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  resource = self->_resource;

  [a3 encodeObject:resource forKey:@"NSResource"];
}

- (_NSLocalizedStringResource)initWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding])
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSResource"];
  if ([a3 error]) {
    return 0;
  }
  if (!v6)
  {
    [a3 failWithError:+[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", @"%@: null value for key NSResource", _NSMethodExceptionProem((objc_class *)self, a2))];
    return 0;
  }

  return [(_NSLocalizedStringResource *)self initWithResource:v6];
}

- (NSURL)bundleURL
{
  v2 = (void *)[(NSURL *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource bundleURL] copy];

  return (NSURL *)v2;
}

- (NSString)key
{
  v2 = (void *)[(NSString *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource key] copy];

  return (NSString *)v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSLocalizedStringResource;
  [(_NSLocalizedStringResource *)&v3 dealloc];
}

- (_NSLocalizedStringResource)initWithResource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:@"%@: invalid argument", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSLocalizedStringResource;
  uint64_t v6 = [(_NSLocalizedStringResource *)&v9 init];
  if (v6) {
    v6->_resource = (_NSLocalizedStringResourceSwiftWrapper *)[a3 copy];
  }
  return v6;
}

- (void)setLocale:(id)a3
{
}

- (id)localizeWithOptions:(id)a3
{
  return [(_NSLocalizedStringResourceSwiftWrapper *)self->_resource localizeWithOptions:a3];
}

- (id)localize
{
  return [(_NSLocalizedStringResourceSwiftWrapper *)self->_resource localize];
}

- (NSString)defaultValue
{
  v2 = (void *)[(NSString *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource defaultValue] copy];

  return (NSString *)v2;
}

- (NSString)table
{
  v2 = (void *)[(NSString *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource table] copy];

  return (NSString *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [_NSLocalizedStringResource alloc];
  resource = self->_resource;

  return [(_NSLocalizedStringResource *)v4 initWithResource:resource];
}

- (_NSLocalizedStringResource)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a6 || !a7)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)_NSLocalizedStringResource;
  v12 = [(_NSLocalizedStringResource *)&v15 init];
  if (v12) {
    v12->_resource = [[_NSLocalizedStringResourceSwiftWrapper alloc] initWithKey:a3 defaultValue:a4 table:a5 locale:a6 bundleURL:a7];
  }
  return v12;
}

- (_NSLocalizedStringResource)initWithKey:(id)a3 table:(id)a4 locale:(id)a5 bundleURL:(id)a6
{
  return [(_NSLocalizedStringResource *)self initWithKey:a3 defaultValue:0 table:a4 locale:a5 bundleURL:a6];
}

- (NSLocale)locale
{
  v2 = (void *)[(NSLocale *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource locale] copy];

  return (NSLocale *)v2;
}

- (id)resource
{
  v2 = (void *)[(_NSLocalizedStringResourceSwiftWrapper *)self->_resource copy];

  return v2;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_NSStringLocalizationResource: %p>(%@)", self, [(_NSLocalizedStringResourceSwiftWrapper *)self->_resource description]];
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return [(_NSLocalizedStringResourceSwiftWrapper *)self->_resource hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  resource = self->_resource;
  uint64_t v6 = *((void *)a3 + 1);

  return [(_NSLocalizedStringResourceSwiftWrapper *)resource isEqual:v6];
}

@end