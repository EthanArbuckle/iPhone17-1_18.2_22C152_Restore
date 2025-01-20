@interface PHSocialGroup
+ (BOOL)managedObjectSupportsSharingComposition;
+ (BOOL)managedObjectSupportsTrashedState;
+ (id)entityKeyMap;
+ (id)fetchSocialGroupsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchSocialGroupsWithOptions:(id)a3;
+ (id)fetchSocialGroupsWithUUIDs:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)nodeValueKeyPathForNodeValueName:(id)a3;
+ (id)nodeValueNameFromPHSocialGroupPropertyName:(id)a3;
+ (id)nodeValueNameFromPropertyName:(id)a3;
+ (id)propertyNameFromNodeValueName:(id)a3;
- (NSString)customTitle;
- (PHSocialGroup)initWithNodeContainer:(id)a3 photoLibrary:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)exclusiveAssetIDs;
- (id)exclusiveAssetInternalPredicateWithPeopleCount:(int64_t)a3 exactCount:(BOOL)a4;
- (id)inclusiveAssetIDs;
- (id)keyAssetID;
- (id)memberPersonIDs;
- (int64_t)automaticOrder;
- (int64_t)keyAssetPickSource;
- (int64_t)manualOrder;
- (signed)socialGroupVerifiedType;
@end

@implementation PHSocialGroup

PHFetchResult *__46__PHSocialGroup_fetchSocialGroupsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHGraphQuery graphQueryForSocialGroupsWithOptions:a2];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 executeQuery];
  }
  else
  {
    v4 = objc_alloc_init(PHFetchResult);
  }
  v5 = v4;

  return v5;
}

+ (id)nodeValueNameFromPropertyName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"objectID"] & 1) != 0
    || ([v3 isEqualToString:@"uuid"] & 1) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

+ (id)fetchSocialGroupsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_652];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_keyAssetID, 0);
  objc_storeStrong((id *)&self->_exclusiveAssetIDs, 0);
  objc_storeStrong((id *)&self->_inclusiveAssetIDs, 0);

  objc_storeStrong((id *)&self->_memberPersonIDs, 0);
}

- (int64_t)keyAssetPickSource
{
  return self->_keyAssetPickSource;
}

- (int64_t)automaticOrder
{
  return self->_automaticOrder;
}

- (int64_t)manualOrder
{
  return self->_manualOrder;
}

- (signed)socialGroupVerifiedType
{
  return self->_socialGroupVerifiedType;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (id)exclusiveAssetInternalPredicateWithPeopleCount:(int64_t)a3 exactCount:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = (void *)MEMORY[0x1E4F28F60];
  v9 = [(PHSocialGroup *)self exclusiveAssetIDs];
  v10 = [v8 predicateWithFormat:@"self in %@", v9];
  [v7 addObject:v10];

  if (v4) {
    v11 = @"%K.@count == %d";
  }
  else {
    v11 = @"%K.@count >= %d";
  }
  v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v11, @"detectedFaces", a3);
  [v7 addObject:v12];

  v13 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v7];

  return v13;
}

- (id)debugDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v11.receiver = self;
  v11.super_class = (Class)PHSocialGroup;
  BOOL v4 = [(PHObject *)&v11 description];
  v5 = [v3 stringWithString:v4];

  v6 = [(PHObject *)self uuid];
  [v5 appendFormat:@"UUID: %@, ", v6];

  id v7 = [(PHSocialGroup *)self customTitle];
  [v5 appendFormat:@"Custom Title: %@, ", v7];

  [v5 appendFormat:@"Number of Inclusive Assets: %lu, ", -[NSSet count](self->_inclusiveAssetIDs, "count")];
  [v5 appendFormat:@"Number of Exclusive Assets: %lu, ", -[NSSet count](self->_exclusiveAssetIDs, "count")];
  [v5 appendFormat:@"Manual Order: %ld, ", -[PHSocialGroup manualOrder](self, "manualOrder")];
  [v5 appendFormat:@"Automatic Order: %ld, ", -[PHSocialGroup automaticOrder](self, "automaticOrder")];
  unsigned int v8 = [(PHSocialGroup *)self socialGroupVerifiedType] + 1;
  if (v8 > 3) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E5841C18[v8];
  }
  [v5 appendFormat:@"Verified Type: %@, ", v9];
  [v5 appendFormat:@"Key Asset ID: %@, ", self->_keyAssetID];
  [v5 appendFormat:@"Key Asset pick source: %lld, ", -[PHSocialGroup keyAssetPickSource](self, "keyAssetPickSource")];

  return v5;
}

- (id)description
{
  id v3 = NSString;
  BOOL v4 = [(PHObject *)self objectID];
  v5 = [(PHSocialGroup *)self customTitle];
  v6 = [v3 stringWithFormat:@"<%@ customTitle=%@>", v4, v5];

  return v6;
}

