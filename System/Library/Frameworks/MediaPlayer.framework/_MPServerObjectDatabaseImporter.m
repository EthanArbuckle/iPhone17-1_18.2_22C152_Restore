@interface _MPServerObjectDatabaseImporter
- (BOOL)_importAssetFullSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6;
- (BOOL)_importAssetMiniSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6;
- (BOOL)importAssetSinf:(id)a3 type:(int64_t)a4 forIdentifier:(id)a5 hashedPersonID:(id)a6 flavor:(int64_t)a7 sinfPayload:(id)a8;
- (BOOL)importAssetURL:(id)a3 forIdentifiers:(id)a4 flavor:(int64_t)a5 expirationDate:(id)a6;
- (BOOL)importHLSAssetURL:(id)a3 keyCertificateURL:(id)a4 keyServerURL:(id)a5 redeliveryId:(int64_t)a6 protocolType:(id)a7 isiTunesStoreStream:(BOOL)a8 forIdentifiers:(id)a9 expirationDate:(id)a10;
- (BOOL)importObject:(id)a3 type:(id)a4 identifiers:(id)a5 source:(int64_t)a6 expiration:(id)a7;
- (BOOL)relateIdentifiers:(id)a3 toParentIdentifiers:(id)a4 parentVersionHash:(id)a5 childKey:(id)a6 order:(int64_t)a7;
- (BOOL)removeRelationshipsForParentIdentifiers:(id)a3 childKey:(id)a4;
- (id)_existingAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5;
- (id)_existingHLSAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4;
- (void)dealloc;
- (void)initWithDatabase:(void *)a1;
@end

@implementation _MPServerObjectDatabaseImporter

- (void)initWithDatabase:(void *)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v56.receiver = a1;
    v56.super_class = (Class)_MPServerObjectDatabaseImporter;
    a1 = objc_msgSendSuper2(&v56, sel_init);
    if (a1)
    {
      v4 = [MEMORY[0x1E4F29128] UUID];
      v5 = [v4 UUIDString];
      v6 = [@"MPServerObjectDatabaseImport-" stringByAppendingString:v5];
      uint64_t v7 = [v3 transactionWithName:v6 error:0];
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = (void *)a1[1];
      id v55 = 0;
      uint64_t v10 = [v9 statementWithString:@"SELECT payload FROM objects WHERE source = @source AND identifier = @identifier AND person_id = @personID LIMIT 1" error:&v55];
      id v11 = v55;
      v12 = (void *)a1[2];
      a1[2] = v10;

      v13 = (void *)a1[1];
      id v54 = v11;
      uint64_t v14 = [v13 statementWithString:@"INSERT OR REPLACE INTO objects (identifier, person_id, source, expiration_date, type, payload) VALUES (@identifier, @personID, @source, @expirationDate, @type, @payload)", &v54 error];
      id v15 = v54;

      v16 = (void *)a1[3];
      a1[3] = v14;

      v17 = (void *)a1[1];
      id v53 = v15;
      uint64_t v18 = [v17 statementWithString:@"INSERT OR REPLACE INTO assets (identifier, hashed_person_id, flavor, url, url_expiration_date) VALUES (@identifier, @hashedPersonID, @flavor, @url, @urlExpirationDate)", &v53 error];
      id v19 = v53;

      v20 = (void *)a1[5];
      a1[5] = v18;

      v21 = (void *)a1[1];
      id v52 = v19;
      uint64_t v22 = [v21 statementWithString:@"INSERT OR REPLACE INTO hls_assets (identifier, hashed_person_id, url_expiration_date, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream) VALUES (@identifier, @hashedPersonID, @urlExpirationDate, @playlistURL, @keyCertificateURL, @keyServerURL, @keyServerAdamID, @keyServerProtocolType, @isiTunesStoreStream)", &v52 error];
      id v23 = v52;

      v24 = (void *)a1[6];
      a1[6] = v22;

      v25 = (void *)a1[1];
      id v51 = v23;
      uint64_t v26 = [v25 statementWithString:@"INSERT OR REPLACE INTO object_relationships (parent_identifier, child_identifier, person_id, child_key, suborder, parent_version_hash) VALUES (@parentIdentifier, @childIdentifier, @personID, @childKey, @suborder, @parentVersionHash)", &v51 error];
      id v27 = v51;

      v28 = (void *)a1[4];
      a1[4] = v26;

      v29 = (void *)a1[1];
      id v50 = v27;
      uint64_t v30 = [v29 statementWithString:@"DELETE FROM object_relationships WHERE parent_identifier = @parentIdentifier AND person_id = @personID AND child_key = @childKey" error:&v50];
      id v31 = v50;

      v32 = (void *)a1[7];
      a1[7] = v30;

      v33 = (void *)a1[1];
      id v49 = v31;
      uint64_t v34 = [v33 statementWithString:@"UPDATE assets SET mini_sinf = @miniSINF WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor" error:&v49];
      id v35 = v49;

      v36 = (void *)a1[8];
      a1[8] = v34;

      v37 = (void *)a1[1];
      id v48 = v35;
      uint64_t v38 = [v37 statementWithString:@"UPDATE assets SET sinfs = @sinfs WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor" error:&v48];
      id v39 = v48;

      v40 = (void *)a1[9];
      a1[9] = v38;

      v41 = (void *)a1[1];
      id v47 = v39;
      uint64_t v42 = [v41 statementWithString:@"UPDATE assets SET url = @url, url_expiration_date = @urlExpirationDate WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor", &v47 error];
      id v43 = v47;

      v44 = (void *)a1[10];
      a1[10] = v42;

      if (v43)
      {
        v45 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v58 = v43;
          _os_log_impl(&dword_1952E8000, v45, OS_LOG_TYPE_FAULT, "SOD: Unable to create statements. error: %{public}@", buf, 0xCu);
        }

        a1 = 0;
      }
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_updateSINFStatement, 0);
  objc_storeStrong((id *)&self->_updateMiniSINFStatement, 0);
  objc_storeStrong((id *)&self->_removeRelationshipsStatement, 0);
  objc_storeStrong((id *)&self->_insertHLSAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_insertAssetURLStatement, 0);
  objc_storeStrong((id *)&self->_insertObjectRelationshipStatement, 0);
  objc_storeStrong((id *)&self->_insertObjectStatement, 0);
  objc_storeStrong((id *)&self->_selectExistingObjectStatement, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

- (id)_existingHLSAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  transaction = self->_transaction;
  id v7 = a4;
  id v8 = a3;
  v9 = [(MSVSQLDatabaseTransaction *)transaction statementWithString:@"SELECT identifier, hashed_person_id, playlist_url, key_certificate_url, key_server_url, key_server_adam_id, key_server_protocol_type, is_itunes_store_stream FROM hls_assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID" error:0];
  [v9 bindStringValue:v8 toParameterNamed:@"@identifier"];

  [v9 bindStringValue:v7 toParameterNamed:@"@hashedPersonID"];
  uint64_t v10 = [(MSVSQLDatabaseTransaction *)self->_transaction resultsForStatement:v9];
  id v16 = 0;
  id v11 = [v10 nextObjectWithError:&v16];
  id v12 = v16;
  if (v12)
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_FAULT, "SOD: _existingHLSAssetMatchingIdentifier stepError: %{public}@", buf, 0xCu);
    }
  }
  if (v11) {
    uint64_t v14 = [[MPServerObjectDatabaseHLSAsset alloc] initWithSQLRowResult:v11];
  }
  else {
    uint64_t v14 = 0;
  }
  [v9 invalidate];

  return v14;
}

