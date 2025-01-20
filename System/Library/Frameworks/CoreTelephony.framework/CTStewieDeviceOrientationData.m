@interface CTStewieDeviceOrientationData
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeviceStationary;
- (BOOL)isEqual:(id)a3;
- (BOOL)targetLocked;
- (CTStewieDeviceOrientationData)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)x;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDeviceStationary:(BOOL)a3;
- (void)setTargetLocked:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setX:(int64_t)a3;
@end

@implementation CTStewieDeviceOrientationData

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTStewieDeviceOrientationData *)self timestamp];
  [v3 appendFormat:@", timestamp=%@", v4];

  if ([(CTStewieDeviceOrientationData *)self targetLocked]) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  [v3 appendFormat:@", targetLocked=%s", v5];
  if ([(CTStewieDeviceOrientationData *)self isDeviceStationary]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  [v3 appendFormat:@", isDeviceStationary=%s", v6];
  [v3 appendFormat:@", x=%ld", -[CTStewieDeviceOrientationData x](self, "x")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTStewieDeviceOrientationData *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(CTStewieDeviceOrientationData *)self timestamp];
      v6 = [(CTStewieDeviceOrientationData *)v4 timestamp];
      if ([v5 isEqual:v6]
        && (BOOL v7 = [(CTStewieDeviceOrientationData *)self targetLocked],
            v7 == [(CTStewieDeviceOrientationData *)v4 targetLocked])
        && (BOOL v8 = [(CTStewieDeviceOrientationData *)self isDeviceStationary],
            v8 == [(CTStewieDeviceOrientationData *)v4 isDeviceStationary]))
      {
        int64_t v11 = [(CTStewieDeviceOrientationData *)self x];
        BOOL v9 = v11 == [(CTStewieDeviceOrientationData *)v4 x];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTStewieDeviceOrientationData *)self timestamp];
  [v4 setTimestamp:v5];

  objc_msgSend(v4, "setTargetLocked:", -[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"));
  objc_msgSend(v4, "setIsDeviceStationary:", -[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"));
  objc_msgSend(v4, "setX:", -[CTStewieDeviceOrientationData x](self, "x"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CTStewieDeviceOrientationData *)self timestamp];
  [v5 encodeObject:v4 forKey:@"timestamp"];

  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieDeviceOrientationData targetLocked](self, "targetLocked"), @"targetLocked");
  objc_msgSend(v5, "encodeBool:forKey:", -[CTStewieDeviceOrientationData isDeviceStationary](self, "isDeviceStationary"), @"isDeviceStationary");
  objc_msgSend(v5, "encodeInteger:forKey:", -[CTStewieDeviceOrientationData x](self, "x"), @"x");
}

- (CTStewieDeviceOrientationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTStewieDeviceOrientationData;
  id v5 = [(CTStewieDeviceOrientationData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_targetLocked = [v4 decodeBoolForKey:@"targetLocked"];
    v5->_isDeviceStationary = [v4 decodeBoolForKey:@"isDeviceStationary"];
    v5->_x = [v4 decodeIntegerForKey:@"x"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (BOOL)targetLocked
{
  return self->_targetLocked;
}

- (void)setTargetLocked:(BOOL)a3
{
  self->_targetLocked = a3;
}

- (BOOL)isDeviceStationary
{
  return self->_isDeviceStationary;
}

- (void)setIsDeviceStationary:(BOOL)a3
{
  self->_isDeviceStationary = a3;
}

- (int64_t)x
{
  return self->_x;
}

- (void)setX:(int64_t)a3
{
  self->_x = a3;
}

- (void).cxx_destruct
{
}

@end