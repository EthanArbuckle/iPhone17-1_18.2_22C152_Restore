@interface GEOWiFiPasspointInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNetworkType;
- (BOOL)hasVenueGroup;
- (BOOL)hasVenueName;
- (BOOL)hasVenueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiPasspointInfo)initWithDictionary:(id)a3;
- (GEOWiFiPasspointInfo)initWithJSON:(id)a3;
- (NSString)venueName;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)networkTypeAsString:(int)a3;
- (id)venueGroupAsString:(int)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)StringAsVenueGroup:(id)a3;
- (int)networkType;
- (int)venueGroup;
- (unint64_t)hash;
- (unsigned)venueType;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasVenueGroup:(BOOL)a3;
- (void)setHasVenueType:(BOOL)a3;
- (void)setNetworkType:(int)a3;
- (void)setVenueGroup:(int)a3;
- (void)setVenueName:(id)a3;
- (void)setVenueType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiPasspointInfo

- (int)networkType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53EA088[a3];
  }

  return v3;
}

- (int)StringAsNetworkType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)venueGroup
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_venueGroup;
  }
  else {
    return 0;
  }
}

- (void)setVenueGroup:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_venueGroup = a3;
}

- (void)setHasVenueGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVenueGroup
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)venueGroupAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53EA110[a3];
  }

  return v3;
}

- (int)StringAsVenueGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VENUE_GROUP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASSEMBLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EDUCATIONAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FACTORY_AND_INDUSTRIAL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INSTITUTIONAL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MERCANTILE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RESIDENTIAL"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"STORAGE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"UTILITY_AND_MISC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"VEHICULAR"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"OUTDOOR"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)venueType
{
  return self->_venueType;
}

- (void)setVenueType:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_venueType = a3;
}

- (void)setHasVenueType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasVenueType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasVenueName
{
  return self->_venueName != 0;
}

- (NSString)venueName
{
  return self->_venueName;
}

- (void)setVenueName:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiPasspointInfo;
  int v4 = [(GEOWiFiPasspointInfo *)&v8 description];
  v5 = [(GEOWiFiPasspointInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_9;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  char v3 = *(unsigned char *)(a1 + 28);
  if ((v3 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_16:
    uint64_t v9 = *(int *)(a1 + 20);
    if (v9 >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53EA110[v9];
    }
    [v2 setObject:v10 forKey:@"venueGroup"];

    if ((*(unsigned char *)(a1 + 28) & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v7 = *(int *)(a1 + 16);
  if (v7 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_1E53EA088[v7];
  }
  [v2 setObject:v8 forKey:@"networkType"];

  char v3 = *(unsigned char *)(a1 + 28);
  if ((v3 & 2) != 0) {
    goto LABEL_16;
  }
LABEL_4:
  if ((v3 & 4) != 0)
  {
LABEL_5:
    int v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v2 setObject:v4 forKey:@"venueType"];
  }
LABEL_6:
  v5 = [(id)a1 venueName];
  if (v5) {
    [v2 setObject:v5 forKey:@"venueName"];
  }

LABEL_9:

  return v2;
}

- (GEOWiFiPasspointInfo)initWithDictionary:(id)a3
{
  return (GEOWiFiPasspointInfo *)-[GEOWiFiPasspointInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_78;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_78;
  }
  int v4 = [v3 objectForKeyedSubscript:@"networkType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"UNKNOWN_NETWORK_TYPE"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"PRIVATE_NETWORK_TYPE"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"PRIVATE_WITH_GUEST_ACCESS_NETWORK_TYPE"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"CHARGEABLE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"FREE_PUBLIC_NETWORK_TYPE"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"PERSONAL_DEVICE_NETWORK_TYPE"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"EMERGENCY_SERVICE_ONLY_NETWORK_TYPE"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_1"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_2"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_3"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_4"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_5"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_6"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_7"])
    {
      uint64_t v6 = 13;
    }
    else if ([v5 isEqualToString:@"WIFI_NETWORK_TYPE_RESERVED_8"])
    {
      uint64_t v6 = 14;
    }
    else if ([v5 isEqualToString:@"TEST_OR_EXPERIMENTAL_NETWORK_TYPE"])
    {
      uint64_t v6 = 15;
    }
    else if ([v5 isEqualToString:@"WILDCARD_NETWORK_TYPE"])
    {
      uint64_t v6 = 16;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_43;
    }
    uint64_t v6 = [v4 intValue];
  }
  [a1 setNetworkType:v6];
LABEL_43:

  uint64_t v7 = [v3 objectForKeyedSubscript:@"venueGroup"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_VENUE_GROUP"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"ASSEMBLY"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"BUSINESS"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"EDUCATIONAL"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FACTORY_AND_INDUSTRIAL"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"INSTITUTIONAL"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"MERCANTILE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"RESIDENTIAL"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"STORAGE"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"UTILITY_AND_MISC"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"VEHICULAR"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"OUTDOOR"])
    {
      uint64_t v9 = 11;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_72;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_72:
    [a1 setVenueGroup:v9];
  }

  v10 = [v3 objectForKeyedSubscript:@"venueType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setVenueType:", objc_msgSend(v10, "unsignedIntValue"));
  }

  v11 = [v3 objectForKeyedSubscript:@"venueName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = (void *)[v11 copy];
    [a1 setVenueName:v12];
  }
LABEL_78:

  return a1;
}

- (GEOWiFiPasspointInfo)initWithJSON:(id)a3
{
  return (GEOWiFiPasspointInfo *)-[GEOWiFiPasspointInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiPasspointInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiPasspointInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_venueName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOWiFiPasspointInfo *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_networkType;
    *((unsigned char *)v6 + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 5) = self->_venueGroup;
  *((unsigned char *)v6 + 28) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 6) = self->_venueType;
    *((unsigned char *)v6 + 28) |= 4u;
  }
LABEL_5:
  if (self->_venueName)
  {
    objc_msgSend(v6, "setVenueName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_venueGroup;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_networkType;
  *(unsigned char *)(v5 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_venueType;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_venueName copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOWiFiPasspointInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_networkType != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_venueGroup != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_venueType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  venueName = self->_venueName;
  if ((unint64_t)venueName | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](venueName, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOWiFiPasspointInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_venueName hash];
  }
  uint64_t v3 = 2654435761 * self->_networkType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_venueGroup;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_venueType;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_venueName hash];
}

- (void)mergeFrom:(id)a3
{
  id v6 = a3;
  [v6 readAll:0];
  uint64_t v4 = v6;
  char v5 = *((unsigned char *)v6 + 28);
  if (v5)
  {
    self->_networkType = *((_DWORD *)v6 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v6 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v6 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_venueGroup = *((_DWORD *)v6 + 5);
  *(unsigned char *)&self->_flags |= 2u;
  if ((*((unsigned char *)v6 + 28) & 4) != 0)
  {
LABEL_4:
    self->_venueType = *((_DWORD *)v6 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
  if (*((void *)v6 + 1))
  {
    -[GEOWiFiPasspointInfo setVenueName:](self, "setVenueName:");
    uint64_t v4 = v6;
  }
}

- (void).cxx_destruct
{
}

@end