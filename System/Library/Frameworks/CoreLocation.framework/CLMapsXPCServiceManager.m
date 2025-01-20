@interface CLMapsXPCServiceManager
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (void)clearMemoryAndExitHelperProcessCleanly;
- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10;
- (void)createConnection;
- (void)dealloc;
- (void)onTimerFire:(id)a3;
- (void)releaseMapHelperServiceOSTransaction;
- (void)setConnection:(id)a3;
- (void)updateTimer;
@end

@implementation CLMapsXPCServiceManager

+ (id)sharedInstance
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!qword_1EB2723E0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19078E730;
    block[3] = &unk_1E5696BF0;
    block[4] = a1;
    if (qword_1EB2723E8 != -1) {
      dispatch_once(&qword_1EB2723E8, block);
    }
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    v2 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v2, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,XPCManager allocate", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "+[CLMapsXPCServiceManager sharedInstance]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
  return (id)qword_1EB2723E0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v3 = objc_msgSend(a1, "sharedInstance", a3);

  return v3;
}

- (void)createConnection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.corelocation.maphelperservice"];
  self->_connection = v4;
  if (v4)
  {
    self->fInactivityTimer = 0;
    self->fTimerUpdateMachContTime = -1.0;
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE041158]);
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v9 forSelector:sel_fetchGEORoadDataAroundCoordinate_inRadius_allowNetwork_isPedestrianOrCycling_clearTiles_withReply_ argumentIndex:0 ofReply:1];
    [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:v9 forSelector:sel_fetchGEOBuildingDataAroundCoordinate_inRadius_tileSetStyle_allowNetwork_clearTiles_withReply_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_connection resume];
  }
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
  }
  v10 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v10, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,createConnection", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager createConnection]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
  }
  v3 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,dealloc", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    __int16 v6 = 0;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager dealloc]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLMapsXPCServiceManager *)self releaseMapHelperServiceOSTransaction];
  [(NSXPCConnection *)[(CLMapsXPCServiceManager *)self connection] invalidate];

  [(CLMapsXPCServiceManager *)self setConnection:0];
  v5.receiver = self;
  v5.super_class = (Class)CLMapsXPCServiceManager;
  [(CLMapsXPCServiceManager *)&v5 dealloc];
}

- (void)collectMapDataOfType:(int64_t)a3 aroundCoordinate:(CLLocationCoordinate2D)a4 inRadius:(double)a5 allowNetwork:(BOOL)a6 isPedestrianOrCycling:(BOOL)a7 clearTiles:(BOOL)a8 callSynchronously:(BOOL)a9 WithReply:(id)a10
{
  BOOL v11 = a9;
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v14 = a6;
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  [(CLMapsXPCServiceManager *)self updateTimer];
  connection = self->_connection;
  if (v11)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_19078EEEC;
    v35[3] = &unk_1E5697380;
    v35[4] = a10;
    uint64_t v21 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v35];
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_19078F12C;
    v34[3] = &unk_1E5697380;
    v34[4] = a10;
    uint64_t v21 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v34];
  }
  v22 = (void *)v21;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  double v33 = 0.0;
  uint64_t v23 = mach_continuous_time();
  double v33 = sub_1907E1770(v23);
  if (a3 == 2)
  {
    v24 = (double *)&v27;
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v25 = 1;
    v26 = sub_19078F904;
LABEL_10:
    *((void *)v24 + 2) = v26;
    *((void *)v24 + 3) = &unk_1E56979E8;
    v24[6] = latitude;
    v24[7] = longitude;
    v24[8] = a5;
    *((unsigned char *)v24 + 72) = v11;
    *((void *)v24 + 4) = a10;
    *((void *)v24 + 5) = v32;
    objc_msgSend(v22, "fetchGEOBuildingDataAroundCoordinate:inRadius:tileSetStyle:allowNetwork:clearTiles:withReply:", v25, v14, v12, latitude, longitude, a5, v27, v28);
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    uint64_t v25 = 0;
    v24 = (double *)v29;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v26 = sub_19078F638;
    goto LABEL_10;
  }
  if (a3)
  {
    (*((void (**)(id, void))a10 + 2))(a10, 0);
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_19078F36C;
    v30[3] = &unk_1E56979E8;
    *(double *)&v30[6] = latitude;
    *(double *)&v30[7] = longitude;
    *(double *)&v30[8] = a5;
    BOOL v31 = v11;
    v30[4] = a10;
    v30[5] = v32;
    objc_msgSend(v22, "fetchGEORoadDataAroundCoordinate:inRadius:allowNetwork:isPedestrianOrCycling:clearTiles:withReply:", v14, v13, v12, v30, latitude, longitude, a5);
  }
LABEL_12:
  _Block_object_dispose(v32, 8);
}

- (void)clearMemoryAndExitHelperProcessCleanly
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2723E0)
  {
    id v2 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&unk_1EE005920];
    MEMORY[0x1F4181798](v2, sel_clearMemoryAndExitCleanly);
  }
  else
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    v3 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
      }
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager clearMemoryAndExitHelperProcessCleanly]", "CoreLocation: %s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)updateTimer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->fTimerUpdateMachContTime <= 0.0
    || (uint64_t v3 = mach_continuous_time(), vabdd_f64(sub_1907E1770(v3), self->fTimerUpdateMachContTime) >= 60.0))
  {
    uint64_t v4 = mach_continuous_time();
    self->double fTimerUpdateMachContTime = sub_1907E1770(v4);
    fInactivityTimer = self->fInactivityTimer;
    if (fInactivityTimer)
    {
      [(NSTimer *)fInactivityTimer invalidate];
      self->fInactivityTimer = 0;
    }
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    uint64_t v6 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
      *(_DWORD *)buf = 134349056;
      double v14 = fTimerUpdateMachContTime;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,Inactivity timer updated in XPC manager,updateTime,%{public}.2lf", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
      }
      double v8 = self->fTimerUpdateMachContTime;
      int v11 = 134349056;
      double v12 = v8;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager updateTimer]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_19079022C;
    block[3] = &unk_1E5696BF0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)onTimerFire:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
  }
  uint64_t v4 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,onTimerFire", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager onTimerFire:]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  [(CLMapsXPCServiceManager *)self releaseMapHelperServiceOSTransaction];
}

- (void)releaseMapHelperServiceOSTransaction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F6D0 != -1) {
    dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
  }
  uint64_t v3 = qword_1E929F6D8;
  if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
  {
    double fTimerUpdateMachContTime = self->fTimerUpdateMachContTime;
    *(_DWORD *)buf = 134349056;
    double v10 = fTimerUpdateMachContTime;
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,releaseMapHelperServiceOSTransaction,lastTimerUpdateTime,%{public}.2lf", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  fInactivityTimer = self->fInactivityTimer;
  if (fInactivityTimer)
  {
    [(NSTimer *)fInactivityTimer invalidate];
    self->fInactivityTimer = 0;
    self->double fTimerUpdateMachContTime = -1.0;
  }
  if (qword_1EB2723E0)
  {
    objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", &unk_1EE006320), "releaseOSTransaction");
  }
  else
  {
    if (qword_1E929F6D0 != -1) {
      dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
    }
    uint64_t v6 = qword_1E929F6D8;
    if (os_log_type_enabled((os_log_t)qword_1E929F6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "CLMM,CLTSP,MapHelperService,clearMemoryAndExitHelperProcessCleanly,sharedInstance is nil", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F6D0 != -1) {
        dispatch_once(&qword_1E929F6D0, &unk_1EE006400);
      }
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLMapsXPCServiceManager releaseMapHelperServiceOSTransaction]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end