@interface CMWaterTemperature
+ (BOOL)supportsSecureCoding;
- (CMWaterTemperature)initWithCoder:(id)a3;
- (CMWaterTemperature)initWithTemperature:(id)a3 andTemperatureUncertainty:(id)a4 andDate:(id)a5;
- (NSDate)date;
- (NSMeasurement)temperature;
- (NSMeasurement)temperatureUncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWaterTemperature

- (CMWaterTemperature)initWithTemperature:(id)a3 andTemperatureUncertainty:(id)a4 andDate:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMWaterTemperature;
  v8 = [(CMWaterTemperature *)&v10 init];
  if (v8)
  {
    v8->_temperature = (NSMeasurement *)a3;
    v8->_temperatureUncertainty = (NSMeasurement *)a4;
    v8->_date = (NSDate *)a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWaterTemperature;
  [(CMWaterTemperature *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_temperature(self, v8, v9);
  objc_msgSend_temperatureUncertainty(self, v11, v12);
  objc_msgSend_date(self, v13, v14);

  return (id)MEMORY[0x1F4181798](v7, sel_initWithTemperature_andTemperatureUncertainty_andDate_, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterTemperature)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMWaterTemperature;
  v4 = [(CMWaterTemperature *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_temperature = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMWaterTemperature");
    uint64_t v7 = objc_opt_class();
    v4->_temperatureUncertainty = (NSMeasurement *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMWaterTemperatureUncertainty");
    uint64_t v9 = objc_opt_class();
    v4->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMWTemperatureUpdateDate");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = objc_msgSend_temperature(self, a2, (uint64_t)a3);
  objc_msgSend_encodeObject_forKey_(a3, v6, v5, @"kCMWaterTemperature");
  uint64_t v9 = objc_msgSend_temperatureUncertainty(self, v7, v8);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, @"kCMWaterTemperatureUncertainty");
  uint64_t v14 = objc_msgSend_date(self, v11, v12);

  objc_msgSend_encodeObject_forKey_(a3, v13, v14, @"kCMWTemperatureUpdateDate");
}

- (id)description
{
  id v3 = (id)objc_opt_new();
  objc_msgSend_setUnitOptions_(v3, v4, 1);
  uint64_t v5 = NSString;
  uint64_t v8 = objc_msgSend_temperature(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringFromMeasurement_(v3, v9, v8);
  uint64_t v13 = objc_msgSend_temperatureUncertainty(self, v11, v12);
  uint64_t v15 = objc_msgSend_stringFromMeasurement_(v3, v14, v13);
  uint64_t v18 = objc_msgSend_date(self, v16, v17);
  return (id)objc_msgSend_stringWithFormat_(v5, v19, @"CMWaterTemperature (temperature:%@, temperatureUncertainty:%@, date:%@)", v10, v15, v18);
}

- (NSDate)date
{
  return self->_date;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

- (NSMeasurement)temperatureUncertainty
{
  return self->_temperatureUncertainty;
}

@end