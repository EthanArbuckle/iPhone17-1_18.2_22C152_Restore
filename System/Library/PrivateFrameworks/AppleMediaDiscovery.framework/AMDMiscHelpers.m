@interface AMDMiscHelpers
+ (BOOL)createOrMoveSymbolicLinkAtURL:(id)a3 toDestinationURL:(id)a4;
+ (BOOL)ensureDir:(id)a3 removeIfExists:(BOOL)a4;
+ (BOOL)isValidDSID:(id)a3;
+ (id)convertDataArrayToBase64StringArray:(id)a3;
+ (id)extractPECSimilarityScores:(id)a3 error:(id *)a4;
+ (id)getCurrentEpochSeconds;
+ (id)logAndCreateError:(int64_t)a3 errorMessage:(id)a4;
+ (id)sortArrayElements:(id)a3 inDescendingOrder:(BOOL)a4 withComparisonKey:(id)a5 isKeyString:(BOOL)a6;
+ (void)AMDInitialize:(id)a3;
+ (void)AMDPerformCleanup;
+ (void)printInput:(id)a3 withRawData:(void *)a4 withType:(int64_t)a5 andSize:(int)a6;
+ (void)setAppStoreDirAttributes;
@end

@implementation AMDMiscHelpers

+ (void)setAppStoreDirAttributes
{
  v3 = (dispatch_once_t *)&setAppStoreDirAttributes_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0);
}

void __42__AMDMiscHelpers_setAppStoreDirAttributes__block_invoke(void *a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  v19[2] = a1;
  v19[1] = a1;
  v19[0] = (id)[MEMORY[0x263F08850] defaultManager];
  id v5 = (id)objc_msgSend(v19[0], "URLsForDirectory:inDomains:", 14);
  id v18 = (id)[v5 lastObject];

  id v17 = 0;
  char v16 = 0;
  id v6 = v18;
  uint64_t v21 = *MEMORY[0x263EFF6B0];
  v22[0] = MEMORY[0x263EFFA88];
  id v7 = (id)[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v15 = v17;
  char v8 = objc_msgSend(v6, "setResourceValues:error:");
  objc_storeStrong(&v17, v15);

  char v16 = v8 & 1;
  if ((v8 & 1) != 0 && !v17)
  {
    id v11 = &_os_log_internal;
    char v10 = 2;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
    {
      v1 = v11;
      os_log_type_t v2 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_debug_impl(&dword_20ABD4000, v1, v2, "Set NSURLIsExcludedFromBackupKey on root directory", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v3 = NSString;
    id v4 = (id)[v17 localizedDescription];
    id v14 = (id)[v3 stringWithFormat:@"Failed to set NSURLIsExcludedFromBackupKey flag: %@", v4];

    id v13 = &_os_log_internal;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v20, (uint64_t)v14);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v13, v12, "%@", v20, 0xCu);
    }
    objc_storeStrong(&v13, 0);
    +[AMDFrameworkMetrics log:v14 withKey:@"SetAppStoreDirAttributesError" atVerbosity:0];
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

+ (BOOL)ensureDir:(id)a3 removeIfExists:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v26 = a4;
  id v25 = (id)[MEMORY[0x263F08850] defaultManager];
  char v24 = 0;
  id v23 = (id)[location[0] path];
  if (([v25 fileExistsAtPath:v23 isDirectory:&v24] & 1) == 0) {
    goto LABEL_15;
  }
  if (!v26)
  {
    id v22 = &_os_log_internal;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v33, (uint64_t)v23, v24 & 1);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v22, v21, "Existing %@, is-directory: %d", v33, 0x12u);
    }
    objc_storeStrong(&v22, 0);
    char v28 = v24 & 1;
    int v20 = 1;
    goto LABEL_24;
  }
  id v19 = 0;
  id v18 = 0;
  char v6 = [v25 removeItemAtURL:location[0] error:&v18];
  objc_storeStrong(&v19, v18);
  if ((v6 & 1) != 0 && !v19)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v23);
      _os_log_debug_impl(&dword_20ABD4000, oslog, v14, "Removed dir %@", v31, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v20 = 0;
  }
  else
  {
    id v17 = &_os_log_internal;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v32, (uint64_t)v23, (uint64_t)v19);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v17, v16, "Could not remove existing dir %@, %@", v32, 0x16u);
    }
    objc_storeStrong(&v17, 0);
    char v28 = 1;
    int v20 = 1;
  }
  objc_storeStrong(&v19, 0);
  if (!v20)
  {
LABEL_15:
    id v13 = 0;
    char v12 = 0;
    id obj = 0;
    char v5 = [v25 createDirectoryAtURL:location[0] withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong(&v13, obj);
    char v12 = v5 & 1;
    if ((v5 & 1) != 0 && !v13)
    {
      os_log_t v8 = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v23);
        _os_log_debug_impl(&dword_20ABD4000, v8, OS_LOG_TYPE_DEBUG, "Created dir %@", v29, 0xCu);
      }
      objc_storeStrong((id *)&v8, 0);
      char v28 = 1;
      int v20 = 1;
    }
    else
    {
      os_log_t v10 = (os_log_t)&_os_log_internal;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v23, (uint64_t)v13);
        _os_log_error_impl(&dword_20ABD4000, v10, v9, "Could not create dir %@, %@", v30, 0x16u);
      }
      objc_storeStrong((id *)&v10, 0);
      char v28 = 0;
      int v20 = 1;
    }
    objc_storeStrong(&v13, 0);
  }
