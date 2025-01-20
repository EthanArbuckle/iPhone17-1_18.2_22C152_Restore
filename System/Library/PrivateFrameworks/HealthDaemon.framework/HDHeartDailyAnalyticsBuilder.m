@interface HDHeartDailyAnalyticsBuilder
- (BOOL)_buildIrregularRhythmNotificationsV2AnalyticsWithError:(uint64_t)a1;
- (BOOL)_buildOTAFeatureAvailabilityAnalyticsWithError:(uint64_t)a1;
- (BOOL)_buildRespiratoryRateAnalyticsWithError:(uint64_t)a1;
- (HDHeartDailyAnalyticsBuilder)initWithProfile:(id)a3 calendar:(id)a4 dateInterval:(id)a5 heartRateNotificationsUserDefaults:(id)a6 heartRhythmUserDefaults:(id)a7 remoteFeatureAvailabilityUserDefaults:(id)a8 pairedDeviceRegistry:(id)a9 areHealthNotificationsAuthorized:(BOOL)a10 isHealthDataSubmissionAllowed:(BOOL)a11;
- (id)_daysBetweenStartDate:(uint64_t)a3 endDate:;
- (id)_ecgClassificationsBetweenStartDate:(void *)a3 endDate:;
- (id)_mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:(uint64_t)a3 error:;
- (id)heartDailyAnalyticsWithError:(id *)a3;
@end

@implementation HDHeartDailyAnalyticsBuilder

- (HDHeartDailyAnalyticsBuilder)initWithProfile:(id)a3 calendar:(id)a4 dateInterval:(id)a5 heartRateNotificationsUserDefaults:(id)a6 heartRhythmUserDefaults:(id)a7 remoteFeatureAvailabilityUserDefaults:(id)a8 pairedDeviceRegistry:(id)a9 areHealthNotificationsAuthorized:(BOOL)a10 isHealthDataSubmissionAllowed:(BOOL)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a9;
  v26.receiver = self;
  v26.super_class = (Class)HDHeartDailyAnalyticsBuilder;
  v20 = [(HDHeartDailyAnalyticsBuilder *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_profile, a3);
    objc_storeStrong((id *)&v21->_heartRateNotificationsUserDefaults, a6);
    objc_storeStrong((id *)&v21->_heartRhythmUserDefaults, a7);
    v21->_isHealthDataSubmissionAllowed = a11;
    objc_storeStrong((id *)&v21->_calendar, a4);
    objc_storeStrong((id *)&v21->_dateInterval, a5);
    objc_storeStrong((id *)&v21->_pairedDeviceRegistry, a9);
    v21->_areHealthNotificationsAuthorized = a10;
  }

  return v21;
}

