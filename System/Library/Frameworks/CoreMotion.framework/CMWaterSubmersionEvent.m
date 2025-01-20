@interface CMWaterSubmersionEvent
+ (BOOL)supportsSecureCoding;
- (CMWaterSubmersionEvent)initWithCoder:(id)a3;
- (CMWaterSubmersionEvent)initWithEvent:(int64_t)a3 andDate:(id)a4;
- (CMWaterSubmersionState)state;
- (NSDate)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWaterSubmersionEvent

- (CMWaterSubmersionEvent)initWithEvent:(int64_t)a3 andDate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CMWaterSubmersionEvent;
  v6 = [(CMWaterSubmersionEvent *)&v8 init];
  if (v6)
  {
    v6->_date = (NSDate *)a4;
    v6->_state = a3;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWaterSubmersionEvent;
  [(CMWaterSubmersionEvent *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_state(self, v8, v9);
  objc_msgSend_date(self, v11, v12);

  return (id)MEMORY[0x1F4181798](v7, sel_initWithEvent_andDate_, v10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWaterSubmersionEvent)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMWaterSubmersionEvent;
  v5 = [(CMWaterSubmersionEvent *)&v9 init];
  if (v5)
  {
    v5->_state = (int)objc_msgSend_decodeIntForKey_(a3, v4, @"kCMWaterSubmersionEvent");
    uint64_t v6 = objc_opt_class();
    v5->_date = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMWaterSubmersionEventDate");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5 = objc_msgSend_state(self, a2, (uint64_t)a3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, v5, @"kCMWaterSubmersionEvent");
  uint64_t v10 = objc_msgSend_date(self, v7, v8);

  objc_msgSend_encodeObject_forKey_(a3, v9, v10, @"kCMWaterSubmersionEventDate");
}

- (id)description
{
  v4 = NSString;
  uint64_t v5 = objc_msgSend_state(self, a2, v2);
  uint64_t v8 = objc_msgSend_date(self, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v4, v9, @"CMWaterSubmersionEvent (event:%d, date:%@)", v5, v8);
}

- (NSDate)date
{
  return self->_date;
}

- (CMWaterSubmersionState)state
{
  return self->_state;
}

@end