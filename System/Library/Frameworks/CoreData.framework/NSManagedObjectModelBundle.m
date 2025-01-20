@interface NSManagedObjectModelBundle
- (NSManagedObjectModelBundle)initWithPath:(id)a3;
- (id)_modelForVersionHashes:(id)a3;
- (id)_modelForVersionHashes:(id)a3 inStyle:(unint64_t)a4;
- (id)currentVersion;
- (id)currentVersionURL;
- (id)modelVersions;
- (id)optimizedVersionURL;
- (id)urlForModelVersionWithName:(id)a3;
- (id)versionChecksums;
- (void)dealloc;
@end

@implementation NSManagedObjectModelBundle

- (NSManagedObjectModelBundle)initWithPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSManagedObjectModelBundle;
  v4 = [(NSManagedObjectModelBundle *)&v8 init];
  if (v4)
  {
    v5 = (NSBundle *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:a3];
    v4->_bundle = v5;
    if (v5)
    {
      uint64_t v6 = [(NSBundle *)v5 pathForResource:@"VersionInfo" ofType:@"plist"];
      if (v6
        || (uint64_t v6 = [(NSBundle *)v4->_bundle pathForResource:@"Info" ofType:@"plist"]) != 0)
      {
        v4->_versionInfoDictionary = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
      }
    }
  }
  return v4;
}

- (id)urlForModelVersionWithName:(id)a3
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_bundle;
  }
  id result = (id)[(NSManagedObjectModelBundle *)self pathForResource:a3 ofType:@"mom"];
  if (result)
  {
    id v4 = result;
    v5 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v5 fileURLWithPath:v4 isDirectory:0];
  }
  return result;
}

- (id)optimizedVersionURL
{
  if (self) {
    bundle = self->_bundle;
  }
  else {
    bundle = 0;
  }
  id result = [(NSBundle *)bundle pathForResource:[(NSManagedObjectModelBundle *)self currentVersion] ofType:@"omo"];
  if (result)
  {
    id v4 = result;
    v5 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v5 fileURLWithPath:v4 isDirectory:0];
  }
  return result;
}

- (id)currentVersionURL
{
  id v3 = [(NSManagedObjectModelBundle *)self currentVersion];

  return [(NSManagedObjectModelBundle *)self urlForModelVersionWithName:v3];
}

- (id)currentVersion
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  }
  return (id)[(NSManagedObjectModelBundle *)self objectForKey:@"NSManagedObjectModel_CurrentVersionName"];
}

- (void)dealloc
{
  self->_bundle = 0;
  self->_versionInfoDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSManagedObjectModelBundle;
  [(NSManagedObjectModelBundle *)&v3 dealloc];
}

- (id)versionChecksums
{
  if (self) {
    self = (NSManagedObjectModelBundle *)self->_versionInfoDictionary;
  }
  return (id)[(NSManagedObjectModelBundle *)self objectForKey:@"NSManagedObjectModel_VersionChecksums"];
}

- (id)modelVersions
{
  if (self)
  {
    self = [(NSDictionary *)self->_versionInfoDictionary objectForKey:@"NSManagedObjectModel_VersionHashes"];
    uint64_t v2 = vars8;
  }
  return (id)[(NSManagedObjectModelBundle *)self allKeys];
}

