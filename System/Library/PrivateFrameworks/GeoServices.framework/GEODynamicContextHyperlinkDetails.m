@interface GEODynamicContextHyperlinkDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayedString;
- (BOOL)hasLayoutType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODynamicContextHyperlinkDetails)initWithDictionary:(id)a3;
- (GEODynamicContextHyperlinkDetails)initWithJSON:(id)a3;
- (NSString)displayedString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)layoutTypeAsString:(int)a3;
- (int)StringAsLayoutType:(id)a3;
- (int)layoutType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayedString:(id)a3;
- (void)setHasLayoutType:(BOOL)a3;
- (void)setLayoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODynamicContextHyperlinkDetails

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_90;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_90;
  }
  if (a3) {
    v6 = @"layoutType";
  }
  else {
    v6 = @"layout_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"NAME"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"CATEGORY"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"DISTANCE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"PRICE"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"HOURS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"ADDRESS"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"RATINGS"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"TRANSIT_SHIELDS"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"USER_GENERATED_GUIDES"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"CURATED_GUIDES"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"EV_CHARGERS_NUMBER"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"STRING"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"SERVER_OVERRIDE"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"CONTAINMENT"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"RECENT"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"HIGHLIGHT_MAIN"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"HIGHLIGHT_EXTRA"])
    {
      uint64_t v9 = 18;
    }
    else if ([v8 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
    {
      uint64_t v9 = 19;
    }
    else if ([v8 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"PUBLISHER_DESCRIPTION"])
    {
      uint64_t v9 = 21;
    }
    else if ([v8 isEqualToString:@"SECONDARY_NAME"])
    {
      uint64_t v9 = 22;
    }
    else if ([v8 isEqualToString:@"FACTOID"])
    {
      uint64_t v9 = 23;
    }
    else if ([v8 isEqualToString:@"ARP_RATINGS"])
    {
      uint64_t v9 = 24;
    }
    else if ([v8 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
    {
      uint64_t v9 = 25;
    }
    else if ([v8 isEqualToString:@"DETOUR_TIME"])
    {
      uint64_t v9 = 26;
    }
    else if ([v8 isEqualToString:@"HIKING_DIFFICULTY"])
    {
      uint64_t v9 = 27;
    }
    else if ([v8 isEqualToString:@"HIKING_TRAIL_LENGTH"])
    {
      uint64_t v9 = 28;
    }
    else if ([v8 isEqualToString:@"PHOTO_CAROUSEL"])
    {
      uint64_t v9 = 29;
    }
    else if ([v8 isEqualToString:@"IN_USER_LIBRARY"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"USER_NOTE"])
    {
      uint64_t v9 = 31;
    }
    else if ([v8 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
    {
      uint64_t v9 = 32;
    }
    else if ([v8 isEqualToString:@"HIKE_ROUTE_TYPE"])
    {
      uint64_t v9 = 33;
    }
    else if ([v8 isEqualToString:@"HIKE_ROUTE_DURATION"])
    {
      uint64_t v9 = 34;
    }
    else if ([v8 isEqualToString:@"HIKE_ROUTE_LENGTH"])
    {
      uint64_t v9 = 35;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_83;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_83:
    [a1 setLayoutType:v9];
  }

  if (a3) {
    v10 = @"displayedString";
  }
  else {
    v10 = @"displayed_string";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setDisplayedString:v12];
  }
LABEL_90:

  return a1;
}

+ (BOOL)isValid:(id)a3
{
  return GEODynamicContextHyperlinkDetailsIsValid((char *)a3);
}

- (int)StringAsLayoutType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NAME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISTANCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PRICE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOURS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RATINGS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TRANSIT_SHIELDS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"USER_GENERATED_GUIDES"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CURATED_GUIDES"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"EV_CHARGERS_NUMBER"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"UGC_USER_SUBMITTED_RECOMMENDATIONS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"STRING"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SERVER_OVERRIDE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CONTAINMENT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RECENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_MAIN"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"HIGHLIGHT_EXTRA"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_NAME_FOR_GUIDE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"NUM_PLACES_IN_GUIDE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"PUBLISHER_DESCRIPTION"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SECONDARY_NAME"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FACTOID"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ARP_RATINGS"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"REAL_TIME_EV_CHARGER_AVAILABILITY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"DETOUR_TIME"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"HIKING_DIFFICULTY"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"HIKING_TRAIL_LENGTH"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"PHOTO_CAROUSEL"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"IN_USER_LIBRARY"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"USER_NOTE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_DURATION"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"HIKE_ROUTE_LENGTH"])
  {
    int v4 = 35;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 0x24)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53F75A0[v5];
      }
      if (a2) {
        v7 = @"layoutType";
      }
      else {
        v7 = @"layout_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    id v8 = [(id)a1 displayedString];
    if (v8)
    {
      if (a2) {
        uint64_t v9 = @"displayedString";
      }
      else {
        uint64_t v9 = @"displayed_string";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)layoutType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_layoutType;
  }
  else {
    return 0;
  }
}

- (void)setLayoutType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_layoutType = a3;
}

- (void)setHasLayoutType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasLayoutType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)layoutTypeAsString:(int)a3
{
  if (a3 >= 0x24)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F75A0[a3];
  }

  return v3;
}

- (BOOL)hasDisplayedString
{
  return self->_displayedString != 0;
}

- (NSString)displayedString
{
  return self->_displayedString;
}

- (void)setDisplayedString:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODynamicContextHyperlinkDetails;
  int v4 = [(GEODynamicContextHyperlinkDetails *)&v8 description];
  uint64_t v5 = [(GEODynamicContextHyperlinkDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODynamicContextHyperlinkDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEODynamicContextHyperlinkDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODynamicContextHyperlinkDetails)initWithDictionary:(id)a3
{
  return (GEODynamicContextHyperlinkDetails *)-[GEODynamicContextHyperlinkDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEODynamicContextHyperlinkDetails)initWithJSON:(id)a3
{
  return (GEODynamicContextHyperlinkDetails *)-[GEODynamicContextHyperlinkDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEODynamicContextHyperlinkDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_displayedString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEODynamicContextHyperlinkDetails *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_layoutType;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_displayedString)
  {
    objc_msgSend(v5, "setDisplayedString:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_layoutType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_displayedString copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEODynamicContextHyperlinkDetails *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_layoutType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  displayedString = self->_displayedString;
  if ((unint64_t)displayedString | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](displayedString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEODynamicContextHyperlinkDetails *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_layoutType;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_displayedString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[5])
  {
    self->_layoutType = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 1))
  {
    -[GEODynamicContextHyperlinkDetails setDisplayedString:](self, "setDisplayedString:");
    id v4 = v5;
  }
}

- (void).cxx_destruct
{
}

@end