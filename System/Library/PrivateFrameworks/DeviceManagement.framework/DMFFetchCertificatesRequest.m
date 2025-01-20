@interface DMFFetchCertificatesRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)managedOnly;
- (DMFFetchCertificatesRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setManagedOnly:(BOOL)a3;
@end

@implementation DMFFetchCertificatesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB6E8;
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

- (DMFFetchCertificatesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFFetchCertificatesRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"managedOnly"];
    *(&v5->super.super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchCertificatesRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchCertificatesRequest managedOnly](self, "managedOnly", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"managedOnly"];
}

- (BOOL)managedOnly
{
  return *(&self->super.super._handlesNotifications + 1);
}

- (void)setManagedOnly:(BOOL)a3
{
  *(&self->super.super._handlesNotifications + 1) = a3;
}

@end