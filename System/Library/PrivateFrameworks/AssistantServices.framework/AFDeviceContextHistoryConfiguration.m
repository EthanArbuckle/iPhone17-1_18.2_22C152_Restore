@interface AFDeviceContextHistoryConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFDeviceContextHistoryConfiguration)init;
- (AFDeviceContextHistoryConfiguration)initWithBuilder:(id)a3;
- (AFDeviceContextHistoryConfiguration)initWithCoder:(id)a3;
- (AFDeviceContextHistoryConfiguration)initWithDictionaryRepresentation:(id)a3;
- (AFDeviceContextHistoryConfiguration)initWithKeepsHistory:(BOOL)a3 historyBufferSize:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)keepsHistory;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)historyBufferSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeviceContextHistoryConfiguration

- (unint64_t)historyBufferSize
{
  return self->_historyBufferSize;
}

- (BOOL)keepsHistory
{
  return self->_keepsHistory;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_keepsHistory];
  [v3 setObject:v4 forKey:@"keepsHistory"];

  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_historyBufferSize];
  [v3 setObject:v5 forKey:@"historyBufferSize"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (AFDeviceContextHistoryConfiguration)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"keepsHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    uint64_t v8 = [v6 BOOLValue];
    v9 = [v4 objectForKey:@"historyBufferSize"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    uint64_t v11 = [v10 unsignedIntegerValue];
    self = [(AFDeviceContextHistoryConfiguration *)self initWithKeepsHistory:v8 historyBufferSize:v11];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL keepsHistory = self->_keepsHistory;
  id v6 = a3;
  v7 = [v4 numberWithBool:keepsHistory];
  [v6 encodeObject:v7 forKey:@"AFDeviceContextHistoryConfiguration::keepsHistory"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_historyBufferSize];
  [v6 encodeObject:v8 forKey:@"AFDeviceContextHistoryConfiguration::historyBufferSize"];
}

- (AFDeviceContextHistoryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeviceContextHistoryConfiguration::keepsHistory"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFDeviceContextHistoryConfiguration::historyBufferSize"];

  uint64_t v8 = [v7 unsignedIntegerValue];
  return [(AFDeviceContextHistoryConfiguration *)self initWithKeepsHistory:v6 historyBufferSize:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDeviceContextHistoryConfiguration *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL keepsHistory = self->_keepsHistory;
      if (keepsHistory == [(AFDeviceContextHistoryConfiguration *)v5 keepsHistory])
      {
        unint64_t historyBufferSize = self->_historyBufferSize;
        BOOL v8 = historyBufferSize == [(AFDeviceContextHistoryConfiguration *)v5 historyBufferSize];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_keepsHistory];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_historyBufferSize];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceContextHistoryConfiguration;
  uint64_t v5 = [(AFDeviceContextHistoryConfiguration *)&v10 description];
  unint64_t v6 = (void *)v5;
  v7 = @"YES";
  if (!self->_keepsHistory) {
    v7 = @"NO";
  }
  BOOL v8 = (void *)[v4 initWithFormat:@"%@ {keepsHistory = %@, historyBufferSize = %llu}", v5, v7, self->_historyBufferSize];

  return v8;
}

- (NSString)description
{
  return (NSString *)[(AFDeviceContextHistoryConfiguration *)self _descriptionWithIndent:0];
}

- (AFDeviceContextHistoryConfiguration)initWithKeepsHistory:(BOOL)a3 historyBufferSize:(unint64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__AFDeviceContextHistoryConfiguration_initWithKeepsHistory_historyBufferSize___block_invoke;
  v5[3] = &__block_descriptor_41_e55_v16__0___AFDeviceContextHistoryConfigurationMutating__8l;
  BOOL v6 = a3;
  v5[4] = a4;
  return [(AFDeviceContextHistoryConfiguration *)self initWithBuilder:v5];
}

void __78__AFDeviceContextHistoryConfiguration_initWithKeepsHistory_historyBufferSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setKeepsHistory:v3];
  [v4 setHistoryBufferSize:*(void *)(a1 + 32)];
}

- (AFDeviceContextHistoryConfiguration)init
{
  return [(AFDeviceContextHistoryConfiguration *)self initWithBuilder:0];
}

- (AFDeviceContextHistoryConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFDeviceContextHistoryConfigurationMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFDeviceContextHistoryConfiguration;
  uint64_t v5 = [(AFDeviceContextHistoryConfiguration *)&v9 init];
  BOOL v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFDeviceContextHistoryConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFDeviceContextHistoryConfigurationMutation *)v7 isDirty])
    {
      v6->_BOOL keepsHistory = [(_AFDeviceContextHistoryConfigurationMutation *)v7 getKeepsHistory];
      v6->_unint64_t historyBufferSize = [(_AFDeviceContextHistoryConfigurationMutation *)v7 getHistoryBufferSize];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFDeviceContextHistoryConfigurationMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFDeviceContextHistoryConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFDeviceContextHistoryConfigurationMutation *)v5 isDirty])
    {
      BOOL v6 = objc_alloc_init(AFDeviceContextHistoryConfiguration);
      v6->_BOOL keepsHistory = [(_AFDeviceContextHistoryConfigurationMutation *)v5 getKeepsHistory];
      v6->_unint64_t historyBufferSize = [(_AFDeviceContextHistoryConfigurationMutation *)v5 getHistoryBufferSize];
    }
    else
    {
      BOOL v6 = (AFDeviceContextHistoryConfiguration *)[(AFDeviceContextHistoryConfiguration *)self copy];
    }
  }
  else
  {
    BOOL v6 = (AFDeviceContextHistoryConfiguration *)[(AFDeviceContextHistoryConfiguration *)self copy];
  }

  return v6;
}

@end