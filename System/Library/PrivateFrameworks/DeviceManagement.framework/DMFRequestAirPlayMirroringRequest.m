@interface DMFRequestAirPlayMirroringRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)force;
- (DMFRequestAirPlayMirroringRequest)initWithCoder:(id)a3;
- (NSString)destinationDeviceID;
- (NSString)destinationName;
- (NSString)password;
- (double)scanWaitInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationDeviceID:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setScanWaitInterval:(double)a3;
@end

@implementation DMFRequestAirPlayMirroringRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18ABB38;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRequestAirPlayMirroringRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMFRequestAirPlayMirroringRequest;
  v5 = [(CATTaskRequest *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"destinationName"];
    destinationName = v5->_destinationName;
    v5->_destinationName = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"destinationDeviceID"];
    destinationDeviceID = v5->_destinationDeviceID;
    v5->_destinationDeviceID = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"password"];
    password = v5->_password;
    v5->_password = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"force"];
    v5->_force = [v15 BOOLValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scanWaitInterval"];
    [v16 doubleValue];
    v5->_scanWaitInterval = v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DMFRequestAirPlayMirroringRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v11 encodeWithCoder:v4];
  v5 = [(DMFRequestAirPlayMirroringRequest *)self destinationName];
  [v4 encodeObject:v5 forKey:@"destinationName"];

  v6 = [(DMFRequestAirPlayMirroringRequest *)self destinationDeviceID];
  [v4 encodeObject:v6 forKey:@"destinationDeviceID"];

  uint64_t v7 = [(DMFRequestAirPlayMirroringRequest *)self password];
  [v4 encodeObject:v7 forKey:@"password"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFRequestAirPlayMirroringRequest force](self, "force"));
  [v4 encodeObject:v8 forKey:@"force"];

  v9 = (void *)MEMORY[0x1E4F28ED0];
  [(DMFRequestAirPlayMirroringRequest *)self scanWaitInterval];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 encodeObject:v10 forKey:@"scanWaitInterval"];
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (NSString)destinationDeviceID
{
  return self->_destinationDeviceID;
}

- (void)setDestinationDeviceID:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)force
{
  return self->_force;
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (double)scanWaitInterval
{
  return self->_scanWaitInterval;
}

- (void)setScanWaitInterval:(double)a3
{
  self->_scanWaitInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_destinationDeviceID, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
}

@end