- (id)_existingAssetMatchingIdentifier:(id)a3 hashedPersonID:(id)a4 flavor:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  transaction = self->_transaction;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MSVSQLDatabaseTransaction *)transaction statementWithString:@"SELECT identifier, hashed_person_id, flavor, url, mini_sinf, sinfs FROM assets WHERE identifier = @identifier AND hashed_person_id = @hashedPersonID AND flavor = @flavor" error:0];
  [v11 bindStringValue:v10 toParameterNamed:@"@identifier"];

  [v11 bindStringValue:v9 toParameterNamed:@"@hashedPersonID"];
  if ((unint64_t)(a5 - 1) > 3) {
    id v12 = @"unknown";
  }
  else {
    id v12 = off_1E57F5490[a5 - 1];
  }
  [v11 bindStringValue:v12 toParameterNamed:@"@flavor"];
  v13 = [(MSVSQLDatabaseTransaction *)self->_transaction resultsForStatement:v11];
  id v19 = 0;
  uint64_t v14 = [v13 nextObjectWithError:&v19];
  id v15 = v19;
  if (v15)
  {
    id v16 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v15;
      _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_FAULT, "SOD: _existingAssetMatchingIdentifier stepError: %{public}@", buf, 0xCu);
    }
  }
  if (v14) {
    v17 = [[MPServerObjectDatabaseAsset alloc] initWithSQLRowResult:v14];
  }
  else {
    v17 = 0;
  }
  [v11 invalidate];

  return v17;
}

- (BOOL)_importAssetFullSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  updateSINFStatement = self->_updateSINFStatement;
  id v11 = a5;
  id v12 = a4;
  [(MSVSQLStatement *)updateSINFStatement bindDataValue:a3 toParameterNamed:@"@sinfs"];
  [(MSVSQLStatement *)self->_updateSINFStatement bindStringValue:v12 toParameterNamed:@"@identifier"];

  [(MSVSQLStatement *)self->_updateSINFStatement bindStringValue:v11 toParameterNamed:@"@hashedPersonID"];
  if ((unint64_t)(a6 - 1) > 3) {
    v13 = @"unknown";
  }
  else {
    v13 = off_1E57F5490[a6 - 1];
  }
  [(MSVSQLStatement *)self->_updateSINFStatement bindStringValue:v13 toParameterNamed:@"@flavor"];
  transaction = self->_transaction;
  id v15 = self->_updateSINFStatement;
  id v19 = 0;
  [(MSVSQLDatabaseTransaction *)transaction executeStatement:v15 error:&v19];
  id v16 = v19;
  if (v16)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_FAULT, "SOD: importAssetFullSINF: update failed error=%{public}@", buf, 0xCu);
    }
  }
  [(MSVSQLStatement *)self->_updateSINFStatement reset];

  return v16 == 0;
}

- (BOOL)_importAssetMiniSINF:(id)a3 forIdentifier:(id)a4 hashedPersonID:(id)a5 flavor:(int64_t)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  updateMiniSINFStatement = self->_updateMiniSINFStatement;
  id v11 = a5;
  id v12 = a4;
  [(MSVSQLStatement *)updateMiniSINFStatement bindDataValue:a3 toParameterNamed:@"@miniSINF"];
  [(MSVSQLStatement *)self->_updateMiniSINFStatement bindStringValue:v12 toParameterNamed:@"@identifier"];

  [(MSVSQLStatement *)self->_updateMiniSINFStatement bindStringValue:v11 toParameterNamed:@"@hashedPersonID"];
  if ((unint64_t)(a6 - 1) > 3) {
    v13 = @"unknown";
  }
  else {
    v13 = off_1E57F5490[a6 - 1];
  }
  [(MSVSQLStatement *)self->_updateMiniSINFStatement bindStringValue:v13 toParameterNamed:@"@flavor"];
  transaction = self->_transaction;
  id v15 = self->_updateMiniSINFStatement;
  id v19 = 0;
  [(MSVSQLDatabaseTransaction *)transaction executeStatement:v15 error:&v19];
  id v16 = v19;
  if (v16)
  {
    v17 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_FAULT, "SOD: importAssetMiniSINF: update failed error=%{public}@", buf, 0xCu);
    }
  }
  [(MSVSQLStatement *)self->_updateMiniSINFStatement reset];

  return v16 == 0;
}

- (BOOL)removeRelationshipsForParentIdentifiers:(id)a3 childKey:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"MPServerObjectDatabase.m", 1154, @"Invalid parameter not satisfying: %@", @"childKey" object file lineNumber description];
  }
  id v9 = [v7 personalizedStore];
  id v10 = [v9 personID];
  id v11 = [v7 preferredStoreStringIdentifierForPersonID:v10];

  if (v11)
  {
    id v12 = [v7 personalizedStore];
    v13 = [v12 personID];

    if (!v13)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1158 description:@"Cannot remove relationships without a personID"];
    }
    [(MSVSQLStatement *)self->_removeRelationshipsStatement bindStringValue:v11 toParameterNamed:@"@parentIdentifier"];
    [(MSVSQLStatement *)self->_removeRelationshipsStatement bindStringValue:v13 toParameterNamed:@"@personID"];
    [(MSVSQLStatement *)self->_removeRelationshipsStatement bindStringValue:v8 toParameterNamed:@"@childKey"];
    transaction = self->_transaction;
    removeRelationshipsStatement = self->_removeRelationshipsStatement;
    id v22 = 0;
    [(MSVSQLDatabaseTransaction *)transaction executeStatement:removeRelationshipsStatement error:&v22];
    id v16 = v22;
    BOOL v17 = v16 == 0;
    if (v16)
    {
      id v18 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v16;
        _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_FAULT, "SOD: removeRelationshipsForParentIdentifiersError: %{public}@", buf, 0xCu);
      }
    }
    [(MSVSQLStatement *)self->_removeRelationshipsStatement reset];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)relateIdentifiers:(id)a3 toParentIdentifiers:(id)a4 parentVersionHash:(id)a5 childKey:(id)a6 order:(int64_t)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v16)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"MPServerObjectDatabase.m", 1128, @"Invalid parameter not satisfying: %@", @"childKey" object file lineNumber description];
  }
  BOOL v17 = [v14 personalizedStore];
  id v18 = [v17 personID];
  id v19 = [v14 preferredStoreStringIdentifierForPersonID:v18];

  if (v19)
  {
    id v33 = v15;
    v20 = [v13 personalizedStore];
    id v21 = [v20 personID];
    id v22 = [v13 preferredStoreStringIdentifierForPersonID:v21];

    if (v22)
    {
      id v23 = [v13 personalizedStore];
      id v24 = [v23 personID];

      if (!v24)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1134 description:@"Cannot relate without a personID"];
      }
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindStringValue:v19 toParameterNamed:@"@parentIdentifier"];
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindStringValue:v22 toParameterNamed:@"@childIdentifier"];
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindStringValue:v24 toParameterNamed:@"@personID"];
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindStringValue:v16 toParameterNamed:@"@childKey"];
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindInt64Value:a7 toParameterNamed:@"@suborder"];
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement bindStringValue:v33 toParameterNamed:@"@parentVersionHash"];
      transaction = self->_transaction;
      insertObjectRelationshipStatement = self->_insertObjectRelationshipStatement;
      id v34 = 0;
      [(MSVSQLDatabaseTransaction *)transaction executeStatement:insertObjectRelationshipStatement error:&v34];
      id v27 = v34;
      BOOL v28 = v27 == 0;
      if (v27)
      {
        v29 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v27;
          _os_log_impl(&dword_1952E8000, v29, OS_LOG_TYPE_FAULT, "SOD: relateIdentifiers:toParentIdentifiers:order: %{public}@", buf, 0xCu);
        }
      }
      [(MSVSQLStatement *)self->_insertObjectRelationshipStatement reset];
    }
    else
    {
      BOOL v28 = 0;
    }

    id v15 = v33;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)importAssetSinf:(id)a3 type:(int64_t)a4 forIdentifier:(id)a5 hashedPersonID:(id)a6 flavor:(int64_t)a7 sinfPayload:(id)a8
{
  *(void *)&v41[5] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (![v17 length])
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1084 description:@"Cannot import an asset without personID"];
  }
  if (![v16 length])
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1085 description:@"Cannot import an asset without identifier"];
  }
  if ([v15 length])
  {
    if (a4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1086 description:@"Cannot import an asset without sinfData"];

    if (a4) {
      goto LABEL_7;
    }
  }
  uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:1087 description:@"Cannot import sinf with invalid type"];

