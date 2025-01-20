@interface EMDEEventExtractor
+ (id)postProcessTitle:(id)a3 messageBody:(id)a4;
- (BOOL)isEndTimeSignificantForEvent:(id)a3;
- (BOOL)isStartTimeSignificantForEvent:(id)a3;
- (EMDEEventExtractor)initWithConfigFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5;
- (EMDEModelWrapper)modelWrapper;
- (id)createEventResultForTravelCategory:(id)a3 title:(id)a4 date:(id)a5;
- (id)createEventResultFromTitle:(id)a3 date:(id)a4 messageBody:(id)a5;
- (id)dateStringForDate:(id)a3;
- (id)extractDates;
- (id)extractEventDatesFromModelDateOutput:(id)a3;
- (id)extractEventFromMessage:(id)a3 error:(id *)a4;
- (id)extractTitleFromMessage:(id)a3 error:(id *)a4;
- (id)extractTitles;
- (id)formatString:(id)a3;
- (id)getDateFromString:(id)a3;
- (int64_t)extractionFailureCode;
- (void)setExtractionFailureCode:(int64_t)a3;
- (void)setModelWrapper:(id)a3;
@end

@implementation EMDEEventExtractor

- (EMDEEventExtractor)initWithConfigFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
  {
    v15 = extractionLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10008DE14();
    }

    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithFormat:@"Found nil in input params during init of EMDEEventExtractor"];
    v27 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];

    *a5 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v17];

    goto LABEL_16;
  }
  v23.receiver = self;
  v23.super_class = (Class)EMDEEventExtractor;
  self = [(EMDEEventExtractor *)&v23 init];
  v11 = objc_alloc_init(EMDEModelWrapper);
  modelWrapper = self->_modelWrapper;
  self->_modelWrapper = v11;

  v13 = self->_modelWrapper;
  if (!v13)
  {
    v19 = extractionLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10008DE8C();
    }

    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:@"Couldn't instantiate EMDEModelWrapper"];
    v25 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    *a5 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v21];

    goto LABEL_16;
  }
  [(EMDEModelWrapper *)v13 loadConfigFromFile:v8 assetFolderPath:v10 error:a5];
  if (a5 && *a5)
  {
    v14 = extractionLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008DEC0((uint64_t *)a5, v14);
    }

LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  self->_extractionFailureCode = -1;
  self = self;
  v18 = self;
LABEL_17:

  return v18;
}

- (BOOL)isStartTimeSignificantForEvent:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"EMDE_START_TIME_IS_SIGNIFICANT"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (a3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (BOOL)isEndTimeSignificantForEvent:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (a3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (id)dateStringForDate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  unsigned __int8 v5 = +[NSTimeZone localTimeZone];
  [v4 setTimeZone:v5];

  v6 = [v4 stringFromDate:v3];

  return v6;
}

- (id)formatString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    unsigned __int8 v5 = +[NSCharacterSet whitespaceCharacterSet];
    v6 = [v4 stringByTrimmingCharactersInSet:v5];

    if ([v6 length])
    {
      v7 = objc_msgSend(v6, "substringWithRange:", 0, 1);
      id v8 = [v7 uppercaseString];
      uint64_t v9 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", 0, 1, v8);

      v6 = (void *)v9;
    }
    v10 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @".,!?:_(-");
    id v11 = [v6 stringByTrimmingCharactersInSet:v10];
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

+ (id)postProcessTitle:(id)a3 messageBody:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 length];
    if (v6)
    {
      if (v7
        && [v6 length]
        && [v5 rangeOfString:@"Travel booking" options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = objc_alloc_init(DDScannerHelper);
        id v8 = +[NSLocale currentLocale];
        uint64_t v9 = [(DDScannerHelper *)v19 runDataDetectorsOnBody:v6 locale:v8];

        v10 = [v9 objectForKeyedSubscript:@"error"];

        if (!v10)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          v13 = [v9 objectForKeyedSubscript:@"extractions"];
          id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v21;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v21 != v15) {
                  objc_enumerationMutation(v13);
                }
                v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:@"ddType"];
                BOOL v18 = [v17 integerValue] == (id)8;

                if (v18)
                {
                  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", @"Travel booking from", @"Flight:", 1, 0, objc_msgSend(v5, "length"));
                  id v11 = (id)objc_claimAutoreleasedReturnValue();

                  goto LABEL_9;
                }
              }
              id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
      }
    }
  }
  id v11 = v5;
LABEL_9:

  return v11;
}

- (id)extractDates
{
  id v3 = [(EMDEModelWrapper *)self->_modelWrapper runBeamInferenceForDate];
  if (v3)
  {
    v4 = extractionLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v3 objectForKey:@"prediction"];
      sub_10008DF3C(v5, v9, v4);
    }

    id v6 = [(EMDEEventExtractor *)self extractEventDatesFromModelDateOutput:v3];
  }
  else
  {
    id v7 = extractionLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Predicted Date String.", v9, 2u);
    }

    id v6 = 0;
    self->_extractionFailureCode = 1;
  }

  return v6;
}

