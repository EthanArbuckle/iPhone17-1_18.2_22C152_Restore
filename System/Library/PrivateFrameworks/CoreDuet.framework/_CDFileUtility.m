@interface _CDFileUtility
- (_CDFileUtility)init;
- (id)fileHandlerUtiity:(void *)a3 withBundleId:(void *)a4 withMetaData:;
- (void)writeJSON:(void *)a3 withFileHandle:;
@end

@implementation _CDFileUtility

- (_CDFileUtility)init
{
  v3.receiver = self;
  v3.super_class = (Class)_CDFileUtility;
  return [(_CDFileUtility *)&v3 init];
}

- (id)fileHandlerUtiity:(void *)a3 withBundleId:(void *)a4 withMetaData:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = [v7 stream];
    v12 = [v11 name];

    if (!v12)
    {
      v20 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_CDFileUtility fileHandlerUtiity:withBundleId:withMetaData:](v20);
      }

      v21 = 0;
      goto LABEL_17;
    }
    [v10 setObject:v12 forKeyedSubscript:@"eventStream"];
    v13 = [v7 startDate];
    v14 = [v7 endDate];
    if (v13)
    {
      v15 = NSNumber;
      [v13 timeIntervalSince1970];
      v16 = objc_msgSend(v15, "numberWithDouble:");
      [v10 setObject:v16 forKeyedSubscript:@"startDate"];

      if (v14) {
        goto LABEL_5;
      }
    }
    else
    {
      [v10 setObject:@"null" forKeyedSubscript:@"startDate"];
      if (v14)
      {
LABEL_5:
        v17 = NSNumber;
        [v14 timeIntervalSince1970];
        v18 = objc_msgSend(v17, "numberWithDouble:");
        [v10 setObject:v18 forKeyedSubscript:@"endDate"];

        if (v13)
        {
          [v14 timeIntervalSinceDate:v13];
          v19 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v10 setObject:v19 forKeyedSubscript:@"duration"];

LABEL_13:
          [v10 setObject:v8 forKeyedSubscript:@"bundleID"];
          if (v9)
          {
            v22 = (void *)[v9 copy];
            [v10 setObject:v22 forKeyedSubscript:@"metadata"];
          }
          else
          {
            [v10 setObject:@"null" forKeyedSubscript:@"metadata"];
          }
          v21 = (void *)[v10 copy];

LABEL_17:
          goto LABEL_18;
        }
LABEL_12:
        [v10 setObject:@"null" forKeyedSubscript:@"duration"];
        goto LABEL_13;
      }
    }
    [v10 setObject:@"null" forKeyedSubscript:@"endDate"];
    goto LABEL_12;
  }
  v21 = 0;
LABEL_18:

  return v21;
}

- (void)writeJSON:(void *)a3 withFileHandle:
{
  id v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E4F28D90];
    id v7 = (void *)[a2 copy];
    id v11 = 0;
    id v8 = [v6 dataWithJSONObject:v7 options:0 error:&v11];
    id v9 = v11;

    if (v9)
    {
      id v10 = +[_CDLogging dataCollectionChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_CDFileUtility writeJSON:withFileHandle:]((uint64_t)v9, v10);
      }
    }
    else
    {
      [v5 writeData:v8];
      id v10 = [@"," dataUsingEncoding:4];
      [v5 writeData:v10];
    }
  }
}

- (void)fileHandlerUtiity:(os_log_t)log withBundleId:withMetaData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Exiting because no eventStreamName found", v1, 2u);
}

- (void)writeJSON:(uint64_t)a1 withFileHandle:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Error serializing json data: %@", (uint8_t *)&v2, 0xCu);
}

@end