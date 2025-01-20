@interface CMAmbientPressureData
+ (BOOL)supportsSecureCoding;
- (BOOL)sr_prefersUTF8StringRepresentation;
- (CMAmbientPressureData)initWithCoder:(id)a3;
- (CMAmbientPressureData)initWithPressure:(id)a3 andTimestamp:(double)a4;
- (NSMeasurement)pressure;
- (NSMeasurement)temperature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMAmbientPressureData

- (CMAmbientPressureData)initWithPressure:(id)a3 andTimestamp:(double)a4
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  v18.receiver = self;
  v18.super_class = (Class)CMAmbientPressureData;
  v6 = [(CMLogItem *)&v18 initWithTimestamp:a4];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28E28]);
    uint64_t v10 = objc_msgSend_kilopascals(MEMORY[0x1E4F291F8], v8, v9);
    v6->_pressure = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v7, v11, v10, var0);
    id v12 = objc_alloc(MEMORY[0x1E4F28E28]);
    uint64_t v15 = objc_msgSend_celsius(MEMORY[0x1E4F29218], v13, v14);
    v6->_temperature = (NSMeasurement *)objc_msgSend_initWithDoubleValue_unit_(v12, v16, v15, var1);
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAmbientPressureData)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMAmbientPressureData;
  v4 = -[CMLogItem initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_pressure = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMAmbientPressureCodingKeyPressure");
    uint64_t v7 = objc_opt_class();
    v4->_temperature = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMAmbientPressureCodingKeyTemperature");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CMAmbientPressureData;
  -[CMLogItem encodeWithCoder:](&v13, sel_encodeWithCoder_);
  uint64_t v7 = objc_msgSend_pressure(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(a3, v8, v7, @"kCMAmbientPressureCodingKeyPressure");
  uint64_t v11 = objc_msgSend_temperature(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, @"kCMAmbientPressureCodingKeyTemperature");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMAmbientPressureData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CMAmbientPressureData;
  uint64_t v7 = -[CMLogItem copyWithZone:](&v15, sel_copyWithZone_);
  if (v7)
  {
    v8 = objc_msgSend_pressure(self, v5, v6);
    v7[2] = objc_msgSend_copyWithZone_(v8, v9, (uint64_t)a3);
    id v12 = objc_msgSend_temperature(self, v10, v11);
    v7[3] = objc_msgSend_copyWithZone_(v12, v13, (uint64_t)a3);
  }
  return v7;
}

- (id)description
{
  id v3 = (id)objc_opt_new();
  v4 = NSString;
  uint64_t v7 = objc_msgSend_pressure(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringFromMeasurement_(v3, v8, v7);
  uint64_t v12 = objc_msgSend_temperature(self, v10, v11);
  uint64_t v14 = objc_msgSend_stringFromMeasurement_(v3, v13, v12);
  v18.receiver = self;
  v18.super_class = (Class)CMAmbientPressureData;
  [(CMLogItem *)&v18 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v4, v15, @"Pressure %@ Temperature %@ @ %f", v9, v14, v16);
}

- (NSMeasurement)pressure
{
  return self->_pressure;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  uint64_t v5 = objc_msgSend_pressure(self, a2, (uint64_t)a3);
  objc_msgSend_doubleValue(v5, v6, v7);
  double v9 = v8;
  uint64_t v12 = objc_msgSend_temperature(self, v10, v11);
  objc_msgSend_doubleValue(v12, v13, v14);
  double v16 = v15;
  objc_msgSend_timestamp(self, v17, v18);
  LODWORD(result) = snprintf_l(byte_1E929E814, 0x62uLL, 0, "{\"pressure\": %0.*g, \"temperature\": %0.*g, \"timestamp\": %ld}", 9, v9, 9, v16, (uint64_t)v19);
  if ((int)result <= 0) {
    return (int)result;
  }

  return MEMORY[0x1F4181798](a3, sel_write_maxLength_, byte_1E929E814);
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end