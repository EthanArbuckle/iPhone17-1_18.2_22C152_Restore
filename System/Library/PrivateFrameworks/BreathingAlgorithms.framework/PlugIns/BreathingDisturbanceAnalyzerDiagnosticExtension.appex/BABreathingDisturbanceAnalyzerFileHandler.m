@interface BABreathingDisturbanceAnalyzerFileHandler
+ (id)filePath:(id)a3 withPrefixFilename:(id)a4;
+ (void)deleteLogsForLiveOnUsers;
+ (void)writeAnalysisToJsonFile:(BABreathingDisturbanceAnalysis *)a3 withOutputFilePath:(id)a4;
+ (void)writeSamplesToJsonFile:(id)a3 withDateInterval:(id)a4 withOutputFilePath:(id)a5;
@end

@implementation BABreathingDisturbanceAnalyzerFileHandler

+ (void)deleteLogsForLiveOnUsers
{
  v2 = sub_100005780();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v9 = @"/var/mobile/Library/Logs/HealthAlgorithms/BreathingAlgorithms";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to remove directory: %{public}@", buf, 0xCu);
  }

  v3 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned int v4 = [v3 removeItemAtPath:@"/var/mobile/Library/Logs/HealthAlgorithms/BreathingAlgorithms" error:&v7];
  id v5 = v7;

  if (v4)
  {
    v6 = sub_100005780();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v9 = @"/var/mobile/Library/Logs/HealthAlgorithms/BreathingAlgorithms";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "deleted %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v6 = sub_100005780();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000F3C4((uint64_t)v5, v6);
    }
  }
}

