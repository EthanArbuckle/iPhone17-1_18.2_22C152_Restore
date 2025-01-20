@interface INVoiceCommandDeviceInformation
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INVoiceCommandDeviceInformation)initWithCoder:(id)a3;
- (INVoiceCommandDeviceInformation)initWithDeviceIdiom:(int64_t)a3 isHomePodInUltimateMode:(id)a4;
- (NSNumber)isHomePodInUltimateMode;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)deviceIdiom;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INVoiceCommandDeviceInformation

- (void).cxx_destruct
{
}

- (NSNumber)isHomePodInUltimateMode
{
  return self->_isHomePodInUltimateMode;
}

- (int64_t)deviceIdiom
{
  return self->_deviceIdiom;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"deviceIdiom";
  v3 = [NSNumber numberWithInteger:self->_deviceIdiom];
  v8[1] = @"isHomePodInUltimateMode";
  v9[0] = v3;
  isHomePodInUltimateMode = self->_isHomePodInUltimateMode;
  v5 = isHomePodInUltimateMode;
  if (!isHomePodInUltimateMode)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  if (!isHomePodInUltimateMode) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INVoiceCommandDeviceInformation;
  v6 = [(INVoiceCommandDeviceInformation *)&v11 description];
  v7 = [(INVoiceCommandDeviceInformation *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INVoiceCommandDeviceInformation *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_deviceIdiom - 1;
  if (v8 > 6) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E551EB18[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"deviceIdiom");

  objc_super v11 = [v6 encodeObject:self->_isHomePodInUltimateMode];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"isHomePodInUltimateMode");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t deviceIdiom = self->_deviceIdiom;
  id v5 = a3;
  [v5 encodeInteger:deviceIdiom forKey:@"deviceIdiom"];
  [v5 encodeObject:self->_isHomePodInUltimateMode forKey:@"isHomePodInUltimateMode"];
}

- (INVoiceCommandDeviceInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"deviceIdiom"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isHomePodInUltimateMode"];

  v7 = [(INVoiceCommandDeviceInformation *)self initWithDeviceIdiom:v5 isHomePodInUltimateMode:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INVoiceCommandDeviceInformation *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v7 = 0;
      if (self->_deviceIdiom == v5->_deviceIdiom)
      {
        isHomePodInUltimateMode = self->_isHomePodInUltimateMode;
        if (isHomePodInUltimateMode == v5->_isHomePodInUltimateMode
          || -[NSNumber isEqual:](isHomePodInUltimateMode, "isEqual:"))
        {
          BOOL v7 = 1;
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_deviceIdiom];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSNumber *)self->_isHomePodInUltimateMode hash] ^ v4;

  return v5;
}

- (INVoiceCommandDeviceInformation)initWithDeviceIdiom:(int64_t)a3 isHomePodInUltimateMode:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INVoiceCommandDeviceInformation;
  BOOL v7 = [(INVoiceCommandDeviceInformation *)&v12 init];
  unint64_t v8 = v7;
  if (v7)
  {
    v7->_int64_t deviceIdiom = a3;
    uint64_t v9 = [v6 copy];
    isHomePodInUltimateMode = v8->_isHomePodInUltimateMode;
    v8->_isHomePodInUltimateMode = (NSNumber *)v9;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v6 objectForKeyedSubscript:@"deviceIdiom"];
    uint64_t v8 = INDeviceIdiomWithString(v7);

    uint64_t v9 = [v6 objectForKeyedSubscript:@"isHomePodInUltimateMode"];
    v10 = (void *)[objc_alloc((Class)a1) initWithDeviceIdiom:v8 isHomePodInUltimateMode:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end