- (id)heartDailyAnalyticsWithError:(id *)a3
{
  uint64_t v220 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = HKLogAnalytics();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v5 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Building heart daily analytics", (uint8_t *)&buf, 0xCu);
  }
  v6 = objc_alloc_init(HDHeartDailyAnalytics);
  heartDailyAnalytics = self->_heartDailyAnalytics;
  self->_heartDailyAnalytics = v6;

  v8 = [(NSDateInterval *)self->_dateInterval startDate];
  v9 = [(NSDateInterval *)self->_dateInterval endDate];
  id v10 = v8;
  id v11 = v9;
  v12 = self->_heartDailyAnalytics;
  [(HDHeartDailyAnalytics *)v12 updateIrregularRhythmNotificationClassificationCount:-1];
  [(HDHeartDailyAnalytics *)v12 updateIsIrnOnboarded:0];
  [(HDHeartDailyAnalytics *)v12 updateIsEcgOnboarded:0];
  v13 = [(HDProfile *)self->_profile profileExtensionWithIdentifier:@"Heart"];
  [v13 featureAvailabilityExtensionForFeatureIdentifier:*MEMORY[0x1E4F29D60]];
  v202 = id v209 = 0;
  v14 = [v202 featureOnboardingRecordWithError:&v209];
  id v15 = v209;
  v204 = v15;
  uint64_t v205 = (uint64_t)v10;
  if (v14)
  {
    -[HDHeartDailyAnalytics updateIsIrnOnboarded:](v12, "updateIsIrnOnboarded:", [v14 isOnboardingPresent]);
  }
  else
  {
    id v16 = v15;
    _HKInitializeLogging();
    id v17 = HKLogAnalytics();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Could not load IRN onboarding record with error: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v18 = *MEMORY[0x1E4F29AB0];
  id v19 = [(NSUserDefaults *)self->_heartRhythmUserDefaults objectForKey:*MEMORY[0x1E4F29AB0]];
  v20 = v19;
  if (v19) {
    -[HDHeartDailyAnalytics updateIsEcgOnboarded:](v12, "updateIsEcgOnboarded:", [v19 integerValue] > 0);
  }
  v21 = [(NSUserDefaults *)self->_heartRhythmUserDefaults objectForKey:v18];
  v22 = v21;
  if (!v21 || [v21 integerValue] < 1) {
    goto LABEL_19;
  }
  uint64_t v23 = [v22 integerValue];
  id v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(MEMORY[0x1E4F2AF90], "algorithmVersionForOnboardingVersion:", v23));
  id v25 = v24;
  if (!v24 || [v24 integerValue] <= 0)
  {

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v26 = [v25 stringValue];

  if (v26)
  {
    v196 = v14;
    [(HDHeartDailyAnalytics *)v12 updateECGActiveAlgorithmVersion:v26];
    v27 = [MEMORY[0x1E4F2B350] productBuildVersionForDeviceType:0];
    if (v27)
    {
      v28 = [NSString stringWithFormat:@"%@.%@", v26, v27];
      if (v28) {
        [(HDHeartDailyAnalytics *)v12 updateECGUpdateVersionPhone:v28];
      }
    }
    else
    {
      _HKInitializeLogging();
      v28 = HKLogAnalytics();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Could not determine ECGUpdateVersionPhone", (uint8_t *)&buf, 2u);
      }
    }

    v185 = [MEMORY[0x1E4F2B350] productBuildVersionForDeviceType:1];
    if (v185)
    {
      v186 = [NSString stringWithFormat:@"%@.%@", v26, v185];
      if (v186) {
        [(HDHeartDailyAnalytics *)v12 updateECGUpdateVersionWatch:v186];
      }
    }
    else
    {
      _HKInitializeLogging();
      v186 = HKLogAnalytics();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1BCB7D000, v186, OS_LOG_TYPE_ERROR, "Could not determine ECGUpdateVersionWatch", (uint8_t *)&buf, 2u);
      }
    }

    v14 = v196;
    v29 = (void *)v26;
    goto LABEL_23;
  }
LABEL_20:
  _HKInitializeLogging();
  v27 = HKLogAnalytics();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Could not determine ECGAlgorithmVersion", (uint8_t *)&buf, 2u);
  }
  v29 = 0;