LABEL_7:
  id v19 = [(_MPServerObjectDatabaseImporter *)self _existingAssetMatchingIdentifier:v16 hashedPersonID:v17 flavor:a7];
  v20 = v19;
  BOOL v21 = v19 != 0;
  if (!v19)
  {
    id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v38 = 138543874;
      id v39 = v16;
      __int16 v40 = 1024;
      *(_DWORD *)v41 = a7;
      v41[2] = 1024;
      *(_DWORD *)&v41[3] = a4;
      uint64_t v26 = "SOD: importAssetSinf: skipping [asset does not exist] identifiers=%{public}@ flavor=%d sinfType=%d";
      id v27 = v24;
      os_log_type_t v28 = OS_LOG_TYPE_FAULT;
      uint32_t v29 = 24;
LABEL_34:
      _os_log_impl(&dword_1952E8000, v27, v28, v26, (uint8_t *)&v38, v29);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (a4 == 1)
  {
    uint64_t v30 = [v19 sinfs];
    char v31 = [v18 isEqualToArray:v30];

    if (v31)
    {
      id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a7 - 1) > 3) {
          v32 = @"unknown";
        }
        else {
          v32 = off_1E57F5470[a7 - 1];
        }
        int v38 = 138543618;
        id v39 = v16;
        __int16 v40 = 2114;
        *(void *)v41 = v32;
        uint64_t v26 = "SOD: importAssetSinf: skipping [existing fullSinf already in database] id=%{public}@ / flavor=%{public}@";
        goto LABEL_32;
      }
LABEL_35:

      goto LABEL_36;
    }
    if ([(_MPServerObjectDatabaseImporter *)self _importAssetFullSINF:v15 forIdentifier:v16 hashedPersonID:v17 flavor:a7])
    {
      id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      int v38 = 138543618;
      id v39 = v16;
      __int16 v40 = 2114;
      *(void *)v41 = v17;
      uint64_t v26 = "SOD: importAssetSinf: [success] type=fullSinf identifier=%{public}@ person=%{public}@";
      goto LABEL_26;
    }
  }
  else if (a4 == 2)
  {
    id v22 = [v19 miniSINF];
    char v23 = [v15 isEqualToData:v22];

    if (v23)
    {
      id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(a7 - 1) > 3) {
          uint64_t v25 = @"unknown";
        }
        else {
          uint64_t v25 = off_1E57F5470[a7 - 1];
        }
        int v38 = 138543618;
        id v39 = v16;
        __int16 v40 = 2114;
        *(void *)v41 = v25;
        uint64_t v26 = "SOD: importAssetSinf: skipping [existing miniSinf already in database] id=%{public}@ / flavor=%{public}@";
LABEL_32:
        id v27 = v24;
        os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    if ([(_MPServerObjectDatabaseImporter *)self _importAssetMiniSINF:v15 forIdentifier:v16 hashedPersonID:v17 flavor:a7])
    {
      id v24 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
        goto LABEL_35;
      }
      int v38 = 138543618;
      id v39 = v16;
      __int16 v40 = 2114;
      *(void *)v41 = v17;
      uint64_t v26 = "SOD: importAssetSinf: [success] type=miniSinf identifier=%{public}@ person=%{public}@";
LABEL_26:
      id v27 = v24;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
LABEL_33:
      uint32_t v29 = 22;
      goto LABEL_34;
    }
  }
  BOOL v21 = 0;
LABEL_36:

  return v21;
}

