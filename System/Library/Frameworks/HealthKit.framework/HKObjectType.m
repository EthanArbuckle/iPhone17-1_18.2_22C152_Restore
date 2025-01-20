@interface HKObjectType
+ (BOOL)_allowAuthorizationForReadingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5;
+ (BOOL)_allowAuthorizationForSharing:(BOOL)a3 types:(id)a4 entitlements:(id)a5 disallowedTypes:(id)a6;
+ (BOOL)_allowAuthorizationForSharingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (HKActivitySummaryType)activitySummaryType;
+ (HKAudiogramSampleType)audiogramSampleType;
+ (HKCategoryType)categoryTypeForIdentifier:(HKCategoryTypeIdentifier)identifier;
+ (HKCharacteristicType)characteristicTypeForIdentifier:(HKCharacteristicTypeIdentifier)identifier;
+ (HKClinicalType)clinicalTypeForIdentifier:(HKClinicalTypeIdentifier)identifier;
+ (HKCorrelationType)correlationTypeForIdentifier:(HKCorrelationTypeIdentifier)identifier;
+ (HKDocumentType)documentTypeForIdentifier:(HKDocumentTypeIdentifier)identifier;
+ (HKElectrocardiogramType)electrocardiogramType;
+ (HKPrescriptionType)visionPrescriptionType;
+ (HKQuantityType)quantityTypeForIdentifier:(HKQuantityTypeIdentifier)identifier;
+ (HKSeriesType)seriesTypeForIdentifier:(NSString *)identifier;
+ (HKWorkoutType)workoutType;
+ (id)GAD7AssessmentType;
+ (id)PHQ9AssessmentType;
+ (id)_allBinarySampleTypes;
+ (id)_allDataTypeIdentifiers;
+ (id)_allScoredAssessmentTypes;
+ (id)_allTypesOfClass:(Class)a3;
+ (id)_clinicalTypesFromTypes:(id)a3;
+ (id)_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4;
+ (id)_lock_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4;
+ (id)_nonClinicalTypesFromTypes:(id)a3;
+ (id)_objectTypesFromIdentifierArray:(id)a3 error:(id *)a4;
+ (id)_typeWithIdentifier:(id)a3;
+ (id)_typeWithIdentifier:(id)a3 expectedClass:(Class)a4;
+ (id)_typesIncludingParentTypes:(id)a3;
+ (id)accountOwnerTypeForIdentifier:(id)a3;
+ (id)activityCacheType;
+ (id)activityGoalScheduleType;
+ (id)activityMoveModeChangeType;
+ (id)allergyRecordTypeForIdentifier:(id)a3;
+ (id)appleBalanceMetricsType;
+ (id)atrialFibrillationEventType;
+ (id)bloodPressureType;
+ (id)bradycardiaType;
+ (id)briskMinuteDataType;
+ (id)calorieGoal;
+ (id)clinicalNoteRecordTypeForIdentifier:(id)a3;
+ (id)coachingEventType;
+ (id)conditionRecordTypeForIdentifier:(id)a3;
+ (id)contraceptiveType;
+ (id)coverageRecordTypeForIdentifier:(id)a3;
+ (id)dataTypeWithCode:(int64_t)a3;
+ (id)dataTypeWithNumber:(id)a3;
+ (id)deepBreathingSessionType;
+ (id)diagnosticTestReportTypeForIdentifier:(id)a3;
+ (id)diagnosticTestResultTypeForIdentifier:(id)a3;
+ (id)environmentalAudioExposureEventType;
+ (id)exerciseGoal;
+ (id)fitnessFriendAchievementType;
+ (id)fitnessFriendActivitySnapshotType;
+ (id)fitnessFriendWorkoutType;
+ (id)handwashingEventType;
+ (id)headphoneAudioExposureEventType;
+ (id)heartRateType;
+ (id)heartStudyEventType;
+ (id)lactationType;
+ (id)lowCardioFitnessEventType;
+ (id)medicalTypeForIdentifier:(id)a3;
+ (id)medicationDispenseRecordTypeForIdentifier:(id)a3;
+ (id)medicationDoseEventTypeForIdentifier:(id)a3;
+ (id)medicationOrderTypeForIdentifier:(id)a3;
+ (id)medicationRecordTypeForIdentifier:(id)a3;
+ (id)menstrualFlowType;
+ (id)moveMinuteGoal;
+ (id)objectTypeForWorkoutMetric:(unint64_t)a3 fitnessMachineType:(unint64_t)a4;
+ (id)pauseRingsScheduleType;
+ (id)pregnancyType;
+ (id)procedureRecordTypeForIdentifier:(id)a3;
+ (id)scoredAssessmentTypeForIdentifier:(id)a3;
+ (id)signedClinicalDataRecordTypeForIdentifier:(id)a3;
+ (id)sleepDurationGoalType;
+ (id)sleepScheduleType;
+ (id)standGoal;
+ (id)stateOfMindType;
+ (id)tachycardiaType;
+ (id)unknownRecordTypeForIdentifier:(id)a3;
+ (id)userTrackedConceptTypeForIdentifier:(id)a3;
+ (id)vaccinationRecordTypeForIdentifier:(id)a3;
+ (id)verifiableClinicalRecordTypeForIdentifier:(id)a3;
+ (id)watchActivationType;
+ (id)workoutZonesTypeForIdentifier:(id)a3;
+ (int64_t)_typeCodeForIdentifier:(id)a3;
+ (void)_enumerateDataTypeCodesWithHandler:(id)a3;
+ (void)_enumerateObjectTypesWithHandler:(id)a3;
- ($E8A27014057A1F053A0599C3679047E8)_definition;
- (BOOL)enabled;
- (BOOL)isClinicalType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHealthRecordsType;
- (BOOL)readingAuthorizationAllowed;
- (BOOL)requiresPerObjectAuthorization;
- (BOOL)sharingAuthorizationAllowed;
- (BOOL)supportsExport;
- (Class)dataObjectClass;
- (HKObjectType)init;
- (HKObjectType)initWithCoder:(id)a3;
- (HKObjectType)parentType;
- (NSString)identifier;
- (id)_initWithCode:(int64_t)a3;
- (id)_predicateForSDKVersionToken:(unint64_t)a3;
- (id)attachmentSchemaIdentifier;
- (id)hk_localizedName;
- (id)hk_localizedNameForAuthSheet;
- (int64_t)code;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setParentType:(id)a3;
@end

@implementation HKObjectType

- (HKObjectType)initWithCoder:(id)a3
{
  unint64_t v4 = [a3 decodeIntegerForKey:@"Code"];
  if (v4 >= 0x13D) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"invalid data type code (%ld)", v4);
  }
  v5 = +[HKObjectType dataTypeWithCode:v4];

  return v5;
}

+ (id)dataTypeWithCode:(int64_t)a3
{
  return (id)[a1 _dataTypeWithCode:a3 expectedClass:0];
}

- (void).cxx_destruct
{
}

+ (id)activityCacheType
{
  return +[HKObjectType dataTypeWithCode:76];
}

+ (HKWorkoutType)workoutType
{
  return (HKWorkoutType *)+[HKObjectType dataTypeWithCode:79];
}

+ (id)calorieGoal
{
  return +[HKObjectType dataTypeWithCode:67];
}

+ (HKSeriesType)seriesTypeForIdentifier:(NSString *)identifier
{
  unint64_t v4 = identifier;
  v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKSeriesType *)v5;
}

- (void)setParentType:(id)a3
{
}

- (int64_t)code
{
  return self->_code;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v2 = [(HKObjectType *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  v2 = *(void **)[(HKObjectType *)self _definition];

  return (NSString *)v2;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && (unsigned __int16)self->_code == v4[4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKObjectType code](self, "code"), @"Code");
}

+ (HKQuantityType)quantityTypeForIdentifier:(HKQuantityTypeIdentifier)identifier
{
  id v4 = identifier;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKQuantityType *)v5;
}

+ (id)briskMinuteDataType
{
  return +[HKObjectType dataTypeWithCode:75];
}

+ (HKCategoryType)categoryTypeForIdentifier:(HKCategoryTypeIdentifier)identifier
{
  id v4 = identifier;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKCategoryType *)v5;
}

- (Class)dataObjectClass
{
  v2 = (NSString *)[(HKObjectType *)self _definition][16];

  return NSClassFromString(v2);
}

+ (id)fitnessFriendActivitySnapshotType
{
  return +[HKObjectType dataTypeWithCode:77];
}

+ (id)fitnessFriendAchievementType
{
  return +[HKObjectType dataTypeWithCode:108];
}

