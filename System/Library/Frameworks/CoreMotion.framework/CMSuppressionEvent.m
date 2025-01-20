@interface CMSuppressionEvent
+ (BOOL)supportsSecureCoding;
+ (id)stringForEventFacedownState:(unint64_t)a3;
+ (id)stringForEventReason:(unint64_t)a3;
+ (id)stringForEventType:(int64_t)a3;
- (CMSuppressionEvent)initWithCoder:(id)a3;
- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6;
- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6 timeSinceLastFacedownStatic:(double)a7;
- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 timestamp:(double)a5;
- (double)timeSinceLastFacedownStatic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)facedownState;
- (unint64_t)reason;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMSuppressionEvent

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 timestamp:(double)a5
{
  return (CMSuppressionEvent *)MEMORY[0x1F4181798](self, sel_initWithEventType_reason_facedownState_timestamp_, a3);
}

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6
{
  return (CMSuppressionEvent *)objc_msgSend_initWithEventType_reason_facedownState_timestamp_timeSinceLastFacedownStatic_(self, a2, a3, a4, 0, a6, 0.0);
}

- (CMSuppressionEvent)initWithEventType:(int64_t)a3 reason:(unint64_t)a4 facedownState:(unint64_t)a5 timestamp:(double)a6 timeSinceLastFacedownStatic:(double)a7
{
  v12.receiver = self;
  v12.super_class = (Class)CMSuppressionEvent;
  result = [(CMLogItem *)&v12 initWithTimestamp:a6];
  if (result)
  {
    result->fType = a3;
    result->fReason = a4;
    result->fFacedownState = a5;
    result->fTimeSinceLastFacedownStatic = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSuppressionEvent)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMSuppressionEvent;
  v5 = -[CMLogItem initWithCoder:](&v14, sel_initWithCoder_);
  if (v5)
  {
    v5->fType = objc_msgSend_decodeObjectForKey_(a3, v4, @"kCMSuppressionEventCodingKeyType");
    v5->fReason = objc_msgSend_decodeObjectForKey_(a3, v6, @"kCMSuppressionEventCodingKeyReason");
    v5->fFacedownState = objc_msgSend_decodeObjectForKey_(a3, v7, @"kCMSuppressionEventCodingKeyFacedownState");
    v9 = objc_msgSend_decodeObjectForKey_(a3, v8, @"kCMSuppressionEventCodingKeyTimeSinceLastFacedownStatic");
    objc_msgSend_doubleValue(v9, v10, v11);
    v5->fTimeSinceLastFacedownStatic = v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMSuppressionEvent;
  -[CMLogItem encodeWithCoder:](&v18, sel_encodeWithCoder_);
  uint64_t v6 = objc_msgSend_numberWithInteger_(NSNumber, v5, self->fType);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, @"kCMSuppressionEventCodingKeyType");
  uint64_t v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, self->fReason);
  objc_msgSend_encodeObject_forKey_(a3, v10, v9, @"kCMSuppressionEventCodingKeyReason");
  uint64_t v12 = objc_msgSend_numberWithInteger_(NSNumber, v11, self->fReason);
  objc_msgSend_encodeObject_forKey_(a3, v13, v12, @"kCMSuppressionEventCodingKeyFacedownState");
  uint64_t v16 = objc_msgSend_numberWithDouble_(NSNumber, v14, v15, self->fTimeSinceLastFacedownStatic);
  objc_msgSend_encodeObject_forKey_(a3, v17, v16, @"kCMSuppressionEventCodingKeyTimeSinceLastFacedownStatic");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMSuppressionEvent;
  [(CMLogItem *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CMSuppressionEvent;
  id result = [(CMLogItem *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 2) = self->fType;
    *((void *)result + 3) = self->fReason;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v7 = objc_msgSend_stringForEventType_(CMSuppressionEvent, v6, self->fType);
  uint64_t v9 = objc_msgSend_stringForEventReason_(CMSuppressionEvent, v8, self->fReason);
  uint64_t v11 = objc_msgSend_stringForEventFacedownState_(CMSuppressionEvent, v10, self->fFacedownState);
  double fTimeSinceLastFacedownStatic = self->fTimeSinceLastFacedownStatic;
  v16.receiver = self;
  v16.super_class = (Class)CMSuppressionEvent;
  [(CMLogItem *)&v16 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v13, @"%@ %@ %@ %@ timeSinceLastFacedownStatic=%f @ %f", v5, v7, v9, v11, *(void *)&fTimeSinceLastFacedownStatic, v14);
}

- (int64_t)type
{
  return self->fType;
}

- (unint64_t)reason
{
  return self->fReason;
}

- (unint64_t)facedownState
{
  return self->fFacedownState;
}

- (double)timeSinceLastFacedownStatic
{
  return self->fTimeSinceLastFacedownStatic;
}

+ (id)stringForEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)"Unexpected");
  }
  else {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)off_1E568E548[a3]);
  }
}

+ (id)stringForEventReason:(unint64_t)a3
{
  if (!a3) {
    return @"Unknown";
  }
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = v4;
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_msgSend_addObject_(v7, v5, @"SmartPowerNap");
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  objc_msgSend_addObject_(v4, v5, @"ViewObstructed");
  if ((v3 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v3 & 4) != 0) {
LABEL_5:
  }
    objc_msgSend_addObject_(v7, v5, @"DevicePresence");
LABEL_6:
  if (!objc_msgSend_count(v7, v5, v6)) {
    __assert_rtn("+[CMSuppressionEvent stringForEventReason:]", "CMSuppressionEvent.m", 185, "[reasons count]");
  }
  uint64_t v9 = objc_msgSend_componentsJoinedByString_(v7, v8, @",");

  return v9;
}

+ (id)stringForEventFacedownState:(unint64_t)a3
{
  if (a3 > 3) {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)"Unexpected");
  }
  else {
    return (id)objc_msgSend_stringWithUTF8String_(NSString, a2, (uint64_t)off_1E568E568[a3]);
  }
}

@end