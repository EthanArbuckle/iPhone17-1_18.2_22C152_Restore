@interface DefaultCollectionActions
- (BOOL)shouldRatelimit:(id)a3 rule:(id)a4;
- (void)autoBugCaptureWithType:(id)a3 subType:(id)a4 domain:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 attributes:(id)a9;
@end

@implementation DefaultCollectionActions

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 componentName:(id)a6 componentVersion:(id)a7 componentID:(id)a8 attributes:(id)a9
{
  id v23 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [[SecTapToRadar alloc] initTapToRadar:v19 description:v18 radar:v17];

  if (v23 && v14 && v15)
  {
    [v20 setComponentName:v23];
    [v20 setComponentVersion:v14];
    [v20 setComponentID:v15];
  }
  if (v16 && [MEMORY[0x1E4F28D90] isValidJSONObject:v16])
  {
    v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v16 options:3 error:0];
    if (v21)
    {
      v22 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
      [v20 setReason:v22];
    }
  }
  [v20 trigger];
}

- (void)autoBugCaptureWithType:(id)a3 subType:(id)a4 domain:(id)a5
{
}

- (BOOL)shouldRatelimit:(id)a3 rule:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 lastMatch];

  if (!v7) {
    goto LABEL_5;
  }
  v8 = [v6 rule];
  uint64_t v9 = [v8 repeatAfterSeconds];

  uint64_t v10 = 86400;
  if (v9) {
    uint64_t v10 = v9;
  }
  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)-v10];
  v12 = [v6 lastMatch];
  uint64_t v13 = [v11 compare:v12];

  if (v13 != 1)
  {
    BOOL v17 = 1;
  }
  else
  {
LABEL_5:
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setLastMatch:v14];

    id v15 = [v6 lastMatch];
    id v16 = [v6 lastMatchTimeKey];
    [v5 setDateProperty:v15 forKey:v16];

    BOOL v17 = 0;
  }

  return v17;
}

@end