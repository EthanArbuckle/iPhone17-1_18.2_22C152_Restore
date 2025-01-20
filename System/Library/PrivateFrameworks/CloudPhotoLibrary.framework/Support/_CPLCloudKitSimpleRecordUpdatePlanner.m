@interface _CPLCloudKitSimpleRecordUpdatePlanner
- (CPLCKRecordPropertyMapping)propertyMapping;
- (CPLCloudKitTransportTask)task;
- (CPLCloudKitZoneIdentification)destinationZoneIdentification;
- (CPLCloudKitZoneIdentification)sharedZoneIdentification;
- (CPLFingerprintContext)fingerprintContext;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)privateRecordIDs;
- (NSArray)scopedIdentifiers;
- (NSArray)sharedRecordIDs;
- (NSDictionary)sharedRecordIDsToMissingPrivateRecordIDs;
- (_CPLCloudKitSimpleRecordUpdatePlanner)initWithTask:(id)a3 scopedIdentifiers:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 propertyMapping:(id)a8 fingerprintContext:(id)a9;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
@end

@implementation _CPLCloudKitSimpleRecordUpdatePlanner

- (_CPLCloudKitSimpleRecordUpdatePlanner)initWithTask:(id)a3 scopedIdentifiers:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 propertyMapping:(id)a8 fingerprintContext:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v63 = a6;
  id v62 = a7;
  id v61 = a8;
  id v60 = a9;
  v75.receiver = self;
  v75.super_class = (Class)_CPLCloudKitSimpleRecordUpdatePlanner;
  v19 = [(_CPLCloudKitSimpleRecordUpdatePlanner *)&v75 init];
  v20 = v19;
  if (v19)
  {
    id v56 = v18;
    id v57 = v16;
    objc_storeStrong((id *)&v19->_task, a3);
    v21 = (NSArray *)[v17 copy];
    scopedIdentifiers = v20->_scopedIdentifiers;
    v20->_scopedIdentifiers = v21;

    p_destinationZoneIdentification = (void **)&v20->_destinationZoneIdentification;
    objc_storeStrong((id *)&v20->_destinationZoneIdentification, a5);
    p_sharedZoneIdentification = (void **)&v20->_sharedZoneIdentification;
    objc_storeStrong((id *)&v20->_sharedZoneIdentification, a6);
    p_targetMapping = (id *)&v20->_targetMapping;
    objc_storeStrong((id *)&v20->_targetMapping, a7);
    objc_storeStrong((id *)&v20->_propertyMapping, a8);
    objc_storeStrong((id *)&v20->_fingerprintContext, a9);
    id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v17, "count"));
    id v67 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
    uint64_t v59 = (uint64_t)v20;
    if (v20->_sharedZoneIdentification)
    {
      id v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2 * (void)objc_msgSend(v17, "count"));
      id v66 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
      id v64 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v17, "count"));
    }
    else
    {
      id v66 = 0;
      id v64 = 0;
      id v24 = 0;
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v55 = v17;
    id obj = v17;
    id v25 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v72;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v72 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          v30 = objc_msgSend(*p_targetMapping, "targetForRecordWithScopedIdentifier:", v29, v55);
          if (!v30) {
            sub_1001CD794(v29, (uint64_t)a2, v59);
          }
          v31 = v30;
          v32 = *p_destinationZoneIdentification;
          v33 = [v30 scopedIdentifier];
          v34 = [v33 identifier];
          v35 = [v32 recordIDWithRecordName:v34];

          [v23 setObject:v29 forKeyedSubscript:v35];
          v36 = *p_sharedZoneIdentification;
          if (!*p_sharedZoneIdentification)
          {
            [v67 addObject:v35];
            goto LABEL_19;
          }
          v37 = [v31 otherScopedIdentifier];
          v38 = [v37 identifier];
          v39 = [v36 recordIDWithRecordName:v38];

          v40 = [v31 otherScopedIdentifier];
          [v23 setObject:v40 forKeyedSubscript:v39];

          v41 = [v31 scopedIdentifier];
          [v24 setObject:v41 forKeyedSubscript:v35];

          v42 = [v31 scopedIdentifier];
          [v24 setObject:v42 forKeyedSubscript:v39];

          id v43 = [v31 targetState];
          if ((unint64_t)v43 < 2) {
            goto LABEL_15;
          }
          if (v43 == (id)2)
          {
            [v64 setObject:v35 forKeyedSubscript:v39];
            goto LABEL_18;
          }
          if (v43 == (id)3) {
LABEL_15:
          }
            [v67 addObject:v35];
LABEL_18:
          [v66 addObject:v39];

LABEL_19:
        }
        id v26 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
      }
      while (v26);
    }

    id v44 = [v23 copy];
    v20 = (_CPLCloudKitSimpleRecordUpdatePlanner *)v59;
    v45 = *(void **)(v59 + 8);
    *(void *)(v59 + 8) = v44;

    if (v24) {
      id v46 = [v24 copy];
    }
    else {
      id v46 = *(id *)(v59 + 8);
    }
    id v17 = v55;
    v47 = *(void **)(v59 + 16);
    *(void *)(v59 + 16) = v46;

    id v48 = [v67 copy];
    v49 = *(void **)(v59 + 80);
    *(void *)(v59 + 80) = v48;

    id v50 = [v64 copy];
    v51 = *(void **)(v59 + 88);
    *(void *)(v59 + 88) = v50;

    id v52 = [v66 copy];
    v53 = *(void **)(v59 + 96);
    *(void *)(v59 + 96) = v52;

    id v18 = v56;
    id v16 = v57;
  }

  return v20;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification scopeIdentifier];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    p_destinationZoneIdentification = &self->_destinationZoneIdentification;
