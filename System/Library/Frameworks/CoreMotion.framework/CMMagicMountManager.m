@interface CMMagicMountManager
+ (BOOL)isAvailable;
- (CMMagicMountManager)init;
- (CMMagicMountStateStruct)currentMagicMountState;
- (id)initPrivate;
- (int64_t)magicMountConfiguration;
- (void)dealloc;
- (void)deallocPrivate;
- (void)feedMountStatus:(int64_t)a3 apAwake:(BOOL)a4 simulated:(BOOL)a5 timestamp:(double)a6;
- (void)onMagicMountData:(const MagicMountState *)a3;
- (void)sendMagicMountStateToClientPrivate;
- (void)setAPWakesAllowed:(BOOL)a3;
- (void)setAPWakesAllowedPrivate:(BOOL)a3;
- (void)setMagicMountConfiguration:(int64_t)a3;
- (void)simulateMagicMountEvent:(int64_t)a3 delay:(double)a4;
- (void)startMagicMountUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startMagicMountUpdatesToQueue:(id)a3 withHandler:(id)a4;
- (void)stopMagicMountUpdates;
- (void)stopMagicMountUpdatesPrivate;
@end

@implementation CMMagicMountManager

+ (BOOL)isAvailable
{
  return ((unint64_t)sub_1902CD6B0() >> 9) & 1;
}

- (CMMagicMountManager)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD1A4;
  v11 = sub_1902DD0E0;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905AAB5C;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  v4 = (CMMagicMountManager *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  v4.receiver = self;
  v4.super_class = (Class)CMMagicMountManager;
  v2 = [(CMMagicMountManager *)&v4 init];
  if (v2) {
    v2->_internal = (id)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD1A4;
  v6[4] = sub_1902DD0E0;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1905AACE4;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMMagicMountManager;
  [(CMMagicMountManager *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  objc_msgSend_stopMagicMountUpdatesPrivate(self, a2, v2);
  objc_msgSend_teardownPrivate(self->_internal, v4, v5);
  id internal = self->_internal;
}

- (void)startMagicMountUpdatesToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8C8 != -1) {
    dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
  }
  uint64_t v7 = qword_1E929D8D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEFAULT, "Starting magic mount updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    __int16 v11 = 0;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager startMagicMountUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v8 = sub_1902D6BD0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1905AAF30;
  v10[3] = &unk_1E568D398;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  sub_1902CDE98(v8, (uint64_t)v10);
}

- (void)stopMagicMountUpdates
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8C8 != -1) {
    dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
  }
  uint64_t v3 = qword_1E929D8D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_DEFAULT, "Stopping magic mount updates", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    __int16 v7 = 0;
    uint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager stopMagicMountUpdates]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905AB128;
  v6[3] = &unk_1E568D118;
  v6[4] = self;
  sub_1902CDE98(v4, (uint64_t)v6);
}

- (void)setMagicMountConfiguration:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8C8 != -1) {
    dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
  }
  uint64_t v5 = qword_1E929D8D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEFAULT))
  {
    int64_t magicMountConfiguration = self->_magicMountConfiguration;
    *(_DWORD *)buf = 134349312;
    int64_t v9 = magicMountConfiguration;
    __int16 v10 = 2050;
    int64_t v11 = a3;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "setMagicMountConfiguration: %{public}ld -> %{public}ld", buf, 0x16u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    __int16 v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager setMagicMountConfiguration:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  self->_int64_t magicMountConfiguration = a3;
}

- (void)setAPWakesAllowed:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929D8C8 != -1) {
    dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
  }
  uint64_t v5 = qword_1E929D8D0;
  if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_DEFAULT, "Changing the AP wakes setting for magic mount events", buf, 2u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    __int16 v10 = 0;
    __int16 v7 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager setAPWakesAllowed:]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  uint64_t v6 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905AB4F4;
  v8[3] = &unk_1E568DE78;
  v8[4] = self;
  BOOL v9 = a3;
  sub_1902CDE98(v6, (uint64_t)v8);
}

- (void)sendMagicMountStateToClientPrivate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if (*((void *)internal + 4) && *((void *)internal + 3))
  {
    uint64_t v4 = MEMORY[0x192FCD2F0]();
    double v5 = *((double *)internal + 1);
    if (v5 == 0.0) {
      __assert_rtn("-[CMMagicMountManager sendMagicMountStateToClientPrivate]", "CMMagicMountManager.mm", 252, "timestampSecs != 0.");
    }
    uint64_t v6 = (void *)v4;
    uint64_t v7 = *((void *)internal + 2);
    uint64_t v8 = [CMMagicMountState alloc];
    __int16 v10 = objc_msgSend_initWithMountStatus_timestamp_(v8, v9, v7, v5);
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    int64_t v11 = qword_1E929D8D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_DEFAULT, "Sending to client: %{public}@", buf, 0xCu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8C8 != -1) {
        dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
      }
      int v17 = 138543362;
      v18 = v10;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager sendMagicMountStateToClientPrivate]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    uint64_t v14 = *((void *)internal + 3);
    uint64_t v13 = (void *)*((void *)internal + 4);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1905AB790;
    v16[3] = &unk_1E568D320;
    v16[4] = v10;
    v16[5] = v14;
    objc_msgSend_addOperationWithBlock_(v13, v12, (uint64_t)v16);
  }
}

