@interface HDWatchSettingValues
- (BOOL)isEqual:(id)a3;
- (HDWatchSettingValues)initWithFeatureSettingEnabledValue:(id)a3 defaultsEnabledValue:(id)a4 lastReconciledEnabledValue:(id)a5;
- (NSNumber)defaultsEnabledValue;
- (NSNumber)featureSettingEnabledValue;
- (NSNumber)lastReconciledEnabledValue;
- (id)description;
- (id)reconciledEnabledValue;
- (unint64_t)hash;
@end

@implementation HDWatchSettingValues

- (HDWatchSettingValues)initWithFeatureSettingEnabledValue:(id)a3 defaultsEnabledValue:(id)a4 lastReconciledEnabledValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDWatchSettingValues;
  v11 = [(HDWatchSettingValues *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    featureSettingEnabledValue = v11->_featureSettingEnabledValue;
    v11->_featureSettingEnabledValue = (NSNumber *)v12;

    uint64_t v14 = [v9 copy];
    defaultsEnabledValue = v11->_defaultsEnabledValue;
    v11->_defaultsEnabledValue = (NSNumber *)v14;

    uint64_t v16 = [v10 copy];
    lastReconciledEnabledValue = v11->_lastReconciledEnabledValue;
    v11->_lastReconciledEnabledValue = (NSNumber *)v16;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDWatchSettingValues *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      featureSettingEnabledValue = self->_featureSettingEnabledValue;
      v7 = v5->_featureSettingEnabledValue;
      if (featureSettingEnabledValue != v7
        && (!v7 || !-[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:")))
      {
        goto LABEL_14;
      }
      defaultsEnabledValue = self->_defaultsEnabledValue;
      id v9 = v5->_defaultsEnabledValue;
      if (defaultsEnabledValue != v9 && (!v9 || !-[NSNumber isEqual:](defaultsEnabledValue, "isEqual:"))) {
        goto LABEL_14;
      }
      lastReconciledEnabledValue = self->_lastReconciledEnabledValue;
      v11 = v5->_lastReconciledEnabledValue;
      if (lastReconciledEnabledValue == v11)
      {
        char v12 = 1;
        goto LABEL_15;
      }
      if (v11) {
        char v12 = -[NSNumber isEqual:](lastReconciledEnabledValue, "isEqual:");
      }
      else {
LABEL_14:
      }
        char v12 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_featureSettingEnabledValue hash];
  uint64_t v4 = [(NSNumber *)self->_defaultsEnabledValue hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_lastReconciledEnabledValue hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ db:%@, df:%@, lr:%@>", objc_opt_class(), self->_featureSettingEnabledValue, self->_defaultsEnabledValue, self->_lastReconciledEnabledValue];
}

- (id)reconciledEnabledValue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  featureSettingEnabledValue = self->_featureSettingEnabledValue;
  defaultsEnabledValue = self->_defaultsEnabledValue;
  if (featureSettingEnabledValue)
  {
    if (!defaultsEnabledValue) {
      goto LABEL_10;
    }
    if (-[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:"))
    {
      v5 = self->_defaultsEnabledValue;
LABEL_5:
      v6 = v5;
      goto LABEL_16;
    }
    featureSettingEnabledValue = self->_featureSettingEnabledValue;
    if (!self->_lastReconciledEnabledValue
      || (int v7 = -[NSNumber isEqual:](featureSettingEnabledValue, "isEqual:"),
          featureSettingEnabledValue = self->_defaultsEnabledValue,
          v7))
    {
LABEL_10:
      v6 = featureSettingEnabledValue;
      goto LABEL_16;
    }
    if ([(NSNumber *)featureSettingEnabledValue isEqual:self->_lastReconciledEnabledValue])
    {
      v5 = self->_featureSettingEnabledValue;
      goto LABEL_5;
    }
    _HKInitializeLogging();
    id v8 = (void *)*MEMORY[0x1E4F29F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F60], OS_LOG_TYPE_FAULT))
    {
      id v10 = v8;
      int v12 = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      v15 = self;
      id v11 = v13;
      _os_log_fault_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_FAULT, "[%{public}@] Unexpected settings evaluation: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (defaultsEnabledValue)
  {
    v6 = defaultsEnabledValue;
    goto LABEL_16;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (NSNumber)featureSettingEnabledValue
{
  return self->_featureSettingEnabledValue;
}

- (NSNumber)defaultsEnabledValue
{
  return self->_defaultsEnabledValue;
}

- (NSNumber)lastReconciledEnabledValue
{
  return self->_lastReconciledEnabledValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReconciledEnabledValue, 0);
  objc_storeStrong((id *)&self->_defaultsEnabledValue, 0);

  objc_storeStrong((id *)&self->_featureSettingEnabledValue, 0);
}

@end