+ (HKCharacteristicType)characteristicTypeForIdentifier:(HKCharacteristicTypeIdentifier)identifier
{
  id v4 = identifier;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKCharacteristicType *)v5;
}

+ (id)fitnessFriendWorkoutType
{
  return +[HKObjectType dataTypeWithCode:109];
}

+ (id)deepBreathingSessionType
{
  return +[HKObjectType dataTypeWithCode:99];
}

+ (id)watchActivationType
{
  return +[HKObjectType dataTypeWithCode:68];
}

+ (id)medicationDoseEventTypeForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)unknownRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)medicationOrderTypeForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)allergyRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)accountOwnerTypeForIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)hk_localizedName
{
  v2 = 0;
  switch([(HKObjectType *)self code])
  {
    case 0:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BODY_MASS_INDEX";
      goto LABEL_220;
    case 1:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BODY_FAT_PERCENTAGE";
      goto LABEL_220;
    case 2:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HEIGHT";
      goto LABEL_220;
    case 3:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BODY_MASS";
      goto LABEL_220;
    case 4:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"LEAN_BODY_MASS";
      goto LABEL_220;
    case 5:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HEART_RATE";
      goto LABEL_220;
    case 7:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"STEPS";
      goto LABEL_220;
    case 8:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"DISTANCE";
      goto LABEL_220;
    case 9:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BASAL_ENERGY";
      goto LABEL_220;
    case 10:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ACTIVE_ENERGY";
      goto LABEL_220;
    case 12:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"FLIGHTS_CLIMBED";
      goto LABEL_220;
    case 13:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"NIKE_FUEL";
      goto LABEL_220;
    case 14:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"OXYGEN_SATURATION";
      goto LABEL_220;
    case 15:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_GLUCOSE";
      goto LABEL_220;
    case 16:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_PRESSURE_SYSTOLIC";
      goto LABEL_220;
    case 17:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_PRESSURE_DIASTOLIC";
      goto LABEL_220;
    case 18:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_ALCOHOL_CONTENT";
      goto LABEL_220;
    case 19:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PERFUSION_INDEX";
      goto LABEL_220;
    case 20:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"TOTAL_FAT";
      goto LABEL_220;
    case 21:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"POLYUNSATURATED_FAT";
      goto LABEL_220;
    case 22:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MONOUNSATURATED_FAT";
      goto LABEL_220;
    case 23:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SATURATED_FAT";
      goto LABEL_220;
    case 24:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CHOLESTEROL";
      goto LABEL_220;
    case 25:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SODIUM";
      goto LABEL_220;
    case 26:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CARBOHYDRATES";
      goto LABEL_220;
    case 27:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"FIBER";
      goto LABEL_220;
    case 28:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SUGAR";
      goto LABEL_220;
    case 29:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"DIETARY_ENERGY";
      goto LABEL_220;
    case 30:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PROTEIN";
      goto LABEL_220;
    case 31:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_A";
      goto LABEL_220;
    case 32:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_B6";
      goto LABEL_220;
    case 33:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_B12";
      goto LABEL_220;
    case 34:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_C";
      goto LABEL_220;
    case 35:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_D";
      goto LABEL_220;
    case 36:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_E";
      goto LABEL_220;
    case 37:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"VITAMIN_K";
      goto LABEL_220;
    case 38:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CALCIUM";
      goto LABEL_220;
    case 39:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"IRON";
      goto LABEL_220;
    case 40:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"THIAMIN";
      goto LABEL_220;
    case 41:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RIBOFLAVIN";
      goto LABEL_220;
    case 42:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"NIACIN";
      goto LABEL_220;
    case 43:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"FOLATE";
      goto LABEL_220;
    case 44:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BIOTIN";
      goto LABEL_220;
    case 45:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PANTOTHENIC_ACID";
      goto LABEL_220;
    case 46:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PHOSPHORUS";
      goto LABEL_220;
    case 47:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"IODINE";
      goto LABEL_220;
    case 48:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MAGNESIUM";
      goto LABEL_220;
    case 49:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ZINC";
      goto LABEL_220;
    case 50:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SELENIUM";
      goto LABEL_220;
    case 51:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"COPPER";
      goto LABEL_220;
    case 52:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MANGANESE";
      goto LABEL_220;
    case 53:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CHROMIUM";
      goto LABEL_220;
    case 54:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MOLYBDENUM";
      goto LABEL_220;
    case 55:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CHLORIDE";
      goto LABEL_220;
    case 56:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"POTASSIUM";
      goto LABEL_220;
    case 57:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"NUMBER_OF_TIMES_FALLEN";
      goto LABEL_220;
    case 58:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ELECTRODERMAL_ACTIVITY";
      goto LABEL_220;
    case 60:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"INHALER_USAGE";
      goto LABEL_220;
    case 61:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RESPIRATORY_RATE";
      goto LABEL_220;
    case 62:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BODY_TEMPERATURE";
      goto LABEL_220;
    case 63:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SLEEP_ANALYSIS";
      goto LABEL_220;
    case 64:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BIOLOGICAL_SEX";
      goto LABEL_220;
    case 65:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"DATE_OF_BIRTH";
      goto LABEL_220;
    case 66:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_TYPE";
      goto LABEL_220;
    case 70:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"STAND_HOUR";
      goto LABEL_220;
    case 71:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SPIROMETRY_FVC";
      goto LABEL_220;
    case 72:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SPIROMETRY_FEV1";
      goto LABEL_220;
    case 73:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SPIROMETRY_PEFR";
      goto LABEL_220;
    case 75:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"EXERCISE_MINUTE";
      goto LABEL_220;
    case 78:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CAFFEINE";
      goto LABEL_220;
    case 79:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WORKOUT";
      goto LABEL_220;
    case 80:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLOOD_PRESSURE";
      goto LABEL_220;
    case 83:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CYCLING_DISTANCE";
      goto LABEL_220;
    case 87:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WATER";
      goto LABEL_220;
    case 88:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"FITZPATRICK_SKIN_TYPE";
      goto LABEL_220;
    case 89:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"UV_EXPOSURE";
      goto LABEL_220;
    case 90:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BASAL_BODY_TEMPERATURE";
      goto LABEL_220;
    case 91:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CERVICAL_MUCUS_QUALITY";
      goto LABEL_220;
    case 92:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"OVULATION_TEST_RESULT";
      goto LABEL_220;
    case 95:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MENSTRUATION";
      goto LABEL_220;
    case 96:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"INTERMENSTRUAL_BLEEDING";
      goto LABEL_220;
    case 97:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SEXUAL_ACTIVITY";
      goto LABEL_220;
    case 99:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"MINDFUL_MINUTES";
      goto LABEL_220;
    case 100:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ACTIVITY_SUMMARY";
      goto LABEL_220;
    case 101:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PUSH_COUNT";
      goto LABEL_220;
    case 102:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WORKOUT_ROUTE";
      goto LABEL_220;
    case 103:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WHEELCHAIR_USE";
      goto LABEL_220;
    case 107:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CLINICAL_DOCUMENTS";
      goto LABEL_220;
    case 110:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SWIMMING_DISTANCE";
      goto LABEL_220;
    case 111:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SWIMMING_STROKES";
      goto LABEL_220;
    case 113:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WHEELCHAIR_DISTANCE";
      goto LABEL_220;
    case 114:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WAIST_CIRCUMFERENCE";
      goto LABEL_220;
    case 118:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RESTING_HEART_RATE";
      goto LABEL_220;
    case 119:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"TACHOGRAM";
      goto LABEL_220;
    case 124:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"CARDIO_FITNESS";
      goto LABEL_165;
    case 125:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"INSULIN_DELIVERY";
      goto LABEL_220;
    case 137:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WALKING_HEART_RATE_AVERAGE";
      goto LABEL_220;
    case 138:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"DOWNHILL_SNOW_SPORTS_DISTANCE";
      goto LABEL_220;
    case 139:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HEART_RATE_VARIABILITY";
      goto LABEL_220;
    case 140:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"TACHYCARDIA";
      goto LABEL_220;
    case 144:
      id v4 = HKHealthKitFrameworkBundle();
      v7 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      v2 = HKConditionallyRedactedHeartRhythmString(v7);

      goto LABEL_221;
    case 145:
      v8 = +[_HKBehavior sharedBehavior];
      v9 = [v8 features];
      int v10 = [v9 yodel];

      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      if (v10)
      {
        v6 = @"AUDIOGRAM";
        BOOL v5 = @"Localizable-Yodel";
      }
      else
      {
        BOOL v5 = @"Localizable-DataTypes";
        v6 = @"AUDIOGRAM";
      }
      goto LABEL_220;
    case 147:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"BRADYCARDIA";
      BOOL v5 = @"Localizable-Tortuga";
      goto LABEL_220;
    case 156:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"ATRIAL_FIBRILLATION_EVENT";
      BOOL v5 = @"Localizable-Antimony";
      goto LABEL_220;
    case 157:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_ABDOMINAL_CRAMPS";
      goto LABEL_220;
    case 158:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_BREAST_PAIN";
      goto LABEL_220;
    case 159:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_BLOATING";
      goto LABEL_220;
    case 160:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_HEADACHE";
      goto LABEL_220;
    case 161:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_ACNE";
      goto LABEL_220;
    case 162:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_LOWER_BACK_PAIN";
      goto LABEL_220;
    case 163:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_PELVIC_PAIN";
      goto LABEL_220;
    case 164:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_MOOD_CHANGES";
      goto LABEL_220;
    case 165:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_CONSTIPATION";
      goto LABEL_220;
    case 166:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_DIARRHEA";
      goto LABEL_220;
    case 167:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_FATIGUE";
      goto LABEL_220;
    case 168:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_NAUSEA";
      goto LABEL_220;
    case 169:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_SLEEP_CHANGES";
      goto LABEL_220;
    case 170:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_APPETITE_CHANGES";
      goto LABEL_220;
    case 171:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_HOT_FLASHES";
      goto LABEL_220;
    case 172:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ENVIRONMENTAL_AUDIO_EXPOSURE";
      goto LABEL_220;
    case 173:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HEADPHONE_AUDIO_EXPOSURE";
      goto LABEL_220;
    case 177:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ACTIVITY_MOVE_MODE";
      goto LABEL_220;
    case 178:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"AUDIO_EXPOSURE_EVENT";
      goto LABEL_220;
    case 179:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"MOVE_MINUTE";
      BOOL v5 = @"Localizable-tinker";
      goto LABEL_220;
    case 182:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WALKING_DOUBLE_SUPPORT_PERCENTAGE";
      goto LABEL_220;
    case 183:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SIX_MINUTE_WALK_TEST_DISTANCE";
      goto LABEL_220;
    case 186:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"STAND_MINUTE";
      goto LABEL_220;
    case 187:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WALKING_SPEED";
      goto LABEL_220;
    case 188:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WALKING_STEP_LENGTH";
      goto LABEL_220;
    case 189:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"TOOTHBRUSHING_EVENT";
      goto LABEL_220;
    case 191:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PREGNANCY";
      goto LABEL_220;
    case 192:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"LACTATION";
      goto LABEL_220;
    case 193:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CONTRACEPTIVE";
      goto LABEL_220;
    case 194:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WALKING_ASYMMETRY_PERCENTAGE";
      goto LABEL_220;
    case 195:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"STAIR_ASCENT_SPEED";
      goto LABEL_220;
    case 196:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"STAIR_DESCENT_SPEED";
      goto LABEL_220;
    case 197:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SLEEP_DURATION_GOAL";
      goto LABEL_220;
    case 198:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SLEEP_SCHEDULE";
      goto LABEL_220;
    case 199:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HEADPHONE_AUDIO_EXPOSURE_EVENT";
      goto LABEL_220;
    case 201:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT";
      goto LABEL_220;
    case 202:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_SKIPPED_HEARTBEAT";
      goto LABEL_220;
    case 203:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_FEVER";
      goto LABEL_220;
    case 204:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_SHORTNESS_OF_BREATH";
      goto LABEL_220;
    case 205:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_CHEST_TIGHTNESS_OR_PAIN";
      goto LABEL_220;
    case 206:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_FAINTING";
      goto LABEL_220;
    case 207:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_DIZZINESS";
      goto LABEL_220;
    case 218:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CARDIO_FITNESS_MEDICATIONS_USE";
      goto LABEL_220;
    case 220:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_VOMITING";
      goto LABEL_220;
    case 221:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_HEARTBURN";
      goto LABEL_220;
    case 222:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_COUGHING";
      goto LABEL_220;
    case 223:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_WHEEZING";
      goto LABEL_220;
    case 224:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_SORE_THROAT";
      goto LABEL_220;
    case 225:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_CONGESTION";
      goto LABEL_220;
    case 226:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_RUNNY_NOSE";
      goto LABEL_220;
    case 229:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_VAGINAL_DRYNESS";
      goto LABEL_220;
    case 230:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_NIGHT_SWEATS";
      goto LABEL_220;
    case 231:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_CHILLS";
      goto LABEL_220;
    case 232:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_HAIR_LOSS";
      goto LABEL_220;
    case 233:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_DRY_SKIN";
      goto LABEL_220;
    case 234:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_BLADDER_INCONTINENCE";
      goto LABEL_220;
    case 235:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_MEMORY_LAPSE";
      goto LABEL_220;
    case 236:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"CARDIO_FITNESS_EVENT";
LABEL_165:
      BOOL v5 = @"Localizable-CardioFitness";
      goto LABEL_220;
    case 237:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"HANDWASHING_EVENT";
      goto LABEL_220;
    case 240:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_BODY_ACHE";
      goto LABEL_220;
    case 241:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_LOSS_OF_SMELL";
      goto LABEL_220;
    case 242:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SYMPTOM_LOSS_OF_TASTE";
      goto LABEL_220;
    case 243:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PREGNANCY_TEST_RESULT";
      goto LABEL_220;
    case 244:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PROGESTERONE_TEST_RESULT";
      goto LABEL_220;
    case 248:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"ATRIAL_FIBRILLATION_BURDEN";
      BOOL v5 = @"Localizable-AFibBurden";
      goto LABEL_220;
    case 249:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"WALKING_STEADINESS";
      goto LABEL_175;
    case 250:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"WALKING_STEADINESS_EVENT";
LABEL_175:
      BOOL v5 = @"Localizable-WalkingSteadiness";
      goto LABEL_220;
    case 251:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"NUMBER_OF_ALCOHOLIC_BEVERAGES";
      goto LABEL_220;
    case 256:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"SLEEPING_WRIST_TEMPERATURE";
      BOOL v5 = @"Localizable-Kali";
      goto LABEL_220;
    case 257:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"VISION_PRESCRIPTION";
      BOOL v5 = @"Localizable-VRX";
      goto LABEL_220;
    case 258:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RUNNING_STRIDE_LENGTH";
      goto LABEL_220;
    case 259:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RUNNING_VERTICAL_OSCILLATION";
      goto LABEL_220;
    case 260:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RUNNING_GROUND_CONTACT_TIME";
      goto LABEL_220;
    case 262:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"MENSTRUAL_CYCLE_DEVIATION_SPOTTING";
      goto LABEL_186;
    case 263:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"MENSTRUAL_CYCLE_DEVIATION_PROLONGED";
      goto LABEL_186;
    case 264:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"MENSTRUAL_CYCLE_DEVIATION_IRREGULAR";
      goto LABEL_186;
    case 265:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"MENSTRUAL_CYCLE_DEVIATION_INFREQUENT";
LABEL_186:
      BOOL v5 = @"Localizable-Selene";
      goto LABEL_220;
    case 266:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"HEART_RATE_RECOVERY";
      BOOL v5 = @"Localizable-Lyon";
      goto LABEL_220;
    case 269:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"UNDERWATER_DEPTH";
      goto LABEL_196;
    case 270:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RUNNING_POWER";
      goto LABEL_220;
    case 272:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ENVIRONMENTAL_SOUND_REDUCTION";
      goto LABEL_220;
    case 274:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"RUNNING_SPEED";
      goto LABEL_220;
    case 275:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"SLEEP_BREATHING_DISTURBANCES";
      goto LABEL_194;
    case 276:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"SLEEP_APNEA_EVENT";
LABEL_194:
      BOOL v5 = @"Localizable-Nebula";
      goto LABEL_220;
    case 277:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"WATER_TEMPERATURE";
LABEL_196:
      BOOL v5 = @"Localizable-Charon";
      goto LABEL_220;
    case 279:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"TIME_IN_DAYLIGHT";
      goto LABEL_220;
    case 280:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CYCLING_POWER";
      goto LABEL_220;
    case 281:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CYCLING_SPEED";
      goto LABEL_220;
    case 282:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CYCLING_CADENCE";
      goto LABEL_220;
    case 283:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CYCLING_FUNCTIONAL_THRESHOLD_POWER";
      goto LABEL_220;
    case 284:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"STATE_OF_MIND";
      goto LABEL_206;
    case 286:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PHYSICAL_EFFORT";
      goto LABEL_220;
    case 287:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"GAD7";
      goto LABEL_206;
    case 288:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"PHQ9";
LABEL_206:
      BOOL v5 = @"Localizable-Chamomile";
      goto LABEL_220;
    case 291:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"USER_TRACKED_MEDICATIONS";
      goto LABEL_220;
    case 294:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PADDLE_SPORTS_DISTANCE";
      goto LABEL_220;
    case 295:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ROWING_DISTANCE";
      goto LABEL_220;
    case 296:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CROSS_COUNTRY_SKIING_DISTANCE";
      goto LABEL_220;
    case 297:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"SKATING_SPORTS_DISTANCE";
      goto LABEL_220;
    case 298:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ESTIMATED_WORKOUT_EFFORT_SCORE";
      goto LABEL_220;
    case 301:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"ROWING_SPEED";
      goto LABEL_220;
    case 302:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"CROSS_COUNTRY_SKIING_SPEED";
      goto LABEL_220;
    case 303:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"PADDLE_SPORTS_SPEED";
      goto LABEL_220;
    case 304:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"WORKOUT_EFFORT_SCORE";
      goto LABEL_220;
    case 305:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      v6 = @"APPLE_BALANCE_METRICS";
      BOOL v5 = @"Localizable-Balance";
      goto LABEL_220;
    case 313:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLEEDING_DURING_PREGNANCY";
      goto LABEL_220;
    case 314:
      unint64_t v3 = HKHealthKitFrameworkBundle();
      id v4 = v3;
      BOOL v5 = @"Localizable-DataTypes";
      v6 = @"BLEEDING_AFTER_PREGNANCY";
LABEL_220:
      v2 = [v3 localizedStringForKey:v6 value:&stru_1EEC60288 table:v5];
LABEL_221:

      break;
    default:
      break;
  }

  return v2;
}

