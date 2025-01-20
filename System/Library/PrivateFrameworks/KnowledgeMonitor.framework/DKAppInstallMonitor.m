@interface DKAppInstallMonitor
@end

@implementation DKAppInstallMonitor

void __58___DKAppInstallMonitor__applicationsDidChange_didInstall___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v3 = *(id *)(a1 + 32);
  obuint64_t j = (id)[v3 countByEnumeratingWithState:&v65 objects:v71 count:16];
  v4 = 0;
  if (obj)
  {
    uint64_t v5 = *(void *)v66;
    id v51 = v3;
    uint64_t v52 = *(void *)v66;
    v48 = v2;
    do
    {
      for (i = 0; i != obj; i = (char *)i + 1)
      {
        if (*(void *)v66 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v8 = [v7 applicationType];
        if ([v8 isEqualToString:@"System"])
        {
        }
        else
        {
          char v9 = [v7 isAppUpdate];

          if (v9) {
            continue;
          }
        }
        v10 = [(id)objc_opt_class() _eventWithAppProxy:v7 didInstall:*(unsigned __int8 *)(a1 + 48)];
        if (v10) {
          [v2 addObject:v10];
        }
        if (!*(unsigned char *)(a1 + 48))
        {
          v11 = +[_DKAppInstallMonitor _identifierFromProxy:v7];
          if (v11)
          {
            if (!v4)
            {
              v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
            }
            v12 = [v7 correspondingApplicationRecord];
            v13 = [v12 appClipMetadata];

            v53 = v13;
            if (v13)
            {
              long long v63 = 0u;
              long long v64 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              v14 = [v13 parentApplicationIdentifiers];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v70 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                v49 = v4;
                uint64_t v17 = *(void *)v62;
                while (2)
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v62 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    v19 = [MEMORY[0x263F01890] bundleRecordWithApplicationIdentifier:*(void *)(*((void *)&v61 + 1) + 8 * j) error:0];

                    if (v19)
                    {
                      LODWORD(v13) = 1;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v70 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
                LODWORD(v13) = 0;
LABEL_26:
                v4 = v49;
                id v3 = v51;
              }
              else
              {
                LODWORD(v13) = 0;
              }
            }
            id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
            v21 = [MEMORY[0x263F35108] deletionPredicateForBundleID:v11];
            [v20 addObject:v21];

            if (v13)
            {
              v22 = (void *)MEMORY[0x263F08730];
              v23 = (void *)MEMORY[0x263F35110];
              [MEMORY[0x263F35148] appUsageStream];
              v25 = v24 = v4;
              v26 = [v25 name];
              v27 = [v23 predicateForEventsWithStreamName:v26];
              v28 = [v22 notPredicateWithSubpredicate:v27];

              id v3 = v51;
              v4 = v24;
              v2 = v48;
              [v20 addObject:v28];
            }
            v29 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v20];
            [v4 addObject:v29];
            [MEMORY[0x263F2A7F8] pruneWithUninstalledBundleIdentifier:v11];

            uint64_t v5 = v52;
          }
        }
      }
      obuint64_t j = (id)[v3 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (obj);
  }
  v50 = v4;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obja = v2;
  uint64_t v30 = [obja countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(obja);
        }
        v34 = *(void **)(*((void *)&v57 + 1) + 8 * k);
        id v35 = objc_alloc(MEMORY[0x263F29FB0]);
        v36 = [v34 stringValue];
        v37 = [v34 metadata];
        v38 = [MEMORY[0x263F35010] isInstall];
        v39 = [v37 objectForKeyedSubscript:v38];
        v40 = (void *)[v35 initWithBundleID:v36 isInstall:v39];

        v41 = [WeakRetained source];
        [v41 sendEvent:v40];
      }
      uint64_t v31 = [obja countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v31);
  }

  if ([obja count])
  {
    v42 = [WeakRetained historicalHandler];

    if (v42)
    {
      v43 = [WeakRetained historicalHandler];
      ((void (**)(void, id))v43)[2](v43, obja);
    }
  }
  if (v50)
  {
    if ([v50 count])
    {
      v44 = [WeakRetained historicalDeletingHandler];

      if (v44)
      {
        v45 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v50];
        v46 = [WeakRetained historicalDeletingHandler];
        ((void (**)(void, void *))v46)[2](v46, v45);
      }
    }
  }
  v47 = [MEMORY[0x263EFF910] date];
  [WeakRetained setLastUpdate:v47];
}

@end