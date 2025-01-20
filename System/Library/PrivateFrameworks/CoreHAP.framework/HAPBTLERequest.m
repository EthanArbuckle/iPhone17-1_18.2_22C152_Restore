@interface HAPBTLERequest
- (BOOL)isEncrypted;
- (BOOL)isFinished;
- (HAPBTLEControlOutputStream)controlOutputStream;
- (HAPBTLERequest)init;
- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7;
- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6;
- (HAPBTLETransactionIdentifier)identifier;
- (HAPCharacteristic)characteristic;
- (HAPService)service;
- (HMFBlockOperation)operation;
- (HMFTimer)responseTimer;
- (NSData)body;
- (double)timeoutInterval;
- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7;
- (id)_serializeHeader;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)serialize;
- (id)shortDescription;
- (unsigned)type;
- (void)cancelWithError:(id)a3;
- (void)setControlOutputStream:(id)a3;
- (void)setOperation:(id)a3;
- (void)setResponseTimer:(id)a3;
@end

@implementation HAPBTLERequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_controlOutputStream, 0);
  objc_destroyWeak((id *)&self->_operation);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setResponseTimer:(id)a3
{
}

- (HMFTimer)responseTimer
{
  return self->_responseTimer;
}

- (void)setControlOutputStream:(id)a3
{
}

- (HAPBTLEControlOutputStream)controlOutputStream
{
  return self->_controlOutputStream;
}

- (void)setOperation:(id)a3
{
}

- (HMFBlockOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);

  return (HMFBlockOperation *)WeakRetained;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSData)body
{
  return self->_body;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (HAPService)service
{
  return self->_service;
}

- (unsigned)type
{
  return self->_type;
}

- (HAPBTLETransactionIdentifier)identifier
{
  return self->_identifier;
}

- (id)_serializeHeader
{
  v3 = [MEMORY[0x1E4F1CA58] dataWithCapacity:6];
  unsigned __int8 v23 = [(HAPBTLERequest *)self type];
  [v3 appendBytes:&v23 length:1];
  v4 = [(HAPBTLERequest *)self identifier];
  char v5 = [v4 unsignedCharValue];

  char v22 = v5;
  [v3 appendBytes:&v22 length:1];
  if ([(HAPBTLERequest *)self type] == 6 || [(HAPBTLERequest *)self type] == 8)
  {
    v6 = [(HAPBTLERequest *)self service];
    v7 = [v6 instanceID];
    __int16 v8 = [v7 unsignedShortValue];

    __int16 v21 = v8;
    [v3 appendBytes:&v21 length:2];
  }
  else
  {
    v9 = [(HAPBTLERequest *)self characteristic];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 instanceID];
      __int16 v12 = [v11 unsignedShortValue];
    }
    else
    {
      __int16 v12 = 0;
    }
    __int16 v20 = v12;
    [v3 appendBytes:&v20 length:2];
  }
  v13 = [(HAPBTLERequest *)self body];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    v15 = [(HAPBTLERequest *)self body];
    __int16 v16 = [v15 length];

    __int16 v19 = v16;
    [v3 appendBytes:&v19 length:2];
  }
  v17 = (void *)[v3 copy];

  return v17;
}

- (id)serialize
{
  if ([(HAPBTLERequest *)self type] == 255)
  {
    v7 = [(HAPBTLERequest *)self body];
    v4 = (void *)[v7 mutableCopy];
  }
  else
  {
    v3 = [(HAPBTLERequest *)self _serializeHeader];
    v4 = (void *)[v3 mutableCopy];

    char v5 = [(HAPBTLERequest *)self body];
    uint64_t v6 = [v5 length];

    if (!v6) {
      goto LABEL_6;
    }
    v7 = [(HAPBTLERequest *)self body];
    [v4 appendData:v7];
  }

LABEL_6:

  return v4;
}

- (void)cancelWithError:(id)a3
{
  id v6 = a3;
  if (![(HAPBTLERequest *)self isFinished])
  {
    v4 = [(HAPBTLERequest *)self operation];
    [v4 cancelWithError:v6];

    char v5 = [(HAPBTLERequest *)self responseTimer];
    [v5 suspend];
  }
}