- (id)hk_localizedNameForAuthSheet
{
  v2 = 0;
  unint64_t v3 = @"SYMPTOM_ABDOMINAL_CRAMPS";
  switch([(HKObjectType *)self code])
  {
    case 0:
      unint64_t v3 = @"BODY_MASS_INDEX";
      goto LABEL_215;
    case 1:
      unint64_t v3 = @"BODY_FAT_PERCENTAGE";
      goto LABEL_215;
    case 2:
      unint64_t v3 = @"HEIGHT";
      goto LABEL_215;
    case 3:
      unint64_t v3 = @"BODY_MASS";
      goto LABEL_215;
    case 4:
      unint64_t v3 = @"LEAN_BODY_MASS";
      goto LABEL_215;
    case 5:
      unint64_t v3 = @"HEART_RATE";
      goto LABEL_215;
    case 7:
      unint64_t v3 = @"STEPS";
      goto LABEL_215;
    case 8:
      unint64_t v3 = @"DISTANCE";
      goto LABEL_215;
    case 9:
      unint64_t v3 = @"BASAL_ENERGY";
      goto LABEL_215;
    case 10:
      unint64_t v3 = @"ACTIVE_ENERGY";
      goto LABEL_215;
    case 12:
      unint64_t v3 = @"FLIGHTS_CLIMBED";
      goto LABEL_215;
    case 13:
      unint64_t v3 = @"NIKE_FUEL";
      goto LABEL_215;
    case 14:
      unint64_t v3 = @"OXYGEN_SATURATION";
      goto LABEL_215;
    case 15:
      unint64_t v3 = @"BLOOD_GLUCOSE";
      goto LABEL_215;
    case 16:
      unint64_t v3 = @"BLOOD_PRESSURE_SYSTOLIC";
      goto LABEL_215;
    case 17:
      unint64_t v3 = @"BLOOD_PRESSURE_DIASTOLIC";
      goto LABEL_215;
    case 18:
      unint64_t v3 = @"BLOOD_ALCOHOL_CONTENT";
      goto LABEL_215;
    case 19:
      unint64_t v3 = @"PERFUSION_INDEX";
      goto LABEL_215;
    case 20:
      unint64_t v3 = @"TOTAL_FAT";
      goto LABEL_215;
    case 21:
      unint64_t v3 = @"POLYUNSATURATED_FAT";
      goto LABEL_215;
    case 22:
      unint64_t v3 = @"MONOUNSATURATED_FAT";
      goto LABEL_215;
    case 23:
      unint64_t v3 = @"SATURATED_FAT";
      goto LABEL_215;
    case 24:
      unint64_t v3 = @"CHOLESTEROL";
      goto LABEL_215;
    case 25:
      unint64_t v3 = @"SODIUM";
      goto LABEL_215;
    case 26:
      unint64_t v3 = @"CARBOHYDRATES";
      goto LABEL_215;
    case 27:
      unint64_t v3 = @"FIBER";
      goto LABEL_215;
    case 28:
      unint64_t v3 = @"SUGAR";
      goto LABEL_215;
    case 29:
      unint64_t v3 = @"DIETARY_ENERGY";
      goto LABEL_215;
    case 30:
      unint64_t v3 = @"PROTEIN";
      goto LABEL_215;
    case 31:
      unint64_t v3 = @"VITAMIN_A";
      goto LABEL_215;
    case 32:
      unint64_t v3 = @"VITAMIN_B6";
      goto LABEL_215;
    case 33:
      unint64_t v3 = @"VITAMIN_B12";
      goto LABEL_215;
    case 34:
      unint64_t v3 = @"VITAMIN_C";
      goto LABEL_215;
    case 35:
      unint64_t v3 = @"VITAMIN_D";
      goto LABEL_215;
    case 36:
      unint64_t v3 = @"VITAMIN_E";
      goto LABEL_215;
    case 37:
      unint64_t v3 = @"VITAMIN_K";
      goto LABEL_215;
    case 38:
      unint64_t v3 = @"CALCIUM";
      goto LABEL_215;
    case 39:
      unint64_t v3 = @"IRON";
      goto LABEL_215;
    case 40:
      unint64_t v3 = @"THIAMIN";
      goto LABEL_215;
    case 41:
      unint64_t v3 = @"RIBOFLAVIN";
      goto LABEL_215;
    case 42:
      unint64_t v3 = @"NIACIN";
      goto LABEL_215;
    case 43:
      unint64_t v3 = @"FOLATE";
      goto LABEL_215;
    case 44:
      unint64_t v3 = @"BIOTIN";
      goto LABEL_215;
    case 45:
      unint64_t v3 = @"PANTOTHENIC_ACID";
      goto LABEL_215;
    case 46:
      unint64_t v3 = @"PHOSPHORUS";
      goto LABEL_215;
    case 47:
      unint64_t v3 = @"IODINE";
      goto LABEL_215;
    case 48:
      unint64_t v3 = @"MAGNESIUM";
      goto LABEL_215;
    case 49:
      unint64_t v3 = @"ZINC";
      goto LABEL_215;
    case 50:
      unint64_t v3 = @"SELENIUM";
      goto LABEL_215;
    case 51:
      unint64_t v3 = @"COPPER";
      goto LABEL_215;
    case 52:
      unint64_t v3 = @"MANGANESE";
      goto LABEL_215;
    case 53:
      unint64_t v3 = @"CHROMIUM";
      goto LABEL_215;
    case 54:
      unint64_t v3 = @"MOLYBDENUM";
      goto LABEL_215;
    case 55:
      unint64_t v3 = @"CHLORIDE";
      goto LABEL_215;
    case 56:
      unint64_t v3 = @"POTASSIUM";
      goto LABEL_215;
    case 57:
      unint64_t v3 = @"NUMBER_OF_TIMES_FALLEN";
      goto LABEL_215;
    case 58:
      unint64_t v3 = @"ELECTRODERMAL_ACTIVITY";
      goto LABEL_215;
    case 60:
      unint64_t v3 = @"INHALER_USAGE";
      goto LABEL_215;
    case 61:
      unint64_t v3 = @"RESPIRATORY_RATE";
      goto LABEL_215;
    case 62:
      unint64_t v3 = @"BODY_TEMPERATURE";
      goto LABEL_215;
    case 63:
      unint64_t v3 = @"SLEEP_ANALYSIS";
      goto LABEL_215;
    case 64:
      unint64_t v3 = @"BIOLOGICAL_SEX";
      goto LABEL_215;
    case 65:
      unint64_t v3 = @"DATE_OF_BIRTH";
      goto LABEL_215;
    case 66:
      unint64_t v3 = @"BLOOD_TYPE";
      goto LABEL_215;
    case 70:
      unint64_t v3 = @"STAND_HOUR";
      goto LABEL_215;
    case 71:
      unint64_t v3 = @"SPIROMETRY_FVC";
      goto LABEL_215;
    case 72:
      unint64_t v3 = @"SPIROMETRY_FEV1";
      goto LABEL_215;
    case 73:
      unint64_t v3 = @"SPIROMETRY_PEFR";
      goto LABEL_215;
    case 75:
      unint64_t v3 = @"EXERCISE_MINUTE";
      goto LABEL_215;
    case 78:
      unint64_t v3 = @"CAFFEINE";
      goto LABEL_215;
    case 79:
      unint64_t v3 = @"WORKOUT";
      goto LABEL_215;
    case 80:
      unint64_t v3 = @"BLOOD_PRESSURE";
      goto LABEL_215;
    case 83:
      unint64_t v3 = @"CYCLING_DISTANCE";
      goto LABEL_215;
    case 87:
      unint64_t v3 = @"WATER";
      goto LABEL_215;
    case 88:
      unint64_t v3 = @"FITZPATRICK_SKIN_TYPE";
      goto LABEL_215;
    case 89:
      unint64_t v3 = @"UV_EXPOSURE";
      goto LABEL_215;
    case 90:
      unint64_t v3 = @"BASAL_BODY_TEMPERATURE";
      goto LABEL_215;
    case 91:
      unint64_t v3 = @"CERVICAL_MUCUS_QUALITY";
      goto LABEL_215;
    case 92:
      unint64_t v3 = @"OVULATION_TEST_RESULT";
      goto LABEL_215;
    case 95:
      unint64_t v3 = @"MENSTRUATION";
      goto LABEL_215;
    case 96:
      unint64_t v3 = @"INTERMENSTRUAL_BLEEDING";
      goto LABEL_215;
    case 97:
      unint64_t v3 = @"SEXUAL_ACTIVITY";
      goto LABEL_215;
    case 99:
      unint64_t v3 = @"MINDFUL_MINUTES";
      goto LABEL_215;
    case 100:
      unint64_t v3 = @"ACTIVITY_SUMMARY";
      goto LABEL_215;
    case 101:
      unint64_t v3 = @"PUSH_COUNT";
      goto LABEL_215;
    case 102:
      unint64_t v3 = @"WORKOUT_ROUTE";
      goto LABEL_215;
    case 103:
      unint64_t v3 = @"WHEELCHAIR_USE";
      goto LABEL_215;
    case 107:
      unint64_t v3 = @"CLINICAL_DOCUMENTS";
      goto LABEL_215;
    case 110:
      unint64_t v3 = @"SWIMMING_DISTANCE";
      goto LABEL_215;
    case 111:
      unint64_t v3 = @"SWIMMING_STROKES";
      goto LABEL_215;
    case 113:
      unint64_t v3 = @"WHEELCHAIR_DISTANCE";
      goto LABEL_215;
    case 114:
      unint64_t v3 = @"WAIST_CIRCUMFERENCE";
      goto LABEL_215;
    case 118:
      unint64_t v3 = @"RESTING_HEART_RATE";
      goto LABEL_215;
    case 119:
      unint64_t v3 = @"TACHOGRAM";
      goto LABEL_215;
    case 124:
      unint64_t v3 = @"CARDIO_FITNESS";
      goto LABEL_215;
    case 125:
      unint64_t v3 = @"INSULIN_DELIVERY";
      goto LABEL_215;
    case 137:
      unint64_t v3 = @"WALKING_HEART_RATE_AVERAGE";
      goto LABEL_215;
    case 138:
      unint64_t v3 = @"DOWNHILL_SNOW_SPORTS_DISTANCE";
      goto LABEL_215;
    case 139:
      unint64_t v3 = @"HEART_RATE_VARIABILITY";
      goto LABEL_215;
    case 140:
      unint64_t v3 = @"TACHYCARDIA";
      goto LABEL_215;
    case 144:
      unint64_t v3 = @"ELECTROCARDIOGRAM";
      goto LABEL_215;
    case 145:
      id v4 = +[_HKBehavior sharedBehavior];
      BOOL v5 = [v4 features];
      int v6 = [v5 yodel];

      v7 = HKHealthKitFrameworkBundle();
      v8 = v7;
      if (v6) {
        v9 = @"Localizable-Yodel";
      }
      else {
        v9 = @"Localizable-DataTypes";
      }
      unint64_t v3 = [v7 localizedStringForKey:@"AUDIOGRAM" value:&stru_1EEC60288 table:v9];

      if (v3) {
        goto LABEL_215;
      }
      v2 = 0;
      break;
    case 147:
      unint64_t v3 = @"BRADYCARDIA";
      goto LABEL_215;
    case 156:
      unint64_t v3 = @"ATRIAL_FIBRILLATION_EVENT";
      goto LABEL_215;
    case 157:
      goto LABEL_215;
    case 158:
      unint64_t v3 = @"SYMPTOM_BREAST_PAIN";
      goto LABEL_215;
    case 159:
      unint64_t v3 = @"SYMPTOM_BLOATING";
      goto LABEL_215;
    case 160:
      unint64_t v3 = @"SYMPTOM_HEADACHE";
      goto LABEL_215;
    case 161:
      unint64_t v3 = @"SYMPTOM_ACNE";
      goto LABEL_215;
    case 162:
      unint64_t v3 = @"SYMPTOM_LOWER_BACK_PAIN";
      goto LABEL_215;
    case 163:
      unint64_t v3 = @"SYMPTOM_PELVIC_PAIN";
      goto LABEL_215;
    case 164:
      unint64_t v3 = @"SYMPTOM_MOOD_CHANGES";
      goto LABEL_215;
    case 165:
      unint64_t v3 = @"SYMPTOM_CONSTIPATION";
      goto LABEL_215;
    case 166:
      unint64_t v3 = @"SYMPTOM_DIARRHEA";
      goto LABEL_215;
    case 167:
      unint64_t v3 = @"SYMPTOM_FATIGUE";
      goto LABEL_215;
    case 168:
      unint64_t v3 = @"SYMPTOM_NAUSEA";
      goto LABEL_215;
    case 169:
      unint64_t v3 = @"SYMPTOM_SLEEP_CHANGES";
      goto LABEL_215;
    case 170:
      unint64_t v3 = @"SYMPTOM_APPETITE_CHANGES";
      goto LABEL_215;
    case 171:
      unint64_t v3 = @"SYMPTOM_HOT_FLASHES";
      goto LABEL_215;
    case 172:
      unint64_t v3 = @"ENVIRONMENTAL_AUDIO_EXPOSURE";
      goto LABEL_215;
    case 173:
      unint64_t v3 = @"HEADPHONE_AUDIO_EXPOSURE";
      goto LABEL_215;
    case 177:
      unint64_t v3 = @"ACTIVITY_MOVE_MODE";
      goto LABEL_215;
    case 178:
      unint64_t v3 = @"AUDIO_EXPOSURE_EVENT";
      goto LABEL_215;
    case 179:
      unint64_t v3 = @"MOVE_MINUTE";
      goto LABEL_215;
    case 182:
      unint64_t v3 = @"WALKING_DOUBLE_SUPPORT_PERCENTAGE";
      goto LABEL_215;
    case 183:
      unint64_t v3 = @"SIX_MINUTE_WALK_TEST_DISTANCE";
      goto LABEL_215;
    case 186:
      unint64_t v3 = @"STAND_MINUTE";
      goto LABEL_215;
    case 187:
      unint64_t v3 = @"WALKING_SPEED";
      goto LABEL_215;
    case 188:
      unint64_t v3 = @"WALKING_STEP_LENGTH";
      goto LABEL_215;
    case 189:
      unint64_t v3 = @"TOOTHBRUSHING_EVENT";
      goto LABEL_215;
    case 191:
      unint64_t v3 = @"PREGNANCY";
      goto LABEL_215;
    case 192:
      unint64_t v3 = @"LACTATION";
      goto LABEL_215;
    case 193:
      unint64_t v3 = @"CONTRACEPTIVE";
      goto LABEL_215;
    case 194:
      unint64_t v3 = @"WALKING_ASYMMETRY_PERCENTAGE";
      goto LABEL_215;
    case 195:
      unint64_t v3 = @"STAIR_ASCENT_SPEED";
      goto LABEL_215;
    case 196:
      unint64_t v3 = @"STAIR_DESCENT_SPEED";
      goto LABEL_215;
    case 197:
      unint64_t v3 = @"SLEEP_DURATION_GOAL";
      goto LABEL_215;
    case 198:
      unint64_t v3 = @"SLEEP_SCHEDULE";
      goto LABEL_215;
    case 199:
      unint64_t v3 = @"HEADPHONE_AUDIO_EXPOSURE_EVENT";
      goto LABEL_215;
    case 201:
      unint64_t v3 = @"SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT";
      goto LABEL_215;
    case 202:
      unint64_t v3 = @"SYMPTOM_SKIPPED_HEARTBEAT";
      goto LABEL_215;
    case 203:
      unint64_t v3 = @"SYMPTOM_FEVER";
      goto LABEL_215;
    case 204:
      unint64_t v3 = @"SYMPTOM_SHORTNESS_OF_BREATH";
      goto LABEL_215;
    case 205:
      unint64_t v3 = @"SYMPTOM_CHEST_TIGHTNESS_OR_PAIN";
      goto LABEL_215;
    case 206:
      unint64_t v3 = @"SYMPTOM_FAINTING";
      goto LABEL_215;
    case 207:
      unint64_t v3 = @"SYMPTOM_DIZZINESS";
      goto LABEL_215;
    case 218:
      unint64_t v3 = @"CARDIO_FITNESS_MEDICATIONS_USE";
      goto LABEL_215;
    case 220:
      unint64_t v3 = @"SYMPTOM_VOMITING";
      goto LABEL_215;
    case 221:
      unint64_t v3 = @"SYMPTOM_HEARTBURN";
      goto LABEL_215;
    case 222:
      unint64_t v3 = @"SYMPTOM_COUGHING";
      goto LABEL_215;
    case 223:
      unint64_t v3 = @"SYMPTOM_WHEEZING";
      goto LABEL_215;
    case 224:
      unint64_t v3 = @"SYMPTOM_SORE_THROAT";
      goto LABEL_215;
    case 225:
      unint64_t v3 = @"SYMPTOM_CONGESTION";
      goto LABEL_215;
    case 226:
      unint64_t v3 = @"SYMPTOM_RUNNY_NOSE";
      goto LABEL_215;
    case 229:
      unint64_t v3 = @"SYMPTOM_VAGINAL_DRYNESS";
      goto LABEL_215;
    case 230:
      unint64_t v3 = @"SYMPTOM_NIGHT_SWEATS";
      goto LABEL_215;
    case 231:
      unint64_t v3 = @"SYMPTOM_CHILLS";
      goto LABEL_215;
    case 232:
      unint64_t v3 = @"SYMPTOM_HAIR_LOSS";
      goto LABEL_215;
    case 233:
      unint64_t v3 = @"SYMPTOM_DRY_SKIN";
      goto LABEL_215;
    case 234:
      unint64_t v3 = @"SYMPTOM_BLADDER_INCONTINENCE";
      goto LABEL_215;
    case 235:
      unint64_t v3 = @"SYMPTOM_MEMORY_LAPSE";
      goto LABEL_215;
    case 236:
      unint64_t v3 = @"CARDIO_FITNESS_EVENT";
      goto LABEL_215;
    case 237:
      unint64_t v3 = @"HANDWASHING_EVENT";
      goto LABEL_215;
    case 240:
      unint64_t v3 = @"SYMPTOM_BODY_ACHE";
      goto LABEL_215;
    case 241:
      unint64_t v3 = @"SYMPTOM_LOSS_OF_SMELL";
      goto LABEL_215;
    case 242:
      unint64_t v3 = @"SYMPTOM_LOSS_OF_TASTE";
      goto LABEL_215;
    case 243:
      unint64_t v3 = @"PREGNANCY_TEST_RESULT";
      goto LABEL_215;
    case 244:
      unint64_t v3 = @"PROGESTERONE_TEST_RESULT";
      goto LABEL_215;
    case 248:
      unint64_t v3 = @"ATRIAL_FIBRILLATION_BURDEN";
      goto LABEL_215;
    case 249:
      unint64_t v3 = @"WALKING_STEADINESS";
      goto LABEL_215;
    case 250:
      unint64_t v3 = @"WALKING_STEADINESS_EVENT";
      goto LABEL_215;
    case 251:
      unint64_t v3 = @"NUMBER_OF_ALCOHOLIC_BEVERAGES";
      goto LABEL_215;
    case 256:
      unint64_t v3 = @"SLEEPING_WRIST_TEMPERATURE";
      goto LABEL_215;
    case 257:
      unint64_t v3 = @"VISION_PRESCRIPTION";
      goto LABEL_215;
    case 258:
      unint64_t v3 = @"RUNNING_STRIDE_LENGTH";
      goto LABEL_215;
    case 259:
      unint64_t v3 = @"RUNNING_VERTICAL_OSCILLATION";
      goto LABEL_215;
    case 260:
      unint64_t v3 = @"RUNNING_GROUND_CONTACT_TIME";
      goto LABEL_215;
    case 262:
      unint64_t v3 = @"MENSTRUAL_CYCLE_DEVIATION_SPOTTING";
      goto LABEL_215;
    case 263:
      unint64_t v3 = @"MENSTRUAL_CYCLE_DEVIATION_PROLONGED";
      goto LABEL_215;
    case 264:
      unint64_t v3 = @"MENSTRUAL_CYCLE_DEVIATION_IRREGULAR";
      goto LABEL_215;
    case 265:
      unint64_t v3 = @"MENSTRUAL_CYCLE_DEVIATION_INFREQUENT";
      goto LABEL_215;
    case 266:
      unint64_t v3 = @"HEART_RATE_RECOVERY";
      goto LABEL_215;
    case 269:
      unint64_t v3 = @"UNDERWATER_DEPTH";
      goto LABEL_215;
    case 270:
      unint64_t v3 = @"RUNNING_POWER";
      goto LABEL_215;
    case 272:
      unint64_t v3 = @"ENVIRONMENTAL_SOUND_REDUCTION";
      goto LABEL_215;
    case 274:
      unint64_t v3 = @"RUNNING_SPEED";
      goto LABEL_215;
    case 275:
      unint64_t v3 = @"SLEEP_BREATHING_DISTURBANCES";
      goto LABEL_215;
    case 276:
      unint64_t v3 = @"SLEEP_APNEA_EVENT";
      goto LABEL_215;
    case 277:
      unint64_t v3 = @"WATER_TEMPERATURE";
      goto LABEL_215;
    case 279:
      unint64_t v3 = @"TIME_IN_DAYLIGHT";
      goto LABEL_215;
    case 280:
      unint64_t v3 = @"CYCLING_POWER";
      goto LABEL_215;
    case 281:
      unint64_t v3 = @"CYCLING_SPEED";
      goto LABEL_215;
    case 282:
      unint64_t v3 = @"CYCLING_CADENCE";
      goto LABEL_215;
    case 283:
      unint64_t v3 = @"CYCLING_FUNCTIONAL_THRESHOLD_POWER";
      goto LABEL_215;
    case 284:
      unint64_t v3 = @"STATE_OF_MIND";
      goto LABEL_215;
    case 286:
      unint64_t v3 = @"PHYSICAL_EFFORT";
      goto LABEL_215;
    case 287:
      unint64_t v3 = @"GAD7";
      goto LABEL_215;
    case 288:
      unint64_t v3 = @"PHQ9";
      goto LABEL_215;
    case 291:
      unint64_t v3 = @"USER_TRACKED_MEDICATIONS";
      goto LABEL_215;
    case 294:
      unint64_t v3 = @"PADDLE_SPORTS_DISTANCE";
      goto LABEL_215;
    case 295:
      unint64_t v3 = @"ROWING_DISTANCE";
      goto LABEL_215;
    case 296:
      unint64_t v3 = @"CROSS_COUNTRY_SKIING_DISTANCE";
      goto LABEL_215;
    case 297:
      unint64_t v3 = @"SKATING_SPORTS_DISTANCE";
      goto LABEL_215;
    case 298:
      unint64_t v3 = @"ESTIMATED_WORKOUT_EFFORT_SCORE";
      goto LABEL_215;
    case 301:
      unint64_t v3 = @"ROWING_SPEED";
      goto LABEL_215;
    case 302:
      unint64_t v3 = @"CROSS_COUNTRY_SKIING_SPEED";
      goto LABEL_215;
    case 303:
      unint64_t v3 = @"PADDLE_SPORTS_SPEED";
      goto LABEL_215;
    case 304:
      unint64_t v3 = @"WORKOUT_EFFORT_SCORE";
      goto LABEL_215;
    case 305:
      unint64_t v3 = @"APPLE_BALANCE_METRICS";
      goto LABEL_215;
    case 313:
      unint64_t v3 = @"BLEEDING_DURING_PREGNANCY";
      goto LABEL_215;
    case 314:
      unint64_t v3 = @"BLEEDING_AFTER_PREGNANCY";
LABEL_215:
      int v10 = [(__CFString *)v3 stringByAppendingString:@"_EMBEDDED_AUTH"];
      v11 = HKHealthKitFrameworkBundle();
      v2 = [v11 localizedStringForKey:v10 value:&stru_1EEC60288 table:@"Localizable-DataTypes"];

      break;
    default:
      break;
  }

  return v2;
}