- (id)extractEventDatesFromModelDateOutput:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"score"];
    [v6 floatValue];
    float v8 = v7;

    uint64_t v9 = +[EMDEUtils config];
    v10 = [v9 objectForKeyedSubscript:@"EMDE_DATE_THRESHOLD"];
    if (v10)
    {
      id v11 = +[EMDEUtils config];
      v12 = [v11 objectForKeyedSubscript:@"EMDE_DATE_THRESHOLD"];
      [v12 floatValue];
      float v14 = v13;

      if (v8 < v14)
      {
        uint64_t v15 = extractionLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Date predicted has score below allowed threshold. Ignoring prediction.", buf, 2u);
        }

        id v16 = 0;
        self->_extractionFailureCode = 3;
        goto LABEL_90;
      }
    }
    else
    {
    }
    BOOL v18 = [v5 objectForKey:@"prediction"];
    id v97 = objc_alloc_init((Class)NSMutableArray);
    v19 = +[EMDEUtils config];
    long long v20 = [v19 objectForKeyedSubscript:@"EMDE_EVENT_SEPARATOR"];
    id v21 = [v18 rangeOfString:v20];

    long long v22 = +[EMDEUtils config];
    long long v23 = [v22 objectForKeyedSubscript:@"EMDE_HOTEL_BOOKING_START_DATE_TOKEN"];
    id v24 = [v18 rangeOfString:v23 options:1];

    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL && v24 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [(EMDEEventExtractor *)self getDateFromString:v18];
      NSErrorUserInfoKey v26 = [v25 objectForKeyedSubscript:@"EMDE_EXTRACTION_TYPE"];
      unint64_t v27 = (unint64_t)[v26 integerValue];

      unsigned int v28 = [(EMDEEventExtractor *)self isStartTimeSignificantForEvent:v25];
      if (v27 <= 5 && ((1 << v27) & 0x36) != 0 && v28)
      {
        [v97 addObject:v25];
LABEL_32:

LABEL_88:
        v75 = v97;
        id v16 = v97;
        goto LABEL_89;
      }
      if (v25)
      {
        v54 = extractionLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Significant Start DateTime found for the event.", buf, 2u);
        }
        int64_t v55 = 6;
      }
      else
      {
        v54 = extractionLogHandle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Data Detector failed to return any date from string", buf, 2u);
        }
        int64_t v55 = 5;
      }

      self->_extractionFailureCode = v55;
      goto LABEL_68;
    }
    if (v24 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = +[EMDEUtils config];
      v30 = [v29 objectForKeyedSubscript:@"EMDE_EVENT_SEPARATOR"];
      v25 = [v18 componentsSeparatedByString:v30];

      id v31 = objc_alloc_init((Class)NSMutableDictionary);
      v32 = [v25 objectAtIndexedSubscript:0];
      v33 = [(EMDEEventExtractor *)self getDateFromString:v32];

      v34 = [v33 objectForKeyedSubscript:@"EMDE_EXTRACTION_TYPE"];
      unint64_t v35 = (unint64_t)[v34 integerValue];

      unsigned int v36 = [(EMDEEventExtractor *)self isStartTimeSignificantForEvent:v33];
      if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        unsigned int v37 = v36;
      }
      else {
        unsigned int v37 = 0;
      }
      if (v37 == 1)
      {
        v38 = [v33 objectForKeyedSubscript:@"EMDE_START_DATE"];
        [v31 setObject:v38 forKeyedSubscript:@"EMDE_START_DATE"];

        if ([v25 count] == (id)2)
        {
          v39 = [v25 objectAtIndexedSubscript:1];
          v40 = +[EMDEUtils config];
          v41 = [v40 objectForKeyedSubscript:@"EMDE_HOTEL_BOOKING_END_DATE_TOKEN"];
          id v42 = [v39 rangeOfString:v41 options:1];

          if (v42 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v43 = [v25 objectAtIndexedSubscript:1];
            v44 = [(EMDEEventExtractor *)self getDateFromString:v43];

            v45 = [v44 objectForKeyedSubscript:@"EMDE_EXTRACTION_TYPE"];
            v46 = (char *)[v45 integerValue];

            v47 = [v44 objectForKeyedSubscript:@"EMDE_START_DATE"];
            v48 = [v33 objectForKeyedSubscript:@"EMDE_START_DATE"];
            id v49 = [v47 compare:v48];

            if (v44 && (unint64_t)(v46 - 6) >= 0xFFFFFFFFFFFFFFFDLL && v49 == (id)1)
            {
              v50 = [v44 objectForKeyedSubscript:@"EMDE_START_DATE"];
              [v31 setObject:v50 forKeyedSubscript:@"EMDE_END_DATE"];

              [v31 setObject:&__kCFBooleanTrue forKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
            }
          }
        }
        v51 = [v31 objectForKeyedSubscript:@"EMDE_END_DATE"];

        if (!v51)
        {
          v52 = [v33 objectForKeyedSubscript:@"EMDE_START_DATE"];
          v53 = [v52 dateByAddingTimeInterval:3600.0];
          [v31 setObject:v53 forKeyedSubscript:@"EMDE_END_DATE"];

          [v31 setObject:&__kCFBooleanFalse forKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
        }
        [v97 addObject:v31];

        goto LABEL_32;
      }
      if (v33)
      {
        v73 = extractionLogHandle();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Significant Start DateTime found for the event.", buf, 2u);
        }
        int64_t v74 = 6;
      }
      else
      {
        v73 = extractionLogHandle();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Data Detector failed to return any date from string", buf, 2u);
        }
        int64_t v74 = 5;
      }

      self->_extractionFailureCode = v74;
