@interface _RealPKPassFlightFieldReader
- (id)arrivalAirportCode;
- (id)arrivalTime;
- (id)combinedFlightCode;
- (id)departureAirportCode;
- (id)departureGate;
- (id)departureTerminal;
- (id)departureTime;
- (void)loadPass:(id)a3;
@end

@implementation _RealPKPassFlightFieldReader

- (void)loadPass:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "allSemantics", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  semantics = self->_semantics;
  self->_semantics = v5;

  id v49 = v4;
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v47 = self;
  v7 = [v49 primaryFields];
  v8 = (NSDictionary *)v48;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v71 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v14 = [v13 key];
        uint64_t v15 = [v13 value];
        v16 = (void *)v15;
        if (v14) {
          BOOL v17 = v15 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17) {
          [(NSDictionary *)v8 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v10);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = [v49 frontFieldBuckets];
  uint64_t v18 = [obj countByEnumeratingWithState:&v58 objects:&v70 count:16];
  if (v18)
  {
    uint64_t v52 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v59 != v52) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v21 = v8;
        id v22 = v20;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v74 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v24; ++k)
            {
              if (*(void *)v67 != v25) {
                objc_enumerationMutation(v23);
              }
              v27 = *(void **)(*((void *)&v66 + 1) + 8 * k);
              v28 = [v27 key];
              uint64_t v29 = [v27 value];
              v30 = (void *)v29;
              if (v28) {
                BOOL v31 = v29 == 0;
              }
              else {
                BOOL v31 = 1;
              }
              if (!v31) {
                [(NSDictionary *)v21 setObject:v29 forKeyedSubscript:v28];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v74 count:16];
          }
          while (v24);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v58 objects:&v70 count:16];
    }
    while (v18);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obja = [v49 backFieldBuckets];
  uint64_t v32 = [obja countByEnumeratingWithState:&v54 objects:&v66 count:16];
  if (v32)
  {
    uint64_t v53 = *(void *)v55;
    do
    {
      for (uint64_t m = 0; m != v32; ++m)
      {
        if (*(void *)v55 != v53) {
          objc_enumerationMutation(obja);
        }
        v34 = *(void **)(*((void *)&v54 + 1) + 8 * m);
        v35 = v8;
        id v36 = v34;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v63;
          do
          {
            for (uint64_t n = 0; n != v38; ++n)
            {
              if (*(void *)v63 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = *(void **)(*((void *)&v62 + 1) + 8 * n);
              v42 = [v41 key];
              uint64_t v43 = [v41 value];
              v44 = (void *)v43;
              if (v42) {
                BOOL v45 = v43 == 0;
              }
              else {
                BOOL v45 = 1;
              }
              if (!v45) {
                [(NSDictionary *)v35 setObject:v43 forKeyedSubscript:v42];
              }
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v74 count:16];
          }
          while (v38);
        }
      }
      uint64_t v32 = [obja countByEnumeratingWithState:&v54 objects:&v66 count:16];
    }
    while (v32);
  }

  fields = v47->_fields;
  v47->_fields = v8;
}

