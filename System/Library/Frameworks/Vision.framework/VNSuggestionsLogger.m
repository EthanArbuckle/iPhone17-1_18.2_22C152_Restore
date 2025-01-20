@interface VNSuggestionsLogger
- (VNSuggestionsLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4;
- (void)logAllSuggestons:(id)a3;
- (void)logConnectedGroups:(id)a3;
- (void)logFilteredByInputQuerySuggestons:(id)a3;
- (void)logFinalSuggestionsList:(id)a3;
- (void)logInputFaceIdsWithFlags:(id)a3;
- (void)logString:(id)a3;
- (void)logSuggestons:(id)a3 description:(id)a4;
@end

@implementation VNSuggestionsLogger

- (void)logString:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 UTF8String];
  VNValidatedLog(1, @"%s", v5, v6, v7, v8, v9, v10, v4);
  if ([(VNClusteringLogger *)self logEnabled])
  {
    v11 = [(VNClusteringLogger *)self logFileURL];
    v12 = [v11 path];
    +[VNClusteringLogger appendString:v13 toLogFile:v12];
  }
}

- (void)logFinalSuggestionsList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Final list of suggestions face IDs (results):\n"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [v6 appendFormat:@"%@, ", *(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 2, 2);
    [v6 appendString:@"\n"];
    [(VNSuggestionsLogger *)self logString:v6];
  }
}

- (void)logConnectedGroups:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16 && [v16 count])
  {
    v15 = self;
    id v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Connected groups of suggestions face IDs (connectedSuggestedInputs):\n"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v16;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      LODWORD(v6) = 0;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v7 = (int)v6;
        uint64_t v6 = v5 + (int)v6;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = [obj objectAtIndexedSubscript:v7];
          uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Group %d suggestions: ", ++v7);
          uint64_t v10 = +[VNClusteringLogger padStringWithSpaces:v9 toSize:25];
          [v4 appendString:v10];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v11 = v8;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v20;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v11);
                }
                [v4 appendFormat:@"%@, ", *(void *)(*((void *)&v19 + 1) + 8 * v14++)];
              }
              while (v12 != v14);
              uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }

          if ([v11 count]) {
            objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
          }
          [v4 appendString:@"\n"];
        }
        while (v7 != v6);
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v5);
    }

    [(VNSuggestionsLogger *)v15 logString:v4];
  }
}

- (void)logFilteredByInputQuerySuggestons:(id)a3
{
}

- (void)logAllSuggestons:(id)a3
{
}

- (void)logSuggestons:(id)a3 description:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  long long v22 = v6;
  if (v6 && [v6 count])
  {
    v18 = self;
    uint64_t v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Suggested face IDs: %@:\n", v19];
    [v6 allKeys];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v11 = [NSString stringWithFormat:@"ClusterId: %@   ", v10];
          uint64_t v12 = +[VNClusteringLogger padStringWithSpaces:v11 toSize:20];
          [v7 appendFormat:@"%@Suggestions: ", v12];
          uint64_t v13 = [v22 objectForKeyedSubscript:v10];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v14);
                }
                [v7 appendFormat:@"%@, ", *(void *)(*((void *)&v23 + 1) + 8 * j)];
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v15);
          }

          if ([v14 count]) {
            objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 2, 2);
          }
          [v7 appendString:@"\n"];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    [(VNSuggestionsLogger *)v18 logString:v7];
  }
}

- (void)logInputFaceIdsWithFlags:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13 && [v13 count])
  {
    uint64_t v12 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Input query - face IDs with flags (clusterIdsWithFlags):\n"];
    [v13 allKeys];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v15 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v7 = [NSString stringWithFormat:@"faceId: %@", v6];
          uint64_t v8 = +[VNClusteringLogger padStringWithSpaces:v7 toSize:20];
          uint64_t v9 = [v13 objectForKeyedSubscript:v6];
          [v12 appendFormat:@"%@can be returned: %@\n", v8, v9];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v3);
    }

    [(VNSuggestionsLogger *)self logString:v12];
  }
}

- (VNSuggestionsLogger)initWithOptions:(id)a3 logEnabled:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VNSuggestionsLogger;
  return [(VNClusteringLogger *)&v5 initWithOptions:a3 logEnabled:a4 logFileNameBase:@"VNSuggestionLog"];
}

@end