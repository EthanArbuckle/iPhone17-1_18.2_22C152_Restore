@interface AXAuditDeduplicatorHeuristics
- (AXAuditDeduplicatorHeuristics)init;
- (BOOL)compareIssues:(id)a3 and:(id)a4;
- (NSMutableArray)hashGroups;
- (OS_os_log)log;
- (double)targetThreshold;
- (int)deduplicateIssues:(id)a3 forFeatureHashGroup:(id)a4;
- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5;
- (void)setHashGroups:(id)a3;
- (void)setLog:(id)a3;
- (void)setPlatformThreshold:(id)a3;
- (void)setTargetThreshold:(double)a3;
@end

@implementation AXAuditDeduplicatorHeuristics

- (AXAuditDeduplicatorHeuristics)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXAuditDeduplicatorHeuristics;
  v2 = [(AXAuditDeduplicatorHeuristics *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("AXAuditDeduplicator", "Heuristics");
    [(AXAuditDeduplicatorHeuristics *)v2 setLog:v3];

    [(AXAuditDeduplicatorHeuristics *)v2 setTargetThreshold:0.4];
    v4 = [MEMORY[0x263EFF980] array];
    [(AXAuditDeduplicatorHeuristics *)v2 setHashGroups:v4];
  }
  return v2;
}

- (BOOL)compareIssues:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 issueClassification];
  if (v7 != [v6 issueClassification]) {
    goto LABEL_18;
  }
  v8 = [v5 auditTestType];
  if ([v8 isEqualToString:@"testTypeNone"])
  {
  }
  else
  {
    v9 = [v6 auditTestType];
    char v10 = [v9 isEqualToString:@"testTypeNone"];

    if (v10) {
      goto LABEL_18;
    }
    v11 = [v5 auditTestType];
    v12 = [v6 auditTestType];
    int v13 = [v11 isEqualToString:v12];

    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = [v5 elementText];
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = [v6 elementText];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [v5 elementText];
        v19 = [v6 elementText];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    uint64_t v21 = [v5 elementDescription];
    if (v21)
    {
      v22 = (void *)v21;
      uint64_t v23 = [v6 elementDescription];
      if (v23)
      {
        v24 = (void *)v23;
        v25 = [v5 elementDescription];
        v26 = [v6 elementDescription];
        int v27 = [v25 isEqualToString:v26];

        if (!v27) {
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    [v5 elementRect];
    double v29 = v28;
    [v6 elementRect];
    if (vabdd_f64(v29, v30) <= 5.0)
    {
      [v5 elementRect];
      double v32 = v31;
      [v6 elementRect];
      if (vabdd_f64(v32, v33) <= 5.0)
      {
        BOOL v34 = 1;
        goto LABEL_19;
      }
    }
  }
LABEL_18:
  BOOL v34 = 0;
LABEL_19:

  return v34;
}

- (int)deduplicateIssues:(id)a3 forFeatureHashGroup:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v22 = a4;
  int v20 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        int v13 = [v22 issues];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([(AXAuditDeduplicatorHeuristics *)self compareIssues:v12 and:*(void *)(*((void *)&v23 + 1) + 8 * j)])
              {

                [v12 setIsDuplicate:1];
                ++v9;
                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        [v20 addObject:v12];
LABEL_16:
        ;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
  }

  v18 = [v22 issues];
  [v18 addObjectsFromArray:v20];

  return v9;
}

- (void)setPlatformThreshold:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 localizedCaseInsensitiveContainsString:@"AppleTV"])
  {
    double v5 = 0.45;
  }
  else if ([v4 localizedCaseInsensitiveContainsString:@"Watch"])
  {
    double v5 = 0.648;
  }
  else
  {
    double v5 = 0.4;
    if (([v4 localizedCaseInsensitiveContainsString:@"iPhone"] & 1) == 0
      && ([v4 localizedCaseInsensitiveContainsString:@"iPad"] & 1) == 0
      && ([v4 localizedCaseInsensitiveContainsString:@"iPod"] & 1) == 0)
    {
      if ([v4 localizedCaseInsensitiveContainsString:@"RealityDevice"]) {
        double v5 = 0.4;
      }
      else {
        double v5 = 0.25;
      }
    }
  }
  [(AXAuditDeduplicatorHeuristics *)self setTargetThreshold:v5];
  id v6 = [(AXAuditDeduplicatorHeuristics *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [(AXAuditDeduplicatorHeuristics *)self targetThreshold];
    int v8 = 134218242;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_247247000, v6, OS_LOG_TYPE_DEFAULT, "Setting threshold to %fl for platform: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (int)deduplicateIssues:(id)a3 onImage:(CGImage *)a4 forPlatform:(id)a5
{
  return -1;
}

- (NSMutableArray)hashGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHashGroups:(id)a3
{
}

- (double)targetThreshold
{
  return self->_targetThreshold;
}

- (void)setTargetThreshold:(double)a3
{
  self->_targetThreshold = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_hashGroups, 0);
}

@end