LABEL_23:
  v203 = v20;

  uint64_t v30 = *MEMORY[0x1E4F295F0];
  NSInteger v31 = [(NSUserDefaults *)self->_remoteFeatureAvailabilityUserDefaults integerForKey:*MEMORY[0x1E4F295F0]];
  if ((v31 & 0x8000000000000000) == 0) {
    [(HDHeartDailyAnalytics *)v12 updateCountMobileAssetsDownloadedPast24Hours:v31];
  }
  [(NSUserDefaults *)self->_remoteFeatureAvailabilityUserDefaults setInteger:0 forKey:v30];
  v32 = [(NSUserDefaults *)self->_heartRateNotificationsUserDefaults objectForKey:*MEMORY[0x1E4F2BE60]];
  [(HDHeartDailyAnalytics *)v12 updateIsAtrialFibrillationEnabled:v32];
  v33 = [(NRPairedDeviceRegistry *)self->_pairedDeviceRegistry getActivePairedDevice];
  v34 = [v33 valueForProperty:*MEMORY[0x1E4F79E18]];
  [(HDHeartDailyAnalytics *)v12 updateActiveWatchProductType:v34];

  v35 = [v33 valueForProperty:*MEMORY[0x1E4F79E40]];
  [(HDHeartDailyAnalytics *)v12 updateActiveWatchSystemBuildVersion:v35];

  if (!self->_isHealthDataSubmissionAllowed)
  {
    [(HDHeartDailyAnalytics *)v12 updateIsImproveHealthAndActivityAllowed:0];
    v51 = v12;
    v52 = v203;
    v53 = (void *)v205;
    goto LABEL_97;
  }
  v191 = v33;
  v193 = v32;
  v194 = v29;
  v197 = v14;
  v198 = v13;
  [(HDHeartDailyAnalytics *)v12 updateIsImproveHealthAndActivityAllowed:1];
  v201 = -[HDHeartDailyAnalyticsBuilder _ecgClassificationsBetweenStartDate:endDate:]((uint64_t)self, v205, v11);
  -[HDHeartDailyAnalytics updateElectrocardiogramClassificationCount:](v12, "updateElectrocardiogramClassificationCount:", [v201 count]);
  id v195 = v11;
  id v36 = v11;
  v37 = HDSampleEntityPredicateForStartDate(6);
  v38 = HDSampleEntityPredicateForEndDate(4);

  v39 = (void *)MEMORY[0x1E4F65D08];
  id v218 = v37;
  v219 = v38;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v218 count:2];
  v41 = [v39 predicateMatchingAllPredicates:v40];

  v42 = [MEMORY[0x1E4F2ACB8] atrialFibrillationEventType];
  v43 = +[HDSampleEntity entityEnumeratorWithType:v42 profile:self->_profile];

  [v43 setPredicate:v41];
  v44 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
  id v217 = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v217 count:1];
  [v43 setOrderingTerms:v45];

  v46 = [MEMORY[0x1E4F1CA48] array];
  id v210 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v214 = __69__HDHeartDailyAnalyticsBuilder__aFibSamplesBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6300148;
  id v47 = v46;
  id v216 = v47;
  char v48 = [v43 enumerateWithError:&v210 handler:&buf];
  id v49 = v210;
  if (v48)
  {
    id v50 = v47;
  }
  else
  {
    _HKInitializeLogging();
    v54 = HKLogAnalytics();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      id v212 = v49;
      _os_log_error_impl(&dword_1BCB7D000, v54, OS_LOG_TYPE_ERROR, "Error querying atrial fibrillation samples: %{public}@", v211, 0xCu);
    }

    id v50 = (id)MEMORY[0x1E4F1CBF0];
  }

  v190 = v50;
  -[HDHeartDailyAnalytics updateIrregularRhythmNotificationClassificationCount:](v12, "updateIrregularRhythmNotificationClassificationCount:", [v50 count]);
  id v55 = v36;
  v56 = HDSampleEntityPredicateForStartDate(6);
  v57 = HDSampleEntityPredicateForEndDate(4);

  v58 = (void *)MEMORY[0x1E4F65D08];
  id v218 = v56;
  v219 = v57;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v218 count:2];
  v60 = [v58 predicateMatchingAllPredicates:v59];

  v61 = [MEMORY[0x1E4F2B498] heartbeatSeriesType];
  v62 = +[HDSampleEntity entityEnumeratorWithType:v61 profile:self->_profile];

  [v62 setPredicate:v60];
  v63 = [MEMORY[0x1E4F1CA48] array];
  id v217 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v214 = __81__HDHeartDailyAnalyticsBuilder__countRecordedTachogramsBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6300148;
  id v64 = v63;
  id v216 = v64;
  char v65 = [v62 enumerateWithError:&v217 handler:&buf];
  id v66 = v217;
  v67 = v66;
  if ((v65 & 1) != 0 || !v66)
  {
    uint64_t v69 = [v64 count];
  }
  else
  {
    _HKInitializeLogging();
    v68 = HKLogAnalytics();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      id v212 = v67;
      _os_log_error_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_ERROR, "Error querying tacogram samples: %{public}@", v211, 0xCu);
    }

    uint64_t v69 = -1;
  }

  if (v69 < 0)
  {
    _HKInitializeLogging();
    v70 = HKLogAnalytics();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1BCB7D000, v70, OS_LOG_TYPE_ERROR, "Unable to retrieve countRecordedTachograms", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    [(HDHeartDailyAnalytics *)v12 updateCountRecordedTachogramsPast24Hours:v69];
  }
  v71 = [HDKeyValueDomain alloc];
  uint64_t v72 = *MEMORY[0x1E4F2BE90];
  v73 = [(HDKeyValueDomain *)v71 initWithCategory:105 domainName:*MEMORY[0x1E4F2BE90] profile:self->_profile];
  uint64_t v74 = *MEMORY[0x1E4F295E8];
  id v218 = 0;
  v75 = [(HDKeyValueDomain *)v73 numberForKey:v74 error:&v218];
  id v76 = v218;
  if (v76)
  {
    _HKInitializeLogging();
    v77 = HKLogAnalytics();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v76;
      _os_log_error_impl(&dword_1BCB7D000, v77, OS_LOG_TYPE_ERROR, "Failed to get CountAnalyzedTacogramsPast24Hours, error: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v78 = -1;
  }
  else
  {
    uint64_t v78 = [v75 integerValue];
  }

  if (v78 < 0)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v79 = (HDKeyValueDomain *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v79->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1BCB7D000, &v79->super, OS_LOG_TYPE_ERROR, "Unable to retrieve countAnalyzedTachograms", (uint8_t *)&buf, 2u);
    }
    goto LABEL_57;
  }
  [(HDHeartDailyAnalytics *)v12 updateCountAnalyzedTachogramsPast24Hours:v78];
  if (v78)
  {
    v79 = [[HDKeyValueDomain alloc] initWithCategory:105 domainName:v72 profile:self->_profile];
    id v218 = 0;
    [(HDKeyValueDomain *)v79 setNumber:0 forKey:v74 error:&v218];
    id v80 = v218;
    if (v80)
    {
      _HKInitializeLogging();
      v81 = HKLogAnalytics();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v80;
        _os_log_error_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_ERROR, "Failed to reset CountAnalyzedTacogramsPast24Hours, error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_57:
  }
  v82 = [[HDKeyValueDomain alloc] initWithCategory:105 domainName:v72 profile:self->_profile];
  if (v203 && [v203 integerValue] >= 1)
  {
    uint64_t v83 = *MEMORY[0x1E4F29AA0];
    id v210 = 0;
    v84 = [(HDKeyValueDomain *)v82 stringForKey:v83 error:&v210];
    id v85 = v210;
    v86 = v85;
    if (v84)
    {
      [(HDHeartDailyAnalytics *)v12 updateECGOnboardingCountryCode:v84];
    }
    else if (v85)
    {
      _HKInitializeLogging();
      v87 = HKLogAnalytics();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v86;
        _os_log_error_impl(&dword_1BCB7D000, v87, OS_LOG_TYPE_ERROR, "Error getting ECGOnboardingCountryCode: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  uint64_t v88 = *MEMORY[0x1E4F296F8];
  id v208 = 0;
  uint64_t v89 = [(HDKeyValueDomain *)v82 stringForKey:v88 error:&v208];
  id v90 = v208;
  id v91 = v90;
  v189 = (void *)v89;
  if (v89)
  {
    [(HDHeartDailyAnalytics *)v12 updateIRNOnboardingCountryCode:v89];
  }
  else if (v90)
  {
    _HKInitializeLogging();
    v92 = HKLogAnalytics();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v91;
      _os_log_error_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_ERROR, "Error getting IRNCountryCodeError: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  v188 = v91;
  v200 = v82;
  id v93 = v55;
  v94 = HDSampleEntityPredicateForStartDate(6);
  v95 = HDSampleEntityPredicateForEndDate(4);
  id v187 = v93;

  v96 = (void *)MEMORY[0x1E4F65D08];
  id v218 = v94;
  v219 = v95;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v218 count:2];
  v98 = [v96 predicateMatchingAllPredicates:v97];

  v99 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C0]];
  v100 = +[HDSampleEntity entityEnumeratorWithType:v99 profile:self->_profile];
  [v100 setPredicate:v98];
  v101 = [MEMORY[0x1E4F1CA48] array];
  id v217 = 0;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  v214 = __82__HDHeartDailyAnalyticsBuilder__countActiveEnergySamplesBetweenStartDate_endDate___block_invoke;
  v215 = &unk_1E6300148;
  id v102 = v101;
  id v216 = v102;
  char v103 = [v100 enumerateWithError:&v217 handler:&buf];
  id v104 = v217;
  v105 = v104;
  if ((v103 & 1) != 0 || !v104)
  {
    uint64_t v107 = [v102 count];
  }
  else
  {
    _HKInitializeLogging();
    v106 = HKLogAnalytics();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v211 = 138543362;
      id v212 = v105;
      _os_log_error_impl(&dword_1BCB7D000, v106, OS_LOG_TYPE_ERROR, "Error querying ActiveEnergyBurned samples: %{public}@", v211, 0xCu);
    }

    uint64_t v107 = -1;
  }

  if (v107 < 0)
  {
    _HKInitializeLogging();
    v109 = HKLogAnalytics();
    v108 = v204;
    v33 = v191;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1BCB7D000, v109, OS_LOG_TYPE_ERROR, "wasWatchWornPast24Hours could not be determined", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    [(HDHeartDailyAnalytics *)v12 updateWasWatchWornPast24Hours:v107 != 0];
    v108 = v204;
    v33 = v191;
  }

  uint64_t v110 = *MEMORY[0x1E4F29A90];
  id v218 = 0;
  uint64_t v111 = [(HDKeyValueDomain *)v200 dateForKey:v110 error:&v218];
  id v112 = v218;
  id v113 = v112;
  v192 = (void *)v111;
  if (v111 && !v112)
  {
    [(HDHeartDailyAnalytics *)v12 updateIsEcgOnboarded:1];
    v114 = [(NSCalendar *)self->_calendar components:0x2000 fromDate:v111 toDate:v187 options:0];
    v115 = 0;
    if ([v114 weekOfYear] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v115 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v114, "weekOfYear"));
    }

    [(HDHeartDailyAnalytics *)v12 updateWeeksSinceElectrocardiogramOnboarded:v115];
