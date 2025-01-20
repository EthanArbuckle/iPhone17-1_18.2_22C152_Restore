@interface _ANEAnalyticsProcedure
+ (id)objectWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5;
- (NSArray)groupInfo;
- (NSDictionary)procedureMetrics;
- (NSString)identifier;
- (_ANEAnalyticsProcedure)initWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5;
- (id)serialize;
@end

@implementation _ANEAnalyticsProcedure

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_procedureMetrics, 0);

  objc_storeStrong((id *)&self->_groupInfo, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)procedureMetrics
{
  return self->_procedureMetrics;
}

- (NSArray)groupInfo
{
  return self->_groupInfo;
}

- (id)serialize
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v24 = @"procedure_analytics";
  v4 = [(_ANEAnalyticsProcedure *)self procedureMetrics];
  v25[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [v3 addEntriesFromDictionary:v5];

  v22 = @"identifier";
  v6 = [(_ANEAnalyticsProcedure *)self identifier];
  v23 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  [v3 addEntriesFromDictionary:v7];

  v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v3 setObject:v8 forKeyedSubscript:@"group"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(_ANEAnalyticsProcedure *)self groupInfo];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v3 objectForKeyedSubscript:@"group"];
        v15 = [v13 serialize];
        [v14 addEntriesFromDictionary:v15];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v3;
}

- (_ANEAnalyticsProcedure)initWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ANEAnalyticsProcedure;
  v12 = [(_ANEAnalyticsProcedure *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupInfo, a3);
    objc_storeStrong((id *)&v13->_procedureMetrics, a4);
    objc_storeStrong((id *)&v13->_identifier, a5);
  }

  return v13;
}

+ (id)objectWithGroups:(id)a3 procedureMetrics:(id)a4 indentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc((Class)a1) initWithGroups:v8 procedureMetrics:v9 indentifier:v10];

  return v11;
}

@end