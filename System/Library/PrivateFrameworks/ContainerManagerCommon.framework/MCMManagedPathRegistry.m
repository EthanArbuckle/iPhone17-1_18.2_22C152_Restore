@interface MCMManagedPathRegistry
- (BOOL)privileged;
- (MCMManagedPath)caches;
- (MCMManagedPath)containermanagerCaches;
- (MCMManagedPath)containermanagerCachesIntermediate;
- (MCMManagedPath)containermanagerDeathrow;
- (MCMManagedPath)containermanagerDeleteOperations;
- (MCMManagedPath)containermanagerLibrary;
- (MCMManagedPath)containermanagerLibraryIntermediate;
- (MCMManagedPath)containermanagerPendingUpdates;
- (MCMManagedPath)containermanagerReplaceOperations;
- (MCMManagedPath)home;
- (MCMManagedPath)library;
- (MCMManagedPathRegistry)initWithDaemonUser:(id)a3 privileged:(BOOL)a4;
- (MCMPOSIXUser)daemonUser;
- (NSSet)paths;
- (id)managedPathForURL:(id)a3;
- (id)orderedPathsFromPaths:(id)a3;
- (void)_addPaths:(id)a3;
- (void)_initPathPropertiesWithDaemonUser:(id)a3;
@end

@implementation MCMManagedPathRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containermanagerDeathrow, 0);
  objc_storeStrong((id *)&self->_containermanagerCachesIntermediate, 0);
  objc_storeStrong((id *)&self->_containermanagerCaches, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_containermanagerDeleteOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerReplaceOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerPendingUpdates, 0);
  objc_storeStrong((id *)&self->_containermanagerLibraryIntermediate, 0);
  objc_storeStrong((id *)&self->_containermanagerLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_daemonUser, 0);

  objc_storeStrong((id *)&self->_paths, 0);
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (MCMManagedPath)containermanagerDeathrow
{
  return self->_containermanagerDeathrow;
}

- (MCMManagedPath)containermanagerCachesIntermediate
{
  return self->_containermanagerCachesIntermediate;
}

- (MCMManagedPath)containermanagerCaches
{
  return self->_containermanagerCaches;
}

- (MCMManagedPath)caches
{
  return self->_caches;
}

- (MCMManagedPath)containermanagerDeleteOperations
{
  return self->_containermanagerDeleteOperations;
}

- (MCMManagedPath)containermanagerReplaceOperations
{
  return self->_containermanagerReplaceOperations;
}

- (MCMManagedPath)containermanagerPendingUpdates
{
  return self->_containermanagerPendingUpdates;
}

- (MCMManagedPath)containermanagerLibraryIntermediate
{
  return self->_containermanagerLibraryIntermediate;
}

