@interface CMMotionTimeRange
+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3;
- (CMMotionTimeRange)initWithCoder:(id)a3;
- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMMotionTimeRange

- (CMMotionTimeRange)initWithStartDate:(double)a3 endDate:(double)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CMMotionTimeRange;
  v6 = [(CMMotionTimeRange *)&v14 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v6->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v7, v8, v9, a3);
    id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v6->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v10, v11, v12, a4);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMMotionTimeRange;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v12 = objc_msgSend_init(v7, v8, v9);
  if (v12)
  {
    v12[2] = objc_msgSend_copy(self->fStartDate, v10, v11);
    v12[3] = objc_msgSend_copy(self->fEndDate, v13, v14);
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMMotionTimeRange)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CMMotionTimeRange;
  v4 = [(CMMotionTimeRange *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fStartDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMMotionTimeRangeCodingKeyStartDate");
    uint64_t v7 = objc_opt_class();
    v4->fEndDate = (NSDate *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMMotionTimeRangeCodingKeyEndDate");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, @"kCMMotionTimeRangeCodingKeyStartDate");
  fEndDate = self->fEndDate;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)fEndDate, @"kCMMotionTimeRangeCodingKeyEndDate");
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  return (id)objc_msgSend_stringWithFormat_(v3, v12, @"%@,<startDate %@, endDate %@>", v5, started, v11);
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

+ (id)CMMotionTimeRangeFromCLMotionTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v5 = [CMMotionTimeRange alloc];
  uint64_t started = objc_msgSend_initWithStartDate_endDate_(v5, v6, v7, var0, var1);

  return started;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)CLMotionTimeRangeFromCMMotionTimeRange:(id)a3
{
  if (!a3)
  {
    v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, a1, @"CMMotionTimeRange.mm", 101, @"Invalid parameter not satisfying: %@", @"timeRange");
  }
  uint64_t started = objc_msgSend_startDate(a3, a2, (uint64_t)a3);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v5, v6);
  double v8 = v7;
  uint64_t v11 = objc_msgSend_endDate(a3, v9, v10);
  objc_msgSend_timeIntervalSinceReferenceDate(v11, v12, v13);
  double v15 = v14;
  double v16 = v8;
  result.double var1 = v15;
  result.double var0 = v16;
  return result;
}

@end