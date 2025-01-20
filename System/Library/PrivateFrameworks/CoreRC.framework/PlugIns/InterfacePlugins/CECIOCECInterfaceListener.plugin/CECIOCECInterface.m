@interface CECIOCECInterface
+ (id)interfaceWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4;
- (BOOL)errorIsNack:(id)a3;
- (BOOL)hibernate;
- (BOOL)hpd;
- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4;
- (CECIOCECInterface)init;
- (CECIOCECInterface)initWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4;
- (OS_dispatch_workloop)receiveWorkloop;
- (__IOCECInterface)iocecInterface;
- (id)properties;
- (unsigned)packedPhysicalAddress;
- (void)_close;
- (void)_interfaceTerminated:(__IOCECInterface *)a3;
- (void)_open;
- (void)_updateStatusWithPhysicalAddress:(unsigned __int16)a3 HPD:(BOOL)a4 hibernate:(BOOL)a5;
- (void)dealloc;
- (void)scheduleWithDispatchQueue:(id)a3;
- (void)setHibernate:(BOOL)a3;
- (void)setHpd:(BOOL)a3;
- (void)setPackedPhysicalAddress:(unsigned __int16)a3;
- (void)setReceiveWorkloop:(id)a3;
- (void)unscheduleFromDispatchQueue:(id)a3;
@end

@implementation CECIOCECInterface

+ (id)interfaceWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4
{
  v4 = [[CECIOCECInterface alloc] initWithIOCECInterface:a3 listener:a4];
  return v4;
}

- (CECIOCECInterface)init
{
  +[NSException raise:NSInternalInconsistencyException format:@"use +interfaceWithIOCECInterface:listener:"];
  return 0;
}

- (CECIOCECInterface)initWithIOCECInterface:(__IOCECInterface *)a3 listener:(id)a4
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    v10 = self;
    v11 = "-[CECIOCECInterface initWithIOCECInterface:listener:]";
    LogPrintF();
  }
  v12.receiver = self;
  v12.super_class = (Class)CECIOCECInterface;
  v7 = [(CECIOCECInterface *)&v12 init];
  if (v7)
  {
    v8 = (CoreRCInterfaceListener *)a4;
    v7->_listener = v8;
    if (v8 && (v7->_iocecInterface = a3) != 0)
    {
      CFRetain(a3);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  if (gLogCategory_CoreRCInterface <= 50
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    v3 = self;
    v4 = "-[CECIOCECInterface dealloc]";
    LogPrintF();
  }
  -[CECIOCECInterface setDelegate:](self, "setDelegate:", 0, v3, v4);
  if (self->_iocecInterface)
  {
    [(CECIOCECInterface *)self _close];
    CFRelease(self->_iocecInterface);
    self->_iocecInterface = 0;
  }

  self->_listener = 0;
  v5.receiver = self;
  v5.super_class = (Class)CECIOCECInterface;
  [(CECIOCECInterface *)&v5 dealloc];
}

- (void)_open
{
  id v3 = [(CECIOCECInterface *)self serialQueue];
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    iocecInterface = self->_iocecInterface;
    id v12 = v3;
    v9 = "-[CECIOCECInterface _open]";
    BOOL isOpen = self->_isOpen;
    v8 = self;
    LogPrintF();
  }
  if (!self->_isOpen && self->_iocecInterface && v3 != 0)
  {
    uint64_t v5 = IOCECInterfaceOpenReceiveQueue();
    if (gLogCategory_CoreRCInterface <= 40
      && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
    {
      v9 = "-[CECIOCECInterface _open]";
      BOOL isOpen = v5;
      v8 = self;
      LogPrintF();
    }
    if (!v5)
    {
      IOCECInterfaceRegisterTerminatedCallback();
      IOCECInterfaceRegisterReceiveCallback();
      IOCECInterfaceRegisterStatusCallback();
      [(CECIOCECInterface *)self setReceiveWorkloop:dispatch_workloop_create_inactive("IOCECInterface - Receive Workloop")];
      if ([(CECIOCECInterface *)self receiveWorkloop])
      {
        [(CECIOCECInterface *)self receiveWorkloop];
        dispatch_workloop_set_scheduler_priority();
        dispatch_activate((dispatch_object_t)[(CECIOCECInterface *)self receiveWorkloop]);
        [(CECIOCECInterface *)self receiveWorkloop];
        IOCECInterfaceScheduleWithDispatchQueue();
        self->_BOOL isOpen = 1;
        v6 = v14;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v7 = sub_1FC4;
        goto LABEL_18;
      }
      if (gLogCategory_CoreRCInterface <= 120
        && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    v6 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v7 = sub_2104;
LABEL_18:
    v6[2] = v7;
    v6[3] = &unk_4188;
    v6[4] = self;
    -[CECIOCECInterface dispatchAsyncHighPriority:](self, "dispatchAsyncHighPriority:", v8, v9, isOpen, iocecInterface, v12);
  }
}

- (void)_close
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_isOpen)
  {
    if ([(CECIOCECInterface *)self receiveWorkloop])
    {
      [(CECIOCECInterface *)self receiveWorkloop];
      IOCECInterfaceUnscheduleFromDispatchQueue();
      IOCECInterfaceRegisterStatusCallback();
      IOCECInterfaceRegisterReceiveCallback();
      IOCECInterfaceRegisterTerminatedCallback();
    }
    IOCECInterfaceCloseReceiveQueue();
    v3.receiver = self;
    v3.super_class = (Class)CECIOCECInterface;
    [(CECIOCECInterface *)&v3 setAddressMask:0 error:0];
    self->_BOOL isOpen = 0;

    [(CECIOCECInterface *)self setReceiveWorkloop:0];
  }
}

- (BOOL)setHardwareAddressMask:(unsigned __int16)a3 error:(id *)a4
{
  if (self->_isOpen) {
    int v5 = IOCECInterfaceSetLogicalAddressMask();
  }
  else {
    int v5 = -536870195;
  }
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v5 && a4) {
    *a4 = +[NSError errorWithDomain:NSMachErrorDomain code:v5 userInfo:0];
  }
  return v5 == 0;
}

