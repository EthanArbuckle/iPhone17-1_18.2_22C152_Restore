@interface CMAltimeter
+ (BOOL)isAbsoluteAltitudeAvailable;
+ (BOOL)isRelativeAltitudeAvailable;
+ (BOOL)isSignificantElevationAvailable;
+ (CMAuthorizationStatus)authorizationStatus;
+ (void)initialize;
- (CMAltimeter)init;
- (id)initPrivate;
- (void)dealloc;
- (void)deallocPrivate;
- (void)onFilteredPressure:(const Sample *)a3;
- (void)pauseAbsoluteAltitudeUpdates;
- (void)queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6;
- (void)querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5;
- (void)resumeAbsoluteAltitudeUpdates;
- (void)startAbsoluteAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAbsoluteAltitudeHandler)handler;
- (void)startRelativeAltitudeUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4;
- (void)startRelativeAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAltitudeHandler)handler;
- (void)startSignificantElevationUpdatesWithHandler:(id)a3;
- (void)stopAbsoluteAltitudeUpdates;
- (void)stopRelativeAltitudeUpdates;
- (void)stopRelativeAltitudeUpdatesPrivate;
- (void)stopSignificantElevationUpdates;
@end

@implementation CMAltimeter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v5 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v3, v4);
    if (objc_msgSend_isMainThread(v5, v6, v7)
      && (objc_msgSend_isMultiThreaded(MEMORY[0x1E4F29060], v8, v9) & 1) == 0)
    {
      objc_msgSend_detachNewThreadSelector_toTarget_withObject_(MEMORY[0x1E4F29060], v10, (uint64_t)sel_dummySelector_, a1, 0);
    }
    if (!qword_1EB3BF820)
    {
      CFRunLoopRef Main = CFRunLoopGetMain();
      sub_1902B3DDC(Main);
    }
  }
}

- (CMAltimeter)init
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_1902DD1D4;
  v11 = sub_1902DD104;
  uint64_t v12 = 0;
  uint64_t v3 = sub_1902D6BD0();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1905C8058;
  v6[3] = &unk_1E568DDB0;
  v6[4] = self;
  v6[5] = &v7;
  sub_1902CDE98(v3, (uint64_t)v6);
  uint64_t v4 = (CMAltimeter *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)initPrivate
{
  v4.receiver = self;
  v4.super_class = (Class)CMAltimeter;
  v2 = [(CMAltimeter *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMAltimeterInternal);
  }
  return v2;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3052000000;
  v6[3] = sub_1902DD1D4;
  v6[4] = sub_1902DD104;
  v6[5] = self;
  uint64_t v3 = sub_1902D6BD0();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1905C81E0;
  v5[3] = &unk_1E568DDD8;
  v5[4] = v6;
  sub_1902CDE98(v3, (uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)CMAltimeter;
  [(CMAltimeter *)&v4 dealloc];
  _Block_object_dispose(v6, 8);
}

- (void)deallocPrivate
{
  internal = (void **)self->_internal;
  objc_super v4 = (void *)MEMORY[0x192FCD2F0]();
  objc_msgSend_cancelAllOperations(internal[3], v5, v6);
  objc_msgSend_stopRelativeAltitudeUpdatesPrivate(self, v7, v8);
}

+ (BOOL)isRelativeAltitudeAvailable
{
  if ((sub_1902E0068() & 0xFFFFFFFE) == 0x32) {
    return 0;
  }
  if (qword_1E929EA00 != -1) {
    dispatch_once(&qword_1E929EA00, &unk_1EDFD1500);
  }
  return qword_1E929E9F8 != 0;
}

+ (BOOL)isSignificantElevationAvailable
{
  sub_1902BAD40();
  sub_1902BAD40();
  BOOL result = 0;
  if (sub_19046BC40())
  {
    sub_1902BAD40();
    if ((sub_1902CD6B0() & 0x8000000) != 0) {
      return 1;
    }
  }
  return result;
}

+ (CMAuthorizationStatus)authorizationStatus
{
  return objc_msgSend_authorizationStatus(CMMotionUtils, a2, v2);
}

- (void)startRelativeAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAltitudeHandler)handler
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, (uint64_t)queue))
  {
    if (objc_msgSend__bundleBeforeTCCCheck(CMAltimeterInternal, v7, v8)
      && (v11 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v9, v10),
          v14 = objc_msgSend_infoDictionary(v11, v12, v13),
          !objc_msgSend_objectForKeyedSubscript_(v14, v15, @"NSMotionUsageDescription")))
    {
      if (qword_1E929D758 != -1) {
        dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
      }
      v16 = qword_1E929D750;
      if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v16, OS_LOG_TYPE_ERROR, "App does not have NSMotionUsageDescription, do not vend relative altimeter", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D758 != -1) {
          dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
        }
        __int16 v19 = 0;
        v17 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMAltimeter startRelativeAltitudeUpdatesToQueue:withHandler:]", "CoreLocation: %s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1905C8530;
      v18[3] = &unk_1E568E960;
      v18[5] = queue;
      v18[6] = handler;
      v18[4] = self;
      objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v9, (uint64_t)v18);
    }
  }
}

