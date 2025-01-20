@interface DMFSetPasscodeLockGracePeriodRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetPasscodeLockGracePeriodRequest)initWithCoder:(id)a3;
- (double)seconds;
- (void)encodeWithCoder:(id)a3;
- (void)setSeconds:(double)a3;
@end

@implementation DMFSetPasscodeLockGracePeriodRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABCB8;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetPasscodeLockGracePeriodRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFSetPasscodeLockGracePeriodRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seconds"];
    [v6 doubleValue];
    v5->_seconds = v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFSetPasscodeLockGracePeriodRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = NSNumber;
  [(DMFSetPasscodeLockGracePeriodRequest *)self seconds];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 encodeObject:v6 forKey:@"seconds"];
}

- (double)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(double)a3
{
  self->_seconds = a3;
}

@end