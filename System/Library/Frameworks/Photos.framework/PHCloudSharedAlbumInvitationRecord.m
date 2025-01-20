@interface PHCloudSharedAlbumInvitationRecord
+ (id)entityKeyMap;
+ (id)fetchAllInvitationRecordsWithOptions:(id)a3;
+ (id)fetchInvitationRecordsForSharedAlbum:(id)a3;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
- (BOOL)isMine;
- (NSArray)inviteeEmails;
- (NSArray)inviteePhones;
- (NSNumber)invitationState;
- (NSNumber)invitationStateLocal;
- (NSString)albumGUID;
- (NSString)cloudGUID;
- (NSString)inviteeEmail;
- (NSString)inviteeFirstName;
- (NSString)inviteeHashedPersonID;
- (NSString)inviteeLastName;
- (NSString)inviteePhone;
- (PHCloudSharedAlbumInvitationRecord)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (void)setAlbumGUID:(id)a3;
- (void)setCloudGUID:(id)a3;
- (void)setInviteeHashedPersonID:(id)a3;
@end

@implementation PHCloudSharedAlbumInvitationRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationStateLocal, 0);
  objc_storeStrong((id *)&self->_invitationState, 0);
  objc_storeStrong((id *)&self->_inviteeHashedPersonID, 0);
  objc_storeStrong((id *)&self->_inviteeLastName, 0);
  objc_storeStrong((id *)&self->_inviteeFirstName, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);

  objc_storeStrong((id *)&self->_cloudGUID, 0);
}

- (NSNumber)invitationStateLocal
{
  return self->_invitationStateLocal;
}

- (NSNumber)invitationState
{
  return self->_invitationState;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setInviteeHashedPersonID:(id)a3
{
}

- (NSString)inviteeHashedPersonID
{
  return self->_inviteeHashedPersonID;
}

- (NSString)inviteeLastName
{
  return self->_inviteeLastName;
}

- (NSString)inviteeFirstName
{
  return self->_inviteeFirstName;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setCloudGUID:(id)a3
{
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (NSArray)inviteePhones
{
  v3 = [(PHObject *)self photoLibrary];
  v4 = [v3 photoLibrary];
  v5 = [v4 personInfoManager];
  v6 = [(PHCloudSharedAlbumInvitationRecord *)self cloudGUID];
  v7 = [v5 phonesForInvitationRecordGUID:v6];

  return (NSArray *)v7;
}

- (NSArray)inviteeEmails
{
  v3 = [(PHObject *)self photoLibrary];
  v4 = [v3 photoLibrary];
  v5 = [v4 personInfoManager];
  v6 = [(PHCloudSharedAlbumInvitationRecord *)self cloudGUID];
  v7 = [v5 emailsForInvitationRecordGUID:v6];

  return (NSArray *)v7;
}

- (NSString)inviteePhone
{
  v2 = [(PHCloudSharedAlbumInvitationRecord *)self inviteePhones];
  v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSString)inviteeEmail
{
  v2 = [(PHCloudSharedAlbumInvitationRecord *)self inviteeEmails];
  v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (PHCloudSharedAlbumInvitationRecord)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PHCloudSharedAlbumInvitationRecord;
  v9 = [(PHObject *)&v26 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKeyedSubscript:@"albumGUID"];
    albumGUID = v9->_albumGUID;
    v9->_albumGUID = (NSString *)v10;

    uint64_t v12 = [v8 objectForKeyedSubscript:@"cloudGUID"];
    cloudGUID = v9->_cloudGUID;
    v9->_cloudGUID = (NSString *)v12;

    uint64_t v14 = [v8 objectForKeyedSubscript:@"inviteeFirstName"];
    inviteeFirstName = v9->_inviteeFirstName;
    v9->_inviteeFirstName = (NSString *)v14;

    uint64_t v16 = [v8 objectForKeyedSubscript:@"inviteeLastName"];
    inviteeLastName = v9->_inviteeLastName;
    v9->_inviteeLastName = (NSString *)v16;

    uint64_t v18 = [v8 objectForKeyedSubscript:@"inviteeHashedPersonID"];
    inviteeHashedPersonID = v9->_inviteeHashedPersonID;
    v9->_inviteeHashedPersonID = (NSString *)v18;

    v20 = [v8 objectForKeyedSubscript:@"isMine"];
    v9->_isMine = [v20 BOOLValue];

    uint64_t v21 = [v8 objectForKeyedSubscript:@"invitationState"];
    invitationState = v9->_invitationState;
    v9->_invitationState = (NSNumber *)v21;

    uint64_t v23 = [v8 objectForKeyedSubscript:@"invitationStateLocal"];
    invitationStateLocal = v9->_invitationStateLocal;
    v9->_invitationStateLocal = (NSNumber *)v23;
  }
  return v9;
}

+ (id)fetchInvitationRecordsForSharedAlbum:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v5 = [v4 librarySpecificFetchOptions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PHCloudSharedAlbumInvitationRecord_fetchInvitationRecordsForSharedAlbum___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v3;
  id v6 = v3;
  v7 = +[PHObject authorizationAwareFetchResultWithOptions:v5 fetchBlock:v9];

  return v7;
}

id __75__PHCloudSharedAlbumInvitationRecord_fetchInvitationRecordsForSharedAlbum___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAllInvitationRecordsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:a3 fetchBlock:&__block_literal_global_65];
}