- (MCMManagedPath)containermanagerLibrary
{
  return self->_containermanagerLibrary;
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (MCMManagedPath)home
{
  return self->_home;
}

- (MCMPOSIXUser)daemonUser
{
  return self->_daemonUser;
}

- (NSSet)paths
{
  return self->_paths;
}

- (void)_initPathPropertiesWithDaemonUser:(id)a3
{
  id v27 = a3;
  v4 = [v27 homeDirectoryURL];
  v5 = [[MCMManagedPath alloc] initWithURL:v4 flags:0 ACLConfig:0 mode:493 dpClass:0xFFFFFFFFLL owner:v27 parent:0];
  home = self->_home;
  self->_home = v5;

  v7 = [(MCMManagedPath *)self->_home managedPathByAppendingPathComponent:@"Library" flags:2 ACLConfig:2 mode:493 dpClass:0xFFFFFFFFLL owner:v27];
  library = self->_library;
  self->_library = v7;

  v9 = [(MCMManagedPath *)self->_library managedPathByAppendingPathComponent:@"MobileContainerManager" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerLibrary = self->_containermanagerLibrary;
  self->_containermanagerLibrary = v9;

  objc_storeStrong((id *)&self->_containermanagerLibraryIntermediate, self->_containermanagerLibrary);
  if ([(MCMManagedPathRegistry *)self privileged])
  {
    v11 = [(MCMManagedPath *)self->_containermanagerLibraryIntermediate managedPathByAppendingPathComponent:@"System" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
    v12 = self->_containermanagerLibrary;
    self->_containermanagerLibrary = v11;
  }
  v13 = [(MCMManagedPath *)self->_containermanagerLibrary managedPathByAppendingPathComponent:@"PendingUpdates" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerPendingUpdates = self->_containermanagerPendingUpdates;
  self->_containermanagerPendingUpdates = v13;

  v15 = [(MCMManagedPath *)self->_containermanagerLibrary managedPathByAppendingPathComponent:@"Replace" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerReplaceOperations = self->_containermanagerReplaceOperations;
  self->_containermanagerReplaceOperations = v15;

  v17 = [(MCMManagedPath *)self->_containermanagerLibraryIntermediate managedPathByAppendingPathComponent:@"Delete" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerDeleteOperations = self->_containermanagerDeleteOperations;
  self->_containermanagerDeleteOperations = v17;

  v19 = [(MCMManagedPath *)self->_library managedPathByAppendingPathComponent:@"Caches" flags:2 ACLConfig:2 mode:493 dpClass:0xFFFFFFFFLL owner:v27];
  caches = self->_caches;
  self->_caches = v19;

  v21 = [(MCMManagedPath *)self->_caches managedPathByAppendingPathComponent:@"com.apple.containermanagerd" flags:3 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerCaches = self->_containermanagerCaches;
  self->_containermanagerCaches = v21;

  if ([(MCMManagedPathRegistry *)self privileged])
  {
    objc_storeStrong((id *)&self->_containermanagerCachesIntermediate, self->_containermanagerCaches);
    v23 = [(MCMManagedPath *)self->_containermanagerCaches managedPathByAppendingPathComponent:@"System" flags:3 ACLConfig:1 mode:493 dpClass:4 owner:v27];
    v24 = self->_containermanagerCaches;
    self->_containermanagerCaches = v23;
  }
  v25 = [(MCMManagedPath *)self->_containermanagerCaches managedPathByAppendingPathComponent:@"Dead" flags:7 ACLConfig:1 mode:493 dpClass:4 owner:v27];
  containermanagerDeathrow = self->_containermanagerDeathrow;
  self->_containermanagerDeathrow = v25;
}

- (void)_addPaths:(id)a3
{
  self->_paths = [(NSSet *)self->_paths setByAddingObjectsFromArray:a3];

  MEMORY[0x1F41817F8]();
}

- (id)managedPathForURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MCMManagedPathRegistry *)self paths];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 url];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)orderedPathsFromPaths:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        int v11 = [MEMORY[0x1E4F1CA48] array];
        [v11 addObject:v10];
        v12 = [v10 parent];

        if (v12)
        {
          do
          {
            v13 = [v10 parent];
            [v11 addObject:v13];

            long long v14 = [v10 parent];

            long long v15 = [v14 parent];

            id v10 = v14;
          }
          while (v15);
        }
        else
        {
          long long v14 = v10;
        }
        uint64_t v16 = [v11 count];
        if (v16)
        {
          uint64_t v17 = v16 - 1;
          do
          {
            uint64_t v18 = v14;
            long long v14 = [v11 objectAtIndexedSubscript:v17];

            if (([v4 containsObject:v14] & 1) == 0) {
              [v4 addObject:v14];
            }
            --v17;
          }
          while (v17 != -1);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v7);
  }

  v19 = (void *)[v4 copy];

  return v19;
}

- (MCMManagedPathRegistry)initWithDaemonUser:(id)a3 privileged:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMManagedPathRegistry;
  uint64_t v8 = [(MCMManagedPathRegistry *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_daemonUser, a3);
    v9->_privileged = a4;
    [(MCMManagedPathRegistry *)v9 _initPathPropertiesWithDaemonUser:v7];
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", v9->_home, v9->_library, v9->_containermanagerLibrary, v9->_containermanagerPendingUpdates, v9->_containermanagerReplaceOperations, v9->_containermanagerDeleteOperations, v9->_caches, v9->_containermanagerCaches, v9->_containermanagerDeathrow, 0);
    int v11 = v10;
    if (v9->_containermanagerLibraryIntermediate) {
      objc_msgSend(v10, "addObject:");
    }
    if (v9->_containermanagerCachesIntermediate) {
      objc_msgSend(v11, "addObject:");
    }
    uint64_t v12 = [v11 copy];
    paths = v9->_paths;
    v9->_paths = (NSSet *)v12;
  }
  return v9;
}

@end