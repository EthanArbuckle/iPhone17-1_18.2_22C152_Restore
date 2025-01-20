@interface CMNatalimeter
+ (BOOL)isNatalimeterAvailable;
+ (BOOL)resetCalibrationDataWithError:(id *)a3;
+ (BOOL)setUserInfo:(id)a3 error:(id *)a4;
+ (BOOL)setUserProfile:(id)a3 error:(id *)a4;
+ (double)activeMetsThreshold;
+ (double)briskMinuteMetsThreshold;
+ (double)computeTimeToActiveCalories:(id)a3 user:(id)a4 workoutType:(int64_t)a5;
+ (id)computeRestingCaloriesAtRate:(unint64_t)a3 user:(id)a4 duration:(double)a5;
+ (id)defaultUserProfile;
+ (id)maxNatalieEntries;
+ (id)userProfile;
- (CMNatalimeter)init;
- (CMNatalimeterInternal)_internal;
- (void)dealloc;
- (void)queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4;
- (void)queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4;
- (void)startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3;
- (void)stopAbsoluteNatalimetryDataUpdates;
@end

@implementation CMNatalimeter

- (CMNatalimeter)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMNatalimeter;
  v2 = [(CMNatalimeter *)&v4 init];
  if (v2) {
    v2->_internal = objc_alloc_init(CMNatalimeterInternal);
  }
  return v2;
}

- (void)dealloc
{
  fInternalQueue = self->_internal->fInternalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1904ED65C;
  block[3] = &unk_1E568D118;
  block[4] = self;
  dispatch_sync(fInternalQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)CMNatalimeter;
  [(CMNatalimeter *)&v4 dealloc];
}

+ (double)briskMinuteMetsThreshold
{
  return 4.40208912;
}

+ (double)activeMetsThreshold
{
  return 1.29999995;
}

+ (id)userProfile
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  sub_1904EF348("kCLConnectionMessageNatalimetryGetUserProfile", &v15);
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_setWithObjects_(v3, v6, v4, v5, 0);
  uint64_t v13 = v15;
  v14 = v16;
  if (v16) {
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v9 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v7, (uint64_t)&v13, v8);
  if (v14) {
    sub_1902D8B58(v14);
  }
  if (!v9)
  {
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    v10 = qword_1E929D768;
    if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1902AF000, v10, OS_LOG_TYPE_ERROR, "UserProfile, Invalid response", buf, 2u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
      }
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMNatalimeter userProfile]", "CoreLocation: %s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
  if (v16) {
    sub_1902D8B58(v16);
  }
  objc_sync_exit(a1);
  return v9;
}

+ (id)defaultUserProfile
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"CMNatalimeterSetUserHeightMeter";
  v3[1] = @"CMNatalimeterSetUserWeightKG";
  v4[0] = &unk_1EE001E88;
  v4[1] = &unk_1EE001E98;
  v3[2] = @"CMNatalimeterSetUserAgeYr";
  v3[3] = @"CMNatalimeterSetUserBiologicalSex";
  v4[2] = &unk_1EE001EA8;
  v4[3] = &unk_1EE001D50;
  v3[4] = @"CMNatalimeterSetUserCondition";
  v3[5] = @"CMNatalimeterSetUserBetaBlockerUse";
  v4[4] = &unk_1EE001D50;
  v4[5] = MEMORY[0x1E4F1CC28];
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v4, v3, 6);
}

+ (BOOL)setUserProfile:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  objc_sync_enter(a1);
  sub_1904EF480("kCLConnectionMessageNatalimetrySetUserProfile", &v34, &v32);
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v11 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
  uint64_t v30 = v32;
  v31 = v33;
  if (v33) {
    atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v10, (uint64_t)&v30, v11);
  if (v31) {
    sub_1902D8B58(v31);
  }
  v14 = objc_msgSend_objectForKeyedSubscript_(v13, v12, @"CMErrorMessage");
  if (!v14) {
    goto LABEL_13;
  }
  if (qword_1E929D760 != -1) {
    dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
  }
  uint64_t v15 = qword_1E929D768;
  if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
  {
    int v18 = objc_msgSend_intValue(v14, v16, v17);
    *(_DWORD *)buf = 67240192;
    int v38 = v18;
    _os_log_impl(&dword_1902AF000, v15, OS_LOG_TYPE_ERROR, "UserProfile, Error while setting, %{public}d", buf, 8u);
  }
  if (sub_1902D8400(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    int v28 = objc_msgSend_intValue(v14, v26, v27);
    int v35 = 67240192;
    int v36 = v28;
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 0, "+[CMNatalimeter setUserProfile:error:]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf) {
      free(v29);
    }
  }
  if (a4)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_msgSend_integerValue(v14, v19, v20);
    BOOL v24 = 0;
    *a4 = (id)objc_msgSend_errorWithDomain_code_userInfo_(v21, v23, @"CMErrorDomain", v22, 0);
  }
  else
  {
LABEL_13:
    BOOL v24 = 1;
  }
  if (v33) {
    sub_1902D8B58(v33);
  }
  objc_sync_exit(a1);
  return v24;
}

