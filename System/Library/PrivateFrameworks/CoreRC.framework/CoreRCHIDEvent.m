@interface CoreRCHIDEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)getCECUserControl:(CECUserControl *)a3 pressed:(BOOL *)a4;
- (BOOL)isEqualToRCHIDEvent:(id)a3;
- (BOOL)isRepeat;
- (CoreRCHIDEvent)init;
- (CoreRCHIDEvent)initWithCECAudioVolumeLevel:(unsigned __int8)a3;
- (CoreRCHIDEvent)initWithCECDeckControlMode:(unsigned __int8)a3 pressed:(BOOL)a4;
- (CoreRCHIDEvent)initWithCECPlayMode:(unsigned __int8)a3 pressed:(BOOL)a4;
- (CoreRCHIDEvent)initWithCECUserControl:(CECUserControl)a3 pressed:(BOOL)a4;
- (CoreRCHIDEvent)initWithCoder:(id)a3;
- (CoreRCHIDEvent)initWithCommand:(unint64_t)a3 pressed:(BOOL)a4;
- (CoreRCHIDEvent)initWithCommand:(unint64_t)a3 pressed:(BOOL)a4 timestamp:(unint64_t)a5;
- (CoreRCHIDEvent)initWithIOHIDEvent:(__IOHIDEvent *)a3;
- (__IOHIDEvent)event;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)initKeyboardEventWithUsagePage:(unsigned int)a3 usageID:(unsigned int)a4 pressed:(BOOL)a5 timestamp:(unint64_t)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getCommand:(unint64_t *)a3 pressed:(BOOL *)a4;
@end

@implementation CoreRCHIDEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  event = self->_event;
  if (event) {
    CFRelease(event);
  }
  v4.receiver = self;
  v4.super_class = (Class)CoreRCHIDEvent;
  [(CoreRCHIDEvent *)&v4 dealloc];
}

- (CoreRCHIDEvent)init
{
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"use -initWithCommand:pressed:"];
  return 0;
}

- (CoreRCHIDEvent)initWithIOHIDEvent:(__IOHIDEvent *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CoreRCHIDEvent;
  objc_super v4 = [(CoreRCHIDEvent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_event = a3;
      CFRetain(a3);
    }
    else
    {

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"event must not be null"];
      return 0;
    }
  }
  return v5;
}

- (CoreRCHIDEvent)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CoreRCHIDEvent;
  objc_super v4 = [(CoreRCHIDEvent *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"IOHIDEvent"];
    uint64_t v6 = MEMORY[0x24C5DBC10](*MEMORY[0x263EFFB08], v5);
    if (v6)
    {
      v4->_event = (__IOHIDEvent *)v6;
    }
    else
    {

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"event must not be null"];
      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [(CoreRCHIDEvent *)self event];
  id Data = (id)IOHIDEventCreateData();
  [a3 encodeObject:Data forKey:@"IOHIDEvent"];
}

- (id)initKeyboardEventWithUsagePage:(unsigned int)a3 usageID:(unsigned int)a4 pressed:(BOOL)a5 timestamp:(unint64_t)a6
{
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  objc_super v8 = [(CoreRCHIDEvent *)self initWithIOHIDEvent:KeyboardEvent];
  if (KeyboardEvent) {
    CFRelease(KeyboardEvent);
  }
  return v8;
}

- (CoreRCHIDEvent)initWithCommand:(unint64_t)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = mach_absolute_time();
  return [(CoreRCHIDEvent *)self initWithCommand:a3 pressed:v4 timestamp:v7];
}

- (CoreRCHIDEvent)initWithCommand:(unint64_t)a3 pressed:(BOOL)a4 timestamp:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v10 = 0;
  if (CoreRCCommandToHIDUsage(a3, (_DWORD *)&v10 + 1, &v10)) {
    return (CoreRCHIDEvent *)[(CoreRCHIDEvent *)self initKeyboardEventWithUsagePage:HIDWORD(v10) usageID:v10 pressed:v6 timestamp:a5];
  }
  if (gLogCategory_CoreRCHID <= 60 && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize()))
  {
    CoreRCCommandString(a3);
    LogPrintF();
  }

  return 0;
}