LABEL_24:
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v28 & 1;
}

+ (BOOL)createOrMoveSymbolicLinkAtURL:(id)a3 toDestinationURL:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v39 = (id)[MEMORY[0x263F08850] defaultManager];
  id v38 = 0;
  id v19 = v39;
  id v21 = (id)[location[0] path];
  id v36 = v38;
  id v20 = (id)objc_msgSend(v19, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v38, v36);
  id v37 = v20;

  if (v20 && !v38)
  {
    id v14 = v39;
    id v15 = (id)[location[0] path];
    id v35 = v38;
    char v16 = objc_msgSend(v14, "removeItemAtPath:error:");
    objc_storeStrong(&v38, v35);
    BOOL v17 = 1;
    if (v16) {
      BOOL v17 = v38 != 0;
    }

    if (v17)
    {
      id v34 = &_os_log_internal;
      char v33 = 16;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        log = v34;
        os_log_type_t type = v33;
        id v13 = (id)[location[0] path];
        id v32 = v13;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v46, (uint64_t)v32, (uint64_t)v38);
        _os_log_error_impl(&dword_20ABD4000, log, type, "Could not remove existing link %@, %@", v46, 0x16u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v34, 0);
      char v42 = 0;
      int v31 = 1;
      goto LABEL_21;
    }
    id v30 = &_os_log_internal;
    char v29 = 2;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
    {
      os_log_t v8 = v30;
      os_log_type_t v9 = v29;
      id v10 = (id)[location[0] path];
      id v28 = v10;
      __os_log_helper_16_2_1_8_64((uint64_t)v45, (uint64_t)v28);
      _os_log_debug_impl(&dword_20ABD4000, v8, v9, "Removed existing link %@", v45, 0xCu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
  }
  id v27 = v38;
  [v39 createSymbolicLinkAtURL:location[0] withDestinationURL:v40 error:&v27];
  objc_storeStrong(&v38, v27);
  objc_storeStrong(&v38, 0);
  id v5 = v39;
  id v7 = (id)[location[0] path];
  id v25 = v38;
  id v6 = (id)objc_msgSend(v5, "attributesOfItemAtPath:error:");
  objc_storeStrong(&v38, v25);
  id v26 = v6;

  if (v6 && !v38)
  {
    os_log_t v22 = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v43, (uint64_t)location[0], (uint64_t)v40);
      _os_log_debug_impl(&dword_20ABD4000, v22, OS_LOG_TYPE_DEBUG, "Created link %@ to %@", v43, 0x16u);
    }
    objc_storeStrong((id *)&v22, 0);
    char v42 = 1;
    int v31 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v23 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v44, (uint64_t)location[0], (uint64_t)v40, (uint64_t)v38);
      _os_log_error_impl(&dword_20ABD4000, oslog, v23, "Could not create symbolic link %@ to %@, %@", v44, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v42 = 0;
    int v31 = 1;
  }
  objc_storeStrong(&v26, 0);
LABEL_21:
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  return v42 & 1;
}

