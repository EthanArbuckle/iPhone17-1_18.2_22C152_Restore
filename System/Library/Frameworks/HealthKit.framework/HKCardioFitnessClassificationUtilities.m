@interface HKCardioFitnessClassificationUtilities
+ (id)_cardioFitnessLevelTransitionDatesForDateInterval:(id)a3 biologicalSex:(int64_t)a4 dateOfBirth:(id)a5;
+ (id)_cardioFitnessLevels;
+ (id)_flattenedThresholdsForLevelData:(id)a3;
+ (id)_parseCoreMotionClassificationData:(id)a3;
+ (id)_queryCoreMotionClassifications;
+ (id)_queryCoreMotionClassificationsForBiologicalSex:(int64_t)a3 age:(int64_t)a4;
+ (id)_stubbedCardioFitnessLevelData;
+ (id)analyticsStringForLevel:(int64_t)a3;
+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3;
+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4;
+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5;
+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4;
+ (id)cardioFitnessPropertiesForDate:(id)a3 healthStore:(id)a4;
+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3;
+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5;
+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4;
+ (void)_cardioFitnessLevels;
@end

@implementation HKCardioFitnessClassificationUtilities

+ (id)_cardioFitnessLevels
{
  v3 = (void *)_cardioFitnessLookupTable;
  if (!_cardioFitnessLookupTable)
  {
    v4 = [a1 _queryCoreMotionClassifications];
    if (v4)
    {
      objc_storeStrong((id *)&_cardioFitnessLookupTable, v4);
    }
    else
    {
      _HKInitializeLogging();
      v5 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        +[HKCardioFitnessClassificationUtilities _cardioFitnessLevels];
      }
      uint64_t v6 = [a1 _stubbedCardioFitnessLevelData];
      v7 = (void *)_cardioFitnessLookupTable;
      _cardioFitnessLookupTable = v6;
    }
    v3 = (void *)_cardioFitnessLookupTable;
  }

  return v3;
}

