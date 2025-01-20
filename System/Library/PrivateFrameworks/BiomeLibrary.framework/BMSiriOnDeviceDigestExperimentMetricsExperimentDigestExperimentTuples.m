@interface BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithLaunchTimeInMs:(id)a3 endpointDelayInMs:(id)a4 siriResponseTimeInMs:(id)a5 timeToUufrInMs:(id)a6 timeToFirstWordInMs:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)endpointDelayInMs;
- (NSArray)launchTimeInMs;
- (NSArray)siriResponseTimeInMs;
- (NSArray)timeToFirstWordInMs;
- (NSArray)timeToUufrInMs;
- (NSString)description;
- (id)_endpointDelayInMsJSONArray;
- (id)_launchTimeInMsJSONArray;
- (id)_siriResponseTimeInMsJSONArray;
- (id)_timeToFirstWordInMsJSONArray;
- (id)_timeToUufrInMsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToFirstWordInMs, 0);
  objc_storeStrong((id *)&self->_timeToUufrInMs, 0);
  objc_storeStrong((id *)&self->_siriResponseTimeInMs, 0);
  objc_storeStrong((id *)&self->_endpointDelayInMs, 0);

  objc_storeStrong((id *)&self->_launchTimeInMs, 0);
}

- (NSArray)timeToFirstWordInMs
{
  return self->_timeToFirstWordInMs;
}

- (NSArray)timeToUufrInMs
{
  return self->_timeToUufrInMs;
}

- (NSArray)siriResponseTimeInMs
{
  return self->_siriResponseTimeInMs;
}

- (NSArray)endpointDelayInMs
{
  return self->_endpointDelayInMs;
}

- (NSArray)launchTimeInMs
{
  return self->_launchTimeInMs;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self launchTimeInMs];
    uint64_t v7 = [v5 launchTimeInMs];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self launchTimeInMs];
      v10 = [v5 launchTimeInMs];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self endpointDelayInMs];
    uint64_t v14 = [v5 endpointDelayInMs];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self endpointDelayInMs];
      v17 = [v5 endpointDelayInMs];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self siriResponseTimeInMs];
    uint64_t v20 = [v5 siriResponseTimeInMs];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self siriResponseTimeInMs];
      v23 = [v5 siriResponseTimeInMs];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToUufrInMs];
    uint64_t v26 = [v5 timeToUufrInMs];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToUufrInMs];
      v29 = [v5 timeToUufrInMs];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToFirstWordInMs];
    v32 = [v5 timeToFirstWordInMs];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToFirstWordInMs];
      v34 = [v5 timeToFirstWordInMs];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self _launchTimeInMsJSONArray];
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self _endpointDelayInMsJSONArray];
  id v5 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self _siriResponseTimeInMsJSONArray];
  v6 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self _timeToUufrInMsJSONArray];
  uint64_t v7 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self _timeToFirstWordInMsJSONArray];
  v17 = @"launchTimeInMs";
  uint64_t v8 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v8;
  v22[0] = v8;
  int v18 = @"endpointDelayInMs";
  v9 = v4;
  if (!v4)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v17, v18);
  }
  v22[1] = v9;
  v19 = @"siriResponseTimeInMs";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v10;
  uint64_t v20 = @"timeToUufrInMs";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v11;
  v21 = @"timeToFirstWordInMs";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)_timeToFirstWordInMsJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToFirstWordInMs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_timeToUufrInMsJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToUufrInMs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_siriResponseTimeInMsJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self siriResponseTimeInMs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_endpointDelayInMsJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self endpointDelayInMs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_launchTimeInMsJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self launchTimeInMs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v172[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"launchTimeInMs"];
  uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    v116 = self;

    id v6 = 0;
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v171 = *MEMORY[0x1E4F28568];
          v9 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"launchTimeInMs"];
          v172[0] = v9;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:&v171 count:1];
          id v37 = (id)[v35 initWithDomain:v36 code:2 userInfo:v15];
          v27 = 0;
          *a4 = v37;
          goto LABEL_118;
        }
        v27 = 0;
        goto LABEL_119;
      }
    }
    v116 = self;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id v6 = v6;
  uint64_t v10 = [v6 countByEnumeratingWithState:&v134 objects:v170 count:16];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v135;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v135 != v12) {
        objc_enumerationMutation(v6);
      }
      uint64_t v14 = *(void *)(*((void *)&v134 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = a4;
        if (a4)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v168 = *MEMORY[0x1E4F28568];
          v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"launchTimeInMs"];
          v169 = v21;
          v22 = (void *)MEMORY[0x1E4F1C9E8];
          v23 = &v169;
          int v24 = &v168;
LABEL_21:
          id v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
          self = v116;
          id v26 = (id)[v19 initWithDomain:v20 code:2 userInfo:v25];
          v27 = 0;
          *uint64_t v18 = v26;
          id v15 = v6;
          goto LABEL_117;
        }
