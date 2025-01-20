@interface _CLLocationPlayer
- (BOOL)hasARSessionTimedOut:(double)a3;
- (BOOL)isARSessionActive;
- (BOOL)isFusionEnabled;
- (BOOL)isNotifierActive;
- (BOOL)isPlayerActive;
- (BOOL)isSimulationEnabled;
- (CLSimulationManager)simulationManager;
- (_CLLocationPlayer)init;
- (double)notifierLastARKitUpdateTime;
- (id).cxx_construct;
- (id)_getFusedLocationFrom:(id)a3 machAbsTime:(double)a4;
- (void)_updateARSessionState:(unint64_t)a3;
- (void)_updateLocation:(CLDaemonLocation *)a3 locationPrivate:(void *)a4;
- (void)_updateVIOEstimation:(id)a3;
- (void)_updateVLLocalizationResult:(id)a3;
- (void)closeARSessionWithState:(unint64_t)a3;
- (void)convertCLLocation:(id)a3 machAbsTime:(double)a4 toDaemonLocation:(CLDaemonLocation *)a5 daemonLocationPrivate:(void *)a6;
- (void)dealloc;
- (void)setArSessionActive:(BOOL)a3;
- (void)setEnableFusion:(BOOL)a3;
- (void)setEnableSimulation:(BOOL)a3;
- (void)setFusionEnabled:(BOOL)a3;
- (void)setNotifierActive:(BOOL)a3;
- (void)setNotifierLastARKitUpdateTime:(double)a3;
- (void)setPlayerActive:(BOOL)a3;
- (void)setSimulationEnabled:(BOOL)a3;
- (void)setSimulationManager:(id)a3;
- (void)start;
- (void)startARSessionWithState:(unint64_t)a3;
- (void)stop;
@end

@implementation _CLLocationPlayer

- (_CLLocationPlayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_CLLocationPlayer;
  v2 = [(_CLLocationPlayer *)&v5 init];
  v3 = (_CLLocationPlayer *)v2;
  if (v2)
  {
    v2[13648] = 1;
    *(_DWORD *)(v2 + 13649) = 0;
    *((void *)v2 + 1707) = 0xBFF0000000000000;
    *((void *)v2 + 1708) = objc_alloc_init(MEMORY[0x263F00AD0]);
  }
  return v3;
}

- (void)dealloc
{
  simulationManager = self->_simulationManager;
  if (simulationManager)
  {

    self->_simulationManager = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_CLLocationPlayer;
  [(_CLLocationPlayer *)&v4 dealloc];
}

- (void)setEnableFusion:(BOOL)a3
{
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    objc_super v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLLP,setEnableFusion:,Cannot set a flag while player is active", v6, 2u);
    }
  }
  else
  {
    self->_fusionEnabled = a3;
  }
}

- (void)setEnableSimulation:(BOOL)a3
{
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    objc_super v5 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLLP,setEnableSimulation:,Cannot set a flag while player is active", v6, 2u);
    }
  }
  else
  {
    self->_simulationEnabled = a3;
  }
}

- (void)start
{
  objc_sync_enter(self);
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v3 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_21B6E4000, v3, OS_LOG_TYPE_ERROR, "CLLP,start,Player is already active - nothing to start", v4, 2u);
    }
  }
  else
  {
    sub_21B6EBAC4(&self->_locationFuser.visionLock_.flag_._Value);
    sub_21B6EBAFC((uint64_t)&self->_locationFuser, 1);
    atomic_store(0, (unsigned __int8 *)&self->_locationFuser.visionLock_);
    [(_CLLocationPlayer *)self setPlayerActive:1];
  }
  objc_sync_exit(self);
}

- (void)stop
{
  objc_sync_enter(self);
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    [(_CLLocationPlayer *)self setPlayerActive:0];
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v3 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_21B6E4000, v3, OS_LOG_TYPE_ERROR, "CLLP,stop,Player is already inactive - nothing to stop", v4, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)_updateARSessionState:(unint64_t)a3
{
  objc_sync_enter(self);
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (a3 == 1)
    {
      if ([(_CLLocationPlayer *)self isNotifierActive])
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
        }
        objc_super v5 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_DEBUG, "CLLP,_updateARSessionState:,New session has started without end notification of previous session", v7, 2u);
        }
        [(_CLLocationPlayer *)self closeARSessionWithState:2];
      }
      [(_CLLocationPlayer *)self startARSessionWithState:1];
    }
    else
    {
      [(_CLLocationPlayer *)self closeARSessionWithState:a3];
    }
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v6 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B6E4000, v6, OS_LOG_TYPE_ERROR, "CLLP,_updateARSessionState:,Player is inactive - need to start the player first", buf, 2u);
    }
  }
  objc_sync_exit(self);
}

