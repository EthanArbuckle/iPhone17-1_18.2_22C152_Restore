@interface CUIKTimeToLeaveDescriptionGenerator
+ (id)_attributedEtaString:(double)a3 fontName:(id)a4 fontSize:(double)a5;
+ (id)_etaString:(double)a3;
+ (id)_travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 eta:(id)a5 location:(id)a6;
+ (id)_travelTimeDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5;
+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6;
+ (id)_travelTimeLeaveNowDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeLeaveNowDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeLeaveNowDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5;
+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6;
+ (id)_travelTimeLeaveNowTransitStringWithEta:(id)a3 location:(id)a4;
+ (id)_travelTimeLeaveNowTransitStringWithLocation:(id)a3;
+ (id)_travelTimeLeaveNowWalkingStringWithEta:(id)a3 location:(id)a4;
+ (id)_travelTimeLeaveNowWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeOnTimeDrivingStringWithEta:(id)a3;
+ (id)_travelTimeOnTimeTransitStringWithEta:(id)a3;
+ (id)_travelTimeOnTimeWalkingStringWithEta:(id)a3;
+ (id)_travelTimeRunningLateTransitStringWithEta:(id)a3 location:(id)a4;
+ (id)_travelTimeStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)_travelTimeWalkingStringWithEta:(id)a3 location:(id)a4;
+ (id)_travelTimeWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)departureDateString:(id)a3;
+ (id)explanatoryTextForTTLStatus:(unint64_t)a3;
+ (id)timeToLeaveAttributedStringWithAttributes:(id)a3 hypothesis:(id)a4 location:(id)a5;
+ (id)timeToLeaveStringWithEta:(double)a3 transportType:(int)a4 runningLate:(BOOL)a5;
+ (id)timeToLeaveStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)timeToLeaveStringWithHypothesis:(id)a3 location:(id)a4;
+ (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5;
+ (id)travelTimeApproachingDepartureDateStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
+ (id)travelTimeApproachingDepartureDateTransitStringWithDepartureDate:(id)a3 location:(id)a4;
+ (id)travelTimeLeaveNowStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5;
@end

@implementation CUIKTimeToLeaveDescriptionGenerator

+ (id)explanatoryTextForTTLStatus:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    v3 = CUIKBundle();
    v4 = v3;
    v5 = @"Time to leave alerts are not available because Calendar does not have access to your precise location.";
LABEL_5:
    v6 = &stru_1F187C430;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v3 = CUIKBundle();
    v4 = v3;
    v5 = @"Time to leave alerts are not available because Location Services are disabled for Alerts & Shortcuts Automations.";
    goto LABEL_5;
  }
  v3 = CUIKBundle();
  v4 = v3;
  v5 = @"Time to Leave explanatory text";
  v6 = @"When available, Calendar uses your location, locations of upcoming events, traffic conditions, and transit options to tell you how long it will take to arrive at your destination, so you can leave on time.";
LABEL_7:
  v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

  return v7;
}

+ (id)travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 estimatedTravelTime];
  v10 = objc_msgSend(a1, "_etaString:");
  v11 = [a1 _travelAdvisoryDescriptionOfType:a3 hypothesis:v9 eta:v10 location:v8];

  return v11;
}

+ (id)_travelAdvisoryDescriptionOfType:(unint64_t)a3 hypothesis:(id)a4 eta:(id)a5 location:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  switch(a3)
  {
    case 0uLL:
      uint64_t v12 = +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:v9 eta:v10 location:v11];
      goto LABEL_7;
    case 1uLL:
      uint64_t v12 = +[CUIKTimeToLeaveDescriptionGenerator travelTimeLeaveNowStringWithHypothesis:v9 eta:v10 location:v11];
      goto LABEL_7;
    case 2uLL:
      uint64_t v12 = +[CUIKTimeToLeaveDescriptionGenerator travelTimeRunningLateStringWithHypothesis:v9 eta:v10 location:v11];
