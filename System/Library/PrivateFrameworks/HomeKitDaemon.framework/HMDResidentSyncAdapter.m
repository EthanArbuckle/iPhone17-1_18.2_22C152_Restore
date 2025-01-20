@interface HMDResidentSyncAdapter
@end

@implementation HMDResidentSyncAdapter

id __HMDResidentSyncAdapter_1_1_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [MEMORY[0x263EFF9C0] set];
  v53 = v2;
  toManyRelationship(v2, @"users");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v3;
  uint64_t v6 = [v4 count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    do
    {
      v9 = v4;
      v10 = [v4 objectAtIndexedSubscript:v8];
      v11 = objectValue(v10, 1, @"privilege");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      id v13 = v12;

      if (!v13 || (uint64_t v14 = [v13 unsignedIntegerValue], v13, v14 == 2))
      {
        id v4 = v9;
        [v9 removeObjectAtIndex:v8];
        --v7;
        if (v5) {
          objc_msgSend(v5, "addObject:", objectValue(v10, 0, @"modelID"));
        }
      }
      else
      {
        ++v8;
        id v4 = v9;
      }
    }
    while (v8 < v7);
  }

  v15 = v53;
  if ([v5 count])
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v52 = v4;
    obuint64_t j = v4;
    uint64_t v56 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v87;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v87 != v55) {
            objc_enumerationMutation(obj);
          }
          v57 = v16;
          v17 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v16);
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          toManyRelationship(v17, @"bulletinRegistrations");
          id v59 = (id)objc_claimAutoreleasedReturnValue();
          id v63 = (id)[v59 countByEnumeratingWithState:&v82 objects:v94 count:16];
          if (v63)
          {
            uint64_t v61 = *(void *)v83;
            do
            {
              for (i = 0; i != v63; i = (char *)i + 1)
              {
                if (*(void *)v83 != v61) {
                  objc_enumerationMutation(v59);
                }
                v19 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                long long v78 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v81 = 0u;
                v20 = toManyRelationship(v19, @"conditions");
                uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v93 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v79;
                  do
                  {
                    for (uint64_t j = 0; j != v22; ++j)
                    {
                      if (*(void *)v79 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      v25 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                      if (objc_msgSend(objectValue(v25, 0, @"$type"), "isEqualToString:", @"MKFPresenceBulletinCondition"))
                      {
                        v26 = toManyRelationship(v25, @"users");
                        pruneArrayOfRefs(v26, v5);
                      }
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v78 objects:v93 count:16];
                  }
                  while (v22);
                }
              }
              id v63 = (id)[v59 countByEnumeratingWithState:&v82 objects:v94 count:16];
            }
            while (v63);
          }

          v16 = v57 + 1;
        }
        while (v57 + 1 != (char *)v56);
        uint64_t v56 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
      }
      while (v56);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    toManyRelationship(v53, @"accessories");
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v64 countByEnumeratingWithState:&v74 objects:v92 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v75 != v29) {
            objc_enumerationMutation(v64);
          }
          v31 = *(void **)(*((void *)&v74 + 1) + 8 * k);
          v32 = toManyRelationship(v31, @"usersWithListeningHistoryEnabled");
          pruneArrayOfRefs(v32, v5);

          v33 = toManyRelationship(v31, @"usersWithMediaContentProfileEnabled");
          pruneArrayOfRefs(v33, v5);

          v34 = toManyRelationship(v31, @"usersWithPersonalRequestsEnabled");
          pruneArrayOfRefs(v34, v5);

          v35 = toManyRelationship(v31, @"pairedUsers");
          pruneArrayOfRefs(v35, v5);
        }
        uint64_t v28 = [v64 countByEnumeratingWithState:&v74 objects:v92 count:16];
      }
      while (v28);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    toManyRelationship(v53, @"triggers");
    id v58 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v62 = [v58 countByEnumeratingWithState:&v70 objects:v91 count:16];
    if (v62)
    {
      id v60 = *(id *)v71;
      do
      {
        for (uint64_t m = 0; m != v62; ++m)
        {
          if (*(id *)v71 != v60) {
            objc_enumerationMutation(v58);
          }
          v37 = *(void **)(*((void *)&v70 + 1) + 8 * m);
          v38 = objectValue(v37, 2, @"owner");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v39 = v38;
          }
          else {
            v39 = 0;
          }
          id v40 = v39;

          if (v40)
          {
            v41 = [v40 objectForKeyedSubscript:@"modelID"];
            int v42 = [v5 containsObject:v41];

            if (v42)
            {
              v43 = [v37 objectAtIndexedSubscript:2];
              [v43 setObject:0 forKeyedSubscript:@"owner"];
            }
          }
          id v65 = v40;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v44 = toManyRelationship(v37, @"events");
          uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v90 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v67;
            do
            {
              for (uint64_t n = 0; n != v46; ++n)
              {
                if (*(void *)v67 != v47) {
                  objc_enumerationMutation(v44);
                }
                v49 = *(void **)(*((void *)&v66 + 1) + 8 * n);
                if (objc_msgSend(objectValue(v49, 0, @"$type"), "isEqualToString:", @"Presence"))
                {
                  v50 = toManyRelationship(v49, @"users");
                  pruneArrayOfRefs(v50, v5);
                }
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v66 objects:v90 count:16];
            }
            while (v46);
          }
        }
        uint64_t v62 = [v58 countByEnumeratingWithState:&v70 objects:v91 count:16];
      }
      while (v62);
    }

    id v4 = v52;
    v15 = v53;
  }

  return v15;
}

@end