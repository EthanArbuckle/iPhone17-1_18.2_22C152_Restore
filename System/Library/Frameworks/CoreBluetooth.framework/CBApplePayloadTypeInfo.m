@interface CBApplePayloadTypeInfo
- (BOOL)isEqual:(id)a3;
- (CBApplePayloadTypeInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (char)rssiThreshold;
- (id)description;
- (unint64_t)hash;
- (unsigned)applePayloadType;
- (void)encodeWithXPCObject:(id)a3;
- (void)setApplePayloadType:(unsigned __int8)a3;
- (void)setRssiThreshold:(char)a3;
@end

@implementation CBApplePayloadTypeInfo

- (CBApplePayloadTypeInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBApplePayloadTypeInfo *)self init];
  if (!v7)
  {
    if (a4)
    {
      v18 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v25);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_applePayloadType = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_15;
  }
  int v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 != 6)
  {
    if (v15 != 5) {
      goto LABEL_9;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_10;
  }
  v7->_rssiThreshold = 0;
LABEL_9:
  v16 = v7;
LABEL_10:

  return v16;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_applePayloadType)
  {
    xpc_dictionary_set_uint64(v4, "apTY", self->_applePayloadType);
    id v4 = xdict;
  }
  if (self->_rssiThreshold)
  {
    xpc_dictionary_set_int64(xdict, "blRS", self->_rssiThreshold);
    id v4 = xdict;
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  v2 = (__CFString *)0;
  v3 = v2;
  if (!v2) {
    v2 = @"?";
  }
  id v4 = v2;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CBApplePayloadTypeInfo *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (v4 == self)
  {

    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    return 0;
  }
  id v6 = v5;
  int v7 = [(CBApplePayloadTypeInfo *)self applePayloadType];
  if (v7 == [(CBApplePayloadTypeInfo *)v6 applePayloadType])
  {
    int v8 = [(CBApplePayloadTypeInfo *)self rssiThreshold];
    BOOL v9 = v8 == [(CBApplePayloadTypeInfo *)v6 rssiThreshold];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CBApplePayloadTypeInfo *)self applePayloadType];
  return [(CBApplePayloadTypeInfo *)self rssiThreshold] ^ v3;
}

- (unsigned)applePayloadType
{
  return self->_applePayloadType;
}

- (void)setApplePayloadType:(unsigned __int8)a3
{
  self->_applePayloadType = a3;
}

- (char)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(char)a3
{
  self->_rssiThreshold = a3;
}

@end