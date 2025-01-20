@interface HKMCProjectionAccuracyMetric
+ (NSString)eventName;
- (BOOL)heartRateBasedPredictionEnabled;
- (BOOL)internalLiveOnCycleFactorOverrideEnabled;
- (BOOL)isLoggingMultipleDays;
- (BOOL)isSleepConfiguredForWristTemperatureMeasurements;
- (BOOL)isWristTemperatureInputDelivered;
- (BOOL)overlapMostLikelyDays;
- (BOOL)overlapNone;
- (BOOL)overlapProjectedDays;
- (BOOL)partiallyLogged;
- (BOOL)periodPredictionEnabled;
- (BOOL)wristTemperatureBasedPredictionEnabled;
- (HKMCProjectionAccuracyMetric)initWithOverlapMostLikelyDays:(BOOL)a3 overlapProjectedDays:(BOOL)a4 overlapNone:(BOOL)a5 predictionPrimarySource:(id)a6 totalDayRange:(int64_t)a7 partiallyLogged:(BOOL)a8 periodPredictionEnabled:(BOOL)a9 heartRateBasedPredictionEnabled:(BOOL)a10 isLoggingMultipleDays:(BOOL)a11 daysAgoLogged:(int64_t)a12 isOngoingPeriod:(id)a13 activePairedWatchProductType:(id)a14 daysFromMostLikelyStart:(id)a15 daysFromMostLikelyEnd:(id)a16 daysFromProjectedStart:(id)a17 daysFromProjectedEnd:(id)a18 wristTemperatureBasedPredictionEnabled:(BOOL)a19 isWristTemperatureInputDelivered:(BOOL)a20 isSleepConfiguredForWristTemperatureMeasurements:(BOOL)a21 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a22;
- (NSDictionary)eventPayload;
- (NSNumber)daysFromMostLikelyEnd;
- (NSNumber)daysFromMostLikelyStart;
- (NSNumber)daysFromProjectedEnd;
- (NSNumber)daysFromProjectedStart;
- (NSNumber)isOngoingPeriod;
- (NSString)activePairedWatchProductType;
- (NSString)predictionPrimarySource;
- (id)description;
- (int64_t)daysAgoLogged;
- (int64_t)totalDayRange;
- (void)setActivePairedWatchProductType:(id)a3;
- (void)setDaysAgoLogged:(int64_t)a3;
- (void)setDaysFromMostLikelyEnd:(id)a3;
- (void)setDaysFromMostLikelyStart:(id)a3;
- (void)setDaysFromProjectedEnd:(id)a3;
- (void)setDaysFromProjectedStart:(id)a3;
- (void)setEventPayload:(id)a3;
- (void)setHeartRateBasedPredictionEnabled:(BOOL)a3;
- (void)setInternalLiveOnCycleFactorOverrideEnabled:(BOOL)a3;
- (void)setIsLoggingMultipleDays:(BOOL)a3;
- (void)setIsOngoingPeriod:(id)a3;
- (void)setIsSleepConfiguredForWristTemperatureMeasurements:(BOOL)a3;
- (void)setIsWristTemperatureInputDelivered:(BOOL)a3;
- (void)setOverlapMostLikelyDays:(BOOL)a3;
- (void)setOverlapNone:(BOOL)a3;
- (void)setOverlapProjectedDays:(BOOL)a3;
- (void)setPartiallyLogged:(BOOL)a3;
- (void)setPeriodPredictionEnabled:(BOOL)a3;
- (void)setPredictionPrimarySource:(id)a3;
- (void)setTotalDayRange:(int64_t)a3;
- (void)setWristTemperatureBasedPredictionEnabled:(BOOL)a3;
@end

@implementation HKMCProjectionAccuracyMetric

+ (NSString)eventName
{
  return (NSString *)@"com.apple.health.menstrual-cycles.ProjectionAccuracy";
}