+ (id)_stubbedCardioFitnessLevelData
{
  v119[3] = *MEMORY[0x1E4F143B8];
  v118[0] = &unk_1EECE4970;
  v116[0] = &unk_1EECE4988;
  v114[0] = &unk_1EECE49A0;
  v67 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:1 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:35.0 vo2MaxUpperBound:45.0];
  v115[0] = v67;
  v114[1] = &unk_1EECE4970;
  v66 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 20, 29, 45.0);
  v115[1] = v66;
  v114[2] = &unk_1EECE49B8;
  v65 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 20, 29, 55.0);
  v115[2] = v65;
  v114[3] = &unk_1EECE49D0;
  v64 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 20, 29, 65.0);
  v115[3] = v64;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:4];
  v117[0] = v63;
  v116[1] = &unk_1EECE49E8;
  v112[0] = &unk_1EECE49A0;
  v62 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 30, 39);
  v113[0] = v62;
  v112[1] = &unk_1EECE4970;
  v61 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 1, 1, 30, 39, 44.0);
  v113[1] = v61;
  v112[2] = &unk_1EECE49B8;
  v60 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 2, 1, 30, 39, 54.0);
  v113[2] = v60;
  v112[3] = &unk_1EECE49D0;
  v59 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 30, 39, 64.0);
  v113[3] = v59;
  v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:4];
  v117[1] = v58;
  v116[2] = &unk_1EECE4A00;
  v110[0] = &unk_1EECE49A0;
  v57 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 40, 49);
  v111[0] = v57;
  v110[1] = &unk_1EECE4970;
  v56 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:1 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:43.0 vo2MaxUpperBound:53.0];
  v111[1] = v56;
  v110[2] = &unk_1EECE49B8;
  v55 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:1 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:53.0 vo2MaxUpperBound:63.0];
  v111[2] = v55;
  v110[3] = &unk_1EECE49D0;
  v54 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 40, 49, 63.0);
  v111[3] = v54;
  v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:4];
  v117[2] = v53;
  v116[3] = &unk_1EECE4A18;
  v108[0] = &unk_1EECE49A0;
  v52 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 0, 1, 50, 59);
  v109[0] = v52;
  v108[1] = &unk_1EECE4970;
  v51 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:1 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:42.0 vo2MaxUpperBound:52.0];
  v109[1] = v51;
  v108[2] = &unk_1EECE49B8;
  v50 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:1 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:52.0 vo2MaxUpperBound:62.0];
  v109[2] = v50;
  v108[3] = &unk_1EECE49D0;
  v49 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 50, 59, 62.0);
  v109[3] = v49;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:4];
  v117[3] = v48;
  v116[4] = &unk_1EECE4A30;
  v106[0] = &unk_1EECE49A0;
  v47 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:1 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:31.0 vo2MaxUpperBound:41.0];
  v107[0] = v47;
  v106[1] = &unk_1EECE4970;
  v46 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:1 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:41.0 vo2MaxUpperBound:51.0];
  v107[1] = v46;
  v106[2] = &unk_1EECE49B8;
  v45 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:1 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:51.0 vo2MaxUpperBound:61.0];
  v107[2] = v45;
  v106[3] = &unk_1EECE49D0;
  v44 = -[HKCardioFitnessLevelData initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:]([HKCardioFitnessLevelData alloc], "initWithCardioFitnessLevel:biologicalSex:ageLowerBound:ageUpperBound:vo2MaxLowerBound:vo2MaxUpperBound:", 3, 1, 60, 0x7FFFFFFFFFFFFFFFLL, 61.0);
  v107[3] = v44;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:4];
  v117[4] = v43;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:5];
  v119[0] = v42;
  v118[1] = &unk_1EECE49B8;
  v104[0] = &unk_1EECE4988;
  v102[0] = &unk_1EECE49A0;
  v41 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:2 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:35.0 vo2MaxUpperBound:45.0];
  v103[0] = v41;
  v102[1] = &unk_1EECE4970;
  v40 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:2 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:45.0 vo2MaxUpperBound:55.0];
  v103[1] = v40;
  v102[2] = &unk_1EECE49B8;
  v39 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:2 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:55.0 vo2MaxUpperBound:65.0];
  v103[2] = v39;
  v102[3] = &unk_1EECE49D0;
  v38 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:2 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:65.0 vo2MaxUpperBound:75.0];
  v103[3] = v38;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:4];
  v105[0] = v37;
  v104[1] = &unk_1EECE49E8;
  v100[0] = &unk_1EECE49A0;
  v36 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:2 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:34.0 vo2MaxUpperBound:44.0];
  v101[0] = v36;
  v100[1] = &unk_1EECE4970;
  v35 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:2 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:44.0 vo2MaxUpperBound:54.0];
  v101[1] = v35;
  v100[2] = &unk_1EECE49B8;
  v34 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:2 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:54.0 vo2MaxUpperBound:64.0];
  v101[2] = v34;
  v100[3] = &unk_1EECE49D0;
  v33 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:2 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:64.0 vo2MaxUpperBound:74.0];
  v101[3] = v33;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:4];
  v105[1] = v32;
  v104[2] = &unk_1EECE4A00;
  v98[0] = &unk_1EECE49A0;
  v31 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:2 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:33.0 vo2MaxUpperBound:43.0];
  v99[0] = v31;
  v98[1] = &unk_1EECE4970;
  v30 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:2 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:43.0 vo2MaxUpperBound:53.0];
  v99[1] = v30;
  v98[2] = &unk_1EECE49B8;
  v29 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:2 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:53.0 vo2MaxUpperBound:63.0];
  v99[2] = v29;
  v98[3] = &unk_1EECE49D0;
  v28 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:2 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:63.0 vo2MaxUpperBound:73.0];
  v99[3] = v28;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:4];
  v105[2] = v27;
  v104[3] = &unk_1EECE4A18;
  v96[0] = &unk_1EECE49A0;
  v26 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:2 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:32.0 vo2MaxUpperBound:42.0];
  v97[0] = v26;
  v96[1] = &unk_1EECE4970;
  v25 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:2 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:42.0 vo2MaxUpperBound:52.0];
  v97[1] = v25;
  v96[2] = &unk_1EECE49B8;
  v24 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:2 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:52.0 vo2MaxUpperBound:62.0];
  v97[2] = v24;
  v96[3] = &unk_1EECE49D0;
  v23 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:2 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:62.0 vo2MaxUpperBound:72.0];
  v97[3] = v23;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:4];
  v105[3] = v22;
  v104[4] = &unk_1EECE4A30;
  v94[0] = &unk_1EECE49A0;
  v21 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:2 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:31.0 vo2MaxUpperBound:41.0];
  v95[0] = v21;
  v94[1] = &unk_1EECE4970;
  v20 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:2 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:41.0 vo2MaxUpperBound:51.0];
  v95[1] = v20;
  v94[2] = &unk_1EECE49B8;
  v19 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:2 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:51.0 vo2MaxUpperBound:61.0];
  v95[2] = v19;
  v94[3] = &unk_1EECE49D0;
  v18 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:2 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:61.0 vo2MaxUpperBound:71.0];
  v95[3] = v18;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:4];
  v105[4] = v17;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:5];
  v119[1] = v16;
  v118[2] = &unk_1EECE49D0;
  v92[0] = &unk_1EECE4988;
  v90[0] = &unk_1EECE49A0;
  v15 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:3 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:35.0 vo2MaxUpperBound:45.0];
  v91[0] = v15;
  v90[1] = &unk_1EECE4970;
  v75 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:3 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:45.0 vo2MaxUpperBound:55.0];
  v91[1] = v75;
  v90[2] = &unk_1EECE49B8;
  v74 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:3 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:55.0 vo2MaxUpperBound:65.0];
  v91[2] = v74;
  v90[3] = &unk_1EECE49D0;
  v81 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:3 ageLowerBound:20 ageUpperBound:29 vo2MaxLowerBound:65.0 vo2MaxUpperBound:75.0];
  v91[3] = v81;
  v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:4];
  v93[0] = v73;
  v92[1] = &unk_1EECE49E8;
  v88[0] = &unk_1EECE49A0;
  v80 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:3 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:34.0 vo2MaxUpperBound:44.0];
  v89[0] = v80;
  v88[1] = &unk_1EECE4970;
  v72 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:3 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:44.0 vo2MaxUpperBound:54.0];
  v89[1] = v72;
  v88[2] = &unk_1EECE49B8;
  v71 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:3 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:54.0 vo2MaxUpperBound:64.0];
  v89[2] = v71;
  v88[3] = &unk_1EECE49D0;
  v79 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:3 ageLowerBound:30 ageUpperBound:39 vo2MaxLowerBound:64.0 vo2MaxUpperBound:74.0];
  v89[3] = v79;
  v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:4];
  v93[1] = v70;
  v92[2] = &unk_1EECE4A00;
  v86[0] = &unk_1EECE49A0;
  v78 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:3 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:33.0 vo2MaxUpperBound:43.0];
  v87[0] = v78;
  v86[1] = &unk_1EECE4970;
  v69 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:3 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:43.0 vo2MaxUpperBound:53.0];
  v87[1] = v69;
  v86[2] = &unk_1EECE49B8;
  v68 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:3 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:53.0 vo2MaxUpperBound:63.0];
  v87[2] = v68;
  v86[3] = &unk_1EECE49D0;
  v77 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:3 ageLowerBound:40 ageUpperBound:49 vo2MaxLowerBound:63.0 vo2MaxUpperBound:73.0];
  v87[3] = v77;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:4];
  v93[2] = v14;
  v92[3] = &unk_1EECE4A18;
  v84[0] = &unk_1EECE49A0;
  v76 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:3 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:32.0 vo2MaxUpperBound:42.0];
  v85[0] = v76;
  v84[1] = &unk_1EECE4970;
  v13 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:3 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:42.0 vo2MaxUpperBound:52.0];
  v85[1] = v13;
  v84[2] = &unk_1EECE49B8;
  v2 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:3 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:52.0 vo2MaxUpperBound:62.0];
  v85[2] = v2;
  v84[3] = &unk_1EECE49D0;
  v3 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:3 ageLowerBound:50 ageUpperBound:59 vo2MaxLowerBound:62.0 vo2MaxUpperBound:72.0];
  v85[3] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:4];
  v93[3] = v4;
  v92[4] = &unk_1EECE4A30;
  v82[0] = &unk_1EECE49A0;
  v5 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:0 biologicalSex:3 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:31.0 vo2MaxUpperBound:41.0];
  v83[0] = v5;
  v82[1] = &unk_1EECE4970;
  uint64_t v6 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:1 biologicalSex:3 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:41.0 vo2MaxUpperBound:51.0];
  v83[1] = v6;
  v82[2] = &unk_1EECE49B8;
  v7 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:2 biologicalSex:3 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:51.0 vo2MaxUpperBound:61.0];
  v83[2] = v7;
  v82[3] = &unk_1EECE49D0;
  v8 = [[HKCardioFitnessLevelData alloc] initWithCardioFitnessLevel:3 biologicalSex:3 ageLowerBound:60 ageUpperBound:0x7FFFFFFFFFFFFFFFLL vo2MaxLowerBound:61.0 vo2MaxUpperBound:71.0];
  v83[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:4];
  v93[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:5];
  v119[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:3];

  return v11;
}

