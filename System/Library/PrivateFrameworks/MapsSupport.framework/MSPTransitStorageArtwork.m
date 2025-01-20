@interface MSPTransitStorageArtwork
- (BOOL)hasAccessibilityText;
- (BOOL)hasArtworkSourceType;
- (BOOL)hasArtworkUseType;
- (BOOL)hasHasRoutingIncidentBadge;
- (BOOL)hasIcon;
- (BOOL)hasIconFallbackShield;
- (BOOL)hasRoutingIncidentBadge;
- (BOOL)hasShield;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitTextDataSource)textDataSource;
- (MSPTransitStorageArtwork)initWithArtwork:(id)a3;
- (MSPTransitStorageIcon)icon;
- (MSPTransitStorageShield)iconFallbackShield;
- (MSPTransitStorageShield)shield;
- (NSString)accessibilityText;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)artworkSourceTypeAsString:(int)a3;
- (id)artworkUseTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsArtworkSourceType:(id)a3;
- (int)StringAsArtworkUseType:(id)a3;
- (int)artworkSourceType;
- (int)artworkUseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessibilityText:(id)a3;
- (void)setArtworkSourceType:(int)a3;
- (void)setArtworkUseType:(int)a3;
- (void)setHasArtworkSourceType:(BOOL)a3;
- (void)setHasArtworkUseType:(BOOL)a3;
- (void)setHasHasRoutingIncidentBadge:(BOOL)a3;
- (void)setHasRoutingIncidentBadge:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIconFallbackShield:(id)a3;
- (void)setShield:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageArtwork

- (MSPTransitStorageArtwork)initWithArtwork:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSPTransitStorageArtwork;
  v5 = [(MSPTransitStorageArtwork *)&v21 init];
  if (v5)
  {
    -[MSPTransitStorageArtwork setArtworkSourceType:](v5, "setArtworkSourceType:", [v4 artworkSourceType]);
    -[MSPTransitStorageArtwork setArtworkUseType:](v5, "setArtworkUseType:", [v4 artworkUseType]);
    v6 = [v4 shieldDataSource];

    if (v6)
    {
      v7 = [MSPTransitStorageShield alloc];
      v8 = [v4 shieldDataSource];
      v9 = [(MSPTransitStorageShield *)v7 initWithShield:v8];
      [(MSPTransitStorageArtwork *)v5 setShield:v9];
    }
    v10 = [v4 iconDataSource];

    if (v10)
    {
      v11 = [MSPTransitStorageIcon alloc];
      v12 = [v4 iconDataSource];
      v13 = [(MSPTransitStorageIcon *)v11 initWithIcon:v12];
      [(MSPTransitStorageArtwork *)v5 setIcon:v13];
    }
    v14 = [v4 iconFallbackShieldDataSource];

    if (v14)
    {
      v15 = [MSPTransitStorageShield alloc];
      v16 = [v4 iconFallbackShieldDataSource];
      v17 = [(MSPTransitStorageShield *)v15 initWithShield:v16];
      [(MSPTransitStorageArtwork *)v5 setIconFallbackShield:v17];
    }
    -[MSPTransitStorageArtwork setHasRoutingIncidentBadge:](v5, "setHasRoutingIncidentBadge:", [v4 hasRoutingIncidentBadge]);
    v18 = [v4 accessibilityText];
    [(MSPTransitStorageArtwork *)v5 setAccessibilityText:v18];

    v19 = v5;
  }

  return v5;
}

- (GEOTransitTextDataSource)textDataSource
{
  return 0;
}

- (void)setArtworkSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_artworkSourceType = a3;
}

- (void)setHasArtworkSourceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArtworkSourceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)artworkSourceTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E617CC50[a3];
  }

  return v3;
}

- (int)StringAsArtworkSourceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GEOTransitArtworkSourceTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkSourceTypeShield"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkSourceTypeIcon"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkSourceTypeText"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkSourceTypeSFSymbol"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setArtworkUseType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_artworkUseType = a3;
}

- (void)setHasArtworkUseType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasArtworkUseType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)artworkUseTypeAsString:(int)a3
{
  if (a3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E617CC78[a3];
  }

  return v3;
}

- (int)StringAsArtworkUseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeNone"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeLine"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeBrand"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeMode"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeSystem"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeTrip"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeAccessPoint"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeStation"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeTripRoutePlanning"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeManeuver"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeHall"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeStationLine"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"GEOTransitArtworkUseTypeVehiclePosition"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasShield
{
  return self->_shield != 0;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (BOOL)hasIconFallbackShield
{
  return self->_iconFallbackShield != 0;
}

- (void)setHasRoutingIncidentBadge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hasRoutingIncidentBadge = a3;
}

