@interface DMFFetchScreenshotResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchScreenshotResultObject)initWithCoder:(id)a3;
- (DMFFetchScreenshotResultObject)initWithData:(id)a3;
- (NSData)screenshotData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchScreenshotResultObject

- (DMFFetchScreenshotResultObject)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchScreenshotResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchScreenshotResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchScreenshotResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"screenshotData"];
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchScreenshotResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchScreenshotResultObject *)self screenshotData];
  [v4 encodeObject:v5 forKey:@"screenshotData"];
}

- (NSData)screenshotData
{
  return self->_screenshotData;
}

- (void).cxx_destruct
{
}

@end