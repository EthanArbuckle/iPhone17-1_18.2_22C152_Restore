@interface PFUbiquityTransactionEntry
+ (uint64_t)deleteTransactionEntriesAfterPeerState:(uint64_t)a3 forStoreName:(void *)a4 inManagedObjectContext:;
+ (uint64_t)transactionEntriesForPeerID:(uint64_t)a3 beforeTransacationNumber:(void *)a4 forStoreNamed:(void *)a5 inManagedObjectContext:;
+ (void)createTransactionEntriesForCompressedObjectIDs:(uint64_t)a3 withTransactionType:(uint64_t)a4 withImportContext:;
- (id)initAndInsertIntoManagedObjectContext:(id)a3;
- (void)setTransactionType:(void *)a1;
@end

@implementation PFUbiquityTransactionEntry

- (id)initAndInsertIntoManagedObjectContext:(id)a3
{
  if ([a3 persistentStoreCoordinator])
  {
    v6.receiver = self;
    v6.super_class = (Class)PFUbiquityTransactionEntry;
    id result = [(NSManagedObject *)&v6 initWithEntity:+[NSEntityDescription entityForName:@"PFUbiquityTransactionEntry" inManagedObjectContext:a3] insertIntoManagedObjectContext:a3];
    if (result) {
      return result;
    }
  }
  else
  {
  }
  return 0;
}

- (void)setTransactionType:(void *)a1
{
  if (a1)
  {
    id v3 = (id)[objc_alloc(NSNumber) initWithInt:a2];
    [a1 setTransactionTypeNum:v3];
  }
}

+ (void)createTransactionEntriesForCompressedObjectIDs:(uint64_t)a3 withTransactionType:(uint64_t)a4 withImportContext:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  self;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = a2;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v33 + 1) + 8 * v11);
        self;
        v13 = [PFUbiquityTransactionEntry alloc];
        if (a4) {
          v14 = *(void **)(a4 + 16);
        }
        else {
          v14 = 0;
        }
        id v15 = -[PFUbiquityTransactionEntry initAndInsertIntoManagedObjectContext:](v13, "initAndInsertIntoManagedObjectContext:", [v14 managedObjectContext]);
        -[PFUbiquityTransactionEntry setTransactionType:](v15, a3);
        if (a4)
        {
          uint64_t v16 = *(void *)(a4 + 64);
          if (v16) {
            uint64_t v17 = *(void *)(v16 + 120);
          }
          else {
            uint64_t v17 = 0;
          }
          [v15 setTransactionNumber:v17];
          uint64_t v18 = *(void *)(a4 + 56);
          if (v18 && (uint64_t v19 = *(void *)(v18 + 72)) != 0) {
            uint64_t v20 = *(void *)(v19 + 8);
          }
          else {
            uint64_t v20 = 0;
          }
          [v15 setTransactionDate:v20];
          uint64_t v21 = *(void *)(a4 + 56);
          if (v21 && (uint64_t v22 = *(void *)(v21 + 24)) != 0) {
            uint64_t v23 = *(void *)(v22 + 56);
          }
          else {
            uint64_t v23 = 0;
          }
          [v15 setTransactionLogFilename:v23];
          [v15 setActingPeer:*(void *)(a4 + 24)];
          [v15 setStoreMetadata:*(void *)(a4 + 16)];
          uint64_t v24 = *(void *)(a4 + 64);
        }
        else
        {
          [v15 setTransactionNumber:0];
          [v15 setTransactionDate:0];
          [v15 setTransactionLogFilename:0];
          [v15 setActingPeer:0];
          [v15 setStoreMetadata:0];
          uint64_t v24 = 0;
        }
        v25 = (void *)-[PFUbiquityStoreSaveSnapshot globalObjectIDFromCompressedObjectID:](v24, v12);
        id v26 = -[PFUbiquityGlobalObjectID createGlobalIDString](v25);
        [v15 setGlobalIDStr:v26];

        if (a4)
        {
          objc_msgSend(v15, "setLocalIDStr:", objc_msgSend(*(id *)(a4 + 72), "objectForKey:", v25));
          uint64_t v27 = *(void *)(a4 + 56);
          if (v27)
          {
            uint64_t v28 = *(void *)(v27 + 64);
            goto LABEL_21;
          }
        }
        else
        {
          objc_msgSend(v15, "setLocalIDStr:", objc_msgSend(0, "objectForKey:", v25));
        }
        uint64_t v28 = 0;
