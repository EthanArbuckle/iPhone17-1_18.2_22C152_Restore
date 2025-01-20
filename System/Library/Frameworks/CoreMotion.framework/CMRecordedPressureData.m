@interface CMRecordedPressureData
+ (BOOL)supportsSecureCoding;
- (BOOL)sr_prefersUTF8StringRepresentation;
- (CMRecordedPressureData)initWithCoder:(id)a3;
- (CMRecordedPressureData)initWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
- (NSDate)startDate;
- (double)startTime;
- (double)timestamp;
- (id)description;
- (id)pressure;
- (id)temperature;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
- (uint64_t)identifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
@end

@implementation CMRecordedPressureData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedPressureData)initWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CMRecordedPressureData;
  v10 = [(CMRecordedPressureData *)&v14 init];
  v12 = v10;
  if (v10) {
    objc_msgSend_resetWithData_timestamp_walltime_identifier_(v10, v11, (uint64_t)a3, a4, a6, a5);
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedPressureData)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CMRecordedPressureData;
  v5 = -[CMAmbientPressureData initWithCoder:](&v23, sel_initWithCoder_);
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"startDate");
    v5->_startDateValue = v6;
    objc_msgSend_timestamp(v5, v7, v8);
    v5->_timestampValue = v9;
    v12 = objc_msgSend_pressure(v5, v10, v11);
    objc_msgSend_doubleValue(v12, v13, v14);
    *(float *)&double v15 = v15;
    v5->_pressureValue = *(float *)&v15;
    v18 = objc_msgSend_temperature(v5, v16, v17);
    objc_msgSend_doubleValue(v18, v19, v20);
    *(float *)&double v21 = v21;
    v5->_temperatureValue = *(float *)&v21;
    v5->_pressureMeasurement = 0;
    v5->_temperatureMeasurement = 0;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMRecordedPressureData;
  -[CMAmbientPressureData encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"startDate", self->_startDateValue);
}

- (void)resetWithData:(CMPressure *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  self->_pressureMeasurement = 0;
  self->_temperatureMeasurement = 0;
  self->_pressureValue = a3->var0;
  self->_temperatureValue = a3->var1;
  unint64_t v6 = *(void *)(&a3->var2 + 1);
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - v6) / 1000000.0;
  self->_timestampValue = (double)v6 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  objc_msgSend_dealloc(self->_pressureMeasurement, a2, v2);
  objc_msgSend_dealloc(self->_temperatureMeasurement, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)CMRecordedPressureData;
  [(CMAmbientPressureData *)&v6 dealloc];
}

- (double)timestamp
{
  return self->_timestampValue;
}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->_startDateValue);
}

- (id)pressure
{
  id result = self->_pressureMeasurement;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28E28]);
    double pressureValue = self->_pressureValue;
    uint64_t v8 = objc_msgSend_kilopascals(MEMORY[0x1E4F291F8], v6, v7);
    id result = (id)objc_msgSend_initWithDoubleValue_unit_(v4, v9, v8, pressureValue);
    self->_pressureMeasurement = (NSMeasurement *)result;
  }
  return result;
}

- (id)temperature
{
  id result = self->_temperatureMeasurement;
  if (!result)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28E28]);
    double temperatureValue = self->_temperatureValue;
    uint64_t v8 = objc_msgSend_celsius(MEMORY[0x1E4F29218], v6, v7);
    id result = (id)objc_msgSend_initWithDoubleValue_unit_(v4, v9, v8, temperatureValue);
    self->_temperatureMeasurement = (NSMeasurement *)result;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%llu, %f, %f, %f, %f", self->_identifier, *(void *)&self->_timestampValue, *(void *)&self->_startDateValue, self->_pressureValue, self->_temperatureValue);
}

- (uint64_t)identifier
{
  return self->_identifier;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  uint64_t v5 = objc_msgSend_pressure(self, a2, (uint64_t)a3);
  objc_msgSend_doubleValue(v5, v6, v7);
  double v9 = v8;
  v12 = objc_msgSend_temperature(self, v10, v11);
  objc_msgSend_doubleValue(v12, v13, v14);
  double v16 = v15;
  objc_msgSend_timestamp(self, v17, v18);
  uint64_t v20 = (uint64_t)v19;
  started = objc_msgSend_startDate(self, v21, v22);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v24, v25);
  double v27 = v26;
  uint64_t v30 = objc_msgSend_identifier(self, v28, v29);
  LODWORD(result) = snprintf_l(byte_1E929E876, 0xA9uLL, 0, "{\"pressure\": %0.*g, \"temperature\": %0.*g, \"timestamp\": %ld, \"walltime\": %0.*g, \"identifier\": %llu}", 9, v9, 9, v16, v20, 9, v27, v30);
  if ((int)result <= 0) {
    return (int)result;
  }

  return MEMORY[0x1F4181798](a3, sel_write_maxLength_, byte_1E929E876);
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

@end