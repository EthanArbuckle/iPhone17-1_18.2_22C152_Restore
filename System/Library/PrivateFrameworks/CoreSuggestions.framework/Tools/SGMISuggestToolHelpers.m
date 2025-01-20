@interface SGMISuggestToolHelpers
+ (id)fakeDataWithTrainingCount:(unint64_t)a3 testingCount:(unint64_t)a4;
+ (id)jsonFormattedAccuracyStats;
+ (id)jsonFormattedStats;
+ (void)incrementalSubmodelUpdateOnSearchableItems:(id)a3;
+ (void)performEvaluationOnDBPath:(id)a3 contactPath:(id)a4 outputFilePath:(id)a5 query:(id)a6 printStatsEvery:(int64_t)a7;
@end

@implementation SGMISuggestToolHelpers

+ (void)performEvaluationOnDBPath:(id)a3 contactPath:(id)a4 outputFilePath:(id)a5 query:(id)a6 printStatsEvery:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = +[_PASSqliteDatabase sqliteDatabaseWithFilename:v11 contentProtection:0 errorHandler:0 error:0];
  if (v15)
  {
    id v16 = +[NSFileManager defaultManager];
    if (([v16 fileExistsAtPath:v13] & 1) == 0) {
      [v16 createFileAtPath:v13 contents:0 attributes:0];
    }
    if ([v16 fileExistsAtPath:v13])
    {
      id v17 = objc_alloc((Class)NSSet);
      id v69 = v12;
      v18 = +[NSString stringWithContentsOfFile:v12 encoding:4 error:0];
      v19 = [v18 lowercaseString];
      v20 = [v19 componentsSeparatedByString:@"\n"];
      id v70 = [v17 initWithArray:v20];

      v21 = +[SGSqlEntityStore sqlStoreInMemory];
      v22 = objc_opt_new();
      [v22 appendString:@"id,omittedRecipientWarningsInference,omittedAttachmentWarningsInference,followUpWarningsInference\n"];
      uint64_t v154 = 0;
      v155 = &v154;
      uint64_t v156 = 0x2020000000;
      uint64_t v157 = 0;
      uint64_t v150 = 0;
      v151 = &v150;
      uint64_t v152 = 0x2020000000;
      uint64_t v153 = 0;
      uint64_t v146 = 0;
      v147 = &v146;
      uint64_t v148 = 0x2020000000;
      uint64_t v149 = 0;
      uint64_t v142 = 0;
      v143 = &v142;
      uint64_t v144 = 0x2020000000;
      uint64_t v145 = 0;
      v141[0] = 0;
      v141[1] = v141;
      v141[2] = 0x2020000000;
      v141[3] = 0;
      uint64_t v137 = 0;
      v138 = &v137;
      uint64_t v139 = 0x2020000000;
      uint64_t v140 = 0;
      uint64_t v133 = 0;
      v134 = &v133;
      uint64_t v135 = 0x2020000000;
      uint64_t v136 = 0;
      uint64_t v129 = 0;
      v130 = &v129;
      uint64_t v131 = 0x2020000000;
      uint64_t v132 = 0;
      uint64_t v125 = 0;
      v126 = &v125;
      uint64_t v127 = 0x2020000000;
      uint64_t v128 = 0;
      v124[0] = 0;
      v124[1] = v124;
      v124[2] = 0x2020000000;
      v124[3] = 0;
      uint64_t v120 = 0;
      v121 = &v120;
      uint64_t v122 = 0x2020000000;
      uint64_t v123 = 0;
      uint64_t v116 = 0;
      v117 = &v116;
      uint64_t v118 = 0x2020000000;
      uint64_t v119 = 0;
      uint64_t v112 = 0;
      v113 = &v112;
      uint64_t v114 = 0x2020000000;
      uint64_t v115 = 0;
      uint64_t v108 = 0;
      v109 = &v108;
      uint64_t v110 = 0x2020000000;
      uint64_t v111 = 0;
      v107[0] = 0;
      v107[1] = v107;
      v107[2] = 0x2020000000;
      v107[3] = 0;
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x2020000000;
      uint64_t v106 = 0;
      uint64_t v97 = 0;
      v98 = &v97;
      uint64_t v99 = 0x3032000000;
      v100 = sub_1000397D4;
      v101 = sub_1000397E4;
      id v102 = 0;
      id v23 = [objc_alloc((Class)NSString) initWithFormat:@" ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"];
      puts((const char *)[v23 UTF8String]);

      id v24 = [objc_alloc((Class)NSString) initWithFormat:@" ┃ omittedRecipientWarnings ┃ omittedAttachmentWarnings ┃ follow up ┃"];
      puts((const char *)[v24 UTF8String]);

      id v25 = [objc_alloc((Class)NSString) initWithFormat:@" ┣━━━━━━┯━━━━━━┯━━━━━━┯━━━━━━╋━━━━━━┯━━━━━━┯━━━━━━┯━━━━━━╋━━━━━━┯━━━━━━┯━━━━━━┯━━━━━━┫"];
      puts((const char *)[v25 UTF8String]);

      id v26 = [objc_alloc((Class)NSString) initWithFormat:@" ┃ TP ┆ FP │ TN ┆ FN ┃ TP ┆ FP │ TN ┆ FN ┃ TP ┆ FP │ TN ┆ FN ┃"];
      puts((const char *)[v26 UTF8String]);

      uint64_t v27 = mach_absolute_time();
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1000397EC;
      v72[3] = &unk_10005AF58;
      id v73 = v15;
      id v74 = v14;
      v78 = &v97;
      v79 = &v137;
      v80 = &v120;
      v81 = &v103;
      id v68 = v21;
      id v75 = v68;
      id v67 = v70;
      id v76 = v67;
      id v28 = v22;
      id v77 = v28;
      v82 = &v142;
      v83 = &v150;
      v84 = v141;
      v85 = &v146;
      v86 = &v125;
      v87 = &v133;
      v88 = v124;
      v89 = &v129;
      v90 = &v108;
      v91 = &v116;
      v92 = v107;
      v93 = &v112;
      v94 = &v154;
      int64_t v95 = a7;
      uint64_t v96 = v27;
      [v73 readTransaction:v72];
      [v28 writeToFile:v13 atomically:1 encoding:4 error:0];
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@" ┗━━━━━━┷━━━━━━┷━━━━━━┷━━━━━━┻━━━━━━┷━━━━━━┷━━━━━━┷━━━━━━┻━━━━━━┷━━━━━━┷━━━━━━┷━━━━━━┛\n"];
      puts((const char *)[v29 UTF8String]);

      unint64_t v30 = v143[3];
      double v71 = 0.0;
      double v31 = 0.0;
      double v32 = 0.0;
      double v33 = 0.0;
      unint64_t v34 = v151[3] + v30;
      if (v34)
      {
        unint64_t v35 = v147[3] + v30;
        if (v35)
        {
          id v36 = objc_alloc((Class)NSString);
          double v37 = (float)v30 * 100.0;
          float v38 = v37 / (float)v35;
          *(float *)&double v37 = v37 / (float)v34;
          double v31 = *(float *)&v37;
          double v32 = v38;
          id v39 = objc_msgSend(v36, "initWithFormat:", @" Omitted recipient detection is at %.1f%% of precision and %.1f%% of recall", *(float *)&v37, v38);
          puts((const char *)[v39 UTF8String]);

          float v40 = (float)(unint64_t)v138[3] * 100.0 / (float)(unint64_t)v155[3];
          double v33 = v40;
        }
      }
      unint64_t v41 = v126[3];
      unint64_t v42 = v134[3] + v41;
      if (v42)
      {
        double v43 = 0.0;
        double v44 = 0.0;
        unint64_t v45 = v130[3] + v41;
        if (v45)
        {
          id v46 = objc_alloc((Class)NSString);
          double v47 = (float)v41 * 100.0;
          float v48 = v47 / (float)v45;
          *(float *)&double v47 = v47 / (float)v42;
          double v43 = v48;
          double v71 = *(float *)&v47;
          id v49 = objc_msgSend(v46, "initWithFormat:", @"Omitted attachment detection is at %.1f%% of precision and %.1f%% of recall", *(float *)&v47, v48);
          puts((const char *)[v49 UTF8String]);

          float v50 = (float)(unint64_t)v121[3] * 100.0 / (float)(unint64_t)v155[3];
          double v44 = v50;
        }
      }
      else
      {
        double v43 = 0.0;
        double v44 = 0.0;
      }
      unint64_t v52 = v109[3];
      double v53 = 0.0;
      unint64_t v54 = v117[3] + v52;
      if (v54)
      {
        double v55 = 0.0;
        double v56 = 0.0;
        unint64_t v57 = v113[3] + v52;
        if (v57)
        {
          id v58 = objc_alloc((Class)NSString);
          double v59 = (float)v52 * 100.0;
          float v60 = v59 / (float)v57;
          *(float *)&double v59 = v59 / (float)v54;
          double v53 = *(float *)&v59;
          double v55 = v60;
          id v61 = objc_msgSend(v58, "initWithFormat:", @" Should Follow-up detection is at %.1f%% of precision and %.1f%% of recall", *(float *)&v59, v60);
          puts((const char *)[v61 UTF8String]);

          float v62 = (float)(unint64_t)v104[3] * 100.0 / (float)(unint64_t)v155[3];
          double v56 = v62;
        }
      }
      else
      {
        double v55 = 0.0;
        double v56 = 0.0;
      }
      id v63 = [objc_alloc((Class)NSString) initWithFormat:@"-- CSV stats --"];
      puts((const char *)[v63 UTF8String]);

      id v64 = [objc_alloc((Class)NSString) initWithFormat:@"language,processedRecordsCount,omittedRecipientPrecision,omittedRecipientRecall,omittedRecipientVerifiedDataRatio,omittedAttachmentPrecision,omittedAttachmentRecall,omittedAttachmentVerifiedDataRatio,followUpPrecision,followUpRecall,followUpVerifiedDataRatio"];
      puts((const char *)[v64 UTF8String]);

      id v65 = objc_alloc((Class)NSString);
      id v66 = [v65 initWithFormat:@"%@,%lu,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f", v98[5], v155[3], *(void *)&v31, *(void *)&v32, *(void *)&v33, *(void *)&v71, *(void *)&v43, *(void *)&v44, *(void *)&v53, *(void *)&v55, *(void *)&v56];
      puts((const char *)[v66 UTF8String]);

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(&v103, 8);
      _Block_object_dispose(v107, 8);
      _Block_object_dispose(&v108, 8);
      _Block_object_dispose(&v112, 8);
      _Block_object_dispose(&v116, 8);
      _Block_object_dispose(&v120, 8);
      _Block_object_dispose(v124, 8);
      _Block_object_dispose(&v125, 8);
      _Block_object_dispose(&v129, 8);
      _Block_object_dispose(&v133, 8);
      _Block_object_dispose(&v137, 8);
      _Block_object_dispose(v141, 8);
      _Block_object_dispose(&v142, 8);
      _Block_object_dispose(&v146, 8);
      _Block_object_dispose(&v150, 8);
      _Block_object_dispose(&v154, 8);

      id v12 = v69;
    }
    else
    {
      id v51 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to create a file at path %@", v13];
      puts((const char *)[v51 UTF8String]);
    }
  }
  else
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"Unable to create the _PASSqliteDatabase from %@", v11];
    puts((const char *)[v16 UTF8String]);
  }
}

