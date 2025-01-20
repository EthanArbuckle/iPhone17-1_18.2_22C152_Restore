@interface CMBikeSensorData
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
- (CMBikeSensorData)initWithCoder:(id)a3;
- (CMBikeSensorData)initWithTimestamp:(id)a3;
- (NSDate)timestamp;
- (NSString)deviceIdentifier;
- (NSString)manufacturer;
- (NSString)model;
- (double)instantaneousCadence;
- (double)instantaneousPower;
- (double)instantaneousSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newFitnessMachineDataFromBikeSensorData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setInstantaneousCadence:(double)a3;
- (void)setInstantaneousPower:(double)a3;
- (void)setInstantaneousSpeed:(double)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation CMBikeSensorData

+ (BOOL)isAvailable
{
  if ((sub_1902BACB4() & 1) == 0) {
    sub_1902BAD40();
  }
  return 0;
}

- (CMBikeSensorData)initWithTimestamp:(id)a3
{
  if (!a3)
  {
    v11 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, @"CMBikeSensorData.mm", 45, @"Invalid parameter not satisfying: %@", @"timestamp");
  }
  v13.receiver = self;
  v13.super_class = (Class)CMBikeSensorData;
  v7 = [(CMBikeSensorData *)&v13 init];
  if (v7)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(a3, v5, v6);
    v7->fTimestamp = v8;
    *(int64x2_t *)&v7->_instantaneousCadence = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v7->_instantaneousSpeed = 1.79769313e308;
    v7->_model = (NSString *)&stru_1EDFD5D50;
    v7->_manufacturer = (NSString *)&stru_1EDFD5D50;
    v7->_deviceIdentifier = (NSString *)&stru_1EDFD5D50;
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMBikeSensorData;
  [(CMBikeSensorData *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMBikeSensorData)initWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CMBikeSensorData;
  v5 = [(CMBikeSensorData *)&v17 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCMBikeSensorDataKeyTimestamp");
    v5->fTimestamp = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMBikeSensorDataKeyInstantaneousSpeed");
    v5->_instantaneousSpeed = v8;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMBikeSensorDataKeyInstantaneousCadence");
    v5->_instantaneousCadence = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMBikeSensorDataKeyInstantaneousPower");
    v5->_instantaneousPower = v12;
    v5->_model = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v13, @"kCMBikeSensorDataKeyModel");
    v5->_deviceIdentifier = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v14, @"kCMBikeSensorDataKeyDeviceIdentifier");
    v5->_manufacturer = (NSString *)objc_msgSend_decodeObjectForKey_(a3, v15, @"kCMBikeSensorDataKeyManufacturer");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v8, v9, self->fTimestamp);
  double v12 = objc_msgSend_initWithTimestamp_(v7, v11, v10);
  objc_msgSend_setInstantaneousSpeed_(v12, v13, v14, self->_instantaneousSpeed);
  objc_msgSend_setInstantaneousCadence_(v12, v15, v16, self->_instantaneousCadence);
  objc_msgSend_setInstantaneousPower_(v12, v17, v18, self->_instantaneousPower);
  objc_msgSend_setModel_(v12, v19, (uint64_t)self->_model);
  objc_msgSend_setDeviceIdentifier_(v12, v20, (uint64_t)self->_deviceIdentifier);
  objc_msgSend_setManufacturer_(v12, v21, (uint64_t)self->_manufacturer);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"kCMBikeSensorDataKeyTimestamp", self->fTimestamp);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMBikeSensorDataKeyInstantaneousSpeed", self->_instantaneousSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMBikeSensorDataKeyInstantaneousCadence", self->_instantaneousCadence);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMBikeSensorDataKeyInstantaneousPower", self->_instantaneousPower);
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_model, @"kCMBikeSensorDataKeyModel");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_deviceIdentifier, @"kCMBikeSensorDataKeyDeviceIdentifier");
  manufacturer = self->_manufacturer;

  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)manufacturer, @"kCMBikeSensorDataKeyManufacturer");
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
  long long v19 = *(_OWORD *)&self->fTimestamp;
  double instantaneousCadence = self->_instantaneousCadence;
  double instantaneousPower = self->_instantaneousPower;
  uint64_t v10 = objc_msgSend_UTF8String(self->_model, v8, v9);
  uint64_t v13 = objc_msgSend_UTF8String(self->_deviceIdentifier, v11, v12);
  uint64_t v16 = objc_msgSend_UTF8String(self->_manufacturer, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v3, v17, @"%@, <timestamp, %f, instantaneousSpeed, %f, instantaneousCadence, %f, instantaneousPower, %f, model, %s, device identifier, %s, manufacturer, %s>", v5, v19, *(void *)&instantaneousCadence, *(void *)&instantaneousPower, v10, v13, v16);
}

- (id)newFitnessMachineDataFromBikeSensorData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v7 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v3, v5, v6, Current);
  objc_msgSend_timeIntervalSinceReferenceDate(v7, v8, v9);
  double v11 = v10;
  if (v10 - self->fTimestamp > 5.0)
  {
    if (qword_1E929D9E8 != -1) {
      dispatch_once(&qword_1E929D9E8, &unk_1EDFD2D00);
    }
    uint64_t v12 = qword_1E929D9F0;
    if (os_log_type_enabled((os_log_t)qword_1E929D9F0, OS_LOG_TYPE_ERROR))
    {
      double fTimestamp = self->fTimestamp;
      *(_DWORD *)buf = 134218240;
      double v19 = fTimestamp;
      __int16 v20 = 2048;
      double v21 = v11;
      _os_log_impl(&dword_1902AF000, v12, OS_LOG_TYPE_ERROR, "Received bike power data from HK which has delay more than expected. data time, %f, now, %f", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9E8 != -1) {
        dispatch_once(&qword_1E929D9E8, &unk_1EDFD2D00);
      }
      objc_super v17 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMBikeSensorData newFitnessMachineDataFromBikeSensorData]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
  uint64_t v14 = [CMFitnessMachineData alloc];
  return (id)objc_msgSend_initWithExernalBikeSensorData_speed_cadence_power_model_deviceIdentifier_manufacturer_externalFitnessType_(v14, v15, (uint64_t)self->_model, self->_deviceIdentifier, self->_manufacturer, 1, self->fTimestamp, self->_instantaneousSpeed, self->_instantaneousCadence, self->_instantaneousPower);
}

- (double)instantaneousSpeed
{
  return self->_instantaneousSpeed;
}

- (void)setInstantaneousSpeed:(double)a3
{
  self->_instantaneousSpeed = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
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

@end