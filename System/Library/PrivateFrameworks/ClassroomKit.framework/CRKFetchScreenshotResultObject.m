@interface CRKFetchScreenshotResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchScreenshotResultObject)initWithCoder:(id)a3;
- (NSData)screenshotData;
- (NSString)studentIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setScreenshotData:(id)a3;
- (void)setStudentIdentifier:(id)a3;
@end

@implementation CRKFetchScreenshotResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchScreenshotResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchScreenshotResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"screenshotData"];
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"studentIdentifier"];
    studentIdentifier = v5->_studentIdentifier;
    v5->_studentIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKFetchScreenshotResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKFetchScreenshotResultObject *)self screenshotData];
  [v4 encodeObject:v5 forKey:@"screenshotData"];

  v6 = [(CRKFetchScreenshotResultObject *)self studentIdentifier];
  [v4 encodeObject:v6 forKey:@"studentIdentifier"];
}

- (NSData)screenshotData
{
  return self->_screenshotData;
}

- (void)setScreenshotData:(id)a3
{
}

- (NSString)studentIdentifier
{
  return self->_studentIdentifier;
}

- (void)setStudentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentIdentifier, 0);

  objc_storeStrong((id *)&self->_screenshotData, 0);
}

@end