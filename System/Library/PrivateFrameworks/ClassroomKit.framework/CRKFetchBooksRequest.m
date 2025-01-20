@interface CRKFetchBooksRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)includeImages;
- (BOOL)isValidWithError:(id *)a3;
- (CRKFetchBooksRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeImages:(BOOL)a3;
@end

@implementation CRKFetchBooksRequest

- (BOOL)isValidWithError:(id *)a3
{
  return 1;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchBooksRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchBooksRequest;
  v5 = [(CATTaskRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeImages"];
    *(&v5->super._handlesNotifications + 1) = [v6 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchBooksRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKFetchBooksRequest includeImages](self, "includeImages", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"includeImages"];
}

- (BOOL)includeImages
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setIncludeImages:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end