@interface SHLCloudModifyTaskTransformer
- (CKModifyRecordsOperation)modifyRecordsOperation;
- (SHLCloudModifyTaskTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedOperationFromModifyTask:(id)a3 container:(id)a4;
- (id)recordIDsToDeleteFromModifyTask:(id)a3;
- (id)recordsToSaveFromModifyTask:(id)a3 container:(id)a4;
- (void)setModifyRecordsOperation:(id)a3;
@end

@implementation SHLCloudModifyTaskTransformer

- (SHLCloudModifyTaskTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLCloudModifyTaskTransformer;
  v6 = [(SHLCloudModifyTaskTransformer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (CKModifyRecordsOperation *)objc_alloc_init((Class)CKModifyRecordsOperation);
    modifyRecordsOperation = v7->_modifyRecordsOperation;
    v7->_modifyRecordsOperation = v8;

    [(CKModifyRecordsOperation *)v7->_modifyRecordsOperation setSavePolicy:1];
  }

  return v7;
}

- (id)cloudBackedOperationFromModifyTask:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 container];
  v9 = [v8 privateCloudDatabase];
  v10 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v10 setDatabase:v9];

  objc_super v11 = [(SHLCloudModifyTaskTransformer *)self recordsToSaveFromModifyTask:v6 container:v7];
  v12 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v12 setRecordsToSave:v11];

  v13 = [(SHLCloudModifyTaskTransformer *)self recordIDsToDeleteFromModifyTask:v6];
  v14 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v14 setRecordIDsToDelete:v13];

  v15 = [v6 progress];
  v16 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  v17 = [v16 recordsToSave];
  objc_msgSend(v15, "setTotalUnitCount:", objc_msgSend(v17, "count"));

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10002E9A8;
  v52[3] = &unk_1000759F0;
  id v18 = v6;
  id v53 = v18;
  v19 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v19 setPerRecordSaveBlock:v52];

  v20 = [SHLCloudLibraryCache alloc];
  v21 = [(SHLCloudModifyTaskTransformer *)self configuration];
  v22 = [v21 callingProcessIdentifier];
  v23 = [v7 container];
  v24 = [v23 containerIdentifier];
  v25 = [(SHLCloudModifyTaskTransformer *)self configuration];
  v26 = [v25 sessionIdentifier];
  v27 = [(SHLCloudLibraryCache *)v20 initWithCallingProcessIdentifier:v22 containerIdentifier:v24 transactionIdentifier:v26];

  v45 = _NSConcreteStackBlock;
  uint64_t v46 = 3221225472;
  v47 = sub_10002EA18;
  v48 = &unk_100075A18;
  v49 = v27;
  id v50 = v18;
  id v51 = v7;
  id v28 = v7;
  id v29 = v18;
  v30 = v27;
  v31 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v31 setModifyRecordsCompletionBlock:&v45];

  id v32 = objc_alloc_init((Class)CKOperationGroup);
  [v32 setExpectedSendSize:1];
  v33 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  v34 = [v33 recordsToSave];
  v35 = (char *)[v34 count];
  v36 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  v37 = [v36 recordIDsToDelete];
  objc_msgSend(v32, "setQuantity:", &v35[(void)objc_msgSend(v37, "count")]);

  v38 = [v29 syncStartCondition];
  v39 = +[NSString stringWithFormat:@"%@_%@", v38, @"ModifyRecords", v45, v46, v47, v48];
  [v32 setName:v39];

  v40 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  [v40 setGroup:v32];

  v41 = [SHLCloudBackedOperation alloc];
  v42 = [(SHLCloudModifyTaskTransformer *)self modifyRecordsOperation];
  v43 = [(SHLCloudBackedOperation *)v41 initWithOperation:v42];

  return v43;
}

- (id)recordsToSaveFromModifyTask:(id)a3 container:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tracksToModify];
  v8 = [v7 insertions];
  v9 = (char *)[v8 count];
  v10 = [v5 groupsToModify];
  objc_super v11 = [v10 insertions];
  v12 = &v9[(void)[v11 count]];

  v13 = +[NSMutableArray arrayWithCapacity:v12];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v14 = [v5 groupsToModify];
  v15 = [v14 insertions];

  id v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = +[SHLCloudGroupTransformer cloudBackedItemFromLibraryGroup:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        v21 = v20;
        if (v20)
        {
          v22 = [v20 record];
          [v13 addObject:v22];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v23 = objc_msgSend(v5, "tracksToModify", 0);
  v24 = [v23 insertions];

  id v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = +[SHLCloudTrackTransformer cloudBackedItemFromLibraryTrack:usingEncryption:](SHLCloudTrackTransformer, "cloudBackedItemFromLibraryTrack:usingEncryption:", *(void *)(*((void *)&v34 + 1) + 8 * (void)j), [v6 isEncrypted]);
        v30 = v29;
        if (v29)
        {
          v31 = [v29 record];
          [v13 addObject:v31];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v26);
  }

  id v32 = [v13 copy];

  return v32;
}

- (id)recordIDsToDeleteFromModifyTask:(id)a3
{
  id v3 = a3;
  v4 = [v3 tracksToModify];
  id v5 = [v4 deletions];
  id v6 = (char *)[v5 count];
  id v7 = [v3 groupsToModify];
  v8 = [v7 deletions];
  v9 = &v6[(void)[v8 count]];

  v10 = +[NSMutableArray arrayWithCapacity:v9];
  objc_super v11 = +[SHLCloudContext sharedContext];
  v12 = [v11 shazamLibraryZone];
  v13 = [v12 zoneID];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v14 = [v3 groupsToModify];
  v15 = [v14 deletions];

  id v16 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [objc_alloc((Class)CKRecordID) initWithRecordName:*(void *)(*((void *)&v34 + 1) + 8 * i) zoneID:v13];
        [v10 addObject:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v17);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v21 = objc_msgSend(v3, "tracksToModify", 0);
  v22 = [v21 deletions];

  id v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [objc_alloc((Class)CKRecordID) initWithRecordName:*(void *)(*((void *)&v30 + 1) + 8 * (void)j) zoneID:v13];
        [v10 addObject:v27];
      }
      id v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v24);
  }

  id v28 = [v10 copy];

  return v28;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return self->_modifyRecordsOperation;
}

- (void)setModifyRecordsOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifyRecordsOperation, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end