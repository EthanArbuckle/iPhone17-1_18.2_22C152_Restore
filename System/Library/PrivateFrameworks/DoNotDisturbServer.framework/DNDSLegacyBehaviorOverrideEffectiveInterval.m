@interface DNDSLegacyBehaviorOverrideEffectiveInterval
+ (BOOL)supportsSecureCoding;
- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithCoder:(id)a3;
- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithStartComponents:(id)a3 endComponents:(id)a4 calendarIdentifier:(id)a5 repeatInterval:(unint64_t)a6 identifier:(id)a7;
- (NSDateComponents)endComponents;
- (NSDateComponents)startComponents;
- (NSString)calendarIdentifier;
- (NSUUID)identifier;
- (unint64_t)repeatInterval;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSLegacyBehaviorOverrideEffectiveInterval

- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithStartComponents:(id)a3 endComponents:(id)a4 calendarIdentifier:(id)a5 repeatInterval:(unint64_t)a6 identifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)DNDSLegacyBehaviorOverrideEffectiveInterval;
  v16 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    startComponents = v16->_startComponents;
    v16->_startComponents = (NSDateComponents *)v17;

    uint64_t v19 = [v13 copy];
    endComponents = v16->_endComponents;
    v16->_endComponents = (NSDateComponents *)v19;

    uint64_t v21 = [v14 copy];
    v22 = (void *)v21;
    if (v21) {
      v23 = (void *)v21;
    }
    else {
      v23 = (void *)*MEMORY[0x1E4F1C318];
    }
    objc_storeStrong((id *)&v16->_calendarIdentifier, v23);

    v16->_repeatInterval = a6;
    uint64_t v24 = [v15 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v24;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSLegacyBehaviorOverrideEffectiveInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startComponents"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endComponents"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendar"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"repeatInterval"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v10 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)self initWithStartComponents:v5 endComponents:v6 calendarIdentifier:v7 repeatInterval:v8 identifier:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)self startComponents];
  [v4 encodeObject:v5 forKey:@"startComponents"];

  v6 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)self endComponents];
  [v4 encodeObject:v6 forKey:@"endComponents"];

  v7 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)self calendarIdentifier];
  [v4 encodeObject:v7 forKey:@"calendar"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverrideEffectiveInterval repeatInterval](self, "repeatInterval"), @"repeatInterval");
  id v8 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];
}

- (NSDateComponents)startComponents
{
  return self->_startComponents;
}

- (NSDateComponents)endComponents
{
  return self->_endComponents;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (unint64_t)repeatInterval
{
  return self->_repeatInterval;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_endComponents, 0);
  objc_storeStrong((id *)&self->_startComponents, 0);
}

@end