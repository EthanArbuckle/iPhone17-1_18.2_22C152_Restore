@interface LNStaticDeferredLocalizedStringWithAlternatives
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (LNStaticDeferredLocalizedStringWithAlternatives)initWithCoder:(id)a3;
- (LNStaticDeferredLocalizedStringWithAlternatives)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6 alternatives:(id)a7;
- (LNStaticDeferredLocalizedStringWithAlternatives)initWithLocalizedStringResource:(id)a3 alternatives:(id)a4;
- (NSDictionary)alternatives;
- (id)bundleURL;
- (id)defaultValue;
- (id)description;
- (id)key;
- (id)localizedStringForLocaleIdentifier:(id)a3 kind:(id)a4;
- (id)table;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNStaticDeferredLocalizedStringWithAlternatives

- (void).cxx_destruct
{
}

- (NSDictionary)alternatives
{
  return self->_alternatives;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNStaticDeferredLocalizedStringWithAlternatives *)self alternatives];
  [v4 encodeObject:v5 forKey:@"alternatives"];
}

- (LNStaticDeferredLocalizedStringWithAlternatives)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"table"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultValue"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleURL"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternatives"];
    self = [(LNStaticDeferredLocalizedStringWithAlternatives *)self initWithKey:v5 defaultValue:v7 table:v6 bundleURL:v8 alternatives:v9];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(LNStaticDeferredLocalizedStringWithAlternatives *)self alternatives];
  v7 = [v3 stringWithFormat:@"<%@: %p, strings: %@>", v5, self, v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(LNStaticDeferredLocalizedStringWithAlternatives *)self alternatives];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNStaticDeferredLocalizedStringWithAlternatives *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNStaticDeferredLocalizedStringWithAlternatives *)self alternatives];
      v8 = [(LNStaticDeferredLocalizedStringWithAlternatives *)v6 alternatives];
      char v9 = [v7 isEqualToDictionary:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)bundleURL
{
  v4.receiver = self;
  v4.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  v2 = [(LNStaticDeferredLocalizedString *)&v4 bundleURL];
  return v2;
}

- (id)table
{
  v4.receiver = self;
  v4.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  v2 = [(LNStaticDeferredLocalizedString *)&v4 table];
  return v2;
}

- (id)defaultValue
{
  v4.receiver = self;
  v4.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  v2 = [(LNStaticDeferredLocalizedString *)&v4 defaultValue];
  return v2;
}

- (id)key
{
  v4.receiver = self;
  v4.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  v2 = [(LNStaticDeferredLocalizedString *)&v4 key];
  return v2;
}

- (id)localizedStringForLocaleIdentifier:(id)a3 kind:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    v8 = [(LNStaticDeferredLocalizedStringWithAlternatives *)self alternatives];
    char v9 = [v8 objectForKey:v6];
    v10 = [v9 localizedStringForLocaleIdentifier:v7];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
    id v11 = a3;
    v10 = [(LNStaticDeferredLocalizedString *)&v13 localizedStringForLocaleIdentifier:v11 kind:0];
  }
  return v10;
}

- (LNStaticDeferredLocalizedStringWithAlternatives)initWithLocalizedStringResource:(id)a3 alternatives:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  id v7 = [(LNStaticDeferredLocalizedString *)&v11 initWithLocalizedStringResource:a3 alternatives:v6];
  if (v6 && [v6 count])
  {
    uint64_t v8 = [v6 copy];
    alternatives = v7->_alternatives;
    v7->_alternatives = (NSDictionary *)v8;
  }
  return v7;
}

- (LNStaticDeferredLocalizedStringWithAlternatives)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 bundleURL:(id)a6 alternatives:(id)a7
{
  id v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)LNStaticDeferredLocalizedStringWithAlternatives;
  objc_super v13 = [(LNStaticDeferredLocalizedString *)&v17 initWithKey:a3 defaultValue:a4 table:a5 bundleURL:a6 alternatives:v12];
  if (v12)
  {
    [v12 count];
    uint64_t v14 = [v12 copy];
    alternatives = v13->_alternatives;
    v13->_alternatives = (NSDictionary *)v14;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end