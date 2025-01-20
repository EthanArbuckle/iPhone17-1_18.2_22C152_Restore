@interface CMMetMinute
+ (BOOL)supportsSecureCoding;
- (CMMetMinute)initWithCoder:(id)a3;
- (CMMetMinute)initWithSample:(CLMetMinute)a3;
- (CMMetMinute)initWithStartDate:(id)a3 averageIntensity:(id)a4;
- (NSDate)startDate;
- (NSNumber)averageIntensity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMetMinute

- (CMMetMinute)initWithStartDate:(id)a3 averageIntensity:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CMMetMinute;
  v8 = [(CMMetMinute *)&v12 init];
  if (v8)
  {
    v8->fStartDate = (NSDate *)objc_msgSend_copy(a3, v6, v7);
    v8->fAverageIntensity = (NSNumber *)objc_msgSend_copy(a4, v9, v10);
  }
  return v8;
}

- (CMMetMinute)initWithSample:(CLMetMinute)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v13.receiver = self;
  v13.super_class = (Class)CMMetMinute;
  v5 = [(CMMetMinute *)&v13 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v5->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v6, v7, v8, var0);
    id v9 = objc_alloc(NSNumber);
    v5->fAverageIntensity = (NSNumber *)objc_msgSend_initWithDouble_(v9, v10, v11, var1);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMMetMinute;
  [(CMMetMinute *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMetMinute)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMMetMinute;
  v4 = [(CMMetMinute *)&v16 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kMetMinuteDataCodingKeyStartDate");
    v4->fStartDate = (NSDate *)objc_msgSend_copy(v7, v8, v9);
    uint64_t v10 = objc_opt_class();
    objc_super v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kMetMinuteDataCodingKeyAverageIntensity");
    v4->fAverageIntensity = (NSNumber *)objc_msgSend_copy(v12, v13, v14);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  fStartDate = self->fStartDate;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithStartDate_averageIntensity_, fStartDate);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, @"kMetMinuteDataCodingKeyStartDate");
  fAverageIntensity = self->fAverageIntensity;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)fAverageIntensity, @"kMetMinuteDataCodingKeyAverageIntensity");
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSNumber)averageIntensity
{
  return self->fAverageIntensity;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_averageIntensity(self, v9, v10);
  objc_msgSend_doubleValue(v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v3, v14, @"%@, <startDate, %@, averageIntensity, %f>", v5, started, v15);
}

@end