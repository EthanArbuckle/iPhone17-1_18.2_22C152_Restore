@interface PFUbiquityGlobalObjectIDCache
+ (id)stringValueFromArray:(id)a3 atIndexDescribedByStringNumber:(id)a4;
- (PFUbiquityGlobalObjectID)createGlobalIDForCompressedString:(uint64_t)a3 withEntityNames:(uint64_t)a4 primaryKeys:(uint64_t)a5 peerIDs:;
- (PFUbiquityGlobalObjectID)createGlobalIDForGlobalIDString:(uint64_t)a1;
- (PFUbiquityGlobalObjectID)createGlobalIDForPrimaryKeyString:(uint64_t)a3 entityName:(uint64_t)a4 andOwningPeerID:;
- (PFUbiquityGlobalObjectIDCache)init;
- (PFUbiquityGlobalObjectIDCache)initWithLocalPeerID:(id)a3 forStoreName:(id)a4;
- (uint64_t)purgeCache;
- (void)dealloc;
@end

@implementation PFUbiquityGlobalObjectIDCache

- (PFUbiquityGlobalObjectIDCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityGlobalObjectIDCache;
  v2 = [(PFUbiquityGlobalObjectIDCache *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_storeName = 0;
    v2->_localPeerID = 0;
    v2->_peerIDToEntityNameToPrimaryKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_peerIDToEntityNameToPrimaryKeyLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
  }
  return v3;
}

- (PFUbiquityGlobalObjectIDCache)initWithLocalPeerID:(id)a3 forStoreName:(id)a4
{
  v6 = [(PFUbiquityGlobalObjectIDCache *)self init];
  if (v6)
  {
    v6->_storeName = (NSString *)a4;
    v6->_localPeerID = (NSString *)a3;
  }
  return v6;
}

- (void)dealloc
{
  self->_storeName = 0;
  self->_localPeerID = 0;

  self->_peerIDToEntityNameToPrimaryKey = 0;
  self->_peerIDToEntityNameToPrimaryKeyLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityGlobalObjectIDCache;
  [(PFUbiquityGlobalObjectIDCache *)&v3 dealloc];
}

- (PFUbiquityGlobalObjectID)createGlobalIDForCompressedString:(uint64_t)a3 withEntityNames:(uint64_t)a4 primaryKeys:(uint64_t)a5 peerIDs:
{
  objc_super v5 = a1;
  if (a1)
  {
    v9 = (void *)[a2 componentsSeparatedByString:PFUbiquityGlobalObjectIDSeparator];
    if ([v9 count] == 3)
    {
      id v10 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a3, [v9 objectAtIndex:0]);
      id v11 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a4, [v9 objectAtIndex:1]);
      id v12 = +[PFUbiquityGlobalObjectIDCache stringValueFromArray:atIndexDescribedByStringNumber:](PFUbiquityGlobalObjectIDCache, "stringValueFromArray:atIndexDescribedByStringNumber:", a5, [v9 objectAtIndex:2]);
      v13 = v12;
      if (v10) {
        BOOL v14 = v11 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14 && v12 != 0)
      {
        objc_super v5 = -[PFUbiquityGlobalObjectIDCache createGlobalIDForPrimaryKeyString:entityName:andOwningPeerID:]((uint64_t)v5, (uint64_t)v11, (uint64_t)v10, (uint64_t)v12);
LABEL_13:

        return v5;
      }
    }
    else
    {
      v13 = 0;
      id v11 = 0;
      id v10 = 0;
    }
    objc_super v5 = 0;
    goto LABEL_13;
  }
  return v5;
}

- (PFUbiquityGlobalObjectID)createGlobalIDForPrimaryKeyString:(uint64_t)a3 entityName:(uint64_t)a4 andOwningPeerID:
{
  [*(id *)(a1 + 32) lock];
  id v8 = (id)[*(id *)(a1 + 24) objectForKey:a4];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 24) setObject:v8 forKey:a4];
  }
  id v9 = (id)[v8 objectForKey:a3];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:v9 forKey:a3];
  }
  id v10 = (PFUbiquityGlobalObjectID *)(id)[v9 objectForKey:a2];
  if (!v10)
  {
    id v10 = [[PFUbiquityGlobalObjectID alloc] initWithStoreName:*(void *)(a1 + 8) entityName:a3 primaryKey:a2 andPeerID:a4];
    [v9 setObject:v10 forKey:a2];
  }
  [*(id *)(a1 + 32) unlock];
  return v10;
}

- (PFUbiquityGlobalObjectID)createGlobalIDForGlobalIDString:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  objc_super v3 = (void *)[a2 componentsSeparatedByString:@":"];
  if ([v3 count] != 4) {
    return 0;
  }
  uint64_t v4 = [v3 objectAtIndex:2];
  uint64_t v5 = [v3 objectAtIndex:1];
  uint64_t v6 = [v3 objectAtIndex:3];

  return -[PFUbiquityGlobalObjectIDCache createGlobalIDForPrimaryKeyString:entityName:andOwningPeerID:](a1, v4, v5, v6);
}

- (uint64_t)purgeCache
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) lock];

    *(void *)(v1 + 24) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    return [*(id *)(v1 + 32) unlock];
  }
  return result;
}

+ (id)stringValueFromArray:(id)a3 atIndexDescribedByStringNumber:(id)a4
{
  unint64_t v5 = [a4 integerValue];
  if ((v5 & 0x8000000000000000) != 0) {
    return 0;
  }
  unint64_t v6 = v5;
  if (v5 >= [a3 count]) {
    return 0;
  }

  return (id)[a3 objectAtIndex:v6];
}

@end