+ (id)_parseCoreMotionClassificationData:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 biologicalSex];
    unint64_t v8 = v7 - 4;
    if ((unint64_t)(v7 - 4) >= 0xFFFFFFFFFFFFFFFDLL) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }

    v10 = [v5 firstObject];
    uint64_t v11 = [v10 ageLowerBound];
    if (v11 <= 59)
    {
      if (v11 <= 49)
      {
        if (v11 <= 39)
        {
          if (v11 <= 29)
          {
            if (v11 >= 20) {
              unint64_t v12 = 20;
            }
            else {
              unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            }
          }
          else
          {
            unint64_t v12 = 30;
          }
        }
        else
        {
          unint64_t v12 = 40;
        }
      }
      else
      {
        unint64_t v12 = 50;
      }
    }
    else
    {
      unint64_t v12 = 60;
    }

    v13 = 0;
    if (v8 >= 0xFFFFFFFFFFFFFFFDLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
      v58 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v51 = v5;
      id obj = v5;
      uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v49 = a1;
        SEL v50 = a2;
        uint64_t v55 = *(void *)v60;
        do
        {
          uint64_t v16 = 0;
          unint64_t v17 = v12;
          uint64_t v53 = v15;
          do
          {
            if (*(void *)v60 != v55) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v59 + 1) + 8 * v16);
            uint64_t v19 = MEMORY[0x19F395970]();
            uint64_t v20 = [v18 biologicalSex];
            if ((unint64_t)(v20 - 1) >= 3) {
              uint64_t v21 = 0;
            }
            else {
              uint64_t v21 = v20;
            }
            uint64_t v22 = [v18 ageLowerBound];
            uint64_t v23 = 20;
            if (v22 < 20) {
              uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v22 > 29) {
              uint64_t v23 = 30;
            }
            if (v22 > 39) {
              uint64_t v23 = 40;
            }
            if (v22 > 49) {
              uint64_t v23 = 50;
            }
            if (v22 <= 59) {
              unint64_t v12 = v23;
            }
            else {
              unint64_t v12 = 60;
            }
            context = (void *)v19;
            if (v21 != v9)
            {
              if (v21 <= v9)
              {
                v42 = [MEMORY[0x1E4F28B00] currentHandler];
                [v42 handleFailureInMethod:v50 object:v49 file:@"HKCardioFitnessClassificationUtilities.m" lineNumber:303 description:@"HKCardioFitnessUtilities: CMVO2MaxClassificationData array must be sorted by biological sex ascending"];
              }
              v24 = (void *)[v58 copy];
              v25 = [NSNumber numberWithInteger:v17];
              [v56 setObject:v24 forKeyedSubscript:v25];

              [v58 removeAllObjects];
              v26 = (void *)[v56 copy];
              v27 = [NSNumber numberWithInteger:v9];
              [v52 setObject:v26 forKeyedSubscript:v27];

              [v56 removeAllObjects];
              unint64_t v17 = v12;
              uint64_t v9 = v21;
              uint64_t v15 = v53;
            }
            if (v12 != v17)
            {
              if (v12 <= v17)
              {
                v43 = [MEMORY[0x1E4F28B00] currentHandler];
                [v43 handleFailureInMethod:v50 object:v49 file:@"HKCardioFitnessClassificationUtilities.m" lineNumber:320 description:@"HKCardioFitnessUtilities: CMVO2MaxClassificationData array must be sorted by age ascending: item != current"];
              }
              v28 = (void *)[v58 copy];
              v29 = [NSNumber numberWithInteger:v17];
              [v56 setObject:v28 forKeyedSubscript:v29];

              [v58 removeAllObjects];
            }
            unint64_t v30 = [v18 classificationType];
            if (v30 >= 4) {
              uint64_t v31 = -1;
            }
            else {
              uint64_t v31 = v30;
            }
            v32 = [HKCardioFitnessLevelData alloc];
            uint64_t v33 = v9;
            uint64_t v34 = [v18 ageLowerBound];
            uint64_t v35 = [v18 ageUpperBound];
            [v18 vo2MaxLowerBound];
            double v37 = v36;
            [v18 vo2MaxUpperBound];
            uint64_t v38 = v34;
            uint64_t v9 = v33;
            v40 = [(HKCardioFitnessLevelData *)v32 initWithCardioFitnessLevel:v31 biologicalSex:v21 ageLowerBound:v38 ageUpperBound:v35 vo2MaxLowerBound:v37 vo2MaxUpperBound:v39];
            v41 = [NSNumber numberWithInteger:v31];
            [v58 setObject:v40 forKeyedSubscript:v41];

            ++v16;
            unint64_t v17 = v12;
          }
          while (v15 != v16);
          uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
        }
        while (v15);
      }

      v44 = (void *)[v58 copy];
      v45 = [NSNumber numberWithInteger:v12];
      [v56 setObject:v44 forKeyedSubscript:v45];

      v46 = (void *)[v56 copy];
      v47 = [NSNumber numberWithInteger:v9];
      [v52 setObject:v46 forKeyedSubscript:v47];

      v13 = (void *)[v52 copy];
      id v5 = v51;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_queryCoreMotionClassifications
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F222B8]);
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  uint64_t v11 = __Block_byref_object_dispose__36;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke;
  v6[3] = &unk_1E58C5478;
  v6[4] = &v7;
  v6[5] = a1;
  [v3 queryAllClassificationsWithHandler:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v8;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_INFO, "%{public}@: Retrieved all cardio fitness classifications", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v9 = [*(id *)(a1 + 40) _parseCoreMotionClassificationData:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    _HKInitializeLogging();
    id v12 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(a1, v12, v6);
    }
  }
}

+ (id)_queryCoreMotionClassificationsForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F222B8]);
  uint64_t v8 = v7;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__36;
  unint64_t v17 = __Block_byref_object_dispose__36;
  id v18 = 0;
  if ((unint64_t)(a3 - 1) >= 3) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = a3;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __94__HKCardioFitnessClassificationUtilities__queryCoreMotionClassificationsForBiologicalSex_age___block_invoke;
  v12[3] = &unk_1E58C54A0;
  v12[6] = a3;
  v12[7] = a4;
  v12[4] = &v13;
  v12[5] = a1;
  [v7 queryClassificationForBiologicalSex:v9 age:a4 handler:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __94__HKCardioFitnessClassificationUtilities__queryCoreMotionClassificationsForBiologicalSex_age___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    _HKInitializeLogging();
    id v7 = HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      int v15 = 138543875;
      uint64_t v16 = v8;
      __int16 v17 = 2049;
      uint64_t v18 = v9;
      __int16 v19 = 2049;
      uint64_t v20 = v10;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_INFO, "%{public}@: Retrieved cardio fitness classifications for biological sex: %{private}ld, age: %{private}ld", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v11 = [*(id *)(a1 + 40) _parseCoreMotionClassificationData:v5];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = (void *)HKLogDefault;
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(a1, v14, v6);
    }
  }
}

