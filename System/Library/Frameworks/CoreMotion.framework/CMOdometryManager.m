@interface CMOdometryManager
+ (BOOL)isAvailable;
- (CMOdometryManager)init;
- (double)odometryUpdateInterval;
- (id).cxx_construct;
- (id)initPrivate;
- (void)dealloc;
- (void)deallocPrivate;
- (void)feedOdometryData:(const InertialOdometryData *)a3;
- (void)sendOdometryToClientPrivate;
- (void)setOdometryUpdateInterval:(double)a3;
- (void)setOdometryUpdateIntervalPrivate:(double)a3;
- (void)setupBIO;
- (void)startBackgroundUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5;
- (void)startBackgroundUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)startOdometryUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5;
- (void)startOdometryUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5;
- (void)stopBackgroundUpdates;
- (void)stopBackgroundUpdatesPrivate;
- (void)stopOdometryUpdates;
- (void)stopOdometryUpdatesPrivate;
- (void)teardownBIO;
@end

@implementation CMOdometryManager

+ (BOOL)isAvailable
{
  if (sub_19046C114()) {
    return 1;
  }
  if (qword_1EB3BE968 != -1) {
    dispatch_once(&qword_1EB3BE968, &unk_1EDFD1660);
  }
  if (qword_1EB3BE970 != -1) {
    dispatch_once(&qword_1EB3BE970, &unk_1EDFC1FE0);
  }
  BOOL result = 1;
  if ((dword_1EB3BE95C - 99) >= 0x23) {
    return dword_1EB3BE95C == 260;
  }
  return result;
}

- (CMOdometryManager)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD130;
  v11 = sub_1902DD094;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1904E7408;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  v4 = (CMOdometryManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)CMOdometryManager;
  v2 = [(CMOdometryManager *)&v6 init];
  if (v2)
  {
    v2->_internal = (id)objc_opt_new();
    objc_msgSend_setupBIO(v2, v3, v4);
  }
  return v2;
}

- (void)dealloc
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_1902DD130;
  v8[4] = sub_1902DD094;
  v8[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1904E75A0;
  v7[3] = &unk_1E568DDD8;
  v7[4] = v8;
  sub_1902CDE98(v3, (uint64_t)v7);
  objc_msgSend_teardownBIO(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)CMOdometryManager;
  [(CMOdometryManager *)&v6 dealloc];
  _Block_object_dispose(v8, 8);
}

- (void)deallocPrivate
{
  objc_msgSend_stopOdometryUpdatesPrivate(self, a2, v2);
  id internal = self->_internal;
}

- (void)setupBIO
{
  self->_backgroundInertialOdometryQueue = 0;
  self->_referenceFrameBIO = 1;
  self->_backgroundInertialOdometryHandler = 0;
  self->_xpcQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMOdometryManagerPrivateQueue", 0);
  operator new();
}

- (void)teardownBIO
{
  self->_backgroundInertialOdometryHandler = 0;
  self->_backgroundInertialOdometryQueue = 0;
  sub_190421DA8((uint64_t *)&self->_locationdConnection, 0);
  xpcQueue = self->_xpcQueue;
  self->_xpcQueue = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904E7BC4;
  block[3] = &unk_1E568D118;
  block[4] = xpcQueue;
  dispatch_async(xpcQueue, block);
}

- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v7 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904E7C5C;
  v8[3] = &unk_1E568D398;
  v8[4] = self;
  v8[5] = a3;
  void v8[6] = a4;
  sub_1902CDE98(v7, (uint64_t)v8);
}

- (void)startOdometryUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904E7D04;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a3;
  sub_1902CDE98(v9, (uint64_t)v10);
}

- (void)stopOdometryUpdates
{
  uint64_t v3 = sub_1902D6BD0();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1904E7D90;
  v4[3] = &unk_1E568D118;
  v4[4] = self;
  sub_1902CDE98(v3, (uint64_t)v4);
}

- (double)odometryUpdateInterval
{
  return *((double *)self->_internal + 32);
}

- (void)setOdometryUpdateInterval:(double)a3
{
  uint64_t v5 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1904E7E30;
  v6[3] = &unk_1E568DB10;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  sub_1902CDE98(v5, (uint64_t)v6);
}

- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4
{
}

- (void)startBackgroundUpdatesUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
}

- (void)stopBackgroundUpdates
{
}

- (void)startOdometryUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904E7EEC;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  sub_1902CDE98(v9, (uint64_t)v10);
}

