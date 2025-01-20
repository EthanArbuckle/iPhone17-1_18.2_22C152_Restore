@interface HDCodableNanoSyncChangeSet
+ (Class)changesType;
+ (id)changeSetWithChanges:(id)a3 sessionUUID:(id)a4 startDate:(id)a5 sessionError:(id)a6 statusCode:(int)a7;
+ (id)persistentUserInfoKey;
+ (id)retreiveFromPersistentUserInfo:(id)a3;
- (BOOL)hasSessionError;
- (BOOL)hasSessionStartDate;
- (BOOL)hasSessionUUID;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableError)sessionError;
- (NSData)sessionUUID;
- (NSMutableArray)changes;
- (NSString)description;
- (double)sessionStartDate;
- (id)changesAtIndex:(unint64_t)a3;
- (id)copyForPersistentUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedSessionError;
- (id)decodedSessionStartDate;
- (id)decodedSessionUUID;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)changesCount;
- (unint64_t)hash;
- (void)addChanges:(id)a3;
- (void)addToPersistentUserInfo:(id)a3;
- (void)clearChanges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChanges:(id)a3;
- (void)setHasSessionStartDate:(BOOL)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setSessionError:(id)a3;
- (void)setSessionStartDate:(double)a3;
- (void)setSessionUUID:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncChangeSet

+ (id)changeSetWithChanges:(id)a3 sessionUUID:(id)a4 startDate:(id)a5 sessionError:(id)a6 statusCode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v29 = a5;
  id v28 = a6;
  id v12 = a3;
  v13 = objc_alloc_init(HDCodableNanoSyncChangeSet);
  id v14 = v12;
  if (v13)
  {
    uint64_t v15 = objc_opt_class();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * v20);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            unsigned int v27 = v7;
            v23 = id v22 = v11;
            [v23 handleFailureInMethod:sel__addChanges_, v13, @"HDNanoSyncSupport.m", 353, @"%@ must be an instance of %@", v21, v15 object file lineNumber description];

            id v11 = v22;
            uint64_t v7 = v27;
          }
          if (objc_opt_isKindOfClass()) {
            [(HDCodableNanoSyncChangeSet *)v13 addChanges:v21];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }
  }
  if (v11)
  {
    v24 = objc_msgSend(v11, "hk_dataForUUIDBytes");
    [(HDCodableNanoSyncChangeSet *)v13 setSessionUUID:v24];
  }
  if (v29)
  {
    [v29 timeIntervalSinceReferenceDate];
    -[HDCodableNanoSyncChangeSet setSessionStartDate:](v13, "setSessionStartDate:");
  }
  if (v28)
  {
    v25 = objc_msgSend(v28, "hk_codableError");
    [(HDCodableNanoSyncChangeSet *)v13 setSessionError:v25];
  }
  [(HDCodableNanoSyncChangeSet *)v13 setStatusCode:v7];

  return v13;
}

- (void)addChanges:(id)a3
{
  id v4 = a3;
  changes = self->_changes;
  id v8 = v4;
  if (!changes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_changes;
    self->_changes = v6;

    id v4 = v8;
    changes = self->_changes;
  }
  [(NSMutableArray *)changes addObject:v4];
}

- (void)setSessionUUID:(id)a3
{
}

- (void)setSessionStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionStartDate = a3;
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_statusCode = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_changes;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_sessionUUID) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sessionError) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)addToPersistentUserInfo:(id)a3
{
}

- (id)copyForPersistentUserInfo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(HDCodableNanoSyncChangeSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v16 = self;
  id v4 = [(HDCodableNanoSyncChangeSet *)self changes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        long long v10 = objc_alloc_init(HDCodableNanoSyncChange);
        long long v11 = v10;
        if ((*(unsigned char *)(v9 + 76) & 8) != 0) {
          [(HDCodableNanoSyncChange *)v10 setObjectType:*(unsigned int *)(v9 + 48)];
        }
        if ([(id)v9 hasEntityIdentifier])
        {
          long long v12 = [(id)v9 entityIdentifier];
          [(HDCodableNanoSyncChange *)v11 setEntityIdentifier:v12];
        }
        char v13 = *(unsigned char *)(v9 + 76);
        if ((v13 & 0x20) != 0)
        {
          [(HDCodableNanoSyncChange *)v11 setSpeculative:*(unsigned __int8 *)(v9 + 73)];
          char v13 = *(unsigned char *)(v9 + 76);
          if ((v13 & 4) == 0)
          {
LABEL_12:
            if ((v13 & 1) == 0) {
              goto LABEL_14;
            }
LABEL_13:
            [(HDCodableNanoSyncChange *)v11 setEndAnchor:*(void *)(v9 + 8)];
            goto LABEL_14;
          }
        }
        else if ((*(unsigned char *)(v9 + 76) & 4) == 0)
        {
          goto LABEL_12;
        }
        [(HDCodableNanoSyncChange *)v11 setStartAnchor:*(void *)(v9 + 24)];
        if (*(unsigned char *)(v9 + 76)) {
          goto LABEL_13;
        }
LABEL_14:
        [(HDCodableNanoSyncChangeSet *)v3 addChanges:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = v14;
    }
    while (v14);
  }

  if ((*(unsigned char *)&v16->_has & 2) != 0) {
    [(HDCodableNanoSyncChangeSet *)v3 setStatusCode:v16->_statusCode];
  }
  [(HDCodableNanoSyncChangeSet *)v3 setSessionUUID:v16->_sessionUUID];
  return v3;
}

- (NSMutableArray)changes
{
  return self->_changes;
}

