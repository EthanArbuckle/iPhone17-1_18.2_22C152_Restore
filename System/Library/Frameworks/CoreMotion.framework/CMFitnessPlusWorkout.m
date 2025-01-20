@interface CMFitnessPlusWorkout
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)fitnessPlusWorkoutInstance:(id)a3;
+ (id)mediaTypeName:(int64_t)a3;
- (CMFitnessPlusWorkout)initWithCoder:(id)a3;
- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6;
- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 error:(id *)a7;
- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 locationType:(int64_t)a7 error:(id *)a8;
- (NSString)catalogWorkoutId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mediaType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMFitnessPlusWorkout

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }

  return objc_msgSend_isAvailable(CMWorkout, v2, v3);
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6
{
  uint64_t v11 = objc_msgSend_UUIDString(a5, a2, (uint64_t)a3);

  return (CMFitnessPlusWorkout *)objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(self, v10, (uint64_t)a3, a4, v11, a6, 0);
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 error:(id *)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CMFitnessPlusWorkout;
  v12 = [(CMWorkout *)&v17 initWithSessionId:a3 type:a4];
  if (v12)
  {
    if (a5 && (unint64_t)objc_msgSend_length(a5, v10, v11) <= 0x3F)
    {
      v12->fCatalogWorkoutId = (NSString *)a5;
    }
    else
    {
      v12->fCatalogWorkoutId = (NSString *)@"Invalid";
      if (a7)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F28568];
        v19[0] = @"catalogWorkoutId string too long";
        uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v19, &v18, 1);
        *a7 = (id)objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, @"CMErrorDomain", 107, v14);
      }
    }
    v12->fMediaType = a6;
  }
  return v12;
}

- (CMFitnessPlusWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 catalogWorkoutId:(id)a5 mediaType:(int64_t)a6 locationType:(int64_t)a7 error:(id *)a8
{
  if (objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(self, a2, (uint64_t)a3, a4, a5, a6, a8)) {
    objc_msgSend_setLocationType_(self, v10, a7);
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMFitnessPlusWorkout;
  [(CMWorkout *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessPlusWorkout)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMFitnessPlusWorkout;
  v5 = -[CMWorkout initWithCoder:](&v11, sel_initWithCoder_);
  if (v5)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, @"kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId"))
    {
      uint64_t v7 = objc_opt_class();
      v5->fCatalogWorkoutId = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId");
    }
    if (objc_msgSend_containsValueForKey_(a3, v6, @"kCMWorkoutDataCodingKeyFitnessPlusMediaType"))v5->fMediaType = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMWorkoutDataCodingKeyFitnessPlusMediaType"); {
  }
    }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sessionId(self, v8, v9);
  uint64_t v13 = objc_msgSend_type(self, v11, v12);
  uint64_t v16 = objc_msgSend_catalogWorkoutId(self, v14, v15);
  uint64_t v19 = objc_msgSend_mediaType(self, v17, v18);
  v21 = objc_msgSend_initWithSessionId_type_catalogWorkoutId_mediaType_error_(v7, v20, v10, v13, v16, v19, 0);
  uint64_t v24 = objc_msgSend_locationType(self, v22, v23);
  objc_msgSend_setLocationType_(v21, v25, v24);
  uint64_t v28 = objc_msgSend_mode(self, v26, v27);
  objc_msgSend_setWorkoutMode_(v21, v29, v28);
  uint64_t v32 = objc_msgSend_appId(self, v30, v31);
  objc_msgSend_setAppId_(v21, v33, v32);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMFitnessPlusWorkout;
  -[CMWorkout encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fCatalogWorkoutId, @"kCMWorkoutDataCodingKeyFitnessPlusCatalogWorkoutId");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fMediaType, @"kCMWorkoutDataCodingKeyFitnessPlusMediaType");
}

- (NSString)catalogWorkoutId
{
  return self->fCatalogWorkoutId;
}

- (int64_t)mediaType
{
  return self->fMediaType;
}

+ (id)mediaTypeName:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E568D8F0[a3];
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t v11 = objc_msgSend_type(self, v9, v10);
  uint64_t v13 = objc_msgSend_workoutName_(CMWorkout, v12, v11);
  uint64_t v16 = objc_msgSend_locationType(self, v14, v15);
  uint64_t v18 = objc_msgSend_workoutLocationName_(CMWorkout, v17, v16);
  uint64_t v21 = objc_msgSend_catalogWorkoutId(self, v19, v20);
  uint64_t v24 = objc_msgSend_mediaType(self, v22, v23);
  uint64_t v26 = objc_msgSend_mediaTypeName_(CMFitnessPlusWorkout, v25, v24);
  return (id)objc_msgSend_stringWithFormat_(v3, v27, @"%@, <sessionId %@, type, %@, locationType, %@, catalogWorkoutId, %@, mediaType, %@>", v5, v8, v13, v18, v21, v26);
}

+ (id)fitnessPlusWorkoutInstance:(id)a3
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