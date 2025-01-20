@interface FedStatsMLRPlugin
+ (id)performWithTrialClient:(id)a3 outError:(id *)a4;
- (id)performTask:(id)a3 outError:(id *)a4;
- (id)performTrialTask:(id)a3 outError:(id *)a4;
- (void)stop;
@end

@implementation FedStatsMLRPlugin

- (id)performTask:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [v5 parameters];
  v8 = [v7 stringValueForKey:@"namespaceID" defaultValue:&stru_100008378];
  [v6 setNamespaceIdentifier:v8];

  v9 = [v6 namespaceIdentifier];
  unsigned int v10 = [v9 isEqualToString:&stru_100008378];

  if (v10)
  {
    v11 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100005ACC(v11, v12, v13, v14, v15, v16, v17, v18);
    }

    if (a4)
    {
      id v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    v20 = [v5 parameters];
    v21 = [v20 stringValueForKey:@"recipeURL" defaultValue:&stru_100008378];

    if ([v21 isEqualToString:&stru_100008378])
    {
      v22 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100005B44(v22, v23, v24, v25, v26, v27, v28, v29);
      }

      if (a4)
      {
        id v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v19 = 0;
      }
    }
    else
    {
      v30 = +[NSURL URLWithString:v21];
      [v6 setRecipeURL:v30];

      v31 = [(id)objc_opt_class() performWithTrialClient:v6 outError:a4];
      if (v31) {
        id v19 = [objc_alloc((Class)MLRTaskResult) initWithJSONResult:&__NSDictionary0__struct unprivatizedVector:0];
      }
      else {
        id v19 = 0;
      }
    }
  }

  return v19;
}

- (id)performTrialTask:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  v6 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100005C00((uint64_t)v5, v6);
  }

  v7 = [[FedStatsPluginTrialClient alloc] initWithTask:v5 error:a4];
  if (v7)
  {
    v8 = [(id)objc_opt_class() performWithTrialClient:v7 outError:a4];
  }
  else
  {
    v9 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100005BBC(v9);
    }

    v8 = 0;
  }

  return v8;
}

+ (id)performWithTrialClient:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 recipeIdentifiers];
  v6 = [v5 firstObject];

  v7 = [v4 recipeURL];

  v8 = +[FedStatsPluginLog logger];
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100005D68(v9);
    }

    unsigned int v10 = +[FedStatsPluginEngine runAllRecipesWithAssetProvider:v4];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v11 = objc_msgSend(v10, "allValues", 0);
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v11);
          }
          v14 += (uint64_t)[*(id *)(*((void *)&v27 + 1) + 8 * i) unsignedIntegerValue];
        }
        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v25 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100005CF0(v14, v25);
    }

    uint64_t v24 = objc_opt_new();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100005C78(v9, v17, v18, v19, v20, v21, v22, v23);
    }

    unsigned int v10 = +[FedStatsPluginError errorWithCode:100 description:@"Could not fetch recipeAttachment from Trial Client for registered namespaces"];
    +[FedStatsPluginTelemetry reportPluginForAssetProvider:v4 recipeIdentifier:v6 withError:v10];
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)stop
{
  v2 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100005DAC(v2);
  }
}

@end