LABEL_68:
      id v16 = &__NSArray0__struct;
      v75 = v97;
LABEL_89:

      goto LABEL_90;
    }
    v56 = +[EMDEUtils config];
    v57 = [v56 objectForKeyedSubscript:@"EMDE_EVENT_SEPARATOR"];
    v58 = [v18 componentsSeparatedByString:v57];

    v59 = [v58 objectAtIndexedSubscript:0];
    v60 = [(EMDEEventExtractor *)self getDateFromString:v59];

    v61 = [v60 objectForKeyedSubscript:@"EMDE_EXTRACTION_TYPE"];
    unint64_t v62 = (unint64_t)[v61 integerValue];

    unsigned int v63 = [(EMDEEventExtractor *)self isStartTimeSignificantForEvent:v60];
    if ((v62 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      unsigned int v64 = v63;
    }
    else {
      unsigned int v64 = 0;
    }
    if (v64 == 1)
    {
      [v97 addObject:v60];
      if ([v58 count] != (id)2)
      {
LABEL_87:

        goto LABEL_88;
      }
      v65 = [v58 objectAtIndexedSubscript:1];
      v66 = [(EMDEEventExtractor *)self getDateFromString:v65];

      v67 = [v66 objectForKeyedSubscript:@"EMDE_EXTRACTION_TYPE"];
      unint64_t v68 = (unint64_t)[v67 integerValue];

      unsigned int v69 = [(EMDEEventExtractor *)self isStartTimeSignificantForEvent:v66];
      if ((v68 & 0xFFFFFFFFFFFFFFFELL) == 4) {
        unsigned int v70 = v69;
      }
      else {
        unsigned int v70 = 0;
      }
      if (v70 == 1)
      {
        [v97 addObject:v66];
LABEL_86:

        goto LABEL_87;
      }
      if (v68 - 1 < 2) {
        unsigned int v76 = v69;
      }
      else {
        unsigned int v76 = 0;
      }
      if (v76 != 1) {
        goto LABEL_86;
      }
      id v96 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      v77 = +[NSTimeZone localTimeZone];
      [v96 setTimeZone:v77];

      v78 = [v60 objectForKeyedSubscript:@"EMDE_START_DATE"];
      v95 = [v96 components:28 fromDate:v78];

      v79 = [v66 objectForKeyedSubscript:@"EMDE_START_DATE"];
      v80 = [v96 components:240 fromDate:v79];

      v94 = v80;
      objc_msgSend(v95, "setHour:", objc_msgSend(v80, "hour"));
      objc_msgSend(v95, "setMinute:", objc_msgSend(v80, "minute"));
      objc_msgSend(v95, "setSecond:", objc_msgSend(v80, "second"));
      v93 = [v96 dateFromComponents:v95];
      if ([(EMDEEventExtractor *)self isEndTimeSignificantForEvent:v66])
      {
        v81 = [v60 objectForKeyedSubscript:@"EMDE_START_DATE"];
        v82 = [v96 components:28 fromDate:v81];

        v83 = [v66 objectForKeyedSubscript:@"EMDE_END_DATE"];
        v84 = [v96 components:240 fromDate:v83];

        objc_msgSend(v82, "setHour:", objc_msgSend(v84, "hour"));
        objc_msgSend(v82, "setMinute:", objc_msgSend(v84, "minute"));
        objc_msgSend(v82, "setSecond:", objc_msgSend(v84, "second"));
        v85 = (char *)[v84 day];
        if (v85 == (char *)[v94 day] + 1
          || [v84 day] == (id)1 && objc_msgSend(v94, "day") != (id)1)
        {
          objc_msgSend(v82, "setDay:", (char *)objc_msgSend(v82, "day") + 1);
        }
        v87 = [v96 dateFromComponents:v82];

        v86 = &__kCFBooleanTrue;
      }
      else
      {
        [v93 dateByAddingTimeInterval:3600.0];
        v87 = v86 = &__kCFBooleanFalse;
      }
      id v88 = [v87 compare:v93];
      if (v88 == (id)1)
      {
        v99[0] = @"EMDE_START_DATE";
        v99[1] = @"EMDE_END_DATE";
        v100[0] = v93;
        v100[1] = v87;
        v99[2] = @"EMDE_EXTRACTION_TYPE";
        v89 = objc_msgSend(v66, "objectForKeyedSubscript:");
        v99[3] = @"EMDE_END_TIME_IS_SIGNIFICANT";
        v100[2] = v89;
        v100[3] = v86;
        v90 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];

        [v97 addObject:v90];
      }
      else
      {
        v91 = extractionLogHandle();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Significant Start DateTime found for the event.", buf, 2u);
        }

        self->_extractionFailureCode = 6;
      }

      if (v88 == (id)1) {
        goto LABEL_86;
      }
    }
    else
    {
      if (v60)
      {
        v71 = extractionLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Significant Start DateTime found for the event.", buf, 2u);
        }
        int64_t v72 = 6;
      }
      else
      {
        v71 = extractionLogHandle();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Data Detector failed to return any date from string", buf, 2u);
        }
        int64_t v72 = 5;
      }

      self->_extractionFailureCode = v72;
    }

    goto LABEL_68;
  }
  v17 = extractionLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10008DF94();
  }

  id v16 = 0;
