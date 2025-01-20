@interface AMDModelAssets
+ (id)loadMapFromDir:(id)a3 andFile:(id)a4 error:(id *)a5;
+ (void)saveMap:(id)a3 toDir:(id)a4 inFile:(id)a5 keyIsInt64:(BOOL)a6 error:(id *)a7;
- (AMDModelAssetsMetadata)assetsMetadata;
- (BOOL)getMinimalMapPresent;
- (BOOL)isValid;
- (BOOL)minimalMapPresent;
- (BOOL)useBinaryInputMap;
- (BOOL)useBinaryOutputMap;
- (NSData)contentToLogicalMap;
- (NSData)logicalToContentMap;
- (id)getContentToLogicalMap;
- (id)getLogicalToContentMap;
- (id)initFromDir:(id)a3 andMetadata:(id)a4 useBinaryInputMap:(BOOL)a5 useBinaryOutputMap:(BOOL)a6 withModelId:(id)a7 isInference:(BOOL)a8 error:(id *)a9;
- (void)loadCToLMapFromDir:(id)a3 error:(id *)a4;
- (void)loadLToCMapFromDir:(id)a3 error:(id *)a4;
- (void)saveCToLMap:(id)a3 toDir:(id)a4 error:(id *)a5;
- (void)saveLToCMap:(id)a3 toDir:(id)a4 error:(id *)a5;
- (void)setAssetsMetadata:(id)a3;
- (void)setContentToLogicalMap:(id)a3;
- (void)setLogicalToContentMap:(id)a3;
- (void)setMinimalMapPresent:(BOOL)a3;
- (void)setUseBinaryInputMap:(BOOL)a3;
- (void)setUseBinaryOutputMap:(BOOL)a3;
@end

@implementation AMDModelAssets

- (id)getContentToLogicalMap
{
  return [(AMDModelAssets *)self contentToLogicalMap];
}

- (id)getLogicalToContentMap
{
  return [(AMDModelAssets *)self logicalToContentMap];
}

- (BOOL)getMinimalMapPresent
{
  return [(AMDModelAssets *)self minimalMapPresent];
}

+ (id)loadMapFromDir:(id)a3 andFile:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v33 = a5;
  id v13 = (id)[location[0] stringByAppendingPathComponent:v34];
  id v32 = (id)[v13 stringByAppendingPathExtension:@"bin"];

  id v14 = (id)[MEMORY[0x263F08850] defaultManager];
  char v15 = [v14 fileExistsAtPath:v32];

  if (v15)
  {
    id v28 = &_os_log_internal;
    os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v32);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v28, v27, "Loading binary map data from %@", v40, 0xCu);
    }
    objc_storeStrong(&v28, 0);
    v9 = (void *)MEMORY[0x263EFF8F8];
    id v10 = (id)[NSURL fileURLWithPath:v32];
    id v26 = (id)objc_msgSend(v9, "dataWithContentsOfURL:");

    if (v26)
    {
      v22 = (int *)[v26 bytes];
      int v21 = 0;
      int v21 = *v22++;
      unsigned int v20 = 12 * v21 + 4;
      if ([v26 length] == v20)
      {
        os_log_t v16 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_2_4_0_8_0((uint64_t)v37, v21, [v26 length]);
          _os_log_debug_impl(&dword_20ABD4000, v16, OS_LOG_TYPE_DEBUG, "Number of map entries: %u, buffer size: %lu", v37, 0x12u);
        }
        objc_storeStrong((id *)&v16, 0);
        id v36 = v26;
        int v29 = 1;
      }
      else
      {
        id v19 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Unexpected buffer size: %lu (expected: %u)", objc_msgSend(v26, "length"), v20);
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)v19);
          _os_log_error_impl(&dword_20ABD4000, oslog, v17, "%@", v38, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        id v6 = +[AMDError allocError:7 withMessage:v19];
        id *v33 = v6;
        id v36 = 0;
        int v29 = 1;
        objc_storeStrong(&v19, 0);
      }
    }
    else
    {
      id v25 = (id)[NSString stringWithFormat:@"Could not read from file %@", v32];
      id v24 = &_os_log_internal;
      os_log_type_t v23 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)v25);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v24, v23, "%@", v39, 0xCu);
      }
      objc_storeStrong(&v24, 0);
      id v5 = +[AMDError allocError:7 withMessage:v25];
      id *v33 = v5;
      id v36 = 0;
      int v29 = 1;
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v31 = &_os_log_internal;
    os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v32);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v31, v30, "Data file not present: %@", v41, 0xCu);
    }
    objc_storeStrong(&v31, 0);
    id *v33 = 0;
    id v36 = 0;
    int v29 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  v7 = v36;

  return v7;
}

- (void)loadCToLMapFromDir:(id)a3 error:(id *)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(AMDModelAssets *)v8 useBinaryInputMap])
  {
    id v4 = +[AMDModelAssets loadMapFromDir:location[0] andFile:@"content_id_to_logical_id" error:a4];
    -[AMDModelAssets setContentToLogicalMap:](v8, "setContentToLogicalMap:");

    id v5 = [(AMDModelAssets *)v8 contentToLogicalMap];
    if (v5) {
      +[AMDPerf sampleForKey:@"loadedCToL"];
    }
  }
  objc_storeStrong(location, 0);
}