+ (id)objectTypeForWorkoutMetric:(unint64_t)a3 fitnessMachineType:(unint64_t)a4
{
  int v6 = 0;
  v7 = &HKQuantityTypeIdentifierDistanceWalkingRunning;
  switch(a3)
  {
    case 1uLL:
      v7 = &HKQuantityTypeIdentifierAppleExerciseTime;
      goto LABEL_17;
    case 2uLL:
      v7 = &HKQuantityTypeIdentifierActiveEnergyBurned;
      goto LABEL_17;
    case 3uLL:
      goto LABEL_17;
    case 4uLL:
      v7 = &HKQuantityTypeIdentifierDistanceCycling;
      goto LABEL_17;
    case 6uLL:
      v7 = &HKQuantityTypeIdentifierFlightsClimbed;
      goto LABEL_17;
    case 7uLL:
      v7 = &HKQuantityTypeIdentifierStepCount;
      goto LABEL_17;
    case 9uLL:
      if (a4 != 6) {
        goto LABEL_13;
      }
      v7 = &HKQuantityTypeIdentifierCyclingSpeed;
      goto LABEL_17;
    case 0x10uLL:
      if (a4 != 6) {
        goto LABEL_13;
      }
      v7 = &HKQuantityTypeIdentifierCyclingPower;
      goto LABEL_17;
    case 0x12uLL:
      if (a4 == 6)
      {
        v7 = &HKQuantityTypeIdentifierCyclingCadence;
LABEL_17:
        int v6 = +[HKObjectType quantityTypeForIdentifier:](HKSampleType, "quantityTypeForIdentifier:", *v7, a4, v4);
LABEL_18:
      }
      else
      {
LABEL_13:
        int v6 = 0;
      }
      return v6;
    case 0x14uLL:
      v7 = &HKQuantityTypeIdentifierHeartRate;
      goto LABEL_17;
    default:
      goto LABEL_18;
  }
}