- (void)stopRelativeAltitudeUpdates
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, v2))
  {
    if (objc_msgSend__bundleBeforeTCCCheck(CMAltimeterInternal, v4, v5)
      && (uint64_t v8 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v6, v7),
          v11 = objc_msgSend_infoDictionary(v8, v9, v10),
          !objc_msgSend_objectForKeyedSubscript_(v11, v12, @"NSMotionUsageDescription")))
    {
      if (qword_1E929D758 != -1) {
        dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
      }
      uint64_t v13 = qword_1E929D750;
      if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_DEFAULT, "App does not have NSMotionUsageDescription, do not vend relative altimeter", buf, 2u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D758 != -1) {
          dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
        }
        __int16 v16 = 0;
        v14 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMAltimeter stopRelativeAltitudeUpdates]", "CoreLocation: %s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1905C8864;
      v15[3] = &unk_1E568D118;
      v15[4] = self;
      objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, v6, (uint64_t)v15);
    }
  }
}

- (void)startSignificantElevationUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMAltimeter.mm", 891, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1905C89C8;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopSignificantElevationUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1905C8A4C;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

- (void)querySignificantElevationChangeFromDate:(id)a3 toDate:(id)a4 withHandler:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CMAltimeter.mm", 907, @"Invalid parameter not satisfying: %@", @"toDate");
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMAltimeter.mm", 908, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_4;
  }
  uint64_t v10 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, self, @"CMAltimeter.mm", 906, @"Invalid parameter not satisfying: %@", @"fromDate");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1905C8BBC;
  v16[3] = &unk_1E568DCF8;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = a5;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v16);
}

- (void)startRelativeAltitudeUpdatesPrivateToQueue:(id)a3 withHandler:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMAltimeter.mm", 923, @"Invalid parameter not satisfying: %@", @"queue");
    if (a4) {
      goto LABEL_3;
    }
  }
  v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMAltimeter.mm", 924, @"Invalid parameter not satisfying: %@", @"handler");
LABEL_3:
  internal = self->_internal;
  if (objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, (uint64_t)a3))
  {
    id v9 = (id)internal[3];
    if (v9 != a3)
    {

      internal[3] = a3;
    }
    id v10 = (id)internal[2];
    if (v10 != a4)
    {

      internal[2] = objc_msgSend_copy(a4, v11, v12);
    }
    if (!internal[1]) {
      operator new();
    }
  }
}

- (void)stopRelativeAltitudeUpdatesPrivate
{
  id internal = self->_internal;
  if (!objc_msgSend_isRelativeAltitudeAvailable(CMAltimeter, a2, v2)) {
    return;
  }
  objc_super v4 = (void **)*((void *)internal + 9);
  uint64_t v5 = *((void *)internal + 10);
  *((void *)internal + 13) = 0;
  unint64_t v6 = v5 - (void)v4;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*v4);
      uint64_t v7 = *((void *)internal + 10);
      objc_super v4 = (void **)(*((void *)internal + 9) + 8);
      *((void *)internal + 9) = v4;
      unint64_t v6 = v7 - (void)v4;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    uint64_t v8 = 512;
    goto LABEL_8;
  }
  if (v6 >> 3 == 2)
  {
    uint64_t v8 = 1024;
LABEL_8:
    *((void *)internal + 12) = v8;
  }
  if (*((void *)internal + 1))
  {
    if (qword_1E929EA00 != -1) {
      dispatch_once(&qword_1E929EA00, &unk_1EDFD1500);
    }
    sub_1902CDE08(qword_1E929E9F8, 0, *((void *)internal + 1));
    uint64_t v9 = *((void *)internal + 1);
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    }
    *((void *)internal + 1) = 0;
  }
  id v10 = (void *)*((void *)internal + 3);
  if (v10)
  {

    *((void *)internal + 3) = 0;
  }
  v11 = (void *)*((void *)internal + 2);
  if (v11)
  {

    *((void *)internal + 2) = 0;
  }
  *((unsigned char *)internal + 52) = 0;
}

