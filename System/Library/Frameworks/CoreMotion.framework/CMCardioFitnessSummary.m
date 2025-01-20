@interface CMCardioFitnessSummary
+ (BOOL)supportsSecureCoding;
+ (VO2MaxSummary)inputFromPreparedStatement:(SEL)a3;
- (BOOL)isEqual:(id)a3;
- (CMCardioFitnessSummary)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (CMCardioFitnessSummary)initWithCoder:(id)a3;
- (CMCardioFitnessSummary)initWithRecordId:(unint64_t)a3 startDate:(id)a4 workoutType:(int64_t)a5 sessionId:(id)a6 durationInSeconds:(double)a7 pointCount:(unint64_t)a8 hrMax:(double)a9 hrMin:(double)a10 meanHr:(double)a11 meanVo2:(double)a12 meanSpeed:(double)a13 meanGrade:(double)a14 meanHrConfidence:(double)a15 meanHrCadenceAgreement:(double)a16 meanCadence:(double)a17 vo2MaxModelSource:(int64_t)a18 sessionType:(int64_t)a19;
- (CMCardioFitnessSummary)initWithSample:(VO2MaxSummary *)a3;
- (NSDate)startDate;
- (NSString)description;
- (NSUUID)sessionId;
- (double)durationInSeconds;
- (double)hrMax;
- (double)hrMin;
- (double)meanCadence;
- (double)meanGrade;
- (double)meanHr;
- (double)meanHrCadenceAgreement;
- (double)meanHrConfidence;
- (double)meanMaxMets;
- (double)meanSpeed;
- (double)meanVo2;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (int64_t)sessionType;
- (int64_t)vo2MaxModelSource;
- (int64_t)workoutType;
- (unint64_t)pointCount;
- (unint64_t)recordId;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMCardioFitnessSummary

- (id)sr_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (CMCardioFitnessSummary)initWithRecordId:(unint64_t)a3 startDate:(id)a4 workoutType:(int64_t)a5 sessionId:(id)a6 durationInSeconds:(double)a7 pointCount:(unint64_t)a8 hrMax:(double)a9 hrMin:(double)a10 meanHr:(double)a11 meanVo2:(double)a12 meanSpeed:(double)a13 meanGrade:(double)a14 meanHrConfidence:(double)a15 meanHrCadenceAgreement:(double)a16 meanCadence:(double)a17 vo2MaxModelSource:(int64_t)a18 sessionType:(int64_t)a19
{
  v36.receiver = self;
  v36.super_class = (Class)CMCardioFitnessSummary;
  v33 = [(CMCardioFitnessSummary *)&v36 init];
  v34 = v33;
  if (v33)
  {
    v33->fRecordId = a3;
    v33->fStartDate = (NSDate *)a4;
    v34->fWorkoutType = a5;
    v34->fSessionId = (NSUUID *)a6;
    v34->fDurationInSeconds = a7;
    v34->fPointCount = a8;
    v34->fHRMax = a9;
    v34->fHRMin = a10;
    v34->fMeanHr = a11;
    v34->fMeanVo2 = a12;
    v34->fMeanSpeed = a13;
    v34->fMeanGrade = a14;
    v34->fMeanHrConfidence = a15;
    v34->fMeanHrCadenceAgreement = a16;
    v34->fMeanCadence = a17;
    v34->fVo2MaxModelSource = a18;
    v34->fSessionType = a19;
  }
  return v34;
}