- (void)loadLToCMapFromDir:(id)a3 error:(id *)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(AMDModelAssets *)v8 useBinaryOutputMap])
  {
    id v4 = +[AMDModelAssets loadMapFromDir:location[0] andFile:@"label_index_to_content_id" error:a4];
    -[AMDModelAssets setLogicalToContentMap:](v8, "setLogicalToContentMap:");

    id v5 = [(AMDModelAssets *)v8 logicalToContentMap];
    if (v5) {
      +[AMDPerf sampleForKey:@"loadedLToC"];
    }
  }
  objc_storeStrong(location, 0);
}

+ (void)saveMap:(id)a3 toDir:(id)a4 inFile:(id)a5 keyIsInt64:(BOOL)a6 error:(id *)a7
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  id v55 = 0;
  objc_storeStrong(&v55, a5);
  BOOL v54 = a6;
  v53 = a7;
  id v24 = (id)[v56 stringByAppendingPathComponent:v55];
  id v52 = (id)[v24 stringByAppendingPathExtension:@"bin"];

  id v22 = (id)[MEMORY[0x263F08850] defaultManager];
  char v23 = [v22 fileExistsAtPath:v52];

  if (v23)
  {
    id v51 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v64, (uint64_t)v52);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v51, type, "Data file already present: %@", v64, 0xCu);
    }
    objc_storeStrong(&v51, 0);
    int v49 = 1;
  }
  else
  {
    int v48 = [location[0] count];
    unsigned int v47 = 12 * v48 + 4;
    id v46 = &_os_log_internal;
    os_log_type_t v45 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_4_0_4_0((uint64_t)v63, v48, v47);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v46, v45, "Preparing %u entries, buffer size: %u", v63, 0xEu);
    }
    objc_storeStrong(&v46, 0);
    v44 = malloc_type_malloc(v47, 0x7F2C589BuLL);
    v43 = v44;
    _DWORD *v44 = v48;
    ++v43;
    if (v54)
    {
      memset(__b, 0, sizeof(__b));
      id v20 = location[0];
      uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v62 count:16];
      if (v21)
      {
        uint64_t v17 = *(void *)__b[2];
        uint64_t v18 = 0;
        unint64_t v19 = v21;
        while (1)
        {
          uint64_t v16 = v18;
          if (*(void *)__b[2] != v17) {
            objc_enumerationMutation(v20);
          }
          id v42 = *(id *)(__b[1] + 8 * v18);
          id v15 = (id)[location[0] objectForKey:v42];
          _DWORD *v43 = [v15 intValue];

          *(void *)++v43 = [v42 longLongValue];
          v43 += 2;
          ++v18;
          if (v16 + 1 >= v19)
          {
            uint64_t v18 = 0;
            unint64_t v19 = [v20 countByEnumeratingWithState:__b objects:v62 count:16];
            if (!v19) {
              break;
            }
          }
        }
      }
    }
    else
    {
      memset(v39, 0, sizeof(v39));
      id v13 = location[0];
      uint64_t v14 = [v13 countByEnumeratingWithState:v39 objects:v61 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)v39[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)v39[2] != v10) {
            objc_enumerationMutation(v13);
          }
          id v40 = *(id *)(v39[1] + 8 * v11);
          *v43++ = [v40 intValue];
          id v8 = (id)[location[0] objectForKey:v40];
          *(void *)v43 = [v8 longLongValue];

          v43 += 2;
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [v13 countByEnumeratingWithState:v39 objects:v61 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }
    }
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_4_0_8_64((uint64_t)v60, v48, (uint64_t)v52);
      _os_log_debug_impl(&dword_20ABD4000, oslog, v37, "Saving binary map data (%u entries) to %@", v60, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v36 = (id)[MEMORY[0x263EFF9E0] outputStreamToFileAtPath:v52 append:0];
    char v35 = 0;
    if (v36)
    {
      [v36 open];
      uint64_t v31 = [v36 write:v44 maxLength:v47];
      if (v31 > 0)
      {
        int v49 = 0;
      }
      else
      {
        id v30 = (id)[NSString stringWithFormat:@"error writing to %@", v52];
        os_log_t v29 = (os_log_t)&_os_log_internal;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v30);
          _os_log_error_impl(&dword_20ABD4000, v29, OS_LOG_TYPE_ERROR, "%@", v58, 0xCu);
        }
        objc_storeStrong((id *)&v29, 0);
        id *v53 = +[AMDError allocError:7 withMessage:v30];
        int v49 = 1;
        objc_storeStrong(&v30, 0);
      }
    }
    else
    {
      id v34 = (id)[NSString stringWithFormat:@"could not open output stream to file %@", v52];
      os_log_t v33 = (os_log_t)&_os_log_internal;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v34);
        _os_log_error_impl(&dword_20ABD4000, v33, v32, "%@", v59, 0xCu);
      }
      objc_storeStrong((id *)&v33, 0);
      id *v53 = +[AMDError allocError:7 withMessage:v34];
      int v49 = 1;
      objc_storeStrong(&v34, 0);
    }
    int v7 = v49;
    free(v44);
    [v36 close];
    if (v35) {
      objc_exception_rethrow();
    }
    int v49 = v7;
    if (v7)
    {
      if (v7 == 6)
      {
        __break(1u);
        JUMPOUT(0x20AC4B34CLL);
      }
    }
    else
    {
      int v49 = 0;
    }
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
}

