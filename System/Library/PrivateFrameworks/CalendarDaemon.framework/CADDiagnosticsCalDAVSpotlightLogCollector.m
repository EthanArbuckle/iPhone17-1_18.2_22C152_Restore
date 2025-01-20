@interface CADDiagnosticsCalDAVSpotlightLogCollector
- (id)findAllLogFiles:(id)a3;
- (id)parseFilenameDates:(id)a3 context:(id)a4;
- (id)sortAndTrimLogFiles:(id)a3 context:(id)a4;
- (void)collect:(id)a3;
- (void)determineExpectedOutputFiles:(id)a3;
@end

@implementation CADDiagnosticsCalDAVSpotlightLogCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CADDiagnosticsCalDAVSpotlightLogCollector *)self findAllLogFiles:v4];
  objc_msgSend(v4, "log:", @"Found %lu spotlight logs", objc_msgSend(v5, "count"));
  v6 = [(CADDiagnosticsCalDAVSpotlightLogCollector *)self sortAndTrimLogFiles:v5 context:v4];
  objc_msgSend(v4, "log:", @"Including %lu spotlight logs", objc_msgSend(v6, "count"));
  objc_storeStrong((id *)&self->_orderedInputURLs, v6);
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) lastPathComponent];
        v14 = [v4 temporaryFileForName:v13];
        [v4 setStatus:0 forFile:v14];
        [(NSArray *)v7 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  orderedOutputURLs = self->_orderedOutputURLs;
  self->_orderedOutputURLs = v7;
}

- (id)findAllLogFiles:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = DACustomLogDirectory();
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v24];
  id v7 = v24;

  if (!v6) {
    [v3 logError:@"Unable to find spotlight logs: %@", v7];
  }
  long long v16 = v7;
  long long v17 = (void *)v4;
  long long v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
  id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v13 hasPrefix:@"SpotlightLog"]
          && ([v13 containsString:@"-latest"] & 1) == 0)
        {
          v14 = [v19 URLByAppendingPathComponent:v13];
          if (v14)
          {
            [v3 log:@"Found log file %@", v13];
            [v18 addObject:v14];
          }
          else
          {
            [v3 logError:@"Unable to construct URL for file %@; skipping", v13];
          }
        }
        else
        {
          [v3 log:@"Ignoring irrelevant file %@", v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }

  return v18;
}

- (id)sortAndTrimLogFiles:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = [(CADDiagnosticsCalDAVSpotlightLogCollector *)self parseFilenameDates:v7 context:v6];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __73__CADDiagnosticsCalDAVSpotlightLogCollector_sortAndTrimLogFiles_context___block_invoke;
  v15 = &unk_1E624E988;
  id v10 = v9;
  id v16 = v10;
  [v8 sortUsingComparator:&v12];
  if ((unint64_t)[v8 count] >= 0x15)
  {
    objc_msgSend(v6, "log:", @"Too many spotlight logs; only including the most recent %i",
      20,
      v12,
      v13,
      v14,
      v15);
    objc_msgSend(v8, "removeObjectsInRange:", 20, objc_msgSend(v8, "count") - 20);
  }

  return v8;
}

uint64_t __73__CADDiagnosticsCalDAVSpotlightLogCollector_sortAndTrimLogFiles_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  id v10 = v9;

  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  uint64_t v13 = v12;

  uint64_t v14 = [v13 compare:v10];
  return v14;
}

- (id)parseFilenameDates:(id)a3 context:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateStyle:1];
  long long v22 = v6;
  [v6 setDateFormat:@"yyyy_MM_dd_HH_mm_ssZZZ"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [v11 lastPathComponent];
        unint64_t v13 = [v12 rangeOfString:@".log"];
        unint64_t v14 = [v12 rangeOfString:@"_"];
        if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= v13)
        {
          [v24 logError:@"Unexpected log file name: %@", v12];
        }
        else
        {
          long long v17 = objc_msgSend(v12, "substringWithRange:", v14 + 1, v13 + ~v14);
          uint64_t v18 = [v22 dateFromString:v17];
          long long v19 = (void *)v18;
          if (v18) {
            [v21 setObject:v18 forKeyedSubscript:v11];
          }
          else {
            [v24 logError:@"Couldn't parse %@ into a date", v17];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v21;
}

- (void)collect:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v17 = self;
  id obj = self->_orderedInputURLs;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = [(NSArray *)v17->_orderedOutputURLs objectAtIndexedSubscript:v7 + v9];
      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v18 = 0;
      char v13 = [v12 copyItemAtURL:v10 toURL:v11 error:&v18];
      id v14 = v18;

      if (v13) {
        [v4 setStatus:2 forFile:v11];
      }
      else {
        [v4 logError:@"Failed to copy log from %@ to %@: %@", v10, v11, v14];
      }
      char v15 = [v4 canceled];

      if (v15) {
        break;
      }
      if (v6 == ++v9)
      {
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        v7 += v9;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedOutputURLs, 0);
  objc_storeStrong((id *)&self->_orderedInputURLs, 0);
}

@end