- (void)_updateVIOEstimation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (a3)
    {
      [a3 timestamp];
      if (-[_CLLocationPlayer hasARSessionTimedOut:](self, "hasARSessionTimedOut:"))
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
        }
        objc_super v5 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          [a3 timestamp];
          uint64_t v7 = v6;
          [(_CLLocationPlayer *)self notifierLastARKitUpdateTime];
          int v12 = 134349312;
          uint64_t v13 = v7;
          __int16 v14 = 2050;
          uint64_t v15 = v8;
          _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLLP,_updateVIOEstimation,Session has timed out without end notification,nowMachAbsTime,%{public}.3lf,lastARKitUpdate,%{public}.3lf", (uint8_t *)&v12, 0x16u);
        }
        [(_CLLocationPlayer *)self closeARSessionWithState:2];
      }
      if (![(_CLLocationPlayer *)self isNotifierActive])
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
        }
        v9 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_21B6E4000, v9, OS_LOG_TYPE_DEBUG, "CLLP,_updateVIOEstimation:,Payload was sent without start notification of current session", (uint8_t *)&v12, 2u);
        }
        [(_CLLocationPlayer *)self startARSessionWithState:1];
      }
      [a3 timestamp];
      -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:");
      if ([(_CLLocationPlayer *)self isFusionEnabled]) {
        sub_21B6ECF28((unsigned __int8 *)&self->_locationFuser, a3);
      }
      goto LABEL_26;
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v10 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVIOEstimation:,Input estimation is nil";
      goto LABEL_25;
    }
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v10 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVIOEstimation:,Player is inactive - need to start the player first";
LABEL_25:
      _os_log_impl(&dword_21B6E4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 2u);
    }
  }
LABEL_26:
  objc_sync_exit(self);
}

- (void)_updateVLLocalizationResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if ([(_CLLocationPlayer *)self isPlayerActive])
  {
    if (a3)
    {
      [a3 timestamp];
      if (-[_CLLocationPlayer hasARSessionTimedOut:](self, "hasARSessionTimedOut:"))
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
        }
        objc_super v5 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
        {
          [a3 timestamp];
          uint64_t v7 = v6;
          [(_CLLocationPlayer *)self notifierLastARKitUpdateTime];
          int v12 = 134349312;
          uint64_t v13 = v7;
          __int16 v14 = 2050;
          uint64_t v15 = v8;
          _os_log_impl(&dword_21B6E4000, v5, OS_LOG_TYPE_ERROR, "CLLP,_updateVLLocalizationResult,Session has timed out without end notification,nowMachAbsTime,%{public}.3lf,lastARKitUpdate,%{public}.3lf", (uint8_t *)&v12, 0x16u);
        }
        [(_CLLocationPlayer *)self closeARSessionWithState:2];
      }
      if (![(_CLLocationPlayer *)self isNotifierActive])
      {
        if (qword_267C5A9D8 != -1) {
          dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
        }
        v9 = qword_267C5A9E0;
        if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_21B6E4000, v9, OS_LOG_TYPE_DEBUG, "CLLP,_updateVLLocalizationResult:,Payload was sent without start notification of current session", (uint8_t *)&v12, 2u);
        }
        [(_CLLocationPlayer *)self startARSessionWithState:1];
      }
      [a3 timestamp];
      -[_CLLocationPlayer setNotifierLastARKitUpdateTime:](self, "setNotifierLastARKitUpdateTime:");
      if ([(_CLLocationPlayer *)self isFusionEnabled]) {
        sub_21B6ED7E4();
      }
      goto LABEL_26;
    }
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v10 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVLLocalizationResult:,Input localizationResult is nil";
      goto LABEL_25;
    }
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v10 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v11 = "CLLP,_updateVLLocalizationResult:,Player is inactive - need to start the player first";
LABEL_25:
      _os_log_impl(&dword_21B6E4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 2u);
    }
  }
LABEL_26:
  objc_sync_exit(self);
}

