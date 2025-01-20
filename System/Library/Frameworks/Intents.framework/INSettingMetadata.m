@interface INSettingMetadata
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAppIdentifier)targetApp;
- (INSettingDevice)targetDevice;
- (INSettingMetadata)initWithCoder:(id)a3;
- (INSettingMetadata)initWithSettingId:(id)a3 targetDevice:(id)a4 targetApp:(id)a5;
- (NSString)description;
- (NSString)settingId;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSettingMetadata

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"settingId";
  settingId = self->_settingId;
  v4 = settingId;
  if (!settingId)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"targetDevice";
  targetDevice = self->_targetDevice;
  v6 = targetDevice;
  if (!targetDevice)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"targetApp";
  targetApp = self->_targetApp;
  v8 = targetApp;
  if (!targetApp)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (targetApp)
  {
    if (targetDevice) {
      goto LABEL_9;
    }
LABEL_14:

    if (settingId) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!targetDevice) {
    goto LABEL_14;
  }
LABEL_9:
  if (settingId) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetApp, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);

  objc_storeStrong((id *)&self->_settingId, 0);
}

- (INAppIdentifier)targetApp
{
  return self->_targetApp;
}

- (INSettingDevice)targetDevice
{
  return self->_targetDevice;
}

- (NSString)settingId
{
  return self->_settingId;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSettingMetadata;
  v6 = [(INSettingMetadata *)&v11 description];
  v7 = [(INSettingMetadata *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSettingMetadata *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_settingId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"settingId");

  v9 = [v6 encodeObject:self->_targetDevice];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"targetDevice");

  v10 = [v6 encodeObject:self->_targetApp];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"targetApp");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  settingId = self->_settingId;
  id v5 = a3;
  [v5 encodeObject:settingId forKey:@"settingId"];
  [v5 encodeObject:self->_targetDevice forKey:@"targetDevice"];
  [v5 encodeObject:self->_targetApp forKey:@"targetApp"];
}

- (INSettingMetadata)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"settingId"];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"targetDevice"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"targetApp"];

  objc_super v11 = [(INSettingMetadata *)self initWithSettingId:v8 targetDevice:v9 targetApp:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INSettingMetadata *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      settingId = self->_settingId;
      BOOL v9 = 0;
      if (settingId == v5->_settingId || -[NSString isEqual:](settingId, "isEqual:"))
      {
        targetDevice = self->_targetDevice;
        if (targetDevice == v5->_targetDevice || -[INSettingDevice isEqual:](targetDevice, "isEqual:"))
        {
          targetApp = self->_targetApp;
          if (targetApp == v5->_targetApp || -[INAppIdentifier isEqual:](targetApp, "isEqual:")) {
            BOOL v9 = 1;
          }
        }
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_settingId hash];
  unint64_t v4 = [(INSettingDevice *)self->_targetDevice hash] ^ v3;
  return v4 ^ [(INAppIdentifier *)self->_targetApp hash];
}

- (INSettingMetadata)initWithSettingId:(id)a3 targetDevice:(id)a4 targetApp:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)INSettingMetadata;
  objc_super v11 = [(INSettingMetadata *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    settingId = v11->_settingId;
    v11->_settingId = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    targetDevice = v11->_targetDevice;
    v11->_targetDevice = (INSettingDevice *)v14;

    uint64_t v16 = [v10 copy];
    targetApp = v11->_targetApp;
    v11->_targetApp = (INAppIdentifier *)v16;
  }
  return v11;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 objectForKeyedSubscript:@"settingId"];
    uint64_t v10 = objc_opt_class();
    objc_super v11 = [v8 objectForKeyedSubscript:@"targetDevice"];
    uint64_t v12 = [v7 decodeObjectOfClass:v10 from:v11];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 objectForKeyedSubscript:@"targetApp"];
    v15 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v16 = (void *)[objc_alloc((Class)a1) initWithSettingId:v9 targetDevice:v12 targetApp:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end