- (void)onMagicMountData:(const MagicMountState *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    double v5 = qword_1E929D8D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_INFO))
    {
      int var1 = a3->var1;
      BOOL var2 = a3->var2;
      BOOL var3 = a3->var3;
      double var0 = a3->var0;
      *(_DWORD *)buf = 67240960;
      int v15 = var1;
      __int16 v16 = 1026;
      BOOL v17 = var2;
      __int16 v18 = 1026;
      BOOL v19 = var3;
      __int16 v20 = 2050;
      double v21 = var0;
      _os_log_impl(&dword_1902AF000, v5, OS_LOG_TYPE_INFO, "Incoming magic mount state, mountStatus,%{public}u, isAPAwake,%{public}u, isSimulated,%{public}u, timestampSecs,%{public}f", buf, 0x1Eu);
    }
    if (sub_1902D8400(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8C8 != -1) {
        dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager onMagicMountData:]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    objc_msgSend_feedMountStatus_apAwake_simulated_timestamp_(self, v10, a3->var1, a3->var2, a3->var3, a3->var0);
  }
  else
  {
    if (qword_1E929D8C8 != -1) {
      dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
    }
    int64_t v11 = qword_1E929D8D0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "Invalid data parameter!", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8C8 != -1) {
        dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
      }
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMMagicMountManager onMagicMountData:]", "CoreLocation: %s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (CMMagicMountStateStruct)currentMagicMountState
{
  uint64_t v9 = 0;
  __int16 v10 = (double *)&v9;
  uint64_t v11 = 0x4012000000;
  uint64_t v12 = sub_1905ABBF8;
  uint64_t v13 = nullsub_177;
  uint64_t v14 = &unk_190687D59;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905ABC08;
  v8[3] = &unk_1E568E110;
  v8[4] = self;
  void v8[5] = &v9;
  sub_1902CDE98(v3, (uint64_t)v8);
  double v4 = v10[6];
  int64_t v5 = *((void *)v10 + 7);
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  int64_t v7 = v5;
  result.mountStatus = v7;
  result.timestamp = v6;
  return result;
}

- (void)simulateMagicMountEvent:(int64_t)a3 delay:(double)a4
{
  char v5 = a3;
  if (qword_1E929EA18 != -1) {
    dispatch_once(&qword_1E929EA18, &unk_1EDFD1960);
  }
  uint64_t v6 = qword_1E929EA10 + 32;

  sub_190596F14(v6, v5, a4);
}

- (void)feedMountStatus:(int64_t)a3 apAwake:(BOOL)a4 simulated:(BOOL)a5 timestamp:(double)a6
{
  uint64_t v11 = sub_1902D6BD0();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1905ABD40;
  v12[3] = &unk_1E5690068;
  v12[4] = self;
  v12[5] = a3;
  *(double *)&v12[6] = a6;
  BOOL v13 = a4;
  BOOL v14 = a5;
  sub_1902CDE98(v11, (uint64_t)v12);
}

- (void)startMagicMountUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if ((sub_1902CD6B0() & 0x200) != 0)
  {
    id v10 = (id)internal[4];
    if (v10 != a3)
    {

      internal[4] = a3;
    }
    id v11 = (id)internal[3];
    if (v11 != a4)
    {

      internal[3] = objc_msgSend_copy(a4, v12, v13);
    }
    if (!internal[5] && (sub_1902CD6B0() & 0x200) != 0) {
      operator new();
    }
    *((unsigned char *)internal + 64) = 1;
    objc_msgSend_sendServiceRequestPrivate(internal, v8, v9);
    if (!*((unsigned char *)internal + 65))
    {
      MEMORY[0x1F4181798](internal, sel_sendAPWakesRequestPrivate, v14);
    }
  }
}

- (void)stopMagicMountUpdatesPrivate
{
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if ((sub_1902CD6B0() & 0x200) != 0)
  {
    if (!*((unsigned char *)internal + 65)) {
      objc_msgSend_setAPWakesAllowedPrivate_(self, v4, 1);
    }
    if (*((unsigned char *)internal + 64))
    {
      *((unsigned char *)internal + 64) = 0;
      objc_msgSend_sendServiceRequestPrivate(internal, v4, v5);
    }
    if (*((void *)internal + 5))
    {
      if (qword_1E929EA18 != -1) {
        dispatch_once(&qword_1E929EA18, &unk_1EDFD1960);
      }
      sub_1902CDE08(qword_1E929EA10, 0, *((void *)internal + 5));
      uint64_t v6 = *((void *)internal + 5);
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      }
      *((void *)internal + 5) = 0;
    }

    *((void *)internal + 4) = 0;
    *((void *)internal + 1) = 0;
    *((void *)internal + 2) = 0;
    *((void *)internal + 3) = 0;
  }
}

- (void)setAPWakesAllowedPrivate:(BOOL)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sub_1902D6BD0();
  sub_1904DFAD8();
  id internal = self->_internal;
  if ((sub_1902CD6B0() & 0x200) != 0)
  {
    if (internal[64])
    {
      if (internal[65] != v3)
      {
        internal[65] = v3;
        MEMORY[0x1F4181798](internal, sel_sendAPWakesRequestPrivate, v6);
      }
    }
    else
    {
      internal[65] = v3;
      if (qword_1E929D8C8 != -1) {
        dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
      }
      int64_t v7 = qword_1E929D8D0;
      if (os_log_type_enabled((os_log_t)qword_1E929D8D0, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v7, OS_LOG_TYPE_DEBUG, "Client hasn't called startMagicMountUpdates yet, holding request until this happens", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D8C8 != -1) {
          dispatch_once(&qword_1E929D8C8, &unk_1EDFD3F60);
        }
        uint64_t v8 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMMagicMountManager setAPWakesAllowedPrivate:]", "CoreLocation: %s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
      }
    }
  }
}

- (int64_t)magicMountConfiguration
{
  return self->_magicMountConfiguration;
}

@end