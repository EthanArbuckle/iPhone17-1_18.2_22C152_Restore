@interface CTSMSSendInfoType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSMSSendInfoType)init;
- (CTSMSSendInfoType)initWithCoder:(id)a3;
- (CTSMSSendInfoType)initWithStatusType:(int64_t)a3 error1:(int)a4 error2:(int)a5 delay:(int)a6;
- (NSNumber)error1;
- (NSNumber)error2;
- (NSNumber)recommendedRetryDelayInSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)statusType;
- (void)encodeWithCoder:(id)a3;
- (void)setError1:(id)a3;
- (void)setError2:(id)a3;
- (void)setRecommendedRetryDelayInSeconds:(id)a3;
- (void)setStatusType:(int64_t)a3;
@end

@implementation CTSMSSendInfoType

- (CTSMSSendInfoType)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTSMSSendInfoType;
  v2 = [(CTSMSSendInfoType *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(CTSMSSendInfoType *)v2 setStatusType:3];
    v4 = [NSNumber numberWithInt:0];
    [(CTSMSSendInfoType *)v3 setError1:v4];

    v5 = [NSNumber numberWithInt:0];
    [(CTSMSSendInfoType *)v3 setError2:v5];

    v6 = [NSNumber numberWithInt:0];
    [(CTSMSSendInfoType *)v3 setRecommendedRetryDelayInSeconds:v6];
  }
  return v3;
}

- (CTSMSSendInfoType)initWithStatusType:(int64_t)a3 error1:(int)a4 error2:(int)a5 delay:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v16.receiver = self;
  v16.super_class = (Class)CTSMSSendInfoType;
  v10 = [(CTSMSSendInfoType *)&v16 init];
  v11 = v10;
  if (v10)
  {
    [(CTSMSSendInfoType *)v10 setStatusType:a3];
    v12 = [NSNumber numberWithInt:v8];
    [(CTSMSSendInfoType *)v11 setError1:v12];

    v13 = [NSNumber numberWithInt:v7];
    [(CTSMSSendInfoType *)v11 setError2:v13];

    v14 = [NSNumber numberWithInt:v6];
    [(CTSMSSendInfoType *)v11 setRecommendedRetryDelayInSeconds:v14];
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTSMSSendInfoType *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(CTSMSSendInfoType *)self statusType];
      if (v6 == [(CTSMSSendInfoType *)v5 statusType])
      {
        uint64_t v7 = [(CTSMSSendInfoType *)self error1];
        uint64_t v8 = [(CTSMSSendInfoType *)v5 error1];
        if ([v7 isEqualToNumber:v8])
        {
          v9 = [(CTSMSSendInfoType *)self error2];
          v10 = [(CTSMSSendInfoType *)v5 error2];
          if ([v9 isEqualToNumber:v10])
          {
            v11 = [(CTSMSSendInfoType *)self recommendedRetryDelayInSeconds];
            v12 = [(CTSMSSendInfoType *)v5 recommendedRetryDelayInSeconds];
            char v13 = [v11 isEqualToNumber:v12];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setStatusType:", -[CTSMSSendInfoType statusType](self, "statusType"));
  v5 = [(CTSMSSendInfoType *)self error1];
  [v4 setError1:v5];

  int64_t v6 = [(CTSMSSendInfoType *)self error2];
  [v4 setError2:v6];

  uint64_t v7 = [(CTSMSSendInfoType *)self recommendedRetryDelayInSeconds];
  [v4 setRecommendedRetryDelayInSeconds:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t statusType = self->_statusType;
  id v5 = a3;
  [v5 encodeInt64:statusType forKey:@"status_type"];
  [v5 encodeObject:self->_error1 forKey:@"error1"];
  [v5 encodeObject:self->_error2 forKey:@"error2"];
  [v5 encodeObject:self->_recommendedRetryDelayInSeconds forKey:@"recommended_retry_interval"];
}

- (CTSMSSendInfoType)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSMSSendInfoType;
  id v5 = [(CTSMSSendInfoType *)&v13 init];
  if (v5)
  {
    v5->_int64_t statusType = [v4 decodeInt64ForKey:@"status_type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error1"];
    error1 = v5->_error1;
    v5->_error1 = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error2"];
    error2 = v5->_error2;
    v5->_error2 = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommended_retry_interval"];
    recommendedRetryDelayInSeconds = v5->_recommendedRetryDelayInSeconds;
    v5->_recommendedRetryDelayInSeconds = (NSNumber *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)error1
{
  return self->_error1;
}

- (void)setError1:(id)a3
{
}

- (NSNumber)error2
{
  return self->_error2;
}

- (void)setError2:(id)a3
{
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(int64_t)a3
{
  self->_int64_t statusType = a3;
}

- (NSNumber)recommendedRetryDelayInSeconds
{
  return self->_recommendedRetryDelayInSeconds;
}

- (void)setRecommendedRetryDelayInSeconds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedRetryDelayInSeconds, 0);
  objc_storeStrong((id *)&self->_error2, 0);

  objc_storeStrong((id *)&self->_error1, 0);
}

@end