+ (BOOL)setUserInfo:(id)a3 error:(id *)a4
{
  v40[6] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_gender(a3, a2, (uint64_t)a3);
  if (v7 == 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2 * (v7 == 0);
  }
  v39[0] = @"CMNatalimeterSetUserHeightMeter";
  uint64_t v11 = NSNumber;
  objc_msgSend_height(a3, v8, v9);
  v40[0] = objc_msgSend_numberWithDouble_(v11, v12, v13);
  v39[1] = @"CMNatalimeterSetUserWeightKG";
  v14 = NSNumber;
  objc_msgSend_weight(a3, v15, v16);
  v40[1] = objc_msgSend_numberWithDouble_(v14, v17, v18);
  v39[2] = @"CMNatalimeterSetUserAgeYr";
  v19 = NSNumber;
  objc_msgSend_age(a3, v20, v21);
  v40[2] = objc_msgSend_numberWithDouble_(v19, v22, v23);
  v39[3] = @"CMNatalimeterSetUserBiologicalSex";
  v40[3] = objc_msgSend_numberWithInteger_(NSNumber, v24, v10);
  v39[4] = @"CMNatalimeterSetUserCondition";
  v25 = NSNumber;
  uint64_t v28 = objc_msgSend_condition(a3, v26, v27);
  v40[4] = objc_msgSend_numberWithInteger_(v25, v29, v28);
  v39[5] = @"CMNatalimeterSetUserBetaBlockerUse";
  uint64_t v30 = NSNumber;
  uint64_t v33 = objc_msgSend_betaBlockerUse(a3, v31, v32);
  v40[5] = objc_msgSend_numberWithBool_(v30, v34, v33);
  uint64_t v36 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v40, v39, 6);
  return objc_msgSend_setUserProfile_error_(a1, v37, v36, a4);
}

+ (BOOL)resetCalibrationDataWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(a1);
  sub_1904C0EF0("kCLConnectionMessageNatalimetryResetCalibration", &v27);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_setWithObjects_(v5, v8, v6, v7, 0);
  uint64_t v25 = v27;
  v26 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12 = objc_msgSend_sendMessage_withReplyClassesSync_(CMMotionUtils, v9, (uint64_t)&v25, v10);
  if (v26) {
    sub_1902D8B58(v26);
  }
  if (v12 && !objc_msgSend_objectForKeyedSubscript_(v12, v11, @"CMErrorMessage"))
  {
    BOOL v22 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v12, v11, @"CMErrorMessage");
    if (v13)
    {
      uint64_t v16 = objc_msgSend_integerValue(v13, v14, v15);
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
      }
      uint64_t v17 = qword_1E929D768;
      if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v32 = v16;
        _os_log_impl(&dword_1902AF000, v17, OS_LOG_TYPE_ERROR, "Unable to reset calibration data. Error code %{public}ld.", buf, 0xCu);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D760 != -1) {
          dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
        }
        int v29 = 134349056;
        uint64_t v30 = v16;
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMNatalimeter resetCalibrationDataWithError:]", "CoreLocation: %s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
    }
    else
    {
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
      }
      uint64_t v20 = qword_1E929D768;
      if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1902AF000, v20, OS_LOG_TYPE_FAULT, "Invalid response to reset calibration.", buf, 2u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D760 != -1) {
          dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
        }
        LOWORD(v29) = 0;
        BOOL v24 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "+[CMNatalimeter resetCalibrationDataWithError:]", "CoreLocation: %s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
      uint64_t v16 = 103;
    }
    if (a3)
    {
      uint64_t v21 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, @"CMErrorDomain", v16, 0);
      BOOL v22 = 0;
      *a3 = v21;
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  if (v28) {
    sub_1902D8B58(v28);
  }
  objc_sync_exit(a1);
  return v22;
}

+ (BOOL)isNatalimeterAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  sub_1902BAD40();

  return objc_msgSend_featureAvailability_(CMMotionUtils, v3, (uint64_t)"kCLConnectionMessageNatalimetryAvailable");
}

