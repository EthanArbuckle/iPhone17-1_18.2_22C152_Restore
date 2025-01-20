@interface ATXPredictionDataHistograms
- (ATXHistogramBundleIdTable)bundleIdTable;
- (ATXPredictionDataHistograms)initWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 histogramManager:(id)a6;
- (NSArray)actionKeyBasedHistograms;
- (NSArray)categoricalHistograms;
- (NSArray)histograms;
- (NSDictionary)categoricalHistogramTypes;
- (NSDictionary)histogramTypes;
- (_ATXAppInfoManager)infoManager;
- (_ATXAppLaunchCategoricalHistogram)actionConfirmsHistogram;
- (_ATXAppLaunchCategoricalHistogram)actionRejectsHistogram;
- (_ATXAppLaunchCategoricalHistogram)activitySuggestionsFeedbackHistogram;
- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogram;
- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogramNoDecay;
- (_ATXAppLaunchCategoricalHistogram)appCoarseGeoHashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationConfirmsHistogram;
- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationLaunchesHistogram;
- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationRejectsHistogram;
- (_ATXAppLaunchCategoricalHistogram)appConfirmsCoarseGeoHash;
- (_ATXAppLaunchCategoricalHistogram)appConfirmsDayOfWeek;
- (_ATXAppLaunchCategoricalHistogram)appConfirmsSpecificGeoHash;
- (_ATXAppLaunchCategoricalHistogram)appConfirmsTwoHourTimeInterval;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsDayOfWeekHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsTwoHourTimeIntervalHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsDayOfWeekHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificTimeDOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsTwoHourTimeIntervalHistogram;
- (_ATXAppLaunchCategoricalHistogram)appExplicitRejectsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsCoreMotionLaunchHistogram;
- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsWifiHistogram;
- (_ATXAppLaunchCategoricalHistogram)appIntentCoreMotionLaunchHistogram;
- (_ATXAppLaunchCategoricalHistogram)appIntentPartOfWeekHistogram;
- (_ATXAppLaunchCategoricalHistogram)appIntentWifiHistogram;
- (_ATXAppLaunchCategoricalHistogram)appLaunchesTwoHourTimeInterval;
- (_ATXAppLaunchCategoricalHistogram)appRejectsCoarseGeoHash;
- (_ATXAppLaunchCategoricalHistogram)appRejectsDayOfWeek;
- (_ATXAppLaunchCategoricalHistogram)appRejectsSpecificGeoHash;
- (_ATXAppLaunchCategoricalHistogram)appRejectsTwoHourTimeInterval;
- (_ATXAppLaunchCategoricalHistogram)appSpecificGeoHashHistogram;
- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationConfirmsHistogram;
- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationLaunchesHistogram;
- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationRejectsHistogram;
- (_ATXAppLaunchCategoricalHistogram)appZoom7GeoHashHistogram;
- (_ATXAppLaunchCategoricalHistogram)coreMotionLaunchHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsDayOfWeekHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseTimePOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsDayOfWeekHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificGeohashHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsTwoHourTimeIntervalHistogram;
- (_ATXAppLaunchCategoricalHistogram)homeScreenWidgetInteractionHistogram;
- (_ATXAppLaunchCategoricalHistogram)notificationDigestAlltimeMarqueeAppearancesHistogram;
- (_ATXAppLaunchCategoricalHistogram)notificationDigestAppEngagementHistogram;
- (_ATXAppLaunchCategoricalHistogram)notificationsHistoryHistogram;
- (_ATXAppLaunchCategoricalHistogram)poiCategoryHistogram;
- (_ATXAppLaunchCategoricalHistogram)timeAndDayHistogram;
- (_ATXAppLaunchCategoricalHistogram)wifiLaunchHistogram;
- (_ATXAppLaunchHistogram)airplaneModeLaunchHistogram;
- (_ATXAppLaunchHistogram)appDirectoryLaunchHistogram;
- (_ATXAppLaunchHistogram)appForAllIntentsAirplaneModeLaunchHistogram;
- (_ATXAppLaunchHistogram)appForAllIntentsDayOfWeekHistogram;
- (_ATXAppLaunchHistogram)appForAllIntentsLaunchHistogram;
- (_ATXAppLaunchHistogram)appForAllIntentsTrendingLaunchHistogram;
- (_ATXAppLaunchHistogram)appForAllIntentsUnlockTimeHistogram;
- (_ATXAppLaunchHistogram)appIntentAirplaneModeLaunchHistogram;
- (_ATXAppLaunchHistogram)appIntentDayOfWeekHistogram;
- (_ATXAppLaunchHistogram)appIntentLaunchHistogram;
- (_ATXAppLaunchHistogram)appIntentTrendingLaunchHistogram;
- (_ATXAppLaunchHistogram)appIntentUnlockTimeHistogram;
- (_ATXAppLaunchHistogram)appLaunchHistogram;
- (_ATXAppLaunchHistogram)dayOfWeekLaunchHistogram;
- (_ATXAppLaunchHistogram)heuristicConfirmsHistogram;
- (_ATXAppLaunchHistogram)heuristicRejectsHistogram;
- (_ATXAppLaunchHistogram)homescreenLaunchHistogram;
- (_ATXAppLaunchHistogram)spotlightLaunchHistogram;
- (_ATXAppLaunchHistogram)trendingLaunchHistogram;
- (_ATXAppLaunchHistogram)unlockTimeHistogram;
- (_ATXAppLaunchSequenceManager)seqManager;
- (id)initPersistentHistogramsWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 dataStore:(id)a6;
- (id)initWithAppInfoManager:(void *)a3 bundleIdTable:(void *)a4 launchSequenceManager:(void *)a5 histogramManager:(void *)a6 dataStore:(int)a7 persistHistograms:;
- (void)allHistograms;
- (void)removeExpiredData;
- (void)verifyHistograms;
@end