- (void)startBackgroundUpdatesToQueue:(id)a3 withHandler:(id)a4 usingReferenceFrame:(unint64_t)a5
{
  uint64_t v9 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904E7F90;
  v10[3] = &unk_1E568DE28;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  sub_1902CDE98(v9, (uint64_t)v10);
}

- (void)setOdometryUpdateIntervalPrivate:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id internal = self->_internal;
  double v5 = 0.1;
  if (a3 >= 0.1) {
    double v5 = a3;
  }
  *((double *)internal + 32) = v5;
  if (*((void *)internal + 31))
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    objc_super v6 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      double v10 = a3;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "Requesting CMOdometry updates with interval: %{public}f", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9D8 != -1) {
        dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometryManager setOdometryUpdateIntervalPrivate:]", "CoreLocation: %s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    uint64_t v7 = sub_190546668();
    sub_1904DC320(v7, 0, *((void *)internal + 31), (uint64_t)internal + 256);
  }
}

- (void)sendOdometryToClientPrivate
{
  v65[1] = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (double *)self->_internal;
  if (*((void *)internal + 34) && *((void *)internal + 33))
  {
    uint64_t v4 = MEMORY[0x192FCD2F0]();
    double v8 = internal[15];
    if (v8 == 0.0) {
      __assert_rtn("-[CMOdometryManager sendOdometryToClientPrivate]", "CMOdometryManager.mm", 275, "timestampSecs != 0.");
    }
    uint64_t v9 = (void *)v4;
    uint64_t v10 = *((void *)internal + 33);
    unint64_t v11 = *((void *)internal + 2);
    if (v11 >= *((void *)internal + 25))
    {
      uint64_t v56 = *((void *)internal + 33);
      v57 = (void *)v4;
      if (v11 >= *((void *)internal + 20))
      {
        if (*((void *)internal + 22) <= v11)
        {
          *(float *)&double v7 = *((float *)internal + 34) - *((float *)internal + 6);
          uint64_t v59 = objc_msgSend_numberWithFloat_(NSNumber, v5, v6, v7);
          unint64_t v11 = *((void *)internal + 2);
        }
        else
        {
          uint64_t v59 = 0;
        }
        if (*((void *)internal + 23) <= v11)
        {
          *(float *)&double v7 = *((float *)internal + 35) - *((float *)internal + 7);
          uint64_t v58 = objc_msgSend_numberWithFloat_(NSNumber, v5, v6, v7);
          unint64_t v11 = *((void *)internal + 2);
        }
        else
        {
          uint64_t v58 = 0;
        }
        if (*((void *)internal + 24) <= v11)
        {
          *(float *)&double v7 = *((float *)internal + 36) - *((float *)internal + 8);
          uint64_t v20 = objc_msgSend_numberWithFloat_(NSNumber, v5, v6, v7);
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        if (qword_1E929D9D8 != -1) {
          dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
        }
        v19 = qword_1E929D9E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v19, OS_LOG_TYPE_INFO, "Position rollover", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D9D8 != -1) {
            dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
          }
          __int16 v61 = 0;
          v54 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometryManager sendOdometryToClientPrivate]", "CoreLocation: %s\n", v54);
          if (v54 != (char *)buf) {
            free(v54);
          }
        }
        uint64_t v20 = 0;
        uint64_t v58 = 0;
        uint64_t v59 = 0;
      }
      if (*((void *)internal + 2) >= *((void *)internal + 21))
      {
        *(float *)&double v7 = *((float *)internal + 37) - *((float *)internal + 9);
        uint64_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v5, v6, v7);
        *(float *)&double v25 = *((float *)internal + 38) - *((float *)internal + 10);
        uint64_t v23 = objc_msgSend_numberWithFloat_(NSNumber, v26, v27, v25);
        *(float *)&double v28 = *((float *)internal + 39) - *((float *)internal + 11);
        uint64_t v24 = objc_msgSend_numberWithFloat_(NSNumber, v29, v30, v28);
      }
      else
      {
        if (qword_1E929D9D8 != -1) {
          dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
        }
        v21 = qword_1E929D9E0;
        if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1902AF000, v21, OS_LOG_TYPE_INFO, "Velocity rollover", buf, 2u);
        }
        if (sub_1902D8400(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929D9D8 != -1) {
            dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
          }
          __int16 v61 = 0;
          v55 = (char *)_os_log_send_and_compose_impl();
          sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometryManager sendOdometryToClientPrivate]", "CoreLocation: %s\n", v55);
          if (v55 != (char *)buf) {
            free(v55);
          }
        }
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        uint64_t v24 = 0;
      }
      v31 = [CMOdometry alloc];
      LODWORD(v32) = *((_DWORD *)internal + 52);
      uint64_t v35 = objc_msgSend_numberWithFloat_(NSNumber, v33, v34, v32);
      LODWORD(v36) = *((_DWORD *)internal + 53);
      uint64_t v39 = objc_msgSend_numberWithFloat_(NSNumber, v37, v38, v36);
      LODWORD(v40) = *((_DWORD *)internal + 54);
      uint64_t v43 = objc_msgSend_numberWithFloat_(NSNumber, v41, v42, v40);
      LODWORD(v44) = *((_DWORD *)internal + 55);
      uint64_t v47 = objc_msgSend_numberWithFloat_(NSNumber, v45, v46, v44);
      LODWORD(v48) = *((_DWORD *)internal + 56);
      v50 = objc_msgSend_initWithDeltaPositionX_deltaPositionY_deltaPositionZ_deltaVelocityX_deltaVelocityY_deltaVelocityZ_quaternionX_quaternionY_quaternionZ_quaternionW_rotationArbitraryToTrueNorth_staticFlag_timestamp_(v31, v49, v59, v58, v20, v22, v23, v24, v48, v8, v35, v39, v43, v47, 0);
      v16 = v50;
      if (*((void *)internal + 30) == 8) {
        objc_msgSend_rotateArbitraryToTrueNorth(v50, v51, v52);
      }
      v53 = (void *)*((void *)internal + 34);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = sub_1904E87A8;
      v60[3] = &unk_1E568D320;
      v60[4] = v16;
      v60[5] = v56;
      objc_msgSend_addOperationWithBlock_(v53, v51, (uint64_t)v60);
      uint64_t v9 = v57;
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v64 = *MEMORY[0x1E4F28568];
      v65[0] = @"Reference frame has changed for the incoming delta position updates due to unexpected DeviceMotion reinitialization.";
      uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v65, &v64, 1);
      v16 = objc_msgSend_initWithDomain_code_userInfo_(v12, v15, @"CMErrorDomainPrivate", 103, v14);
      v17 = (void *)*((void *)internal + 34);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = sub_1904E8790;
      v62[3] = &unk_1E568D320;
      v62[4] = v16;
      v62[5] = v10;
      objc_msgSend_addOperationWithBlock_(v17, v18, (uint64_t)v62);
    }
  }
}

