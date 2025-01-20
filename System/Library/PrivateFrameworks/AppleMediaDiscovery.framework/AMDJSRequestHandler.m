@interface AMDJSRequestHandler
+ (id)getVersion;
+ (id)handlePayload:(id)a3 error:(id *)a4;
+ (int64_t)getActionCode:(id)a3;
+ (void)handlePayload:(id)a3 ForAsyncOperation:(id)a4;
+ (void)handlePayload:(id)a3 withCompletionHandler:(id)a4;
+ (void)logAsyncHandlerPayload:(id)a3 forAction:(id)a4 withVerbosityLevel:(char)a5 andBuild:(id)a6 andSessionKey:(id)a7 andStorefrontId:(id)a8 withLoggingProbability:(id)a9 error:(id *)a10;
+ (void)logMetrics:(id)a3;
+ (void)wrapUp;
@end

@implementation AMDJSRequestHandler

+ (int64_t)getActionCode:(id)a3
{
  v10[48] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getActionCode__actionMap)
  {
    v9[0] = @"clear_user_data";
    v10[0] = &unk_26BEC1B80;
    v9[1] = @"data_replication";
    v10[1] = &unk_26BEC1B98;
    v9[2] = @"debug";
    v10[2] = &unk_26BEC1BB0;
    v9[3] = @"fetch_biome_data";
    v10[3] = &unk_26BEC1BC8;
    v9[4] = @"get_app_segment_data";
    v10[4] = &unk_26BEC1BE0;
    v9[5] = @"get_app_tab_info";
    v10[5] = &unk_26BEC1BF8;
    v9[6] = @"getModelPath";
    v10[6] = &unk_26BEC1C10;
    v9[7] = @"getVersion";
    v10[7] = &unk_26BEC1C28;
    v9[8] = @"log_metrics_data";
    v10[8] = &unk_26BEC1C40;
    v9[9] = @"coldstart_model_download";
    v10[9] = &unk_26BEC1C58;
    v9[10] = @"cms_download_status_handler";
    v10[10] = &unk_26BEC1C70;
    v9[11] = @"refresh_entity_table";
    v10[11] = &unk_26BEC1C88;
    v9[12] = @"refresh_odtp";
    v10[12] = &unk_26BEC1CA0;
    v9[13] = @"refresh_on_device_taste_profile";
    v10[13] = &unk_26BEC1CB8;
    v9[14] = @"run_inference";
    v10[14] = &unk_26BEC1CD0;
    v9[15] = @"run_megadome_queries";
    v10[15] = &unk_26BEC1CE8;
    v9[16] = @"run_pir_queries";
    v10[16] = &unk_26BEC1D00;
    v9[17] = @"run_pec_queries";
    v10[17] = &unk_26BEC1D18;
    v9[18] = @"sync";
    v10[18] = &unk_26BEC1D30;
    v9[19] = @"sync2";
    v10[19] = &unk_26BEC1D30;
    v9[20] = @"unsigned_sync";
    v10[20] = &unk_26BEC1D48;
    v9[21] = @"run_batched_sql_queries";
    v10[21] = &unk_26BEC1D60;
    v9[22] = @"run_custom_aggregator";
    v10[22] = &unk_26BEC1D78;
    v9[23] = @"aggregateCrashes";
    v10[23] = &unk_26BEC1D90;
    v9[24] = @"aggregateInstalls";
    v10[24] = &unk_26BEC1DA8;
    v9[25] = @"save_appstore_events";
    v10[25] = &unk_26BEC1DC0;
    v9[26] = @"aggregateLaunches";
    v10[26] = &unk_26BEC1DD8;
    v9[27] = @"save_crash";
    v10[27] = &unk_26BEC1DF0;
    v9[28] = @"save_install";
    v10[28] = &unk_26BEC1E08;
    v9[29] = @"save_launches";
    v10[29] = &unk_26BEC1E20;
    v9[30] = @"save_model_urls";
    v10[30] = &unk_26BEC1E38;
    v9[31] = @"savePIRData";
    v10[31] = &unk_26BEC1E50;
    v9[32] = @"saveStreamData";
    v10[32] = &unk_26BEC1E68;
    v9[33] = @"save_uninstall";
    v10[33] = &unk_26BEC1E80;
    v9[34] = @"sqliteDeleteRows";
    v10[34] = &unk_26BEC1E98;
    v9[35] = @"sqliteInsertRows";
    v10[35] = &unk_26BEC1EB0;
    v9[36] = @"sqliteUpdateTables";
    v10[36] = &unk_26BEC1EC8;
    v9[37] = @"test_inference";
    v10[37] = &unk_26BEC1EE0;
    v9[38] = @"truncate_sqlite_tables";
    v10[38] = &unk_26BEC1EF8;
    v9[39] = @"filter_fitcored_catalog";
    v10[39] = &unk_26BEC1F10;
    v9[40] = @"query_workout_references";
    v10[40] = &unk_26BEC1F28;
    v9[41] = @"fetch_fitness_catalog";
    v10[41] = &unk_26BEC1F40;
    v9[42] = @"fetch_bootstrap_fitness_catalog";
    v10[42] = &unk_26BEC1F58;
    v9[43] = @"insert_vectors";
    v10[43] = &unk_26BEC1F70;
    v9[44] = @"clear_vector_db";
    v10[44] = &unk_26BEC1F88;
    v9[45] = @"create_vector_db";
    v10[45] = &unk_26BEC1FA0;
    v9[46] = @"search_vector_db";
    v10[46] = &unk_26BEC1FB8;
    v9[47] = @"delete_vector_db";
    v10[47] = &unk_26BEC1FD0;
    id v3 = (id)[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:48];
    v4 = (void *)getActionCode__actionMap;
    getActionCode__actionMap = (uint64_t)v3;
  }
  id v7 = (id)[(id)getActionCode__actionMap objectForKey:location[0]];
  if (v7) {
    int64_t v6 = [v7 unsignedIntValue];
  }
  else {
    int64_t v6 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)getVersion
{
  v20[7] = *MEMORY[0x263EF8340];
  v18[2] = a1;
  v18[1] = (id)a2;
  v18[0] = +[AMDSQLite getSharedInstance];
  char v15 = 0;
  char v13 = 0;
  char v11 = 0;
  if ([v18[0] isUsable])
  {
    id v16 = (id)[v18[0] getDataSchema];
    char v15 = 1;
    id v14 = (id)[v16 getVersion];
    char v13 = 1;
    id v2 = v14;
  }
  else
  {
    id v12 = (id)[v18[0] connectionState];
    char v11 = 1;
    id v2 = v12;
  }
  id v17 = v2;
  if (v11) {

  }
  if (v13) {
  if (v15)
  }

  id v4 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v10 = (id)[v4 infoDictionary];

  v19[0] = @"AMDVersion";
  v20[0] = &unk_26BEC37A0;
  v19[1] = @"Description";
  v20[1] = @"AMDVectorDBImplementation";
  v19[2] = @"SchemaVersion";
  v20[2] = v17;
  v19[3] = @"CFBundleInfoDictionaryVersion";
  id v9 = (id)objc_msgSend(v10, "objectForKey:");
  v20[3] = v9;
  v19[4] = @"CFBundleNumericVersion";
  id v8 = (id)objc_msgSend(v10, "objectForKey:");
  v20[4] = v8;
  v19[5] = @"DTPlatformBuild";
  id v7 = (id)objc_msgSend(v10, "objectForKey:");
  v20[5] = v7;
  v19[6] = @"DTPlatformVersion";
  id v5 = (id)objc_msgSend(v10, "objectForKey:");
  v20[6] = v5;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);

  return v6;
}

