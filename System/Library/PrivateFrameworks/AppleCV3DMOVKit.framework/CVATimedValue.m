@interface CVATimedValue
+ (BOOL)supportsSecureCoding;
+ (id)classes;
- (CVATimedValue)initWithCoder:(id)a3;
- (CVATimedValue)initWithDictionary:(id)a3;
- (NSSecureCoding)value;
- (double)timestamp;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)frameId;
- (unint64_t)syncTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation CVATimedValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_267C58B58 == -1)
  {
    v2 = (void *)qword_267C58B50;
  }
  else
  {
    dispatch_once(&qword_267C58B58, &unk_26CB5E298);
    v2 = (void *)qword_267C58B50;
  }
  return v2;
}

- (CVATimedValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVATimedValue;
  v5 = [(CVATimedValue *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"v"];
    value = v5->_value;
    v5->_value = (NSSecureCoding *)v6;

    v8 = [v4 objectForKeyedSubscript:@"t"];
    [v8 doubleValue];
    v5->_timestamp = v9;

    v10 = [v4 objectForKeyedSubscript:@"st"];
    v5->_syncTimestamp = [v10 unsignedLongLongValue];

    v11 = [v4 objectForKeyedSubscript:@"fi"];
    v5->_frameId = [v11 unsignedLongLongValue];
  }
  return v5;
}

- (CVATimedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CVATimedValue;
  v5 = [(CVATimedValue *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x21D490BF0]();
    uint64_t v7 = [v4 decodeObjectForKey:@"v"];
    value = v5->_value;
    v5->_value = (NSSecureCoding *)v7;

    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v9;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [v5 encodeObject:self->_value forKey:@"v"];
  [v5 encodeDouble:@"t" forKey:self->_timestamp];
  [v5 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v5 encodeInt64:self->_frameId forKey:@"fi"];
}

- (id)dictionary
{
  v9[4] = *MEMORY[0x263EF8340];
  v9[0] = self->_value;
  v8[0] = @"v";
  v8[1] = @"t";
  v3 = [NSNumber numberWithDouble:self->_timestamp];
  v9[1] = v3;
  v8[2] = @"st";
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v9[2] = v4;
  v8[3] = @"fi";
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v9[3] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CVATimedValue *)self dictionary];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (NSSecureCoding)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end