LABEL_92:

    goto LABEL_93;
  }
  if (v112)
  {
    _HKInitializeLogging();
    v115 = HKLogAnalytics();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v113;
      _os_log_error_impl(&dword_1BCB7D000, v115, OS_LOG_TYPE_ERROR, "Error getting electrocardiogramFirstOnboardedCompletedDate: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_92;
  }
LABEL_93:
  [(HDHeartDailyAnalytics *)v12 updateWithElectrocardiogramClassifications:v201 isWithin24HoursPostIRN:0];
  v204 = v113;
  if ([v190 count])
  {
    v116 = [v190 firstObject];
    calendar = self->_calendar;
    v118 = [v116 startDate];
    v119 = [(NSCalendar *)calendar dateByAddingUnit:16 value:1 toDate:v118 options:0];

    v120 = [v116 startDate];
    v121 = -[HDHeartDailyAnalyticsBuilder _ecgClassificationsBetweenStartDate:endDate:]((uint64_t)self, (uint64_t)v120, v119);

    [(HDHeartDailyAnalytics *)v12 updateWithElectrocardiogramClassifications:v121 isWithin24HoursPostIRN:1];
    v122 = v12;
    v123 = v12;
  }
  else
  {
    v122 = v12;
    v124 = v12;
  }
  v14 = v197;
  v52 = v203;
  v32 = v193;
  v29 = v194;

  v53 = (void *)v205;
  id v11 = v195;
  v12 = v122;
  v13 = v198;
LABEL_97:

  if (!self->_isHealthDataSubmissionAllowed)
  {
    id v128 = 0;
    goto LABEL_112;
  }
  v125 = [(HDProfile *)self->_profile ageGatingManager];
  *(void *)&long long buf = 0;
  v126 = [v125 ageInYearsWithError:&buf];
  id v127 = (id)buf;

  if (v126 || !v127)
  {
    [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateAgeInYears:v126];
    v129 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
    v130 = [(HDProfile *)self->_profile userCharacteristicsManager];
    id v218 = v127;
    v131 = [v130 userCharacteristicForType:v129 error:&v218];
    id v132 = v218;

    if (v131) {
      BOOL v133 = 1;
    }
    else {
      BOOL v133 = v132 == 0;
    }
    char v134 = v133;
    if (v133)
    {
      -[HDHeartDailyAnalytics updateSex:](self->_heartDailyAnalytics, "updateSex:", [v131 integerValue]);
      id v128 = 0;
    }
    else
    {
      id v128 = v132;
    }

    if ((v134 & 1) == 0) {
      goto LABEL_116;
    }
LABEL_112:
    id v135 = v128;
    [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateAreHealthNotificationsAuthorized:self->_areHealthNotificationsAuthorized];
    if (!self->_isHealthDataSubmissionAllowed)
    {
      id v144 = v135;

LABEL_121:
      v146 = [(HDProfile *)self->_profile periodicCountryMonitor];
      v147 = self->_calendar;
      v148 = [(NSDateInterval *)self->_dateInterval endDate];
      v149 = [(NSCalendar *)v147 dateByAddingUnit:16 value:2 toDate:v148 options:0];

      v150 = [v146 lastCheckAttemptDate];
      if (v150)
      {
        v151 = self->_heartDailyAnalytics;
        v152 = -[HDHeartDailyAnalyticsBuilder _daysBetweenStartDate:endDate:](self->_calendar, (uint64_t)v150, (uint64_t)v149);
        [(HDHeartDailyAnalytics *)v151 updateDaysSinceLastCountryMonitorCheck:v152];
      }
      v153 = [v146 lastFetchAttemptDate];
      if (v153)
      {
        v154 = self->_heartDailyAnalytics;
        v155 = -[HDHeartDailyAnalyticsBuilder _daysBetweenStartDate:endDate:](self->_calendar, (uint64_t)v153, (uint64_t)v149);
        [(HDHeartDailyAnalytics *)v154 updateDaysSinceLastCountryMonitorFetch:v155];
      }
      v156 = self->_heartDailyAnalytics;
      v157 = [v146 lastFetchAttemptBuild];
      [(HDHeartDailyAnalytics *)v156 updateLastCountryMonitorFetchBuildNumber:v157];

      v158 = (void *)*MEMORY[0x1E4F29D40];
      *(void *)&long long buf = 0;
      v159 = -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](self->_profile, v158, (uint64_t)&buf);
      id v160 = (id)buf;
      v161 = v160;
      if (v159) {
        BOOL v162 = 1;
      }
      else {
        BOOL v162 = v160 == 0;
      }
      char v163 = v162;
      if (v162)
      {
        [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateIsGlucoseEnhancedChartingDelivered:v159 != 0];
        id v166 = v144;
        if (self->_isHealthDataSubmissionAllowed)
        {
          v164 = self->_heartDailyAnalytics;
          v165 = [v159 countryCode];
          [(HDHeartDailyAnalytics *)v164 updateGlucoseEnhancedChartingCountryCode:v165];

          id v166 = v144;
        }
      }
      else
      {
        id v166 = v160;
      }

      id v167 = v166;
      if ((v163 & 1) == 0) {
        goto LABEL_153;
      }
      if (self->_isHealthDataSubmissionAllowed)
      {
        [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateIsTachycardiaDetectionEnabled:[(NSUserDefaults *)self->_heartRateNotificationsUserDefaults BOOLForKey:*MEMORY[0x1E4F2BE78]]];
        [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateIsBradycardiaDetectionEnabled:[(NSUserDefaults *)self->_heartRateNotificationsUserDefaults BOOLForKey:*MEMORY[0x1E4F2BE68]]];
        v168 = self->_heartDailyAnalytics;
        v169 = [(NSUserDefaults *)self->_heartRateNotificationsUserDefaults hk_safeNumberForKeyPath:*MEMORY[0x1E4F2BE80] error:0];
        [(HDHeartDailyAnalytics *)v168 updateHighHeartRateNotificationThreshold:v169];

        v170 = self->_heartDailyAnalytics;
        v171 = [(NSUserDefaults *)self->_heartRateNotificationsUserDefaults hk_safeNumberForKeyPath:*MEMORY[0x1E4F2BE58] error:0];
        [(HDHeartDailyAnalytics *)v170 updateLowHeartRateNotificationThreshold:v171];
      }
      v172 = (void *)*MEMORY[0x1E4F29D90];
      *(void *)&long long buf = 0;
      v173 = -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](self->_profile, v172, (uint64_t)&buf);
      id v174 = (id)buf;
      v175 = v174;
      if (v173) {
        BOOL v176 = 1;
      }
      else {
        BOOL v176 = v174 == 0;
      }
      char v177 = v176;
      if (v176)
      {
        [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateIsMenstrualCyclesHeartRateInputDelivered:v173 != 0];
        id v180 = v167;
        if (self->_isHealthDataSubmissionAllowed)
        {
          v178 = self->_heartDailyAnalytics;
          v179 = [v173 countryCode];
          [(HDHeartDailyAnalytics *)v178 updateMenstrualCyclesHeartRateInputCountryCode:v179];

          id v180 = v167;
        }
      }
      else
      {
        id v180 = v174;
      }

      id v144 = v180;
      if (v177)
      {
        id v207 = v144;
        BOOL v181 = -[HDHeartDailyAnalyticsBuilder _buildIrregularRhythmNotificationsV2AnalyticsWithError:]((uint64_t)self, &v207);
        id v167 = v207;

        if (v181 && -[HDHeartDailyAnalyticsBuilder _buildOTAFeatureAvailabilityAnalyticsWithError:]((uint64_t)self))
        {
          id v206 = v167;
          BOOL v182 = -[HDHeartDailyAnalyticsBuilder _buildRespiratoryRateAnalyticsWithError:]((uint64_t)self, &v206);
          id v144 = v206;

          if (v182)
          {
            v183 = (void *)[(HDHeartDailyAnalytics *)self->_heartDailyAnalytics copy];
            goto LABEL_160;
          }
          goto LABEL_154;
        }
LABEL_153:
        id v143 = v167;
        goto LABEL_155;
      }
LABEL_154:
      id v143 = v144;
      goto LABEL_155;
    }
    profile = self->_profile;
    dateInterval = self->_dateInterval;
    *(void *)&long long buf = 0;
    uint64_t v138 = HDAnalyticsBucketedNumberOfStandAndIdleHours(profile, dateInterval, &buf);
    id v139 = (id)buf;
    v140 = v139;
    if (v138)
    {
      [(HDHeartDailyAnalytics *)self->_heartDailyAnalytics updateNumberOfStandAndIdleHoursInPreviousCalendarDay:v138];
      v141 = (void *)v138;
    }
    else
    {
      id v145 = v139;
      v141 = v145;
      if (v145)
      {
        id v142 = v145;
LABEL_120:

        id v144 = v142;
        if (!v138) {
          goto LABEL_154;
        }
        goto LABEL_121;
      }
    }
    id v142 = v135;
    goto LABEL_120;
  }
  id v128 = v127;

