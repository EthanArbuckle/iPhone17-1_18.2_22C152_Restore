@interface CMStrideCalibrationData
+ (BOOL)supportsSecureCoding;
- (CMStrideCalibrationData)initWithBegin:(double)a3 end:(double)a4 state:(int64_t)a5 kValue:(double)a6;
- (CMStrideCalibrationData)initWithCoder:(id)a3;
- (double)begin;
- (double)end;
- (double)kValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setBegin:(double)a3;
- (void)setEnd:(double)a3;
- (void)setKValue:(double)a3;
- (void)setState:(int64_t)a3;
@end

@implementation CMStrideCalibrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalibrationData)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CMStrideCalibrationData;
  v5 = [(CMStrideCalibrationData *)&v13 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCMStrideCalibrationDataCodingKeyBegin");
    v5->_begin = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"kCMStrideCalibrationDataCodingKeyEnd");
    v5->_end = v8;
    v5->_state = objc_msgSend_decodeIntegerForKey_(a3, v9, @"kCMStrideCalibrationDataCodingKeyState");
    objc_msgSend_decodeDoubleForKey_(a3, v10, @"kCMStrideCalibrationDataCodingKeyKValue");
    v5->_kValue = v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"kCMStrideCalibrationDataCodingKeyBegin", self->_begin);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMStrideCalibrationDataCodingKeyEnd", self->_end);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_state, @"kCMStrideCalibrationDataCodingKeyState");
  double kValue = self->_kValue;

  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMStrideCalibrationDataCodingKeyKValue", kValue);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  *((void *)result + 3) = *(void *)&self->_begin;
  *((void *)result + 4) = *(void *)&self->_end;
  *((void *)result + 1) = self->_state;
  *((void *)result + 2) = *(void *)&self->_kValue;
  return result;
}

- (CMStrideCalibrationData)initWithBegin:(double)a3 end:(double)a4 state:(int64_t)a5 kValue:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CMStrideCalibrationData;
  id result = [(CMStrideCalibrationData *)&v11 init];
  if (result)
  {
    result->_begin = a3;
    result->_end = a4;
    result->_state = a5;
    result->_double kValue = a6;
  }
  return result;
}

- (id)description
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v30[0] = @"begin";
  double v6 = NSNumber;
  objc_msgSend_begin(self, v7, v8);
  v31[0] = objc_msgSend_numberWithDouble_(v6, v9, v10);
  v30[1] = @"end";
  objc_super v11 = NSNumber;
  objc_msgSend_end(self, v12, v13);
  v31[1] = objc_msgSend_numberWithDouble_(v11, v14, v15);
  v30[2] = @"state";
  v16 = NSNumber;
  uint64_t v19 = objc_msgSend_state(self, v17, v18);
  v31[2] = objc_msgSend_numberWithInteger_(v16, v20, v19);
  v30[3] = @"kValue";
  v21 = NSNumber;
  objc_msgSend_kValue(self, v22, v23);
  v31[3] = objc_msgSend_numberWithDouble_(v21, v24, v25);
  uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v31, v30, 4);
  return (id)objc_msgSend_stringWithFormat_(v3, v28, @"%@,%@", v5, v27);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)kValue
{
  return self->_kValue;
}

- (void)setKValue:(double)a3
{
  self->_double kValue = a3;
}

- (double)begin
{
  return self->_begin;
}

- (void)setBegin:(double)a3
{
  self->_begin = a3;
}

- (double)end
{
  return self->_end;
}

- (void)setEnd:(double)a3
{
  self->_end = a3;
}

@end