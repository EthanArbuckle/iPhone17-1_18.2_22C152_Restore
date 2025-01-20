@interface GEOFormattedStringMetaData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRealtimeStatus;
- (BOOL)hasSpokenPrivacyFilterType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedStringMetaData)initWithDictionary:(id)a3;
- (GEOFormattedStringMetaData)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)realtimeStatusAsString:(int)a3;
- (id)spokenPrivacyFilterTypeAsString:(int)a3;
- (int)StringAsRealtimeStatus:(id)a3;
- (int)StringAsSpokenPrivacyFilterType:(id)a3;
- (int)realtimeStatus;
- (int)spokenPrivacyFilterType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRealtimeStatus:(BOOL)a3;
- (void)setHasSpokenPrivacyFilterType:(BOOL)a3;
- (void)setRealtimeStatus:(int)a3;
- (void)setSpokenPrivacyFilterType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOFormattedStringMetaData

- (int)realtimeStatus
{
  if (*(unsigned char *)&self->_flags) {
    return self->_realtimeStatus;
  }
  else {
    return 0;
  }
}

- (void)setRealtimeStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_realtimeStatus = a3;
}

- (void)setHasRealtimeStatus:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasRealtimeStatus
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)realtimeStatusAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E0188[a3];
  }

  return v3;
}

- (int)StringAsRealtimeStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"REALTIME_STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_ON_TIME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_DELAYED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_EARLY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_CANCELLED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_STOP_SKIPPED"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REALTIME_STATUS_NO_SERVICE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)spokenPrivacyFilterType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_spokenPrivacyFilterType;
  }
  else {
    return 0;
  }
}

- (void)setSpokenPrivacyFilterType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_spokenPrivacyFilterType = a3;
}

- (void)setHasSpokenPrivacyFilterType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSpokenPrivacyFilterType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)spokenPrivacyFilterTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E01F0[a3];
  }

  return v3;
}

- (int)StringAsSpokenPrivacyFilterType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PRIVACY_FILTER_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_PUBLIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_AMBIGUOUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PRIVACY_FILTER_PRIVATE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)GEOFormattedStringMetaData;
  int v4 = [(GEOFormattedStringMetaData *)&v8 description];
  v5 = [(GEOFormattedStringMetaData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOFormattedStringMetaData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E0188[v6];
      }
      if (a2) {
        objc_super v8 = @"realtimeStatus";
      }
      else {
        objc_super v8 = @"realtime_status";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 20);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E01F0[v9];
      }
      if (a2) {
        v11 = @"spokenPrivacyFilterType";
      }
      else {
        v11 = @"spoken_privacy_filter_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __56__GEOFormattedStringMetaData__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOFormattedStringMetaData _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOFormattedStringMetaData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOFormattedStringMetaData)initWithDictionary:(id)a3
{
  return (GEOFormattedStringMetaData *)-[GEOFormattedStringMetaData _initWithDictionary:isJSON:](self, a3, 0);
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
        uint64_t v6 = @"realtimeStatus";
      }
      else {
        uint64_t v6 = @"realtime_status";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"REALTIME_STATUS_UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_ON_TIME"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_DELAYED"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_EARLY"])
        {
          uint64_t v9 = 3;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_CANCELLED"])
        {
          uint64_t v9 = 4;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_STOP_SKIPPED"])
        {
          uint64_t v9 = 5;
        }
        else if ([v8 isEqualToString:@"REALTIME_STATUS_NO_SERVICE"])
        {
          uint64_t v9 = 6;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_26;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setRealtimeStatus:v9];
LABEL_26:

      if (a3) {
        id v10 = @"spokenPrivacyFilterType";
      }
      else {
        id v10 = @"spoken_privacy_filter_type";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"PRIVACY_FILTER_UNKNOWN"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"PRIVACY_FILTER_PUBLIC"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"PRIVACY_FILTER_AMBIGUOUS"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"PRIVACY_FILTER_PRIVATE"])
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_43:

          goto LABEL_44;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setSpokenPrivacyFilterType:v13];
      goto LABEL_43;
    }
  }
LABEL_44:

  return a1;
}

- (GEOFormattedStringMetaData)initWithJSON:(id)a3
{
  return (GEOFormattedStringMetaData *)-[GEOFormattedStringMetaData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOFormattedStringMetaDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOFormattedStringMetaDataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOFormattedStringMetaData *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_realtimeStatus;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[5] = self->_spokenPrivacyFilterType;
    *((unsigned char *)v5 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_realtimeStatus;
    *(unsigned char *)(v4 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_spokenPrivacyFilterType;
    *(unsigned char *)(v4 + 24) |= 2u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOFormattedStringMetaData *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_realtimeStatus != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_spokenPrivacyFilterType != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOFormattedStringMetaData *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_realtimeStatus;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_spokenPrivacyFilterType;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_realtimeStatus = v5[4];
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if ((v4 & 2) != 0)
  {
    self->_spokenPrivacyFilterType = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOFormattedStringMetaData *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end