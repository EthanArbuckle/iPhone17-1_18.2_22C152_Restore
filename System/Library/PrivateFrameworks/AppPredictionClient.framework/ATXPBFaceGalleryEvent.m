@interface ATXPBFaceGalleryEvent
+ (uint64_t)itemsType;
- (BOOL)hasConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(id *)a1;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)addItems:(uint64_t)a1;
- (uint64_t)clearItems;
- (uint64_t)configuration;
- (uint64_t)eventType;
- (uint64_t)hasEventType;
- (uint64_t)items;
- (uint64_t)itemsCount;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setConfiguration:(uint64_t)a1;
- (void)setItems:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBFaceGalleryEvent

- (uint64_t)eventType
{
  if (result)
  {
    if (*(unsigned char *)(result + 32)) {
      return *(unsigned int *)(result + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 1u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return *(unsigned char *)(result + 32) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D07DD0[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"GalleryDidAppear"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"GalleryDidDisappear"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"GalleryItemsDidAppear"])
    {
      uint64_t v6 = 3;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasConfiguration
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (uint64_t)clearItems
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)addItems:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      id v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)itemsCount
{
  if (result) {
    return [*(id *)(result + 24) count];
  }
  return result;
}

- (id)itemsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)itemsType
{
  self;

  return objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBFaceGalleryEvent;
  id v4 = [(ATXPBFaceGalleryEvent *)&v8 description];
  id v5 = [(ATXPBFaceGalleryEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5D07DD0[eventType];
    }
    [v3 setObject:v5 forKey:@"eventType"];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    v7 = [(ATXPBFaceGalleryConfiguration *)configuration dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"configuration"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = self->_items;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"items"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_configuration) {
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
}

- (void)copyTo:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      *((_DWORD *)v8 + 4) = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v8 + 32) |= 1u;
    }
    id v3 = *(void **)(a1 + 8);
    if (v3) {
      -[ATXPBFaceGalleryEvent setConfiguration:]((uint64_t)v8, v3);
    }
    if ([*(id *)(a1 + 24) count])
    {
      if (v8) {
        [*((id *)v8 + 3) removeAllObjects];
      }
      uint64_t v4 = [*(id *)(a1 + 24) count];
      if (v4)
      {
        uint64_t v5 = v4;
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t v7 = [*(id *)(a1 + 24) objectAtIndex:i];
          -[ATXPBFaceGalleryEvent addItems:]((uint64_t)v8, v7);
        }
      }
    }
  }
}

- (void)setConfiguration:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(ATXPBFaceGalleryConfiguration *)self->_configuration copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_items;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        -[ATXPBFaceGalleryEvent addItems:]((uint64_t)v6, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  configuration = self->_configuration;
  if ((unint64_t)configuration | *((void *)v4 + 1)
    && !-[ATXPBFaceGalleryConfiguration isEqual:](configuration, "isEqual:"))
  {
    goto LABEL_11;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](items, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ATXPBFaceGalleryConfiguration *)self->_configuration hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_items hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    if ((_BYTE)v3[4])
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 32) |= 1u;
    }
    id v5 = v3[1];
    if (*(void *)(a1 + 8))
    {
      if (v5) {
        -[ATXPBFaceGalleryConfiguration mergeFrom:](*(void *)(a1 + 8), v5);
      }
    }
    else if (v5)
    {
      objc_storeStrong((id *)(a1 + 8), v5);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4[3];
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
          -[ATXPBFaceGalleryEvent addItems:](a1, *(void **)(*((void *)&v11 + 1) + 8 * i));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (uint64_t)configuration
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)items
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setItems:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end