@interface HKAudiogramSample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (HKAudiogramSample)audiogramSampleWithLeftEarAverageSensitivity:(id)a3 rightEarAverageSensitivity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8;
+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(NSArray *)sensitivityPoints startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata;
+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7;
+ (double)_randomDecibelValueInRangeFromStart:(double)a3 end:(double)a4;
+ (id)_decodeSensitivityData:(id)a3;
+ (id)_encodeSensitivityPoints:(id)a3;
+ (id)_sensitivityPointWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5 error:(id *)a6;
+ (id)clampingLowestBoundForValidityCheck;
+ (id)clampingMaximumLowerBoundForValidityCheckPerFrequency;
+ (id)ptaFrequencies;
+ (id)randomAudiogramSampleWithClassification:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7;
+ (id)randomAudiogramSampleWithLeftEarClassification:(unint64_t)a3 rightEarClassification:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8;
+ (id)randomSensitivityValueForClassification:(unint64_t)a3;
- (BOOL)_firstPartyHearingTest;
- (BOOL)_firstPartyIngestion;
- (BOOL)containSensitivityPointsIsMasked:(BOOL)a3 forSide:(int64_t)a4;
- (BOOL)hasDifferentClassificationWithModifiedClampingRange;
- (BOOL)hasSomeClampingForAnyFrequency:(id)a3;
- (BOOL)hasTooMuchClampingForAnyFrequency:(id)a3;
- (BOOL)hasTooMuchClampingForAnyKeyFrequency:(id)a3;
- (BOOL)isAmbiguous;
- (BOOL)isAverageSensitivityUpperClampedForAnySide;
- (BOOL)isAverageSensitivityUpperClampedForSide:(int64_t)a3;
- (BOOL)isFirstPartyHearingTestResult;
- (HKAudiogramSample)initWithCoder:(id)a3;
- (HKHearingLevelSummary)hearingLevelSummary;
- (NSArray)sensitivityPoints;
- (NSData)encodedSensitivityPoints;
- (id)_keyFrequencyPointsFrom:(id)a3 forSide:(int64_t)a4;
- (id)_validateSensitivityPointsOrderedAscending;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)averageLeftEarSensitivity;
- (id)averageRightEarSensitivity;
- (id)averageSensitivityForSide:(int64_t)a3;
- (id)clampingLowerBoundPositionsPerFrequencyAtSide:(int64_t)a3;
- (id)localizedIngestionSource;
- (id)maximumSensitivity;
- (id)minimumSensitivity;
- (unint64_t)_rawHearingLevelClassificationFrom:(id)a3;
- (unint64_t)diagnostic;
- (unint64_t)leftEarDiagnostic;
- (unint64_t)rightEarDiagnostic;
- (void)encodeWithCoder:(id)a3;
- (void)hasDifferentClassificationWithModifiedClampingRange;
- (void)setEncodedSensitivityPoints:(id)a3;
@end

@implementation HKAudiogramSample

+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(id)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = +[HKObjectType audiogramSampleType];
  [v16 timeIntervalSinceReferenceDate];
  double v19 = v18;

  [v15 timeIntervalSinceReferenceDate];
  double v21 = v20;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__HKAudiogramSample_audiogramSampleWithSensitivityPoints_startDate_endDate_device_metadata___block_invoke;
  v25[3] = &unk_1E58C5918;
  id v26 = v12;
  id v22 = v12;
  v23 = (void *)[a1 _newSampleWithType:v17 startDate:v14 endDate:v13 device:v25 metadata:v19 config:v21];

  return (HKAudiogramSample *)v23;
}

void __92__HKAudiogramSample_audiogramSampleWithSensitivityPoints_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[HKAudiogramSample _encodeSensitivityPoints:v2];
  [v3 _setPayload:v4];
}

+ (HKAudiogramSample)audiogramSampleWithSensitivityPoints:(NSArray *)sensitivityPoints startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKAudiogramSample *)[a1 audiogramSampleWithSensitivityPoints:sensitivityPoints startDate:startDate endDate:endDate device:0 metadata:metadata];
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKAudiogramSample;
  id v4 = -[HKSample _validateWithConfiguration:](&v9, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(HKAudiogramSample *)self _validateSensitivityPointsOrderedAscending];
  }
  v7 = v6;

  return v7;
}

