@interface CBPairingInfo
- (CBDevice)device;
- (CBPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)pin;
- (id)description;
- (int64_t)pairingType;
- (unsigned)flags;
- (void)encodeWithXPCObject:(id)a3;
- (void)setDevice:(id)a3;
- (void)setError:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setPin:(id)a3;
@end

@implementation CBPairingInfo

- (CBPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBPairingInfo *)self init];
  if (!v7)
  {
    if (a4)
    {
      v20 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      goto LABEL_14;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_14;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v27);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_20;
  }
  int v14 = CUXPCDecodeNSError();
  id v15 = 0;
  if (!v14) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v7->_error, 0);
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_flags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_15;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_15;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5) {
      goto LABEL_12;
    }
LABEL_15:
    v18 = 0;
    goto LABEL_13;
  }
  v7->_pairingType = 0;
LABEL_12:
  v18 = v7;
LABEL_13:

LABEL_14:
  return v18;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  CUXPCEncodeObject();
  if (self->_error) {
    CUXPCEncodeNSError();
  }
  uint64_t flags = self->_flags;
  if (flags) {
    xpc_dictionary_set_uint64(v4, "prFl", flags);
  }
  pin = self->_pin;
  xpc_object_t xdict = v4;
  v7 = [(NSString *)pin UTF8String];
  if (v7) {
    xpc_dictionary_set_string(xdict, "prPN", v7);
  }

  int64_t pairingType = self->_pairingType;
  if (pairingType) {
    xpc_dictionary_set_int64(xdict, "prTy", pairingType);
  }
}

- (id)description
{
  v2 = [(id)objc_opt_class() description];
  v3 = CUPrintFlags32();
  uint64_t v8 = CUPrintNSError();
  NSAppendPrintF_safe();
  id v4 = (__CFString *)0;

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = @"?";
  }
  id v6 = v5;

  return v6;
}

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_int64_t pairingType = a3;
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end