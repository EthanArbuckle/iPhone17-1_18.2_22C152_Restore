@interface CBDiscoverySummary
- (CBDiscoverySummary)initWithXPCObject:(id)a3 error:(id *)a4;
- (double)scanTime;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setScanTime:(double)a3;
@end

@implementation CBDiscoverySummary

- (CBDiscoverySummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CBDiscoverySummary;
  v7 = [(CBDiscoverySummary *)&v24 init];
  if (!v7)
  {
    if (a4)
    {
      v16 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ super init failed", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      goto LABEL_5;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_5;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v23);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_10;
  }
  v14 = v7;
LABEL_5:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  double scanTime = self->_scanTime;
  if (scanTime != 0.0) {
    xpc_dictionary_set_double(a3, "scTm", scanTime);
  }
}

- (id)description
{
  return [(CBDiscoverySummary *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    id v6 = [(id)objc_opt_class() description];
    CUAppendF();
    id v3 = 0;
  }
  v7 = CUPrintDurationDouble();
  CUAppendF();
  id v4 = v3;

  return v4;
}

- (double)scanTime
{
  return self->_scanTime;
}

- (void)setScanTime:(double)a3
{
  self->_double scanTime = a3;
}

@end