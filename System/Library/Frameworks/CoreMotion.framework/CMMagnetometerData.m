@interface CMMagnetometerData
+ (BOOL)supportsSecureCoding;
- (CMMagneticField)magneticField;
- (CMMagnetometerData)initWithCoder:(id)a3;
- (CMMagnetometerData)initWithMagneticField:(id)a3 andTimestamp:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMagnetometerData

- (CMMagnetometerData)initWithMagneticField:(id)a3 andTimestamp:(double)a4
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  v15.receiver = self;
  v15.super_class = (Class)CMMagnetometerData;
  v7 = [(CMLogItem *)&v15 initWithTimestamp:a4];
  if (v7)
  {
    v8 = [CMMagnetometerDataInternal alloc];
    *(float *)&double v9 = var0;
    *(float *)&double v10 = var1;
    *(float *)&double v11 = var2;
    v7->_internal = (id)objc_msgSend_initWithMagneticField_(v8, v12, v13, v9, v10, v11);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMagnetometerData)initWithCoder:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CMMagnetometerData;
  v4 = -[CMLogItem initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMMagnetometerDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMMagneticFieldCodingKeyX");
    float v8 = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMMagneticFieldCodingKeyY");
    float v11 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v12, @"kCMMagneticFieldCodingKeyZ");
    *(float *)&double v14 = v13;
    *(float *)&double v13 = v8;
    *(float *)&double v15 = v11;
    objc_msgSend_setMagneticField_(v5, v16, v17, v13, v15, v14);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMMagnetometerData;
  -[CMLogItem encodeWithCoder:](&v11, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  double v6 = internal[3];
  double v7 = internal[4];
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMMagneticFieldCodingKeyX", internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMMagneticFieldCodingKeyY", v6);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMMagneticFieldCodingKeyZ", v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMMagnetometerData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMMagnetometerData;
  double v6 = -[CMLogItem copyWithZone:](&v8, sel_copyWithZone_);
  if (v6) {
    v6[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3);
  }
  return v6;
}

- (id)description
{
  internal = (float *)self->_internal;
  objc_super v3 = NSString;
  double v4 = internal[2];
  double v5 = internal[3];
  double v6 = internal[4];
  v10.receiver = self;
  v10.super_class = (Class)CMMagnetometerData;
  [(CMLogItem *)&v10 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v7, @"x %f y %f z %f @ %f", *(void *)&v4, *(void *)&v5, *(void *)&v6, v8);
}

- (CMMagneticField)magneticField
{
  internal = (float *)self->_internal;
  double v3 = internal[2];
  double v4 = internal[3];
  double v5 = internal[4];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

@end