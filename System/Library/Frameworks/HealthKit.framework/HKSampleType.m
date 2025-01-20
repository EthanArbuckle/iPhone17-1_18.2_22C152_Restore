@interface HKSampleType
+ (id)_sampleTypeWithCode:(int64_t)a3;
+ (id)medicalRecordTypes;
+ (id)medicalRecordTypesWithOptions:(unint64_t)a3;
- (BOOL)_supportsRelativeDataCalculation;
- (BOOL)_validateStartDate:(double)a3 endDate:(double)a4 error:(id *)a5;
- (BOOL)allowsRecalibrationForEstimates;
- (BOOL)canAttachFileOfType:(id)a3 size:(unint64_t)a4 error:(id *)a5;
- (BOOL)hk_validateMetadata:(id)a3 sample:(id)a4 error:(id *)a5;
- (BOOL)isMaximumDurationRestricted;
- (BOOL)isMinimumDurationRestricted;
- (BOOL)supportsAttachments;
- (NSTimeInterval)maximumAllowedDuration;
- (NSTimeInterval)minimumAllowedDuration;
- (id)_earliestAllowedStartDateForSampleOverlappingDate:(id)a3;
- (id)_rollingBaselineConfiguration;
- (id)_unitForChangeInCanonicalUnit;
@end

@implementation HKSampleType