+ (id)filePath:(id)a3 withPrefixFilename:(id)a4
{
  id v5 = a3;
  v6 = [a4 stringByAppendingString:@"-breathing-disturbance.json"];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

+ (void)writeSamplesToJsonFile:(id)a3 withDateInterval:(id)a4 withOutputFilePath:(id)a5
{
  id v31 = a3;
  id v33 = a4;
  id v32 = a5;
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  v53[0] = 0;
  v54 = 0;
  sub_10000AB94((uint64_t)v53);
  sub_10000AB94((uint64_t)v53);
  v8 = [v33 startDate];
  id v36 = v7;
  id v9 = [v7 stringFromDate:v8];
  v73[0] = (char *)[v9 UTF8String];
  sub_10000BC00((uint64_t)v51, v73);
  v10 = sub_1000062A0(v53, "queryStart");
  sub_10000AB94((uint64_t)v51);
  unsigned __int8 v11 = *(unsigned char *)v10;
  *(unsigned char *)v10 = v51[0];
  v51[0] = v11;
  v12 = (uint64_t *)v10[1];
  v10[1] = (uint64_t)v52;
  v52 = v12;
  sub_10000AB94((uint64_t)v10);
  sub_10000AB94((uint64_t)v51);
  sub_10000AC70(&v52, v51[0]);

  v13 = [v33 endDate];
  id v14 = [v7 stringFromDate:v13];
  v73[0] = (char *)[v14 UTF8String];
  sub_10000BC00((uint64_t)v49, v73);
  v15 = sub_1000062A0(v53, "queryEnd");
  sub_10000AB94((uint64_t)v49);
  unsigned __int8 v16 = *(unsigned char *)v15;
  *(unsigned char *)v15 = v49[0];
  v49[0] = v16;
  v17 = (uint64_t *)v15[1];
  v15[1] = (uint64_t)v50;
  v50 = v17;
  sub_10000AB94((uint64_t)v15);
  sub_10000AB94((uint64_t)v49);
  sub_10000AC70(&v50, v49[0]);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v31;
  id v18 = [obj countByEnumeratingWithState:&v45 objects:v80 count:16];
  if (v18)
  {
    uint64_t v35 = *(void *)v46;
    do
    {
      v19 = 0;
      id v37 = v18;
      do
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v19);
        sub_10000BC98((uint64_t)v67, "bd");
        v68 = v67;
        char v69 = 1;
        v21 = [v20 quantity];
        +[HKUnit countUnit];
        v40 = v39 = v21;
        objc_msgSend(v21, "doubleValueForUnit:");
        *(float *)&double v22 = v22;
        v70[0] = 7;
        v71[0] = *(float *)&v22;
        sub_10000AB94((uint64_t)v70);
        sub_10000AB94((uint64_t)v70);
        *(void *)&v71[1] = v70;
        char v72 = 1;
        sub_10000BE60((uint64_t)v73, (uint64_t)v67, 2, 1, 2);
        v73[2] = (char *)v73;
        char v74 = 1;
        sub_10000BD30((uint64_t)v61, "start");
        v62 = v61;
        char v63 = 1;
        v38 = [v20 startDate];
        objc_msgSend(v7, "stringFromDate:");
        id v23 = objc_claimAutoreleasedReturnValue();
        v42 = (char *)[v23 UTF8String];
        sub_10000BC00((uint64_t)v64, &v42);
        v65 = v64;
        char v66 = 1;
        sub_10000BE60((uint64_t)v75, (uint64_t)v61, 2, 1, 2);
        v75[2] = v75;
        char v76 = 1;
        sub_10000BDC8((uint64_t)v55, "end");
        v56 = v55;
        char v57 = 1;
        v24 = [v20 endDate];
        id v25 = [v7 stringFromDate:v24];
        v41 = (char *)[v25 UTF8String];
        sub_10000BC00((uint64_t)v58, &v41);
        v59 = v58;
        char v60 = 1;
        uint64_t v78 = sub_10000BE60((uint64_t)v77, (uint64_t)v55, 2, 1, 2);
        char v79 = 1;
        sub_10000BE60((uint64_t)v43, (uint64_t)v73, 3, 1, 2);
        for (uint64_t i = 0; i != -96; i -= 32)
        {
          sub_10000AB94((uint64_t)&v77[i]);
          sub_10000AC70((uint64_t **)&v77[i + 8], v77[i]);
        }
        for (uint64_t j = 0; j != -64; j -= 32)
        {
          sub_10000AB94((uint64_t)&v58[j]);
          sub_10000AC70((uint64_t **)&v58[j + 8], v58[j]);
        }

        id v7 = v36;
        for (uint64_t k = 0; k != -64; k -= 32)
        {
          sub_10000AB94((uint64_t)&v64[k]);
          sub_10000AC70((uint64_t **)&v64[k + 8], v64[k]);
        }

        for (uint64_t m = 0; m != -8; m -= 4)
        {
          sub_10000AB94((uint64_t)&v70[m * 8]);
          sub_10000AC70((uint64_t **)&v71[m], v70[m * 8]);
        }

        v30 = sub_1000062A0(v53, "samples");
        sub_10000647C((uint64_t)v30, (uint64_t)v43);
        sub_10000AB94((uint64_t)v43);
        sub_10000AC70(&v44, v43[0]);
        v19 = (char *)v19 + 1;
      }
      while (v19 != v37);
      id v18 = [obj countByEnumeratingWithState:&v45 objects:v80 count:16];
    }
    while (v18);
  }

  sub_1000065D0((uint64_t)v53, v32);
  sub_10000AB94((uint64_t)v53);
  sub_10000AC70(&v54, v53[0]);
}