LABEL_22:
        v27 = 0;
        id v15 = v6;
        self = v116;
        goto LABEL_118;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v18 = a4;
        if (a4)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v20 = *MEMORY[0x1E4F502C8];
          uint64_t v166 = *MEMORY[0x1E4F28568];
          v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"launchTimeInMs"];
          v167 = v21;
          v22 = (void *)MEMORY[0x1E4F1C9E8];
          v23 = &v167;
          int v24 = &v166;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
      [v9 addObject:v14];
    }
    uint64_t v11 = [v6 countByEnumeratingWithState:&v134 objects:v170 count:16];
  }
  while (v11);
LABEL_15:

  id v15 = [v5 objectForKeyedSubscript:@"endpointDelayInMs"];
  long long v16 = [MEMORY[0x1E4F1CA98] null];
  int v17 = [v15 isEqual:v16];

  id v114 = v5;
  if (v17)
  {

    id v15 = 0;
LABEL_25:
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v15 = v15;
    uint64_t v28 = [v15 countByEnumeratingWithState:&v130 objects:v163 count:16];
    if (!v28) {
      goto LABEL_34;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v131;
    while (1)
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v131 != v30) {
          objc_enumerationMutation(v15);
        }
        uint64_t v32 = *(void *)(*((void *)&v130 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = a4;
          if (a4)
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v40 = *MEMORY[0x1E4F502C8];
            uint64_t v161 = *MEMORY[0x1E4F28568];
            v115 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"endpointDelayInMs"];
            v162 = v115;
            v41 = (void *)MEMORY[0x1E4F1C9E8];
            v42 = &v162;
            v43 = &v161;
LABEL_42:
            v44 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:1];
            self = v116;
            id v45 = (id)[v39 initWithDomain:v40 code:2 userInfo:v44];
            v27 = 0;
            id *v38 = v45;
            id v25 = v15;
            id v5 = v114;
            goto LABEL_116;
          }