LABEL_21:
        id v29 = -[PFUbiquityKnowledgeVector createKnowledgeVectorString](v28);
        [v15 setKnowledgeVectorString:v29];

        [v7 addObject:v15];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v30 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      uint64_t v9 = v30;
    }
    while (v30);
  }
  return v7;
}

+ (uint64_t)deleteTransactionEntriesAfterPeerState:(uint64_t)a3 forStoreName:(void *)a4 inManagedObjectContext:
{
  self;
  id v23 = 0;
  v7 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityTransactionEntry"];
  if (!a3) {
    return 0;
  }
  uint64_t v8 = v7;
  if (![a4 persistentStoreCoordinator]) {
    return 0;
  }
  uint64_t v21 = a4;
  uint64_t v22 = v8;
  uint64_t v9 = (void *)[a2 allKeys];
  uint64_t v10 = [v9 count];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v10)
  {
    uint64_t v13 = 0;
    char v14 = 0;
    while (1)
    {
      uint64_t v15 = [v9 objectAtIndex:v13];
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", v15), "objectForKey:", @"YTRANSACTIONNUMBER");
      if (!v15) {
        break;
      }
      uint64_t v17 = v16;
      if (!v16) {
        break;
      }
      if (v14) {
        [v11 appendString:@" OR "];
      }
      [v11 appendString:@"(actingPeer.peerKey == %@ AND transactionNumber > %@ AND storeMetadata.ubiquityName == %@)"];
      [v12 addObject:v15];
      [v12 addObject:v17];
      [v12 addObject:a3];
      ++v13;
      char v14 = 1;
      if (v10 == v13) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if ([v12 count]) {
      -[NSFetchRequest setPredicate:](v22, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:v11 argumentArray:v12]);
    }
    uint64_t v18 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v22];
    uint64_t v19 = [v21 executeRequest:v18 error:&v23];

    if (v19) {
      goto LABEL_16;
    }
  }
  if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
    NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Conflict metadata fetch failed with error: %@\nuserInfo: %@\n Conflict resolution will not work. Original Fetch Request: %@", "+[PFUbiquityTransactionEntry(UbiquityMethods) deleteTransactionEntriesAfterPeerState:forStoreName:inManagedObjectContext:]", 320, v23, [v23 userInfo], v22);
  }
  uint64_t v19 = 0;
LABEL_16:

  return v19;
}

+ (uint64_t)transactionEntriesForPeerID:(uint64_t)a3 beforeTransacationNumber:(void *)a4 forStoreNamed:(void *)a5 inManagedObjectContext:
{
  self;
  id v13 = 0;
  uint64_t v9 = [a2 length];
  uint64_t result = 0;
  if (a3)
  {
    if (v9)
    {
      uint64_t result = [a4 length];
      if (result)
      {
        uint64_t result = [a5 persistentStoreCoordinator];
        if (result)
        {
          id v11 = +[NSFetchRequest fetchRequestWithEntityName:@"PFUbiquityTransactionEntry"];
          -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"(actingPeer.peerKey == %@ AND transactionNumber < %@ AND storeMetadata.ubiquityName == %@)", a2, a3, a4]);
          id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"transactionDate" ascending:1];
          -[NSFetchRequest setSortDescriptors:](v11, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v12, 0));

          uint64_t result = [a5 executeFetchRequest:v11 error:&v13];
          if (!result)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:0])
            {
              NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Got nil transaction entries for fetch request: %@\nError: %@\nuserInfo: %@\n", "+[PFUbiquityTransactionEntry(UbiquityMethods) transactionEntriesForPeerID:beforeTransacationNumber:forStoreNamed:inManagedObjectContext:]", 385, v11, v13, [v13 userInfo]);
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

@end