- (BOOL)errorIsNack:(id)a3
{
  if (a3)
  {
    unsigned int v4 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSMachErrorDomain);
    if (v4) {
      LOBYTE(v4) = [a3 code] == (id)-535724032;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)sendFrame:(CECFrame *)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  int v7 = -536870206;
  long long __dst = 0uLL;
  char v12 = 0;
  if (self->_isOpen)
  {
    char v8 = *((unsigned char *)a3 + 16);
    if ((v8 & 0x1Fu) - 17 >= 0xFFFFFFF0)
    {
      memcpy(&__dst, a3, v8 & 0x1F);
      char v12 = v12 & 0xF0 | (v8 - 1) & 0xF;
      int v7 = IOCECInterfaceSendFrame();
      if (!v7) {
        return 1;
      }
    }
  }
  else
  {
    int v7 = -536870195;
  }
  if (!a5) {
    return 0;
  }
  v10 = +[NSError errorWithDomain:NSMachErrorDomain code:v7 userInfo:0];
  BOOL result = 0;
  *a5 = v10;
  return result;
}

- (id)properties
{
  if (gLogCategory_CoreRCInterface <= 10
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    int v5 = "-[CECIOCECInterface properties]";
    uint64_t packedPhysicalAddress = self->_packedPhysicalAddress;
    LogPrintF();
  }
  v7[0] = kCECInterfacePropertyIsValid;
  v7[1] = kCECInterfacePropertyHasLink;
  if (self->_hpd) {
    objc_super v3 = &__kCFBooleanTrue;
  }
  else {
    objc_super v3 = &__kCFBooleanFalse;
  }
  v8[0] = &__kCFBooleanTrue;
  v8[1] = v3;
  v7[2] = kCECInterfacePropertyPhysicalAddress;
  v8[2] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_packedPhysicalAddress, v5, packedPhysicalAddress);
  return +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (void)_updateStatusWithPhysicalAddress:(unsigned __int16)a3 HPD:(BOOL)a4 hibernate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = a3;
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    v9 = self;
    v10 = "-[CECIOCECInterface _updateStatusWithPhysicalAddress:HPD:hibernate:]";
    BOOL v12 = v6;
    BOOL v13 = v5;
    uint64_t v11 = v7;
    LogPrintF();
  }
  -[CECIOCECInterface setPackedPhysicalAddress:](self, "setPackedPhysicalAddress:", v7, v9, v10, v11, v12, v13);
  [(CECIOCECInterface *)self setHpd:v6];
  if ([(CECIOCECInterface *)self hibernate] != v5)
  {
    [(CECIOCECInterface *)self setHibernate:v5];
    [(CECIOCECInterface *)self hibernationChanged:v5];
  }
  [(CECIOCECInterface *)self didChangeProperties];
}

- (void)_interfaceTerminated:(__IOCECInterface *)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_iocecInterface == a3)
  {
    listener = self->_listener;
    [(CoreRCInterfaceListener *)listener removeInterface:self];
  }
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    BOOL v6 = "-[CECIOCECInterface scheduleWithDispatchQueue:]";
    id v7 = a3;
    BOOL v5 = self;
    LogPrintF();
  }
  if (![(CECIOCECInterface *)self serialQueue])
  {
    [(CECIOCECInterface *)self setSerialQueue:a3];
    [(CECIOCECInterface *)self _open];
  }
}

- (void)unscheduleFromDispatchQueue:(id)a3
{
  if (gLogCategory_CoreRCInterface <= 40
    && (gLogCategory_CoreRCInterface != -1 || _LogCategory_Initialize()))
  {
    BOOL v6 = "-[CECIOCECInterface unscheduleFromDispatchQueue:]";
    id v7 = a3;
    BOOL v5 = self;
    LogPrintF();
  }
  if ([(CECIOCECInterface *)self serialQueue] == a3)
  {
    [(CECIOCECInterface *)self _close];
    [(CECIOCECInterface *)self setSerialQueue:0];
  }
}

- (OS_dispatch_workloop)receiveWorkloop
{
  return self->_receiveWorkloop;
}

- (void)setReceiveWorkloop:(id)a3
{
}

- (__IOCECInterface)iocecInterface
{
  return self->_iocecInterface;
}

- (BOOL)hpd
{
  return self->_hpd;
}

- (void)setHpd:(BOOL)a3
{
  self->_hpd = a3;
}

- (BOOL)hibernate
{
  return self->_hibernate;
}

- (void)setHibernate:(BOOL)a3
{
  self->_hibernate = a3;
}

- (unsigned)packedPhysicalAddress
{
  return self->_packedPhysicalAddress;
}

- (void)setPackedPhysicalAddress:(unsigned __int16)a3
{
  self->_uint64_t packedPhysicalAddress = a3;
}

@end