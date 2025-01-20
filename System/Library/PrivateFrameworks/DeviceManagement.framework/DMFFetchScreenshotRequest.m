@interface DMFFetchScreenshotRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)usesPixels;
- (DMFFetchScreenshotRequest)initWithCoder:(id)a3;
- (NSString)sessionToken;
- (unint64_t)maxHeight;
- (unint64_t)maxWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxHeight:(unint64_t)a3;
- (void)setMaxWidth:(unint64_t)a3;
- (void)setSessionToken:(id)a3;
- (void)setUsesPixels:(BOOL)a3;
@end

@implementation DMFFetchScreenshotRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchScreenshotRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchScreenshotRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidth"];
    v5->_maxWidth = [v6 unsignedIntegerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxHeight"];
    v5->_maxHeight = [v7 unsignedIntegerValue];

    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sessionToken"];
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usesPixels"];
    v5->_usesPixels = [v11 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchScreenshotRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchScreenshotRequest maxWidth](self, "maxWidth", v9.receiver, v9.super_class));
  [v4 encodeObject:v5 forKey:@"maxWidth"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[DMFFetchScreenshotRequest maxHeight](self, "maxHeight"));
  [v4 encodeObject:v6 forKey:@"maxHeight"];

  v7 = [(DMFFetchScreenshotRequest *)self sessionToken];
  [v4 encodeObject:v7 forKey:@"sessionToken"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchScreenshotRequest usesPixels](self, "usesPixels"));
  [v4 encodeObject:v8 forKey:@"usesPixels"];
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

- (BOOL)usesPixels
{
  return self->_usesPixels;
}

- (void)setUsesPixels:(BOOL)a3
{
  self->_usesPixels = a3;
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end