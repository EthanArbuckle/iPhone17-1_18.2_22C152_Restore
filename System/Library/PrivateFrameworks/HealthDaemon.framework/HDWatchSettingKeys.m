@interface HDWatchSettingKeys
- (BOOL)isEqual:(id)a3;
- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 defaultsEnabledKey:(id)a4;
- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 featureSettingEnabledKey:(id)a4 defaultsEnabledKey:(id)a5 lastReconciledEnabledKey:(id)a6;
- (NSString)defaultsEnabledKey;
- (NSString)featureIdentifier;
- (NSString)featureSettingEnabledKey;
- (NSString)lastReconciledEnabledKey;
- (id)description;
- (unint64_t)hash;
@end

@implementation HDWatchSettingKeys

- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 defaultsEnabledKey:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F29DE0];
  v7 = NSString;
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 stringWithFormat:@"%@_lastReconciledValue", v8];
  v11 = [(HDWatchSettingKeys *)self initWithFeatureIdentifier:v9 featureSettingEnabledKey:v6 defaultsEnabledKey:v8 lastReconciledEnabledKey:v10];

  return v11;
}

- (HDWatchSettingKeys)initWithFeatureIdentifier:(id)a3 featureSettingEnabledKey:(id)a4 defaultsEnabledKey:(id)a5 lastReconciledEnabledKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDWatchSettingKeys;
  v14 = [(HDWatchSettingKeys *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    featureIdentifier = v14->_featureIdentifier;
    v14->_featureIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    featureSettingEnabledKey = v14->_featureSettingEnabledKey;
    v14->_featureSettingEnabledKey = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    defaultsEnabledKey = v14->_defaultsEnabledKey;
    v14->_defaultsEnabledKey = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    lastReconciledEnabledKey = v14->_lastReconciledEnabledKey;
    v14->_lastReconciledEnabledKey = (NSString *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDWatchSettingKeys *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      featureIdentifier = self->_featureIdentifier;
      v7 = v5->_featureIdentifier;
      if (featureIdentifier != v7 && (!v7 || !-[NSString isEqual:](featureIdentifier, "isEqual:"))) {
        goto LABEL_17;
      }
      featureSettingEnabledKey = self->_featureSettingEnabledKey;
      id v9 = v5->_featureSettingEnabledKey;
      if (featureSettingEnabledKey != v9
        && (!v9 || !-[NSString isEqual:](featureSettingEnabledKey, "isEqual:")))
      {
        goto LABEL_17;
      }
      defaultsEnabledKey = self->_defaultsEnabledKey;
      id v11 = v5->_defaultsEnabledKey;
      if (defaultsEnabledKey != v11 && (!v11 || !-[NSString isEqual:](defaultsEnabledKey, "isEqual:"))) {
        goto LABEL_17;
      }
      lastReconciledEnabledKey = self->_lastReconciledEnabledKey;
      id v13 = v5->_lastReconciledEnabledKey;
      if (lastReconciledEnabledKey == v13)
      {
        char v14 = 1;
        goto LABEL_18;
      }
      if (v13) {
        char v14 = -[NSString isEqual:](lastReconciledEnabledKey, "isEqual:");
      }
      else {
LABEL_17:
      }
        char v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
    char v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_featureSettingEnabledKey hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_defaultsEnabledKey hash];
  return v4 ^ v5 ^ [(NSString *)self->_lastReconciledEnabledKey hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %@:%@, %@:%@>", objc_opt_class(), self->_featureIdentifier, self->_featureSettingEnabledKey, self->_defaultsEnabledKey, self->_lastReconciledEnabledKey];
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)featureSettingEnabledKey
{
  return self->_featureSettingEnabledKey;
}

- (NSString)defaultsEnabledKey
{
  return self->_defaultsEnabledKey;
}

- (NSString)lastReconciledEnabledKey
{
  return self->_lastReconciledEnabledKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReconciledEnabledKey, 0);
  objc_storeStrong((id *)&self->_defaultsEnabledKey, 0);
  objc_storeStrong((id *)&self->_featureSettingEnabledKey, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end