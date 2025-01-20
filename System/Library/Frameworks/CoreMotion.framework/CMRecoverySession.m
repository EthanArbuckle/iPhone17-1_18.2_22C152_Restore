@interface CMRecoverySession
+ (BOOL)supportsSecureCoding;
+ (HRRecoverySession)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMRecoverySession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMRecoverySession)initWithCoder:(id)a3;
- (CMRecoverySession)initWithRecordId:(unint64_t)a3 startDate:(id)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int64_t)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int64_t)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17;
- (CMRecoverySession)initWithSample:(HRRecoverySession *)a3;
- (NSDate)startDate;
- (NSString)description;
- (NSUUID)workoutSessionId;
- (double)activityEndTime;
- (double)hrMax;
- (double)hrMinAdjusted;
- (double)hrRecovery;
- (double)hrRecoveryReference;
- (double)lambda;
- (double)peakHR;
- (double)recoveryOnsetTime;
- (double)sessionHrRecovery;
- (double)steadyStateHR;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (int64_t)status;
- (int64_t)workoutType;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMRecoverySession

- (id)sr_dictionaryRepresentation
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29[0] = @"startTime";
  v4 = NSNumber;
  started = objc_msgSend_startDate(self, a2, v2);
  objc_msgSend_timeIntervalSinceReferenceDate(started, v6, v7);
  v30[0] = objc_msgSend_numberWithDouble_(v4, v8, v9);
  v29[1] = @"workoutSessionId";
  v12 = objc_msgSend_workoutSessionId(self, v10, v11);
  uint64_t v15 = objc_msgSend_UUIDString(v12, v13, v14);
  v18 = &stru_1EDFD5D50;
  if (v15) {
    v18 = (__CFString *)v15;
  }
  v30[1] = v18;
  v29[2] = @"activityEndTime";
  v19 = NSNumber;
  objc_msgSend_activityEndTime(self, v16, v17);
  v30[2] = objc_msgSend_numberWithDouble_(v19, v20, v21);
  v29[3] = @"hrRecovery";
  v22 = NSNumber;
  objc_msgSend_hrRecovery(self, v23, v24);
  v30[3] = objc_msgSend_numberWithDouble_(v22, v25, v26);
  return (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v27, (uint64_t)v30, v29, 4);
}

- (CMRecoverySession)initWithRecordId:(unint64_t)a3 startDate:(id)a4 activityEndTime:(double)a5 workoutSessionId:(id)a6 workoutType:(int64_t)a7 hrRecovery:(double)a8 lambda:(double)a9 hrMax:(double)a10 hrMinAdjusted:(double)a11 recoveryOnsetTime:(double)a12 steadyStateHR:(double)a13 status:(int64_t)a14 sessionHrRecovery:(double)a15 peakHR:(double)a16 hrRecoveryReference:(double)a17
{
  v33.receiver = self;
  v33.super_class = (Class)CMRecoverySession;
  v30 = [(CMRecoverySession *)&v33 init];
  v31 = v30;
  if (v30)
  {
    v30->fRecordId = a3;
    v30->fStartDate = (NSDate *)a4;
    v31->fActivityEndTime = a5;
    v31->fWorkoutSessionId = (NSUUID *)a6;
    v31->fWorkoutType = a7;
    v31->fHrRecovery = a8;
    v31->fLambda = a9;
    v31->fHrMax = a10;
    v31->fHrMinAdjusted = a11;
    v31->fRecoveryOnsetTime = a12;
    v31->fSteadyStateHR = a13;
    v31->fStatus = a14;
    v31->fSessionHrRecovery = a15;
    v31->fPeakHR = a16;
    v31->fHrRecoveryReference = a17;
  }
  return v31;
}

