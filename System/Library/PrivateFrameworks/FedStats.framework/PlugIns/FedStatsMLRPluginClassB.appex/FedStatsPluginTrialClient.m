@interface FedStatsPluginTrialClient
- (BOOL)fetchAssets:(id)a3 error:(id *)a4;
- (FedStatsPluginTrialClient)initWithTask:(id)a3 error:(id *)a4;
- (NSDictionary)recipeDictionary;
- (NSMutableDictionary)assetURLs;
- (NSString)deploymentIdentifier;
- (NSString)experimentIdentifier;
- (NSString)namespaceIdentifier;
- (NSString)treatmentIdentifier;
- (NSURL)recipeURL;
- (TRIClient)trialClient;
- (id)assetURLForRecipe:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)deploymentIdentifierForRecipe:(id)a3;
- (id)downloadFactor:(id)a3 error:(id *)a4;
- (id)experimentIdentifierForRecipe:(id)a3;
- (id)namespaceIdentifierForRecipe:(id)a3;
- (id)recipeDictionaryForRecipe:(id)a3 error:(id *)a4;
- (id)recipeIdentifiers;
- (id)treatmentIdentifierForRecipe:(id)a3;
- (id)updateMetadataWithDPParameters:(id)a3;
- (void)loadRecipeWithError:(id *)a3;
- (void)removeAssets;
- (void)removeFactor:(id)a3;
- (void)setAssetURLs:(id)a3;
- (void)setDeploymentIdentifier:(id)a3;
- (void)setExperimentIdentifier:(id)a3;
- (void)setNamespaceIdentifier:(id)a3;
- (void)setRecipeDictionary:(id)a3;
- (void)setRecipeURL:(id)a3;
- (void)setTreatmentIdentifier:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation FedStatsPluginTrialClient

- (FedStatsPluginTrialClient)initWithTask:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)FedStatsPluginTrialClient;
  v8 = [(FedStatsPluginTrialClient *)&v51 init];
  if (!v8) {
    goto LABEL_25;
  }
  v48 = a4;
  uint64_t v9 = +[NSMutableDictionary dictionary];
  assetURLs = v8->_assetURLs;
  v8->_assetURLs = (NSMutableDictionary *)v9;

  v47 = +[NSBundle bundleForClass:objc_opt_class()];
  v50 = [v47 pathForResource:@"FedStatsPluginAllowedNamespaces" ofType:@"plist"];
  v49 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:");
  v11 = [v49 objectForKey:@"allowed-namespaces"];
  if (![v11 count])
  {
LABEL_13:
    if (v48)
    {
      +[FedStatsPluginError errorWithCode:300 description:@"Could not find any matching namespace on client"];
      int v23 = 0;
      v4 = 0;
      id *v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v23 = 1;
    }
    v24 = v47;
    goto LABEL_24;
  }
  v4 = 0;
  *(void *)&long long v12 = 138412546;
  long long v46 = v12;
  while (1)
  {
    v13 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v22 = [v11 objectAtIndexedSubscript:v4];
      *(_DWORD *)buf = 138412290;
      v53 = v22;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Checking for namespace: %@", buf, 0xCu);
    }
    v14 = [v7 triClient];
    v15 = [v11 objectAtIndexedSubscript:v4];
    v16 = [v14 levelForFactor:@"recipe" withNamespaceName:v15];

    v17 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v46;
      v53 = v16;
      __int16 v54 = 2112;
      CFStringRef v55 = @"recipe";
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Got level: %@ for factor %@", buf, 0x16u);
    }

    v18 = [v16 fileValue];
    if (([v18 hasPath] & 1) == 0)
    {

      goto LABEL_12;
    }
    v19 = [v16 fileValue];
    v20 = [v19 path];
    id v21 = [v20 rangeOfString:@".recipe"];

    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