+ (void)writeAnalysisToJsonFile:(BABreathingDisturbanceAnalysis *)a3 withOutputFilePath:(id)a4
{
  id v5 = a4;
  v104[0] = 0;
  v105 = 0;
  sub_10000AB94((uint64_t)v104);
  sub_10000AB94((uint64_t)v104);
  [a3->var0 doubleValue];
  v102[0] = 7;
  v103 = v6;
  sub_10000AB94((uint64_t)v102);
  sub_10000AB94((uint64_t)v102);
  id v7 = sub_1000062A0(v104, "algorithmVersion");
  sub_10000AB94((uint64_t)v102);
  unsigned __int8 v8 = *(unsigned char *)v7;
  *(unsigned char *)id v7 = v102[0];
  v102[0] = v8;
  id v9 = (uint64_t *)v7[1];
  v7[1] = (uint64_t)v103;
  v103 = v9;
  sub_10000AB94((uint64_t)v7);
  sub_10000AB94((uint64_t)v102);
  sub_10000AC70(&v103, v102[0]);
  BOOL var2 = a3->var2;
  v100[0] = 4;
  v101 = (uint64_t *)var2;
  sub_10000AB94((uint64_t)v100);
  sub_10000AB94((uint64_t)v100);
  unsigned __int8 v11 = sub_1000062A0(v104, "sleepApneaDetected");
  sub_10000AB94((uint64_t)v100);
  unsigned __int8 v12 = *(unsigned char *)v11;
  *(unsigned char *)unsigned __int8 v11 = v100[0];
  v100[0] = v12;
  v13 = (uint64_t *)v11[1];
  v11[1] = (uint64_t)v101;
  v101 = v13;
  sub_10000AB94((uint64_t)v11);
  sub_10000AB94((uint64_t)v100);
  sub_10000AC70(&v101, v100[0]);
  id v14 = [a3->var1 objectForKeyedSubscript:@"notification_status"];
  v98[0] = 5;
  v99 = (uint64_t *)(int)[v14 intValue];
  sub_10000AB94((uint64_t)v98);
  sub_10000AB94((uint64_t)v98);
  v15 = sub_1000062A0(v104, "coreAnalytics");
  unsigned __int8 v16 = sub_1000062A0((unsigned __int8 *)v15, "notification_status");
  sub_10000AB94((uint64_t)v98);
  unsigned __int8 v17 = *(unsigned char *)v16;
  *(unsigned char *)unsigned __int8 v16 = v98[0];
  v98[0] = v17;
  id v18 = (uint64_t *)v16[1];
  v16[1] = (uint64_t)v99;
  v99 = v18;
  sub_10000AB94((uint64_t)v16);
  sub_10000AB94((uint64_t)v98);
  sub_10000AC70(&v99, v98[0]);

  v19 = [a3->var1 objectForKeyedSubscript:@"percent_bd_at_least_10"];
  [v19 floatValue];
  v96[0] = 7;
  double v97 = v20;
  sub_10000AB94((uint64_t)v96);
  sub_10000AB94((uint64_t)v96);
  v21 = sub_1000062A0(v104, "coreAnalytics");
  double v22 = sub_1000062A0((unsigned __int8 *)v21, "percent_bd_at_least_10");
  sub_10000AB94((uint64_t)v96);
  unsigned __int8 v23 = *(unsigned char *)v22;
  *(unsigned char *)double v22 = v96[0];
  v96[0] = v23;
  v24 = (uint64_t *)v22[1];
  *((double *)v22 + 1) = v97;
  double v97 = *(double *)&v24;
  sub_10000AB94((uint64_t)v22);
  sub_10000AB94((uint64_t)v96);
  sub_10000AC70((uint64_t **)&v97, v96[0]);

  id v25 = [a3->var1 objectForKeyedSubscript:@"percent_bd_at_least_11"];
  [v25 floatValue];
  v94[0] = 7;
  double v95 = v26;
  sub_10000AB94((uint64_t)v94);
  sub_10000AB94((uint64_t)v94);
  v27 = sub_1000062A0(v104, "coreAnalytics");
  v28 = sub_1000062A0((unsigned __int8 *)v27, "percent_bd_at_least_11");
  sub_10000AB94((uint64_t)v94);
  unsigned __int8 v29 = *(unsigned char *)v28;
  *(unsigned char *)v28 = v94[0];
  v94[0] = v29;
  v30 = (uint64_t *)v28[1];
  *((double *)v28 + 1) = v95;
  double v95 = *(double *)&v30;
  sub_10000AB94((uint64_t)v28);
  sub_10000AB94((uint64_t)v94);
  sub_10000AC70((uint64_t **)&v95, v94[0]);

  id v31 = [a3->var1 objectForKeyedSubscript:@"percent_bd_at_least_12"];
  [v31 floatValue];
  v92[0] = 7;
  double v93 = v32;
  sub_10000AB94((uint64_t)v92);
  sub_10000AB94((uint64_t)v92);
  id v33 = sub_1000062A0(v104, "coreAnalytics");
  v34 = sub_1000062A0((unsigned __int8 *)v33, "percent_bd_at_least_12");
  sub_10000AB94((uint64_t)v92);
  unsigned __int8 v35 = *(unsigned char *)v34;
  *(unsigned char *)v34 = v92[0];
  v92[0] = v35;
  id v36 = (uint64_t *)v34[1];
  *((double *)v34 + 1) = v93;
  double v93 = *(double *)&v36;
  sub_10000AB94((uint64_t)v34);
  sub_10000AB94((uint64_t)v92);
  sub_10000AC70((uint64_t **)&v93, v92[0]);

  id v37 = [a3->var1 objectForKeyedSubscript:@"percent_bd_at_least_13"];
  [v37 floatValue];
  v90[0] = 7;
  double v91 = v38;
  sub_10000AB94((uint64_t)v90);
  sub_10000AB94((uint64_t)v90);
  v39 = sub_1000062A0(v104, "coreAnalytics");
  v40 = sub_1000062A0((unsigned __int8 *)v39, "percent_bd_at_least_13");
  sub_10000AB94((uint64_t)v90);
  unsigned __int8 v41 = *(unsigned char *)v40;
  *(unsigned char *)v40 = v90[0];
  v90[0] = v41;
  v42 = (uint64_t *)v40[1];
  *((double *)v40 + 1) = v91;
  double v91 = *(double *)&v42;
  sub_10000AB94((uint64_t)v40);
  sub_10000AB94((uint64_t)v90);
  sub_10000AC70((uint64_t **)&v91, v90[0]);

  v43 = [a3->var1 objectForKeyedSubscript:@"bd_count"];
  v88[0] = 5;
  v89 = (uint64_t *)(int)[v43 intValue];
  sub_10000AB94((uint64_t)v88);
  sub_10000AB94((uint64_t)v88);
  v44 = sub_1000062A0(v104, "coreAnalytics");
  long long v45 = sub_1000062A0((unsigned __int8 *)v44, "bd_count");
  sub_10000AB94((uint64_t)v88);
  unsigned __int8 v46 = *(unsigned char *)v45;
  *(unsigned char *)long long v45 = v88[0];
  v88[0] = v46;
  long long v47 = (uint64_t *)v45[1];
  v45[1] = (uint64_t)v89;
  v89 = v47;
  sub_10000AB94((uint64_t)v45);
  sub_10000AB94((uint64_t)v88);
  sub_10000AC70(&v89, v88[0]);

  long long v48 = [a3->var1 objectForKeyedSubscript:@"bd_median"];
  [v48 floatValue];
  v86[0] = 7;
  double v87 = v49;
  sub_10000AB94((uint64_t)v86);
  sub_10000AB94((uint64_t)v86);
  v50 = sub_1000062A0(v104, "coreAnalytics");
  v51 = sub_1000062A0((unsigned __int8 *)v50, "bd_median");
  sub_10000AB94((uint64_t)v86);
  unsigned __int8 v52 = *(unsigned char *)v51;
  *(unsigned char *)v51 = v86[0];
  v86[0] = v52;
  v53 = (uint64_t *)v51[1];
  *((double *)v51 + 1) = v87;
  double v87 = *(double *)&v53;
  sub_10000AB94((uint64_t)v51);
  sub_10000AB94((uint64_t)v86);
  sub_10000AC70((uint64_t **)&v87, v86[0]);

  v54 = [a3->var1 objectForKeyedSubscript:@"bd_mean"];
  [v54 floatValue];
  v84[0] = 7;
  double v85 = v55;
  sub_10000AB94((uint64_t)v84);
  sub_10000AB94((uint64_t)v84);
  v56 = sub_1000062A0(v104, "coreAnalytics");
  char v57 = sub_1000062A0((unsigned __int8 *)v56, "bd_mean");
  sub_10000AB94((uint64_t)v84);
  unsigned __int8 v58 = *(unsigned char *)v57;
  *(unsigned char *)char v57 = v84[0];
  v84[0] = v58;
  v59 = (uint64_t *)v57[1];
  *((double *)v57 + 1) = v85;
  double v85 = *(double *)&v59;
  sub_10000AB94((uint64_t)v57);
  sub_10000AB94((uint64_t)v84);
  sub_10000AC70((uint64_t **)&v85, v84[0]);

  char v60 = [a3->var1 objectForKeyedSubscript:@"bd_standard_deviation"];
  [v60 floatValue];
  v82[0] = 7;
  double v83 = v61;
  sub_10000AB94((uint64_t)v82);
  sub_10000AB94((uint64_t)v82);
  v62 = sub_1000062A0(v104, "coreAnalytics");
  char v63 = sub_1000062A0((unsigned __int8 *)v62, "bd_standard_deviation");
  sub_10000AB94((uint64_t)v82);
  unsigned __int8 v64 = *(unsigned char *)v63;
  *(unsigned char *)char v63 = v82[0];
  v82[0] = v64;
  v65 = (uint64_t *)v63[1];
  *((double *)v63 + 1) = v83;
  double v83 = *(double *)&v65;
  sub_10000AB94((uint64_t)v63);
  sub_10000AB94((uint64_t)v82);
  sub_10000AC70((uint64_t **)&v83, v82[0]);

  char v66 = [a3->var1 objectForKeyedSubscript:@"bd_maximum"];
  [v66 floatValue];
  v80[0] = 7;
  double v81 = v67;
  sub_10000AB94((uint64_t)v80);
  sub_10000AB94((uint64_t)v80);
  v68 = sub_1000062A0(v104, "coreAnalytics");
  char v69 = sub_1000062A0((unsigned __int8 *)v68, "bd_maximum");
  sub_10000AB94((uint64_t)v80);
  unsigned __int8 v70 = *(unsigned char *)v69;
  *(unsigned char *)char v69 = v80[0];
  v80[0] = v70;
  v71 = (uint64_t *)v69[1];
  *((double *)v69 + 1) = v81;
  double v81 = *(double *)&v71;
  sub_10000AB94((uint64_t)v69);
  sub_10000AB94((uint64_t)v80);
  sub_10000AC70((uint64_t **)&v81, v80[0]);

  char v72 = [a3->var1 objectForKeyedSubscript:@"bd_minimum"];
  [v72 floatValue];
  v78[0] = 7;
  double v79 = v73;
  sub_10000AB94((uint64_t)v78);
  sub_10000AB94((uint64_t)v78);
  char v74 = sub_1000062A0(v104, "coreAnalytics");
  v75 = sub_1000062A0((unsigned __int8 *)v74, "bd_minimum");
  sub_10000AB94((uint64_t)v78);
  unsigned __int8 v76 = *(unsigned char *)v75;
  *(unsigned char *)v75 = v78[0];
  v78[0] = v76;
  v77 = (uint64_t *)v75[1];
  *((double *)v75 + 1) = v79;
  double v79 = *(double *)&v77;
  sub_10000AB94((uint64_t)v75);
  sub_10000AB94((uint64_t)v78);
  sub_10000AC70((uint64_t **)&v79, v78[0]);

  sub_1000065D0((uint64_t)v104, v5);
  sub_10000AB94((uint64_t)v104);
  sub_10000AC70(&v105, v104[0]);
}

@end