@interface CMWorkout
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (BOOL)workoutIsSupportedForLowPower:(int64_t)a3;
+ (BOOL)workoutIsTypePedestrian:(int64_t)a3;
+ (BOOL)workoutIsTypeRunning:(int64_t)a3;
+ (BOOL)workoutIsTypeWalking:(int64_t)a3;
+ (id)workoutLocationName:(int64_t)a3;
+ (id)workoutModeName:(unint64_t)a3;
+ (id)workoutName:(int64_t)a3;
+ (int)CLMotionActivityTypeFromCMWorkoutType:(int64_t)a3;
+ (int64_t)CMSwimWorkoutLocationFromCMWorkoutLocationType:(int64_t)a3;
+ (int64_t)CMWorkoutLocationTypeFromCMSwimWorkoutLocation:(int64_t)a3;
+ (int64_t)CMWorkoutTypeFromCLMotionActivityType:(int)a3;
+ (int64_t)workoutLocationTypeFromCMWorkoutType:(int64_t)a3;
- (BOOL)isSameWorkout:(id)a3;
- (BOOL)isUserInitiated;
- (CMWorkout)initWithCoder:(id)a3;
- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4;
- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5;
- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6;
- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)appId;
- (NSUUID)sessionId;
- (id)_initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)locationType;
- (int64_t)type;
- (unint64_t)mode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAppId:(id)a3;
- (void)setIsUserInitiated:(BOOL)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setWorkoutMode:(unint64_t)a3;
- (void)setWorkoutType:(int64_t)a3;
@end

@implementation CMWorkout

+ (int)CLMotionActivityTypeFromCMWorkoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x40) {
    return 0;
  }
  else {
    return dword_190608AC8[a3 - 1];
  }
}