- (void)queryAbsoluteNatalimetryDataSinceRecord:(int64_t)a3 withHandler:(id)a4
{
  if (!a4)
  {
    uint64_t v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CMNatalimeter.mm", 417, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1904EE418;
  v10[3] = &unk_1E568E590;
  v10[5] = a4;
  v10[6] = a3;
  v10[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v10);
}

- (void)queryAbsoluteNatalimetryDataSinceDataRecord:(id)a3 withHandler:(id)a4
{
  if (!a4)
  {
    uint64_t v16 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, @"CMNatalimeter.mm", 425, @"Invalid parameter not satisfying: %@", @"handler");
  }
  if (qword_1EB3BF310 != -1) {
    dispatch_once(&qword_1EB3BF310, &unk_1EDFD3CE0);
  }
  if (qword_1EB3BF308 == 3)
  {
    if (a3)
    {
      uint64_t v6 = objc_msgSend_sourceId(a3, a2, (uint64_t)a3);
      uint64_t v9 = objc_msgSend__internal(self, v7, v8);
      uint64_t v12 = v9;
      if (v6)
      {
        MEMORY[0x1F4181798](v9, sel__queryAbsoluteNatalimetryDataSinceDataRecord_withHandler_, a3);
        return;
      }
      uint64_t v14 = objc_msgSend_recordId(a3, v10, v11);
      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = objc_msgSend__internal(self, a2, (uint64_t)a3);
      uint64_t v14 = 0;
    }
    MEMORY[0x1F4181798](v13, sel__queryAbsoluteNatalimetryDataSinceRecord_withHandler_, v14);
  }
}

- (void)startAbsoluteNatalimetryDataUpdatesWithHandler:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, @"CMNatalimeter.mm", 445, @"Invalid parameter not satisfying: %@", @"handler");
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1904EE6A0;
  v8[3] = &unk_1E568D2F8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v8);
}

- (void)stopAbsoluteNatalimetryDataUpdates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1904EE754;
  v2[3] = &unk_1E568D118;
  v2[4] = self;
  objc_msgSend_tccServiceMotionAccessWithBlock_(CMMotionUtils, a2, (uint64_t)v2);
}

+ (id)maxNatalieEntries
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1F4181798])(CMNatalieData, sel_maxNatalieEntries);
}

+ (id)computeRestingCaloriesAtRate:(unint64_t)a3 user:(id)a4 duration:(double)a5
{
  if (!a4)
  {
    uint64_t v32 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, a1, @"CMNatalimeter.mm", 465, @"Invalid parameter not satisfying: %@", @"userInfo");
  }
  if (!objc_msgSend_gender(a4, a2, a3) || objc_msgSend_gender(a4, v7, v8) == 1) {
    objc_msgSend_gender(a4, v7, v8);
  }
  objc_msgSend_height(a4, v7, v8);
  if (v11 > 0.0) {
    objc_msgSend_height(a4, v9, v10);
  }
  objc_msgSend_weight(a4, v9, v10);
  if (v14 <= 0.0)
  {
    double v16 = 68.0299988;
  }
  else
  {
    objc_msgSend_weight(a4, v12, v13);
    *(float *)&double v15 = v15;
    double v16 = *(float *)&v15;
  }
  objc_msgSend_age(a4, v12, v13);
  if (v19 > 0.0) {
    objc_msgSend_age(a4, v17, v18);
  }
  if ((objc_msgSend_condition(a4, v17, v18) & 0x8000000000000000) == 0 && objc_msgSend_condition(a4, v20, v21) <= 6) {
    objc_msgSend_condition(a4, v22, v23);
  }
  BOOL v24 = NSNumber;
  sub_1905922AC();
  double v28 = v16 * v27 * a5 * 1000.0 / 3600.0;

  return (id)objc_msgSend_numberWithDouble_(v24, v25, v26, v28);
}

+ (double)computeTimeToActiveCalories:(id)a3 user:(id)a4 workoutType:(int64_t)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v53 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v53, v54, (uint64_t)a2, a1, @"CMNatalimeter.mm", 490, @"Invalid parameter not satisfying: %@", @"activeCalories");
    if (a4) {
      goto LABEL_3;
    }
LABEL_59:
    v55 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v55, v56, (uint64_t)a2, a1, @"CMNatalimeter.mm", 491, @"Invalid parameter not satisfying: %@", @"userInfo");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_59;
  }
