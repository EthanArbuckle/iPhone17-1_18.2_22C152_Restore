@interface CECRouterInterface
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4;
- (CECRouterInterface)initWithRouter:(id)a3;
- (id)properties;
- (void)dealloc;
- (void)receivedFrame:(CECFrame *)a3;
@end

@implementation CECRouterInterface

- (CECRouterInterface)initWithRouter:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CECRouterInterface;
  v4 = [(CECInterface *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_router = (CECRouter *)a3;
    id v6 = a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CECRouterInterface;
  [(CoreRCInterface *)&v3 dealloc];
}

- (BOOL)setAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CECRouterInterface;
  BOOL v7 = -[CECInterface setAddressMask:error:](&v9, sel_setAddressMask_error_);
  if (v7) {
    LOBYTE(v7) = [(CECRouter *)self->_router interface:self setAddressMask:v5 error:a4];
  }
  return v7;
}

- (BOOL)setSnoopingMode:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CECRouterInterface;
  BOOL v7 = -[CECInterface setSnoopingMode:error:](&v9, sel_setSnoopingMode_error_);
  if (v7) {
    LOBYTE(v7) = [(CECRouter *)self->_router interface:self setSnoopingMode:v5 error:a4];
  }
  return v7;
}

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  router = self->_router;
  CECFrame v8 = *a3;
  return [(CECRouter *)router interface:self sendFrame:&v8 withRetryCount:a4 error:a5];
}

- (void)receivedFrame:(CECFrame *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if ([(CECInterface *)self snoopingMode]) {
    goto LABEL_5;
  }
  if ((~a3->blocks[0] & 0xF) == 0
    || (([(CECInterface *)self addressMask] >> (a3->blocks[0] & 0xF)) & 1) != 0)
  {
    long long v8 = *(_OWORD *)a3->blocks;
    int v9 = *((_DWORD *)a3 + 4);
    [(CECInterface *)self setLastReceivedFrame:&v8];
LABEL_5:
    BOOL v5 = [(CECInterface *)self delegate];
    long long v6 = *(_OWORD *)a3->blocks;
    int v7 = *((_DWORD *)a3 + 4);
    [(CECInterfaceDelegate *)v5 interface:self receivedFrame:&v6];
    return;
  }
  if (gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)properties
{
  return [(CECRouter *)self->_router properties];
}

@end