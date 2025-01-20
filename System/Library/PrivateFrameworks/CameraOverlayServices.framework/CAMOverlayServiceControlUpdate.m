@interface CAMOverlayServiceControlUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)BOOLeanValue;
- (BOOL)isEnabled;
- (BOOL)isEqualToUpdate:(id)a3;
- (BOOL)isRecording;
- (BOOL)isValueUpdate;
- (CAMOverlayServiceControlUpdate)initWithCoder:(id)a3;
- (NSDictionary)styleDictionary;
- (NSString)controlIdentifier;
- (float)floatValue;
- (id)_initWithControlIdentifier:(id)a3 BOOLeanValue:(BOOL)a4;
- (id)_initWithControlIdentifier:(id)a3 floatValue:(float)a4;
- (id)_initWithControlIdentifier:(id)a3 indexValue:(int64_t)a4;
- (id)_initWithControlIdentifier:(id)a3 isEnabled:(BOOL)a4;
- (id)_initWithControlIdentifier:(id)a3 isRecording:(BOOL)a4;
- (id)_initWithControlIdentifier:(id)a3 styleDictionary:(id)a4;
- (id)_valueString;
- (id)_valueTypeString;
- (id)debugDescription;
- (id)description;
- (int64_t)indexValue;
- (int64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayServiceControlUpdate

- (id)_initWithControlIdentifier:(id)a3 floatValue:(float)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = [(CAMOverlayServiceControlUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_floatValue = a4;
    v9->_valueType = 0;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 indexValue:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  v8 = [(CAMOverlayServiceControlUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_valueType = 1;
    v9->_indexValue = a4;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 styleDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAMOverlayServiceControlUpdate;
  v9 = [(CAMOverlayServiceControlUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controlIdentifier, a3);
    objc_storeStrong((id *)&v10->_styleDictionary, a4);
    v10->_valueType = 2;
  }

  return v10;
}

- (id)_initWithControlIdentifier:(id)a3 BOOLeanValue:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  id v8 = [(CAMOverlayServiceControlUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_BOOLeanValue = a4;
    v9->_valueType = 3;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 isRecording:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  id v8 = [(CAMOverlayServiceControlUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_recording = a4;
    v9->_valueType = 4;
  }

  return v9;
}

- (id)_initWithControlIdentifier:(id)a3 isEnabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMOverlayServiceControlUpdate;
  id v8 = [(CAMOverlayServiceControlUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_controlIdentifier, a3);
    v9->_enabled = a4;
    v9->_valueType = 5;
  }

  return v9;
}

- (BOOL)isValueUpdate
{
  return ([(CAMOverlayServiceControlUpdate *)self valueType] & 0xFFFFFFFFFFFFFFFELL) != 4;
}

- (BOOL)isEqualToUpdate:(id)a3
{
  v4 = (CAMOverlayServiceControlUpdate *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
    char v10 = 1;
    goto LABEL_20;
  }
  uint64_t v5 = [(CAMOverlayServiceControlUpdate *)v4 valueType];
  if (v5 == [(CAMOverlayServiceControlUpdate *)self valueType])
  {
    switch([(CAMOverlayServiceControlUpdate *)self valueType])
    {
      case 0:
        [(CAMOverlayServiceControlUpdate *)v4 floatValue];
        float v7 = v6;
        [(CAMOverlayServiceControlUpdate *)self floatValue];
        BOOL v9 = v7 == v8;
        goto LABEL_9;
      case 1:
        uint64_t v11 = [(CAMOverlayServiceControlUpdate *)v4 indexValue];
        BOOL v9 = v11 == [(CAMOverlayServiceControlUpdate *)self indexValue];
LABEL_9:
        char v10 = v9;
        break;
      case 2:
        objc_super v12 = [(CAMOverlayServiceControlUpdate *)v4 styleDictionary];
        v13 = [(CAMOverlayServiceControlUpdate *)self styleDictionary];
        if (v12 == v13)
        {
          char v10 = 1;
        }
        else
        {
          v14 = [(CAMOverlayServiceControlUpdate *)v4 styleDictionary];
          v15 = [(CAMOverlayServiceControlUpdate *)self styleDictionary];
          char v10 = [v14 isEqualToDictionary:v15];
        }
        break;
      case 3:
        BOOL v16 = [(CAMOverlayServiceControlUpdate *)v4 BOOLeanValue];
        BOOL v17 = [(CAMOverlayServiceControlUpdate *)self BOOLeanValue];
        goto LABEL_17;
      case 4:
        BOOL v16 = [(CAMOverlayServiceControlUpdate *)v4 isRecording];
        BOOL v17 = [(CAMOverlayServiceControlUpdate *)self isRecording];
        goto LABEL_17;
      case 5:
        BOOL v16 = [(CAMOverlayServiceControlUpdate *)v4 isEnabled];
        BOOL v17 = [(CAMOverlayServiceControlUpdate *)self isEnabled];
LABEL_17:
        char v10 = v16 ^ v17 ^ 1;
        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    char v10 = 0;
  }
LABEL_20:

  return v10;
}

- (id)_valueTypeString
{
  unint64_t v2 = [(CAMOverlayServiceControlUpdate *)self valueType];
  if (v2 > 5) {
    return @"invalid";
  }
  else {
    return off_265261F28[v2];
  }
}

- (id)_valueString
{
  switch([(CAMOverlayServiceControlUpdate *)self valueType])
  {
    case 0:
      v3 = NSString;
      [(CAMOverlayServiceControlUpdate *)self floatValue];
      objc_msgSend(v3, "stringWithFormat:", @"%f", v4);
      goto LABEL_5;
    case 1:
      objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[CAMOverlayServiceControlUpdate indexValue](self, "indexValue"));
LABEL_5:
      float v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      float v7 = NSString;
      float v8 = [(CAMOverlayServiceControlUpdate *)self styleDictionary];
      uint64_t v5 = [v7 stringWithFormat:@"%@", v8];

      break;
    case 3:
      BOOL v9 = [(CAMOverlayServiceControlUpdate *)self BOOLeanValue];
      goto LABEL_10;
    case 4:
      BOOL v9 = [(CAMOverlayServiceControlUpdate *)self isRecording];
      goto LABEL_10;
    case 5:
      BOOL v9 = [(CAMOverlayServiceControlUpdate *)self isEnabled];
LABEL_10:
      char v10 = @"NO";
      if (v9) {
        char v10 = @"YES";
      }
      float v6 = v10;
LABEL_13:
      uint64_t v5 = v6;
      break;
    default:
      uint64_t v5 = &stru_26FD435D8;
      break;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  float v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  float v6 = [(CAMOverlayServiceControlUpdate *)self _valueTypeString];
  float v7 = [(CAMOverlayServiceControlUpdate *)self _valueString];
  float v8 = [v3 stringWithFormat:@"<%@: %p: %@ %@>", v5, self, v6, v7];

  return v8;
}

- (id)debugDescription
{
  v3 = NSString;
  float v4 = [(CAMOverlayServiceControlUpdate *)self _valueTypeString];
  uint64_t v5 = [(CAMOverlayServiceControlUpdate *)self _valueString];
  float v6 = [v3 stringWithFormat:@"%@(%@)", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v33 = a3;
  int64_t v4 = [(CAMOverlayServiceControlUpdate *)self valueType];
  uint64_t v5 = NSString;
  float v6 = (objc_class *)objc_opt_class();
  float v7 = NSStringFromClass(v6);
  float v8 = [v5 stringWithFormat:@"%@.%@", v7, @"valueType"];
  [v33 encodeInteger:v4 forKey:v8];

  BOOL v9 = [(CAMOverlayServiceControlUpdate *)self controlIdentifier];
  char v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  objc_super v12 = NSStringFromClass(v11);
  v13 = [v10 stringWithFormat:@"%@.%@", v12, @"controlIdentifier"];
  [v33 encodeObject:v9 forKey:v13];

  switch([(CAMOverlayServiceControlUpdate *)self valueType])
  {
    case 0:
      [(CAMOverlayServiceControlUpdate *)self floatValue];
      double v15 = v14;
      BOOL v16 = NSString;
      BOOL v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      v19 = [v16 stringWithFormat:@"%@.%@", v18, @"floatValue"];
      [v33 encodeDouble:v19 forKey:v15];
      goto LABEL_9;
    case 1:
      int64_t v20 = [(CAMOverlayServiceControlUpdate *)self indexValue];
      v21 = NSString;
      v22 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v22);
      v19 = [v21 stringWithFormat:@"%@.%@", v18, @"indexValue"];
      [v33 encodeInteger:v20 forKey:v19];
      goto LABEL_9;
    case 2:
      v18 = [(CAMOverlayServiceControlUpdate *)self styleDictionary];
      v23 = NSString;
      v24 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v24);
      v25 = [v23 stringWithFormat:@"%@.%@", v19, @"styleDictionary"];
      [v33 encodeObject:v18 forKey:v25];

      goto LABEL_9;
    case 3:
      BOOL v26 = [(CAMOverlayServiceControlUpdate *)self BOOLeanValue];
      v27 = NSString;
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      v18 = (void *)v29;
      v30 = @"BOOLeanValue";
      goto LABEL_8;
    case 4:
      BOOL v26 = [(CAMOverlayServiceControlUpdate *)self isRecording];
      v27 = NSString;
      v31 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v31);
      v18 = (void *)v29;
      v30 = @"recording";
      goto LABEL_8;
    case 5:
      BOOL v26 = [(CAMOverlayServiceControlUpdate *)self isEnabled];
      v27 = NSString;
      v32 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v32);
      v18 = (void *)v29;
      v30 = @"enabled";
LABEL_8:
      v19 = [v27 stringWithFormat:@"%@.%@", v29, v30];
      [v33 encodeBool:v26 forKey:v19];
LABEL_9:

      break;
    default:
      break;
  }
}

- (CAMOverlayServiceControlUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  float v6 = (objc_class *)objc_opt_class();
  float v7 = NSStringFromClass(v6);
  float v8 = [v5 stringWithFormat:@"%@.%@", v7, @"valueType"];
  uint64_t v9 = [v4 decodeIntegerForKey:v8];

  char v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v11 = NSString;
  objc_super v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  float v14 = [v11 stringWithFormat:@"%@.%@", v13, @"controlIdentifier"];
  double v15 = [v4 decodeObjectOfClasses:v10 forKey:v14];

  switch(v9)
  {
    case 0:
      BOOL v16 = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 floatValue:0.0];
      BOOL v17 = NSString;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      v19 = [v17 stringWithFormat:@"%@.%@", self, @"floatValue"];
      [v4 decodeDoubleForKey:v19];
      *(float *)&double v20 = v20;
      v16->_floatValue = *(float *)&v20;
      goto LABEL_9;
    case 1:
      BOOL v16 = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 indexValue:0];
      v21 = NSString;
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      v19 = [v21 stringWithFormat:@"%@.%@", self, @"indexValue"];
      v16->_indexValue = [v4 decodeIntegerForKey:v19];
      goto LABEL_9;
    case 2:
      self = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 styleDictionary:0];
      v23 = (void *)MEMORY[0x263EFFA08];
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = objc_opt_class();
      BOOL v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
      v27 = NSString;
      v28 = (objc_class *)objc_opt_class();
      uint64_t v29 = NSStringFromClass(v28);
      v30 = [v27 stringWithFormat:@"%@.%@", v29, @"styleDictionary"];
      v31 = [v4 decodeObjectOfClasses:v26 forKey:v30];
      styleDictionary = self->_styleDictionary;
      self->_styleDictionary = v31;

      if (self->_styleDictionary) {
        break;
      }
      BOOL v16 = 0;
      goto LABEL_10;
    case 3:
      BOOL v16 = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 BOOLeanValue:0];
      id v33 = NSString;
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      v19 = [v33 stringWithFormat:@"%@.%@", self, @"BOOLeanValue"];
      v16->_BOOLeanValue = [v4 decodeBoolForKey:v19];
      goto LABEL_9;
    case 4:
      BOOL v16 = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 isRecording:0];
      v35 = NSString;
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      v19 = [v35 stringWithFormat:@"%@.%@", self, @"recording"];
      v16->_recording = [v4 decodeBoolForKey:v19];
      goto LABEL_9;
    case 5:
      BOOL v16 = [(CAMOverlayServiceControlUpdate *)self _initWithControlIdentifier:v15 isEnabled:0];
      v37 = NSString;
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      self = (CAMOverlayServiceControlUpdate *)objc_claimAutoreleasedReturnValue();
      v19 = [v37 stringWithFormat:@"%@.%@", self, @"enabled"];
      v16->_enabled = [v4 decodeBoolForKey:v19];
LABEL_9:

LABEL_10:
      self = v16;
      break;
    default:
      break;
  }
  if (!self->_controlIdentifier)
  {

    self = 0;
  }

  return self;
}

- (NSString)controlIdentifier
{
  return self->_controlIdentifier;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (int64_t)indexValue
{
  return self->_indexValue;
}

- (NSDictionary)styleDictionary
{
  return self->_styleDictionary;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleDictionary, 0);
  objc_storeStrong((id *)&self->_controlIdentifier, 0);
}

@end