LABEL_116:
  id v143 = v128;
LABEL_155:
  id v144 = v143;
  if (v143)
  {
    if (a3) {
      *a3 = v143;
    }
    else {
      _HKLogDroppedError();
    }
  }

  v183 = 0;
LABEL_160:

  return v183;
}

- (BOOL)_buildIrregularRhythmNotificationsV2AnalyticsWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (void *)*MEMORY[0x1E4F29D70];
  id v21 = 0;
  id v5 = -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](*(void **)(a1 + 8), v4, (uint64_t)&v21);
  id v6 = v21;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    if (a2)
    {
      id v11 = v6;
      BOOL v12 = 0;
      *a2 = v11;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v12 = 0;
      id v11 = v7;
    }
    goto LABEL_22;
  }
  v9 = [*(id *)(a1 + 8) featureSettingsManager];
  id v20 = v7;
  id v10 = [v9 featureSettingsForFeatureIdentifier:v4 error:&v20];
  id v11 = v20;

  BOOL v12 = v10 != 0;
  if (v10)
  {
    if (v5) {
      v13 = &unk_1F17ECC30;
    }
    else {
      v13 = 0;
    }
    [*(id *)(a1 + 16) updateAlgorithmVersionIRN:v13];
    v14 = *(void **)(a1 + 16);
    id v15 = [v10 numberForKey:*MEMORY[0x1E4F29DE0] error:0];
    [v14 updateIsAtrialFibrillationEnabledV2:v15];

    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_21;
    }
    id v16 = *(void **)(a1 + 16);
    id v17 = [v5 countryCode];
    [v16 updateAtrialFibrillationDetectionV2CountryCode:v17];
  }
  else
  {
    id v18 = v11;
    id v17 = v18;
    if (v18)
    {
      if (a2)
      {
        id v17 = v18;
        *a2 = v17;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

LABEL_21:
LABEL_22:

  return v12;
}

- (BOOL)_buildOTAFeatureAvailabilityAnalyticsWithError:(uint64_t)a1
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) daemon];
    v3 = [v2 OTAFeatureAvailabilityManager];

    v4 = *(void **)(a1 + 16);
    id v5 = [v3 factorPackID];
    [v4 updateOTAFactorPackID:v5];
  }
  return a1 != 0;
}

