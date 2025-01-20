@interface DMFFetchOSUpdateStatusResultObject
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForStatus:(unint64_t)a3;
- (DMFFetchOSUpdateStatusResultObject)initWithCoder:(id)a3;
- (DMFFetchOSUpdateStatusResultObject)initWithProductKey:(id)a3 status:(unint64_t)a4 downloadPercentComplete:(double)a5;
- (NSString)productKey;
- (double)downloadPercentComplete;
- (id)description;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setDownloadPercentComplete:(double)a3;
- (void)setProductKey:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation DMFFetchOSUpdateStatusResultObject

- (DMFFetchOSUpdateStatusResultObject)initWithProductKey:(id)a3 status:(unint64_t)a4 downloadPercentComplete:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  v9 = [(CATTaskResultObject *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    productKey = v9->_productKey;
    v9->_productKey = (NSString *)v10;

    v9->_status = a4;
    v9->_downloadPercentComplete = a5;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchOSUpdateStatusResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"productKey"];
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = [v9 unsignedIntegerValue];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadPercentComplete"];
    [v10 doubleValue];
    v5->_downloadPercentComplete = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v9 encodeWithCoder:v4];
  v5 = [(DMFFetchOSUpdateStatusResultObject *)self productKey];
  [v4 encodeObject:v5 forKey:@"productKey"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFFetchOSUpdateStatusResultObject status](self, "status"));
  [v4 encodeObject:v6 forKey:@"status"];

  uint64_t v7 = NSNumber;
  [(DMFFetchOSUpdateStatusResultObject *)self downloadPercentComplete];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 encodeObject:v8 forKey:@"downloadPercentComplete"];
}

+ (id)descriptionForStatus:(unint64_t)a3
{
  v3 = @"idle";
  if (a3 == 1) {
    v3 = @"downloading";
  }
  if (a3 == 2) {
    return @"installing";
  }
  else {
    return v3;
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  uint64_t v4 = [(DMFFetchOSUpdateStatusResultObject *)self productKey];
  v5 = (void *)v4;
  v6 = @"None";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  [v3 appendFormat:@"\tProduct Key               : “%@”\n", v6];

  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "descriptionForStatus:", -[DMFFetchOSUpdateStatusResultObject status](self, "status"));
  [v3 appendFormat:@"\tStatus                    : %@\n", v7];

  [(DMFFetchOSUpdateStatusResultObject *)self downloadPercentComplete];
  objc_msgSend(v3, "appendFormat:", @"\tDownload Percent Complete : %.0f%%\n", v8 * 100.0);
  [v3 appendString:@"}>"];
  objc_super v9 = (void *)[v3 copy];

  return v9;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (void)setProductKey:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (double)downloadPercentComplete
{
  return self->_downloadPercentComplete;
}

- (void)setDownloadPercentComplete:(double)a3
{
  self->_downloadPercentComplete = a3;
}

- (void).cxx_destruct
{
}

@end