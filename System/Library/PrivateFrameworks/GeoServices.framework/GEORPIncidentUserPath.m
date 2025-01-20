@interface GEORPIncidentUserPath
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNavigationActive;
- (BOOL)hasReportedFromCarplay;
- (BOOL)hasTransportType;
- (BOOL)isEqual:(id)a3;
- (BOOL)navigationActive;
- (BOOL)readFrom:(id)a3;
- (BOOL)reportedFromCarplay;
- (GEORPIncidentUserPath)initWithDictionary:(id)a3;
- (GEORPIncidentUserPath)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)transportTypeAsString:(int)a3;
- (id)userPathsAsString:(int)a3;
- (int)StringAsTransportType:(id)a3;
- (int)StringAsUserPaths:(id)a3;
- (int)transportType;
- (int)userPathAtIndex:(unint64_t)a3;
- (int)userPaths;
- (unint64_t)hash;
- (unint64_t)userPathsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addUserPath:(int)a3;
- (void)clearUserPaths;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasNavigationActive:(BOOL)a3;
- (void)setHasReportedFromCarplay:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setNavigationActive:(BOOL)a3;
- (void)setReportedFromCarplay:(BOOL)a3;
- (void)setTransportType:(int)a3;
- (void)setUserPaths:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPIncidentUserPath

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPIncidentUserPath;
  [(GEORPIncidentUserPath *)&v3 dealloc];
}

- (unint64_t)userPathsCount
{
  return self->_userPaths.count;
}

- (int)userPaths
{
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
}

- (void)addUserPath:(int)a3
{
}

- (int)userPathAtIndex:(unint64_t)a3
{
  p_userPaths = &self->_userPaths;
  unint64_t count = self->_userPaths.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_userPaths->list[a3];
}

- (void)setUserPaths:(int *)a3 count:(unint64_t)a4
{
}

- (id)userPathsAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53DAC80[a3];
  }

  return v3;
}

- (int)StringAsUserPaths:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"USER_PATH_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER_PATH_SIRI"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER_PATH_NAV_TRAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"USER_PATH_DODGEBALL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"USER_PATH_RAP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"USER_PATH_REPORT_ICON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"USER_PATH_INCIDENT_CARD"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)reportedFromCarplay
{
  return self->_reportedFromCarplay;
}

- (void)setReportedFromCarplay:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_reportedFromCarplay = a3;
}

- (void)setHasReportedFromCarplay:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasReportedFromCarplay
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)navigationActive
{
  return self->_navigationActive;
}

- (void)setNavigationActive:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_navigationActive = a3;
}

- (void)setHasNavigationActive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasNavigationActive
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)transportType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_transportType;
  }
  else {
    return 0;
  }
}

- (void)setTransportType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransportType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DACB8[a3];
  }

  return v3;
}

- (int)StringAsTransportType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOMOBILE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRANSIT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BICYCLE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FERRY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RIDESHARE"])
  {
    int v4 = 6;
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
  v8.super_class = (Class)GEORPIncidentUserPath;
  int v4 = [(GEORPIncidentUserPath *)&v8 description];
  v5 = [(GEORPIncidentUserPath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentUserPath _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_32;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 16))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    v6 = (void *)(a1 + 8);
    if (*(void *)(a1 + 16))
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = *(int *)(*v6 + 4 * v7);
        if (v8 >= 7)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E53DAC80[v8];
        }
        [v5 addObject:v9];

        ++v7;
        v6 = (void *)(a1 + 8);
      }
      while (v7 < *(void *)(a1 + 16));
    }
    if (a2) {
      v10 = @"userPath";
    }
    else {
      v10 = @"user_path";
    }
    [v4 setObject:v5 forKey:v10];
  }
  char v11 = *(unsigned char *)(a1 + 40);
  if ((v11 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 40) & 2) == 0) {
      goto LABEL_15;
    }
LABEL_21:
    v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
    if (a2) {
      v15 = @"navigationActive";
    }
    else {
      v15 = @"navigation_active";
    }
    [v4 setObject:v14 forKey:v15];

    if ((*(unsigned char *)(a1 + 40) & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_25;
  }
  v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 37)];
  if (a2) {
    v13 = @"reportedFromCarplay";
  }
  else {
    v13 = @"reported_from_carplay";
  }
  [v4 setObject:v12 forKey:v13];

  char v11 = *(unsigned char *)(a1 + 40);
  if ((v11 & 2) != 0) {
    goto LABEL_21;
  }
LABEL_15:
  if (v11)
  {
LABEL_25:
    uint64_t v16 = *(int *)(a1 + 32);
    if (v16 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E53DACB8[v16];
    }
    if (a2) {
      v18 = @"transportType";
    }
    else {
      v18 = @"transport_type";
    }
    [v4 setObject:v17 forKey:v18];
  }
