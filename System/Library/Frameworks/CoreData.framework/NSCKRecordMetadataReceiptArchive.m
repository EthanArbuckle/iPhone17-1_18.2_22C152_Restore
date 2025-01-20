@interface NSCKRecordMetadataReceiptArchive
+ (BOOL)supportsSecureCoding;
- (NSCKRecordMetadataReceiptArchive)initWithCoder:(id)a3;
- (NSCKRecordMetadataReceiptArchive)initWithReceiptsToEncode:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateArchivedRecordIDsUsingBlock:(id)a3;
@end

@implementation NSCKRecordMetadataReceiptArchive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCKRecordMetadataReceiptArchive)initWithReceiptsToEncode:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  v3 = [(NSCKRecordMetadataReceiptArchive *)&v17 init];
  if (v3)
  {
    v3->_zoneIDToArchivedReceipts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [a3 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(a3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = (void *)[v8 createRecordIDForMovedRecord];
          id v10 = (id)-[NSMutableDictionary objectForKey:](v3->_zoneIDToArchivedReceipts, "objectForKey:", [v9 zoneID]);
          if (!v10)
          {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            -[NSMutableDictionary setObject:forKey:](v3->_zoneIDToArchivedReceipts, "setObject:forKey:", v10, [v9 zoneID]);
          }
          v18 = @"movedAt";
          uint64_t v19 = [v8 movedAt];
          objc_msgSend(v10, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1), objc_msgSend(v9, "recordName"));
        }
        uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }
      while (v5);
    }
  }
  return v3;
}

- (void)dealloc
{
  self->_zoneIDToArchivedReceipts = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  [(NSCKRecordMetadataReceiptArchive *)&v3 dealloc];
}

- (NSCKRecordMetadataReceiptArchive)initWithCoder:(id)a3
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSCKRecordMetadataReceiptArchive;
  uint64_t v4 = [(NSCKRecordMetadataReceiptArchive *)&v7 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    v8[0] = objc_opt_class();
    getCloudKitCKRecordZoneIDClass[0]();
    v8[1] = objc_opt_class();
    v8[2] = objc_opt_class();
    v8[3] = objc_opt_class();
    v4->_zoneIDToArchivedReceipts = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 4)), @"archiveDictionary");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)enumerateArchivedRecordIDsUsingBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = self->_zoneIDToArchivedReceipts;
  uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v4;
        uint64_t v5 = *(void *)(*((void *)&v22 + 1) + 8 * v4);
        uint64_t v6 = (void *)[(NSMutableDictionary *)self->_zoneIDToArchivedReceipts objectForKey:v5];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v19 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              v12 = (void *)[objc_alloc((Class)getCloudKitCKRecordIDClass[0]()) initWithRecordName:v11 zoneID:v5];
              (*((void (**)(id, void *, uint64_t))a3 + 2))(a3, v12, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", v11), "objectForKey:", @"movedAt"));
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v8);
        }
        uint64_t v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }
}

@end