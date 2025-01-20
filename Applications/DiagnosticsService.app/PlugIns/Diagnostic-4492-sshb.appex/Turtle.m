@interface Turtle
- (BOOL)configureFrequentBackgroundScan:(BOOL)a3 error:(id *)a4;
- (BOOL)gapSubtraction:(BOOL)a3 error:(id *)a4;
- (SSHBHIDManager)hidManager;
- (SSHBHIDSSHBTurtleDelegate)delegate;
- (Turtle)init;
- (__IOHIDDevice)turtleRef;
- (id)_frequentScanPeriodMs:(id *)a3;
- (id)_getReport:(int)a3 error:(id *)a4;
- (id)bytesToInputPacket:(id *)a3;
- (id)criticalErrors:(id *)a3;
- (void)deviceWasAdded:(__IOHIDDevice *)a3;
- (void)deviceWasRemoved:(__IOHIDDevice *)a3;
- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8;
- (void)setDelegate:(id)a3;
- (void)setHidManager:(id)a3;
- (void)setTurtleRef:(__IOHIDDevice *)a3;
- (void)waitForDuration:(double)a3;
@end

@implementation Turtle

- (Turtle)init
{
  v8.receiver = self;
  v8.super_class = (Class)Turtle;
  v2 = [(Turtle *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SSHBHIDManager);
    hidManager = v2->_hidManager;
    v2->_hidManager = v3;

    v2->_turtleRef = 0;
    v5 = v2->_hidManager;
    v6 = [[SSHBHIDUsage alloc] initWithPrimaryUsage:100 primaryUsagePage:32];
    [(SSHBHIDManager *)v5 registerDevice:v2 forNotificationsFromDeviceWithUsage:v6];
  }
  return v2;
}

- (void)deviceWasAdded:(__IOHIDDevice *)a3
{
  [(Turtle *)self setTurtleRef:a3];
  id v4 = [(Turtle *)self delegate];
  [v4 turtleWasConnected];
}

- (void)deviceWasRemoved:(__IOHIDDevice *)a3
{
  [(Turtle *)self setTurtleRef:0];
  id v4 = [(Turtle *)self delegate];
  [v4 turtleWasDisconnected];
}

- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8
{
  if (!a7)
  {
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v20 = self;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = a6;
      v13 = "%@: Invalid data from callback report ID %u!";
      v14 = v12;
      uint32_t v15 = 18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
LABEL_12:

    return;
  }
  if (a6 != 80)
  {
    v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v20 = self;
      v13 = "%@: Unsupported packet";
      v14 = v12;
      uint32_t v15 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (a8 == 33)
  {
    -[Turtle bytesToInputPacket:](self, "bytesToInputPacket:", a7, *(void *)&a4, *(void *)&a5);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [(Turtle *)self delegate];
    [v11 turtleCallback:v18];
  }
  else
  {
    v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v20 = 80;
      *(_WORD *)&v20[4] = 2048;
      *(void *)&v20[6] = 33;
      __int16 v21 = 2048;
      int64_t v22 = a8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Packet 0x%x length expected %lu, received %lu", buf, 0x1Cu);
    }

    v17 = [(Turtle *)self delegate];
    [v17 turtleCallback:0];
  }
}

- (id)bytesToInputPacket:(id *)a3
{
  id v4 = objc_alloc_init(SSHBHIDSSHBTurtleInputPacket);
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setReportID:a3->var0];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setFrameNumber:a3->var1];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setTimestamp:*(void *)(&a3->var1 + 1)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setCookie_type:BYTE2(a3->var2)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setCookie:*(unsigned __int16 *)((char *)&a3->var2 + 3)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setCapValue:*(unsigned __int16 *)((char *)&a3->var2 + 5)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setGapValue:*(unsigned int *)((char *)&a3->var4 + 1)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setForceValue:*(__int16 *)((char *)&a3->var6 + 1)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setMesaTemperature:*(__int16 *)((char *)&a3->var6 + 3)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setMesaFd:HIBYTE(a3->var7)];
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setMesaFdStuck:LOBYTE(a3->var8)];
  *(float *)&double v5 = (float)*(__int16 *)((char *)&a3->var6 + 3) * 0.25;
  [(SSHBHIDSSHBTurtleInputPacket *)v4 setMesaTemperatureProcessed:v5];

  return v4;
}

- (void)waitForDuration:(double)a3
{
}

- (BOOL)gapSubtraction:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    char v6 = 1;
  }
  else {
    char v6 = 2;
  }
  v13[0] = -95;
  v13[1] = v6;
  v7 = [(Turtle *)self hidManager];
  objc_super v8 = [(Turtle *)self turtleRef];
  v9 = +[NSData dataWithBytes:v13 length:2];
  LODWORD(v12) = 161;
  unsigned __int8 v10 = [v7 setReportForDevice:v8 reportType:0 reportID:161 buffer:v9 error:a4 domain:@"com.apple.DiagnosticsService.Diagnostic-4492.Turtle" code:v12];

  return v10;
}

