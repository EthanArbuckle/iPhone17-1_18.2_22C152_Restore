@interface CRKFetchScreenshotRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CRKFetchScreenshotRequest)initWithCoder:(id)a3;
- (unint64_t)maxHeight;
- (unint64_t)maxWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxHeight:(unint64_t)a3;
- (void)setMaxWidth:(unint64_t)a3;
@end

@implementation CRKFetchScreenshotRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchScreenshotRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchScreenshotRequest;
  v5 = [(CATTaskRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidth"];
    v5->_maxWidth = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxHeight"];
    v5->_maxHeight = [v7 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchScreenshotRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFetchScreenshotRequest maxWidth](self, "maxWidth", v7.receiver, v7.super_class));
  [v4 encodeObject:v5 forKey:@"maxWidth"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKFetchScreenshotRequest maxHeight](self, "maxHeight"));
  [v4 encodeObject:v6 forKey:@"maxHeight"];
}

- (unint64_t)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(unint64_t)a3
{
  self->_maxWidth = a3;
}

- (unint64_t)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(unint64_t)a3
{
  self->_maxHeight = a3;
}

@end