- (id)_modelForVersionHashes:(id)a3 inStyle:(unint64_t)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (a4 == 1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    v56 = (void *)[a3 allKeys];
    v7 = [(NSBundle *)self->_bundle URLsForResourcesWithExtension:@"mom" subdirectory:0];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    obuint64_t j = v7;
    uint64_t v61 = [(NSArray *)v7 countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v61)
    {
      id v55 = v6;
      id v65 = 0;
      v58 = 0;
      uint64_t v59 = *(void *)v89;
      while (2)
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v89 != v59) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v88 + 1) + 8 * i);
          context = (void *)MEMORY[0x18C127630]();
          v63 = [[NSManagedObjectModel alloc] initWithContentsOfURL:v9];
          id v10 = -[NSManagedObjectModel _entityVersionHashesByNameInStyle:](v63, 1);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v84 objects:v96 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            v13 = 0;
            uint64_t v14 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v85 != v14) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v16 = *(void *)(*((void *)&v84 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v10, "objectForKey:", v16), "isEqual:", objc_msgSend(a3, "objectForKey:", v16)))
                {
                  if (!v13) {
                    v13 = (void *)[MEMORY[0x1E4F1CA48] array];
                  }
                  [v13 addObject:v16];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v84 objects:v96 count:16];
            }
            while (v12);
          }
          else
          {
            v13 = 0;
          }
          if ([v13 count])
          {
            unint64_t v17 = [v13 count];
            v18 = v63;
            if (v17 > [v65 count])
            {

              v58 = v63;
              id v65 = v13;
              uint64_t v19 = [v56 count];
              if (v19 == [v13 count])
              {

                goto LABEL_32;
              }
            }
            v20 = context;
          }
          else
          {
            v20 = context;
            v18 = v63;
          }
        }
        uint64_t v61 = [(NSArray *)obj countByEnumeratingWithState:&v88 objects:v97 count:16];
        if (v61) {
          continue;
        }
        break;
      }
LABEL_32:
      id v22 = 0;
      v23 = v58;
      if (!v58)
      {
        id v6 = v55;
LABEL_75:
        v24 = v65;
        goto LABEL_76;
      }
      v24 = v65;
      if (v65)
      {
        v25 = [(NSManagedObjectModel *)v58 entitiesByName];
        v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v65, "count"));
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v65, "count"));
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v28 = [v65 countByEnumeratingWithState:&v80 objects:v95 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v81;
          uint64_t v60 = *(void *)v81;
          v62 = v25;
          do
          {
            uint64_t v31 = 0;
            uint64_t v64 = v29;
            do
            {
              if (*(void *)v81 != v30) {
                objc_enumerationMutation(v24);
              }
              uint64_t v32 = *(void *)(*((void *)&v80 + 1) + 8 * v31);
              v33 = (void *)MEMORY[0x18C127630]();
              for (id k = -[NSDictionary objectForKey:](v25, "objectForKey:", v32); ; id k = (id)[v35 superentity])
              {
                v35 = k;
                objc_msgSend(v27, "addObject:", objc_msgSend(k, "name"));
                if (![v35 superentity]) {
                  break;
                }
              }
              if (!objc_msgSend(v26, "valueForKey:", objc_msgSend(v35, "name")))
              {
                v36 = (void *)[v35 copy];
                id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                contexta = v36;
                +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v37, v36);
                long long v78 = 0u;
                long long v79 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                uint64_t v38 = [v37 countByEnumeratingWithState:&v76 objects:v94 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v77;
                  do
                  {
                    for (uint64_t m = 0; m != v39; ++m)
                    {
                      if (*(void *)v77 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      objc_msgSend(v26, "setObject:forKey:", *(void *)(*((void *)&v76 + 1) + 8 * m), objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * m), "name"));
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v76 objects:v94 count:16];
                  }
                  while (v39);
                }

                uint64_t v29 = v64;
                v24 = v65;
                uint64_t v30 = v60;
                v25 = v62;
              }
              ++v31;
            }
            while (v31 != v29);
            uint64_t v29 = [v24 countByEnumeratingWithState:&v80 objects:v95 count:16];
          }
          while (v29);
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v42 = (void *)[v26 allValues];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v72 objects:v93 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v73;
          do
          {
            for (uint64_t n = 0; n != v44; ++n)
            {
              if (*(void *)v73 != v45) {
                objc_enumerationMutation(v42);
              }
              v47 = *(void **)(*((void *)&v72 + 1) + 8 * n);
              if ((objc_msgSend(v27, "containsObject:", objc_msgSend(v47, "name")) & 1) == 0)
              {
                -[NSEntityDescription _removeSubentity:]([v47 superentity], v47);
                objc_msgSend(v26, "removeObjectForKey:", objc_msgSend(v47, "name"));
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v72 objects:v93 count:16];
          }
          while (v44);
        }
        id v22 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", [v26 allValues]);
        objc_msgSend(v22, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](v58, "versionIdentifiers"));
        v48 = [(NSManagedObjectModel *)v58 fetchRequestTemplatesByName];
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v49 = [(NSDictionary *)v48 countByEnumeratingWithState:&v68 objects:v92 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v69;
          do
          {
            for (iuint64_t i = 0; ii != v50; ++ii)
            {
              if (*(void *)v69 != v51) {
                objc_enumerationMutation(v48);
              }
              uint64_t v53 = *(void *)(*((void *)&v68 + 1) + 8 * ii);
              id v54 = [(NSDictionary *)v48 objectForKey:v53];
              if (objc_msgSend(v26, "objectForKey:", objc_msgSend((id)objc_msgSend(v54, "entity"), "name"))) {
                [v22 setFetchRequestTemplate:v54 forName:v53];
              }
            }
            uint64_t v50 = [(NSDictionary *)v48 countByEnumeratingWithState:&v68 objects:v92 count:16];
          }
          while (v50);
        }

        id v6 = v55;
        v23 = v58;
        goto LABEL_75;
      }
      id v6 = v55;
    }
    else
    {
      v23 = 0;
      v24 = 0;
      id v22 = 0;
    }
