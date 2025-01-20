@interface CADDiagnosticsCalDAVTrafficLogCollector
+ (BOOL)_shouldIncludeLogWithFilename:(id)a3;
- (BOOL)limitedLogs;
- (id)_filteredLogsFromAllLogs:(id)a3 context:(id)a4;
- (id)_limitedLogsFromAllFiles:(id)a3 context:(id)a4;
- (id)_recentLogsFromAllFiles:(id)a3 context:(id)a4;
- (id)findAllLogFiles:(id)a3;
- (id)parseFilenameDates:(id)a3 context:(id)a4;
- (void)collect:(id)a3;
- (void)determineExpectedOutputFiles:(id)a3;
- (void)setLimitedLogs:(BOOL)a3;
@end

@implementation CADDiagnosticsCalDAVTrafficLogCollector

- (void)determineExpectedOutputFiles:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(CADDiagnosticsCalDAVTrafficLogCollector *)self findAllLogFiles:v4];
  objc_msgSend(v4, "log:", @"Found %lu traffic logs", objc_msgSend(v5, "count"));
  v19 = v5;
  v6 = [(CADDiagnosticsCalDAVTrafficLogCollector *)self _filteredLogsFromAllLogs:v5 context:v4];
  objc_msgSend(v4, "log:", @"Including %lu traffic logs", objc_msgSend(v6, "count"));
  v20 = self;
  objc_storeStrong((id *)&self->_orderedInputURLs, v6);
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v21 + 1) + 8 * v12) lastPathComponent];
        if ([v4 redactLogs])
        {
          v14 = [v13 pathExtension];
          char v15 = [v14 isEqualToString:@"gz"];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v13 stringByAppendingPathExtension:@"gz"];

            v13 = (void *)v16;
          }
        }
        v17 = [v4 temporaryFileForName:v13];
        [v4 setStatus:0 forFile:v17];
        [(NSArray *)v7 addObject:v17];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  orderedOutputURLs = v20->_orderedOutputURLs;
  v20->_orderedOutputURLs = v7;
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
    [v3 logError:@"Unable to find traffic logs: %@", v7];
  }
  v17 = v7;
  v18 = (void *)v4;
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:1];
  id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([(id)objc_opt_class() _shouldIncludeLogWithFilename:v14])
        {
          char v15 = [v8 URLByAppendingPathComponent:v14];
          if (v15)
          {
            [v3 log:@"Found log file %@", v14];
            [v19 addObject:v15];
          }
          else
          {
            [v3 logError:@"Unable to construct URL for file %@; skipping", v14];
          }
        }
        else
        {
          [v3 log:@"Ignoring irrelevant file %@", v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }

  return v19;
}

+ (BOOL)_shouldIncludeLogWithFilename:(id)a3
{
  id v3 = a3;
  if (([v3 containsString:@"-latest"] & 1) != 0
    || ![v3 hasPrefix:@"CalDAVHTTPTraffic."])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 containsString:@"com.apple.remindd"] ^ 1;
  }

  return v4;
}

- (id)_filteredLogsFromAllLogs:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(CADDiagnosticsCalDAVTrafficLogCollector *)self limitedLogs]) {
    [(CADDiagnosticsCalDAVTrafficLogCollector *)self _limitedLogsFromAllFiles:v7 context:v6];
  }
  else {
  id v8 = [(CADDiagnosticsCalDAVTrafficLogCollector *)self _recentLogsFromAllFiles:v7 context:v6];
  }

  return v8;
}

- (id)_limitedLogsFromAllFiles:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v7 mutableCopy];
  id v9 = [(CADDiagnosticsCalDAVTrafficLogCollector *)self parseFilenameDates:v7 context:v6];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __76__CADDiagnosticsCalDAVTrafficLogCollector__limitedLogsFromAllFiles_context___block_invoke;
  char v15 = &unk_1E624E988;
  id v10 = v9;
  id v16 = v10;
  [v8 sortUsingComparator:&v12];
  if ((unint64_t)[v8 count] >= 0xB)
  {
    objc_msgSend(v6, "log:", @"Too many traffic logs; only including the most recent %i",
      10,
      v12,
      v13,
      v14,
      v15);
    objc_msgSend(v8, "removeObjectsInRange:", 10, objc_msgSend(v8, "count") - 10);
  }

  return v8;
}