LABEL_3:
  if (!objc_msgSend_gender(a4, a2, (uint64_t)a3) || objc_msgSend_gender(a4, v10, v11) == 1) {
    objc_msgSend_gender(a4, v10, v11);
  }
  objc_msgSend_height(a4, v10, v11);
  if (v14 <= 0.0)
  {
    float v16 = 1.7;
  }
  else
  {
    objc_msgSend_height(a4, v12, v13);
    float v16 = v15;
  }
  objc_msgSend_weight(a4, v12, v13);
  if (v19 <= 0.0)
  {
    float v21 = 68.03;
  }
  else
  {
    objc_msgSend_weight(a4, v17, v18);
    float v21 = v20;
  }
  objc_msgSend_age(a4, v17, v18);
  float v24 = 30.0;
  if (v25 > 0.0)
  {
    objc_msgSend_age(a4, v22, v23);
    float v24 = v26;
  }
  if ((objc_msgSend_condition(a4, v22, v23) & 0x8000000000000000) == 0 && objc_msgSend_condition(a4, v27, v28) <= 6) {
    objc_msgSend_condition(a4, v27, v29);
  }
  int v30 = objc_msgSend_CLMotionActivityTypeFromCMWorkoutType_(CMWorkout, v27, a5);
  objc_msgSend_doubleValue(a3, v31, v32);
  double v34 = v33;
  double v35 = 0.0;
  if (v30 > 17149)
  {
    if (v30 == 90603) {
      goto LABEL_32;
    }
    if (v30 != 17150) {
      goto LABEL_45;
    }
LABEL_23:
    double v36 = dbl_19060AA80[v24 <= 13.0];
    double v37 = fmin(v16 * 0.5 + 0.225, 1.0);
    if (v36 < v37) {
      double v36 = v37;
    }
    double v38 = fmax(fmin(v24 * -0.01 + 1.6, 1.0), 0.7);
    double v39 = fmax(fmin(v21 / (v16 * v16) * -0.0125 + 1.425, 1.0), 0.9);
    if (v38 >= v36) {
      double v40 = v36;
    }
    else {
      double v40 = v38;
    }
    if (v39 < v40) {
      double v40 = v39;
    }
    if (v40 == 1.0)
    {
      float v41 = 3.2973;
    }
    else
    {
      double v43 = fmax(v38 * v36 * v39, 0.9);
      if (v43 >= v40) {
        double v43 = v40;
      }
      float v41 = v43 * 3.2973001;
      double v44 = 0.0;
      if (v41 < 1.0) {
        goto LABEL_39;
      }
    }
    float v45 = (float)((float)(v41 * -0.793) + (float)((float)(v41 * 0.3564) * v41)) + 3.142;
    if (v45 > 8.0) {
      float v45 = 8.0;
    }
    double v44 = v45;
LABEL_39:
    double v46 = 2.19999981;
    if (v44 >= 2.19999981) {
      double v46 = v44;
    }
    if (v46 > 4.40208912) {
      double v46 = 4.40208912;
    }
    double v42 = v46 * v21;
    goto LABEL_44;
  }
  if (v30 == 4) {
    goto LABEL_23;
  }
  if (v30 == 11805)
  {
LABEL_32:
    double v42 = (float)(v21 * 2.7757);
LABEL_44:
    double v35 = v42 * 1000.0;
  }
LABEL_45:
  sub_1905922AC();
  double v48 = v35 + v47 * v21 * 3600.0 * -1000.0 / 3600.0;
  if (v48 <= 0.0)
  {
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    v50 = qword_1E929D768;
    if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218243;
      double v60 = 0.0;
      __int16 v61 = 2113;
      double v62 = *(double *)&a4;
      _os_log_impl(&dword_1902AF000, v50, OS_LOG_TYPE_ERROR, "TimeToActiveCalories is negative: timeToActiveCalories, %f, %{private}@", buf, 0x16u);
    }
    double v49 = 0.0;
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
      }
      v58 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMNatalimeter computeTimeToActiveCalories:user:workoutType:]", "CoreLocation: %s\n", v58);
      if (v58 != (char *)buf) {
        free(v58);
      }
    }
  }
  else
  {
    double v49 = v34 * 3600.0 / v48;
  }
  if (qword_1E929D760 != -1) {
    dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
  }
  v51 = qword_1E929D768;
  if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218755;
    double v60 = v49;
    __int16 v61 = 2048;
    double v62 = v34;
    __int16 v63 = 2048;
    int64_t v64 = a5;
    __int16 v65 = 2113;
    id v66 = a4;
    _os_log_impl(&dword_1902AF000, v51, OS_LOG_TYPE_INFO, "TimeToActiveCalories, %f, target, %f, workoutType, %ld, %{private}@", buf, 0x2Au);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2F40);
    }
    v57 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMNatalimeter computeTimeToActiveCalories:user:workoutType:]", "CoreLocation: %s\n", v57);
    if (v57 != (char *)buf) {
      free(v57);
    }
  }
  return v49;
}

- (CMNatalimeterInternal)_internal
{
  return self->_internal;
}

@end