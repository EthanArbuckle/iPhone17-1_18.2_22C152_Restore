@interface GEOMapsTransitWidget
+ (BOOL)isValid:(id)a3;
+ (Class)transitIncidentItemType;
- (BOOL)everExpanded;
- (BOOL)hasEverExpanded;
- (BOOL)hasInitiallyExpanded;
- (BOOL)hasTappedItemIndex;
- (BOOL)hasTransitMessageType;
- (BOOL)initiallyExpanded;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapsTransitWidget)initWithDictionary:(id)a3;
- (GEOMapsTransitWidget)initWithJSON:(id)a3;
- (NSMutableArray)transitIncidentItems;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transitIncidentItemAtIndex:(unint64_t)a3;
- (id)transitMessageTypeAsString:(int)a3;
- (int)StringAsTransitMessageType:(id)a3;
- (int)tappedItemIndex;
- (int)transitMessageType;
- (unint64_t)hash;
- (unint64_t)transitIncidentItemsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addTransitIncidentItem:(id)a3;
- (void)clearTransitIncidentItems;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEverExpanded:(BOOL)a3;
- (void)setHasEverExpanded:(BOOL)a3;
- (void)setHasInitiallyExpanded:(BOOL)a3;
- (void)setHasTappedItemIndex:(BOOL)a3;
- (void)setHasTransitMessageType:(BOOL)a3;
- (void)setInitiallyExpanded:(BOOL)a3;
- (void)setTappedItemIndex:(int)a3;
- (void)setTransitIncidentItems:(id)a3;
- (void)setTransitMessageType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapsTransitWidget

- (int)transitMessageType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_transitMessageType;
  }
  else {
    return 0;
  }
}

- (void)setTransitMessageType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_transitMessageType = a3;
}

- (void)setHasTransitMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTransitMessageType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)transitMessageTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    char v3 = *(&off_1E53DB378 + a3);
  }

  return v3;
}

- (int)StringAsTransitMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSIT_MESSAGE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MESSAGE_TYPE_NO_FAVORITE_LINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MESSAGE_TYPE_NO_ADVISORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MESSAGE_TYPE_SINGLE_ADVISORY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MESSAGE_TYPE_MULTIPLE_ADVISORIES"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)transitIncidentItems
{
  return self->_transitIncidentItems;
}

- (void)setTransitIncidentItems:(id)a3
{
}

- (void)clearTransitIncidentItems
{
}

- (void)addTransitIncidentItem:(id)a3
{
  id v4 = a3;
  transitIncidentItems = self->_transitIncidentItems;
  id v8 = v4;
  if (!transitIncidentItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_transitIncidentItems;
    self->_transitIncidentItems = v6;

    id v4 = v8;
    transitIncidentItems = self->_transitIncidentItems;
  }
  [(NSMutableArray *)transitIncidentItems addObject:v4];
}

- (unint64_t)transitIncidentItemsCount
{
  return [(NSMutableArray *)self->_transitIncidentItems count];
}

- (id)transitIncidentItemAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_transitIncidentItems objectAtIndex:a3];
}

+ (Class)transitIncidentItemType
{
  return (Class)objc_opt_class();
}

- (BOOL)initiallyExpanded
{
  return self->_initiallyExpanded;
}

- (void)setInitiallyExpanded:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_initiallyExpanded = a3;
}

- (void)setHasInitiallyExpanded:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasInitiallyExpanded
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)everExpanded
{
  return self->_everExpanded;
}

- (void)setEverExpanded:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_everExpanded = a3;
}

