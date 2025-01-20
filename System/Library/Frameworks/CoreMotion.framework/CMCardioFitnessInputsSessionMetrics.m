@interface CMCardioFitnessInputsSessionMetrics
+ (BOOL)supportsSecureCoding;
+ (VO2MaxSessionAttributes)inputFromPreparedStatement:(SEL)a3;
- (BOOL)betaBlockerUse;
- (BOOL)isEqual:(id)a3;
- (CMCardioFitnessInputsSessionMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMCardioFitnessInputsSessionMetrics)initWithCoder:(id)a3;
- (CMCardioFitnessInputsSessionMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 sessionId:(id)a5 meanMaxMets:(double)a6 prior:(double)a7 hardwareType:(unsigned int)a8 betaBlockerUse:(BOOL)a9 algorithmVersion:(int64_t)a10;
- (CMCardioFitnessInputsSessionMetrics)initWithSample:(VO2MaxSessionAttributes *)a3;
- (NSDate)startDate;
- (NSString)description;
- (NSUUID)sessionId;
- (double)meanMaxMets;
- (double)prior;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (int64_t)algorithmVersion;
- (unint64_t)recordId;
- (unsigned)hardwareType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMCardioFitnessInputsSessionMetrics

- (CMCardioFitnessInputsSessionMetrics)initWithRecordId:(unint64_t)a3 startDate:(id)a4 sessionId:(id)a5 meanMaxMets:(double)a6 prior:(double)a7 hardwareType:(unsigned int)a8 betaBlockerUse:(BOOL)a9 algorithmVersion:(int64_t)a10
{
  v21.receiver = self;
  v21.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  v18 = [(CMCardioFitnessInputsSessionMetrics *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->fRecordId = a3;
    v18->fStartDate = (NSDate *)a4;
    v19->fSessionId = (NSUUID *)a5;
    v19->fMeanMaxMets = a6;
    v19->fPrior = a7;
    v19->fHardwareType = a8;
    v19->fBetaBlockerUse = a9;
    v19->fAlgorithmVersion = a10;
  }
  return v19;
}

- (CMCardioFitnessInputsSessionMetrics)initWithSample:(VO2MaxSessionAttributes *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  v4 = [(CMCardioFitnessInputsSessionMetrics *)&v12 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var2);
    v4->fRecordId = a3->var0;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var1);
    v4->fSessionId = (NSUUID *)v7;
    v4->fMeanMaxMets = a3->var3;
    v4->fPrior = a3->var4;
    v4->fHardwareType = a3->var5;
    v4->fBetaBlockerUse = a3->var6;
    v4->fAlgorithmVersion = a3->var7;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  [(CMCardioFitnessInputsSessionMetrics *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCardioFitnessInputsSessionMetrics)initWithCoder:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
  id v5 = [(CMCardioFitnessInputsSessionMetrics *)&v24 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMCardioFitnessInputsSessionMetricsCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    id v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMCardioFitnessInputsSessionMetricsCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    uint64_t v11 = objc_opt_class();
    v13 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMCardioFitnessInputsSessionMetricsCodingKeySessionId");
    v5->fSessionId = (NSUUID *)objc_msgSend_copy(v13, v14, v15);
    objc_msgSend_decodeDoubleForKey_(a3, v16, @"kCMCardioFitnessInputsSessionMetricsCodingKeyMeanMaxMets");
    v5->fMeanMaxMets = v17;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMCardioFitnessInputsSessionMetricsCodingKeyPrior");
    v5->fPrior = v19;
    v5->fHardwareType = objc_msgSend_decodeIntegerForKey_(a3, v20, @"kCMCardioFitnessInputsSessionMetricsCodingKeyHardwareType");
    v5->fBetaBlockerUse = objc_msgSend_decodeBoolForKey_(a3, v21, @"kCMCardioFitnessInputsSessionMetricsCodingKeyBetaBlockerUse");
    v5->fAlgorithmVersion = objc_msgSend_decodeIntegerForKey_(a3, v22, @"kCMCardioFitnessInputsSessionMetricsCodingKeyAlgorithmVersion");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(void *)&long long v15 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3);
  *((void *)&v15 + 1) = v7;
  long long v16 = 0uLL;
  long long v17 = *(_OWORD *)&self->fMeanMaxMets;
  LODWORD(v18) = self->fHardwareType;
  BYTE4(v18) = self->fBetaBlockerUse;
  DWORD2(v18) = self->fAlgorithmVersion;
  long long v19 = 0uLL;
  objc_msgSend_getUUIDBytes_(self->fSessionId, v8, (uint64_t)&v16);
  v9 = objc_opt_class();
  uint64_t v11 = objc_msgSend_allocWithZone_(v9, v10, (uint64_t)a3);
  v14[2] = v17;
  v14[3] = v18;
  v14[4] = v19;
  v14[0] = v15;
  v14[1] = v16;
  return (id)objc_msgSend_initWithSample_(v11, v12, (uint64_t)v14);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMCardioFitnessInputsSessionMetricsCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMCardioFitnessInputsSessionMetricsCodingKeyStartDate");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fSessionId, @"kCMCardioFitnessInputsSessionMetricsCodingKeySessionId");
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMCardioFitnessInputsSessionMetricsCodingKeyMeanMaxMets", self->fMeanMaxMets);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMCardioFitnessInputsSessionMetricsCodingKeyPrior", self->fPrior);
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->fHardwareType, @"kCMCardioFitnessInputsSessionMetricsCodingKeyHardwareType");
  objc_msgSend_encodeBool_forKey_(a3, v10, self->fBetaBlockerUse, @"kCMCardioFitnessInputsSessionMetricsCodingKeyBetaBlockerUse");
  int64_t fAlgorithmVersion = self->fAlgorithmVersion;

  objc_msgSend_encodeInteger_forKey_(a3, v11, fAlgorithmVersion, @"kCMCardioFitnessInputsSessionMetricsCodingKeyAlgorithmVersion");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend_recordId(self, v5, v6);
  if (v7 != objc_msgSend_recordId(a3, v8, v9)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
    || (started = objc_msgSend_startDate(self, v12, v13),
        uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
        (int isEqual = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
  {
    if (!objc_msgSend_sessionId(self, v12, v13) && !objc_msgSend_sessionId(a3, v20, v21)
      || (v22 = objc_msgSend_sessionId(self, v20, v21),
          uint64_t v25 = objc_msgSend_sessionId(a3, v23, v24),
          (int isEqual = objc_msgSend_isEqual_(v22, v26, v25)) != 0))
    {
      objc_msgSend_meanMaxMets(self, v20, v21);
      double v28 = v27;
      objc_msgSend_meanMaxMets(a3, v29, v30);
      if (v28 != v33
        || (objc_msgSend_prior(self, v31, v32), double v35 = v34, objc_msgSend_prior(a3, v36, v37), v35 != v40)
        || (int v41 = objc_msgSend_hardwareType(self, v38, v39), v41 != objc_msgSend_hardwareType(a3, v42, v43))|| (v46 = objc_msgSend_betaBlockerUse(self, v44, v45), v46 != objc_msgSend_betaBlockerUse(a3, v47, v48)))
      {
LABEL_13:
        LOBYTE(isEqual) = 0;
        return isEqual;
      }
      uint64_t v51 = objc_msgSend_algorithmVersion(self, v49, v50);
      LOBYTE(isEqual) = v51 == objc_msgSend_algorithmVersion(a3, v52, v53);
    }
  }
  return isEqual;
}

- (unint64_t)recordId
{
  return self->fRecordId;
}

- (NSDate)startDate
{
  return self->fStartDate;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)meanMaxMets
{
  return self->fMeanMaxMets;
}

- (double)prior
{
  return self->fPrior;
}

- (unsigned)hardwareType
{
  return self->fHardwareType;
}

- (BOOL)betaBlockerUse
{
  return self->fBetaBlockerUse;
}

- (int64_t)algorithmVersion
{
  return self->fAlgorithmVersion;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  v14 = objc_msgSend_sessionId(self, v12, v13);
  uint64_t v17 = objc_msgSend_UUIDString(v14, v15, v16);
  objc_msgSend_meanMaxMets(self, v18, v19);
  uint64_t v21 = v20;
  objc_msgSend_prior(self, v22, v23);
  uint64_t v25 = v24;
  uint64_t v28 = objc_msgSend_hardwareType(self, v26, v27);
  unsigned int v31 = objc_msgSend_betaBlockerUse(self, v29, v30);
  uint64_t v34 = objc_msgSend_algorithmVersion(self, v32, v33);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v35, @"%@, <recordId, %lu, startDate, %@, sessionId, %@, meanMaxMets, %f, prior, %f, hardwareType, %d, betaBlockerUse, %d, algorithmVersion, %ld>", v5, v8, started, v17, v21, v25, v28, v31, v34);
}

+ (VO2MaxSessionAttributes)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  double v6 = sqlite3_column_double(a4, 1);
  *(void *)retstr->var2 = 0;
  var2 = retstr->var2;
  *((double *)var2 - 1) = v6;
  *((void *)var2 + 1) = 0;
  *((double *)var2 + 2) = sqlite3_column_double(a4, 3);
  *((double *)var2 + 3) = sqlite3_column_double(a4, 4);
  *((_DWORD *)var2 + 8) = sqlite3_column_int(a4, 5);
  var2[36] = sqlite3_column_int(a4, 6) != 0;
  *((_DWORD *)var2 + 10) = sqlite3_column_int(a4, 7);
  *((void *)var2 + 6) = 0;
  *((void *)var2 + 7) = 0;
  uint64_t v8 = sqlite3_column_text(a4, 2);

  return (VO2MaxSessionAttributes *)uuid_parse((const char *)v8, var2);
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMCardioFitnessInputsSessionMetrics)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMCardioFitnessInputsSessionMetrics;
    uint64_t v7 = [(CMCardioFitnessInputsSessionMetrics *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        objc_super v12 = (void *)v11;

        return (CMCardioFitnessInputsSessionMetrics *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (id)sr_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

@end