- (id)_validateSensitivityPointsOrderedAscending
{
  id v4 = [(HKAudiogramSample *)self sensitivityPoints];
  unint64_t v5 = [v4 count];

  id v6 = [(HKAudiogramSample *)self sensitivityPoints];
  v7 = +[HKUnit hertzUnit];
  if (v5 >= 0x1F)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"Audiograms are limited to %d sensitivity points per sample"", 30);
    double v20 = LABEL_10:;
    goto LABEL_11;
  }
  if (!v5)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    double v19 = @"An audiogram sample must have at least 1 sensitivity point";
LABEL_9:
    objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v18, a2, v19, v22);
    goto LABEL_10;
  }
  uint64_t v8 = 1;
  while (v5 != v8)
  {
    objc_super v9 = [v6 objectAtIndexedSubscript:v8 - 1];
    v10 = [v9 frequency];
    [v10 doubleValueForUnit:v7];
    double v12 = v11;

    id v13 = [v6 objectAtIndexedSubscript:v8];
    id v14 = [v13 frequency];
    [v14 doubleValueForUnit:v7];
    double v16 = v15;

    ++v8;
    if (v12 >= v16)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = objc_opt_class();
      double v19 = @"Audiogram frequencies must be unique and in ascending order.";
      goto LABEL_9;
    }
  }
  double v20 = 0;
LABEL_11:

  return v20;
}

+ (id)_encodeSensitivityPoints:(id)a3
{
  id v7 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    unint64_t v5 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKAudiogramSample _encodeSensitivityPoints:]((uint64_t)v4, v5);
    }
  }

  return v3;
}

+ (id)_decodeSensitivityData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v3, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  id v12 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v7 fromData:v4 error:&v12];

  id v9 = v12;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKAudiogramSample _decodeSensitivityData:]((uint64_t)v9, v10);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (NSArray)sensitivityPoints
{
  uint64_t v2 = [(HKAudiogramSample *)self encodedSensitivityPoints];
  id v3 = +[HKAudiogramSample _decodeSensitivityData:v2];

  return (NSArray *)v3;
}

- (HKHearingLevelSummary)hearingLevelSummary
{
  hearingLevelSummary = self->_hearingLevelSummary;
  if (!hearingLevelSummary)
  {
    id v4 = +[HKHearingLevelSummary summaryForAudiogramSample:self];
    uint64_t v5 = self->_hearingLevelSummary;
    self->_hearingLevelSummary = v4;

    hearingLevelSummary = self->_hearingLevelSummary;
  }

  return hearingLevelSummary;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAudiogramSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKAudiogramSample;
  uint64_t v5 = [(HKSample *)&v8 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudiogramDataKey"];
    [(HKAudiogramSample *)v5 _setPayload:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKAudiogramSample;
  id v4 = a3;
  [(HKSample *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(HKAudiogramSample *)self encodedSensitivityPoints];
  [v4 encodeObject:v5 forKey:@"AudiogramDataKey"];
}

- (unint64_t)diagnostic
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 overallMetrics];
  id v4 = [v3 averageSensitivity];
  unint64_t v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (unint64_t)leftEarDiagnostic
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 leftEarMetrics];
  id v4 = [v3 averageSensitivity];
  unint64_t v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (unint64_t)rightEarDiagnostic
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 rightEarMetrics];
  id v4 = [v3 averageSensitivity];
  unint64_t v5 = HKHearingLevelClassificationForSensitivity(v4);

  return v5;
}

- (id)averageLeftEarSensitivity
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 leftEarMetrics];
  id v4 = [v3 averageSensitivity];

  return v4;
}

- (id)averageRightEarSensitivity
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 rightEarMetrics];
  id v4 = [v3 averageSensitivity];

  return v4;
}

- (id)minimumSensitivity
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 overallMetrics];
  id v4 = [v3 minimumSensitivity];

  return v4;
}

