@interface _ANEAnalyticsGroup
+ (id)objectWithID:(id)a3 layers:(id)a4 tasks:(id)a5;
- (NSArray)layerInfo;
- (NSArray)taskInfo;
- (NSNumber)groupID;
- (_ANEAnalyticsGroup)initWithID:(id)a3 layers:(id)a4 tasks:(id)a5;
- (id)serialize;
@end

@implementation _ANEAnalyticsGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_layerInfo, 0);

  objc_storeStrong((id *)&self->_groupID, 0);
}

- (NSArray)taskInfo
{
  return self->_taskInfo;
}

- (NSArray)layerInfo
{
  return self->_layerInfo;
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (id)serialize
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(_ANEAnalyticsGroup *)self groupID];
  v5 = [v3 stringWithFormat:@"%@", v4];

  v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v7 = [(_ANEAnalyticsGroup *)self layerInfo];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) serialize];
        [v6 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v8);
  }

  v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = [(_ANEAnalyticsGroup *)self taskInfo];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = [*(id *)(*((void *)&v21 + 1) + 8 * j) serialize];
        [v12 addObject:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v14);
  }

  v30[1] = v12;
  v31 = v5;
  v29[0] = @"layers";
  v29[1] = @"tasks";
  v30[0] = v6;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v32 = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

  return v19;
}

- (_ANEAnalyticsGroup)initWithID:(id)a3 layers:(id)a4 tasks:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ANEAnalyticsGroup;
  v12 = [(_ANEAnalyticsGroup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_groupID, a3);
    objc_storeStrong((id *)&v13->_layerInfo, a4);
    objc_storeStrong((id *)&v13->_taskInfo, a5);
  }

  return v13;
}

+ (id)objectWithID:(id)a3 layers:(id)a4 tasks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc((Class)a1) initWithID:v8 layers:v9 tasks:v10];

  return v11;
}

@end