- (BOOL)_buildRespiratoryRateAnalyticsWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = (void *)*MEMORY[0x1E4F29DA8];
  id v20 = 0;
  id v5 = -[HDHeartDailyAnalyticsBuilder _mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:error:](*(void **)(a1 + 8), v4, (uint64_t)&v20);
  id v6 = v20;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    [*(id *)(a1 + 16) updateIsRespiratoryRateDelivered:v5 != 0];
    if (*(unsigned char *)(a1 + 48))
    {
      v9 = *(void **)(a1 + 16);
      id v10 = [v5 countryCode];
      [v9 updateRespiratoryRateCountryCode:v10];
    }
    id v11 = [*(id *)(a1 + 8) featureSettingsManager];
    id v19 = v7;
    BOOL v12 = [v11 featureSettingsForFeatureIdentifier:v4 error:&v19];
    id v13 = v19;

    BOOL v14 = v12 != 0;
    if (v12)
    {
      id v15 = *(void **)(a1 + 16);
      id v16 = [v12 numberForKey:*MEMORY[0x1E4F29DE0] error:0];
      [v15 updateIsRespiratoryRateEnabledInPrivacy:v16];
    }
    else
    {
      id v17 = v13;
      id v16 = v17;
      if (v17)
      {
        if (a2)
        {
          id v16 = v17;
          *a2 = v16;
        }
        else
        {
          _HKLogDroppedError();
        }
      }
    }
  }
  else if (a2)
  {
    id v13 = v6;
    BOOL v14 = 0;
    *a2 = v13;
  }
  else
  {
    _HKLogDroppedError();
    BOOL v14 = 0;
    id v13 = v7;
  }

  return v14;
}

