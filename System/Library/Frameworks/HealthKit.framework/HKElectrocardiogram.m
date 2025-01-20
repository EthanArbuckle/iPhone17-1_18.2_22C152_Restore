@interface HKElectrocardiogram
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)_electrocardiogramWithStartDate:(id)a3 device:(id)a4 metadata:(id)a5;
+ (id)_localizedClassification:(unint64_t)a3 withActiveAlgorithmVersion:(int64_t)a4;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)prepareForSaving:(id *)a3;
- (HKElectrocardiogram)initWithCoder:(id)a3;
- (HKElectrocardiogramClassification)classification;
- (HKElectrocardiogramSymptomsStatus)symptomsStatus;
- (HKQuantity)averageHeartRate;
- (HKQuantity)samplingFrequency;
- (NSArray)_localizedSymptoms;
- (NSArray)leadNames;
- (NSInteger)numberOfVoltageMeasurements;
- (NSNumber)_algorithmVersion;
- (id).cxx_construct;
- (id)_localizedClassificationWithActiveAlgorithmVersion:(int64_t)a3;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)payload;
- (id)voltageMeasurementEnumerator;
- (int64_t)symptoms;
- (unint64_t)privateClassification;
- (unint64_t)privateSymptoms;
- (void)_enumerateDataForLead:(int64_t)a3 block:(id)a4;
- (void)_setAverageHeartRate:(id)a3;
- (void)_setPayload:(id)a3;
- (void)_setPrivateClassification:(unint64_t)a3;
- (void)_setSymptomsStatus:(int64_t)a3;
- (void)copyMeasurementFlagsForLead:(int64_t)a3 count:(unint64_t)a4 target:(char *)a5;
- (void)copyMeasurementValuesForLead:(int64_t)a3 count:(unint64_t)a4 target:(float *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setReading:(Electrocardiogram *)a3;
@end

@implementation HKElectrocardiogram

+ (id)_electrocardiogramWithStartDate:(id)a3 device:(id)a4 metadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[HKObjectType electrocardiogramType];
  [v8 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v8 timeIntervalSinceReferenceDate];
  v15 = (void *)[a1 _newSampleWithType:v11 startDate:v9 endDate:v10 device:0 metadata:v13 config:v14];

  return v15;
}

- (NSArray)leadNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  begin = (char *)self->_reading._leads._v.__begin_;
  for (i = (char *)self->_reading._leads._v.__end_; begin != i; begin += 8)
  {
    if (*(unsigned char *)(*(void *)begin + 60))
    {
      v6 = [NSNumber numberWithInteger:*(int *)(*(void *)begin + 56)];
      [v3 addObject:v6];
    }
  }

  return (NSArray *)v3;
}

- (NSInteger)numberOfVoltageMeasurements
{
  begin = self->_reading._leads._v.__begin_;
  if (self->_reading._leads._v.__end_ == begin) {
    return 0;
  }
  else {
    return (uint64_t)(*(void *)(*(void *)begin + 40) - *(void *)(*(void *)begin + 32)) >> 2;
  }
}

- (HKQuantity)samplingFrequency
{
  p_reading = &self->_reading;
  if (*(unsigned char *)&self->_reading._has)
  {
    v4 = +[HKUnit hertzUnit];
    id v3 = +[HKQuantity quantityWithUnit:v4 doubleValue:p_reading->_frequency];
  }
  else
  {
    id v3 = 0;
  }

  return (HKQuantity *)v3;
}

- (HKQuantity)averageHeartRate
{
  return self->_averageHeartRate;
}

- (int64_t)symptoms
{
  return self->_symptomsStatus;
}

- (HKElectrocardiogramClassification)classification
{
  unint64_t v2 = [(HKElectrocardiogram *)self privateClassification];
  if (v2 - 1 > 9) {
    return 0;
  }
  else {
    return qword_19C3D4F70[v2 - 1];
  }
}

