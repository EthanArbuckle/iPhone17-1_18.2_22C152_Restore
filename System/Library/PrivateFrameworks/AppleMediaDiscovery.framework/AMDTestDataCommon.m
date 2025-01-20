@interface AMDTestDataCommon
+ (id)getAggregationDescriptorDict;
+ (id)getEventPayload:(id)a3;
+ (id)getInferencePayload;
+ (id)getNonAggregationDescriptor;
+ (id)getRefreshOnDeviceTasteProfilePayload;
+ (id)getRefreshServerTasteProfilePayload;
+ (id)getSampleEvent;
+ (id)getSampleEventCrashes;
+ (id)getSampleEventInstalls;
+ (id)getSampleEventLaunches;
+ (id)getSampleEventUninstall;
+ (id)getSampleWorkflow;
+ (id)getSaveConfigDownloadModelPayload;
+ (id)gettabInfoDict;
@end

@implementation AMDTestDataCommon

+ (id)getSampleEvent
{
  v9[15] = *MEMORY[0x263EF8340];
  v8[0] = 0x26BEB24D8;
  v4 = NSNumber;
  id v7 = (id)[MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v5 = (id)[v4 numberWithUnsignedLongLong:(unint64_t)v2];
  v9[0] = v5;
  v8[1] = 0x26BEB2878;
  v9[1] = &unk_26BEC1FE8;
  v8[2] = 0x26BEB27F8;
  v9[2] = @"1.1";
  v8[3] = 0x26BEB2818;
  v9[3] = &unk_26BEC37B0;
  v8[4] = 0x26BEB2858;
  v9[4] = &unk_26BEC2000;
  v8[5] = 0x26BEB2898;
  v9[5] = &unk_26BEC37C0;
  v8[6] = 0x26BEB28B8;
  v9[6] = &unk_26BEC37D0;
  v8[7] = 0x26BEB28D8;
  v9[7] = &unk_26BEC37E0;
  v8[8] = 0x26BEB28F8;
  v9[8] = @"Some misc data";
  v8[9] = 0x26BEB2918;
  v9[9] = &unk_26BEC2018;
  v8[10] = 0x26BEB2938;
  v9[10] = @"iPhone";
  v8[11] = 0x26BEB2958;
  v9[11] = &unk_26BEC2030;
  v8[12] = 0x26BEB2978;
  v9[12] = &unk_26BEC2048;
  v8[13] = 0x26BEB2998;
  v9[13] = &unk_26BEC2060;
  v8[14] = 0x26BEB29B8;
  v9[14] = @"installs";
  id v6 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:15];

  return v6;
}

+ (id)getSampleEventInstalls
{
  void v9[16] = *MEMORY[0x263EF8340];
  v8[0] = 0x26BEB24D8;
  v4 = NSNumber;
  id v7 = (id)[MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v5 = (id)[v4 numberWithUnsignedLongLong:(unint64_t)v2];
  v9[0] = v5;
  v8[1] = 0x26BEB2878;
  v9[1] = &unk_26BEC1FE8;
  v8[2] = 0x26BEB27F8;
  v9[2] = @"1.1";
  v8[3] = 0x26BEB2818;
  v9[3] = &unk_26BEC37B0;
  v8[4] = 0x26BEB2858;
  v9[4] = &unk_26BEC2000;
  v8[5] = 0x26BEB2898;
  v9[5] = &unk_26BEC37C0;
  v8[6] = 0x26BEB28B8;
  v9[6] = &unk_26BEC37D0;
  v8[7] = 0x26BEB28D8;
  v9[7] = &unk_26BEC37E0;
  v8[8] = 0x26BEB28F8;
  v9[8] = @"Some misc data";
  v8[9] = 0x26BEB2918;
  v9[9] = &unk_26BEC2018;
  v8[10] = 0x26BEB2938;
  v9[10] = @"iPhone";
  v8[11] = 0x26BEB2958;
  v9[11] = &unk_26BEC2030;
  v8[12] = 0x26BEB2978;
  v9[12] = &unk_26BEC2048;
  v8[13] = 0x26BEB2998;
  v9[13] = &unk_26BEC2060;
  v8[14] = 0x26BEB29B8;
  v9[14] = @"installs";
  void v8[15] = @"installType";
  v9[15] = &unk_26BEC2048;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:16];

  return v6;
}