- (id)maximumSensitivity
{
  uint64_t v2 = [(HKAudiogramSample *)self hearingLevelSummary];
  id v3 = [v2 overallMetrics];
  id v4 = [v3 maximumSensitivity];

  return v4;
}

- (BOOL)containSensitivityPointsIsMasked:(BOOL)a3 forSide:(int64_t)a4
{
  objc_super v6 = [(HKAudiogramSample *)self sensitivityPoints];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__HKAudiogramSample_containSensitivityPointsIsMasked_forSide___block_invoke;
  v8[3] = &__block_descriptor_41_e37_B16__0__HKAudiogramSensitivityPoint_8l;
  v8[4] = a4;
  BOOL v9 = a3;
  LOBYTE(a4) = objc_msgSend(v6, "hk_containsObjectPassingTest:", v8);

  return a4;
}

uint64_t __62__HKAudiogramSample_containSensitivityPointsIsMasked_forSide___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tests];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HKAudiogramSample_containSensitivityPointsIsMasked_forSide___block_invoke_2;
  v6[3] = &__block_descriptor_41_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v6[4] = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "hk_containsObjectPassingTest:", v6);

  return v4;
}

BOOL __62__HKAudiogramSample_containSensitivityPointsIsMasked_forSide___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 side] == *(void *)(a1 + 32)
    && *(unsigned __int8 *)(a1 + 40) == [v3 masked];

  return v4;
}

- (id)averageSensitivityForSide:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    BOOL v4 = [(HKAudiogramSample *)self hearingLevelSummary];
    unint64_t v5 = [v4 rightEarMetrics];
  }
  else
  {
    BOOL v4 = [(HKAudiogramSample *)self hearingLevelSummary];
    unint64_t v5 = [v4 leftEarMetrics];
  }
  objc_super v6 = v5;
  id v3 = [v5 averageSensitivity];

LABEL_6:

  return v3;
}

- (id)localizedIngestionSource
{
  if ([(HKAudiogramSample *)self _firstPartyHearingTest])
  {
    id v3 = HKHealthKitFrameworkBundle();
    BOOL v4 = v3;
    unint64_t v5 = @"AUDIOGRAM_APPLE_HEARING_TEST";
LABEL_5:
    objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_1EEC60288 table:@"Localizable-Yodel"];
    goto LABEL_7;
  }
  if ([(HKAudiogramSample *)self _firstPartyIngestion])
  {
    id v3 = HKHealthKitFrameworkBundle();
    BOOL v4 = v3;
    unint64_t v5 = @"AUDIOGRAM_MANUAL_INGESTION";
    goto LABEL_5;
  }
  BOOL v4 = [(HKObject *)self sourceRevision];
  char v7 = [v4 source];
  objc_super v6 = [v7 name];

LABEL_7:

  return v6;
}

