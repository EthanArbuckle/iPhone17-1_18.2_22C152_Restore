@interface CMFitnessMachineData
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
- (CMFitnessMachineData)initWithCoder:(id)a3;
- (CMFitnessMachineData)initWithExernalBikeSensorData:(double)a3 speed:(double)a4 cadence:(double)a5 power:(double)a6 model:(id)a7 deviceIdentifier:(id)a8 manufacturer:(id)a9 externalFitnessType:(int)a10;
- (CMFitnessMachineData)initWithTimestamp:(id)a3;
- (NSDate)timestamp;
- (NSString)deviceIdentifier;
- (NSString)manufacturer;
- (NSString)model;
- (double)elapsedTime;
- (double)inclination;
- (double)instantaneousCadence;
- (double)instantaneousPower;
- (double)instantaneousSpeed;
- (double)resistanceLevel;
- (double)totalDistance;
- (double)totalElevationAscended;
- (double)totalEnergy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)externalFitnessType;
- (int64_t)totalFloorsClimbed;
- (int64_t)totalStrideCount;
- (int64_t)totalStrokeCount;
- (void)convertToCLFitnessMachineData:(_CLFitnessMachineData *)a3 deviceId:(int)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initializeVariables;
- (void)setDeviceIdentifier:(id)a3;
- (void)setElapsedTime:(double)a3;
- (void)setExternalFitnessType:(int)a3;
- (void)setInclination:(double)a3;
- (void)setInstantaneousCadence:(double)a3;
- (void)setInstantaneousPower:(double)a3;
- (void)setInstantaneousSpeed:(double)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setResistanceLevel:(double)a3;
- (void)setTotalDistance:(double)a3;
- (void)setTotalElevationAscended:(double)a3;
- (void)setTotalEnergy:(double)a3;
- (void)setTotalFloorsClimbed:(int64_t)a3;
- (void)setTotalStrideCount:(int64_t)a3;
- (void)setTotalStrokeCount:(int64_t)a3;
@end

