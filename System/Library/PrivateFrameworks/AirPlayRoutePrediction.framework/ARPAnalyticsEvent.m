@interface ARPAnalyticsEvent
+ (id)feedbackEventsFromAppUsageEvents:(id)a3 playingEvents:(id)a4 microLocationEvents:(id)a5 feedbackEvents:(id)a6;
- (ARPAnalyticsEvent)init;
- (BOOL)predictionCorrect;
- (NSString)actualDevice;
- (NSString)correction;
- (NSString)correctionTiming;
- (NSString)failure;
- (NSString)predictedDevice;
- (NSString)prediction;
- (NSString)predictionReason;
- (NSString)suppressionReason;
- (id)analyticsDictionary;
- (id)description;
- (unint64_t)numberOfMicrolocations;
- (void)setActualDevice:(id)a3;
- (void)setCorrection:(id)a3;
- (void)setCorrectionTiming:(id)a3;
- (void)setFailure:(id)a3;
- (void)setNumberOfMicrolocations:(unint64_t)a3;
- (void)setPredictedDevice:(id)a3;
- (void)setPrediction:(id)a3;
- (void)setPredictionCorrect:(BOOL)a3;
- (void)setPredictionReason:(id)a3;
- (void)setSuppressionReason:(id)a3;
@end

@implementation ARPAnalyticsEvent

- (ARPAnalyticsEvent)init
{
  v13.receiver = self;
  v13.super_class = (Class)ARPAnalyticsEvent;
  v2 = [(ARPAnalyticsEvent *)&v13 init];
  v3 = v2;
  if (v2)
  {
    prediction = v2->_prediction;
    v2->_prediction = (NSString *)@"none";

    predictionReason = v3->_predictionReason;
    v3->_predictionReason = (NSString *)@"none";

    suppressionReason = v3->_suppressionReason;
    v3->_suppressionReason = (NSString *)@"none";

    v3->_predictionCorrect = 0;
    predictedDevice = v3->_predictedDevice;
    v3->_predictedDevice = (NSString *)@"none";

    actualDevice = v3->_actualDevice;
    v3->_actualDevice = (NSString *)@"none";

    correction = v3->_correction;
    v3->_correction = (NSString *)@"none";

    correctionTiming = v3->_correctionTiming;
    v3->_correctionTiming = (NSString *)@"none";

    failure = v3->_failure;
    v3->_failure = (NSString *)@"none";

    v3->_numberOfMicrolocations = 0;
  }
  return v3;
}

