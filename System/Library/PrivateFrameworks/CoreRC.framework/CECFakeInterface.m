@interface CECFakeInterface
+ (id)defaultAudioSystemProperties;
+ (id)defaultPlaybackDeviceProperties;
+ (id)defaultPropertiesWithPhysicalAddress:(unint64_t)a3;
+ (id)defaultTVProperties;
- (BOOL)errorIsNack:(id)a3;
- (BOOL)pingTo:(unsigned __int8)a3 acknowledged:(BOOL *)a4 error:(id *)a5;
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (CECFakeInterface)initWithInterfaceListener:(id)a3 properties:(id)a4;
- (CECFrame)lastReceivedFrameWithOpcode:(SEL)a3;
- (CECFrame)lastReceivedFrameWithOpcode:(SEL)a3 andHeader:(unsigned __int8)a4;
- (id)properties;
- (id)receivedFrames;
- (void)clearReceivedFrames;
- (void)dealloc;
- (void)fakeHotPlugDetect:(BOOL)a3;
- (void)fakeHotPlugDetectWithPhysicalAddress:(unsigned __int16)a3;
- (void)fakePropertiesChanged:(id)a3;
- (void)fakeTerminated;
- (void)receivedFrame:(CECFrame *)a3;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CECFakeInterface

+ (id)defaultTVProperties
{
  v4[3] = *MEMORY[0x263EF8340];
  v3[0] = @"kCECInterfacePropertyIsValid";
  v3[1] = @"kCECInterfacePropertyHasLink";
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA88];
  v3[2] = @"kCECInterfacePropertyPhysicalAddress";
  v4[2] = &unk_26FEDA978;
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

+ (id)defaultPlaybackDeviceProperties
{
  v4[3] = *MEMORY[0x263EF8340];
  v3[0] = @"kCECInterfacePropertyIsValid";
  v3[1] = @"kCECInterfacePropertyHasLink";
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA88];
  v3[2] = @"kCECInterfacePropertyPhysicalAddress";
  v4[2] = &unk_26FEDA990;
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

+ (id)defaultAudioSystemProperties
{
  v4[3] = *MEMORY[0x263EF8340];
  v3[0] = @"kCECInterfacePropertyIsValid";
  v3[1] = @"kCECInterfacePropertyHasLink";
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA88];
  v3[2] = @"kCECInterfacePropertyPhysicalAddress";
  v4[2] = &unk_26FEDA990;
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

+ (id)defaultPropertiesWithPhysicalAddress:(unint64_t)a3
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"kCECInterfacePropertyIsValid";
  v4[1] = @"kCECInterfacePropertyHasLink";
  v5[0] = MEMORY[0x263EFFA88];
  v5[1] = MEMORY[0x263EFFA88];
  v4[2] = @"kCECInterfacePropertyPhysicalAddress";
  v5[2] = [NSNumber numberWithUnsignedInteger:a3];
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (CECFakeInterface)initWithInterfaceListener:(id)a3 properties:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CECFakeInterface;
  v6 = [(CECInterface *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(CoreRCInterface *)v6 setListener:a3];
    v7->_properties = (NSMutableDictionary *)[a4 mutableCopy];
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:10];
    v7->_receivedFrames = (NSMutableArray *)v8;
    if (v7->_properties) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {

      return 0;
    }
  }
  return v7;
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    id v6 = a3;
    v7 = self;
    v5 = "-[CECFakeInterface scheduleWithDispatchQueue:]";
    LogPrintF();
  }
  if (![(CoreRCInterface *)self serialQueue])
  {
    [(CoreRCInterface *)self setSerialQueue:a3];
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    id v6 = a3;
    v7 = self;
    v5 = "-[CECFakeInterface unscheduleFromDispatchQueue:]";
    LogPrintF();
  }
  if ([(CoreRCInterface *)self serialQueue] == a3)
  {
    [(CoreRCInterface *)self setSerialQueue:0];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CECFakeInterface;
  [(CoreRCInterface *)&v3 dealloc];
}

- (BOOL)errorIsNack:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqualToString:", @"com.apple.private.CoreCEC.ErrorDomain");
  if (v4) {
    LOBYTE(v4) = [a3 code] == 2;
  }
  return v4;
}

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v9 = [(CoreRCInterface *)self listener];
  CECFrame v11 = *a3;
  return [(CoreRCInterfaceListener *)v9 interface:self sendFrame:&v11 withRetryCount:v6 error:a5];
}