- (id)combinedFlightCode
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F877B0];
  id v4 = self->_semantics;
  if (([v3 isEqualToString:*MEMORY[0x1E4F87738]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87810]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87828]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87830]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87838]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87700]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87708]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87718]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87818]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87820]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87800]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87720]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87728]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87750]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87730]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87758]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87760]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87768]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87740]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87748]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87778]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87780]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87710]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87860]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87840]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87808]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87870]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87850]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87848]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87858]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A8]] & 1) != 0)
  {
    v5 = [(NSDictionary *)v4 objectForKey:v3];
    v6 = [v5 stringValue];
  }
  else
  {
    id v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v34 = 1024;
      int v35 = 148;
      __int16 v36 = 2082;
      id v37 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v38 = 2082;
      uint64_t v39 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A70DF000, v22, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", buf, 0x26u);
    }

    v6 = 0;
  }

  if ([v6 length])
  {
    id v7 = v6;
    goto LABEL_86;
  }
  uint64_t v8 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flight"];
  id v9 = (void *)v8;
  if (v8)
  {
    int v30 = 0;
    uint64_t v31 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    v14 = (void *)v8;
  }
  else
  {
    uint64_t v15 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNumber"];
    if (v15)
    {
      int v30 = 0;
      uint64_t v31 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      uint64_t v29 = (void *)v15;
    }
    else
    {
      uint64_t v15 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"FLIGHT"];
      if (v15)
      {
        v28 = (void *)v15;
        uint64_t v29 = 0;
        uint64_t v31 = 0;
        int v10 = 0;
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        int v30 = 1;
      }
      else
      {
        uint64_t v15 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNo"];
        if (v15)
        {
          v28 = 0;
          uint64_t v29 = 0;
          int v10 = 0;
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
          int v30 = 1;
          uint64_t v31 = 1;
          v27 = (void *)v15;
        }
        else
        {
          uint64_t v15 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNb"];
          if (!v15)
          {
            uint64_t v19 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNum"];
            if (v19)
            {
              v28 = 0;
              uint64_t v29 = 0;
              v26 = 0;
              v27 = 0;
              int v11 = 0;
              int v12 = 0;
              int v13 = 0;
              int v30 = 1;
              uint64_t v31 = 0x100000001;
              v14 = (void *)v19;
              int v10 = 1;
              uint64_t v25 = (void *)v19;
            }
            else
            {
              uint64_t v20 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flight-number"];
              if (v20)
              {
                v28 = 0;
                uint64_t v29 = 0;
                v26 = 0;
                v27 = 0;
                uint64_t v24 = (void *)v20;
                uint64_t v25 = 0;
                int v12 = 0;
                int v13 = 0;
                int v30 = 1;
                uint64_t v31 = 0x100000001;
                v14 = (void *)v20;
                int v10 = 1;
                int v11 = 1;
              }
              else
              {
                uint64_t v21 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNumber2"];
                if (v21)
                {
                  v28 = 0;
                  uint64_t v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  uint64_t v24 = 0;
                  uint64_t v25 = 0;
                  int v13 = 0;
                  int v30 = 1;
                  uint64_t v31 = 0x100000001;
                  v14 = (void *)v21;
                  int v10 = 1;
                  int v11 = 1;
                  int v12 = 1;
                  id v23 = (void *)v21;
                }
                else
                {
                  v14 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"flightNewName"];
                  v28 = 0;
                  uint64_t v29 = 0;
                  v26 = 0;
                  v27 = 0;
                  uint64_t v24 = 0;
                  uint64_t v25 = 0;
                  id v23 = 0;
                  int v30 = 1;
                  uint64_t v31 = 0x100000001;
                  int v10 = 1;
                  int v11 = 1;
                  int v12 = 1;
                  int v13 = 1;
                }
              }
            }
            goto LABEL_69;
          }
          v28 = 0;
          uint64_t v29 = 0;
          v26 = (void *)v15;
          v27 = 0;
          int v10 = 0;
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
          int v30 = 1;
          uint64_t v31 = 0x100000001;
        }
      }
    }
    v14 = (void *)v15;
  }
LABEL_69:
  id v16 = v14;
  BOOL v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v7 = [v16 stringByTrimmingCharactersInSet:v17];

  if (v13) {
  if (v12)
  }

  if (v11) {
  if (v10)
  }

  if (HIDWORD(v31)) {
  if (v31)
  }

  if (v30) {
  if (!v9)
  }

LABEL_86:
  return v7;
}