- (void)feedOdometryData:(const InertialOdometryData *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = sub_1902D6BD0();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1904E89AC;
    v8[3] = &unk_1E568DB10;
    v8[4] = self;
    v8[5] = a3;
    sub_1902CDE98(v5, (uint64_t)v8);
  }
  else
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    uint64_t v6 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9D8 != -1) {
        dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
      }
      __int16 v9 = 0;
      double v7 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMOdometryManager feedOdometryData:]", "CoreLocation: %s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)startOdometryUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (double *)self->_internal;
  if (!+[CMOdometryManager isAvailable]_0())
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    v15 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "InertialOdometry not available", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9D8 == -1)
    {
LABEL_41:
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMOdometryManager startOdometryUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
      return;
    }
LABEL_43:
    dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    goto LABEL_41;
  }
  if (internal[32] <= 0.0)
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    v16 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "Invalid update interval", buf, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9D8 == -1) {
      goto LABEL_41;
    }
    goto LABEL_43;
  }
  if (a3 == 1 || a3 == 8)
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    uint64_t v10 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      int v21 = a3;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_DEFAULT, "Starting InertialOdometry updates with reference frame: %{public}d", buf, 8u);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9D8 != -1) {
        dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometryManager startOdometryUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    *((void *)internal + 30) = a3;
    id v11 = (id)*((void *)internal + 34);
    if (v11 != a4)
    {

      *((void *)internal + 34) = a4;
    }
    id v12 = (id)*((void *)internal + 33);
    if (v12 != a5)
    {

      *((void *)internal + 33) = objc_msgSend_copy(a5, v13, v14);
    }
    if (!*((void *)internal + 31)) {
      operator new();
    }
    return;
  }
  if (qword_1E929D9D8 != -1) {
    dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
  }
  v17 = qword_1E929D9E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "Invalid reference frame", buf, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D9D8 == -1) {
      goto LABEL_41;
    }
    goto LABEL_43;
  }
}