+ (int64_t)CMWorkoutTypeFromCLMotionActivityType:(int)a3
{
  int64_t result = 0;
  if (a3 > 15149)
  {
    if (a3 <= 15669)
    {
      if (a3 > 15459)
      {
        int v4 = 15609;
        uint64_t v38 = 62;
        if (a3 != 15660) {
          uint64_t v38 = 0;
        }
        if (a3 == 15652) {
          uint64_t v39 = 56;
        }
        else {
          uint64_t v39 = v38;
        }
        uint64_t v40 = 59;
        if (a3 != 15620) {
          uint64_t v40 = 0;
        }
        if (a3 == 15610) {
          uint64_t v41 = 39;
        }
        else {
          uint64_t v41 = v40;
        }
        if (a3 <= 15651) {
          int64_t v6 = v41;
        }
        else {
          int64_t v6 = v39;
        }
        int v7 = 15460;
        uint64_t v8 = 45;
        int v23 = 15560;
        uint64_t v24 = 44;
        BOOL v25 = a3 == 15592;
        uint64_t v26 = 46;
      }
      else
      {
        int v4 = 15254;
        uint64_t v19 = 48;
        if (a3 != 15360) {
          uint64_t v19 = 0;
        }
        if (a3 == 15350) {
          uint64_t v20 = 49;
        }
        else {
          uint64_t v20 = v19;
        }
        uint64_t v21 = 57;
        if (a3 != 15330) {
          uint64_t v21 = 0;
        }
        if (a3 == 15255) {
          uint64_t v22 = 27;
        }
        else {
          uint64_t v22 = v21;
        }
        if (a3 <= 15349) {
          int64_t v6 = v22;
        }
        else {
          int64_t v6 = v20;
        }
        int v7 = 15150;
        uint64_t v8 = 61;
        int v23 = 15230;
        uint64_t v24 = 42;
        BOOL v25 = a3 == 15250;
        uint64_t v26 = 43;
      }
    }
    else
    {
      if (a3 > 18239)
      {
        if (a3 > 90602)
        {
          int v4 = 515651;
          uint64_t v45 = 37;
          if (a3 != 519150) {
            uint64_t v45 = 0;
          }
          if (a3 == 515652) {
            int64_t v6 = 53;
          }
          else {
            int64_t v6 = v45;
          }
          int v7 = 90603;
          uint64_t v8 = 21;
          BOOL v9 = a3 == 515621;
          uint64_t v10 = 60;
        }
        else
        {
          int v4 = 19089;
          uint64_t v5 = 23;
          if (a3 != 19150) {
            uint64_t v5 = 0;
          }
          if (a3 == 19090) {
            int64_t v6 = 36;
          }
          else {
            int64_t v6 = v5;
          }
          int v7 = 18240;
          uint64_t v8 = 19;
          BOOL v9 = a3 == 19030;
          uint64_t v10 = 47;
        }
        if (!v9) {
          uint64_t v10 = 0;
        }
LABEL_126:
        if (a3 == v7) {
          int64_t v35 = v8;
        }
        else {
          int64_t v35 = v10;
        }
        goto LABEL_129;
      }
      int v4 = 15732;
      uint64_t v27 = 38;
      if (a3 != 18100) {
        uint64_t v27 = 0;
      }
      if (a3 == 18050) {
        uint64_t v28 = 35;
      }
      else {
        uint64_t v28 = v27;
      }
      uint64_t v29 = 16;
      if (a3 != 17150) {
        uint64_t v29 = 0;
      }
      if (a3 == 15733) {
        uint64_t v30 = 58;
      }
      else {
        uint64_t v30 = v29;
      }
      if (a3 <= 18049) {
        int64_t v6 = v30;
      }
      else {
        int64_t v6 = v28;
      }
      int v7 = 15670;
      uint64_t v8 = 31;
      int v23 = 15675;
      uint64_t v24 = 51;
      BOOL v25 = a3 == 15711;
      uint64_t v26 = 55;
    }
    if (!v25) {
      uint64_t v26 = 0;
    }
    if (a3 == v23) {
      uint64_t v10 = v24;
    }
    else {
      uint64_t v10 = v26;
    }
    goto LABEL_126;
  }
  if (a3 > 2060)
  {
    if (a3 <= 3014)
    {
      int64_t v11 = 32;
      uint64_t v12 = 6;
      if (a3 != 2150) {
        uint64_t v12 = 0;
      }
      if (a3 != 2105) {
        int64_t v11 = v12;
      }
      uint64_t v13 = 12;
      uint64_t v14 = 29;
      if (a3 != 2101) {
        uint64_t v14 = 0;
      }
      if (a3 != 2071) {
        uint64_t v13 = v14;
      }
      if (a3 <= 2104) {
        int64_t v11 = v13;
      }
      int64_t v15 = 8;
      uint64_t v16 = 11;
      uint64_t v17 = 63;
      if (a3 != 2068) {
        uint64_t v17 = 0;
      }
      if (a3 != 2065) {
        uint64_t v16 = v17;
      }
      if (a3 != 2061) {
        int64_t v15 = v16;
      }
      BOOL v18 = a3 <= 2070;
      goto LABEL_113;
    }
    int v4 = 15029;
    uint64_t v31 = 34;
    if (a3 != 15110) {
      uint64_t v31 = 0;
    }
    if (a3 == 15100) {
      uint64_t v32 = 64;
    }
    else {
      uint64_t v32 = v31;
    }
    uint64_t v33 = 50;
    if (a3 != 15055) {
      uint64_t v33 = 0;
    }
    if (a3 == 15030) {
      uint64_t v34 = 52;
    }
    else {
      uint64_t v34 = v33;
    }
    if (a3 <= 15099) {
      int64_t v6 = v34;
    }
    else {
      int64_t v6 = v32;
    }
    int64_t v35 = 7;
    uint64_t v36 = 65;
    uint64_t v37 = 18;
    if (a3 != 12150) {
      uint64_t v37 = 0;
    }
    if (a3 != 3016) {
      uint64_t v36 = v37;
    }
    if (a3 != 3015) {
      int64_t v35 = v36;
    }
LABEL_129:
    if (a3 <= v4) {
      return v35;
    }
    else {
      return v6;
    }
  }
  if (a3 > 2009)
  {
    int64_t v11 = 28;
    uint64_t v42 = 30;
    uint64_t v43 = 9;
    if (a3 != 2048) {
      uint64_t v43 = 0;
    }
    if (a3 != 2024) {
      uint64_t v42 = v43;
    }
    if (a3 != 2022) {
      int64_t v11 = v42;
    }
    int64_t v15 = 5;
    uint64_t v44 = 22;
    if (a3 != 2020) {
      uint64_t v44 = 0;
    }
    if (a3 != 2010) {
      int64_t v15 = v44;
    }
    BOOL v18 = a3 <= 2021;
LABEL_113:
    if (v18) {
      return v15;
    }
    else {
      return v11;
    }
  }
  if (a3 <= 0x7D9)
  {
    switch(a3)
    {
      case '>':
LABEL_117:
        int64_t result = 14;
        break;
      case '?':
        int64_t result = 33;
        break;
      case '@':
        int64_t result = 40;
        break;
      case 'A':
        int64_t result = 41;
        break;
      case 'B':
        int64_t result = 54;
        break;
      default:
        JUMPOUT(0);
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        int64_t result = 15;
        break;
      case 6:
        int64_t result = 4;
        break;
      case 7:
        goto LABEL_117;
      case 8:
        int64_t result = 17;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (int64_t)CMWorkoutLocationTypeFromCMSwimWorkoutLocation:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    int v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, a1, @"CMWorkout.mm", 423, @"Invalid parameter not satisfying: %@", @"cmSwimWorkoutLocation == kCMSwimWorkoutLocationPool || cmSwimWorkoutLocation == kCMSwimWorkoutLocationOpenWater");
  }
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (int64_t)CMSwimWorkoutLocationFromCMWorkoutLocationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    int v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, a1, @"CMWorkout.mm", 430, @"Invalid parameter not satisfying: %@", @"cmWorkoutLocationType == kCMWorkoutLocationTypeIndoor || cmWorkoutLocationType == kCMWorkoutLocationTypeOutdoor");
  }
  return a3 != 1;
}

