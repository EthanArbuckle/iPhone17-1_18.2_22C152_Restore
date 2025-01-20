@interface AMDJSEngagementEventHandler
+ (id)handleAggregatedEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7;
+ (id)handleSingleEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7;
+ (unsigned)saveLaunchEvents:(id)a3 error:(id *)a4;
@end

@implementation AMDJSEngagementEventHandler

+ (id)handleAggregatedEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v68 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v66 = a4;
  id v65 = 0;
  objc_storeStrong(&v65, a5);
  unsigned int v64 = a6;
  v63 = a7;
  id v62 = 0;
  id v61 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v36 = (id)[NSNumber numberWithInteger:v66];
  objc_msgSend(v61, "setObject:forKey:");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v59 = 0;
    id v57 = 0;
    id v31 = +[AMDDataSync fetchDeviceID:&v57];
    objc_storeStrong(&v59, v57);
    id v58 = v31;
    if (v59)
    {
      id v56 = &_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
      {
        log = v56;
        os_log_type_t v30 = type;
        __os_log_helper_16_0_0(v54);
        _os_log_error_impl(&dword_20ABD4000, log, v30, "DeviceID fetch failed", v54, 2u);
      }
      objc_storeStrong(&v56, 0);
    }
    unsigned int v53 = 0;
    id v52 = location[0];
    memset(__b, 0, sizeof(__b));
    id v27 = v52;
    uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v73 count:16];
    if (v28)
    {
      uint64_t v24 = *(void *)__b[2];
      uint64_t v25 = 0;
      unint64_t v26 = v28;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)__b[2] != v24) {
          objc_enumerationMutation(v27);
        }
        id v51 = *(id *)(__b[1] + 8 * v25);
        id v49 = (id)[v51 mutableCopy];
        [v49 setObject:v65 forKey:0x26BEAEC98];
        if (v58) {
          [v49 setObject:v58 forKey:0x26BEB2838];
        }
        if (v66 == 27 || v66 == 23)
        {
          v53 += [v68 saveLaunchEvents:v49 error:v63];
        }
        else if (v66 == 26 || v66 == 22)
        {
          id v21 = v49;
          id v22 = (id)[v51 objectForKey:@"installType"];
          objc_msgSend(v21, "setValue:forKey:");

          v53 += +[AMDAppEvent saveEvent:v49 error:v63];
        }
        else
        {
          v53 += +[AMDAppEvent saveEvent:v49 error:v63];
        }
        if (*v63 && !v62)
        {
          v19 = NSString;
          id v20 = (id)[*v63 localizedDescription];
          id v7 = (id)[v19 stringWithFormat:@"Error saving an event: %@", v20];
          id v8 = v62;
          id v62 = v7;
        }
        id *v63 = 0;
        objc_storeStrong(&v49, 0);
        ++v25;
        if (v23 + 1 >= v26)
        {
          uint64_t v25 = 0;
          unint64_t v26 = [v27 countByEnumeratingWithState:__b objects:v73 count:16];
          if (!v26) {
            break;
          }
        }
      }
    }

    id v17 = v61;
    id v18 = (id)[NSNumber numberWithUnsignedInt:v53];
    objc_msgSend(v17, "setObject:forKey:");

    if (v62)
    {
      +[AMDFrameworkMetrics log:withKey:atVerbosity:](AMDFrameworkMetrics, "log:withKey:atVerbosity:", v62);
      [v61 setObject:v62 forKey:@"eventSaveError"];
    }
    +[AMDFrameworkMetrics log:v61 withKey:@"saveEvents" atVerbosity:0];
    if (v66 == 25 || v66 == 21)
    {
      id v69 = v61;
      int v60 = 1;
    }
    else
    {
      id v48 = @"AppInfomationTPRefresh";
      if (v66 == 26 || v66 == 22 || v66 == 34)
      {
        id v47 = +[AMDTasteProfile refreshAppInformationTasteProfile:v63];
        if (*v63)
        {
          v15 = NSString;
          id v16 = (id)[*v63 localizedDescription];
          id v46 = (id)[v15 stringWithFormat:@"Error generating app-information taste profile: %@", v16];

          os_log_t oslog = (os_log_t)&_os_log_internal;
          os_log_type_t v44 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v46);
            _os_log_error_impl(&dword_20ABD4000, oslog, v44, "%@", v72, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          [v61 setObject:v46 forKey:v48];
          +[AMDFrameworkMetrics log:v46 withKey:v48 atVerbosity:0];
          id *v63 = 0;
          objc_storeStrong(&v46, 0);
        }
        else
        {
          [v61 setObject:v47 forKey:v48];
          +[AMDFrameworkMetrics log:v47 withKey:v48 atVerbosity:0];
          if (v66 == 26 || v66 == 22) {
            +[AMDTasteProfile refreshCToLMaps];
          }
        }
        objc_storeStrong(&v47, 0);
      }
      objc_storeStrong(&v48, @"refreshedODTPs");
      id v43 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:@"apps" forUser:v65 andStoreFrontId:v64 error:v63];
      if (*v63)
      {
        v13 = NSString;
        id v14 = (id)[*v63 localizedDescription];
        id v42 = (id)[v13 stringWithFormat:@"error refreshing od-tp: %@", v14];

        os_log_t v41 = (os_log_t)&_os_log_internal;
        os_log_type_t v40 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v42);
          _os_log_error_impl(&dword_20ABD4000, v41, v40, "%@", v71, 0xCu);
        }
        objc_storeStrong((id *)&v41, 0);
        [v61 setObject:v42 forKey:v48];
        +[AMDFrameworkMetrics log:v42 withKey:v48 atVerbosity:0];
        id *v63 = 0;
        objc_storeStrong(&v42, 0);
      }
      else
      {
        if (v43) {
          objc_storeStrong(&v43, v43);
        }
        else {
          objc_storeStrong(&v43, MEMORY[0x263EFFA78]);
        }
        [v61 setObject:v43 forKey:v48];
        +[AMDFrameworkMetrics log:v43 withKey:v48 atVerbosity:0];
      }
      id v39 = +[AMDAppSegment refreshSegmentsForAllTreatmentsForUser:v65 error:v63];
      objc_storeStrong(&v48, @"refreshSegments");
      if (*v63)
      {
        v11 = NSString;
        id v12 = (id)[*v63 localizedDescription];
        id v38 = (id)[v11 stringWithFormat:@"error updating in-app segment data: %@", v12];

        os_log_t v37 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v38);
          _os_log_error_impl(&dword_20ABD4000, v37, OS_LOG_TYPE_ERROR, "%@", v70, 0xCu);
        }
        objc_storeStrong((id *)&v37, 0);
        [v61 setObject:v38 forKey:v48];
        +[AMDFrameworkMetrics log:v38 withKey:v48 atVerbosity:0];
        id *v63 = 0;
        objc_storeStrong(&v38, 0);
      }
      else
      {
        if (v39) {
          objc_storeStrong(&v39, v39);
        }
        else {
          objc_storeStrong(&v39, MEMORY[0x263EFFA78]);
        }
        [v61 setObject:v39 forKey:v48];
        +[AMDFrameworkMetrics log:v39 withKey:v48 atVerbosity:0];
      }
      id v69 = v61;
      int v60 = 1;
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v48, 0);
    }
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v58, 0);
    objc_storeStrong(&v59, 0);
  }
  else
  {
    objc_storeStrong(&v62, @"Not a list of events");
    id *v63 = +[AMDError allocError:0 withMessage:v62];
    [v61 setObject:v62 forKey:@"eventSaveError"];
    +[AMDFrameworkMetrics log:v61 withKey:@"saveEvents" atVerbosity:0];
    id v69 = 0;
    int v60 = 1;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
  v9 = v69;

  return v9;
}