LABEL_12:

    v4 = (FedStatsPluginTrialClient *)((char *)v4 + 1);
    if (v4 >= [v11 count]) {
      goto LABEL_13;
    }
  }
  v25 = [v16 fileValue];
  v26 = [v25 path];
  uint64_t v27 = +[NSURL fileURLWithPath:v26];
  recipeURL = v8->_recipeURL;
  v8->_recipeURL = (NSURL *)v27;

  [(FedStatsPluginTrialClient *)v8 loadRecipeWithError:v48];
  if (v8->_recipeDictionary)
  {
    uint64_t v29 = [v11 objectAtIndexedSubscript:v4];
    namespaceIdentifier = v8->_namespaceIdentifier;
    v8->_namespaceIdentifier = (NSString *)v29;

    v31 = [v7 triClient];
    [v31 refresh];
    v32 = [v11 objectAtIndexedSubscript:v4];
    v33 = [v31 experimentIdentifiersWithNamespaceName:v32];

    if (v33)
    {
      uint64_t v34 = [v33 experimentId];
      experimentIdentifier = v8->_experimentIdentifier;
      v8->_experimentIdentifier = (NSString *)v34;

      v36 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v33 deploymentId]);
      uint64_t v37 = [v36 stringValue];
      deploymentIdentifier = v8->_deploymentIdentifier;
      v8->_deploymentIdentifier = (NSString *)v37;

      uint64_t v39 = [v33 treatmentId];
      treatmentIdentifier = v8->_treatmentIdentifier;
      v8->_treatmentIdentifier = (NSString *)v39;
    }
    else
    {
      v41 = v8->_experimentIdentifier;
      v8->_experimentIdentifier = 0;

      v42 = v8->_deploymentIdentifier;
      v8->_deploymentIdentifier = 0;

      treatmentIdentifier = v8->_treatmentIdentifier;
      v8->_treatmentIdentifier = 0;
    }
    v24 = v47;

    uint64_t v43 = [v7 triClient];
    trialClient = v8->_trialClient;
    v8->_trialClient = (TRIClient *)v43;

    v4 = v8;
  }
  else
  {
    v4 = 0;
    v24 = v47;
  }

  int v23 = 0;
LABEL_24:

  if (v23) {
LABEL_25:
  }
    v4 = v8;

  return v4;
}

- (NSDictionary)recipeDictionary
{
  recipeDictionary = self->_recipeDictionary;
  if (!recipeDictionary)
  {
    [(FedStatsPluginTrialClient *)self loadRecipeWithError:0];
    recipeDictionary = self->_recipeDictionary;
  }
  return recipeDictionary;
}

- (void)loadRecipeWithError:(id *)a3
{
  p_recipeURL = (uint64_t *)&self->_recipeURL;
  v6 = +[NSData dataWithContentsOfURL:self->_recipeURL options:1 error:a3];
  if (v6)
  {
    uint64_t v7 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:a3];
    recipeDictionary = self->_recipeDictionary;
    p_recipeDictionary = (uint64_t *)&self->_recipeDictionary;
    uint64_t *p_recipeDictionary = v7;

    v10 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10000558C(p_recipeURL, p_recipeDictionary, v10);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100005548(v11);
      }

      long long v12 = (void *)*p_recipeDictionary;
      uint64_t *p_recipeDictionary = 0;

      if (a3)
      {
        *a3 = +[FedStatsPluginError errorWithCode:300 description:@"Recipe is not dictionary format"];
      }
    }
  }
  else
  {
    v13 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100005504(v13);
    }
  }
}

- (id)updateMetadataWithDPParameters:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 setObject:&stru_100008378 forKeyedSubscript:kDPMetadataVersionHash];
  v5 = [(FedStatsPluginTrialClient *)self recipeDictionary];
  uint64_t v6 = kDPMetadataDediscoTaskConfig;
  uint64_t v7 = [v5 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];

  if (v7)
  {
    [v4 setObject:v7 forKey:v6];
    v8 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "New metadata: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v8 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100005614(v6, v8);
    }
  }

  return v4;
}