id __75__PHCloudSharedAlbumInvitationRecord_fetchAllInvitationRecordsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = +[PHQuery queryForCloudSharedAlbumInvitationRecordsWithOptions:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  v2 = (void *)entityKeyMap_pl_once_object_15;

  return v2;
}

void __50__PHCloudSharedAlbumInvitationRecord_entityKeyMap__block_invoke()
{
  v23[9] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [PHEntityKeyMap alloc];
  uint64_t v21 = @"uuid";
  v22[0] = @"uuid";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v23[0] = v0;
  v22[1] = @"cloudGUID";
  v20 = @"cloudGUID";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  v23[1] = v1;
  v22[2] = @"albumGUID";
  v19 = @"albumGUID";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v23[2] = v2;
  v22[3] = @"inviteeFirstName";
  uint64_t v18 = @"inviteeFirstName";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v23[3] = v3;
  v22[4] = @"inviteeLastName";
  v17 = @"inviteeLastName";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v23[4] = v4;
  v22[5] = @"inviteeHashedPersonID";
  uint64_t v16 = @"inviteeHashedPersonID";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v23[5] = v5;
  v22[6] = @"isMine";
  v15 = @"isMine";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v23[6] = v6;
  v22[7] = @"invitationState";
  uint64_t v14 = @"invitationState";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v23[7] = v7;
  v22[8] = @"invitationStateLocal";
  v13 = @"invitationStateLocal";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v23[8] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
  uint64_t v10 = [(PHEntityKeyMap *)v12 initWithPropertyKeysByEntityKey:v9];
  v11 = (void *)entityKeyMap_pl_once_object_15;
  entityKeyMap_pl_once_object_15 = v10;
}

+ (id)identifierCode
{
  return @"220";
}

+ (id)fetchType
{
  v2 = @"PHCloudSharedAlbumInvitationRecord";
  return @"PHCloudSharedAlbumInvitationRecord";
}

+ (id)managedEntityName
{
  return @"CloudSharedAlbumInvitationRecord";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken, &__block_literal_global);
  }
  id v3 = (void *)propertiesToFetchWithHint__propertiesToFetch;

  return v3;
}

void __64__PHCloudSharedAlbumInvitationRecord_propertiesToFetchWithHint___block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A978] objectIDDescription];
  v3[0] = v0;
  v3[1] = @"uuid";
  v3[2] = @"albumGUID";
  v3[3] = @"cloudGUID";
  v3[4] = @"inviteeFirstName";
  v3[5] = @"inviteeLastName";
  v3[6] = @"inviteeHashedPersonID";
  v3[7] = @"isMine";
  v3[8] = @"invitationState";
  v3[9] = @"invitationStateLocal";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:10];
  v2 = (void *)propertiesToFetchWithHint__propertiesToFetch;
  propertiesToFetchWithHint__propertiesToFetch = v1;
}

@end