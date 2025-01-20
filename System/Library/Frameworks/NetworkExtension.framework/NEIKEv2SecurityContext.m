@interface NEIKEv2SecurityContext
+ (BOOL)removePaddingFromDecryptedPayload:(uint64_t)a1;
- initWithMinimumEncryptedPayloadSize:(void *)a1;
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3;
- (unsigned)overheadForPlaintextLength:(unsigned int)a3;
@end

@implementation NEIKEv2SecurityContext

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  return 0;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  return 0;
}

- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3
{
  if (self)
  {
    unsigned int minimumEncryptedPayloadSize = self->_minimumEncryptedPayloadSize;
    if (minimumEncryptedPayloadSize >= a3)
    {
      LODWORD(self) = 0;
      return self;
    }
  }
  else
  {
    unsigned int minimumEncryptedPayloadSize = 0;
    if (!a3) {
      return self;
    }
  }
  LODWORD(self) = a3 - minimumEncryptedPayloadSize;
  return self;
}

- (unsigned)overheadForPlaintextLength:(unsigned int)a3
{
  if (self) {
    LODWORD(self) = self->_minimumEncryptedPayloadSize;
  }
  return self;
}

+ (BOOL)removePaddingFromDecryptedPayload:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  unsigned int v3 = [v2 length];
  unsigned int v4 = v3;
  if (v3)
  {
    unsigned __int8 v10 = 0;
    objc_msgSend(v2, "getBytes:range:", &v10, v3 - 1, 1);
    int v5 = v10 + 1;
    BOOL v6 = v10 < v4;
    if (v10 >= v4)
    {
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        int v12 = v5;
        __int16 v13 = 1024;
        unsigned int v14 = v4;
        _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "BACKTRACE Padding len (%u) > decrypted data len (%u)", buf, 0xEu);
      }
    }
    else
    {
      [v2 setLength:v4 - v5];
    }
  }
  else
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "BACKTRACE Can't remove padding from payload of length 0", buf, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- initWithMinimumEncryptedPayloadSize:(void *)a1
{
  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2SecurityContext;
  result = objc_msgSendSuper2(&v6, sel_init);
  if (result)
  {
    result[2] = a2;
  }
  else
  {
    unsigned int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }

    return 0;
  }
  return result;
}

@end