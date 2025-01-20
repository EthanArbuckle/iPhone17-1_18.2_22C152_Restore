@interface GEOProactiveItem
+ (BOOL)isValid:(id)a3;
- (BOOL)deleted;
- (BOOL)edited;
- (BOOL)hasDeleted;
- (BOOL)hasEdited;
- (BOOL)hasProactiveItemType;
- (BOOL)hasShared;
- (BOOL)hasTapped;
- (BOOL)hasTimeSinceStart;
- (BOOL)hasVisible;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shared;
- (BOOL)tapped;
- (BOOL)visible;
- (GEOProactiveItem)initWithDictionary:(id)a3;
- (GEOProactiveItem)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)proactiveItemTypeAsString:(int)a3;
- (int)StringAsProactiveItemType:(id)a3;
- (int)proactiveItemType;
- (int)timeSinceStart;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setEdited:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasEdited:(BOOL)a3;
- (void)setHasProactiveItemType:(BOOL)a3;
- (void)setHasShared:(BOOL)a3;
- (void)setHasTapped:(BOOL)a3;
- (void)setHasTimeSinceStart:(BOOL)a3;
- (void)setHasVisible:(BOOL)a3;
- (void)setProactiveItemType:(int)a3;
- (void)setShared:(BOOL)a3;
- (void)setTapped:(BOOL)a3;
- (void)setTimeSinceStart:(int)a3;
- (void)setVisible:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOProactiveItem

- (int)proactiveItemType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_proactiveItemType;
  }
  else {
    return 0;
  }
}

- (void)setProactiveItemType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_proactiveItemType = a3;
}

- (void)setHasProactiveItemType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasProactiveItemType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)proactiveItemTypeAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DB268[a3];
  }

  return v3;
}

- (int)StringAsProactiveItemType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PROACTIVE_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_ADDRESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FAVORITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_PARKED_CAR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_CALENDAR"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_BOOKED_CAR"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_TABLE_RESERVATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_TABLE_QUEUE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_APP_CONNECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_RESUME_NAV"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_TRANSIT_NAV"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_RECENTS_AND_PINS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_LOW_GAS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_VENUES"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FIM_HOTEL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FIM_CAR_RENTAL"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FIM_FLIGHT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FIM_TICKETED_EVENT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_PORTRAIT"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_USERPLACE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_VEHICLEADVERTISEMENT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_RATING_REQUEST"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"PROACTIVE_TYPE_FAVORITE_BUTTON"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)timeSinceStart
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_timeSinceStart;
  }
  else {
    return -1;
  }
}

- (void)setTimeSinceStart:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_timeSinceStart = a3;
}

- (void)setHasTimeSinceStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasTimeSinceStart
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x40u;
  self->_visible = a3;
}

- (void)setHasVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasVisible
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)tapped
{
  return self->_tapped;
}

- (void)setTapped:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_tapped = a3;
}

- (void)setHasTapped:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasTapped
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_shared = a3;
}

- (void)setHasShared:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasShared
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)edited
{
  return self->_edited;
}

- (void)setEdited:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_edited = a3;
}

- (void)setHasEdited:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasEdited
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOProactiveItem;
  int v4 = [(GEOProactiveItem *)&v8 description];
  v5 = [(GEOProactiveItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOProactiveItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_26;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = *(int *)(a1 + 8);
    if (v6 >= 0x17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E53DB268[v6];
    }
    if (a2) {
      objc_super v8 = @"proactiveItemType";
    }
    else {
      objc_super v8 = @"proactive_item_type";
    }
    [v4 setObject:v7 forKey:v8];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 12)];
    if (a2) {
      v10 = @"timeSinceStart";
    }
    else {
      v10 = @"time_since_start";
    }
    [v4 setObject:v9 forKey:v10];

    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 0x40) == 0)
    {
LABEL_12:
      if ((v5 & 0x20) == 0) {
        goto LABEL_13;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_12;
  }
  v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
  [v4 setObject:v11 forKey:@"visible"];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 19)];
  [v4 setObject:v12 forKey:@"tapped"];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0) {
      goto LABEL_15;
    }
LABEL_24:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
    [v4 setObject:v14 forKey:@"edited"];

    if ((*(unsigned char *)(a1 + 24) & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_23:
  v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 18)];
  [v4 setObject:v13 forKey:@"shared"];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 8) != 0) {
    goto LABEL_24;
  }
LABEL_15:
  if ((v5 & 4) != 0)
  {
LABEL_25:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
    [v4 setObject:v15 forKey:@"deleted"];
  }
