@interface HDCodableNanoSyncStatus
+ (Class)anchorsType;
+ (id)persistentUserInfoKey;
+ (id)retreiveFromPersistentUserInfo:(id)a3;
+ (id)statusWithStatusCode:(int)a3;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)anchors;
- (NSString)description;
- (id)anchorsAtIndex:(unint64_t)a3;
- (id)copyForPersistentUserInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)nanoSyncDescription;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (int64_t)anchorForSyncEntityClass:(Class)a3;
- (int64_t)anchorForSyncEntityIdentifier:(id)a3;
- (unint64_t)anchorCount;
- (unint64_t)anchorsCount;
- (unint64_t)hash;
- (void)addAnchors:(id)a3;
- (void)addToPersistentUserInfo:(id)a3;
- (void)clearAnchors;
- (void)copyTo:(id)a3;
- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4;
- (void)setAnchors:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNanoSyncStatus

+ (id)retreiveFromPersistentUserInfo:(id)a3
{
  return GetFromPersistentUserInfo(a3, a1);
}

+ (id)persistentUserInfoKey
{
  return @"status";
}

- (void)addAnchors:(id)a3
{
  id v4 = a3;
  anchors = self->_anchors;
  id v8 = v4;
  if (!anchors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_anchors;
    self->_anchors = v6;

    id v4 = v8;
    anchors = self->_anchors;
  }
  [(NSMutableArray *)anchors addObject:v4];
}

- (id)nanoSyncDescription
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t statusCode = self->_statusCode;
    if (statusCode >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = off_1E6302D18[statusCode];
    }
  }
  else
  {
    v3 = @"(null)";
  }
  v5 = [(HDCodableNanoSyncStatus *)self anchors];
  v6 = HDNanoSyncDescriptionWithArray(v5);

  v7 = [NSString stringWithFormat:@"status:%@ anchors:%@", v3, v6];

  return v7;
}

- (NSMutableArray)anchors
{
  return self->_anchors;
}

- (int)statusCode
{
  if (*(unsigned char *)&self->_has) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (int64_t)anchorForSyncEntityClass:(Class)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [(objc_class *)a3 syncEntityIdentifier];
  v5 = [v4 codableEntityIdentifier];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(HDCodableNanoSyncStatus *)self anchors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        if ([*(id *)(v11 + 16) isEqual:v5])
        {
          int64_t v12 = *(void *)(v11 + 8);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int64_t v12 = -1;
LABEL_11:

  return v12;
}

- (void).cxx_destruct
{
}

+ (id)statusWithStatusCode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init(HDCodableNanoSyncStatus);
  [(HDCodableNanoSyncStatus *)v4 setStatusCode:v3];

  return v4;
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t statusCode = a3;
}

- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4
{
  uint64_t v9 = objc_alloc_init(HDCodableNanoSyncAnchor);
  uint64_t v7 = [(objc_class *)a4 syncEntityIdentifier];
  uint64_t v8 = [v7 codableEntityIdentifier];
  [(HDCodableNanoSyncAnchor *)v9 setEntityIdentifier:v8];

  if (objc_opt_respondsToSelector()) {
    [(HDCodableNanoSyncAnchor *)v9 setObjectType:[(objc_class *)a4 nanoSyncObjectType]];
  }
  [(HDCodableNanoSyncAnchor *)v9 setAnchor:a3];
  [(HDCodableNanoSyncStatus *)self addAnchors:v9];
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_anchors;
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
}

- (void)addToPersistentUserInfo:(id)a3
{
}

- (id)copyForPersistentUserInfo
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(HDCodableNanoSyncStatus);
  id v4 = v3;
  if (*(unsigned char *)&self->_has) {
    [(HDCodableNanoSyncStatus *)v3 setStatusCode:self->_statusCode];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(HDCodableNanoSyncStatus *)self anchors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9) copy];
        [(HDCodableNanoSyncStatus *)v4 addAnchors:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNanoSyncStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E63002C8[a3];
  }

  return v3;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownError"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Continue"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Resend"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Reactivate"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ChangesRequested"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LastChanceChangesRequested"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Obliterate"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearAnchors
{
}

- (unint64_t)anchorsCount
{
  return [(NSMutableArray *)self->_anchors count];
}

- (id)anchorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_anchors objectAtIndex:a3];
}

+ (Class)anchorsType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNanoSyncStatus;
  int v4 = [(HDCodableNanoSyncStatus *)&v8 description];
  v5 = [(HDCodableNanoSyncStatus *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t statusCode = self->_statusCode;
    if (statusCode >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_statusCode);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E63002C8[statusCode];
    }
    [v3 setObject:v5 forKey:@"statusCode"];
  }
  if ([(NSMutableArray *)self->_anchors count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_anchors, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_anchors;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"anchors"];
  }

  return v3;
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_statusCode;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  id v9 = v4;
  if ([(HDCodableNanoSyncStatus *)self anchorsCount])
  {
    [v9 clearAnchors];
    unint64_t v5 = [(HDCodableNanoSyncStatus *)self anchorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HDCodableNanoSyncStatus *)self anchorsAtIndex:i];
        [v9 addAnchors:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_anchors;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addAnchors:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  anchors = self->_anchors;
  if ((unint64_t)anchors | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](anchors, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_anchors hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_uint64_t statusCode = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[HDCodableNanoSyncStatus addAnchors:](self, "addAnchors:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setAnchors:(id)a3
{
}

- (int64_t)anchorForSyncEntityIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 codableEntityIdentifier];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(HDCodableNanoSyncStatus *)self anchors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = [v10 entityIdentifier];
        if (v11 == v4)
        {

LABEL_15:
          int64_t v15 = v10[1];
          goto LABEL_17;
        }
        long long v12 = v11;
        if (v4)
        {
          long long v13 = [v10 entityIdentifier];
          char v14 = [v13 isEqual:v4];

          if (v14) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      int64_t v15 = -1;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v15 = -1;
  }
LABEL_17:

  return v15;
}

- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, HDSyncEntityIdentifier *, uint64_t, unsigned char *))a3;
  unsigned __int8 v20 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(HDCodableNanoSyncStatus *)self anchors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      uint64_t v11 = [v10 hasAnchor] ? objc_msgSend(v10, "anchor") : -1;
      long long v12 = [v10 entityIdentifier];
      if (v12)
      {
        long long v13 = [[HDSyncEntityIdentifier alloc] initWithCodableEntityIdentifier:v12];
        char v14 = v13;
        if ((v11 & 0x8000000000000000) == 0 && v13) {
          v4[2](v4, v13, v11, &v20);
        }
      }
      else
      {
        char v14 = 0;
      }
      int v15 = v20;

      if (v15) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)anchorCount
{
  uint64_t v2 = [(HDCodableNanoSyncStatus *)self anchors];
  unint64_t v3 = [v2 count];

  return v3;
}

@end