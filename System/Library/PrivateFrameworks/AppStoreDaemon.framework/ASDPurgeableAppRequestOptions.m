@interface ASDPurgeableAppRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDPurgeableAppRequestOptions)initWithCoder:(id)a3;
- (ASDPurgeableAppRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4;
- (BOOL)performAvailablityCheck;
- (BOOL)skipLaunchCheck;
- (NSString)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)urgency;
- (void)encodeWithCoder:(id)a3;
- (void)setPerformAvailablityCheck:(BOOL)a3;
- (void)setSkipLaunchCheck:(BOOL)a3;
- (void)setUrgency:(int64_t)a3;
- (void)setVolume:(id)a3;
@end

@implementation ASDPurgeableAppRequestOptions

- (ASDPurgeableAppRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeableAppRequestOptions;
  v8 = [(ASDPurgeableAppRequestOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_volume, a3);
    v9->_urgency = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDPurgeableAppRequestOptions allocWithZone:](ASDPurgeableAppRequestOptions, "allocWithZone:") init];
  v5->_performAvailablityCheck = self->_performAvailablityCheck;
  v5->_skipLaunchCheck = self->_skipLaunchCheck;
  v5->_urgency = self->_urgency;
  uint64_t v6 = [(NSString *)self->_volume copyWithZone:a3];
  volume = v5->_volume;
  v5->_volume = (NSString *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableAppRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurgeableAppRequestOptions;
  v5 = [(ASDRequestOptions *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_performAvailablityCheck = [v4 decodeBoolForKey:@"performAvailablityCheck"];
    v5->_skipLaunchCheck = [v4 decodeBoolForKey:@"skipLaunchCheck"];
    v5->_urgency = [v4 decodeIntegerForKey:@"urgency"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
    volume = v5->_volume;
    v5->_volume = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeableAppRequestOptions performAvailablityCheck](self, "performAvailablityCheck"), @"performAvailablityCheck");
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeableAppRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), @"skipLaunchCheck");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeableAppRequestOptions urgency](self, "urgency"), @"urgency");
  v5 = [(ASDPurgeableAppRequestOptions *)self volume];
  [v4 encodeObject:v5 forKey:@"volume"];

  v6.receiver = self;
  v6.super_class = (Class)ASDPurgeableAppRequestOptions;
  [(ASDRequestOptions *)&v6 encodeWithCoder:v4];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(ASDPurgeableAppRequestOptions *)self urgency];
  objc_super v6 = [(ASDPurgeableAppRequestOptions *)self volume];
  id v7 = [v3 stringWithFormat:@"%@ {urgency = %ld, volume = %@ skip launch check = %d, perform availability check = %d}", v4, v5, v6, -[ASDPurgeableAppRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), -[ASDPurgeableAppRequestOptions performAvailablityCheck](self, "performAvailablityCheck")];

  return v7;
}

- (BOOL)performAvailablityCheck
{
  return self->_performAvailablityCheck;
}

- (void)setPerformAvailablityCheck:(BOOL)a3
{
  self->_performAvailablityCheck = a3;
}

- (BOOL)skipLaunchCheck
{
  return self->_skipLaunchCheck;
}

- (void)setSkipLaunchCheck:(BOOL)a3
{
  self->_skipLaunchCheck = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
}

- (void).cxx_destruct
{
}

@end