@interface DMTFetchAutomatedDeviceEnrollmentStateResultObject
+ (BOOL)supportsSecureCoding;
- (DMTFetchAutomatedDeviceEnrollmentStateResultObject)initWithCoder:(id)a3;
- (int64_t)enrollmentState;
- (void)encodeWithCoder:(id)a3;
- (void)setEnrollmentState:(int64_t)a3;
@end

@implementation DMTFetchAutomatedDeviceEnrollmentStateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMTFetchAutomatedDeviceEnrollmentStateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentStateResultObject;
  v5 = [(CATTaskResultObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enrollmentState"];
    v5->_enrollmentState = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentStateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[DMTFetchAutomatedDeviceEnrollmentStateResultObject enrollmentState](self, "enrollmentState", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"enrollmentState"];
}

- (int64_t)enrollmentState
{
  return self->_enrollmentState;
}

- (void)setEnrollmentState:(int64_t)a3
{
  self->_enrollmentState = a3;
}

@end