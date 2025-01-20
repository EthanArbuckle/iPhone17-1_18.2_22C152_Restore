@interface CMWaterSubmersionMeasurement
+ (BOOL)supportsSecureCoding;
- (CMWaterSubmersionDepthState)submersionState;
- (CMWaterSubmersionMeasurement)initWithCoder:(id)a3;
- (CMWaterSubmersionMeasurement)initWithDepth:(id)a3 andPressure:(id)a4 andSurfacePressure:(id)a5 andState:(int64_t)a6 andDate:(id)a7;
- (NSDate)date;
- (NSMeasurement)depth;
- (NSMeasurement)pressure;
- (NSMeasurement)surfacePressure;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWaterSubmersionMeasurement

- (CMWaterSubmersionMeasurement)initWithDepth:(id)a3 andPressure:(id)a4 andSurfacePressure:(id)a5 andState:(int64_t)a6 andDate:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)CMWaterSubmersionMeasurement;
  v12 = [(CMWaterSubmersionMeasurement *)&v14 init];
  if (v12)
  {
    v12->_depth = (NSMeasurement *)a3;
    v12->_pressure = (NSMeasurement *)a4;
    v12->_surfacePressure = (NSMeasurement *)a5;
    v12->_submersionState = a6;
    v12->_date = (NSDate *)a7;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWaterSubmersionMeasurement;
  [(CMWaterSubmersionMeasurement *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_depth(self, v8, v9);
  objc_msgSend_pressure(self, v11, v12);
  objc_msgSend_surfacePressure(self, v13, v14);
  objc_msgSend_submersionState(self, v15, v16);
  objc_msgSend_date(self, v17, v18);

  return (id)MEMORY[0x1F4181798](v7, sel_initWithDepth_andPressure_andSurfacePressure_andState_andDate_, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterSubmersionMeasurement)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CMWaterSubmersionMeasurement;
  v4 = [(CMWaterSubmersionMeasurement *)&v15 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_depth = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMWaterSubmersionMeasurementUpdateDepth");
    uint64_t v7 = objc_opt_class();
    v4->_pressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMWaterSubmersionMeasurementUpdatePressure");
    uint64_t v9 = objc_opt_class();
    v4->_surfacePressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMWaterSubmersionMeasurementUpdateSurfacePressure");
    v4->_submersionState = (int)objc_msgSend_decodeIntForKey_(a3, v11, @"kCMWaterSubmersionMeasurementUpdateState");
    uint64_t v12 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"kCMWaterSubmersionMeasurementUpdateDate");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = objc_msgSend_depth(self, a2, (uint64_t)a3);
  objc_msgSend_encodeObject_forKey_(a3, v6, v5, @"kCMWaterSubmersionMeasurementUpdateDepth");
  uint64_t v9 = objc_msgSend_pressure(self, v7, v8);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, @"kCMWaterSubmersionMeasurementUpdatePressure");
  uint64_t v13 = objc_msgSend_surfacePressure(self, v11, v12);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, @"kCMWaterSubmersionMeasurementUpdateSurfacePressure");
  uint64_t v17 = objc_msgSend_submersionState(self, v15, v16);
  objc_msgSend_encodeInteger_forKey_(a3, v18, v17, @"kCMWaterSubmersionMeasurementUpdateState");
  uint64_t v22 = objc_msgSend_date(self, v19, v20);

  objc_msgSend_encodeObject_forKey_(a3, v21, v22, @"kCMWaterSubmersionMeasurementUpdateDate");
}

- (id)description
{
  id v3 = (id)objc_opt_new();
  objc_msgSend_setUnitOptions_(v3, v4, 1);
  uint64_t v5 = NSString;
  uint64_t v8 = objc_msgSend_depth(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringFromMeasurement_(v3, v9, v8);
  uint64_t v13 = objc_msgSend_pressure(self, v11, v12);
  uint64_t v15 = objc_msgSend_stringFromMeasurement_(v3, v14, v13);
  uint64_t v18 = objc_msgSend_surfacePressure(self, v16, v17);
  uint64_t v20 = objc_msgSend_stringFromMeasurement_(v3, v19, v18);
  uint64_t v23 = objc_msgSend_submersionState(self, v21, v22);
  uint64_t v26 = objc_msgSend_date(self, v24, v25);
  return (id)objc_msgSend_stringWithFormat_(v5, v27, @"CMWaterSubmersionMeasurement (depth:%@, pressure:%@, surfacePressure:%@, state:%d, date:%@)", v10, v15, v20, v23, v26);
}

- (NSDate)date
{
  return self->_date;
}

- (NSMeasurement)depth
{
  return self->_depth;
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSMeasurement)surfacePressure
{
  return self->_surfacePressure;
}

- (CMWaterSubmersionDepthState)submersionState
{
  return self->_submersionState;
}

@end