LABEL_90:

  return v16;
}

- (id)extractTitles
{
  id v3 = [(EMDEModelWrapper *)self->_modelWrapper runBeamInferenceForTitle];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:@"prediction"];
    id v6 = [v4 objectForKey:@"score"];
    [v6 floatValue];
    float v8 = v7;

    uint64_t v9 = extractionLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10008DFC8((uint64_t)v5, v9, v8);
    }

    v10 = +[EMDEUtils config];
    id v11 = [v10 objectForKeyedSubscript:@"EMDE_TITLE_THRESHOLD"];
    if (v11)
    {
      v12 = +[EMDEUtils config];
      float v13 = [v12 objectForKeyedSubscript:@"EMDE_TITLE_THRESHOLD"];
      [v13 floatValue];
      BOOL v15 = v8 < v14;

      if (v15)
      {
        id v16 = extractionLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Title predicted has score below allowed threshold. Ignoring prediction.", v30, 2u);
        }

        id v17 = 0;
        self->_extractionFailureCode = 4;
        goto LABEL_15;
      }
    }
    else
    {
    }
    v19 = +[EMDEUtils config];
    long long v20 = [v19 objectForKeyedSubscript:@"EMDE_EVENT_SEPARATOR"];
    BOOL v21 = [v5 rangeOfString:v20] == (id)0x7FFFFFFFFFFFFFFFLL;

    if (v21)
    {
      long long v22 = [(EMDEEventExtractor *)self formatString:v5];
      id v31 = v22;
      id v17 = +[NSArray arrayWithObjects:&v31 count:1];
    }
    else
    {
      id v24 = +[EMDEUtils config];
      v25 = [v24 objectForKeyedSubscript:@"EMDE_EVENT_SEPARATOR"];
      NSErrorUserInfoKey v26 = [v5 componentsSeparatedByString:v25];
      id v17 = [v26 mutableCopy];

      for (unint64_t i = 0; (unint64_t)[v17 count] > i; ++i)
      {
        unsigned int v28 = [v17 objectAtIndexedSubscript:i];
        v29 = [(EMDEEventExtractor *)self formatString:v28];
        [v17 setObject:v29 atIndexedSubscript:i];
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  BOOL v18 = extractionLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No Predicted Title String.", v30, 2u);
  }

  id v17 = 0;
  self->_extractionFailureCode = 2;
LABEL_16:

  return v17;
}