+ (id)signedClinicalDataRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)procedureRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)diagnosticTestResultTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)conditionRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)medicationDispenseRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)diagnosticTestReportTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)coverageRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (HKObjectType)init
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (void)_enumerateDataTypeCodesWithHandler:(id)a3
{
  unint64_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = 0;
  uint64_t v5 = HKDataTypeDefinitions;
  do
  {
    memset(v7, 0, sizeof(v7));
    __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)v7, (uint64_t)v5);
    uint64_t v6 = *(void *)&v7[0];
    __destructor_8_s0_s8_s16_s24_s32((uint64_t)v7);
    if (v6) {
      v3[2](v3, v4);
    }
    ++v4;
    v5 += 6;
  }
  while (v4 != 317);
}

+ (void)_enumerateObjectTypesWithHandler:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v6 = (void (**)(id, void *))a3;
  do
  {
    uint64_t v5 = [a1 dataTypeWithCode:v4];
    if (v5) {
      v6[2](v6, v5);
    }

    ++v4;
  }
  while (v4 != 317);
}

+ (id)_allDataTypeIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HKObjectType__allDataTypeIdentifiers__block_invoke;
  _OWORD v7[3] = &unk_1E58C4DF8;
  id v8 = v3;
  id v4 = v3;
  [a1 _enumerateDataTypeCodesWithHandler:v7];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

