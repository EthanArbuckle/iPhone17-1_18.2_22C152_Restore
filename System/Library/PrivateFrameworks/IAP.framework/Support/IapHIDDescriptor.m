@interface IapHIDDescriptor
- (BOOL)areOutReportsAvailable;
- (BOOL)handleInReport:(char *)a3 withLength:(unsigned int)a4;
- (BOOL)handleOutReport:(char *)a3 withLength:(int64_t)a4;
- (IapHIDDescriptor)init;
- (IapHIDDescriptor)initWithReportIndex:(unsigned __int8)a3 andVID:(unsigned __int16)a4 andPID:(unsigned __int16)a5 andCountryCode:(unsigned __int8)a6 andTransport:(void *)a7 andHIDDescriptor:(id)a8;
- (id)dequeueOutReport;
- (void)dealloc;
- (void)queueOutReport:(id)a3;
@end

@implementation IapHIDDescriptor

- (IapHIDDescriptor)init
{
  return 0;
}

- (IapHIDDescriptor)initWithReportIndex:(unsigned __int8)a3 andVID:(unsigned __int16)a4 andPID:(unsigned __int16)a5 andCountryCode:(unsigned __int8)a6 andTransport:(void *)a7 andHIDDescriptor:(id)a8
{
  uint64_t v11 = a5;
  uint64_t v12 = a4;
  v38.receiver = self;
  v38.super_class = (Class)IapHIDDescriptor;
  result = [(IapHIDDescriptor *)&v38 init];
  v15 = result;
  if (!result) {
    return v15;
  }
  if (!a7) {
    goto LABEL_7;
  }
  if (((unint64_t)&result->_transport & 7) != 0) {
    goto LABEL_26;
  }
  result->_transport = a7;
  if ((a7 & 7) != 0) {
    goto LABEL_26;
  }
  unsigned int v16 = (*(uint64_t (**)(void *))(*(void *)a7 + 216))(a7);
  if (v16 <= 3) {
    CFStringRef v17 = *(&off_100121B48 + (int)v16);
  }
  else {
LABEL_7:
  }
    CFStringRef v17 = &stru_10012A858;
  CFStringRef v36 = v17;
  result = (IapHIDDescriptor *)sub_1000DB62C();
  if (result && (result & 7) == 0)
  {
    result = (IapHIDDescriptor *)(*((uint64_t (**)(IapHIDDescriptor *, void *))result->super.isa + 13))(result, a7);
    if (result)
    {
      if ((result & 7) != 0) {
        goto LABEL_26;
      }
      v18 = (unsigned __int8 *)(*((uint64_t (**)(IapHIDDescriptor *))result->super.isa + 13))(result);
    }
    else
    {
      v18 = 0;
    }
    v19 = +[NSString stringWithUTF8String:"ReportDescriptor"];
    v20 = +[NSNumber numberWithUnsignedInt:v12];
    v34 = +[NSString stringWithUTF8String:"VendorID"];
    v21 = +[NSNumber numberWithUnsignedInt:v11];
    v33 = +[NSString stringWithUTF8String:"ProductID"];
    v22 = +[NSNumber numberWithChar:(char)a6];
    v32 = +[NSString stringWithUTF8String:"CountryCode"];
    v23 = +[NSString stringWithUTF8String:"Transport"];
    result = (IapHIDDescriptor *)NSNumber;
    id v37 = a8;
    v35 = v19;
    v31 = v23;
    if (v18)
    {
      if (v18 & 3) != 0 || (((_BYTE)v18 + 64) & 3) != 0 || ((v18 + 66)) {
        goto LABEL_26;
      }
      v30 = +[NSNumber numberWithUnsignedInt:(v18[64] << 16) | (v18[65] << 8) | v18[66]];
      v29 = +[NSString stringWithUTF8String:"VersionNumber"];
      CFStringRef v24 = +[NSString stringWithUTF8String:v18 + 104];
      v25 = +[NSString stringWithUTF8String:"Manufacturer"];
      CFStringRef v26 = +[NSString stringWithUTF8String:v18 + 168];
      v27 = +[NSString stringWithUTF8String:"Product"];
      CFStringRef v28 = +[NSString stringWithUTF8String:v18 + 232];
    }
    else
    {
      v30 = +[NSNumber numberWithUnsignedInt:0];
      v29 = +[NSString stringWithUTF8String:"VersionNumber"];
      v25 = +[NSString stringWithUTF8String:"Manufacturer"];
      v27 = +[NSString stringWithUTF8String:"Product"];
      CFStringRef v26 = &stru_10012A858;
      CFStringRef v24 = &stru_10012A858;
      CFStringRef v28 = &stru_10012A858;
    }
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v37, v35, v20, v34, v21, v33, v22, v32, @"iAP", v31, v30, v29, v24, v25, v26, v27, v28,
      +[NSString stringWithUTF8String:"SerialNumber"],
      v36,
      +[NSString stringWithUTF8String:"LocationID"],
      +[NSNumber numberWithBool:1],
      +[NSString stringWithUTF8String:"Authenticated"],
      0);
    result = (IapHIDDescriptor *)objc_alloc_init((Class)NSLock);
    if ((((_BYTE)v15 + 32) & 7) == 0)
    {
      v15->_outReportsLock = (NSLock *)result;
      result = (IapHIDDescriptor *)IOHIDUserDeviceCreate();
      if (((unint64_t)&v15->_deviceRef & 7) == 0)
      {
        v15->_deviceRef = (__IOHIDUserDevice *)result;
        if (result)
        {
          CFRunLoopGetMain();
          IOHIDUserDeviceScheduleWithRunLoop();
          IOHIDUserDeviceRegisterSetReportCallback();
          v15->_outReportsReadSinceLastEvent = 1;
          v15->_reportIndex = a3;
        }
        else
        {
          NSLog(@"ERROR - %s:%s - %d IOHIDUserDeviceCreate failed", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm", "-[IapHIDDescriptor initWithReportIndex:andVID:andPID:andCountryCode:andTransport:andHIDDescriptor:]", 93);
          [(IapHIDDescriptor *)v15 dealloc];
          return 0;
        }
        return v15;
      }
    }
  }
LABEL_26:
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  p_deviceRef = &self->_deviceRef;
  if (((unint64_t)&self->_deviceRef & 7) != 0) {
    goto LABEL_11;
  }
  if (*p_deviceRef)
  {
    CFRunLoopGetMain();
    IOHIDUserDeviceUnscheduleFromRunLoop();
    CFRelease(*p_deviceRef);
    *p_deviceRef = 0;
  }
  p_outReportsLock = &self->_outReportsLock;
  if (((unint64_t)&self->_outReportsLock & 7) != 0
    || ([(NSLock *)self->_outReportsLock lock],
        p_outReports = &self->_outReports,
        ((unint64_t)&self->_outReports & 7) != 0))
  {
LABEL_11:
    __break(0x5516u);
  }
  else
  {
    if (*p_outReports)
    {

      *p_outReports = 0;
    }
    [(NSLock *)*p_outReportsLock unlock];
    if (*p_outReportsLock)
    {

      *p_outReportsLock = 0;
    }
    v6.receiver = self;
    v6.super_class = (Class)IapHIDDescriptor;
    [(IapHIDDescriptor *)&v6 dealloc];
  }
}