- (BOOL)importHLSAssetURL:(id)a3 keyCertificateURL:(id)a4 keyServerURL:(id)a5 redeliveryId:(int64_t)a6 protocolType:(id)a7 isiTunesStoreStream:(BOOL)a8 forIdentifiers:(id)a9 expirationDate:(id)a10
{
  BOOL v166 = a8;
  v185[0] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v20 = [v18 personalizedStore];
  BOOL v21 = [v20 personID];

  if (v21)
  {
    uint64_t v22 = [v18 preferredStoreStringIdentifierForPersonID:v21];
    char v23 = (void *)v22;
    if (!v22)
    {
      BOOL v35 = 0;
LABEL_173:

      goto LABEL_174;
    }
    int64_t v24 = a6;
    v165 = (void *)v22;
    if (a6) {
      goto LABEL_9;
    }
    uint64_t v25 = [v18 universalStore];
    int64_t v24 = [v25 subscriptionAdamID];

    char v23 = v165;
    if (v24
      || ([v18 universalStore],
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          int64_t v24 = [v26 adamID],
          v26,
          char v23 = v165,
          v24))
    {
LABEL_9:
      if (v15 && v16 || v166 && ([v17 isEqualToString:@"simplified"] & 1) != 0)
      {
        int64_t v160 = v24;
        v161 = v19;
        int64_t v158 = a6;
        id v162 = v17;
        v163 = v15;
        v164 = v16;
        id v27 = buf;
        id v28 = v21;
        long long v180 = 0u;
        long long v179 = 0u;
        long long v178 = 0u;
        long long v177 = 0u;
        long long v176 = 0u;
        long long v175 = 0u;
        long long v174 = 0u;
        long long v173 = 0u;
        long long v172 = 0u;
        long long v171 = 0u;
        long long v170 = 0u;
        memset(&buf[8], 0, 32);
        *(void *)buf = 4001;
        CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
        id v29 = v28;
        uint64_t v30 = (unsigned char *)[v29 UTF8String];
        uint64_t v31 = [v29 length];
        int v32 = v31;
        if (*(uint64_t *)buf > 3999)
        {
          if (*(uint64_t *)buf > 4255)
          {
            if (*(void *)buf == 4256)
            {
              CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v30, v31);
            }
            else if (*(void *)buf == 4512)
            {
              CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v30, v31);
            }
          }
          else if (*(void *)buf == 4000)
          {
            CC_MD5_Update((CC_MD5_CTX *)&buf[8], v30, v31);
          }
          else if (*(void *)buf == 4001)
          {
            CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v30, v31);
          }
        }
        else if (*(uint64_t *)buf > 2999)
        {
          if (*(void *)buf == 3000)
          {
            _MSV_XXH_XXH32_update_12030(&buf[8], v30, v31);
          }
          else if (*(void *)buf == 3001)
          {
            _MSV_XXH_XXH64_update_12031(&buf[8], v30, v31);
          }
        }
        else if (*(void *)buf)
        {
          if (*(void *)buf == 2000)
          {
            int v33 = (((v31 + buf[19]) & 3) - buf[19]);
            id v34 = &buf[buf[19] + 16];
            switch(v33)
            {
              case 0:
                break;
              case 1:
                *id v34 = *v30;
                break;
              case 2:
                __int16 v39 = *(_WORD *)v30;
                goto LABEL_41;
              case 3:
                __int16 v39 = *(_WORD *)v30;
                buf[buf[19] + 18] = v30[2];
LABEL_41:
                *(_WORD *)id v34 = v39;
                break;
              default:
                memcpy(v34, v30, (((v32 + buf[19]) & 3) - buf[19]));
                break;
            }
            *(_DWORD *)&buf[12] += v32;
          }
        }
        else
        {
          int v38 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(NSString, "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          id v27 = (unsigned char *)objc_claimAutoreleasedReturnValue();
          [v38 handleFailureInFunction:v27 file:@"MSVHasher+Algorithms.h" lineNumber:262 description:@"Cannot append to unknown hasher algorithm"];
        }
        memset(&v181[8], 0, 64);
        *(void *)v181 = *(void *)buf;
        if (*(uint64_t *)buf > 3000)
        {
          if (*(uint64_t *)buf <= 4000)
          {
            if (*(void *)buf == 3001)
            {
              *(void *)&v181[8] = _MSV_XXH_XXH64_digest(&buf[8]);
            }
            else if (*(void *)buf == 4000)
            {
              CC_MD5_Final(&v181[8], (CC_MD5_CTX *)&buf[8]);
            }
          }
          else
          {
            switch(*(void *)buf)
            {
              case 0xFA1:
                CC_SHA1_Final(&v181[8], (CC_SHA1_CTX *)&buf[8]);
                break;
              case 0x10A0:
                CC_SHA256_Final(&v181[8], (CC_SHA256_CTX *)&buf[8]);
                break;
              case 0x11A0:
                CC_SHA512_Final(&v181[8], (CC_SHA512_CTX *)&buf[8]);
                break;
            }
          }
          goto LABEL_80;
        }
        if (*(uint64_t *)buf <= 1999)
        {
          if (*(void *)buf)
          {
            if (*(void *)buf == 1000)
            {
              uint64_t v40 = (*(void *)&buf[8] + *(void *)&buf[16]) ^ __ROR8__(*(void *)&buf[16], 51);
              uint64_t v41 = *(void *)&buf[24] + (*(void *)&buf[32] ^ v170);
              uint64_t v42 = __ROR8__(*(void *)&buf[32] ^ v170, 48);
              uint64_t v43 = (v41 ^ v42) + __ROR8__(*(void *)&buf[8] + *(void *)&buf[16], 32);
              uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
              uint64_t v45 = v41 + v40;
              uint64_t v46 = v45 ^ __ROR8__(v40, 47);
              uint64_t v47 = (v43 ^ v170) + v46;
              uint64_t v48 = v47 ^ __ROR8__(v46, 51);
              uint64_t v49 = (__ROR8__(v45, 32) ^ 0xFFLL) + v44;
              uint64_t v50 = __ROR8__(v44, 48);
              uint64_t v51 = __ROR8__(v47, 32) + (v49 ^ v50);
              uint64_t v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
              uint64_t v53 = v48 + v49;
              uint64_t v54 = v53 ^ __ROR8__(v48, 47);
              uint64_t v55 = v54 + v51;
              uint64_t v56 = v55 ^ __ROR8__(v54, 51);
              uint64_t v57 = __ROR8__(v53, 32) + v52;
              uint64_t v58 = __ROR8__(v52, 48);
              uint64_t v59 = __ROR8__(v55, 32) + (v57 ^ v58);
              uint64_t v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
              uint64_t v61 = v56 + v57;
              uint64_t v62 = v61 ^ __ROR8__(v56, 47);
              uint64_t v63 = v62 + v59;
              uint64_t v64 = v63 ^ __ROR8__(v62, 51);
              uint64_t v65 = __ROR8__(v61, 32) + v60;
              uint64_t v66 = __ROR8__(v60, 48);
              uint64_t v67 = __ROR8__(v63, 32) + (v65 ^ v66);
              uint64_t v68 = v67 ^ __ROR8__(v65 ^ v66, 43);
              uint64_t v69 = v64 + v65;
              *(void *)&buf[8] = v67;
              *(void *)&buf[16] = v69 ^ __ROR8__(v64, 47);
              *(void *)&buf[24] = __ROR8__(v69, 32);
              *(void *)&buf[32] = v68;
              *(void *)&v181[8] = *(void *)&buf[16] ^ v67 ^ *(void *)&buf[24] ^ v68;
            }
          }
          else
          {
            v71 = [MEMORY[0x1E4F28B00] currentHandler];
            id v27 = [NSString stringWithUTF8String:"MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)"];
            [v71 handleFailureInFunction:v27 file:@"MSVHasher+Algorithms.h" lineNumber:156 description:@"Cannot finalize unknown hasher algorithm"];
          }
LABEL_80:
          v182[0] = *(_OWORD *)v181;
          v182[1] = *(_OWORD *)&v181[16];
          v182[2] = *(_OWORD *)&v181[32];
          v182[3] = *(_OWORD *)&v181[48];
          uint64_t v183 = *(void *)&v181[64];
          if (*(uint64_t *)v181 > 3999)
          {
            if (*(uint64_t *)v181 > 4255)
            {
              if (*(void *)v181 == 4256)
              {
                id v27 = (char *)v182 + 8;
                v121 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
                v122 = v121;
                for (uint64_t i = 0; i != 64; i += 2)
                {
                  unsigned int v124 = *v27++;
                  v125 = &v121[i];
                  char *v125 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v124 >> 4];
                  v125[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v124 & 0xF];
                }
                id v94 = [NSString alloc];
                v95 = v122;
                uint64_t v96 = 64;
              }
              else
              {
                if (*(void *)v181 != 4512) {
                  goto LABEL_146;
                }
                id v27 = (char *)v182 + 8;
                v101 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
                v102 = v101;
                for (uint64_t j = 0; j != 128; j += 2)
                {
                  unsigned int v104 = *v27++;
                  v105 = &v101[j];
                  char *v105 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v104 >> 4];
                  v105[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v104 & 0xF];
                }
                id v94 = [NSString alloc];
                v95 = v102;
                uint64_t v96 = 128;
              }
            }
            else if (*(void *)v181 == 4000)
            {
              id v27 = (char *)v182 + 8;
              v112 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
              v113 = v112;
              for (uint64_t k = 0; k != 32; k += 2)
              {
                unsigned int v115 = *v27++;
                v116 = &v112[k];
                char *v116 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v115 >> 4];
                v116[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v115 & 0xF];
              }
              id v94 = [NSString alloc];
              v95 = v113;
              uint64_t v96 = 32;
            }
            else
            {
              if (*(void *)v181 != 4001) {
                goto LABEL_146;
              }
              id v27 = (char *)v182 + 8;
              v89 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
              v90 = v89;
              for (uint64_t m = 0; m != 40; m += 2)
              {
                unsigned int v92 = *v27++;
                v93 = &v89[m];
                char *v93 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v92 >> 4];
                v93[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v92 & 0xF];
              }
              id v94 = [NSString alloc];
              v95 = v90;
              uint64_t v96 = 40;
            }
          }
          else
          {
            if (*(uint64_t *)v181 <= 2999)
            {
              if (*(void *)v181 == 1000)
              {
                uint64_t v106 = *((void *)&v182[0] + 1);
                id v27 = (char *)v185 + 1;
                uint64_t quot = *((void *)&v182[0] + 1);
                do
                {
                  lldiv_t v108 = lldiv(quot, 10);
                  uint64_t quot = v108.quot;
                  if (v108.rem >= 0) {
                    LOBYTE(v109) = v108.rem;
                  }
                  else {
                    uint64_t v109 = -v108.rem;
                  }
                  *(v27 - 2) = v109 + 48;
                  v110 = v27 - 2;
                  --v27;
                }
                while (v108.quot);
                if (v106 < 0)
                {
                  *(v27 - 2) = 45;
                  v27 -= 2;
                  v110 = v27;
                }
                v111 = (__CFString *)CFStringCreateWithBytes(0, v110, (char *)v185 - (char *)v110, 0x8000100u, 0);
                id v15 = v163;
LABEL_125:

                id v36 = [(__CFString *)v111 substringToIndex:7];

                v126 = self->_insertHLSAssetURLStatement;
                v127 = [(_MPServerObjectDatabaseImporter *)self _existingHLSAssetMatchingIdentifier:v165 hashedPersonID:v36];
                id v128 = [v127 playlistURL];
                v129 = v128;
                id v159 = v18;
                if (v128 == v14)
                {

                  if (!v15) {
                    goto LABEL_135;
                  }
                }
                else
                {
                  int v130 = [v128 isEqual:v14];

                  if (!v130)
                  {
LABEL_131:

                    char v23 = v165;
                    goto LABEL_158;
                  }
                  if (!v15)
                  {
LABEL_135:
                    if (v164)
                    {
                      v133 = [v127 keyServerURL];
                      if (v133 == v164)
                      {

                        id v15 = v164;
                      }
                      else
                      {
                        id v15 = v133;
                        int v134 = [v133 isEqual:v164];

                        if (!v134)
                        {
                          int v135 = 0;
LABEL_151:

LABEL_152:
                          id v15 = v163;
                          char v23 = v165;
                          if (v163)
                          {

                            if (v135)
                            {
LABEL_154:
                              v140 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
                              if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 138543362;
                                *(void *)&uint8_t buf[4] = v165;
                                _os_log_impl(&dword_1952E8000, v140, OS_LOG_TYPE_DEBUG, "SOD: importHLSAssetURL: skipping [existing asset already in database] id=%{public}@", buf, 0xCu);
                              }
                              BOOL v35 = 1;
                              id v18 = v159;
                              goto LABEL_171;
                            }
                          }
                          else
                          {

                            if (v135) {
                              goto LABEL_154;
                            }
                          }
LABEL_158:
                          [(MSVSQLStatement *)v126 bindStringValue:v23 toParameterNamed:@"@identifier"];
                          [(MSVSQLStatement *)v126 bindStringValue:v36 toParameterNamed:@"@hashedPersonID"];
                          [v161 timeIntervalSinceReferenceDate];
                          [(MSVSQLStatement *)v126 bindInt64Value:(uint64_t)v141 toParameterNamed:@"@urlExpirationDate"];
                          v142 = [v14 absoluteString];
                          [(MSVSQLStatement *)v126 bindStringValue:v142 toParameterNamed:@"@playlistURL"];

                          uint64_t v143 = [v15 absoluteString];
                          v144 = (void *)v143;
                          if (v143) {
                            v145 = (__CFString *)v143;
                          }
                          else {
                            v145 = &stru_1EE680640;
                          }
                          [(MSVSQLStatement *)v126 bindStringValue:v145 toParameterNamed:@"@keyCertificateURL"];

                          uint64_t v146 = [v164 absoluteString];
                          v147 = (void *)v146;
                          if (v146) {
                            v148 = (__CFString *)v146;
                          }
                          else {
                            v148 = &stru_1EE680640;
                          }
                          [(MSVSQLStatement *)v126 bindStringValue:v148 toParameterNamed:@"@keyServerURL"];

                          [(MSVSQLStatement *)v126 bindInt64Value:v160 toParameterNamed:@"@keyServerAdamID"];
                          [(MSVSQLStatement *)v126 bindStringValue:v162 toParameterNamed:@"@keyServerProtocolType"];
                          [(MSVSQLStatement *)v126 bindBoolValue:v166 toParameterNamed:@"@isiTunesStoreStream"];
                          transaction = self->_transaction;
                          id v168 = 0;
                          [(MSVSQLDatabaseTransaction *)transaction executeStatement:v126 error:&v168];
                          v140 = v168;
                          BOOL v35 = v140 == 0;
                          v150 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
                          v151 = v150;
                          if (v140)
                          {
                            id v18 = v159;
                            char v23 = v165;
                            if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT))
                            {
                              *(_DWORD *)buf = 138543362;
                              *(void *)&uint8_t buf[4] = v140;
                              v152 = "SOD: importHLSAssetURL: failed [SQL error] upsertAssetError=%{public}@";
                              v153 = v151;
                              os_log_type_t v154 = OS_LOG_TYPE_FAULT;
                              uint32_t v155 = 12;
LABEL_169:
                              _os_log_impl(&dword_1952E8000, v153, v154, v152, buf, v155);
                            }
                          }
                          else
                          {
                            id v18 = v159;
                            char v23 = v165;
                            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138543618;
                              *(void *)&uint8_t buf[4] = v165;
                              *(_WORD *)&buf[12] = 2050;
                              *(void *)&buf[14] = v158;
                              v152 = "SOD: importHLSAssetURL: succeeded id=%{public}@ redeliveryId=%{public}lld";
                              v153 = v151;
                              os_log_type_t v154 = OS_LOG_TYPE_DEFAULT;
                              uint32_t v155 = 22;
                              goto LABEL_169;
                            }
                          }

                          [(MSVSQLStatement *)v126 reset];
                          id v15 = v163;
LABEL_171:

                          id v16 = v164;
                          id v19 = v161;
                          id v17 = v162;
                          goto LABEL_172;
                        }
                      }
                    }
                    v136 = [v127 keyServerAdamID];
                    if ([v136 longLongValue] != v160)
                    {

                      int v135 = 0;
                      goto LABEL_150;
                    }
                    id v157 = v14;
                    id v137 = [v127 keyServerProtocolType];
                    v138 = v137;
                    if (v137 == v162)
                    {
                    }
                    else
                    {
                      int v135 = objc_msgSend(v137, "isEqual:");

                      if (!v135) {
                        goto LABEL_149;
                      }
                    }
                    int v135 = [v127 isiTunesStoreStream] ^ v166 ^ 1;
LABEL_149:

                    id v14 = v157;
LABEL_150:
                    if (!v164) {
                      goto LABEL_152;
                    }
                    goto LABEL_151;
                  }
                }
                v131 = [v127 keyCertificateURL];
                if (v131 == v15)
                {

                  id v27 = v15;
                }
                else
                {
                  id v27 = v131;
                  char v132 = [v131 isEqual:v15];

                  if ((v132 & 1) == 0)
                  {

                    goto LABEL_131;
                  }
                }
                goto LABEL_135;
              }
              if (*(void *)v181 == 2000)
              {
                uint64_t v84 = DWORD2(v182[0]);
                id v27 = v185;
                v85 = (const UInt8 *)v185;
                do
                {
                  ldiv_t v86 = ldiv(v84, 10);
                  uint64_t v84 = v86.quot;
                  if (v86.rem >= 0) {
                    LOBYTE(v87) = v86.rem;
                  }
                  else {
                    uint64_t v87 = -v86.rem;
                  }
                  *--v85 = v87 + 48;
                }
                while (v86.quot);
                CFStringRef v88 = CFStringCreateWithBytes(0, v85, (char *)v185 - (char *)v85, 0x8000100u, 0);
                goto LABEL_124;
              }
