@interface CMPedometerEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventStringFromType:(int64_t)a3;
- (CMPedometerEvent)initWithCoder:(id)a3;
- (CMPedometerEvent)initWithEventDate:(id)a3 type:(int64_t)a4;
- (CMPedometerEventType)type;
- (NSDate)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMPedometerEvent

- (CMPedometerEvent)initWithEventDate:(id)a3 type:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CMPedometerEvent;
  v6 = [(CMPedometerEvent *)&v8 init];
  if (v6)
  {
    v6->fDate = (NSDate *)a3;
    v6->fType = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPedometerEvent;
  [(CMPedometerEvent *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  fDate = self->fDate;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithEventDate_type_, fDate);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMPedometerEvent)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMPedometerEvent;
  v4 = [(CMPedometerEvent *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMPedometerEventKeyEventDate");
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCMPedometerEventKeyEventType");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fDate, @"kCMPedometerEventKeyEventDate");
  int64_t fType = self->fType;

  objc_msgSend_encodeInteger_forKey_(a3, v5, fType, @"kCMPedometerEventKeyEventType");
}

+ (id)eventStringFromType:(int64_t)a3
{
  objc_super v3 = @"Resume";
  if (a3 != 1) {
    objc_super v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Pause";
  }
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_date(self, v6, v7);
  uint64_t v11 = objc_msgSend_type(self, v9, v10);
  uint64_t v13 = objc_msgSend_eventStringFromType_(CMPedometerEvent, v12, v11);
  return (id)objc_msgSend_stringWithFormat_(v3, v14, @"%@,<eventDate, %@, eventType, %@>", v5, v8, v13);
}

- (NSDate)date
{
  return self->fDate;
}

- (CMPedometerEventType)type
{
  return self->fType;
}

@end