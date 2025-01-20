@interface PFUbiquityStoreMetadata
+ (uint64_t)metadataForStoreWithName:(void *)a3 inManagedObjectContext:;
+ (uint64_t)storeMetadatasWithName:(void *)a3 inManagedObjectContext:;
- (PFUbiquityPeerState)peerStateForPeerID:(void *)a1;
- (PFUbiquityStoreMetadata)initWithUbiquityName:(id)a3 andUbiquityRootLocation:(id)a4 insertIntoManagedObjectContext:(id)a5;
- (void)loadFromBaselineMetadata:(uint64_t)a3 withLocalPeerID:;
- (void)updatePeerStatesToMatchKnowledgeVector:(void *)result;
- (void)updateWithStore:(uint64_t)a3 andRootLocation:;
@end

@implementation PFUbiquityStoreMetadata

- (PFUbiquityStoreMetadata)initWithUbiquityName:(id)a3 andUbiquityRootLocation:(id)a4 insertIntoManagedObjectContext:(id)a5
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "valueForKey:", @"PFUbiquityStoreMetadata");
  if (v9)
  {
    v10 = [(NSManagedObject *)self initWithEntity:v9 insertIntoManagedObjectContext:a5];
    v11 = v10;
    if (v10)
    {
      [(PFUbiquityStoreMetadata *)v10 setUbiquityName:a3];
      self = (PFUbiquityStoreMetadata *)-[PFUbiquityLocation createFullURL]((uint64_t)a4);
      [(PFUbiquityStoreMetadata *)v11 setUbiquityRootURLString:[(PFUbiquityStoreMetadata *)self absoluteString]];
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)storeMetadatasWithName:(void *)a3 inManagedObjectContext:
{
  self;
  v5 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityStoreMetadata"];
  if (![a2 length] || !objc_msgSend(a3, "persistentStoreCoordinator")) {
    return 0;
  }
  -[NSFetchRequest setPredicate:](v5, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"ubiquityName == %@", a2]);
  uint64_t v8 = 0;
  uint64_t v6 = [a3 executeFetchRequest:v5 error:&v8];
  if (v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error locating metadata for local persistent store: %@, stores: %@", "+[PFUbiquityStoreMetadata(UbiquityMethods) storeMetadatasWithName:inManagedObjectContext:]", 94, v8, v6);
    }
    return 0;
  }
  return v6;
}

+ (uint64_t)metadataForStoreWithName:(void *)a3 inManagedObjectContext:
{
  self;
  if (![a3 persistentStoreCoordinator]) {
    return 0;
  }
  v5 = (void *)+[PFUbiquityStoreMetadata storeMetadatasWithName:inManagedObjectContext:]((uint64_t)PFUbiquityStoreMetadata, a2, a3);
  if (![v5 count]) {
    return 0;
  }

  return [v5 objectAtIndex:0];
}

- (void)updateWithStore:(uint64_t)a3 andRootLocation:
{
  if (!a1) {
    return;
  }
  objc_msgSend(a1, "setStoreURLString:", objc_msgSend((id)objc_msgSend(a2, "URL"), "absoluteString"));
  objc_msgSend(a1, "setStoreIdentifier:", objc_msgSend(a2, "identifier"));
  objc_msgSend(a1, "setStoreType:", objc_msgSend(a2, "type"));
  uint64_t v6 = [a2 options];
  if (!v6) {
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29248], "valueTransformerForName:", *MEMORY[0x1E4F284F0]), "reverseTransformedValue:", v6);
  if (!v8)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:1]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error setting store options on store metadata: %@, options: %@\nNSKeyedUnarchiveFromData transformer returned nil", "-[PFUbiquityStoreMetadata(UbiquityMethods) setStoreOptions:]", 334, a1, v7);
    }
LABEL_6:
    uint64_t v8 = 0;
  }
  [a1 setStoreOptionsBinaryPlistData:v8];
  uint64_t v9 = -[PFUbiquityLocation createFullPath](a3);
  v10 = (void *)[a1 ubiquityRootURLString];
  if (v10) {
    v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", objc_msgSend(a1, "ubiquityRootURLString"));
  }
  uint64_t v11 = [v10 path];
  if (v9)
  {
    uint64_t v12 = v11;
    if (([v9 isEqualToString:v11] & 1) == 0)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:2]) {
        NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Looks like the container URL moved for store metadata: %@\nNew Container URL: %@\nOld: %@", "-[PFUbiquityStoreMetadata(UbiquityMethods) updateWithStore:andRootLocation:]", 122, a1, a3, v12);
      }
      [a1 setUbiquityRootURLString:v9];
    }
  }

  v13 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
  if (v13)
  {
    id v14 = (id)+[PFUbiquityLocation createVersionHashStringForModel:]((uint64_t)PFUbiquityLocation, v13);
    [a1 setModelVersionHashString:v14];
  }
}