@implementation ATXPredictionDataHistograms

- (ATXPredictionDataHistograms)initWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 histogramManager:(id)a6
{
  return (ATXPredictionDataHistograms *)-[ATXPredictionDataHistograms initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:dataStore:persistHistograms:]((id *)&self->super.isa, a3, a4, a5, a6, 0, 0);
}

- (id)initWithAppInfoManager:(void *)a3 bundleIdTable:(void *)a4 launchSequenceManager:(void *)a5 histogramManager:(void *)a6 dataStore:(int)a7 persistHistograms:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v18;
  if (a1)
  {
    if (a7) {
      id v20 = v18;
    }
    else {
      id v20 = v17;
    }
    if (!v20)
    {
      v211 = [MEMORY[0x1E4F28B00] currentHandler];
      [v211 handleFailureInMethod:sel_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms_ object:a1 file:@"ATXPredictionDataHistograms.m" lineNumber:62 description:@"Data store or histogram manager is missing"];
    }
    v223.receiver = a1;
    v223.super_class = (Class)ATXPredictionDataHistograms;
    v21 = (id *)objc_msgSendSuper2(&v223, sel_init);
    a1 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      id v212 = v14;
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke;
      aBlock[3] = &unk_1E68B5A18;
      char v222 = a7;
      id v24 = v19;
      id v219 = v24;
      id v25 = v17;
      v26 = v19;
      id v27 = v17;
      id v28 = v16;
      id v29 = v15;
      id v30 = v25;
      id v220 = v25;
      id v221 = v22;
      id v210 = v22;
      v31 = (void (**)(void *, void))_Block_copy(aBlock);
      v213[0] = MEMORY[0x1E4F143A8];
      v213[1] = 3221225472;
      v213[2] = __135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke_2;
      v213[3] = &unk_1E68B5A40;
      char v217 = a7;
      id v214 = v24;
      id v32 = v30;
      id v15 = v29;
      id v16 = v28;
      id v17 = v27;
      v19 = v26;
      id v215 = v32;
      id v216 = v23;
      id v33 = v23;
      v34 = (void (**)(void *, uint64_t))_Block_copy(v213);
      uint64_t v35 = v31[2](v31, 0);
      id v36 = a1[4];
      a1[4] = (id)v35;

      uint64_t v37 = v31[2](v31, 1);
      id v38 = a1[5];
      a1[5] = (id)v37;

      uint64_t v39 = v31[2](v31, 92);
      id v40 = a1[6];
      a1[6] = (id)v39;

      uint64_t v41 = v31[2](v31, 93);
      id v42 = a1[7];
      a1[7] = (id)v41;

      uint64_t v43 = v31[2](v31, 11);
      id v44 = a1[8];
      a1[8] = (id)v43;

      uint64_t v45 = v31[2](v31, 2);
      id v46 = a1[9];
      a1[9] = (id)v45;

      uint64_t v47 = v31[2](v31, 3);
      id v48 = a1[10];
      a1[10] = (id)v47;

      uint64_t v49 = v31[2](v31, 5);
      id v50 = a1[11];
      a1[11] = (id)v49;

      uint64_t v51 = v31[2](v31, 14);
      id v52 = a1[12];
      a1[12] = (id)v51;

      uint64_t v53 = v31[2](v31, 23);
      id v54 = a1[13];
      a1[13] = (id)v53;

      uint64_t v55 = v31[2](v31, 17);
      id v56 = a1[14];
      a1[14] = (id)v55;

      uint64_t v57 = v31[2](v31, 26);
      id v58 = a1[15];
      a1[15] = (id)v57;

      uint64_t v59 = v31[2](v31, 20);
      id v60 = a1[16];
      a1[16] = (id)v59;

      uint64_t v61 = v31[2](v31, 16);
      id v62 = a1[17];
      a1[17] = (id)v61;

      uint64_t v63 = v31[2](v31, 25);
      id v64 = a1[18];
      a1[18] = (id)v63;

      uint64_t v65 = v31[2](v31, 19);
      id v66 = a1[19];
      a1[19] = (id)v65;

      uint64_t v67 = v31[2](v31, 28);
      id v68 = a1[20];
      a1[20] = (id)v67;

      uint64_t v69 = v31[2](v31, 22);
      id v70 = a1[21];
      a1[21] = (id)v69;

      uint64_t v71 = v31[2](v31, 35);
      id v72 = a1[22];
      a1[22] = (id)v71;

      uint64_t v73 = v31[2](v31, 36);
      id v74 = a1[23];
      a1[23] = (id)v73;

      uint64_t v75 = v34[2](v34, 4);
      id v76 = a1[24];
      a1[24] = (id)v75;

      uint64_t v77 = v34[2](v34, 37);
      id v78 = a1[25];
      a1[25] = (id)v77;

      uint64_t v79 = v34[2](v34, 42);
      id v80 = a1[26];
      a1[26] = (id)v79;

      uint64_t v81 = v34[2](v34, 43);
      id v82 = a1[27];
      a1[27] = (id)v81;

      uint64_t v83 = v34[2](v34, 44);
      id v84 = a1[28];
      a1[28] = (id)v83;

      uint64_t v85 = v34[2](v34, 45);
      id v86 = a1[29];
      a1[29] = (id)v85;

      uint64_t v87 = v34[2](v34, 46);
      id v88 = a1[30];
      a1[30] = (id)v87;

      uint64_t v89 = v34[2](v34, 47);
      id v90 = a1[31];
      a1[31] = (id)v89;

      uint64_t v91 = v34[2](v34, 48);
      id v92 = a1[32];
      a1[32] = (id)v91;

      uint64_t v93 = v34[2](v34, 50);
      id v94 = a1[33];
      a1[33] = (id)v93;

      uint64_t v95 = v34[2](v34, 51);
      id v96 = a1[34];
      a1[34] = (id)v95;

      uint64_t v97 = v34[2](v34, 61);
      id v98 = a1[35];
      a1[35] = (id)v97;

      uint64_t v99 = v34[2](v34, 52);
      id v100 = a1[36];
      a1[36] = (id)v99;

      uint64_t v101 = v34[2](v34, 53);
      id v102 = a1[37];
      a1[37] = (id)v101;

      uint64_t v103 = v34[2](v34, 54);
      id v104 = a1[38];
      a1[38] = (id)v103;

      uint64_t v105 = v34[2](v34, 55);
      id v106 = a1[39];
      a1[39] = (id)v105;

      uint64_t v107 = v34[2](v34, 56);
      id v108 = a1[40];
      a1[40] = (id)v107;

      uint64_t v109 = v34[2](v34, 57);
      id v110 = a1[41];
      a1[41] = (id)v109;

      uint64_t v111 = v34[2](v34, 58);
      id v112 = a1[42];
      a1[42] = (id)v111;

      uint64_t v113 = v34[2](v34, 59);
      id v114 = a1[43];
      a1[43] = (id)v113;

      uint64_t v115 = v34[2](v34, 60);
      id v116 = a1[44];
      a1[44] = (id)v115;

      uint64_t v117 = v34[2](v34, 87);
      id v118 = a1[45];
      a1[45] = (id)v117;

      uint64_t v119 = v34[2](v34, 29);
      id v120 = a1[46];
      a1[46] = (id)v119;

      uint64_t v121 = v34[2](v34, 38);
      id v122 = a1[47];
      a1[47] = (id)v121;

      uint64_t v123 = v34[2](v34, 31);
      id v124 = a1[48];
      a1[48] = (id)v123;

      uint64_t v125 = v34[2](v34, 39);
      id v126 = a1[49];
      a1[49] = (id)v125;

      uint64_t v127 = v34[2](v34, 33);
      id v128 = a1[50];
      a1[50] = (id)v127;

      uint64_t v129 = v34[2](v34, 34);
      id v130 = a1[51];
      a1[51] = (id)v129;

      uint64_t v131 = v34[2](v34, 40);
      id v132 = a1[52];
      a1[52] = (id)v131;

      uint64_t v133 = v34[2](v34, 49);
      id v134 = a1[53];
      a1[53] = (id)v133;

      uint64_t v135 = v34[2](v34, 94);
      id v136 = a1[54];
      a1[54] = (id)v135;

      uint64_t v137 = v34[2](v34, 32);
      id v138 = a1[55];
      a1[55] = (id)v137;

      uint64_t v139 = v34[2](v34, 62);
      id v140 = a1[56];
      a1[56] = (id)v139;

      uint64_t v141 = v34[2](v34, 63);
      id v142 = a1[57];
      a1[57] = (id)v141;

      uint64_t v143 = v34[2](v34, 64);
      id v144 = a1[58];
      a1[58] = (id)v143;

      uint64_t v145 = v34[2](v34, 65);
      id v146 = a1[59];
      a1[59] = (id)v145;

      uint64_t v147 = v34[2](v34, 66);
      id v148 = a1[60];
      a1[60] = (id)v147;

      uint64_t v149 = v34[2](v34, 67);
      id v150 = a1[61];
      a1[61] = (id)v149;

      uint64_t v151 = v34[2](v34, 68);
      id v152 = a1[62];
      a1[62] = (id)v151;

      uint64_t v153 = v34[2](v34, 69);
      id v154 = a1[63];
      a1[63] = (id)v153;

      uint64_t v155 = v34[2](v34, 70);
      id v156 = a1[64];
      a1[64] = (id)v155;

      uint64_t v157 = v34[2](v34, 71);
      id v158 = a1[65];
      a1[65] = (id)v157;

      uint64_t v159 = v34[2](v34, 72);
      id v160 = a1[66];
      a1[66] = (id)v159;

      uint64_t v161 = v34[2](v34, 73);
      id v162 = a1[67];
      a1[67] = (id)v161;

      uint64_t v163 = v34[2](v34, 74);
      id v164 = a1[68];
      a1[68] = (id)v163;

      uint64_t v165 = v34[2](v34, 88);
      id v166 = a1[69];
      a1[69] = (id)v165;

      uint64_t v167 = v34[2](v34, 75);
      id v168 = a1[70];
      a1[70] = (id)v167;

      uint64_t v169 = v34[2](v34, 76);
      id v170 = a1[71];
      a1[71] = (id)v169;

      uint64_t v171 = v34[2](v34, 77);
      id v172 = a1[72];
      a1[72] = (id)v171;

      uint64_t v173 = v34[2](v34, 78);
      id v174 = a1[73];
      a1[73] = (id)v173;

      uint64_t v175 = v34[2](v34, 79);
      id v176 = a1[74];
      a1[74] = (id)v175;

      uint64_t v177 = v34[2](v34, 80);
      id v178 = a1[75];
      a1[75] = (id)v177;

      uint64_t v179 = v34[2](v34, 81);
      id v180 = a1[76];
      a1[76] = (id)v179;

      uint64_t v181 = v34[2](v34, 82);
      id v182 = a1[77];
      a1[77] = (id)v181;

      uint64_t v183 = v34[2](v34, 83);
      id v184 = a1[78];
      a1[78] = (id)v183;

      uint64_t v185 = v34[2](v34, 84);
      id v186 = a1[79];
      a1[79] = (id)v185;

      uint64_t v187 = v34[2](v34, 85);
      id v188 = a1[80];
      a1[80] = (id)v187;

      uint64_t v189 = v34[2](v34, 86);
      id v190 = a1[81];
      a1[81] = (id)v189;

      uint64_t v191 = v34[2](v34, 89);
      id v192 = a1[82];
      a1[82] = (id)v191;

      uint64_t v193 = v34[2](v34, 95);
      id v194 = a1[83];
      a1[83] = (id)v193;

      uint64_t v195 = v34[2](v34, 96);
      id v196 = a1[84];
      a1[84] = (id)v195;

      uint64_t v197 = v34[2](v34, 97);
      id v198 = a1[85];
      a1[85] = (id)v197;

      uint64_t v199 = v34[2](v34, 98);
      id v14 = v212;
      id v200 = a1[86];
      a1[86] = (id)v199;

      uint64_t v201 = [v210 copy];
      id v202 = a1[88];
      a1[88] = (id)v201;

      uint64_t v203 = [v210 allValues];
      id v204 = a1[87];
      a1[87] = (id)v203;

      uint64_t v205 = [v33 copy];
      id v206 = a1[90];
      a1[90] = (id)v205;

      uint64_t v207 = [v33 allValues];
      id v208 = a1[89];
      a1[89] = (id)v207;
    }
  }

  return a1;
}