- (id)description
{
  return [(HAPBTLERequest *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HAPBTLERequest *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  __int16 v19 = NSString;
  char v5 = [(HAPBTLERequest *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_1F2C4E778;
  }
  unsigned __int8 v7 = [(HAPBTLERequest *)self type] + 1;
  if (v7 > 9u) {
    __int16 v8 = @"unknown";
  }
  else {
    __int16 v8 = off_1E69F2748[v7];
  }
  [(HAPBTLERequest *)self timeoutInterval];
  uint64_t v10 = v9;
  if ([(HAPBTLERequest *)self isEncrypted]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  __int16 v12 = [(HAPBTLERequest *)self identifier];
  v13 = [(HAPBTLERequest *)self body];
  uint64_t v14 = [v13 length];
  v15 = [(HAPBTLERequest *)self characteristic];
  __int16 v16 = [v15 shortDescription];
  v17 = [v19 stringWithFormat:@"<%@%@, Type = %@, Timeout = %f, Encrypted = %@, Request Identifier = %@, Body Length = %tu, Characteristic = %@>", v5, v6, v8, v10, v11, v12, v14, v16];

  if (v3) {

  }
  return v17;
}

- (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HAPBTLERequest)initWithRequestType:(unsigned __int8)a3 bodyData:(id)a4 shouldEncrypt:(BOOL)a5 timeoutInterval:(double)a6
{
  return (HAPBTLERequest *)[(HAPBTLERequest *)self _initWithCharacteristic:0 requestType:a3 bodyData:a4 shouldEncrypt:a5 timeoutInterval:a6];
}

- (HAPBTLERequest)initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  BOOL v8 = a6;
  uint64_t v10 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  if (v12)
  {
    self = (HAPBTLERequest *)[(HAPBTLERequest *)self _initWithCharacteristic:v12 requestType:v10 bodyData:v13 shouldEncrypt:v8 timeoutInterval:a7];
    uint64_t v14 = self;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D944E080]();
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v17;
      _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] A characteristic is required", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_initWithCharacteristic:(id)a3 requestType:(unsigned __int8)a4 bodyData:(id)a5 shouldEncrypt:(BOOL)a6 timeoutInterval:(double)a7
{
  int v10 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  v15 = v14;
  if (v10)
  {
    if (a7 <= 0.0)
    {
      __int16 v16 = (void *)MEMORY[0x1D944E080]();
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        int v19 = "%{public}@[HAPBTLERequest] A timeout > 0 is required";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    if ((unint64_t)[v14 length] >= 0x10000)
    {
      __int16 v16 = (void *)MEMORY[0x1D944E080]();
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v32 = v18;
        int v19 = "%{public}@[HAPBTLERequest] The body length must not exceed 64KB";
LABEL_10:
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
    v30.receiver = self;
    v30.super_class = (Class)HAPBTLERequest;
    char v22 = [(HAPBTLERequest *)&v30 init];
    if (v22)
    {
      uint64_t v23 = [v13 service];
      service = v22->_service;
      v22->_service = (HAPService *)v23;

      objc_storeStrong((id *)&v22->_characteristic, a3);
      v22->_type = v10;
      uint64_t v25 = [v15 copy];
      body = v22->_body;
      v22->_body = (NSData *)v25;

      v22->_encrypted = a6;
      v22->_timeoutInterval = a7;
      if (v10 != 255)
      {
        uint64_t v27 = +[HAPBTLETransactionIdentifier randomTransactionIdentifier];
LABEL_18:
        identifier = v22->_identifier;
        v22->_identifier = (HAPBTLETransactionIdentifier *)v27;

        goto LABEL_19;
      }
      if ((unint64_t)[v15 length] >= 2)
      {
        buf[0] = 0;
        objc_msgSend(v15, "getBytes:range:", buf, 1, 1);
        v28 = [HAPBTLETransactionIdentifier alloc];
        uint64_t v27 = [(HAPBTLETransactionIdentifier *)v28 initWithUnsignedCharValue:buf[0]];
        goto LABEL_18;
      }
    }
LABEL_19:
    self = v22;
    __int16 v20 = self;
    goto LABEL_12;
  }
  __int16 v16 = (void *)MEMORY[0x1D944E080]();
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v32 = v18;
    int v19 = "%{public}@[HAPBTLERequest] A request type is required";
    goto LABEL_10;
  }
LABEL_11:

  __int16 v20 = 0;
LABEL_12:

  return v20;
}

- (HAPBTLERequest)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  char v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end