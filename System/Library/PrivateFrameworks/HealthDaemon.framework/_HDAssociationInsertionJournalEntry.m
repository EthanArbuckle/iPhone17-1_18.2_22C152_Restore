@interface _HDAssociationInsertionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)deleted;
- (BOOL)enforceSameSource;
- (HDAssociatableObjectReference)destinationSubObjectReference;
- (NSData)childUUIDsData;
- (NSDate)creationDate;
- (NSUUID)parentUUID;
- (_HDAssociationInsertionJournalEntry)initWithCoder:(id)a3;
- (_HDAssociationInsertionJournalEntry)initWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11;
- (id)description;
- (int64_t)provenance;
- (int64_t)syncIdentity;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDAssociationInsertionJournalEntry

- (void)encodeWithCoder:(id)a3
{
  parentUUID = self->_parentUUID;
  id v5 = a3;
  [v5 encodeObject:parentUUID forKey:@"corUUID"];
  [v5 encodeObject:self->_childUUIDsData forKey:@"objUUIDsData"];
  [v5 encodeInt64:self->_provenance forKey:@"provenance"];
  [v5 encodeInt64:self->_syncIdentity forKey:@"syncIdentity"];
  [v5 encodeBool:self->_enforceSameSource forKey:@"sameSource"];
  [v5 encodeInt64:self->_type forKey:@"type"];
  [v5 encodeBool:self->_deleted forKey:@"deleted"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_destinationSubObjectReference forKey:@"destinationSubObject"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_destinationSubObjectReference, 0);
  objc_storeStrong((id *)&self->_childUUIDsData, 0);

  objc_storeStrong((id *)&self->_parentUUID, 0);
}

- (_HDAssociationInsertionJournalEntry)initWithParentUUID:(id)a3 childUUIDsData:(id)a4 provenance:(int64_t)a5 syncIdentity:(int64_t)a6 type:(unint64_t)a7 deleted:(BOOL)a8 creationDate:(id)a9 destinationSubObjectReference:(id)a10 enforceSameSource:(BOOL)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a9;
  id v19 = a10;
  v20 = [(_HDAssociationInsertionJournalEntry *)self init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_parentUUID, a3);
    uint64_t v22 = [v17 copy];
    childUUIDsData = v21->_childUUIDsData;
    v21->_childUUIDsData = (NSData *)v22;

    v21->_provenance = a5;
    v21->_syncIdentity = a6;
    v21->_enforceSameSource = a11;
    v21->_type = a7;
    objc_storeStrong((id *)&v21->_destinationSubObjectReference, a10);
    objc_storeStrong((id *)&v21->_creationDate, a9);
    v21->_deleted = a8;
  }

  return v21;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(NSUUID *)self->_parentUUID UUIDString];
  v7 = [v3 stringWithFormat:@"%@ - %@ (%lu objects)", v5, v6, -[NSData hk_countOfUUIDs](self->_childUUIDsData, "hk_countOfUUIDs"), 0];

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v8 = [v32 syncIdentityManager];
        v9 = [v8 legacySyncIdentity];
        v10 = [v9 entity];
        uint64_t v11 = [v10 persistentID];

        if ([v7 syncIdentity] == -1) {
          uint64_t v31 = v11;
        }
        else {
          uint64_t v31 = [v7 syncIdentity];
        }
        v12 = [v7 parentUUID];
        v13 = [v7 childUUIDsData];
        uint64_t v14 = [v7 provenance];
        uint64_t v15 = [v7 type];
        uint64_t v16 = [v7 deleted];
        id v17 = [v7 creationDate];
        id v18 = [v7 destinationSubObjectReference];
        char v19 = [v7 enforceSameSource];
        id v33 = 0;
        id v34 = 0;
        BYTE1(v27) = 1;
        LOBYTE(v27) = v19;
        LOBYTE(v15) = +[HDAssociationEntity _insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:](HDAssociationEntity, "_insertEntriesWithParentUUID:childUUIDsData:provenance:syncIdentity:type:deleted:creationDate:destinationSubObjectReference:enforceSameSource:permitPendingAssociations:profile:lastInsertedEntityID:error:", v12, v13, v14, v31, v15, v16, v17, v18, v27, v32, &v34, &v33);
        id v20 = v34;
        id v21 = v33;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          uint64_t v22 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v40 = v21;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Error applying %{public}@", buf, 0xCu);
          }
          if (objc_msgSend(v21, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_18;
          }
          v23 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          v24 = [v32 daemon];
          v25 = [v24 autoBugCaptureReporter];
          v26 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "provenance"));
          [v25 reportJournalFailureWithErrorDescription:v23 provenance:v26 error:v21];
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDAssociationInsertionJournalEntry)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"corUUID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objUUIDsData"];
  if ([v4 containsValueForKey:@"provenance"]) {
    uint64_t v28 = [v4 decodeInt64ForKey:@"provenance"];
  }
  else {
    uint64_t v28 = 0;
  }
  if ([v4 containsValueForKey:@"syncIdentity"])
  {
    uint64_t v27 = [v4 decodeInt64ForKey:@"syncIdentity"];
    if (v6) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v27 = -1;
    if (v6) {
      goto LABEL_16;
    }
  }
  v7 = self;
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"objUUIDs"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v6, "hk_appendBytesWithUUID:", *(void *)(*((void *)&v29 + 1) + 8 * i));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  self = v7;
LABEL_16:
  char v17 = [v4 decodeBoolForKey:@"sameSource"];
  uint64_t v18 = [v4 decodeInt64ForKey:@"type"];
  uint64_t v19 = [v4 decodeBoolForKey:@"deleted"];
  id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationSubObject"];
  if (!v21)
  {
    uint64_t v22 = self;
    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationSubObjectUUID"];
    if (v23)
    {
      id v21 = 0;
    }
    else
    {
      id v21 = HDReferenceForUnknownAssociatableObjectWithUUID(0);
    }

    self = v22;
  }
  LOBYTE(v26) = v17;
  v24 = [(_HDAssociationInsertionJournalEntry *)self initWithParentUUID:v5 childUUIDsData:v6 provenance:v28 syncIdentity:v27 type:v18 deleted:v19 creationDate:v20 destinationSubObjectReference:v21 enforceSameSource:v26];

  return v24;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSData)childUUIDsData
{
  return self->_childUUIDsData;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (BOOL)enforceSameSource
{
  return self->_enforceSameSource;
}

- (HDAssociatableObjectReference)destinationSubObjectReference
{
  return self->_destinationSubObjectReference;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

@end