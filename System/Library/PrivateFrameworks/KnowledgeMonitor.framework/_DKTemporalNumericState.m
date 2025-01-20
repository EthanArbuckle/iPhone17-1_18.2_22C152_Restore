@interface _DKTemporalNumericState
+ (BOOL)supportsSecureCoding;
- (NSDate)timestamp;
- (NSNumber)state;
- (_DKTemporalNumericState)initWithCoder:(id)a3;
- (_DKTemporalNumericState)initWithState:(id)a3 timestamp:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation _DKTemporalNumericState

- (_DKTemporalNumericState)initWithState:(id)a3 timestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKTemporalNumericState;
  v9 = [(_DKTemporalNumericState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_state, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DKTemporalNumericState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DKTemporalNumericState;
  v5 = [(_DKTemporalNumericState *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  state = self->_state;
  id v5 = a3;
  [v5 encodeObject:state forKey:@"state"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"state=%@, timestamp=%@", self->_state, self->_timestamp];
}

- (NSNumber)state
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setState:(id)a3
{
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end