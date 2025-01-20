@interface CBDeviceResponse
- (CBDeviceResponse)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (char)core0TargetPower;
- (char)core1TargetPower;
- (char)currentPCAP;
- (char)rssi;
- (char)txPower;
- (char)txPowerMax;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)btBand;
- (unsigned)connectionHandle;
- (unsigned)sniffInterval;
- (void)encodeWithXPCObject:(id)a3;
- (void)setBtBand:(unsigned __int8)a3;
- (void)setConnectionHandle:(unsigned __int16)a3;
- (void)setCore0TargetPower:(char)a3;
- (void)setCore1TargetPower:(char)a3;
- (void)setCurrentPCAP:(char)a3;
- (void)setIdentifier:(id)a3;
- (void)setRssi:(char)a3;
- (void)setSniffInterval:(unsigned int)a3;
- (void)setTxPower:(char)a3;
- (void)setTxPowerMax:(char)a3;
@end

@implementation CBDeviceResponse

- (CBDeviceResponse)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBDeviceResponse *)self init];
  if (!v7)
  {
    if (a4)
    {
      v25 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_37;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v32);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    goto LABEL_37;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_btBand = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_37;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_connectionHandle = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_37;
  }
  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v7->_core0TargetPower = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_37;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_core1TargetPower = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_37;
  }
  int v18 = CUXPCDecodeSInt64RangedEx();
  if (v18 == 6)
  {
    v7->_currentPCAP = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_37;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_37;
  }
  int v19 = CUXPCDecodeSInt64RangedEx();
  if (v19 == 6)
  {
    v7->_rssi = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_37;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_sniffInterval = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_37;
  }
  int v21 = CUXPCDecodeSInt64RangedEx();
  if (v21 == 6)
  {
    v7->_txPower = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_37;
  }
  int v22 = CUXPCDecodeSInt64RangedEx();
  if (v22 != 6)
  {
    if (v22 != 5) {
      goto LABEL_31;
    }
LABEL_37:
    v23 = 0;
    goto LABEL_32;
  }
  v7->_txPowerMax = 0;
LABEL_31:
  v23 = v7;
LABEL_32:

  return v23;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_btBand) {
    xpc_dictionary_set_uint64(v4, "btBd", self->_btBand);
  }
  if (self->_connectionHandle) {
    xpc_dictionary_set_uint64(v5, "CnHd", self->_connectionHandle);
  }
  if (self->_core0TargetPower) {
    xpc_dictionary_set_int64(v5, "c0TP", self->_core0TargetPower);
  }
  if (self->_core1TargetPower) {
    xpc_dictionary_set_int64(v5, "c1TP", self->_core1TargetPower);
  }
  if (self->_currentPCAP) {
    xpc_dictionary_set_int64(v5, "pcap", self->_currentPCAP);
  }
  identifier = self->_identifier;
  xpc_object_t xdict = v5;
  v7 = [(NSString *)identifier UTF8String];
  if (v7) {
    xpc_dictionary_set_string(xdict, "id", v7);
  }

  if (self->_rssi) {
    xpc_dictionary_set_int64(xdict, "rssi", self->_rssi);
  }
  uint64_t sniffInterval = self->_sniffInterval;
  if (sniffInterval) {
    xpc_dictionary_set_uint64(xdict, "snfI", sniffInterval);
  }
  uint64_t v9 = xdict;
  if (self->_txPower)
  {
    xpc_dictionary_set_int64(xdict, "txPw", self->_txPower);
    uint64_t v9 = xdict;
  }
  if (self->_txPowerMax)
  {
    xpc_dictionary_set_int64(xdict, "txPM", self->_txPowerMax);
    uint64_t v9 = xdict;
  }
}