LABEL_7:
      v13 = (__CFString *)v12;
      goto LABEL_11;
  }
  v14 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[CUIKTimeToLeaveDescriptionGenerator _travelAdvisoryDescriptionOfType:hypothesis:eta:location:]();
  }

  v13 = &stru_1F187C430;
LABEL_11:

  return v13;
}

+ (id)timeToLeaveStringWithHypothesis:(id)a3 location:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 estimatedTravelTime];
  id v8 = objc_msgSend(a1, "_etaString:");
  id v9 = [a1 timeToLeaveStringWithHypothesis:v7 eta:v8 location:v6];

  return v9;
}

+ (id)timeToLeaveStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_debug_impl(&dword_1BDF08000, v11, OS_LOG_TYPE_DEBUG, "Generating time to leave string from hypothesis: [%@]. ETA: [%@], location: [%@].", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
  unint64_t v13 = +[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionTypeForDate:v12 hypothesis:v8];

  v14 = [a1 _travelAdvisoryDescriptionOfType:v13 hypothesis:v8 eta:v9 location:v10];

  return v14;
}

+ (id)timeToLeaveStringWithEta:(double)a3 transportType:(int)a4 runningLate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = [a1 _etaString:a3];
  if (a4 == 2)
  {
    if (v5) {
      [a1 _travelTimeWalkingStringWithEta:v8 location:0];
    }
    else {
      [a1 _travelTimeOnTimeWalkingStringWithEta:v8];
    }
  }
  else if (a4 == 1)
  {
    if (v5) {
      [a1 _travelTimeRunningLateTransitStringWithEta:v8 location:0];
    }
    else {
      [a1 _travelTimeOnTimeTransitStringWithEta:v8];
    }
  }
  else if (v5)
  {
    [a1 _travelTimeDrivingSubstringWithEta:v8 location:0 includeTransportType:0];
  }
  else
  {
    [a1 _travelTimeOnTimeDrivingStringWithEta:v8];
  uint64_t v9 = };
  id v10 = (void *)v9;

  return v10;
}

+ (id)timeToLeaveAttributedStringWithAttributes:(id)a3 hypothesis:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v9 estimatedTravelTime];
  id v11 = objc_msgSend(a1, "_etaString:");
  uint64_t v12 = [a1 timeToLeaveStringWithHypothesis:v9 eta:v11 location:v8];

  unint64_t v13 = [v9 suggestedDepartureDate];
  int v14 = [v9 transportType];

  if (v14 == 1)
  {
    v15 = [MEMORY[0x1E4F25518] shared];
    if ([v15 showDepartureDateForTransitTimeToLeave])
    {
      int v16 = [a1 departureDateString:v13];
      if ([v12 containsString:v16])
      {
        id v17 = [a1 departureDateString:v13];
      }
      else
      {
        id v17 = v11;
      }
      id v18 = v17;
    }
    else
    {
      id v18 = v11;
    }
  }
  else
  {
    id v18 = v11;
  }
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v12 attributes:v10];
  __int16 v20 = [v10 objectForKeyedSubscript:@"CUIKEtaAttributes"];

  if (v20)
  {
    id v21 = [v19 string];
    uint64_t v22 = [v21 rangeOfString:v18];
    objc_msgSend(v19, "addAttributes:range:", v20, v22, v23);
  }
  v24 = (void *)[v19 copy];

  return v24;
}

+ (id)_etaString:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  BOOL v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v4 setCalendar:v5];

  [v4 setUnitsStyle:2];
  [v4 setAllowedUnits:96];
  id v6 = [v4 stringFromTimeInterval:a3];

  return v6;
}

+ (id)departureDateString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v5 setCalendar:v6];

  [v5 setDateStyle:0];
  [v5 setTimeStyle:1];
  id v7 = [v5 stringFromDate:v4];

  return v7;
}

+ (id)_attributedEtaString:(double)a3 fontName:(id)a4 fontSize:(double)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [a1 _etaString:a3];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB08E8]);
  if (v8)
  {
    id v11 = [MEMORY[0x1E4FB08E0] fontWithName:v8 size:0.0];
    uint64_t v12 = [v11 familyName];
    uint64_t v13 = [v10 fontDescriptorWithFamily:v12];

    id v10 = (id)v13;
  }
  int v14 = [v10 fontDescriptorWithSymbolicTraits:2];

  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v20 = *MEMORY[0x1E4FB06F8];
  int v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v14 size:a5];
  v21[0] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  id v18 = (void *)[v15 initWithString:v9 attributes:v17];

  return v18;
}

+ (id)travelTimeApproachingDepartureDateStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 transportType] == 2)
  {
    uint64_t v11 = [a1 _travelTimeWalkingStringWithHypothesis:v8 eta:v9 location:v10];
LABEL_3:
    uint64_t v12 = (__CFString *)v11;
    goto LABEL_10;
  }
  if ([v8 transportType] == 1)
  {
    uint64_t v13 = [v8 suggestedDepartureDate];
    uint64_t v12 = [a1 travelTimeApproachingDepartureDateTransitStringWithDepartureDate:v13 location:v10];
  }
  else
  {
    if (![v8 transportType])
    {
      uint64_t v11 = [a1 _travelTimeDrivingStringWithHypothesis:v8 eta:v9 location:v10];
      goto LABEL_3;
    }
    int v14 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:](v8);
    }

    uint64_t v12 = &stru_1F187C430;
  }
LABEL_10:

  return v12;
}

+ (id)travelTimeApproachingDepartureDateTransitStringWithDepartureDate:(id)a3 location:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 departureDateString:v7];
  int v9 = [MEMORY[0x1E4F576C8] requiresSingularLocalizationForDate:v7];

  id v10 = NSString;
  uint64_t v11 = CUIKBundle();
  uint64_t v12 = v11;
  if (v6)
  {
    if (v9) {
      uint64_t v13 = @"Leave by %@ (departure date) to get to %@ (location) on time via transit. Singular hour.";
    }
    else {
      uint64_t v13 = @"Leave by %@ (departure date) to get to %@ (location) on time via transit. Plural hour.";
    }
    id v15 = [v11 localizedStringForKey:v13 value:@"Leave by %@ to get to %@ on time via transit." table:0];
    objc_msgSend(v10, "localizedStringWithFormat:", v15, v8, v6);
  }
  else
  {
    if (v9) {
      int v14 = @"Leave by %@ (departure date) to arrive on time via transit. Singular hour.";
    }
    else {
      int v14 = @"Leave by %@ (departure date) to arrive on time via transit. Plural hour.";
    }
    id v15 = [v11 localizedStringForKey:v14 value:@"Leave by %@ to arrive on time via transit." table:0];
    objc_msgSend(v10, "localizedStringWithFormat:", v15, v8, v18);
  int v16 = };

  return v16;
}

+ (id)travelTimeLeaveNowStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 transportType] == 2)
  {
    uint64_t v11 = [a1 _travelTimeLeaveNowWalkingStringWithHypothesis:v8 eta:v9 location:v10];
LABEL_3:
    uint64_t v12 = (__CFString *)v11;
    goto LABEL_13;
  }
  if ([v8 transportType] == 1)
  {
    uint64_t v13 = [MEMORY[0x1E4F25518] shared];
    if ([v13 showDepartureDateForTransitTimeToLeave]) {
      [a1 _travelTimeLeaveNowTransitStringWithLocation:v10];
    }
    else {
    uint64_t v12 = [a1 _travelTimeLeaveNowTransitStringWithEta:v9 location:v10];
    }

    goto LABEL_13;
  }
  if (![v8 transportType])
  {
    uint64_t v11 = [a1 _travelTimeLeaveNowDrivingStringWithHypothesis:v8 eta:v9 location:v10];
    goto LABEL_3;
  }
  int v14 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[CUIKTimeToLeaveDescriptionGenerator travelTimeLeaveNowStringWithHypothesis:eta:location:](v8);
  }

  uint64_t v12 = &stru_1F187C430;
LABEL_13:

  return v12;
}

+ (id)_travelTimeLeaveNowWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  return (id)[a1 _travelTimeLeaveNowWalkingStringWithEta:a4 location:a5];
}