LABEL_43:
          v27 = 0;
          id v25 = v15;
          goto LABEL_44;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v38 = a4;
          if (a4)
          {
            id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v40 = *MEMORY[0x1E4F502C8];
            uint64_t v159 = *MEMORY[0x1E4F28568];
            v115 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"endpointDelayInMs"];
            v160 = v115;
            v41 = (void *)MEMORY[0x1E4F1C9E8];
            v42 = &v160;
            v43 = &v159;
            goto LABEL_42;
          }
          goto LABEL_43;
        }
        [v21 addObject:v32];
      }
      uint64_t v29 = [v15 countByEnumeratingWithState:&v130 objects:v163 count:16];
      if (!v29)
      {
LABEL_34:

        id v25 = [v5 objectForKeyedSubscript:@"siriResponseTimeInMs"];
        v33 = [MEMORY[0x1E4F1CA98] null];
        int v34 = [v25 isEqual:v33];

        if (v34)
        {

          id v25 = 0;
LABEL_48:
          v115 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v25 = v25;
          uint64_t v46 = [v25 countByEnumeratingWithState:&v126 objects:v156 count:16];
          v110 = v21;
          if (!v46) {
            goto LABEL_57;
          }
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v127;
          while (1)
          {
            v49 = v25;
            for (uint64_t k = 0; k != v47; ++k)
            {
              if (*(void *)v127 != v48) {
                objc_enumerationMutation(v49);
              }
              uint64_t v51 = *(void *)(*((void *)&v126 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v57 = a4;
                if (a4)
                {
                  id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v59 = *MEMORY[0x1E4F502C8];
                  uint64_t v154 = *MEMORY[0x1E4F28568];
                  v113 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"siriResponseTimeInMs"];
                  v155 = v113;
                  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
                  v61 = v58;
LABEL_65:
                  v63 = (void *)v60;
                  id v25 = v49;
                  v27 = 0;
                  id *v57 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v59, 2);
                  v44 = v49;
                  id v5 = v114;
                  self = v116;
                  goto LABEL_66;
                }
LABEL_67:
                v27 = 0;
                id v25 = v49;
                v44 = v49;
                id v5 = v114;
                self = v116;
                v21 = v110;
                goto LABEL_116;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v57 = a4;
                if (a4)
                {
                  id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v59 = *MEMORY[0x1E4F502C8];
                  uint64_t v152 = *MEMORY[0x1E4F28568];
                  v113 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"siriResponseTimeInMs"];
                  v153 = v113;
                  uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
                  v61 = v62;
                  goto LABEL_65;
                }
                goto LABEL_67;
              }
              [v115 addObject:v51];
            }
            id v25 = v49;
            uint64_t v47 = [v49 countByEnumeratingWithState:&v126 objects:v156 count:16];
            id v5 = v114;
            v21 = v110;
            if (!v47)
            {
LABEL_57:

              v44 = [v5 objectForKeyedSubscript:@"timeToUufrInMs"];
              v52 = [MEMORY[0x1E4F1CA98] null];
              int v53 = [v44 isEqual:v52];

              if (v53)
              {

                v44 = 0;
LABEL_71:
                v113 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
                long long v122 = 0u;
                long long v123 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
                obuint64_t j = v44;
                uint64_t v64 = [obj countByEnumeratingWithState:&v122 objects:v149 count:16];
                if (!v64) {
                  goto LABEL_80;
                }
                uint64_t v65 = v64;
                uint64_t v66 = *(void *)v123;
                while (1)
                {
                  id v67 = v25;
                  for (uint64_t m = 0; m != v65; ++m)
                  {
                    if (*(void *)v123 != v66) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v69 = *(void *)(*((void *)&v122 + 1) + 8 * m);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v75 = a4;
                      if (a4)
                      {
                        id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v77 = *MEMORY[0x1E4F502C8];
                        uint64_t v147 = *MEMORY[0x1E4F28568];
                        v108 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"timeToUufrInMs"];
                        v148 = v108;
                        v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
                        v79 = v76;
                        uint64_t v80 = v77;
LABEL_89:
                        id v25 = v67;
                        v44 = obj;
                        id *v75 = (id)[v79 initWithDomain:v80 code:2 userInfo:v78];

                        v27 = 0;
                        v63 = obj;
                        id v5 = v114;
                        self = v116;
                        v21 = v110;
                        goto LABEL_114;
                      }
LABEL_90:
                      v27 = 0;
                      v44 = obj;
                      v63 = obj;
                      id v5 = v114;
                      self = v116;
                      id v25 = v67;
LABEL_66:
                      v21 = v110;
                      goto LABEL_115;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v75 = a4;
                      if (a4)
                      {
                        id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v82 = *MEMORY[0x1E4F502C8];
                        uint64_t v145 = *MEMORY[0x1E4F28568];
                        v108 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeToUufrInMs"];
                        v146 = v108;
                        v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                        v79 = v81;
                        uint64_t v80 = v82;
                        goto LABEL_89;
                      }
                      goto LABEL_90;
                    }
                    [v113 addObject:v69];
                  }
                  uint64_t v65 = [obj countByEnumeratingWithState:&v122 objects:v149 count:16];
                  id v5 = v114;
                  id v25 = v67;
                  v21 = v110;
                  if (!v65)
                  {
LABEL_80:
                    v44 = obj;

                    v70 = [v5 objectForKeyedSubscript:@"timeToFirstWordInMs"];
                    v71 = [MEMORY[0x1E4F1CA98] null];
                    id v106 = v70;
                    LODWORD(v70) = [v70 isEqual:v71];

                    if (v70)
                    {

                      goto LABEL_95;
                    }
                    if (v106)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (a4)
                        {
                          id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v102 = *MEMORY[0x1E4F502C8];
                          uint64_t v143 = *MEMORY[0x1E4F28568];
                          v109 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"timeToFirstWordInMs"];
                          v144 = v109;
                          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                          v104 = id v103 = v5;
                          *a4 = (id)[v101 initWithDomain:v102 code:2 userInfo:v104];
                          v21 = v110;

                          id v5 = v103;
                          v27 = 0;
                          self = v116;
                          v63 = v106;
                        }
                        else
                        {
                          v27 = 0;
                          self = v116;
                          v63 = v106;
                        }
                        goto LABEL_115;
                      }
                      v83 = v106;
                    }
                    else
                    {
LABEL_95:
                      v83 = 0;
                    }
                    v108 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v83, "count"));
                    long long v118 = 0u;
                    long long v119 = 0u;
                    long long v120 = 0u;
                    long long v121 = 0u;
                    id v107 = v83;
                    uint64_t v84 = [v107 countByEnumeratingWithState:&v118 objects:v142 count:16];
                    if (!v84) {
                      goto LABEL_105;
                    }
                    uint64_t v85 = v84;
                    uint64_t v86 = *(void *)v119;