LABEL_76:

    [v6 drain];
    return v22;
  }

  return -[NSManagedObjectModelBundle _modelForVersionHashes:](self, "_modelForVersionHashes:");
}

- (id)_modelForVersionHashes:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v59 = (void *)[a3 allKeys];
  if (self) {
    id v6 = [(NSDictionary *)self->_versionInfoDictionary objectForKey:@"NSManagedObjectModel_VersionHashes"];
  }
  else {
    id v6 = 0;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v55 = [v6 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v55)
  {
    uint64_t v49 = self;
    id v50 = v5;
    id v61 = 0;
    id v51 = 0;
    id v52 = v6;
    uint64_t v53 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v83 != v53) {
          objc_enumerationMutation(v6);
        }
        v57 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        objc_super v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:"), "dictionaryWithValuesForKeys:", v59);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v78 objects:v90 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0;
          uint64_t v12 = *(void *)v79;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v79 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v78 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v8, "objectForKey:", v14), "isEqual:", objc_msgSend(a3, "objectForKey:", v14)))
              {
                if (!v11) {
                  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA48] array];
                }
                [v11 addObject:v14];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v78 objects:v90 count:16];
          }
          while (v10);
        }
        else
        {
          uint64_t v11 = 0;
        }
        if ([v11 count] && (unint64_t v15 = objc_msgSend(v11, "count"), v15 > objc_msgSend(v61, "count")))
        {

          id v51 = v57;
          id v61 = v11;
          uint64_t v16 = [v59 count];
          id v6 = v52;
          if (v16 == [v11 count]) {
            goto LABEL_28;
          }
        }
        else
        {
          id v6 = v52;
        }
      }
      uint64_t v55 = [v6 countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v55);
