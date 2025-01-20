@interface HMDNetworkRouterAccessViolationControlOperation
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDNetworkRouterAccessViolationControlOperation)init;
- (HMDNetworkRouterAccessViolationControlOperation)initWithOperation:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)operation;
- (void)setOperation:(int64_t)a3;
@end

@implementation HMDNetworkRouterAccessViolationControlOperation

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
  int64_t v3 = [(HMDNetworkRouterAccessViolationControlOperation *)self operation];
  if (v3 == 1)
  {
    v4 = @"HMDNetworkRouterAccessViolationControlOperationTypeList";
  }
  else if (v3 == 2)
  {
    v4 = @"HMDNetworkRouterAccessViolationControlOperationTypeReset";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDNetworkRouterAccessViolationControlOperationType %ld", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [v2 stringWithFormat:@"<HMDNetworkRouterAccessViolationControlOperation operation=%@>", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDNetworkRouterAccessViolationControlOperation *)a3;
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
      int64_t v6 = [(HMDNetworkRouterAccessViolationControlOperation *)self operation];
      uint64_t v7 = [(HMDNetworkRouterAccessViolationControlOperation *)v5 operation];

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
  v4 = +[HMDNetworkRouterAccessViolationControlOperation allocWithZone:a3];
  int64_t v5 = [(HMDNetworkRouterAccessViolationControlOperation *)self operation];
  return [(HMDNetworkRouterAccessViolationControlOperation *)v4 initWithOperation:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDNetworkRouterAccessViolationControlOperation *)self operation];
  return (id)MEMORY[0x270F18D88](v3);
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
    [(HMDNetworkRouterAccessViolationControlOperation *)self setOperation:HAPTLVParseUInt64()];
    goto LABEL_7;
  }
  [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];
  BOOL v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (HMDNetworkRouterAccessViolationControlOperation)initWithOperation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDNetworkRouterAccessViolationControlOperation;
  result = [(HMDNetworkRouterAccessViolationControlOperation *)&v5 init];
  if (result) {
    result->_operation = a3;
  }
  return result;
}

- (HMDNetworkRouterAccessViolationControlOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDNetworkRouterAccessViolationControlOperation;
  result = [(HMDNetworkRouterAccessViolationControlOperation *)&v3 init];
  if (result) {
    result->_operation = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDNetworkRouterAccessViolationControlOperation);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDNetworkRouterAccessViolationControlOperation *)v6 parseFromData:v5 error:&v10];
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