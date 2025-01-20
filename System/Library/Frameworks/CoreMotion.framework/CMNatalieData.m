@interface CMNatalieData
+ (BOOL)supportsSecureCoding;
+ (id)maxNatalieEntries;
- (CMNatalieData)initWithCoder:(id)a3;
- (CMNatalieData)initWithStartDate:(double)a3 recordId:(int64_t)a4 activityType:(int64_t)a5 mets:(double)a6 natalies:(double)a7 basalNatalies:(double)a8 sourceId:(id)a9;
- (NSDate)startDate;
- (NSNumber)basalNatalies;
- (NSNumber)mets;
- (NSNumber)natalies;
- (NSUUID)sourceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)activityType;
- (int64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMNatalieData

- (CMNatalieData)initWithStartDate:(double)a3 recordId:(int64_t)a4 activityType:(int64_t)a5 mets:(double)a6 natalies:(double)a7 basalNatalies:(double)a8 sourceId:(id)a9
{
  v21.receiver = self;
  v21.super_class = (Class)CMNatalieData;
  v16 = [(CMLogItem *)&v21 initWithTimestamp:0.0];
  v19 = v16;
  if (v16)
  {
    v16->fStartDate = a3;
    v16->fRecordId = a4;
    v16->fActivityType = a5;
    v16->fMets = a6;
    v16->fNatalies = a7;
    v16->fBasalNatalies = a8;
    v16->fSourceId = (NSUUID *)objc_msgSend_copy(a9, v17, v18);
  }
  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMNatalieData;
  [(CMLogItem *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMNatalieData)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMNatalieData;
  v5 = -[CMLogItem initWithCoder:](&v18, sel_initWithCoder_);
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kNatalieDataCodingKeyStartDate");
    v5->fStartDate = v6;
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kNatalieDataCodingKeyRecordId");
    v5->fActivityType = objc_msgSend_decodeIntegerForKey_(a3, v8, @"kNatalieDataCodingKeySession");
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kNatalieDataCodingKeyMets");
    v5->fMets = v10;
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kNatalieDataCodingKeyNatalies");
    v5->fNatalies = v12;
    objc_msgSend_decodeDoubleForKey_(a3, v13, @"kNatalieDataCodingKeyBasalNatalies");
    v5->fBasalNatalies = v14;
    uint64_t v15 = objc_opt_class();
    v5->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kNatalieDataCodingKeySourceId");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  int64_t fRecordId = self->fRecordId;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithStartDate_recordId_activityType_mets_natalies_basalNatalies_sourceId_, fRecordId);
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMNatalieData;
  -[CMLogItem encodeWithCoder:](&v12, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kNatalieDataCodingKeyStartDate", self->fStartDate);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fRecordId, @"kNatalieDataCodingKeyRecordId");
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->fActivityType, @"kNatalieDataCodingKeySession");
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kNatalieDataCodingKeyMets", self->fMets);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kNatalieDataCodingKeyNatalies", self->fNatalies);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kNatalieDataCodingKeyBasalNatalies", self->fBasalNatalies);
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->fSourceId, @"kNatalieDataCodingKeySourceId");
}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->fStartDate);
}

- (NSNumber)mets
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fMets);
}

- (NSNumber)natalies
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fNatalies);
}

- (NSNumber)basalNatalies
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->fBasalNatalies);
}

- (int64_t)activityType
{
  return self->fActivityType;
}

- (int64_t)recordId
{
  return self->fRecordId;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

+ (id)maxNatalieEntries
{
  return (id)objc_msgSend_numberWithInt_(NSNumber, a2, 1000);
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  uint64_t v13 = objc_msgSend_workoutName_(CMWorkout, v12, self->fActivityType);
  v16 = objc_msgSend_mets(self, v14, v15);
  uint64_t v19 = objc_msgSend_stringValue(v16, v17, v18);
  v22 = objc_msgSend_natalies(self, v20, v21);
  uint64_t v25 = objc_msgSend_stringValue(v22, v23, v24);
  v28 = objc_msgSend_basalNatalies(self, v26, v27);
  uint64_t v31 = objc_msgSend_stringValue(v28, v29, v30);
  uint64_t v34 = objc_msgSend_sourceId(self, v32, v33);
  return (id)objc_msgSend_stringWithFormat_(v3, v35, @"%@, <recordId %lu, startDate %@, session %@, mets %@, natalies %@, basalNatalies %@, sourceId %@>", v5, v8, started, v13, v19, v25, v31, v34);
}

@end