- (id)extractTitleFromMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    self->_extractionFailureCode = -1;
    float v7 = extractionLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10008E084((uint64_t)v6, v7);
    }

    if ([(EMDEModelWrapper *)self->_modelWrapper prepareInputsForText:v6 error:a4]
      && ([(EMDEEventExtractor *)self extractTitles],
          (float v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v9 = v8;
      if (self->_extractionFailureCode == -1) {
        self->_extractionFailureCode = 0;
      }
      v19[0] = @"title";
      v10 = [v8 objectAtIndexedSubscript:0];
      v19[1] = @"errorCode";
      v20[0] = v10;
      id v11 = +[NSNumber numberWithInteger:self->_extractionFailureCode];
      v20[1] = v11;
      v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    }
    else
    {
      CFStringRef v17 = @"errorCode";
      uint64_t v13 = +[NSNumber numberWithInteger:self->_extractionFailureCode];
      uint64_t v18 = v13;
      v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v9 = (void *)v13;
    }
    goto LABEL_14;
  }
  float v14 = extractionLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10008E050();
  }

  if (a4)
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    BOOL v15 = +[NSString stringWithFormat:@"Found nil in inputMessage for extractEventFromMessage"];
    long long v22 = v15;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v9];
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (id)extractEventFromMessage:(id)a3 error:(id *)a4
{
  id v70 = a3;
  if (v70)
  {
    v67 = self;
    self->_extractionFailureCode = -1;
    id v5 = extractionLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10008E1AC((uint64_t)v70, v5);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v6 = [&off_1000B0130 countByEnumeratingWithState:&v76 objects:v87 count:16];
    float v7 = v67;
    if (v6)
    {
      uint64_t v8 = *(void *)v77;
      do
      {
        for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v77 != v8) {
            objc_enumerationMutation(&off_1000B0130);
          }
          if ([v70 rangeOfString:*(void *)(*((void *)&v76 + 1) + 8 * i) options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v68 = objc_alloc_init(DDScannerHelper);
            uint64_t v10 = +[NSLocale currentLocale];
            unsigned int v69 = [(DDScannerHelper *)v68 runDataDetectorsOnBody:v70 locale:v10];

            id v11 = [v69 objectForKeyedSubscript:@"error"];
            LOBYTE(v10) = v11 == 0;

            if ((v10 & 1) == 0)
            {

              float v7 = v67;
              continue;
            }
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v16 = [v69 objectForKeyedSubscript:@"extractions"];
            id v17 = [v16 countByEnumeratingWithState:&v72 objects:v86 count:16];
            if (!v17) {
              goto LABEL_30;
            }
            uint64_t v18 = *(void *)v73;
            while (2)
            {
              uint64_t v19 = 0;
LABEL_22:
              if (*(void *)v73 != v18) {
                objc_enumerationMutation(v16);
              }
              long long v20 = [*(id *)(*((void *)&v72 + 1) + 8 * v19) objectForKeyedSubscript:@"ddType"];
              if ([v20 integerValue] == (id)8)
              {
                BOOL v21 = [v70 rangeOfString:@"Flight" options:1] == (id)0x7FFFFFFFFFFFFFFFLL;

                if (v21)
                {
                  [@"Flight " stringByAppendingString:v70];
                  long long v20 = v70;
                  id v70 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_27;
                }
              }
              else
              {
LABEL_27:
              }
              if (v17 == (id)++v19)
              {
                id v17 = [v16 countByEnumeratingWithState:&v72 objects:v86 count:16];
                if (!v17)
                {
LABEL_30:

                  float v7 = v67;
                  goto LABEL_31;
                }
                continue;
              }
              goto LABEL_22;
            }
          }
        }
        id v6 = [&off_1000B0130 countByEnumeratingWithState:&v76 objects:v87 count:16];
      }
      while (v6);
    }
LABEL_31:
    if ([(EMDEModelWrapper *)v7->_modelWrapper prepareInputsForText:v70 error:a4])
    {
      long long v22 = [(EMDEEventExtractor *)v67 extractDates];
      long long v23 = v22;
      if (v22)
      {
        if ([v22 count])
        {
          uint64_t v24 = [(EMDEEventExtractor *)v67 extractTitles];
          if (v24)
          {
            v25 = (void *)v24;
            if ([v23 count] == (id)2 && objc_msgSend(v25, "count") == (id)2)
            {
              NSErrorUserInfoKey v26 = [v23 objectAtIndexedSubscript:0];
              unint64_t v27 = [v26 objectForKeyedSubscript:@"EMDE_START_DATE"];
              [v27 timeIntervalSinceNow];
              if (v28 > 31536000.0)
              {
              }
              else
              {
                v29 = [v23 objectAtIndexedSubscript:1];
                v30 = [v29 objectForKeyedSubscript:@"EMDE_START_DATE"];
                [v30 timeIntervalSinceNow];
                BOOL v32 = v31 > 31536000.0;

                if (!v32)
                {
                  v33 = [v23 objectAtIndexedSubscript:0];
                  v34 = [v33 objectForKeyedSubscript:@"EMDE_START_DATE"];
                  [v34 timeIntervalSinceNow];
                  if (v35 < 0.0)
                  {
                  }
                  else
                  {
                    unsigned int v36 = [v23 objectAtIndexedSubscript:1];
                    unsigned int v37 = [v36 objectForKeyedSubscript:@"EMDE_START_DATE"];
                    [v37 timeIntervalSinceNow];
                    BOOL v39 = v38 < 0.0;

                    if (!v39)
                    {
                      v40 = [v25 objectAtIndexedSubscript:0];
                      v41 = [v23 objectAtIndexedSubscript:0];
                      id v42 = [(EMDEEventExtractor *)v67 createEventResultFromTitle:v40 date:v41 messageBody:v70];

                      v43 = [v25 objectAtIndexedSubscript:1];
                      v44 = [v23 objectAtIndexedSubscript:1];
                      v45 = [(EMDEEventExtractor *)v67 createEventResultFromTitle:v43 date:v44 messageBody:v70];

                      v67->_extractionFailureCode = 0;
                      v85[0] = v42;
                      v85[1] = v45;
                      v46 = +[NSArray arrayWithObjects:v85 count:2];

LABEL_49:
                      if ([v46 count])
                      {
                        v82[1] = @"errorCode";
                        v83[0] = v46;
                        v82[0] = @"events";
                        id v49 = +[NSNumber numberWithInteger:v67->_extractionFailureCode];
                        v83[1] = v49;
                        +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
                      }
                      else
                      {
                        CFStringRef v80 = @"errorCode";
                        id v49 = +[NSNumber numberWithInteger:v67->_extractionFailureCode];
                        v81 = v49;
                        +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
                      BOOL v15 = };

                      float v14 = v70;
                      goto LABEL_53;
                    }
                  }
                  v61 = extractionLogHandle();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Skipping extracted events because event date is in past", buf, 2u);
                  }
                  goto LABEL_79;
                }
              }
              int64_t v55 = extractionLogHandle();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Skipping extracted events because event date is not in near future", buf, 2u);
              }
              goto LABEL_74;
            }
            if ([v23 count] && objc_msgSend(v25, "count"))
            {
              v51 = [v23 objectAtIndexedSubscript:0];
              v52 = [v51 objectForKeyedSubscript:@"EMDE_START_DATE"];
              [v52 timeIntervalSinceNow];
              BOOL v54 = v53 > 31536000.0;

              if (!v54)
              {
                v57 = [v23 objectAtIndexedSubscript:0];
                v58 = [v57 objectForKeyedSubscript:@"EMDE_START_DATE"];
                [v58 timeIntervalSinceNow];
                BOOL v60 = v59 < 0.0;

                if (!v60)
                {
                  unsigned int v63 = [v25 objectAtIndexedSubscript:0];
                  unsigned int v64 = [v23 objectAtIndexedSubscript:0];
                  v65 = [(EMDEEventExtractor *)v67 createEventResultFromTitle:v63 date:v64 messageBody:v70];

                  v67->_extractionFailureCode = 0;
                  v84 = v65;
                  v46 = +[NSArray arrayWithObjects:&v84 count:1];

                  goto LABEL_49;
                }
                v61 = extractionLogHandle();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Skipping extracted events because event date is in past", buf, 2u);
                }
LABEL_79:

                v46 = 0;
                uint64_t v62 = 7;
                goto LABEL_80;
              }
              int64_t v55 = extractionLogHandle();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Skipping extracted event because event date is not in near future", buf, 2u);
              }
LABEL_74:

              v46 = 0;
              uint64_t v62 = 8;
LABEL_80:
              v67->_extractionFailureCode = v62;
              goto LABEL_49;
            }
            v56 = extractionLogHandle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No event extracted.", buf, 2u);
            }

