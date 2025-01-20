@interface CMHistoricalCardioSamples
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CMHistoricalCardioSamples)init;
- (CMHistoricalCardioSamples)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMHistoricalCardioSamples)initWithCoder:(id)a3;
- (NSArray)cardioFitnessInputs;
- (NSArray)cardioFitnessResults;
- (NSArray)cardioFitnessSummary;
- (NSArray)cardioSessionMetrics;
- (NSArray)pedestrianGrade;
- (NSArray)recoveryHeartRate;
- (NSArray)recoverySessions;
- (NSArray)recoveryWorkRate;
- (NSString)description;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCardioFitnessInputs:(id)a3;
- (void)setCardioFitnessResults:(id)a3;
- (void)setCardioFitnessSummary:(id)a3;
- (void)setCardioSessionMetrics:(id)a3;
- (void)setPedestrianGrade:(id)a3;
- (void)setRecoveryHeartRate:(id)a3;
- (void)setRecoverySessions:(id)a3;
- (void)setRecoveryWorkRate:(id)a3;
@end

@implementation CMHistoricalCardioSamples

- (CMHistoricalCardioSamples)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMHistoricalCardioSamples;
  return [(CMHistoricalCardioSamples *)&v3 init];
}

- (void)dealloc
{
  cardioFitnessInputs = self->_cardioFitnessInputs;
  if (cardioFitnessInputs) {

  }
  cardioSessionMetrics = self->_cardioSessionMetrics;
  if (cardioSessionMetrics) {

  }
  cardioFitnessResults = self->_cardioFitnessResults;
  if (cardioFitnessResults) {

  }
  cardioFitnessSummary = self->_cardioFitnessSummary;
  if (cardioFitnessSummary) {

  }
  recoveryHeartRate = self->_recoveryHeartRate;
  if (recoveryHeartRate) {

  }
  recoveryWorkRate = self->_recoveryWorkRate;
  if (recoveryWorkRate) {

  }
  recoverySessions = self->_recoverySessions;
  if (recoverySessions) {

  }
  pedestrianGrade = self->_pedestrianGrade;
  if (pedestrianGrade) {

  }
  v11.receiver = self;
  v11.super_class = (Class)CMHistoricalCardioSamples;
  [(CMHistoricalCardioSamples *)&v11 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_cardioFitnessInputs, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessInputs");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_cardioSessionMetrics, @"kCMHistoricalCardioSamplesCodingKeyCardioSessionMetrics");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_cardioFitnessResults, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessResults");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->_cardioFitnessSummary, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessSummary");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->_recoveryHeartRate, @"kCMHistoricalCardioSamplesCodingKeyRecoveryHeartRate");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->_recoveryWorkRate, @"kCMHistoricalCardioSamplesCodingKeyRecoveryWorkRate");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_recoverySessions, @"kCMHistoricalCardioSamplesCodingKeyRecoverySessions");
  pedestrianGrade = self->_pedestrianGrade;

  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)pedestrianGrade, @"kCMHistoricalCardioSamplesCodingKeyPedestrianGrade");
}

