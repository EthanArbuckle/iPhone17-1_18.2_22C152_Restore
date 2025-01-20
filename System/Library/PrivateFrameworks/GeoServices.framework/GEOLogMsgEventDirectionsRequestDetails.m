@interface GEOLogMsgEventDirectionsRequestDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDestination;
- (BOOL)hasNavStarted;
- (BOOL)hasOrigin;
- (BOOL)hasPurpose;
- (BOOL)isEqual:(id)a3;
- (BOOL)navStarted;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventDirectionsRequestDetails)initWithDictionary:(id)a3;
- (GEOLogMsgEventDirectionsRequestDetails)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)originAsString:(int)a3;
- (id)purposeAsString:(int)a3;
- (int)StringAsDestination:(id)a3;
- (int)StringAsOrigin:(id)a3;
- (int)StringAsPurpose:(id)a3;
- (int)destination;
- (int)origin;
- (int)purpose;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestination:(int)a3;
- (void)setHasDestination:(BOOL)a3;
- (void)setHasNavStarted:(BOOL)a3;
- (void)setHasOrigin:(BOOL)a3;
- (void)setHasPurpose:(BOOL)a3;
- (void)setNavStarted:(BOOL)a3;
- (void)setOrigin:(int)a3;
- (void)setPurpose:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventDirectionsRequestDetails

- (BOOL)navStarted
{
  return self->_navStarted;
}

- (void)setNavStarted:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_navStarted = a3;
}

- (void)setHasNavStarted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNavStarted
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)purpose
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_purpose;
  }
  else {
    return 0;
  }
}

- (void)setPurpose:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_purpose = a3;
}

- (void)setHasPurpose:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPurpose
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)purposeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7868[a3];
  }

  return v3;
}

- (int)StringAsPurpose:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PURPOSE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PURPOSE_TEST_OR_DEBUG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PURPOSE_ETA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PURPOSE_QUICK_ETA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PURPOSE_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PURPOSE_REROUTE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PURPOSE_ROUTE_GENIUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PURPOSE_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PURPOSE_DODGEBALL_OUTSIDE_OF_MAPS"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PURPOSE_TIME_TO_LEAVE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PURPOSE_LAUNCH_AND_GO"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F78C0[a3];
  }

  return v3;
}

- (int)StringAsOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOCATION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOCATION_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOCATION_OTHER_PROMINENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCATION_NON_PROMINENT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)destination
{
  if (*(unsigned char *)&self->_flags) {
    return self->_destination;
  }
  else {
    return 0;
  }
}

- (void)setDestination:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_destination = a3;
}

- (void)setHasDestination:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDestination
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)destinationAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F78C0[a3];
  }

  return v3;
}

- (int)StringAsDestination:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOCATION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOCATION_HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOCATION_WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LOCATION_OTHER_PROMINENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCATION_NON_PROMINENT"])
  {
    int v4 = 4;
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
  v8.super_class = (Class)GEOLogMsgEventDirectionsRequestDetails;
  int v4 = [(GEOLogMsgEventDirectionsRequestDetails *)&v8 description];
  v5 = [(GEOLogMsgEventDirectionsRequestDetails *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventDirectionsRequestDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 8) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
    if (a2) {
      v7 = @"navStarted";
    }
    else {
      v7 = @"nav_started";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
LABEL_15:
      uint64_t v10 = *(int *)(a1 + 12);
      if (v10 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 12));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53F78C0[v10];
      }
      [v4 setObject:v11 forKey:@"origin"];

      if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)(a1 + 24) & 4) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v8 = *(int *)(a1 + 16);
  if (v8 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E53F7868[v8];
  }
  [v4 setObject:v9 forKey:@"purpose"];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 2) != 0) {
    goto LABEL_15;
  }