+ (id)_flattenedThresholdsForLevelData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 allKeys];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count") + 1);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v3, "hk_sortedKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        if (![v12 cardioFitnessLevel])
        {
          uint64_t v13 = NSNumber;
          [v12 vo2MaxLowerBound];
          uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
          [v6 addObject:v14];
        }
        int v15 = NSNumber;
        [v12 vo2MaxUpperBound];
        uint64_t v16 = objc_msgSend(v15, "numberWithDouble:");
        [v6 addObject:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _cardioFitnessLevels];
  if (a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = 3;
  }
  id v6 = [NSNumber numberWithInteger:v5];
  id v7 = [v4 objectForKeyedSubscript:v6];

  uint64_t v8 = objc_msgSend(v7, "hk_sortedKeys");
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __85__HKCardioFitnessClassificationUtilities_flattenedCardioFitnessDataForBiologicalSex___block_invoke;
  v28[3] = &unk_1E58C54C8;
  id v9 = v7;
  id v29 = v9;
  uint64_t v10 = objc_msgSend(v8, "hk_map:", v28);

  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        __int16 v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v18 = objc_opt_class();
        long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "rangeValue", (void)v24));
        long long v20 = [v9 objectForKeyedSubscript:v19];
        long long v21 = [v18 _flattenedThresholdsForLevelData:v20];
        [v11 addObject:v21];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v14);
  }

  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v12];

  return v22;
}