+ (BOOL)workoutIsTypePedestrian:(int64_t)a3
{
  if (objc_msgSend_workoutIsTypeWalking_(a1, a2, a3)) {
    return 1;
  }
  BOOL result = objc_msgSend_workoutIsTypeRunning_(a1, v5, a3);
  if (a3 == 24) {
    return 1;
  }
  return result;
}

+ (BOOL)workoutIsSupportedForLowPower:(int64_t)a3
{
  return ((unint64_t)a3 < 0x19) & (0x1028006u >> a3);
}

+ (BOOL)workoutIsTypeWalking:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x18002u >> a3);
}

+ (BOOL)workoutIsTypeRunning:(int64_t)a3
{
  return a3 == 17 || (a3 & 0xFFFFFFFFFFFFFFEFLL) == 2;
}

+ (BOOL)isAvailable
{
  if (sub_1902BACB4()) {
    return 0;
  }
  sub_1902BAD40();
  sub_1902BAD40();

  return sub_19046BC40();
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4
{
  if (!a3)
  {
    uint64_t v12 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, self, @"CMWorkout.mm", 470, @"Invalid parameter not satisfying: %@", @"sessionId");
  }
  if (a4 >= 66)
  {
    uint64_t v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMWorkout.mm", 471, @"Invalid parameter not satisfying: %@", @"type < kCMWorkoutTypeMax");
  }
  v16.receiver = self;
  v16.super_class = (Class)CMWorkout;
  uint64_t v8 = [(CMWorkout *)&v16 init];
  if (v8)
  {
    v8->fSessionId = (NSUUID *)a3;
    v8->fType = a4;
    uint64_t v10 = objc_msgSend_workoutLocationTypeFromCMWorkoutType_(CMWorkout, v9, a4);
    v8->fIsUserInitiated = 1;
    v8->fStartDate = 0;
    v8->fEndDate = 0;
    v8->fLocationType = v10;
    v8->fMode = 0;
    v8->fAppId = 0;
  }
  return v8;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5
{
  if (a5 >= 4)
  {
    int64_t v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMWorkout.mm", 489, @"Invalid parameter not satisfying: %@", @"locationType < kCMWorkoutLocationTypeMax");
  }
  BOOL result = (CMWorkout *)objc_msgSend_initWithSessionId_type_(self, a2, (uint64_t)a3, a4);
  if (result) {
    result->fLocationType = a5;
  }
  return result;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6
{
  if (a6 == 1 && (objc_msgSend_workoutIsSupportedForLowPower_(CMWorkout, a2, a4) & 1) == 0)
  {
    int64_t v15 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, @"CMWorkout.mm", 502, @"Invalid parameter not satisfying: %@", @"mode != CMWorkoutModeExtended || [CMWorkout workoutIsSupportedForLowPower:type]");
  }
  if (a5 >= 4)
  {
    uint64_t v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, @"CMWorkout.mm", 504, @"Invalid parameter not satisfying: %@", @"locationType < kCMWorkoutLocationTypeMax");
  }
  BOOL result = (CMWorkout *)objc_msgSend_initWithSessionId_type_locationType_(self, a2, (uint64_t)a3, a4, a5);
  if (result) {
    result->fMode = a6;
  }
  return result;
}

