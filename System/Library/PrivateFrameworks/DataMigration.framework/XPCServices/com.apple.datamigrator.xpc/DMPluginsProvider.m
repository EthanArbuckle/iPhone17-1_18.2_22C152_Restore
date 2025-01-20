@interface DMPluginsProvider
- (DMPluginsProvider)initWithReps:(id)a3 categories:(unsigned int)a4 pluginAllowedList:(id)a5;
- (NSArray)allPluginsInRunOrder;
- (NSArray)serialPluginsInRunOrder;
- (NSSet)allPlugins;
- (NSSet)concurrentPlugins;
@end

@implementation DMPluginsProvider

- (DMPluginsProvider)initWithReps:(id)a3 categories:(unsigned int)a4 pluginAllowedList:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v109.receiver = self;
  v109.super_class = (Class)DMPluginsProvider;
  v10 = [(DMPluginsProvider *)&v109 init];
  if (v10)
  {
    id obj = [v9 orderedUserAgnosticPluginSpecifiers];
    v82 = [v9 orderedUserSpecificPluginSpecifiers];
    id v77 = [v9 concurrentUserSpecificPluginSpecifiers];
    if (v6) {
      _DMLogFunc();
    }
    v74 = v10;
    id v75 = v9;
    if ((v6 & 2) != 0) {
      _DMLogFunc();
    }
    id v84 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v76 = v8;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v105 objects:v115 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v106;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v106 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "name", v72);
          if ([v17 hasPrefix:@"."]) {
            goto LABEL_17;
          }
          v18 = [v16 name];
          unsigned int v19 = [v18 hasSuffix:@".migrator"];

          if (v19)
          {
            if ([v16 isBundleValid])
            {
              v20 = [v16 bundleIdentifier];

              if (v20)
              {
                v21 = [v16 bundleIdentifier];
                [v84 setObject:v16 forKey:v21];
                goto LABEL_19;
              }
            }
            v17 = [v16 name];
            v72 = v17;
            _DMLogFunc();
LABEL_17:
          }
          v21 = objc_msgSend(v16, "name", v72);
          v72 = v21;
          _DMLogFunc();
LABEL_19:
        }
        id v13 = [v11 countByEnumeratingWithState:&v105 objects:v115 count:16];
      }
      while (v13);
    }

    id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(obj, "count") + (void)objc_msgSend(v82, "count"));
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id obja = obj;
    id v23 = [obja countByEnumeratingWithState:&v101 objects:v114 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v102;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v102 != v25) {
            objc_enumerationMutation(obja);
          }
          v27 = *(void **)(*((void *)&v101 + 1) + 8 * (void)j);
          if (v6)
          {
            v29 = objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * (void)j), "dmps_identifier");
            v28 = [v84 objectForKeyedSubscript:v29];
          }
          else
          {
            v28 = 0;
          }
          v30 = [DataMigrationPlugin alloc];
          v31 = objc_msgSend(v27, "dmps_identifier");
          v32 = [(DataMigrationPlugin *)v30 initWithIdentifier:v31 fileSystemRep:v28 isUserAgnostic:1];

          objc_msgSend(v27, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v32, "setTimeEstimate:");
          objc_msgSend(v27, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v32, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v27, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v32, "setTimeIntervalBeforeReboot:");
          [v22 addObject:v32];
        }
        id v24 = [obja countByEnumeratingWithState:&v101 objects:v114 count:16];
      }
      while (v24);
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v79 = v82;
    id v33 = [v79 countByEnumeratingWithState:&v97 objects:v113 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v98;
      do
      {
        for (k = 0; k != v34; k = (char *)k + 1)
        {
          if (*(void *)v98 != v35) {
            objc_enumerationMutation(v79);
          }
          v37 = *(void **)(*((void *)&v97 + 1) + 8 * (void)k);
          if ((v6 & 2) != 0
            || (objc_msgSend(*(id *)(*((void *)&v97 + 1) + 8 * (void)k), "dmps_excludedFromFirstLogin") & 1) == 0)
          {
            v39 = objc_msgSend(v37, "dmps_identifier", v72);
            v38 = [v84 objectForKeyedSubscript:v39];
          }
          else
          {
            v38 = 0;
          }
          v40 = [DataMigrationPlugin alloc];
          v41 = objc_msgSend(v37, "dmps_identifier");
          v42 = [(DataMigrationPlugin *)v40 initWithIdentifier:v41 fileSystemRep:v38 isUserAgnostic:0];

          objc_msgSend(v37, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v42, "setTimeEstimate:");
          objc_msgSend(v37, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v42, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v37, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v42, "setTimeIntervalBeforeReboot:");
          [v22 addObject:v42];
        }
        id v34 = [v79 countByEnumeratingWithState:&v97 objects:v113 count:16];
      }
      while (v34);
    }

    id v83 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v77, "count"));
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v78 = v77;
    id v43 = [v78 countByEnumeratingWithState:&v93 objects:v112 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v94;
      do
      {
        for (m = 0; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v94 != v45) {
            objc_enumerationMutation(v78);
          }
          v47 = *(void **)(*((void *)&v93 + 1) + 8 * (void)m);
          if ((v6 & 2) != 0
            || (objc_msgSend(*(id *)(*((void *)&v93 + 1) + 8 * (void)m), "dmps_excludedFromFirstLogin") & 1) == 0)
          {
            v49 = objc_msgSend(v47, "dmps_identifier", v72);
            v48 = [v84 objectForKeyedSubscript:v49];
          }
          else
          {
            v48 = 0;
          }
          v50 = [DataMigrationPlugin alloc];
          v51 = objc_msgSend(v47, "dmps_identifier");
          v52 = [(DataMigrationPlugin *)v50 initWithIdentifier:v51 fileSystemRep:v48 isUserAgnostic:0];

          v53 = objc_msgSend(v47, "dmps_concurrentPluginDependencyIdentifier");
          [(DataMigrationPlugin *)v52 setIdentifierOfDependency:v53];

          objc_msgSend(v47, "dmps_estimate");
          -[DataMigrationPlugin setTimeEstimate:](v52, "setTimeEstimate:");
          objc_msgSend(v47, "dmps_timeIntervalBeforeWatchdog");
          -[DataMigrationPlugin setTimeIntervalBeforeWatchdog:](v52, "setTimeIntervalBeforeWatchdog:");
          objc_msgSend(v47, "dmps_timeIntervalBeforeReboot");
          -[DataMigrationPlugin setTimeIntervalBeforeReboot:](v52, "setTimeIntervalBeforeReboot:");
          [v83 addObject:v52];
        }
        id v44 = [v78 countByEnumeratingWithState:&v93 objects:v112 count:16];
      }
      while (v44);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v54 = v22;
    id v55 = [v54 countByEnumeratingWithState:&v89 objects:v111 count:16];
    if (v55)
    {
      id v56 = v55;
      uint64_t v57 = 0;
      uint64_t v58 = *(void *)v90;
      do
      {
        for (n = 0; n != v56; n = (char *)n + 1)
        {
          if (*(void *)v90 != v58) {
            objc_enumerationMutation(v54);
          }
          v60 = *(void **)(*((void *)&v89 + 1) + 8 * (void)n);
          if (objc_msgSend(v60, "existsAndShouldRun", v72)) {
            ++v57;
          }
          else {
            [v60 setTimeEstimate:0.0];
          }
        }
        id v56 = [v54 countByEnumeratingWithState:&v89 objects:v111 count:16];
      }
      while (v56);
    }
    else
    {
      uint64_t v57 = 0;
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v61 = v83;
    id v62 = [v61 countByEnumeratingWithState:&v85 objects:v110 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v86;
      do
      {
        for (ii = 0; ii != v63; ii = (char *)ii + 1)
        {
          if (*(void *)v86 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = *(void **)(*((void *)&v85 + 1) + 8 * (void)ii);
          if (objc_msgSend(v66, "existsAndShouldRun", v72)) {
            ++v57;
          }
          else {
            [v66 setTimeEstimate:0.0];
          }
        }
        id v63 = [v61 countByEnumeratingWithState:&v85 objects:v110 count:16];
      }
      while (v63);
    }

    v73 = +[NSNumber numberWithUnsignedInteger:v57];
    _DMLogFunc();

    v67 = (NSArray *)objc_msgSend(v54, "copy", v73);
    v10 = v74;
    serialPluginsInRunOrder = v74->_serialPluginsInRunOrder;
    v74->_serialPluginsInRunOrder = v67;

    v69 = (NSSet *)[v61 copy];
    concurrentPlugins = v74->_concurrentPlugins;
    v74->_concurrentPlugins = v69;

    id v9 = v75;
    id v8 = v76;
  }

  return v10;
}