- (HKMCProjectionAccuracyMetric)initWithOverlapMostLikelyDays:(BOOL)a3 overlapProjectedDays:(BOOL)a4 overlapNone:(BOOL)a5 predictionPrimarySource:(id)a6 totalDayRange:(int64_t)a7 partiallyLogged:(BOOL)a8 periodPredictionEnabled:(BOOL)a9 heartRateBasedPredictionEnabled:(BOOL)a10 isLoggingMultipleDays:(BOOL)a11 daysAgoLogged:(int64_t)a12 isOngoingPeriod:(id)a13 activePairedWatchProductType:(id)a14 daysFromMostLikelyStart:(id)a15 daysFromMostLikelyEnd:(id)a16 daysFromProjectedStart:(id)a17 daysFromProjectedEnd:(id)a18 wristTemperatureBasedPredictionEnabled:(BOOL)a19 isWristTemperatureInputDelivered:(BOOL)a20 isSleepConfiguredForWristTemperatureMeasurements:(BOOL)a21 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a22
{
  id v23 = a6;
  id v24 = a13;
  id v25 = a14;
  id v26 = a15;
  id v27 = a16;
  id v38 = a17;
  id v37 = a18;
  v39.receiver = self;
  v39.super_class = (Class)HKMCProjectionAccuracyMetric;
  v28 = [(HKMCProjectionAccuracyMetric *)&v39 init];
  v29 = v28;
  if (v28)
  {
    v28->_overlapMostLikelyDays = a3;
    v28->_overlapProjectedDays = a4;
    v28->_overlapNone = a5;
    objc_storeStrong((id *)&v28->_predictionPrimarySource, a6);
    v29->_partiallyLogged = a8;
    v29->_periodPredictionEnabled = a9;
    v29->_heartRateBasedPredictionEnabled = a10;
    v29->_isLoggingMultipleDays = a11;
    v29->_totalDayRange = a7;
    v29->_daysAgoLogged = a12;
    objc_storeStrong((id *)&v29->_isOngoingPeriod, a13);
    objc_storeStrong((id *)&v29->_activePairedWatchProductType, a14);
    objc_storeStrong((id *)&v29->_daysFromMostLikelyStart, a15);
    objc_storeStrong((id *)&v29->_daysFromMostLikelyEnd, a16);
    objc_storeStrong((id *)&v29->_daysFromProjectedStart, a17);
    objc_storeStrong((id *)&v29->_daysFromProjectedEnd, a18);
    v29->_wristTemperatureBasedPredictionEnabled = a19;
    v29->_isWristTemperatureInputDelivered = a20;
    v29->_isSleepConfiguredForWristTemperatureMeasurements = a21;
    v29->_internalLiveOnCycleFactorOverrideEnabled = a22;
  }

  return v29;
}

- (NSDictionary)eventPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapMostLikelyDays](self, "overlapMostLikelyDays"));
  [v3 setObject:v4 forKeyedSubscript:@"overlapMostLikelyDays"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapProjectedDays](self, "overlapProjectedDays"));
  [v3 setObject:v5 forKeyedSubscript:@"overlapProjectedDays"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapNone](self, "overlapNone"));
  [v3 setObject:v6 forKeyedSubscript:@"overlapNone"];

  v7 = [(HKMCProjectionAccuracyMetric *)self predictionPrimarySource];
  [v3 setObject:v7 forKeyedSubscript:@"predictionPrimarySource"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCProjectionAccuracyMetric totalDayRange](self, "totalDayRange"));
  [v3 setObject:v8 forKeyedSubscript:@"totalDayRange"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric partiallyLogged](self, "partiallyLogged"));
  [v3 setObject:v9 forKeyedSubscript:@"partiallyLogged"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric periodPredictionEnabled](self, "periodPredictionEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"settings_periodPredictionEnabled"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric heartRateBasedPredictionEnabled](self, "heartRateBasedPredictionEnabled"));
  [v3 setObject:v11 forKeyedSubscript:@"settings_heartRateBasedPredictionEnabled"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isLoggingMultipleDays](self, "isLoggingMultipleDays"));
  [v3 setObject:v12 forKeyedSubscript:@"isLoggingMultipleDays"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCProjectionAccuracyMetric daysAgoLogged](self, "daysAgoLogged"));
  [v3 setObject:v13 forKeyedSubscript:@"daysAgoLogged"];

  v14 = [(HKMCProjectionAccuracyMetric *)self isOngoingPeriod];
  [v3 setObject:v14 forKeyedSubscript:@"isOngoingPeriod"];

  v15 = [(HKMCProjectionAccuracyMetric *)self activePairedWatchProductType];
  [v3 setObject:v15 forKeyedSubscript:@"activePairedWatchProductType"];

  v16 = [(HKMCProjectionAccuracyMetric *)self daysFromMostLikelyStart];
  [v3 setObject:v16 forKeyedSubscript:@"daysFromMostLikelyStart"];

  v17 = [(HKMCProjectionAccuracyMetric *)self daysFromMostLikelyEnd];
  [v3 setObject:v17 forKeyedSubscript:@"daysFromMostLikelyEnd"];

  v18 = [(HKMCProjectionAccuracyMetric *)self daysFromProjectedStart];
  [v3 setObject:v18 forKeyedSubscript:@"daysFromProjectedStart"];

  v19 = [(HKMCProjectionAccuracyMetric *)self daysFromProjectedEnd];
  [v3 setObject:v19 forKeyedSubscript:@"daysFromProjectedEnd"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric wristTemperatureBasedPredictionEnabled](self, "wristTemperatureBasedPredictionEnabled"));
  [v3 setObject:v20 forKeyedSubscript:@"settings_wristTemperatureBasedPredictionEnabled"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isWristTemperatureInputDelivered](self, "isWristTemperatureInputDelivered"));
  [v3 setObject:v21 forKeyedSubscript:@"isWristTemperatureInputDelivered"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isSleepConfiguredForWristTemperatureMeasurements](self, "isSleepConfiguredForWristTemperatureMeasurements"));
  [v3 setObject:v22 forKeyedSubscript:@"isSleepConfiguredForWristTemperatureMeasurements"];

  id v23 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled"));
  [v3 setObject:v23 forKeyedSubscript:@"internalLiveOnCycleFactorOverride"];

  id v24 = (void *)[v3 copy];
  return (NSDictionary *)v24;
}