- (id)downloadFactor:(id)a3 error:(id *)a4
{
  id v5 = a3;
  trialClient = self->_trialClient;
  uint64_t v7 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
  v8 = [(TRIClient *)trialClient factorLevelsWithNamespaceName:v7];

  long long v61 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  uint64_t v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v59;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v59 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        v15 = [v14 factor];
        v16 = [v15 name];
        unsigned int v17 = [v16 isEqualToString:v5];

        if (v17)
        {
          id v21 = [v14 level];
          v22 = [v21 fileValue];
          unsigned int v23 = [v22 hasPath];

          if (v23)
          {
            v24 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = [v14 level];
              v26 = [v25 fileValue];
              uint64_t v27 = [v26 path];
              *(_DWORD *)buf = 138412290;
              id v64 = v27;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ file exists.", buf, 0xCu);
            }
            v28 = [v14 level];
            uint64_t v29 = [v28 fileValue];
            v20 = [v29 path];

            v19 = v9;
          }
          else
          {

            dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
            v31 = +[FedStatsPluginLog logger];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
              *(_DWORD *)buf = 138412546;
              id v64 = v5;
              __int16 v65 = 2112;
              v66 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Downloading factor %@ for namespace %@", buf, 0x16u);
            }
            id v33 = [objc_alloc((Class)TRIDownloadOptions) initWithAllowsCellular:0 discretionaryBehavior:0];
            uint64_t v34 = self->_trialClient;
            id v62 = v5;
            v35 = +[NSArray arrayWithObjects:&v62 count:1];
            v36 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
            uint64_t v37 = dispatch_get_global_queue(0, 0);
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_1000041B0;
            v56[3] = &unk_100008228;
            id v57 = v5;
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100004214;
            v53[3] = &unk_100008250;
            id v38 = v57;
            id v54 = v38;
            v19 = v30;
            CFStringRef v55 = v19;
            objc_super v51 = v33;
            [(TRIClient *)v34 downloadLevelsForFactors:v35 withNamespace:v36 queue:v37 options:v33 progress:v56 completion:v53];

            dispatch_time_t v39 = dispatch_time(0, 600000000000);
            dispatch_semaphore_wait(v19, v39);
            v40 = [(FedStatsPluginTrialClient *)self trialClient];
            [v40 refresh];

            v41 = [(FedStatsPluginTrialClient *)self trialClient];
            uint64_t v42 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
            uint64_t v43 = [v41 levelForFactor:v38 withNamespaceName:v42];

            v44 = [v43 fileValue];
            LOBYTE(v42) = [v44 hasPath];

            if (v42)
            {
              v45 = +[FedStatsPluginLog logger];
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                long long v46 = [v43 fileValue];
                v47 = [v46 path];
                *(_DWORD *)buf = 138412546;
                id v64 = v38;
                __int16 v65 = 2112;
                v66 = v47;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Downloaded file for %@: %@", buf, 0x16u);
              }
              v48 = [v43 fileValue];
              v20 = [v48 path];
            }
            else
            {
              v49 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
              v48 = +[NSString stringWithFormat:@"Factor %@ of namespace %@ does not have a file downloaded", v38, v49];

              if (a4)
              {
                +[FedStatsPluginError errorWithCode:300 description:v48];
                v20 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = 0;
              }
            }
          }
          goto LABEL_26;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v18 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
  v19 = +[NSString stringWithFormat:@"Could not find any matching factor %@ for namespace %@", v5, v18];

  if (a4)
  {
    +[FedStatsPluginError errorWithCode:300 description:v19];
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_26:

  return v20;
}

- (void)removeFactor:(id)a3
{
  id v4 = a3;
  id v5 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000577C((uint64_t)v4, self, v5);
  }

  trialClient = self->_trialClient;
  id v14 = v4;
  uint64_t v7 = +[NSArray arrayWithObjects:&v14 count:1];
  v8 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000043FC;
  v11[3] = &unk_100008250;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  [(TRIClient *)trialClient removeLevelsForFactors:v7 withNamespace:v8 queue:v9 completion:v11];
}

