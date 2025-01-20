@interface CMPedometerData
+ (BOOL)supportsSecureCoding;
+ (id)maxPedometerEntries;
- (BOOL)isOdometerDistance;
- (BOOL)isOdometerPace;
- (CMPedometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMPedometerData)initWithCoder:(id)a3;
- (CMPedometerData)initWithStartDate:(double)a3 endDate:(double)a4 steps:(int)a5 distance:(double)a6 floorsAscended:(id)a7 floorsDescended:(id)a8 recordID:(int64_t)a9 currentPace:(id)a10 currentCadence:(id)a11 firstStepTime:(double)a12 activeTime:(id)a13 sourceId:(id)a14 isOdometerDistance:(id)a15 isOdometerPace:(id)a16 pushes:(int)a17 workoutType:(int)a18 elevationAscended:(id)a19 elevationDescended:(id)a20 distanceSource:(int)a21;
- (NSDate)endDate;
- (NSDate)firstStepTime;
- (NSDate)startDate;
- (NSNumber)activeTime;
- (NSNumber)averageActivePace;
- (NSNumber)currentCadence;
- (NSNumber)currentPace;
- (NSNumber)distance;
- (NSNumber)distanceSource;
- (NSNumber)elevationAscended;
- (NSNumber)elevationDescended;
- (NSNumber)floorsAscended;
- (NSNumber)floorsDescended;
- (NSNumber)numberOfPushes;
- (NSNumber)numberOfSteps;
- (NSNumber)workoutType;
- (NSString)description;
- (NSUUID)sourceId;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMPedometerData

