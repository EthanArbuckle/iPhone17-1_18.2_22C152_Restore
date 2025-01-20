@interface _LTLanguageAssetModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)identifierForDownloads;
- (NSString)ltIdentifier;
- (_LTAssetProgress)progress;
- (_LTLanguageAssetModel)initWithCoder:(id)a3;
- (_LTLanguageAssetModel)initWithInstallationStatus:(id)a3;
- (_LTLanguageAssetModel)initWithLocale:(id)a3;
- (_LTLanguageAssetModel)initWithLocale:(id)a3 progress:(id)a4;
- (_LTLanguageAssetModel)initWithLocale:(id)a3 state:(int64_t)a4;
- (_LTLanguageInstallationStatus)installationStatus;
- (int64_t)compare:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTLanguageAssetModel

- (NSLocale)locale
{
  locale = self->_locale;
  if (!locale)
  {
    objc_msgSend(MEMORY[0x263EFF960], "lt_localeWithLTIdentifier:", self->_ltIdentifier);
    v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    v5 = self->_locale;
    self->_locale = v4;

    locale = self->_locale;
  }

  return locale;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    v4 = [MEMORY[0x263EFF960] currentLocale];
    v5 = [(_LTLanguageAssetModel *)self locale];
    v6 = [v5 languageCode];

    v7 = [v4 localizedStringForLanguageCode:v6];
    v8 = [v7 capitalizedStringWithLocale:v4];
    v9 = self->_displayName;
    self->_displayName = v8;

    displayName = self->_displayName;
  }

  return displayName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3 progress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageAssetModel;
  v8 = [(_LTLanguageAssetModel *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 _ltLocaleIdentifier];
    ltIdentifier = v8->_ltIdentifier;
    v8->_ltIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_progress, a4);
    v11 = v8;
  }

  return v8;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3 state:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 _ltLocaleIdentifier];
  v8 = +[_LTAssetProgress discreteProgressWithIdentifier:v7 offlineState:a4];

  uint64_t v9 = [(_LTLanguageAssetModel *)self initWithLocale:v6 progress:v8];
  return v9;
}

- (_LTLanguageAssetModel)initWithLocale:(id)a3
{
  return [(_LTLanguageAssetModel *)self initWithLocale:a3 state:0];
}

- (_LTLanguageAssetModel)initWithInstallationStatus:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  id v6 = [v5 localeIdentifier];
  id v7 = [v4 localeWithLocaleIdentifier:v6];

  uint64_t v8 = [v5 offlineState];
  uint64_t v9 = [(_LTLanguageAssetModel *)self initWithLocale:v7 state:v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  ltIdentifier = self->_ltIdentifier;
  id v5 = a3;
  [v5 encodeObject:ltIdentifier forKey:@"ltIdentifier"];
  [v5 encodeObject:self->_progress forKey:@"progress"];
}

- (_LTLanguageAssetModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageAssetModel;
  id v5 = [(_LTLanguageAssetModel *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ltIdentifier"];
    ltIdentifier = v5->_ltIdentifier;
    v5->_ltIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (_LTAssetProgress *)v8;

    v10 = v5;
  }

  return v5;
}

- (NSString)identifierForDownloads
{
  v3 = NSString;
  id v4 = [(_LTLanguageAssetModel *)self ltIdentifier];
  id v5 = [(_LTLanguageAssetModel *)self progress];
  uint64_t v6 = _LTOfflineStateString([v5 offlineState]);
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return (NSString *)v7;
}

- (int64_t)state
{
  v2 = [(_LTLanguageAssetModel *)self progress];
  int64_t v3 = [v2 offlineState];

  return v3;
}

- (_LTLanguageInstallationStatus)installationStatus
{
  int64_t v3 = [_LTLanguageInstallationStatus alloc];
  id v4 = [(_LTLanguageAssetModel *)self locale];
  id v5 = [v4 _ltLocaleIdentifier];
  uint64_t v6 = [(_LTLanguageAssetModel *)self progress];
  id v7 = [(_LTLanguageInstallationStatus *)v3 initWithLocaleIdentifier:v5 progress:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = [(_LTLanguageAssetModel *)self ltIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(_LTLanguageAssetModel *)self ltIdentifier];
    id v7 = [v5 ltIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(_LTLanguageAssetModel *)self displayName];
  uint64_t v6 = [v4 displayName];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  id v4 = [(_LTLanguageAssetModel *)self ltIdentifier];
  id v5 = _LTOfflineStateString([(_LTLanguageAssetModel *)self state]);
  uint64_t v6 = [(_LTLanguageAssetModel *)self progress];
  int64_t v7 = [v3 stringWithFormat:@"%@: %@ %@", v4, v5, v6];

  return (NSString *)v7;
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (NSString)ltIdentifier
{
  return self->_ltIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltIdentifier, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end