- (id)initPersistentHistogramsWithAppInfoManager:(id)a3 bundleIdTable:(id)a4 launchSequenceManager:(id)a5 dataStore:(id)a6
{
  return -[ATXPredictionDataHistograms initWithAppInfoManager:bundleIdTable:launchSequenceManager:histogramManager:dataStore:persistHistograms:]((id *)&self->super.isa, a3, a4, a5, 0, a6, 1);
}

_ATXAppLaunchHistogramWithPersistentBackup *__135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = [[_ATXAppLaunchHistogramWithPersistentBackup alloc] initWithDataStore:*(void *)(a1 + 32) histogramType:a2];
  }
  else
  {
    v4 = [*(id *)(a1 + 40) histogramForLaunchType:a2];
  }
  v5 = v4;
  v6 = *(void **)(a1 + 48);
  v7 = [NSNumber numberWithInteger:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return v5;
}

_ATXAppLaunchCategoricalHistogramWithPersistentBackup *__135__ATXPredictionDataHistograms_initWithAppInfoManager_bundleIdTable_launchSequenceManager_histogramManager_dataStore_persistHistograms___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = [[_ATXAppLaunchCategoricalHistogramWithPersistentBackup alloc] initWithDataStore:*(void *)(a1 + 32) histogramType:a2];
  }
  else
  {
    v4 = [*(id *)(a1 + 40) categoricalHistogramForLaunchType:a2];
  }
  v5 = v4;
  v6 = *(void **)(a1 + 48);
  v7 = [NSNumber numberWithInteger:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return v5;
}

