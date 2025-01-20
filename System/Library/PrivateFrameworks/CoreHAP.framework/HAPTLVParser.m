@interface HAPTLVParser
+ (id)parserWithData:(id)a3;
- (HAPTLVParser)initWithData:(id)a3;
- (id)parseResponseForArray:(unint64_t)a3;
- (id)parseResponseForData:(unint64_t)a3;
- (id)parseResponseForNumber:(unint64_t)a3;
- (id)parseResponseForString:(unint64_t)a3;
- (id)parseResponseForUInt16:(unint64_t)a3;
- (id)parseResponseForUInt8:(unint64_t)a3;
- (id)parseResponseForUUID:(unint64_t)a3;
@end

@implementation HAPTLVParser

- (void).cxx_destruct
{
}

- (id)parseResponseForArray:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  v5 = [MEMORY[0x1E4F1CA48] array];
  while (1)
  {
    int v6 = TLV8Get();
    if (v6) {
      break;
    }
    v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
    [v5 addObject:v7];
  }
  if (!v5)
  {
    int v8 = v6;
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    v10 = (void *)[v9 initWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v16 = v13;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse array for TLV: %tu %@", buf, 0x20u);
    }
  }

  return v5;
}

- (id)parseResponseForUUID:(unint64_t)a3
{
  v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length]) {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)parseResponseForString:(unint64_t)a3
{
  v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if (v3) {
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)parseResponseForUInt16:(unint64_t)a3
{
  v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length] == 2)
  {
    v4 = (unsigned __int16 *)[v3 bytes];
    v5 = [NSNumber numberWithUnsignedInteger:*v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)parseResponseForUInt8:(unint64_t)a3
{
  v3 = [(HAPTLVParser *)self parseResponseForData:a3];
  if ([v3 length] == 1)
  {
    v4 = (unsigned __int8 *)[v3 bytes];
    v5 = [NSNumber numberWithUnsignedInteger:*v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)parseResponseForNumber:(unint64_t)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  v4 = [NSNumber numberWithLongLong:TLV8GetUInt64()];

  return v4;
}

- (id)parseResponseForData:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSData *)self->_tlvData bytes];
  [(NSData *)self->_tlvData length];
  int v5 = TLV8Get();
  if (v5)
  {
    int v6 = v5;
    id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v8 = (void *)[v7 initWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
    id v9 = (void *)MEMORY[0x1D944E080]();
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse data for TLV: %tu %@", buf, 0x20u);
    }

    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:0 length:0];
  }

  return v12;
}

- (HAPTLVParser)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVParser;
  int v6 = [(HAPTLVParser *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tlvData, a3);
  }

  return v7;
}

+ (id)parserWithData:(id)a3
{
  id v3 = a3;
  v4 = [[HAPTLVParser alloc] initWithData:v3];

  return v4;
}

@end