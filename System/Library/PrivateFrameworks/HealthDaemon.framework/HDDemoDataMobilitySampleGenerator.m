@interface HDDemoDataMobilitySampleGenerator
+ (BOOL)supportsSecureCoding;
- (HDDemoDataMobilitySampleGenerator)init;
- (HDDemoDataMobilitySampleGenerator)initWithCoder:(id)a3;
- (double)_generateWalkingDataSamplesForDemoPerson:(void *)a3 atTime:(int)a4 sampleDate:(int)a5 duration:(void *)a6 addFromWatch:(void *)a7 shouldDecreaseDuringRehab:(void *)a8 objectCollection:(double)a9 nextSampleTime:(double)a10 typeIdentifier:(double)a11 unit:(double)a12 sampleMean:(double)a13 sampleMeanStdDev:(double)a14 sampleFrequency:(double)a15 sampleFrequencyStdDev:;
- (uint64_t)_isDemoPersonWalkingAboveAverage;
- (void)encodeWithCoder:(id)a3;
- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5;
- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7;
@end

@implementation HDDemoDataMobilitySampleGenerator

- (HDDemoDataMobilitySampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result)
  {
    result->_nextStepLengthSampleTime = 0.0;
    result->_nextWalkingSpeedSampleTime = 0.0;
    result->_nextAsymmetryPercentageSampleTime = 0.0;
    result->_nextDoubleSupportPercentageSampleTime = 0.0;
    result->_nextSixMinuteWalkTestDistanceSampleTime = 0.0;
    result->_nextStairAscentSpeedSampleTime = 0.0;
    result->_nextStairDescentSpeedSampleTime = 0.0;
    result->_nextWalkingSteadinessSampleTime = 0.0;
  }
  return result;
}

