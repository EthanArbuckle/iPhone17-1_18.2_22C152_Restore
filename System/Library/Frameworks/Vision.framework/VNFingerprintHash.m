@interface VNFingerprintHash
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)BOOLeanBytesData;
- (NSData)hashData;
- (NSString)hashString;
- (VNFingerprintHash)initWithBooleanBytes:(const char *)a3 length:(unint64_t)a4;
- (VNFingerprintHash)initWithBooleanBytesData:(id)a3;
- (VNFingerprintHash)initWithCoder:(id)a3;
- (VNFingerprintHash)initWithHashData:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFingerprintHash

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashData_DO_NOT_DIRECTLY_ACCESS, 0);

  objc_storeStrong((id *)&self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS, 0);
}

- (VNFingerprintHash)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bits"];

  if (v5)
  {
    self = [(VNFingerprintHash *)self initWithHashData:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(VNFingerprintHash *)self hashData];
  [v4 encodeObject:v5 forKey:@"bits"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNFingerprintHash *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(VNFingerprintHash *)self hashData];
      v7 = [(VNFingerprintHash *)v5 hashData];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(VNFingerprintHash *)self hashData];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (VNFingerprintHash)initWithHashData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFingerprintHash;
  id v5 = [(VNFingerprintHash *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hashData_DO_NOT_DIRECTLY_ACCESS = v5->_hashData_DO_NOT_DIRECTLY_ACCESS;
    v5->_hashData_DO_NOT_DIRECTLY_ACCESS = (NSData *)v6;
  }
  return v5;
}

- (VNFingerprintHash)initWithBooleanBytesData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFingerprintHash;
  id v5 = [(VNFingerprintHash *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = v5->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
    v5->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = (NSData *)v6;
  }
  return v5;
}

- (VNFingerprintHash)initWithBooleanBytes:(const char *)a3 length:(unint64_t)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
  uint64_t v6 = [(VNFingerprintHash *)self initWithBooleanBytesData:v5];

  return v6;
}

- (NSString)hashString
{
  v2 = [(VNFingerprintHash *)self hashData];
  uint64_t v3 = [v2 length];
  id v4 = v2;
  id v5 = (unsigned __int8 *)[v4 bytes];
  for (i = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v3]; v3; --v3)
  {
    unsigned int v7 = *v5++;
    objc_msgSend(i, "appendFormat:", @"%02X", v7);
  }

  return (NSString *)i;
}

- (NSData)hashData
{
  hashData_DO_NOT_DIRECTLY_ACCESS = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  if (hashData_DO_NOT_DIRECTLY_ACCESS) {
    goto LABEL_17;
  }
  id v4 = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  unint64_t v5 = [(NSData *)v4 length];
  if ((v5 & 7) != 0)
  {
    id v6 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Cannot encode BOOLean byte data of length %lu because it is not a multiple of 8.", v5);
    unsigned int v7 = +[VNError errorForInvalidOperationWithLocalizedDescription:v6];
LABEL_4:
    id v8 = v7;
    objc_super v9 = 0;
    goto LABEL_16;
  }
  v10 = [(NSData *)v4 bytes];
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v5 >> 3];
  v11 = (unsigned char *)[v6 mutableBytes];
  if (!v11)
  {
    unsigned int v7 = +[VNError errorForMemoryAllocationFailure];
    goto LABEL_4;
  }
  if (v5)
  {
    unsigned int v12 = 128;
    do
    {
      if (*v10++) {
        char v14 = *v11 | v12;
      }
      else {
        char v14 = *v11 & ~(_BYTE)v12;
      }
      unsigned char *v11 = v14;
      if (v12 >= 2)
      {
        v12 >>= 1;
      }
      else
      {
        ++v11;
        unsigned int v12 = 128;
      }
      --v5;
    }
    while (v5);
  }
  objc_super v9 = (void *)[v6 copy];
LABEL_16:

  v15 = (NSData *)[v9 copy];
  v16 = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  self->_hashData_DO_NOT_DIRECTLY_ACCESS = v15;

  hashData_DO_NOT_DIRECTLY_ACCESS = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  if (hashData_DO_NOT_DIRECTLY_ACCESS)
  {
LABEL_17:
    v17 = hashData_DO_NOT_DIRECTLY_ACCESS;
    goto LABEL_18;
  }
  v17 = [MEMORY[0x1E4F1C9B8] data];
LABEL_18:

  return v17;
}

- (NSData)BOOLeanBytesData
{
  BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  if (BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS) {
    goto LABEL_14;
  }
  id v4 = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  unint64_t v5 = [(NSData *)v4 bytes];
  if (v5)
  {
    uint64_t v6 = 8 * [(NSData *)v4 length];
    id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v6];
    id v8 = (BOOL *)[v7 mutableBytes];
    if (v8)
    {
      if (v6)
      {
        LOBYTE(v9) = 0x80;
        do
        {
          BOOL v10 = (v9 & *v5) != 0;
          int v9 = v9 >> 1;
          *v8++ = v10;
          if (!v9)
          {
            ++v5;
            LOBYTE(v9) = 0x80;
          }
          --v6;
        }
        while (v6);
      }
      unint64_t v5 = v7;
    }
    else
    {
      id v12 = +[VNError errorForMemoryAllocationFailure];
      unint64_t v5 = 0;
    }
  }
  else
  {
    id v11 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"bit data must not be nil"];
  }

  v13 = (NSData *)[v5 copy];
  char v14 = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = v13;

  BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  if (BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS)
  {
LABEL_14:
    v15 = BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  }
  else
  {
    v15 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end