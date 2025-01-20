@interface AMDJSDebugDataSync
+ (id)testEventDeltaAlgorithm:(id *)a3;
+ (id)testNewDevicePayloadCreation:(id *)a3;
+ (id)testfullSyncDataIngestion:(id *)a3;
+ (id)testfullSyncInitiation:(id *)a3;
+ (id)testfullSyncRequestCompletion:(id *)a3;
@end

@implementation AMDJSDebugDataSync

+ (id)testNewDevicePayloadCreation:(id *)a3
{
  id v11 = a1;
  SEL v10 = a2;
  v9 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = &unk_26BEC3020;
  id location = +[AMDDataSync processDataReplicationPayload:v7 error:v9];
  if (*v9)
  {
    id v5 = (id)[*v9 localizedDescription];
    objc_msgSend(v8, "setObject:forKey:");

    id v12 = v8;
  }
  else
  {
    if (location) {
      [v8 setObject:location forKey:@"ckConfigSetup"];
    }
    else {
      [v8 setObject:@"nil response" forKey:@"ckResponseError"];
    }
    id v12 = v8;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  v3 = v12;

  return v3;
}

+ (id)testEventDeltaAlgorithm:(id *)a3
{
  v52[3] = *MEMORY[0x263EF8340];
  id v33 = a1;
  SEL v32 = a2;
  v31 = a3;
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v51[0] = @"drConfig";
  v52[0] = &unk_26BEC3048;
  v51[1] = @"deviceRegistry";
  v52[1] = &unk_26BEC3070;
  v51[2] = @"drData";
  v49[0] = @"__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257";
  v50[0] = &unk_26BEC3098;
  v49[1] = @"dev3";
  v47[0] = @"checkpoints";
  uint64_t v3 = MEMORY[0x263EFFA78];
  v48[0] = MEMORY[0x263EFFA78];
  v47[1] = @"bookmarks";
  v48[1] = MEMORY[0x263EFFA78];
  v47[2] = @"eventsDict";
  v45 = @"AppUsageDataCoreData";
  v42[0] = @"adamId";
  v43[0] = &unk_26BEC2210;
  v42[1] = @"appVersion";
  v43[1] = @"11.21.0";
  v42[2] = @"batteryUsage";
  v43[2] = &unk_26BEC21F8;
  v42[3] = @"deviceId";
  v43[3] = @"dev3";
  v42[4] = @"eventSubType";
  v43[4] = &unk_26BEC21F8;
  v42[5] = @"foregroundDuration";
  v43[5] = &unk_26BEC2228;
  v42[6] = @"latitude";
  v43[6] = &unk_26BEC21F8;
  v42[7] = @"locationAccuracy";
  v43[7] = &unk_26BEC21F8;
  v42[8] = @"longitude";
  v43[8] = &unk_26BEC21F8;
  v42[9] = @"networkType";
  v43[9] = &unk_26BEC21F8;
  v42[10] = @"platform";
  v43[10] = &unk_26BEC2240;
  v42[11] = @"storageUsed";
  v43[11] = &unk_26BEC21F8;
  v42[12] = @"time";
  id v7 = NSNumber;
  id v27 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v26 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v27, "longLongValue"));
  v43[12] = v26;
  v42[13] = @"timeZoneOffset";
  v43[13] = &unk_26BEC21F8;
  v42[14] = @"type";
  v43[14] = &unk_26BEC2258;
  v42[15] = @"userId";
  v43[15] = @"20160157686";
  id v25 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42);
  id v44 = v25;
  id v24 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v44);
  id v46 = v24;
  id v23 = (id)[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v48[2] = v23;
  v47[3] = @"lastUpdateTimeMilliSeconds";
  id v8 = NSNumber;
  id v22 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v21 = (id)objc_msgSend(v8, "numberWithLongLong:", 1000 * objc_msgSend(v22, "longLongValue"));
  v48[3] = v21;
  id v20 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47);
  v50[1] = v20;
  v49[2] = @"dev4";
  v40[0] = @"checkpoints";
  v41[0] = v3;
  v40[1] = @"bookmarks";
  v41[1] = v3;
  v40[2] = @"eventsDict";
  v38 = @"AppUsageDataCoreData";
  v35[0] = @"adamId";
  v36[0] = &unk_26BEC2270;
  v35[1] = @"appVersion";
  v36[1] = @"11.21.0";
  v35[2] = @"batteryUsage";
  v36[2] = &unk_26BEC21F8;
  v35[3] = @"deviceId";
  v36[3] = @"dev4";
  v35[4] = @"eventSubType";
  v36[4] = &unk_26BEC21F8;
  v35[5] = @"foregroundDuration";
  v36[5] = &unk_26BEC2228;
  v35[6] = @"latitude";
  v36[6] = &unk_26BEC21F8;
  v35[7] = @"locationAccuracy";
  v36[7] = &unk_26BEC21F8;
  v35[8] = @"longitude";
  v36[8] = &unk_26BEC21F8;
  v35[9] = @"networkType";
  v36[9] = &unk_26BEC21F8;
  v35[10] = @"platform";
  v36[10] = &unk_26BEC2240;
  v35[11] = @"storageUsed";
  v36[11] = &unk_26BEC21F8;
  v35[12] = @"time";
  v9 = NSNumber;
  id v19 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v18 = (id)objc_msgSend(v9, "numberWithLongLong:", 1000 * objc_msgSend(v19, "longLongValue"));
  v36[12] = v18;
  v35[13] = @"timeZoneOffset";
  v36[13] = &unk_26BEC21F8;
  v35[14] = @"type";
  v36[14] = &unk_26BEC2258;
  v35[15] = @"userId";
  v36[15] = @"20160157686";
  id v17 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:16];
  id v37 = v17;
  id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  id v39 = v16;
  id v15 = (id)[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v41[2] = v15;
  v40[3] = @"lastUpdateTimeMilliSeconds";
  SEL v10 = NSNumber;
  id v14 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v13 = (id)objc_msgSend(v10, "numberWithLongLong:", 1000 * objc_msgSend(v14, "longLongValue"));
  v41[3] = v13;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
  v50[2] = v12;
  id v11 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49);
  v52[2] = v11;
  id v29 = (id)[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];

  id location = +[AMDDataSync processDataReplicationPayload:v29 error:v31];
  if (*v31)
  {
    id v6 = (id)[*v31 localizedDescription];
    objc_msgSend(v30, "setObject:forKey:");

    id v34 = v30;
  }
  else
  {
    if (location) {
      [v30 setObject:location forKey:@"fsDataConsumption"];
    }
    else {
      [v30 setObject:@"nil response" forKey:@"drResponseError"];
    }
    id v34 = v30;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  v4 = v34;

  return v4;
}