- (id)description
{
  v19 = NSString;
  uint64_t v18 = objc_opt_class();
  id v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapMostLikelyDays](self, "overlapMostLikelyDays"));
  id v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapProjectedDays](self, "overlapProjectedDays"));
  id v25 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric overlapNone](self, "overlapNone"));
  id v23 = [(HKMCProjectionAccuracyMetric *)self predictionPrimarySource];
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCProjectionAccuracyMetric totalDayRange](self, "totalDayRange"));
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric partiallyLogged](self, "partiallyLogged"));
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric periodPredictionEnabled](self, "periodPredictionEnabled"));
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric heartRateBasedPredictionEnabled](self, "heartRateBasedPredictionEnabled"));
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isLoggingMultipleDays](self, "isLoggingMultipleDays"));
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKMCProjectionAccuracyMetric daysAgoLogged](self, "daysAgoLogged"));
  v13 = [(HKMCProjectionAccuracyMetric *)self isOngoingPeriod];
  v12 = [(HKMCProjectionAccuracyMetric *)self activePairedWatchProductType];
  v11 = [(HKMCProjectionAccuracyMetric *)self daysFromMostLikelyStart];
  v14 = [(HKMCProjectionAccuracyMetric *)self daysFromMostLikelyEnd];
  id v3 = [(HKMCProjectionAccuracyMetric *)self daysFromProjectedStart];
  v10 = [(HKMCProjectionAccuracyMetric *)self daysFromProjectedEnd];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric wristTemperatureBasedPredictionEnabled](self, "wristTemperatureBasedPredictionEnabled"));
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isWristTemperatureInputDelivered](self, "isWristTemperatureInputDelivered"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric isSleepConfiguredForWristTemperatureMeasurements](self, "isSleepConfiguredForWristTemperatureMeasurements"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HKMCProjectionAccuracyMetric internalLiveOnCycleFactorOverrideEnabled](self, "internalLiveOnCycleFactorOverrideEnabled"));
  objc_msgSend(v19, "stringWithFormat:", @"<%@:%p overlapMostLikelyDays:%@ overlapProjectedDays:%@ overlapNone:%@ predictionPrimarySource:%@ totalDayRange:%@ partiallyLogged:%@ periodPredictionEnabled:%@ sensorBasedPredictionEnabled:%@ isLoggingMultipleDays:%@ daysAgoLogged:%@ isOngoingPeriod:%@ activePairedWatchProductType:%@ daysFromMostLikelyStart:%@ daysFromMostLikelyEnd:%@ daysFromProjectedStart:%@ daysFromProjectedEnd:%@ wristTemperatureBasedPredictionEnabled:%@ isWristTemperatureInputDelivered:%@ isSleepConfiguredForWristTemperatureMeasurements:%@ internalLiveOnCycleFactorOverride:%@>", v18, self, v26, v24, v25, v23, v17, v22, v16, v21, v15, v20, v13, v12, v11, v14,
    v3,
    v10,
    v4,
    v5,
    v6,
  v8 = v7);

  return v8;
}

- (void)setEventPayload:(id)a3
{
}

- (BOOL)overlapMostLikelyDays
{
  return self->_overlapMostLikelyDays;
}

- (void)setOverlapMostLikelyDays:(BOOL)a3
{
  self->_overlapMostLikelyDays = a3;
}