void __39__HKObjectType__allDataTypeIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  memset(v4, 0, sizeof(v4));
  __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)v4, (uint64_t)&HKDataTypeDefinitions[6 * a2]);
  id v3 = *(id *)&v4[0];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  __destructor_8_s0_s8_s16_s24_s32((uint64_t)v4);
}

+ (id)_allTypesOfClass:(Class)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__HKObjectType__allTypesOfClass___block_invoke;
  v9[3] = &unk_1E58C4E20;
  id v11 = a1;
  Class v12 = a3;
  id v10 = v5;
  id v6 = v5;
  [a1 _enumerateDataTypeCodesWithHandler:v9];
  v7 = (void *)[v6 copy];

  return v7;
}

uint64_t __33__HKObjectType__allTypesOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 40) _dataTypeWithCode:a2 expectedClass:*(void *)(a1 + 48)];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return MEMORY[0x1F41817F8]();
}

+ (id)_allBinarySampleTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = &unk_1EED10FF8;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __37__HKObjectType__allBinarySampleTypes__block_invoke;
  Class v12 = &unk_1E58C4E48;
  id v13 = v4;
  id v14 = v3;
  id v5 = v3;
  id v6 = v4;
  [a1 _enumerateObjectTypesWithHandler:&v9];
  v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __37__HKObjectType__allBinarySampleTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend((id)objc_msgSend(v3, "dataObjectClass"), "conformsToProtocol:", *(void *)(a1 + 32))) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

