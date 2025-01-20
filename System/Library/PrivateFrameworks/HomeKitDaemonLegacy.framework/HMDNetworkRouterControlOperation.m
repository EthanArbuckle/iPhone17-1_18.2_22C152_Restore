@interface HMDNetworkRouterControlOperation
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterControlOperation)init;
- (HMDNetworkRouterControlOperation)initWithOperation:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)operation;
- (void)setOperation:(int64_t)a3;
@end

@implementation HMDNetworkRouterControlOperation

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (NSString)description
{
  v2 = NSString;
  int64_t v3 = [(HMDNetworkRouterControlOperation *)self operation];
  if ((unint64_t)(v3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDNetworkRouterControlOperationType %ld", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E6A0EAB8[v3 - 1];
  }
  v5 = [v2 stringWithFormat:@"<HMDNetworkRouterControlOperation operation=%@>", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterControlOperation *)a3;
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
      int64_t v6 = [(HMDNetworkRouterControlOperation *)self operation];
      uint64_t v7 = [(HMDNetworkRouterControlOperation *)v5 operation];

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
  v4 = +[HMDNetworkRouterControlOperation allocWithZone:a3];
  int64_t v5 = [(HMDNetworkRouterControlOperation *)self operation];
  return [(HMDNetworkRouterControlOperation *)v4 initWithOperation:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDNetworkRouterControlOperation *)self operation];
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
    [(HMDNetworkRouterControlOperation *)self setOperation:HAPTLVParseUInt64()];
    goto LABEL_7;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (HMDNetworkRouterControlOperation)initWithOperation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterControlOperation;
  result = [(HMDNetworkRouterControlOperation *)&v5 init];
  if (result) {
    result->_operation = a3;
  }
  return result;
}

- (HMDNetworkRouterControlOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterControlOperation;
  result = [(HMDNetworkRouterControlOperation *)&v3 init];
  if (result) {
    result->_operation = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterControlOperation);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterControlOperation *)v6 parseFromData:v5 error:&v10];
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