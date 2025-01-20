@interface DTGPUAGXCounterSourceGroup
- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4;
- (DTGPUAGXCounterSourceGroup)initWithSourceGroup:(id)a3 selects:(id)a4 apsSelects:(id)a5 profile:(unint64_t)a6;
- (NSArray)sources;
- (void)resume;
- (void)sampleAPS:(id)a3;
- (void)sampleCounters:(unint64_t)a3 callback:(id)a4;
- (void)stop;
@end

@implementation DTGPUAGXCounterSourceGroup

- (DTGPUAGXCounterSourceGroup)initWithSourceGroup:(id)a3 selects:(id)a4 apsSelects:(id)a5 profile:(unint64_t)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v59 = a4;
  id v61 = a4;
  id v63 = a5;
  v72.receiver = self;
  v72.super_class = (Class)DTGPUAGXCounterSourceGroup;
  v62 = [(DTGPUAGXCounterSourceGroup *)&v72 init];
  if (!v62) {
    goto LABEL_53;
  }
  unint64_t v55 = a6;
  v11 = (NSArray *)objc_opt_new();
  if ((unint64_t)[v61 count] >= 6)
  {
    v12 = [v10 subDivideCounterList:v61 withOptions:0];
    v57 = [v12 objectForKeyedSubscript:@"passNum"];
    v13 = [v12 objectForKeyedSubscript:@"passList"];
    v14 = [v13 objectAtIndexedSubscript:0];
    v15 = (void *)[v14 mutableCopy];

    if ([v57 unsignedIntValue] != 1
      || (uint64_t v16 = [v15 count],
          [v10 sourceList],
          v17 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v16) = v16 == [v17 count],
          v17,
          !v16))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Fatal error: cannot fit counters in one pass and/or subdivided list does not equal to source count\n", buf, 2u);
      }

LABEL_54:
      v51 = 0;
      goto LABEL_55;
    }
    unsigned int v18 = 0;
    v19 = MEMORY[0x263EF8438];
    while (1)
    {
      uint64_t v20 = v18;
      if ([v15 count] <= (unint64_t)v18) {
        break;
      }
      v21 = [v10 sourceList];
      v22 = [v21 objectAtIndexedSubscript:v18];

      v23 = [v15 objectAtIndexedSubscript:v20];
      if ([v23 count])
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v24 = [v22 name];
          uint64_t v25 = [v24 UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v76 = v25;
          __int16 v77 = 2112;
          v78 = v23;
          _os_log_impl(&dword_23087D000, v19, OS_LOG_TYPE_INFO, "Created %s source\n. Counters: %@", buf, 0x16u);
        }
        v26 = [[DTGPUAGXCounterSource alloc] initWithSource:v22 sourceGroup:v10 selects:v23 sourceIndex:[(NSArray *)v11 count]];
        [(NSArray *)v11 addObject:v26];
      }
      unsigned int v18 = v20 + 1;
    }
  }
  if ([v63 count])
  {
    v27 = [v10 subDivideCounterList:v63 withOptions:0];
    v28 = [v27 objectForKeyedSubscript:@"passNum"];
    v29 = [v27 objectForKeyedSubscript:@"passList"];
    v53 = [v29 objectAtIndexedSubscript:0];

    if ([v28 unsignedIntValue] >= 2)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v30 = v53;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v69;
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v69 != v32) {
              objc_enumerationMutation(v30);
            }
            v34 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if ([v34 count])
            {
              id v35 = v34;

              id v63 = v35;
              goto LABEL_28;
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v68 objects:v74 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }
LABEL_28:
    }
    v58 = [v10 subDivideCounterList:v63 withOptions:0, v53];

    v56 = [v58 objectForKeyedSubscript:@"passNum"];

    if ([v56 unsignedIntValue] == 1)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v36 = [v10 sourceList];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v65;
LABEL_32:
        uint64_t v39 = 0;
        while (1)
        {
          if (*(void *)v65 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v64 + 1) + 8 * v39);
          v41 = [v40 name];
          int v42 = [v41 hasPrefix:@"APS_USC"];

          if (v42) {
            break;
          }
          if (v37 == ++v39)
          {
            uint64_t v37 = [v36 countByEnumeratingWithState:&v64 objects:v73 count:16];
            if (v37) {
              goto LABEL_32;
            }
            goto LABEL_45;
          }
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          id v44 = [v40 name];
          uint64_t v45 = [v44 UTF8String];
          int v46 = [v40 ringBufferNum];
          *(_DWORD *)buf = 136315394;
          uint64_t v76 = v45;
          __int16 v77 = 1024;
          LODWORD(v78) = v46;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Adding APS Source: %s, RING BUFFER %d\n", buf, 0x12u);
        }
        v47 = [[DTGPUAPSCounterSource alloc] initWithSource:v40 sourceGroup:v10 selects:v63 sourceIndex:[(NSArray *)v11 count] profile:v55];
        if (!v47) {
          goto LABEL_45;
        }
        id v48 = v40;
        [(NSArray *)v11 addObject:v47];

        if (!v48) {
          goto LABEL_46;
        }
        int v43 = 0;
      }
      else
      {
LABEL_45:

LABEL_46:
        int v43 = 1;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Failed to find APS Source\n", buf, 2u);
        }
        id v48 = 0;
      }
    }
    else
    {
      int v43 = 1;
    }

    if (v43) {
      goto LABEL_54;
    }
  }
  if (![(NSArray *)v11 count]) {
    goto LABEL_54;
  }
  sources = v62->_sources;
  v62->_sources = v11;
  v50 = v11;

  objc_storeStrong((id *)&v62->_sourceGroup, a3);
  objc_storeStrong((id *)&v62->_selects, v59);

LABEL_53:
  v51 = v62;
LABEL_55:

  return v51;
}

- (BOOL)request:(unint64_t)a3 vendorFeatures:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_sources;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) request:v6 vendorFeatures:v13] == NO)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)resume
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_sources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) resume:v6];
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = self->_sources;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) stop:v6];
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)sampleCounters:(unint64_t)a3 callback:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v7 = self->_sources;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) sampleCounters:a3 callback:v6];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)sampleAPS:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_sources;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) sampleAPS:v4 v9];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)sources
{
  return self->_sources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_selects, 0);
  objc_storeStrong((id *)&self->_sourceGroup, 0);
}

@end