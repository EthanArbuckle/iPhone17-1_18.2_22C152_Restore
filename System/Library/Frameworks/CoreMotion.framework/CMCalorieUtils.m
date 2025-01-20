@interface CMCalorieUtils
+ (BOOL)isAvailable;
+ (CLBodyMetrics)CLBodyMetricsFromCMCalorieUserInfo:(SEL)a3 error:(id)a4;
+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 error:(id *)a5;
+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 userInfo:(id)a5 error:(id *)a6;
@end

@implementation CMCalorieUtils

+ (BOOL)isAvailable
{
  sub_1902BAD40();

  return sub_19046BC40();
}

+ (CLBodyMetrics)CLBodyMetricsFromCMCalorieUserInfo:(SEL)a3 error:(id)a4
{
  *(_OWORD *)&retstr->var0 = xmmword_19060D120;
  *(_OWORD *)&retstr->var4 = unk_19060D130;
  *(_OWORD *)&retstr->var8 = xmmword_19060D140;
  *(_OWORD *)&retstr->var11 = *(long long *)((char *)&xmmword_19060D140 + 12);
  if (objc_msgSend_gender(a4, a3, (uint64_t)a4) && objc_msgSend_gender(a4, v8, v9) != 1)
  {
    if (!a5)
    {
      objc_msgSend_height(a4, v8, v9);
      if (v16 > 0.0) {
        goto LABEL_7;
      }
      goto LABEL_11;
    }
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, @"CMErrorDomain", 107, 0);
  }
  else
  {
    retstr->var0 = objc_msgSend_gender(a4, v8, v9);
  }
  objc_msgSend_height(a4, v10, v11);
  if (v14 > 0.0)
  {
LABEL_7:
    objc_msgSend_height(a4, v12, v13);
    *(float *)&double v15 = v15;
    retstr->var15 = 1;
    retstr->var2 = *(float *)&v15;
    goto LABEL_11;
  }
  if (a5) {
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, @"CMErrorDomain", 107, 0);
  }
LABEL_11:
  objc_msgSend_weight(a4, v12, v13);
  if (v19 <= 0.0)
  {
    if (!a5)
    {
      objc_msgSend_age(a4, v17, v18);
      if (v27 <= 0.0) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, @"CMErrorDomain", 107, 0);
  }
  else
  {
    objc_msgSend_weight(a4, v17, v18);
    *(float *)&double v22 = v22;
    retstr->var16 = 1;
    retstr->var3 = *(float *)&v22;
  }
  objc_msgSend_age(a4, v20, v21);
  if (v25 > 0.0)
  {
LABEL_16:
    objc_msgSend_age(a4, v23, v24);
    *(float *)&double v26 = v26;
    retstr->var14 = 1;
    retstr->var5 = *(float *)&v26;
    goto LABEL_20;
  }
  if (a5) {
    *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"CMErrorDomain", 107, 0);
  }
LABEL_20:
  if (objc_msgSend_condition(a4, v23, v24) < 0 || objc_msgSend_condition(a4, v28, v29) > 6)
  {
    if (a5) {
      *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v28, @"CMErrorDomain", 107, 0);
    }
  }
  else
  {
    retstr->var10 = objc_msgSend_condition(a4, v28, v29);
  }
  result = (CLBodyMetrics *)objc_msgSend_betaBlockerUse(a4, v28, v29);
  if (result) {
    retstr->var12 = 1;
  }
  return result;
}

+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 userInfo:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    double v27 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v27, v28, (uint64_t)a2, a1, @"CMCalorieUtils.mm", 75, @"Invalid parameter not satisfying: %@", @"userInfo");
  }
  if (a4 <= 0.0)
  {
    if (a6) {
      *a6 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, @"CMErrorDomain", 107, 0);
    }
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2CA0);
    }
    v12 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v31 = a4;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "Workout calorie lookup, duration must be positive, %f", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 == -1) {
      goto LABEL_31;
    }
    goto LABEL_33;
  }
  objc_msgSend_CLBodyMetricsFromCMCalorieUserInfo_error_(CMCalorieUtils, a2, (uint64_t)a5, a6);
  if (*a6)
  {
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2CA0);
    }
    uint64_t v11 = off_1EB3BE890;
    if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v31 = *(double *)&a5;
      _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "Workout calorie lookup, invalid userInfo, %@", buf, 0xCu);
    }
    if (!sub_1902D8400(115, 0)) {
      return 0;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 == -1)
    {
LABEL_31:
      uint64_t v29 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMCalorieUtils lookupCalorieDataForCMWorkoutType:duration:userInfo:error:]", "CoreLocation: %s\n", v29);
      if (v29 != (char *)buf) {
        free(v29);
      }
      return 0;
    }
LABEL_33:
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2CA0);
    goto LABEL_31;
  }
  int v15 = objc_msgSend_CLMotionActivityTypeFromCMWorkoutType_(CMWorkout, v10, a3);
  float v16 = sub_190569460(v15);
  sub_1905922AC();
  float v18 = v17;
  double v19 = (float)(v17 * 0.0) * a4 / 3600.0;
  v20 = [CMCalorieData alloc];
  id v13 = (id)objc_msgSend_initWithWorkoutType_duration_mets_basalMets_totalCalories_basalCalories_(v20, v21, a3, a4, v16, v18, (float)(v16 * 0.0) * a4 / 3600.0, v19);
  if (qword_1EB3BE898 != -1) {
    dispatch_once(&qword_1EB3BE898, &unk_1EDFD2CA0);
  }
  double v22 = off_1EB3BE890;
  if (os_log_type_enabled((os_log_t)off_1EB3BE890, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = *a6;
    *(_DWORD *)buf = 138412802;
    double v31 = *(double *)&v13;
    __int16 v32 = 2112;
    id v33 = a5;
    __int16 v34 = 2112;
    id v35 = v23;
    _os_log_impl(&dword_1902AF000, v22, OS_LOG_TYPE_DEFAULT, "Workout calorie lookup, %@, %@, %@", buf, 0x20u);
  }
  if (sub_1902D8400(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB3BE898 != -1) {
      dispatch_once(&qword_1EB3BE898, &unk_1EDFD2CA0);
    }
    uint64_t v24 = (char *)_os_log_send_and_compose_impl();
    sub_1902D398C("Generic", 1, 0, 2, "+[CMCalorieUtils lookupCalorieDataForCMWorkoutType:duration:userInfo:error:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
  return v13;
}

+ (id)lookupCalorieDataForCMWorkoutType:(int64_t)a3 duration:(double)a4 error:(id *)a5
{
  v6 = [CMCalorieUserInfo alloc];
  id v8 = (id)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(v6, v7, 0, 0, 0, 30.0, 1.70000005, 68.0299988);

  return (id)MEMORY[0x1F4181798](CMCalorieUtils, sel_lookupCalorieDataForCMWorkoutType_duration_userInfo_error_, a3);
}

@end