id __85__HKCardioFitnessClassificationUtilities_flattenedCardioFitnessDataForBiologicalSex___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v3 = [v2 objectForKeyedSubscript:&unk_1EECE49A0];

  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", objc_msgSend(v3, "ageLowerBound"), objc_msgSend(v3, "ageUpperBound") - objc_msgSend(v3, "ageLowerBound"));

  return v4;
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _cardioFitnessLevels];
  if (a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = 3;
  }
  id v6 = [NSNumber numberWithInteger:v5];
  id v7 = [v4 objectForKeyedSubscript:v6];

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = objc_msgSend(v7, "allKeys", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = [v7 objectForKeyedSubscript:v14];
        uint64_t v16 = objc_msgSend(v15, "hk_allValuesBySortedKeys");
        [v8 setObject:v16 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)_cardioFitnessLevelTransitionDatesForDateInterval:(id)a3 biologicalSex:(int64_t)a4 dateOfBirth:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  [v6 duration];
  if (v8 == 0.0)
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [v7 year];
    id v11 = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v17 = xmmword_19C3D39F0;
    long long v18 = xmmword_19C3D3A00;
    uint64_t v19 = 60;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = 0; i != 40; i += 8)
    {
      objc_msgSend(v11, "setYear:", *(void *)((char *)&v17 + i) + v10, v17, v18, v19, v20);
      uint64_t v15 = [v12 dateFromComponents:v11];
      if ([v6 containsDate:v15]) {
        [v13 addObject:v15];
      }
    }
    id v9 = [v13 sortedArrayUsingSelector:sel_compare_];
  }

  return v9;
}

+ (id)cardioFitnessPropertiesForDate:(id)a3 healthStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v16 = 0;
  id v7 = [v6 biologicalSexWithError:&v16];
  id v8 = v16;
  if (!v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:]();
    }
  }
  id v15 = v8;
  id v9 = [v6 dateOfBirthComponentsWithError:&v15];
  id v10 = v15;

  if (v9)
  {
    if (v7)
    {
      uint64_t v11 = [v7 biologicalSex];
      uint64_t v12 = objc_msgSend(v9, "hk_ageWithCurrentDate:", v5);
      id v13 = objc_alloc_init(HKCardioFitnessLookupProperties);
      [(HKCardioFitnessLookupProperties *)v13 setAge:v12];
      [(HKCardioFitnessLookupProperties *)v13 setBiologicalSex:v11];
      goto LABEL_10;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:]();
    }
  }
  id v13 = 0;
LABEL_10:

  return v13;
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  if (a4 <= 59)
  {
    if (a4 <= 49)
    {
      if (a4 <= 39)
      {
        if (a4 <= 29)
        {
          uint64_t v5 = 20;
          if (a4 <= 19)
          {
            id v6 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v5 = 30;
        }
      }
      else
      {
        uint64_t v5 = 40;
      }
    }
    else
    {
      uint64_t v5 = 50;
    }
  }
  else
  {
    uint64_t v5 = 60;
  }
  id v7 = [a1 _cardioFitnessLevels];
  if (a3) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = 3;
  }
  id v9 = [NSNumber numberWithInteger:v8];
  id v10 = [v7 objectForKeyedSubscript:v9];
  uint64_t v11 = [NSNumber numberWithInteger:v5];
  id v6 = [v10 objectForKeyedSubscript:v11];

  if (v6) {
    id v12 = v6;
  }

LABEL_17:

  return v6;
}