LABEL_5:
  if (v5)
  {
LABEL_19:
    uint64_t v12 = *(int *)(a1 + 8);
    if (v12 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 8));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53F78C0[v12];
    }
    [v4 setObject:v13 forKey:@"destination"];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventDirectionsRequestDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventDirectionsRequestDetails)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventDirectionsRequestDetails *)-[GEOLogMsgEventDirectionsRequestDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"navStarted";
      }
      else {
        v6 = @"nav_started";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNavStarted:", objc_msgSend(v7, "BOOLValue"));
      }

      uint64_t v8 = [v5 objectForKeyedSubscript:@"purpose"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"PURPOSE_UNKNOWN"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"PURPOSE_TEST_OR_DEBUG"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"PURPOSE_ETA"])
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isEqualToString:@"PURPOSE_QUICK_ETA"])
        {
          uint64_t v10 = 3;
        }
        else if ([v9 isEqualToString:@"PURPOSE_ROUTE"])
        {
          uint64_t v10 = 4;
        }
        else if ([v9 isEqualToString:@"PURPOSE_REROUTE"])
        {
          uint64_t v10 = 5;
        }
        else if ([v9 isEqualToString:@"PURPOSE_ROUTE_GENIUS"])
        {
          uint64_t v10 = 6;
        }
        else if ([v9 isEqualToString:@"PURPOSE_SEARCH_ALONG_ROUTE"])
        {
          uint64_t v10 = 7;
        }
        else if ([v9 isEqualToString:@"PURPOSE_DODGEBALL_OUTSIDE_OF_MAPS"])
        {
          uint64_t v10 = 8;
        }
        else if ([v9 isEqualToString:@"PURPOSE_TIME_TO_LEAVE"])
        {
          uint64_t v10 = 9;
        }
        else if ([v9 isEqualToString:@"PURPOSE_LAUNCH_AND_GO"])
        {
          uint64_t v10 = 10;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setPurpose:v10];
LABEL_36:

      v11 = [v5 objectForKeyedSubscript:@"origin"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"LOCATION_UNKNOWN"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"LOCATION_HOME"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"LOCATION_WORK"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"LOCATION_OTHER_PROMINENT"])
        {
          uint64_t v13 = 3;
        }
        else if ([v12 isEqualToString:@"LOCATION_NON_PROMINENT"])
        {
          uint64_t v13 = 4;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_52;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setOrigin:v13];
LABEL_52:

      v14 = [v5 objectForKeyedSubscript:@"destination"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        if ([v15 isEqualToString:@"LOCATION_UNKNOWN"])
        {
          uint64_t v16 = 0;
        }
        else if ([v15 isEqualToString:@"LOCATION_HOME"])
        {
          uint64_t v16 = 1;
        }
        else if ([v15 isEqualToString:@"LOCATION_WORK"])
        {
          uint64_t v16 = 2;
        }
        else if ([v15 isEqualToString:@"LOCATION_OTHER_PROMINENT"])
        {
          uint64_t v16 = 3;
        }
        else if ([v15 isEqualToString:@"LOCATION_NON_PROMINENT"])
        {
          uint64_t v16 = 4;
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_68:

          goto LABEL_69;
        }
        uint64_t v16 = [v14 intValue];
      }
      [a1 setDestination:v16];
      goto LABEL_68;
    }
  }
LABEL_69:

  return a1;
}

- (GEOLogMsgEventDirectionsRequestDetails)initWithJSON:(id)a3
{
  return (GEOLogMsgEventDirectionsRequestDetails *)-[GEOLogMsgEventDirectionsRequestDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventDirectionsRequestDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventDirectionsRequestDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgEventDirectionsRequestDetails *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    v5[20] = self->_navStarted;
    v5[24] |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 4) = self->_purpose;
  v5[24] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v5 + 3) = self->_origin;
  v5[24] |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_5:
    *((_DWORD *)v5 + 2) = self->_destination;
    v5[24] |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((unsigned char *)result + 20) = self->_navStarted;
    *((unsigned char *)result + 24) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_purpose;
  *((unsigned char *)result + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_4:
    if ((flags & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = self->_origin;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = self->_destination;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOLogMsgEventDirectionsRequestDetails *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) != 0)
    {
      if (self->_navStarted)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_24;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_10;
      }
    }
LABEL_24:
    BOOL v5 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 24) & 8) != 0) {
    goto LABEL_24;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_purpose != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_origin != *((_DWORD *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_24;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_destination != *((_DWORD *)v4 + 2)) {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventDirectionsRequestDetails *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_navStarted;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_purpose;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_origin;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_destination;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 8) != 0)
  {
    self->_navStarted = *((unsigned char *)v5 + 20);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_purpose = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_origin = *((_DWORD *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_5:
    self->_destination = *((_DWORD *)v5 + 2);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_6:
}

@end