- (void)onFilteredPressure:(const Sample *)a3
{
  __p[205] = *(void **)MEMORY[0x1E4F143B8];
  id internal = (float *)self->_internal;
  unint64_t v5 = *((void *)internal + 13);
  if (v5 >= 3)
  {
    ++*((void *)internal + 12);
    *((void *)internal + 13) = v5 - 1;
    sub_1902D91C4((uint64_t)(internal + 16), 1);
  }
  sub_1902D913C((void *)internal + 8, &a3->acceleration.x);
  unint64_t v6 = *((void *)internal + 12);
  uint64_t v7 = *((void *)internal + 9);
  uint64_t v8 = (char *)(v7 + 8 * (v6 >> 10));
  if (*((void *)internal + 10) == v7)
  {
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    v11 = (char *)(v7 + 8 * ((*((void *)internal + 13) + v6) >> 10));
  }
  else
  {
    uint64_t v9 = (char *)(*(void *)v8 + 4 * (*((void *)internal + 12) & 0x3FFLL));
    unint64_t v10 = *((void *)internal + 13) + v6;
    v11 = (char *)(v7 + 8 * (v10 >> 10));
    uint64_t v12 = *(void *)v11 + 4 * (v10 & 0x3FF);
  }
  memset(__p, 0, 24);
  if ((char *)v12 == v9
    || (uint64_t v13 = ((v12 - *(void *)v11) >> 2) + ((v11 - v8) << 7), v14 = (uint64_t)&v9[-*(void *)v8], v13 == v14 >> 2))
  {
    v15 = 0;
    __int16 v16 = 0;
  }
  else
  {
    sub_190347CC0(__p, v13 - (v14 >> 2));
    uint64_t v17 = 0;
    uint64_t v18 = (char *)__p[1];
    __int16 v19 = *(char **)v8;
    do
    {
      int v20 = *(_DWORD *)v9;
      v9 += 4;
      *(_DWORD *)&v18[v17] = v20;
      if (v9 - v19 == 4096)
      {
        uint64_t v21 = (char *)*((void *)v8 + 1);
        v8 += 8;
        __int16 v19 = v21;
        uint64_t v9 = v21;
      }
      v17 += 4;
    }
    while (v9 != (char *)v12);
    v15 = (float *)&v18[v17];
    __p[1] = &v18[v17];
    __int16 v16 = __p[0];
  }
  float v22 = sub_1904CEF08((uint64_t)v16, v15);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  internal[14] = v22;
  if ((sub_1902CD6B0() & 0x1000000000) == 0 && internal[14] <= 150.0)
  {
    if (!*((unsigned char *)internal + 52))
    {
      *((unsigned char *)internal + 52) = 1;
      *((_OWORD *)internal + 2) = *(_OWORD *)&a3->timestamp;
      internal[12] = (float)(1.0 - powf((float)(v22 * 1000.0) / 101320.0, 0.19026)) * 44331.0;
    }
    if (*((void *)internal + 3) && *((void *)internal + 2))
    {
      v23 = (void *)MEMORY[0x192FCD2F0]();
      v24 = [CMAltitudeData alloc];
      *(float *)&double v25 = v22 * 1000.0;
      *(float *)&double v26 = internal[12];
      v29 = objc_msgSend_initWithAltitude_andTimestamp_atBaseAltitude_(v24, v27, v28, v25, a3->timestamp, v26);
      uint64_t v31 = *((void *)internal + 2);
      v30 = (void *)*((void *)internal + 3);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = sub_1905C9370;
      v61[3] = &unk_1E568D320;
      v61[4] = v29;
      v61[5] = v31;
      objc_msgSend_addOperationWithBlock_(v30, v32, (uint64_t)v61);
      if (qword_1EB3BE888 != -1) {
        dispatch_once(&qword_1EB3BE888, &unk_1EDFD2AE0);
      }
      v33 = off_1EB3BE880;
      if (os_log_type_enabled((os_log_t)off_1EB3BE880, OS_LOG_TYPE_DEBUG))
      {
        v36 = objc_msgSend_relativeAltitude(v29, v34, v35);
        objc_msgSend_doubleValue(v36, v37, v38);
        v40 = v39;
        v43 = objc_msgSend_pressure(v29, v41, v42);
        objc_msgSend_doubleValue(v43, v44, v45);
        LODWORD(__p[0]) = 134218240;
        *(void **)((char *)__p + 4) = v40;
        WORD2(__p[1]) = 2048;
        *(void **)((char *)&__p[1] + 6) = v46;
        _os_log_impl(&dword_1902AF000, v33, OS_LOG_TYPE_DEBUG, "relativeAltitude,%f,pressure,%f", (uint8_t *)__p, 0x16u);
      }
      if (sub_1902D8400(115, 2))
      {
        bzero(__p, 0x65CuLL);
        if (qword_1EB3BE888 != -1) {
          dispatch_once(&qword_1EB3BE888, &unk_1EDFD2AE0);
        }
        v49 = objc_msgSend_relativeAltitude(v29, v47, v48);
        objc_msgSend_doubleValue(v49, v50, v51);
        uint64_t v53 = v52;
        v56 = objc_msgSend_pressure(v29, v54, v55);
        objc_msgSend_doubleValue(v56, v57, v58);
        int v62 = 134218240;
        uint64_t v63 = v53;
        __int16 v64 = 2048;
        uint64_t v65 = v59;
        v60 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 2, "-[CMAltimeter onFilteredPressure:]", "CoreLocation: %s\n", v60);
        if (v60 != (char *)__p) {
          free(v60);
        }
      }
    }
  }
}

