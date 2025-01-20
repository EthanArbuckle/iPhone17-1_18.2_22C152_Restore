@interface CPSLocationConfirmationRequest
+ (BOOL)supportsSecureCoding;
- (CLLocation)deviceLocation;
- (CLRegion)expectedRegion;
- (CPSLocationConfirmationRequest)initWithCoder:(id)a3;
- (CPSLocationConfirmationRequest)initWithRequestState:(int64_t)a3 clipBundleID:(id)a4 applicationName:(id)a5 deviceLocation:(id)a6 expectedRegion:(id)a7;
- (NSString)applicationName;
- (NSString)clipBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)requestState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSLocationConfirmationRequest

- (CPSLocationConfirmationRequest)initWithRequestState:(int64_t)a3 clipBundleID:(id)a4 applicationName:(id)a5 deviceLocation:(id)a6 expectedRegion:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CPSLocationConfirmationRequest;
  v17 = [(CPSLocationConfirmationRequest *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_requestState = a3;
    objc_storeStrong((id *)&v17->_clipBundleID, a4);
    objc_storeStrong((id *)&v18->_applicationName, a5);
    objc_storeStrong((id *)&v18->_deviceLocation, a6);
    objc_storeStrong((id *)&v18->_expectedRegion, a7);
    v19 = v18;
  }

  return v18;
}

- (CPSLocationConfirmationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSLocationConfirmationRequest;
  v5 = [(CPSLocationConfirmationRequest *)&v16 init];
  if (v5)
  {
    v5->_requestState = [v4 decodeIntegerForKey:@"codeType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clipBundleID"];
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceLocation"];
    deviceLocation = v5->_deviceLocation;
    v5->_deviceLocation = (CLLocation *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedRegion"];
    expectedRegion = v5->_expectedRegion;
    v5->_expectedRegion = (CLRegion *)v12;

    id v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t requestState = self->_requestState;
  id v5 = a3;
  [v5 encodeInteger:requestState forKey:@"codeType"];
  [v5 encodeObject:self->_clipBundleID forKey:@"clipBundleID"];
  [v5 encodeObject:self->_applicationName forKey:@"applicationName"];
  [v5 encodeObject:self->_deviceLocation forKey:@"deviceLocation"];
  [v5 encodeObject:self->_expectedRegion forKey:@"expectedRegion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = self->_requestState;
  uint64_t v5 = [(NSString *)self->_clipBundleID copy];
  uint64_t v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSString *)self->_applicationName copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(CLLocation *)self->_deviceLocation copy];
  uint64_t v10 = (void *)v4[2];
  v4[2] = v9;

  uint64_t v11 = [(CLRegion *)self->_expectedRegion copy];
  uint64_t v12 = (void *)v4[3];
  v4[3] = v11;

  return v4;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (CLLocation)deviceLocation
{
  return self->_deviceLocation;
}

- (CLRegion)expectedRegion
{
  return self->_expectedRegion;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_expectedRegion, 0);

  objc_storeStrong((id *)&self->_deviceLocation, 0);
}

@end