+ (id)handleSingleEngagementEvent:(id)a3 forEventType:(int64_t)a4 forUserId:(id)a5 andStoreFrontId:(unsigned int)a6 error:(id *)a7
{
  v16[1] = *MEMORY[0x263EF8340];
  id v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = (id)a4;
  v13[0] = 0;
  objc_storeStrong(v13, a5);
  v10 = v15;
  v16[0] = location[0];
  id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  id v12 = (id)objc_msgSend(v10, "handleAggregatedEngagementEvent:forEventType:forUserId:andStoreFrontId:error:");

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);

  return v12;
}

+ (unsigned)saveLaunchEvents:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v55 = a4;
  *a4 = 0;
  unsigned int v54 = 0;
  unsigned int v53 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[location[0] objectForKey:0x26BEB85F8];
  uint64_t v40 = [obj countByEnumeratingWithState:__b objects:v61 count:16];
  if (v40)
  {
    uint64_t v35 = *(void *)__b[2];
    uint64_t v36 = 0;
    unint64_t v37 = v40;
    while (1)
    {
      uint64_t v34 = v36;
      if (*(void *)__b[2] != v35) {
        objc_enumerationMutation(obj);
      }
      id v52 = *(id *)(__b[1] + 8 * v36);
      memset(v49, 0, sizeof(v49));
      id v32 = (id)[v52 allValues];
      uint64_t v33 = [v32 countByEnumeratingWithState:v49 objects:v60 count:16];
      if (v33)
      {
        uint64_t v29 = *(void *)v49[2];
        uint64_t v30 = 0;
        unint64_t v31 = v33;
        while (1)
        {
          uint64_t v28 = v30;
          if (*(void *)v49[2] != v29) {
            objc_enumerationMutation(v32);
          }
          id v50 = *(id *)(v49[1] + 8 * v30);
          int v4 = [v50 unsignedIntValue];
          v53 += v4;
          ++v30;
          if (v28 + 1 >= v31)
          {
            uint64_t v30 = 0;
            unint64_t v31 = [v32 countByEnumeratingWithState:v49 objects:v60 count:16];
            if (!v31) {
              break;
            }
          }
        }
      }

      ++v36;
      if (v34 + 1 >= v37)
      {
        uint64_t v36 = 0;
        unint64_t v37 = [obj countByEnumeratingWithState:__b objects:v61 count:16];
        if (!v37) {
          break;
        }
      }
    }
  }

  if (v53)
  {
    id v47 = (id)[location[0] objectForKey:0x26BEB2818];
    id v46 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v46 setNumberStyle:1];
    id *v55 = 0;
    memset(v44, 0, sizeof(v44));
    id v26 = (id)[location[0] objectForKey:0x26BEB85F8];
    uint64_t v27 = [v26 countByEnumeratingWithState:v44 objects:v59 count:16];
    if (v27)
    {
      uint64_t v23 = *(void *)v44[2];
      uint64_t v24 = 0;
      unint64_t v25 = v27;
      while (1)
      {
        uint64_t v22 = v24;
        if (*(void *)v44[2] != v23) {
          objc_enumerationMutation(v26);
        }
        id v45 = *(id *)(v44[1] + 8 * v24);
        memset(v42, 0, sizeof(v42));
        id v20 = v45;
        uint64_t v21 = [v20 countByEnumeratingWithState:v42 objects:v58 count:16];
        if (v21)
        {
          uint64_t v17 = *(void *)v42[2];
          uint64_t v18 = 0;
          unint64_t v19 = v21;
          while (1)
          {
            uint64_t v16 = v18;
            if (*(void *)v42[2] != v17) {
              objc_enumerationMutation(v20);
            }
            uint64_t v43 = *(void *)(v42[1] + 8 * v18);
            id v14 = location[0];
            id v15 = (id)[v46 numberFromString:v43];
            objc_msgSend(v14, "setValue:forKey:");

            id v41 = (id)[v45 valueForKey:v43];
            [location[0] setValue:v41 forKey:0x26BEB2858];
            if (v47)
            {
              id v12 = location[0];
              v10 = NSNumber;
              [v47 floatValue];
              float v11 = v6;
              [v41 floatValue];
              *(float *)&double v8 = v11 * (float)(v7 / (float)v53);
              id v13 = (id)[v10 numberWithFloat:v8];
              objc_msgSend(v12, "setValue:forKey:");
            }
            +[AMDAppEvent saveEvent:location[0] error:v55];
            if (*v55)
            {
              int v48 = 9;
            }
            else
            {
              ++v54;
              int v48 = 0;
            }
            objc_storeStrong(&v41, 0);
            ++v18;
            if (v16 + 1 >= v19)
            {
              uint64_t v18 = 0;
              unint64_t v19 = [v20 countByEnumeratingWithState:v42 objects:v58 count:16];
              if (!v19) {
                break;
              }
            }
          }
        }

        ++v24;
        if (v22 + 1 >= v25)
        {
          uint64_t v24 = 0;
          unint64_t v25 = [v26 countByEnumeratingWithState:v44 objects:v59 count:16];
          if (!v25) {
            break;
          }
        }
      }
    }

    unsigned int v57 = v54;
    int v48 = 1;
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    id v5 = +[AMDError allocError:0 withMessage:@"total launch duration is zero"];
    id *v55 = v5;
    unsigned int v57 = 0;
    int v48 = 1;
  }
  objc_storeStrong(location, 0);
  return v57;
}

@end