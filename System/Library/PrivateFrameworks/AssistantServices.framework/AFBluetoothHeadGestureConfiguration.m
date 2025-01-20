@interface AFBluetoothHeadGestureConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFBluetoothHeadGestureConfiguration)init;
- (AFBluetoothHeadGestureConfiguration)initWithBuilder:(id)a3;
- (AFBluetoothHeadGestureConfiguration)initWithCoder:(id)a3;
- (AFBluetoothHeadGestureConfiguration)initWithIsEnabled:(BOOL)a3 isSupported:(BOOL)a4 acceptGesture:(int64_t)a5 rejectGesture:(int64_t)a6;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)acceptGesture;
- (int64_t)rejectGesture;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBluetoothHeadGestureConfiguration

- (int64_t)rejectGesture
{
  return self->_rejectGesture;
}

- (int64_t)acceptGesture
{
  return self->_acceptGesture;
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL isEnabled = self->_isEnabled;
  id v6 = a3;
  v7 = [v4 numberWithBool:isEnabled];
  [v6 encodeObject:v7 forKey:@"AFBluetoothHeadGestureConfiguration::isEnabled"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSupported];
  [v6 encodeObject:v8 forKey:@"AFBluetoothHeadGestureConfiguration::isSupported"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_acceptGesture];
  [v6 encodeObject:v9 forKey:@"AFBluetoothHeadGestureConfiguration::acceptGesture"];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_rejectGesture];
  [v6 encodeObject:v10 forKey:@"AFBluetoothHeadGestureConfiguration::rejectGesture"];
}

- (AFBluetoothHeadGestureConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadGestureConfiguration::isEnabled"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadGestureConfiguration::isSupported"];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadGestureConfiguration::acceptGesture"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadGestureConfiguration::rejectGesture"];

  uint64_t v12 = [v11 integerValue];
  return [(AFBluetoothHeadGestureConfiguration *)self initWithIsEnabled:v6 isSupported:v8 acceptGesture:v10 rejectGesture:v12];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFBluetoothHeadGestureConfiguration *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isEnabled = self->_isEnabled;
      if (isEnabled == [(AFBluetoothHeadGestureConfiguration *)v5 isEnabled]
        && (BOOL isSupported = self->_isSupported,
            isSupported == [(AFBluetoothHeadGestureConfiguration *)v5 isSupported])
        && (int64_t acceptGesture = self->_acceptGesture,
            acceptGesture == [(AFBluetoothHeadGestureConfiguration *)v5 acceptGesture]))
      {
        int64_t rejectGesture = self->_rejectGesture;
        BOOL v10 = rejectGesture == [(AFBluetoothHeadGestureConfiguration *)v5 rejectGesture];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSupported];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_acceptGesture];
  uint64_t v8 = [v7 hash];
  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_rejectGesture];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)AFBluetoothHeadGestureConfiguration;
  v5 = [(AFBluetoothHeadGestureConfiguration *)&v18 description];
  unint64_t acceptGesture = self->_acceptGesture;
  if (acceptGesture > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = (__CFString *)*((void *)&off_1E59274B8 + acceptGesture);
  }
  BOOL isEnabled = self->_isEnabled;
  BOOL isSupported = self->_isSupported;
  unint64_t v10 = v7;
  unint64_t rejectGesture = self->_rejectGesture;
  if (rejectGesture > 2) {
    uint64_t v12 = @"(unknown)";
  }
  else {
    uint64_t v12 = (__CFString *)*((void *)&off_1E59274B8 + rejectGesture);
  }
  if (isSupported) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (isEnabled) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  v15 = v12;
  v16 = (void *)[v4 initWithFormat:@"%@ {BOOL isEnabled = %@, isSupported = %@, acceptGesture = %@, rejectGesture = %@}", v5, v14, v13, v10, v15];

  return v16;
}

- (id)description
{
  return [(AFBluetoothHeadGestureConfiguration *)self _descriptionWithIndent:0];
}

- (AFBluetoothHeadGestureConfiguration)initWithIsEnabled:(BOOL)a3 isSupported:(BOOL)a4 acceptGesture:(int64_t)a5 rejectGesture:(int64_t)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__AFBluetoothHeadGestureConfiguration_initWithIsEnabled_isSupported_acceptGesture_rejectGesture___block_invoke;
  v7[3] = &__block_descriptor_50_e55_v16__0___AFBluetoothHeadGestureConfigurationMutating__8l;
  BOOL v8 = a3;
  BOOL v9 = a4;
  v7[4] = a5;
  v7[5] = a6;
  return [(AFBluetoothHeadGestureConfiguration *)self initWithBuilder:v7];
}

void __97__AFBluetoothHeadGestureConfiguration_initWithIsEnabled_isSupported_acceptGesture_rejectGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setIsEnabled:v3];
  [v4 setIsSupported:*(unsigned __int8 *)(a1 + 49)];
  [v4 setAcceptGesture:*(void *)(a1 + 32)];
  [v4 setRejectGesture:*(void *)(a1 + 40)];
}

- (AFBluetoothHeadGestureConfiguration)init
{
  return [(AFBluetoothHeadGestureConfiguration *)self initWithBuilder:0];
}

- (AFBluetoothHeadGestureConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothHeadGestureConfigurationMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothHeadGestureConfiguration;
  v5 = [(AFBluetoothHeadGestureConfiguration *)&v9 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFBluetoothHeadGestureConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBluetoothHeadGestureConfigurationMutation *)v7 isDirty])
    {
      v6->_BOOL isEnabled = [(_AFBluetoothHeadGestureConfigurationMutation *)v7 getIsEnabled];
      v6->_BOOL isSupported = [(_AFBluetoothHeadGestureConfigurationMutation *)v7 getIsSupported];
      v6->_unint64_t acceptGesture = [(_AFBluetoothHeadGestureConfigurationMutation *)v7 getAcceptGesture];
      v6->_unint64_t rejectGesture = [(_AFBluetoothHeadGestureConfigurationMutation *)v7 getRejectGesture];
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
  id v4 = (void (**)(id, _AFBluetoothHeadGestureConfigurationMutation *))a3;
  if (v4)
  {
    v5 = [[_AFBluetoothHeadGestureConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBluetoothHeadGestureConfigurationMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFBluetoothHeadGestureConfiguration);
      v6->_BOOL isEnabled = [(_AFBluetoothHeadGestureConfigurationMutation *)v5 getIsEnabled];
      v6->_BOOL isSupported = [(_AFBluetoothHeadGestureConfigurationMutation *)v5 getIsSupported];
      v6->_unint64_t acceptGesture = [(_AFBluetoothHeadGestureConfigurationMutation *)v5 getAcceptGesture];
      v6->_unint64_t rejectGesture = [(_AFBluetoothHeadGestureConfigurationMutation *)v5 getRejectGesture];
    }
    else
    {
      uint64_t v6 = (AFBluetoothHeadGestureConfiguration *)[(AFBluetoothHeadGestureConfiguration *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFBluetoothHeadGestureConfiguration *)[(AFBluetoothHeadGestureConfiguration *)self copy];
  }

  return v6;
}

@end