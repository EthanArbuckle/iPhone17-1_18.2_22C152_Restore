@interface HAPFragmentationPacket
- (BOOL)isEqual:(id)a3;
- (HAPFragmentationPacket)init;
- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6;
- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3;
- (NSData)data;
- (id)debugDescription;
- (id)description;
- (id)serialize;
- (id)shortDescription;
- (unint64_t)hash;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)transactionIdentifier;
@end

@implementation HAPFragmentationPacket

- (void).cxx_destruct
{
}

- (NSData)data
{
  return self->_data;
}

- (unsigned)offset
{
  return self->_offset;
}

- (unsigned)length
{
  return self->_length;
}

- (unsigned)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (id)serialize
{
  LOWORD(v9) = [(HAPFragmentationPacket *)self transactionIdentifier];
  *(_DWORD *)((char *)&v9 + 2) = [(HAPFragmentationPacket *)self length];
  *(_DWORD *)((char *)&v9 + 6) = [(HAPFragmentationPacket *)self offset];
  uint64_t v10 = v9;
  int v11 = WORD4(v9);
  v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:12];
  v4 = (void *)MEMORY[0x1E4F1CA58];
  v5 = [(HAPFragmentationPacket *)self data];
  v6 = objc_msgSend(v4, "dataWithCapacity:", objc_msgSend(v5, "length") + 12);

  [v6 appendData:v3];
  v7 = [(HAPFragmentationPacket *)self data];
  [v6 appendData:v7];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPFragmentationPacket *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(HAPFragmentationPacket *)self transactionIdentifier];
      BOOL v8 = 0;
      if (v6 == [(HAPFragmentationPacket *)v5 transactionIdentifier])
      {
        unsigned int v7 = [(HAPFragmentationPacket *)self offset];
        if (v7 == [(HAPFragmentationPacket *)v5 offset]) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int v3 = [(HAPFragmentationPacket *)self transactionIdentifier];
  return [(HAPFragmentationPacket *)self offset] ^ v3;
}

- (id)description
{
  int v3 = NSString;
  v4 = [(HAPFragmentationPacket *)self shortDescription];
  unsigned int v5 = [(HAPFragmentationPacket *)self transactionIdentifier];
  uint64_t v6 = [(HAPFragmentationPacket *)self length];
  uint64_t v7 = [(HAPFragmentationPacket *)self offset];
  BOOL v8 = [(HAPFragmentationPacket *)self data];
  long long v9 = [v3 stringWithFormat:@"<%@, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>", v4, v5, v6, v7, objc_msgSend(v8, "length")];

  return v9;
}

- (id)debugDescription
{
  int v3 = NSString;
  v4 = [(HAPFragmentationPacket *)self shortDescription];
  unsigned int v5 = [(HAPFragmentationPacket *)self transactionIdentifier];
  uint64_t v6 = [(HAPFragmentationPacket *)self length];
  uint64_t v7 = [(HAPFragmentationPacket *)self offset];
  BOOL v8 = [(HAPFragmentationPacket *)self data];
  long long v9 = [v3 stringWithFormat:@"<%@ %p, Transaction Identifier = %u, Transaction Length = %u, Offset = %u, Data Length = %tu>", v4, self, v5, v6, v7, objc_msgSend(v8, "length")];

  return v9;
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%@", objc_opt_class()];
}

- (HAPFragmentationPacket)initWithData:(id)a3 transactionIdentifier:(unsigned __int16)a4 length:(unsigned int)a5 offset:(unsigned int)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HAPFragmentationPacket;
  v12 = [(HAPFragmentationPacket *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    v13->_transactionIdentifier = a4;
    v13->_length = a5;
    v13->_offset = a6;
  }

  return v13;
}

- (HAPFragmentationPacket)initWithFragmentedPacketData:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = v4;
  if (!v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v8;
      long long v9 = "%{public}@[HAPFragmentationPacket] Invalid parameter 'data'";
      uint64_t v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_7;
    }
LABEL_8:

    v12 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)[v4 length] <= 0xB)
  {
    uint64_t v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v8;
      __int16 v35 = 2048;
      uint64_t v36 = 12;
      long long v9 = "%{public}@[HAPFragmentationPacket] Fragmented data must have a length of at least %lu bytes";
      uint64_t v10 = v7;
      uint32_t v11 = 22;
LABEL_7:
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v13 = v5;
  memset(v30, 0, 12);
  if ((unint64_t)[v13 length] <= 0xB)
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid serialized data length %tu", objc_msgSend(v13, "length"));
    v20 = (void *)MEMORY[0x1D944E080]();
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v22;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v19;
      _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPFragmentationPacket] %@", buf, 0x16u);
    }
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32 = v19;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v25 = [v23 errorWithDomain:@"HAPErrorDomain" code:-6743 userInfo:v24];

    id v18 = v25;
    v26 = (void *)MEMORY[0x1D944E080]();
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v18;
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationPacket] Failed to deserialize packet header with error: %@", buf, 0x16u);
    }
    v12 = 0;
  }
  else
  {
    [v13 getBytes:v30 length:12];
    uint64_t v14 = LOWORD(v30[0]);
    uint64_t v15 = *(unsigned int *)((char *)v30 + 2);
    uint64_t v16 = *(unsigned int *)((char *)v30 + 6);

    v17 = objc_msgSend(v13, "subdataWithRange:", 12, objc_msgSend(v13, "length") - 12);
    self = [(HAPFragmentationPacket *)self initWithData:v17 transactionIdentifier:v14 length:v15 offset:v16];

    id v18 = 0;
    v12 = self;
  }

LABEL_17:
  return v12;
}

- (HAPFragmentationPacket)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unsigned int v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end