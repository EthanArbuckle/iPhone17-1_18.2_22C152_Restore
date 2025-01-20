@interface CPLCloudKitCopyMoveOperationContext
- (CKRecordZoneID)destinationZoneID;
- (CKRecordZoneID)sourceZoneID;
- (id)extendedStatusDescriptionStrings;
- (id)initFromZoneID:(id)a3 toZoneID:(id)a4;
- (id)operationDescription;
- (void)addCopyMoveFromRecordID:(id)a3 toRecordID:(id)a4;
@end

@implementation CPLCloudKitCopyMoveOperationContext

- (id)initFromZoneID:(id)a3 toZoneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLCloudKitCopyMoveOperationContext;
  v9 = [(CPLCloudKitCopyMoveOperationContext *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceZoneID, a3);
    objc_storeStrong(p_isa + 12, a4);
  }

  return p_isa;
}

- (void)addCopyMoveFromRecordID:(id)a3 toRecordID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  sourceRecordIDs = self->_sourceRecordIDs;
  if (!sourceRecordIDs)
  {
    id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v9 = self->_sourceRecordIDs;
    self->_sourceRecordIDs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    destinationRecordIDs = self->_destinationRecordIDs;
    self->_destinationRecordIDs = v10;

    sourceRecordIDs = self->_sourceRecordIDs;
  }
  [(NSMutableArray *)sourceRecordIDs addObject:v12];
  [(NSMutableDictionary *)self->_destinationRecordIDs setObject:v6 forKeyedSubscript:v12];
}

- (id)operationDescription
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(CKRecordZoneID *)self->_sourceZoneID cpl_zoneName];
  v5 = [(CKRecordZoneID *)self->_destinationZoneID cpl_zoneName];
  id v6 = [v3 initWithFormat:@"%@ -> %@", v4, v5];

  return v6;
}

- (id)extendedStatusDescriptionStrings
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_sourceRecordIDs, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_sourceRecordIDs;
  id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_destinationRecordIDs objectForKeyedSubscript:v8];
        id v10 = objc_alloc((Class)NSString);
        v11 = [v8 recordName];
        id v12 = [v9 recordName];
        id v13 = [v10 initWithFormat:@"%@ -> %@", v11, v12];
        [v3 addObject:v13];
      }
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (CKRecordZoneID)destinationZoneID
{
  return self->_destinationZoneID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationZoneID, 0);
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
  objc_storeStrong((id *)&self->_destinationRecordIDs, 0);
  objc_storeStrong((id *)&self->_sourceRecordIDs, 0);
}

@end