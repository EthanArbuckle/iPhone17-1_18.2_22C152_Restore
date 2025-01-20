@interface CBServiceUUIDParamInfo
- (BOOL)isEqual:(id)a3;
- (CBServiceUUIDParamInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)blobData;
- (NSData)maskData;
- (NSData)serviceUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBlobData:(id)a3;
- (void)setMaskData:(id)a3;
- (void)setServiceUUID:(id)a3;
@end

@implementation CBServiceUUIDParamInfo

- (CBServiceUUIDParamInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBServiceUUIDParamInfo *)self init];
  if (!v7)
  {
    if (a4)
    {
      v16 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_7;
    }
LABEL_12:
    v14 = 0;
    goto LABEL_7;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData() || !CUXPCDecodeNSData()) {
    goto LABEL_12;
  }
  v14 = v7;
LABEL_7:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    v5 = serviceUUID;
    uint64_t v6 = [(NSData *)v5 bytes];
    if (v6) {
      v7 = (const char *)v6;
    }
    else {
      v7 = "";
    }
    size_t v8 = [(NSData *)v5 length];

    xpc_dictionary_set_data(xdict, "sUID", v7, v8);
  }
  blobData = self->_blobData;
  if (blobData)
  {
    uint64_t v10 = blobData;
    id v11 = xdict;
    uint64_t v12 = v10;
    uint64_t v13 = [(NSData *)v12 bytes];
    if (v13) {
      v14 = (const char *)v13;
    }
    else {
      v14 = "";
    }
    size_t v15 = [(NSData *)v12 length];

    xpc_dictionary_set_data(v11, "uBlb", v14, v15);
  }
  maskData = self->_maskData;
  if (maskData)
  {
    uint64_t v17 = maskData;
    id v18 = xdict;
    uint64_t v19 = v17;
    uint64_t v20 = [(NSData *)v19 bytes];
    if (v20) {
      uint64_t v21 = (const char *)v20;
    }
    else {
      uint64_t v21 = "";
    }
    size_t v22 = [(NSData *)v19 length];

    xpc_dictionary_set_data(v18, "uMsk", v21, v22);
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"ServiceUUID %@, blob %@, mask: %@", self->_serviceUUID, self->_blobData, self->_maskData];

  return v2;
}

- (unint64_t)hash
{
  v3 = [(CBServiceUUIDParamInfo *)self serviceUUID];
  uint64_t v4 = [v3 hash];
  v5 = [(CBServiceUUIDParamInfo *)self blobData];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CBServiceUUIDParamInfo *)self maskData];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CBServiceUUIDParamInfo *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v13 = 1;
      goto LABEL_22;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v7 = [(CBServiceUUIDParamInfo *)self serviceUUID];
      unint64_t v8 = [(CBServiceUUIDParamInfo *)v6 serviceUUID];
      id v9 = v7;
      id v10 = v8;
      if (v9 == v10)
      {
      }
      else
      {
        id v11 = v10;
        if ((v9 == 0) == (v10 != 0)) {
          goto LABEL_19;
        }
        char v12 = [v9 isEqual:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_14;
        }
      }
      v14 = [(CBServiceUUIDParamInfo *)self blobData];
      size_t v15 = [(CBServiceUUIDParamInfo *)v6 blobData];
      id v9 = v14;
      id v16 = v15;
      if (v9 == v16)
      {
      }
      else
      {
        id v11 = v16;
        if ((v9 == 0) == (v16 != 0)) {
          goto LABEL_19;
        }
        char v17 = [v9 isEqual:v16];

        if ((v17 & 1) == 0)
        {
LABEL_14:
          char v13 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      id v18 = [(CBServiceUUIDParamInfo *)self maskData];
      uint64_t v19 = [(CBServiceUUIDParamInfo *)v6 maskData];
      id v9 = v18;
      id v20 = v19;
      id v11 = v20;
      if (v9 == v20)
      {
        char v13 = 1;
        goto LABEL_20;
      }
      if ((v9 == 0) != (v20 != 0))
      {
        char v13 = [v9 isEqual:v20];
LABEL_20:

        goto LABEL_21;
      }
LABEL_19:
      char v13 = 0;
      goto LABEL_20;
    }
  }
  char v13 = 0;
LABEL_22:

  return v13;
}

- (NSData)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (NSData)blobData
{
  return self->_blobData;
}

- (void)setBlobData:(id)a3
{
}

- (NSData)maskData
{
  return self->_maskData;
}

- (void)setMaskData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskData, 0);
  objc_storeStrong((id *)&self->_blobData, 0);

  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

@end