@interface GEORPClientCapabilities
+ (BOOL)isValid:(id)a3;
- (BOOL)hasConstrainedProblemStatusSize;
- (BOOL)hasFeatureHandle;
- (BOOL)hasHasConstrainedProblemStatusSize;
- (BOOL)hasHasFeatureHandle;
- (BOOL)hasHasNoOptInRequest;
- (BOOL)hasHasSupportForIdsBasedNotifications;
- (BOOL)hasNoOptInRequest;
- (BOOL)hasSupportForIdsBasedNotifications;
- (BOOL)hasTransitMarketSupport;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPClientCapabilities)initWithDictionary:(id)a3;
- (GEORPClientCapabilities)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transitMarketSupportAsString:(int)a3;
- (int)StringAsTransitMarketSupport:(id)a3;
- (int)transitMarketSupport;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasConstrainedProblemStatusSize:(BOOL)a3;
- (void)setHasFeatureHandle:(BOOL)a3;
- (void)setHasHasConstrainedProblemStatusSize:(BOOL)a3;
- (void)setHasHasFeatureHandle:(BOOL)a3;
- (void)setHasHasNoOptInRequest:(BOOL)a3;
- (void)setHasHasSupportForIdsBasedNotifications:(BOOL)a3;
- (void)setHasNoOptInRequest:(BOOL)a3;
- (void)setHasSupportForIdsBasedNotifications:(BOOL)a3;
- (void)setHasTransitMarketSupport:(BOOL)a3;
- (void)setTransitMarketSupport:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPClientCapabilities

- (BOOL)hasConstrainedProblemStatusSize
{
  return self->_hasConstrainedProblemStatusSize;
}

- (void)setHasConstrainedProblemStatusSize:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_hasConstrainedProblemStatusSize = a3;
}

- (void)setHasHasConstrainedProblemStatusSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHasConstrainedProblemStatusSize
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hasNoOptInRequest
{
  return self->_hasNoOptInRequest;
}

- (void)setHasNoOptInRequest:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_hasNoOptInRequest = a3;
}

- (void)setHasHasNoOptInRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHasNoOptInRequest
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasFeatureHandle
{
  return self->_hasFeatureHandle;
}

- (void)setHasFeatureHandle:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_hasFeatureHandle = a3;
}

- (void)setHasHasFeatureHandle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHasFeatureHandle
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasSupportForIdsBasedNotifications
{
  return self->_hasSupportForIdsBasedNotifications;
}

- (void)setHasSupportForIdsBasedNotifications:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_hasSupportForIdsBasedNotifications = a3;
}

- (void)setHasHasSupportForIdsBasedNotifications:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasHasSupportForIdsBasedNotifications
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (int)transitMarketSupport
{
  if (*(unsigned char *)&self->_flags) {
    return self->_transitMarketSupport;
  }
  else {
    return 1;
  }
}

- (void)setTransitMarketSupport:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_transitMarketSupport = a3;
}

- (void)setHasTransitMarketSupport:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransitMarketSupport
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)transitMarketSupportAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E69B8[a3 - 1];
  }

  return v3;
}

- (int)StringAsTransitMarketSupport:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VERSION_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VERSION_2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VERSION_3"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPClientCapabilities;
  int v4 = [(GEORPClientCapabilities *)&v8 description];
  v5 = [(GEORPClientCapabilities *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_31;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 16);
  if ((v5 & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 12)];
    if (a2) {
      v7 = @"hasConstrainedProblemStatusSize";
    }
    else {
      v7 = @"has_constrained_problem_status_size";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 16);
  }
  if ((v5 & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 14)];
    if (a2) {
      v9 = @"hasNoOptInRequest";
    }
    else {
      v9 = @"has_no_opt_in_request";
    }
    [v4 setObject:v8 forKey:v9];

    char v5 = *(unsigned char *)(a1 + 16);
    if ((v5 & 4) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_10;
      }
