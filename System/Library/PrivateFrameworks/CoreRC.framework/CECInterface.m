@interface CECInterface
- (BOOL)allocateCECAddress:(unsigned __int8 *)a3 forDeviceType:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)deallocateCECAddress:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)errorIsNack:(id)a3;
- (BOOL)hasMultipleLogicalAddresses;
- (BOOL)hibernating;
- (BOOL)pingTo:(unsigned __int8)a3 acknowledged:(BOOL *)a4 error:(id *)a5;
- (BOOL)sendFrame:(CECFrame *)a3 error:(id *)a4;
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)sendMessage:(id)a3 error:(id *)a4;
- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4;
- (BOOL)snoopingMode;
- (CECFrame)lastReceivedFrame;
- (CECInterface)init;
- (CECInterfaceDelegate)delegate;
- (NSDictionary)properties;
- (unsigned)addressMask;
- (void)didChangeProperties;
- (void)hibernationChanged:(BOOL)a3;
- (void)receivedFrame:(CECFrame *)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedFrame:(CECFrame *)a3;
@end

@implementation CECInterface

- (CECInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)CECInterface;
  result = [(CECInterface *)&v3 init];
  if (result) {
    result->_addressMask = 0x8000;
  }
  return result;
}

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:0];
}

- (BOOL)setAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  unsigned __int16 v4 = a3;
  BOOL result = [(CECInterface *)self setHardwareAddressMask:a3 error:a4];
  if (!result) {
    v4 &= self->_addressMask;
  }
  self->_addressMask = v4;
  return result;
}

- (BOOL)hasMultipleLogicalAddresses
{
  return (self->_addressMask & (unsigned __int16)(self->_addressMask - 1) & 0x7FFF) != 0;
}

- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4
{
  self->_snoopingMode = a3;
  if (gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 1;
}

- (BOOL)errorIsNack:(id)a3
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:0];
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)sendFrame:(CECFrame *)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CECFrame v5 = *a3;
  return [(CECInterface *)self sendFrame:&v5 withRetryCount:2 error:a4];
}

- (void)receivedFrame:(CECFrame *)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __30__CECInterface_receivedFrame___block_invoke;
  v3[3] = &unk_2652E3EE0;
  v3[4] = self;
  CECFrame v4 = *a3;
  [(CoreRCInterface *)self dispatchAsyncHighPriority:v3];
}

uint64_t __30__CECInterface_receivedFrame___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    v2 = *(void **)(v1 + 40);
    return objc_msgSend(v2, "interface:receivedFrame:");
  }
  int v3 = *(unsigned char *)(result + 40) & 0xF;
  if (v3 == 15 || ((*(unsigned __int16 *)(v1 + 34) >> v3) & 1) != 0)
  {
    int v4 = *(_DWORD *)(result + 56);
    *(_OWORD *)(v1 + 48) = *(_OWORD *)(result + 40);
    *(_DWORD *)(v1 + 64) = v4;
    v2 = *(void **)(*(void *)(result + 32) + 40);
    return objc_msgSend(v2, "interface:receivedFrame:");
  }
  if (gLogCategory_CoreRCInterface <= 90)
  {
    if (gLogCategory_CoreRCInterface != -1) {
      return LogPrintF();
    }
    BOOL result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

- (void)hibernationChanged:(BOOL)a3
{
  self->_hibernating = a3;
  -[CECInterfaceDelegate interface:hibernationChanged:](self->_delegate, "interface:hibernationChanged:", self);
}

- (NSDictionary)properties
{
  v4[2] = *MEMORY[0x263EF8340];
  v3[0] = @"kCECInterfacePropertyIsValid";
  v3[1] = @"kCECInterfacePropertyHasLink";
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA80];
  return (NSDictionary *)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

- (void)didChangeProperties
{
  int v3 = [(CECInterface *)self delegate];
  [(CECInterfaceDelegate *)v3 interfacePropertiesChanged:self];
}

- (BOOL)pingTo:(unsigned __int8)a3 acknowledged:(BOOL *)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v11 = 0;
  if (a4)
  {
    v12[0] = a3 | (16 * a3);
    memset(&v12[1], 0, 15);
    BOOL v8 = 1;
    v12[16] = 1;
    __int16 v13 = 0;
    char v14 = 0;
    BOOL v9 = [(CECInterface *)self sendFrame:v12 withRetryCount:2 error:&v11];
    *a4 = v9;
    if (v9) {
      return v8;
    }
    BOOL v8 = [(CECInterface *)self errorIsNack:v11];
    if (!a5) {
      return v8;
    }
  }
  else
  {
    BOOL v8 = 0;
    v11 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    if (!a5) {
      return v8;
    }
  }
  if (!v8)
  {
    BOOL v8 = 0;
    *a5 = v11;
  }
  return v8;
}

