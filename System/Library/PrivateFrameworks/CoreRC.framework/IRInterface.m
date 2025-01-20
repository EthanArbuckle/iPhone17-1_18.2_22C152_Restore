@interface IRInterface
- (BOOL)canWakeFor3rdPartyIR;
- (BOOL)clearAllStoredCommands:(id *)a3;
- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5;
- (BOOL)isRxInterface;
- (BOOL)isTxInterface;
- (BOOL)processTimings:(const unsigned int *)a3 range:(_NSRange)a4 timestamp:(unint64_t)a5;
- (BOOL)resetAllButtons:(id *)a3;
- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6;
- (BOOL)setLearnedProtocolMask:(unsigned int)a3 error:(id *)a4;
- (BOOL)setPairState:(BOOL)a3 forDeviceUID:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)transmitCommand:(id)a3 pressDuration:(double)a4 error:(id *)a5;
- (BOOL)transmitFrame:(id)a3 error:(id *)a4;
- (IRInterfaceDelegate)delegate;
- (NSArray)buttons;
- (unint64_t)maxStoredCommands;
- (void)receivedCommand:(id)a3;
- (void)receivedFrame:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRxInterface:(BOOL)a3;
- (void)setIsTxInterface:(BOOL)a3;
@end

@implementation IRInterface

- (void)receivedFrame:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v4 = [a3 count];
  uint64_t v5 = [a3 timestamp];
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    unint64_t v10 = v4;
    LogPrintF();
  }
  objc_msgSend(a3, "getTimings:range:", v12, 0, v4, v10);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (gLogCategory_CoreRCInterface <= 40
        && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  if (gLogCategory_CoreRCInterface < 41
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4 < 2)
  {
    unint64_t v7 = 0;
    v9 = self;
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = 1;
    v9 = self;
    do
    {
      if (v12[v8] >= 0x1D4Du)
      {
        if (!-[IRInterface processTimings:range:timestamp:](self, "processTimings:range:timestamp:", v12, v7, v8 - v7, v5))return; {
        unint64_t v7 = v8 + 1;
        }
      }
      v8 += 2;
    }
    while (v8 < v4);
  }
  if (v4 > v7) {
    -[IRInterface processTimings:range:timestamp:](v9, "processTimings:range:timestamp:", v12);
  }
}

- (BOOL)processTimings:(const unsigned int *)a3 range:(_NSRange)a4 timestamp:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int v18 = 0;
  unsigned __int8 v17 = 0;
  uint64_t v16 = 0;
  char v15 = 0;
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    NSUInteger v13 = location;
    NSUInteger v14 = length;
    LogPrintF();
  }
  if (IRDecoder_Decode((uint64_t)&a3[location], length, &v18, &v17, &v16, &v15))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    unint64_t v10 = +[IRProtocol protocolWithID:v18 options:v17];
    if (v10)
    {
      unint64_t v10 = +[IRCommand commandWithProtocol:payload:repeat:](IRCommand, "commandWithProtocol:payload:repeat:", v10, v16, v15 != 0, v13, v14);
      if (v10)
      {
        v11 = v10;
        [(IRProtocol *)v10 setTimestamp:a5];
        [(IRInterface *)self receivedCommand:v11];
        LOBYTE(v10) = 1;
      }
    }
  }
  return (char)v10;
}

- (BOOL)setPairState:(BOOL)a3 forDeviceUID:(unsigned __int8)a4 error:(id *)a5
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:a5];
}

- (void)receivedCommand:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__IRInterface_receivedCommand___block_invoke;
  v3[3] = &unk_2652E3520;
  v3[4] = self;
  v3[5] = a3;
  [(CoreRCInterface *)self dispatchAsyncHighPriority:v3];
}

uint64_t __31__IRInterface_receivedCommand___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 interface:v3 receivedCommand:v4];
}

- (NSArray)buttons
{
  return 0;
}

- (unint64_t)maxStoredCommands
{
  return 0;
}

- (BOOL)canWakeFor3rdPartyIR
{
  return 0;
}

- (BOOL)transmitCommand:(id)a3 pressDuration:(double)a4 error:(id *)a5
{
  return -[CoreRCInterface doesNotImplement:error:](self, "doesNotImplement:error:", a2, a5, a4);
}

- (BOOL)transmitFrame:(id)a3 error:(id *)a4
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:a4];
}

- (BOOL)clearAllStoredCommands:(id *)a3
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:a3];
}

- (BOOL)setCommand:(id)a3 forButtonCombination:(id)a4 delay:(double)a5 error:(id *)a6
{
  return -[CoreRCInterface doesNotImplement:error:](self, "doesNotImplement:error:", a2, a6, a5);
}

- (BOOL)resetAllButtons:(id *)a3
{
  return [(CoreRCInterface *)self doesNotImplement:a2 error:a3];
}

- (BOOL)enableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  return -[CoreRCInterface doesNotImplement:error:](self, "doesNotImplement:error:", a2, a5, a4);
}

- (BOOL)disableButtonCombination:(id)a3 delay:(double)a4 error:(id *)a5
{
  return -[CoreRCInterface doesNotImplement:error:](self, "doesNotImplement:error:", a2, a5, a4);
}

- (BOOL)setLearnedProtocolMask:(unsigned int)a3 error:(id *)a4
{
  BOOL v5 = [(IRInterface *)self isRxInterface];
  if (!v5)
  {
    v6 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6735 userInfo:0];
    if (!a4) {
      return v5;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v6;
  return v5;
}

- (IRInterfaceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IRInterfaceDelegate *)a3;
}

- (BOOL)isTxInterface
{
  return self->_isTxInterface;
}

- (void)setIsTxInterface:(BOOL)a3
{
  self->_isTxInterface = a3;
}

- (BOOL)isRxInterface
{
  return self->_isRxInterface;
}

- (void)setIsRxInterface:(BOOL)a3
{
  self->_isRxInterface = a3;
}

@end