@interface HKAudioExposureDataProviderCurrentValue
- (HKAudioExposureDataProviderCurrentValue)initWithLEQQuantity:(id)a3 secondsListened:(double)a4 daysAggregated:(int64_t)a5 date:(id)a6;
- (NSDate)date;
- (id)_attributedSymbolForClassification:(unint64_t)a3 font:(id)a4;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3;
- (id)stringWithDisplayType:(id)a3 unitController:(id)a4;
- (void)setDate:(id)a3;
@end

@implementation HKAudioExposureDataProviderCurrentValue

- (HKAudioExposureDataProviderCurrentValue)initWithLEQQuantity:(id)a3 secondsListened:(double)a4 daysAggregated:(int64_t)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HKAudioExposureDataProviderCurrentValue;
  v13 = [(HKAudioExposureDataProviderCurrentValue *)&v15 init];
  if (v13)
  {
    v13->_classification = [MEMORY[0x1E4F2AC28] classifyLEQ:v11 forDuration:a5 overDays:a4];
    objc_storeStrong((id *)&v13->_leqQuantity, a3);
    v13->_secondsListened = a4;
    v13->_daysAggregated = a5;
    objc_storeStrong((id *)&v13->_date, a6);
  }

  return v13;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v20[0] = *MEMORY[0x1E4FB06F8];
  v20[1] = v8;
  v21[0] = a5;
  v9 = (void *)MEMORY[0x1E4FB1618];
  id v10 = a5;
  id v11 = objc_msgSend(v9, "hk_chartLollipopValueColor");
  v21[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  v13 = [MEMORY[0x1E4F2AC28] localizedDisplayNameForClassification:self->_classification];
  v14 = [(HKAudioExposureDataProviderCurrentValue *)self _attributedSymbolForClassification:self->_classification font:v10];
  objc_super v15 = (void *)[v14 mutableCopy];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v12];
  [v15 appendAttributedString:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  v18 = (void *)[v17 initWithString:v13 attributes:v12];
  [v15 appendAttributedString:v18];

  return v15;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  v5 = [(HKAudioExposureDataProviderCurrentValue *)self date];
  v6 = HKLastUpdatedText(v5, v4);

  return v6;
}

- (id)lastUpdatedShortDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  v5 = [(HKAudioExposureDataProviderCurrentValue *)self date];
  v6 = HKMostRecentSampleEndDateText(v5, v4, 0);

  return v6;
}

- (id)stringWithDisplayType:(id)a3 unitController:(id)a4
{
  if (!self->_classification)
  {
    v24 = 0;
    goto LABEL_10;
  }
  leqQuantity = self->_leqQuantity;
  v7 = (void *)MEMORY[0x1E4F2B618];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 decibelAWeightedSoundPressureLevelUnit];
  [(HKQuantity *)leqQuantity doubleValueForUnit:v10];
  double v12 = v11;

  v13 = [v8 unitForDisplayType:v9];
  v14 = objc_msgSend(v9, "hk_valueFormatterForUnit:", v13);
  objc_super v15 = [NSNumber numberWithDouble:v12];
  v16 = [v14 stringFromValue:v15 displayType:v9 unitController:v8];

  id v17 = [NSNumber numberWithDouble:self->_secondsListened];
  v18 = HKTimePeriodString(v17, 0);

  int64_t daysAggregated = self->_daysAggregated;
  if (daysAggregated == 1)
  {
    v20 = NSString;
    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v22 = v21;
    v23 = @"AUDIO_EXPOSURE_TODAYS_AVG_DESCRIPTION";
  }
  else
  {
    v24 = 0;
    if (daysAggregated < 2 || (unint64_t)daysAggregated > *MEMORY[0x1E4F29998]) {
      goto LABEL_9;
    }
    v20 = NSString;
    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v22 = v21;
    v23 = @"AUDIO_EXPOSURE_WEEKS_AVG_DESCRIPTION";
  }
  v25 = [v21 localizedStringForKey:v23 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v24 = objc_msgSend(v20, "stringWithFormat:", v25, v16, v18);

LABEL_9:
LABEL_10:
  return v24;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(HKAudioExposureDataProviderCurrentValue *)self stringWithDisplayType:a3 unitController:a4];
  id v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  uint64_t v11 = *MEMORY[0x1E4FB0700];
  v16[0] = *MEMORY[0x1E4FB06F8];
  v16[1] = v11;
  v17[0] = v8;
  v17[1] = v10;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);

  v14 = (void *)[v13 initWithString:v9 attributes:v12];
  return v14;
}

- (id)_attributedSymbolForClassification:(unint64_t)a3 font:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    v7 = objc_msgSend(MEMORY[0x1E4FB1818], "hk_hearingHealthAudioExposureSymbolForClassification:font:", a3, v5);
    [v6 setImage:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    id v9 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];
    [v8 appendAttributedString:v9];

    id v10 = (void *)[v8 copy];
  }
  else
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F3B9CF20];
  }

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_leqQuantity, 0);
}

@end