+ (id)getSampleEventUninstall
{
  v9[5] = *MEMORY[0x263EF8340];
  v8[0] = 0x26BEB2878;
  v9[0] = &unk_26BEC1FE8;
  v8[1] = 0x26BEB27F8;
  v9[1] = @"1.1";
  v8[2] = 0x26BEB2938;
  v9[2] = @"iPhone";
  v8[3] = 0x26BEB24D8;
  v4 = NSNumber;
  id v7 = (id)[MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v5 = (id)[v4 numberWithUnsignedLongLong:(unint64_t)v2];
  v9[3] = v5;
  v8[4] = 0x26BEB29B8;
  v9[4] = @"uninstalls";
  id v6 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

+ (id)getSampleEventCrashes
{
  v9[5] = *MEMORY[0x263EF8340];
  v8[0] = 0x26BEB2878;
  v9[0] = &unk_26BEC1FE8;
  v8[1] = 0x26BEB27F8;
  v9[1] = @"1.1";
  v8[2] = 0x26BEB2938;
  v9[2] = @"iPhone";
  v8[3] = 0x26BEB24D8;
  v4 = NSNumber;
  id v7 = (id)[MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  id v5 = (id)[v4 numberWithUnsignedLongLong:(unint64_t)v2];
  v9[3] = v5;
  v8[4] = 0x26BEB29B8;
  v9[4] = @"crashes";
  id v6 = (id)[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

+ (id)getSampleEventLaunches
{
  v4[6] = *MEMORY[0x263EF8340];
  v3[0] = 0x26BEB29B8;
  v4[0] = @"launches";
  v3[1] = 0x26BEB27F8;
  v4[1] = @"2.1";
  v3[2] = 0x26BEB85F8;
  v4[2] = &unk_26BEC3540;
  v3[3] = 0x26BEB2938;
  v4[3] = @"iPhone";
  v3[4] = 0x26BEB2878;
  v4[4] = &unk_26BEC20C0;
  v3[5] = 0x26BEB2818;
  v4[5] = &unk_26BEC20D8;
  return (id)[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
}

+ (id)getEventPayload:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  if ([location[0] isEqualToString:0x26BEB89B8])
  {
    id v3 = +[AMDTestDataCommon getSampleEventInstalls];
    id v4 = v14;
    id v14 = v3;
  }
  else if ([location[0] isEqualToString:0x26BEB8A38])
  {
    id v5 = +[AMDTestDataCommon getSampleEventUninstall];
    id v6 = v14;
    id v14 = v5;
  }
  else if ([location[0] isEqualToString:0x26BEB8998])
  {
    id v7 = +[AMDTestDataCommon getSampleEventCrashes];
    id v8 = v14;
    id v14 = v7;
  }
  else if ([location[0] isEqualToString:0x26BEB89F8])
  {
    id v9 = +[AMDTestDataCommon getSampleEventLaunches];
    id v10 = v14;
    id v14 = v9;
  }
  v16[0] = @"data";
  v17[0] = v14;
  v16[1] = @"action";
  v17[1] = location[0];
  id v13 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2, &v14);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);

  return v13;
}

+ (id)getNonAggregationDescriptor
{
  v19[5] = *MEMORY[0x263EF8340];
  v18[0] = 0x26BEBA678;
  v19[0] = @"AMDAppEvent";
  v18[1] = 0x26BEBA5D8;
  uint64_t v15 = 0x26BEBA5F8;
  v16 = @"adamId";
  id v10 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15);
  id v17 = v10;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v19[1] = v9;
  v18[2] = 0x26BEB79D8;
  id v8 = (id)[NSString stringWithFormat:@"%@ > 100", @"time"];
  id v14 = v8;
  id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v19[2] = v7;
  v18[3] = 0x26BEB9C38;
  v11[0] = 0x26BEBA618;
  v12[0] = @"time";
  v11[1] = 0x26BEBA658;
  v12[1] = &unk_26BEC20F0;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v13 = v6;
  id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v19[3] = v5;
  v18[4] = 0x26BEBA5B8;
  id v3 = (id)[NSNumber numberWithUnsignedInteger:9];
  v19[4] = v3;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];

  return v4;
}

+ (id)getAggregationDescriptorDict
{
  v20[4] = *MEMORY[0x263EF8340];
  v9[2] = a1;
  v9[1] = (id)a2;
  v19[0] = 0x26BEBA5F8;
  v20[0] = @"aggregatedProp";
  v19[1] = 0x26BEBA3F8;
  v20[1] = @"count:";
  v19[2] = 0x26BEBA3D8;
  v20[2] = 0x26BEB95B8;
  v19[3] = 0x26BEBA418;
  uint64_t v18 = 0x26BEB2858;
  id v3 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v18);
  v20[3] = v3;
  v9[0] = (id)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  v16[0] = 0x26BEBA678;
  v17[0] = @"AMDAppEvent";
  v16[1] = 0x26BEBA5D8;
  uint64_t v13 = 0x26BEBA5F8;
  id v14 = @"adamId";
  id v8 = (id)[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v15[0] = v8;
  v15[1] = v9[0];
  id v7 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v17[1] = v7;
  void v16[2] = 0x26BEB79D8;
  v17[2] = &unk_26BEC3558;
  v16[3] = 0x26BEBA478;
  void v17[3] = &unk_26BEC3570;
  v16[4] = 0x26BEB9C38;
  uint64_t v10 = 0x26BEBA658;
  v11 = &unk_26BEC20F0;
  id v6 = (id)[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v12 = v6;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v17[4] = v4;
  v16[5] = 0x26BEBA5B8;
  v17[5] = &unk_26BEC2108;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:6];

  objc_storeStrong(v9, 0);

  return v5;
}

+ (id)gettabInfoDict
{
  return &unk_26BEC2D28;
}

+ (id)getRefreshServerTasteProfilePayload
{
  void v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"data";
  v8[0] = @"domain";
  v9[0] = @"apps";
  v8[1] = @"tasteProfiles";
  v6[0] = @"user_id";
  v7[0] = @"268533468";
  v6[1] = @"storefront_id";
  v7[1] = &unk_26BEC2120;
  v6[2] = @"PURCHASED_ITEM_AFFINITY";
  v7[2] = &unk_26BEC2D50;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  v9[1] = v5;
  id v3 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8);
  v11[0] = v3;
  v10[1] = @"action";
  v11[1] = @"refresh_server_taste_profile";
  id v4 = (id)[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v4;
}

+ (id)getRefreshOnDeviceTasteProfilePayload
{
  void v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"data";
  v8[0] = @"domain";
  v9[0] = @"apps";
  v8[1] = @"tasteProfiles";
  v6[0] = @"user_id";
  v7[0] = @"268533468";
  v6[1] = @"storefront_id";
  v7[1] = &unk_26BEC2120;
  v6[2] = @"PURCHASED_ITEM_AFFINITY";
  v7[2] = &unk_26BEC2D78;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  v9[1] = v5;
  id v3 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8);
  v11[0] = v3;
  v10[1] = @"action";
  v11[1] = @"refresh_on_device_taste_profile";
  id v4 = (id)[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v4;
}

+ (id)getInferencePayload
{
  void v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"data";
  v5[0] = @"domain";
  v6[0] = @"apps";
  v5[1] = @"useCaseIds";
  v6[1] = &unk_26BEC35A0;
  v5[2] = @"storefrontId";
  v6[2] = &unk_26BEC2120;
  v5[3] = @"dsid";
  void v6[3] = @"268533468";
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  v8[0] = v3;
  v7[1] = @"action";
  v8[1] = @"run_inference";
  id v4 = (id)[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v4;
}

+ (id)getSaveConfigDownloadModelPayload
{
  v20[2] = *MEMORY[0x263EF8340];
  v19[0] = @"data";
  id v17 = @"apps";
  v15[0] = @"modelUrls";
  v16[0] = &unk_26BEC2DA0;
  v15[1] = @"workflows";
  v12[0] = @"workflow_id";
  v13[0] = &unk_26BEC2138;
  v12[1] = @"workflow_name";
  v13[1] = @"MGYML Default";
  void v12[2] = @"tab_ids";
  v13[2] = &unk_26BEC35B8;
  v12[3] = @"use_case_id";
  v13[3] = @"mgyml";
  v12[4] = @"included_device_families";
  v13[4] = &unk_26BEC35D0;
  v12[5] = @"model_id";
  v13[5] = @"games_od_phl_monetize_classifier_global";
  v12[6] = @"model_format";
  v13[6] = @"CoreML";
  v12[7] = @"included_storefront_ids";
  v13[7] = MEMORY[0x263EFFA68];
  v12[8] = @"excluded_storefront_ids";
  v13[8] = MEMORY[0x263EFFA68];
  v12[9] = @"js_resources";
  v13[9] = &unk_26BEC35E8;
  v12[10] = @"max_items_to_display";
  v13[10] = &unk_26BEC2150;
  v12[11] = @"input_definitions";
  v13[11] = &unk_26BEC2DF0;
  v12[12] = @"output_definitions";
  v13[12] = &unk_26BEC2EB8;
  id v9 = (id)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:13];
  id v14 = v9;
  id v8 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v14);
  v16[1] = v8;
  void v15[2] = @"descriptors";
  uint64_t v10 = @"sort_descriptors";
  id v7 = +[AMDTestDataCommon getAggregationDescriptorDict];
  id v11 = v7;
  id v6 = (id)[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  void v16[2] = v6;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  id v18 = v5;
  id v3 = (id)[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20[0] = v3;
  v19[1] = @"action";
  v20[1] = @"save_config_download_model";
  id v4 = (id)[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v4;
}

+ (id)getSampleWorkflow
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = @"workflow_id";
  v6[0] = &unk_26BEC2138;
  v5[1] = @"workflow_name";
  v6[1] = @"MGYML Default";
  v5[2] = @"use_case_id";
  v6[2] = @"mgyml";
  v5[3] = @"included_device_families";
  void v6[3] = &unk_26BEC3660;
  void v5[4] = @"model_id";
  void v6[4] = @"games_od_phl_monetize_classifier_global";
  v5[5] = @"model_format";
  v6[5] = @"CoreML";
  v5[6] = @"included_storefront_ids";
  v6[6] = MEMORY[0x263EFFA68];
  v5[7] = @"excluded_storefront_ids";
  v6[7] = MEMORY[0x263EFFA68];
  v5[8] = @"js_resources";
  v6[8] = &unk_26BEC3678;
  v5[9] = @"max_items_to_display";
  v6[9] = &unk_26BEC2150;
  v5[10] = @"input_definitions";
  v6[10] = &unk_26BEC2F08;
  v5[11] = @"output_definitions";
  v6[11] = &unk_26BEC2FD0;
  id v3 = (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:12];
  v7[0] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v4;
}

@end