+ (id)feedbackEventsFromAppUsageEvents:(id)a3 playingEvents:(id)a4 microLocationEvents:(id)a5 feedbackEvents:(id)a6
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v91 = a6;
  v84 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&UUID_NULL_0];
  id v85 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = objc_alloc_init(ARPAnalyticsEvent);
  v90 = [(ARPAnalyticsEvent *)v12 analyticsDictionary];

  objc_super v13 = [MEMORY[0x263EFF910] distantPast];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = v9;
  uint64_t v92 = [obj countByEnumeratingWithState:&v109 objects:v114 count:16];
  if (v92)
  {
    uint64_t v88 = *(void *)v110;
    id v93 = v10;
    id v89 = v11;
    do
    {
      uint64_t v14 = 0;
      v100 = v13;
      do
      {
        if (*(void *)v110 != v88) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v109 + 1) + 8 * v14);
        v16 = objc_alloc_init(ARPAnalyticsEvent);
        v108[0] = MEMORY[0x263EF8330];
        v108[1] = 3221225472;
        v108[2] = __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke;
        v108[3] = &unk_2640B4408;
        v98 = v15;
        v108[4] = v15;
        uint64_t v17 = [v10 indexOfObjectPassingTest:v108];
        uint64_t v96 = v14;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = 0;
        }
        else
        {
          v18 = [v10 objectAtIndexedSubscript:v17];
        }
        v19 = [v18 metadata];
        v20 = [MEMORY[0x263F350F0] outputDeviceIDs];
        v21 = [v19 objectForKeyedSubscript:v20];

        v22 = ARPExtractLongFormVideoOutputDeviceIDs(v21);
        id v101 = objc_alloc_init(MEMORY[0x263EFFA08]);
        v97 = v22;
        if (v22 && [v22 count])
        {
          if ([v22 count] != 1
            || ([v22 firstObject],
                v23 = objc_claimAutoreleasedReturnValue(),
                char v24 = [v23 isEqualToString:@"Speaker"],
                v23,
                v25 = @"local",
                (v24 & 1) == 0))
          {
            v26 = [v21 objectForKeyedSubscript:&unk_26C0FF728];
            v27 = [v26 objectForKeyedSubscript:&unk_26C0FF740];
            uint64_t v28 = [v27 count];

            v25 = @"appletv";
            if (!v28)
            {
              v29 = [v21 objectForKeyedSubscript:&unk_26C0FF728];
              v30 = [v29 objectForKeyedSubscript:&unk_26C0FF758];
              uint64_t v31 = [v30 count];

              if (v31) {
                v25 = @"tv";
              }
              else {
                v25 = @"other";
              }
            }
          }
          uint64_t v32 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v97];

          id v101 = (id)v32;
        }
        else
        {
          v25 = @"none";
        }
        [(ARPAnalyticsEvent *)v16 setActualDevice:v25];
        v107[0] = MEMORY[0x263EF8330];
        v107[1] = 3221225472;
        v107[2] = __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke_60;
        v107[3] = &unk_2640B4408;
        v107[4] = v98;
        uint64_t v33 = [v11 indexOfObjectPassingTest:v107];
        if (v33 == 0x7FFFFFFFFFFFFFFFLL
          || ([v11 objectAtIndexedSubscript:v33],
              (v34 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v94 = 0;
        }
        else
        {
          v94 = v34;
          v35 = [v34 metadata];
          v36 = [MEMORY[0x263F350D8] probabilityVector];
          v37 = [v35 objectForKeyedSubscript:v36];

          uint64_t v38 = [v37 count];
          v39 = [v37 objectForKeyedSubscript:v84];
          BOOL v40 = v39 != 0;

          [(ARPAnalyticsEvent *)v16 setNumberOfMicrolocations:v38 - v40];
        }
        v41 = (void *)MEMORY[0x263F08A98];
        v42 = [v18 startDate];
        v43 = v42;
        if (!v42)
        {
          v87 = [v98 endDate];
          v43 = v87;
        }
        v95 = v21;
        v44 = [v41 predicateWithFormat:@"%@ <= startDate && endDate <= %@", v100, v43];
        v45 = [v91 filteredArrayUsingPredicate:v44];

        if (!v42) {
        v99 = v18;
        }
        v102 = v16;

        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v46 = v45;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v103 objects:v113 count:16];
        if (!v47)
        {
          BOOL v49 = 0;
          v50 = 0;
          v51 = 0;
          v52 = 0;
          goto LABEL_54;
        }
        uint64_t v48 = v47;
        BOOL v49 = 0;
        v50 = 0;
        v51 = 0;
        v52 = 0;
        uint64_t v53 = *(void *)v104;
        do
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v104 != v53) {
              objc_enumerationMutation(v46);
            }
            v55 = *(void **)(*((void *)&v103 + 1) + 8 * i);
            unint64_t v56 = [v55 integerValue];
            if (!v50 && v56 <= 1)
            {
              BOOL v49 = v56 == 1;
              v50 = v55;
LABEL_46:
              v59 = v52;
              goto LABEL_47;
            }
            if (v56 == 2 && v51 == 0)
            {
              v51 = v55;
              goto LABEL_46;
            }
            BOOL v58 = v56 == 3 && v52 == 0;
            v59 = v55;
            if (!v58)
            {
              if (!v50) {
                continue;
              }
              goto LABEL_48;
            }
LABEL_47:
            id v60 = v55;
            v52 = v59;
            if (!v50) {
              continue;
            }
