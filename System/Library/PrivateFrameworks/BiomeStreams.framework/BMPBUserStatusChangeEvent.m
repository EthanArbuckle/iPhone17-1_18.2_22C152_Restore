@interface BMPBUserStatusChangeEvent
+ (Class)idsHandlesType;
- (BOOL)hasIdsHandle;
- (BOOL)hasStatusChangeType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)idsHandles;
- (NSString)idsHandle;
- (NSString)statusChangeType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)idsHandlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)idsHandlesCount;
- (void)addIdsHandles:(id)a3;
- (void)clearIdsHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdsHandle:(id)a3;
- (void)setIdsHandles:(id)a3;
- (void)setStatusChangeType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserStatusChangeEvent

- (BOOL)hasIdsHandle
{
  return self->_idsHandle != 0;
}

- (BOOL)hasStatusChangeType
{
  return self->_statusChangeType != 0;
}

- (void)clearIdsHandles
{
}

- (void)addIdsHandles:(id)a3
{
  id v4 = a3;
  idsHandles = self->_idsHandles;
  id v8 = v4;
  if (!idsHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_idsHandles;
    self->_idsHandles = v6;

    id v4 = v8;
    idsHandles = self->_idsHandles;
  }
  [(NSMutableArray *)idsHandles addObject:v4];
}

- (unint64_t)idsHandlesCount
{
  return [(NSMutableArray *)self->_idsHandles count];
}

- (id)idsHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_idsHandles objectAtIndex:a3];
}

+ (Class)idsHandlesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserStatusChangeEvent;
  id v4 = [(BMPBUserStatusChangeEvent *)&v8 description];
  v5 = [(BMPBUserStatusChangeEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  idsHandle = self->_idsHandle;
  if (idsHandle) {
    [v3 setObject:idsHandle forKey:@"idsHandle"];
  }
  statusChangeType = self->_statusChangeType;
  if (statusChangeType) {
    [v4 setObject:statusChangeType forKey:@"statusChangeType"];
  }
  idsHandles = self->_idsHandles;
  if (idsHandles) {
    [v4 setObject:idsHandles forKey:@"idsHandles"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserStatusChangeEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idsHandle) {
    PBDataWriterWriteStringField();
  }
  if (self->_statusChangeType) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_idsHandles;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_idsHandle) {
    objc_msgSend(v8, "setIdsHandle:");
  }
  if (self->_statusChangeType) {
    objc_msgSend(v8, "setStatusChangeType:");
  }
  if ([(BMPBUserStatusChangeEvent *)self idsHandlesCount])
  {
    [v8 clearIdsHandles];
    unint64_t v4 = [(BMPBUserStatusChangeEvent *)self idsHandlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBUserStatusChangeEvent *)self idsHandlesAtIndex:i];
        [v8 addIdsHandles:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_idsHandle copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_statusChangeType copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_idsHandles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addIdsHandles:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((idsHandle = self->_idsHandle, !((unint64_t)idsHandle | v4[1]))
     || -[NSString isEqual:](idsHandle, "isEqual:"))
    && ((statusChangeType = self->_statusChangeType, !((unint64_t)statusChangeType | v4[3]))
     || -[NSString isEqual:](statusChangeType, "isEqual:")))
  {
    idsHandles = self->_idsHandles;
    if ((unint64_t)idsHandles | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](idsHandles, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idsHandle hash];
  NSUInteger v4 = [(NSString *)self->_statusChangeType hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_idsHandles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[BMPBUserStatusChangeEvent setIdsHandle:](self, "setIdsHandle:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBUserStatusChangeEvent setStatusChangeType:](self, "setStatusChangeType:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[BMPBUserStatusChangeEvent addIdsHandles:](self, "addIdsHandles:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)idsHandle
{
  return self->_idsHandle;
}

- (void)setIdsHandle:(id)a3
{
}

- (NSString)statusChangeType
{
  return self->_statusChangeType;
}

- (void)setStatusChangeType:(id)a3
{
}

- (NSMutableArray)idsHandles
{
  return self->_idsHandles;
}

- (void)setIdsHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusChangeType, 0);
  objc_storeStrong((id *)&self->_idsHandles, 0);

  objc_storeStrong((id *)&self->_idsHandle, 0);
}

@end