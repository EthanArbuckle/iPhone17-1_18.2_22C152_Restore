@interface HKElectrocardiogram(HKCodingSupport)
+ (id)createWithCodableECG:()HKCodingSupport;
- (HKCodableElectrocardiogramSample)codableECG;
@end

@implementation HKElectrocardiogram(HKCodingSupport)

+ (id)createWithCodableECG:()HKCodingSupport
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F28C18];
  v5 = [v3 dateInterval];
  v6 = objc_msgSend(v4, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v5, 0);

  v23[0] = *MEMORY[0x1E4F2BAF8];
  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "privateSymptoms"));
  v24[0] = v7;
  v23[1] = *MEMORY[0x1E4F2A0A8];
  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "algorithmVersionRawValue"));
  v24[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  v10 = (void *)MEMORY[0x1E4F2AF88];
  v11 = [MEMORY[0x1E4F2B448] electrocardiogramType];
  v12 = [v6 startDate];
  [v12 timeIntervalSinceReferenceDate];
  double v14 = v13;
  v15 = [v6 endDate];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__HKElectrocardiogram_HKCodingSupport__createWithCodableECG___block_invoke;
  v21[3] = &unk_1E6D57C30;
  id v22 = v3;
  id v18 = v3;
  v19 = (void *)[v10 _newSampleWithType:v11 startDate:0 endDate:v9 device:v21 metadata:v14 config:v17];

  return v19;
}

- (HKCodableElectrocardiogramSample)codableECG
{
  v2 = objc_alloc_init(HKCodableElectrocardiogramSample);
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [a1 startDate];
  v5 = [a1 endDate];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];
  v7 = objc_msgSend(v6, "hk_codableDateInterval");
  [(HKCodableElectrocardiogramSample *)v2 setDateInterval:v7];

  -[HKCodableElectrocardiogramSample setClassificationRawValue:](v2, "setClassificationRawValue:", [a1 privateClassification]);
  v8 = [a1 averageHeartRate];
  v9 = [v8 codableRepresentation];
  [(HKCodableElectrocardiogramSample *)v2 setAverageHeartRate:v9];

  -[HKCodableElectrocardiogramSample setSymptomsStatusRawValue:](v2, "setSymptomsStatusRawValue:", [a1 symptomsStatus]);
  -[HKCodableElectrocardiogramSample setPrivateSymptoms:](v2, "setPrivateSymptoms:", [a1 privateSymptoms]);
  v10 = [a1 _algorithmVersion];
  -[HKCodableElectrocardiogramSample setAlgorithmVersionRawValue:](v2, "setAlgorithmVersionRawValue:", [v10 longLongValue]);

  return v2;
}

@end