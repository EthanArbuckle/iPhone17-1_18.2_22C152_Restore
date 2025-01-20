@interface DRSRequestAllStats
+ (Class)childStatsClass;
+ (id)descriptionStringForRequest:(id)a3;
+ (id)keyName;
+ (id)statsForRequests:(id)a3;
- (DRSRequestAllStats)init;
- (id)terminalRequestProtobufRepresentation;
- (unint64_t)generateCoreAnalyticsEvents:(BOOL)a3;
@end

@implementation DRSRequestAllStats

- (id)terminalRequestProtobufRepresentation
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(DRSProtoDiagnosticRequestStatsBatch);
  v4 = DRSDeviceMetadata();
  v65 = v3;
  [(DRSProtoDiagnosticRequestStatsBatch *)v3 setClientMetadata:v4];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v5 = [(DRSRequestAllStats *)self perBuildStats];
  v6 = [v5 objectEnumerator];

  obuint64_t j = v6;
  uint64_t v55 = [v6 countByEnumeratingWithState:&v95 objects:v104 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v96;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v96 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v7;
        v8 = *(void **)(*((void *)&v95 + 1) + 8 * v7);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        v9 = [v8 perTeamIDStats];
        v10 = [v9 objectEnumerator];

        id v57 = v10;
        uint64_t v59 = [v10 countByEnumeratingWithState:&v91 objects:v103 count:16];
        if (v59)
        {
          uint64_t v58 = *(void *)v92;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v92 != v58) {
                objc_enumerationMutation(v57);
              }
              uint64_t v60 = v11;
              v12 = *(void **)(*((void *)&v91 + 1) + 8 * v11);
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              v13 = [v12 perIssueCategoryStats];
              v14 = [v13 objectEnumerator];

              id v61 = v14;
              uint64_t v63 = [v14 countByEnumeratingWithState:&v87 objects:v102 count:16];
              if (v63)
              {
                uint64_t v62 = *(void *)v88;
                do
                {
                  uint64_t v15 = 0;
                  do
                  {
                    if (*(void *)v88 != v62) {
                      objc_enumerationMutation(v61);
                    }
                    uint64_t v64 = v15;
                    v16 = *(void **)(*((void *)&v87 + 1) + 8 * v15);
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v86 = 0u;
                    v17 = [v16 perIssueDescriptionStats];
                    v18 = [v17 objectEnumerator];

                    id v66 = v18;
                    uint64_t v68 = [v18 countByEnumeratingWithState:&v83 objects:v101 count:16];
                    if (v68)
                    {
                      uint64_t v67 = *(void *)v84;
                      do
                      {
                        for (uint64_t i = 0; i != v68; ++i)
                        {
                          if (*(void *)v84 != v67) {
                            objc_enumerationMutation(v66);
                          }
                          v20 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                          v21 = [v20 requests];
                          v22 = [v21 firstObject];

                          if (v22)
                          {
                            uint64_t v70 = i;
                            v23 = objc_alloc_init(DRSProtoDiagnosticRequestStats);
                            v24 = [v22 build];
                            [(DRSProtoDiagnosticRequestStats *)v23 setBuild:v24];

                            v25 = [v22 teamID];
                            [(DRSProtoDiagnosticRequestStats *)v23 setTeamId:v25];

                            v26 = [v22 issueCategory];
                            [(DRSProtoDiagnosticRequestStats *)v23 setIssueCategory:v26];

                            v69 = v22;
                            v27 = [v22 issueDescription];
                            [(DRSProtoDiagnosticRequestStats *)v23 setIssueDescription:v27];

                            long long v81 = 0u;
                            long long v82 = 0u;
                            long long v79 = 0u;
                            long long v80 = 0u;
                            v28 = [v20 perOutcomeStats];
                            v29 = [v28 objectEnumerator];

                            id v73 = v29;
                            uint64_t v30 = [v29 countByEnumeratingWithState:&v79 objects:v100 count:16];
                            if (v30)
                            {
                              uint64_t v31 = v30;
                              uint64_t v32 = *(void *)v80;
                              uint64_t v71 = *(void *)v80;
                              do
                              {
                                uint64_t v33 = 0;
                                uint64_t v72 = v31;
                                do
                                {
                                  if (*(void *)v80 != v32) {
                                    objc_enumerationMutation(v73);
                                  }
                                  v34 = *(void **)(*((void *)&v79 + 1) + 8 * v33);
                                  v35 = [v34 requests];
                                  v36 = [v35 firstObject];

                                  if (v36 && [v36 requestOutcome])
                                  {
                                    v74 = v36;
                                    long long v77 = 0u;
                                    long long v78 = 0u;
                                    long long v75 = 0u;
                                    long long v76 = 0u;
                                    v37 = [v34 perStateStats];
                                    v38 = [v37 objectEnumerator];

                                    uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v99 count:16];
                                    if (v39)
                                    {
                                      uint64_t v40 = v39;
                                      uint64_t v41 = *(void *)v76;
                                      do
                                      {
                                        for (uint64_t j = 0; j != v40; ++j)
                                        {
                                          if (*(void *)v76 != v41) {
                                            objc_enumerationMutation(v38);
                                          }
                                          v43 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                                          v44 = [v43 requests];
                                          v45 = [v44 firstObject];

                                          if (v45)
                                          {
                                            v46 = objc_alloc_init(DRSProtoDiagnosticRequestOutcomeBucket);
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setCount:](v46, "setCount:", [v43 requestCount]);
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setOutcome:](v46, "setOutcome:", [v45 requestOutcome]);
                                            -[DRSProtoDiagnosticRequestOutcomeBucket setRequestState:](v46, "setRequestState:", [v45 requestState]);
                                            [(DRSProtoDiagnosticRequestStats *)v23 addOutcomes:v46];
                                          }
                                        }
                                        uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v99 count:16];
                                      }
                                      while (v40);
                                    }

                                    uint64_t v32 = v71;
                                    uint64_t v31 = v72;
                                    v36 = v74;
                                  }

                                  ++v33;
                                }
                                while (v33 != v31);
                                uint64_t v31 = [v73 countByEnumeratingWithState:&v79 objects:v100 count:16];
                              }
                              while (v31);
                            }

                            v47 = [(DRSProtoDiagnosticRequestStats *)v23 outcomes];
                            uint64_t v48 = [v47 count];

                            if (v48) {
                              [(DRSProtoDiagnosticRequestStatsBatch *)v65 addRequestsResultsStats:v23];
                            }

                            v22 = v69;
                            uint64_t i = v70;
                          }
                        }
                        uint64_t v68 = [v66 countByEnumeratingWithState:&v83 objects:v101 count:16];
                      }
                      while (v68);
                    }

                    uint64_t v15 = v64 + 1;
                  }
                  while (v64 + 1 != v63);
                  uint64_t v63 = [v61 countByEnumeratingWithState:&v87 objects:v102 count:16];
                }
                while (v63);
              }

              uint64_t v11 = v60 + 1;
            }
            while (v60 + 1 != v59);
            uint64_t v59 = [v57 countByEnumeratingWithState:&v91 objects:v103 count:16];
          }
          while (v59);
        }

        uint64_t v7 = v56 + 1;
      }
      while (v56 + 1 != v55);
      uint64_t v55 = [obj countByEnumeratingWithState:&v95 objects:v104 count:16];
    }
    while (v55);
  }

  v49 = [(DRSProtoDiagnosticRequestStatsBatch *)v65 requestsResultsStats];
  uint64_t v50 = [v49 count];

  if (v50) {
    v51 = v65;
  }
  else {
    v51 = 0;
  }

  return v51;
}

