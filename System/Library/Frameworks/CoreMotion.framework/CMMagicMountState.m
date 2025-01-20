@interface CMMagicMountState
+ (BOOL)supportsSecureCoding;
- (BOOL)isMounted;
- (CMMagicMountState)initWithCoder:(id)a3;
- (CMMagicMountState)initWithMountStatus:(int64_t)a3 timestamp:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mountStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMagicMountState

- (CMMagicMountState)initWithMountStatus:(int64_t)a3 timestamp:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CMMagicMountState;
  result = [(CMLogItem *)&v6 initWithTimestamp:a4];
  if (result) {
    result->_mountStatus = a3;
  }
  return result;
}

- (BOOL)isMounted
{
  return self->_mountStatus == 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMagicMountState)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMMagicMountState;
  v5 = -[CMLogItem initWithCoder:](&v7, sel_initWithCoder_);
  if (v5) {
    v5->_mountStatus = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMMagicMountStateCodingKeyMountStatus");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMMagicMountState;
  -[CMLogItem encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_mountStatus, @"kCMMagicMountStateCodingKeyMountStatus");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMMagicMountState;
  id result = [(CMLogItem *)&v5 copyWithZone:a3];
  if (result) {
    *((void *)result + 2) = self->_mountStatus;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  unsigned int isMounted = objc_msgSend_isMounted(self, v6, v7);
  int64_t mountStatus = self->_mountStatus;
  v13.receiver = self;
  v13.super_class = (Class)CMMagicMountState;
  [(CMLogItem *)&v13 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v10, @"%@ mounted=%d, mountStatus=%ld @ %f", v5, isMounted, mountStatus, v11);
}

- (int64_t)mountStatus
{
  return self->_mountStatus;
}

@end