+ (void)incrementalSubmodelUpdateOnSearchableItems:(id)a3
{
  id v5 = a3;
  id v9 = +[SGMISaliencyModelConfig defaultConfig];
  if (!v9)
  {
    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"SGMISuggestToolHelpers.m", 451, @"Invalid parameter not satisfying: %@", @"config != nil" object file lineNumber description];
  }
  v6 = +[SGSqlEntityStore defaultStore];
  v7 = +[NSDate dateWithTimeIntervalSinceNow:-1.0];
  +[SGMISubmodelsManager incrementalSubmodelUpdateWithSaliencyModelConfig:v9 store:v6 shouldContinue:&stru_10005AF08 finalGroundTruthDate:v7 withSimulatedCSSearchableItemForTesting:v5 limit:kDefaultIncrementalUpdateLimit];
}

+ (id)fakeDataWithTrainingCount:(unint64_t)a3 testingCount:(unint64_t)a4
{
  unint64_t v4 = a4 + a3;
  id v5 = objc_opt_new();
  [v5 setNumberStyle:5];
  v6 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
  double v56 = v5;
  [v5 setLocale:v6];

  v68[0] = @"train";
  v7 = objc_opt_new();
  v69[0] = v7;
  v68[1] = @"test";
  v8 = objc_opt_new();
  v69[1] = v8;
  id v55 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

  unint64_t v53 = v4;
  if (v4)
  {
    unint64_t v9 = 0;
    v10 = CNContactEmailAddressesKey;
    id v11 = &CFPreferencesCopyKeyList_ptr;
    id v12 = &CFPreferencesCopyKeyList_ptr;
    do
    {
      unint64_t v13 = v9 & 1;
      unint64_t v14 = v9;
      unint64_t v63 = v9;
      unint64_t v57 = v9 & 3;
      v15 = @"ignorable";
      if ((v9 & 3) == 0) {
        v15 = @"salient";
      }
      id v16 = v15;
      id v17 = objc_opt_new();
      id v18 = objc_alloc((Class)NSString);
      +[NSDate timeIntervalSinceReferenceDate];
      id v20 = objc_msgSend(v18, "initWithFormat:", @"message-%.0f-%lu", v19, v14);
      v21 = [v17 attributeSet];
      [v21 setMailMessageID:v20];

      id v22 = objc_alloc((Class)v11[213]);
      id v59 = [objc_alloc((Class)NSString) initWithFormat:@"%@ contact %lu", v16, v13];
      unint64_t v61 = v13;
      id v64 = v16;
      id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%@-%lu@apple.com", v16, v13];
      id v66 = v23;
      id v24 = [v12[238] arrayWithObjects:&v66 count:1];
      id v25 = [v22 initWithDisplayName:v59 handles:v24 handleIdentifier:v10];
      id v67 = v25;
      [v12[238] arrayWithObjects:&v67 count:1];
      v27 = id v26 = v11;
      id v58 = v17;
      id v28 = [v17 attributeSet];
      [v28 setAuthors:v27];

      id v29 = objc_opt_new();
      id v30 = [objc_alloc((Class)v26[213]) initWithDisplayName:@"You" handles:&off_100064AB8 handleIdentifier:v10];
      [v29 addObject:v30];

      unint64_t v60 = v63 % 5;
      if (v63 % 5)
      {
        unint64_t v31 = 0;
        do
        {
          id v32 = objc_alloc((Class)v26[213]);
          id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%@ recipient contact %lu", v64, v61 + v31];
          id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%@-recipient-%lu@apple.com", v64, v61 + v31];
          id v65 = v34;
          unint64_t v35 = +[NSArray arrayWithObjects:&v65 count:1];
          id v36 = [v32 initWithDisplayName:v33 handles:v35 handleIdentifier:v10];
          [v29 addObject:v36];

          ++v31;
        }
        while (v31 < v60);
      }
      double v37 = [v58 attributeSet];
      [v37 setPrimaryRecipients:v29];

      float v38 = +[NSDate dateWithTimeIntervalSinceNow:(double)v63 + -86400.0];
      id v39 = [v58 attributeSet];
      [v39 setContentCreationDate:v38];

      float v62 = objc_opt_new();
      for (uint64_t i = 0; i != 7; ++i)
      {
        unint64_t v41 = +[NSNumber numberWithUnsignedInteger:(v63 + i) % 0x28 + (v63 + i) % 0xA];
        unint64_t v42 = [v56 stringFromNumber:v41];

        id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v64, v42];
        double v44 = [v43 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10005B0F8];
        [v62 addObject:v44];
      }
      unint64_t v45 = [v62 componentsJoinedByString:@" "];
      id v46 = [v58 attributeSet];
      [v46 setSubject:v45];

      if (v63 >= a3)
      {
        float v48 = +[NSNumber numberWithUnsignedInteger:v57 == 0];
        id v49 = [v58 attributeSet];
        [v49 setMailRepliedTo:v48];
        CFStringRef v50 = @"test";
      }
      else
      {
        if (v60) {
          BOOL v47 = v57 == 0;
        }
        else {
          BOOL v47 = v57 != 0;
        }
        float v48 = +[NSNumber numberWithUnsignedInteger:v47];
        id v49 = [v58 attributeSet];
        [v49 setMailRepliedTo:v48];
        CFStringRef v50 = @"train";
      }

      id v51 = [v55 objectForKeyedSubscript:v50];
      [v51 addObject:v58];

      unint64_t v9 = v63 + 1;
      v10 = CNContactEmailAddressesKey;
      id v11 = &CFPreferencesCopyKeyList_ptr;
      id v12 = &CFPreferencesCopyKeyList_ptr;
    }
    while (v63 + 1 != v53);
  }

  return v55;
}