- (id)_getFusedLocationFrom:(id)a3 machAbsTime:(double)a4
{
  objc_sync_enter(self);
  if (![(_CLLocationPlayer *)self isPlayerActive])
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    uint64_t v15 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "CLLP,_getFusedLocationFrom:machAbsTime:,Player is inactive - need to start the player first";
    goto LABEL_18;
  }
  if (!a3)
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    uint64_t v15 = qword_267C5A9E0;
    if (!os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "CLLP,_getFusedLocationFrom:machAbsTime:,Input recordedLocation is nil";
LABEL_18:
    _os_log_impl(&dword_21B6E4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
LABEL_19:
    id v14 = 0;
    goto LABEL_20;
  }
  *(void *)&v34[12] = 0;
  *(void *)&v34[4] = 0;
  *(_OWORD *)&v34[20] = xmmword_21B6FE7C0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&v34[36] = _Q0;
  *(_OWORD *)&v34[52] = _Q0;
  *(_OWORD *)&v34[68] = _Q0;
  *(_DWORD *)v34 = 0xFFFF;
  *(_DWORD *)&v34[84] = 0;
  long long v35 = 0uLL;
  *(void *)&v34[88] = 0xBFF0000000000000;
  *(void *)((char *)&v36 + 4) = 0xBFF0000000000000;
  LODWORD(v36) = 0;
  HIDWORD(v36) = 0x7FFFFFFF;
  memset(v37, 0, 25);
  sub_21B6E61A8((uint64_t)buf);
  [(_CLLocationPlayer *)self convertCLLocation:a3 machAbsTime:v34 toDaemonLocation:buf daemonLocationPrivate:a4];
  [(_CLLocationPlayer *)self _updateLocation:v34 locationPrivate:buf];
  if ([(_CLLocationPlayer *)self isFusionEnabled])
  {
    if (self->_locationFuser.activated_
      || (double mach_abs = self->_locationFuser.lastValidVlf_.t.mach_abs, mach_abs > 0.0) && vabdd_f64(v32, mach_abs) <= 24.0)
    {
      sub_21B6EC1E8((unsigned __int8 *)&self->_locationFuser, (uint64_t)v34, (uint64_t)buf);
    }
  }
  long long v28 = v35;
  long long v29 = v36;
  v30[0] = *(_OWORD *)v37;
  *(_OWORD *)((char *)v30 + 12) = *(_OWORD *)&v37[12];
  long long v24 = *(_OWORD *)&v34[32];
  long long v25 = *(_OWORD *)&v34[48];
  long long v26 = *(_OWORD *)&v34[64];
  long long v27 = *(_OWORD *)&v34[80];
  long long v22 = *(_OWORD *)v34;
  long long v23 = *(_OWORD *)&v34[16];
  memset(__src, 0, 512);
  sub_21B6E62D4((uint64_t)buf, __src);
  id v13 = objc_alloc(MEMORY[0x263F00A50]);
  v19[6] = v28;
  v19[7] = v29;
  v20[0] = v30[0];
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)v30 + 12);
  v19[2] = v24;
  v19[3] = v25;
  v19[4] = v26;
  v19[5] = v27;
  v19[0] = v22;
  v19[1] = v23;
  memcpy(v18, __src, sizeof(v18));
  id v14 = (id)[v13 initWithClientLocation:v19 clientLocationPrivate:v18];
  if (v33) {
    sub_21B6E6480(v33);
  }
LABEL_20:
  objc_sync_exit(self);
  return v14;
}

- (void)startARSessionWithState:(unint64_t)a3
{
  [(_CLLocationPlayer *)self setNotifierActive:1];
  [(_CLLocationPlayer *)self setNotifierLastARKitUpdateTime:-1.0];
  [(_CLLocationPlayer *)self setArSessionActive:a3 == 1];
  if ([(_CLLocationPlayer *)self isFusionEnabled])
  {
    sub_21B6ECB14((unsigned __int8 *)&self->_locationFuser, a3);
  }
}

- (void)closeARSessionWithState:(unint64_t)a3
{
  [(_CLLocationPlayer *)self setNotifierActive:0];
  [(_CLLocationPlayer *)self setNotifierLastARKitUpdateTime:-1.0];
  [(_CLLocationPlayer *)self setArSessionActive:a3 == 1];
  if ([(_CLLocationPlayer *)self isFusionEnabled])
  {
    sub_21B6ECB14((unsigned __int8 *)&self->_locationFuser, a3);
  }
}

- (BOOL)hasARSessionTimedOut:(double)a3
{
  BOOL v5 = [(_CLLocationPlayer *)self isNotifierActive];
  if (v5)
  {
    [(_CLLocationPlayer *)self notifierLastARKitUpdateTime];
    if (v6 <= 0.0)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      [(_CLLocationPlayer *)self notifierLastARKitUpdateTime];
      LOBYTE(v5) = vabdd_f64(a3, v7) > 10.0;
    }
  }
  return v5;
}

