@interface AFDeviceCapabilities
+ (BOOL)supportsSecureCoding;
- (AFDeviceCapabilities)initWithCoder:(id)a3;
- (AFDeviceCapabilities)initWithSerializedBackingStore:(id)a3;
- (AFDeviceCapabilities)initWithVoiceTriggerEnabled:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)serializedBackingStore;
- (int64_t)voiceTriggerEnabled;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFDeviceCapabilities

- (void).cxx_destruct
{
}

- (int64_t)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AFDeviceCapabilities *)self serializedBackingStore];
  [v4 encodeObject:v5 forKey:@"serializedBackingStore"];
}

- (AFDeviceCapabilities)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"serializedBackingStore"];

  v9 = [(AFDeviceCapabilities *)self initWithSerializedBackingStore:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFDeviceCapabilities *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AFDeviceCapabilities *)self serializedBackingStore];
      v6 = [(AFDeviceCapabilities *)v4 serializedBackingStore];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AFDeviceCapabilities *)self serializedBackingStore];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AFDeviceCapabilities;
  id v4 = [(AFDeviceCapabilities *)&v10 description];
  unint64_t voiceTriggerEnabled = self->_voiceTriggerEnabled;
  if (voiceTriggerEnabled > 2) {
    v6 = @"(unknown)";
  }
  else {
    v6 = off_1E592A860[voiceTriggerEnabled];
  }
  char v7 = v6;
  v8 = [v3 stringWithFormat:@"%@(voiceTriggerEnabled=%@)", v4, v7];

  return v8;
}

- (id)serializedBackingStore
{
  if (self->_serializedBackingStore) {
    id v3 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_serializedBackingStore];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v4 = v3;
  int64_t voiceTriggerEnabled = self->_voiceTriggerEnabled;
  if (!voiceTriggerEnabled)
  {
    v6 = [v3 objectForKey:@"voiceTriggerEnabled"];

    if (!v6) {
      goto LABEL_8;
    }
    int64_t voiceTriggerEnabled = self->_voiceTriggerEnabled;
  }
  char v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:voiceTriggerEnabled];
  [v4 setObject:v7 forKey:@"voiceTriggerEnabled"];

LABEL_8:
  return v4;
}

- (AFDeviceCapabilities)initWithSerializedBackingStore:(id)a3
{
  id v5 = a3;
  v6 = [v5 objectForKey:@"voiceTriggerEnabled"];
  char v7 = -[AFDeviceCapabilities initWithVoiceTriggerEnabled:](self, "initWithVoiceTriggerEnabled:", [v6 integerValue]);

  if (v7) {
    objc_storeStrong((id *)&v7->_serializedBackingStore, a3);
  }

  return v7;
}

- (AFDeviceCapabilities)initWithVoiceTriggerEnabled:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFDeviceCapabilities;
  result = [(AFDeviceCapabilities *)&v5 init];
  if (result) {
    result->_int64_t voiceTriggerEnabled = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end