- (id)departureAirportCode
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F87720];
  id v4 = self->_semantics;
  if (([v3 isEqualToString:*MEMORY[0x1E4F87738]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87810]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87828]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87830]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87838]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87700]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87708]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87718]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87818]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87820]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87800]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D8]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87728]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87750]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87730]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87758]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87760]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87768]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87740]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87748]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87778]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87780]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87710]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87860]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87840]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87808]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87870]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87850]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87848]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87858]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A8]] & 1) != 0)
  {
    v5 = [(NSDictionary *)v4 objectForKey:v3];
    id v6 = [v5 stringValue];

    if (v6) {
      goto LABEL_65;
    }
  }
  else
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v19 = 1024;
      int v20 = 148;
      __int16 v21 = 2082;
      id v22 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v23 = 2082;
      uint64_t v24 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v17, 0x26u);
    }
  }
  id v7 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"origin"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v6 = v7;
  }
  else
  {
    id v9 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"source"];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"depart"];
    }
    id v6 = v11;
  }
LABEL_65:
  id v12 = v6;
  int v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v14 = [v12 stringByTrimmingCharactersInSet:v13];

  return v14;
}

- (id)arrivalAirportCode
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F87720];
  id v4 = self->_semantics;
  if (([v3 isEqualToString:*MEMORY[0x1E4F87738]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87810]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87828]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87830]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87838]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87700]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87708]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87718]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87818]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87820]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87800]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D8]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87728]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87750]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87730]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87758]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87760]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87768]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87740]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87748]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87778]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87780]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87710]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87860]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87840]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87808]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87870]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87850]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87848]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87858]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A8]] & 1) != 0)
  {
    v5 = [(NSDictionary *)v4 objectForKey:v3];
    id v6 = [v5 stringValue];

    if (v6) {
      goto LABEL_65;
    }
  }
  else
  {
    id v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136446978;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v19 = 1024;
      int v20 = 148;
      __int16 v21 = 2082;
      id v22 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v23 = 2082;
      uint64_t v24 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v17, 0x26u);
    }
  }
  id v7 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"origin"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v6 = v7;
  }
  else
  {
    id v9 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"source"];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"arrive"];
    }
    id v6 = v11;
  }
LABEL_65:
  id v12 = v6;
  int v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v14 = [v12 stringByTrimmingCharactersInSet:v13];

  return v14;
}

- (id)departureTerminal
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F87750];
  id v4 = self->_semantics;
  if (([v3 isEqualToString:*MEMORY[0x1E4F87738]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87810]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87828]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87830]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87838]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87700]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87708]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87718]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87818]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87820]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87800]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87720]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87728]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87730]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87758]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87760]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87768]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87740]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87748]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87778]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87780]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87710]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87860]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87840]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87808]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87870]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87850]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87848]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87858]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A8]] & 1) != 0)
  {
    v5 = [(NSDictionary *)v4 objectForKey:v3];
    id v6 = [v5 stringValue];

    if (v6) {
      goto LABEL_59;
    }
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v14 = 1024;
      int v15 = 148;
      __int16 v16 = 2082;
      int v17 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v18 = 2082;
      __int16 v19 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v12, 0x26u);
    }
  }
  id v6 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"terminal"];
LABEL_59:
  id v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  return v9;
}

- (id)departureGate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F87730];
  id v4 = self->_semantics;
  if (([v3 isEqualToString:*MEMORY[0x1E4F87738]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87770]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87810]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87828]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87830]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87838]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87700]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87708]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87718]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87818]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87820]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87800]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87720]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87728]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87750]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87758]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87760]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87788]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87768]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87740]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87748]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87778]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87780]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87710]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87860]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87840]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87878]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87868]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87808]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877B8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87798]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876D0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87870]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87790]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87850]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87848]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87858]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F876C0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F877A8]] & 1) != 0)
  {
    v5 = [(NSDictionary *)v4 objectForKey:v3];
    id v6 = [v5 stringValue];

    if (v6) {
      goto LABEL_59;
    }
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v14 = 1024;
      int v15 = 148;
      __int16 v16 = 2082;
      int v17 = "NSString *_stringFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v18 = 2082;
      __int16 v19 = "! PKPassSemanticIsStringKey(key)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic string!", (uint8_t *)&v12, 0x26u);
    }
  }
  id v6 = [(NSDictionary *)self->_fields objectForKeyedSubscript:@"gate"];