- (id)debugDescription
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCHIDEvent description](self, "description"));
  event = self->_event;
  if (event)
  {
    uint64_t v5 = (__CFString *)CFCopyDescription(event);
    [v3 appendFormat:@" IOHIDEvent:\n%@", v5];
  }
  return v3;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)CoreRCHIDEvent;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreRCHIDEvent description](&v14, sel_description));
  if (self->_event)
  {
    unint64_t v13 = 0;
    char v12 = 0;
    [(CoreRCHIDEvent *)self getCommand:&v13 pressed:&v12];
    if (v13)
    {
      BOOL v4 = CoreRCCommandString(v13);
      if (v12) {
        uint64_t v5 = "YES";
      }
      else {
        uint64_t v5 = "NO";
      }
      [v3 appendFormat:@" command: %@; pressed: %s;", v4, v5, v11];
    }
    else if (self->_event && IOHIDEventGetType() == 3)
    {
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      uint64_t v8 = IOHIDEventGetIntegerValue();
      uint64_t v9 = IOHIDEventGetIntegerValue();
      uint64_t v10 = "YES";
      if (!v9) {
        uint64_t v10 = "NO";
      }
      objc_msgSend(v3, "appendFormat:", @" usagePage: %u; usageID: %u; pressed: %s;", IntegerValue, v8, v10);
    }
  }
  return v3;
}

- (__IOHIDEvent)event
{
  return self->_event;
}

- (BOOL)isEqualToRCHIDEvent:(id)a3
{
  uint64_t v4 = [a3 event];
  if (self->_event) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  int Type = IOHIDEventGetType();
  if (Type != IOHIDEventGetType()) {
    return 0;
  }
  if (IOHIDEventGetType() != 3) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  if (IntegerValue != IOHIDEventGetIntegerValue()) {
    return 0;
  }
  uint64_t v8 = IOHIDEventGetIntegerValue();
  return v8 == IOHIDEventGetIntegerValue();
}

- (BOOL)isRepeat
{
  event = self->_event;
  if (event) {
    LOBYTE(event) = IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue() != 0;
  }
  return (char)event;
}

- (void)getCommand:(unint64_t *)a3 pressed:(BOOL *)a4
{
  if (self->_event
    && IOHIDEventGetType() == 3
    && (uint64_t IntegerValue = IOHIDEventGetIntegerValue(),
        unsigned int v7 = IOHIDEventGetIntegerValue(),
        CoreRCCommandFromHIDUsage((uint64_t *)a3, IntegerValue, v7)))
  {
    *a4 = IOHIDEventGetIntegerValue() != 0;
  }
  else
  {
    *a3 = 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CoreRCHIDEvent *)self event];
  return (id)[v4 initWithIOHIDEvent:v5];
}

- (BOOL)getCECUserControl:(CECUserControl *)a3 pressed:(BOOL *)a4
{
  uint64_t v6 = 0;
  [(CoreRCHIDEvent *)self getCommand:&v6 pressed:a4];
  return CECUserControlForCoreRCCommand((char *)a3, v6);
}

- (CoreRCHIDEvent)initWithCECUserControl:(CECUserControl)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v8 = 0;
  if (CoreRCCommandForCECUserControl(&v8, *(void *)&a3)) {
    return [(CoreRCHIDEvent *)self initWithCommand:v8 pressed:v4];
  }
  if (gLogCategory_CoreRCHID <= 60 && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize()))
  {
    CECUserControlString(*(void *)&a3);
    LogPrintF();
  }

  return 0;
}

- (CoreRCHIDEvent)initWithCECDeckControlMode:(unsigned __int8)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v8 = 0;
  if (CoreRCCommandForCECDeckControlMode(&v8, a3)) {
    return [(CoreRCHIDEvent *)self initWithCommand:v8 pressed:v4];
  }
  if (gLogCategory_CoreRCHID <= 60 && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize()))
  {
    CECDeckControlModeString(a3);
    LogPrintF();
  }

  return 0;
}

- (CoreRCHIDEvent)initWithCECPlayMode:(unsigned __int8)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v8 = 0;
  if (CoreRCCommandForCECPlayMode(&v8, a3)) {
    return [(CoreRCHIDEvent *)self initWithCommand:v8 pressed:v4];
  }
  if (gLogCategory_CoreRCHID <= 60 && (gLogCategory_CoreRCHID != -1 || _LogCategory_Initialize()))
  {
    CECPlayModeString(v5);
    LogPrintF();
  }

  return 0;
}

- (CoreRCHIDEvent)initWithCECAudioVolumeLevel:(unsigned __int8)a3
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  mach_absolute_time();
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  if (VendorDefinedEvent)
  {
    int v5 = (const void *)VendorDefinedEvent;
    self = [(CoreRCHIDEvent *)self initWithIOHIDEvent:VendorDefinedEvent];
    CFRelease(v5);
  }
  return self;
}

@end