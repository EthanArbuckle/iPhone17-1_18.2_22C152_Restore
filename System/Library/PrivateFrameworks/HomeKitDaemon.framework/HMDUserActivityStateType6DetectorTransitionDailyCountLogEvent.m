@interface HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent
- (HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent)initWithEndedHomeCount:(id)a3 coreLocationCount:(id)a4 coreLocationEndedHomeCount:(id)a5 coreLocationEndedNonHome:(id)a6 coreLocationEndedNotMakingProgress:(id)a7 coreLocationResume:(id)a8 coreLocationEndDateUpdated:(id)a9 coreLocationVisitExit:(id)a10 coreLocationVisitEntry:(id)a11 maxCoreLocationStateEndOffset:(id)a12;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)coreLocationCount;
- (NSNumber)coreLocationEndDateUpdated;
- (NSNumber)coreLocationEndedHomeCount;
- (NSNumber)coreLocationEndedNonHome;
- (NSNumber)coreLocationEndedNotMakingProgress;
- (NSNumber)coreLocationResume;
- (NSNumber)coreLocationVisitEntry;
- (NSNumber)coreLocationVisitExit;
- (NSNumber)endedHomeCount;
- (NSNumber)maxCoreLocationStateEndOffset;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxCoreLocationStateEndOffset, 0);
  objc_storeStrong((id *)&self->_coreLocationVisitEntry, 0);
  objc_storeStrong((id *)&self->_coreLocationVisitExit, 0);
  objc_storeStrong((id *)&self->_coreLocationEndDateUpdated, 0);
  objc_storeStrong((id *)&self->_coreLocationResume, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedNotMakingProgress, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedNonHome, 0);
  objc_storeStrong((id *)&self->_coreLocationEndedHomeCount, 0);
  objc_storeStrong((id *)&self->_coreLocationCount, 0);
  objc_storeStrong((id *)&self->_endedHomeCount, 0);
}

- (NSNumber)maxCoreLocationStateEndOffset
{
  return self->_maxCoreLocationStateEndOffset;
}

- (NSNumber)coreLocationVisitEntry
{
  return self->_coreLocationVisitEntry;
}

- (NSNumber)coreLocationVisitExit
{
  return self->_coreLocationVisitExit;
}

- (NSNumber)coreLocationEndDateUpdated
{
  return self->_coreLocationEndDateUpdated;
}

- (NSNumber)coreLocationResume
{
  return self->_coreLocationResume;
}

- (NSNumber)coreLocationEndedNotMakingProgress
{
  return self->_coreLocationEndedNotMakingProgress;
}

- (NSNumber)coreLocationEndedNonHome
{
  return self->_coreLocationEndedNonHome;
}

- (NSNumber)coreLocationEndedHomeCount
{
  return self->_coreLocationEndedHomeCount;
}

- (NSNumber)coreLocationCount
{
  return self->_coreLocationCount;
}

- (NSNumber)endedHomeCount
{
  return self->_endedHomeCount;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v15[9] = *MEMORY[0x263EF8340];
  v3 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self endedHomeCount];
  v15[0] = v3;
  v14[1] = @"coreLocationCount";
  v4 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationCount];
  v15[1] = v4;
  v14[2] = @"coreLocationEndedHomeCount";
  v5 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationEndedHomeCount];
  v15[2] = v5;
  v14[3] = @"coreLocationEndedNonHome";
  v6 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationEndedNonHome];
  v15[3] = v6;
  v14[4] = @"coreLocationResume";
  v7 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationResume];
  v15[4] = v7;
  v14[5] = @"coreLocationEndDateUpdated";
  v8 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationEndDateUpdated];
  v15[5] = v8;
  v14[6] = @"coreLocationVisitExit";
  v9 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationVisitExit];
  v15[6] = v9;
  v14[7] = @"coreLocationVisitEntry";
  v10 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self coreLocationVisitEntry];
  v15[7] = v10;
  v14[8] = @"maxCoreLocationStateEndOffset";
  v11 = [(HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent *)self maxCoreLocationStateEndOffset];
  v15[8] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.HomeAS.HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent";
}

- (HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent)initWithEndedHomeCount:(id)a3 coreLocationCount:(id)a4 coreLocationEndedHomeCount:(id)a5 coreLocationEndedNonHome:(id)a6 coreLocationEndedNotMakingProgress:(id)a7 coreLocationResume:(id)a8 coreLocationEndDateUpdated:(id)a9 coreLocationVisitExit:(id)a10 coreLocationVisitEntry:(id)a11 maxCoreLocationStateEndOffset:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v30 = a7;
  id v27 = a8;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)HMDUserActivityStateType6DetectorTransitionDailyCountLogEvent;
  v22 = [(HMMLogEvent *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_endedHomeCount, a3);
    objc_storeStrong((id *)&v23->_coreLocationCount, obj);
    objc_storeStrong((id *)&v23->_coreLocationEndedHomeCount, a5);
    objc_storeStrong((id *)&v23->_coreLocationEndedNonHome, v26);
    objc_storeStrong((id *)&v23->_coreLocationEndedNotMakingProgress, a7);
    objc_storeStrong((id *)&v23->_coreLocationResume, v27);
    objc_storeStrong((id *)&v23->_coreLocationEndDateUpdated, a9);
    objc_storeStrong((id *)&v23->_coreLocationVisitExit, a10);
    objc_storeStrong((id *)&v23->_coreLocationVisitEntry, a11);
    objc_storeStrong((id *)&v23->_maxCoreLocationStateEndOffset, a12);
  }

  return v23;
}

@end