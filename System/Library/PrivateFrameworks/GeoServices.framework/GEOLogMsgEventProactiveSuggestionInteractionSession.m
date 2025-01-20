@interface GEOLogMsgEventProactiveSuggestionInteractionSession
+ (BOOL)isValid:(id)a3;
+ (Class)proactiveItemType;
- (BOOL)hasDuration;
- (BOOL)hasInteractedItemIndex;
- (BOOL)hasListType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithDictionary:(id)a3;
- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithJSON:(id)a3;
- (NSMutableArray)proactiveItems;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)listTypeAsString:(int)a3;
- (id)proactiveItemAtIndex:(unint64_t)a3;
- (int)StringAsListType:(id)a3;
- (int)duration;
- (int)interactedItemIndex;
- (int)listType;
- (unint64_t)hash;
- (unint64_t)proactiveItemsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addProactiveItem:(id)a3;
- (void)clearProactiveItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasInteractedItemIndex:(BOOL)a3;
- (void)setHasListType:(BOOL)a3;
- (void)setInteractedItemIndex:(int)a3;
- (void)setListType:(int)a3;
- (void)setProactiveItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventProactiveSuggestionInteractionSession

- (int)listType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_listType;
  }
  else {
    return 0;
  }
}

- (void)setListType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_listType = a3;
}

- (void)setHasListType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasListType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)listTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DB240[a3];
  }

  return v3;
}

- (int)StringAsListType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LIST_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_MAPS_WIDGET"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_SEARCH_TRAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_CAR_PLAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LIST_TYPE_WATCH"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)proactiveItems
{
  return self->_proactiveItems;
}

- (void)setProactiveItems:(id)a3
{
}

- (void)clearProactiveItems
{
}

- (void)addProactiveItem:(id)a3
{
  id v4 = a3;
  proactiveItems = self->_proactiveItems;
  id v8 = v4;
  if (!proactiveItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_proactiveItems;
    self->_proactiveItems = v6;

    id v4 = v8;
    proactiveItems = self->_proactiveItems;
  }
  [(NSMutableArray *)proactiveItems addObject:v4];
}

- (unint64_t)proactiveItemsCount
{
  return [(NSMutableArray *)self->_proactiveItems count];
}

- (id)proactiveItemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proactiveItems objectAtIndex:a3];
}

+ (Class)proactiveItemType
{
  return (Class)objc_opt_class();
}

- (int)duration
{
  return self->_duration;
}

- (void)setDuration:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)interactedItemIndex
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_interactedItemIndex;
  }
  else {
    return -1;
  }
}

- (void)setInteractedItemIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_interactedItemIndex = a3;
}

- (void)setHasInteractedItemIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasInteractedItemIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventProactiveSuggestionInteractionSession;
  id v4 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)&v8 description];
  v5 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventProactiveSuggestionInteractionSession _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 28) & 4) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DB240[v5];
      }
      if (a2) {
        v7 = @"listType";
      }
      else {
        v7 = @"list_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    if ([*(id *)(a1 + 8) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = *(id *)(a1 + 8);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = [v14 dictionaryRepresentation];
            }
            [v8 addObject:v15];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v11);
      }

      if (a2) {
        v16 = @"proactiveItem";
      }
      else {
        v16 = @"proactive_item";
      }
      [v4 setObject:v8 forKey:v16];
    }
    char v17 = *(unsigned char *)(a1 + 28);
    if (v17)
    {
      v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v18 forKey:@"duration"];

      char v17 = *(unsigned char *)(a1 + 28);
    }
    if ((v17 & 2) != 0)
    {
      v19 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v20 = @"interactedItemIndex";
      }
      else {
        v20 = @"interacted_item_index";
      }
      [v4 setObject:v19 forKey:v20];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventProactiveSuggestionInteractionSession _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventProactiveSuggestionInteractionSession *)-[GEOLogMsgEventProactiveSuggestionInteractionSession _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_47;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_47;
  }
  if (a3) {
    v6 = @"listType";
  }
  else {
    v6 = @"list_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"LIST_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_MAPS_WIDGET"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_SEARCH_TRAY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_CAR_PLAY"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"LIST_TYPE_WATCH"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setListType:v9];
  }

  if (a3) {
    uint64_t v10 = @"proactiveItem";
  }
  else {
    uint64_t v10 = @"proactive_item";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOProactiveItem alloc];
            if (a3) {
              uint64_t v19 = [(GEOProactiveItem *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOProactiveItem *)v18 initWithDictionary:v17];
            }
            v20 = (void *)v19;
            [a1 addProactiveItem:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }

    id v5 = v25;
  }

  v21 = [v5 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDuration:", objc_msgSend(v21, "intValue"));
  }

  if (a3) {
    long long v22 = @"interactedItemIndex";
  }
  else {
    long long v22 = @"interacted_item_index";
  }
  long long v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInteractedItemIndex:", objc_msgSend(v23, "intValue"));
  }

LABEL_47:
  return a1;
}

- (GEOLogMsgEventProactiveSuggestionInteractionSession)initWithJSON:(id)a3
{
  return (GEOLogMsgEventProactiveSuggestionInteractionSession *)-[GEOLogMsgEventProactiveSuggestionInteractionSession _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventProactiveSuggestionInteractionSessionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventProactiveSuggestionInteractionSessionReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_proactiveItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_listType;
    *((unsigned char *)v9 + 28) |= 4u;
  }
  if ([(GEOLogMsgEventProactiveSuggestionInteractionSession *)self proactiveItemsCount])
  {
    [v9 clearProactiveItems];
    unint64_t v4 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self proactiveItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self proactiveItemAtIndex:i];
        [v9 addProactiveItem:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v9[4] = self->_duration;
    *((unsigned char *)v9 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v9[5] = self->_interactedItemIndex;
    *((unsigned char *)v9 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_listType;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_proactiveItems;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addProactiveItem:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v6 + 16) = self->_duration;
    *(unsigned char *)(v6 + 28) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_interactedItemIndex;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 28);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_listType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  proactiveItems = self->_proactiveItems;
  if ((unint64_t)proactiveItems | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](proactiveItems, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_duration != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (v6)
  {
    goto LABEL_19;
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_interactedItemIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventProactiveSuggestionInteractionSession *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_listType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_proactiveItems hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v5 = 2654435761 * self->_duration;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_interactedItemIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    self->_listType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEventProactiveSuggestionInteractionSession addProactiveItem:](self, "addProactiveItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 28);
  if (v10)
  {
    self->_duration = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v4 + 28);
  }
  if ((v10 & 2) != 0)
  {
    self->_interactedItemIndex = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end