- (CMHistoricalCardioSamples)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CMHistoricalCardioSamples;
  v4 = [(CMHistoricalCardioSamples *)&v22 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_cardioFitnessInputs = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessInputs");
    uint64_t v7 = objc_opt_class();
    v4->_cardioSessionMetrics = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v8, v7, @"kCMHistoricalCardioSamplesCodingKeyCardioSessionMetrics");
    uint64_t v9 = objc_opt_class();
    v4->_cardioFitnessResults = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v10, v9, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessResults");
    uint64_t v11 = objc_opt_class();
    v4->_cardioFitnessSummary = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v12, v11, @"kCMHistoricalCardioSamplesCodingKeyCardioFitnessSummary");
    uint64_t v13 = objc_opt_class();
    v4->_recoveryHeartRate = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v14, v13, @"kCMHistoricalCardioSamplesCodingKeyRecoveryHeartRate");
    uint64_t v15 = objc_opt_class();
    v4->_recoveryWorkRate = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v16, v15, @"kCMHistoricalCardioSamplesCodingKeyRecoveryWorkRate");
    uint64_t v17 = objc_opt_class();
    v4->_recoverySessions = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v18, v17, @"kCMHistoricalCardioSamplesCodingKeyRecoverySessions");
    uint64_t v19 = objc_opt_class();
    v4->_pedestrianGrade = (NSArray *)(id)objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(a3, v20, v19, @"kCMHistoricalCardioSamplesCodingKeyPedestrianGrade");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v10[1] = objc_msgSend_copy(self->_cardioFitnessInputs, v11, v12);
  v10[2] = objc_msgSend_copy(self->_cardioSessionMetrics, v13, v14);
  v10[3] = objc_msgSend_copy(self->_cardioFitnessResults, v15, v16);
  v10[4] = objc_msgSend_copy(self->_cardioFitnessSummary, v17, v18);
  v10[5] = objc_msgSend_copy(self->_recoveryHeartRate, v19, v20);
  v10[6] = objc_msgSend_copy(self->_recoveryWorkRate, v21, v22);
  v10[7] = objc_msgSend_copy(self->_recoverySessions, v23, v24);
  v10[8] = objc_msgSend_copy(self->_pedestrianGrade, v25, v26);
  return v10;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_cardioFitnessInputs(self, v6, v7);
  uint64_t v11 = objc_msgSend_cardioSessionMetrics(self, v9, v10);
  uint64_t v14 = objc_msgSend_cardioFitnessResults(self, v12, v13);
  uint64_t v17 = objc_msgSend_cardioFitnessSummary(self, v15, v16);
  uint64_t v20 = objc_msgSend_recoveryHeartRate(self, v18, v19);
  uint64_t v23 = objc_msgSend_recoveryWorkRate(self, v21, v22);
  uint64_t v26 = objc_msgSend_recoverySessions(self, v24, v25);
  uint64_t v29 = objc_msgSend_pedestrianGrade(self, v27, v28);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v30, @"%@, <cardioFitnessInputs, %@, cardioSessionMetrics, %@, cardioFitnessResults, %@, cardioFitnessSummary, %@, recoveryHR, %@, recoveryWR, %@, recoverySessions, %@, pedestrianGrade, %@>", v5, v8, v11, v14, v17, v20, v23, v26, v29);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_cardioFitnessInputs(self, v5, v6);
  uint64_t v10 = objc_msgSend_cardioFitnessInputs(a3, v8, v9);
  if (!objc_msgSend_isEqualToArray_(v7, v11, v10)) {
    return 0;
  }
  uint64_t v14 = objc_msgSend_cardioSessionMetrics(self, v12, v13);
  uint64_t v17 = objc_msgSend_cardioSessionMetrics(a3, v15, v16);
  if (!objc_msgSend_isEqualToArray_(v14, v18, v17)) {
    return 0;
  }
  v21 = objc_msgSend_cardioFitnessResults(self, v19, v20);
  uint64_t v24 = objc_msgSend_cardioFitnessResults(a3, v22, v23);
  if (!objc_msgSend_isEqualToArray_(v21, v25, v24)) {
    return 0;
  }
  uint64_t v28 = objc_msgSend_cardioFitnessSummary(self, v26, v27);
  uint64_t v31 = objc_msgSend_cardioFitnessSummary(a3, v29, v30);
  if (!objc_msgSend_isEqualToArray_(v28, v32, v31)) {
    return 0;
  }
  v35 = objc_msgSend_recoveryHeartRate(self, v33, v34);
  uint64_t v38 = objc_msgSend_recoveryHeartRate(a3, v36, v37);
  if (!objc_msgSend_isEqualToArray_(v35, v39, v38)) {
    return 0;
  }
  v42 = objc_msgSend_recoveryWorkRate(self, v40, v41);
  uint64_t v45 = objc_msgSend_recoveryWorkRate(a3, v43, v44);
  if (!objc_msgSend_isEqualToArray_(v42, v46, v45)) {
    return 0;
  }
  v49 = objc_msgSend_recoverySessions(self, v47, v48);
  uint64_t v52 = objc_msgSend_recoverySessions(a3, v50, v51);
  if (!objc_msgSend_isEqualToArray_(v49, v53, v52)) {
    return 0;
  }
  v56 = objc_msgSend_pedestrianGrade(self, v54, v55);
  uint64_t v60 = objc_msgSend_pedestrianGrade(a3, v57, v58);

  return objc_msgSend_isEqualToArray_(v56, v59, v60);
}

