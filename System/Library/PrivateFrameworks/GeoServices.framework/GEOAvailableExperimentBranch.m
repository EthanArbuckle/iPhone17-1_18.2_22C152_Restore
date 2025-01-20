@interface GEOAvailableExperimentBranch
- (BOOL)isActive;
- (GEOAvailableExperimentBranch)initWithLabel:(id)a3 name:(id)a4 experimentIdentifier:(id)a5;
- (NSArray)_clientConfig;
- (NSDictionary)_dictionaryRepresentation;
- (NSDictionary)clientConfigValues;
- (NSString)label;
- (NSString)name;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)querySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4;
- (void)_addAssignment:(id)a3;
- (void)_setClientConfig:(id)a3;
@end

@implementation GEOAvailableExperimentBranch

- (GEOAvailableExperimentBranch)initWithLabel:(id)a3 name:(id)a4 experimentIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)GEOAvailableExperimentBranch;
  v11 = [(GEOAvailableExperimentBranch *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    label = v11->_label;
    v11->_label = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    experimentIdentifier = v11->_experimentIdentifier;
    v11->_experimentIdentifier = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return [(GEOAvailableExperimentBranch *)self _descriptionWithIndent:0];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  for (i = [MEMORY[0x1E4F28E78] stringWithString:&stru_1ED51F370];
    [i appendString:@"\t"];
  v6 = (void *)MEMORY[0x1E4F28E78];
  v27.receiver = self;
  v27.super_class = (Class)GEOAvailableExperimentBranch;
  v7 = [(GEOAvailableExperimentBranch *)&v27 description];
  id v8 = [v6 stringWithFormat:@"%@ %@ %@\n", v7, self->_label, self->_name];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v21 = self;
  obuint64_t j = self->_assignments;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if ([v13 serviceType] == 1)
        {
          uint64_t v14 = NSString;
          uint64_t v15 = [v13 placeRequestType];
          if (v15 >= 0x3F)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
            uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v16 = off_1E53E5FE0[(int)v15];
          }
          v18 = [v14 stringWithFormat:@"Dispatcher.%@", v16];
        }
        else
        {
          uint64_t v17 = [v13 serviceType];
          if (v17 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = off_1E53E61D8[(int)v17];
          }
        }
        [v8 appendString:i];
        v19 = [v13 querySubstring];
        [v8 appendFormat:@"\t+> %@ - %@\n", v18, v19];
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  if (v21->_clientConfig)
  {
    [v8 appendString:i];
    [v8 appendFormat:@"\t+> CLIENT - %@", v21->_clientConfig];
  }

  return v8;
}

- (void)_addAssignment:(id)a3
{
  id v4 = a3;
  assignments = self->_assignments;
  id v8 = v4;
  if (!assignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_assignments;
    self->_assignments = v6;

    id v4 = v8;
    assignments = self->_assignments;
  }
  [(NSMutableArray *)assignments addObject:v4];
}

- (id)querySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a3 != 2 && a3 == 1;
  if (a3 == 2) {
    int v6 = 2;
  }
  else {
    int v6 = a3 == 1;
  }
  BOOL v7 = a3 != 3 && v5;
  if (a3 == 3) {
    int v8 = 3;
  }
  else {
    int v8 = v6;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = self->_assignments;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    char v13 = !v7;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v16 = objc_msgSend(v15, "serviceType", (void)v21);
        BOOL v17 = v16 == v8;
        if (v16 == v8) {
          char v18 = v13;
        }
        else {
          char v18 = 1;
        }
        if ((v18 & 1) == 0) {
          BOOL v17 = [v15 placeRequestType] == a4;
        }
        if (v17)
        {
          v19 = [v15 querySubstring];
          goto LABEL_28;
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  v19 = 0;
LABEL_28:

  return v19;
}

- (NSDictionary)clientConfigValues
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_clientConfig count])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_clientConfig, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = self->_clientConfig;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasAbConfigKey", (void)v16)
            && [v9 hasAbConfigValue])
          {
            uint64_t v10 = [v9 abConfigValue];
            switch([v9 abConfigValueType])
            {
              case 1u:
                uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v10, "intValue"));
                goto LABEL_14;
              case 2u:
                uint64_t v12 = NSNumber;
                [v10 doubleValue];
                uint64_t v11 = objc_msgSend(v12, "numberWithDouble:");
                goto LABEL_14;
              case 3u:
                uint64_t v11 = [v10 stringValue];
                goto LABEL_14;
              case 4u:
                uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
LABEL_14:
                char v13 = (void *)v11;
                if (v11)
                {
                  uint64_t v14 = [v9 abConfigKey];
                  [v3 setObject:v13 forKeyedSubscript:v14];
                }
                break;
              default:
                break;
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)_dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  experimentIdentifier = self->_experimentIdentifier;
  if (experimentIdentifier) {
    [v3 setObject:experimentIdentifier forKeyedSubscript:@"ExperimentID"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKeyedSubscript:@"BranchLabel"];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_assignments;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "serviceType", (void)v21) - 1;
        if (v13 < 3) {
          uint64_t v14 = v13 + 1;
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = [v12 placeRequestType];
        long long v16 = [v12 querySubstring];
        _GEOSetQueryForExperimentTypeInDictionary(v4, v14, v15, v16);
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  long long v17 = [(GEOAvailableExperimentBranch *)self clientConfigValues];
  if ([v17 count]) {
    [v4 setObject:v17 forKeyedSubscript:@"ClientConfig"];
  }
  if (objc_msgSend(v4, "count", (void)v21)) {
    long long v18 = v4;
  }
  else {
    long long v18 = 0;
  }
  long long v19 = v18;

  return v19;
}

- (BOOL)isActive
{
  v3 = _getValue(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1E9114858, 1, 0, 0, 0);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 objectForKeyedSubscript:@"ExperimentID"];
    if ([v4 isEqualToString:self->_experimentIdentifier])
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"BranchLabel"];
      char v6 = [v5 isEqualToString:self->_label];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)_clientConfig
{
  return self->_clientConfig;
}

- (void)_setClientConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end