- (NSSet)allPlugins
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_allPlugins)
  {
    uint64_t v3 = [(NSSet *)v2->_concurrentPlugins setByAddingObjectsFromArray:v2->_serialPluginsInRunOrder];
    allPlugins = v2->_allPlugins;
    v2->_allPlugins = (NSSet *)v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_allPlugins;

  return v5;
}

- (NSArray)allPluginsInRunOrder
{
  v2 = self;
  objc_sync_enter(v2);
  v17 = v2;
  if (!v2->_allPluginsInRunOrder)
  {
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)-[NSArray count](v2->_serialPluginsInRunOrder, "count")+ -[NSSet count](v2->_concurrentPlugins, "count"));
    id v3 = [(NSSet *)v2->_concurrentPlugins mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v2->_serialPluginsInRunOrder;
    id v20 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          v4 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_msgSend(v22, "addObject:", v4, v17);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v5 = [v3 copy];
          id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v24;
            do
            {
              for (j = 0; j != v6; j = (char *)j + 1)
              {
                if (*(void *)v24 != v7) {
                  objc_enumerationMutation(v5);
                }
                id v9 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                v10 = [v9 identifierOfDependency];
                id v11 = [v4 identifier];
                unsigned int v12 = [v10 isEqualToString:v11];

                if (v12)
                {
                  [v22 addObject:v9];
                  [v3 removeObject:v9];
                }
              }
              id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v6);
          }
        }
        id v20 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v20);
    }

    id v13 = (NSArray *)[v22 copy];
    allPluginsInRunOrder = v17->_allPluginsInRunOrder;
    v17->_allPluginsInRunOrder = v13;

    v2 = v17;
  }
  objc_sync_exit(v2);

  v15 = v17->_allPluginsInRunOrder;

  return v15;
}

- (NSArray)serialPluginsInRunOrder
{
  return self->_serialPluginsInRunOrder;
}

- (NSSet)concurrentPlugins
{
  return self->_concurrentPlugins;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentPlugins, 0);
  objc_storeStrong((id *)&self->_serialPluginsInRunOrder, 0);
  objc_storeStrong((id *)&self->_allPluginsInRunOrder, 0);

  objc_storeStrong((id *)&self->_allPlugins, 0);
}

@end