LABEL_146:
              v139 = [MEMORY[0x1E4F28B00] currentHandler];
              id v27 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
              [v139 handleFailureInFunction:v27 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

              v111 = &stru_1EE680640;
              goto LABEL_125;
            }
            if (*(void *)v181 == 3000)
            {
              LODWORD(v184[0]) = bswap32(DWORD2(v182[0]));
              v117 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v118 = 0;
              v119 = v117 + 1;
              do
              {
                unint64_t v120 = *((unsigned __int8 *)v184 + v118);
                *(v119 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v120 >> 4];
                unsigned char *v119 = MSVFastHexStringFromBytes_hexCharacters_53728[v120 & 0xF];
                v119 += 2;
                ++v118;
              }
              while (v118 != 4);
              id v94 = [NSString alloc];
              v95 = v117;
              uint64_t v96 = 8;
            }
            else
            {
              if (*(void *)v181 != 3001) {
                goto LABEL_146;
              }
              v184[0] = bswap64(*((unint64_t *)&v182[0] + 1));
              v97 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
              uint64_t v98 = 0;
              v99 = v97 + 1;
              do
              {
                unint64_t v100 = *((unsigned __int8 *)v184 + v98);
                *(v99 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v100 >> 4];
                unsigned char *v99 = MSVFastHexStringFromBytes_hexCharacters_53728[v100 & 0xF];
                v99 += 2;
                ++v98;
              }
              while (v98 != 8);
              id v94 = [NSString alloc];
              v95 = v97;
              uint64_t v96 = 16;
            }
          }
          CFStringRef v88 = (CFStringRef)[v94 initWithBytesNoCopy:v95 length:v96 encoding:4 freeWhenDone:1];