- (void)setHasHasRoutingIncidentBadge:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasRoutingIncidentBadge
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAccessibilityText
{
  return self->_accessibilityText != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageArtwork;
  int v4 = [(MSPTransitStorageArtwork *)&v8 description];
  v5 = [(MSPTransitStorageArtwork *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t artworkSourceType = self->_artworkSourceType;
    if (artworkSourceType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_artworkSourceType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E617CC50[artworkSourceType];
    }
    [v3 setObject:v6 forKey:@"artwork_source_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t artworkUseType = self->_artworkUseType;
    if (artworkUseType >= 0xD)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", self->_artworkUseType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E617CC78[artworkUseType];
    }
    [v3 setObject:v8 forKey:@"artwork_use_type"];
  }
  shield = self->_shield;
  if (shield)
  {
    v10 = [(MSPTransitStorageShield *)shield dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"shield"];
  }
  icon = self->_icon;
  if (icon)
  {
    v12 = [(MSPTransitStorageIcon *)icon dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"icon"];
  }
  iconFallbackShield = self->_iconFallbackShield;
  if (iconFallbackShield)
  {
    v14 = [(MSPTransitStorageShield *)iconFallbackShield dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"icon_fallback_shield"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_hasRoutingIncidentBadge];
    [v3 setObject:v15 forKey:@"has_routing_incident_badge"];
  }
  accessibilityText = self->_accessibilityText;
  if (accessibilityText) {
    [v3 setObject:accessibilityText forKey:@"accessibility_text"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v18 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageArtworkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_shield)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_accessibilityText)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[6] = self->_artworkSourceType;
    *((unsigned char *)v4 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[7] = self->_artworkUseType;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  id v6 = v4;
  if (self->_shield)
  {
    objc_msgSend(v4, "setShield:");
    id v4 = v6;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    id v4 = v6;
  }
  if (self->_iconFallbackShield)
  {
    objc_msgSend(v6, "setIconFallbackShield:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_hasRoutingIncidentBadge;
    *((unsigned char *)v4 + 60) |= 4u;
  }
  if (self->_accessibilityText)
  {
    objc_msgSend(v6, "setAccessibilityText:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_artworkSourceType;
    *(unsigned char *)(v5 + 60) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_artworkUseType;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v8 = [(MSPTransitStorageShield *)self->_shield copyWithZone:a3];
  v9 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v8;

  id v10 = [(MSPTransitStorageIcon *)self->_icon copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  id v12 = [(MSPTransitStorageShield *)self->_iconFallbackShield copyWithZone:a3];
  v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_hasRoutingIncidentBadge;
    *(unsigned char *)(v6 + 60) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_accessibilityText copyWithZone:a3];
  v15 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v14;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_artworkSourceType != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_artworkUseType != *((_DWORD *)v4 + 7)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_22;
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((void *)v4 + 6) && !-[MSPTransitStorageShield isEqual:](shield, "isEqual:")) {
    goto LABEL_22;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 4))
  {
    if (!-[MSPTransitStorageIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_22;
    }
  }
  iconFallbackShield = self->_iconFallbackShield;
  if ((unint64_t)iconFallbackShield | *((void *)v4 + 5))
  {
    if (!-[MSPTransitStorageShield isEqual:](iconFallbackShield, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_28;
    }
LABEL_22:
    char v8 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 60) & 4) == 0) {
    goto LABEL_22;
  }
  if (!self->_hasRoutingIncidentBadge)
  {
    if (!*((unsigned char *)v4 + 56)) {
      goto LABEL_28;
    }
    goto LABEL_22;
  }
  if (!*((unsigned char *)v4 + 56)) {
    goto LABEL_22;
  }
LABEL_28:
  accessibilityText = self->_accessibilityText;
  if ((unint64_t)accessibilityText | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](accessibilityText, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_23:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_artworkSourceType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_artworkUseType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(MSPTransitStorageShield *)self->_shield hash];
  unint64_t v6 = [(MSPTransitStorageIcon *)self->_icon hash];
  unint64_t v7 = [(MSPTransitStorageShield *)self->_iconFallbackShield hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_hasRoutingIncidentBadge;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_accessibilityText hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  unint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 60);
  if (v6)
  {
    self->_uint64_t artworkSourceType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_uint64_t artworkUseType = v4[7];
    *(unsigned char *)&self->_has |= 2u;
  }
  shield = self->_shield;
  uint64_t v8 = *((void *)v5 + 6);
  v13 = v5;
  if (shield)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[MSPTransitStorageShield mergeFrom:](shield, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[MSPTransitStorageArtwork setShield:](self, "setShield:");
  }
  unint64_t v5 = v13;
LABEL_11:
  icon = self->_icon;
  uint64_t v10 = *((void *)v5 + 4);
  if (icon)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[MSPTransitStorageIcon mergeFrom:](icon, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[MSPTransitStorageArtwork setIcon:](self, "setIcon:");
  }
  unint64_t v5 = v13;
LABEL_17:
  iconFallbackShield = self->_iconFallbackShield;
  uint64_t v12 = *((void *)v5 + 5);
  if (iconFallbackShield)
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[MSPTransitStorageShield mergeFrom:](iconFallbackShield, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[MSPTransitStorageArtwork setIconFallbackShield:](self, "setIconFallbackShield:");
  }
  unint64_t v5 = v13;
LABEL_23:
  if ((v5[15] & 4) != 0)
  {
    self->_hasRoutingIncidentBadge = *((unsigned char *)v5 + 56);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 2)) {
    -[MSPTransitStorageArtwork setAccessibilityText:](self, "setAccessibilityText:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int)artworkSourceType
{
  return self->_artworkSourceType;
}

- (int)artworkUseType
{
  return self->_artworkUseType;
}

- (MSPTransitStorageShield)shield
{
  return self->_shield;
}

- (void)setShield:(id)a3
{
}

- (MSPTransitStorageIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (MSPTransitStorageShield)iconFallbackShield
{
  return self->_iconFallbackShield;
}

- (void)setIconFallbackShield:(id)a3
{
}

- (BOOL)hasRoutingIncidentBadge
{
  return self->_hasRoutingIncidentBadge;
}

- (NSString)accessibilityText
{
  return self->_accessibilityText;
}

- (void)setAccessibilityText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_iconFallbackShield, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_accessibilityText, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end