+ (id)_travelTimeLeaveNowWalkingStringWithEta:(id)a3 location:(id)a4
{
  id v5 = a4;
  id v6 = NSString;
  id v7 = a3;
  id v8 = CUIKBundle();
  id v9 = v8;
  if (v5)
  {
    id v10 = [v8 localizedStringForKey:@"Leave now: It will take %@ to get to %@ on foot." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    id v10 = [v8 localizedStringForKey:@"Leave now: It will take %@ on foot." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  uint64_t v11 = };

  return v11;
}

+ (id)_travelTimeLeaveNowTransitStringWithEta:(id)a3 location:(id)a4
{
  id v5 = a4;
  id v6 = NSString;
  id v7 = a3;
  id v8 = CUIKBundle();
  id v9 = v8;
  if (v5)
  {
    id v10 = [v8 localizedStringForKey:@"Leave now: It will take %@ to get to %@ via transit." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    id v10 = [v8 localizedStringForKey:@"Leave now: It will take %@ via transit." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  uint64_t v11 = };

  return v11;
}

+ (id)_travelTimeLeaveNowTransitStringWithLocation:(id)a3
{
  id v3 = a3;
  id v4 = NSString;
  id v5 = CUIKBundle();
  id v6 = v5;
  if (v3)
  {
    id v7 = [v5 localizedStringForKey:@"Leave now to get to %@ (location) on time via transit." value:@"Leave now to get to %@ on time via transit." table:0];
    objc_msgSend(v4, "localizedStringWithFormat:", v7, v3);
  }
  else
  {
    id v7 = [v5 localizedStringForKey:@"Leave now to arrive on time via transit." value:&stru_1F187C430 table:0];
    objc_msgSend(v4, "localizedStringWithFormat:", v7, v10);
  id v8 = };

  return v8;
}

+ (id)_travelTimeLeaveNowDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (+[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionShouldIncludeTrafficForHypothesis:v10])
  {
    [a1 _travelTimeLeaveNowDrivingStringIncludingTrafficWithHypothesis:v10 eta:v9 location:v8];
  }
  else
  {
    [a1 _travelTimeLeaveNowDrivingStringExcludingTrafficWithHypothesis:v10 eta:v9 location:v8];
  uint64_t v11 = };

  return v11;
}

+ (id)_travelTimeLeaveNowDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 trafficDensityDescription];
  uint64_t v12 = [v8 routeName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    int v14 = [v8 routeName];
    id v15 = [a1 _travelTimeLeaveNowDrivingSubstringWithEta:v9 location:v10 routeName:v14 includeTransportType:0];
  }
  else
  {
    id v15 = [a1 _travelTimeLeaveNowDrivingSubstringWithEta:v9 location:v10 includeTransportType:0];
  }
  int v16 = [NSString stringWithFormat:@"%@ %@", v11, v15];

  return v16;
}

+ (id)_travelTimeLeaveNowDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 routeName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [v8 routeName];
    int v14 = [a1 _travelTimeLeaveNowDrivingSubstringWithEta:v9 location:v10 routeName:v13 includeTransportType:1];
  }
  else
  {
    int v14 = [a1 _travelTimeLeaveNowDrivingSubstringWithEta:v9 location:v10 includeTransportType:1];
  }

  return v14;
}

+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = NSString;
  uint64_t v13 = CUIKBundle();
  int v14 = v13;
  if (v10)
  {
    if (v6) {
      id v15 = @"Leave now: It will take %@ to get to %@ on %@ by car.";
    }
    else {
      id v15 = @"Leave now: It will take %@ to get to %@ on %@.";
    }
    id v17 = [v13 localizedStringForKey:v15 value:&stru_1F187C430 table:0];
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v10, v11);
  }
  else
  {
    if (v6) {
      int v16 = @"Leave now: It will take %@ on %@ by car.";
    }
    else {
      int v16 = @"Leave now: It will take %@ on %@.";
    }
    id v17 = [v13 localizedStringForKey:v16 value:&stru_1F187C430 table:0];
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v11, v20);
  uint64_t v18 = };

  return v18;
}