LABEL_98:
                    id v87 = v25;
                    uint64_t v88 = 0;
                    while (1)
                    {
                      if (*(void *)v119 != v86) {
                        objc_enumerationMutation(v107);
                      }
                      uint64_t v89 = *(void *)(*((void *)&v118 + 1) + 8 * v88);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        break;
                      }
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v93 = a4;
                        id v25 = v87;
                        v21 = v110;
                        v44 = obj;
                        if (a4)
                        {
                          id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v94 = *MEMORY[0x1E4F502C8];
                          uint64_t v138 = *MEMORY[0x1E4F28568];
                          v95 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeToFirstWordInMs"];
                          v139 = v95;
                          v96 = (void *)MEMORY[0x1E4F1C9E8];
                          v97 = &v139;
                          v98 = &v138;
LABEL_112:
                          v99 = [v96 dictionaryWithObjects:v97 forKeys:v98 count:1];
                          id *v93 = (id)[v105 initWithDomain:v94 code:2 userInfo:v99];
                        }
                        goto LABEL_113;
                      }
                      [v108 addObject:v89];
                      if (v85 == ++v88)
                      {
                        uint64_t v85 = [v107 countByEnumeratingWithState:&v118 objects:v142 count:16];
                        id v5 = v114;
                        id v25 = v87;
                        v21 = v110;
                        if (v85) {
                          goto LABEL_98;
                        }
LABEL_105:
                        v63 = v107;

                        self = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)v116 initWithLaunchTimeInMs:v9 endpointDelayInMs:v21 siriResponseTimeInMs:v115 timeToUufrInMs:v113 timeToFirstWordInMs:v108];
                        v27 = self;
                        v44 = obj;
LABEL_114:

LABEL_115:
LABEL_116:

LABEL_117:
                        goto LABEL_118;
                      }
                    }
                    v93 = a4;
                    id v25 = v87;
                    v21 = v110;
                    v44 = obj;
                    if (a4)
                    {
                      id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v94 = *MEMORY[0x1E4F502C8];
                      uint64_t v140 = *MEMORY[0x1E4F28568];
                      v95 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"timeToFirstWordInMs"];
                      v141 = v95;
                      v96 = (void *)MEMORY[0x1E4F1C9E8];
                      v97 = &v141;
                      v98 = &v140;
                      goto LABEL_112;
                    }
LABEL_113:
                    v63 = v107;

                    v27 = 0;
                    id v5 = v114;
                    self = v116;
                    goto LABEL_114;
                  }
                }
              }
              if (!v44) {
                goto LABEL_71;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_71;
              }
              if (a4)
              {
                id obja = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v90 = *MEMORY[0x1E4F502C8];
                uint64_t v150 = *MEMORY[0x1E4F28568];
                v113 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"timeToUufrInMs"];
                v151 = v113;
                uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
                id v92 = (id)[obja initWithDomain:v90 code:2 userInfo:v91];
                v27 = 0;
                *a4 = v92;
                v63 = (void *)v91;
                self = v116;
                goto LABEL_115;
              }
              v27 = 0;
LABEL_84:
              self = v116;
              goto LABEL_116;
            }
          }
        }
        if (!v25) {
          goto LABEL_48;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_48;
        }
        if (a4)
        {
          id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v73 = *MEMORY[0x1E4F502C8];
          uint64_t v157 = *MEMORY[0x1E4F28568];
          v115 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"siriResponseTimeInMs"];
          v158 = v115;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
          id v74 = (id)[v72 initWithDomain:v73 code:2 userInfo:v44];
          v27 = 0;
          *a4 = v74;
          goto LABEL_84;
        }
        v27 = 0;