- (unint64_t)generateCoreAnalyticsEvents:(BOOL)a3
{
  BOOL v73 = a3;
  uint64_t v107 = *MEMORY[0x263EF8340];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v3 = [(DRSRequestAllStats *)self perBuildStats];
  v4 = [v3 objectEnumerator];

  obuint64_t j = v4;
  uint64_t v53 = [v4 countByEnumeratingWithState:&v95 objects:v106 count:16];
  if (v53)
  {
    unint64_t v74 = 0;
    uint64_t v52 = *(void *)v96;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v96 != v52)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v54 = v5;
        uint64_t v7 = *(void **)(*((void *)&v95 + 1) + 8 * v5);
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        v8 = [v7 perTeamIDStats];
        v9 = [v8 objectEnumerator];

        id v55 = v9;
        uint64_t v57 = [v9 countByEnumeratingWithState:&v91 objects:v105 count:16];
        if (v57)
        {
          uint64_t v56 = *(void *)v92;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v92 != v56)
              {
                uint64_t v11 = v10;
                objc_enumerationMutation(v55);
                uint64_t v10 = v11;
              }
              uint64_t v58 = v10;
              v12 = *(void **)(*((void *)&v91 + 1) + 8 * v10);
              long long v87 = 0u;
              long long v88 = 0u;
              long long v89 = 0u;
              long long v90 = 0u;
              v13 = [v12 perIssueCategoryStats];
              v14 = [v13 objectEnumerator];

              id v59 = v14;
              uint64_t v61 = [v14 countByEnumeratingWithState:&v87 objects:v104 count:16];
              if (v61)
              {
                uint64_t v60 = *(void *)v88;
                do
                {
                  uint64_t v15 = 0;
                  do
                  {
                    if (*(void *)v88 != v60)
                    {
                      uint64_t v16 = v15;
                      objc_enumerationMutation(v59);
                      uint64_t v15 = v16;
                    }
                    uint64_t v62 = v15;
                    v17 = *(void **)(*((void *)&v87 + 1) + 8 * v15);
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v86 = 0u;
                    v18 = [v17 perIssueDescriptionStats];
                    v19 = [v18 objectEnumerator];

                    id v63 = v19;
                    uint64_t v65 = [v19 countByEnumeratingWithState:&v83 objects:v103 count:16];
                    if (v65)
                    {
                      uint64_t v64 = *(void *)v84;
                      do
                      {
                        for (uint64_t i = 0; i != v65; ++i)
                        {
                          if (*(void *)v84 != v64) {
                            objc_enumerationMutation(v63);
                          }
                          uint64_t v67 = i;
                          v21 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                          v22 = [v21 requests];
                          v23 = [v22 firstObject];

                          if (v23)
                          {
                            v101[0] = kTeamIDKey;
                            v24 = [v23 teamID];
                            v102[0] = v24;
                            v101[1] = kDiagnosticRequestStatsKey_IssueCategory;
                            v25 = [v23 issueCategory];
                            v102[1] = v25;
                            v101[2] = kDiagnosticRequestStatsKey_IssueDescription;
                            id v66 = v23;
                            v26 = [v23 issueDescription];
                            v102[2] = v26;
                            v27 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:3];

                            long long v81 = 0u;
                            long long v82 = 0u;
                            long long v79 = 0u;
                            long long v80 = 0u;
                            v28 = [v21 perOutcomeStats];
                            v29 = [v28 objectEnumerator];

                            id v70 = v29;
                            uint64_t v30 = [v29 countByEnumeratingWithState:&v79 objects:v100 count:16];
                            if (v30)
                            {
                              uint64_t v31 = v30;
                              uint64_t v32 = *(void *)v80;
                              uint64_t v68 = *(void *)v80;
                              do
                              {
                                uint64_t v33 = 0;
                                uint64_t v69 = v31;
                                do
                                {
                                  if (*(void *)v80 != v32) {
                                    objc_enumerationMutation(v70);
                                  }
                                  v34 = *(void **)(*((void *)&v79 + 1) + 8 * v33);
                                  v35 = [v34 requests];
                                  v36 = [v35 firstObject];

                                  if (v36 && [v36 requestOutcome])
                                  {
                                    uint64_t v71 = v36;
                                    uint64_t v72 = v33;
                                    long long v77 = 0u;
                                    long long v78 = 0u;
                                    long long v75 = 0u;
                                    long long v76 = 0u;
                                    v37 = [v34 perStateStats];
                                    v38 = [v37 objectEnumerator];

                                    uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v99 count:16];
                                    if (v39)
                                    {
                                      uint64_t v40 = v39;
                                      uint64_t v41 = *(void *)v76;
                                      do
                                      {
                                        for (uint64_t j = 0; j != v40; ++j)
                                        {
                                          if (*(void *)v76 != v41) {
                                            objc_enumerationMutation(v38);
                                          }
                                          v43 = *(void **)(*((void *)&v75 + 1) + 8 * j);
                                          v44 = [v43 requests];
                                          v45 = [v44 firstObject];

                                          if (v45 && [v43 requestCount])
                                          {
                                            v46 = (void *)[v27 mutableCopy];
                                            v47 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v43, "requestCount"));
                                            [v46 setObject:v47 forKeyedSubscript:kDiagnosticRequestStatsKey_RequestCount];

                                            uint64_t v48 = [v34 requestOutcome];
                                            [v46 setObject:v48 forKeyedSubscript:kDiagnosticRequestStatsKey_RequestOutcome];

                                            v49 = [v43 requestState];
                                            [v46 setObject:v49 forKeyedSubscript:kDiagnosticRequestStatsKey_RequestState];

                                            if (v73) {
                                              DRSCoreAnalyticsSendEvent(kDiagnosticRequestStatsName, v46);
                                            }
                                            ++v74;
                                          }
                                        }
                                        uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v99 count:16];
                                      }
                                      while (v40);
                                    }

                                    uint64_t v32 = v68;
                                    uint64_t v31 = v69;
                                    v36 = v71;
                                    uint64_t v33 = v72;
                                  }

                                  ++v33;
                                }
                                while (v33 != v31);
                                uint64_t v31 = [v70 countByEnumeratingWithState:&v79 objects:v100 count:16];
                              }
                              while (v31);
                            }

                            v23 = v66;
                            uint64_t i = v67;
                          }
                        }
                        uint64_t v65 = [v63 countByEnumeratingWithState:&v83 objects:v103 count:16];
                      }
                      while (v65);
                    }

                    uint64_t v15 = v62 + 1;
                  }
                  while (v62 + 1 != v61);
                  uint64_t v61 = [v59 countByEnumeratingWithState:&v87 objects:v104 count:16];
                }
                while (v61);
              }

              uint64_t v10 = v58 + 1;
            }
            while (v58 + 1 != v57);
            uint64_t v57 = [v55 countByEnumeratingWithState:&v91 objects:v105 count:16];
          }
          while (v57);
        }

        uint64_t v5 = v54 + 1;
      }
      while (v54 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v95 objects:v106 count:16];
    }
    while (v53);
  }
  else
  {
    unint64_t v74 = 0;
  }

  return v74;
}

+ (id)descriptionStringForRequest:(id)a3
{
  return @"All";
}

+ (id)keyName
{
  return @"All";
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

- (DRSRequestAllStats)init
{
  return [(DRSRequestStats *)self initWithDescriptionString:@"All"];
}

+ (id)statsForRequests:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(DRSRequestAllStats);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[DRSRequestStats addRequest:](v4, "addRequest:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if ([(DRSRequestStats *)v4 requestCount]) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

@end