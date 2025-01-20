@interface AMDDeviceStorage
+ (id)performStorageUpdateWithPayload:(id)a3;
+ (id)queryDeviceStorageWithError:(id *)a3;
@end

@implementation AMDDeviceStorage

+ (id)queryDeviceStorageWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v19 = a1;
  SEL v18 = a2;
  v17 = a3;
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  int v14 = 0;
  GetDeviceSpace(&v16, &v15, &v14);
  if (v14)
  {
    v13 = @"Device storage query failed";
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v23, (uint64_t)v13);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v3 = +[AMDError allocError:29 withMessage:v13];
    id *v17 = v3;
    id v20 = 0;
    objc_storeStrong((id *)&v13, 0);
  }
  else
  {
    id v10 = (id)[NSNumber numberWithDouble:(double)v16 / 1000000000.0];
    id v9 = (id)[NSNumber numberWithDouble:(double)v15 / 1000000000.0];
    v6 = NSNumber;
    id v7 = +[AMDMiscHelpers getCurrentEpochSeconds];
    id v8 = (id)objc_msgSend(v6, "numberWithLongLong:", 1000 * objc_msgSend(v7, "longLongValue"));

    v21[0] = @"time";
    v22[0] = v8;
    v21[1] = @"totalDeviceCapacityGB";
    v22[1] = v10;
    v21[2] = @"availableDeviceCapacityGB";
    v22[2] = v9;
    id v20 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  v4 = v20;

  return v4;
}

+ (id)performStorageUpdateWithPayload:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v49 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v45 = location[0];
      id v44 = (id)[v45 objectForKey:@"isEnabled"];
      if (v44 && ([v44 BOOLValue] & 1) != 0)
      {
        id v43 = (id)[v45 objectForKey:@"storageUpdateCadence"];
        if (v43)
        {
          id v42 = 0;
          id v40 = 0;
          id v21 = +[AMDKVStore fetchValueForKey:@"device_storage_query_time_dict" error:&v40];
          objc_storeStrong(&v42, v40);
          id v41 = v21;
          id v39 = (id)[v21 objectForKey:@"queryTimeMs"];
          if (v42)
          {
            id v19 = v47;
            id v20 = (id)[v42 localizedDescription];
            objc_msgSend(v19, "setObject:forKey:");

            id v50 = v47;
            int v46 = 1;
          }
          else
          {
            if (!v39) {
              objc_storeStrong(&v39, &unk_26BEC19A0);
            }
            id v17 = +[AMDMiscHelpers getCurrentEpochSeconds];
            uint64_t v16 = [v17 longLongValue];
            unint64_t v18 = 1000 * (v16 - (int)(86400 * [v43 intValue]));

            v38[1] = (id)v18;
            if ([v39 longLongValue] <= v18)
            {
              v38[0] = 0;
              id v36 = 0;
              id v15 = (id)[v49 queryDeviceStorageWithError:&v36];
              objc_storeStrong(v38, v36);
              id v37 = v15;
              if (v38[0])
              {
                id v13 = v47;
                id v14 = (id)[v38[0] localizedDescription];
                objc_msgSend(v13, "setObject:forKey:");

                id v50 = v47;
                int v46 = 1;
              }
              else
              {
                id v35 = 0;
                id v33 = 0;
                id v12 = +[AMDDataSync fetchDeviceID:&v33];
                objc_storeStrong(&v35, v33);
                id v34 = v12;
                if (v35 || !v34)
                {
                  id v32 = &_os_log_internal;
                  char v31 = 16;
                  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                  {
                    log = v32;
                    os_log_type_t type = v31;
                    __os_log_helper_16_0_0(v30);
                    _os_log_error_impl(&dword_20ABD4000, log, type, "DeviceId could not be retrieved", v30, 2u);
                  }
                  objc_storeStrong(&v32, 0);
                  objc_storeStrong(&v34, @"undefined");
                }
                id v29 = (id)[v37 mutableCopy];
                [v29 setObject:v34 forKey:0x26BEB2838];
                id v28 = (id)[v45 objectForKey:@"deviceStorageDataStreamName"];
                if (v28)
                {
                  v52[0] = 0x26BEAEC38;
                  v53[0] = v28;
                  v52[1] = 0x26BEAEC18;
                  id v51 = v29;
                  id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
                  v53[1] = v8;
                  id v27 = (id)[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

                  id v26 = 0;
                  id obj = 0;
                  id v9 = +[AMDSQLite saveEvents:v27 error:&obj];
                  objc_storeStrong(&v26, obj);
                  id v25 = v9;
                  if (v26)
                  {
                    id v6 = v47;
                    id v7 = (id)[v26 localizedDescription];
                    objc_msgSend(v6, "setObject:forKey:");

                    id v50 = v47;
                    int v46 = 1;
                  }
                  else
                  {
                    id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                    id v5 = (id)[v29 objectForKey:@"time"];
                    objc_msgSend(v23, "setObject:forKey:");

                    id v22 = v42;
                    +[AMDKVStore setValue:v23 forKey:@"device_storage_query_time_dict" error:&v22];
                    objc_storeStrong(&v42, v22);
                    if (v42) {
                      [v47 setObject:@"Storage query time not updated" forKey:@"deviceStorageUpdateError"];
                    }
                    [v47 setObject:v25 forKey:@"storageUpdateStatus"];
                    id v50 = v47;
                    int v46 = 1;
                    objc_storeStrong(&v23, 0);
                  }
                  objc_storeStrong(&v25, 0);
                  objc_storeStrong(&v26, 0);
                  objc_storeStrong(&v27, 0);
                }
                else
                {
                  [v47 setObject:@"Device Storage stream name missing" forKey:@"deviceStorageUpdateError"];
                  id v50 = v47;
                  int v46 = 1;
                }
                objc_storeStrong(&v28, 0);
                objc_storeStrong(&v29, 0);
                objc_storeStrong(&v34, 0);
                objc_storeStrong(&v35, 0);
              }
              objc_storeStrong(&v37, 0);
              objc_storeStrong(v38, 0);
            }
            else
            {
              [v47 setObject:@"Storage data is current" forKey:@"storageUpdateStatus"];
              id v50 = v47;
              int v46 = 1;
            }
          }
          objc_storeStrong(&v39, 0);
          objc_storeStrong(&v41, 0);
          objc_storeStrong(&v42, 0);
        }
        else
        {
          [v47 setObject:@"Storage update cadence is missing" forKey:@"deviceStorageUpdateError"];
          id v50 = v47;
          int v46 = 1;
        }
        objc_storeStrong(&v43, 0);
      }
      else
      {
        [v47 setObject:@"Storage update is disabled" forKey:@"deviceStorageUpdateError"];
        id v50 = v47;
        int v46 = 1;
      }
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
    }
    else
    {
      [v47 setObject:@"Storage update payload is not a dictionary" forKey:@"deviceStorageUpdateError"];
      id v50 = v47;
      int v46 = 1;
    }
  }
  else
  {
    [v47 setObject:@"Storage update payload is nil" forKey:@"deviceStorageUpdateError"];
    id v50 = v47;
    int v46 = 1;
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
  id v3 = v50;

  return v3;
}

@end