- (id)description
{
  return [(CBDeviceResponse *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  if ((a3 & 0x8000000) != 0)
  {
    id v6 = 0;
    if (a3 > 0x14u)
    {
LABEL_3:
      if (self->_btBand)
      {
        uint64_t v30 = v6;
        NSAppendPrintF_safe();
        uint64_t v8 = v30;

        id v6 = v8;
        if (self->_connectionHandle) {
          goto LABEL_11;
        }
      }
      else if (self->_connectionHandle)
      {
LABEL_11:
        v29[8] = v6;
        NSAppendPrintF_safe();
        uint64_t v9 = v6;

        id v6 = v9;
      }
      if (self->_core0TargetPower)
      {
        v29[7] = v6;
        NSAppendPrintF_safe();
        uint64_t v10 = v6;

        if (!self->_core0TargetPower)
        {
          if (!self->_currentPCAP) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
        v29[6] = v10;
        NSAppendPrintF_safe();
        id v6 = v10;
      }
      uint64_t v10 = v6;
      if (!self->_currentPCAP)
      {
LABEL_17:
        if (self->_identifier)
        {
          v29[4] = v10;
          NSAppendPrintF_safe();
          uint64_t v12 = v10;

          uint64_t v10 = v12;
        }
        if (self->_rssi)
        {
          v29[3] = v10;
          NSAppendPrintF_safe();
          uint64_t v13 = v10;

          uint64_t v10 = v13;
        }
        if (self->_sniffInterval)
        {
          v29[2] = v10;
          NSAppendPrintF_safe();
          int v14 = v10;

          uint64_t v10 = v14;
        }
        if (self->_txPower)
        {
          v29[1] = v10;
          NSAppendPrintF_safe();
          id v6 = v10;

          if (!self->_txPowerMax) {
            goto LABEL_49;
          }
        }
        else
        {
          id v6 = v10;
          if (!self->_txPowerMax) {
            goto LABEL_49;
          }
        }
        v29[0] = v6;
        int v15 = (id *)v29;
LABEL_48:
        NSAppendPrintF_safe();
        v25 = (__CFString *)*v15;

        id v6 = v25;
        goto LABEL_49;
      }
LABEL_16:
      v29[5] = v10;
      NSAppendPrintF_safe();
      uint64_t v11 = v10;

      uint64_t v10 = v11;
      goto LABEL_17;
    }
  }
  else
  {
    v31[10] = 0;
    v5 = [(id)objc_opt_class() description];
    NSAppendPrintF_safe();
    id v6 = (__CFString *)0;

    if (v4 > 0x14) {
      goto LABEL_3;
    }
  }
  int connectionHandle = self->_connectionHandle;
  if (self->_btBand)
  {
    v31[9] = v6;
    NSAppendPrintF_safe();
    int v16 = v6;

    int connectionHandle = self->_connectionHandle;
    id v6 = v16;
  }
  if (connectionHandle)
  {
    v31[8] = v6;
    NSAppendPrintF_safe();
    int v17 = v6;

    id v6 = v17;
  }
  if (self->_core0TargetPower)
  {
    v31[7] = v6;
    NSAppendPrintF_safe();
    int v18 = v6;

    id v6 = v18;
  }
  if (self->_core1TargetPower)
  {
    v31[6] = v6;
    NSAppendPrintF_safe();
    int v19 = v6;

    id v6 = v19;
  }
  if (self->_currentPCAP)
  {
    v31[5] = v6;
    NSAppendPrintF_safe();
    int v20 = v6;

    id v6 = v20;
  }
  if (self->_identifier)
  {
    v31[4] = v6;
    NSAppendPrintF_safe();
    int v21 = v6;

    id v6 = v21;
  }
  if (self->_rssi)
  {
    v31[3] = v6;
    NSAppendPrintF_safe();
    int v22 = v6;

    id v6 = v22;
  }
  if (self->_sniffInterval)
  {
    v31[2] = v6;
    NSAppendPrintF_safe();
    v23 = v6;

    id v6 = v23;
  }
  if (self->_txPower)
  {
    v31[1] = v6;
    NSAppendPrintF_safe();
    v24 = v6;

    id v6 = v24;
  }
  if (self->_txPowerMax)
  {
    v31[0] = v6;
    int v15 = (id *)v31;
    goto LABEL_48;
  }
LABEL_49:
  if (v6) {
    uint64_t v26 = v6;
  }
  else {
    uint64_t v26 = @"?";
  }
  uint64_t v27 = v26;

  return v27;
}

- (unsigned)btBand
{
  return self->_btBand;
}

- (void)setBtBand:(unsigned __int8)a3
{
  self->_btBand = a3;
}

- (unsigned)connectionHandle
{
  return self->_connectionHandle;
}

- (void)setConnectionHandle:(unsigned __int16)a3
{
  self->_int connectionHandle = a3;
}

- (char)core0TargetPower
{
  return self->_core0TargetPower;
}

- (void)setCore0TargetPower:(char)a3
{
  self->_core0TargetPower = a3;
}

- (char)core1TargetPower
{
  return self->_core1TargetPower;
}

- (void)setCore1TargetPower:(char)a3
{
  self->_core1TargetPower = a3;
}

- (char)currentPCAP
{
  return self->_currentPCAP;
}

- (void)setCurrentPCAP:(char)a3
{
  self->_currentPCAP = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (char)rssi
{
  return self->_rssi;
}

- (void)setRssi:(char)a3
{
  self->_rssi = a3;
}

- (unsigned)sniffInterval
{
  return self->_sniffInterval;
}

- (void)setSniffInterval:(unsigned int)a3
{
  self->_uint64_t sniffInterval = a3;
}

- (char)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(char)a3
{
  self->_txPower = a3;
}

- (char)txPowerMax
{
  return self->_txPowerMax;
}

- (void)setTxPowerMax:(char)a3
{
  self->_txPowerMax = a3;
}

- (void).cxx_destruct
{
}

@end