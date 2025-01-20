@interface GEOWiFiAP
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChannel;
- (BOOL)hasOrigin;
- (BOOL)hasRssi;
- (BOOL)hasUniqueID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiAP)initWithDictionary:(id)a3;
- (GEOWiFiAP)initWithJSON:(id)a3;
- (NSString)uniqueID;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)originAsString:(int)a3;
- (int)StringAsOrigin:(id)a3;
- (int)origin;
- (int)rssi;
- (unint64_t)hash;
- (unsigned)channel;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setRssi:(int)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiAP

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChannel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)origin
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_origin;
  }
  else {
    return 0;
  }
}

- (void)setOrigin:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_origin = a3;
}

- (void)setHasOrigin:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasOrigin
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)originAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E9DF0[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ORIGIN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROAM_CACHE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCAN_CACHE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiAP;
  int v4 = [(GEOWiFiAP *)&v8 description];
  v5 = [(GEOWiFiAP *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v2 = 0;
    goto LABEL_14;
  }
  [(id)a1 readAll:1];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [(id)a1 uniqueID];
  if (v3) {
    [v2 setObject:v3 forKey:@"uniqueID"];
  }

  char v4 = *(unsigned char *)(a1 + 28);
  if ((v4 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v2 setObject:v6 forKey:@"channel"];

    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v7 = *(int *)(a1 + 20);
    if (v7 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E53E9DF0[v7];
    }
    [v2 setObject:v8 forKey:@"origin"];

    goto LABEL_14;
  }
  v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
  [v2 setObject:v5 forKey:@"rssi"];

  char v4 = *(unsigned char *)(a1 + 28);
  if (v4) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v4 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_14:

  return v2;
}

- (GEOWiFiAP)initWithDictionary:(id)a3
{
  return (GEOWiFiAP *)-[GEOWiFiAP _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      char v4 = [v3 objectForKeyedSubscript:@"uniqueID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[v4 copy];
        [a1 setUniqueID:v5];
      }
      v6 = [v3 objectForKeyedSubscript:@"rssi"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRssi:", objc_msgSend(v6, "intValue"));
      }

      uint64_t v7 = [v3 objectForKeyedSubscript:@"channel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setChannel:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v3 objectForKeyedSubscript:@"origin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"UNKNOWN_ORIGIN"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"ROAM_CACHE"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"SCAN_CACHE"])
        {
          uint64_t v10 = 2;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_21:

          goto LABEL_22;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setOrigin:v10];
      goto LABEL_21;
    }
  }
LABEL_22:

  return a1;
}

- (GEOWiFiAP)initWithJSON:(id)a3
{
  return (GEOWiFiAP *)-[GEOWiFiAP _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiAPIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiAPReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWiFiAP *)self readAll:0];
  if (self->_uniqueID) {
    objc_msgSend(v5, "setUniqueID:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_rssi;
    *((unsigned char *)v5 + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_5:
      if ((flags & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 4) = self->_channel;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 5) = self->_origin;
    *((unsigned char *)v5 + 28) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_channel;
    *(unsigned char *)(v5 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_rssi;
  *(unsigned char *)(v5 + 28) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_origin;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOWiFiAP *)self readAll:1];
  [v4 readAll:1];
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_rssi != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_channel != *((_DWORD *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 5)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  [(GEOWiFiAP *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_uniqueID hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_rssi;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_channel;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_origin;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOWiFiAP setUniqueID:](self, "setUniqueID:");
  }
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_rssi = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_5:
      if ((v4 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_channel = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
LABEL_6:
    self->_origin = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end