+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  id v6 = [a1 cardioFitnessDataForBiologicalSex:a4 age:a5];
  id v7 = v6;
  if (v6)
  {
    int64_t v8 = &unk_1EECE49A0;
    id v9 = [v6 objectForKeyedSubscript:&unk_1EECE49A0];
    [v9 vo2MaxUpperBound];
    double v11 = v10;

    if (v11 <= a3)
    {
      int64_t v8 = &unk_1EECE4970;
      id v12 = [v7 objectForKeyedSubscript:&unk_1EECE4970];
      [v12 vo2MaxUpperBound];
      double v14 = v13;

      if (v14 <= a3)
      {
        int64_t v8 = &unk_1EECE49B8;
        id v15 = [v7 objectForKeyedSubscript:&unk_1EECE49B8];
        [v15 vo2MaxUpperBound];
        double v17 = v16;

        if (v17 <= a3)
        {
          int64_t v8 = &unk_1EECE49D0;
          long long v18 = [v7 objectForKeyedSubscript:&unk_1EECE49D0];
          [v18 vo2MaxUpperBound];
        }
      }
    }
    uint64_t v19 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  id v6 = [a1 cardioFitnessDataForBiologicalSex:a4 age:a5];
  id v7 = [NSNumber numberWithInteger:a3];
  int64_t v8 = [v6 objectForKeyedSubscript:v7];

  return v8;
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5
{
  id v7 = [a1 cardioFitnessPropertiesForDate:a4 healthStore:a5];
  int64_t v8 = v7;
  if (v7)
  {
    id v9 = objc_msgSend(a1, "cardioFitnessDataForLevel:biologicalSex:age:", a3, objc_msgSend(v7, "biologicalSex"), objc_msgSend(v7, "age"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  uint64_t v5 = [a1 cardioFitnessDataForVO2Max:a4 biologicalSex:a5 age:a3];
  id v6 = v5;
  if (v5) {
    int64_t v7 = [v5 cardioFitnessLevel];
  }
  else {
    int64_t v7 = -1;
  }

  return v7;
}

+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [v6 endDate];
  id v9 = [a1 cardioFitnessPropertiesForDate:v8 healthStore:v7];

  if (v9)
  {
    double v10 = [v6 quantity];
    double v11 = [v6 quantityType];
    id v12 = [v11 canonicalUnit];
    [v10 doubleValueForUnit:v12];
    int64_t v14 = objc_msgSend(a1, "cardioFitnessLevelForVO2Max:biologicalSex:age:", objc_msgSend(v9, "biologicalSex"), objc_msgSend(v9, "age"), v13);
  }
  else
  {
    int64_t v14 = -1;
  }

  return v14;
}

+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v35 = 0;
  int64_t v8 = [v7 biologicalSexWithError:&v35];
  id v9 = v35;
  if (!v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:]();
    }
  }
  id v34 = v9;
  double v10 = [v7 dateOfBirthComponentsWithError:&v34];
  id v11 = v34;

  if (!v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      +[HKCardioFitnessClassificationUtilities cardioFitnessPropertiesForDate:healthStore:]();
    }
    goto LABEL_16;
  }
  if (!v8)
  {
LABEL_16:
    id v13 = 0;
    goto LABEL_17;
  }
  id v29 = v7;
  long long v27 = v10;
  id v12 = objc_msgSend(a1, "_cardioFitnessLevelTransitionDatesForDateInterval:biologicalSex:dateOfBirth:", v6, objc_msgSend(v8, "biologicalSex"), v10);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = [v6 startDate];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
  id v28 = v11;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v19 = 0;
      uint64_t v20 = v14;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v21 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v20 endDate:v21];
        [v13 addObject:v22];
        id v14 = v21;

        ++v19;
        uint64_t v20 = v14;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v17);
  }

  id v23 = objc_alloc(MEMORY[0x1E4F28C18]);
  long long v24 = [v6 endDate];
  long long v25 = (void *)[v23 initWithStartDate:v14 endDate:v24];

  [v13 addObject:v25];
  id v11 = v28;
  id v7 = v29;
  double v10 = v27;
LABEL_17:

  return v13;
}

+ (id)analyticsStringForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return &stru_1EEC60288;
  }
  else {
    return off_1E58C54E8[a3 + 1];
  }
}

+ (void)_cardioFitnessLevels
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "%{public}@: falling back to stubbed cardio fitness level data", (uint8_t *)&v2, 0xCu);
}

void __73__HKCardioFitnessClassificationUtilities__queryCoreMotionClassifications__block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 localizedDescription];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_3_0(&dword_19C023000, v6, v7, "%{public}@: Error retrieving cardio fitness classifications from Core Motion: %{public}@", v8, v9, v10, v11, v12);
}

+ (void)cardioFitnessPropertiesForDate:healthStore:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Unable to retrieve date of birth: %{public}@");
}

+ (void)cardioFitnessPropertiesForDate:healthStore:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Unable to retrieve biological sex: %{public}@");
}

@end