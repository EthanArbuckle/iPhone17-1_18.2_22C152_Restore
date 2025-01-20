@interface INSupportedTrafficIncidentType
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSupportedTrafficIncidentType)initWithCoder:(id)a3;
- (INSupportedTrafficIncidentType)initWithType:(int64_t)a3 localizedDisplayString:(id)a4;
- (NSString)description;
- (NSString)localizedDisplayString;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSupportedTrafficIncidentType

- (void).cxx_destruct
{
}

- (NSString)localizedDisplayString
{
  return self->_localizedDisplayString;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"type";
  v3 = [NSNumber numberWithInteger:self->_type];
  v8[1] = @"localizedDisplayString";
  v9[0] = v3;
  localizedDisplayString = self->_localizedDisplayString;
  v5 = localizedDisplayString;
  if (!localizedDisplayString)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  if (!localizedDisplayString) {

  }
  return v6;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSupportedTrafficIncidentType;
  v6 = [(INSupportedTrafficIncidentType *)&v11 description];
  v7 = [(INSupportedTrafficIncidentType *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSupportedTrafficIncidentType *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  unint64_t v8 = self->_type - 1;
  if (v8 > 4) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E5520DF0[v8];
  }
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"type");

  objc_super v11 = [v6 encodeObject:self->_localizedDisplayString];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"localizedDisplayString");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_localizedDisplayString forKey:@"localizedDisplayString"];
}

- (INSupportedTrafficIncidentType)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayString"];

  v7 = [(INSupportedTrafficIncidentType *)self initWithType:v5 localizedDisplayString:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSupportedTrafficIncidentType *)a3;
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
      if (self->_type == v5->_type)
      {
        localizedDisplayString = self->_localizedDisplayString;
        if (localizedDisplayString == v5->_localizedDisplayString
          || -[NSString isEqual:](localizedDisplayString, "isEqual:"))
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
  v3 = [NSNumber numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_localizedDisplayString hash] ^ v4;

  return v5;
}

- (INSupportedTrafficIncidentType)initWithType:(int64_t)a3 localizedDisplayString:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSupportedTrafficIncidentType;
  BOOL v7 = [(INSupportedTrafficIncidentType *)&v12 init];
  unint64_t v8 = v7;
  if (v7)
  {
    v7->_int64_t type = a3;
    uint64_t v9 = [v6 copy];
    localizedDisplayString = v8->_localizedDisplayString;
    v8->_localizedDisplayString = (NSString *)v9;
  }
  return v8;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:@"type"];
    uint64_t v10 = INTrafficIncidentTypeWithString(v9);

    uint64_t v11 = objc_opt_class();
    objc_super v12 = [v8 objectForKeyedSubscript:@"localizedDisplayString"];
    v13 = [v7 decodeObjectOfClass:v11 from:v12];

    v14 = (void *)[objc_alloc((Class)a1) initWithType:v10 localizedDisplayString:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end