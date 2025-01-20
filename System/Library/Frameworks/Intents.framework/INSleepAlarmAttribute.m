@interface INSleepAlarmAttribute
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSleepAlarmAttribute)initWithBedtime:(id)a3 override:(id)a4;
- (INSleepAlarmAttribute)initWithCoder:(id)a3;
- (NSDateComponents)bedtime;
- (NSNumber)override;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INSleepAlarmAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_override, 0);

  objc_storeStrong((id *)&self->_bedtime, 0);
}

- (NSNumber)override
{
  return self->_override;
}

- (NSDateComponents)bedtime
{
  return self->_bedtime;
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"bedtime";
  bedtime = self->_bedtime;
  v4 = bedtime;
  if (!bedtime)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"override";
  v10[0] = v4;
  override = self->_override;
  v6 = override;
  if (!override)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (override)
  {
    if (bedtime) {
      goto LABEL_7;
    }
  }
  else
  {

    if (bedtime) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INSleepAlarmAttribute;
  v6 = [(INSleepAlarmAttribute *)&v11 description];
  v7 = [(INSleepAlarmAttribute *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INSleepAlarmAttribute *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_bedtime];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"bedtime");

  v9 = [v6 encodeObject:self->_override];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"override");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  bedtime = self->_bedtime;
  id v5 = a3;
  [v5 encodeObject:bedtime forKey:@"bedtime"];
  [v5 encodeObject:self->_override forKey:@"override"];
}

- (INSleepAlarmAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bedtime"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"override"];

  v7 = [(INSleepAlarmAttribute *)self initWithBedtime:v5 override:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INSleepAlarmAttribute *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      bedtime = self->_bedtime;
      BOOL v8 = 0;
      if (bedtime == v5->_bedtime || -[NSDateComponents isEqual:](bedtime, "isEqual:"))
      {
        override = self->_override;
        if (override == v5->_override || -[NSNumber isEqual:](override, "isEqual:")) {
          BOOL v8 = 1;
        }
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
  uint64_t v3 = [(NSDateComponents *)self->_bedtime hash];
  return [(NSNumber *)self->_override hash] ^ v3;
}

- (INSleepAlarmAttribute)initWithBedtime:(id)a3 override:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INSleepAlarmAttribute;
  BOOL v8 = [(INSleepAlarmAttribute *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bedtime = v8->_bedtime;
    v8->_bedtime = (NSDateComponents *)v9;

    uint64_t v11 = [v7 copy];
    override = v8->_override;
    v8->_override = (NSNumber *)v11;
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
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"bedtime"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    v12 = [v8 objectForKeyedSubscript:@"override"];
    v13 = (void *)[objc_alloc((Class)a1) initWithBedtime:v11 override:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end