- (void)saveCToLMap:(id)a3 toDir:(id)a4 error:(id *)a5
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ([(AMDModelAssets *)v9 useBinaryInputMap])
  {
    +[AMDModelAssets saveMap:location[0] toDir:v7 inFile:@"content_id_to_logical_id" keyIsInt64:1 error:a5];
    +[AMDPerf sampleForKey:@"savedCToL"];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)saveLToCMap:(id)a3 toDir:(id)a4 error:(id *)a5
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ([(AMDModelAssets *)v9 useBinaryInputMap])
  {
    +[AMDModelAssets saveMap:location[0] toDir:v7 inFile:@"label_index_to_content_id" keyIsInt64:0 error:a5];
    +[AMDPerf sampleForKey:@"savedLToC"];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)initFromDir:(id)a3 andMetadata:(id)a4 useBinaryInputMap:(BOOL)a5 useBinaryOutputMap:(BOOL)a6 withModelId:(id)a7 isInference:(BOOL)a8 error:(id *)a9
{
  id v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  BOOL v32 = a5;
  BOOL v31 = a6;
  id v30 = 0;
  objc_storeStrong(&v30, a7);
  BOOL v29 = a8;
  id v28 = a9;
  id v9 = v35;
  id v35 = 0;
  v27.receiver = v9;
  v27.super_class = (Class)AMDModelAssets;
  id v35 = [(AMDModelAssets *)&v27 init];
  objc_storeStrong(&v35, v35);
  [v35 setContentToLogicalMap:0];
  [v35 setLogicalToContentMap:0];
  [v35 setUseBinaryInputMap:v32];
  [v35 setUseBinaryOutputMap:v31];
  [v35 setAssetsMetadata:v33];
  [v35 loadLToCMapFromDir:location[0] error:v28];
  if (*v28)
  {
    id v36 = 0;
    int v26 = 1;
  }
  else
  {
    if (!v29) {
      goto LABEL_11;
    }
    id v25 = 0;
    id v24 = (id)[NSString stringWithFormat:@"%@%@", 0x26BEB7D38, v30];
    id v22 = v25;
    id v13 = +[AMDTasteProfile getFeatureValueWithName:v24 inDomain:@"apps" error:&v22];
    objc_storeStrong(&v25, v22);
    id v23 = v13;
    if (!v13 || v25)
    {
      int v26 = 0;
    }
    else
    {
      [v35 setMinimalMapPresent:1];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        log = oslog;
        os_log_type_t v12 = type;
        __os_log_helper_16_0_0(v19);
        _os_log_impl(&dword_20ABD4000, log, v12, "Minimal map of content to logical Id is present. Skipping binary map loading", v19, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v36 = v35;
      int v26 = 1;
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    if (!v26)
    {
LABEL_11:
      [v35 setMinimalMapPresent:0];
      [v35 loadCToLMapFromDir:location[0] error:v28];
      if (*v28) {
        id v36 = 0;
      }
      else {
        id v36 = v35;
      }
      int v26 = 1;
    }
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v35, 0);
  return v36;
}

- (BOOL)isValid
{
  id v4 = [(AMDModelAssets *)self contentToLogicalMap];
  char v5 = 0;
  if (!v4
    || (id v6 = [(AMDModelAssets *)self logicalToContentMap],
        char v5 = 1,
        BOOL v3 = 1,
        !v6))
  {
    BOOL v3 = [(AMDModelAssets *)self minimalMapPresent];
  }
  if (v5) {

  }
  return v3;
}

- (AMDModelAssetsMetadata)assetsMetadata
{
  return self->_assetsMetadata;
}

- (void)setAssetsMetadata:(id)a3
{
}

- (NSData)contentToLogicalMap
{
  return self->_contentToLogicalMap;
}

- (void)setContentToLogicalMap:(id)a3
{
}

- (NSData)logicalToContentMap
{
  return self->_logicalToContentMap;
}

- (void)setLogicalToContentMap:(id)a3
{
}

- (BOOL)useBinaryInputMap
{
  return self->_useBinaryInputMap;
}

- (void)setUseBinaryInputMap:(BOOL)a3
{
  self->_useBinaryInputMap = a3;
}

- (BOOL)useBinaryOutputMap
{
  return self->_useBinaryOutputMap;
}

- (void)setUseBinaryOutputMap:(BOOL)a3
{
  self->_useBinaryOutputMap = a3;
}

- (BOOL)minimalMapPresent
{
  return self->_minimalMapPresent;
}

- (void)setMinimalMapPresent:(BOOL)a3
{
  self->_minimalMapPresent = a3;
}

- (void).cxx_destruct
{
}

@end