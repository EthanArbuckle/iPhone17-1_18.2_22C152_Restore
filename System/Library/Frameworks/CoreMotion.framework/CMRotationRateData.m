@interface CMRotationRateData
+ (BOOL)supportsSecureCoding;
- (CMRotationRate)rotationRate;
- (CMRotationRateData)initWithCoder:(id)a3;
- (CMRotationRateData)initWithRotationRate:(id)a3 andTimestamp:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMRotationRateData

- (CMRotationRateData)initWithRotationRate:(id)a3 andTimestamp:(double)a4
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  v15.receiver = self;
  v15.super_class = (Class)CMRotationRateData;
  v7 = [(CMLogItem *)&v15 initWithTimestamp:a4];
  if (v7)
  {
    v8 = [CMRotationRateDataInternal alloc];
    *(float *)&double v9 = var0;
    *(float *)&double v10 = var1;
    *(float *)&double v11 = var2;
    v7->_internal = (id)objc_msgSend_initWithRotationRate_(v8, v12, v13, v9, v10, v11);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRotationRateData)initWithCoder:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CMRotationRateData;
  v4 = -[CMLogItem initWithCoder:](&v21, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMRotationRateDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"rotation_x");
    double v8 = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"rotation_y");
    double v11 = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v12, @"rotation_z");
    HIDWORD(v13) = 1066524486;
    float v14 = v8 / 0.0174532924;
    double v15 = v11 / 0.0174532924;
    *(float *)&double v15 = v11 / 0.0174532924;
    double v17 = v16 / 0.0174532924;
    *(float *)&double v13 = v17;
    *(float *)&double v17 = v14;
    objc_msgSend_setRotationRate_(v5, v18, v19, v17, v15, v13);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMRotationRateData;
  -[CMLogItem encodeWithCoder:](&v11, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  double v6 = (float)(internal[3] * 0.017453);
  double v7 = (float)(internal[4] * 0.017453);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"rotation_x", (float)(internal[2] * 0.017453));
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"rotation_y", v6);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"rotation_z", v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMRotationRateData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMRotationRateData;
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
  v10.super_class = (Class)CMRotationRateData;
  [(CMLogItem *)&v10 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v7, @"x %f y %f z %f @ %f", *(void *)&v4, *(void *)&v5, *(void *)&v6, v8);
}

- (CMRotationRate)rotationRate
{
  internal = (float *)self->_internal;
  double v3 = (float)(internal[2] * 0.017453);
  double v4 = (float)(internal[3] * 0.017453);
  double v5 = (float)(internal[4] * 0.017453);
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

@end