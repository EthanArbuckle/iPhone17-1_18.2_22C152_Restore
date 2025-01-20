@interface HFDemoModeFaceRecognitionDataSource
- (HFDemoModeFaceRecognitionDataSource)init;
- (NSArray)knownToHouseholdEntries;
- (NSArray)recentsEntries;
- (id)arrayFromPlistArray:(id)a3;
- (void)setKnownToHouseholdEntries:(id)a3;
- (void)setRecentsEntries:(id)a3;
@end

@implementation HFDemoModeFaceRecognitionDataSource

- (HFDemoModeFaceRecognitionDataSource)init
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)HFDemoModeFaceRecognitionDataSource;
  v2 = [(HFDemoModeFaceRecognitionDataSource *)&v24 init];
  v3 = v2;
  if (v2)
  {
    recentsEntries = v2->_recentsEntries;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_recentsEntries = (NSArray *)MEMORY[0x263EFFA68];

    knownToHouseholdEntries = v3->_knownToHouseholdEntries;
    v3->_knownToHouseholdEntries = v5;

    v7 = +[HFUtilities demoModeDirectoryURL];
    v8 = [NSURL URLWithString:@"FaceRecognition.plist" relativeToURL:v7];
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      v12 = [NSDictionary dictionaryWithContentsOfURL:v8];
      v13 = [v12 objectForKeyedSubscript:@"recentVisitors"];
      v14 = [v12 objectForKeyedSubscript:@"knownPersons"];
    }
    else
    {
      v12 = 0;
      v14 = 0;
      v13 = 0;
    }
    if ([v13 count])
    {
      uint64_t v15 = [(HFDemoModeFaceRecognitionDataSource *)v3 arrayFromPlistArray:v13];
      v16 = v3->_recentsEntries;
      v3->_recentsEntries = (NSArray *)v15;

      v17 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [(NSArray *)v3->_recentsEntries count];
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v18;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu recents entries", buf, 0xCu);
      }
    }
    else
    {
      v17 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v8;
        _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "No recents items found in plist at location %@", buf, 0xCu);
      }
    }

    if ([v14 count])
    {
      uint64_t v19 = [(HFDemoModeFaceRecognitionDataSource *)v3 arrayFromPlistArray:v14];
      v20 = v3->_knownToHouseholdEntries;
      v3->_knownToHouseholdEntries = (NSArray *)v19;

      v21 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [(NSArray *)v3->_knownToHouseholdEntries count];
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v22;
        _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Found %lu known to household entries", buf, 0xCu);
      }
    }
    else
    {
      v21 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v8;
        _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "No persons found in plist at location %@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (id)arrayFromPlistArray:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v30 = +[HFUtilities demoModeDirectoryURL];
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v32 = *(void *)v34;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        v12 = [v11 objectForKeyedSubscript:@"displayName"];
        v13 = [v11 objectForKeyedSubscript:@"fileName"];
        v14 = [v11 objectForKeyedSubscript:@"secondsOffset"];
        if ([v13 length] || objc_msgSend(v12, "length"))
        {
          if (objc_msgSend(v13, "length", v28))
          {
            uint64_t v15 = (void *)MEMORY[0x263EFF8F8];
            v16 = [NSURL URLWithString:v13 relativeToURL:v30];
            v17 = [v15 dataWithContentsOfURL:v16];

            uint64_t v18 = (void *)MEMORY[0x263EFF910];
            if (v14)
            {
              [v14 doubleValue];
              objc_msgSend(v18, "dateWithTimeIntervalSinceNow:");
            }
            else
            {
              [MEMORY[0x263EFF910] distantFuture];
            v20 = };
            if (v17)
            {
              id v21 = objc_alloc(MEMORY[0x263F0E358]);
              uint64_t v22 = [MEMORY[0x263F08C38] UUID];
              uint64_t v19 = objc_msgSend(v21, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v22, v17, v20, 0.0, 0.0, 1.0, 1.0);
            }
            else
            {
              uint64_t v22 = HFLogForCategory(0x21uLL);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v38 = v13;
                _os_log_error_impl(&dword_20B986000, v22, OS_LOG_TYPE_ERROR, "Filename %@ specified but no data was found for image", buf, 0xCu);
              }
              uint64_t v19 = 0;
            }
          }
          else
          {
            uint64_t v19 = 0;
          }
          id v23 = objc_alloc(MEMORY[0x263F0E5C0]);
          objc_super v24 = [MEMORY[0x263F08C38] UUID];
          v25 = (void *)[v23 initWithUUID:v24];

          [v25 setName:v12];
          uint64_t v26 = [[HFDemoModeFaceRecognitionRecentsData alloc] initWithPerson:v25 faceCrop:v19];
          [v31 addObject:v26];
        }
        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v6);
  }

  return v31;
}

- (NSArray)recentsEntries
{
  return self->_recentsEntries;
}

- (void)setRecentsEntries:(id)a3
{
}

- (NSArray)knownToHouseholdEntries
{
  return self->_knownToHouseholdEntries;
}

- (void)setKnownToHouseholdEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownToHouseholdEntries, 0);
  objc_storeStrong((id *)&self->_recentsEntries, 0);
}

@end