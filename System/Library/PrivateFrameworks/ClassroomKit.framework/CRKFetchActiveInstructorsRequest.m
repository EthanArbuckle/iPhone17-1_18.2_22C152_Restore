@interface CRKFetchActiveInstructorsRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)includeImages;
- (CRKFetchActiveInstructorsRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeImages:(BOOL)a3;
@end

@implementation CRKFetchActiveInstructorsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveInstructorsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchActiveInstructorsRequest;
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
  id v4 = NSNumber;
  id v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CRKFetchActiveInstructorsRequest includeImages](self, "includeImages"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"includeImages"];
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