- (BOOL)overlapProjectedDays
{
  return self->_overlapProjectedDays;
}

- (void)setOverlapProjectedDays:(BOOL)a3
{
  self->_overlapProjectedDays = a3;
}

- (BOOL)overlapNone
{
  return self->_overlapNone;
}

- (void)setOverlapNone:(BOOL)a3
{
  self->_overlapNone = a3;
}

- (NSString)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(id)a3
{
}

- (int64_t)totalDayRange
{
  return self->_totalDayRange;
}

- (void)setTotalDayRange:(int64_t)a3
{
  self->_totalDayRange = a3;
}

- (BOOL)partiallyLogged
{
  return self->_partiallyLogged;
}

- (void)setPartiallyLogged:(BOOL)a3
{
  self->_partiallyLogged = a3;
}

- (BOOL)periodPredictionEnabled
{
  return self->_periodPredictionEnabled;
}

- (void)setPeriodPredictionEnabled:(BOOL)a3
{
  self->_periodPredictionEnabled = a3;
}

- (BOOL)heartRateBasedPredictionEnabled
{
  return self->_heartRateBasedPredictionEnabled;
}

- (void)setHeartRateBasedPredictionEnabled:(BOOL)a3
{
  self->_heartRateBasedPredictionEnabled = a3;
}

- (BOOL)isLoggingMultipleDays
{
  return self->_isLoggingMultipleDays;
}

- (void)setIsLoggingMultipleDays:(BOOL)a3
{
  self->_isLoggingMultipleDays = a3;
}

- (int64_t)daysAgoLogged
{
  return self->_daysAgoLogged;
}

- (void)setDaysAgoLogged:(int64_t)a3
{
  self->_daysAgoLogged = a3;
}

- (NSNumber)isOngoingPeriod
{
  return self->_isOngoingPeriod;
}

- (void)setIsOngoingPeriod:(id)a3
{
}

- (NSString)activePairedWatchProductType
{
  return self->_activePairedWatchProductType;
}

- (void)setActivePairedWatchProductType:(id)a3
{
}

- (NSNumber)daysFromMostLikelyStart
{
  return self->_daysFromMostLikelyStart;
}

- (void)setDaysFromMostLikelyStart:(id)a3
{
}

- (NSNumber)daysFromMostLikelyEnd
{
  return self->_daysFromMostLikelyEnd;
}

- (void)setDaysFromMostLikelyEnd:(id)a3
{
}

- (NSNumber)daysFromProjectedStart
{
  return self->_daysFromProjectedStart;
}

- (void)setDaysFromProjectedStart:(id)a3
{
}

- (NSNumber)daysFromProjectedEnd
{
  return self->_daysFromProjectedEnd;
}

- (void)setDaysFromProjectedEnd:(id)a3
{
}

- (BOOL)wristTemperatureBasedPredictionEnabled
{
  return self->_wristTemperatureBasedPredictionEnabled;
}

- (void)setWristTemperatureBasedPredictionEnabled:(BOOL)a3
{
  self->_wristTemperatureBasedPredictionEnabled = a3;
}

- (BOOL)isWristTemperatureInputDelivered
{
  return self->_isWristTemperatureInputDelivered;
}

- (void)setIsWristTemperatureInputDelivered:(BOOL)a3
{
  self->_isWristTemperatureInputDelivered = a3;
}

- (BOOL)isSleepConfiguredForWristTemperatureMeasurements
{
  return self->_isSleepConfiguredForWristTemperatureMeasurements;
}

- (void)setIsSleepConfiguredForWristTemperatureMeasurements:(BOOL)a3
{
  self->_isSleepConfiguredForWristTemperatureMeasurements = a3;
}

- (BOOL)internalLiveOnCycleFactorOverrideEnabled
{
  return self->_internalLiveOnCycleFactorOverrideEnabled;
}

- (void)setInternalLiveOnCycleFactorOverrideEnabled:(BOOL)a3
{
  self->_internalLiveOnCycleFactorOverrideEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysFromProjectedEnd, 0);
  objc_storeStrong((id *)&self->_daysFromProjectedStart, 0);
  objc_storeStrong((id *)&self->_daysFromMostLikelyEnd, 0);
  objc_storeStrong((id *)&self->_daysFromMostLikelyStart, 0);
  objc_storeStrong((id *)&self->_activePairedWatchProductType, 0);
  objc_storeStrong((id *)&self->_isOngoingPeriod, 0);
  objc_storeStrong((id *)&self->_predictionPrimarySource, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

@end