@interface ENScanInstance
- (ENAttenuation)minimumAttenuation;
- (ENAttenuation)typicalAttenuation;
- (ENScanInstance)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSInteger)secondsSinceLastScan;
- (id)description;
- (void)encodeWithXPCObject:(id)a3;
- (void)setMinimumAttenuation:(unsigned __int8)a3;
- (void)setSecondsSinceLastScan:(int64_t)a3;
- (void)setTypicalAttenuation:(unsigned __int8)a3;
@end

@implementation ENScanInstance

- (ENScanInstance)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ENScanInstance *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_18;
    }
LABEL_17:
    ENErrorF(2);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_minimumAttenuation = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_18;
  }
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_typicalAttenuation = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_18;
  }
  int v10 = CUXPCDecodeSInt64RangedEx();
  if (v10 != 6)
  {
    if (v10 != 5) {
      goto LABEL_12;
    }
LABEL_18:
    v11 = 0;
    goto LABEL_13;
  }
  v7->_secondsSinceLastScan = 0;
LABEL_12:
  v11 = v7;
LABEL_13:

  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (self->_minimumAttenuation)
  {
    xpc_dictionary_set_uint64(v4, "minAttn", self->_minimumAttenuation);
    id v4 = xdict;
  }
  if (self->_typicalAttenuation)
  {
    xpc_dictionary_set_uint64(xdict, "typAttn", self->_typicalAttenuation);
    id v4 = xdict;
  }
  int64_t secondsSinceLastScan = self->_secondsSinceLastScan;
  if (secondsSinceLastScan)
  {
    xpc_dictionary_set_int64(xdict, "secsLS", secondsSinceLastScan);
    id v4 = xdict;
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v6 = 0;
  NSAppendPrintF_safe();
  id v2 = v6;

  NSAppendPrintF_safe();
  id v3 = v2;

  NSAppendPrintF_safe();
  id v4 = v3;

  return v4;
}

- (ENAttenuation)minimumAttenuation
{
  return self->_minimumAttenuation;
}

- (void)setMinimumAttenuation:(unsigned __int8)a3
{
  self->_minimumAttenuation = a3;
}

- (ENAttenuation)typicalAttenuation
{
  return self->_typicalAttenuation;
}

- (void)setTypicalAttenuation:(unsigned __int8)a3
{
  self->_typicalAttenuation = a3;
}

- (NSInteger)secondsSinceLastScan
{
  return self->_secondsSinceLastScan;
}

- (void)setSecondsSinceLastScan:(int64_t)a3
{
  self->_int64_t secondsSinceLastScan = a3;
}

@end