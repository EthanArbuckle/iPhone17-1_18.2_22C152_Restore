@interface _LTLanguageInstallationStatus
+ (BOOL)supportsSecureCoding;
- (NSString)localeIdentifier;
- (_LTAssetProgress)progress;
- (_LTLanguageInstallationStatus)initWithCoder:(id)a3;
- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 offlineState:(int64_t)a4;
- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 progress:(id)a4;
- (id)description;
- (int64_t)offlineState;
- (void)encodeWithCoder:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation _LTLanguageInstallationStatus

- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 progress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageInstallationStatus;
  v9 = [(_LTLanguageInstallationStatus *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localeIdentifier, a3);
    objc_storeStrong((id *)&v10->_progress, a4);
    v11 = v10;
  }

  return v10;
}

- (_LTLanguageInstallationStatus)initWithLocaleIdentifier:(id)a3 offlineState:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[_LTAssetProgress discreteProgressWithIdentifier:v6 offlineState:a4];
  id v8 = [(_LTLanguageInstallationStatus *)self initWithLocaleIdentifier:v6 progress:v7];

  return v8;
}

- (id)description
{
  if ([(_LTLanguageInstallationStatus *)self offlineState] == 1)
  {
    v3 = [NSString stringWithFormat:@"%@", self->_progress];
  }
  else
  {
    v3 = &stru_26FAADE68;
  }
  v4 = NSString;
  localeIdentifier = self->_localeIdentifier;
  id v6 = _LTOfflineStateString([(_LTLanguageInstallationStatus *)self offlineState]);
  id v7 = [v4 stringWithFormat:@"%@ %@ %@", localeIdentifier, v6, v3];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  localeIdentifier = self->_localeIdentifier;
  id v5 = a3;
  [v5 encodeObject:localeIdentifier forKey:@"localeIdentifier"];
  [v5 encodeObject:self->_progress forKey:@"progress"];
}

- (_LTLanguageInstallationStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTLanguageInstallationStatus;
  id v5 = [(_LTLanguageInstallationStatus *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progress"];
    progress = v5->_progress;
    v5->_progress = (_LTAssetProgress *)v8;

    v10 = v5;
  }

  return v5;
}

- (int64_t)offlineState
{
  v2 = [(_LTLanguageInstallationStatus *)self progress];
  int64_t v3 = [v2 offlineState];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (_LTAssetProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end