- (void)allHistograms
{
  v1 = a1;
  if (a1)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a1[87]];
    v1 = [v2 arrayByAddingObjectsFromArray:v1[89]];
  }
  return v1;
}

- (NSArray)actionKeyBasedHistograms
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)&self->_appIntentLaunchHistogram;
  appIntentDayOfWeekHistogram = self->_appIntentDayOfWeekHistogram;
  long long v7 = *(_OWORD *)&self->_appIntentAirplaneModeLaunchHistogram;
  appIntentCoreMotionLaunchHistogram = self->_appIntentCoreMotionLaunchHistogram;
  appIntentWifiHistogram = self->_appIntentWifiHistogram;
  v9 = appIntentCoreMotionLaunchHistogram;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:7];
  return (NSArray *)v3;
}

- (void)removeExpiredData
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  homescreenLaunchHistogram = self->_homescreenLaunchHistogram;
  dayOfWeekLaunchHistogram = self->_dayOfWeekLaunchHistogram;
  appCoarseTimePOWLocationLaunchesHistogram = self->_appCoarseTimePOWLocationLaunchesHistogram;
  timeAndDayHistogram = self->_timeAndDayHistogram;
  id v54 = appCoarseTimePOWLocationLaunchesHistogram;
  appCoarseTimePOWLocationConfirmsHistogram = self->_appCoarseTimePOWLocationConfirmsHistogram;
  appSpecificTimeDOWLocationLaunchesHistogram = self->_appSpecificTimeDOWLocationLaunchesHistogram;
  id v56 = appCoarseTimePOWLocationConfirmsHistogram;
  appCoarseTimePOWLocationRejectsHistogram = self->_appCoarseTimePOWLocationRejectsHistogram;
  appSpecificTimeDOWLocationConfirmsHistogram = self->_appSpecificTimeDOWLocationConfirmsHistogram;
  id v58 = appCoarseTimePOWLocationRejectsHistogram;
  long long v59 = *(_OWORD *)&self->_appSpecificTimeDOWLocationRejectsHistogram;
  appCoarseGeoHashHistogram = self->_appCoarseGeoHashHistogram;
  long long v61 = *(_OWORD *)&self->_appZoom7GeoHashHistogram;
  long long v62 = *(_OWORD *)&self->_appConfirmsTwoHourTimeInterval;
  appConfirmsDayOfWeek = self->_appConfirmsDayOfWeek;
  appRejectsDayOfWeek = self->_appRejectsDayOfWeek;
  id v60 = appCoarseGeoHashHistogram;
  uint64_t v63 = appConfirmsDayOfWeek;
  id v64 = appRejectsDayOfWeek;
  appRejectsCoarseGeoHash = self->_appRejectsCoarseGeoHash;
  appConfirmsCoarseGeoHash = self->_appConfirmsCoarseGeoHash;
  id v66 = appRejectsCoarseGeoHash;
  appRejectsSpecificGeoHash = self->_appRejectsSpecificGeoHash;
  appConfirmsSpecificGeoHash = self->_appConfirmsSpecificGeoHash;
  id v68 = appRejectsSpecificGeoHash;
  appForAllIntentsLaunchHistogram = self->_appForAllIntentsLaunchHistogram;
  appForAllIntentsUnlockTimeHistogram = self->_appForAllIntentsUnlockTimeHistogram;
  appExplicitRejectsCoarseTimePOWLocationHistogram = self->_appExplicitRejectsCoarseTimePOWLocationHistogram;
  id v70 = appForAllIntentsLaunchHistogram;
  uint64_t v71 = appForAllIntentsUnlockTimeHistogram;
  appForAllIntentsAirplaneModeLaunchHistogram = self->_appForAllIntentsAirplaneModeLaunchHistogram;
  appForAllIntentsDayOfWeekHistogram = self->_appForAllIntentsDayOfWeekHistogram;
  uint64_t v73 = appForAllIntentsAirplaneModeLaunchHistogram;
  appForAllIntentsWifiHistogram = self->_appForAllIntentsWifiHistogram;
  appForAllIntentsCoreMotionLaunchHistogram = self->_appForAllIntentsCoreMotionLaunchHistogram;
  heuristicConfirmsHistogram = self->_heuristicConfirmsHistogram;
  appForAllIntentsTrendingLaunchHistogram = self->_appForAllIntentsTrendingLaunchHistogram;
  uint64_t v75 = appForAllIntentsWifiHistogram;
  infoManager = self->_infoManager;
  bundleIdTable = self->_bundleIdTable;
  id v76 = appForAllIntentsCoreMotionLaunchHistogram;
  uint64_t v77 = infoManager;
  actionConfirmsHistogram = self->_actionConfirmsHistogram;
  actionRejectsHistogram = self->_actionRejectsHistogram;
  id v78 = bundleIdTable;
  uint64_t v79 = actionConfirmsHistogram;
  id v80 = actionRejectsHistogram;
  uint64_t v81 = heuristicConfirmsHistogram;
  seqManager = self->_seqManager;
  heuristicRejectsHistogram = self->_heuristicRejectsHistogram;
  uint64_t v83 = seqManager;
  appClipsFeedbackHistogramNoDecay = self->_appClipsFeedbackHistogramNoDecay;
  notificationsHistoryHistogram = self->_notificationsHistoryHistogram;
  appIntentPartOfWeekHistogram = self->_appIntentPartOfWeekHistogram;
  appClipsFeedbackHistogram = self->_appClipsFeedbackHistogram;
  uint64_t v85 = appClipsFeedbackHistogramNoDecay;
  long long v47 = *(_OWORD *)&self->_appLaunchHistogram;
  long long v49 = *(_OWORD *)&self->_appDirectoryLaunchHistogram;
  long long v25 = *(_OWORD *)&self->_wifiLaunchHistogram;
  long long v51 = *(_OWORD *)&self->_airplaneModeLaunchHistogram;
  long long v52 = v25;
  id v86 = notificationsHistoryHistogram;
  uint64_t v87 = appIntentPartOfWeekHistogram;
  homeScreenAppConfirmsSpecificTimeDOWLocationHistogram = self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
  homeScreenAppConfirmsCoarseTimePOWLocationHistogram = self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
  uint64_t v89 = homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
  homeScreenAppConfirmsDayOfWeekHistogram = self->_homeScreenAppConfirmsDayOfWeekHistogram;
  homeScreenAppConfirmsTwoHourTimeIntervalHistogram = self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
  uint64_t v91 = homeScreenAppConfirmsDayOfWeekHistogram;
  homeScreenAppConfirmsSpecificGeohashHistogram = self->_homeScreenAppConfirmsSpecificGeohashHistogram;
  homeScreenAppConfirmsCoarseGeohashHistogram = self->_homeScreenAppConfirmsCoarseGeohashHistogram;
  uint64_t v93 = homeScreenAppConfirmsSpecificGeohashHistogram;
  homeScreenAppRejectsSpecificTimeDOWLocationHistogram = self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
  homeScreenAppRejectsCoarseTimePOWLocationHistogram = self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram;
  uint64_t v95 = homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
  homeScreenAppRejectsDayOfWeekHistogram = self->_homeScreenAppRejectsDayOfWeekHistogram;
  homeScreenAppRejectsTwoHourTimeIntervalHistogram = self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram;
  uint64_t v97 = homeScreenAppRejectsDayOfWeekHistogram;
  homeScreenAppRejectsSpecificGeohashHistogram = self->_homeScreenAppRejectsSpecificGeohashHistogram;
  homeScreenAppRejectsCoarseGeohashHistogram = self->_homeScreenAppRejectsCoarseGeohashHistogram;
  uint64_t v99 = homeScreenAppRejectsSpecificGeohashHistogram;
  appDirectoryConfirmsCoarseTimePOWLocationHistogram = self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram;
  homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram = self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
  uint64_t v101 = appDirectoryConfirmsCoarseTimePOWLocationHistogram;
  appDirectoryConfirmsTwoHourTimeIntervalHistogram = self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram;
  appDirectoryConfirmsSpecificTimeDOWLocationHistogram = self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
  uint64_t v103 = appDirectoryConfirmsTwoHourTimeIntervalHistogram;
  appDirectoryConfirmsDayOfWeekHistogram = self->_appDirectoryConfirmsDayOfWeekHistogram;
  appDirectoryConfirmsCoarseGeohashHistogram = self->_appDirectoryConfirmsCoarseGeohashHistogram;
  appDirectoryConfirmsSpecificGeohashHistogram = self->_appDirectoryConfirmsSpecificGeohashHistogram;
  appDirectoryRejectsCoarseTimePOWLocationHistogram = self->_appDirectoryRejectsCoarseTimePOWLocationHistogram;
  appDirectoryRejectsSpecificTimeDOWLocationHistogram = self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram;
  appDirectoryRejectsTwoHourTimeIntervalHistogram = self->_appDirectoryRejectsTwoHourTimeIntervalHistogram;
  appDirectoryRejectsDayOfWeekHistogram = self->_appDirectoryRejectsDayOfWeekHistogram;
  appDirectoryRejectsCoarseGeohashHistogram = self->_appDirectoryRejectsCoarseGeohashHistogram;
  appDirectoryRejectsSpecificGeohashHistogram = self->_appDirectoryRejectsSpecificGeohashHistogram;
  appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram = self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
  poiCategoryHistogram = self->_poiCategoryHistogram;
  activitySuggestionsFeedbackHistogram = self->_activitySuggestionsFeedbackHistogram;
  notificationDigestAppEngagementHistogram = self->_notificationDigestAppEngagementHistogram;
  notificationDigestAlltimeMarqueeAppearancesHistogram = self->_notificationDigestAlltimeMarqueeAppearancesHistogram;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:78];
  id v46 = self->_seqManager;
  uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  id v36 = [(ATXPredictionDataHistograms *)self actionKeyBasedHistograms];
  uint64_t v37 = [v35 arrayByAddingObjectsFromArray:v36];

  id v38 = __atxlog_handle_default();
  os_signpost_id_t v39 = os_signpost_id_generate(v38);

  id v40 = __atxlog_handle_default();
  uint64_t v41 = v40;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)uint64_t v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "RemoveOldLaunchInfo", " enableTelemetry=YES ", v45, 2u);
  }

  id v42 = [[ATXExpiredDataProvider alloc] initWithAppInfoManager:self->_infoManager histogramBundleIdTable:self->_bundleIdTable];
  +[ATXExpiredDataRemover removeExpiredBundleIdsFrom:v34 removeExpiredActionKeysFrom:v37 expiredDataProvider:v42];
  uint64_t v43 = __atxlog_handle_default();
  id v44 = v43;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)uint64_t v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v44, OS_SIGNPOST_INTERVAL_END, v39, "RemoveOldLaunchInfo", " enableTelemetry=YES ", v45, 2u);
  }
}

