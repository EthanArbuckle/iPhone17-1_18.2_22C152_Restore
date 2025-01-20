@interface HDCloudSyncCodableSharedSummaryTransactionRecord
+ (Class)summaryIdentifiersType;
- (BOOL)hasMetadata;
- (BOOL)hasSourceDeviceIdentifier;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSMutableArray)summaryIdentifiers;
- (NSString)sourceDeviceIdentifier;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)summaryIdentifiersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)summaryIdentifiersCount;
- (void)addSummaryIdentifiers:(id)a3;
- (void)clearSummaryIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSourceDeviceIdentifier:(id)a3;
- (void)setSummaryIdentifiers:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCloudSyncCodableSharedSummaryTransactionRecord

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasSourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier != 0;
}

- (void)clearSummaryIdentifiers
{
}

- (void)addSummaryIdentifiers:(id)a3
{
  id v4 = a3;
  summaryIdentifiers = self->_summaryIdentifiers;
  id v8 = v4;
  if (!summaryIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_summaryIdentifiers;
    self->_summaryIdentifiers = v6;

    id v4 = v8;
    summaryIdentifiers = self->_summaryIdentifiers;
  }
  [(NSMutableArray *)summaryIdentifiers addObject:v4];
}

- (unint64_t)summaryIdentifiersCount
{
  return [(NSMutableArray *)self->_summaryIdentifiers count];
}

- (id)summaryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_summaryIdentifiers objectAtIndex:a3];
}

+ (Class)summaryIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncCodableSharedSummaryTransactionRecord;
  id v4 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)&v8 description];
  v5 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  sourceDeviceIdentifier = self->_sourceDeviceIdentifier;
  if (sourceDeviceIdentifier) {
    [v4 setObject:sourceDeviceIdentifier forKey:@"sourceDeviceIdentifier"];
  }
  summaryIdentifiers = self->_summaryIdentifiers;
  if (summaryIdentifiers) {
    [v4 setObject:summaryIdentifiers forKey:@"summaryIdentifiers"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableSharedSummaryTransactionRecordReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceDeviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_summaryIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_uuid) {
    objc_msgSend(v8, "setUuid:");
  }
  if (self->_sourceDeviceIdentifier) {
    objc_msgSend(v8, "setSourceDeviceIdentifier:");
  }
  if ([(HDCloudSyncCodableSharedSummaryTransactionRecord *)self summaryIdentifiersCount])
  {
    [v8 clearSummaryIdentifiers];
    unint64_t v4 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self summaryIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCloudSyncCodableSharedSummaryTransactionRecord *)self summaryIdentifiersAtIndex:i];
        [v8 addSummaryIdentifiers:v7];
      }
    }
  }
  if (self->_metadata) {
    objc_msgSend(v8, "setMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_sourceDeviceIdentifier copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = self->_summaryIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "copyWithZone:", a3, (void)v19);
        [v5 addSummaryIdentifiers:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSData *)self->_metadata copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuid = self->_uuid, !((unint64_t)uuid | v4[4])) || -[NSString isEqual:](uuid, "isEqual:"))
    && ((sourceDeviceIdentifier = self->_sourceDeviceIdentifier, !((unint64_t)sourceDeviceIdentifier | v4[2]))
     || -[NSString isEqual:](sourceDeviceIdentifier, "isEqual:"))
    && ((summaryIdentifiers = self->_summaryIdentifiers, !((unint64_t)summaryIdentifiers | v4[3]))
     || -[NSMutableArray isEqual:](summaryIdentifiers, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[1]) {
      char v9 = -[NSData isEqual:](metadata, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_sourceDeviceIdentifier hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_summaryIdentifiers hash];
  return v4 ^ v5 ^ [(NSData *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 2)) {
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setSourceDeviceIdentifier:](self, "setSourceDeviceIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCloudSyncCodableSharedSummaryTransactionRecord addSummaryIdentifiers:](self, "addSummaryIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 1)) {
    -[HDCloudSyncCodableSharedSummaryTransactionRecord setMetadata:](self, "setMetadata:");
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)sourceDeviceIdentifier
{
  return self->_sourceDeviceIdentifier;
}

- (void)setSourceDeviceIdentifier:(id)a3
{
}

- (NSMutableArray)summaryIdentifiers
{
  return self->_summaryIdentifiers;
}

- (void)setSummaryIdentifiers:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_summaryIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end