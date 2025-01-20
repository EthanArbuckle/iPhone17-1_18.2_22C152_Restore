@interface HMDNetworkRouterControlOperationStatus
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterControlOperationStatus)init;
- (HMDNetworkRouterControlOperationStatus)initWithStatus:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)status;
- (void)setStatus:(int64_t)a3;
@end

@implementation HMDNetworkRouterControlOperationStatus

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)description
{
  v2 = NSString;
  v3 = HMDNetworkRouterControlOperationStatusTypeAsString([(HMDNetworkRouterControlOperationStatus *)self status]);
  v4 = [v2 stringWithFormat:@"<HMDNetworkRouterControlOperationStatus status=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterControlOperationStatus *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(HMDNetworkRouterControlOperationStatus *)self status];
      uint64_t v7 = [(HMDNetworkRouterControlOperationStatus *)v5 status];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDNetworkRouterControlOperationStatus allocWithZone:a3];
  int64_t v5 = [(HMDNetworkRouterControlOperationStatus *)self status];
  return [(HMDNetworkRouterControlOperationStatus *)v4 initWithStatus:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDNetworkRouterControlOperationStatus *)self status];
  return (id)MEMORY[0x1F4113D68](v3);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4)
  {
    if (![v6 length])
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  *a4 = 0;
  if ([v6 length])
  {
LABEL_5:
    id v9 = v7;
    [v9 bytes];
    [v9 length];
    BOOL v8 = 1;
    [(HMDNetworkRouterControlOperationStatus *)self setStatus:HAPTLVParseUInt64()];
    goto LABEL_7;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (HMDNetworkRouterControlOperationStatus)initWithStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterControlOperationStatus;
  result = [(HMDNetworkRouterControlOperationStatus *)&v5 init];
  if (result) {
    result->_status = a3;
  }
  return result;
}

- (HMDNetworkRouterControlOperationStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterControlOperationStatus;
  result = [(HMDNetworkRouterControlOperationStatus *)&v3 init];
  if (result) {
    result->_status = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterControlOperationStatus);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterControlOperationStatus *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }
  return v7;
}

@end