+ (void)printInput:(id)a3 withRawData:(void *)a4 withType:(int64_t)a5 andSize:(int)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = (double *)a4;
  uint64_t v31 = a5;
  int v30 = a6;
  id v29 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a6];
  id v28 = 0;
  if (a5 == 65600)
  {
    objc_storeStrong(&v28, @"double");
    id v27 = v32;
    for (int i = 0; i < v30; ++i)
    {
      double v25 = 0.0;
      double v25 = *v27++;
      id v10 = v29;
      id v11 = (id)[NSNumber numberWithDouble:v25];
      objc_msgSend(v10, "addObject:");
    }
LABEL_19:
    id v15 = (id)[NSString stringWithFormat:@"Feature name: %@, type: %@, value: %@", location[0], v28, v29];
    +[AMDPerf log:v15 atLevel:3];
    objc_storeStrong(&v15, 0);
    int v16 = 0;
    goto LABEL_20;
  }
  if (v31 == 65568)
  {
    objc_storeStrong(&v28, @"float");
    char v24 = v32;
    for (int j = 0; j < v30; ++j)
    {
      int v22 = 0;
      int v22 = *(_DWORD *)v24;
      char v24 = (double *)((char *)v24 + 4);
      id v8 = v29;
      id v9 = (id)[NSNumber numberWithFloat:COERCE_DOUBLE((unint64_t)v22)];
      objc_msgSend(v8, "addObject:");
    }
    goto LABEL_19;
  }
  if (v31 == 131104)
  {
    objc_storeStrong(&v28, @"int");
    id v21 = v32;
    for (int k = 0; k < v30; ++k)
    {
      unsigned int v19 = 0;
      unsigned int v19 = *(_DWORD *)v21;
      id v21 = (double *)((char *)v21 + 4);
      id v6 = v29;
      id v7 = (id)[NSNumber numberWithInt:v19];
      objc_msgSend(v6, "addObject:");
    }
    goto LABEL_19;
  }
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v34, v31);
    _os_log_error_impl(&dword_20ABD4000, oslog, type, "Unsupported Input Data Type: %ld", v34, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v16 = 1;
LABEL_20:
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)isValidDSID:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] longLongValue];
  char v5 = 1;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

+ (void)AMDInitialize:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[location[0] objectForKey:@"disableCoreData"];
  BOOL v9 = 0;
  if (v10) {
    BOOL v4 = [v10 intValue] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v9 = v4;
  if (!v4)
  {
    id v3 = +[AMDCoreDataPersistentContainer sharedContainer];
    id v8 = (id)[v3 getManagedObjectContext];

    objc_storeStrong(&v8, 0);
  }
  id v7 = +[AMDSQLite allocSharedInstance];
  id v5 = (id)[location[0] objectForKey:0x26BEAEB98];
  BOOL v6 = v5 == 0;
  [v7 setEnable:v5 == 0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (void)AMDPerformCleanup
{
  v15[2] = a1;
  v15[1] = (id)a2;
  v15[0] = +[AMDSQLite getSharedInstance];
  if ([v15[0] getDb])
  {
    unsigned int v10 = sqlite3_close((sqlite3 *)[v15[0] getDb]);
    if (v10)
    {
      id v6 = (id)objc_msgSend(NSString, "stringWithFormat:", @"SQL Connection could not be closed with error code: %u", v10);
      +[AMDFrameworkMetrics log:v6 withKey:@"AMDCleanupFailed" atVerbosity:0];
      objc_storeStrong(&v6, 0);
    }
    else
    {
      id v9 = &_os_log_internal;
      char v8 = 1;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v2 = v9;
        os_log_type_t v3 = v8;
        __os_log_helper_16_0_0(v7);
        _os_log_impl(&dword_20ABD4000, v2, v3, "SQL Connection closed successfully", v7, 2u);
      }
      objc_storeStrong(&v9, 0);
      +[AMDFrameworkMetrics log:@"SQL connection closed" withKey:@"AMDCleanupSuccess" atVerbosity:0];
    }
    int v11 = 0;
  }
  else
  {
    id location = &_os_log_internal;
    char v13 = 1;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      log = location;
      os_log_type_t type = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_impl(&dword_20ABD4000, log, type, "Nil SQL database connection", v12, 2u);
    }
    objc_storeStrong(&location, 0);
    +[AMDFrameworkMetrics log:@"SQL database unusable" withKey:@"AMDCleanupFailed" atVerbosity:0];
    int v11 = 1;
  }
  objc_storeStrong(v15, 0);
}

+ (id)logAndCreateError:(int64_t)a3 errorMessage:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v10 = a1;
  SEL v9 = a2;
  int64_t v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_t oslog = (os_log_t)&_os_log_internal;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)location);
    _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = +[AMDError allocError:v8 withMessage:location];
  objc_storeStrong(&location, 0);

  return v5;
}

