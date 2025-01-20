@interface CMIndoorOutdoorState
+ (BOOL)supportsSecureCoding;
- (CMIndoorOutdoorState)initWithCoder:(id)a3;
- (CMIndoorOutdoorState)initWithStartDate:(id)a3 type:(int64_t)a4 confidence:(int64_t)a5;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)confidence;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMIndoorOutdoorState

- (CMIndoorOutdoorState)initWithStartDate:(id)a3 type:(int64_t)a4 confidence:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMIndoorOutdoorState;
  v8 = [(CMIndoorOutdoorState *)&v10 init];
  if (v8)
  {
    v8->fStartDate = (NSDate *)a3;
    v8->fType = a4;
    v8->fConfidence = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMIndoorOutdoorState;
  [(CMIndoorOutdoorState *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMIndoorOutdoorState)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMIndoorOutdoorState;
  v4 = [(CMIndoorOutdoorState *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kIndoorOutdoorStateCodingKeyStartDate");
    v4->fType = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kIndoorOutdoorStateCodingKeyType");
    v4->fConfidence = objc_msgSend_decodeIntegerForKey_(a3, v8, @"kIndoorOutdoorStateCodingKeyConfidence");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  fStartDate = self->fStartDate;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithStartDate_type_confidence_, fStartDate);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, @"kIndoorOutdoorStateCodingKeyStartDate");
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->fType, @"kIndoorOutdoorStateCodingKeyType");
  int64_t fConfidence = self->fConfidence;

  objc_msgSend_encodeInteger_forKey_(a3, v6, fConfidence, @"kIndoorOutdoorStateCodingKeyConfidence");
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (int64_t)type
{
  return self->fType;
}

- (int64_t)confidence
{
  return self->fConfidence;
}

- (id)description
{
  if (qword_1EB3BF7A8 != -1) {
    dispatch_once(&qword_1EB3BF7A8, &unk_1EDFD2BE0);
  }
  v4 = (void *)qword_1EB3BF7A0;
  uint64_t started = objc_msgSend_startDate(self, a2, v2);
  uint64_t v7 = objc_msgSend_stringFromDate_(v4, v6, started);
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  objc_super v10 = NSStringFromClass(v9);
  uint64_t v13 = objc_msgSend_type(self, v11, v12);
  uint64_t v16 = objc_msgSend_confidence(self, v14, v15);
  return (id)objc_msgSend_stringWithFormat_(v8, v17, @"%@, <startDate %@, type %ld, confidence %ld>", v10, v7, v13, v16);
}

@end