@interface ADGenericIntentRequestTransformer
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADGenericIntentRequestTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  v38 = (void (**)(id, id))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = +[NSAssertionHandler currentHandler];
    [v37 handleFailureInMethod:a2, self, @"ADGenericIntentRequestTransformer.m", 114, @"Invalid parameter not satisfying: %@", @"[aceCommand isKindOfClass:[SAIntentGroupSupportedIntentResponse class]]" object file lineNumber description];
  }
  id v8 = v7;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = [v8 launchId];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v11 = [v8 parameters];
  id v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "ad_filteredDictionaryWithAppID:", v10);
        if (v17)
        {
          v18 = [v16 name];

          if (v18)
          {
            v19 = [v16 name];
            [v9 setObject:v17 forKey:v19];
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v13);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = [v8 commands];
  id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        uint64_t v26 = [v25 dictionary];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v25 name];

          if (v28)
          {
            v29 = [v25 dictionary];
            v30 = [v25 name];
            [v9 setObject:v29 forKey:v30];
          }
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v22);
  }

  id v31 = objc_alloc((Class)STGenericIntentRequest);
  v32 = [v8 launchId];
  v33 = [v8 useCaseId];
  v34 = [v8 utterance];
  id v35 = [v31 initWithAppIdentifier:v32 intentString:v33 utterance:v34 info:v9];

  objc_msgSend(v35, "_setLaunchToForeground:", objc_msgSend(v8, "backgroundLaunch") ^ 1);
  v36 = [v8 aceId];
  [v35 _setOriginatingAceID:v36];

  v38[2](v38, v35);
}

@end