- (CMPedometerData)initWithStartDate:(double)a3 endDate:(double)a4 steps:(int)a5 distance:(double)a6 floorsAscended:(id)a7 floorsDescended:(id)a8 recordID:(int64_t)a9 currentPace:(id)a10 currentCadence:(id)a11 firstStepTime:(double)a12 activeTime:(id)a13 sourceId:(id)a14 isOdometerDistance:(id)a15 isOdometerPace:(id)a16 pushes:(int)a17 workoutType:(int)a18 elevationAscended:(id)a19 elevationDescended:(id)a20 distanceSource:(int)a21
{
  uint64_t v28 = *(void *)&a5;
  v59.receiver = self;
  v59.super_class = (Class)CMPedometerData;
  v31 = [(CMPedometerData *)&v59 init];
  if (v31)
  {
    id v58 = a13;
    id v32 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v31->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v32, v33, v34, a3);
    id v35 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v31->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v35, v36, v37, a4);
    id v38 = objc_alloc(NSNumber);
    v31->fNumberOfSteps = (NSNumber *)objc_msgSend_initWithInt_(v38, v39, v28);
    id v40 = objc_alloc(NSNumber);
    v31->fDistance = (NSNumber *)objc_msgSend_initWithDouble_(v40, v41, v42, a6);
    v31->fFloorsAscended = (NSNumber *)a7;
    v31->fFloorsDescended = (NSNumber *)a8;
    id v43 = objc_alloc(NSNumber);
    v31->fRecordId = (NSNumber *)objc_msgSend_initWithInteger_(v43, v44, a9);
    v31->fCurrentPace = (NSNumber *)a10;
    v31->fCurrentCadence = (NSNumber *)a11;
    if (a12 <= 0.0)
    {
      uint64_t v48 = 0;
    }
    else
    {
      id v45 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      uint64_t v48 = objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v45, v46, v47, a12, a13);
    }
    v31->fFirstStepTime = (NSDate *)v48;
    v31->fActiveTime = (NSNumber *)v58;
    v31->fSourceId = (NSUUID *)objc_msgSend_copy(a14, v49, v50);
    v31->fIsOdometerDistance = (NSNumber *)a15;
    v31->fIsOdometerPace = (NSNumber *)a15;
    id v51 = objc_alloc(NSNumber);
    v31->fNumberOfPushes = (NSNumber *)objc_msgSend_initWithInt_(v51, v52, a17);
    id v53 = objc_alloc(NSNumber);
    v31->fWorkoutType = (NSNumber *)objc_msgSend_initWithInt_(v53, v54, a18);
    v31->fElevationAscended = (NSNumber *)a19;
    v31->fElevationDescended = (NSNumber *)a20;
    id v55 = objc_alloc(NSNumber);
    v31->fDistanceSource = (NSNumber *)objc_msgSend_initWithInt_(v55, v56, a21);
  }
  return v31;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPedometerData;
  [(CMPedometerData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v12 = objc_msgSend_init(v7, v8, v9);
  if (v12)
  {
    v12[1] = objc_msgSend_copy(self->fStartDate, v10, v11);
    v12[2] = objc_msgSend_copy(self->fEndDate, v13, v14);
    v12[3] = objc_msgSend_copy(self->fNumberOfSteps, v15, v16);
    v12[4] = objc_msgSend_copy(self->fDistance, v17, v18);
    v12[5] = objc_msgSend_copy(self->fFloorsAscended, v19, v20);
    v12[6] = objc_msgSend_copy(self->fFloorsDescended, v21, v22);
    v12[7] = objc_msgSend_copy(self->fRecordId, v23, v24);
    v12[8] = objc_msgSend_copy(self->fCurrentPace, v25, v26);
    v12[9] = objc_msgSend_copy(self->fCurrentCadence, v27, v28);
    v12[10] = objc_msgSend_copy(self->fFirstStepTime, v29, v30);
    v12[11] = objc_msgSend_copy(self->fActiveTime, v31, v32);
    v12[12] = objc_msgSend_copy(self->fSourceId, v33, v34);
    v12[13] = objc_msgSend_copy(self->fIsOdometerDistance, v35, v36);
    v12[14] = objc_msgSend_copy(self->fIsOdometerPace, v37, v38);
    v12[15] = objc_msgSend_copy(self->fNumberOfPushes, v39, v40);
    v12[16] = objc_msgSend_copy(self->fWorkoutType, v41, v42);
    v12[17] = objc_msgSend_copy(self->fElevationAscended, v43, v44);
    v12[18] = objc_msgSend_copy(self->fElevationDescended, v45, v46);
    v12[19] = objc_msgSend_copy(self->fDistanceSource, v47, v48);
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedometerData)initWithCoder:(id)a3
{
  v44.receiver = self;
  v44.super_class = (Class)CMPedometerData;
  v4 = [(CMPedometerData *)&v44 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMPedometerDataCodingKeyStartDate");
    uint64_t v7 = objc_opt_class();
    v4->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMPedometerDataCodingKeyEndDate");
    uint64_t v9 = objc_opt_class();
    v4->fNumberOfSteps = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMPedometerDataCodingKeyNumberOfSteps");
    uint64_t v11 = objc_opt_class();
    v4->fDistance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMPedometerDataCodingKeyDistance");
    uint64_t v13 = objc_opt_class();
    v4->fFloorsAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"kCMPedometerDataCodingKeyFloorAscended");
    uint64_t v15 = objc_opt_class();
    v4->fFloorsDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kCMPedometerDataCodingKeyFloorDescended");
    uint64_t v17 = objc_opt_class();
    v4->fRecordId = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, @"kCMPedometerDataCodingKeyRecordId");
    uint64_t v19 = objc_opt_class();
    v4->fCurrentPace = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"kCMPedometerDataCodingKeyPace");
    uint64_t v21 = objc_opt_class();
    v4->fCurrentCadence = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, @"kCMPedometerDataCodingKeyCurrentCadence");
    uint64_t v23 = objc_opt_class();
    v4->fFirstStepTime = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, @"kCMPedometerDataCodingKeyFirstStepTime");
    uint64_t v25 = objc_opt_class();
    v4->fActiveTime = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v26, v25, @"kCMPedometerDataCodingKeyActiveTime");
    uint64_t v27 = objc_opt_class();
    v4->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v28, v27, @"kCMPedometerDatacodingKeyUUID");
    uint64_t v29 = objc_opt_class();
    v4->fIsOdometerDistance = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v30, v29, @"kCMPedometerDataCodingKeyIsOdometerDistance");
    uint64_t v31 = objc_opt_class();
    v4->fIsOdometerPace = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v32, v31, @"kCMPedometerDataCodingKeyIsOdometerPace");
    uint64_t v33 = objc_opt_class();
    v4->fNumberOfPushes = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, @"kCMPedometerDataCodingKeyNumberOfPushes");
    uint64_t v35 = objc_opt_class();
    v4->fWorkoutType = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v36, v35, @"kCMPedometerDataCodingKeyWorkoutType");
    uint64_t v37 = objc_opt_class();
    v4->fElevationAscended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v38, v37, @"kCMPedometerDataCodingKeyElevationAscended");
    uint64_t v39 = objc_opt_class();
    v4->fElevationDescended = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, @"kCMPedometerDataCodingKeyElevationDescended");
    uint64_t v41 = objc_opt_class();
    v4->fDistanceSource = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, @"kCMPedometerDataCodingKeyDistanceSource");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, @"kCMPedometerDataCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fEndDate, @"kCMPedometerDataCodingKeyEndDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fNumberOfSteps, @"kCMPedometerDataCodingKeyNumberOfSteps");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fDistance, @"kCMPedometerDataCodingKeyDistance");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fFloorsAscended, @"kCMPedometerDataCodingKeyFloorAscended");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->fFloorsDescended, @"kCMPedometerDataCodingKeyFloorDescended");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fRecordId, @"kCMPedometerDataCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->fCurrentPace, @"kCMPedometerDataCodingKeyPace");
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fCurrentCadence, @"kCMPedometerDataCodingKeyCurrentCadence");
  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)self->fFirstStepTime, @"kCMPedometerDataCodingKeyFirstStepTime");
  objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)self->fActiveTime, @"kCMPedometerDataCodingKeyActiveTime");
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->fSourceId, @"kCMPedometerDatacodingKeyUUID");
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->fIsOdometerDistance, @"kCMPedometerDataCodingKeyIsOdometerDistance");
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->fIsOdometerPace, @"kCMPedometerDataCodingKeyIsOdometerPace");
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->fNumberOfPushes, @"kCMPedometerDataCodingKeyNumberOfPushes");
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->fWorkoutType, @"kCMPedometerDataCodingKeyWorkoutType");
  objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->fElevationAscended, @"kCMPedometerDataCodingKeyElevationAscended");
  objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->fElevationDescended, @"kCMPedometerDataCodingKeyElevationDescended");
  fDistanceSource = self->fDistanceSource;

  objc_msgSend_encodeObject_forKey_(a3, v22, (uint64_t)fDistanceSource, @"kCMPedometerDataCodingKeyDistanceSource");
}