uint64_t __76__CADDiagnosticsCalDAVTrafficLogCollector__limitedLogsFromAllFiles_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

- (id)_recentLogsFromAllFiles:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__CADDiagnosticsCalDAVTrafficLogCollector__recentLogsFromAllFiles_context___block_invoke;
  v16[3] = &unk_1E624ECE8;
  id v17 = v5;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v12 = v5;
  [v7 enumerateObjectsUsingBlock:v16];

  uint64_t v13 = v19;
  id v14 = v10;

  return v14;
}

void __75__CADDiagnosticsCalDAVTrafficLogCollector__recentLogsFromAllFiles_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C530];
  id v13 = 0;
  char v5 = [v3 getResourceValue:&v14 forKey:v4 error:&v13];
  id v6 = v14;
  id v7 = v13;
  if (v5)
  {
    [*(id *)(a1 + 40) timeIntervalSinceDate:v6];
    if (v8 <= 604800.0)
    {
      [*(id *)(a1 + 48) addObject:v3];
      goto LABEL_7;
    }
    id v9 = *(void **)(a1 + 32);
    id v10 = [v3 path];
    [v9 log:@"Excluding log %@ because it is too old", v10];
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    id v12 = v6;
    id v10 = [v3 path];
    [v11 logError:@"Failed to get last modified date for file %@ (%@). Skipping it.", v10, v7];
  }

LABEL_7:
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
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [v11 lastPathComponent];
        unint64_t v13 = [v12 rangeOfString:@".log"];
        unint64_t v14 = [v12 rangeOfString:@"_"];
        if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL || v14 >= v13)
        {
          [v24 logError:@"Unexpected log file name: %@", v12];
        }
        else
        {
          id v17 = objc_msgSend(v12, "substringWithRange:", v14 + 1, v13 + ~v14);
          uint64_t v18 = [v22 dateFromString:v17];
          id v19 = (void *)v18;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = self->_orderedInputURLs;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      uint64_t v19 = v6;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        id v11 = [(NSArray *)self->_orderedOutputURLs objectAtIndexedSubscript:v7 + v9];
        if ([v4 redactLogs])
        {
          if (+[CalDAVTrafficLogScrubber redactLog:v10 toOutputFile:v11 context:v4])
          {
            goto LABEL_11;
          }
        }
        else
        {
          uint64_t v12 = v7;
          uint64_t v13 = v8;
          unint64_t v14 = self;
          char v15 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v21 = 0;
          int v16 = [v15 copyItemAtURL:v10 toURL:v11 error:&v21];
          id v17 = v21;

          if (v16)
          {

            self = v14;
            uint64_t v8 = v13;
            uint64_t v7 = v12;
            uint64_t v6 = v19;
LABEL_11:
            [v4 setStatus:2 forFile:v11];
            goto LABEL_13;
          }
          [v4 logError:@"Failed to copy log from %@ to %@: %@", v10, v11, v17];

          self = v14;
          uint64_t v8 = v13;
          uint64_t v7 = v12;
          uint64_t v6 = v19;
        }
LABEL_13:
        char v18 = [v4 canceled];

        if (v18) {
          goto LABEL_16;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      v7 += v9;
    }
    while (v6);
  }
LABEL_16:
}

- (BOOL)limitedLogs
{
  return self->_limitedLogs;
}

- (void)setLimitedLogs:(BOOL)a3
{
  self->_limitedLogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedOutputURLs, 0);
  objc_storeStrong((id *)&self->_orderedInputURLs, 0);
}

@end