+ (id)jsonFormattedStats
{
  v3 = +[SGSqlEntityStore defaultStore];
  unint64_t v4 = [v3 subModelsStats];
  id v5 = objc_opt_new();
  [v5 appendString:@"{\n"];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_10003AA74;
  v21 = &unk_10005AEC8;
  id v6 = v5;
  id v22 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:&v18];
  v7 = objc_opt_new();
  id v8 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v7 setLocale:v8];

  [v7 setDateFormat:@"MMM,dd"];
  id v9 = objc_alloc((Class)NSString);
  v10 = [a1 jsonFormattedAccuracyStats];
  id v11 = [v9 initWithFormat:@"  \"accuracy\": %@,", v10, v18, v19, v20, v21];
  [v6 appendString:v11];

  id v12 = objc_alloc((Class)NSString);
  unint64_t v13 = +[NSDate date];
  unint64_t v14 = [v7 stringFromDate:v13];
  id v15 = [v12 initWithFormat:@"  \"statsDumpedOn\": \"%@\"\n}", v14];
  [v6 appendString:v15];

  id v16 = v6;
  return v16;
}

+ (id)jsonFormattedAccuracyStats
{
  v2 = +[SGSqlEntityStore defaultStore];
  uint64_t v3 = [v2 getInt64NSNumberForKey:kTotalSGMITruePositivePredictions];
  unint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (_UNKNOWN **)v3;
  }
  else {
    id v5 = &off_100064C80;
  }
  id v6 = v5;

  uint64_t v7 = [v2 getInt64NSNumberForKey:kTotalSGMIFalsePositivePredictions];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (_UNKNOWN **)v7;
  }
  else {
    id v9 = &off_100064C80;
  }
  v10 = v9;

  uint64_t v11 = [v2 getInt64NSNumberForKey:kTotalSGMITrueNegativePredictions];
  id v12 = (void *)v11;
  if (v11) {
    unint64_t v13 = (_UNKNOWN **)v11;
  }
  else {
    unint64_t v13 = &off_100064C80;
  }
  unint64_t v14 = v13;

  uint64_t v15 = [v2 getInt64NSNumberForKey:kTotalSGMIFalseNegativePredictions];
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (_UNKNOWN **)v15;
  }
  else {
    id v17 = &off_100064C80;
  }
  id v18 = v17;

  unsigned int v19 = [v6 intValue];
  unsigned int v20 = [v10 intValue] + v19;
  unsigned int v21 = [v14 intValue];
  if ((int)(v20 + v21 + [v18 intValue]) < 1)
  {
    id v36 = @"{}";
  }
  else
  {
    unsigned int v22 = [v6 intValue];
    double v23 = 0.0;
    double v24 = 0.0;
    if ((int)([v10 intValue] + v22) >= 1)
    {
      [v6 doubleValue];
      double v26 = v25 * 100.0;
      [v6 doubleValue];
      double v28 = v27;
      [v10 doubleValue];
      double v24 = v26 / (v28 + v29);
    }
    unsigned int v30 = [v6 intValue];
    if ((int)([v18 intValue] + v30) >= 1)
    {
      [v6 doubleValue];
      double v32 = v31 * 100.0;
      [v6 doubleValue];
      double v34 = v33;
      [v18 doubleValue];
      double v23 = v32 / (v34 + v35);
    }
    id v36 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"{\"precision\": \"%.1f%%\", \"recall\": \"%.1f%%\", \"tp\": %d\", \"fp\": %d\", \"tn\": %d\", \"fn\": %d\"}", *(void *)&v24, *(void *)&v23, objc_msgSend(v6, "intValue"), objc_msgSend(v10, "intValue"), objc_msgSend(v14, "intValue"), objc_msgSend(v18, "intValue")];
  }

  return v36;
}

@end