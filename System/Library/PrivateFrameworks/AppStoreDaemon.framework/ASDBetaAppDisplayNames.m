@interface ASDBetaAppDisplayNames
+ (BOOL)supportsSecureCoding;
+ (id)displayNameWithLocalizedNames:(id)a3 andPrimaryLocale:(id)a4;
- (ASDBetaAppDisplayNames)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)localizedNames;
- (NSString)primaryLocale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedNames:(id)a3;
- (void)setPrimaryLocale:(id)a3;
@end

@implementation ASDBetaAppDisplayNames

+ (id)displayNameWithLocalizedNames:(id)a3 andPrimaryLocale:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setLocalizedNames:v6];

  [v7 setPrimaryLocale:v5];
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Primary Locale: %@\nLocalized Names: %@", self->_primaryLocale, self->_localizedNames];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDBetaAppDisplayNames *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (localizedNames = self->_localizedNames,
          [(ASDBetaAppDisplayNames *)v4 localizedNames],
          v7 = objc_claimAutoreleasedReturnValue(),
          LODWORD(localizedNames) = [(NSDictionary *)localizedNames isEqual:v7],
          v7,
          localizedNames))
    {
      primaryLocale = self->_primaryLocale;
      v9 = [(ASDBetaAppDisplayNames *)v4 primaryLocale];
      char v10 = [(NSString *)primaryLocale isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ASDBetaAppDisplayNames allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_localizedNames, self->_localizedNames);
  objc_storeStrong((id *)&v4->_primaryLocale, self->_primaryLocale);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localizedNames = self->_localizedNames;
  id v5 = a3;
  [v5 encodeObject:localizedNames forKey:@"A"];
  [v5 encodeObject:self->_primaryLocale forKey:@"B"];
}

- (ASDBetaAppDisplayNames)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDBetaAppDisplayNames;
  id v5 = [(ASDBetaAppDisplayNames *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"A"];
    localizedNames = v5->_localizedNames;
    v5->_localizedNames = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"B"];
    primaryLocale = v5->_primaryLocale;
    v5->_primaryLocale = (NSString *)v11;
  }
  return v5;
}

- (NSDictionary)localizedNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalizedNames:(id)a3
{
}

- (NSString)primaryLocale
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLocale, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
}

@end