- (void)convertCLLocation:(id)a3 machAbsTime:(double)a4 toDaemonLocation:(CLDaemonLocation *)a5 daemonLocationPrivate:(void *)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  if (a3) {
    [a3 clientLocation];
  }
  else {
    memset(v55, 0, 156);
  }
  $F24F406B2B787EFB06265DBA3D28CBD5 v10 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&v55[112];
  *(_OWORD *)&a5->var11 = *(_OWORD *)&v55[96];
  a5->var13 = v10;
  *(_OWORD *)&a5->var14 = *(_OWORD *)&v55[128];
  *(_OWORD *)&a5->var16 = *(_OWORD *)&v55[140];
  long long v11 = *(_OWORD *)&v55[48];
  *(_OWORD *)&a5->var3 = *(_OWORD *)&v55[32];
  *(_OWORD *)&a5->var5 = v11;
  long long v12 = *(_OWORD *)&v55[80];
  *(_OWORD *)&a5->var7 = *(_OWORD *)&v55[64];
  *(_OWORD *)&a5->var9 = v12;
  long long v13 = *(_OWORD *)&v55[16];
  *(_OWORD *)&a5->var0 = *(_OWORD *)v55;
  *(_OWORD *)&a5->var1.var1 = v13;
  sub_21B6E61A8((uint64_t)v55);
  memcpy(a6, v55, 0x201uLL);
  long long v14 = v56;
  long long v56 = 0u;
  uint64_t v15 = (std::__shared_weak_count *)*((void *)a6 + 66);
  *(_OWORD *)((char *)a6 + 520) = v14;
  if (v15)
  {
    sub_21B6E6480(v15);
    uint64_t v16 = (std::__shared_weak_count *)*((void *)&v56 + 1);
    long long v17 = v62[0];
    *(_OWORD *)((char *)a6 + 600) = v61;
    *(_OWORD *)((char *)a6 + 616) = v17;
    *(void *)((char *)a6 + 629) = *(void *)((char *)v62 + 13);
    long long v18 = v58;
    *(_OWORD *)((char *)a6 + 536) = v57;
    *(_OWORD *)((char *)a6 + 552) = v18;
    long long v19 = v60;
    *(_OWORD *)((char *)a6 + 568) = v59;
    *(_OWORD *)((char *)a6 + 584) = v19;
    if (v16) {
      sub_21B6E6480(v16);
    }
  }
  else
  {
    long long v20 = v62[0];
    *(_OWORD *)((char *)a6 + 600) = v61;
    *(_OWORD *)((char *)a6 + 616) = v20;
    *(void *)((char *)a6 + 629) = *(void *)((char *)v62 + 13);
    long long v21 = v58;
    *(_OWORD *)((char *)a6 + 536) = v57;
    *(_OWORD *)((char *)a6 + 552) = v21;
    long long v22 = v60;
    *(_OWORD *)((char *)a6 + 568) = v59;
    *(_OWORD *)((char *)a6 + 584) = v22;
  }
  *((double *)a6 + 4) = a4;
  *((double *)a6 + 43) = a4;
  long long v23 = objc_msgSend(a3, "matchInfo", *(void *)v55);
  if (v23)
  {
    long long v24 = v23;
    *((_DWORD *)a6 + 14) = [v23 matchQuality];
    [v24 matchCoordinate];
    *((void *)a6 + 8) = v25;
    [v24 matchCoordinate];
    *((void *)a6 + 9) = v26;
    [v24 matchCourse];
    *((void *)a6 + 10) = v27;
    *((_DWORD *)a6 + 22) = [v24 matchFormOfWay];
    *((_DWORD *)a6 + 23) = [v24 matchRoadClass];
    *((unsigned char *)a6 + 96) = [v24 isMatchShifted];
    objc_msgSend((id)objc_msgSend(v24, "matchDataArray"), "getBytes:length:", (char *)a6 + 104, 64);
  }
  long long v28 = (void *)[a3 _groundAltitude];
  if (v28)
  {
    long long v29 = v28;
    [v28 estimate];
    *((void *)a6 + 47) = v30;
    [v29 uncertainty];
    *((void *)a6 + 48) = v31;
    [v29 undulation];
    *(float *)&double v32 = v32;
    *((_DWORD *)a6 + 79) = LODWORD(v32);
    int v33 = [v29 undulationModel];
  }
  else
  {
    if (![a3 isAltitudeWgs84Available]) {
      goto LABEL_15;
    }
    *((void *)a6 + 47) = 0;
    *((void *)a6 + 48) = 0xBFF0000000000000;
    [a3 altitudeWgs84];
    double v35 = v34;
    [a3 altitude];
    *(float *)&double v36 = v35 - v36;
    *((_DWORD *)a6 + 79) = LODWORD(v36);
    int v33 = 1;
  }
  *((_DWORD *)a6 + 78) = v33;