LABEL_124:
          v111 = (__CFString *)v88;
          goto LABEL_125;
        }
        if (*(void *)buf != 2000)
        {
          if (*(void *)buf != 3000) {
            goto LABEL_80;
          }
          if (*(_DWORD *)&buf[12]) {
            int v70 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1956897E0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1956897D0)));
          }
          else {
            int v70 = *(_DWORD *)&buf[24] + 374761393;
          }
          unsigned int v73 = *(_DWORD *)&buf[8] + v70;
          v74 = &buf[32];
          unint64_t v75 = BYTE8(v170) & 0xF;
          if (v75 >= 4)
          {
            do
            {
              int v76 = *(_DWORD *)v74;
              v74 += 4;
              HIDWORD(v77) = v73 - 1028477379 * v76;
              LODWORD(v77) = HIDWORD(v77);
              unsigned int v73 = 668265263 * (v77 >> 15);
              v75 -= 4;
            }
            while (v75 > 3);
          }
          for (; v75; --v75)
          {
            int v78 = *v74++;
            HIDWORD(v79) = v73 + 374761393 * v78;
            LODWORD(v79) = HIDWORD(v79);
            unsigned int v73 = -1640531535 * (v79 >> 21);
          }
          unsigned int v80 = (-2048144777 * (v73 ^ (v73 >> 15))) ^ ((-2048144777 * (v73 ^ (v73 >> 15))) >> 13);
          unsigned int v81 = (-1028477379 * v80) ^ ((-1028477379 * v80) >> 16);
          goto LABEL_79;
        }
        switch(buf[19])
        {
          case 1:
            int v72 = buf[16];
            break;
          case 2:
            int v72 = *(unsigned __int16 *)&buf[16];
            break;
          case 3:
            int v72 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
            break;
          default:
            unsigned int v82 = *(_DWORD *)&buf[8];
            goto LABEL_78;
        }
        unsigned int v82 = (461845907 * ((380141568 * v72) | ((-862048943 * v72) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_78:
        unsigned int v83 = -2048144789 * (v82 ^ *(_DWORD *)&buf[12] ^ ((v82 ^ *(_DWORD *)&buf[12]) >> 16));
        unsigned int v81 = (-1028477387 * (v83 ^ (v83 >> 13))) ^ ((-1028477387 * (v83 ^ (v83 >> 13))) >> 16);
        *(_DWORD *)&buf[8] = v81;
LABEL_79:
        *(_DWORD *)&v181[8] = v81;
        goto LABEL_80;
      }
      id v36 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:
        BOOL v35 = 0;
LABEL_172:

        goto LABEL_173;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v23;
      uint64_t v37 = "SOD: importHLSAssetURL: skipping [no key server URLs for non-store stream] id=%{public}@";
    }
    else
    {
      id v36 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v165;
      uint64_t v37 = "SOD: importHLSAssetURL: skipping [no keyServerAdamID (redeliveryId or adamID)] id=%{public}@";
    }
    _os_log_impl(&dword_1952E8000, v36, OS_LOG_TYPE_DEBUG, v37, buf, 0xCu);
    goto LABEL_21;
  }
  BOOL v35 = 0;
LABEL_174:

  return v35;
}