LABEL_28:
    id v17 = 0;
    v18 = v51;
    if (v51)
    {
      uint64_t v19 = v61;
      if (v61)
      {
        id v54 = [[NSManagedObjectModel alloc] initWithContentsOfURL:[(NSManagedObjectModelBundle *)v49 urlForModelVersionWithName:v51]];
        v20 = [(NSManagedObjectModel *)v54 entitiesByName];
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v61, "count"));
        id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v61, "count"));
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        uint64_t v23 = [v61 countByEnumeratingWithState:&v74 objects:v89 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v75;
          uint64_t v56 = *(void *)v75;
          v58 = v20;
          do
          {
            uint64_t v26 = 0;
            uint64_t v60 = v24;
            do
            {
              if (*(void *)v75 != v25) {
                objc_enumerationMutation(v19);
              }
              for (id k = -[NSDictionary objectForKey:](v20, "objectForKey:", *(void *)(*((void *)&v74 + 1) + 8 * v26)); ; id k = (id)[v28 superentity])
              {
                uint64_t v28 = k;
                objc_msgSend(v22, "addObject:", objc_msgSend(k, "name"));
                if (![v28 superentity]) {
                  break;
                }
              }
              if (!objc_msgSend(v21, "valueForKey:", objc_msgSend(v28, "name")))
              {
                uint64_t v29 = (void *)[v28 copy];
                id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                +[NSManagedObjectModel _deepCollectEntitiesInArray:entity:]((uint64_t)NSManagedObjectModel, v30, v29);
                long long v72 = 0u;
                long long v73 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v71;
                  do
                  {
                    for (uint64_t m = 0; m != v32; ++m)
                    {
                      if (*(void *)v71 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      objc_msgSend(v21, "setObject:forKey:", *(void *)(*((void *)&v70 + 1) + 8 * m), objc_msgSend(*(id *)(*((void *)&v70 + 1) + 8 * m), "name"));
                    }
                    uint64_t v32 = [v30 countByEnumeratingWithState:&v70 objects:v88 count:16];
                  }
                  while (v32);
                }

                uint64_t v24 = v60;
                uint64_t v19 = v61;
                uint64_t v25 = v56;
                v20 = v58;
              }
              ++v26;
            }
            while (v26 != v24);
            uint64_t v24 = [v19 countByEnumeratingWithState:&v74 objects:v89 count:16];
          }
          while (v24);
        }
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        v35 = (void *)[v21 allValues];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v87 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v67;
          do
          {
            for (uint64_t n = 0; n != v37; ++n)
            {
              if (*(void *)v67 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void **)(*((void *)&v66 + 1) + 8 * n);
              if ((objc_msgSend(v22, "containsObject:", objc_msgSend(v40, "name")) & 1) == 0)
              {
                -[NSEntityDescription _removeSubentity:]([v40 superentity], v40);
                objc_msgSend(v21, "removeObjectForKey:", objc_msgSend(v40, "name"));
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v87 count:16];
          }
          while (v37);
        }
        id v17 = -[NSManagedObjectModel _initWithEntities:]([NSManagedObjectModel alloc], "_initWithEntities:", [v21 allValues]);
        objc_msgSend(v17, "setVersionIdentifiers:", -[NSManagedObjectModel versionIdentifiers](v54, "versionIdentifiers"));
        v41 = [(NSManagedObjectModel *)v54 fetchRequestTemplatesByName];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        uint64_t v42 = [(NSDictionary *)v41 countByEnumeratingWithState:&v62 objects:v86 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v63;
          do
          {
            for (iuint64_t i = 0; ii != v43; ++ii)
            {
              if (*(void *)v63 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v62 + 1) + 8 * ii);
              id v47 = [(NSDictionary *)v41 objectForKey:v46];
              if (objc_msgSend(v21, "objectForKey:", objc_msgSend((id)objc_msgSend(v47, "entity"), "name"))) {
                [v17 setFetchRequestTemplate:v47 forName:v46];
              }
            }
            uint64_t v43 = [(NSDictionary *)v41 countByEnumeratingWithState:&v62 objects:v86 count:16];
          }
          while (v43);
        }

        id v5 = v50;
        v18 = v51;
      }
      else
      {
        id v5 = v50;
      }
    }
    else
    {
      id v5 = v50;
      uint64_t v19 = v61;
    }
  }
  else
  {
    v18 = 0;
    uint64_t v19 = 0;
    id v17 = 0;
  }

  [v5 drain];
  return v17;
}

@end