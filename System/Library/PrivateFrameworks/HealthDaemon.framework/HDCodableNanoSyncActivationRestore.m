@interface HDCodableNanoSyncActivationRestore
+ (Class)obliteratedHealthPairingUUIDsType;
+ (id)activationRestoreWithRestoreUUID:(id)a3 sequenceNumber:(int64_t)a4 statusCode:(int)a5;
+ (id)persistentUserInfoKey;
+ (id)retreiveFromPersistentUserInfo:(id)a3;
- (BOOL)hasDefaultSourceBundleIdentifier;
- (BOOL)hasRequiredFields;
- (BOOL)hasRestoreIdentifier;
- (BOOL)hasSequenceNumber;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)restoreIdentifier;
- (NSMutableArray)obliteratedHealthPairingUUIDs;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)description;
- (id)copyForPersistentUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedObliteratedHealthPairingUUIDs;
- (id)decodedRestoreUUID;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (id)obliteratedHealthPairingUUIDsAtIndex:(unint64_t)a3;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (int64_t)sequenceNumber;
- (unint64_t)hash;
- (unint64_t)obliteratedHealthPairingUUIDsCount;
- (void)addObliteratedHealthPairingUUIDs:(id)a3;
- (void)addToPersistentUserInfo:(id)a3;
- (void)clearObliteratedHealthPairingUUIDs;
- (void)copyTo:(id)a3;
- (void)encodeObliteratedHealthPairingUUIDs:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultSourceBundleIdentifier:(id)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setObliteratedHealthPairingUUIDs:(id)a3;
- (void)setRestoreIdentifier:(id)a3;
- (void)setSequenceNumber:(int64_t)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncActivationRestore

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

+ (id)persistentUserInfoKey
{
  return @"activation";
}

- (BOOL)hasRestoreIdentifier
{
  return self->_restoreIdentifier != 0;
}

- (void)setSequenceNumber:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)statusCode
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_statusCode;
  }
  else {
    return 1;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatusCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E62F5568[a3 - 1];
  }

  return v3;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Continue"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Finished"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Abort"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasDefaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier != 0;
}

- (void)clearObliteratedHealthPairingUUIDs
{
}

- (void)addObliteratedHealthPairingUUIDs:(id)a3
{
  id v4 = a3;
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  id v8 = v4;
  if (!obliteratedHealthPairingUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_obliteratedHealthPairingUUIDs;
    self->_obliteratedHealthPairingUUIDs = v6;

    id v4 = v8;
    obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  }
  [(NSMutableArray *)obliteratedHealthPairingUUIDs addObject:v4];
}

- (unint64_t)obliteratedHealthPairingUUIDsCount
{
  return [(NSMutableArray *)self->_obliteratedHealthPairingUUIDs count];
}

- (id)obliteratedHealthPairingUUIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_obliteratedHealthPairingUUIDs objectAtIndex:a3];
}