+ (id)persistentUserInfoKey
{
  return @"changeset";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_sessionError, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncChangeSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)nanoSyncDescription
{
  uint64_t statusCode = self->_statusCode;
  switch(statusCode)
  {
    case 1:
      id v4 = @"Continue";
      goto LABEL_10;
    case 3:
      id v4 = @"Error";
LABEL_8:
      if ([(HDCodableNanoSyncChangeSet *)self hasSessionError])
      {
        uint64_t v5 = [(HDCodableNanoSyncChangeSet *)self sessionError];
        uint64_t v6 = [v5 code];
        uint64_t v7 = [(HDCodableNanoSyncChangeSet *)self sessionError];
        uint64_t v8 = [v7 domain];
        uint64_t v9 = [(HDCodableNanoSyncChangeSet *)self sessionError];
        long long v10 = [v9 localizedDescription];
        uint64_t v11 = [(__CFString *)v4 stringByAppendingFormat:@":%lld, %@, %@", v6, v8, v10];

        id v4 = (__CFString *)v11;
      }
      goto LABEL_10;
    case 2:
      id v4 = @"Finished";
      goto LABEL_10;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", statusCode);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (self->_statusCode == 3) {
    goto LABEL_8;
  }
LABEL_10:
  long long v12 = NSString;
  char v13 = [(HDCodableNanoSyncChangeSet *)self decodedSessionUUID];
  uint64_t v14 = [v13 UUIDString];
  uint64_t v15 = [(HDCodableNanoSyncChangeSet *)self changes];
  id v16 = HDNanoSyncDescriptionWithArray(v15);
  long long v17 = [v12 stringWithFormat:@"session:%@ status:%@, changes:%@", v14, v4, v16];

  return v17;
}

- (id)decodedSessionUUID
{
  if (self->_sessionUUID)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
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

- (id)decodedSessionStartDate
{
  if (*(unsigned char *)&self->_has)
  {
    v2 = HDDecodeDateForValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)decodedSessionError
{
  if (self->_sessionError)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorWithCodableError:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)setSessionError:(id)a3
{
}

- (void)clearChanges
{
}

- (unint64_t)changesCount
{
  return [(NSMutableArray *)self->_changes count];
}

- (id)changesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_changes objectAtIndex:a3];
}

+ (Class)changesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (void)setHasSessionStartDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStartDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSessionError
{
  return self->_sessionError != 0;
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
    char v3 = off_1E6303F70[a3 - 1];
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
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncChangeSet;
  int v4 = [(HDCodableNanoSyncChangeSet *)&v8 description];
  uint64_t v5 = [(HDCodableNanoSyncChangeSet *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_changes count])
  {
    int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_changes, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = self->_changes;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"changes"];
  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v12 = [NSNumber numberWithDouble:self->_sessionStartDate];
    [v3 setObject:v12 forKey:@"sessionStartDate"];
  }
  sessionError = self->_sessionError;
  if (sessionError)
  {
    uint64_t v14 = [(HDCodableError *)sessionError dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"sessionError"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v15 = self->_statusCode - 1;
    if (v15 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
      id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = off_1E6303F70[v15];
    }
    [v3 setObject:v16 forKey:@"statusCode"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(HDCodableNanoSyncChangeSet *)self changesCount])
  {
    [v9 clearChanges];
    unint64_t v4 = [(HDCodableNanoSyncChangeSet *)self changesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableNanoSyncChangeSet *)self changesAtIndex:i];
        [v9 addChanges:v7];
      }
    }
  }
  if (self->_sessionUUID) {
    objc_msgSend(v9, "setSessionUUID:");
  }
  uint64_t v8 = v9;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v9 + 1) = *(void *)&self->_sessionStartDate;
    *((unsigned char *)v9 + 44) |= 1u;
  }
  if (self->_sessionError)
  {
    objc_msgSend(v9, "setSessionError:");
    uint64_t v8 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8[10] = self->_statusCode;
    *((unsigned char *)v8 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_changes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [(id)v5 addChanges:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_sessionUUID copyWithZone:a3];
  char v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_sessionStartDate;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  id v14 = -[HDCodableError copyWithZone:](self->_sessionError, "copyWithZone:", a3, (void)v17);
  unsigned int v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_statusCode;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  changes = self->_changes;
  if ((unint64_t)changes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](changes, "isEqual:")) {
      goto LABEL_18;
    }
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](sessionUUID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 44);
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_sessionStartDate != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  sessionError = self->_sessionError;
  if ((unint64_t)sessionError | *((void *)v4 + 3))
  {
    if (!-[HDCodableError isEqual:](sessionError, "isEqual:"))
    {
LABEL_18:
      BOOL v10 = 0;
      goto LABEL_19;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 44);
  }
  BOOL v10 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_statusCode != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
    BOOL v10 = 1;
  }
LABEL_19:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_changes hash];
  uint64_t v4 = [(NSData *)self->_sessionUUID hash];
  if (*(unsigned char *)&self->_has)
  {
    double sessionStartDate = self->_sessionStartDate;
    double v7 = -sessionStartDate;
    if (sessionStartDate >= 0.0) {
      double v7 = self->_sessionStartDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = [(HDCodableError *)self->_sessionError hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDCodableNanoSyncChangeSet addChanges:](self, "addChanges:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[HDCodableNanoSyncChangeSet setSessionUUID:](self, "setSessionUUID:");
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_double sessionStartDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  sessionError = self->_sessionError;
  uint64_t v11 = *((void *)v4 + 3);
  if (sessionError)
  {
    if (v11) {
      -[HDCodableError mergeFrom:](sessionError, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HDCodableNanoSyncChangeSet setSessionError:](self, "setSessionError:");
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_uint64_t statusCode = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (void)setChanges:(id)a3
{
}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (double)sessionStartDate
{
  return self->_sessionStartDate;
}

- (HDCodableError)sessionError
{
  return self->_sessionError;
}

@end