- (id)_daysBetweenStartDate:(uint64_t)a3 endDate:
{
  v3 = [a1 components:16 fromDate:a2 toDate:a3 options:0];
  v4 = 0;
  if ([v3 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "day"));
  }

  return v4;
}

- (id)_mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier:(uint64_t)a3 error:
{
  id v5 = a2;
  id v6 = [a1 onboardingCompletionManager];
  v7 = [v6 onboardingCompletionsForHighestVersionOfFeatureIdentifier:v5 error:a3];

  if (v7)
  {
    BOOL v8 = objc_msgSend(v7, "hk_firstSortedObjectWithComparison:", &__block_literal_global_97);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __106__HDHeartDailyAnalyticsBuilder__mostRecentOnboardingCompletionForHighestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 completionDate];
  id v6 = [v4 completionDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __69__HDHeartDailyAnalyticsBuilder__aFibSamplesBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __82__HDHeartDailyAnalyticsBuilder__countActiveEnergySamplesBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __81__HDHeartDailyAnalyticsBuilder__countRecordedTachogramsBetweenStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)_ecgClassificationsBetweenStartDate:(void *)a3 endDate:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HDSampleEntityPredicateForStartDate(6);
  id v6 = HDSampleEntityPredicateForEndDate(4);

  uint64_t v7 = (void *)MEMORY[0x1E4F65D08];
  v27[0] = v5;
  v27[1] = v6;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v9 = [v7 predicateMatchingAllPredicates:v8];

  id v10 = [MEMORY[0x1E4F2AFB8] electrocardiogramType];
  id v11 = +[HDSampleEntity entityEnumeratorWithType:v10 profile:*(void *)(a1 + 8)];

  [v11 setPredicate:v9];
  BOOL v12 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"start_date" entityClass:objc_opt_class() ascending:1];
  uint64_t v26 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v11 setOrderingTerms:v13];

  BOOL v14 = [MEMORY[0x1E4F1CA48] array];
  id v23 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__HDHeartDailyAnalyticsBuilder__ecgClassificationsBetweenStartDate_endDate___block_invoke;
  v21[3] = &unk_1E6300148;
  id v15 = v14;
  id v22 = v15;
  char v16 = [v11 enumerateWithError:&v23 handler:v21];
  id v17 = v23;
  if (v16)
  {
    id v18 = v15;
  }
  else
  {
    _HKInitializeLogging();
    id v19 = HKLogAnalytics();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v25 = v17;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Error querying electrocardiogram samples: %{public}@", buf, 0xCu);
    }

    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

uint64_t __76__HDHeartDailyAnalyticsBuilder__ecgClassificationsBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "privateClassification"));
  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = &unk_1F17ECC48;
  }
  [*(id *)(a1 + 32) addObject:v4];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_remoteFeatureAvailabilityUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartRhythmUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartRateNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_heartDailyAnalytics, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end