@interface INTimer
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INSpeakableString)label;
- (INTimer)initWithCoder:(id)a3;
- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7;
- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7 type:(int64_t)a8;
- (NSString)description;
- (NSString)identifier;
- (double)duration;
- (double)remainingTime;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (double)duration
{
  return self->_duration;
}

- (INSpeakableString)label
{
  return self->_label;
}

- (id)_dictionaryRepresentation
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"label";
  label = self->_label;
  v4 = label;
  if (!label)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"duration";
  v5 = [NSNumber numberWithDouble:self->_duration];
  v14[1] = v5;
  v13[2] = @"remainingTime";
  v6 = [NSNumber numberWithDouble:self->_remainingTime];
  v14[2] = v6;
  v13[3] = @"identifier";
  identifier = self->_identifier;
  v8 = identifier;
  if (!identifier)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v8;
  v13[4] = @"state";
  v9 = [NSNumber numberWithInteger:self->_state];
  v14[4] = v9;
  v13[5] = @"type";
  v10 = [NSNumber numberWithInteger:self->_type];
  v14[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  if (!identifier) {
  if (!label)
  }

  return v11;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INTimer;
  v6 = [(INTimer *)&v11 description];
  v7 = [(INTimer *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTimer *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_label];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"label");

  v9 = [NSNumber numberWithDouble:self->_duration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"duration");

  v10 = [NSNumber numberWithDouble:self->_remainingTime];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"remainingTime");

  objc_super v11 = [v6 encodeObject:self->_identifier];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"identifier");
  int64_t state = self->_state;
  v13 = @"unknown";
  if (state == 2) {
    v13 = @"timerPaused";
  }
  if (state == 1) {
    v14 = @"timerRunning";
  }
  else {
    v14 = v13;
  }
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"state");

  int64_t type = self->_type;
  v17 = @"unknown";
  if (type == 2) {
    v17 = @"sleepTimer";
  }
  if (type == 1) {
    v18 = @"defaultType";
  }
  else {
    v18 = v17;
  }
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"type");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeDouble:@"duration" forKey:self->_duration];
  [v5 encodeDouble:@"remainingTime" forKey:self->_remainingTime];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (INTimer)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  [v4 decodeDoubleForKey:@"duration"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"remainingTime"];
  double v9 = v8;
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"identifier"];

  uint64_t v14 = [v4 decodeIntegerForKey:@"state"];
  uint64_t v15 = [v4 decodeIntegerForKey:@"type"];

  v16 = [(INTimer *)self initWithLabel:v5 duration:v13 remainingTime:v14 identifier:v15 state:v7 type:v9];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTimer *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      label = self->_label;
      BOOL v7 = (label == v5->_label || -[INSpeakableString isEqual:](label, "isEqual:"))
        && self->_duration == v5->_duration
        && self->_remainingTime == v5->_remainingTime
        && ((identifier = self->_identifier, identifier == v5->_identifier)
         || -[NSString isEqual:](identifier, "isEqual:"))
        && self->_state == v5->_state
        && self->_type == v5->_type;
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
  unint64_t v3 = [(INSpeakableString *)self->_label hash];
  id v4 = [NSNumber numberWithDouble:self->_duration];
  uint64_t v5 = [v4 hash] ^ v3;
  double v6 = [NSNumber numberWithDouble:self->_remainingTime];
  uint64_t v7 = [v6 hash];
  NSUInteger v8 = v5 ^ v7 ^ [(NSString *)self->_identifier hash];
  double v9 = [NSNumber numberWithInteger:self->_state];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [NSNumber numberWithInteger:self->_type];
  unint64_t v12 = v8 ^ v10 ^ [v11 hash];

  return v12;
}

- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7
{
  return [(INTimer *)self initWithLabel:a3 duration:a6 remainingTime:a7 identifier:0 state:a4 type:a5];
}

- (INTimer)initWithLabel:(id)a3 duration:(double)a4 remainingTime:(double)a5 identifier:(id)a6 state:(int64_t)a7 type:(int64_t)a8
{
  id v14 = a3;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)INTimer;
  v16 = [(INTimer *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    label = v16->_label;
    v16->_label = (INSpeakableString *)v17;

    v16->_duration = a4;
    v16->_remainingTime = a5;
    uint64_t v19 = [v15 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;

    v16->_int64_t state = a7;
    v16->_int64_t type = a8;
  }

  return v16;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"label"];
    uint64_t v11 = [v7 decodeObjectOfClass:v9 from:v10];

    unint64_t v12 = [v8 objectForKeyedSubscript:@"duration"];
    [v12 doubleValue];
    double v14 = v13;

    id v15 = [v8 objectForKeyedSubscript:@"remainingTime"];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [v8 objectForKeyedSubscript:@"identifier"];
    uint64_t v19 = [v8 objectForKeyedSubscript:@"state"];
    uint64_t v20 = INTimerStateWithString(v19);

    v21 = [v8 objectForKeyedSubscript:@"type"];
    uint64_t v22 = INTimerTypeWithString(v21);

    v23 = (void *)[objc_alloc((Class)a1) initWithLabel:v11 duration:v18 remainingTime:v20 identifier:v22 state:v14 type:v17];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end