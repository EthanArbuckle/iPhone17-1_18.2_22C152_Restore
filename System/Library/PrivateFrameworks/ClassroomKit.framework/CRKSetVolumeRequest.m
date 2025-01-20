@interface CRKSetVolumeRequest
+ (BOOL)supportsSecureCoding;
- (CRKSetVolumeRequest)initWithCoder:(id)a3;
- (double)volume;
- (void)encodeWithCoder:(id)a3;
- (void)setVolume:(double)a3;
@end

@implementation CRKSetVolumeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetVolumeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKSetVolumeRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
    [v6 doubleValue];
    v5->_volume = v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKSetVolumeRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = NSNumber;
  [(CRKSetVolumeRequest *)self volume];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"volume"];
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

@end