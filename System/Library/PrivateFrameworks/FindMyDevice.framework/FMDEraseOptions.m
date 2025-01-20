@interface FMDEraseOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)brickDevice;
- (BOOL)hasBridgeCoProcessor;
- (BOOL)useObliteration;
- (FMDEraseOptions)initWithCoder:(id)a3;
- (double)customDelay;
- (double)maxDelayInterval;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setBrickDevice:(BOOL)a3;
- (void)setCustomDelay:(double)a3;
- (void)setHasBridgeCoProcessor:(BOOL)a3;
- (void)setMaxDelayInterval:(double)a3;
- (void)setUseObliteration:(BOOL)a3;
@end

@implementation FMDEraseOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL useObliteration = self->_useObliteration;
  id v5 = a3;
  [v5 encodeBool:useObliteration forKey:@"useObliteration"];
  [v5 encodeBool:self->_brickDevice forKey:@"brickDevice"];
  [v5 encodeDouble:@"customDelay" forKey:self->_customDelay];
  [v5 encodeDouble:@"maxDelayInterval" forKey:self->_maxDelayInterval];
  [v5 encodeBool:self->_hasBridgeCoProcessor forKey:@"hasBridgeCoProcessor"];
}

- (FMDEraseOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDEraseOptions;
  id v5 = [(FMDEraseOptions *)&v9 init];
  if (v5)
  {
    v5->_BOOL useObliteration = [v4 decodeBoolForKey:@"useObliteration"];
    v5->_brickDevice = [v4 decodeBoolForKey:@"brickDevice"];
    [v4 decodeDoubleForKey:@"customDelay"];
    v5->_customDelay = v6;
    [v4 decodeDoubleForKey:@"maxDelayInterval"];
    v5->_maxDelayInterval = v7;
    v5->_hasBridgeCoProcessor = [v4 decodeBoolForKey:@"hasBridgeCoProcessor"];
  }

  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(FMDEraseOptions *)self useObliteration];
  BOOL v6 = [(FMDEraseOptions *)self brickDevice];
  [(FMDEraseOptions *)self maxDelayInterval];
  uint64_t v8 = v7;
  [(FMDEraseOptions *)self customDelay];
  return (id)[v3 stringWithFormat:@"<%@: %p> useObliteration: %i, brickDevice - %i, maxDelay - %f, customDelay - %f, hasBridgeCoProcessor - %i", v4, self, v5, v6, v8, v9, -[FMDEraseOptions hasBridgeCoProcessor](self, "hasBridgeCoProcessor")];
}

- (BOOL)useObliteration
{
  return self->_useObliteration;
}

- (void)setUseObliteration:(BOOL)a3
{
  self->_BOOL useObliteration = a3;
}

- (BOOL)brickDevice
{
  return self->_brickDevice;
}

- (void)setBrickDevice:(BOOL)a3
{
  self->_brickDevice = a3;
}

- (double)customDelay
{
  return self->_customDelay;
}

- (void)setCustomDelay:(double)a3
{
  self->_customDelay = a3;
}

- (double)maxDelayInterval
{
  return self->_maxDelayInterval;
}

- (void)setMaxDelayInterval:(double)a3
{
  self->_maxDelayInterval = a3;
}

- (BOOL)hasBridgeCoProcessor
{
  return self->_hasBridgeCoProcessor;
}

- (void)setHasBridgeCoProcessor:(BOOL)a3
{
  self->_hasBridgeCoProcessor = a3;
}

@end