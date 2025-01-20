@interface HFCameraScrubberReachabilityEventContainer
- (BOOL)canAskForUserFeedback;
- (BOOL)hf_hasInsufficientAnalysis;
- (BOOL)hf_isPlayable;
- (BOOL)isComplete;
- (HFCameraRecordingEvent)endEvent;
- (HFCameraRecordingEvent)startEvent;
- (HFCameraScrubberReachabilityEventContainer)initWithStartEvent:(id)a3 endEvent:(id)a4;
- (NSDate)dateOfOccurrence;
- (NSSet)eventUniqueIdentifiers;
- (NSString)description;
- (NSString)displayDescription;
- (NSUUID)uniqueIdentifier;
- (double)hf_duration;
- (double)targetFragmentDuration;
- (id)encryptionKey;
- (id)hf_dateInterval;
- (id)hf_endDate;
- (id)videoAssetRequiredHTTPHeaders;
- (unint64_t)containerType;
@end

@implementation HFCameraScrubberReachabilityEventContainer

- (HFCameraScrubberReachabilityEventContainer)initWithStartEvent:(id)a3 endEvent:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFCameraScrubberReachabilityEventContainer.m", 20, @"Invalid parameter not satisfying: %@", @"startEvent" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HFCameraScrubberReachabilityEventContainer;
  v10 = [(HFCameraScrubberReachabilityEventContainer *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_startEvent, a3);
    objc_storeStrong((id *)&v11->_endEvent, a4);
  }

  return v11;
}

- (unint64_t)containerType
{
  return 2;
}

- (NSDate)dateOfOccurrence
{
  v2 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v3 = [v2 dateOfOccurrence];

  return (NSDate *)v3;
}

- (NSUUID)uniqueIdentifier
{
  v3 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];

  if (v3)
  {
    v4 = (void *)MEMORY[0x263F08C38];
    v5 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
    v6 = [v5 uniqueIdentifier];
    v7 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
    id v8 = [v7 uniqueIdentifier];
    id v9 = [v8 UUIDString];
    v10 = [v9 dataUsingEncoding:4];
    v11 = objc_msgSend(v4, "hmf_UUIDWithNamespace:data:", v6, v10);
  }
  else
  {
    v5 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
    v11 = [v5 uniqueIdentifier];
  }

  return (NSUUID *)v11;
}

- (NSSet)eventUniqueIdentifiers
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v5 = [v4 uniqueIdentifier];
  v6 = [v3 setWithObject:v5];

  v7 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
  id v8 = [v7 uniqueIdentifier];
  objc_msgSend(v6, "na_safeAddObject:", v8);

  return (NSSet *)v6;
}

- (double)hf_duration
{
  v3 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];

  if (!v3) {
    return 4.0;
  }
  v4 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
  v5 = [v4 dateOfOccurrence];
  v6 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v7 = [v6 dateOfOccurrence];
  [v5 timeIntervalSinceDate:v7];
  double v9 = v8;

  double result = 4.0;
  if (v9 >= 0.0) {
    return v9;
  }
  return result;
}

- (BOOL)hf_isPlayable
{
  return 0;
}

- (BOOL)hf_hasInsufficientAnalysis
{
  return 0;
}

- (id)hf_endDate
{
  v3 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];

  if (v3)
  {
    v4 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
    [v4 dateOfOccurrence];
  }
  else
  {
    v4 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
    [(HFCameraScrubberReachabilityEventContainer *)self hf_duration];
    objc_msgSend(v4, "dateByAddingTimeInterval:");
  v5 = };

  return v5;
}

- (id)hf_dateInterval
{
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  v4 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  [(HFCameraScrubberReachabilityEventContainer *)self hf_duration];
  v5 = objc_msgSend(v3, "initWithStartDate:duration:", v4);

  return v5;
}

- (BOOL)isComplete
{
  v2 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
  BOOL v3 = v2 != 0;

  return v3;
}

- (double)targetFragmentDuration
{
  return 4.0;
}

- (id)encryptionKey
{
  return (id)[MEMORY[0x263EFF8F8] data];
}

- (id)videoAssetRequiredHTTPHeaders
{
  return (id)MEMORY[0x263EFFA78];
}

- (BOOL)canAskForUserFeedback
{
  return 0;
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFCameraScrubberReachabilityEventContainer *)self uniqueIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"uniqueIdentifier"];

  v6 = [(HFCameraScrubberReachabilityEventContainer *)self eventUniqueIdentifiers];
  id v7 = (id)[v3 appendObject:v6 withName:@"eventUniqueIdentifiers"];

  double v8 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  double v9 = +[HFCameraUtilities dayStringFromDate:v8];

  v10 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  v11 = +[HFCameraUtilities fullTimeStringFromDate:v10];

  v12 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  [(HFCameraScrubberReachabilityEventContainer *)self duration];
  v13 = objc_msgSend(v12, "dateByAddingTimeInterval:");

  objc_super v14 = +[HFCameraUtilities dayStringFromDate:v13];
  v15 = +[HFCameraUtilities fullTimeStringFromDate:v13];
  v16 = [NSString stringWithFormat:@"%@ %@ – %@ %@", v9, v11, v14, v15];
  [v3 appendString:v16 withName:@"dateRange"];

  v17 = NSString;
  v18 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  [(HFCameraScrubberReachabilityEventContainer *)self duration];
  v20 = [v17 stringWithFormat:@"%@ + %f = %@", v18, v19, v13];

  [v3 appendString:v20 withName:@"dateInterval"];
  v21 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v22 = objc_msgSend(v21, "hf_prettyDescription");
  id v23 = (id)[v3 appendObject:v22 withName:@"startEvent"];

  v24 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
  v25 = objc_msgSend(v24, "hf_prettyDescription");
  id v26 = (id)[v3 appendObject:v25 withName:@"endEvent"];

  v27 = [v3 build];

  return (NSString *)v27;
}

