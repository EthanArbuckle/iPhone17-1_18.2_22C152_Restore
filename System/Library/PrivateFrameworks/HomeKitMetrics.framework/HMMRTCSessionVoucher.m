@interface HMMRTCSessionVoucher
+ (BOOL)supportsSecureCoding;
- (HMMRTCSessionVoucher)initWithCoder:(id)a3;
- (HMMRTCSessionVoucher)initWithUUID:(id)a3 serviceName:(id)a4;
- (NSString)serviceName;
- (NSUUID)uuid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMMRTCSessionVoucher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMMRTCSessionVoucher *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  id v6 = [(HMMRTCSessionVoucher *)self serviceName];
  [v4 encodeObject:v6 forKey:@"service"];
}

- (HMMRTCSessionVoucher)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];

  v7 = [(HMMRTCSessionVoucher *)self initWithUUID:v5 serviceName:v6];
  return v7;
}

- (HMMRTCSessionVoucher)initWithUUID:(id)a3 serviceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMRTCSessionVoucher;
  v9 = [(HMMRTCSessionVoucher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_serviceName, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end