+ (void)handlePayload:(id)a3 ForAsyncOperation:(id)a4
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v81 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v79 = 0;
  objc_storeStrong(&v79, a4);
  id v78 = 0;
  id v77 = (id)[location[0] objectForKey:@"data"];
  id v76 = 0;
  id v75 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v77];
  id v74 = (id)[location[0] objectForKey:@"action"];
  if (!v74)
  {
    objc_storeStrong(&v76, @"No action");
    id v4 = +[AMDError allocError:15 withMessage:v76];
    id v5 = v78;
    id v78 = v4;

    id v73 = &_os_log_internal;
    os_log_type_t v72 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v83, (uint64_t)v76);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v73, v72, "%@", v83, 0xCu);
    }
    objc_storeStrong(&v73, 0);
    [v81 logMetrics:v78];
    (*((void (**)(id, void, id))v79 + 2))(v79, 0, v78);
  }
  id v71 = (id)[location[0] objectForKey:@"osBuildNumber"];
  id v70 = (id)[location[0] objectForKey:@"sessionKey"];
  id v69 = (id)[v75 objectForKey:@"storefrontId"];
  int v68 = 0;
  id v67 = (id)[location[0] objectForKey:@"verbosityLevel"];
  if (v67) {
    int v68 = [v67 intValue];
  }
  else {
    int v68 = 0;
  }
  id v66 = (id)[v75 objectForKey:@"loggingProbability"];
  if (v66)
  {
    [v66 doubleValue];
    if (v6 > 1.0 || ([v66 doubleValue], v7 < 0.0)) {
      objc_storeStrong(&v66, 0);
    }
  }
  [v81 getActionCode:v74];
  unint64_t v65 = [v81 getActionCode:v74];
  id v19 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v64 = (id)[v19 UUIDString];

  id v63 = 0;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t v61 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_4_8_64_8_64_4_0_8_64((uint64_t)v82, (uint64_t)v64, (uint64_t)v74, v65, @"__defaultTreatment");
    _os_log_impl(&dword_20ABD4000, oslog, v61, "Async JS handler call %@: action: %@, code:%d, treatment: %@", v82, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  +[AMDMiscHelpers AMDInitialize:v75];
  id v60 = MEMORY[0x263EFFA78];
  if (v65 <= 0x25)
  {
    unint64_t v9 = v65 - 37;
    char v8 = 0;
  }
  else
  {
    unint64_t v9 = v65 - 37;
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    switch(v9)
    {
      case 0uLL:
        +[AMDJSDebugHandler handleAsyncDebugRequest:v75 withCompletionHandler:v79];
        goto LABEL_25;
      case 1uLL:
        v18 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
        id v17 = v75;
        uint64_t v53 = MEMORY[0x263EF8330];
        int v54 = -1073741824;
        int v55 = 0;
        v56 = __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke;
        v57 = &unk_263FE1BB8;
        id v59 = v79;
        id v58 = v78;
        [(FitCoreDQueryClass *)v18 filterFitcoreDCatalogWithCatalogFilterConfig:v17 completionHandler:&v53];

        objc_storeStrong(&v58, 0);
        objc_storeStrong(&v59, 0);
        goto LABEL_25;
      case 2uLL:
        id v16 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
        id v15 = v75;
        uint64_t v46 = MEMORY[0x263EF8330];
        int v47 = -1073741824;
        int v48 = 0;
        v49 = __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_2;
        v50 = &unk_263FE1BB8;
        id v52 = v79;
        id v51 = v78;
        [(FitCoreDQueryClass *)v16 queryWorkoutReferencesWithWorkoutQueryConfig:v15 completionHandler:&v46];

        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        goto LABEL_25;
      case 3uLL:
        id v14 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
        uint64_t v34 = MEMORY[0x263EF8330];
        int v35 = -1073741824;
        int v36 = 0;
        v37 = __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_3;
        v38 = &unk_263FE2690;
        v44[1] = v81;
        id v39 = v74;
        int v45 = v68;
        id v40 = v71;
        id v41 = v70;
        id v42 = v69;
        id v43 = v66;
        v44[0] = v79;
        [(FitCoreDQueryClass *)v14 fetchCatalogMetadataWithCompletionHandler:&v34];

        objc_storeStrong(v44, 0);
        objc_storeStrong(&v43, 0);
        objc_storeStrong(&v42, 0);
        objc_storeStrong(&v41, 0);
        objc_storeStrong(&v40, 0);
        objc_storeStrong(&v39, 0);
        goto LABEL_25;
      case 4uLL:
        break;
      case 5uLL:
        char v13 = objc_alloc_init(_TtC19AppleMediaDiscovery18FitCoreDQueryClass);
        id v12 = v75;
        uint64_t v22 = MEMORY[0x263EF8330];
        int v23 = -1073741824;
        int v24 = 0;
        v25 = __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_464;
        v26 = &unk_263FE2690;
        v32[1] = v81;
        id v27 = v74;
        int v33 = v68;
        id v28 = v71;
        id v29 = v70;
        id v30 = v69;
        id v31 = v66;
        v32[0] = v79;
        [(FitCoreDQueryClass *)v13 runBootstrapCatalogSyncWithBootstrapCatalogSyncConfig:v12 completionHandler:&v22];

        objc_storeStrong(v32, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v27, 0);
        goto LABEL_25;
      default:
        JUMPOUT(0);
    }
  }
  id v21 = (id)[NSString stringWithFormat:@"invalid action: %@", v74];
  id v10 = +[AMDError allocError:15 withMessage:v21];
  id v11 = v78;
  id v78 = v10;

  (*((void (**)(id, id, id))v79 + 2))(v79, v60, v78);
  objc_storeStrong(&v21, 0);
LABEL_25:
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, 0);
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = (id)a1;
  id v3 = *(void **)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v20[0] = v21;
  [v3 logAsyncHandlerPayload:location[0] forAction:v4 withVerbosityLevel:(char)v5 andBuild:v6 andSessionKey:v7 andStorefrontId:v8 withLoggingProbability:v9 error:v20];
  objc_storeStrong(&v21, v20[0]);
  if (v21)
  {
    id v19 = &_os_log_internal;
    char v18 = 16;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      os_log_type_t type = v18;
      id v12 = (id)[v21 localizedDescription];
      id v17 = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v17);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Data fetch from fitcored failed with error: %@", v25, 0xCu);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v19, 0);
    id v16 = (id)[v21 localizedDescription];
    int v23 = @"error";
    id v24 = v16;
    id v15 = (id)[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __55__AMDJSRequestHandler_handlePayload_ForAsyncOperation___block_invoke_464(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = (id)a1;
  id v3 = *(void **)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v20[0] = v21;
  [v3 logAsyncHandlerPayload:location[0] forAction:v4 withVerbosityLevel:(char)v5 andBuild:v6 andSessionKey:v7 andStorefrontId:v8 withLoggingProbability:v9 error:v20];
  objc_storeStrong(&v21, v20[0]);
  if (v21)
  {
    id v19 = &_os_log_internal;
    char v18 = 16;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      os_log_type_t type = v18;
      id v12 = (id)[v21 localizedDescription];
      id v17 = v12;
      __os_log_helper_16_2_1_8_64((uint64_t)v25, (uint64_t)v17);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Bootstrap data fetch from fitcored failed with error: %@", v25, 0xCu);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v19, 0);
    id v16 = (id)[v21 localizedDescription];
    int v23 = @"error";
    id v24 = v16;
    id v15 = (id)[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

+ (void)handlePayload:(id)a3 withCompletionHandler:(id)a4
{
  id v33 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = &_os_log_internal;
  char v29 = 1;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
  {
    log = v30;
    os_log_type_t type = v29;
    __os_log_helper_16_0_0(v28);
    _os_log_impl(&dword_20ABD4000, log, type, "Entered top-level event handler", v28, 2u);
  }
  objc_storeStrong(&v30, 0);
  id v27 = (id)[location[0] objectForKey:@"data"];
  id v26 = 0;
  id v25 = 0;
  if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_storeStrong(&v25, @"Missing or invalid payload data");
    id v4 = +[AMDError allocError:15 withMessage:v25];
    id v5 = v26;
    id v26 = v4;

    (*((void (**)(id, void, id))v31 + 2))(v31, 0, v26);
  }
  id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v24 = (id)[v6 initWithDictionary:v27];
  id v23 = (id)[v24 objectForKey:@"jsHandlerType"];
  if (v23 && ([v23 isEqualToString:@"async"] & 1) != 0)
  {
    id v22 = &_os_log_internal;
    char v21 = 2;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      id v10 = v22;
      os_log_type_t v11 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_debug_impl(&dword_20ABD4000, v10, v11, "Async handler invoked", v20, 2u);
    }
    objc_storeStrong(&v22, 0);
    [v33 handlePayload:location[0] ForAsyncOperation:v31];
  }
  else
  {
    id v19 = &_os_log_internal;
    char v18 = 2;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v19;
      os_log_type_t v9 = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_debug_impl(&dword_20ABD4000, v8, v9, "Synchronous handler invoked", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    id v15 = v26;
    id v7 = (id)[v33 handlePayload:location[0] error:&v15];
    objc_storeStrong(&v26, v15);
    id v16 = v7;
    (*((void (**)(id, id, id))v31 + 2))(v31, v7, v26);
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
}

+ (id)handlePayload:(id)a3 error:(id *)a4
{
  uint64_t v166 = *MEMORY[0x263EF8340];
  id v155 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v153 = a4;
  +[AMDPerf provision];
  +[AMDPerf startMonitoringEvent:@"JSHandler"];
  unint64_t v152 = 0;
  char v151 = 0;
  id v150 = (id)[location[0] objectForKey:@"data"];
  id v149 = 0;
  if (v150)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v145 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v150];
      id v144 = (id)[v145 objectForKey:@"storefrontId"];
      id v143 = (id)[v145 objectForKey:@"dsid"];
      id v142 = (id)[location[0] objectForKey:@"action"];
      id v141 = (id)[v145 objectForKey:@"treatmentId"];
      id v140 = (id)[location[0] objectForKey:@"osBuildNumber"];
      id v139 = (id)[location[0] objectForKey:@"sessionKey"];
      id v138 = (id)[location[0] objectForKey:@"bypassUserChecks"];
      id v137 = (id)[location[0] objectForKey:@"populatePerformanceDict"];
      id v136 = (id)[location[0] objectForKey:@"returnOutputAsString"];
      int v135 = 0;
      id v134 = (id)[location[0] objectForKey:@"verbosityLevel"];
      if (v134) {
        int v135 = [v134 intValue];
      }
      else {
        int v135 = 0;
      }
      id v133 = (id)[v145 objectForKey:@"loggingProbability"];
      if (v133)
      {
        [v133 doubleValue];
        if (v4 > 1.0 || (objc_msgSend(v133, "doubleValue", v4), v5 < 0.0)) {
          objc_storeStrong(&v133, 0);
        }
      }
      +[AMDFrameworkMetrics provisionInstanceAtVerbosity:(char)v135 andAction:v142 andVersion:&unk_26BEC37A0 andBuild:v140 andStorefrontId:v144 withLoggingProbability:v133];
      unsigned int v132 = 0;
      if (!v138 || ([v138 BOOLValue] & 1) == 0)
      {
        if (!v143 || !v144)
        {
          id v6 = (id)[NSString stringWithFormat:@"Missing storefrontId (%@)or userId (%@)", v144, v143];
          id v7 = v149;
          id v149 = v6;

          id v108 = +[AMDError allocError:15 withMessage:v149];
          id *v153 = v108;
          os_log_t v131 = (os_log_t)&_os_log_internal;
          os_log_type_t v130 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v164, (uint64_t)v149);
            _os_log_error_impl(&dword_20ABD4000, v131, v130, "%@", v164, 0xCu);
          }
          objc_storeStrong((id *)&v131, 0);
          +[AMDFrameworkMetrics log:v149 withKey:@"frameworkError" atVerbosity:0];
          id v156 = 0;
          int v146 = 1;
LABEL_107:
          objc_storeStrong(&v133, 0);
          objc_storeStrong(&v134, 0);
          objc_storeStrong(&v136, 0);
          objc_storeStrong(&v137, 0);
          objc_storeStrong(&v138, 0);
          objc_storeStrong(&v139, 0);
          objc_storeStrong(&v140, 0);
          objc_storeStrong(&v141, 0);
          objc_storeStrong(&v142, 0);
          objc_storeStrong(&v143, 0);
          objc_storeStrong(&v144, 0);
          objc_storeStrong(&v145, 0);
          goto LABEL_108;
        }
        [v145 setObject:v143 forKey:@"userId"];
        unsigned int v132 = [v144 intValue];
      }
      if (v142)
      {
        char v127 = 0;
        id v106 = (id)[location[0] objectForKey:@"enablePerformance"];

        if (v106)
        {
          id v105 = (id)[location[0] objectForKey:@"enablePerformance"];
          char v127 = [v105 BOOLValue] & 1;
        }
        else
        {
          char v127 = 1;
        }
        +[AMDPerf enable:v127 & 1];
        +[AMDPerf setVerbosity:(char)v135];
        if (!v141
          && ([v142 isEqualToString:@"run_inference"] & 1) == 0
          && ([v142 isEqualToString:@"get_app_segment_data"] & 1) == 0)
        {
          objc_storeStrong(&v141, @"__defaultTreatment");
          [v145 setObject:v141 forKey:@"treatmentId"];
        }
        if (v141) {
          v104 = (__CFString *)v141;
        }
        else {
          v104 = @"__defaultTreatment";
        }
        +[AMDFrameworkMetrics log:v104 withKey:@"treatmentId" atVerbosity:0];
        id v103 = objc_alloc_init(MEMORY[0x263F08C38]);
        id v126 = (id)[v103 UUIDString];

        +[AMDFrameworkMetrics log:v126 withKey:@"callUUID" atVerbosity:0];
        id v125 = (id)[location[0] objectForKey:@"bridgeAppVersion"];
        if (v125) {
          +[AMDFrameworkMetrics log:v125 withKey:@"bridgeAppVersion" atVerbosity:0];
        }
        if (v139) {
          +[AMDFrameworkMetrics log:v139 withKey:@"sessionKey" atVerbosity:0];
        }
        unint64_t v152 = [v155 getActionCode:v142];
        os_log_t v124 = (os_log_t)&_os_log_internal;
        os_log_type_t v123 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
        {
          if (v141) {
            v102 = (__CFString *)v141;
          }
          else {
            v102 = @"__defaultTreatment";
          }
          __os_log_helper_16_2_4_8_64_8_64_4_0_8_64((uint64_t)v162, (uint64_t)v126, (uint64_t)v142, v152, (uint64_t)v102);
          _os_log_impl(&dword_20ABD4000, v124, v123, "Synchronous JS handler call %@: action: %@, code:%d, treatment: %@", v162, 0x26u);
        }
        objc_storeStrong((id *)&v124, 0);
        +[AMDMiscHelpers AMDInitialize:v145];
        id v122 = MEMORY[0x263EFFA78];
        if (v152 <= 1)
        {
          unint64_t v9 = v152 - 1;
          char v8 = 0;
        }
        else
        {
          unint64_t v9 = v152 - 1;
          char v8 = 1;
        }
        if ((v8 & 1) == 0)
        {
          switch(v9)
          {
            case 0uLL:
              id obj = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
              id v119 = +[AMDSQLite clearUserData:location[0]];
              [obj setObject:v119 forKey:@"sqliteClearData"];
              id v118 = +[AMDUserDataManager clearDataForUser:v145 error:v153];
              if (v118) {
                [obj setObject:v118 forKey:@"legacyClearData"];
              }
              objc_storeStrong(&v122, obj);
              objc_storeStrong(&v118, 0);
              objc_storeStrong(&v119, 0);
              objc_storeStrong(&obj, 0);
              goto LABEL_90;
            case 1uLL:
              id v46 = +[AMDDataSync processDataReplicationPayload:v145 error:v153];
              id v47 = v122;
              id v122 = v46;

              goto LABEL_90;
            case 2uLL:
              id v56 = +[AMDBiomeIntegration queryBiomeFor:v145 withError:v153];
              id v57 = v122;
              id v122 = v56;

              goto LABEL_90;
            case 3uLL:
              id v10 = +[AMDJSGetSegments getAppSegments:v145 error:v153];
              id v11 = v122;
              id v122 = v10;

              goto LABEL_90;
            case 4uLL:
              id v101 = (id)[v145 objectForKey:@"appTabName"];
              id v12 = +[AMDAppTabInfo getInfoForTab:error:](AMDAppTabInfo, "getInfoForTab:error:");
              id v13 = v122;
              id v122 = v12;

              goto LABEL_90;
            case 5uLL:
              id v100 = (id)[v145 objectForKey:@"useCaseId"];
              id v99 = (id)[v145 objectForKey:@"domain"];
              id v98 = (id)[v145 objectForKey:@"model_id"];
              id v97 = (id)[v145 objectForKey:@"treatmentId"];
              id v14 = +[AMDModel getModelPathForUsecase:inDomain:forModelId:withTreatmentId:error:](AMDModel, "getModelPathForUsecase:inDomain:forModelId:withTreatmentId:error:", v100, v99, v98);
              id v15 = v122;
              id v122 = v14;

              goto LABEL_90;
            case 6uLL:
              id v16 = (id)[v155 getVersion];
              id v17 = v122;
              id v122 = v16;

              goto LABEL_90;
            case 7uLL:
              id v48 = +[AMDSplunkLogger logPayload:v145 error:v153];
              id v49 = v122;
              id v122 = v48;

              goto LABEL_90;
            case 8uLL:
              id v18 = +[AMDModelDownloader processColdstartBinaryDownload:v145 error:v153];
              id v19 = v122;
              id v122 = v18;

              goto LABEL_90;
            case 9uLL:
              id v20 = +[AMDModelDownloader processModelDownload:v145 withStorefrontID:v144 error:v153];
              id v21 = v122;
              id v122 = v20;

              goto LABEL_90;
            case 0xAuLL:
              id v96 = (id)[v145 objectForKey:@"domain"];
              id v22 = +[AMDSQLite refreshEntityTableForDomain:error:](AMDSQLite, "refreshEntityTableForDomain:error:");
              id v23 = v122;
              id v122 = v22;

              goto LABEL_90;
            case 0xBuLL:
              id v95 = (id)[v145 objectForKey:@"domain"];
              id v24 = +[AMDSQLite refreshODTPForDomain:error:](AMDSQLite, "refreshODTPForDomain:error:");
              id v25 = v122;
              id v122 = v24;

              goto LABEL_90;
            case 0xCuLL:
              id v26 = +[AMDJSSync dailyDataUpdate:v145 forStoreFrontId:v132 error:v153];
              id v27 = v122;
              id v122 = v26;

              goto LABEL_90;
            case 0xDuLL:
              id v28 = +[AMDJSCustomAggregator runCustomAggregation:v145 error:v153];
              id v29 = v122;
              id v122 = v28;

              goto LABEL_90;
            case 0xEuLL:
              id v30 = +[AMDJSInference runInference:v145 error:v153];
              id v31 = v122;
              id v122 = v30;

              goto LABEL_90;
            case 0xFuLL:
              id v32 = +[AMDMegadomeIntegration handleJSRequest:v145 error:v153];
              id v33 = v122;
              id v122 = v32;

              goto LABEL_90;
            case 0x10uLL:
              id v58 = +[AMDJSCipherMLQueryHandler triggerPIRKVFetch:v145 withError:v153];
              id v59 = v122;
              id v122 = v58;

              goto LABEL_90;
            case 0x11uLL:
              id v60 = +[AMDJSCipherMLQueryHandler triggerPECCall:v145 withError:v153];
              id v61 = v122;
              id v122 = v60;

              goto LABEL_90;
            case 0x12uLL:
              id v34 = +[AMDJSSync runSync:v145 withCallUUID:v126 error:v153];
              id v35 = v122;
              id v122 = v34;

              goto LABEL_90;
            case 0x13uLL:
              id v36 = +[AMDJSSync runSyncForUnsignedUser:v145 withCallUUID:v126 error:v153];
              id v37 = v122;
              id v122 = v36;

              goto LABEL_90;
            case 0x14uLL:
            case 0x15uLL:
            case 0x16uLL:
              id v121 = (id)[v145 objectForKey:@"events"];
              id v38 = +[AMDJSEngagementEventHandler handleAggregatedEngagementEvent:v121 forEventType:v152 forUserId:v143 andStoreFrontId:v132 error:v153];
              id v39 = v122;
              id v122 = v38;

              objc_storeStrong(&v121, 0);
              goto LABEL_90;
            case 0x17uLL:
              id v42 = +[AMDJSAppStoreEventHandler handleAggregatedAppStoreEvent:v145 error:v153];
              id v43 = v122;
              id v122 = v42;

              goto LABEL_90;
            case 0x18uLL:
            case 0x19uLL:
            case 0x1AuLL:
            case 0x21uLL:
              id v40 = +[AMDJSEngagementEventHandler handleSingleEngagementEvent:v145 forEventType:v152 forUserId:v143 andStoreFrontId:v132 error:v153];
              id v41 = v122;
              id v122 = v40;

              goto LABEL_90;
            case 0x1BuLL:
              +[AMDModel saveModels:v145 error:v153];
              goto LABEL_90;
            case 0x1CuLL:
              id v54 = +[AMDJSPIRResponseHandler persistPIRData:v145 error:v153];
              id v55 = v122;
              id v122 = v54;

              goto LABEL_90;
            case 0x1DuLL:
              id v44 = +[AMDSQLite saveEvents:location[0] error:v153];
              id v45 = v122;
              id v122 = v44;

              goto LABEL_90;
            case 0x1EuLL:
              id v62 = +[AMDSQLite deleteRowsHandler:v145 error:v153];
              id v63 = v122;
              id v122 = v62;

              goto LABEL_90;
            case 0x1FuLL:
              id v64 = +[AMDSQLite insertRowsHandler:v145 error:v153];
              id v65 = v122;
              id v122 = v64;

              goto LABEL_90;
            case 0x20uLL:
              id v66 = +[AMDSQLite updateTablesHandler:v145 error:v153];
              id v67 = v122;
              id v122 = v66;

              goto LABEL_90;
            case 0x22uLL:
              id v50 = +[AMDJSDebugHandler testInference:v145 error:v153];
              id v51 = v122;
              id v122 = v50;

              goto LABEL_90;
            case 0x23uLL:
              id v68 = +[AMDSQLite trimEventsForStreams:v145 error:v153];
              id v69 = v122;
              id v122 = v68;

              goto LABEL_90;
            case 0x24uLL:
              id v52 = +[AMDJSDebugHandler handleDebugRequest:v145 error:v153];
              id v53 = v122;
              id v122 = v52;

              goto LABEL_90;
            case 0x25uLL:
            case 0x26uLL:
            case 0x27uLL:
            case 0x29uLL:
              break;
            case 0x28uLL:
              id v70 = +[AMDJSCustomAggregator runBatchedSQLDescriptorsUsing:v145 error:v153];
              id v71 = v122;
              id v122 = v70;

              goto LABEL_90;
            case 0x2AuLL:
              id v74 = +[AMDVectorDBManager insertVectorsHandlerWithInsertVectorsPayload:v145 error:v153];
              id v75 = v122;
              id v122 = v74;

              goto LABEL_90;
            case 0x2BuLL:
              id v76 = +[AMDVectorDBManager clearVectorsHandlerWithClearVectorDBPayload:v145 error:v153];
              id v77 = v122;
              id v122 = v76;

              goto LABEL_90;
            case 0x2CuLL:
              id v78 = +[AMDVectorDBManager runVectorDBSearchWithSearchPayload:v145 error:v153];
              id v79 = v122;
              id v122 = v78;

              goto LABEL_90;
            case 0x2DuLL:
              id v80 = +[AMDVectorDBManager deleteVectorDatabaseWithDeletionPayload:v145 error:v153];
              id v81 = v122;
              id v122 = v80;

              goto LABEL_90;
            case 0x2EuLL:
              id v72 = +[AMDVectorDBManager createVectorDBWithCreateDBPayload:v145 error:v153];
              id v73 = v122;
              id v122 = v72;

              goto LABEL_90;
            default:
              JUMPOUT(0);
          }
        }
        id v117 = (id)[NSString stringWithFormat:@"invalid action: %@", v142];
        id v94 = +[AMDError allocError:15 withMessage:v117];
        id *v153 = v94;
        objc_storeStrong(&v117, 0);
LABEL_90:
        +[AMDPerf endMonitoringEvent:@"JSHandler"];
        if (*v153)
        {
          os_log_t v116 = (os_log_t)&_os_log_internal;
          os_log_type_t v115 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            id v93 = (id)[*v153 localizedDescription];
            __os_log_helper_16_2_1_8_64((uint64_t)v161, (uint64_t)v93);
            _os_log_error_impl(&dword_20ABD4000, v116, v115, "JS handler error: %@", v161, 0xCu);
          }
          objc_storeStrong((id *)&v116, 0);
          v159 = @"JSHandlerError";
          id v92 = (id)[*v153 localizedDescription];
          id v160 = v92;
          id v82 = (id)[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
          id v83 = v122;
          id v122 = v82;

          id v91 = (id)[*v153 localizedDescription];
          +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

          id *v153 = 0;
        }
        id v114 = 0;
        if (v137)
        {
          id v84 = +[AMDPerf generatePerformanceDict];
          id v85 = v114;
          id v114 = v84;
        }
        v157[0] = @"response";
        if (v122) {
          id v90 = v122;
        }
        else {
          id v90 = (id)MEMORY[0x263EFFA78];
        }
        v158[0] = v90;
        v157[1] = @"perfDict";
        if (v114) {
          id v89 = v114;
        }
        else {
          id v89 = (id)MEMORY[0x263EFFA78];
        }
        v158[1] = v89;
        id v113 = (id)[NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:2];
        if (v136 && ([v136 BOOLValue] & 1) == 1)
        {
          id v112 = (id)[MEMORY[0x263F08900] dataWithJSONObject:v113 options:0 error:v153];
          id v111 = (id)[[NSString alloc] initWithData:v112 encoding:4];
          id v156 = v111;
          int v146 = 1;
          objc_storeStrong(&v111, 0);
          objc_storeStrong(&v112, 0);
        }
        else
        {
          id v156 = v113;
          int v146 = 1;
        }
        objc_storeStrong(&v113, 0);
        objc_storeStrong(&v114, 0);
        objc_storeStrong(&v122, 0);
        objc_storeStrong(&v125, 0);
        objc_storeStrong(&v126, 0);
      }
      else
      {
        objc_storeStrong(&v149, @"No action");
        id v107 = +[AMDError allocError:15 withMessage:v149];
        id *v153 = v107;
        os_log_t v129 = (os_log_t)&_os_log_internal;
        os_log_type_t v128 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v163, (uint64_t)v149);
          _os_log_error_impl(&dword_20ABD4000, v129, v128, "%@", v163, 0xCu);
        }
        objc_storeStrong((id *)&v129, 0);
        +[AMDFrameworkMetrics log:v149 withKey:@"frameworkError" atVerbosity:0];
        id v156 = 0;
        int v146 = 1;
      }
      goto LABEL_107;
    }
  }
  objc_storeStrong(&v149, @"Missing or invalid payload data");
  id v109 = +[AMDError allocError:15 withMessage:v149];
  id *v153 = v109;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v165, (uint64_t)v149);
    _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v165, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  +[AMDFrameworkMetrics provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:](AMDFrameworkMetrics, "provisionInstanceAtVerbosity:andAction:andVersion:andBuild:andStorefrontId:withLoggingProbability:", 0, 0, 0, 0, 0);
  +[AMDFrameworkMetrics log:v149 withKey:@"frameworkError" atVerbosity:0];
  id v156 = 0;
  int v146 = 1;