- (id)_initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  uint64_t v10 = objc_msgSend_initWithSessionId_type_locationType_mode_(self, a2, (uint64_t)a3, a4, a5, a6);
  if (v10)
  {
    *(void *)(v10 + 32) = a7;
    *(void *)(v10 + 40) = a8;
    *(unsigned char *)(v10 + 48) = 0;
  }
  return (id)v10;
}

- (CMWorkout)initWithSessionId:(id)a3 type:(int64_t)a4 locationType:(int64_t)a5 mode:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  if (a7)
  {
    if (a8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CMWorkout.mm", 533, @"Invalid parameter not satisfying: %@", @"startDate");
    if (a8) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, @"CMWorkout.mm", 534, @"Invalid parameter not satisfying: %@", @"endDate");
LABEL_3:

  return (CMWorkout *)objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(self, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
}

- (void)setLocationType:(int64_t)a3
{
  self->fLocationType = a3;
}

- (void)setIsUserInitiated:(BOOL)a3
{
  self->fIsUserInitiated = a3;
}

- (void)setWorkoutType:(int64_t)a3
{
  self->fType = a3;
}

- (void)setWorkoutMode:(unint64_t)a3
{
  self->fMode = a3;
}

- (BOOL)isSameWorkout:(id)a3
{
  if (!a3)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, @"CMWorkout.mm", 560, @"Invalid parameter not satisfying: %@", @"workout");
  }
  uint64_t v5 = objc_msgSend_sessionId(self, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_sessionId(a3, v6, v7);
  int isEqual = objc_msgSend_isEqual_(v5, v9, v8);
  if (isEqual)
  {
    uint64_t v13 = objc_msgSend_type(self, v11, v12);
    LOBYTE(isEqual) = v13 == objc_msgSend_type(a3, v14, v15);
  }
  return isEqual;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWorkout;
  [(CMWorkout *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkout)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CMWorkout;
  int v4 = [(CMWorkout *)&v25 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMWorkoutDataCodingKeySessionId");
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMWorkoutDataCodingKeyType");
    if (objc_msgSend_containsValueForKey_(a3, v8, @"kCMWorkoutDataCodingKeyLocationType")) {
      uint64_t v10 = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMWorkoutDataCodingKeyLocationType");
    }
    else {
      uint64_t v10 = 0;
    }
    v4->fLocationType = v10;
    if (objc_msgSend_containsValueForKey_(a3, v9, @"kCMWorkoutDataCodingKeyMode")) {
      uint64_t v12 = objc_msgSend_decodeIntegerForKey_(a3, v11, @"kCMWorkoutDataCodingKeyMode");
    }
    else {
      uint64_t v12 = 0;
    }
    v4->fMode = v12;
    if (objc_msgSend_containsValueForKey_(a3, v11, @"kCMWorkoutDataCodingKeyStartDate"))
    {
      uint64_t v14 = objc_opt_class();
      objc_super v16 = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, @"kCMWorkoutDataCodingKeyStartDate");
    }
    else
    {
      objc_super v16 = 0;
    }
    v4->fStartDate = v16;
    if (objc_msgSend_containsValueForKey_(a3, v13, @"kCMWorkoutDataCodingKeyEndDate"))
    {
      uint64_t v18 = objc_opt_class();
      uint64_t v20 = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v19, v18, @"kCMWorkoutDataCodingKeyEndDate");
    }
    else
    {
      uint64_t v20 = 0;
    }
    v4->fEndDate = v20;
    if (objc_msgSend_containsValueForKey_(a3, v17, @"kCMWorkoutDataCodingKeyAppId"))
    {
      uint64_t v21 = objc_opt_class();
      int v23 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, @"kCMWorkoutDataCodingKeyAppId");
    }
    else
    {
      int v23 = 0;
    }
    v4->fAppId = v23;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_sessionId(self, v8, v9);
  uint64_t v13 = objc_msgSend_type(self, v11, v12);
  uint64_t v16 = objc_msgSend_locationType(self, v14, v15);
  uint64_t v19 = objc_msgSend_mode(self, v17, v18);
  uint64_t started = objc_msgSend_startDate(self, v20, v21);
  uint64_t v25 = objc_msgSend_endDate(self, v23, v24);
  uint64_t v27 = objc_msgSend__initWithSessionId_type_locationType_mode_startDate_endDate_(v7, v26, v10, v13, v16, v19, started, v25);
  uint64_t v30 = objc_msgSend_appId(self, v28, v29);
  objc_msgSend_setAppId_(v27, v31, v30);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fSessionId, @"kCMWorkoutDataCodingKeySessionId");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fType, @"kCMWorkoutDataCodingKeyType");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fLocationType, @"kCMWorkoutDataCodingKeyLocationType");
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->fMode, @"kCMWorkoutDataCodingKeyMode");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fStartDate, @"kCMWorkoutDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->fEndDate, @"kCMWorkoutDataCodingKeyEndDate");
  fAppId = self->fAppId;

  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)fAppId, @"kCMWorkoutDataCodingKeyAppId");
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (int64_t)type
{
  return self->fType;
}