- (CMRecoverySession)initWithSample:(HRRecoverySession *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMRecoverySession;
  v4 = [(CMRecoverySession *)&v12 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var4);
    v4->fRecordId = a3->var0;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var1);
    v4->fActivityEndTime = a3->var2;
    v4->fWorkoutSessionId = (NSUUID *)v7;
    v4->fWorkoutType = a3->var5;
    v4->fHrRecovery = a3->var6;
    v4->fLambda = a3->var7;
    v4->fHrMax = a3->var8;
    v4->fHrMinAdjusted = a3->var9;
    v4->fRecoveryOnsetTime = a3->var10;
    v4->fSteadyStateHR = a3->var11;
    v4->fStatus = a3->var12;
    v4->fSessionHrRecovery = a3->var13;
    v4->fPeakHR = a3->var14;
    v4->fHrRecoveryReference = a3->var15;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMRecoverySession;
  [(CMRecoverySession *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecoverySession)initWithCoder:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)CMRecoverySession;
  id v5 = [(CMRecoverySession *)&v36 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMRecoverySessionCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    id v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMRecoverySessionCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMRecoverySessionCodingKeyActivityEndTime");
    v5->fActivityEndTime = v12;
    uint64_t v13 = objc_opt_class();
    v5->fWorkoutSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"kCMRecoverySessionCodingKeyWorkoutSessionId");
    v5->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v15, @"kCMRecoverySessionCodingKeyWorkoutType");
    objc_msgSend_decodeDoubleForKey_(a3, v16, @"kCMRecoverySessionCodingKeyHRRecovery");
    v5->fHrRecovery = v17;
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"kCMRecoverySessionCodingKeyLambda");
    v5->fLambda = v19;
    objc_msgSend_decodeDoubleForKey_(a3, v20, @"kCMRecoverySessionCodingKeyHRMax");
    v5->fHrMax = v21;
    objc_msgSend_decodeDoubleForKey_(a3, v22, @"kCMRecoverySessionCodingKeyHRMinAdjusted");
    v5->fHrMinAdjusted = v23;
    objc_msgSend_decodeDoubleForKey_(a3, v24, @"kCMRecoverySessionCodingKeyRecoveryOnsetTime");
    v5->fRecoveryOnsetTime = v25;
    objc_msgSend_decodeDoubleForKey_(a3, v26, @"kCMRecoverySessionCodingKeySteadyStateHR");
    v5->fSteadyStateHR = v27;
    v5->fStatus = objc_msgSend_decodeIntegerForKey_(a3, v28, @"kCMRecoverySessionCodingKeyStatus");
    objc_msgSend_decodeDoubleForKey_(a3, v29, @"kCMRecoverySessionCodingKeySessionHRRecovery");
    v5->fSessionHrRecovery = v30;
    objc_msgSend_decodeDoubleForKey_(a3, v31, @"kCMRecoverySessionCodingKeyPeakHR");
    v5->fPeakHR = v32;
    objc_msgSend_decodeDoubleForKey_(a3, v33, @"kCMRecoverySessionCodingKeyHRRecoveryReference");
    v5->fHrRecoveryReference = v34;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(void *)&long long v18 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3);
  double fActivityEndTime = self->fActivityEndTime;
  *((void *)&v18 + 1) = v8;
  double v19 = fActivityEndTime;
  long long v9 = *(_OWORD *)&self->fHrMax;
  *(_OWORD *)&v22[8] = *(_OWORD *)&self->fHrRecovery;
  fWorkoutSessionId = self->fWorkoutSessionId;
  *(void *)v22 = self->fWorkoutType;
  *(_DWORD *)&v22[56] = self->fStatus;
  uint64_t v20 = 0;
  long long v21 = 0uLL;
  *(_OWORD *)&v22[24] = v9;
  *(_OWORD *)&v22[40] = *(_OWORD *)&self->fRecoveryOnsetTime;
  long long v23 = *(_OWORD *)&self->fSessionHrRecovery;
  long long v24 = *(unint64_t *)&self->fHrRecoveryReference;
  *(void *)&long long v25 = 0;
  WORD4(v25) = 0;
  objc_msgSend_getUUIDBytes_(fWorkoutSessionId, v11, (uint64_t)&v21);
  double v12 = objc_opt_class();
  uint64_t v14 = objc_msgSend_allocWithZone_(v12, v13, (uint64_t)a3);
  v17[6] = *(_OWORD *)&v22[48];
  v17[7] = v23;
  v17[8] = v24;
  v17[9] = v25;
  v17[2] = v21;
  v17[3] = *(_OWORD *)v22;
  v17[4] = *(_OWORD *)&v22[16];
  v17[5] = *(_OWORD *)&v22[32];
  v17[0] = v18;
  v17[1] = *(unint64_t *)&v19;
  return (id)objc_msgSend_initWithSample_(v14, v15, (uint64_t)v17);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMRecoverySessionCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMRecoverySessionCodingKeyStartDate");
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMRecoverySessionCodingKeyActivityEndTime", self->fActivityEndTime);
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fWorkoutSessionId, @"kCMRecoverySessionCodingKeyWorkoutSessionId");
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->fWorkoutType, @"kCMRecoverySessionCodingKeyWorkoutType");
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"kCMRecoverySessionCodingKeyHRRecovery", self->fHrRecovery);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMRecoverySessionCodingKeyLambda", self->fLambda);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"kCMRecoverySessionCodingKeyHRMax", self->fHrMax);
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"kCMRecoverySessionCodingKeyHRMinAdjusted", self->fHrMinAdjusted);
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"kCMRecoverySessionCodingKeyRecoveryOnsetTime", self->fRecoveryOnsetTime);
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMRecoverySessionCodingKeySteadyStateHR", self->fSteadyStateHR);
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->fStatus, @"kCMRecoverySessionCodingKeyStatus");
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"kCMRecoverySessionCodingKeySessionHRRecovery", self->fHrRecovery);
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"kCMRecoverySessionCodingKeyPeakHR", self->fPeakHR);
  double fHrRecoveryReference = self->fHrRecoveryReference;

  objc_msgSend_encodeDouble_forKey_(a3, v18, @"kCMRecoverySessionCodingKeyHRRecoveryReference", fHrRecoveryReference);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v7 = objc_msgSend_recordId(self, v5, v6);
  if (v7 != objc_msgSend_recordId(a3, v8, v9)) {
    goto LABEL_21;
  }
  if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
    || (started = objc_msgSend_startDate(self, v12, v13),
        uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
        (int isEqual = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
  {
    if (!objc_msgSend_workoutSessionId(self, v12, v13) && !objc_msgSend_workoutSessionId(a3, v20, v21)
      || (v22 = objc_msgSend_workoutSessionId(self, v20, v21),
          uint64_t v25 = objc_msgSend_workoutSessionId(a3, v23, v24),
          (int isEqual = objc_msgSend_isEqual_(v22, v26, v25)) != 0))
    {
      objc_msgSend_activityEndTime(self, v20, v21);
      double v28 = v27;
      objc_msgSend_activityEndTime(a3, v29, v30);
      if (v28 == v33)
      {
        uint64_t v34 = objc_msgSend_workoutType(self, v31, v32);
        if (v34 == objc_msgSend_workoutType(a3, v35, v36))
        {
          objc_msgSend_hrRecovery(self, v37, v38);
          double v40 = v39;
          objc_msgSend_hrRecovery(a3, v41, v42);
          if (v40 == v45)
          {
            objc_msgSend_lambda(self, v43, v44);
            double v47 = v46;
            objc_msgSend_lambda(a3, v48, v49);
            if (v47 == v52)
            {
              objc_msgSend_hrMax(self, v50, v51);
              double v54 = v53;
              objc_msgSend_hrMax(a3, v55, v56);
              if (v54 == v59)
              {
                objc_msgSend_hrMinAdjusted(self, v57, v58);
                double v61 = v60;
                objc_msgSend_hrMinAdjusted(a3, v62, v63);
                if (v61 == v66)
                {
                  objc_msgSend_recoveryOnsetTime(self, v64, v65);
                  double v68 = v67;
                  objc_msgSend_recoveryOnsetTime(a3, v69, v70);
                  if (v68 == v73)
                  {
                    objc_msgSend_steadyStateHR(self, v71, v72);
                    double v75 = v74;
                    objc_msgSend_steadyStateHR(a3, v76, v77);
                    if (v75 == v80)
                    {
                      uint64_t v81 = objc_msgSend_status(self, v78, v79);
                      if (v81 == objc_msgSend_status(a3, v82, v83))
                      {
                        objc_msgSend_hrRecovery(self, v84, v85);
                        double v87 = v86;
                        objc_msgSend_hrRecovery(a3, v88, v89);
                        if (v87 == v92)
                        {
                          objc_msgSend_peakHR(self, v90, v91);
                          double v94 = v93;
                          objc_msgSend_peakHR(a3, v95, v96);
                          if (v94 == v99)
                          {
                            objc_msgSend_hrRecoveryReference(self, v97, v98);
                            double v101 = v100;
                            objc_msgSend_hrRecoveryReference(a3, v102, v103);
                            LOBYTE(isEqual) = v101 == v104;
                            return isEqual;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_21:
      LOBYTE(isEqual) = 0;
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

- (double)activityEndTime
{
  return self->fActivityEndTime;
}

- (NSUUID)workoutSessionId
{
  return self->fWorkoutSessionId;
}

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (double)hrRecovery
{
  return self->fHrRecovery;
}

- (double)lambda
{
  return self->fLambda;
}

- (double)hrMax
{
  return self->fHrMax;
}

- (double)hrMinAdjusted
{
  return self->fHrMinAdjusted;
}

- (double)recoveryOnsetTime
{
  return self->fRecoveryOnsetTime;
}

- (double)steadyStateHR
{
  return self->fSteadyStateHR;
}

- (int64_t)status
{
  return self->fStatus;
}

- (double)sessionHrRecovery
{
  return self->fSessionHrRecovery;
}

- (double)peakHR
{
  return self->fPeakHR;
}

- (double)hrRecoveryReference
{
  return self->fHrRecoveryReference;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  double v12 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend_activityEndTime(self, v13, v14);
  uint64_t v17 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v12, v15, v16);
  uint64_t v20 = objc_msgSend_workoutSessionId(self, v18, v19);
  uint64_t v23 = objc_msgSend_UUIDString(v20, v21, v22);
  uint64_t v26 = objc_msgSend_workoutType(self, v24, v25);
  objc_msgSend_hrRecovery(self, v27, v28);
  uint64_t v30 = v29;
  objc_msgSend_lambda(self, v31, v32);
  uint64_t v34 = v33;
  objc_msgSend_hrMax(self, v35, v36);
  uint64_t v38 = v37;
  objc_msgSend_hrMinAdjusted(self, v39, v40);
  uint64_t v42 = v41;
  v43 = (void *)MEMORY[0x1E4F1C9C8];
  objc_msgSend_recoveryOnsetTime(self, v44, v45);
  uint64_t v48 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v43, v46, v47);
  objc_msgSend_steadyStateHR(self, v49, v50);
  uint64_t v52 = v51;
  uint64_t v55 = objc_msgSend_status(self, v53, v54);
  objc_msgSend_sessionHrRecovery(self, v56, v57);
  uint64_t v59 = v58;
  objc_msgSend_peakHR(self, v60, v61);
  uint64_t v63 = v62;
  objc_msgSend_hrRecoveryReference(self, v64, v65);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v66, @"%@, <recordId, %lu, startDate, %@, activityEndTime, %@, workoutSessionId %@, workoutType, %lu, hrRecovery, %f, lambda, %f, hrMax, %f, hrMinAdjusted, %f, recoveryOnsetTime, %@, steadyStateHR, %f, status, %lu, sessionHrRecovery, %f, peakHR, %f, hrRecoveryReference, %f>", v5, v8, started, v17, v23, v26, v30, v34, v38, v42, v48, v52, v55, v59, v63, v67);
}

+ (HRRecoverySession)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  double v6 = sqlite3_column_double(a4, 2);
  *(void *)retstr->var4 = 0;
  var4 = retstr->var4;
  *((double *)var4 - 2) = v6;
  *((void *)var4 - 1) = 0;
  *((void *)var4 + 1) = 0;
  *((void *)var4 + 2) = sqlite3_column_int(a4, 4);
  *((double *)var4 + 3) = sqlite3_column_double(a4, 5);
  *((double *)var4 + 4) = sqlite3_column_double(a4, 6);
  *((double *)var4 + 5) = sqlite3_column_double(a4, 7);
  *((double *)var4 + 6) = sqlite3_column_double(a4, 8);
  *((double *)var4 + 7) = sqlite3_column_double(a4, 9);
  *((double *)var4 + 8) = sqlite3_column_double(a4, 10);
  *((_DWORD *)var4 + 18) = sqlite3_column_int(a4, 11);
  *((double *)var4 + 10) = sqlite3_column_double(a4, 12);
  *((double *)var4 + 11) = sqlite3_column_double(a4, 13);
  *((double *)var4 + 12) = sqlite3_column_double(a4, 14);
  *((void *)var4 + 13) = 0;
  *((void *)var4 + 14) = 0;
  *((_WORD *)var4 + 60) = 0;
  uint64_t v8 = sqlite3_column_text(a4, 3);

  return (HRRecoverySession *)uuid_parse((const char *)v8, var4);
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMRecoverySession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMRecoverySession;
    uint64_t v7 = [(CMRecoverySession *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        double v12 = (void *)v11;

        return (CMRecoverySession *)v12;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

@end