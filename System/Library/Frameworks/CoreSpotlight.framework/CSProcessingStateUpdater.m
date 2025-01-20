@interface CSProcessingStateUpdater
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (unint64_t)eventFlags;
@end

@implementation CSProcessingStateUpdater

- (id)taskName
{
  return @"processingStateUpdater";
}

- (int)eventType
{
  return 5;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, id))a4;
  id v9 = a5;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000D1E4;
  v16[3] = &unk_1000DC930;
  id v10 = v7;
  id v17 = v10;
  v19 = &v22;
  v20 = &v30;
  v21 = &v26;
  id v11 = v9;
  id v18 = v11;
  sub_100012034((uint64_t)v10, v16);
  uint64_t v12 = v27[3];
  uint64_t v13 = v23[3];
  if (*((unsigned char *)v31 + 24))
  {
    id v14 = [objc_alloc((Class)NSError) initWithDomain:@"CSProcessingStateUpdaterError" code:1 userInfo:0];
    v8[2](v8, v12, v13, v14);
  }
  else
  {
    v8[2](v8, v27[3], v23[3], 0);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return 1;
}

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSProcessingStateUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (unint64_t)eventFlags
{
  return 0;
}

- (id)includeBundleIDs
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = sub_10000FED4();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = sub_10000D688(*(void *)(*((void *)&v11 + 1) + 8 * i));
        id v9 = [v8 includeBundleIDs];
        [v2 addObjectsFromArray:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)excludeBundleIDs
{
  return 0;
}

- (id)includeContentTypes
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = sub_10000FED4();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = sub_10000D688(*(void *)(*((void *)&v11 + 1) + 8 * i));
        id v9 = [v8 includeContentTypes];
        [v2 addObjectsFromArray:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)excludeContentTypes
{
  return 0;
}

- (id)requiredAttributes
{
  return 0;
}

- (id)optionalAttribures
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  id v3 = sub_10000FED4();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = sub_10000D688(*(void *)(*((void *)&v11 + 1) + 8 * i));
        id v9 = [v8 optionalAttribures];
        [v2 addObjectsFromArray:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  return 1;
}

@end