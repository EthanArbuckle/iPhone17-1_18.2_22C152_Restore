@interface GEOMapsDestinationsWidget
+ (BOOL)isValid:(id)a3;
+ (Class)proactiveItemType;
- (BOOL)everExpanded;
- (BOOL)hasEverExpanded;
- (BOOL)hasInitiallyExpanded;
- (BOOL)hasTappedItemIndex;
- (BOOL)initiallyExpanded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapsDestinationsWidget)initWithDictionary:(id)a3;
- (GEOMapsDestinationsWidget)initWithJSON:(id)a3;
- (NSMutableArray)proactiveItems;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)proactiveItemAtIndex:(unint64_t)a3;
- (int)tappedItemIndex;
- (unint64_t)hash;
- (unint64_t)proactiveItemsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addProactiveItem:(id)a3;
- (void)clearProactiveItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEverExpanded:(BOOL)a3;
- (void)setHasEverExpanded:(BOOL)a3;
- (void)setHasInitiallyExpanded:(BOOL)a3;
- (void)setHasTappedItemIndex:(BOOL)a3;
- (void)setInitiallyExpanded:(BOOL)a3;
- (void)setProactiveItems:(id)a3;
- (void)setTappedItemIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapsDestinationsWidget

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

- (BOOL)initiallyExpanded
{
  return self->_initiallyExpanded;
}

- (void)setInitiallyExpanded:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_initiallyExpanded = a3;
}

- (void)setHasInitiallyExpanded:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasInitiallyExpanded
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)everExpanded
{
  return self->_everExpanded;
}

- (void)setEverExpanded:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_everExpanded = a3;
}

- (void)setHasEverExpanded:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEverExpanded
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)tappedItemIndex
{
  if (*(unsigned char *)&self->_flags) {
    return self->_tappedItemIndex;
  }
  else {
    return -1;
  }
}

- (void)setTappedItemIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_tappedItemIndex = a3;
}

- (void)setHasTappedItemIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTappedItemIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapsDestinationsWidget;
  id v4 = [(GEOMapsDestinationsWidget *)&v8 description];
  v5 = [(GEOMapsDestinationsWidget *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsDestinationsWidget _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_33;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 8) count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = *(id *)(a1 + 8);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v22);
          }
          objc_msgSend(v5, "addObject:", v12, (void)v22);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"proactiveItem";
    }
    else {
      v13 = @"proactive_item";
    }
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v22);
  }
  char v14 = *(unsigned char *)(a1 + 24);
  if ((v14 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
      goto LABEL_19;
    }
LABEL_25:
    v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
    if (a2) {
      v18 = @"everExpanded";
    }
    else {
      v18 = @"ever_expanded";
    }
    [v4 setObject:v17 forKey:v18];

    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
  if (a2) {
    v16 = @"initiallyExpanded";
  }
  else {
    v16 = @"initially_expanded";
  }
  [v4 setObject:v15 forKey:v16];

  char v14 = *(unsigned char *)(a1 + 24);
  if ((v14 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_19:
  if (v14)
  {
LABEL_29:
    v19 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v20 = @"tappedItemIndex";
    }
    else {
      v20 = @"tapped_item_index";
    }
    [v4 setObject:v19 forKey:v20];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapsDestinationsWidget _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsDestinationsWidget)initWithDictionary:(id)a3
{
  return (GEOMapsDestinationsWidget *)-[GEOMapsDestinationsWidget _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"proactiveItem";
      }
      else {
        id v6 = @"proactive_item";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v24 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v14 = [GEOProactiveWidgetItem alloc];
                if (a3) {
                  uint64_t v15 = [(GEOProactiveWidgetItem *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOProactiveWidgetItem *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addProactiveItem:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v24;
      }

      if (a3) {
        v17 = @"initiallyExpanded";
      }
      else {
        v17 = @"initially_expanded";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setInitiallyExpanded:", objc_msgSend(v18, "BOOLValue"));
      }

      if (a3) {
        v19 = @"everExpanded";
      }
      else {
        v19 = @"ever_expanded";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEverExpanded:", objc_msgSend(v20, "BOOLValue"));
      }

      if (a3) {
        v21 = @"tappedItemIndex";
      }
      else {
        v21 = @"tapped_item_index";
      }
      long long v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappedItemIndex:", objc_msgSend(v22, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOMapsDestinationsWidget)initWithJSON:(id)a3
{
  return (GEOMapsDestinationsWidget *)-[GEOMapsDestinationsWidget _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsDestinationsWidgetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsDestinationsWidgetReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if (flags) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEOMapsDestinationsWidget *)self readAll:0];
  if ([(GEOMapsDestinationsWidget *)self proactiveItemsCount])
  {
    [v9 clearProactiveItems];
    unint64_t v4 = [(GEOMapsDestinationsWidget *)self proactiveItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOMapsDestinationsWidget *)self proactiveItemAtIndex:i];
        [v9 addProactiveItem:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v9 + 21) = self->_initiallyExpanded;
    *((unsigned char *)v9 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v9 + 20) = self->_everExpanded;
  *((unsigned char *)v9 + 24) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((_DWORD *)v9 + 4) = self->_tappedItemIndex;
    *((unsigned char *)v9 + 24) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_proactiveItems;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addProactiveItem:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    *(unsigned char *)(v5 + 20) = self->_everExpanded;
    *(unsigned char *)(v5 + 24) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
  *(unsigned char *)(v5 + 21) = self->_initiallyExpanded;
  *(unsigned char *)(v5 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if (flags)
  {
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_tappedItemIndex;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOMapsDestinationsWidget *)self readAll:1];
  [v4 readAll:1];
  proactiveItems = self->_proactiveItems;
  if ((unint64_t)proactiveItems | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](proactiveItems, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_initiallyExpanded)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_everExpanded)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v6 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_tappedItemIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
    BOOL v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOMapsDestinationsWidget *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_proactiveItems hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_initiallyExpanded;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_everExpanded;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_tappedItemIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
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
        -[GEOMapsDestinationsWidget addProactiveItem:](self, "addProactiveItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 24);
  if ((v10 & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    self->_everExpanded = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_flags |= 2u;
    if ((*((unsigned char *)v4 + 24) & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  self->_initiallyExpanded = *((unsigned char *)v4 + 21);
  *(unsigned char *)&self->_flags |= 4u;
  char v10 = *((unsigned char *)v4 + 24);
  if ((v10 & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if (v10)
  {
LABEL_11:
    self->_tappedItemIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_12:
}

- (void).cxx_destruct
{
}

@end