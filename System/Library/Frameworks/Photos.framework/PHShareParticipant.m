@interface PHShareParticipant
+ (id)entityKeyMap;
+ (id)fetchContributorsForAsset:(id)a3 options:(id)a4;
+ (id)fetchContributorsForAssets:(id)a3 options:(id)a4;
+ (id)fetchParticipantsInShare:(id)a3 options:(id)a4;
+ (id)fetchParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4;
+ (id)fetchShareParticipantForPerson:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)localIdentifierWithUUID:(id)a3;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (void)queryParticipantsWithEmails:(id)a3 phoneNumbers:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
- (BOOL)isCurrentUser;
- (BOOL)isEqual:(id)a3;
- (Class)changeRequestClass;
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)participantID;
- (NSString)phoneNumber;
- (PHShareParticipant)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (signed)acceptanceStatus;
- (signed)exitState;
- (signed)permission;
- (unint64_t)hash;
- (unsigned)role;
@end

@implementation PHShareParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (signed)exitState
{
  return self->_exitState;
}

- (signed)acceptanceStatus
{
  return self->_acceptanceStatus;
}

- (signed)permission
{
  return self->_permission;
}

- (unsigned)role
{
  return self->_role;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PHShareParticipant *)self role];
  v4 = [(PHShareParticipant *)self phoneNumber];
  uint64_t v5 = [v4 hash];
  v6 = [(PHShareParticipant *)self emailAddress];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  v8 = [(PHShareParticipant *)self nameComponents];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHShareParticipant *)a3;
  if (self == v4)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int v6 = [(PHShareParticipant *)v5 role];
      if (v6 == [(PHShareParticipant *)self role])
      {
        uint64_t v7 = [(PHShareParticipant *)v5 phoneNumber];
        v8 = [(PHShareParticipant *)self phoneNumber];
        if (PLObjectIsEqual())
        {
          unint64_t v9 = [(PHShareParticipant *)v5 nameComponents];
          v10 = [(PHShareParticipant *)self nameComponents];
          if (PLObjectIsEqual())
          {
            v11 = [(PHShareParticipant *)v5 emailAddress];
            v12 = [(PHShareParticipant *)self emailAddress];
            char IsEqual = PLObjectIsEqual();
          }
          else
          {
            char IsEqual = 0;
          }
        }
        else
        {
          char IsEqual = 0;
        }
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (PHShareParticipant)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHShareParticipant;
  unint64_t v9 = [(PHObject *)&v24 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"emailAddress"];
    emailAddress = v9->_emailAddress;
    v9->_emailAddress = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"nameComponents"];
    nameComponents = v9->_nameComponents;
    v9->_nameComponents = (NSPersonNameComponents *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"phoneNumber"];
    phoneNumber = v9->_phoneNumber;
    v9->_phoneNumber = (NSString *)v14;

    v16 = [v8 objectForKeyedSubscript:@"role"];
    v9->_role = [v16 integerValue];

    v17 = [v8 objectForKeyedSubscript:@"permission"];
    v9->_permission = [v17 integerValue];

    v18 = [v8 objectForKeyedSubscript:@"acceptanceStatus"];
    v9->_acceptanceStatus = [v18 integerValue];

    v19 = [v8 objectForKeyedSubscript:@"exitState"];
    v9->_exitState = [v19 integerValue];

    v20 = [v8 objectForKeyedSubscript:@"isCurrentUser"];
    v9->_isCurrentUser = [v20 BOOLValue];

    uint64_t v21 = [v8 objectForKeyedSubscript:@"participantID"];
    participantID = v9->_participantID;
    v9->_participantID = (NSString *)v21;
  }
  return v9;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchShareParticipantForPerson:(id)a3 options:(id)a4
{
  if (a3)
  {
    v4 = +[PHQuery queryForShareParticipantWithPerson:a3 options:a4];
    uint64_t v5 = [v4 executeQuery];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (void)queryParticipantsWithEmails:(id)a3 phoneNumbers:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [a5 assetsdClient];
  v13 = [v12 cloudInternalClient];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__PHShareParticipant_queryParticipantsWithEmails_phoneNumbers_photoLibrary_completionHandler___block_invoke;
  v15[3] = &unk_1E5846C40;
  id v16 = v9;
  id v14 = v9;
  [v13 queryParticipantsWithEmails:v11 phoneNumbers:v10 completionHandler:v15];
}

uint64_t __94__PHShareParticipant_queryParticipantsWithEmails_phoneNumbers_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)fetchContributorsForAssets:(id)a3 options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (!v11)
        {
          id v11 = [*(id *)(*((void *)&v31 + 1) + 8 * i) photoLibrary];
        }
        v15 = [v14 uuid];
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v17 = [v11 photoLibrary];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __57__PHShareParticipant_fetchContributorsForAssets_options___block_invoke;
  v27[3] = &unk_1E5848EC0;
  id v18 = v7;
  id v28 = v18;
  id v19 = v11;
  id v29 = v19;
  id v20 = v16;
  id v30 = v20;
  [v17 performBlockAndWait:v27];

  if (([v6 hasAnySortDescriptors] & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"isCurrentUser" ascending:0];
    v35 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];

    [v6 setSortDescriptors:v22];
  }
  v23 = [v20 array];
  objc_super v24 = +[PHQuery queryForShareParticipantsWithLocalIdentifiers:v23 options:v6];

  v25 = [v24 executeQuery];

  return v25;
}

