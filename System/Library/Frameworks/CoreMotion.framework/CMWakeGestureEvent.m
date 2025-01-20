@interface CMWakeGestureEvent
+ (BOOL)supportsSecureCoding;
- (CMWakeGestureEvent)initWithCoder:(id)a3;
- (CMWakeGestureEvent)initWithState:(int64_t)a3 type:(int64_t)a4 orientation:(int)a5 timestamp:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)orientation;
- (int64_t)state;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWakeGestureEvent

- (CMWakeGestureEvent)initWithState:(int64_t)a3 type:(int64_t)a4 orientation:(int)a5 timestamp:(double)a6
{
  v10.receiver = self;
  v10.super_class = (Class)CMWakeGestureEvent;
  result = [(CMLogItem *)&v10 initWithTimestamp:a6];
  if (result)
  {
    result->_state = a3;
    result->_type = a4;
    result->_orientation = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWakeGestureEvent)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMWakeGestureEvent;
  v5 = -[CMLogItem initWithCoder:](&v9, sel_initWithCoder_);
  if (v5)
  {
    v5->_state = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMWakeGestureEventCodingKeyState");
    v5->_type = objc_msgSend_decodeIntegerForKey_(a3, v6, @"kCMWakeGestureEventCodingKeyType");
    v5->_orientation = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMWakeGestureEventCodingKeyOrientation");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMWakeGestureEvent;
  -[CMLogItem encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_state, @"kCMWakeGestureEventCodingKeyState");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_type, @"kCMWakeGestureEventCodingKeyType");
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_orientation, @"kCMWakeGestureEventCodingKeyOrientation");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMWakeGestureEvent;
  id result = [(CMLogItem *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 3) = self->_state;
    *((void *)result + 4) = self->_type;
    *((_DWORD *)result + 4) = self->_orientation;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  int64_t state = self->_state;
  int64_t type = self->_type;
  v12.receiver = self;
  v12.super_class = (Class)CMWakeGestureEvent;
  uint64_t orientation = self->_orientation;
  [(CMLogItem *)&v12 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v9, @"%@ state=%ld, type=%ld, orientation=%d, @ %f", v5, state, type, orientation, v10);
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)type
{
  return self->_type;
}

- (int)orientation
{
  return self->_orientation;
}

@end