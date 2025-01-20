@interface CMWorkoutMetsData
+ (BOOL)supportsSecureCoding;
- (CMWorkoutMetsData)initWithCLWorkoutMets:(const CLWorkoutMets *)a3;
- (CMWorkoutMetsData)initWithCoder:(id)a3;
- (CMWorkoutMetsData)initWithSessionId:(id)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 mets:(id)a7;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)mets;
- (NSUUID)sessionId;
- (NSUUID)sourceId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMWorkoutMetsData

- (CMWorkoutMetsData)initWithCLWorkoutMets:(const CLWorkoutMets *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CMWorkoutMetsData;
  v4 = [(CMWorkoutMetsData *)&v19 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v5, v6, v7, a3->var0);
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fEndDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var1);
    id v11 = objc_alloc(NSNumber);
    v4->fMets = (NSNumber *)objc_msgSend_initWithDouble_(v11, v12, v13, a3->var4);
    id v14 = objc_alloc(MEMORY[0x1E4F29128]);
    v4->fSourceId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v14, v15, (uint64_t)a3->var3);
    id v16 = objc_alloc(MEMORY[0x1E4F29128]);
    v4->fSessionId = (NSUUID *)objc_msgSend_initWithUUIDBytes_(v16, v17, (uint64_t)a3->var2);
  }
  return v4;
}

- (CMWorkoutMetsData)initWithSessionId:(id)a3 sourceId:(id)a4 startDate:(id)a5 endDate:(id)a6 mets:(id)a7
{
  v24.receiver = self;
  v24.super_class = (Class)CMWorkoutMetsData;
  id v14 = [(CMWorkoutMetsData *)&v24 init];
  if (v14)
  {
    v14->fStartDate = (NSDate *)objc_msgSend_copy(a5, v12, v13);
    v14->fEndDate = (NSDate *)objc_msgSend_copy(a6, v15, v16);
    v14->fMets = (NSNumber *)objc_msgSend_copy(a7, v17, v18);
    v14->fSourceId = (NSUUID *)objc_msgSend_copy(a4, v19, v20);
    v14->fSessionId = (NSUUID *)objc_msgSend_copy(a3, v21, v22);
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMWorkoutMetsData;
  [(CMWorkoutMetsData *)&v3 dealloc];
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSDate)endDate
{
  return self->fEndDate;
}

- (NSNumber)mets
{
  return self->fMets;
}

- (NSUUID)sourceId
{
  return self->fSourceId;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t started = objc_msgSend_startDate(self, v6, v7);
  uint64_t v11 = objc_msgSend_endDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_mets(self, v12, v13);
  uint64_t v17 = objc_msgSend_sessionId(self, v15, v16);
  uint64_t v20 = objc_msgSend_sourceId(self, v18, v19);
  return (id)objc_msgSend_stringWithFormat_(v3, v21, @"%@,<startDate, %@, endDate, %@, mets, %@, sessionId, %@, sourceId, %@>", v5, started, v11, v14, v17, v20);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMWorkoutMetsData)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CMWorkoutMetsData;
  v4 = [(CMWorkoutMetsData *)&v25 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kWorkoutMetsCodingKeyStartDate");
    v4->fStartDate = (NSDate *)objc_msgSend_copy(v7, v8, v9);
    uint64_t v10 = objc_opt_class();
    v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"kWorkoutMetsCodingKeyEndDate");
    v4->fEndDate = (NSDate *)objc_msgSend_copy(v12, v13, v14);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kWorkoutMetsCodingKeyMets");
    v4->fMets = (NSNumber *)objc_msgSend_copy(v17, v18, v19);
    uint64_t v20 = objc_opt_class();
    v4->fSourceId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v21, v20, @"kWorkoutMetsCodingKeySourceId");
    uint64_t v22 = objc_opt_class();
    v4->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, @"kWorkoutMetsCodingKeySessionId");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  fSessionId = self->fSessionId;

  return (id)MEMORY[0x1F4181798](v7, sel_initWithSessionId_sourceId_startDate_endDate_mets_, fSessionId);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fStartDate, @"kWorkoutMetsCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fEndDate, @"kWorkoutMetsCodingKeyEndDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fMets, @"kWorkoutMetsCodingKeyMets");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fSourceId, @"kWorkoutMetsCodingKeySourceId");
  fSessionId = self->fSessionId;

  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)fSessionId, @"kWorkoutMetsCodingKeySessionId");
}

@end