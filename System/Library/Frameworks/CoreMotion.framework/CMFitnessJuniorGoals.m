@interface CMFitnessJuniorGoals
+ (BOOL)isAvailable;
+ (unint64_t)recommendedMoveMinutesForLevel:(int64_t)a3 userInfo:(id)a4 error:(id *)a5;
- (CMFitnessJuniorGoals)init;
- (void)dealloc;
@end

@implementation CMFitnessJuniorGoals

- (CMFitnessJuniorGoals)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMFitnessJuniorGoals;
  return [(CMFitnessJuniorGoals *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMFitnessJuniorGoals;
  [(CMFitnessJuniorGoals *)&v2 dealloc];
}

+ (BOOL)isAvailable
{
  sub_1902BAD40();
  sub_1902BAD40();

  return sub_19046BC40();
}

+ (unint64_t)recommendedMoveMinutesForLevel:(int64_t)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 3)
  {
    v26 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, a1, @"CMFitnessJuniorGoals.mm", 40, @"CMFitnessJuniorGoalLevel must be low, medium, or high");
    if (a4) {
      goto LABEL_3;
    }
LABEL_18:
    v28 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, a1, @"CMFitnessJuniorGoals.mm", 41, @"userInfo must not be empty.");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_18;
  }
LABEL_3:
  objc_msgSend_age(a4, a2, a3);
  if (v12 < 5.0 || (objc_msgSend_age(a4, v10, v11), v13 >= 13.0))
  {
    if (qword_1E929D760 != -1) {
      dispatch_once(&qword_1E929D760, &unk_1EDFD2040);
    }
    v14 = qword_1E929D768;
    if (os_log_type_enabled((os_log_t)qword_1E929D768, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_age(a4, v15, v16);
      *(_DWORD *)buf = 134283521;
      uint64_t v39 = v17;
      _os_log_impl(&dword_1902AF000, v14, OS_LOG_TYPE_ERROR, "FitnessJuniorGoals, Unexpected age input: %{private}f yrs. Fitness junior move minute goals are designed for user age interval [5.0, 13.0) yrs.", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D760 != -1) {
        dispatch_once(&qword_1E929D760, &unk_1EDFD2040);
      }
      objc_msgSend_age(a4, v30, v31);
      int v36 = 134283521;
      uint64_t v37 = v32;
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "+[CMFitnessJuniorGoals recommendedMoveMinutesForLevel:userInfo:error:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
    }
    if (a5)
    {
      v19 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E4F28B50], v18, @"com.apple.coremotion");
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v35 = objc_msgSend_localizedStringForKey_value_table_(v19, v20, @"Unexpected age input. Fitness junior move minute goals are designed for user age interval [5.0, 13.0 yrs."), &stru_1EDFD5D50, 0);
      uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v35, &v34, 1);
      *a5 = (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"CMErrorDomain", 107, v22);
    }
  }
  unint64_t v24 = 90;
  if (a3 == 2) {
    unint64_t v24 = 120;
  }
  if (a3) {
    return v24;
  }
  else {
    return 60;
  }
}

@end