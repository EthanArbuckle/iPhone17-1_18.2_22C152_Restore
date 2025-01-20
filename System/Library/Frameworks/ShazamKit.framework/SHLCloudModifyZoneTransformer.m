@interface SHLCloudModifyZoneTransformer
- (CKModifyRecordZonesOperation)modifyRecordZonesOperation;
- (SHLCloudModifyZoneTransformer)initWithConfiguration:(id)a3;
- (SHLSyncSessionConfiguration)configuration;
- (id)cloudBackedOperationForZonesToSave:(id)a3 container:(id)a4;
- (id)recordZonesFromCloudBackedZones:(id)a3;
- (void)setModifyRecordZonesOperation:(id)a3;
@end

@implementation SHLCloudModifyZoneTransformer

- (SHLCloudModifyZoneTransformer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHLCloudModifyZoneTransformer;
  v6 = [(SHLCloudModifyZoneTransformer *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = (CKModifyRecordZonesOperation *)objc_alloc_init((Class)CKModifyRecordZonesOperation);
    modifyRecordZonesOperation = v7->_modifyRecordZonesOperation;
    v7->_modifyRecordZonesOperation = v8;
  }
  return v7;
}

- (id)cloudBackedOperationForZonesToSave:(id)a3 container:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 container];
  v9 = [v8 privateCloudDatabase];
  v10 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  [v10 setDatabase:v9];

  objc_super v11 = [(SHLCloudModifyZoneTransformer *)self recordZonesFromCloudBackedZones:v7];

  v12 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  [v12 setRecordZonesToSave:v11];

  v13 = [SHLCloudLibraryCache alloc];
  v14 = [(SHLCloudModifyZoneTransformer *)self configuration];
  v15 = [v14 callingProcessIdentifier];
  v16 = [v6 container];

  v17 = [v16 containerIdentifier];
  v18 = [(SHLCloudModifyZoneTransformer *)self configuration];
  v19 = [v18 sessionIdentifier];
  v20 = [(SHLCloudLibraryCache *)v13 initWithCallingProcessIdentifier:v15 containerIdentifier:v17 transactionIdentifier:v19];

  v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  v37 = sub_1000429B8;
  v38 = &unk_100075F48;
  v39 = v20;
  v21 = v20;
  v22 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  [v22 setModifyRecordZonesCompletionBlock:&v35];

  id v23 = objc_alloc_init((Class)CKOperationGroup);
  [v23 setExpectedSendSize:1];
  v24 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  v25 = [v24 recordZonesToSave];
  v26 = (char *)[v25 count];
  v27 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  v28 = [v27 recordZoneIDsToDelete];
  objc_msgSend(v23, "setQuantity:", &v26[(void)objc_msgSend(v28, "count")]);

  v29 = +[NSString stringWithFormat:@"%@", @"ModifyZones", v35, v36, v37, v38];
  [v23 setName:v29];

  v30 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  [v30 setGroup:v23];

  v31 = [SHLCloudBackedOperation alloc];
  v32 = [(SHLCloudModifyZoneTransformer *)self modifyRecordZonesOperation];
  v33 = [(SHLCloudBackedOperation *)v31 initWithOperation:v32];

  return v33;
}

- (id)recordZonesFromCloudBackedZones:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "zone", (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

- (SHLSyncSessionConfiguration)configuration
{
  return self->_configuration;
}

- (CKModifyRecordZonesOperation)modifyRecordZonesOperation
{
  return self->_modifyRecordZonesOperation;
}

- (void)setModifyRecordZonesOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifyRecordZonesOperation, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end