void __57__PHShareParticipant_fetchContributorsForAssets_options___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8A950];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) photoLibrary];
  id v5 = [v2 assetsWithUUIDs:v3 options:0 inLibrary:v4];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v22 + 1) + 8 * v6) libraryScopeContributors];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(a1 + 48);
              v13 = [*(id *)(*((void *)&v18 + 1) + 8 * v11) uuid];
              id v14 = +[PHShareParticipant localIdentifierWithUUID:v13];
              [v12 addObject:v14];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }
}

+ (id)fetchContributorsForAsset:(id)a3 options:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 arrayWithObjects:&v12 count:1];

  uint64_t v10 = objc_msgSend(a1, "fetchContributorsForAssets:options:", v9, v7, v12, v13);

  return v10;
}

+ (id)fetchParticipantsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PHShareParticipant_fetchParticipantsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  id v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __68__PHShareParticipant_fetchParticipantsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForShareParticipantsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  uint64_t v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchParticipantsInShare:(id)a3 options:(id)a4
{
  v4 = +[PHQuery queryForShareParticipantsInShare:a3 options:a4];
  id v5 = [v4 executeQuery];

  return v5;
}

+ (id)localIdentifierWithUUID:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = [a1 identifierCode];
  id v7 = [v4 stringWithFormat:@"%@/L0/%@", v5, v6];

  return v7;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PHShareParticipant_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_33877 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_33877, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_33878 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __58__PHShareParticipant_transformValueExpression_forKeyPath___block_invoke()
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"uuid";
  v4[1] = @"emailAddress";
  v4[2] = @"nameComponents";
  v4[3] = @"phoneNumber";
  v4[4] = @"role";
  v4[5] = @"permission";
  v4[6] = @"acceptanceStatus";
  v4[7] = @"exitState";
  v4[8] = @"isCurrentUser";
  v4[9] = @"participantID";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_33878;
  transformValueExpression_forKeyPath___passThroughSet_33878 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_33884;

  return v2;
}

void __34__PHShareParticipant_entityKeyMap__block_invoke()
{
  v25[10] = *MEMORY[0x1E4F143B8];
  id v12 = [PHEntityKeyMap alloc];
  long long v23 = @"uuid";
  v24[0] = @"uuid";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25[0] = v13;
  v24[1] = @"emailAddress";
  long long v22 = @"emailAddress";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v25[1] = v0;
  v24[2] = @"nameComponents";
  long long v21 = @"nameComponents";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v25[2] = v1;
  v24[3] = @"phoneNumber";
  long long v20 = @"phoneNumber";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v25[3] = v2;
  v24[4] = @"role";
  long long v19 = @"role";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v25[4] = v3;
  v24[5] = @"permission";
  long long v18 = @"permission";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v25[5] = v4;
  v24[6] = @"acceptanceStatus";
  uint64_t v17 = @"acceptanceStatus";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v25[6] = v5;
  v24[7] = @"exitState";
  uint64_t v16 = @"exitState";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v25[7] = v6;
  v24[8] = @"isCurrentUser";
  v15 = @"isCurrentUser";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v25[8] = v7;
  v24[9] = @"participantID";
  id v14 = @"participantID";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v25[9] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];
  uint64_t v10 = [(PHEntityKeyMap *)v12 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_15_33884;
  entityKeyMap_pl_once_object_15_33884 = v10;
}

+ (id)identifierCode
{
  return @"150";
}

+ (id)fetchType
{
  uint64_t v2 = @"PHShareParticipant";
  return @"PHShareParticipant";
}

+ (id)managedEntityName
{
  return @"ShareParticipant";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_33893 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_33893, &__block_literal_global_33894);
  }
  uint64_t v3 = (void *)propertiesToFetchWithHint__array_33895;

  return v3;
}

void __48__PHShareParticipant_propertiesToFetchWithHint___block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"uuid";
  v3[2] = @"emailAddress";
  v3[3] = @"nameComponents";
  v3[4] = @"phoneNumber";
  v3[5] = @"role";
  v3[6] = @"permission";
  v3[7] = @"acceptanceStatus";
  v3[8] = @"exitState";
  v3[9] = @"isCurrentUser";
  v3[10] = @"participantID";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:11];
  uint64_t v2 = (void *)propertiesToFetchWithHint__array_33895;
  propertiesToFetchWithHint__array_33895 = v1;
}

@end