- (BOOL)_firstPartyHearingTest
{
  uint64_t v2 = [(HKObject *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:@"_HKPrivateMetadataKeyHearingTestTakenFromFirstParty"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_firstPartyIngestion
{
  id v3 = [(HKObject *)self metadata];
  char v4 = [v3 objectForKeyedSubscript:@"_HKPrivateMetadataKeyAudiogramManualIngestionFromFirstParty"];

  char v5 = [v4 BOOLValue];
  if (v4 && (v5 & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [(HKObject *)self sourceRevision];
    objc_super v8 = [v7 source];
    BOOL v9 = [v8 bundleIdentifier];

    if (v9)
    {
      v10 = [(HKObject *)self sourceRevision];
      double v11 = [v10 source];
      id v12 = [v11 bundleIdentifier];

      BOOL v6 = ([v12 isEqualToString:@"com.apple.Health"] & 1) != 0
        || [v12 isEqualToString:@"com.apple.Preferences"];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

+ (id)clampingLowestBoundForValidityCheck
{
  return &unk_1EECE4A48;
}

+ (id)clampingMaximumLowerBoundForValidityCheckPerFrequency
{
  return (id)objc_msgSend(&unk_1EECE6D20, "hk_mapToDictionary:", &__block_literal_global_89);
}

void __74__HKAudiogramSample_clampingMaximumLowerBoundForValidityCheckPerFrequency__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  char v5 = a3;
  id v6 = a2;
  id v12 = +[HKUnit hertzUnit];
  [v6 doubleValue];
  double v8 = v7;

  BOOL v9 = +[HKQuantity quantityWithUnit:v12 doubleValue:v8];
  v10 = +[HKUnit decibelHearingLevelUnit];
  double v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:20.0];
  ((void (**)(void, void *, void *))a3)[2](v5, v9, v11);
}

+ (id)ptaFrequencies
{
  return (id)objc_msgSend(&unk_1EECE6D08, "hk_map:", &__block_literal_global_77);
}

id __35__HKAudiogramSample_ptaFrequencies__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HKUnit hertzUnit];
  [v2 doubleValue];
  double v5 = v4;

  id v6 = +[HKQuantity quantityWithUnit:v3 doubleValue:v5];

  return v6;
}

- (BOOL)hasSomeClampingForAnyFrequency:(id)a3
{
  id v3 = objc_msgSend(a3, "hk_filter:", &__block_literal_global_80);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

BOOL __52__HKAudiogramSample_hasSomeClampingForAnyFrequency___block_invoke(uint64_t a1, void *a2)
{
  return (int)[a2 intValue] > 1;
}

- (BOOL)isAmbiguous
{
  id v3 = [(HKAudiogramSample *)self clampingLowerBoundPositionsPerFrequencyAtSide:0];
  BOOL v4 = [(HKAudiogramSample *)self clampingLowerBoundPositionsPerFrequencyAtSide:1];
  double v5 = [v3 allValues];
  id v6 = objc_msgSend(v5, "hk_filter:", &__block_literal_global_82_0);

  double v7 = [v4 allValues];
  double v8 = objc_msgSend(v7, "hk_filter:", &__block_literal_global_84);

  if (![v6 count] && !objc_msgSend(v8, "count")
    || ![(HKAudiogramSample *)self hasSomeClampingForAnyFrequency:v6]
    && ![(HKAudiogramSample *)self hasSomeClampingForAnyFrequency:v8])
  {
    goto LABEL_11;
  }
  if (![(HKAudiogramSample *)self hasTooMuchClampingForAnyFrequency:v6]
    && ![(HKAudiogramSample *)self hasTooMuchClampingForAnyFrequency:v8])
  {
    if ([(HKAudiogramSample *)self hasTooMuchClampingForAnyKeyFrequency:v3]
      || [(HKAudiogramSample *)self hasTooMuchClampingForAnyKeyFrequency:v4])
    {
      BOOL v9 = [(HKAudiogramSample *)self hasDifferentClassificationWithModifiedClampingRange];
      goto LABEL_12;
    }
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

BOOL __32__HKAudiogramSample_isAmbiguous__block_invoke(uint64_t a1, void *a2)
{
  return [a2 intValue] != 0;
}

BOOL __32__HKAudiogramSample_isAmbiguous__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 intValue] != 0;
}

- (BOOL)hasTooMuchClampingForAnyFrequency:(id)a3
{
  id v3 = objc_msgSend(a3, "hk_filter:", &__block_literal_global_86);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

BOOL __55__HKAudiogramSample_hasTooMuchClampingForAnyFrequency___block_invoke(uint64_t a1, void *a2)
{
  return [a2 intValue] == 3;
}

- (BOOL)hasTooMuchClampingForAnyKeyFrequency:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = +[HKAudiogramSample ptaFrequencies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = [v3 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        BOOL v9 = v8;
        if (v8 && (int)[v8 intValue] > 1)
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v5;
}

- (BOOL)hasDifferentClassificationWithModifiedClampingRange
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v2 = [(HKAudiogramSample *)self sensitivityPoints];
  id v3 = objc_msgSend(v2, "hk_filter:", &__block_literal_global_88);

  unint64_t v4 = 0x1E4F1C000uLL;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v64;
    v48 = v6;
    v49 = v5;
    uint64_t v43 = *(void *)v64;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v44 = v7;
      do
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v45 = v9;
        v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
        id v11 = objc_alloc_init(*(Class *)(v4 + 2632));
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v46 = v10;
        id obj = [v10 tests];
        uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
        id v12 = 0;
        if (v53)
        {
          id v51 = v11;
          uint64_t v52 = *(void *)v60;
          while (2)
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v60 != v52) {
                objc_enumerationMutation(obj);
              }
              long long v14 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              double v15 = objc_msgSend(v14, "sensitivity", v43);
              uint64_t v16 = [v14 clampingRange];

              if (v16)
              {
                v55 = v15;
                v17 = NSNumber;
                uint64_t v18 = [v14 clampingRange];
                double v19 = [v18 upperBound];
                double v20 = +[HKUnit decibelHearingLevelUnit];
                [v19 doubleValueForUnit:v20];
                double v21 = objc_msgSend(v17, "numberWithDouble:");

                uint64_t v22 = +[HKAudiogramSample clampingLowestBoundForValidityCheck];
                id v58 = v12;
                v23 = +[HKAudiogramSensitivityPointClampingRange clampingRangeWithLowerBound:v22 upperBound:v21 error:&v58];
                id v54 = v58;

                v24 = [v14 sensitivity];
                v25 = +[HKUnit decibelHearingLevelUnit];
                [v24 doubleValueForUnit:v25];
                double v27 = v26;
                v28 = [v14 clampingRange];
                v29 = [v28 lowerBound];
                v30 = +[HKUnit decibelHearingLevelUnit];
                [v29 doubleValueForUnit:v30];
                if (v27 <= v31) {
                  [v23 lowerBound];
                }
                else {
                double v15 = [v14 sensitivity];
                }

                id v12 = v54;
                id v11 = v51;
                if (v54)
                {
LABEL_24:
                  _HKInitializeLogging();
                  if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR)) {
                    -[HKAudiogramSample hasDifferentClassificationWithModifiedClampingRange]();
                  }

                  id v6 = v48;
                  id v5 = v49;
                  goto LABEL_27;
                }
              }
              else
              {
                v23 = 0;
                if (v12) {
                  goto LABEL_24;
                }
              }
              v32 = [HKAudiogramSensitivityTest alloc];
              uint64_t v33 = [v14 type];
              uint64_t v34 = [v14 masked];
              uint64_t v35 = [v14 side];
              id v57 = 0;
              v36 = [(HKAudiogramSensitivityTest *)v32 initWithSensitivity:v15 type:v33 masked:v34 side:v35 clampingRange:v23 error:&v57];
              id v12 = v57;
              [v11 addObject:v36];
            }
            uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
            if (v53) {
              continue;
            }
            break;
          }
        }

        v37 = [v46 frequency];
        id v56 = v12;
        v38 = +[HKAudiogramSensitivityPoint sensitivityPointWithFrequency:v37 tests:v11 error:&v56];
        id v39 = v56;

        id v5 = v49;
        [v49 addObject:v38];

        if (v39)
        {
          _HKInitializeLogging();
          id v6 = v48;
          if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR)) {
            -[HKAudiogramSample hasDifferentClassificationWithModifiedClampingRange]();
          }
          id v12 = v39;