+ (id)_allScoredAssessmentTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = &unk_1EECF8338;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __41__HKObjectType__allScoredAssessmentTypes__block_invoke;
  Class v12 = &unk_1E58C4E48;
  id v13 = v4;
  id v14 = v3;
  id v5 = v3;
  id v6 = v4;
  [a1 _enumerateObjectTypesWithHandler:&v9];
  v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

void __41__HKObjectType__allScoredAssessmentTypes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend((id)objc_msgSend(v3, "dataObjectClass"), "conformsToProtocol:", *(void *)(a1 + 32))) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

+ (id)_typesIncludingParentTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] setWithSet:v3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "parentType", (void)v14);

        if (v11)
        {
          Class v12 = [v10 parentType];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_lock_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4
{
  uint64_t v8 = (id *)((char *)&_lock_dataTypeWithCode_expectedClass__uniquedDataTypes + 8 * a3);
  id v9 = *v8;
  if (v9)
  {
    uint64_t v10 = v9;
    if (a4 && ([(id)objc_opt_class() isSubclassOfClass:a4] & 1) == 0)
    {

      uint64_t v10 = 0;
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)aClassName = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24_s32_t40w4((uint64_t)aClassName, (uint64_t)&HKDataTypeDefinitions[6 * a3]);
    if (SWORD4(v19) != a3)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HKObjectType.m", 162, @"definition for wrong code (%d) at index %d", SWORD4(v19), a3);
    }
    Class v11 = NSClassFromString(aClassName[1]);
    Class v12 = v11;
    if (a4 && ![(objc_class *)v11 isSubclassOfClass:a4])
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v13 = [v12 alloc];
      uint64_t v10 = (void *)[v13 _initWithCode:SWORD4(v19)];
      if ((void)v19)
      {
        long long v14 = objc_msgSend(a1, "_lock_dataTypeWithCode:expectedClass:", objc_msgSend((id)v19, "longLongValue"), 0);
        [v10 setParentType:v14];
      }
      objc_storeStrong(v8, v10);
    }
    __destructor_8_s0_s8_s16_s24_s32((uint64_t)aClassName);
  }

  return v10;
}

+ (id)_dataTypeWithCode:(int64_t)a3 expectedClass:(Class)a4
{
  if ((unint64_t)a3 >= 0x13D) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"invalid data type code (%ld)", a3);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_dataTypeWithCode_expectedClass__lock);
  uint64_t v7 = objc_msgSend(a1, "_lock_dataTypeWithCode:expectedClass:", a3, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_dataTypeWithCode_expectedClass__lock);

  return v7;
}

+ (id)dataTypeWithNumber:(id)a3
{
  uint64_t v4 = [a3 integerValue];

  return (id)[a1 dataTypeWithCode:v4];
}

+ (HKCorrelationType)correlationTypeForIdentifier:(HKCorrelationTypeIdentifier)identifier
{
  uint64_t v4 = identifier;
  id v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKCorrelationType *)v5;
}

+ (HKDocumentType)documentTypeForIdentifier:(HKDocumentTypeIdentifier)identifier
{
  uint64_t v4 = identifier;
  id v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKDocumentType *)v5;
}

+ (id)scoredAssessmentTypeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)userTrackedConceptTypeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (HKActivitySummaryType)activitySummaryType
{
  return (HKActivitySummaryType *)+[HKObjectType dataTypeWithCode:100];
}

+ (HKAudiogramSampleType)audiogramSampleType
{
  return (HKAudiogramSampleType *)+[HKObjectType dataTypeWithCode:145];
}

+ (HKElectrocardiogramType)electrocardiogramType
{
  return (HKElectrocardiogramType *)+[HKObjectType dataTypeWithCode:144];
}

+ (id)stateOfMindType
{
  return +[HKObjectType dataTypeWithCode:284];
}

+ (HKPrescriptionType)visionPrescriptionType
{
  return (HKPrescriptionType *)+[HKObjectType dataTypeWithCode:257];
}

+ (id)workoutZonesTypeForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)appleBalanceMetricsType
{
  return +[HKObjectType dataTypeWithCode:305];
}