+ (id)testfullSyncInitiation:(id *)a3
{
  v23[3] = *MEMORY[0x263EF8340];
  id v16 = a1;
  SEL v15 = a2;
  id v14 = a3;
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v22[0] = @"drConfig";
  v23[0] = &unk_26BEC30C0;
  v22[1] = @"deviceRegistry";
  v23[1] = &unk_26BEC30E8;
  v22[2] = @"drData";
  id v20 = @"dev2";
  v18[0] = @"checkpoints";
  v19[0] = MEMORY[0x263EFFA78];
  v18[1] = @"bookmarks";
  v19[1] = MEMORY[0x263EFFA78];
  v18[2] = @"eventsDict";
  v19[2] = &unk_26BEC3160;
  v18[3] = @"lastUpdateTimeMilliSeconds";
  id v6 = NSNumber;
  id v10 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v9 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v10, "longLongValue"));
  v19[3] = v9;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v21 = v8;
  id v7 = (id)[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[2] = v7;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  id location = +[AMDDataSync processDataReplicationPayload:v12 error:v14];
  if (*v14)
  {
    id v5 = (id)[*v14 localizedDescription];
    objc_msgSend(v13, "setObject:forKey:");

    id v17 = v13;
  }
  else
  {
    if (location) {
      [v13 setObject:location forKey:@"fsInitiation"];
    }
    else {
      [v13 setObject:@"nil response" forKey:@"drResponseError"];
    }
    id v17 = v13;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  uint64_t v3 = v17;

  return v3;
}

+ (id)testfullSyncDataIngestion:(id *)a3
{
  v67[3] = *MEMORY[0x263EF8340];
  id v42 = a1;
  SEL v41 = a2;
  v40 = a3;
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v66[0] = @"drConfig";
  v67[0] = &unk_26BEC3188;
  v66[1] = @"deviceRegistry";
  v67[1] = &unk_26BEC31B0;
  v66[2] = @"drData";
  v64[0] = @"dev2";
  v62[0] = @"checkpoints";
  uint64_t v11 = MEMORY[0x263EFFA78];
  v63[0] = MEMORY[0x263EFFA78];
  v62[1] = @"bookmarks";
  v63[1] = MEMORY[0x263EFFA78];
  v62[2] = @"eventsDict";
  v60 = @"AppUsageDataCoreData";
  v57[0] = @"adamId";
  v58[0] = &unk_26BEC2288;
  v57[1] = @"appVersion";
  v58[1] = @"11.21.0";
  v57[2] = @"batteryUsage";
  v58[2] = &unk_26BEC21F8;
  v57[3] = @"deviceId";
  v58[3] = @"undefined";
  v57[4] = @"eventSubType";
  v58[4] = &unk_26BEC21F8;
  v57[5] = @"foregroundDuration";
  v58[5] = &unk_26BEC22A0;
  v57[6] = @"latitude";
  v58[6] = &unk_26BEC21F8;
  v57[7] = @"locationAccuracy";
  v58[7] = &unk_26BEC21F8;
  v57[8] = @"longitude";
  v58[8] = &unk_26BEC21F8;
  v57[9] = @"networkType";
  v58[9] = &unk_26BEC21F8;
  v57[10] = @"platform";
  v58[10] = &unk_26BEC2240;
  v57[11] = @"storageUsed";
  v58[11] = &unk_26BEC21F8;
  v57[12] = @"time";
  id v6 = NSNumber;
  id v36 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v35 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v36, "longLongValue"));
  v58[12] = v35;
  v57[13] = @"timeZoneOffset";
  v58[13] = &unk_26BEC21F8;
  v57[14] = @"type";
  v58[14] = &unk_26BEC2258;
  v57[15] = @"userId";
  v58[15] = @"20160157686";
  id v34 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57);
  id v59 = v34;
  id v33 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v59);
  id v61 = v33;
  id v32 = (id)[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v63[2] = v32;
  v62[3] = @"lastUpdateTimeMilliSeconds";
  id v7 = NSNumber;
  id v31 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v30 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v31, "longLongValue"));
  v63[3] = v30;
  v62[4] = @"fullSyncResponse";
  v55[0] = @"targetUUID";
  v56[0] = @"__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257";
  v55[1] = @"events";
  v53 = @"AppUsageDataCoreData";
  v50[0] = @"adamId";
  v51[0] = &unk_26BEC2300;
  v50[1] = @"appVersion";
  v51[1] = @"11.21.0";
  v50[2] = @"batteryUsage";
  v51[2] = &unk_26BEC21F8;
  void v50[3] = @"deviceId";
  void v51[3] = @"dev2";
  v50[4] = @"eventSubType";
  v51[4] = &unk_26BEC21F8;
  v50[5] = @"foregroundDuration";
  v51[5] = &unk_26BEC2228;
  v50[6] = @"latitude";
  v51[6] = &unk_26BEC21F8;
  v50[7] = @"locationAccuracy";
  v51[7] = &unk_26BEC21F8;
  v50[8] = @"longitude";
  v51[8] = &unk_26BEC21F8;
  v50[9] = @"networkType";
  v51[9] = &unk_26BEC21F8;
  v50[10] = @"platform";
  v51[10] = &unk_26BEC2240;
  v50[11] = @"storageUsed";
  v51[11] = &unk_26BEC21F8;
  v50[12] = @"time";
  id v8 = NSNumber;
  id v29 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v28 = (id)objc_msgSend(v8, "numberWithLongLong:", 1000 * objc_msgSend(v29, "longLongValue"));
  v51[12] = v28;
  v50[13] = @"timeZoneOffset";
  v51[13] = &unk_26BEC21F8;
  v50[14] = @"type";
  v51[14] = &unk_26BEC2258;
  v50[15] = @"userId";
  v51[15] = @"20160157686";
  id v27 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:16];
  id v52 = v27;
  id v26 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
  id v54 = v26;
  id v25 = (id)[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  v56[1] = v25;
  id v24 = (id)[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v63[4] = v24;
  id v23 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62);
  v65[0] = v23;
  v64[1] = @"__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257";
  v48[0] = @"checkpoints";
  v49[0] = v11;
  v48[1] = @"bookmarks";
  v49[1] = v11;
  v48[2] = @"eventsDict";
  v49[2] = &unk_26BEC31D8;
  v48[3] = @"lastUpdateTimeMilliSeconds";
  id v9 = NSNumber;
  id v22 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v21 = (id)objc_msgSend(v9, "numberWithLongLong:", 1000 * objc_msgSend(v22, "longLongValue"));
  void v49[3] = v21;
  void v48[4] = @"fullSyncRequest";
  v46[0] = @"fsCheckpoint";
  v47[0] = v11;
  v46[1] = @"fsRequestTime";
  id v10 = NSNumber;
  id v20 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v19 = (id)objc_msgSend(v10, "numberWithLongLong:", 1000 * objc_msgSend(v20, "longLongValue"));
  v47[1] = v19;
  v46[2] = @"sourceUUID";
  v47[2] = @"dev2";
  id v18 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46);
  v49[4] = v18;
  id v17 = (id)[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:5];
  v65[1] = v17;
  v64[2] = @"dev3";
  v44[0] = @"checkpoints";
  v45[0] = v11;
  v44[1] = @"bookmarks";
  v45[1] = v11;
  v44[2] = @"eventsDict";
  v45[2] = &unk_26BEC3228;
  v44[3] = @"lastUpdateTimeMilliSeconds";
  id v12 = NSNumber;
  id v16 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v15 = (id)objc_msgSend(v12, "numberWithLongLong:", 1000 * objc_msgSend(v16, "longLongValue"));
  v45[3] = v15;
  id v14 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  v65[2] = v14;
  id v13 = (id)[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
  v67[2] = v13;
  id v38 = (id)[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];

  id location = +[AMDDataSync processDataReplicationPayload:v38 error:v40];
  if (*v40)
  {
    id v5 = (id)[*v40 localizedDescription];
    objc_msgSend(v39, "setObject:forKey:");

    id v43 = v39;
  }
  else
  {
    if (location) {
      [v39 setObject:location forKey:@"fsDataConsumption"];
    }
    else {
      [v39 setObject:@"nil response" forKey:@"drResponseError"];
    }
    id v43 = v39;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  uint64_t v3 = v43;

  return v3;
}

+ (id)testfullSyncRequestCompletion:(id *)a3
{
  void v47[3] = *MEMORY[0x263EF8340];
  id v31 = a1;
  SEL v30 = a2;
  id v29 = a3;
  id v28 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v46[0] = @"drConfig";
  v47[0] = &unk_26BEC3250;
  v46[1] = @"deviceRegistry";
  v47[1] = &unk_26BEC3278;
  v46[2] = @"drData";
  v44[0] = @"__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257";
  v42[0] = @"checkpoints";
  uint64_t v9 = MEMORY[0x263EFFA78];
  v43[0] = MEMORY[0x263EFFA78];
  v42[1] = @"bookmarks";
  v43[1] = MEMORY[0x263EFFA78];
  v42[2] = @"eventsDict";
  v43[2] = &unk_26BEC32A0;
  v42[3] = @"lastUpdateTimeMilliSeconds";
  id v6 = NSNumber;
  id v25 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v24 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v25, "longLongValue"));
  v43[3] = v24;
  id v23 = (id)[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:4];
  v45[0] = v23;
  v44[1] = @"dev3";
  v40[0] = @"checkpoints";
  v41[0] = v9;
  v40[1] = @"bookmarks";
  v41[1] = v9;
  v40[2] = @"eventsDict";
  id v38 = @"AppUsageDataCoreData";
  v35[0] = @"adamId";
  v36[0] = &unk_26BEC2210;
  v35[1] = @"appVersion";
  v36[1] = @"11.21.0";
  v35[2] = @"batteryUsage";
  v36[2] = &unk_26BEC21F8;
  v35[3] = @"deviceId";
  v36[3] = @"dev2";
  v35[4] = @"eventSubType";
  v36[4] = &unk_26BEC21F8;
  v35[5] = @"foregroundDuration";
  v36[5] = &unk_26BEC2228;
  v35[6] = @"latitude";
  v36[6] = &unk_26BEC21F8;
  v35[7] = @"locationAccuracy";
  v36[7] = &unk_26BEC21F8;
  v35[8] = @"longitude";
  v36[8] = &unk_26BEC21F8;
  v35[9] = @"networkType";
  v36[9] = &unk_26BEC21F8;
  v35[10] = @"platform";
  v36[10] = &unk_26BEC2240;
  v35[11] = @"storageUsed";
  v36[11] = &unk_26BEC21F8;
  v35[12] = @"time";
  id v7 = NSNumber;
  id v22 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v21 = (id)objc_msgSend(v7, "numberWithLongLong:", 1000 * objc_msgSend(v22, "longLongValue"));
  v36[12] = v21;
  v35[13] = @"timeZoneOffset";
  v36[13] = &unk_26BEC21F8;
  v35[14] = @"type";
  v36[14] = &unk_26BEC2258;
  v35[15] = @"userId";
  v36[15] = @"20160157686";
  id v20 = (id)[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:16];
  id v37 = v20;
  id v19 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v37);
  id v39 = v19;
  id v18 = (id)[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v41[2] = v18;
  v40[3] = @"lastUpdateTimeMilliSeconds";
  id v8 = NSNumber;
  id v17 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v16 = (id)objc_msgSend(v8, "numberWithLongLong:", 1000 * objc_msgSend(v17, "longLongValue"));
  v41[3] = v16;
  void v40[4] = @"fullSyncRequest";
  v33[0] = @"fsCheckpoint";
  v34[0] = v9;
  v33[1] = @"fsRequestTime";
  id v10 = NSNumber;
  id v15 = +[AMDMiscHelpers getCurrentEpochSeconds];
  id v14 = (id)objc_msgSend(v10, "numberWithLongLong:", 1000 * objc_msgSend(v15, "longLongValue"));
  v34[1] = v14;
  v33[2] = @"sourceUUID";
  v34[2] = @"__DR__0A8DCF13-CFEA-459C-B314-8582D55AF885_1655329257";
  id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33);
  void v41[4] = v13;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];
  v45[1] = v12;
  id v11 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  v47[2] = v11;
  id v27 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];

  id location = +[AMDDataSync processDataReplicationPayload:v27 error:v29];
  if (*v29)
  {
    id v5 = (id)[*v29 localizedDescription];
    objc_msgSend(v28, "setObject:forKey:");

    id v32 = v28;
  }
  else
  {
    if (location) {
      [v28 setObject:location forKey:@"fsDataConsumption"];
    }
    else {
      [v28 setObject:@"nil response" forKey:@"drResponseError"];
    }
    id v32 = v28;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  uint64_t v3 = v32;

  return v3;
}

@end