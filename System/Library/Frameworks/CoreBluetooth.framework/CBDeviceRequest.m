@interface CBDeviceRequest
- (CBDeviceRequest)initWithXPCObject:(id)a3 error:(id *)a4;
- (double)timeoutSeconds;
- (id)description;
- (unsigned)requestFlags;
- (void)encodeWithXPCObject:(id)a3;
- (void)setRequestFlags:(unsigned int)a3;
- (void)setTimeoutSeconds:(double)a3;
@end

@implementation CBDeviceRequest

- (CBDeviceRequest)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBDeviceRequest *)self init];
  if (!v7)
  {
    if (a4)
    {
      v17 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v24);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_requestFlags = 0;
    goto LABEL_6;
  }
  if (v14 == 5)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_8;
  }
LABEL_6:
  if (!CUXPCDecodeDouble()) {
    goto LABEL_13;
  }
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  uint64_t requestFlags = self->_requestFlags;
  xpc_object_t xdict = v4;
  if (requestFlags)
  {
    xpc_dictionary_set_uint64(v4, "dvRF", requestFlags);
    id v4 = xdict;
  }
  double timeoutSeconds = self->_timeoutSeconds;
  if (timeoutSeconds != 0.0)
  {
    xpc_dictionary_set_double(xdict, "timO", timeoutSeconds);
    id v4 = xdict;
  }
}

- (id)description
{
  v3 = [(id)objc_opt_class() description];
  uint64_t v9 = CUPrintFlags32();
  NSAppendPrintF_safe();
  id v4 = (__CFString *)0;

  if (self->_timeoutSeconds != 0.0)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    id v4 = v5;
  }
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = @"?";
  }
  v7 = v6;

  return v7;
}

- (unsigned)requestFlags
{
  return self->_requestFlags;
}

- (void)setRequestFlags:(unsigned int)a3
{
  self->_uint64_t requestFlags = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_double timeoutSeconds = a3;
}

@end