LABEL_27:

          BOOL v41 = 1;
          goto LABEL_28;
        }

        uint64_t v9 = v45 + 1;
        id v6 = v48;
        unint64_t v4 = 0x1E4F1C000;
        uint64_t v8 = v43;
      }
      while (v45 + 1 != v44);
      uint64_t v7 = [v48 countByEnumeratingWithState:&v63 objects:v68 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unint64_t v40 = [(HKAudiogramSample *)self _rawHearingLevelClassificationFrom:v5];
  BOOL v41 = [(HKAudiogramSample *)self _rawHearingLevelClassificationFrom:v6] != v40;
LABEL_28:

  return v41;
}

uint64_t __72__HKAudiogramSample_hasDifferentClassificationWithModifiedClampingRange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HKAudiogramSample ptaFrequencies];
  unint64_t v4 = [v2 frequency];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

- (unint64_t)_rawHearingLevelClassificationFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKAudiogramSample *)self _keyFrequencyPointsFrom:v4 forSide:0];
  id v6 = [(HKAudiogramSample *)self _keyFrequencyPointsFrom:v4 forSide:1];

  uint64_t v7 = HKPureToneAverageFromPureToneSensitivityPoints(v5);
  uint64_t v8 = HKPureToneAverageFromPureToneSensitivityPoints(v6);
  uint64_t v9 = HKQuantityMin(v7, v8);
  unint64_t v10 = HKHearingLevelClassificationForSensitivity(v9);

  return v10;
}