+ (Class)obliteratedHealthPairingUUIDsType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncActivationRestore;
  id v4 = [(HDCodableNanoSyncActivationRestore *)&v8 description];
  v5 = [(HDCodableNanoSyncActivationRestore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  restoreIdentifier = self->_restoreIdentifier;
  if (restoreIdentifier) {
    [v3 setObject:restoreIdentifier forKey:@"restoreIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_sequenceNumber];
    [v4 setObject:v7 forKey:@"sequenceNumber"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v8 = self->_statusCode - 1;
    if (v8 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E62F5568[v8];
    }
    [v4 setObject:v9 forKey:@"statusCode"];
  }
  defaultSourceBundleIdentifier = self->_defaultSourceBundleIdentifier;
  if (defaultSourceBundleIdentifier) {
    [v4 setObject:defaultSourceBundleIdentifier forKey:@"defaultSourceBundleIdentifier"];
  }
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  if (obliteratedHealthPairingUUIDs) {
    [v4 setObject:obliteratedHealthPairingUUIDs forKey:@"obliteratedHealthPairingUUIDs"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncActivationRestoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_restoreIdentifier) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_defaultSourceBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_obliteratedHealthPairingUUIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_restoreIdentifier)
  {
    objc_msgSend(v4, "setRestoreIdentifier:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_sequenceNumber;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_statusCode;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  if (self->_defaultSourceBundleIdentifier) {
    objc_msgSend(v10, "setDefaultSourceBundleIdentifier:");
  }
  if ([(HDCodableNanoSyncActivationRestore *)self obliteratedHealthPairingUUIDsCount])
  {
    [v10 clearObliteratedHealthPairingUUIDs];
    unint64_t v6 = [(HDCodableNanoSyncActivationRestore *)self obliteratedHealthPairingUUIDsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableNanoSyncActivationRestore *)self obliteratedHealthPairingUUIDsAtIndex:i];
        [v10 addObliteratedHealthPairingUUIDs:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_restoreIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_sequenceNumber;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_defaultSourceBundleIdentifier copyWithZone:a3];
  id v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_obliteratedHealthPairingUUIDs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addObliteratedHealthPairingUUIDs:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  restoreIdentifier = self->_restoreIdentifier;
  if ((unint64_t)restoreIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](restoreIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_sequenceNumber != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  defaultSourceBundleIdentifier = self->_defaultSourceBundleIdentifier;
  if ((unint64_t)defaultSourceBundleIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](defaultSourceBundleIdentifier, "isEqual:"))
  {
    goto LABEL_18;
  }
  obliteratedHealthPairingUUIDs = self->_obliteratedHealthPairingUUIDs;
  if ((unint64_t)obliteratedHealthPairingUUIDs | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](obliteratedHealthPairingUUIDs, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_restoreIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_sequenceNumber;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_statusCode;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_defaultSourceBundleIdentifier hash];
  return v6 ^ [(NSMutableArray *)self->_obliteratedHealthPairingUUIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HDCodableNanoSyncActivationRestore setRestoreIdentifier:](self, "setRestoreIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_sequenceNumber = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_statusCode = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2)) {
    -[HDCodableNanoSyncActivationRestore setDefaultSourceBundleIdentifier:](self, "setDefaultSourceBundleIdentifier:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HDCodableNanoSyncActivationRestore addObliteratedHealthPairingUUIDs:](self, "addObliteratedHealthPairingUUIDs:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSData)restoreIdentifier
{
  return self->_restoreIdentifier;
}

- (void)setRestoreIdentifier:(id)a3
{
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSString)defaultSourceBundleIdentifier
{
  return self->_defaultSourceBundleIdentifier;
}

- (void)setDefaultSourceBundleIdentifier:(id)a3
{
}

- (NSMutableArray)obliteratedHealthPairingUUIDs
{
  return self->_obliteratedHealthPairingUUIDs;
}

- (void)setObliteratedHealthPairingUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreIdentifier, 0);
  objc_storeStrong((id *)&self->_obliteratedHealthPairingUUIDs, 0);

  objc_storeStrong((id *)&self->_defaultSourceBundleIdentifier, 0);
}

+ (id)activationRestoreWithRestoreUUID:(id)a3 sequenceNumber:(int64_t)a4 statusCode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(HDCodableNanoSyncActivationRestore);
  uint64_t v9 = objc_msgSend(v7, "hk_dataForUUIDBytes");

  [(HDCodableNanoSyncActivationRestore *)v8 setRestoreIdentifier:v9];
  [(HDCodableNanoSyncActivationRestore *)v8 setSequenceNumber:a4];
  [(HDCodableNanoSyncActivationRestore *)v8 setStatusCode:v5];

  return v8;
}

- (BOOL)hasRequiredFields
{
  if (![(HDCodableNanoSyncActivationRestore *)self hasRestoreIdentifier]
    || ![(HDCodableNanoSyncActivationRestore *)self hasSequenceNumber])
  {
    return 0;
  }

  return [(HDCodableNanoSyncActivationRestore *)self hasStatusCode];
}

- (id)decodedRestoreUUID
{
  if (self->_restoreIdentifier)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)encodeObliteratedHealthPairingUUIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HDCodableNanoSyncActivationRestore *)self clearObliteratedHealthPairingUUIDs];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hk_dataForUUIDBytes", (void)v11);
        [(HDCodableNanoSyncActivationRestore *)self addObliteratedHealthPairingUUIDs:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)decodedObliteratedHealthPairingUUIDs
{
  return (id)[(NSMutableArray *)self->_obliteratedHealthPairingUUIDs hk_map:&__block_literal_global_124];
}

uint64_t __91__HDCodableNanoSyncActivationRestore_NanoSyncSupport__decodedObliteratedHealthPairingUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", a2);
}

- (id)nanoSyncDescription
{
  uint64_t v3 = NSString;
  id v4 = [(HDCodableNanoSyncActivationRestore *)self decodedRestoreUUID];
  id v5 = [v4 UUIDString];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:self->_sequenceNumber];
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unsigned int v8 = self->_statusCode - 1;
      if (v8 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v9 = off_1E6302B70[v8];
      }
      id v10 = [v3 stringWithFormat:@"restore-id:%@ seq:%@ status:%@", v5, v7, v9, 0];

      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v7 = @"(null)";
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  id v10 = [v3 stringWithFormat:@"restore-id:%@ seq:%@ status:%@", v5, v7, @"(null)", 0];
  if (has) {
LABEL_10:
  }

LABEL_11:

  return v10;
}

- (void)addToPersistentUserInfo:(id)a3
{
}

- (id)copyForPersistentUserInfo
{
  uint64_t v3 = objc_alloc_init(HDCodableNanoSyncActivationRestore);
  [(HDCodableNanoSyncActivationRestore *)v3 setRestoreIdentifier:self->_restoreIdentifier];
  char has = (char)self->_has;
  if (has)
  {
    [(HDCodableNanoSyncActivationRestore *)v3 setSequenceNumber:self->_sequenceNumber];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [(HDCodableNanoSyncActivationRestore *)v3 setStatusCode:self->_statusCode];
  }
  return v3;
}

@end