LABEL_48:
            v46 = 0;
            goto LABEL_49;
          }
        }
      }
    }
    else
    {
      v47 = extractionLogHandle();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_10008E130((uint64_t *)a4, v47);
      }

      long long v23 = 0;
    }
    v48 = extractionLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "EMDEEventExtractor - No event extracted.", buf, 2u);
    }

    v25 = 0;
    goto LABEL_48;
  }
  v12 = extractionLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10008E0FC();
  }

  if (a4)
  {
    NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
    uint64_t v13 = +[NSString stringWithFormat:@"Found nil in inputMessage for extractEventFromMessage"];
    v89 = v13;
    float v14 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];

    +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v14];
    BOOL v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

    goto LABEL_54;
  }
  BOOL v15 = 0;
LABEL_54:
  return v15;
}

- (id)getDateFromString:(id)a3
{
  id v35 = a3;
  v34 = objc_alloc_init(DDScannerHelper);
  id v3 = +[NSLocale currentLocale];
  id v4 = [(DDScannerHelper *)v34 runDataDetectorsOnBody:v35 locale:v3];

  v33 = v4;
  id v5 = [v4 objectForKeyedSubscript:@"error"];

  if (v5)
  {
    id v6 = extractionLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      float v7 = [v33 objectForKeyedSubscript:@"error"];
      sub_10008E28C(v7, buf, v6);
    }

    uint64_t v8 = v33;
    id v9 = v33;
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = [v33 objectForKeyedSubscript:@"extractions"];
    id v10 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v38;
      while (2)
      {
        for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          float v14 = [v13 objectForKeyedSubscript:@"type"];
          unsigned __int8 v15 = [@"NSTextCheckingTypeDate" isEqualToString:v14];

          if (v15)
          {
            id v16 = [v13 objectForKeyedSubscript:@"startDate"];
            if (v16)
            {
              id v17 = [v13 objectForKeyedSubscript:@"endDate"];
              BOOL v18 = v17 == 0;

              if (!v18)
              {
                v44[0] = @"EMDE_START_DATE";
                unint64_t v27 = [v13 objectForKeyedSubscript:@"startDate"];
                v45[0] = v27;
                v44[1] = @"EMDE_END_DATE";
                double v28 = [v13 objectForKeyedSubscript:@"endDate"];
                v45[1] = v28;
                v44[2] = @"EMDE_START_TIME_IS_SIGNIFICANT";
                v29 = [v13 objectForKeyedSubscript:@"startTimeIsSignificant"];
                v45[2] = v29;
                v44[3] = @"EMDE_END_TIME_IS_SIGNIFICANT";
                v30 = [v13 objectForKeyedSubscript:@"endTimeIsSignificant"];
                v45[3] = v30;
                v44[4] = @"EMDE_EXTRACTION_TYPE";
                double v31 = [v13 objectForKeyedSubscript:@"ddType"];
                v45[4] = v31;
                id v9 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];

                NSErrorUserInfoKey v26 = extractionLogHandle();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_20;
                }
                goto LABEL_21;
              }
            }
            uint64_t v19 = [v13 objectForKeyedSubscript:@"startDate"];
            BOOL v20 = v19 == 0;

            if (!v20)
            {
              v42[0] = @"EMDE_START_DATE";
              BOOL v21 = [v13 objectForKeyedSubscript:@"startDate"];
              v43[0] = v21;
              v42[1] = @"EMDE_END_DATE";
              long long v22 = [v13 objectForKeyedSubscript:@"startDate"];
              long long v23 = [v22 dateByAddingTimeInterval:3600.0];
              v43[1] = v23;
              v42[2] = @"EMDE_START_TIME_IS_SIGNIFICANT";
              uint64_t v24 = [v13 objectForKeyedSubscript:@"startTimeIsSignificant"];
              v43[2] = v24;
              v43[3] = &__kCFBooleanFalse;
              v42[3] = @"EMDE_END_TIME_IS_SIGNIFICANT";
              v42[4] = @"EMDE_EXTRACTION_TYPE";
              v25 = [v13 objectForKeyedSubscript:@"ddType"];
              v43[4] = v25;
              id v9 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];

              NSErrorUserInfoKey v26 = extractionLogHandle();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
LABEL_20:
              }
                sub_10008E224();