+ (id)_travelTimeLeaveNowDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = CUIKBundle();
  id v11 = v10;
  if (v8)
  {
    if (v5) {
      uint64_t v12 = @"Leave now: It will take %@ to get to %@ by car.";
    }
    else {
      uint64_t v12 = @"Leave now: It will take %@ to get to %@.";
    }
    int v14 = [v10 localizedStringForKey:v12 value:&stru_1F187C430 table:0];
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v8);
  }
  else
  {
    if (v5) {
      uint64_t v13 = @"Leave now: It will take %@ by car.";
    }
    else {
      uint64_t v13 = @"Leave now: It will take %@.";
    }
    int v14 = [v10 localizedStringForKey:v13 value:&stru_1F187C430 table:0];
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v17);
  id v15 = };

  return v15;
}

+ (id)_travelTimeRunningLateTransitStringWithEta:(id)a3 location:(id)a4
{
  id v5 = a4;
  BOOL v6 = NSString;
  id v7 = a3;
  id v8 = CUIKBundle();
  id v9 = v8;
  if (v5)
  {
    id v10 = [v8 localizedStringForKey:@"It will take %@ to get to %@ via transit." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    id v10 = [v8 localizedStringForKey:@"It will take %@ via transit." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  id v11 = };

  return v11;
}

+ (id)_travelTimeOnTimeWalkingStringWithEta:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = CUIKBundle();
  BOOL v6 = [v5 localizedStringForKey:@"It will take %@ to arrive on time by foot." value:&stru_1F187C430 table:0];
  id v7 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);

  return v7;
}

+ (id)_travelTimeOnTimeDrivingStringWithEta:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = CUIKBundle();
  BOOL v6 = [v5 localizedStringForKey:@"It will take %@ to arrive on time." value:&stru_1F187C430 table:0];
  id v7 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);

  return v7;
}

+ (id)_travelTimeOnTimeTransitStringWithEta:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = CUIKBundle();
  BOOL v6 = [v5 localizedStringForKey:@"It will take %@ to arrive on time via transit." value:&stru_1F187C430 table:0];
  id v7 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);

  return v7;
}

+ (id)_travelTimeStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 transportType] == 2)
  {
    uint64_t v11 = [a1 _travelTimeWalkingStringWithHypothesis:v8 eta:v9 location:v10];
LABEL_10:
    uint64_t v13 = (__CFString *)v11;
    goto LABEL_11;
  }
  if ([v8 transportType] == 1)
  {
    uint64_t v11 = [a1 _travelTimeRunningLateTransitStringWithEta:v9 location:v10];
    goto LABEL_10;
  }
  if (![v8 transportType])
  {
    uint64_t v11 = [a1 _travelTimeDrivingStringWithHypothesis:v8 eta:v9 location:v10];
    goto LABEL_10;
  }
  uint64_t v12 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[CUIKTimeToLeaveDescriptionGenerator travelTimeApproachingDepartureDateStringWithHypothesis:eta:location:](v8);
  }

  uint64_t v13 = &stru_1F187C430;
LABEL_11:

  return v13;
}

+ (id)_travelTimeWalkingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  return (id)[a1 _travelTimeWalkingStringWithEta:a4 location:a5];
}

+ (id)_travelTimeWalkingStringWithEta:(id)a3 location:(id)a4
{
  id v5 = a4;
  BOOL v6 = NSString;
  id v7 = a3;
  id v8 = CUIKBundle();
  id v9 = v8;
  if (v5)
  {
    id v10 = [v8 localizedStringForKey:@"It will take %@ to get to %@ on foot." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v5);
  }
  else
  {
    id v10 = [v8 localizedStringForKey:@"It will take %@ on foot." value:&stru_1F187C430 table:0];
    objc_msgSend(v6, "localizedStringWithFormat:", v10, v7, v13);
  uint64_t v11 = };

  return v11;
}

+ (id)_travelTimeDrivingStringWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (+[CUIKTTLDescriptionGeneratorUtilities ttlDescriptionShouldIncludeTrafficForHypothesis:v10])
  {
    [a1 _travelTimeDrivingStringIncludingTrafficWithHypothesis:v10 eta:v9 location:v8];
  }
  else
  {
    [a1 _travelTimeDrivingStringExcludingTrafficWithHypothesis:v10 eta:v9 location:v8];
  uint64_t v11 = };

  return v11;
}

+ (id)_travelTimeDrivingStringIncludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 trafficDensityDescription];
  uint64_t v12 = [v8 routeName];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    int v14 = [v8 routeName];
    id v15 = [a1 _travelTimeDrivingSubstringWithEta:v9 location:v10 routeName:v14 includeTransportType:0];
  }
  else
  {
    id v15 = [a1 _travelTimeDrivingSubstringWithEta:v9 location:v10 includeTransportType:0];
  }
  int v16 = [NSString stringWithFormat:@"%@ %@", v11, v15];

  return v16;
}

+ (id)_travelTimeDrivingStringExcludingTrafficWithHypothesis:(id)a3 eta:(id)a4 location:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 routeName];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [v8 routeName];
    int v14 = [a1 _travelTimeDrivingSubstringWithEta:v9 location:v10 routeName:v13 includeTransportType:1];
  }
  else
  {
    int v14 = [a1 _travelTimeDrivingSubstringWithEta:v9 location:v10 includeTransportType:1];
  }

  return v14;
}

+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 routeName:(id)a5 includeTransportType:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = NSString;
  uint64_t v13 = CUIKBundle();
  int v14 = v13;
  if (v10)
  {
    if (v6) {
      id v15 = @"It will take %@ to get to %@ on %@ by car.";
    }
    else {
      id v15 = @"It will take %@ to get to %@ on %@.";
    }
    uint64_t v17 = [v13 localizedStringForKey:v15 value:&stru_1F187C430 table:0];
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v10, v11);
  }
  else
  {
    if (v6) {
      int v16 = @"It will take %@ on %@ by car.";
    }
    else {
      int v16 = @"It will take %@ on %@.";
    }
    uint64_t v17 = [v13 localizedStringForKey:v16 value:&stru_1F187C430 table:0];
    objc_msgSend(v12, "localizedStringWithFormat:", v17, v9, v11, v20);
  uint64_t v18 = };

  return v18;
}

+ (id)_travelTimeDrivingSubstringWithEta:(id)a3 location:(id)a4 includeTransportType:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = NSString;
  id v10 = CUIKBundle();
  id v11 = v10;
  if (v8)
  {
    if (v5) {
      uint64_t v12 = @"It will take %@ to get to %@ by car.";
    }
    else {
      uint64_t v12 = @"It will take %@ to get to %@.";
    }
    int v14 = [v10 localizedStringForKey:v12 value:&stru_1F187C430 table:0];
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v8);
  }
  else
  {
    if (v5) {
      uint64_t v13 = @"It will take %@ by car.";
    }
    else {
      uint64_t v13 = @"It will take %@ to arrive.";
    }
    int v14 = [v10 localizedStringForKey:v13 value:&stru_1F187C430 table:0];
    objc_msgSend(v9, "localizedStringWithFormat:", v14, v7, v17);
  id v15 = };

  return v15;
}

+ (void)_travelAdvisoryDescriptionOfType:hypothesis:eta:location:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BDF08000, v0, OS_LOG_TYPE_ERROR, "Error: Unexpected TTL description type: %ld", v1, 0xCu);
}

+ (void)travelTimeApproachingDepartureDateStringWithHypothesis:(void *)a1 eta:location:.cold.1(void *a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F25650], "geoTransportTypeAsString:", objc_msgSend(a1, "transportType"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v2, v3, "Warning: Currently no support for generating 'Time to Leave' travel time message strings for the %@ transport type", v4, v5, v6, v7, v8);
}

+ (void)travelTimeLeaveNowStringWithHypothesis:(void *)a1 eta:location:.cold.1(void *a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F25650], "geoTransportTypeAsString:", objc_msgSend(a1, "transportType"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v2, v3, "Warning: Currently no support for generating 'Time to Leave' 'Leave now' message strings for the %@ transport type", v4, v5, v6, v7, v8);
}

@end