@implementation CMFitnessMachineData

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (CMFitnessMachineData)initWithTimestamp:(id)a3
{
  if (!a3)
  {
    v14 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, self, @"CMFitnessMachineData.mm", 51, @"Invalid parameter not satisfying: %@", @"timestamp");
  }
  v16.receiver = self;
  v16.super_class = (Class)CMFitnessMachineData;
  v5 = [(CMFitnessMachineData *)&v16 init];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_initializeVariables(v5, v6, v7);
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v9, v10);
    v8->fTimestamp = v11;
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMFitnessMachineData;
  [(CMFitnessMachineData *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMFitnessMachineData)initWithCoder:(id)a3
{
  v40.receiver = self;
  v40.super_class = (Class)CMFitnessMachineData;
  v5 = [(CMFitnessMachineData *)&v40 init];
  if (v5)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, @"kCMFitnessMachineDataKeyTimestamp"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMFitnessMachineDataKeyTimestamp");
      v5->fTimestamp = v7;
    }
    if (objc_msgSend_containsValueForKey_(a3, v6, @"kCMFitnessMachineDataKeyElapsedTime"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCMFitnessMachineDataKeyElapsedTime");
      v5->_elapsedTime = v9;
    }
    if (objc_msgSend_containsValueForKey_(a3, v8, @"kCMFitnessMachineDataKeyTotalEnergy"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v10, @"kCMFitnessMachineDataKeyTotalEnergy");
      v5->_totalEnergy = v11;
    }
    if (objc_msgSend_containsValueForKey_(a3, v10, @"kCMFitnessMachineDataKeyTotalDistance"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v12, @"kCMFitnessMachineDataKeyTotalDistance");
      v5->_totalDistance = v13;
    }
    if (objc_msgSend_containsValueForKey_(a3, v12, @"kCMFitnessMachineDataKeyTotalElevationAscended"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v14, @"kCMFitnessMachineDataKeyTotalElevationAscended");
      v5->_totalElevationAscended = v15;
    }
    if (objc_msgSend_containsValueForKey_(a3, v14, @"kCMFitnessMachineDataKeyTotalStrideCount"))v5->_totalStrideCount = objc_msgSend_decodeInt64ForKey_(a3, v16, @"kCMFitnessMachineDataKeyTotalStrideCount"); {
    if (objc_msgSend_containsValueForKey_(a3, v16, @"kCMFitnessMachineDataKeyTotalStrokeCount"))v5->_totalStrokeCount = objc_msgSend_decodeInt64ForKey_(a3, v17, @"kCMFitnessMachineDataKeyTotalStrokeCount");
    }
    if (objc_msgSend_containsValueForKey_(a3, v17, @"kCMFitnessMachineDataKeyTotalFloorsClimbed"))v5->_totalFloorsClimbed = objc_msgSend_decodeInt64ForKey_(a3, v18, @"kCMFitnessMachineDataKeyTotalFloorsClimbed"); {
    if (objc_msgSend_containsValueForKey_(a3, v18, @"kCMFitnessMachineDataKeyInstantaneousSpeed"))
    }
    {
      objc_msgSend_decodeDoubleForKey_(a3, v19, @"kCMFitnessMachineDataKeyInstantaneousSpeed");
      v5->_instantaneousSpeed = v20;
    }
    if (objc_msgSend_containsValueForKey_(a3, v19, @"kCMFitnessMachineDataKeyInstantaneousCadence"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v21, @"kCMFitnessMachineDataKeyInstantaneousCadence");
      v5->_instantaneousCadence = v22;
    }
    if (objc_msgSend_containsValueForKey_(a3, v21, @"kCMFitnessMachineDataKeyInstantaneousPower"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v23, @"kCMFitnessMachineDataKeyInstantaneousPower");
      v5->_instantaneousPower = v24;
    }
    if (objc_msgSend_containsValueForKey_(a3, v23, @"kCMFitnessMachineDataKeyInclination"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v25, @"kCMFitnessMachineDataKeyInclination");
      v5->_inclination = v26;
    }
    if (objc_msgSend_containsValueForKey_(a3, v25, @"kCMFitnessMachineDataKeyResistanceLevel"))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v27, @"kCMFitnessMachineDataKeyResistanceLevel");
      v5->_resistanceLevel = v28;
    }
    if (objc_msgSend_containsValueForKey_(a3, v27, @"kCMFitnessMachineDataKeyDeviceIdentifier"))
    {
      uint64_t v30 = objc_opt_class();
      v5->_deviceIdentifier = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v31, v30, @"kCMFitnessMachineDataKeyDeviceIdentifier");
    }
    if (objc_msgSend_containsValueForKey_(a3, v29, @"kCMFitnessMachineDataKeyManufacturer"))
    {
      uint64_t v33 = objc_opt_class();
      v5->_manufacturer = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v34, v33, @"kCMFitnessMachineDataKeyManufacturer");
    }
    if (objc_msgSend_containsValueForKey_(a3, v32, @"kCMFitnessMachineDataKeyModel"))
    {
      uint64_t v36 = objc_opt_class();
      v5->_model = (NSString *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v37, v36, @"kCMFitnessMachineDataKeyModel");
    }
    if (objc_msgSend_containsValueForKey_(a3, v35, @"kCMFitnessMachineDataKeyExternalFitnessType"))v5->_externalFitnessType = objc_msgSend_decodeIntForKey_(a3, v38, @"kCMFitnessMachineDataKeyExternalFitnessType"); {
  }
    }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  double v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v8, v9, self->fTimestamp);
  v12 = objc_msgSend_initWithTimestamp_(v7, v11, v10);
  objc_msgSend_setElapsedTime_(v12, v13, v14, self->_elapsedTime);
  objc_msgSend_setTotalEnergy_(v12, v15, v16, self->_totalEnergy);
  objc_msgSend_setTotalDistance_(v12, v17, v18, self->_totalDistance);
  objc_msgSend_setTotalElevationAscended_(v12, v19, v20, self->_totalElevationAscended);
  objc_msgSend_setTotalStrideCount_(v12, v21, self->_totalStrideCount);
  objc_msgSend_setTotalStrokeCount_(v12, v22, self->_totalStrokeCount);
  objc_msgSend_setTotalFloorsClimbed_(v12, v23, self->_totalFloorsClimbed);
  objc_msgSend_setInstantaneousSpeed_(v12, v24, v25, self->_instantaneousSpeed);
  objc_msgSend_setInstantaneousCadence_(v12, v26, v27, self->_instantaneousCadence);
  objc_msgSend_setInstantaneousPower_(v12, v28, v29, self->_instantaneousPower);
  objc_msgSend_setInclination_(v12, v30, v31, self->_inclination);
  objc_msgSend_setResistanceLevel_(v12, v32, v33, self->_resistanceLevel);
  objc_msgSend_setModel_(v12, v34, (uint64_t)self->_model);
  objc_msgSend_setDeviceIdentifier_(v12, v35, (uint64_t)self->_deviceIdentifier);
  objc_msgSend_setManufacturer_(v12, v36, (uint64_t)self->_manufacturer);
  objc_msgSend_setExternalFitnessType_(v12, v37, self->_externalFitnessType);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"kCMFitnessMachineDataKeyTimestamp", self->fTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMFitnessMachineDataKeyElapsedTime", self->_elapsedTime);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMFitnessMachineDataKeyTotalEnergy", self->_totalEnergy);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMFitnessMachineDataKeyTotalDistance", self->_totalDistance);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMFitnessMachineDataKeyTotalElevationAscended", self->_totalElevationAscended);
  objc_msgSend_encodeInt64_forKey_(a3, v9, self->_totalStrideCount, @"kCMFitnessMachineDataKeyTotalStrideCount");
  objc_msgSend_encodeInt64_forKey_(a3, v10, self->_totalStrokeCount, @"kCMFitnessMachineDataKeyTotalStrokeCount");
  objc_msgSend_encodeInt64_forKey_(a3, v11, self->_totalFloorsClimbed, @"kCMFitnessMachineDataKeyTotalFloorsClimbed");
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"kCMFitnessMachineDataKeyInstantaneousSpeed", self->_instantaneousSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"kCMFitnessMachineDataKeyInstantaneousCadence", self->_instantaneousCadence);
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMFitnessMachineDataKeyInstantaneousPower", self->_instantaneousPower);
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMFitnessMachineDataKeyInclination", self->_inclination);
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"kCMFitnessMachineDataKeyResistanceLevel", self->_resistanceLevel);
  objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_deviceIdentifier, @"kCMFitnessMachineDataKeyDeviceIdentifier");
  objc_msgSend_encodeObject_forKey_(a3, v18, (uint64_t)self->_manufacturer, @"kCMFitnessMachineDataKeyManufacturer");
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_model, @"kCMFitnessMachineDataKeyModel");
  uint64_t externalFitnessType = self->_externalFitnessType;

  objc_msgSend_encodeInt_forKey_(a3, v20, externalFitnessType, @"kCMFitnessMachineDataKeyExternalFitnessType");
}