LABEL_32:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPIncidentUserPath _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentUserPath)initWithDictionary:(id)a3
{
  return (GEORPIncidentUserPath *)-[GEORPIncidentUserPath _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_69;
  }
  v6 = (void *)[a1 init];
  if (v6)
  {
    if (a3) {
      unint64_t v7 = @"userPath";
    }
    else {
      unint64_t v7 = @"user_path";
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v27 = a3;
      id v28 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v26 = v8;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v10) {
        goto LABEL_34;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      while (1)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([v15 isEqualToString:@"USER_PATH_UNKNOWN"])
            {
              uint64_t v16 = 0;
            }
            else if ([v15 isEqualToString:@"USER_PATH_SIRI"])
            {
              uint64_t v16 = 1;
            }
            else if ([v15 isEqualToString:@"USER_PATH_NAV_TRAY"])
            {
              uint64_t v16 = 2;
            }
            else if ([v15 isEqualToString:@"USER_PATH_DODGEBALL"])
            {
              uint64_t v16 = 3;
            }
            else if ([v15 isEqualToString:@"USER_PATH_RAP"])
            {
              uint64_t v16 = 4;
            }
            else if ([v15 isEqualToString:@"USER_PATH_REPORT_ICON"])
            {
              uint64_t v16 = 5;
            }
            else if ([v15 isEqualToString:@"USER_PATH_INCIDENT_CARD"])
            {
              uint64_t v16 = 6;
            }
            else
            {
              uint64_t v16 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_32;
            }
            uint64_t v16 = [v14 intValue];
          }
          [v6 addUserPath:v16];
LABEL_32:
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (!v11)
        {
LABEL_34:

          id v5 = v28;
          a3 = v27;
          uint64_t v8 = v26;
          break;
        }
      }
    }

    if (a3) {
      v17 = @"reportedFromCarplay";
    }
    else {
      v17 = @"reported_from_carplay";
    }
    v18 = [v5 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setReportedFromCarplay:", objc_msgSend(v18, "BOOLValue"));
    }

    if (a3) {
      v19 = @"navigationActive";
    }
    else {
      v19 = @"navigation_active";
    }
    v20 = [v5 objectForKeyedSubscript:v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setNavigationActive:", objc_msgSend(v20, "BOOLValue"));
    }

    if (a3) {
      v21 = @"transportType";
    }
    else {
      v21 = @"transport_type";
    }
    v22 = [v5 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v23 = v22;
      if ([v23 isEqualToString:@"AUTOMOBILE"])
      {
        uint64_t v24 = 0;
      }
      else if ([v23 isEqualToString:@"TRANSIT"])
      {
        uint64_t v24 = 1;
      }
      else if ([v23 isEqualToString:@"WALKING"])
      {
        uint64_t v24 = 2;
      }
      else if ([v23 isEqualToString:@"BICYCLE"])
      {
        uint64_t v24 = 3;
      }
      else if ([v23 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
      {
        uint64_t v24 = 4;
      }
      else if ([v23 isEqualToString:@"FERRY"])
      {
        uint64_t v24 = 5;
      }
      else if ([v23 isEqualToString:@"RIDESHARE"])
      {
        uint64_t v24 = 6;
      }
      else
      {
        uint64_t v24 = 0;
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
      uint64_t v24 = [v22 intValue];
    }
    [v6 setTransportType:v24];
    goto LABEL_68;
  }
LABEL_69:

  return v6;
}

- (GEORPIncidentUserPath)initWithJSON:(id)a3
{
  return (GEORPIncidentUserPath *)-[GEORPIncidentUserPath _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentUserPathIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentUserPathReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_userPaths.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_userPaths.count);
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_6:
      if ((flags & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEORPIncidentUserPath *)self readAll:0];
  if ([(GEORPIncidentUserPath *)self userPathsCount])
  {
    [v8 clearUserPaths];
    unint64_t v4 = [(GEORPIncidentUserPath *)self userPathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addUserPath:", -[GEORPIncidentUserPath userPathAtIndex:](self, "userPathAtIndex:", i));
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v8 + 37) = self->_reportedFromCarplay;
    *((unsigned char *)v8 + 40) |= 4u;
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
  *((unsigned char *)v8 + 36) = self->_navigationActive;
  *((unsigned char *)v8 + 40) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_8:
    *((_DWORD *)v8 + 8) = self->_transportType;
    *((unsigned char *)v8 + 40) |= 1u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v4 + 36) = self->_navigationActive;
    *(unsigned char *)(v4 + 40) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v4;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v4 + 37) = self->_reportedFromCarplay;
  *(unsigned char *)(v4 + 40) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v4 + 32) = self->_transportType;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEORPIncidentUserPath *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0) {
      goto LABEL_23;
    }
    if (self->_reportedFromCarplay)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) != 0)
    {
      if (self->_navigationActive)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_19;
      }
    }
LABEL_23:
    BOOL v5 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_transportType != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
    BOOL v5 = 1;
  }
LABEL_24:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPIncidentUserPath *)self readAll:1];
  uint64_t v3 = PBRepeatedInt32Hash();
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
  uint64_t v4 = 2654435761 * self->_reportedFromCarplay;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_navigationActive;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_transportType;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = [v8 userPathsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEORPIncidentUserPath addUserPath:](self, "addUserPath:", [v8 userPathAtIndex:i]);
  }
  char v7 = *((unsigned char *)v8 + 40);
  if ((v7 & 4) != 0)
  {
    self->_reportedFromCarplay = *((unsigned char *)v8 + 37);
    *(unsigned char *)&self->_flags |= 4u;
    char v7 = *((unsigned char *)v8 + 40);
    if ((v7 & 2) == 0)
    {
LABEL_6:
      if ((v7 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*((unsigned char *)v8 + 40) & 2) == 0)
  {
    goto LABEL_6;
  }
  self->_navigationActive = *((unsigned char *)v8 + 36);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v8 + 40))
  {
LABEL_7:
    self->_transportType = *((_DWORD *)v8 + 8);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_8:
}

@end