LABEL_21:

              goto LABEL_22;
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v9 = 0;
LABEL_22:
    uint64_t v8 = v33;
  }

  return v9;
}

- (id)createEventResultForTravelCategory:(id)a3 title:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v31 = v8;
  id v32 = a5;
  v29 = v9;
  id v10 = +[NSString stringWithFormat:@"%@:", v8];
  uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:v10 withString:&stru_1000AF728];

  v30 = v11;
  v12 = [v11 componentsSeparatedByString:@" to "];
  if ([v12 count] == (id)2)
  {
    uint64_t v13 = [v12 objectAtIndexedSubscript:0];
    float v14 = [(EMDEEventExtractor *)self formatString:v13];

    unsigned __int8 v15 = [v12 objectAtIndexedSubscript:1];
    id v16 = [(EMDEEventExtractor *)self formatString:v15];
    id v17 = v12;
LABEL_5:

    goto LABEL_7;
  }
  id v17 = [v11 componentsSeparatedByString:@"-"];

  if ([v17 count] == (id)2)
  {
    BOOL v18 = [v17 objectAtIndexedSubscript:0];
    float v14 = [(EMDEEventExtractor *)self formatString:v18];

    unsigned __int8 v15 = [v17 objectAtIndexedSubscript:1];
    id v16 = [(EMDEEventExtractor *)self formatString:v15];
    goto LABEL_5;
  }
  [(EMDEEventExtractor *)self formatString:v11];
  float v14 = v16 = &stru_1000AF728;
LABEL_7:
  uint64_t v19 = @"Travel booking";
  if ([v14 length])
  {
    uint64_t v19 = [@"Travel booking" stringByAppendingFormat:@" from %@", v14];
  }
  if ([(__CFString *)v16 length])
  {
    uint64_t v20 = [(__CFString *)v19 stringByAppendingFormat:@" to %@", v16];

    uint64_t v19 = (__CFString *)v20;
  }
  v33[0] = @"EventMetaDataExtractor_ML_EVENT__CATEGORY";
  v33[1] = @"EventMetaDataExtractor_ML_EVENT__DEPARTURE_LOCATION";
  v34[0] = v8;
  v34[1] = v14;
  v33[2] = @"EventMetaDataExtractor_ML_EVENT__ARRIVAL_LOCATION";
  v33[3] = @"EventMetaDataExtractor_ML_EVENT__TITLE";
  v34[2] = v16;
  v34[3] = v19;
  v33[4] = @"EventMetaDataExtractor_ML_EVENT__START_DATETIME";
  BOOL v21 = [v32 objectForKeyedSubscript:@"EMDE_START_DATE"];
  long long v22 = [(EMDEEventExtractor *)self dateStringForDate:v21];
  v34[4] = v22;
  v33[5] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME";
  long long v23 = [v32 objectForKeyedSubscript:@"EMDE_END_DATE"];
  uint64_t v24 = [(EMDEEventExtractor *)self dateStringForDate:v23];
  v34[5] = v24;
  v33[6] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT";
  v25 = [v32 objectForKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
  v34[6] = v25;
  NSErrorUserInfoKey v26 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:7];

  id v27 = [v26 mutableCopy];
  return v27;
}