- (NSDate)timestamp
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->fTimestamp);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"%@, <timestamp, %f, elapsedTime, %f, totalEnergy, %f, totalDistance, %f, totalElevationAscended, %f,  totalStrideCount, %ld, totalStokeCount, %ld,totalFloorsClimbed, %ld, instantaneousSpeed, %f, instantaneousCadence, %f, instantaneousPower, %f, inclination, %f, resistanceLevel, %f>", v5, *(void *)&self->fTimestamp, *(void *)&self->_elapsedTime, *(void *)&self->_totalEnergy, *(void *)&self->_totalDistance, *(void *)&self->_totalElevationAscended, self->_totalStrideCount, self->_totalStrokeCount, self->_totalFloorsClimbed, *(void *)&self->_instantaneousSpeed, *(void *)&self->_instantaneousCadence, *(void *)&self->_instantaneousPower, *(void *)&self->_inclination, *(void *)&self->_resistanceLevel);
}

- (void)convertToCLFitnessMachineData:(_CLFitnessMachineData *)a3 deviceId:(int)a4
{
  double fTimestamp = self->fTimestamp;
  int64_t totalFloorsClimbed = self->_totalFloorsClimbed;
  double instantaneousSpeed = self->_instantaneousSpeed;
  double instantaneousCadence = self->_instantaneousCadence;
  double instantaneousPower = self->_instantaneousPower;
  int externalFitnessType = self->_externalFitnessType;
  long long v10 = *(_OWORD *)&self->_elapsedTime;
  long long v11 = *(_OWORD *)&self->_totalDistance;
  *(_OWORD *)&a3->var5 = *(_OWORD *)&self->_totalStrideCount;
  a3->var7 = totalFloorsClimbed;
  long long v12 = *(_OWORD *)&self->_inclination;
  a3->var0 = fTimestamp;
  *(_OWORD *)&a3->var1 = v10;
  *(_OWORD *)&a3->var3 = v11;
  a3->var8 = instantaneousSpeed;
  a3->var9 = 1.79769313e308;
  a3->var11 = instantaneousCadence;
  a3->var12 = 1.79769313e308;
  a3->var14 = instantaneousPower;
  a3->var15 = 1.79769313e308;
  *(_OWORD *)&a3->var17 = v12;
  a3->var19 = 1.79769313e308;
  a3->var20 = externalFitnessType;
  double v13 = self->_instantaneousPower;
  a3->var21 = 1;
  if (v13 >= 1.79769313e308)
  {
    int v14 = -1;
  }
  else
  {
    a3->var15 = self->fTimestamp;
    int v14 = a4;
  }
  a3->var16 = v14;
  if (self->_instantaneousSpeed >= 1.79769313e308)
  {
    int v15 = -1;
  }
  else
  {
    a3->var9 = self->fTimestamp;
    int v15 = a4;
  }
  a3->var10 = v15;
  if (self->_instantaneousCadence >= 1.79769313e308) {
    a4 = -1;
  }
  else {
    a3->var12 = self->fTimestamp;
  }
  a3->var13 = a4;
}