- (HDDemoDataMobilitySampleGenerator)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  v5 = [(HDDemoDataBaseSampleGenerator *)&v15 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_NextStepLengthSampleTimeKey"];
    v5->_nextStepLengthSampleTime = v6;
    [v4 decodeDoubleForKey:@"_NextWalkingSpeedSampleTimeKey"];
    v5->_nextWalkingSpeedSampleTime = v7;
    [v4 decodeDoubleForKey:@"_NextAsymmetryPercentageSampleTimeKey"];
    v5->_nextAsymmetryPercentageSampleTime = v8;
    [v4 decodeDoubleForKey:@"_NextDoubleSupportPercentageSampleTimeKey"];
    v5->_nextDoubleSupportPercentageSampleTime = v9;
    [v4 decodeDoubleForKey:@"_NextSixMinuteWalkTestDistanceSampleTimeKey"];
    v5->_nextSixMinuteWalkTestDistanceSampleTime = v10;
    [v4 decodeDoubleForKey:@"_NextStairAscentSpeedSampleTimeKey"];
    v5->_nextStairAscentSpeedSampleTime = v11;
    [v4 decodeDoubleForKey:@"_NextStairDescentSpeedSampleTimeKey"];
    v5->_nextStairDescentSpeedSampleTime = v12;
    [v4 decodeDoubleForKey:@"_NextWalkingSteadinessSampleTimeKey"];
    v5->_nextWalkingSteadinessSampleTime = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  id v4 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v6 encodeWithCoder:v4];
  if (self)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_NextStepLengthSampleTimeKey", self->_nextStepLengthSampleTime, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"_NextWalkingSpeedSampleTimeKey" forKey:self->_nextWalkingSpeedSampleTime];
    [v4 encodeDouble:@"_NextAsymmetryPercentageSampleTimeKey" forKey:self->_nextAsymmetryPercentageSampleTime];
    [v4 encodeDouble:@"_NextDoubleSupportPercentageSampleTimeKey" forKey:self->_nextDoubleSupportPercentageSampleTime];
    [v4 encodeDouble:@"_NextSixMinuteWalkTestDistanceSampleTimeKey" forKey:self->_nextSixMinuteWalkTestDistanceSampleTime];
    [v4 encodeDouble:@"_NextStairAscentSpeedSampleTimeKey" forKey:self->_nextStairAscentSpeedSampleTime];
    [v4 encodeDouble:@"_NextStairDescentSpeedSampleTimeKey" forKey:self->_nextStairDescentSpeedSampleTime];
    double nextWalkingSteadinessSampleTime = self->_nextWalkingSteadinessSampleTime;
  }
  else
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"_NextStepLengthSampleTimeKey", 0.0, v6.receiver, v6.super_class);
    [v4 encodeDouble:@"_NextWalkingSpeedSampleTimeKey" forKey:0.0];
    [v4 encodeDouble:@"_NextAsymmetryPercentageSampleTimeKey" forKey:0.0];
    [v4 encodeDouble:@"_NextDoubleSupportPercentageSampleTimeKey" forKey:0.0];
    [v4 encodeDouble:@"_NextSixMinuteWalkTestDistanceSampleTimeKey" forKey:0.0];
    [v4 encodeDouble:@"_NextStairAscentSpeedSampleTimeKey" forKey:0.0];
    [v4 encodeDouble:@"_NextStairDescentSpeedSampleTimeKey" forKey:0.0];
    double nextWalkingSteadinessSampleTime = 0.0;
  }
  [v4 encodeDouble:@"_NextWalkingSteadinessSampleTimeKey" forKey:nextWalkingSteadinessSampleTime];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)generateFirstRunObjectsForDemoPerson:(id)a3 firstDate:(id)a4 objectCollection:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    double v9 = [v7 birthDateComponents];
    uint64_t v10 = HDDemoData_ageBetweenNSDateComponentsAndDate(v9, v8);

    if (v10 >= *MEMORY[0x1E4F2BF88])
    {
      double v11 = [(HDDemoDataBaseSampleGenerator *)self profile];
      double v12 = [v11 profileExtensionsConformingToProtocol:&unk_1F180B2D8];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v61;
        uint64_t v17 = *MEMORY[0x1E4F29DD8];
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v61 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = [*(id *)(*((void *)&v60 + 1) + 8 * v18) featureAvailabilityExtensionForFeatureIdentifier:v17];
          if (v19) {
            break;
          }
          if (v15 == ++v18)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v60 objects:v68 count:16];
            if (v15) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        v21 = (void *)v19;

        v22 = [MEMORY[0x1E4F1CA20] currentLocale];
        v23 = [v22 countryCode];

        id v59 = 0;
        v24 = [v21 onboardingEligibilityForCountryCode:v23 error:&v59];
        id v25 = v59;
        if (v25
          && (_HKInitializeLogging(),
              v26 = *MEMORY[0x1E4F29F30],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR)))
        {
          *(_DWORD *)buf = 138543618;
          v65 = self;
          __int16 v66 = 2114;
          id v67 = v25;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "[%{public}@] Error while determining onboarding eligibility for Walking Steadiness %{public}@", buf, 0x16u);
          if (!v24) {
            goto LABEL_34;
          }
        }
        else if (!v24)
        {
          goto LABEL_34;
        }
        if (([v24 ineligibilityReasons] & 8) == 0)
        {
          v55 = v24;
          id v53 = v25;
          id v27 = objc_alloc(MEMORY[0x1E4F2B2D8]);
          v28 = [MEMORY[0x1E4F1C9C8] date];
          v54 = v23;
          uint64_t v29 = [v27 initWithFeatureIdentifier:v17 version:1 completionDate:v28 countryCode:v23 countryCodeProvenance:102];

          v30 = [(HDDemoDataBaseSampleGenerator *)self profile];
          v31 = [v30 onboardingCompletionManager];
          id v58 = 0;
          v52 = (void *)v29;
          LOBYTE(v29) = [v31 insertOnboardingCompletion:v29 error:&v58];
          v32 = (HDDemoDataMobilitySampleGenerator *)v58;

          if ((v29 & 1) == 0)
          {
            _HKInitializeLogging();
            v48 = *MEMORY[0x1E4F29F30];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v41 = v32;
              v65 = v32;
              _os_log_impl(&dword_1BCB7D000, v48, OS_LOG_TYPE_DEFAULT, "Failed to insert Walking Steadiness onboarding completion: %{public}@", buf, 0xCu);
              id v25 = v53;
              v23 = v54;
              v49 = v52;
            }
            else
            {
              id v25 = v53;
              v23 = v54;
              v49 = v52;
              v41 = v32;
            }
            v24 = v55;
            goto LABEL_33;
          }
          v33 = [(HDDemoDataBaseSampleGenerator *)self profile];
          v34 = [v33 featureSettingsManager];
          uint64_t v35 = *MEMORY[0x1E4F29DE0];
          v57 = v32;
          char v36 = [v34 setFeatureSettingsNumber:MEMORY[0x1E4F1CC38] forKey:v35 featureIdentifier:v17 suppressNotificationsToObserver:0 error:&v57];
          v51 = v57;

          if ((v36 & 1) == 0)
          {
            v41 = v51;
            _HKInitializeLogging();
            v50 = *MEMORY[0x1E4F29F30];
            v24 = v55;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v51;
              _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "Failed to update feature settings enablement key for Walking Steadiness: %{public}@", buf, 0xCu);
            }
            id v25 = v53;
            v23 = v54;
            goto LABEL_32;
          }
          v37 = [(HDDemoDataBaseSampleGenerator *)self profile];
          v38 = [v37 featureSettingsManager];
          uint64_t v39 = *MEMORY[0x1E4F29DF0];
          v56 = v51;
          char v40 = [v38 setFeatureSettingsNumber:MEMORY[0x1E4F1CC38] forKey:v39 featureIdentifier:v17 suppressNotificationsToObserver:0 error:&v56];
          v41 = v56;

          _HKInitializeLogging();
          v42 = *MEMORY[0x1E4F29F30];
          v24 = v55;
          v43 = *MEMORY[0x1E4F29F30];
          if (v40)
          {
            id v25 = v53;
            v23 = v54;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v44 = "Completed Walking Steadiness onboarding";
              v45 = v42;
              os_log_type_t v46 = OS_LOG_TYPE_INFO;
              uint32_t v47 = 2;
LABEL_31:
              _os_log_impl(&dword_1BCB7D000, v45, v46, v44, buf, v47);
            }
          }
          else
          {
            id v25 = v53;
            v23 = v54;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v65 = v41;
              v44 = "Failed to update feature settings onboarding acknowledgement key for Walking Steadiness: %{public}@";
              v45 = v42;
              os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
              uint32_t v47 = 12;
              goto LABEL_31;
            }
          }
