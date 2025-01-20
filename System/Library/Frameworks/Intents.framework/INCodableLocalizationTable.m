@interface INCodableLocalizationTable
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INCodableLocalizationTable)initWithBundleIdentifier:(id)a3 tableName:(id)a4;
- (INCodableLocalizationTable)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)tableName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation INCodableLocalizationTable

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[INCodableLocalizationTable allocWithZone:a3];
  v5 = [(INCodableLocalizationTable *)self bundleIdentifier];
  v6 = [(INCodableLocalizationTable *)self tableName];
  v7 = [(INCodableLocalizationTable *)v4 initWithBundleIdentifier:v5 tableName:v6];

  return v7;
}

- (INCodableLocalizationTable)initWithBundleIdentifier:(id)a3 tableName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCodableLocalizationTable;
  v8 = [(INCodableLocalizationTable *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    tableName = v8->_tableName;
    v8->_tableName = (NSString *)v11;
  }
  return v8;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (INCodableLocalizationTable)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCodableLocalizationTable;
  v5 = [(INCodableLocalizationTable *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableName"];
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)setTableName:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_tableName forKey:@"tableName"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_bundleIdentifier, @"bundleIdentifier");
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_tableName, @"tableName");
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(INCodableLocalizationTable *)self tableName];
    uint64_t v6 = [v4 tableName];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [(INCodableLocalizationTable *)self bundleIdentifier];
      uint64_t v8 = [v4 bundleIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(INCodableLocalizationTable *)self tableName];
  uint64_t v4 = [v3 hash];
  id v5 = [(INCodableLocalizationTable *)self bundleIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(INCodableLocalizationTable);
  uint64_t v6 = objc_msgSend(v4, "intents_stringForKey:", @"tableName");
  tableName = v5->_tableName;
  v5->_tableName = (NSString *)v6;

  uint64_t v8 = objc_msgSend(v4, "intents_stringForKey:", @"bundleIdentifier");

  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  return v5;
}

@end