- (id)createEventResultFromTitle:(id)a3 date:(id)a4 messageBody:(id)a5
{
  id v7 = a3;
  id v28 = a4;
  v29 = v7;
  if ([v7 hasPrefix:@"Flight:"])
  {
    CFStringRef v8 = @"Flight";
LABEL_7:
    id v9 = [(EMDEEventExtractor *)self createEventResultForTravelCategory:v8 title:v7 date:v28];
    goto LABEL_8;
  }
  if ([v7 hasPrefix:@"Train:"])
  {
    CFStringRef v8 = @"Train";
    goto LABEL_7;
  }
  if ([v7 hasPrefix:@"Bus:"])
  {
    CFStringRef v8 = @"Bus";
    goto LABEL_7;
  }
  if ([v7 hasPrefix:@"Stay:"])
  {
    BOOL v18 = [v7 stringByReplacingOccurrencesOfString:@"Stay:" withString:&stru_1000AF728];
    uint64_t v19 = [(EMDEEventExtractor *)self formatString:v18];
    uint64_t v20 = @"Booking";
    if ([v19 length])
    {
      uint64_t v20 = [@"Booking" stringByAppendingFormat:@" for %@", v19];
    }
    v39[0] = @"EventMetaDataExtractor_ML_EVENT__CATEGORY";
    v39[1] = @"EventMetaDataExtractor_ML_EVENT__NAME";
    v40[0] = @"Hotel";
    v40[1] = v19;
    v40[2] = v20;
    v39[2] = @"EventMetaDataExtractor_ML_EVENT__TITLE";
    v39[3] = @"EventMetaDataExtractor_ML_EVENT__START_DATETIME";
    BOOL v21 = [v28 objectForKeyedSubscript:@"EMDE_START_DATE"];
    long long v22 = [(EMDEEventExtractor *)self dateStringForDate:v21];
    v40[3] = v22;
    v39[4] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME";
    long long v23 = [v28 objectForKeyedSubscript:@"EMDE_END_DATE"];
    uint64_t v24 = [(EMDEEventExtractor *)self dateStringForDate:v23];
    v40[4] = v24;
    v39[5] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT";
    v25 = [v28 objectForKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
    v40[5] = v25;
    NSErrorUserInfoKey v26 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:6];
    id v27 = [v26 mutableCopy];
  }
  else
  {
    if (![v7 hasPrefix:@"Movie:"])
    {
      v35[0] = @"EventMetaDataExtractor_ML_EVENT__CATEGORY";
      v35[1] = @"EventMetaDataExtractor_ML_EVENT__TITLE";
      v36[0] = @"GenericEvent";
      v36[1] = v7;
      v35[2] = @"EventMetaDataExtractor_ML_EVENT__START_DATETIME";
      uint64_t v19 = [v28 objectForKeyedSubscript:@"EMDE_START_DATE"];
      BOOL v18 = [(EMDEEventExtractor *)self dateStringForDate:v19];
      v36[2] = v18;
      v35[3] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME";
      uint64_t v20 = [v28 objectForKeyedSubscript:@"EMDE_END_DATE"];
      BOOL v21 = [(EMDEEventExtractor *)self dateStringForDate:v20];
      v36[3] = v21;
      v35[4] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT";
      long long v22 = [v28 objectForKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
      v36[4] = v22;
      long long v23 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
      id v9 = [v23 mutableCopy];
      goto LABEL_31;
    }
    BOOL v18 = [v7 stringByReplacingOccurrencesOfString:@"Movie:" withString:&stru_1000AF728];
    uint64_t v19 = [(EMDEEventExtractor *)self formatString:v18];
    uint64_t v20 = @"Booking";
    if ([v19 length])
    {
      uint64_t v20 = [@"Booking" stringByAppendingFormat:@" for %@", v19];
    }
    v37[0] = @"EventMetaDataExtractor_ML_EVENT__CATEGORY";
    v37[1] = @"EventMetaDataExtractor_ML_EVENT__NAME";
    v38[0] = @"Movie";
    v38[1] = v19;
    v38[2] = v20;
    v37[2] = @"EventMetaDataExtractor_ML_EVENT__TITLE";
    v37[3] = @"EventMetaDataExtractor_ML_EVENT__START_DATETIME";
    BOOL v21 = [v28 objectForKeyedSubscript:@"EMDE_START_DATE"];
    long long v22 = [(EMDEEventExtractor *)self dateStringForDate:v21];
    v38[3] = v22;
    v37[4] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME";
    long long v23 = [v28 objectForKeyedSubscript:@"EMDE_END_DATE"];
    uint64_t v24 = [(EMDEEventExtractor *)self dateStringForDate:v23];
    v38[4] = v24;
    v37[5] = @"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT";
    v25 = [v28 objectForKeyedSubscript:@"EMDE_END_TIME_IS_SIGNIFICANT"];
    v38[5] = v25;
    NSErrorUserInfoKey v26 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:6];
    id v27 = [v26 mutableCopy];
  }
  id v9 = v27;

LABEL_31:
LABEL_8:
  [v9 allKeys];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v31;
    do
    {
      for (unint64_t i = 0; i != v11; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v10);
        }
        float v14 = *(__CFString **)(*((void *)&v30 + 1) + 8 * i);
        if (v14 != @"EventMetaDataExtractor_ML_EVENT__END_DATETIME_IS_SIGNIFICANT")
        {
          unsigned __int8 v15 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          unsigned int v16 = [v15 isEqualToString:&stru_1000AF728];

          if (v16) {
            [v9 removeObjectForKey:v14];
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  return v9;
}

- (EMDEModelWrapper)modelWrapper
{
  return self->_modelWrapper;
}

- (void)setModelWrapper:(id)a3
{
}

- (int64_t)extractionFailureCode
{
  return self->_extractionFailureCode;
}

- (void)setExtractionFailureCode:(int64_t)a3
{
  self->_extractionFailureCode = a3;
}

- (void).cxx_destruct
{
}

@end