+ (id)getCurrentEpochSeconds
{
  v5[2] = a1;
  v5[1] = (id)a2;
  v5[0] = (id)[MEMORY[0x263EFF910] date];
  [v5[0] timeIntervalSince1970];
  id v4 = (id)[NSNumber numberWithUnsignedInt:v2];
  objc_storeStrong(v5, 0);

  return v4;
}

+ (id)sortArrayElements:(id)a3 inDescendingOrder:(BOOL)a4 withComparisonKey:(id)a5 isKeyString:(BOOL)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  BOOL v26 = a6;
  v22[0] = 0;
  v22[1] = v22;
  int v23 = 0x20000000;
  int v24 = 32;
  BOOL v25 = a6;
  v18[0] = 0;
  v18[1] = v18;
  int v19 = 0x20000000;
  int v20 = 32;
  BOOL v21 = v28;
  id v11 = location[0];
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = __84__AMDMiscHelpers_sortArrayElements_inDescendingOrder_withComparisonKey_isKeyString___block_invoke;
  int v16 = &unk_263FE2060;
  v17[1] = v18;
  v17[0] = v27;
  v17[2] = v22;
  id v7 = (id)[v11 sortedArrayUsingComparator:&v12];
  objc_storeStrong(v17, 0);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v22, 8);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);

  return v7;
}

uint64_t __84__AMDMiscHelpers_sortArrayElements_inDescendingOrder_withComparisonKey_isKeyString___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = 0;
  id v12 = 0;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v3 = (id)[v14 objectForKey:a1[4]];
    id v4 = v13[0];
    v13[0] = v3;

    id v5 = (id)[location[0] objectForKey:a1[4]];
  }
  else
  {
    id v7 = (id)[location[0] objectForKey:a1[4]];
    id v8 = v13[0];
    v13[0] = v7;

    id v5 = (id)[v14 objectForKey:a1[4]];
  }
  id v6 = v12;
  id v12 = v5;

  uint64_t v16 = [v13[0] compare:v12];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

+ (id)convertDataArrayToBase64StringArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(__b[1] + 8 * v7);
        id v11 = (id)[v13 base64EncodedStringWithOptions:0];
        [v14 addObject:v11];
        objc_storeStrong(&v11, 0);
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }
    int v15 = 0;

    if (!v15)
    {
      id v17 = v14;
      int v15 = 1;
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    id v17 = 0;
    int v15 = 1;
  }
  objc_storeStrong(location, 0);
  id v3 = v17;

  return v3;
}

+ (id)extractPECSimilarityScores:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = a4;
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
      memset(__b, 0, sizeof(__b));
      id obj = location[0];
      uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
      if (v19)
      {
        uint64_t v15 = *(void *)__b[2];
        uint64_t v16 = 0;
        unint64_t v17 = v19;
        while (1)
        {
          uint64_t v14 = v16;
          if (*(void *)__b[2] != v15) {
            objc_enumerationMutation(obj);
          }
          id v24 = *(id *)(__b[1] + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          id v8 = v22;
          id v9 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v24, "identifier"));
          objc_msgSend(v8, "setObject:forKey:");

          id v11 = v22;
          uint64_t v10 = NSNumber;
          [v24 score];
          id v12 = (id)objc_msgSend(v10, "numberWithFloat:");
          objc_msgSend(v11, "setObject:forKey:");

          id v13 = (id)[v24 metadata];
          if (v13)
          {
            id v7 = (id)[v24 metadata];
            id v21 = (id)[v7 base64EncodedStringWithOptions:0];

            [v22 setObject:v21 forKey:@"metadata"];
            objc_storeStrong(&v21, 0);
          }
          [v25 addObject:v22];
          objc_storeStrong(&v22, 0);
          ++v16;
          if (v14 + 1 >= v17)
          {
            uint64_t v16 = 0;
            unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
            if (!v17) {
              goto LABEL_15;
            }
          }
        }
        id v4 = +[AMDError allocError:14 withMessage:@"score not an instance of CMLSimilarityScore"];
        *id v27 = v4;
        id v29 = 0;
        int v26 = 1;
      }
      else
      {
LABEL_15:
        int v26 = 0;
      }

      if (!v26)
      {
        id v29 = v25;
        int v26 = 1;
      }
      objc_storeStrong(&v25, 0);
    }
    else
    {
      *id v27 = +[AMDError allocError:14 withMessage:@"similarityScoresArray not an instance of NSArray"];
      id v29 = 0;
      int v26 = 1;
    }
  }
  else
  {
    id v29 = 0;
    int v26 = 1;
  }
  objc_storeStrong(location, 0);
  uint64_t v5 = v29;

  return v5;
}

@end