LABEL_32:
          v49 = v52;
LABEL_33:
        }
LABEL_34:

        goto LABEL_35;
      }
LABEL_11:

      _HKInitializeLogging();
      v20 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Unable to find Walking Steadiness Feature Availability Provider", buf, 2u);
      }
LABEL_35:
    }
  }
}

- (void)generateObjectsForDemoPerson:(id)a3 fromTime:(double)a4 toTime:(double)a5 currentDate:(id)a6 objectCollection:(id)a7
{
  v144.receiver = self;
  v144.super_class = (Class)HDDemoDataMobilitySampleGenerator;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  [(HDDemoDataBaseSampleGenerator *)&v144 generateObjectsForDemoPerson:v13 fromTime:v12 toTime:v11 currentDate:a5 objectCollection:a5];
  v142 = v12;
  v143 = v11;
  if (self)
  {
    id v14 = v11;
    id v15 = v12;
    id v16 = v13;
    [v16 stepLengthMean];
    double v18 = v17;
    [v16 stepLengthStdDev];
    double v20 = v19;
    [v16 stepLengthSampleFrequency];
    double v22 = v21;
    [v16 stepLengthSampleFrequencyStdDev];
    double v24 = v23;
    int isDemoPersonWalkingAbove = -[HDDemoDataMobilitySampleGenerator _isDemoPersonWalkingAboveAverage](self);
    if (isDemoPersonWalkingAbove)
    {
      double v18 = v18 * 1.05;
      double v22 = v22 * 0.2;
    }
    double nextStepLengthSampleTime = self->_nextStepLengthSampleTime;
    if (isDemoPersonWalkingAbove) {
      double v24 = v24 * 0.2;
    }
    id v27 = (void *)*MEMORY[0x1E4F2A940];
    v28 = objc_msgSend(MEMORY[0x1E4F2B618], "meterUnit", v12);
    double v29 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v16, v15, 0, 0, v14, v27, v28, a5, 0.0, nextStepLengthSampleTime, v18, v20, v22, v24);

    self->_double nextStepLengthSampleTime = v29;
    id v30 = v16;
    id v31 = v14;
    id v32 = v15;
    [v30 walkingSpeedMean];
    double v34 = v33;
    [v30 walkingSpeedStdDev];
    double v36 = v35;
    [v30 walkingSpeedSampleFrequency];
    double v38 = v37;
    [v30 walkingSpeedSampleFrequencyStdDev];
    double v40 = v39;
    if (-[HDDemoDataMobilitySampleGenerator _isDemoPersonWalkingAboveAverage](self))
    {
      double v34 = v34 * 1.2;
      double v36 = v36 * 1.2;
      double v38 = v38 * 0.2;
      double v40 = v40 * 0.2;
    }
    double nextWalkingSpeedSampleTime = self->_nextWalkingSpeedSampleTime;
    v42 = (void *)*MEMORY[0x1E4F2A938];
    v43 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v44 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v30, v32, 0, 0, v31, v42, v43, a5, 0.0, nextWalkingSpeedSampleTime, v34, v36, v38, v40);

    self->_double nextWalkingSpeedSampleTime = v44;
    id v45 = v31;
    id v46 = v32;
    id v47 = v30;
    [v47 asymmetryPercentageMean];
    double v49 = v48;
    [v47 asymmetryPercentageStdDev];
    double v51 = v50;
    [v47 asymmetryPercentageSampleFrequency];
    double v53 = v52;
    [v47 asymmetryPercentageSampleFrequencyStdDev];
    double v55 = v54;
    double nextAsymmetryPercentageSampleTime = self->_nextAsymmetryPercentageSampleTime;
    v57 = (void *)*MEMORY[0x1E4F2A920];
    id v58 = [MEMORY[0x1E4F2B618] percentUnit];
    double v59 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v47, v46, 0, 1, v45, v57, v58, a5, 0.0, nextAsymmetryPercentageSampleTime, v49, v51, v53, v55);

    self->_double nextAsymmetryPercentageSampleTime = v59;
    id v60 = v45;
    id v61 = v46;
    id v62 = v47;
    [v62 doubleSupportPercentageMean];
    double v64 = v63;
    [v62 doubleSupportPercentageStdDev];
    double v66 = v65;
    [v62 doubleSupportPercentageSampleFrequency];
    double v68 = v67;
    [v62 doubleSupportPercentageSampleFrequencyStdDev];
    double v70 = v69;
    double nextDoubleSupportPercentageSampleTime = self->_nextDoubleSupportPercentageSampleTime;
    v72 = (void *)*MEMORY[0x1E4F2A928];
    v73 = [MEMORY[0x1E4F2B618] percentUnit];
    double v74 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v62, v61, 0, 1, v60, v72, v73, a5, 0.0, nextDoubleSupportPercentageSampleTime, v64, v66, v68, v70);

    self->_double nextDoubleSupportPercentageSampleTime = v74;
    id v75 = v60;
    id v76 = v61;
    id v77 = v62;
    [v77 sixMinuteWalkTestDistanceMean];
    double v79 = v78;
    [v77 sixMinuteWalkTestDistanceStdDev];
    double v81 = v80;
    [v77 sixMinuteWalkTestDistanceSampleFrequency];
    double v83 = v82;
    [v77 sixMinuteWalkTestDistanceSampleFrequencyStdDev];
    double v85 = v84;
    double nextSixMinuteWalkTestDistanceSampleTime = self->_nextSixMinuteWalkTestDistanceSampleTime;
    v87 = (void *)*MEMORY[0x1E4F2A8D8];
    v88 = [MEMORY[0x1E4F2B618] meterUnit];
    double v89 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v77, v76, 1, 0, v75, v87, v88, a5, 0.0, nextSixMinuteWalkTestDistanceSampleTime, v79, v81, v83, v85);

    self->_double nextSixMinuteWalkTestDistanceSampleTime = v89;
    id v90 = v75;
    id v91 = v76;
    id v92 = v77;
    [v92 stairAscentSpeedMean];
    double v94 = v93;
    [v92 stairAscentSpeedStdDev];
    double v96 = v95;
    [v92 stairAscentSpeedSampleFrequency];
    double v98 = v97;
    [v92 stairAscentSpeedSampleFrequencyStdDev];
    double v100 = v99;
    double nextStairAscentSpeedSampleTime = self->_nextStairAscentSpeedSampleTime;
    v102 = (void *)*MEMORY[0x1E4F2A8E0];
    v103 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v104 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v92, v91, 1, 0, v90, v102, v103, a5, 0.0, nextStairAscentSpeedSampleTime, v94, v96, v98, v100);

    self->_double nextStairAscentSpeedSampleTime = v104;
    id v105 = v90;
    id v106 = v91;
    id v107 = v92;
    [v107 stairDescentSpeedMean];
    double v109 = v108;
    [v107 stairDescentSpeedStdDev];
    double v111 = v110;
    [v107 stairDescentSpeedSampleFrequency];
    double v113 = v112;
    [v107 stairDescentSpeedSampleFrequencyStdDev];
    double v115 = v114;
    double nextStairDescentSpeedSampleTime = self->_nextStairDescentSpeedSampleTime;
    v117 = (void *)*MEMORY[0x1E4F2A8E8];
    v118 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
    double v119 = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v107, v106, 1, 0, v105, v117, v118, a5, 0.0, nextStairDescentSpeedSampleTime, v109, v111, v113, v115);

    self->_double nextStairDescentSpeedSampleTime = v119;
    id v120 = v107;
    id v121 = v106;
    id v122 = v105;
    v123 = [v120 birthDateComponents];
    uint64_t v124 = HDDemoData_ageBetweenNSDateComponentsAndDate(v123, v121);

    if (v124 >= *MEMORY[0x1E4F2BF88])
    {
      [v120 walkingSteadinessMean];
      double v126 = v125;
      [v120 walkingSteadinessStdDev];
      double v128 = v127;
      [v120 walkingSteadinessSampleFrequency];
      double v130 = v129;
      [v120 walkingSteadinessSampleFrequencyStdDev];
      double v132 = v131;
      [v120 walkingSteadinessSampleFrequency];
      double v134 = v133 * 86400.0;
      double nextWalkingSteadinessSampleTime = self->_nextWalkingSteadinessSampleTime;
      v136 = (void *)*MEMORY[0x1E4F2A5E8];
      v137 = [MEMORY[0x1E4F2B618] percentUnit];
      self->_double nextWalkingSteadinessSampleTime = -[HDDemoDataMobilitySampleGenerator _generateWalkingDataSamplesForDemoPerson:atTime:sampleDate:duration:addFromWatch:shouldDecreaseDuringRehab:objectCollection:nextSampleTime:typeIdentifier:unit:sampleMean:sampleMeanStdDev:sampleFrequency:sampleFrequencyStdDev:](self, v120, v121, 0, 0, v122, v136, v137, a5, v134, nextWalkingSteadinessSampleTime, v126, v128, v130, v132);
    }
  }
  else
  {
    id v138 = v13;

    id v139 = v138;
    id v140 = v12;
    id v141 = v11;
  }
}

