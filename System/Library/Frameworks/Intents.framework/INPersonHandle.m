@interface INPersonHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggested;
- (INPersonHandle)initWithCoder:(id)a3;
- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type;
- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type label:(INPersonHandleLabel)label;
- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6;
- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 faceTimeType:(int64_t)a7 suggested:(BOOL)a8;
- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 suggested:(BOOL)a7;
- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 faceTimeType:(int64_t)a6;
- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 suggested:(BOOL)a6;
- (INPersonHandleLabel)label;
- (INPersonHandleType)type;
- (NSString)description;
- (NSString)value;
- (id)_dictionaryRepresentation;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)emergencyType;
- (int64_t)faceTimeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPersonHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (int64_t)faceTimeType
{
  return self->_faceTimeType;
}

- (int64_t)emergencyType
{
  return self->_emergencyType;
}

- (INPersonHandleLabel)label
{
  return self->_label;
}

- (INPersonHandleType)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"value";
  value = self->_value;
  v4 = value;
  if (!value)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"type";
  INPersonHandleType v5 = [(INPersonHandle *)self type];
  if (v5 <= INPersonHandleTypeEmailAddress)
  {
    if (v5 == INPersonHandleTypeUnknown)
    {
      int v6 = 0;
      v7 = @"Unknown";
      goto LABEL_15;
    }
    if (v5 == INPersonHandleTypeEmailAddress)
    {
      int v6 = 0;
      v7 = @"EmailAddress";
      goto LABEL_15;
    }
  }
  else
  {
    switch(v5)
    {
      case 2:
        int v6 = 0;
        v7 = @"PhoneNumber";
        goto LABEL_15;
      case 103:
        int v6 = 0;
        v7 = @"Website";
        goto LABEL_15;
      case 104:
        int v6 = 0;
        v7 = @"InstantMessage";
        goto LABEL_15;
    }
  }
  v7 = [MEMORY[0x1E4F1CA98] null];
  int v6 = 1;
LABEL_15:
  v13[1] = v7;
  v12[2] = @"label";
  label = self->_label;
  v9 = label;
  if (!label)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (label)
  {
    if (!v6) {
      goto LABEL_19;
    }
LABEL_24:

    if (value) {
      goto LABEL_20;
    }
    goto LABEL_25;
  }

  if (v6) {
    goto LABEL_24;
  }
LABEL_19:
  if (value) {
    goto LABEL_20;
  }
LABEL_25:

LABEL_20:

  return v10;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  INPersonHandleType v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPersonHandle;
  int v6 = [(INPersonHandle *)&v11 description];
  v7 = [(INPersonHandle *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPersonHandle *)self descriptionAtIndent:0];
}

- (INPersonHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  INPersonHandleType v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"emergencyType"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"faceTimeType"];
  uint64_t v10 = [v4 decodeBoolForKey:@"suggested"];

  objc_super v11 = [(INPersonHandle *)self initWithValue:v5 type:v6 label:v7 emergencyType:v8 faceTimeType:v9 suggested:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeInteger:self->_emergencyType forKey:@"emergencyType"];
  [v5 encodeInteger:self->_faceTimeType forKey:@"faceTimeType"];
  [v5 encodeBool:self->_suggested forKey:@"suggested"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    value = self->_value;
    if (value != (NSString *)v5[2] && (-[NSString isEqual:](value, "isEqual:") & 1) == 0)
    {
      if (self->_type == 1 || v5[3] == 1) {
        goto LABEL_11;
      }
      BOOL v7 = 0;
      if (!PNPhoneNumbersEqual()) {
        goto LABEL_12;
      }
    }
    if (self->_type == v5[3] && self->_emergencyType == v5[5] && self->_faceTimeType == v5[6])
    {
      BOOL v7 = self->_suggested == *((unsigned __int8 *)v5 + 8);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  BOOL v7 = 0;
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  id v4 = [NSNumber numberWithInteger:self->_type];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v5 ^ v3 ^ [(NSString *)self->_label hash];
  BOOL v7 = [NSNumber numberWithInteger:self->_emergencyType];
  unint64_t v8 = v6 ^ [v7 hash] ^ self->_suggested;

  return v8;
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 faceTimeType:(int64_t)a7 suggested:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)INPersonHandle;
  v16 = [(INPersonHandle *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    value = v16->_value;
    v16->_value = (NSString *)v17;

    v16->_type = a4;
    objc_storeStrong((id *)&v16->_label, a5);
    v16->_emergencyType = a6;
    v16->_faceTimeType = a7;
    v16->_suggested = a8;
  }

  return v16;
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6 suggested:(BOOL)a7
{
  return [(INPersonHandle *)self initWithValue:a3 type:a4 label:a5 emergencyType:a6 faceTimeType:0 suggested:a7];
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 suggested:(BOOL)a6
{
  return [(INPersonHandle *)self initWithValue:a3 type:a4 label:a5 emergencyType:0 faceTimeType:0 suggested:a6];
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 faceTimeType:(int64_t)a6
{
  return [(INPersonHandle *)self initWithValue:a3 type:a4 label:a5 emergencyType:0 faceTimeType:a6 suggested:0];
}

- (INPersonHandle)initWithValue:(id)a3 type:(int64_t)a4 label:(id)a5 emergencyType:(int64_t)a6
{
  return [(INPersonHandle *)self initWithValue:a3 type:a4 label:a5 emergencyType:a6 faceTimeType:0 suggested:0];
}

- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type label:(INPersonHandleLabel)label
{
  unint64_t v8 = value;
  uint64_t v9 = label;
  v14.receiver = self;
  v14.super_class = (Class)INPersonHandle;
  uint64_t v10 = [(INPersonHandle *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [(NSString *)v8 copy];
    v12 = v10->_value;
    v10->_value = (NSString *)v11;

    v10->_type = type;
    objc_storeStrong((id *)&v10->_label, label);
  }

  return v10;
}

- (INPersonHandle)initWithValue:(NSString *)value type:(INPersonHandleType)type
{
  return [(INPersonHandle *)self initWithValue:value type:type label:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end