- (BOOL)importAssetURL:(id)a3 forIdentifiers:(id)a4 flavor:(int64_t)a5 expirationDate:(id)a6
{
  v118[0] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v10 personalizedStore];
  id v13 = [v12 personID];
  id v14 = [v10 preferredStoreStringIdentifierForPersonID:v13];

  if (v14)
  {
    id v96 = v10;
    id v97 = v11;
    id v15 = [v10 personalizedStore];
    id v16 = [v15 personID];

    if (!v16)
    {
      v93 = [MEMORY[0x1E4F28B00] currentHandler];
      [v93 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:987 description:@"Cannot import an asset without a personID"];
    }
    id v17 = v16;
    long long v113 = 0u;
    long long v112 = 0u;
    long long v111 = 0u;
    long long v110 = 0u;
    long long v109 = 0u;
    long long v108 = 0u;
    long long v107 = 0u;
    long long v106 = 0u;
    long long v105 = 0u;
    long long v104 = 0u;
    long long v103 = 0u;
    memset(&buf[8], 0, 32);
    *(void *)buf = 4001;
    CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
    id v18 = v17;
    CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], (const void *)[v18 UTF8String], objc_msgSend(v18, "length"));

    memset(&v114[8], 0, 64);
    *(void *)v114 = 4001;
    CC_SHA1_Final(&v114[8], (CC_SHA1_CTX *)&buf[8]);
    v115[0] = *(_OWORD *)v114;
    v115[1] = *(_OWORD *)&v114[16];
    v115[2] = *(_OWORD *)&v114[32];
    v115[3] = *(_OWORD *)&v114[48];
    uint64_t v116 = *(void *)&v114[64];
    if (*(uint64_t *)v114 > 3999)
    {
      if (*(uint64_t *)v114 > 4255)
      {
        if (*(void *)v114 == 4256)
        {
          uint64_t v61 = (unsigned __int8 *)v115 + 8;
          uint64_t v62 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v63 = v62;
          for (uint64_t i = 0; i != 64; i += 2)
          {
            unsigned int v65 = *v61++;
            uint64_t v66 = &v62[i];
            *uint64_t v66 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v65 >> 4];
            v66[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v65 & 0xF];
          }
          id v31 = [NSString alloc];
          int v32 = v63;
          uint64_t v33 = 64;
        }
        else
        {
          if (*(void *)v114 != 4512) {
            goto LABEL_71;
          }
          int v38 = (unsigned __int8 *)v115 + 8;
          __int16 v39 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v40 = v39;
          for (uint64_t j = 0; j != 128; j += 2)
          {
            unsigned int v42 = *v38++;
            uint64_t v43 = &v39[j];
            *uint64_t v43 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v42 >> 4];
            v43[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v42 & 0xF];
          }
          id v31 = [NSString alloc];
          int v32 = v40;
          uint64_t v33 = 128;
        }
      }
      else if (*(void *)v114 == 4000)
      {
        uint64_t v51 = (unsigned __int8 *)v115 + 8;
        uint64_t v52 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v53 = v52;
        for (uint64_t k = 0; k != 32; k += 2)
        {
          unsigned int v55 = *v51++;
          uint64_t v56 = &v52[k];
          *uint64_t v56 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v55 >> 4];
          v56[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v55 & 0xF];
        }
        id v31 = [NSString alloc];
        int v32 = v53;
        uint64_t v33 = 32;
      }
      else
      {
        if (*(void *)v114 != 4001) {
          goto LABEL_71;
        }
        uint64_t v25 = (unsigned __int8 *)v115 + 8;
        uint64_t v26 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        id v27 = v26;
        for (uint64_t m = 0; m != 40; m += 2)
        {
          unsigned int v29 = *v25++;
          uint64_t v30 = &v26[m];
          *uint64_t v30 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v29 & 0xF];
        }
        id v31 = [NSString alloc];
        int v32 = v27;
        uint64_t v33 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v114 <= 2999)
      {
        if (*(void *)v114 == 1000)
        {
          uint64_t v44 = *((void *)&v115[0] + 1);
          uint64_t v45 = (char *)v118 + 1;
          uint64_t quot = *((void *)&v115[0] + 1);
          do
          {
            lldiv_t v47 = lldiv(quot, 10);
            uint64_t quot = v47.quot;
            if (v47.rem >= 0) {
              LOBYTE(v48) = v47.rem;
            }
            else {
              uint64_t v48 = -v47.rem;
            }
            *(v45 - 2) = v48 + 48;
            uint64_t v49 = (const UInt8 *)(v45 - 2);
            --v45;
          }
          while (v47.quot);
          if (v44 < 0)
          {
            *(v45 - 2) = 45;
            uint64_t v49 = (const UInt8 *)(v45 - 2);
          }
          uint64_t v50 = (__CFString *)CFStringCreateWithBytes(0, v49, (char *)v118 - (char *)v49, 0x8000100u, 0);
          id v11 = v97;
LABEL_51:

          uint64_t v67 = [(__CFString *)v50 substringToIndex:7];

          uint64_t v68 = self->_insertAssetURLStatement;
          int64_t v69 = a5;
          int v70 = [(_MPServerObjectDatabaseImporter *)self _existingAssetMatchingIdentifier:v14 hashedPersonID:v67 flavor:a5];
          uint64_t v98 = v14;
          if (v70)
          {
            v71 = [v9 host];
            int v72 = [v70 url];
            unsigned int v73 = [v72 host];
            if ([v71 isEqual:v73])
            {
              id v94 = v67;
              id v95 = v18;
              v74 = [v9 path];
              [v70 url];
              v76 = id v75 = v9;
              unint64_t v77 = [v76 path];
              int v78 = [v74 isEqual:v77];

              if (!v78)
              {
                id v9 = v75;
                id v11 = v97;
                id v14 = v98;
                uint64_t v67 = v94;
                id v18 = v95;
                int64_t v69 = a5;
                goto LABEL_61;
              }
              unint64_t v79 = [v70 url];
              char v80 = [v79 isEqual:v75];

              unsigned int v81 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
              BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
              id v9 = v75;
              if (v80)
              {
                id v10 = v96;
                uint64_t v67 = v94;
                if (v82)
                {
                  id v11 = v97;
                  id v18 = v95;
                  if ((unint64_t)(a5 - 1) > 3) {
                    unsigned int v83 = @"unknown";
                  }
                  else {
                    unsigned int v83 = off_1E57F5470[a5 - 1];
                  }
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v98;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v83;
                  _os_log_impl(&dword_1952E8000, v81, OS_LOG_TYPE_DEBUG, "SOD: importAssetURL: skipping [existing asset already in database] id=%{public}@ / flavor=%{public}@", buf, 0x16u);
                  BOOL v19 = 1;
                }
                else
                {
                  BOOL v19 = 1;
                  id v11 = v97;
                  id v18 = v95;
                }
LABEL_69:

                id v14 = v98;
                goto LABEL_70;
              }
              int64_t v69 = a5;
              uint64_t v67 = v94;
              if (v82)
              {
                if ((unint64_t)(a5 - 1) > 3) {
                  unsigned int v92 = @"unknown";
                }
                else {
                  unsigned int v92 = off_1E57F5470[a5 - 1];
                }
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v98;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v92;
                _os_log_impl(&dword_1952E8000, v81, OS_LOG_TYPE_DEBUG, "SOD: importAssetURL: updating URL [existing asset already in database] id=%{public}@ / flavor=%{public}@", buf, 0x16u);
              }

              v71 = v68;
              uint64_t v68 = self->_updateAssetURLStatement;
              id v11 = v97;
              id v18 = v95;
            }
            else
            {
            }
            id v14 = v98;
          }
LABEL_61:
          [(MSVSQLStatement *)v68 bindStringValue:v14 toParameterNamed:@"@identifier"];
          [(MSVSQLStatement *)v68 bindStringValue:v67 toParameterNamed:@"@hashedPersonID"];
          if ((unint64_t)(v69 - 1) > 3) {
            uint64_t v84 = @"unknown";
          }
          else {
            uint64_t v84 = off_1E57F5490[v69 - 1];
          }
          [(MSVSQLStatement *)v68 bindStringValue:v84 toParameterNamed:@"@flavor"];
          v85 = [v9 absoluteString];
          [(MSVSQLStatement *)v68 bindStringValue:v85 toParameterNamed:@"@url"];

          [v11 timeIntervalSinceReferenceDate];
          [(MSVSQLStatement *)v68 bindInt64Value:(uint64_t)v86 toParameterNamed:@"@urlExpirationDate"];
          transaction = self->_transaction;
          id v101 = 0;
          [(MSVSQLDatabaseTransaction *)transaction executeStatement:v68 error:&v101];
          unsigned int v81 = v101;
          BOOL v19 = v81 == 0;
          id v10 = v96;
          if (v81)
          {
            CFStringRef v88 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v81;
              _os_log_impl(&dword_1952E8000, v88, OS_LOG_TYPE_FAULT, "SOD: importAssetURL: failed [SQL error] upsertAssetError=%{public}@", buf, 0xCu);
            }
          }
          [(MSVSQLStatement *)v68 reset];
          goto LABEL_69;
        }
        if (*(void *)v114 == 2000)
        {
          uint64_t v20 = DWORD2(v115[0]);
          BOOL v21 = (const UInt8 *)v118;
          do
          {
            ldiv_t v22 = ldiv(v20, 10);
            uint64_t v20 = v22.quot;
            if (v22.rem >= 0) {
              LOBYTE(v23) = v22.rem;
            }
            else {
              uint64_t v23 = -v22.rem;
            }
            *--BOOL v21 = v23 + 48;
          }
          while (v22.quot);
          CFStringRef v24 = CFStringCreateWithBytes(0, v21, (char *)v118 - (char *)v21, 0x8000100u, 0);
          goto LABEL_50;
        }
LABEL_71:
        v90 = [MEMORY[0x1E4F28B00] currentHandler];
        v91 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
        [v90 handleFailureInFunction:v91 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

        uint64_t v50 = &stru_1EE680640;
        goto LABEL_51;
      }
      if (*(void *)v114 == 3000)
      {
        LODWORD(v117[0]) = bswap32(DWORD2(v115[0]));
        uint64_t v57 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v58 = 0;
        uint64_t v59 = v57 + 1;
        do
        {
          unint64_t v60 = *((unsigned __int8 *)v117 + v58);
          *(v59 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v60 >> 4];
          *uint64_t v59 = MSVFastHexStringFromBytes_hexCharacters_53728[v60 & 0xF];
          v59 += 2;
          ++v58;
        }
        while (v58 != 4);
        id v31 = [NSString alloc];
        int v32 = v57;
        uint64_t v33 = 8;
      }
      else
      {
        if (*(void *)v114 != 3001) {
          goto LABEL_71;
        }
        v117[0] = bswap64(*((unint64_t *)&v115[0] + 1));
        id v34 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v35 = 0;
        id v36 = v34 + 1;
        do
        {
          unint64_t v37 = *((unsigned __int8 *)v117 + v35);
          *(v36 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v37 >> 4];
          unsigned char *v36 = MSVFastHexStringFromBytes_hexCharacters_53728[v37 & 0xF];
          v36 += 2;
          ++v35;
        }
        while (v35 != 8);
        id v31 = [NSString alloc];
        int v32 = v34;
        uint64_t v33 = 16;
      }
    }
    CFStringRef v24 = (CFStringRef)[v31 initWithBytesNoCopy:v32 length:v33 encoding:4 freeWhenDone:1];