- (void)loadFromBaselineMetadata:(uint64_t)a3 withLocalPeerID:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    if (a2 && (uint64_t v4 = *(void *)(a2 + 48)) != 0) {
      v5 = (void *)[*(id *)(v4 + 8) allKeys];
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v45;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
          uint64_t v11 = -[PFUbiquityStoreMetadata peerStateForPeerID:](a1, v10);
          if (a2 && (uint64_t v12 = *(void *)(a2 + 48)) != 0) {
            uint64_t v13 = [*(id *)(v12 + 8) objectForKey:v10];
          }
          else {
            uint64_t v13 = 0;
          }
          [(PFUbiquityPeerState *)v11 setTransactionNumber:v13];
          if ((objc_msgSend((id)objc_msgSend(a1, "peerStates"), "containsObject:", v11) & 1) == 0) {
            [a1 addPeerStatesObject:v11];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v14 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
        uint64_t v7 = v14;
      }
      while (v14);
    }
    v15 = +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", @"PFUbiquityPeerRange", [a1 managedObjectContext]);
    if (v15)
    {
      v16 = v15;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      if (a2) {
        v17 = *(void **)(a2 + 56);
      }
      else {
        v17 = 0;
      }
      id obj = (id)[v17 allKeys];
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v34)
      {
        uint64_t v32 = *(void *)v41;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v41 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = v18;
            v19 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
            if (([v19 isEqualToString:a3] & 1) == 0)
            {
              v20 = a2 ? *(void **)(a2 + 56) : 0;
              v21 = (void *)[v20 valueForKey:v19];
              uint64_t v22 = +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, v19, (void *)[a1 managedObjectContext], 1);
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v37;
                do
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if (*(void *)v37 != v25) {
                      objc_enumerationMutation(v21);
                    }
                    v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                    v28 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeerRange alloc], "initWithEntity:insertIntoManagedObjectContext:", v16, [a1 managedObjectContext]);
                    [(PFUbiquityPeerRange *)v28 setPeer:v22];
                    [(PFUbiquityPeerRange *)v28 setStoreMetadata:a1];
                    -[PFUbiquityPeerRange loadFromBaselineDictionary:](v28, v27);
                  }
                  uint64_t v24 = [v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
                }
                while (v24);
              }
            }
            uint64_t v18 = v35 + 1;
          }
          while (v35 + 1 != v34);
          uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
          uint64_t v34 = v29;
        }
        while (v29);
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:0])
    {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  loadFromBaselineMetadata: lost its stack and failed.", "-[PFUbiquityStoreMetadata(UbiquityMethods) loadFromBaselineMetadata:withLocalPeerID:]", 160);
    }
  }
}

- (PFUbiquityPeerState)peerStateForPeerID:(void *)a1
{
  if (!a1
    || ![a2 length]
    || !objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "persistentStoreCoordinator"))
  {
    return 0;
  }
  uint64_t v4 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityPeerState"];
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"peer.peerKey == %@ AND storeName == %@", a2, objc_msgSend(a1, "ubiquityName")]);
  uint64_t v10 = 0;
  v5 = objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "executeFetchRequest:error:", v4, &v10);
  if (v10)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error fetching peer state for peerID: %@, error: %@", "-[PFUbiquityStoreMetadata(UbiquityMethods) peerStateForPeerID:]", 201, a2, v10);
    }
LABEL_13:
    uint64_t v6 = -[NSManagedObject initWithEntity:insertIntoManagedObjectContext:]([PFUbiquityPeerState alloc], "initWithEntity:insertIntoManagedObjectContext:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "managedObjectContext"), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", @"PFUbiquityPeerState"), objc_msgSend(a1, "managedObjectContext"));
    uint64_t v8 = v6;
    -[PFUbiquityPeerState setPeer:](v6, "setPeer:", +[PFUbiquityPeer peerForPeerID:inManagedObjectContext:createIfMissing:]((uint64_t)PFUbiquityPeer, a2, (void *)[a1 managedObjectContext], 1));
    [(PFUbiquityPeerState *)v6 setStoreMetadata:a1];
    -[PFUbiquityPeerState setStoreName:](v6, "setStoreName:", [a1 ubiquityName]);
    return v6;
  }
  uint64_t v7 = v5;
  if (![v5 count]) {
    goto LABEL_13;
  }
  if ((unint64_t)[v7 count] >= 2
    && +[PFUbiquityLogging canLogMessageAtLevel:0])
  {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Error fetching peer state for peerID: %@, too many peer states found: %@", "-[PFUbiquityStoreMetadata(UbiquityMethods) peerStateForPeerID:]", 204, a2, v7);
  }
  uint64_t v6 = (PFUbiquityPeerState *)[v7 objectAtIndex:0];
  if (!v6) {
    goto LABEL_13;
  }
  return v6;
}

- (void)updatePeerStatesToMatchKnowledgeVector:(void *)result
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = result;
    uint64_t v4 = (void *)[result peerStates];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v9 setStoreName:0];
          objc_msgSend((id)objc_msgSend(v3, "managedObjectContext"), "deleteObject:", v9);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v6);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    if (a2) {
      uint64_t v10 = objc_msgSend(*(id *)(a2 + 8), "allKeys", (void)v16);
    }
    else {
      uint64_t v10 = 0;
    }
    result = (void *)[v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (result)
    {
      uint64_t v11 = result;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          if (a2)
          {
            uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
            uint64_t v15 = [*(id *)(a2 + 8) objectForKey:v14];
            if (v15) {
              -[PFUbiquityPeerState setTransactionNumber:](-[PFUbiquityStoreMetadata peerStateForPeerID:](v3, v14), "setTransactionNumber:", v15);
            }
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        result = (void *)[v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        uint64_t v11 = result;
      }
      while (result);
    }
  }
  return result;
}

@end