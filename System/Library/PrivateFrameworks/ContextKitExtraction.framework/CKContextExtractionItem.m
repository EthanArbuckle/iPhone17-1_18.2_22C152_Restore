@interface CKContextExtractionItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnScreen;
- (CKContextExtractionItem)initWithCoder:(id)a3;
- (CKContextExtractionItem)initWithTitle:(id)a3 type:(unint64_t)a4 bundleIdentifier:(id)a5;
- (NSString)bundleIdentifier;
- (NSString)extractionSourceClassName;
- (NSString)identifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)toJSONSerializableDictionary;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setExtractionSourceClassName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation CKContextExtractionItem

- (CKContextExtractionItem)initWithTitle:(id)a3 type:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKContextExtractionItem;
  v11 = [(CKContextExtractionItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_bundleIdentifier, a5);
  }

  return v12;
}

- (CKContextExtractionItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKContextExtractionItem;
  v5 = [(CKContextExtractionItem *)&v20 init];
  if (!v5) {
    goto LABEL_8;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    title = v5->_title;
    v5->_title = v6;
    v12 = v6;

    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v8;
    objc_super v14 = v8;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionSourceClassName"];
    extractionSourceClassName = v5->_extractionSourceClassName;
    v5->_extractionSourceClassName = (NSString *)v17;

    v5->_onScreen = [v4 decodeBoolForKey:@"onScreen"];
LABEL_8:
    id v10 = v5;
    goto LABEL_9;
  }

  id v10 = 0;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_extractionSourceClassName forKey:@"extractionSourceClassName"];
  [v5 encodeBool:self->_onScreen forKey:@"onScreen"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)[(NSString *)self->_title copy];
  [v4 setTitle:v5];

  [v4 setType:self->_type];
  v6 = (void *)[(NSString *)self->_bundleIdentifier copy];
  [v4 setBundleIdentifier:v6];

  v7 = (void *)[(NSString *)self->_identifier copy];
  [v4 setIdentifier:v7];

  v8 = (void *)[(NSString *)self->_extractionSourceClassName copy];
  [v4 setExtractionSourceClassName:v8];

  [v4 setOnScreen:self->_onScreen];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKContextExtractionItem *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(CKContextExtractionItem *)self hash];
      BOOL v6 = v5 == [(CKContextExtractionItem *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  NSUInteger v6 = [(NSString *)self->_bundleIdentifier hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_identifier hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_extractionSourceClassName hash];
  return self->_onScreen - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7) + 887503681;
}

- (id)description
{
  NSUInteger v3 = NSString;
  title = self->_title;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_type];
  NSUInteger v6 = (void *)v5;
  if (self->_onScreen) {
    NSUInteger v7 = @"YES";
  }
  else {
    NSUInteger v7 = @"NO";
  }
  NSUInteger v8 = [v3 stringWithFormat:@"Title: %@, Type: %@, Identifier: %@, BundleIdentifier: %@, ExtractionClass: %@, On Screen:%@\n", title, v5, self->_identifier, self->_bundleIdentifier, self->_extractionSourceClassName, v7];

  return v8;
}

- (id)toJSONSerializableDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_title forKeyedSubscript:@"title"];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  [v3 setObject:self->_bundleIdentifier forKeyedSubscript:@"bundleIdentifier"];
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_extractionSourceClassName forKeyedSubscript:@"extractionSourceClassName"];
  uint64_t v5 = [NSNumber numberWithBool:self->_onScreen];
  [v3 setObject:v5 forKeyedSubscript:@"onScreen"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)extractionSourceClassName
{
  return self->_extractionSourceClassName;
}

- (void)setExtractionSourceClassName:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionSourceClassName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end