- (id)_keyFrequencyPointsFrom:(id)a3 forSide:(int64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HKAudiogramSample__keyFrequencyPointsFrom_forSide___block_invoke;
  v6[3] = &__block_descriptor_40_e37__16__0__HKAudiogramSensitivityPoint_8l;
  v6[4] = a4;
  id v4 = objc_msgSend(a3, "hk_map:", v6);

  return v4;
}

id __53__HKAudiogramSample__keyFrequencyPointsFrom_forSide___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tests];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HKAudiogramSample__keyFrequencyPointsFrom_forSide___block_invoke_2;
  v7[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v7[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_firstObjectPassingTest:", v7);
  uint64_t v5 = [v4 sensitivity];

  return v5;
}

BOOL __53__HKAudiogramSample__keyFrequencyPointsFrom_forSide___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (id)clampingLowerBoundPositionsPerFrequencyAtSide:(int64_t)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [(HKAudiogramSample *)self sensitivityPoints];
  uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v5;
        id v6 = *(void **)(*((void *)&v43 + 1) + 8 * v5);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v38 = [v6 tests];
        uint64_t v7 = [v38 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v40 != v9) {
                objc_enumerationMutation(v38);
              }
              id v11 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if ([v11 side] == a3)
              {
                id v12 = [v11 clampingRange];
                long long v13 = [v12 lowerBound];

                if (v13)
                {
                  long long v14 = [v6 frequency];
                  double v15 = [v11 clampingRange];
                  uint64_t v16 = [v15 lowerBound];
                  v17 = +[HKUnit decibelHearingLevelUnit];
                  [v16 doubleValueForUnit:v17];
                  double v19 = v18;

                  double v20 = +[HKAudiogramSample clampingLowestBoundForValidityCheck];
                  [v20 doubleValue];
                  double v22 = v21;

                  v23 = +[HKAudiogramSample clampingMaximumLowerBoundForValidityCheckPerFrequency];
                  v24 = [v23 objectForKey:v14];
                  v25 = +[HKUnit decibelHearingLevelUnit];
                  [v24 doubleValueForUnit:v25];
                  double v27 = v26;

                  if (v19 <= v27) {
                    unsigned int v28 = 2;
                  }
                  else {
                    unsigned int v28 = 3;
                  }
                  if (v19 < v22) {
                    uint64_t v29 = 1;
                  }
                  else {
                    uint64_t v29 = v28;
                  }
                  v30 = [NSNumber numberWithInt:v29];
                  double v31 = [v6 frequency];
                  [v37 setObject:v30 forKey:v31];
                }
                else
                {
                  long long v14 = [NSNumber numberWithInt:0];
                  v30 = [v6 frequency];
                  [v37 setObject:v14 forKey:v30];
                }
              }
            }
            uint64_t v8 = [v38 countByEnumeratingWithState:&v39 objects:v47 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v35);
  }

  return v37;
}

- (BOOL)isAverageSensitivityUpperClampedForSide:(int64_t)a3
{
  uint64_t v5 = -[HKAudiogramSample averageSensitivityForSide:](self, "averageSensitivityForSide:");

  if (!v5) {
    return 0;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = (void *)[&unk_1EECE6D08 copy];
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = [(HKAudiogramSample *)self sensitivityPoints];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke;
  v16[3] = &unk_1E58C5A00;
  id v17 = v8;
  id v10 = v8;
  id v11 = objc_msgSend(v9, "hk_filter:", v16);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke_2;
  v15[3] = &__block_descriptor_40_e37__16__0__HKAudiogramSensitivityPoint_8l;
  v15[4] = a3;
  id v12 = objc_msgSend(v11, "hk_map:", v15);
  BOOL v13 = [v12 count] != 0;

  return v13;
}

uint64_t __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v4 = [a2 frequency];
  [v4 _value];
  uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v6 = [v2 containsObject:v5];

  return v6;
}

