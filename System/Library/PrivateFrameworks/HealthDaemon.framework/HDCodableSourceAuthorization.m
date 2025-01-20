@interface HDCodableSourceAuthorization
+ (Class)authorizationsType;
- (BOOL)hasBackupUUID;
- (BOOL)hasSource;
- (BOOL)hasSourceUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSource)source;
- (NSData)backupUUID;
- (NSData)sourceUUID;
- (NSMutableArray)authorizations;
- (id)authorizationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedBackupUUID;
- (id)decodedSourceUUID;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)authorizationsCount;
- (unint64_t)hash;
- (void)addAuthorizations:(id)a3;
- (void)clearAuthorizations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthorizations:(id)a3;
- (void)setBackupUUID:(id)a3;
- (void)setSource:(id)a3;
- (void)setSourceUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSourceAuthorization

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)clearAuthorizations
{
}

- (void)addAuthorizations:(id)a3
{
  id v4 = a3;
  authorizations = self->_authorizations;
  id v8 = v4;
  if (!authorizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_authorizations;
    self->_authorizations = v6;

    id v4 = v8;
    authorizations = self->_authorizations;
  }
  [(NSMutableArray *)authorizations addObject:v4];
}

- (unint64_t)authorizationsCount
{
  return [(NSMutableArray *)self->_authorizations count];
}

- (id)authorizationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_authorizations objectAtIndex:a3];
}

+ (Class)authorizationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBackupUUID
{
  return self->_backupUUID != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSourceAuthorization;
  id v4 = [(HDCodableSourceAuthorization *)&v8 description];
  v5 = [(HDCodableSourceAuthorization *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sourceUUID = self->_sourceUUID;
  if (sourceUUID) {
    [v3 setObject:sourceUUID forKey:@"sourceUUID"];
  }
  if ([(NSMutableArray *)self->_authorizations count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_authorizations, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = self->_authorizations;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"authorizations"];
  }
  backupUUID = self->_backupUUID;
  if (backupUUID) {
    [v4 setObject:backupUUID forKey:@"backupUUID"];
  }
  source = self->_source;
  if (source)
  {
    v15 = [(HDCodableSource *)source dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"source"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSourceAuthorizationReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sourceUUID) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_authorizations;
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

  if (self->_backupUUID) {
    PBDataWriterWriteDataField();
  }
  if (self->_source) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_sourceUUID) {
    objc_msgSend(v9, "setSourceUUID:");
  }
  if ([(HDCodableSourceAuthorization *)self authorizationsCount])
  {
    [v9 clearAuthorizations];
    unint64_t v4 = [(HDCodableSourceAuthorization *)self authorizationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableSourceAuthorization *)self authorizationsAtIndex:i];
        [v9 addAuthorizations:v7];
      }
    }
  }
  if (self->_backupUUID) {
    objc_msgSend(v9, "setBackupUUID:");
  }
  uint64_t v8 = v9;
  if (self->_source)
  {
    objc_msgSend(v9, "setSource:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_sourceUUID copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_authorizations;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [v5 addAuthorizations:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_backupUUID copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(HDCodableSource *)self->_source copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sourceUUID = self->_sourceUUID, !((unint64_t)sourceUUID | v4[4]))
     || -[NSData isEqual:](sourceUUID, "isEqual:"))
    && ((authorizations = self->_authorizations, !((unint64_t)authorizations | v4[1]))
     || -[NSMutableArray isEqual:](authorizations, "isEqual:"))
    && ((backupUUID = self->_backupUUID, !((unint64_t)backupUUID | v4[2]))
     || -[NSData isEqual:](backupUUID, "isEqual:")))
  {
    source = self->_source;
    if ((unint64_t)source | v4[3]) {
      char v9 = -[HDCodableSource isEqual:](source, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_sourceUUID hash];
  uint64_t v4 = [(NSMutableArray *)self->_authorizations hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_backupUUID hash];
  return v4 ^ v5 ^ [(HDCodableSource *)self->_source hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[HDCodableSourceAuthorization setSourceUUID:](self, "setSourceUUID:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[HDCodableSourceAuthorization addAuthorizations:](self, "addAuthorizations:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[HDCodableSourceAuthorization setBackupUUID:](self, "setBackupUUID:");
  }
  source = self->_source;
  uint64_t v11 = *((void *)v4 + 3);
  if (source)
  {
    if (v11) {
      -[HDCodableSource mergeFrom:](source, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HDCodableSourceAuthorization setSource:](self, "setSource:");
  }
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
}

- (NSMutableArray)authorizations
{
  return self->_authorizations;
}

- (void)setAuthorizations:(id)a3
{
}

- (NSData)backupUUID
{
  return self->_backupUUID;
}

- (void)setBackupUUID:(id)a3
{
}

- (HDCodableSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);

  objc_storeStrong((id *)&self->_authorizations, 0);
}

- (id)decodedSourceUUID
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_sourceUUID);
}

- (id)decodedBackupUUID
{
  return (id)objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", self->_backupUUID);
}

@end