LABEL_44:
        self = v116;
        goto LABEL_117;
      }
    }
  }
  if (!v15) {
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_25;
  }
  self = v116;
  if (a4)
  {
    id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v55 = *MEMORY[0x1E4F502C8];
    uint64_t v164 = *MEMORY[0x1E4F28568];
    v21 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"endpointDelayInMs"];
    v165 = v21;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
    id v56 = (id)[v54 initWithDomain:v55 code:2 userInfo:v25];
    v27 = 0;
    *a4 = v56;
    goto LABEL_117;
  }
  v27 = 0;
LABEL_118:

LABEL_119:
  return v27;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = self->_launchTimeInMs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v9) floatValue];
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = self->_endpointDelayInMs;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v14) floatValue];
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = self->_siriResponseTimeInMs;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v19) floatValue];
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v20 = self->_timeToUufrInMs;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v24) floatValue];
        PBDataWriterWriteFloatField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = self->_timeToFirstWordInMs;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v29), "floatValue", (void)v30);
        PBDataWriterWriteFloatField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples;
  id v5 = [(BMEventBase *)&v63 init];
  if (!v5)
  {
LABEL_56:
    id v58 = v5;
    goto LABEL_57;
  }
  id v62 = objc_opt_new();
  uint64_t v60 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v10 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v11 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v12 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_54:
    uint64_t v47 = objc_msgSend(v62, "copy", v60);
    launchTimeInMs = v5->_launchTimeInMs;
    v5->_launchTimeInMs = (NSArray *)v47;

    uint64_t v49 = [v61 copy];
    endpointDelayInMs = v5->_endpointDelayInMs;
    v5->_endpointDelayInMs = (NSArray *)v49;

    uint64_t v51 = [v6 copy];
    siriResponseTimeInMs = v5->_siriResponseTimeInMs;
    v5->_siriResponseTimeInMs = (NSArray *)v51;

    uint64_t v53 = [v7 copy];
    timeToUufrInMs = v5->_timeToUufrInMs;
    v5->_timeToUufrInMs = (NSArray *)v53;

    uint64_t v55 = [v8 copy];
    timeToFirstWordInMs = v5->_timeToFirstWordInMs;
    v5->_timeToFirstWordInMs = (NSArray *)v55;

    int v57 = v4[*v12];
    if (v57) {
      goto LABEL_55;
    }
    goto LABEL_56;
  }
  uint64_t v13 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v12]) {
      goto LABEL_54;
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = *v10;
      uint64_t v18 = *(void *)&v4[v17];
      unint64_t v19 = v18 + 1;
      if (v18 == -1 || v19 > *(void *)&v4[*v11]) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)&v4[*v13] + v18);
      *(void *)&v4[v17] = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << v14;
      if ((v20 & 0x80) == 0) {
        goto LABEL_13;
      }
      v14 += 7;
      if (v15++ >= 9)
      {
        unint64_t v16 = 0;
        uint64_t v22 = *v12;
        int v23 = v4[v22];
        goto LABEL_15;
      }
    }
    v4[*v12] = 1;
LABEL_13:
    uint64_t v22 = *v12;
    int v23 = v4[v22];
    if (v4[v22]) {
      unint64_t v16 = 0;
    }
