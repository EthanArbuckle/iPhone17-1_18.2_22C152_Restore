@interface _MPCProtoContainer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)addItem:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_identifierSet, 0);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_containerType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_MPCProtoContainerIdentifierSet *)self->_identifierSet hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_items hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_playActivityFeatureName hash];
  return v6 ^ [(NSString *)self->_playActivityQueueGroupingID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_containerType != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  identifierSet = self->_identifierSet;
  if ((unint64_t)identifierSet | *((void *)v4 + 2)
    && !-[_MPCProtoContainerIdentifierSet isEqual:](identifierSet, "isEqual:"))
  {
    goto LABEL_15;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:")) {
      goto LABEL_15;
    }
  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if ((unint64_t)playActivityFeatureName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](playActivityFeatureName, "isEqual:")) {
      goto LABEL_15;
    }
  }
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if ((unint64_t)playActivityQueueGroupingID | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](playActivityQueueGroupingID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_containerType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v7 = [(_MPCProtoContainerIdentifierSet *)self->_identifierSet copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v9 = self->_items;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (void)v20);
        -[_MPCProtoContainer addItem:]((uint64_t)v6, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_playActivityFeatureName copyWithZone:a3];
  v16 = (void *)v6[4];
  v6[4] = v15;

  uint64_t v17 = [(NSString *)self->_playActivityQueueGroupingID copyWithZone:a3];
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (void)addItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      NSUInteger v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_identifierSet) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_items;
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

  if (self->_playActivityFeatureName) {
    PBDataWriterWriteStringField();
  }
  if (self->_playActivityQueueGroupingID) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_containerType];
    [v3 setObject:v4 forKey:@"containerType"];
  }
  identifierSet = self->_identifierSet;
  if (identifierSet)
  {
    uint64_t v6 = [(_MPCProtoContainerIdentifierSet *)identifierSet dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"identifierSet"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = self->_items;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"item"];
  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if (playActivityFeatureName) {
    [v3 setObject:playActivityFeatureName forKey:@"playActivityFeatureName"];
  }
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if (playActivityQueueGroupingID) {
    [v3 setObject:playActivityQueueGroupingID forKey:@"playActivityQueueGroupingID"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoContainer;
  id v4 = [(_MPCProtoContainer *)&v8 description];
  id v5 = [(_MPCProtoContainer *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end