+ (id)GAD7AssessmentType
{
  v2 = [[HKScoredAssessmentType alloc] initWithIdentifier:@"HKScoredAssessmentTypeIdentifierGAD7"];

  return v2;
}

+ (id)PHQ9AssessmentType
{
  v2 = [[HKScoredAssessmentType alloc] initWithIdentifier:@"HKScoredAssessmentTypeIdentifierPHQ9"];

  return v2;
}

+ (id)_typeWithIdentifier:(id)a3
{
  return (id)[a1 _typeWithIdentifier:a3 expectedClass:0];
}

+ (int64_t)_typeCodeForIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = HKDataTypeCodeFromTypeIdentifier((uint64_t)v3);
  if (v4
    || ([&unk_1EECE6568 objectForKeyedSubscript:v3],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v5 = [v4 unsignedIntValue];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "Failed to resolve data type code for identifier %@", (uint8_t *)&v8, 0xCu);
    }
    int64_t v5 = -1;
  }

  return v5;
}

+ (id)_typeWithIdentifier:(id)a3 expectedClass:(Class)a4
{
  unint64_t v6 = [a1 _typeCodeForIdentifier:a3];
  if (v6 > 0x13C)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [a1 _dataTypeWithCode:v6 expectedClass:a4];
  }

  return v7;
}

+ (id)_objectTypesFromIdentifierArray:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = a4;
    id v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v14 = v13;
        uint64_t v15 = +[HKObjectType _typeWithIdentifier:v14];
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v23, 3, @"Invalid type identifier \"%@\"", v14);

          goto LABEL_15;
        }
        long long v16 = (void *)v15;
        [v7 addObject:v15];

        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = objc_opt_class();
      objc_msgSend(v20, "hk_assignError:code:format:", v23, 3, @"Type identifier %@ has invalid class (expected %@, found %@)", v13, v21, objc_opt_class());
LABEL_15:

      long long v17 = 0;
      goto LABEL_16;
    }
LABEL_11:

    long long v17 = (void *)[v7 copy];
LABEL_16:
  }
  else
  {
    long long v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = objc_opt_class();
    objc_msgSend(v18, "hk_assignError:code:format:", a4, 3, @"Invalid type identifier array (expected %@, found %@)", v19, objc_opt_class());
    long long v17 = 0;
  }

  return v17;
}

+ (id)_clinicalTypesFromTypes:(id)a3
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_77);
}

uint64_t __40__HKObjectType__clinicalTypesFromTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isClinicalType];
}

+ (id)_nonClinicalTypesFromTypes:(id)a3
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_147);
}

uint64_t __43__HKObjectType__nonClinicalTypesFromTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isClinicalType] ^ 1;
}

+ (id)moveMinuteGoal
{
  return +[HKObjectType dataTypeWithCode:180];
}

+ (id)exerciseGoal
{
  return +[HKObjectType dataTypeWithCode:105];
}

+ (id)standGoal
{
  return +[HKObjectType dataTypeWithCode:104];
}

+ (id)activityGoalScheduleType
{
  return +[HKObjectType dataTypeWithCode:299];
}

+ (id)pauseRingsScheduleType
{
  return +[HKObjectType dataTypeWithCode:300];
}

+ (id)coachingEventType
{
  return +[HKObjectType dataTypeWithCode:98];
}

+ (id)heartRateType
{
  return +[HKObjectType dataTypeWithCode:5];
}

+ (id)tachycardiaType
{
  return +[HKObjectType dataTypeWithCode:140];
}

+ (id)bradycardiaType
{
  return +[HKObjectType dataTypeWithCode:147];
}

+ (id)heartStudyEventType
{
  return +[HKObjectType dataTypeWithCode:141];
}

+ (id)atrialFibrillationEventType
{
  return +[HKObjectType dataTypeWithCode:156];
}

+ (id)environmentalAudioExposureEventType
{
  return +[HKObjectType dataTypeWithCode:178];
}

+ (id)headphoneAudioExposureEventType
{
  return +[HKObjectType dataTypeWithCode:199];
}

+ (id)activityMoveModeChangeType
{
  return +[HKObjectType dataTypeWithCode:190];
}

+ (id)menstrualFlowType
{
  return +[HKObjectType dataTypeWithCode:95];
}

+ (id)contraceptiveType
{
  return +[HKObjectType dataTypeWithCode:193];
}

+ (id)lactationType
{
  return +[HKObjectType dataTypeWithCode:192];
}

+ (id)pregnancyType
{
  return +[HKObjectType dataTypeWithCode:191];
}

+ (id)bloodPressureType
{
  return +[HKObjectType dataTypeWithCode:80];
}

+ (id)sleepDurationGoalType
{
  return +[HKObjectType dataTypeWithCode:197];
}

+ (id)sleepScheduleType
{
  return +[HKObjectType dataTypeWithCode:198];
}

+ (id)lowCardioFitnessEventType
{
  return +[HKObjectType dataTypeWithCode:236];
}

+ (id)handwashingEventType
{
  return +[HKObjectType dataTypeWithCode:237];
}

- (BOOL)isHealthRecordsType
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)attachmentSchemaIdentifier
{
  BOOL v2 = [(HKObjectType *)self isHealthRecordsType];
  id v3 = &HKAttachmentClinicalRecordSchemaIdentifier;
  if (!v2) {
    id v3 = HKAttachmentObjectSchemaIdentifier;
  }
  id v4 = *v3;

  return v4;
}

- (id)_initWithCode:(int64_t)a3
{
  __int16 v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKObjectType;
  id result = [(HKObjectType *)&v5 init];
  if (result) {
    *((_WORD *)result + 4) = v3;
  }
  return result;
}

- ($E8A27014057A1F053A0599C3679047E8)_definition
{
  return ($E8A27014057A1F053A0599C3679047E8 *)&HKDataTypeDefinitions[6 * self->_code];
}

- (BOOL)isClinicalType
{
  return 0;
}

- (BOOL)supportsExport
{
  return (_BYTE)[(HKObjectType *)self _definition][43] & 1;
}

- (BOOL)enabled
{
  return HKTypeIsEnabled(self->_code);
}

- (BOOL)requiresPerObjectAuthorization
{
  return HKDataTypeRequiresPerObjectAuthorization(self->_code);
}

- (id)_predicateForSDKVersionToken:(unint64_t)a3
{
  return 0;
}

- (HKObjectType)parentType
{
  return self->_parentType;
}

+ (id)medicalTypeForIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (BOOL)sharingAuthorizationAllowed
{
  return (BYTE3(HKDataTypeDefinitions[6 * [(HKObjectType *)self code] + 5]) >> 2) & 1;
}

- (BOOL)readingAuthorizationAllowed
{
  return (BYTE3(HKDataTypeDefinitions[6 * [(HKObjectType *)self code] + 5]) >> 1) & 1;
}

+ (BOOL)_allowAuthorizationForSharingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5
{
  return [a1 _allowAuthorizationForSharing:1 types:a3 entitlements:a4 disallowedTypes:a5];
}

+ (BOOL)_allowAuthorizationForReadingWithTypes:(id)a3 entitlements:(id)a4 disallowedTypes:(id)a5
{
  return [a1 _allowAuthorizationForSharing:0 types:a3 entitlements:a4 disallowedTypes:a5];
}

+ (BOOL)_allowAuthorizationForSharing:(BOOL)a3 types:(id)a4 entitlements:(id)a5 disallowedTypes:(id)a6
{
  BOOL v8 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    char v15 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v9);
        }
        long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v8)
        {
          if ([v17 sharingAuthorizationAllowed]
            && (HKAllowShareAuthorizationForTypeWithEntitlements([v17 code], v10) & 1) != 0)
          {
            goto LABEL_12;
          }
        }
        else if ([v17 readingAuthorizationAllowed] {
               && (HKAllowReadAuthorizationForTypeWithEntitlements([v17 code], v10) & 1) != 0)
        }
        {
LABEL_12:
          char v18 = 1;
          goto LABEL_14;
        }
        [v11 addObject:v17];
        char v18 = 0;
LABEL_14:
        v15 &= v18;
      }
      uint64_t v13 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v13) {
        goto LABEL_18;
      }
    }
  }
  char v15 = 1;
LABEL_18:

  return v15;
}

+ (HKClinicalType)clinicalTypeForIdentifier:(HKClinicalTypeIdentifier)identifier
{
  id v4 = identifier;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return (HKClinicalType *)v5;
}

+ (id)vaccinationRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)verifiableClinicalRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)medicationRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

+ (id)clinicalNoteRecordTypeForIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _typeWithIdentifier:v4 expectedClass:objc_opt_class()];

  return v5;
}

@end