- (NSArray)cardioFitnessInputs
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCardioFitnessInputs:(id)a3
{
}

- (NSArray)cardioSessionMetrics
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCardioSessionMetrics:(id)a3
{
}

- (NSArray)cardioFitnessResults
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCardioFitnessResults:(id)a3
{
}

- (NSArray)cardioFitnessSummary
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCardioFitnessSummary:(id)a3
{
}

- (NSArray)recoveryHeartRate
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecoveryHeartRate:(id)a3
{
}

- (NSArray)recoveryWorkRate
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRecoveryWorkRate:(id)a3
{
}

- (NSArray)recoverySessions
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRecoverySessions:(id)a3
{
}

- (NSArray)pedestrianGrade
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPedestrianGrade:(id)a3
{
}

- (id)binarySampleRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  v2 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)self, 1, &v10);
  if (v10)
  {
    if (qword_1E929D9F8 != -1) {
      dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
    }
    objc_super v3 = qword_1E929DA00;
    if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
    {
      v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v5;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1902AF000, v3, OS_LOG_TYPE_ERROR, "Failed to archive %{public}@ object: %{public}@", buf, 0x16u);
    }
    if (sub_1902D8400(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
      }
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v11 = 138543618;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalCardioSamples(SensorKit) binarySampleRepresentation]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  return v2;
}

- (CMHistoricalCardioSamples)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
LABEL_9:

    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CMHistoricalCardioSamples;
  self = [(CMHistoricalCardioSamples *)&v20 init];
  if (self)
  {
    uint64_t v19 = 0;
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, a3, &v19);
    if (v19)
    {
      if (qword_1E929D9F8 != -1) {
        dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
      }
      int v11 = qword_1E929DA00;
      if (os_log_type_enabled((os_log_t)qword_1E929DA00, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        __int16 v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v13;
        __int16 v27 = 2114;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1902AF000, v11, OS_LOG_TYPE_ERROR, "Failed to unarchive %{public}@: %{public}@", buf, 0x16u);
      }
      if (sub_1902D8400(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929D9F8 != -1) {
          dispatch_once(&qword_1E929D9F8, &unk_1EDFD2860);
        }
        uint64_t v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        int v21 = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        uint64_t v24 = v19;
        uint64_t v18 = (char *)_os_log_send_and_compose_impl();
        sub_1902D398C("Generic", 1, 0, 0, "-[CMHistoricalCardioSamples(SensorKit) initWithBinarySampleRepresentation:metadata:timestamp:]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      goto LABEL_9;
    }
    uint64_t v15 = (void *)v10;
    if (v10)
    {

      return (CMHistoricalCardioSamples *)v15;
    }
  }
  return self;
}

- (id)sr_dictionaryRepresentation
{
  v35[6] = *MEMORY[0x1E4F143B8];
  v34[0] = @"cardioFitnessInputs";
  v4 = objc_msgSend_cardioFitnessInputs(self, a2, v2);
  v35[0] = sub_1905984A0(v4, v5, v6);
  v34[1] = @"cardioFitnessResults";
  uint64_t v9 = objc_msgSend_cardioFitnessResults(self, v7, v8);
  v35[1] = sub_1905984A0(v9, v10, v11);
  v34[2] = @"recoveryHeartRate";
  uint64_t v14 = objc_msgSend_recoveryHeartRate(self, v12, v13);
  v35[2] = sub_1905984A0(v14, v15, v16);
  v34[3] = @"recoveryWorkRate";
  uint64_t v19 = objc_msgSend_recoveryWorkRate(self, v17, v18);
  v35[3] = sub_1905984A0(v19, v20, v21);
  v34[4] = @"recoverySessions";
  uint64_t v24 = objc_msgSend_recoverySessions(self, v22, v23);
  v35[4] = sub_1905984A0(v24, v25, v26);
  v34[5] = @"pedestrianGrade";
  uint64_t v29 = objc_msgSend_pedestrianGrade(self, v27, v28);
  v35[5] = sub_1905984A0(v29, v30, v31);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v32, (uint64_t)v35, v34, 6);
}

@end