- (void)receivedFrame:(CECFrame *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(CECInterface *)self snoopingMode])
  {
LABEL_7:
    uint64_t v6 = [(CECInterface *)self delegate];
    long long v7 = *(_OWORD *)a3->blocks;
    int v8 = *((_DWORD *)a3 + 4);
    [(CECInterfaceDelegate *)v6 interface:self receivedFrame:&v7];
    return;
  }
  if ((~a3->blocks[0] & 0xF) == 0
    || (([(CECInterface *)self addressMask] >> (a3->blocks[0] & 0xF)) & 1) != 0)
  {
    long long v9 = *(_OWORD *)a3->blocks;
    int v10 = *((_DWORD *)a3 + 4);
    [(CECInterface *)self setLastReceivedFrame:&v9];
    if ((unint64_t)objc_msgSend(-[CECFakeInterface receivedFrames](self, "receivedFrames"), "count") >= 0x15) {
      objc_msgSend(-[CECFakeInterface receivedFrames](self, "receivedFrames"), "removeObjectAtIndex:", 0);
    }
    id v5 = [(CECFakeInterface *)self receivedFrames];
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3, 20));
    goto LABEL_7;
  }
  if (gLogCategory_CoreRCInterface <= 90
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)receivedFrames
{
  return self->_receivedFrames;
}

- (void)clearReceivedFrames
{
}

- (CECFrame)lastReceivedFrameWithOpcode:(SEL)a3 andHeader:(unsigned __int8)a4
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)retstr->blocks = 0;
  *(void *)&retstr->blocks[8] = 0;
  *((_DWORD *)retstr + 4) = 0;
  result = (CECFrame *)[(NSMutableArray *)self->_receivedFrames count];
  if (result)
  {
    int v10 = (void *)[(NSMutableArray *)self->_receivedFrames reverseObjectEnumerator];
    for (i = v10; ; int v10 = i)
    {
      result = (CECFrame *)[v10 nextObject];
      if (!result) {
        break;
      }
      long long v12 = 0uLL;
      int v13 = 0;
      result = (CECFrame *)[(CECFrame *)result getBytes:&v12 length:20];
      if (BYTE1(v12) == v6 && (v5 == 255 || v12 == v5))
      {
        *(_OWORD *)retstr->blocks = v12;
        *((_DWORD *)retstr + 4) = v13;
        return result;
      }
    }
  }
  return result;
}

- (CECFrame)lastReceivedFrameWithOpcode:(SEL)a3
{
  if (self) {
    return (CECFrame *)[(CECFrame *)self lastReceivedFrameWithOpcode:a4 andHeader:255];
  }
  *(void *)retstr->blocks = 0;
  *(void *)&retstr->blocks[8] = 0;
  *((_DWORD *)retstr + 4) = 0;
  return self;
}

- (BOOL)pingTo:(unsigned __int8)a3 acknowledged:(BOOL *)a4 error:(id *)a5
{
  uint64_t v7 = a3;
  long long v9 = [(CoreRCInterface *)self listener];
  return [(CoreRCInterfaceListener *)v9 interface:self pingTo:v7 acknowledged:a4 error:a5];
}

- (id)properties
{
  return self->_properties;
}

- (void)fakePropertiesChanged:(id)a3
{
  self->_properties = (NSMutableDictionary *)[a3 mutableCopy];
  int v5 = [(CECInterface *)self delegate];
  [(CECInterfaceDelegate *)v5 interfacePropertiesChanged:self];
}

- (void)fakeTerminated
{
  objc_super v3 = [(CoreRCInterface *)self listener];
  [(CoreRCInterfaceListener *)v3 removeInterface:self];
}

- (void)fakeHotPlugDetect:(BOOL)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:a3], @"kCECInterfacePropertyHasLink");
  int v4 = [(CECInterface *)self delegate];
  [(CECInterfaceDelegate *)v4 interfacePropertiesChanged:self];
}

- (void)fakeHotPlugDetectWithPhysicalAddress:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  [(NSMutableDictionary *)self->_properties setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"kCECInterfacePropertyHasLink"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedShort:v3], @"kCECInterfacePropertyPhysicalAddress");
  int v5 = [(CECInterface *)self delegate];
  [(CECInterfaceDelegate *)v5 interfacePropertiesChanged:self];
}

@end