- (void)setHasEverExpanded:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasEverExpanded
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOMapsTransitWidget;
  id v4 = [(GEOMapsTransitWidget *)&v8 description];
  v5 = [(GEOMapsTransitWidget *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsTransitWidget _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_41;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 20);
    if (v5 >= 5)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
    }
    else
    {
      v6 = *(&off_1E53DB378 + v5);
    }
    if (a2) {
      v7 = @"transitMessageType";
    }
    else {
      v7 = @"transit_message_type";
    }
    [v4 setObject:v6 forKey:v7];
  }
  if ([*(id *)(a1 + 8) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = *(id *)(a1 + 8);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    if (a2) {
      v16 = @"transitIncidentItem";
    }
    else {
      v16 = @"transit_incident_item";
    }
    [v4 setObject:v8 forKey:v16];
  }
  char v17 = *(unsigned char *)(a1 + 28);
  if ((v17 & 8) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_27;
    }
LABEL_33:
    v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    if (a2) {
      v21 = @"everExpanded";
    }
    else {
      v21 = @"ever_expanded";
    }
    [v4 setObject:v20 forKey:v21];

    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
  v18 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  if (a2) {
    v19 = @"initiallyExpanded";
  }
  else {
    v19 = @"initially_expanded";
  }
  [v4 setObject:v18 forKey:v19];

  char v17 = *(unsigned char *)(a1 + 28);
  if ((v17 & 4) != 0) {
    goto LABEL_33;
  }
LABEL_27:
  if (v17)
  {
LABEL_37:
    v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v23 = @"tappedItemIndex";
    }
    else {
      v23 = @"tapped_item_index";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapsTransitWidget _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsTransitWidget)initWithDictionary:(id)a3
{
  return (GEOMapsTransitWidget *)-[GEOMapsTransitWidget _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_55;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_55;
  }
  if (a3) {
    v6 = @"transitMessageType";
  }
  else {
    v6 = @"transit_message_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"TRANSIT_MESSAGE_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MESSAGE_TYPE_NO_FAVORITE_LINE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MESSAGE_TYPE_NO_ADVISORY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MESSAGE_TYPE_SINGLE_ADVISORY"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MESSAGE_TYPE_MULTIPLE_ADVISORIES"])
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
    [a1 setTransitMessageType:v9];
  }

  if (a3) {
    uint64_t v10 = @"transitIncidentItem";
  }
  else {
    uint64_t v10 = @"transit_incident_item";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOTransitIncidentItem alloc];
            if (a3) {
              uint64_t v19 = [(GEOTransitIncidentItem *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOTransitIncidentItem *)v18 initWithDictionary:v17];
            }
            v20 = (void *)v19;
            [a1 addTransitIncidentItem:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    id v5 = v28;
  }

  if (a3) {
    v21 = @"initiallyExpanded";
  }
  else {
    v21 = @"initially_expanded";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setInitiallyExpanded:", objc_msgSend(v22, "BOOLValue"));
  }

  if (a3) {
    v23 = @"everExpanded";
  }
  else {
    v23 = @"ever_expanded";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEverExpanded:", objc_msgSend(v24, "BOOLValue"));
  }

  if (a3) {
    long long v25 = @"tappedItemIndex";
  }
  else {
    long long v25 = @"tapped_item_index";
  }
  long long v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTappedItemIndex:", objc_msgSend(v26, "intValue"));
  }

LABEL_55:
  return a1;
}

- (GEOMapsTransitWidget)initWithJSON:(id)a3
{
  return (GEOMapsTransitWidget *)-[GEOMapsTransitWidget _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsTransitWidgetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsTransitWidgetReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_transitIncidentItems;
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
  if ((flags & 8) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (flags) {
LABEL_13:
  }
    PBDataWriterWriteInt32Field();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOMapsTransitWidget *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v9[5] = self->_transitMessageType;
    *((unsigned char *)v9 + 28) |= 2u;
  }
  if ([(GEOMapsTransitWidget *)self transitIncidentItemsCount])
  {
    [v9 clearTransitIncidentItems];
    unint64_t v4 = [(GEOMapsTransitWidget *)self transitIncidentItemsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOMapsTransitWidget *)self transitIncidentItemAtIndex:i];
        [v9 addTransitIncidentItem:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)v9 + 25) = self->_initiallyExpanded;
    *((unsigned char *)v9 + 28) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v9 + 24) = self->_everExpanded;
  *((unsigned char *)v9 + 28) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_10:
    v9[4] = self->_tappedItemIndex;
    *((unsigned char *)v9 + 28) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_transitMessageType;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_transitIncidentItems;
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
        [(id)v6 addTransitIncidentItem:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    *(unsigned char *)(v6 + 24) = self->_everExpanded;
    *(unsigned char *)(v6 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_13;
  }
  *(unsigned char *)(v6 + 25) = self->_initiallyExpanded;
  *(unsigned char *)(v6 + 28) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (flags)
  {
LABEL_13:
    *(_DWORD *)(v6 + 16) = self->_tappedItemIndex;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  [(GEOMapsTransitWidget *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 28);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_transitMessageType != *((_DWORD *)v4 + 5)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_30;
  }
  transitIncidentItems = self->_transitIncidentItems;
  if ((unint64_t)transitIncidentItems | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](transitIncidentItems, "isEqual:")) {
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_initiallyExpanded)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_everExpanded)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_26;
      }
    }
LABEL_30:
    BOOL v8 = 0;
    goto LABEL_31;
  }
  if ((v6 & 4) != 0) {
    goto LABEL_30;
  }
LABEL_26:
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_tappedItemIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_30;
    }
    BOOL v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  [(GEOMapsTransitWidget *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_transitMessageType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_transitIncidentItems hash];
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_initiallyExpanded;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_everExpanded;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_tappedItemIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_transitMessageType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
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
        -[GEOMapsTransitWidget addTransitIncidentItem:](self, "addTransitIncidentItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 28);
  if ((v10 & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    self->_everExpanded = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_flags |= 4u;
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  self->_initiallyExpanded = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_flags |= 8u;
  char v10 = *((unsigned char *)v4 + 28);
  if ((v10 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if (v10)
  {
LABEL_13:
    self->_tappedItemIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_14:
}

- (void).cxx_destruct
{
}

@end