- (uint64_t)_isDemoPersonWalkingAboveAverage
{
  v2 = [a1 demoDataGenerator];
  objc_super v3 = [v2 generatorState];
  if ([v3 isWalking])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 demoDataGenerator];
    objc_super v6 = [v5 generatorState];
    uint64_t v4 = [v6 isHiking];
  }
  return v4;
}

- (double)_generateWalkingDataSamplesForDemoPerson:(void *)a3 atTime:(int)a4 sampleDate:(int)a5 duration:(void *)a6 addFromWatch:(void *)a7 shouldDecreaseDuringRehab:(void *)a8 objectCollection:(double)a9 nextSampleTime:(double)a10 typeIdentifier:(double)a11 unit:(double)a12 sampleMean:(double)a13 sampleMeanStdDev:(double)a14 sampleFrequency:(double)a15 sampleFrequencyStdDev:
{
  id v29 = a2;
  id v30 = a3;
  id v31 = a6;
  id v32 = a7;
  id v33 = a8;
  if (a9 >= a11)
  {
    double v34 = [a1 demoDataGenerator];
    id v35 = [v34 sleepSampleGenerator];
    if ([v35 isDemoPersonAwake:v29 atTime:a9])
    {
      int v62 = a5;
      int v63 = a4;
      double v64 = v31;
      double v36 = [a1 demoDataGenerator];
      double v37 = [v36 activitySampleGenerator];
      char v38 = [v37 _isDemoPersonSedentary:v29 atTime:a9];

      if (v38)
      {
        id v31 = v64;
        goto LABEL_16;
      }
      double v39 = [a1 demoDataGenerator];
      double v40 = [v39 statisticsSampleGenerator];
      [v40 computeStatisticalTimeFromCurrentTime:a9 mean:a14 stdDev:a15];
      a11 = v41 + a11;

      double v34 = [v30 dateByAddingTimeInterval:-a10];
      id v35 = v30;
      v42 = [a1 demoDataGenerator];
      v43 = [v42 firstSampleDate];
      uint64_t v44 = [v34 compare:v43];

      if (v44 == -1)
      {
        id v31 = v64;
      }
      else
      {
        uint64_t v45 = [v29 profileType];
        double v46 = 1.0;
        if (v45 == 3)
        {
          id v47 = objc_msgSend(a1, "demoDataGenerator", 1.0);
          double v48 = [v47 configuration];
          double v49 = (double)[v48 generationPeriodInDays];

          [v29 rehabLogarithmicConstant];
          long double v51 = v50;
          double v52 = log(v51 + (2.71828183 - v51) * (a9 / v49));
          if (v62) {
            double v52 = log(v51) + 1.0 - v52;
          }
          double v46 = fmin(v52, 1.0);
        }
        double v53 = v46 * a12;
        double v54 = [a1 demoDataGenerator];
        double v55 = [v54 statisticsSampleGenerator];
        [v55 computeNoiseFromTime:a9 stdDev:a13];
        double v57 = v53 + v56;

        id v58 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v32];
        double v59 = [MEMORY[0x1E4F2B370] quantityWithUnit:v33 doubleValue:v57];
        id v60 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v58 quantity:v59 startDate:v34 endDate:v35];
        id v31 = v64;
        if (v63) {
          [v64 addObjectFromWatch:v60];
        }
        else {
          [v64 addObjectFromPhone:v60];
        }
      }
    }
  }
LABEL_16:

  return a11;
}

@end