LABEL_59:
  id v7 = v6;
  uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  return v9;
}

- (id)departureTime
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F875E8];
  id v4 = self->_semantics;
  v5 = (void *)*MEMORY[0x1E4F87610];
  if (([v3 isEqualToString:*MEMORY[0x1E4F87610]] & 1) != 0
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87600]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875D8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87608]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87628]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87638]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87648]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87618]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87630]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87640]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87620]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875F0]] & 1) != 0)
  {
    id v6 = [(NSDictionary *)v4 objectForKey:v3];
    id v7 = [v6 dateValue];

    if (v7) {
      goto LABEL_34;
    }
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v14 = 1024;
      int v15 = 154;
      __int16 v16 = 2082;
      int v17 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v18 = 2082;
      __int16 v19 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v12, 0x26u);
    }
  }
  uint64_t v8 = self->_semantics;
  if (([v5 isEqualToString:v5] & 1) != 0
    || ([v5 isEqualToString:v3] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87600]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F875D8]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87608]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F875E0]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F875F8]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87628]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87638]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87648]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87618]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87630]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87640]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F87620]] & 1) != 0
    || ([v5 isEqualToString:*MEMORY[0x1E4F875F0]] & 1) != 0)
  {
    id v9 = [(NSDictionary *)v8 objectForKey:v5];
    id v7 = [v9 dateValue];
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v14 = 1024;
      int v15 = 154;
      __int16 v16 = 2082;
      int v17 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v18 = 2082;
      __int16 v19 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v12, 0x26u);
    }
    id v7 = 0;
  }

LABEL_34:
  return v7;
}

- (id)arrivalTime
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F875D8];
  id v4 = self->_semantics;
  uint64_t v5 = *MEMORY[0x1E4F87610];
  if (([v3 isEqualToString:*MEMORY[0x1E4F87610]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875E8]] & 1) != 0
    || (id v6 = (void *)*MEMORY[0x1E4F87600], ([v3 isEqualToString:*MEMORY[0x1E4F87600]] & 1) != 0)
    || ([v3 isEqualToString:v3] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87608]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875E0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875F8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87628]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87638]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87648]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87618]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87630]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87640]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F87620]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F875F0]] & 1) != 0)
  {
    id v7 = [(NSDictionary *)v4 objectForKey:v3];
    uint64_t v8 = [v7 dateValue];

    if (v8) {
      goto LABEL_35;
    }
    id v6 = (void *)*MEMORY[0x1E4F87600];
  }
  else
  {
    int v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v15 = 1024;
      int v16 = 154;
      __int16 v17 = 2082;
      __int16 v18 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v19 = 2082;
      uint64_t v20 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v13, 0x26u);
    }
  }
  id v9 = self->_semantics;
  if (([v6 isEqualToString:v5] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F875E8]] & 1) != 0
    || ([v6 isEqualToString:v6] & 1) != 0
    || ([v6 isEqualToString:v3] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87608]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F875E0]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F875F8]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87628]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87638]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87648]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87618]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87630]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87640]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F87620]] & 1) != 0
    || ([v6 isEqualToString:*MEMORY[0x1E4F875F0]] & 1) != 0)
  {
    int v10 = [(NSDictionary *)v9 objectForKey:v6];
    uint64_t v8 = [v10 dateValue];
  }
  else
  {
    int v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/UT_Never/MapsSuggestionsRealWalletConnector.mm";
      __int16 v15 = 1024;
      int v16 = 154;
      __int16 v17 = 2082;
      __int16 v18 = "NSDate *_dateFromSemantics(_PKPassSemanticDict *__strong, NSString *__strong)";
      __int16 v19 = 2082;
      uint64_t v20 = "! PKPassSemanticIsDateKey(key)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a semantic date!", (uint8_t *)&v13, 0x26u);
    }
    uint64_t v8 = 0;
  }

LABEL_35:
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_semantics, 0);
}

@end