- (id)recipeIdentifiers
{
  v2 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)assetURLForRecipe:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    id v12 = [(FedStatsPluginTrialClient *)self assetURLs];
    v13 = [v12 objectForKey:v8];

    if (v13)
    {
      id v14 = v13;
    }
    else
    {
      v15 = [(FedStatsPluginTrialClient *)self downloadFactor:v8 error:a5];
      if (v15)
      {
        v16 = [(FedStatsPluginTrialClient *)self assetURLs];
        unsigned int v17 = +[NSURL fileURLWithPath:v15];
        [v16 setObject:v17 forKey:v8];

        v18 = [(FedStatsPluginTrialClient *)self assetURLs];
        id v14 = [v18 objectForKey:v8];
      }
      else
      {
        id v14 = 0;
      }
    }
  }
  else if (a5)
  {
    +[FedStatsPluginError errorWithCode:300 description:@"Recipe identifier doesn't match the Trial client"];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)recipeDictionaryForRecipe:(id)a3 error:(id *)a4
{
  uint64_t v6 = [(FedStatsPluginTrialClient *)self recipeDictionary];

  if (!v6) {
    [(FedStatsPluginTrialClient *)self loadRecipeWithError:a4];
  }
  return [(FedStatsPluginTrialClient *)self recipeDictionary];
}

- (id)treatmentIdentifierForRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)experimentIdentifierForRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(FedStatsPluginTrialClient *)self experimentIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)deploymentIdentifierForRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(FedStatsPluginTrialClient *)self deploymentIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)namespaceIdentifierForRecipe:(id)a3
{
  id v4 = a3;
  id v5 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)fetchAssets:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
  id v8 = [v6 objectForKey:v7];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    id v21 = v8;
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v15 = [(FedStatsPluginTrialClient *)self treatmentIdentifier];
        id v22 = 0;
        v16 = [(FedStatsPluginTrialClient *)self assetURLForRecipe:v15 forKey:v14 error:&v22];
        id v17 = v22;

        if (!v16)
        {
          if (a4)
          {
            v19 = +[NSString stringWithFormat:@"Cannot get path for asset '%@'", v14];
            *a4 = +[FedStatsPluginError errorWithCode:300 underlyingError:v17 description:v19];
          }
          BOOL v18 = 0;
          goto LABEL_13;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    BOOL v18 = 1;
LABEL_13:
    id v8 = v21;
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)removeAssets
{
  v3 = [(FedStatsPluginTrialClient *)self assetURLs];
  id v4 = [v3 allKeys];

  id v5 = [v4 count];
  id v6 = +[FedStatsPluginLog logger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_100005A0C(v4, self, v6);
    }

    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_100004D30;
    v17[4] = sub_100004D40;
    id v18 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    trialClient = self->_trialClient;
    id v9 = [(FedStatsPluginTrialClient *)self namespaceIdentifier];
    id v10 = dispatch_get_global_queue(0, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004D48;
    v12[3] = &unk_100008278;
    v12[4] = &v13;
    v12[5] = v17;
    [(TRIClient *)trialClient removeLevelsForFactors:v4 withNamespace:v9 queue:v10 completion:v12];

    if (!*((unsigned char *)v14 + 24))
    {
      id v11 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000059C8(v11);
      }
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v17, 8);
  }
  else
  {
    if (v7) {
      sub_10000592C(self, v6);
    }
  }
}

- (NSURL)recipeURL
{
  return self->_recipeURL;
}

- (void)setRecipeURL:(id)a3
{
}

- (NSString)namespaceIdentifier
{
  return self->_namespaceIdentifier;
}

- (void)setNamespaceIdentifier:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)experimentIdentifier
{
  return self->_experimentIdentifier;
}

- (void)setExperimentIdentifier:(id)a3
{
}

- (NSString)deploymentIdentifier
{
  return self->_deploymentIdentifier;
}

- (void)setDeploymentIdentifier:(id)a3
{
}

- (NSString)treatmentIdentifier
{
  return self->_treatmentIdentifier;
}

- (void)setTreatmentIdentifier:(id)a3
{
}

- (void)setRecipeDictionary:(id)a3
{
}

- (NSMutableDictionary)assetURLs
{
  return self->_assetURLs;
}

- (void)setAssetURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetURLs, 0);
  objc_storeStrong((id *)&self->_recipeDictionary, 0);
  objc_storeStrong((id *)&self->_treatmentIdentifier, 0);
  objc_storeStrong((id *)&self->_deploymentIdentifier, 0);
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeURL, 0);
}

@end