- (PHSocialGroup)initWithNodeContainer:(id)a3 photoLibrary:(id)a4
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v44[0] = MEMORY[0x1E4F1CC28];
  v43[0] = @"deleted";
  v43[1] = @"uuid";
  unsigned int v8 = [v6 uuid];
  v44[1] = v8;
  v43[2] = @"objectID";
  v9 = [v6 sourceNode];
  v10 = [v9 objectID];
  v44[2] = v10;
  objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:3];

  v41.receiver = self;
  v41.super_class = (Class)PHSocialGroup;
  v12 = [(PHObject *)&v41 initWithFetchDictionary:v11 propertyHint:2 photoLibrary:v7];
  if (v12)
  {
    uint64_t v13 = [v6 customTitle];
    customTitle = v12->_customTitle;
    v12->_customTitle = (NSString *)v13;

    v12->_socialGroupVerifiedType = [v6 socialGroupVerifiedType];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v16 = objc_msgSend(v6, "members", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v37 + 1) + 8 * v20) objectID];
          [v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v18);
    }

    uint64_t v22 = [v15 copy];
    memberPersonIDs = v12->_memberPersonIDs;
    v12->_memberPersonIDs = (NSSet *)v22;

    v24 = [v6 inclusiveAssetIDs];
    uint64_t v25 = [v24 copy];
    inclusiveAssetIDs = v12->_inclusiveAssetIDs;
    v12->_inclusiveAssetIDs = (NSSet *)v25;

    v27 = [v6 exclusiveAssetIDs];
    uint64_t v28 = [v27 copy];
    exclusiveAssetIDs = v12->_exclusiveAssetIDs;
    v12->_exclusiveAssetIDs = (NSSet *)v28;

    v30 = [v6 keyAsset];
    v31 = [v30 objectID];
    uint64_t v32 = [v31 copy];
    keyAssetID = v12->_keyAssetID;
    v12->_keyAssetID = (NSManagedObjectID *)v32;

    v34 = [v6 manualOrder];
    v12->_manualOrder = [v34 integerValue];

    v35 = [v6 automaticOrder];
    v12->_automaticOrder = [v35 integerValue];

    v12->_keyAssetPickSource = [v6 keyAssetPickSource];
  }

  return v12;
}

- (id)keyAssetID
{
  return self->_keyAssetID;
}

- (id)exclusiveAssetIDs
{
  return self->_exclusiveAssetIDs;
}

- (id)inclusiveAssetIDs
{
  return self->_inclusiveAssetIDs;
}

- (id)memberPersonIDs
{
  return self->_memberPersonIDs;
}

+ (id)fetchSocialGroupsWithUUIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__PHSocialGroup_fetchSocialGroupsWithUUIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __52__PHSocialGroup_fetchSocialGroupsWithUUIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHGraphQuery queryForSocialGroupsWithUUIDs:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchSocialGroupsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "_pl_map:", &__block_literal_global_152);
  unsigned int v8 = [a1 fetchSocialGroupsWithUUIDs:v7 options:v6];

  return v8;
}

id __63__PHSocialGroup_fetchSocialGroupsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PHObject uuidFromLocalIdentifier:a2];
}

+ (id)nodeValueKeyPathForNodeValueName:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:@"manualOrder"] & 1) != 0
    || ([v5 isEqualToString:@"automaticOrder"] & 1) != 0
    || ([v5 isEqualToString:@"socialGroupVerifiedType"] & 1) != 0)
  {
    id v6 = @"intValue";
  }
  else if ([v5 isEqualToString:@"customTitle"])
  {
    id v6 = @"stringValue";
  }
  else
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PHSocialGroup.m", 195, @"Unsupported propertyName: %@", v5 object file lineNumber description];

    id v6 = 0;
  }

  return v6;
}

+ (id)propertyNameFromNodeValueName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"node"])
  {
    BOOL v4 = @"objectID";
  }
  else if ([v3 isEqualToString:@"node.uuid"])
  {
    BOOL v4 = @"uuid";
  }
  else
  {
    BOOL v4 = (__CFString *)v3;
  }

  return v4;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15_672;

  return v2;
}

void __29__PHSocialGroup_entityKeyMap__block_invoke()
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  id v15 = @"uuid";
  v16[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v17[0] = v1;
  v16[1] = @"objectID";
  v14 = @"objectID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v17[1] = v2;
  v16[2] = @"changeFlag0";
  uint64_t v13 = @"socialGroupVerifiedType";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v17[2] = v3;
  v16[3] = @"changeFlag2";
  v12 = @"memberPersonIDs";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v17[3] = v4;
  v16[4] = @"changeFlag3";
  objc_super v11 = @"keyAssetID";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v17[4] = v5;
  v16[5] = @"changeFlag4";
  v10[0] = @"inclusiveAssetIDs";
  v10[1] = @"exclusiveAssetIDs";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v17[5] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];
  uint64_t v8 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v7];
  v9 = (void *)entityKeyMap_pl_once_object_15_672;
  entityKeyMap_pl_once_object_15_672 = v8;
}

+ (id)identifierCode
{
  return @"071";
}

+ (BOOL)managedObjectSupportsSharingComposition
{
  return 0;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)fetchType
{
  v2 = @"PHSocialGroup";
  return @"PHSocialGroup";
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A858] entityName];
}

+ (id)nodeValueNameFromPHSocialGroupPropertyName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"objectID"] & 1) != 0
    || ([v3 isEqualToString:@"uuid"] & 1) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

@end