- (unint64_t)privateClassification
{
  return self->_privateClassification;
}

- (NSNumber)_algorithmVersion
{
  unint64_t v2 = [(HKObject *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:@"HKMetadataKeyAppleECGAlgorithmVersion"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &unk_1EECE6140;
  }

  return (NSNumber *)v4;
}

- (void)setReading:(Electrocardiogram *)a3
{
  binarysample::Electrocardiogram::operator=((uint64_t)&self->_reading, (const binarysample::Electrocardiogram *)a3);
  id v4 = [(HKElectrocardiogram *)self samplingFrequency];
  v5 = +[HKUnit hertzUnit];
  [v4 doubleValueForUnit:v5];
  double v7 = v6;

  [(HKSample *)self _startTimestamp];
  double v9 = v8 + (double)[(HKElectrocardiogram *)self numberOfVoltageMeasurements] / v7;

  [(HKSample *)self _setEndTimestamp:v9];
}

- (void)_setAverageHeartRate:(id)a3
{
}

- (void)_setPrivateClassification:(unint64_t)a3
{
  self->_privateClassification = a3;
}

- (void)_setSymptomsStatus:(int64_t)a3
{
  self->_symptomsStatus = a3;
}

- (void)copyMeasurementValuesForLead:(int64_t)a3 count:(unint64_t)a4 target:(float *)a5
{
  begin = (char *)self->_reading._leads._v.__begin_;
  for (i = (char *)self->_reading._leads._v.__end_; begin != i; begin += 8)
  {
    uint64_t v10 = *(void *)begin;
    if ((*(unsigned char *)(*(void *)begin + 60) & 1) != 0 && *(_DWORD *)(v10 + 56) == a3)
    {
      v11 = *(const void **)(v10 + 32);
      unint64_t v12 = (uint64_t)(*(void *)(v10 + 40) - (void)v11) >> 2;
      if (v12 >= a4) {
        unint64_t v12 = a4;
      }
      if (v12) {
        memmove(a5, v11, 4 * v12);
      }
    }
  }
}

- (void)copyMeasurementFlagsForLead:(int64_t)a3 count:(unint64_t)a4 target:(char *)a5
{
  begin = (char *)self->_reading._leads._v.__begin_;
  end = (char *)self->_reading._leads._v.__end_;
  while (begin != end)
  {
    uint64_t v7 = *(void *)begin;
    if ((*(unsigned char *)(*(void *)begin + 60) & 1) != 0 && *(_DWORD *)(v7 + 56) == a3)
    {
      int64_t v8 = (uint64_t)(*(void *)(v7 + 16) - *(void *)(v7 + 8)) >> 2;
      if (v8 >= a4) {
        int64_t v8 = a4;
      }
      if (v8 >= 1)
      {
        for (uint64_t i = 0; i != v8; ++i)
          a5[i] = *(_DWORD *)(*(void *)(v7 + 8) + 4 * i);
      }
    }
    begin += 8;
  }
}

- (void)_enumerateDataForLead:(int64_t)a3 block:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(id, unint64_t, uint8_t *, float))a4;
  uint64_t v7 = [(HKElectrocardiogram *)self samplingFrequency];

  if (v7)
  {
    begin = (char *)self->_reading._leads._v.__begin_;
    end = (char *)self->_reading._leads._v.__end_;
    while (begin != end)
    {
      uint64_t v10 = *(void *)begin;
      if ((*(unsigned char *)(*(void *)begin + 60) & 1) != 0 && *(_DWORD *)(v10 + 56) == a3)
      {
        uint64_t v14 = *(void *)(v10 + 32);
        if (*(void *)(v10 + 40) != v14)
        {
          unint64_t v15 = 0;
          do
          {
            v16[0] = 0;
            v6[2](v6, v15, v16, *(float *)(v14 + 4 * v15));
            if (v16[0]) {
              break;
            }
            ++v15;
            uint64_t v14 = *(void *)(v10 + 32);
          }
          while (v15 < (*(void *)(v10 + 40) - v14) >> 2);
        }
        break;
      }
      begin += 8;
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (id)HKLogHeartRhythm;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = [(HKObject *)self UUID];
      double v13 = [v12 UUIDString];
      [(HKElectrocardiogram *)v13 _enumerateDataForLead:v11 block:v12];
    }
  }
}

