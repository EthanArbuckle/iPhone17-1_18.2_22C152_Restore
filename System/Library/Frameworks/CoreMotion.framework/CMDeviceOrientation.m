@interface CMDeviceOrientation
+ (BOOL)supportsSecureCoding;
- (CMDeviceOrientation)initWithCoder:(id)a3;
- (CMDeviceOrientation)initWithOrientation:(int)a3 andTimestamp:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)orientation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMDeviceOrientation

- (CMDeviceOrientation)initWithOrientation:(int)a3 andTimestamp:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CMDeviceOrientation;
  result = [(CMLogItem *)&v6 initWithTimestamp:a4];
  if (result) {
    result->fOrientation = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceOrientation)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMDeviceOrientation;
  v5 = -[CMLogItem initWithCoder:](&v7, sel_initWithCoder_);
  if (v5) {
    v5->fOrientation = objc_msgSend_decodeIntForKey_(a3, v4, @"kCMDeviceOrientationCodingKeyOrientation");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMDeviceOrientation;
  -[CMLogItem encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend_encodeInt_forKey_(a3, v5, self->fOrientation, @"kCMDeviceOrientationCodingKeyOrientation");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMDeviceOrientation;
  [(CMLogItem *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMDeviceOrientation;
  id result = [(CMLogItem *)&v5 copyWithZone:a3];
  if (result) {
    *((_DWORD *)result + 4) = self->fOrientation;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v4);
  uint64_t fOrientation = self->fOrientation;
  if (fOrientation > 6) {
    uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)"Unexpected");
  }
  else {
    uint64_t v8 = objc_msgSend_stringWithUTF8String_(NSString, v5, (uint64_t)off_1E568FB80[fOrientation]);
  }
  uint64_t v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)CMDeviceOrientation;
  [(CMLogItem *)&v13 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v10, @"%@ orientation %d name %@ @ %f", v6, fOrientation, v9, v11);
}

- (int)orientation
{
  return self->fOrientation;
}

@end