- (BOOL)allocateCECAddress:(unsigned __int8 *)a3 forDeviceType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  v18 = 0;
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = v6;
    LogPrintF();
  }
  if (!a3)
  {
    v18 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    goto LABEL_29;
  }
  unsigned __int16 v9 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CECInterface properties](self, "properties"), "objectForKeyedSubscript:", @"kCECInterfacePropertyPhysicalAddress"), "unsignedIntegerValue");
  uint64_t v10 = [(CECInterface *)self addressMask];
  uint64_t v11 = v10;
  int v12 = *a3;
  if (v12 != 15)
  {
    uint64_t v11 = v10 & ~(1 << v12);
LABEL_10:
    LOBYTE(v14) = v12;
    while (1)
    {
      char v17 = 0;
      if ((v11 >> v14)) {
        -[CECInterface allocateCECAddress:forDeviceType:error:](v6, self, v11, v14);
      }
      if (![(CECInterface *)self pingTo:v14 acknowledged:&v17 error:&v18])goto LABEL_29; {
      if (!v17)
      }
      {
        unsigned __int8 v13 = *a3;
        goto LABEL_20;
      }
      int v14 = CECAddressPreferredForDevice(v6, v9, *a3);
      *a3 = v14;
      if (v12 == v14)
      {
        if (gLogCategory_CoreRCInterface <= 60
          && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
        {
          uint64_t v16 = v6;
          LogPrintF();
        }
        unsigned __int8 v13 = 15;
        *a3 = 15;
        goto LABEL_20;
      }
    }
  }
  unsigned __int8 v13 = 15;
  int v12 = CECAddressPreferredForDevice(v6, v9, 15);
  *a3 = v12;
  if (v12 != 15) {
    goto LABEL_10;
  }
LABEL_20:
  if (-[CECInterface setAddressMask:error:](self, "setAddressMask:error:", (unsigned __int16)(v11 | (1 << v13)), &v18, v16))
  {
    if (gLogCategory_CoreRCInterface <= 40
      && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 1;
  }
LABEL_29:
  if (gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL result = 0;
  if (a5) {
    *a5 = v18;
  }
  return result;
}

- (BOOL)deallocateCECAddress:(unsigned __int8)a3 error:(id *)a4
{
  int v5 = a3;
  uint64_t v11 = 0;
  int v7 = [(CECInterface *)self addressMask];
  if (v5 == 15 || ((1 << v5) & v7) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    LOBYTE(v8) = 0;
    uint64_t v11 = (void *)v9;
    if (a4) {
LABEL_10:
    }
      *a4 = v11;
  }
  else
  {
    BOOL v8 = [(CECInterface *)self setAddressMask:v7 & ~(1 << v5) error:&v11];
    if (v8)
    {
      if (gLogCategory_CoreRCInterface <= 10
        && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      LOBYTE(v8) = 1;
    }
    if (a4) {
      goto LABEL_10;
    }
  }
  return v8;
}

- (CECInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CECInterfaceDelegate *)a3;
}

- (unsigned)addressMask
{
  return self->_addressMask;
}

- (BOOL)snoopingMode
{
  return self->_snoopingMode;
}

- (BOOL)hibernating
{
  return self->_hibernating;
}

- (CECFrame)lastReceivedFrame
{
  *retstr = *(CECFrame *)((char *)self + 48);
  return self;
}

- (void)setLastReceivedFrame:(CECFrame *)a3
{
  int v3 = *((_DWORD *)a3 + 4);
  *(_OWORD *)self->_lastReceivedFrame.blocks = *(_OWORD *)a3->blocks;
  *((_DWORD *)&self->_lastReceivedFrame + 4) = v3;
}

- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    [a3 frame];
  }
  else
  {
    v9[0] = 0;
    v9[1] = 0;
    int v10 = 0;
  }
  return [(CECInterface *)self sendFrame:v9 withRetryCount:v6 error:a5];
}

- (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  return [(CECInterface *)self sendMessage:a3 withRetryCount:2 error:a4];
}

- (void)allocateCECAddress:(uint64_t)a3 forDeviceType:(uint64_t)a4 error:.cold.1(unsigned __int8 a1, void *a2, uint64_t a3, uint64_t a4)
{
}

@end