id __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 tests];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke_3;
  v6[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "hk_firstObjectPassingTest:", v6);

  return v4;
}

BOOL __61__HKAudiogramSample_isAverageSensitivityUpperClampedForSide___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 side] == *(void *)(a1 + 32))
  {
    id v4 = [v3 clampingRange];
    uint64_t v5 = [v4 upperBound];
    if (v5)
    {
      uint64_t v6 = [v3 clampingRange];
      uint64_t v7 = [v6 upperBound];
      [v7 _value];
      double v9 = v8;
      id v10 = [v3 sensitivity];
      [v10 _value];
      BOOL v12 = v9 <= v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isAverageSensitivityUpperClampedForAnySide
{
  if ([(HKAudiogramSample *)self isAverageSensitivityUpperClampedForSide:0])
  {
    return 1;
  }

  return [(HKAudiogramSample *)self isAverageSensitivityUpperClampedForSide:1];
}

+ (id)randomAudiogramSampleWithClassification:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 device:(id)a6 metadata:(id)a7
{
  return (id)[a1 randomAudiogramSampleWithLeftEarClassification:a3 rightEarClassification:a3 startDate:a4 endDate:a5 device:a6 metadata:a7];
}

+ (id)randomAudiogramSampleWithLeftEarClassification:(unint64_t)a3 rightEarClassification:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v12 = [&unk_1EECE6D20 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(&unk_1EECE6D20);
        }
        uint64_t v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
        id v17 = +[HKUnit hertzUnit];
        [v16 doubleValue];
        double v18 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v17);

        double v19 = [a1 randomSensitivityValueForClassification:a3];
        double v20 = [a1 randomSensitivityValueForClassification:a4];
        id v37 = 0;
        double v21 = [a1 _sensitivityPointWithFrequency:v18 leftEarSensitivity:v19 rightEarSensitivity:v20 error:&v37];
        id v22 = v37;
        if (v21)
        {
          [v34 addObject:v21];
        }
        else
        {
          _HKInitializeLogging();
          v23 = (void *)HKLogHearing;
          if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR))
          {
            v24 = v23;
            v25 = (objc_class *)objc_opt_class();
            uint64_t v33 = NSStringFromClass(v25);
            *(_DWORD *)buf = 138543618;
            long long v43 = v33;
            __int16 v44 = 2114;
            id v45 = v22;
            _os_log_error_impl(&dword_19C023000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating sensitivity point: %{public}@", buf, 0x16u);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [&unk_1EECE6D20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v13);
  }
  double v26 = v29;
  double v27 = +[HKAudiogramSample audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:](HKAudiogramSample, "audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:", v34, v32, v31, v30, v29, v29);

  return v27;
}

+ (id)_sensitivityPointWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5 error:(id *)a6
{
  double v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  id v21 = 0;
  uint64_t v14 = [[HKAudiogramSensitivityTest alloc] initWithSensitivity:v11 type:0 masked:0 side:0 clampingRange:0 error:&v21];

  id v15 = v21;
  if (v14)
  {
    [v13 addObject:v14];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR)) {
      +[HKAudiogramSample _sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:]();
    }
  }
  id v20 = v15;
  uint64_t v16 = [[HKAudiogramSensitivityTest alloc] initWithSensitivity:v10 type:0 masked:0 side:1 clampingRange:0 error:&v20];

  id v17 = v20;
  if (v16)
  {
    [v13 addObject:v16];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR)) {
      +[HKAudiogramSample _sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:]();
    }
  }
  double v18 = +[HKAudiogramSensitivityPoint sensitivityPointWithFrequency:v12 tests:v13 error:a6];

  return v18;
}

