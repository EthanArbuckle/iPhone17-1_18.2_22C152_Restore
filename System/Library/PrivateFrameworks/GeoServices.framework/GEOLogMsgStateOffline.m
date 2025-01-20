@interface GEOLogMsgStateOffline
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsMapsInOfflineMode;
- (BOOL)hasIsNetworkConnected;
- (BOOL)hasIsOnlyUseOffline;
- (BOOL)hasNumberOfDownloadedRegions;
- (BOOL)hasRoutingOdsVersion;
- (BOOL)hasSearchOdsVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMapsInOfflineMode;
- (BOOL)isNetworkConnected;
- (BOOL)isOnlyUseOffline;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateOffline)initWithDictionary:(id)a3;
- (GEOLogMsgStateOffline)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)routingOdsVersion;
- (unint64_t)searchOdsVersion;
- (unsigned)numberOfDownloadedRegions;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMapsInOfflineMode:(BOOL)a3;
- (void)setHasIsNetworkConnected:(BOOL)a3;
- (void)setHasIsOnlyUseOffline:(BOOL)a3;
- (void)setHasNumberOfDownloadedRegions:(BOOL)a3;
- (void)setHasRoutingOdsVersion:(BOOL)a3;
- (void)setHasSearchOdsVersion:(BOOL)a3;
- (void)setIsMapsInOfflineMode:(BOOL)a3;
- (void)setIsNetworkConnected:(BOOL)a3;
- (void)setIsOnlyUseOffline:(BOOL)a3;
- (void)setNumberOfDownloadedRegions:(unsigned int)a3;
- (void)setRoutingOdsVersion:(unint64_t)a3;
- (void)setSearchOdsVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateOffline

- (BOOL)isMapsInOfflineMode
{
  return self->_isMapsInOfflineMode;
}

- (void)setIsMapsInOfflineMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isMapsInOfflineMode = a3;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_7:
  }
    PBDataWriterWriteUint64Field();
LABEL_8:
}

- (void)setHasIsMapsInOfflineMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsMapsInOfflineMode
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)isNetworkConnected
{
  return self->_isNetworkConnected;
}

- (void)setIsNetworkConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isNetworkConnected = a3;
}

- (void)setHasIsNetworkConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsNetworkConnected
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)isOnlyUseOffline
{
  return self->_isOnlyUseOffline;
}

- (void)setIsOnlyUseOffline:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_isOnlyUseOffline = a3;
}

- (void)setHasIsOnlyUseOffline:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasIsOnlyUseOffline
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (unsigned)numberOfDownloadedRegions
{
  return self->_numberOfDownloadedRegions;
}

- (void)setNumberOfDownloadedRegions:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_numberOfDownloadedRegions = a3;
}

- (void)setHasNumberOfDownloadedRegions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasNumberOfDownloadedRegions
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unint64_t)searchOdsVersion
{
  return self->_searchOdsVersion;
}

- (void)setSearchOdsVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_searchOdsVersion = a3;
}

- (void)setHasSearchOdsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSearchOdsVersion
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)routingOdsVersion
{
  return self->_routingOdsVersion;
}

- (void)setRoutingOdsVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_routingOdsVersion = a3;
}

- (void)setHasRoutingOdsVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRoutingOdsVersion
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateOffline;
  v4 = [(GEOLogMsgStateOffline *)&v8 description];
  id v5 = [(GEOLogMsgStateOffline *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateOffline _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_33;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 8) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
    if (a2) {
      v7 = @"isMapsInOfflineMode";
    }
    else {
      v7 = @"is_maps_in_offline_mode";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if ((v5 & 0x10) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 29)];
    if (a2) {
      v9 = @"isNetworkConnected";
    }
    else {
      v9 = @"is_network_connected";
    }
    [v4 setObject:v8 forKey:v9];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 0x20) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 30)];
  if (a2) {
    v11 = @"isOnlyUseOffline";
  }
  else {
    v11 = @"is_only_use_offline";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
LABEL_25:
    v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
    if (a2) {
      v15 = @"searchOdsVersion";
    }
    else {
      v15 = @"search_ods_version";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 32) & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_21:
  v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v13 = @"numberOfDownloadedRegions";
  }
  else {
    v13 = @"number_of_downloaded_regions";
  }
  [v4 setObject:v12 forKey:v13];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 2) != 0) {
    goto LABEL_25;
  }