- (int64_t)locationType
{
  return self->fLocationType;
}

- (unint64_t)mode
{
  return self->fMode;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)workoutName:(int64_t)a3
{
  if ((unint64_t)a3 > 0x42) {
    return 0;
  }
  else {
    return off_1E568D6A0[a3];
  }
}

+ (id)workoutLocationName:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unhandled workout location type";
  }
  else {
    return off_1E568D8B8[a3];
  }
}

+ (id)workoutModeName:(unint64_t)a3
{
  objc_super v3 = @"Unhandled workout mode";
  if (a3 == 1) {
    objc_super v3 = @"Extended";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Normal";
  }
}

+ (int64_t)workoutLocationTypeFromCMWorkoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 0x2D) {
    return 0;
  }
  else {
    return qword_190608BD0[a3 - 4];
  }
}

- (id)description
{
  objc_super v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_sessionId(self, v6, v7);
  uint64_t v11 = objc_msgSend_type(self, v9, v10);
  uint64_t v13 = objc_msgSend_workoutName_(CMWorkout, v12, v11);
  uint64_t v16 = objc_msgSend_locationType(self, v14, v15);
  uint64_t v18 = objc_msgSend_workoutLocationName_(CMWorkout, v17, v16);
  uint64_t v21 = objc_msgSend_mode(self, v19, v20);
  uint64_t v23 = objc_msgSend_workoutModeName_(CMWorkout, v22, v21);
  uint64_t started = objc_msgSend_startDate(self, v24, v25);
  uint64_t v29 = objc_msgSend_endDate(self, v27, v28);
  uint64_t v32 = objc_msgSend_appId(self, v30, v31);
  return (id)objc_msgSend_stringWithFormat_(v3, v33, @"%@, <sessionId %@, type, %@, locationType, %@, mode, %@, startDate, %@, endDate, %@, id, %@>", v5, v8, v13, v18, v23, started, v29, v32);
}

- (NSString)appId
{
  return self->fAppId;
}

- (void)setAppId:(id)a3
{
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

@end