LABEL_15:
    if (v23 || (v16 & 7) == 4) {
      goto LABEL_54;
    }
    switch((v16 >> 3))
    {
      case 1u:
        id v25 = NSNumber;
        uint64_t v26 = *v10;
        unint64_t v27 = *(void *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(void *)&v4[*v13] + v27);
          *(void *)&v4[v26] = v27 + 4;
        }
        else
        {
          v4[v22] = 1;
          double v9 = 0.0;
        }
        uint64_t v40 = objc_msgSend(v25, "numberWithFloat:", v9, v60);
        if (!v40) {
          goto LABEL_58;
        }
        long long v41 = (void *)v40;
        long long v42 = v62;
        goto LABEL_52;
      case 2u:
        uint64_t v28 = NSNumber;
        uint64_t v29 = *v10;
        unint64_t v30 = *(void *)&v4[v29];
        if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(void *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(void *)&v4[*v13] + v30);
          *(void *)&v4[v29] = v30 + 4;
        }
        else
        {
          v4[v22] = 1;
          double v9 = 0.0;
        }
        uint64_t v43 = objc_msgSend(v28, "numberWithFloat:", v9, v60);
        if (!v43) {
          goto LABEL_58;
        }
        long long v41 = (void *)v43;
        long long v42 = v60;
        goto LABEL_52;
      case 3u:
        long long v31 = NSNumber;
        uint64_t v32 = *v10;
        unint64_t v33 = *(void *)&v4[v32];
        if (v33 <= 0xFFFFFFFFFFFFFFFBLL && v33 + 4 <= *(void *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(void *)&v4[*v13] + v33);
          *(void *)&v4[v32] = v33 + 4;
        }
        else
        {
          v4[v22] = 1;
          double v9 = 0.0;
        }
        uint64_t v44 = objc_msgSend(v31, "numberWithFloat:", v9, v60);
        if (!v44) {
          goto LABEL_58;
        }
        long long v41 = (void *)v44;
        long long v42 = v6;
        goto LABEL_52;
      case 4u:
        long long v34 = NSNumber;
        uint64_t v35 = *v10;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(void *)&v4[*v13] + v36);
          *(void *)&v4[v35] = v36 + 4;
        }
        else
        {
          v4[v22] = 1;
          double v9 = 0.0;
        }
        uint64_t v45 = objc_msgSend(v34, "numberWithFloat:", v9, v60);
        if (!v45) {
          goto LABEL_58;
        }
        long long v41 = (void *)v45;
        long long v42 = v7;
        goto LABEL_52;
      case 5u:
        long long v37 = NSNumber;
        uint64_t v38 = *v10;
        unint64_t v39 = *(void *)&v4[v38];
        if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= *(void *)&v4[*v11])
        {
          LODWORD(v9) = *(_DWORD *)(*(void *)&v4[*v13] + v39);
          *(void *)&v4[v38] = v39 + 4;
        }
        else
        {
          v4[v22] = 1;
          double v9 = 0.0;
        }
        uint64_t v46 = objc_msgSend(v37, "numberWithFloat:", v9, v60);
        if (!v46) {
          goto LABEL_58;
        }
        long long v41 = (void *)v46;
        long long v42 = v8;
LABEL_52:
        [v42 addObject:v41];

        goto LABEL_53;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_53:
          if (*(void *)&v4[*v10] >= *(void *)&v4[*v11]) {
            goto LABEL_54;
          }
          continue;
        }
LABEL_58:

LABEL_55:
        id v58 = 0;
LABEL_57:

        return v58;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self launchTimeInMs];
  id v5 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self endpointDelayInMs];
  uint64_t v6 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self siriResponseTimeInMs];
  uint64_t v7 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToUufrInMs];
  uint64_t v8 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self timeToFirstWordInMs];
  double v9 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples with launchTimeInMs: %@, endpointDelayInMs: %@, siriResponseTimeInMs: %@, timeToUufrInMs: %@, timeToFirstWordInMs: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)initWithLaunchTimeInMs:(id)a3 endpointDelayInMs:(id)a4 siriResponseTimeInMs:(id)a5 timeToUufrInMs:(id)a6 timeToFirstWordInMs:(id)a7
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples;
  uint64_t v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_launchTimeInMs, a3);
    objc_storeStrong((id *)&v17->_endpointDelayInMs, a4);
    objc_storeStrong((id *)&v17->_siriResponseTimeInMs, a5);
    objc_storeStrong((id *)&v17->_timeToUufrInMs, a6);
    objc_storeStrong((id *)&v17->_timeToFirstWordInMs, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"launchTimeInMs" number:1 type:1 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"endpointDelayInMs", 2, 1, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriResponseTimeInMs" number:3 type:1 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeToUufrInMs" number:4 type:1 subMessageClass:0];
  v9[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeToFirstWordInMs" number:5 type:1 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5B38;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"launchTimeInMs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_289_53005];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"endpointDelayInMs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_291_53006];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"siriResponseTimeInMs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_293_53007];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"timeToUufrInMs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_295_53008];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"timeToFirstWordInMs_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_297_53009];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _timeToFirstWordInMsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _timeToUufrInMsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _siriResponseTimeInMsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _endpointDelayInMsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __80__BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _launchTimeInMsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end