- (void)stopOdometryUpdatesPrivate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = (char *)self->_internal;
  if (+[CMOdometryManager isAvailable]_0())
  {
    if (*((void *)internal + 31))
    {
      uint64_t v4 = sub_190546668();
      sub_1902CDE08(v4, 0, *((void *)internal + 31));
      uint64_t v5 = *((void *)internal + 31);
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      *((void *)internal + 31) = 0;
      if (qword_1E929D9D8 != -1) {
        dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
      }
      uint64_t v6 = qword_1E929D9E0;
      if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v6, OS_LOG_TYPE_DEFAULT, "Stopping InertialOdometry updates", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9D8 != -1) {
          dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
        }
        __int16 v9 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMOdometryManager stopOdometryUpdatesPrivate]", "CoreLocation: %s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    double v7 = (void *)*((void *)internal + 34);
    if (v7)
    {

      *((void *)internal + 34) = 0;
    }
    double v8 = (void *)*((void *)internal + 33);
    if (v8)
    {

      *((void *)internal + 33) = 0;
    }
    internal[232] = 0;
    *(_OWORD *)(internal + 216) = 0u;
    *(_OWORD *)(internal + 200) = 0u;
    *(_OWORD *)(internal + 184) = 0u;
    *(_OWORD *)(internal + 168) = 0u;
    *(_OWORD *)(internal + 152) = 0u;
    *(_OWORD *)(internal + 136) = 0u;
    *(_OWORD *)(internal + 120) = 0u;
    *(_OWORD *)(internal + 104) = 0u;
    *(_OWORD *)(internal + 88) = 0u;
    *(_OWORD *)(internal + 72) = 0u;
    *(_OWORD *)(internal + 56) = 0u;
    *(_OWORD *)(internal + 40) = 0u;
    *(_OWORD *)(internal + 24) = 0u;
    *(_OWORD *)(internal + 8) = 0u;
  }
}

- (void)startBackgroundUpdatesPrivateUsingReferenceFrame:(unint64_t)a3 toQueue:(id)a4 withHandler:(id)a5
{
  location[205] = *(id *)MEMORY[0x1E4F143B8];
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMOdometryManager.mm", 455, @"Invalid parameter not satisfying: %@", @"queue");
    if (a5) {
      goto LABEL_3;
    }
  }
  v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMOdometryManager.mm", 456, @"Invalid parameter not satisfying: %@", @"handler");
LABEL_3:
  if (!+[CMOdometryManager isAvailable]_0())
  {
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    uint64_t v11 = qword_1E929D9E0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "Background InertialOdometry not available", (uint8_t *)location, 2u);
    }
    if (!sub_1902D8400(115, 0)) {
      return;
    }
    bzero(location, 0x65CuLL);
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    __int16 v22 = 0;
LABEL_26:
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "-[CMOdometryManager startBackgroundUpdatesPrivateUsingReferenceFrame:toQueue:withHandler:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)location) {
      free(v17);
    }
    return;
  }
  if (a3 == 1 || a3 == 8)
  {
    objc_initWeak(location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1904E96E8;
    v20[3] = &unk_1E568D1B8;
    objc_copyWeak(&v21, location);
    xpcQueue = self->_xpcQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1904E98A4;
    block[3] = &unk_1E568E4E8;
    objc_copyWeak(v19, location);
    block[4] = a4;
    void block[5] = a5;
    v19[1] = (id)a3;
    block[6] = v20;
    dispatch_async(xpcQueue, block);
    objc_destroyWeak(v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
    return;
  }
  if (qword_1E929D9D8 != -1) {
    dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
  }
  id v12 = qword_1E929D9E0;
  if (os_log_type_enabled((os_log_t)qword_1E929D9E0, OS_LOG_TYPE_ERROR))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "Invalid reference frame", (uint8_t *)location, 2u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(location, 0x65CuLL);
    if (qword_1E929D9D8 != -1) {
      dispatch_once(&qword_1E929D9D8, &unk_1EDFC35A8);
    }
    __int16 v22 = 0;
    goto LABEL_26;
  }
}

- (void)stopBackgroundUpdatesPrivate
{
  if (+[CMOdometryManager isAvailable]_0())
  {
    objc_initWeak(&location, self);
    xpcQueue = self->_xpcQueue;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1904E9C7C;
    v4[3] = &unk_1E568E510;
    objc_copyWeak(&v5, &location);
    dispatch_async(xpcQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end