- (BOOL)handleInReport:(char *)a3 withLength:(unsigned int)a4
{
  if (((unint64_t)&self->_deviceRef & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    uint64_t v4 = IOHIDUserDeviceHandleReport();
    int v5 = v4;
    if (v4) {
      NSLog(@"ERROR - %s:%s - %d handling HID report failed 0x%x.", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm", "-[IapHIDDescriptor handleInReport:withLength:]", 133, v4);
    }
    LOBYTE(self) = v5 == 0;
  }
  return (char)self;
}

- (BOOL)handleOutReport:(char *)a3 withLength:(int64_t)a4
{
  if (a4 < 0)
  {
    NSLog(@"ERROR - %s:%s - %d HID report length is less than 0, not sending report", a2, a3, "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IapHIDDescriptor.mm", "-[IapHIDDescriptor handleOutReport:withLength:]", 143);
  }
  else
  {
    id v5 = [objc_alloc((Class)NSData) initWithBytes:a3 length:a4];
    [(IapHIDDescriptor *)self queueOutReport:v5];
  }
  return 1;
}

- (BOOL)areOutReportsAvailable
{
  p_outReportsLock = &self->_outReportsLock;
  if (((unint64_t)&self->_outReportsLock & 7) != 0
    || (v3 = self,
        LOBYTE(self) = [(NSLock *)self->_outReportsLock lock],
        v3->_outReportsReadSinceLastEvent = 1,
        p_outReports = (id *)&v3->_outReports,
        ((unint64_t)&v3->_outReports & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    if (*p_outReports) {
      BOOL v5 = [*p_outReports count] != 0;
    }
    else {
      BOOL v5 = 0;
    }
    [(NSLock *)*p_outReportsLock unlock];
    LOBYTE(self) = v5;
  }
  return (char)self;
}

- (void)queueOutReport:(id)a3
{
  p_outReportsLock = &self->_outReportsLock;
  if (((unint64_t)&self->_outReportsLock & 7) != 0) {
    goto LABEL_14;
  }
  [(NSLock *)self->_outReportsLock lock];
  unsigned int outReportsReadSinceLastEvent = self->_outReportsReadSinceLastEvent;
  if (outReportsReadSinceLastEvent >= 2)
  {
LABEL_15:
    __break(0x550Au);
    return;
  }
  self->_unsigned int outReportsReadSinceLastEvent = 0;
  p_outReports = &self->_outReports;
  if (((unint64_t)&self->_outReports & 7) != 0)
  {
LABEL_14:
    __break(0x5516u);
    goto LABEL_15;
  }
  v8 = *p_outReports;
  if (!*p_outReports)
  {
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id *p_outReports = v8;
  }
  [(NSMutableArray *)v8 addObject:a3];
  [(NSLock *)*p_outReportsLock unlock];
  if (outReportsReadSinceLastEvent)
  {
    uint64_t v9 = sub_10002B778();
    if (v9 && (v9 & 7) == 0 && (((_BYTE)self + 16) & 7) == 0)
    {
      transport = self->_transport;
      unsigned int reportIndex = self->_reportIndex;
      sub_10002C08C(v9, (uint64_t)transport, reportIndex);
      return;
    }
    goto LABEL_14;
  }
}

- (id)dequeueOutReport
{
  v2 = (id *)((char *)self + 32);
  if ((((unint64_t)self + 32) & 7) != 0
    || (v3 = (char *)self,
        self = [*((id *)self + 4) lock],
        v3[48] = 1,
        uint64_t v4 = (id *)(v3 + 40),
        ((unint64_t)(v3 + 40) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    id v5 = [*v4 objectAtIndex:0];
    [*v4 removeObjectAtIndex:0];
    if (![*v4 count])
    {

      *uint64_t v4 = 0;
    }
    [*v2 unlock];
    return v5;
  }
  return self;
}

@end