LABEL_20:
      v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 15)];
      if (a2) {
        v13 = @"hasSupportForIdsBasedNotifications";
      }
      else {
        v13 = @"has_support_for_ids_based_notifications";
      }
      [v4 setObject:v12 forKey:v13];

      if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 13)];
  if (a2) {
    v11 = @"hasFeatureHandle";
  }
  else {
    v11 = @"has_feature_handle";
  }
  [v4 setObject:v10 forKey:v11];

  char v5 = *(unsigned char *)(a1 + 16);
  if ((v5 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if (v5)
  {
LABEL_24:
    unsigned int v14 = *(_DWORD *)(a1 + 8) - 1;
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 8));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E53E69B8[v14];
    }
    if (a2) {
      v16 = @"transitMarketSupport";
    }
    else {
      v16 = @"transit_market_support";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPClientCapabilities _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPClientCapabilities)initWithDictionary:(id)a3
{
  return (GEORPClientCapabilities *)-[GEORPClientCapabilities _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"hasConstrainedProblemStatusSize";
      }
      else {
        v6 = @"has_constrained_problem_status_size";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasConstrainedProblemStatusSize:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"hasNoOptInRequest";
      }
      else {
        objc_super v8 = @"has_no_opt_in_request";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasNoOptInRequest:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"hasFeatureHandle";
      }
      else {
        v10 = @"has_feature_handle";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasFeatureHandle:", objc_msgSend(v11, "BOOLValue"));
      }

      if (a3) {
        v12 = @"hasSupportForIdsBasedNotifications";
      }
      else {
        v12 = @"has_support_for_ids_based_notifications";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasSupportForIdsBasedNotifications:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        unsigned int v14 = @"transitMarketSupport";
      }
      else {
        unsigned int v14 = @"transit_market_support";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"VERSION_1"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"VERSION_2"])
        {
          uint64_t v17 = 2;
        }
        else if ([v16 isEqualToString:@"VERSION_3"])
        {
          uint64_t v17 = 3;
        }
        else
        {
          uint64_t v17 = 1;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_38:

          goto LABEL_39;
        }
        uint64_t v17 = [v15 intValue];
      }
      [a1 setTransitMarketSupport:v17];
      goto LABEL_38;
    }
  }
LABEL_39:

  return a1;
}

- (GEORPClientCapabilities)initWithJSON:(id)a3
{
  return (GEORPClientCapabilities *)-[GEORPClientCapabilities _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPClientCapabilitiesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPClientCapabilitiesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPClientCapabilities *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[12] = self->_hasConstrainedProblemStatusSize;
    v5[16] |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v5[14] = self->_hasNoOptInRequest;
  v5[16] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[13] = self->_hasFeatureHandle;
  v5[16] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v5[15] = self->_hasSupportForIdsBasedNotifications;
  v5[16] |= 0x10u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((_DWORD *)v5 + 2) = self->_transitMarketSupport;
    v5[16] |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_hasConstrainedProblemStatusSize;
    *((unsigned char *)result + 16) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 14) = self->_hasNoOptInRequest;
  *((unsigned char *)result + 16) |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 13) = self->_hasFeatureHandle;
  *((unsigned char *)result + 16) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 15) = self->_hasSupportForIdsBasedNotifications;
  *((unsigned char *)result + 16) |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 2) = self->_transitMarketSupport;
  *((unsigned char *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEORPClientCapabilities *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0) {
      goto LABEL_38;
    }
    if (self->_hasConstrainedProblemStatusSize)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_hasNoOptInRequest)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_38;
    }
    if (self->_hasFeatureHandle)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 0x10) != 0)
    {
      if (self->_hasSupportForIdsBasedNotifications)
      {
        if (!*((unsigned char *)v4 + 15)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 15)) {
        goto LABEL_34;
      }
    }
LABEL_38:
    BOOL v5 = 0;
    goto LABEL_39;
  }
  if ((*((unsigned char *)v4 + 16) & 0x10) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_transitMarketSupport != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
    BOOL v5 = 1;
  }
LABEL_39:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPClientCapabilities *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_hasConstrainedProblemStatusSize;
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_hasNoOptInRequest;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_hasFeatureHandle;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasSupportForIdsBasedNotifications;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_transitMarketSupport;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_hasConstrainedProblemStatusSize = *((unsigned char *)v5 + 12);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 16);
    if ((v4 & 8) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 16) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_hasNoOptInRequest = *((unsigned char *)v5 + 14);
  *(unsigned char *)&self->_flags |= 8u;
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_hasFeatureHandle = *((unsigned char *)v5 + 13);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 16);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_hasSupportForIdsBasedNotifications = *((unsigned char *)v5 + 15);
  *(unsigned char *)&self->_flags |= 0x10u;
  if (*((unsigned char *)v5 + 16))
  {
LABEL_6:
    self->_transitMarketSupport = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

@end