LABEL_5:
    v12 = [(CPLCloudKitZoneIdentification *)*p_destinationZoneIdentification cloudKitScope];
    goto LABEL_7;
  }
  sharedZoneIdentification = self->_sharedZoneIdentification;
  p_destinationZoneIdentification = &self->_sharedZoneIdentification;
  v8 = sharedZoneIdentification;
  if (sharedZoneIdentification)
  {
    v10 = [(CPLCloudKitZoneIdentification *)v8 scopeIdentifier];
    unsigned int v11 = [v4 isEqualToString:v10];

    if (v11) {
      goto LABEL_5;
    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  return [(NSDictionary *)self->_ckRecordIDToRejectedScopedIdentifier objectForKeyedSubscript:a3];
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  v5 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zoneID];
  unsigned int v6 = [v5 isEqual:v4];

  if (v6)
  {
    destinationZoneIdentification = self->_destinationZoneIdentification;
LABEL_6:
    uint64_t v11 = [(CPLCloudKitZoneIdentification *)destinationZoneIdentification scopeIdentifier];
    goto LABEL_8;
  }
  sharedZoneIdentification = self->_sharedZoneIdentification;
  if (sharedZoneIdentification)
  {
    v9 = [(CPLCloudKitZoneIdentification *)sharedZoneIdentification zoneID];
    unsigned int v10 = [v9 isEqual:v4];

    if (v10)
    {
      destinationZoneIdentification = self->_sharedZoneIdentification;
      goto LABEL_6;
    }
  }
  uint64_t v11 = [(CPLCloudKitTransportTask *)self->_task scopeIdentifierFromZoneID:v4];
LABEL_8:
  v12 = (void *)v11;

  return v12;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  return [(NSDictionary *)self->_ckRecordIDToScopedIdentifier objectForKeyedSubscript:a3];
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  v3 = [(_CPLCloudKitSimpleRecordUpdatePlanner *)self cloudKitScopeForScopeIdentifier:a3];
  id v4 = [v3 zoneID];

  return v4;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)objc_getProperty(self, a2, 24, 1);
}

- (CPLCloudKitTransportTask)task
{
  return self->_task;
}

- (NSArray)scopedIdentifiers
{
  return self->_scopedIdentifiers;
}

- (CPLCloudKitZoneIdentification)destinationZoneIdentification
{
  return self->_destinationZoneIdentification;
}

- (CPLCloudKitZoneIdentification)sharedZoneIdentification
{
  return self->_sharedZoneIdentification;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLCKRecordPropertyMapping)propertyMapping
{
  return self->_propertyMapping;
}

- (NSArray)privateRecordIDs
{
  return self->_privateRecordIDs;
}

- (NSDictionary)sharedRecordIDsToMissingPrivateRecordIDs
{
  return self->_sharedRecordIDsToMissingPrivateRecordIDs;
}

- (NSArray)sharedRecordIDs
{
  return self->_sharedRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedRecordIDs, 0);
  objc_storeStrong((id *)&self->_sharedRecordIDsToMissingPrivateRecordIDs, 0);
  objc_storeStrong((id *)&self->_privateRecordIDs, 0);
  objc_storeStrong((id *)&self->_propertyMapping, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_sharedZoneIdentification, 0);
  objc_storeStrong((id *)&self->_destinationZoneIdentification, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiers, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_fingerprintContext, 0);
  objc_storeStrong((id *)&self->_ckRecordIDToRejectedScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_ckRecordIDToScopedIdentifier, 0);
}

@end