- (void)verifyHistograms
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = -[ATXPredictionDataHistograms allHistograms](self);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "verifyDataIntegrity", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (_ATXAppInfoManager)infoManager
{
  return self->_infoManager;
}

- (ATXHistogramBundleIdTable)bundleIdTable
{
  return self->_bundleIdTable;
}

- (_ATXAppLaunchSequenceManager)seqManager
{
  return self->_seqManager;
}

- (_ATXAppLaunchHistogram)appLaunchHistogram
{
  return self->_appLaunchHistogram;
}

- (_ATXAppLaunchHistogram)spotlightLaunchHistogram
{
  return self->_spotlightLaunchHistogram;
}

- (_ATXAppLaunchHistogram)homescreenLaunchHistogram
{
  return self->_homescreenLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appDirectoryLaunchHistogram
{
  return self->_appDirectoryLaunchHistogram;
}

- (_ATXAppLaunchHistogram)unlockTimeHistogram
{
  return self->_unlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)dayOfWeekLaunchHistogram
{
  return self->_dayOfWeekLaunchHistogram;
}

- (_ATXAppLaunchHistogram)airplaneModeLaunchHistogram
{
  return self->_airplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)trendingLaunchHistogram
{
  return self->_trendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentLaunchHistogram
{
  return self->_appIntentLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentUnlockTimeHistogram
{
  return self->_appIntentUnlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)appIntentDayOfWeekHistogram
{
  return self->_appIntentDayOfWeekHistogram;
}

- (_ATXAppLaunchHistogram)appIntentAirplaneModeLaunchHistogram
{
  return self->_appIntentAirplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appIntentTrendingLaunchHistogram
{
  return self->_appIntentTrendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsLaunchHistogram
{
  return self->_appForAllIntentsLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsUnlockTimeHistogram
{
  return self->_appForAllIntentsUnlockTimeHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsDayOfWeekHistogram
{
  return self->_appForAllIntentsDayOfWeekHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsAirplaneModeLaunchHistogram
{
  return self->_appForAllIntentsAirplaneModeLaunchHistogram;
}

- (_ATXAppLaunchHistogram)appForAllIntentsTrendingLaunchHistogram
{
  return self->_appForAllIntentsTrendingLaunchHistogram;
}

- (_ATXAppLaunchHistogram)heuristicConfirmsHistogram
{
  return self->_heuristicConfirmsHistogram;
}

- (_ATXAppLaunchHistogram)heuristicRejectsHistogram
{
  return self->_heuristicRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)wifiLaunchHistogram
{
  return self->_wifiLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)coreMotionLaunchHistogram
{
  return self->_coreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)timeAndDayHistogram
{
  return self->_timeAndDayHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationLaunchesHistogram
{
  return self->_appCoarseTimePOWLocationLaunchesHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationLaunchesHistogram
{
  return self->_appSpecificTimeDOWLocationLaunchesHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationConfirmsHistogram
{
  return self->_appCoarseTimePOWLocationConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationConfirmsHistogram
{
  return self->_appSpecificTimeDOWLocationConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseTimePOWLocationRejectsHistogram
{
  return self->_appCoarseTimePOWLocationRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificTimeDOWLocationRejectsHistogram
{
  return self->_appSpecificTimeDOWLocationRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appSpecificGeoHashHistogram
{
  return self->_appSpecificGeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appCoarseGeoHashHistogram
{
  return self->_appCoarseGeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appZoom7GeoHashHistogram
{
  return self->_appZoom7GeoHashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appLaunchesTwoHourTimeInterval
{
  return self->_appLaunchesTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsTwoHourTimeInterval
{
  return self->_appConfirmsTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsTwoHourTimeInterval
{
  return self->_appRejectsTwoHourTimeInterval;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsDayOfWeek
{
  return self->_appConfirmsDayOfWeek;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsDayOfWeek
{
  return self->_appRejectsDayOfWeek;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsCoarseGeoHash
{
  return self->_appConfirmsCoarseGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsCoarseGeoHash
{
  return self->_appRejectsCoarseGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appConfirmsSpecificGeoHash
{
  return self->_appConfirmsSpecificGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appRejectsSpecificGeoHash
{
  return self->_appRejectsSpecificGeoHash;
}

- (_ATXAppLaunchCategoricalHistogram)appExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_appExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentWifiHistogram
{
  return self->_appIntentWifiHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentCoreMotionLaunchHistogram
{
  return self->_appIntentCoreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsWifiHistogram
{
  return self->_appForAllIntentsWifiHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appForAllIntentsCoreMotionLaunchHistogram
{
  return self->_appForAllIntentsCoreMotionLaunchHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)actionConfirmsHistogram
{
  return self->_actionConfirmsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)actionRejectsHistogram
{
  return self->_actionRejectsHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appIntentPartOfWeekHistogram
{
  return self->_appIntentPartOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogram
{
  return self->_appClipsFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appClipsFeedbackHistogramNoDecay
{
  return self->_appClipsFeedbackHistogramNoDecay;
}

- (_ATXAppLaunchCategoricalHistogram)notificationsHistoryHistogram
{
  return self->_notificationsHistoryHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenWidgetInteractionHistogram
{
  return self->_homeScreenWidgetInteractionHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificTimeDOWLocationHistogram
{
  return self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsTwoHourTimeIntervalHistogram
{
  return self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsDayOfWeekHistogram
{
  return self->_homeScreenAppConfirmsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsCoarseGeohashHistogram
{
  return self->_homeScreenAppConfirmsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppConfirmsSpecificGeohashHistogram
{
  return self->_homeScreenAppConfirmsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificTimeDOWLocationHistogram
{
  return self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsTwoHourTimeIntervalHistogram
{
  return self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsDayOfWeekHistogram
{
  return self->_homeScreenAppRejectsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsCoarseGeohashHistogram
{
  return self->_homeScreenAppRejectsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppRejectsSpecificGeohashHistogram
{
  return self->_homeScreenAppRejectsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificTimeDOWLocationHistogram
{
  return self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsTwoHourTimeIntervalHistogram
{
  return self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsDayOfWeekHistogram
{
  return self->_appDirectoryConfirmsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsCoarseGeohashHistogram
{
  return self->_appDirectoryConfirmsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryConfirmsSpecificGeohashHistogram
{
  return self->_appDirectoryConfirmsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificTimeDOWLocationHistogram
{
  return self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsTwoHourTimeIntervalHistogram
{
  return self->_appDirectoryRejectsTwoHourTimeIntervalHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsDayOfWeekHistogram
{
  return self->_appDirectoryRejectsDayOfWeekHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsCoarseGeohashHistogram
{
  return self->_appDirectoryRejectsCoarseGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryRejectsSpecificGeohashHistogram
{
  return self->_appDirectoryRejectsSpecificGeohashHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram
{
  return self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)poiCategoryHistogram
{
  return self->_poiCategoryHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)activitySuggestionsFeedbackHistogram
{
  return self->_activitySuggestionsFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)notificationDigestAppEngagementHistogram
{
  return self->_notificationDigestAppEngagementHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)notificationDigestAlltimeMarqueeAppearancesHistogram
{
  return self->_notificationDigestAlltimeMarqueeAppearancesHistogram;
}

- (NSArray)histograms
{
  return self->_histograms;
}

- (NSDictionary)histogramTypes
{
  return self->_histogramTypes;
}

- (NSArray)categoricalHistograms
{
  return self->_categoricalHistograms;
}

- (NSDictionary)categoricalHistogramTypes
{
  return self->_categoricalHistogramTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoricalHistogramTypes, 0);
  objc_storeStrong((id *)&self->_categoricalHistograms, 0);
  objc_storeStrong((id *)&self->_histogramTypes, 0);
  objc_storeStrong((id *)&self->_histograms, 0);
  objc_storeStrong((id *)&self->_notificationDigestAlltimeMarqueeAppearancesHistogram, 0);
  objc_storeStrong((id *)&self->_notificationDigestAppEngagementHistogram, 0);
  objc_storeStrong((id *)&self->_activitySuggestionsFeedbackHistogram, 0);
  objc_storeStrong((id *)&self->_poiCategoryHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryConfirmsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsSpecificGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsCoarseGeohashHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsTwoHourTimeIntervalHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsSpecificTimeDOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenAppConfirmsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_homeScreenWidgetInteractionHistogram, 0);
  objc_storeStrong((id *)&self->_notificationsHistoryHistogram, 0);
  objc_storeStrong((id *)&self->_appClipsFeedbackHistogramNoDecay, 0);
  objc_storeStrong((id *)&self->_appClipsFeedbackHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentPartOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_actionRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_actionConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsCoreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsWifiHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentCoreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentWifiHistogram, 0);
  objc_storeStrong((id *)&self->_appExplicitRejectsCoarseTimePOWLocationHistogram, 0);
  objc_storeStrong((id *)&self->_appRejectsSpecificGeoHash, 0);
  objc_storeStrong((id *)&self->_appConfirmsSpecificGeoHash, 0);
  objc_storeStrong((id *)&self->_appRejectsCoarseGeoHash, 0);
  objc_storeStrong((id *)&self->_appConfirmsCoarseGeoHash, 0);
  objc_storeStrong((id *)&self->_appRejectsDayOfWeek, 0);
  objc_storeStrong((id *)&self->_appConfirmsDayOfWeek, 0);
  objc_storeStrong((id *)&self->_appRejectsTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appConfirmsTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appLaunchesTwoHourTimeInterval, 0);
  objc_storeStrong((id *)&self->_appZoom7GeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseGeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificGeoHashHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appSpecificTimeDOWLocationLaunchesHistogram, 0);
  objc_storeStrong((id *)&self->_appCoarseTimePOWLocationLaunchesHistogram, 0);
  objc_storeStrong((id *)&self->_timeAndDayHistogram, 0);
  objc_storeStrong((id *)&self->_coreMotionLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_wifiLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_heuristicRejectsHistogram, 0);
  objc_storeStrong((id *)&self->_heuristicConfirmsHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsTrendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsAirplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsUnlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appForAllIntentsLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentTrendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentAirplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentDayOfWeekHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentUnlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appIntentLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_trendingLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_airplaneModeLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_dayOfWeekLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_unlockTimeHistogram, 0);
  objc_storeStrong((id *)&self->_appDirectoryLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_homescreenLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_spotlightLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_seqManager, 0);
  objc_storeStrong((id *)&self->_bundleIdTable, 0);
  objc_storeStrong((id *)&self->_infoManager, 0);
}

@end