LABEL_26:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOProactiveItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOProactiveItem)initWithDictionary:(id)a3
{
  return (GEOProactiveItem *)-[GEOProactiveItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_74;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_74;
  }
  if (a3) {
    uint64_t v6 = @"proactiveItemType";
  }
  else {
    uint64_t v6 = @"proactive_item_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"PROACTIVE_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_ADDRESS"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FAVORITE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_PARKED_CAR"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_CALENDAR"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_BOOKED_CAR"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_TABLE_RESERVATION"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_TABLE_QUEUE"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_APP_CONNECTION"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_RESUME_NAV"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_TRANSIT_NAV"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_RECENTS_AND_PINS"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_LOW_GAS"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_VENUES"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FIM_HOTEL"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FIM_CAR_RENTAL"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FIM_FLIGHT"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FIM_TICKETED_EVENT"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_PORTRAIT"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_USERPLACE"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_VEHICLEADVERTISEMENT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_RATING_REQUEST"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"PROACTIVE_TYPE_FAVORITE_BUTTON"])
    {
      uint64_t v9 = 22;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_57;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_57:
    [a1 setProactiveItemType:v9];
  }

  if (a3) {
    v10 = @"timeSinceStart";
  }
  else {
    v10 = @"time_since_start";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTimeSinceStart:", objc_msgSend(v11, "intValue"));
  }

  v12 = [v5 objectForKeyedSubscript:@"visible"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setVisible:", objc_msgSend(v12, "BOOLValue"));
  }

  v13 = [v5 objectForKeyedSubscript:@"tapped"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTapped:", objc_msgSend(v13, "BOOLValue"));
  }

  v14 = [v5 objectForKeyedSubscript:@"shared"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShared:", objc_msgSend(v14, "BOOLValue"));
  }

  v15 = [v5 objectForKeyedSubscript:@"edited"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEdited:", objc_msgSend(v15, "BOOLValue"));
  }

  v16 = [v5 objectForKeyedSubscript:@"deleted"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDeleted:", objc_msgSend(v16, "BOOLValue"));
  }

LABEL_74:
  return a1;
}

- (GEOProactiveItem)initWithJSON:(id)a3
{
  return (GEOProactiveItem *)-[GEOProactiveItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOProactiveItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOProactiveItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOProactiveItem *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[2] = self->_proactiveItemType;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = self->_timeSinceStart;
  *((unsigned char *)v5 + 24) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 20) = self->_visible;
  *((unsigned char *)v5 + 24) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v5 + 19) = self->_tapped;
  *((unsigned char *)v5 + 24) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)v5 + 18) = self->_shared;
  *((unsigned char *)v5 + 24) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *((unsigned char *)v5 + 17) = self->_edited;
  *((unsigned char *)v5 + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_8:
    *((unsigned char *)v5 + 16) = self->_deleted;
    *((unsigned char *)v5 + 24) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_proactiveItemType;
    *((unsigned char *)result + 24) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_timeSinceStart;
  *((unsigned char *)result + 24) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 20) = self->_visible;
  *((unsigned char *)result + 24) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 19) = self->_tapped;
  *((unsigned char *)result + 24) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 18) = self->_shared;
  *((unsigned char *)result + 24) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 4) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((unsigned char *)result + 17) = self->_edited;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_8:
  *((unsigned char *)result + 16) = self->_deleted;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  [(GEOProactiveItem *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_proactiveItemType != *((_DWORD *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_timeSinceStart != *((_DWORD *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x40) == 0) {
      goto LABEL_46;
    }
    if (self->_visible)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x20) == 0) {
      goto LABEL_46;
    }
    if (self->_tapped)
    {
      if (!*((unsigned char *)v4 + 19)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 19))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x10) == 0) {
      goto LABEL_46;
    }
    if (self->_shared)
    {
      if (!*((unsigned char *)v4 + 18)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 18))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0) {
      goto LABEL_46;
    }
    if (self->_edited)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_46;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) != 0)
    {
      if (self->_deleted)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_46;
        }
      }
      else if (*((unsigned char *)v4 + 16))
      {
        goto LABEL_46;
      }
      BOOL v5 = 1;
      goto LABEL_47;
    }
LABEL_46:
    BOOL v5 = 0;
  }
LABEL_47:

  return v5;
}

- (unint64_t)hash
{
  [(GEOProactiveItem *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_proactiveItemType;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_timeSinceStart;
      if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_visible;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_tapped;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_shared;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_edited;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_deleted;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_proactiveItemType = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_timeSinceStart = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x40) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_visible = *((unsigned char *)v5 + 20);
  *(unsigned char *)&self->_flags |= 0x40u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_tapped = *((unsigned char *)v5 + 19);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_shared = *((unsigned char *)v5 + 18);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 8) == 0)
  {
LABEL_7:
    if ((v4 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_edited = *((unsigned char *)v5 + 17);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 24) & 4) != 0)
  {
LABEL_8:
    self->_deleted = *((unsigned char *)v5 + 16);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_9:
}

@end