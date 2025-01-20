@interface UsageProfileController
- (id)stringFromDate:(id)a3;
- (void)parseLogsWithCollector:(id)a3;
- (void)start;
@end

@implementation UsageProfileController

- (void)start
{
  id v3 = [objc_alloc((Class)DSGeneralLogCollector) initWithLogIDs:&off_1000042F8];
  if (([(UsageProfileController *)self isCancelled] & 1) == 0) {
    [(UsageProfileController *)self parseLogsWithCollector:v3];
  }
  [(UsageProfileController *)self setFinished:1];
}

- (void)parseLogsWithCollector:(id)a3
{
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = sub_10000353C;
  v63 = sub_10000354C;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10000353C;
  v57 = sub_10000354C;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_10000353C;
  v51 = sub_10000354C;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_10000353C;
  v45 = sub_10000354C;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_10000353C;
  v39 = sub_10000354C;
  id v40 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100003554;
  v34[3] = &unk_100004110;
  v34[4] = self;
  v34[5] = &v59;
  v34[6] = &v53;
  v34[7] = &v47;
  v34[8] = &v41;
  v34[9] = &v35;
  id v31 = a3;
  [v31 enumerateLogLinesWithBlock:v34];
  if ([(UsageProfileController *)self isCancelled])
  {
    v32 = 0;
    v33 = 0;
  }
  else
  {
    v4 = (void *)v60[5];
    if (v4)
    {
      id v5 = [v4 usageTime];
      id v6 = [(id)v60[5] standbyTime];
      id v7 = [(id)v60[5] batteryLevel];
    }
    else
    {
      id v7 = 0;
      id v6 = 0;
      id v5 = 0;
    }
    v8 = (void *)v54[5];
    if (v8)
    {
      id v9 = [v8 usageTime];
      id v10 = [(id)v54[5] batteryLevel];
      v33 = [(id)v54[5] date];
    }
    else
    {
      id v9 = 0;
      id v10 = 0;
      v33 = 0;
    }
    v11 = (void *)v48[5];
    if (v11)
    {
      HIDWORD(v27) = [v11 standbyTime];
      LODWORD(v27) = [(id)v48[5] batteryLevel];
      v32 = [(id)v48[5] date];
    }
    else
    {
      uint64_t v27 = 0;
      v32 = 0;
    }
    if (v42[5] && (v12 = (void *)v36[5]) != 0)
    {
      v13 = [v12 date];
      v14 = [(id)v42[5] date];
      [v13 timeIntervalSinceDate:v14];
      BOOL v16 = v15 > 0.0;
    }
    else
    {
      BOOL v16 = 0;
    }
    v65[0] = @"lastUsageLength";
    v30 = +[NSNumber numberWithInt:v5];
    v66[0] = v30;
    v65[1] = @"lastStandbyLength";
    v29 = +[NSNumber numberWithInt:v6];
    v66[1] = v29;
    v65[2] = @"batteryLevelAfterLastUsage";
    v28 = +[NSNumber numberWithInt:v7];
    v66[2] = v28;
    v65[3] = @"pluggedInAfterLastUsage";
    v17 = +[NSNumber numberWithBool:v16];
    v66[3] = v17;
    v65[4] = @"longestUsageLength";
    v18 = +[NSNumber numberWithInt:v9];
    v66[4] = v18;
    v65[5] = @"longestUsageDate";
    v19 = [(UsageProfileController *)self stringFromDate:v33];
    v66[5] = v19;
    v65[6] = @"batteryLevelAfterLongestUsage";
    v20 = +[NSNumber numberWithInt:v10];
    v66[6] = v20;
    v65[7] = @"longestStandbyDate";
    v21 = [(UsageProfileController *)self stringFromDate:v32];
    v66[7] = v21;
    v65[8] = @"longestStandbyLength";
    v22 = +[NSNumber numberWithInt:HIDWORD(v27)];
    v66[8] = v22;
    v65[9] = @"batteryLevelAfterLongestStandby";
    v23 = +[NSNumber numberWithInt:v27];
    v66[9] = v23;
    v24 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:10];
    v25 = [(UsageProfileController *)self result];
    [v25 setData:v24];

    v26 = [(UsageProfileController *)self result];
    [v26 setStatusCode:&off_100004310];
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
}

- (id)stringFromDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[DSDateFormatter sharedFormatter];
    id v5 = [v4 formatterWithType:0];
    id v6 = [v5 stringFromDate:v3];
    id v7 = stringOrNull(v6);
  }
  else
  {
    id v7 = +[NSNull null];
  }

  return v7;
}

@end