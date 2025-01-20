@interface CRKFetchMeCardResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchMeCardResultObject)initWithCoder:(id)a3;
- (NSDictionary)cardInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setCardInfo:(id)a3;
@end

@implementation CRKFetchMeCardResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchMeCardResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchMeCardResultObject;
  v5 = [(CATTaskResultObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"cardInfo"];
    cardInfo = v5->_cardInfo;
    v5->_cardInfo = (NSDictionary *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchMeCardResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchMeCardResultObject *)self cardInfo];
  [v4 encodeObject:v5 forKey:@"cardInfo"];
}

- (NSDictionary)cardInfo
{
  return self->_cardInfo;
}

- (void)setCardInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end