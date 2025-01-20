@interface DMFSetVolumeRequest
+ (BOOL)supportsSecureCoding;
- (DMFSetVolumeRequest)initWithCoder:(id)a3;
- (float)volume;
- (void)encodeWithCoder:(id)a3;
- (void)setVolume:(float)a3;
@end

@implementation DMFSetVolumeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetVolumeRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFSetVolumeRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"volume"];
    [v6 doubleValue];
    *(float *)&double v7 = v7;
    *((_DWORD *)&v5->super.super._handlesNotifications + 1) = LODWORD(v7);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFSetVolumeRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = NSNumber;
  [(DMFSetVolumeRequest *)self volume];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  [v4 encodeObject:v6 forKey:@"volume"];
}

- (float)volume
{
  return *((float *)&self->super.super._handlesNotifications + 1);
}

- (void)setVolume:(float)a3
{
  *((float *)&self->super.super._handlesNotifications + 1) = a3;
}

@end