- (id)voltageMeasurementEnumerator
{
  begin = (char *)self->_reading._leads._v.__begin_;
  end = (char *)self->_reading._leads._v.__end_;
  if (begin == end)
  {
LABEL_5:
    v5 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v4 = *(void *)begin;
      if ((*(unsigned char *)(*(void *)begin + 60) & 1) != 0 && *(_DWORD *)(v4 + 56) == 1) {
        break;
      }
      begin += 8;
      if (begin == end) {
        goto LABEL_5;
      }
    }
    v5 = [[_HKElectrocardiogramVoltageMeasurementEnumerator alloc] initWithElectrocardiogram:self leadIMicroVoltsBegin:*(void *)(v4 + 32) end:*(void *)(v4 + 40)];
  }

  return v5;
}

- (void)_setPayload:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = (const unsigned __int8 *)[v6 bytes];
    [v6 length];
    PB::Reader::Reader((PB::Reader *)v8, v7);
    (*((void (**)(Electrocardiogram *, unsigned char *))self->_reading._vptr$Base + 2))(&self->_reading, v8);
  }
  else
  {
    binarysample::Electrocardiogram::Electrocardiogram((uint64_t)v8);
    binarysample::Electrocardiogram::operator=((uint64_t)&self->_reading, (uint64_t)v8);
    binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)v8);
  }
}