LABEL_108:
  objc_storeStrong(&v149, 0);
  objc_storeStrong(&v150, 0);
  int v88 = v146;
  [v155 logMetrics:*v153];
  if (v151) {
    objc_exception_rethrow();
  }
  int v146 = v88;
  if (v88 == 3)
  {
    __break(1u);
    JUMPOUT(0x20AC89E08);
  }
  objc_storeStrong(location, 0);
  v86 = v156;

  return v86;
}

+ (void)wrapUp
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v10[2] = a1;
  v10[1] = (id)a2;
  v10[0] = +[AMDSQLite getSharedInstanceWithOption:0];
  if (v10[0])
  {
    unint64_t v9 = (sqlite3 *)[v10[0] getDb];
    if (v9)
    {
      int v8 = sqlite3_close_v2(v9);
      if (v8)
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v11, v8);
          _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "SQLITE: Error closing db: %d", v11, 8u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      else
      {
        id location = &_os_log_internal;
        char v6 = 16;
        if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
        {
          log = location;
          os_log_type_t type = v6;
          __os_log_helper_16_0_0(v5);
          _os_log_error_impl(&dword_20ABD4000, log, type, "SQLITE: DB closed", v5, 2u);
        }
        objc_storeStrong(&location, 0);
      }
    }
  }
  objc_storeStrong(v10, 0);
}