LABEL_48:
            if (v51 && v52) {
              goto LABEL_54;
            }
          }
          uint64_t v48 = [v46 countByEnumeratingWithState:&v103 objects:v113 count:16];
        }
        while (v48);
LABEL_54:

        v61 = [v99 endDate];
        v62 = v61;
        v63 = v102;
        if (v61)
        {
          id v64 = v61;
        }
        else
        {
          id v64 = [v98 endDate];
        }
        objc_super v13 = v64;
        id v10 = v93;

        if (v50)
        {
          v65 = v13;
          v66 = [v50 metadata];
          v67 = [MEMORY[0x263F34FE0] subtype];
          v68 = [v66 objectForKeyedSubscript:v67];

          if (v49)
          {
            [(ARPAnalyticsEvent *)v102 setSuppressionReason:v68];
            v69 = v102;
            v70 = @"suppressed";
          }
          else
          {
            v69 = v102;
            v70 = v68;
          }
          [(ARPAnalyticsEvent *)v69 setPrediction:v70];
          v71 = [v50 metadata];
          v72 = [MEMORY[0x263F34FE0] outputDeviceID];
          v73 = [v71 objectForKeyedSubscript:v72];

          v63 = v102;
          if (v73 && [v101 containsObject:v73]) {
            [(ARPAnalyticsEvent *)v102 setPredictionCorrect:1];
          }

          objc_super v13 = v65;
          id v10 = v93;
        }
        if (v51)
        {
          v74 = [v51 metadata];
          v75 = [MEMORY[0x263F34FE0] subtype];
          v76 = [v74 objectForKeyedSubscript:v75];
          [(ARPAnalyticsEvent *)v63 setCorrection:v76];
        }
        if (v52)
        {
          v77 = [v51 metadata];
          v78 = [MEMORY[0x263F34FE0] subtype];
          v79 = [v77 objectForKeyedSubscript:v78];
          [(ARPAnalyticsEvent *)v63 setFailure:v79];
        }
        v80 = [(ARPAnalyticsEvent *)v63 analyticsDictionary];
        char v81 = [v80 isEqualToDictionary:v90];

        if ((v81 & 1) == 0) {
          [v85 addObject:v63];
        }

        uint64_t v14 = v96 + 1;
        v100 = v13;
        id v11 = v89;
      }
      while (v96 + 1 != v92);
      uint64_t v92 = [obj countByEnumeratingWithState:&v109 objects:v114 count:16];
    }
    while (v92);
  }

  v82 = (void *)[v85 copy];
  return v82;
}

BOOL __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) startDate];
  [v4 timeIntervalSince1970];
  double v6 = v5;
  v7 = [v3 startDate];
  [v7 timeIntervalSince1970];
  if (v6 <= v8)
  {
    id v10 = [v3 startDate];
    [v10 timeIntervalSince1970];
    double v12 = v11;
    objc_super v13 = [*(id *)(a1 + 32) endDate];
    [v13 timeIntervalSince1970];
    BOOL v9 = v12 <= v14;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL __103__ARPAnalyticsEvent_feedbackEventsFromAppUsageEvents_playingEvents_microLocationEvents_feedbackEvents___block_invoke_60(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 startDate];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  v7 = [v3 startDate];

  [v7 timeIntervalSince1970];
  double v9 = v8;

  return v9 <= v6 + 5.0 && v6 <= v9;
}