- (CMCardioFitnessSummary)initWithSample:(VO2MaxSummary *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CMCardioFitnessSummary;
  v4 = [(CMCardioFitnessSummary *)&v14 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v7 = objc_msgSend_initWithUUIDBytes_(v5, v6, (uint64_t)a3->var3);
    v4->fRecordId = a3->var0;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v4->fStartDate = (NSDate *)objc_msgSend_initWithTimeIntervalSinceReferenceDate_(v8, v9, v10, a3->var1);
    v4->fWorkoutType = a3->var2;
    v4->fSessionId = (NSUUID *)v7;
    v4->fDurationInSeconds = a3->var4;
    v4->fPointCount = a3->var5;
    v4->fHRMax = a3->var7;
    v4->fHRMin = a3->var6;
    v4->fMeanHr = a3->var8;
    v4->fMeanVo2 = a3->var11;
    v4->fMeanSpeed = a3->var12;
    v4->fMeanGrade = a3->var13;
    v4->fMeanHrConfidence = a3->var9;
    v4->fMeanHrCadenceAgreement = a3->var10;
    v4->fMeanCadence = a3->var14;
    uint64_t v11 = *(void *)&a3->var21;
    *(void *)&long long v12 = (int)v11;
    *((void *)&v12 + 1) = SHIDWORD(v11);
    *(_OWORD *)&v4->fVo2MaxModelSource = v12;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMCardioFitnessSummary;
  [(CMCardioFitnessSummary *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCardioFitnessSummary)initWithCoder:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)CMCardioFitnessSummary;
  id v5 = [(CMCardioFitnessSummary *)&v38 init];
  if (v5)
  {
    v5->fRecordId = objc_msgSend_decodeIntegerForKey_(a3, v4, @"kCMCardioFitnessSummaryCodingKeyRecordId");
    uint64_t v6 = objc_opt_class();
    id v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"kCMCardioFitnessSummaryCodingKeyStartDate");
    v5->fStartDate = (NSDate *)objc_msgSend_copy(v8, v9, v10);
    v5->fWorkoutType = objc_msgSend_decodeIntegerForKey_(a3, v11, @"kCMCardioFitnessSummaryCodingKeyWorkoutType");
    uint64_t v12 = objc_opt_class();
    v5->fSessionId = (NSUUID *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"kCMCardioFitnessSummaryCodingKeySessionId");
    objc_msgSend_decodeDoubleForKey_(a3, v14, @"kCMCardioFitnessSummaryCodingKeyDurationInSeconds");
    v5->fDurationInSeconds = v15;
    v5->fPointCount = objc_msgSend_decodeInt64ForKey_(a3, v16, @"kCMCardioFitnessSummaryCodingKeyPointCount");
    objc_msgSend_decodeDoubleForKey_(a3, v17, @"kCMCardioFitnessSummaryCodingKeyHRMax");
    v5->fHRMax = v18;
    objc_msgSend_decodeDoubleForKey_(a3, v19, @"kCMCardioFitnessSummaryCodingKeyHRMin");
    v5->fHRMin = v20;
    objc_msgSend_decodeDoubleForKey_(a3, v21, @"kCMCardioFitnessSummaryCodingKeyMeanHR");
    v5->fMeanHr = v22;
    objc_msgSend_decodeDoubleForKey_(a3, v23, @"kCMCardioFitnessSummaryCodingKeyMeanVO2");
    v5->fMeanVo2 = v24;
    objc_msgSend_decodeDoubleForKey_(a3, v25, @"kCMCardioFitnessSummaryCodingKeyMeanSpeed");
    v5->fMeanSpeed = v26;
    objc_msgSend_decodeDoubleForKey_(a3, v27, @"kCMCardioFitnessSummaryCodingKeyMeanGrade");
    v5->fMeanGrade = v28;
    objc_msgSend_decodeDoubleForKey_(a3, v29, @"kCMCardioFitnessSummaryCodingKeyMeanHRConfidence");
    v5->fMeanHrConfidence = v30;
    objc_msgSend_decodeDoubleForKey_(a3, v31, @"kCMCardioFitnessSummaryCodingKeyMeanHRCadenceAgreement");
    v5->fMeanHrCadenceAgreement = v32;
    objc_msgSend_decodeDoubleForKey_(a3, v33, @"kCMCardioFitnessSummaryCodingKeyMeanCadence");
    v5->fMeanCadence = v34;
    v5->fVo2MaxModelSource = objc_msgSend_decodeIntegerForKey_(a3, v35, @"kCMCardioFitnessSummaryCodingKeyVO2MaxModelSource");
    v5->fSessionType = objc_msgSend_decodeIntegerForKey_(a3, v36, @"kCMCardioFitnessSummaryCodingKeySessionType");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t fRecordId = self->fRecordId;
  fStartDate = self->fStartDate;
  *(void *)&long long v17 = fRecordId;
  objc_msgSend_timeIntervalSinceReferenceDate(fStartDate, a2, (uint64_t)a3);
  *((void *)&v17 + 1) = v7;
  *(void *)&long long v19 = 0;
  long long v18 = 0uLL;
  *((void *)&v19 + 1) = *(void *)&self->fDurationInSeconds;
  *(void *)double v20 = self->fPointCount;
  *(int8x16_t *)&v20[8] = vextq_s8(*(int8x16_t *)&self->fHRMax, *(int8x16_t *)&self->fHRMax, 8uLL);
  *(double *)&v20[24] = self->fMeanHr;
  long long v8 = *(_OWORD *)&self->fMeanVo2;
  long long v21 = *(_OWORD *)&self->fMeanHrConfidence;
  long long v22 = v8;
  *(double *)&long long v8 = self->fMeanCadence;
  *(double *)&long long v23 = self->fMeanGrade;
  *((void *)&v23 + 1) = v8;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  int32x2_t v27 = vmovn_s64(*(int64x2_t *)&self->fVo2MaxModelSource);
  objc_msgSend_getUUIDBytes_(self->fSessionId, v9, (uint64_t)&v18 + 8);
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = objc_msgSend_allocWithZone_(v10, v11, (uint64_t)a3);
  v15[8] = v24;
  v15[9] = v25;
  v15[10] = v26;
  int32x2_t v16 = v27;
  v15[4] = *(_OWORD *)&v20[16];
  v15[5] = v21;
  v15[6] = v22;
  v15[7] = v23;
  v15[0] = v17;
  v15[1] = v18;
  v15[2] = v19;
  v15[3] = *(_OWORD *)v20;
  return (id)objc_msgSend_initWithSample_(v12, v13, (uint64_t)v15);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->fRecordId, @"kCMCardioFitnessSummaryCodingKeyRecordId");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fStartDate, @"kCMCardioFitnessSummaryCodingKeyStartDate");
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fWorkoutType, @"kCMCardioFitnessSummaryCodingKeyWorkoutType");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fSessionId, @"kCMCardioFitnessSummaryCodingKeySessionId");
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCMCardioFitnessSummaryCodingKeyDurationInSeconds", self->fDurationInSeconds);
  objc_msgSend_encodeInt64_forKey_(a3, v9, self->fPointCount, @"kCMCardioFitnessSummaryCodingKeyPointCount");
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"kCMCardioFitnessSummaryCodingKeyHRMax", self->fHRMax);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"kCMCardioFitnessSummaryCodingKeyHRMin", self->fHRMin);
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"kCMCardioFitnessSummaryCodingKeyMeanHR", self->fMeanHr);
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"kCMCardioFitnessSummaryCodingKeyMeanVO2", self->fMeanVo2);
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"kCMCardioFitnessSummaryCodingKeyMeanSpeed", self->fMeanSpeed);
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"kCMCardioFitnessSummaryCodingKeyMeanGrade", self->fMeanGrade);
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"kCMCardioFitnessSummaryCodingKeyMeanHRConfidence", self->fMeanHrConfidence);
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"kCMCardioFitnessSummaryCodingKeyMeanHRCadenceAgreement", self->fMeanHrCadenceAgreement);
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"kCMCardioFitnessSummaryCodingKeyMeanCadence", self->fMeanCadence);
  objc_msgSend_encodeInteger_forKey_(a3, v19, SLODWORD(self->fVo2MaxModelSource), @"kCMCardioFitnessSummaryCodingKeyVO2MaxModelSource");
  uint64_t fSessionType_low = SLODWORD(self->fSessionType);

  objc_msgSend_encodeInteger_forKey_(a3, v20, fSessionType_low, @"kCMCardioFitnessSummaryCodingKeySessionType");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v7 = objc_msgSend_recordId(self, v5, v6);
  if (v7 != objc_msgSend_recordId(a3, v8, v9)) {
    goto LABEL_23;
  }
  if (!objc_msgSend_startDate(self, v10, v11) && !objc_msgSend_startDate(a3, v12, v13)
    || (started = objc_msgSend_startDate(self, v12, v13),
        uint64_t v17 = objc_msgSend_startDate(a3, v15, v16),
        (int isEqual = objc_msgSend_isEqualToDate_(started, v18, v17)) != 0))
  {
    if (!objc_msgSend_sessionId(self, v12, v13) && !objc_msgSend_sessionId(a3, v20, v21)
      || (long long v22 = objc_msgSend_sessionId(self, v20, v21),
          uint64_t v25 = objc_msgSend_sessionId(a3, v23, v24),
          (int isEqual = objc_msgSend_isEqual_(v22, v26, v25)) != 0))
    {
      uint64_t v27 = objc_msgSend_workoutType(self, v20, v21);
      if (v27 == objc_msgSend_workoutType(a3, v28, v29))
      {
        objc_msgSend_durationInSeconds(self, v30, v31);
        double v33 = v32;
        objc_msgSend_durationInSeconds(a3, v34, v35);
        if (v33 == v38)
        {
          uint64_t v39 = objc_msgSend_pointCount(self, v36, v37);
          if (v39 == objc_msgSend_pointCount(a3, v40, v41))
          {
            objc_msgSend_hrMax(self, v42, v43);
            double v45 = v44;
            objc_msgSend_hrMax(a3, v46, v47);
            if (v45 == v50)
            {
              objc_msgSend_hrMin(self, v48, v49);
              double v52 = v51;
              objc_msgSend_hrMin(a3, v53, v54);
              if (v52 == v57)
              {
                objc_msgSend_meanHr(self, v55, v56);
                double v59 = v58;
                objc_msgSend_meanHr(a3, v60, v61);
                if (v59 == v64)
                {
                  objc_msgSend_meanVo2(self, v62, v63);
                  double v66 = v65;
                  objc_msgSend_meanVo2(a3, v67, v68);
                  if (v66 == v71)
                  {
                    objc_msgSend_meanSpeed(self, v69, v70);
                    double v73 = v72;
                    objc_msgSend_meanSpeed(a3, v74, v75);
                    if (v73 == v78)
                    {
                      objc_msgSend_meanGrade(self, v76, v77);
                      double v80 = v79;
                      objc_msgSend_meanGrade(a3, v81, v82);
                      if (v80 == v85)
                      {
                        objc_msgSend_meanHrConfidence(self, v83, v84);
                        double v87 = v86;
                        objc_msgSend_meanHrConfidence(a3, v88, v89);
                        if (v87 == v92)
                        {
                          objc_msgSend_meanHrCadenceAgreement(self, v90, v91);
                          double v94 = v93;
                          objc_msgSend_meanHrCadenceAgreement(a3, v95, v96);
                          if (v94 == v99)
                          {
                            objc_msgSend_meanCadence(self, v97, v98);
                            double v101 = v100;
                            objc_msgSend_meanCadence(a3, v102, v103);
                            if (v101 == v106)
                            {
                              uint64_t v107 = objc_msgSend_vo2MaxModelSource(self, v104, v105);
                              if (v107 == objc_msgSend_vo2MaxModelSource(a3, v108, v109))
                              {
                                uint64_t v112 = objc_msgSend_sessionType(self, v110, v111);
                                LOBYTE(isEqual) = v112 == objc_msgSend_sessionType(a3, v113, v114);
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
        }
      }
LABEL_23:
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

- (int64_t)workoutType
{
  return self->fWorkoutType;
}

- (NSUUID)sessionId
{
  return self->fSessionId;
}

- (double)durationInSeconds
{
  return self->fDurationInSeconds;
}

- (unint64_t)pointCount
{
  return self->fPointCount;
}

- (double)hrMax
{
  return self->fHRMax;
}

- (double)hrMin
{
  return self->fHRMin;
}

- (double)meanHr
{
  return self->fMeanHr;
}

- (double)meanVo2
{
  return self->fMeanVo2;
}

- (double)meanSpeed
{
  return self->fMeanSpeed;
}

- (double)meanGrade
{
  return self->fMeanGrade;
}

- (double)meanHrConfidence
{
  return self->fMeanHrConfidence;
}

- (double)meanHrCadenceAgreement
{
  return self->fMeanHrCadenceAgreement;
}

- (double)meanCadence
{
  return self->fMeanCadence;
}

- (int64_t)vo2MaxModelSource
{
  return self->fVo2MaxModelSource;
}

- (int64_t)sessionType
{
  return self->fSessionType;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_recordId(self, v6, v7);
  uint64_t started = objc_msgSend_startDate(self, v9, v10);
  uint64_t v14 = objc_msgSend_workoutType(self, v12, v13);
  uint64_t v17 = objc_msgSend_sessionId(self, v15, v16);
  uint64_t v20 = objc_msgSend_UUIDString(v17, v18, v19);
  objc_msgSend_durationInSeconds(self, v21, v22);
  uint64_t v71 = v23;
  uint64_t v26 = objc_msgSend_pointCount(self, v24, v25);
  objc_msgSend_hrMax(self, v27, v28);
  uint64_t v70 = v29;
  objc_msgSend_hrMin(self, v30, v31);
  uint64_t v33 = v32;
  objc_msgSend_meanHr(self, v34, v35);
  uint64_t v37 = v36;
  objc_msgSend_meanVo2(self, v38, v39);
  uint64_t v41 = v40;
  objc_msgSend_meanSpeed(self, v42, v43);
  uint64_t v45 = v44;
  objc_msgSend_meanGrade(self, v46, v47);
  uint64_t v49 = v48;
  objc_msgSend_meanHrConfidence(self, v50, v51);
  uint64_t v53 = v52;
  objc_msgSend_meanHrCadenceAgreement(self, v54, v55);
  uint64_t v57 = v56;
  objc_msgSend_meanCadence(self, v58, v59);
  uint64_t v61 = v60;
  uint64_t v64 = objc_msgSend_vo2MaxModelSource(self, v62, v63);
  uint64_t v67 = objc_msgSend_sessionType(self, v65, v66);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v68, @"%@, <recordId, %lu, startDate, %@, workoutType, %ld, sessionId, %@, durationInSeconds, %f, pointCount, %llu, hrMax, %f, hrMin, %f, meanHr, %f, meanVo2, %f, meanSpeed, %f, meanGrade, %f, meanHrConfidence, %f, meanHrCadenceAgreement, %f, meanCadence, %f, vo2MaxModelSource, %ld, sessionType, %ld>", v5, v8, started, v14, v20, v71, v26, v70, v33, v37, v41, v45, v49, v53, v57, v61,
                       v64,
                       v67);
}

+ (VO2MaxSummary)inputFromPreparedStatement:(SEL)a3
{
  retstr->var0 = sqlite3_column_int(a4, 0);
  retstr->var1 = sqlite3_column_double(a4, 1);
  int v6 = sqlite3_column_int(a4, 2);
  *(void *)retstr->var3 = 0;
  var3 = retstr->var3;
  *((void *)var3 - 1) = v6;
  *((void *)var3 + 1) = 0;
  *((double *)var3 + 2) = sqlite3_column_double(a4, 4);
  *((void *)var3 + 3) = sqlite3_column_int(a4, 5);
  *((double *)var3 + 4) = sqlite3_column_double(a4, 7);
  *((double *)var3 + 5) = sqlite3_column_double(a4, 6);
  *((double *)var3 + 6) = sqlite3_column_double(a4, 8);
  *((double *)var3 + 7) = sqlite3_column_double(a4, 12);
  *((double *)var3 + 8) = sqlite3_column_double(a4, 13);
  *((double *)var3 + 9) = sqlite3_column_double(a4, 9);
  *((double *)var3 + 10) = sqlite3_column_double(a4, 10);
  *((double *)var3 + 11) = sqlite3_column_double(a4, 11);
  *((double *)var3 + 12) = sqlite3_column_double(a4, 14);
  *(_OWORD *)(var3 + 104) = 0u;
  *(_OWORD *)(var3 + 120) = 0u;
  *(_OWORD *)(var3 + 136) = 0u;
  *((_DWORD *)var3 + 38) = sqlite3_column_int(a4, 15);
  *((_DWORD *)var3 + 39) = sqlite3_column_int(a4, 16);
  uint64_t v8 = sqlite3_column_text(a4, 3);

  return (VO2MaxSummary *)uuid_parse((const char *)v8, var3);
}

- (double)meanMaxMets
{
  return self->_meanMaxMets;
}

- (id)binarySampleRepresentation
{
  objc_super v3 = (void *)MEMORY[0x192FCD2F0](self, a2);
  id v5 = (id)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], v4, (uint64_t)self, 1, 0);

  return v5;
}

- (CMCardioFitnessSummary)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend_length(a3, a2, (uint64_t)a3, a4, a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)CMCardioFitnessSummary;
    uint64_t v7 = [(CMCardioFitnessSummary *)&v14 init];
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v9 = objc_opt_class();
      uint64_t v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v8, v10, v9, a3, 0);
      if (v11)
      {
        uint64_t v12 = (void *)v11;

        return (CMCardioFitnessSummary *)v12;
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