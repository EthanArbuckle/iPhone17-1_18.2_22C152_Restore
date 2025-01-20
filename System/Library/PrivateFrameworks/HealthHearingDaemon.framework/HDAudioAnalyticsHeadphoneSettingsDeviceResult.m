@interface HDAudioAnalyticsHeadphoneSettingsDeviceResult
+ (id)optInSettingsWithHasHAENEnabled:(BOOL)a3 hasMeasureLevelsEnabled:(BOOL)a4 hasIncludeOtherHeadphonesEnabled:(BOOL)a5;
+ (id)requiredSettingsWithSaveForEightDays:(BOOL)a3;
- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)initWithHAENRequired:(BOOL)a3 hasHAENEnabled:(id)a4 hasMeasureLevelsEnabled:(id)a5 hasIncludeOtherHeadphonesEnabled:(id)a6 haeRetention:(id)a7;
- (NSNumber)haeRetention;
- (NSNumber)hasHAENEnabled;
- (NSNumber)hasHAENRequired;
- (NSNumber)hasIncludeOtherHeadphonesEnabled;
- (NSNumber)hasMeasureLevelsEnabled;
@end

@implementation HDAudioAnalyticsHeadphoneSettingsDeviceResult

+ (id)requiredSettingsWithSaveForEightDays:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)a1);
  if (v3) {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA80];
  }
  v6 = (void *)[v4 initWithHAENRequired:1 hasHAENEnabled:0 hasMeasureLevelsEnabled:0 hasIncludeOtherHeadphonesEnabled:0 haeRetention:v5];
  return v6;
}

+ (id)optInSettingsWithHasHAENEnabled:(BOOL)a3 hasMeasureLevelsEnabled:(BOOL)a4 hasIncludeOtherHeadphonesEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [NSNumber numberWithBool:v7];
  v10 = [NSNumber numberWithBool:v6];
  v11 = [NSNumber numberWithBool:v5];
  v12 = (void *)[v8 initWithHAENRequired:0 hasHAENEnabled:v9 hasMeasureLevelsEnabled:v10 hasIncludeOtherHeadphonesEnabled:v11 haeRetention:0];

  return v12;
}

- (HDAudioAnalyticsHeadphoneSettingsDeviceResult)initWithHAENRequired:(BOOL)a3 hasHAENEnabled:(id)a4 hasMeasureLevelsEnabled:(id)a5 hasIncludeOtherHeadphonesEnabled:(id)a6 haeRetention:(id)a7
{
  BOOL v11 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HDAudioAnalyticsHeadphoneSettingsDeviceResult;
  v17 = [(HDAudioAnalyticsHeadphoneSettingsDeviceResult *)&v22 init];
  if (v17)
  {
    uint64_t v18 = [NSNumber numberWithBool:v11];
    hasHAENRequired = v17->_hasHAENRequired;
    v17->_hasHAENRequired = (NSNumber *)v18;

    objc_storeStrong((id *)&v17->_hasHAENEnabled, a4);
    objc_storeStrong((id *)&v17->_hasMeasureLevelsEnabled, a5);
    objc_storeStrong((id *)&v17->_hasIncludeOtherHeadphonesEnabled, a6);
    objc_storeStrong((id *)&v17->_haeRetention, a7);
    v20 = v17;
  }

  return v17;
}

- (NSNumber)hasHAENRequired
{
  return self->_hasHAENRequired;
}

- (NSNumber)hasHAENEnabled
{
  return self->_hasHAENEnabled;
}

- (NSNumber)hasMeasureLevelsEnabled
{
  return self->_hasMeasureLevelsEnabled;
}

- (NSNumber)hasIncludeOtherHeadphonesEnabled
{
  return self->_hasIncludeOtherHeadphonesEnabled;
}

- (NSNumber)haeRetention
{
  return self->_haeRetention;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haeRetention, 0);
  objc_storeStrong((id *)&self->_hasIncludeOtherHeadphonesEnabled, 0);
  objc_storeStrong((id *)&self->_hasMeasureLevelsEnabled, 0);
  objc_storeStrong((id *)&self->_hasHAENEnabled, 0);
  objc_storeStrong((id *)&self->_hasHAENRequired, 0);
}

@end