+ (void)logMetrics:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v4 = (id)[location[0] localizedDescription];
    +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");
  }
  id v3 = +[AMDPerf generatePerformanceDict];
  +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:");

  +[AMDFrameworkMetrics flush];
  objc_storeStrong(location, 0);
}

+ (void)logAsyncHandlerPayload:(id)a3 forAction:(id)a4 withVerbosityLevel:(char)a5 andBuild:(id)a6 andSessionKey:(id)a7 andStorefrontId:(id)a8 withLoggingProbability:(id)a9 error:(id *)a10
{
  id v24 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  char v21 = a5;
  id v20 = 0;
  objc_storeStrong(&v20, a6);
  id v19 = 0;
  objc_storeStrong(&v19, a7);
  id v18 = 0;
  objc_storeStrong(&v18, a8);
  id v17 = 0;
  objc_storeStrong(&v17, a9);
  id v16 = a10;
  +[AMDFrameworkMetrics provisionInstanceAtVerbosity:v21 andAction:v22 andVersion:&unk_26BEC37A0 andBuild:v20 andStorefrontId:v18 withLoggingProbability:v17];
  if (location[0])
  {
    id v15 = (id)[v22 stringByAppendingString:@"_summary"];
    +[AMDFrameworkMetrics log:location[0] withKey:v15 atVerbosity:v21];
    objc_storeStrong(&v15, 0);
  }
  if (v19) {
    +[AMDFrameworkMetrics log:v19 withKey:@"sessionKey" atVerbosity:v21];
  }
  [v24 logMetrics:*v16];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

@end