LABEL_15:
  [a3 rawHorizontalAccuracy];
  *((void *)a6 + 49) = v37;
  [a3 rawAltitude];
  *((void *)a6 + 50) = v38;
  [a3 rawVerticalAccuracy];
  *((void *)a6 + 51) = v39;
  [a3 rawCourseAccuracy];
  *((void *)a6 + 52) = v40;
  [a3 trustedTimestamp];
  *((void *)a6 + 3) = v41;
  [a3 rawHorizontalAccuracy];
  [a3 rawHorizontalAccuracy];
  if (v42 >= 0.0)
  {
    *(_OWORD *)(&a5->var0 + 1) = *(_OWORD *)((char *)&a5->var11 + 4);
    *(double *)((char *)&a5->var1.var1 + 4) = *((double *)a6 + 49);
    HIDWORD(a5->var14) = a5->var15;
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v43 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      [a3 rawHorizontalAccuracy];
      *(_DWORD *)v55 = 134349312;
      *(double *)&v55[4] = a4;
      *(_WORD *)&v55[12] = 2050;
      *(void *)&v55[14] = v44;
      _os_log_impl(&dword_21B6E4000, v43, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawCoordinate,machAbsTime,%{public}.3f,rawHorzAcc,%{public}.3f", v55, 0x16u);
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
      }
    }
    v45 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_21B6E4000, v45, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use coordinate instead of rawCoordinate", v55, 2u);
    }
    *(_OWORD *)((char *)&a5->var11 + 4) = *(_OWORD *)(&a5->var0 + 1);
    *((void *)a6 + 49) = *(void *)((char *)&a5->var1.var1 + 4);
    a5->var15 = HIDWORD(a5->var14);
  }
  [a3 rawVerticalAccuracy];
  [a3 rawVerticalAccuracy];
  if (v46 >= 0.0)
  {
    *(_OWORD *)((char *)&a5->var2 + 4) = *((_OWORD *)a6 + 25);
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v47 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      [a3 rawVerticalAccuracy];
      *(_DWORD *)v55 = 134349312;
      *(double *)&v55[4] = a4;
      *(_WORD *)&v55[12] = 2050;
      *(void *)&v55[14] = v48;
      _os_log_impl(&dword_21B6E4000, v47, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawAltitude,machAbsTime,%{public}.3f,rawVertAcc,%{public}.3f", v55, 0x16u);
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
      }
    }
    v49 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_21B6E4000, v49, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use altitude instead of rawAltitude", v55, 2u);
    }
    *((_OWORD *)a6 + 25) = *(_OWORD *)((char *)&a5->var2 + 4);
  }
  [a3 rawCourseAccuracy];
  [a3 rawCourseAccuracy];
  if (v50 >= 0.0 && ([a3 rawCourse], objc_msgSend(a3, "rawCourse"), v51 >= 0.0))
  {
    *(double *)((char *)&a5->var6 + 4) = *(double *)((char *)&a5->var13.var0 + 4);
    *(double *)((char *)&a5->var7 + 4) = *((double *)a6 + 52);
  }
  else
  {
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    v52 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      [a3 rawCourseAccuracy];
      *(_DWORD *)v55 = 134349312;
      *(double *)&v55[4] = a4;
      *(_WORD *)&v55[12] = 2050;
      *(void *)&v55[14] = v53;
      _os_log_impl(&dword_21B6E4000, v52, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Input does not have valid rawCourse,machAbsTime,%{public}.3f,rawCourseAcc,%{public}.3f", v55, 0x16u);
      if (qword_267C5A9D8 != -1) {
        dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
      }
    }
    v54 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_21B6E4000, v54, OS_LOG_TYPE_DEBUG, "CLLP,convertCLLocation:toDaemonLocation:daemonLocationPrivate:,Will use course instead of rawCourse", v55, 2u);
    }
    *(double *)((char *)&a5->var13.var0 + 4) = *(double *)((char *)&a5->var6 + 4);
    *((void *)a6 + 52) = *(void *)((char *)&a5->var7 + 4);
  }
  *((_WORD *)a6 + 212) = 0;
  *((_OWORD *)a6 + 27) = *(_OWORD *)(&a5->var0 + 1);
  *((void *)a6 + 56) = *(void *)((char *)&a5->var1.var1 + 4);
  *((_DWORD *)a6 + 114) = HIDWORD(a5->var14);
  *((_OWORD *)a6 + 29) = *(_OWORD *)((char *)&a5->var2 + 4);
  *((_OWORD *)a6 + 30) = *(_OWORD *)((char *)&a5->var6 + 4);
}