LABEL_50:
    uint64_t v50 = (__CFString *)v24;
    goto LABEL_51;
  }
  BOOL v19 = 0;
LABEL_70:

  return v19;
}

- (BOOL)importObject:(id)a3 type:(id)a4 identifiers:(id)a5 source:(int64_t)a6 expiration:(id)a7
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v14)
  {
    uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2, self, @"MPServerObjectDatabase.m", 926, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  id v17 = [v15 personalizedStore];
  id v18 = [v17 personID];

  if (!v18)
  {
    uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:self file:@"MPServerObjectDatabase.m" lineNumber:928 description:@"Cannot import an object without a personID"];
  }
  BOOL v19 = [v15 preferredStoreStringIdentifierForPersonID:v18];
  if (v19)
  {
    [(MSVSQLStatement *)self->_selectExistingObjectStatement bindInt64Value:a6 toParameterNamed:@"@source"];
    [(MSVSQLStatement *)self->_selectExistingObjectStatement bindStringValue:v19 toParameterNamed:@"@identifier"];
    [(MSVSQLStatement *)self->_selectExistingObjectStatement bindStringValue:v18 toParameterNamed:@"@personID"];
    [(MSVSQLDatabaseTransaction *)self->_transaction resultsForStatement:self->_selectExistingObjectStatement];
    unsigned int v55 = v64 = 0;
    uint64_t v20 = [v55 nextObjectWithError:&v64];
    unint64_t v60 = (__CFString *)v64;
    if (v60)
    {
      BOOL v21 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v66 = v60;
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_FAULT, "SOD: importObject: stepError: %{public}@", buf, 0xCu);
      }
    }
    id v56 = v13;
    id v22 = v13;
    uint64_t v23 = v22;
    id v57 = v14;
    if (v20)
    {
      id v63 = 0;
      uint64_t v53 = [v20 jsonValueAtColumnIndex:0 error:&v63];
      id v52 = v63;
      objc_msgSend(v53, "mp_deepMerge:", v22);
      v24 = uint64_t v58 = v18;
      uint64_t v25 = NSNumber;
      [v24 objectForKeyedSubscript:@"_MPSOD_mergeCount"];
      uint64_t v26 = v22;
      int64_t v27 = a6;
      id v28 = v16;
      uint64_t v30 = v29 = v15;
      id v31 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v30, "integerValue") + 1);
      [v24 setObject:v31 forKeyedSubscript:@"_MPSOD_mergeCount"];

      id v15 = v29;
      id v16 = v28;
      a6 = v27;
      id v22 = v26;
      uint64_t v23 = (void *)[v24 copy];

      id v14 = v57;
      id v18 = v58;
    }
    uint64_t v54 = v20;
    [(MSVSQLStatement *)self->_selectExistingObjectStatement reset];
    uint64_t v59 = v19;
    [(MSVSQLStatement *)self->_insertObjectStatement bindStringValue:v19 toParameterNamed:@"@identifier"];
    [(MSVSQLStatement *)self->_insertObjectStatement bindStringValue:v18 toParameterNamed:@"@personID"];
    [(MSVSQLStatement *)self->_insertObjectStatement bindInt64Value:a6 toParameterNamed:@"@source"];
    [(MSVSQLStatement *)self->_insertObjectStatement bindStringValue:v14 toParameterNamed:@"@type"];
    insertObjectStatement = self->_insertObjectStatement;
    [v16 timeIntervalSinceReferenceDate];
    [(MSVSQLStatement *)insertObjectStatement bindInt64Value:(uint64_t)v33 toParameterNamed:@"@expirationDate"];
    id v34 = self->_insertObjectStatement;
    id v62 = 0;
    [(MSVSQLStatement *)v34 bindJSONValue:v23 toParameterNamed:@"@payload" error:&v62];
    uint64_t v35 = (__CFString *)v62;
    if (v35)
    {
      id v36 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v66 = v35;
        __int16 v67 = 2114;
        id v68 = v22;
        _os_log_impl(&dword_1952E8000, v36, OS_LOG_TYPE_FAULT, "SOD: importObject: jsonError: %{public}@ payload=%{public}@", buf, 0x16u);
      }

      [(MSVSQLStatement *)self->_insertObjectStatement reset];
      BOOL v37 = 0;
      goto LABEL_27;
    }
    unint64_t v38 = a6;
    transaction = self->_transaction;
    uint64_t v40 = self->_insertObjectStatement;
    id v61 = 0;
    [(MSVSQLDatabaseTransaction *)transaction executeStatement:v40 error:&v61];
    uint64_t v41 = (__CFString *)v61;
    BOOL v37 = v41 == 0;
    unsigned int v42 = os_log_create("com.apple.amp.mediaplayer", "ServerObjects");
    uint64_t v43 = v42;
    if (v41)
    {
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v66 = v41;
        uint64_t v44 = "SOD: insertObjectError: %{public}@";
        uint64_t v45 = v43;
        os_log_type_t v46 = OS_LOG_TYPE_FAULT;
        uint32_t v47 = 12;
LABEL_25:
        _os_log_impl(&dword_1952E8000, v45, v46, v44, buf, v47);
      }
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      if (v38 > 2) {
        uint64_t v48 = @"UNDEF";
      }
      else {
        uint64_t v48 = off_1E57F5458[v38];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v66 = v48;
      __int16 v67 = 2114;
      id v68 = v59;
      __int16 v69 = 2114;
      id v70 = v57;
      uint64_t v44 = "SOD: importObject: imported object [success] source=%{public}@ identifier=%{public}@ type=%{public}@";
      uint64_t v45 = v43;
      os_log_type_t v46 = OS_LOG_TYPE_INFO;
      uint32_t v47 = 32;
      goto LABEL_25;
    }

    [(MSVSQLStatement *)self->_insertObjectStatement reset];
    id v14 = v57;
LABEL_27:
    BOOL v19 = v59;

    id v13 = v56;
    goto LABEL_28;
  }
  BOOL v37 = 0;
LABEL_28:

  return v37;
}

- (void)dealloc
{
  [(MSVSQLStatement *)self->_selectExistingObjectStatement invalidate];
  [(MSVSQLStatement *)self->_insertObjectStatement invalidate];
  [(MSVSQLStatement *)self->_insertObjectRelationshipStatement invalidate];
  [(MSVSQLStatement *)self->_insertAssetURLStatement invalidate];
  [(MSVSQLStatement *)self->_insertHLSAssetURLStatement invalidate];
  [(MSVSQLStatement *)self->_removeRelationshipsStatement invalidate];
  [(MSVSQLStatement *)self->_updateMiniSINFStatement invalidate];
  [(MSVSQLStatement *)self->_updateAssetURLStatement invalidate];
  [(MSVSQLStatement *)self->_updateSINFStatement invalidate];
  [(MSVSQLDatabaseTransaction *)self->_transaction commit];
  v3.receiver = self;
  v3.super_class = (Class)_MPServerObjectDatabaseImporter;
  [(_MPServerObjectDatabaseImporter *)&v3 dealloc];
}

@end