@interface CMWorkoutOverview
+ (BOOL)supportsSecureCoding;
- (CMWorkoutOverview)initWithCoder:(id)a3;
- (CMWorkoutOverview)initWithOverviewId:(id)a3 workouts:(id)a4;
- (NSArray)workouts;
- (NSUUID)overviewId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWorkoutOverview

- (CMWorkoutOverview)initWithOverviewId:(id)a3 workouts:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, @"CMWorkoutOverview.mm", 24, @"Invalid parameter not satisfying: %@", @"overviewId");
    if (a4) {
      goto LABEL_3;
    }
LABEL_18:
    v24 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, self, @"CMWorkoutOverview.mm", 25, @"Invalid parameter not satisfying: %@", @"workouts");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_18;
  }
LABEL_3:
  if ((unint64_t)objc_msgSend_count(a4, a2, (uint64_t)a3) >= 2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v8, (uint64_t)&v27, v31, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(a4);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend_mode(v15, v10, v11) == 1)
          {
            uint64_t v16 = objc_msgSend_type(v15, v10, v11);
            if ((objc_msgSend_workoutIsSupportedForLowPower_(CMWorkout, v17, v16) & 1) == 0)
            {
              v18 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, @"CMWorkoutOverview.mm", 29, @"Invalid parameter not satisfying: %@", @"wrk.mode != CMWorkoutModeExtended || [CMWorkout workoutIsSupportedForLowPower:wrk.type]");
            }
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v10, (uint64_t)&v27, v31, 16);
      }
      while (v12);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)CMWorkoutOverview;
  v20 = [(CMWorkoutOverview *)&v26 init];
  if (v20)
  {
    v20->_overviewId = (NSUUID *)a3;
    v20->_workouts = (NSArray *)a4;
  }
  return v20;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutOverview;
  [(CMWorkoutOverview *)&v3 dealloc];
}

- (NSUUID)overviewId
{
  return self->_overviewId;
}

- (NSArray)workouts
{
  return self->_workouts;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutOverview)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMWorkoutOverview;
  v4 = [(CMWorkoutOverview *)&v14 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_overviewId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMWorkoutOverviewCodingKeyOverviewId");
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_setWithObjects_(v7, v10, v8, v9, 0);
    v4->_workouts = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v12, v11, @"kCMWorkoutOverviewCodingKeyWorkouts");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_overviewId(self, v8, v9);
  uint64_t v14 = objc_msgSend_workouts(self, v11, v12);

  return (id)objc_msgSend_initWithOverviewId_workouts_(v7, v13, v10, v14);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_overviewId, @"kCMWorkoutOverviewCodingKeyOverviewId");
  workouts = self->_workouts;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)workouts, @"kCMWorkoutOverviewCodingKeyWorkouts");
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  workouts = self->_workouts;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(workouts, v5, (uint64_t)&v16, v20, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(workouts);
        }
        objc_msgSend_appendFormat_(v3, v7, @"%@, ", *(void *)(*((void *)&v16 + 1) + 8 * i));
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(workouts, v7, (uint64_t)&v16, v20, 16);
    }
    while (v8);
  }
  uint64_t v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  return (id)objc_msgSend_stringWithFormat_(v11, v14, @"%@, <overviewId %@, workouts [ %@]>", v13, self->_overviewId, v3);
}

@end