- (CMFitnessMachineData)initWithExernalBikeSensorData:(double)a3 speed:(double)a4 cadence:(double)a5 power:(double)a6 model:(id)a7 deviceIdentifier:(id)a8 manufacturer:(id)a9 externalFitnessType:(int)a10
{
  v23.receiver = self;
  v23.super_class = (Class)CMFitnessMachineData;
  uint64_t v18 = [(CMFitnessMachineData *)&v23 init];
  v21 = v18;
  if (v18)
  {
    objc_msgSend_initializeVariables(v18, v19, v20);
    v21->double fTimestamp = a3;
    v21->_double instantaneousCadence = a5;
    v21->_double instantaneousPower = a6;
    v21->_double instantaneousSpeed = a4;
    v21->_manufacturer = (NSString *)a9;
    v21->_model = (NSString *)a7;
    v21->_deviceIdentifier = (NSString *)a8;
    v21->_int externalFitnessType = a10;
  }
  return v21;
}

- (void)initializeVariables
{
  int64x2_t v2 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)&self->_elapsedTime = v2;
  *(int64x2_t *)&self->_totalDistance = v2;
  *(int64x2_t *)&self->_totalStrideCount = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  self->_int64_t totalFloorsClimbed = 0x7FFFFFFFFFFFFFFFLL;
  *(int64x2_t *)&self->_double instantaneousSpeed = v2;
  *(int64x2_t *)&self->_double instantaneousPower = v2;
  self->_resistanceLevel = 1.79769313e308;
  self->_deviceIdentifier = (NSString *)&stru_1EDFD5D50;
  self->_manufacturer = (NSString *)&stru_1EDFD5D50;
  self->_model = (NSString *)&stru_1EDFD5D50;
  self->_int externalFitnessType = 0;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)totalEnergy
{
  return self->_totalEnergy;
}

- (void)setTotalEnergy:(double)a3
{
  self->_totalEnergy = a3;
}

- (double)totalDistance
{
  return self->_totalDistance;
}

- (void)setTotalDistance:(double)a3
{
  self->_totalDistance = a3;
}

- (double)totalElevationAscended
{
  return self->_totalElevationAscended;
}

- (void)setTotalElevationAscended:(double)a3
{
  self->_totalElevationAscended = a3;
}

- (int64_t)totalStrideCount
{
  return self->_totalStrideCount;
}

- (void)setTotalStrideCount:(int64_t)a3
{
  self->_totalStrideCount = a3;
}

- (int64_t)totalStrokeCount
{
  return self->_totalStrokeCount;
}

- (void)setTotalStrokeCount:(int64_t)a3
{
  self->_totalStrokeCount = a3;
}

- (int64_t)totalFloorsClimbed
{
  return self->_totalFloorsClimbed;
}

- (void)setTotalFloorsClimbed:(int64_t)a3
{
  self->_int64_t totalFloorsClimbed = a3;
}

- (double)instantaneousSpeed
{
  return self->_instantaneousSpeed;
}

- (void)setInstantaneousSpeed:(double)a3
{
  self->_double instantaneousSpeed = a3;
}

- (double)instantaneousCadence
{
  return self->_instantaneousCadence;
}

- (void)setInstantaneousCadence:(double)a3
{
  self->_double instantaneousCadence = a3;
}

- (double)instantaneousPower
{
  return self->_instantaneousPower;
}

- (void)setInstantaneousPower:(double)a3
{
  self->_double instantaneousPower = a3;
}

- (double)inclination
{
  return self->_inclination;
}

- (void)setInclination:(double)a3
{
  self->_inclination = a3;
}

- (double)resistanceLevel
{
  return self->_resistanceLevel;
}

- (void)setResistanceLevel:(double)a3
{
  self->_resistanceLevel = a3;
}

- (int)externalFitnessType
{
  return self->_externalFitnessType;
}

- (void)setExternalFitnessType:(int)a3
{
  self->_int externalFitnessType = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  self->_deviceIdentifier = (NSString *)a3;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  self->_manufacturer = (NSString *)a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  self->_model = (NSString *)a3;
}

@end