- (NSString)description
{
  uint64_t v34 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t started = objc_msgSend_startDate(self, v5, v6);
  uint64_t v10 = objc_msgSend_endDate(self, v8, v9);
  uint64_t v13 = objc_msgSend_numberOfSteps(self, v11, v12);
  uint64_t v16 = objc_msgSend_distance(self, v14, v15);
  uint64_t v19 = objc_msgSend_floorsAscended(self, v17, v18);
  uint64_t v22 = objc_msgSend_floorsDescended(self, v20, v21);
  uint64_t v25 = objc_msgSend_currentPace(self, v23, v24);
  uint64_t v28 = objc_msgSend_currentCadence(self, v26, v27);
  uint64_t active = objc_msgSend_averageActivePace(self, v29, v30);
  return (NSString *)objc_msgSend_stringWithFormat_(v34, v32, @"%@,<startDate %@ endDate %@ steps %@ distance %@ floorsAscended %@ floorsDescended %@ currentPace %@ currentCadence %@ averageActivePace %@>", v4, started, v10, v13, v16, v19, v22, v25, v28, active);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)numberOfSteps
{
  return self->fNumberOfSteps;
}

- (NSNumber)distance
{
  return self->fDistance;
}

- (NSNumber)floorsAscended
{
  return self->fFloorsAscended;
}

- (NSNumber)floorsDescended
{
  return self->fFloorsDescended;
}

- (NSNumber)currentPace
{
  return self->fCurrentPace;
}

- (NSNumber)currentCadence
{
  return self->fCurrentCadence;
}

- (NSNumber)averageActivePace
{
  objc_msgSend_doubleValue(self->fDistance, a2, v2);
  if (v6 == 0.0) {
    return 0;
  }
  uint64_t v7 = NSNumber;
  objc_msgSend_doubleValue(self->fActiveTime, v4, v5);
  double v9 = v8;
  objc_msgSend_doubleValue(self->fDistance, v10, v11);
  double v15 = v9 / v14;

  return (NSNumber *)objc_msgSend_numberWithDouble_(v7, v12, v13, v15);
}

- (NSDate)firstStepTime
{
  return self->fFirstStepTime;
}

- (NSNumber)activeTime
{
  return self->fActiveTime;
}

- (int64_t)recordId
{
  return objc_msgSend_integerValue(self->fRecordId, a2, v2);
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (BOOL)isOdometerDistance
{
  return objc_msgSend_BOOLValue(self->fIsOdometerDistance, a2, v2);
}

- (BOOL)isOdometerPace
{
  return objc_msgSend_BOOLValue(self->fIsOdometerPace, a2, v2);
}

- (NSNumber)numberOfPushes
{
  return self->fNumberOfPushes;
}

- (NSNumber)workoutType
{
  return self->fWorkoutType;
}

- (NSNumber)elevationAscended
{
  return self->fElevationAscended;
}

- (NSNumber)elevationDescended
{
  return self->fElevationDescended;
}

- (NSNumber)distanceSource
{
  return self->fDistanceSource;
}

+ (id)maxPedometerEntries
{
  return (id)objc_msgSend_numberWithInt_(NSNumber, a2, 250);
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMPedometerData)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMPedometerData;
    uint64_t v7 = [(CMPedometerData *)&v14 init];
    if (v7)
    {
      double v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        uint64_t v12 = (void *)v11;

        return (CMPedometerData *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end