LABEL_11:
  if (v5)
  {
LABEL_29:
    v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
    if (a2) {
      v17 = @"routingOdsVersion";
    }
    else {
      v17 = @"routing_ods_version";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_33:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateOffline _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateOffline)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateOffline *)-[GEOLogMsgStateOffline _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"isMapsInOfflineMode";
      }
      else {
        v6 = @"is_maps_in_offline_mode";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsMapsInOfflineMode:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"isNetworkConnected";
      }
      else {
        objc_super v8 = @"is_network_connected";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsNetworkConnected:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"isOnlyUseOffline";
      }
      else {
        v10 = @"is_only_use_offline";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsOnlyUseOffline:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"numberOfDownloadedRegions";
      }
      else {
        v12 = @"number_of_downloaded_regions";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfDownloadedRegions:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"searchOdsVersion";
      }
      else {
        v14 = @"search_ods_version";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSearchOdsVersion:", objc_msgSend(v15, "unsignedLongLongValue"));
      }

      if (a3) {
        v16 = @"routingOdsVersion";
      }
      else {
        v16 = @"routing_ods_version";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRoutingOdsVersion:", objc_msgSend(v17, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateOffline)initWithJSON:(id)a3
{
  return (GEOLogMsgStateOffline *)-[GEOLogMsgStateOffline _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateOfflineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateOfflineReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateOffline *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[28] = self->_isMapsInOfflineMode;
    v5[32] |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[29] = self->_isNetworkConnected;
  v5[32] |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v5[30] = self->_isOnlyUseOffline;
  v5[32] |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v5 + 6) = self->_numberOfDownloadedRegions;
  v5[32] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((void *)v5 + 2) = self->_searchOdsVersion;
  v5[32] |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_7:
    *((void *)v5 + 1) = self->_routingOdsVersion;
    v5[32] |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)result + 28) = self->_isMapsInOfflineMode;
    *((unsigned char *)result + 32) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 29) = self->_isNetworkConnected;
  *((unsigned char *)result + 32) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 30) = self->_isOnlyUseOffline;
  *((unsigned char *)result + 32) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_numberOfDownloadedRegions;
  *((unsigned char *)result + 32) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 2) = self->_searchOdsVersion;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 1) = self->_routingOdsVersion;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  [(GEOLogMsgStateOffline *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_isMapsInOfflineMode)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0) {
      goto LABEL_40;
    }
    if (self->_isNetworkConnected)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
    {
      if (self->_isOnlyUseOffline)
      {
        if (!*((unsigned char *)v4 + 30)) {
          goto LABEL_40;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 30)) {
        goto LABEL_26;
      }
    }
LABEL_40:
    BOOL v5 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 32) & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_26:
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_numberOfDownloadedRegions != *((_DWORD *)v4 + 6)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_searchOdsVersion != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_40;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_routingOdsVersion != *((void *)v4 + 1)) {
      goto LABEL_40;
    }
    BOOL v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateOffline *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isMapsInOfflineMode;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isNetworkConnected;
      if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_isOnlyUseOffline;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numberOfDownloadedRegions;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v7 = 2654435761u * self->_searchOdsVersion;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v8 = 2654435761u * self->_routingOdsVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 8) != 0)
  {
    self->_isMapsInOfflineMode = *((unsigned char *)v5 + 28);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 32);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 32) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_isNetworkConnected = *((unsigned char *)v5 + 29);
  *(unsigned char *)&self->_flags |= 0x10u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_isOnlyUseOffline = *((unsigned char *)v5 + 30);
  *(unsigned char *)&self->_flags |= 0x20u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 4) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_numberOfDownloadedRegions = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 32);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_searchOdsVersion = *((void *)v5 + 2);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 32))
  {
LABEL_7:
    self->_routingOdsVersion = *((void *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
}

@end