- (id)payload
{
  PB::Writer::Writer((PB::Writer *)&v6);
  (*((void (**)(Electrocardiogram *, uint64_t *))self->_reading._vptr$Base + 3))(&self->_reading, &v6);
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v4 = (void *)[v3 initWithBytes:v7 length:v6 - v7];
  PB::Writer::~Writer((PB::Writer *)&v6);

  return v4;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HKElectrocardiogram;
  v5 = -[HKSample _validateWithConfiguration:](&v15, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_3:
    int64_t v8 = v7;
    goto LABEL_9;
  }
  begin = (char *)self->_reading._leads._v.__begin_;
  end = (char *)self->_reading._leads._v.__end_;
  if (end != begin)
  {
    uint64_t v11 = *(void *)(*(void *)begin + 40) - *(void *)(*(void *)begin + 32);
    while (v11 == *(void *)(*(void *)begin + 40) - *(void *)(*(void *)begin + 32))
    {
      begin += 8;
      if (begin == end) {
        goto LABEL_8;
      }
    }
    double v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = objc_opt_class();
    objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v14, a2, @"%@ %@ requires each lead to have an identical number of data"", objc_opt_class(), self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_8:
  int64_t v8 = 0;
LABEL_9:

  return v8;
}

- (BOOL)prepareForSaving:(id *)a3
{
  if (self->_reading._leads._v.__end_ == self->_reading._leads._v.__begin_)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = objc_opt_class();
    objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v12, a2, @"%@ %@ requires at least one lead"", objc_opt_class(), self);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v16;
    if (v16)
    {
      if (a3)
      {
LABEL_13:
        id v13 = v13;
        *a3 = v13;
        goto LABEL_15;
      }
LABEL_14:
      _HKLogDroppedError(v16);
    }
  }
  else
  {
    uint64_t v6 = [(HKObject *)self metadata];
    id v7 = [v6 objectForKeyedSubscript:@"_HKPrivateMetadataKeyElectrocardiogramSymptoms"];
    uint64_t v8 = [v7 integerValue];

    if (v8 == 1 || (v8 & 1) == 0) {
      return 1;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_opt_class();
    objc_msgSend(v14, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v15, a2, @"%@ %@ metadata cannot have both no symptoms and a symptom"", objc_opt_class(), self);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v16;
    if (v16)
    {
      if (a3) {
        goto LABEL_13;
      }
      goto LABEL_14;
    }
  }
LABEL_15:

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKElectrocardiogram;
  [(HKSample *)&v7 encodeWithCoder:v4];
  v5 = [(HKElectrocardiogram *)self payload];
  [v4 encodeObject:v5 forKey:@"payload"];

  uint64_t v6 = [(HKElectrocardiogram *)self averageHeartRate];
  [v4 encodeObject:v6 forKey:@"averageHeartRate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HKElectrocardiogram privateClassification](self, "privateClassification"), @"classification");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKElectrocardiogram symptoms](self, "symptoms"), @"symptoms_status");
}

- (HKElectrocardiogram)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKElectrocardiogram;
  v5 = [(HKSample *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    [(HKElectrocardiogram *)v5 _setPayload:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"averageHeartRate"];
    [(HKElectrocardiogram *)v5 _setAverageHeartRate:v7];

    -[HKElectrocardiogram _setPrivateClassification:](v5, "_setPrivateClassification:", [v4 decodeIntegerForKey:@"classification"]);
    -[HKElectrocardiogram _setSymptomsStatus:](v5, "_setSymptomsStatus:", [v4 decodeIntegerForKey:@"symptoms_status"]);
  }

  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v24.receiver = self;
    v24.super_class = (Class)HKElectrocardiogram;
    if (![(HKSample *)&v24 isEquivalent:v5]) {
      goto LABEL_17;
    }
    NSInteger v6 = [(HKElectrocardiogram *)self numberOfVoltageMeasurements];
    if (v6 != [v5 numberOfVoltageMeasurements]) {
      goto LABEL_17;
    }
    objc_super v7 = [(HKElectrocardiogram *)self samplingFrequency];
    uint64_t v8 = [v5 samplingFrequency];
    if (v7 == v8)
    {
    }
    else
    {
      objc_super v9 = [v5 samplingFrequency];
      if (!v9) {
        goto LABEL_16;
      }
      uint64_t v10 = [(HKElectrocardiogram *)self samplingFrequency];
      uint64_t v11 = [v5 samplingFrequency];
      char v12 = [v10 isEqual:v11];

      if ((v12 & 1) == 0) {
        goto LABEL_17;
      }
    }
    uint64_t v14 = [(HKElectrocardiogram *)self payload];
    uint64_t v15 = [v5 payload];
    char v16 = [v14 isEqualToData:v15];

    if ((v16 & 1) == 0) {
      goto LABEL_17;
    }
    unint64_t v17 = [(HKElectrocardiogram *)self privateClassification];
    if (v17 != [v5 privateClassification]) {
      goto LABEL_17;
    }
    objc_super v7 = [(HKElectrocardiogram *)self averageHeartRate];
    uint64_t v8 = [v5 averageHeartRate];
    if (v7 == v8)
    {

LABEL_21:
      HKElectrocardiogramSymptomsStatus v23 = [(HKElectrocardiogram *)self symptomsStatus];
      BOOL v13 = v23 == [v5 symptomsStatus];
      goto LABEL_18;
    }
    v18 = [v5 averageHeartRate];
    if (v18)
    {
      v19 = [(HKElectrocardiogram *)self averageHeartRate];
      v20 = [v5 averageHeartRate];
      char v21 = [v19 isEqual:v20];

      if (v21) {
        goto LABEL_21;
      }
LABEL_17:
      BOOL v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:

    goto LABEL_17;
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

+ (id)_localizedClassification:(unint64_t)a3 withActiveAlgorithmVersion:(int64_t)a4
{
  switch(a3)
  {
    case 1uLL:
      if (a4 == 2)
      {
        id v4 = HKHealthKitFrameworkBundle();
        id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_POOR_RECORDING" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
        uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      }
      else
      {
        if (a4 != 1) {
          goto LABEL_7;
        }
        id v4 = HKHealthKitFrameworkBundle();
        id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_INCONCLUSIVE_POOR_READING" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
        uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      }
      goto LABEL_14;
    case 2uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_INCONCLUSIVE_OTHER" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 3uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_SINUS_RHYTHM_HEART_RATE_50_TO_100" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 4uLL:
    case 8uLL:
    case 9uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_ATRIAL_FIBRILLATION" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 5uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_ABOVE_120" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 6uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_BELOW_50" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 7uLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_SINUS_RHYTHM_HEART_RATE_100_TO_150" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
      goto LABEL_14;
    case 0xAuLL:
      id v4 = HKHealthKitFrameworkBundle();
      id v5 = [v4 localizedStringForKey:@"ELECTROCARDIOGRAM_ATRIAL_FIBRILLATION_CLASSIFICATION_HEART_RATE_ABOVE_150" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
      uint64_t v6 = HKConditionallyRedactedHeartRhythmString(v5);
LABEL_14:
      objc_super v7 = (void *)v6;

      break;
    default:
LABEL_7:
      objc_super v7 = 0;
      break;
  }

  return v7;
}

- (id)_localizedClassificationWithActiveAlgorithmVersion:(int64_t)a3
{
  id v5 = objc_opt_class();
  unint64_t v6 = [(HKElectrocardiogram *)self privateClassification];

  return (id)[v5 _localizedClassification:v6 withActiveAlgorithmVersion:a3];
}

- (NSArray)_localizedSymptoms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = _HKPrivateElectrocardiogramSymptomsGetList([(HKElectrocardiogram *)self privateSymptoms]);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) integerValue];
        objc_super v9 = 0;
        if (v8 > 63)
        {
          if (v8 > 255)
          {
            if (v8 == 256)
            {
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_SHORTNESS_OF_BREATH" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
            }
            else
            {
              if (v8 != 512) {
                goto LABEL_25;
              }
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_SKIPPED_HEARTBEAT" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
            }
          }
          else if (v8 == 64)
          {
            uint64_t v10 = HKHealthKitFrameworkBundle();
            uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_OTHER" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
            uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
          }
          else
          {
            if (v8 != 128) {
              goto LABEL_25;
            }
            uint64_t v10 = HKHealthKitFrameworkBundle();
            uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_RAPID_POUNDING_OR_FLUTTERING_HEARTBEAT" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
            uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
          }
        }
        else
        {
          switch(v8)
          {
            case 1:
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_NO_SYMPTOMS" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
              break;
            case 2:
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_CHEST_TIGHTNESS_OR_PAIN" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_25;
            case 4:
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_DIZZINESS" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
              break;
            case 8:
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_FATIGUE" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
              break;
            default:
              if (v8 != 16) {
                goto LABEL_25;
              }
              uint64_t v10 = HKHealthKitFrameworkBundle();
              uint64_t v11 = [v10 localizedStringForKey:@"ELECTROCARDIOGRAM_SYMPTOM_FAINTING" value:&stru_1EEC60288 table:@"Localizable-Cinnamon"];
              uint64_t v12 = HKConditionallyRedactedHeartRhythmString(v11);
              break;
          }
        }
        objc_super v9 = (void *)v12;

        if (v9) {
          [v3 addObject:v9];
        }
LABEL_25:
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)privateSymptoms
{
  unint64_t v2 = [(HKObject *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:@"_HKPrivateMetadataKeyElectrocardiogramSymptoms"];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (HKElectrocardiogramSymptomsStatus)symptomsStatus
{
  return self->_symptomsStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageHeartRate, 0);

  binarysample::Electrocardiogram::~Electrocardiogram((binarysample::Electrocardiogram *)&self->_reading);
}

- (id).cxx_construct
{
  return self;
}

- (void)_enumerateDataForLead:(os_log_t)log block:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Sample %{public}@ has no measurement frequency", buf, 0xCu);
}

@end