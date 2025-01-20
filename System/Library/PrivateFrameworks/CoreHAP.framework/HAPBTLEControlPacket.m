@interface HAPBTLEControlPacket
+ (id)packetWithSerializedData:(id)a3 error:(id *)a4;
+ (id)shortDescription;
- (BOOL)isContinuationPacket;
- (HAPBTLEControlPacket)init;
- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7;
- (HAPBTLETransactionIdentifier)transactionIdentifier;
- (NSData)payload;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)serialize;
- (id)shortDescription;
- (unsigned)type;
@end

@implementation HAPBTLEControlPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

- (BOOL)isContinuationPacket
{
  return self->_continuationPacket;
}

- (NSData)payload
{
  return self->_payload;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (id)serialize
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = [(HAPBTLEControlPacket *)self type];
  v4 = [(HAPBTLEControlPacket *)self transactionIdentifier];
  uint8_t v5 = [v4 unsignedCharValue];
  BOOL v6 = [(HAPBTLEControlPacket *)self isContinuationPacket];
  buf[0] = v5;
  v7 = [MEMORY[0x1E4F1CA58] dataWithCapacity:2];
  v8 = v7;
  char v9 = 2 * v3;
  if (v6) {
    char v9 = (2 * v3) | 0x80;
  }
  char v18 = v9;
  [v7 appendBytes:&v18 length:1];
  if (v6) {
    [v8 appendBytes:buf length:1];
  }

  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
    v11 = [(HAPBTLEControlPacket *)self payload];
    [v10 appendData:v11];

    v12 = (void *)[v10 copy];
  }
  else
  {
    v13 = (void *)MEMORY[0x1D944E080]();
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [(HAPBTLEControlPacket *)self shortDescription];
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      uint64_t v24 = 0;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control header with error: %@", buf, 0x20u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return [(HAPBTLEControlPacket *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HAPBTLEControlPacket *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  uint8_t v5 = NSString;
  BOOL v6 = [(HAPBTLEControlPacket *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1F2C4E778;
  }
  int v8 = [(HAPBTLEControlPacket *)self type];
  char v9 = @"unknown";
  if (v8 == 1) {
    char v9 = @"response";
  }
  if (!v8) {
    char v9 = @"request";
  }
  v10 = v9;
  v11 = [(HAPBTLEControlPacket *)self transactionIdentifier];
  unsigned int v12 = [v11 unsignedCharValue];
  v13 = [(HAPBTLEControlPacket *)self payload];
  v14 = [v5 stringWithFormat:@"<%@%@, Type = %@, Transaction Identifier = 0x%02x, Payload Length = %tu>", v6, v7, v10, v12, objc_msgSend(v13, "length")];

  if (v3) {

  }
  return v14;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (HAPBTLEControlPacket)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 continuationPacket:(BOOL)a5 packetPayload:(id)a6 maximumLength:(unint64_t)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HAPBTLEControlPacket;
  v15 = [(HAPBTLEControlPacket *)&v28 init];
  v16 = v15;
  if (!v15)
  {
LABEL_12:
    uint64_t v24 = v16;
    goto LABEL_13;
  }
  v15->_type = a3;
  objc_storeStrong((id *)&v15->_transactionIdentifier, a4);
  v16->_continuationPacket = v9;
  if (v9) {
    unint64_t v17 = 2;
  }
  else {
    unint64_t v17 = 1;
  }
  BOOL v18 = a7 >= v17;
  unint64_t v19 = a7 - v17;
  if (v18)
  {
    if ([v14 length] < v19) {
      unint64_t v19 = [v14 length];
    }
    uint64_t v25 = objc_msgSend(v14, "subdataWithRange:", 0, v19);
    payload = v16->_payload;
    v16->_payload = (NSData *)v25;

    goto LABEL_12;
  }
  v20 = (void *)MEMORY[0x1D944E080]();
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = HMFGetLogIdentifier();
    __int16 v23 = [(HAPBTLEControlPacket *)v16 shortDescription];
    *(_DWORD *)buf = 138543874;
    v30 = v22;
    __int16 v31 = 2112;
    v32 = v23;
    __int16 v33 = 2048;
    unint64_t v34 = v17;
    _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_ERROR, "%{public}@[%@] The maximum packet length must be greater than the header length: %tu", buf, 0x20u);
  }
  uint64_t v24 = 0;
LABEL_13:

  return v24;
}

- (HAPBTLEControlPacket)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  uint8_t v5 = NSStringFromSelector(a2);
  BOOL v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)packetWithSerializedData:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    int v8 = @"The control field length is invalid.";
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v5, "getBytes:range:", buf, 0, 1);
  unsigned int v6 = buf[0];
  if (buf[0])
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    int v8 = @"Invalid control field version.";
    goto LABEL_7;
  }
  if ((buf[0] & 0x70) != 0)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    int v8 = @"Reserved bits must be zero.";
LABEL_7:
    id v9 = [v7 hapErrorWithCode:9 description:@"Failed to parse control field." reason:v8 suggestion:0 underlyingError:0];
LABEL_8:
    uint64_t v10 = 0;
LABEL_9:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = (buf[0] >> 1) & 7;
  if (v10 > 1)
  {
    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid control type: %u.", (buf[0] >> 1) & 7);
    id v9 = [v23 hapErrorWithCode:9 description:@"Failed to parse control field." reason:v24 suggestion:0 underlyingError:0];

    goto LABEL_8;
  }
  if ((buf[0] & 0x80) != 0)
  {
    if ((unint64_t)[v5 length] <= 1)
    {
      id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to parse control field." reason:@"The control field length is invalid for a continuation payload." suggestion:0 underlyingError:0];
      goto LABEL_9;
    }
    unsigned __int8 v25 = 0;
    objc_msgSend(v5, "getBytes:range:", &v25, 1, 1);
    uint64_t v12 = v25;
    uint64_t v13 = 2;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 1;
  }
  id v9 = 0;
  uint64_t v11 = v6 >> 7;
LABEL_10:

  id v14 = v9;
  if (v13)
  {
    v15 = [[HAPBTLETransactionIdentifier alloc] initWithUnsignedCharValue:v12];
    v16 = objc_msgSend(v5, "subdataWithRange:", v13, objc_msgSend(v5, "length") - v13);
    unint64_t v17 = [[HAPBTLEControlPacket alloc] initWithControlType:v10 transactionIdentifier:v15 continuationPacket:v11 packetPayload:v16 maximumLength:-1];
  }
  else
  {
    BOOL v18 = (void *)MEMORY[0x1D944E080]();
    unint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      __int16 v21 = +[HAPBTLEControlPacket shortDescription];
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse control field with error: %@", buf, 0x20u);
    }
    unint64_t v17 = 0;
    if (a4) {
      *a4 = v14;
    }
  }

  return v17;
}

@end