- (NSString)displayDescription
{
  BOOL v3 = [(HFCameraScrubberReachabilityEventContainer *)self dateOfOccurrence];
  v4 = +[HFCameraUtilities attributedShortTimeStringFromDate:v3];
  id v5 = [v4 string];

  v6 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
  id v7 = [v6 dateOfOccurrence];

  if (v7)
  {
    double v8 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
    double v9 = [v8 dateOfOccurrence];
    v10 = +[HFCameraUtilities attributedShortTimeStringFromDate:v9];
    v11 = [v10 string];

    v12 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
    v13 = [v12 dateOfOccurrence];
    LODWORD(v8) = +[HFCameraUtilities isDateToday:v13];

    objc_super v14 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
    v15 = [v14 dateOfOccurrence];
    BOOL v16 = +[HFCameraUtilities isDateToday:v15];

    v17 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
    v18 = [v17 dateOfOccurrence];
    uint64_t v19 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
    v20 = [v19 dateOfOccurrence];
    [v18 timeIntervalSinceDate:v20];
    double v22 = v21;

    if (v8)
    {
      if (v22 >= 60.0) {
        v29 = @"HFCameraReachabilityOfflineDurationTodayFormat";
      }
      else {
        v29 = @"HFCameraReachabilityOfflineAtTodayFormat";
      }
      v30 = HFLocalizedStringWithFormat(v29, @"%@%@", v23, v24, v25, v26, v27, v28, (uint64_t)v5);
      goto LABEL_26;
    }
    if (v16)
    {
      v40 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
      v41 = [v40 dateOfOccurrence];
      v42 = +[HFCameraUtilities localizerKeyDayNameFromDate:v41];

      [NSString stringWithFormat:@"HFCameraReachabilityOfflineDurationIncludesToday%@Format", v42];
    }
    else
    {
      v52 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
      v53 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
      v54 = [v53 dateOfOccurrence];
      v55 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
      v56 = [v55 dateOfOccurrence];
      int v57 = [v52 isDate:v54 inSameDayAsDate:v56];

      if (!v57)
      {
        v82 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
        v83 = [v82 dateOfOccurrence];
        v42 = +[HFCameraUtilities localizerKeyDayNameFromDate:v83];

        v84 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
        v85 = [v84 dateOfOccurrence];
        v67 = +[HFCameraUtilities localizerKeyDayNameFromDate:v85];

        v86 = [NSString stringWithFormat:@"HFCameraReachabilityOfflineDurationMultiDay%@%@Format", v42, v67];
        v30 = HFLocalizedStringWithFormat(v86, @"%@%@", v87, v88, v89, v90, v91, v92, (uint64_t)v5);

        goto LABEL_24;
      }
      v58 = [(HFCameraScrubberReachabilityEventContainer *)self endEvent];
      v59 = [v58 dateOfOccurrence];
      v42 = +[HFCameraUtilities localizerKeyDayNameFromDate:v59];

      v60 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
      v61 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
      v62 = [v61 dateOfOccurrence];
      uint64_t v63 = [v60 component:32 fromDate:v62];

      v64 = @"HFCameraReachabilityOfflineAtSameDay%@Format";
      v65 = @"HFCameraReachabilityOfflineDurationSameDay%@Format";
      if (v63 == 1)
      {
        v64 = @"HFCameraReachabilityOfflineAtSameDay%@SingularFormat";
        v65 = @"HFCameraReachabilityOfflineDurationSameDay%@SingularFormat";
      }
      if (v22 >= 60.0) {
        v66 = v65;
      }
      else {
        v66 = v64;
      }
      objc_msgSend(NSString, "stringWithFormat:", v66, v42);
    v67 = };
    v30 = HFLocalizedStringWithFormat(v67, @"%@%@", v68, v69, v70, v71, v72, v73, (uint64_t)v5);
LABEL_24:

    goto LABEL_25;
  }
  v31 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v32 = [v31 dateOfOccurrence];
  BOOL v33 = +[HFCameraUtilities isDateToday:v32];

  if (v33)
  {
    HFLocalizedStringWithFormat(@"HFCameraReachabilityOfflineCurrentlyTodayFormat", @"%@", v34, v35, v36, v37, v38, v39, (uint64_t)v5);
    v30 = LABEL_13:;
    goto LABEL_27;
  }
  v43 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v44 = [v43 dateOfOccurrence];
  BOOL v45 = +[HFCameraUtilities isDateYesterday:v44];

  if (v45)
  {
    HFLocalizedStringWithFormat(@"HFCameraReachabilityOfflineCurrentlyYesterdayFormat", @"%@", v46, v47, v48, v49, v50, v51, (uint64_t)v5);
    goto LABEL_13;
  }
  v74 = [(HFCameraScrubberReachabilityEventContainer *)self startEvent];
  v75 = [v74 dateOfOccurrence];
  v11 = +[HFCameraUtilities localizerKeyDayNameFromDate:v75];

  v42 = [NSString stringWithFormat:@"HFCameraReachabilityOfflineCurrently%@Format", v11];
  v30 = HFLocalizedStringWithFormat(v42, @"%@", v76, v77, v78, v79, v80, v81, (uint64_t)v5);
LABEL_25:

LABEL_26:
LABEL_27:

  return (NSString *)v30;
}

- (HFCameraRecordingEvent)startEvent
{
  return self->_startEvent;
}

- (HFCameraRecordingEvent)endEvent
{
  return self->_endEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
}

@end