+ (BOOL)isAbsoluteAltitudeAvailable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((sub_1902BB1DC() & 0x10) != 0)
  {
    sub_1902BAD40();
    if ((sub_1902CD6B0() & 0x8000000000000) != 0) {
      return 1;
    }
  }
  if (qword_1E929D758 != -1) {
    dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
  }
  uint64_t v2 = qword_1E929D750;
  if (os_log_type_enabled((os_log_t)qword_1E929D750, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1902AF000, v2, OS_LOG_TYPE_ERROR, "altimeter not supported", buf, 2u);
  }
  int v3 = sub_1902D8400(115, 0);
  BOOL result = 0;
  if (v3)
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D758 != -1) {
      dispatch_once(&qword_1E929D758, &unk_1EDFC1FA0);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "+[CMAltimeter isAbsoluteAltitudeAvailable]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
    return 0;
  }
  return result;
}

- (void)startAbsoluteAltitudeUpdatesToQueue:(NSOperationQueue *)queue withHandler:(CMAbsoluteAltitudeHandler)handler
{
  if (objc_msgSend_isAbsoluteAltitudeAvailable(CMAltimeter, a2, (uint64_t)queue))
  {
    id internal = self->_internal;
    MEMORY[0x1F4181798](internal, sel__startAbsoluteAltitudeUpdatesToQueue_withHandler_, queue);
  }
}

- (void)stopAbsoluteAltitudeUpdates
{
}

- (void)pauseAbsoluteAltitudeUpdates
{
}

- (void)resumeAbsoluteAltitudeUpdates
{
}

- (void)queryElevationProfileFromDate:(id)a3 toDate:(id)a4 withBatchSize:(unint64_t)a5 withHandler:(id)a6
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMAltimeter.mm", 1069, @"Invalid parameter not satisfying: %@", @"toDate");
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    __int16 v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMAltimeter.mm", 1070, @"Invalid parameter not satisfying: %@", @"handler");
    goto LABEL_4;
  }
  uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CMAltimeter.mm", 1068, @"Invalid parameter not satisfying: %@", @"fromDate");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1905C9724;
  v18[3] = &unk_1E5690470;
  v18[4] = self;
  v18[5] = a3;
  void v18[7] = a6;
  v18[8] = a5;
  v18[6] = a4;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v18);
}

@end