+ (id)randomSensitivityValueForClassification:(unint64_t)a3
{
  uint64_t v5 = HKMinimumDecibelQuantityForHearingLevelClassification(a3);
  uint64_t v6 = HKMaximumDecibelQuantityForHearingLevelClassification(a3);
  uint64_t v7 = +[HKUnit decibelHearingLevelUnit];
  [v5 doubleValueForUnit:v7];
  double v9 = fmax(v8, 0.0);
  [v6 doubleValueForUnit:v7];
  [a1 _randomDecibelValueInRangeFromStart:v9 end:v10];
  id v11 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v7);

  return v11;
}

+ (double)_randomDecibelValueInRangeFromStart:(double)a3 end:(double)a4
{
  if (a3 >= a4)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"HKAudiogramSample.m" lineNumber:687 description:@"Start of range must be before the end."];
  }
  return (double)arc4random_uniform((a4 - a3)) + a3;
}

+ (HKAudiogramSample)audiogramSampleWithLeftEarAverageSensitivity:(id)a3 rightEarAverageSensitivity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v16 = [&unk_1EECE6D20 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(&unk_1EECE6D20);
        }
        id v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
        id v21 = +[HKUnit hertzUnit];
        [v20 doubleValue];
        id v22 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v21);

        id v37 = 0;
        v23 = [a1 _sensitivityPointWithFrequency:v22 leftEarSensitivity:v14 rightEarSensitivity:v15 error:&v37];
        id v24 = v37;
        if (v23)
        {
          [v36 addObject:v23];
        }
        else
        {
          _HKInitializeLogging();
          v25 = (void *)HKLogHearing;
          if (os_log_type_enabled((os_log_t)HKLogHearing, OS_LOG_TYPE_ERROR))
          {
            double v26 = v25;
            double v27 = (objc_class *)objc_opt_class();
            uint64_t v35 = NSStringFromClass(v27);
            *(_DWORD *)buf = 138543618;
            long long v43 = v35;
            __int16 v44 = 2114;
            id v45 = v24;
            _os_log_error_impl(&dword_19C023000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error creating sensitivity point: %{public}@", buf, 0x16u);
          }
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [&unk_1EECE6D20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v17);
  }
  unsigned int v28 = v31;
  id v29 = +[HKAudiogramSample audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:](HKAudiogramSample, "audiogramSampleWithSensitivityPoints:startDate:endDate:device:metadata:", v36, v34, v33, v32, v31, v31);

  return (HKAudiogramSample *)v29;
}

- (BOOL)isFirstPartyHearingTestResult
{
  id v3 = [(HKObject *)self metadata];
  id v4 = [v3 objectForKey:@"HKWasUserEntered"];

  if (v4) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }
  uint64_t v6 = [(HKObject *)self sourceRevision];
  uint64_t v7 = [v6 source];
  int v8 = [v7 _hasFirstPartyBundleID];

  BOOL v9 = 0;
  if ((v5 & 1) == 0 && v8)
  {
    double v10 = [(HKObject *)self device];
    BOOL v9 = v10 != 0;
  }
  return v9;
}

- (NSData)encodedSensitivityPoints
{
  return self->_encodedSensitivityPoints;
}

- (void)setEncodedSensitivityPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedSensitivityPoints, 0);

  objc_storeStrong((id *)&self->_hearingLevelSummary, 0);
}

+ (void)_encodeSensitivityPoints:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Unable to encode the sensitivity points for an HKAudiogramSample instance: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_decodeSensitivityData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Unable to decode the sensitivity points for an HKAudiogramSample instance: %@", (uint8_t *)&v2, 0xCu);
}

- (void)hasDifferentClassificationWithModifiedClampingRange
{
  OUTLINED_FUNCTION_2_2();
  id v2 = v1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_1();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_5(&dword_19C023000, v5, v6, "[%{public}@] Error creating a modified HKAudiogramSensitivityPointClampingRange. Returning isAmbiguous YES. Error: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  id v2 = v1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_1();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_5(&dword_19C023000, v5, v6, "[%{public}@] Error creating right sensitivity test: %{public}@", v7, v8, v9, v10, v11);
}

+ (void)_sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  id v2 = v1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_1();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_15();
  OUTLINED_FUNCTION_1_5(&dword_19C023000, v5, v6, "[%{public}@] Error creating left sensitivity test: %{public}@", v7, v8, v9, v10, v11);
}

@end