- (BOOL)configureFrequentBackgroundScan:(BOOL)a3 error:(id *)a4
{
  v7 = [(Turtle *)self _frequentScanPeriodMs:a4];
  objc_super v8 = v7;
  if (v7)
  {
    char v18 = 33;
    unsigned __int16 v19 = (unsigned __int16)[v7 unsignedShortValue];
    if (qword_100014AB0)
    {
      if (a3)
      {
LABEL_4:
        id v9 = +[NSData dataWithBytes:&v18 length:3];
LABEL_8:
        v14 = v9;
        uint32_t v15 = [(Turtle *)self hidManager];
        LODWORD(v17) = 33;
        unsigned __int8 v10 = [v15 setReportForDevice:[self turtleRef] reportType:0 reportID:33 buffer:v14 error:a4 domain:@"com.apple.DiagnosticsService.Diagnostic-4492.Turtle" code:v17];

        goto LABEL_9;
      }
    }
    else
    {
      v11 = [(Turtle *)self hidManager];
      uint64_t v12 = [v11 getReportForDevice:[self turtleRef] reportType:0 reportID:33 error:a4];
      v13 = (void *)qword_100014AB0;
      qword_100014AB0 = v12;

      if (a3) {
        goto LABEL_4;
      }
    }
    id v9 = (id)qword_100014AB0;
    goto LABEL_8;
  }
  unsigned __int8 v10 = 0;
LABEL_9:

  return v10;
}

- (id)_frequentScanPeriodMs:(id *)a3
{
  double v5 = [(Turtle *)self hidManager];
  char v6 = [v5 getReportForDevice:[self turtleRef] reportType:0 reportID:34 error:a3];

  if ([v6 length] == (id)3)
  {
    v7 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)[v6 bytes] + 1));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_getReport:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(Turtle *)self hidManager];
  objc_super v8 = [v7 getReportForDevice:[self turtleRef] reportType:0 reportID:(int)v5 error:a4 domain:@"com.apple.DiagnosticsService.Diagnostic-4492.Turtle" code:v5];

  id v9 = [v8 subdataWithRange:1, [v8 length] - 1];

  return v9;
}

- (id)criticalErrors:(id *)a3
{
  uint64_t v5 = +[NSMutableDictionary dictionary];
  char v6 = [(Turtle *)self _getReport:224 error:a3];
  v7 = [(Turtle *)self _getReport:225 error:a3];
  objc_super v8 = [(Turtle *)self _getReport:226 error:a3];
  id v9 = [(Turtle *)self _getReport:227 error:a3];
  if (v6)
  {
    unsigned int v10 = *(unsigned __int8 *)[v6 bytes];
    v37[0] = @"scan";
    v11 = +[NSNumber numberWithInt:(v10 >> 1) & 1];
    v38[0] = v11;
    v37[1] = @"i2c";
    uint64_t v12 = +[NSNumber numberWithInt:(v10 >> 2) & 1];
    v38[1] = v12;
    v37[2] = @"calibration";
    v13 = +[NSNumber numberWithInt:(v10 >> 3) & 1];
    v38[2] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
    [v5 setObject:v14 forKeyedSubscript:@"general"];
  }
  if (v7)
  {
    uint32_t v15 = (unsigned __int8 *)[v7 bytes];
    v35[0] = @"startScanFailures";
    v30 = +[NSNumber numberWithUnsignedChar:*v15];
    v36[0] = v30;
    v35[1] = @"stopScanFailures";
    v16 = +[NSNumber numberWithUnsignedChar:v15[1]];
    v36[1] = v16;
    v35[2] = @"readScanResultFailures";
    uint64_t v17 = +[NSNumber numberWithUnsignedChar:v15[2]];
    v36[2] = v17;
    char v18 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    [v5 setObject:v18 forKeyedSubscript:@"scan"];
  }
  if (v8)
  {
    unsigned __int16 v19 = (unsigned __int8 *)[v8 bytes];
    v33[0] = @"readFailures";
    v20 = +[NSNumber numberWithUnsignedChar:*v19];
    v33[1] = @"writeFailures";
    v34[0] = v20;
    __int16 v21 = +[NSNumber numberWithUnsignedChar:v19[1]];
    v34[1] = v21;
    int64_t v22 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    [v5 setObject:v22 forKeyedSubscript:@"i2c"];
  }
  if (v9)
  {
    unsigned int v23 = *(unsigned __int8 *)[v9 bytes];
    v31[0] = @"forceCal";
    v24 = +[NSNumber numberWithInt:v23 & 1];
    v32[0] = v24;
    v31[1] = @"gapCal";
    v25 = +[NSNumber numberWithInt:(v23 >> 1) & 1];
    v32[1] = v25;
    v31[2] = @"inverseFilterCal";
    v26 = +[NSNumber numberWithInt:(v23 >> 2) & 1];
    v32[2] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
    [v5 setObject:v27 forKeyedSubscript:@"calibration"];
  }
  id v28 = [v5 copy];

  return v28;
}

- (SSHBHIDSSHBTurtleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSHBHIDSSHBTurtleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSHBHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(id)a3
{
}

- (__IOHIDDevice)turtleRef
{
  return self->_turtleRef;
}

- (void)setTurtleRef:(__IOHIDDevice *)a3
{
  self->_turtleRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end