- (void)_updateLocation:(CLDaemonLocation *)a3 locationPrivate:(void *)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(_CLLocationPlayer *)self isARSessionActive]
    || [(_CLLocationPlayer *)self isFusionEnabled]
    && (self->_locationFuser.activated_
     || ((double mach_abs = self->_locationFuser.lastValidVlf_.t.mach_abs,
          double v8 = vabdd_f64(*((double *)a4 + 4), mach_abs),
          mach_abs > 0.0)
       ? (BOOL v9 = v8 <= 24.0)
       : (BOOL v9 = 0),
         v9))
    || ![(_CLLocationPlayer *)self isFusionEnabled]
    || self->_locationFuser.activated_
    || ((double v10 = self->_locationFuser.lastValidVlf_.t.mach_abs, vabdd_f64(*((double *)a4 + 4), v10) <= 24.0)
      ? (BOOL v11 = v10 <= 0.0)
      : (BOOL v11 = 1),
        !v11 || v10 <= 0.0))
  {
    if ([(_CLLocationPlayer *)self isFusionEnabled])
    {
      sub_21B6F0310((unsigned __int8 *)&self->_locationFuser, (uint64_t)a3, (uint64_t)a4);
    }
  }
  else
  {
    sub_21B6EBAC4(&self->_locationFuser.visionLock_.flag_._Value);
    sub_21B6EBAFC((uint64_t)&self->_locationFuser, 1);
    atomic_store(0, (unsigned __int8 *)&self->_locationFuser.visionLock_);
    if (qword_267C5A9D8 != -1) {
      dispatch_once(&qword_267C5A9D8, &unk_26CB86A40);
    }
    long long v12 = qword_267C5A9E0;
    if (os_log_type_enabled((os_log_t)qword_267C5A9E0, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *((void *)a4 + 4);
      int v14 = 134349056;
      uint64_t v15 = v13;
      _os_log_impl(&dword_21B6E4000, v12, OS_LOG_TYPE_DEBUG, "CLLP,_updateLocation:locationPrivate:,Manual location fuser reset,machAbsTime,%{public}.3lf", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BOOL)isFusionEnabled
{
  return self->_fusionEnabled;
}

- (void)setFusionEnabled:(BOOL)a3
{
  self->_fusionEnabled = a3;
}

- (BOOL)isSimulationEnabled
{
  return self->_simulationEnabled;
}

- (void)setSimulationEnabled:(BOOL)a3
{
  self->_simulationEnabled = a3;
}

- (BOOL)isPlayerActive
{
  return self->_playerActive;
}

- (void)setPlayerActive:(BOOL)a3
{
  self->_playerActive = a3;
}

- (BOOL)isNotifierActive
{
  return self->_notifierActive;
}

- (void)setNotifierActive:(BOOL)a3
{
  self->_notifierActive = a3;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (double)notifierLastARKitUpdateTime
{
  return self->_notifierLastARKitUpdateTime;
}

- (void)setNotifierLastARKitUpdateTime:(double)a3
{
  self->_notifierLastARKitUpdateTime = a3;
}

- (CLSimulationManager)simulationManager
{
  return self->_simulationManager;
}

- (void)setSimulationManager:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_locationFuser.prevStates_.__begin_;
  if (begin)
  {
    self->_locationFuser.prevStates_.__end_ = begin;
    operator delete(begin);
  }
  objc_super v4 = self->_locationFuser.locBuffer_.__begin_;
  if (v4)
  {
    self->_locationFuser.locBuffer_.__end_ = v4;
    operator delete(v4);
  }
  BOOL v5 = self->_locationFuser.vlfBuffer_.__begin_;
  if (v5)
  {
    self->_locationFuser.vlfBuffer_.__end_ = v5;
    operator delete(v5);
  }
  double v6 = self->_locationFuser.vioBuffer_.__begin_;
  if (v6)
  {
    self->_locationFuser.vioBuffer_.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  return self;
}

@end