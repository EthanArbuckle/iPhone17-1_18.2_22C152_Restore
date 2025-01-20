@interface CRKFetchInternetDateResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchInternetDateResultObject)initWithCoder:(id)a3;
- (NSDate)date;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation CRKFetchInternetDateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchInternetDateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchInternetDateResultObject *)self date];
  [v4 encodeObject:v5 forKey:@"date"];
}

- (CRKFetchInternetDateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchInternetDateResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v7;
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end