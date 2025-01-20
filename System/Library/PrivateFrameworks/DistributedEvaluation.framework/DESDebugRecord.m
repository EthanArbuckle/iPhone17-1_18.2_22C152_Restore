@interface DESDebugRecord
+ (id)recordIDFromPluginID:(id)a3 taskSource:(int64_t)a4;
- (BOOL)commitWithError:(id *)a3;
- (DESDebugRecord)initWithPluginID:(id)a3 taskSource:(int64_t)a4;
- (DESDebugRecord)initWithRecordID:(id)a3 debugInfo:(id)a4;
- (NSDictionary)debugInfo;
- (NSString)recordID;
- (id)description;
- (id)initFromStoreWithPluginID:(id)a3 taskSource:(int64_t)a4;
- (id)stringForResult:(id)a3;
- (void)addForTaskID:(id)a3 result:(int64_t)a4 description:(id)a5;
@end

@implementation DESDebugRecord

+ (id)recordIDFromPluginID:(id)a3 taskSource:(int64_t)a4
{
  v4 = @"trial";
  if (a4 != 1) {
    v4 = 0;
  }
  return (id)[a3 stringByAppendingFormat:@".%@", v4];
}

- (id)initFromStoreWithPluginID:(id)a3 taskSource:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() recordIDFromPluginID:v6 taskSource:a4];

  v8 = [[DESUserDefaultsStoreRecord alloc] initWithRecordID:v7];
  v9 = [(DESUserDefaultsStoreRecord *)v8 debugInfo];
  v10 = [(DESDebugRecord *)self initWithRecordID:v7 debugInfo:v9];

  return v10;
}

- (DESDebugRecord)initWithPluginID:(id)a3 taskSource:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() recordIDFromPluginID:v6 taskSource:a4];

  v8 = [(DESDebugRecord *)self initWithRecordID:v7 debugInfo:0];
  return v8;
}

- (DESDebugRecord)initWithRecordID:(id)a3 debugInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)DESDebugRecord;
    v9 = [(DESDebugRecord *)&v17 init];
    if (v9)
    {
      v10 = [[DESUserDefaultsStoreRecord alloc] initWithRecordID:v7];
      storeRecord = v9->_storeRecord;
      v9->_storeRecord = v10;

      objc_storeStrong((id *)&v9->_recordID, a3);
      if (v8) {
        v12 = v8;
      }
      else {
        v12 = (void *)MEMORY[0x1E4F1CC08];
      }
      uint64_t v13 = [v12 mutableCopy];
      debugInfo = v9->_debugInfo;
      v9->_debugInfo = (NSMutableDictionary *)v13;
    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v17 = [MEMORY[0x1E4F28E78] string];
  [v17 appendFormat:@"%@: %lu task(s) in last run", self->_recordID, -[NSMutableDictionary count](self->_debugInfo, "count")];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_debugInfo;
  uint64_t v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v8 = [(NSMutableDictionary *)self->_debugInfo objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 objectForKeyedSubscript:@"result"];
          v10 = [(DESDebugRecord *)self stringForResult:v9];
          v11 = [v8 objectForKeyedSubscript:@"timestamp"];
          [v17 appendFormat:@"\n\t%@ (%@) at %@", v7, v10, v11];

          v12 = [v8 objectForKeyedSubscript:@"description"];

          if (v12)
          {
            uint64_t v13 = [v8 objectForKeyedSubscript:@"description"];
            [v17 appendFormat:@"\n\t\t%@", v13];
          }
        }
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  v14 = (void *)[v17 copy];

  return v14;
}

- (id)stringForResult:(id)a3
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F19E0D80;
  v10[1] = &unk_1F19E0D98;
  v11[0] = @"success";
  v11[1] = @"skipped";
  v10[2] = &unk_1F19E0DB0;
  v10[3] = &unk_1F19E0DC8;
  v11[2] = @"deferred by OS";
  v11[3] = @"deferred by plugin";
  v10[4] = &unk_1F19E0DE0;
  v11[4] = @"fail to run";
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v11 forKeys:v10 count:5];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = @"unknown result";
  }
  id v8 = v7;

  return v8;
}

- (NSDictionary)debugInfo
{
  v2 = (void *)[(NSMutableDictionary *)self->_debugInfo copy];

  return (NSDictionary *)v2;
}

- (void)addForTaskID:(id)a3 result:(int64_t)a4 description:(id)a5
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = DESIsInternalInstall();
  if (v8 && v10)
  {
    v11 = (void *)MEMORY[0x1E4F1CA60];
    v17[0] = @"result";
    v12 = [NSNumber numberWithInteger:a4];
    v17[1] = @"timestamp";
    v18[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    v18[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v15 = [v11 dictionaryWithDictionary:v14];

    if (v9) {
      [v15 setObject:v9 forKeyedSubscript:@"description"];
    }
    v16 = (void *)[v15 copy];
    [(NSMutableDictionary *)self->_debugInfo setObject:v16 forKeyedSubscript:v8];
  }
}

- (BOOL)commitWithError:(id *)a3
{
  if (DESIsInternalInstall()) {
    [(DESUserDefaultsStoreRecord *)self->_storeRecord setDebugInfo:self->_debugInfo];
  }
  return 1;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_storeRecord, 0);

  objc_storeStrong((id *)&self->_debugInfo, 0);
}

@end