@interface HDHRSExtractionFailureRecord
+ (BOOL)supportsSecureCoding;
+ (id)extractionFailureRecordWithCode:(int64_t)a3 propertyName:(id)a4 resourceKeyPath:(id)a5;
- (HDHRSExtractionFailureRecord)initWithCoder:(id)a3;
- (NSString)internalDisplaySafeDescription;
- (NSString)propertyName;
- (NSString)resourceKeyPath;
- (id)description;
- (int64_t)failureCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDHRSExtractionFailureRecord

+ (id)extractionFailureRecordWithCode:(int64_t)a3 propertyName:(id)a4 resourceKeyPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = v10;
  if (v10)
  {
    v10[1] = a3;
    uint64_t v12 = [v8 copy];
    v13 = (void *)v11[2];
    v11[2] = v12;

    uint64_t v14 = [v9 copy];
    v15 = (void *)v11[3];
    v11[3] = v14;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHRSExtractionFailureRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"FailureCode"])
  {
    v12.receiver = self;
    v12.super_class = (Class)HDHRSExtractionFailureRecord;
    v5 = [(HDHRSExtractionFailureRecord *)&v12 init];
    if (v5)
    {
      v5->_failureCode = [v4 decodeIntegerForKey:@"FailureCode"];
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PropertyName"];
      propertyName = v5->_propertyName;
      v5->_propertyName = (NSString *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResourceKeyPath"];
      resourceKeyPath = v5->_resourceKeyPath;
      v5->_resourceKeyPath = (NSString *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t failureCode = self->_failureCode;
  id v5 = a3;
  [v5 encodeInteger:failureCode forKey:@"FailureCode"];
  [v5 encodeObject:self->_propertyName forKey:@"PropertyName"];
  [v5 encodeObject:self->_resourceKeyPath forKey:@"ResourceKeyPath"];
}

- (NSString)internalDisplaySafeDescription
{
  v3 = NSStringFromHDClinicalAnalyticsExtractionFailureCode(self->_failureCode);
  id v4 = [MEMORY[0x263EFF980] arrayWithObject:v3];
  if (self->_propertyName)
  {
    id v5 = [NSString stringWithFormat:@" for %@", self->_propertyName];
    [v4 addObject:v5];
  }
  if (self->_resourceKeyPath)
  {
    uint64_t v6 = [NSString stringWithFormat:@" from %@", self->_resourceKeyPath];
    [v4 addObject:v6];
  }
  v7 = [v4 componentsJoinedByString:&stru_26D44DC88];

  return (NSString *)v7;
}

- (id)description
{
  v2 = NSString;
  propertyName = self->_propertyName;
  resourceKeyPath = self->_resourceKeyPath;
  id v5 = NSStringFromHDClinicalAnalyticsExtractionFailureCode(self->_failureCode);
  uint64_t v6 = [v2 stringWithFormat:@"%@ → %@, reason: %@", resourceKeyPath, propertyName, v5];

  return v6;
}

- (int64_t)failureCode
{
  return self->_failureCode;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)resourceKeyPath
{
  return self->_resourceKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceKeyPath, 0);

  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end