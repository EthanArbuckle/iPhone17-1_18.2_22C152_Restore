@interface DMFFetchAvailableOSUpdatesRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)useDelay;
- (DMFFetchAvailableOSUpdatesRequest)init;
- (DMFFetchAvailableOSUpdatesRequest)initWithCoder:(id)a3;
- (NSString)productVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setUseDelay:(BOOL)a3;
@end

@implementation DMFFetchAvailableOSUpdatesRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB6D0;
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

- (DMFFetchAvailableOSUpdatesRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  v2 = [(CATTaskRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    productVersion = v2->_productVersion;
    v2->_productVersion = 0;

    v3->_useDelay = 0;
  }
  return v3;
}

- (DMFFetchAvailableOSUpdatesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  v5 = [(CATTaskRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"productVersion"];
    productVersion = v5->_productVersion;
    v5->_productVersion = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useDelay"];
    v5->_useDelay = [v9 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFFetchAvailableOSUpdatesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFFetchAvailableOSUpdatesRequest *)self productVersion];
  [v4 encodeObject:v5 forKey:@"productVersion"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[DMFFetchAvailableOSUpdatesRequest useDelay](self, "useDelay"));
  [v4 encodeObject:v6 forKey:@"useDelay"];
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (BOOL)useDelay
{
  return self->_useDelay;
}

- (void)setUseDelay:(BOOL)a3
{
  self->_useDelay = a3;
}

- (void).cxx_destruct
{
}

@end