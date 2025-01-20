@interface CMSwimWorkout
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)swimLocationName:(int64_t)a3;
+ (id)swimWorkoutInstance:(id)a3;
- (CMSwimWorkout)initWithCoder:(id)a3;
- (CMSwimWorkout)initWithSessionId:(id)a3 location:(int64_t)a4 poolLength:(double)a5;
- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5;
- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7;
- (double)poolLength;
- (id)_initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)location;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSwimWorkout

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 location:(int64_t)a4 poolLength:(double)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4 >= 2)
  {
    v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CMWorkout.mm", 894, @"Invalid parameter not satisfying: %@", @"location < kCMSwimWorkoutLocationMax");
  }
  else if (!a4 && a5 < 1.0)
  {
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
    }
    v9 = qword_1E929D8C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v24 = a5;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
      }
      int v21 = 134217984;
      double v22 = a5;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSwimWorkout initWithSessionId:location:poolLength:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CMSwimWorkout;
  v10 = [(CMWorkout *)&v20 initWithSessionId:a3 type:19];
  v12 = v10;
  if (v10)
  {
    v10->fLocation = a4;
    v10->fPoolLength = a5;
    uint64_t v13 = objc_msgSend_CMWorkoutLocationTypeFromCMSwimWorkoutLocation_(CMWorkout, v11, a4);
    objc_msgSend_setLocationType_(v12, v14, v13);
  }
  return v12;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4 == 1 && a5 < 1.0)
  {
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
    }
    v9 = qword_1E929D8C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v16 = a5;
      _os_log_impl(&dword_1902AF000, v9, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
      }
      int v13 = 134217984;
      double v14 = a5;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSwimWorkout initWithSessionId:locationType:poolLength:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CMSwimWorkout;
  result = [(CMWorkout *)&v12 initWithSessionId:a3 type:19 locationType:a4];
  if (result) {
    result->fPoolLength = a5;
  }
  return result;
}

- (CMSwimWorkout)initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  if (a6)
  {
    if (a7) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMWorkout.mm", 923, @"Invalid parameter not satisfying: %@", @"startDate");
    if (a7) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CMWorkout.mm", 924, @"Invalid parameter not satisfying: %@", @"endDate");
LABEL_3:

  return (CMSwimWorkout *)objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(self, a2, (uint64_t)a3, a4, a6, a7, a5);
}

- (id)_initWithSessionId:(id)a3 locationType:(int64_t)a4 poolLength:(double)a5 startDate:(id)a6 endDate:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a4 == 1 && a5 < 1.0)
  {
    if (qword_1E929D8B8 != -1) {
      dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
    }
    int v13 = qword_1E929D8C0;
    if (os_log_type_enabled((os_log_t)qword_1E929D8C0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v24 = a5;
      _os_log_impl(&dword_1902AF000, v13, OS_LOG_TYPE_FAULT, "Workout, pool length %f for workout is too small and may lead to undefined behavior.", buf, 0xCu);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D8B8 != -1) {
        dispatch_once(&qword_1E929D8B8, &unk_1EDFD1680);
      }
      int v21 = 134217984;
      double v22 = a5;
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMSwimWorkout _initWithSessionId:locationType:poolLength:startDate:endDate:]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CMSwimWorkout;
  id v14 = [(CMWorkout *)&v20 _initWithSessionId:a3 type:19 locationType:a4 mode:0 startDate:a6 endDate:a7];
  double v16 = v14;
  if (v14)
  {
    *((double *)v14 + 11) = a5;
    *((void *)v14 + 10) = objc_msgSend_CMSwimWorkoutLocationFromCMWorkoutLocationType_(CMWorkout, v15, a4);
    objc_msgSend_setIsUserInitiated_(v16, v17, 0);
  }
  return v16;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMSwimWorkout;
  [(CMWorkout *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSwimWorkout)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CMSwimWorkout;
  v5 = -[CMWorkout initWithCoder:](&v19, sel_initWithCoder_);
  if (v5)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, @"kCMWorkoutDataCodingKeySwimLocation"))
    {
      v5->fLocation = objc_msgSend_decodeIntegerForKey_(a3, v6, @"kCMWorkoutDataCodingKeySwimLocation");
      uint64_t v9 = objc_msgSend_location(v5, v7, v8);
      uint64_t v11 = objc_msgSend_CMWorkoutLocationTypeFromCMSwimWorkoutLocation_(CMWorkout, v10, v9);
      objc_msgSend_setLocationType_(v5, v12, v11);
    }
    if (objc_msgSend_containsValueForKey_(a3, v6, @"kCMWorkoutDataCodingKeyLocationType"))
    {
      uint64_t v15 = objc_msgSend_locationType(v5, v13, v14);
      v5->fLocation = objc_msgSend_CMSwimWorkoutLocationFromCMWorkoutLocationType_(CMWorkout, v16, v15);
    }
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kCMWorkoutDataCodingKeyPoolLength");
    v5->fPoolLength = v17;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sessionId(self, v8, v9);
  uint64_t v13 = objc_msgSend_locationType(self, v11, v12);
  objc_msgSend_poolLength(self, v14, v15);
  double v17 = v16;
  uint64_t started = objc_msgSend_startDate(self, v18, v19);
  uint64_t v23 = objc_msgSend_endDate(self, v21, v22);
  uint64_t v25 = objc_msgSend__initWithSessionId_locationType_poolLength_startDate_endDate_(v7, v24, v10, v13, started, v23, v17);
  uint64_t v28 = objc_msgSend_appId(self, v26, v27);
  objc_msgSend_setAppId_(v25, v29, v28);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMSwimWorkout;
  -[CMWorkout encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fLocation, @"kCMWorkoutDataCodingKeySwimLocation");
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMWorkoutDataCodingKeyPoolLength", self->fPoolLength);
}

- (int64_t)location
{
  return self->fLocation;
}

- (double)poolLength
{
  return self->fPoolLength;
}

+ (id)swimLocationName:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return off_1E568D8D8[a3];
  }
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t v11 = objc_msgSend_location(self, v9, v10);
  uint64_t v13 = objc_msgSend_swimLocationName_(CMSwimWorkout, v12, v11);
  objc_msgSend_poolLength(self, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v3, v16, @"%@, <sessionId %@, type, kCMWorkoutTypeSwimming, location, %@, poolLength, %f>", v5, v8, v13, v17);
}

+ (id)swimWorkoutInstance:(id)a3
{
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(a3, v5, v4)) {
    return a3;
  }
  else {
    return 0;
  }
}

@end