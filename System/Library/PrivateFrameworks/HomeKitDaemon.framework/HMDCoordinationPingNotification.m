@interface HMDCoordinationPingNotification
+ (BOOL)supportsSecureCoding;
- (HMDCoordinationPingNotification)initWithCoder:(id)a3;
- (HMDCoordinationPingNotification)initWithPrimaryResidentUUID:(id)a3;
- (NSUUID)primaryResidentUUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDCoordinationPingNotification

- (void).cxx_destruct
{
}

- (NSUUID)primaryResidentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCoordinationPingNotification;
  id v4 = a3;
  [(COMeshCommand *)&v6 encodeWithCoder:v4];
  v5 = [(HMDCoordinationPingNotification *)self primaryResidentUUID];
  [v4 encodeObject:v5 forKey:@"primaryResidentUUID"];
}

- (HMDCoordinationPingNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryResidentUUID"];
  v8.receiver = self;
  v8.super_class = (Class)HMDCoordinationPingNotification;
  objc_super v6 = [(COMeshCommand *)&v8 initWithCoder:v4];

  if (v6) {
    objc_storeStrong((id *)&v6->_primaryResidentUUID, v5);
  }

  return v6;
}

- (HMDCoordinationPingNotification)initWithPrimaryResidentUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCoordinationPingNotification;
  objc_super v6 = [(COMeshCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_primaryResidentUUID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end