- (BOOL)hk_validateMetadata:(id)a3 sample:(id)a4 error:(id *)a5
{
  id v7 = a3;
  int64_t v8 = [(HKObjectType *)self code];
  if (v8 == 95)
  {
    if (!v7
      || ([v7 objectForKey:@"HKMenstrualCycleStart"],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      v10 = @"Type %@ is missing a required metadata key (required keys: HKMetadataKeyMenstrualCycleStart)";
      goto LABEL_10;
    }
  }
  else if (v8 == 125)
  {
    if (!v7
      || ([v7 objectForKey:@"HKInsulinDeliveryReason"],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      v10 = @"Type %@ is missing a required metadata key (required keys: HKMetadataKeyInsulinDeliveryReason)";
LABEL_10:
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, v10, self);
      BOOL v12 = 0;
      goto LABEL_11;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (id)medicalRecordTypes
{
  return +[HKSampleType medicalRecordTypesWithOptions:0];
}

+ (id)medicalRecordTypesWithOptions:(unint64_t)a3
{
  char v20 = a3;
  v23[11] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v22 = +[HKAllergyRecordType allergyRecordType];
  v23[0] = v22;
  v21 = +[HKClinicalNoteRecordType clinicalNoteRecordType];
  v23[1] = v21;
  v19 = +[HKConditionRecordType conditionRecordType];
  v23[2] = v19;
  v4 = +[HKCoverageRecordType coverageRecordType];
  v23[3] = v4;
  v5 = +[HKDiagnosticTestReportType diagnosticTestReportType];
  v23[4] = v5;
  v6 = +[HKDiagnosticTestResultType diagnosticTestResultType];
  v23[5] = v6;
  id v7 = +[HKMedicationDispenseRecordType medicationDispenseRecordType];
  v23[6] = v7;
  int64_t v8 = +[HKMedicationOrderType medicationOrderType];
  v23[7] = v8;
  v9 = +[HKMedicationRecordType medicationRecordType];
  v23[8] = v9;
  v10 = +[HKProcedureRecordType procedureRecordType];
  v23[9] = v10;
  v11 = +[HKVaccinationRecordType vaccinationRecordType];
  v23[10] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:11];
  v13 = [v3 arrayWithArray:v12];

  if (v20)
  {
    v17 = +[HKUnknownRecordType unknownRecordType];
    [v13 addObject:v17];

    if ((v20 & 4) == 0)
    {
LABEL_3:
      if ((v20 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v20 & 4) == 0)
  {
    goto LABEL_3;
  }
  v18 = +[HKSignedClinicalDataRecordType signedClinicalDataRecordType];
  [v13 addObject:v18];

  if ((v20 & 2) != 0)
  {
LABEL_4:
    v14 = +[HKAccountOwnerType accountOwnerType];
    [v13 addObject:v14];
  }
LABEL_5:
  v15 = (void *)[v13 copy];

  return v15;
}

+ (id)_sampleTypeWithCode:(int64_t)a3
{
  v3 = [a1 dataTypeWithCode:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSTimeInterval)maximumAllowedDuration
{
  double v3 = HKMaximumSampleDurationForType([(HKObjectType *)self code]);
  if (v3 == -1.0)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    v6 = [(HKObjectType *)self identifier];
    [v4 raise:v5, @"Data type %@ is not duration restricted", v6 format];
  }
  return v3;
}

- (NSTimeInterval)minimumAllowedDuration
{
  double v3 = HKMinimumSampleDurationForType([(HKObjectType *)self code]);
  if (v3 == -1.0)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    v6 = [(HKObjectType *)self identifier];
    [v4 raise:v5, @"Data type %@ is not duration restricted", v6 format];
  }
  return v3;
}

- (BOOL)isMinimumDurationRestricted
{
  return HKMinimumSampleDurationForType([(HKObjectType *)self code]) > 0.0;
}

- (BOOL)isMaximumDurationRestricted
{
  return HKMaximumSampleDurationForType([(HKObjectType *)self code]) != -1.0;
}

- (BOOL)allowsRecalibrationForEstimates
{
  return [(HKObjectType *)self code] == 183;
}

- (BOOL)_validateStartDate:(double)a3 endDate:(double)a4 error:(id *)a5
{
  if (a3 == 2.22507386e-308 || a4 == 2.22507386e-308)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Missing start or end time", v17);
    return 0;
  }
  if (a3 > a4)
  {
    int64_t v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
    objc_msgSend(v8, "hk_assignError:code:format:", a5, 3, @"startDate (%@) cannot occur after endDate (%@)", v9, v10);

    return 0;
  }
  if (!HKProgramSDKAtLeast()) {
    return 1;
  }
  v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;

  if (v15 > a4) {
    return 1;
  }
  int64_t v16 = [(HKObjectType *)self code];
  BOOL result = 1;
  if ((unint64_t)(v16 - 191) >= 3 && v16 != 109 && v16 != 257)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"Type %@ can not have endDate of NSDate.distantFuture", objc_opt_class());
    return 0;
  }
  return result;
}

- (id)_earliestAllowedStartDateForSampleOverlappingDate:(id)a3
{
  id v4 = a3;
  if ([(HKSampleType *)self isMaximumDurationRestricted])
  {
    [(HKSampleType *)self maximumAllowedDuration];
    v6 = [v4 dateByAddingTimeInterval:-v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_supportsRelativeDataCalculation
{
  double v3 = [(HKSampleType *)self _rollingBaselineConfiguration];
  if (v3)
  {
    id v4 = [(HKSampleType *)self _unitForChangeInCanonicalUnit];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_rollingBaselineConfiguration
{
  if ([(HKObjectType *)self code] == 256) {
    v2 = [[HKRollingBaselineConfiguration alloc] initWithMinimumSampleCount:5 maximumSampleCount:50 maximumWindowDuration:1 options:31536000.0];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)_unitForChangeInCanonicalUnit
{
  if ([(HKObjectType *)self code] == 256)
  {
    v2 = +[HKUnit _changeInDegreeCelsiusUnit];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)supportsAttachments
{
  return [(HKObjectType *)self code] == 257;
}

- (BOOL)canAttachFileOfType:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(HKObjectType *)self code] != 257) {
    goto LABEL_9;
  }
  v9 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"heic"];
  int v10 = [v8 conformsToType:v9];

  if (v10) {
    goto LABEL_8;
  }
  v11 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"img"];
  int v12 = [v8 conformsToType:v11];

  if (v12) {
    goto LABEL_8;
  }
  v13 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"jpeg"];
  int v14 = [v8 conformsToType:v13];

  if (v14) {
    goto LABEL_8;
  }
  double v15 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"pdf"];
  int v16 = [v8 conformsToType:v15];

  if (v16) {
    goto LABEL_8;
  }
  uint64_t v17 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"png"];
  int v18 = [v8 conformsToType:v17];

  if (v18
    || ([MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"tiff"],
        v19 = objc_claimAutoreleasedReturnValue(),
        int v20 = [v8 conformsToType:v19],
        v19,
        v20))
  {
LABEL_8:
    BOOL v21 = _HKValidateFileSize(a4, a5);
  }
  else
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Content Type is not supported");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (a5) {
        *a5 = v22;
      }
      else {
        _HKLogDroppedError(v22);
      }
    }

    BOOL v21 = 0;
  }

  return v21;
}

@end