- (id)description
{
  v16 = NSString;
  uint64_t v15 = objc_opt_class();
  double v14 = [(ARPAnalyticsEvent *)self prediction];
  objc_super v13 = [(ARPAnalyticsEvent *)self predictionReason];
  id v3 = [(ARPAnalyticsEvent *)self suppressionReason];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ARPAnalyticsEvent predictionCorrect](self, "predictionCorrect"));
  double v5 = [(ARPAnalyticsEvent *)self predictedDevice];
  double v6 = [(ARPAnalyticsEvent *)self actualDevice];
  v7 = [(ARPAnalyticsEvent *)self correction];
  double v8 = [(ARPAnalyticsEvent *)self correctionTiming];
  double v9 = [(ARPAnalyticsEvent *)self failure];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ARPAnalyticsEvent numberOfMicrolocations](self, "numberOfMicrolocations"));
  double v11 = [v16 stringWithFormat:@"<%@ %p> prediction: %@, predictionReason: %@, suppressionReason: %@, predictionCorrect: %@, predictedDevice: %@, actualDevice: %@, correction: %@, correctionTiming: %@, failure: %@, numberOfMicrolocations: %@", v15, self, v14, v13, v3, v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)analyticsDictionary
{
  v20[10] = *MEMORY[0x263EF8340];
  v19[0] = @"predicted";
  uint64_t v3 = [(ARPAnalyticsEvent *)self prediction];
  v4 = (void *)v3;
  if (v3) {
    double v5 = (__CFString *)v3;
  }
  else {
    double v5 = &stru_26C0FD7D0;
  }
  v20[0] = v5;
  v19[1] = @"suppression_reason";
  uint64_t v6 = [(ARPAnalyticsEvent *)self suppressionReason];
  v7 = (void *)v6;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  else {
    double v8 = &stru_26C0FD7D0;
  }
  v20[1] = v8;
  v19[2] = @"prediction_correct";
  double v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ARPAnalyticsEvent predictionCorrect](self, "predictionCorrect"));
  v20[2] = v9;
  v19[3] = @"actual_device";
  uint64_t v10 = [(ARPAnalyticsEvent *)self actualDevice];
  double v11 = (void *)v10;
  if (v10) {
    double v12 = (__CFString *)v10;
  }
  else {
    double v12 = &stru_26C0FD7D0;
  }
  v20[3] = v12;
  v19[4] = @"failure";
  uint64_t v13 = [(ARPAnalyticsEvent *)self failure];
  double v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_26C0FD7D0;
  }
  v20[4] = v15;
  v19[5] = @"number_of_microlocations";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ARPAnalyticsEvent numberOfMicrolocations](self, "numberOfMicrolocations"));
  v20[5] = v16;
  v20[6] = @"unknown";
  v19[6] = @"prediction_reason";
  v19[7] = @"predicted_device";
  v20[7] = @"unknown";
  v20[8] = @"unknown";
  v19[8] = @"correction";
  v19[9] = @"correction_timing";
  v20[9] = @"unknown";
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:10];

  return v17;
}

- (NSString)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(id)a3
{
}

- (NSString)predictionReason
{
  return self->_predictionReason;
}

- (void)setPredictionReason:(id)a3
{
}

- (NSString)suppressionReason
{
  return self->_suppressionReason;
}

- (void)setSuppressionReason:(id)a3
{
}

- (BOOL)predictionCorrect
{
  return self->_predictionCorrect;
}

- (void)setPredictionCorrect:(BOOL)a3
{
  self->_predictionCorrect = a3;
}

- (NSString)predictedDevice
{
  return self->_predictedDevice;
}

- (void)setPredictedDevice:(id)a3
{
}

- (NSString)actualDevice
{
  return self->_actualDevice;
}

- (void)setActualDevice:(id)a3
{
}

- (NSString)correction
{
  return self->_correction;
}

- (void)setCorrection:(id)a3
{
}

- (NSString)correctionTiming
{
  return self->_correctionTiming;
}

- (void)setCorrectionTiming:(id)a3
{
}

- (NSString)failure
{
  return self->_failure;
}

- (void)setFailure:(id)a3
{
}

- (unint64_t)numberOfMicrolocations
{
  return self->_numberOfMicrolocations;
}

- (void)setNumberOfMicrolocations:(unint64_t)a3
{
  self->_numberOfMicrolocations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_correctionTiming, 0);
  objc_storeStrong((id *)&self->_correction, 0);
  objc_storeStrong((id *)&self->_actualDevice, 0);
  objc_storeStrong((id *)&self->_predictedDevice, 0);
  objc_storeStrong((id *)&self->_suppressionReason, 0);
  objc_storeStrong((id *)&self->_predictionReason, 0);
  objc_storeStrong((id *)&self->_prediction, 0);
}

@end