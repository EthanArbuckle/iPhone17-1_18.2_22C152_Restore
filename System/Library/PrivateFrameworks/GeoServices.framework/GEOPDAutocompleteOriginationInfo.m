@interface GEOPDAutocompleteOriginationInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAutocompleteOriginationType;
- (BOOL)hasClientSoftwarePlatform;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRoutePlanningParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAutocompleteOriginationInfo)initWithDictionary:(id)a3;
- (GEOPDAutocompleteOriginationInfo)initWithJSON:(id)a3;
- (GEOPDAutocompleteOriginationRoutePlanningParameters)routePlanningParameters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)autocompleteOriginationTypeAsString:(int)a3;
- (id)clientSoftwarePlatformAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAutocompleteOriginationType:(id)a3;
- (int)StringAsClientSoftwarePlatform:(id)a3;
- (int)autocompleteOriginationType;
- (int)clientSoftwarePlatform;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutocompleteOriginationType:(int)a3;
- (void)setClientSoftwarePlatform:(int)a3;
- (void)setHasAutocompleteOriginationType:(BOOL)a3;
- (void)setHasClientSoftwarePlatform:(BOOL)a3;
- (void)setRoutePlanningParameters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAutocompleteOriginationInfo

- (int)autocompleteOriginationType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_autocompleteOriginationType;
  }
  else {
    return 0;
  }
}

- (void)setAutocompleteOriginationType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_autocompleteOriginationType = a3;
}

- (void)setHasAutocompleteOriginationType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAutocompleteOriginationType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)autocompleteOriginationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53DC628[a3];
  }

  return v3;
}

- (int)StringAsAutocompleteOriginationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_ROUTE_PLANNING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_ADD_FAVORITES"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasRoutePlanningParameters
{
  return self->_routePlanningParameters != 0;
}

- (GEOPDAutocompleteOriginationRoutePlanningParameters)routePlanningParameters
{
  return self->_routePlanningParameters;
}

- (void)setRoutePlanningParameters:(id)a3
{
}

- (int)clientSoftwarePlatform
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_clientSoftwarePlatform;
  }
  else {
    return 0;
  }
}

- (void)setClientSoftwarePlatform:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_clientSoftwarePlatform = a3;
}

- (void)setHasClientSoftwarePlatform:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasClientSoftwarePlatform
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)clientSoftwarePlatformAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DC648[a3];
  }

  return v3;
}

- (int)StringAsClientSoftwarePlatform:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_IOS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WATCHOS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_MACOS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_TVOS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WEB"])
  {
    int v4 = 5;
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
  v8.super_class = (Class)GEOPDAutocompleteOriginationInfo;
  int v4 = [(GEOPDAutocompleteOriginationInfo *)&v8 description];
  v5 = [(GEOPDAutocompleteOriginationInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DC628[v5];
      }
      if (a2) {
        v7 = @"autocompleteOriginationType";
      }
      else {
        v7 = @"autocomplete_origination_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 routePlanningParameters];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"routePlanningParameters";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"route_planning_parameters";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      uint64_t v12 = *(int *)(a1 + 28);
      if (v12 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53DC648[v12];
      }
      if (a2) {
        v14 = @"clientSoftwarePlatform";
      }
      else {
        v14 = @"client_software_platform";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __62__GEOPDAutocompleteOriginationInfo__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPDAutocompleteOriginationInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDAutocompleteOriginationInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDAutocompleteOriginationInfo)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteOriginationInfo *)-[GEOPDAutocompleteOriginationInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"autocompleteOriginationType";
      }
      else {
        v6 = @"autocomplete_origination_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_DEFAULT"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_ROUTE_PLANNING"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_SEARCH_ALONG_ROUTE"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"AUTOCOMPLETE_ORIGINATION_TYPE_ADD_FAVORITES"])
        {
          uint64_t v9 = 3;
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
          goto LABEL_20;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setAutocompleteOriginationType:v9];
LABEL_20:

      if (a3) {
        id v10 = @"routePlanningParameters";
      }
      else {
        id v10 = @"route_planning_parameters";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [GEOPDAutocompleteOriginationRoutePlanningParameters alloc];
        if (a3) {
          uint64_t v13 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setRoutePlanningParameters:v13];
      }
      if (a3) {
        v15 = @"clientSoftwarePlatform";
      }
      else {
        v15 = @"client_software_platform";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
        if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_UNKNOWN"])
        {
          uint64_t v18 = 0;
        }
        else if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_IOS"])
        {
          uint64_t v18 = 1;
        }
        else if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WATCHOS"])
        {
          uint64_t v18 = 2;
        }
        else if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_MACOS"])
        {
          uint64_t v18 = 3;
        }
        else if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_TVOS"])
        {
          uint64_t v18 = 4;
        }
        else if ([v17 isEqualToString:@"CLIENT_SOFTWARE_PLATFORM_WEB"])
        {
          uint64_t v18 = 5;
        }
        else
        {
          uint64_t v18 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        uint64_t v18 = [v16 intValue];
      }
      [a1 setClientSoftwarePlatform:v18];
      goto LABEL_49;
    }
  }
LABEL_50:

  return a1;
}

- (GEOPDAutocompleteOriginationInfo)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteOriginationInfo *)-[GEOPDAutocompleteOriginationInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteOriginationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteOriginationInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_routePlanningParameters) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self->_routePlanningParameters hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDAutocompleteOriginationInfo *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[6] = self->_autocompleteOriginationType;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  if (self->_routePlanningParameters)
  {
    objc_msgSend(v5, "setRoutePlanningParameters:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[7] = self->_clientSoftwarePlatform;
    *((unsigned char *)v4 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_autocompleteOriginationType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self->_routePlanningParameters copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_clientSoftwarePlatform;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPDAutocompleteOriginationInfo *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_autocompleteOriginationType != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  routePlanningParameters = self->_routePlanningParameters;
  if ((unint64_t)routePlanningParameters | *((void *)v4 + 2))
  {
    if (!-[GEOPDAutocompleteOriginationRoutePlanningParameters isEqual:](routePlanningParameters, "isEqual:"))
    {
LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 32);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_clientSoftwarePlatform != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
    BOOL v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDAutocompleteOriginationInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_autocompleteOriginationType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(GEOPDAutocompleteOriginationRoutePlanningParameters *)self->_routePlanningParameters hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_clientSoftwarePlatform;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  unint64_t v4 = v7;
  if (v7[8])
  {
    self->_autocompleteOriginationType = v7[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  routePlanningParameters = self->_routePlanningParameters;
  uint64_t v6 = *((void *)v7 + 2);
  if (routePlanningParameters)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOPDAutocompleteOriginationRoutePlanningParameters mergeFrom:](routePlanningParameters, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    [(GEOPDAutocompleteOriginationInfo *)self setRoutePlanningParameters:"setRoutePlanningParameters:"];
  }
  unint64_t v4 = v7;
LABEL_9:
  if ((v4[8] & 2) != 0)
  {
    self->_clientSoftwarePlatform = v4[7];
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
    [(GEOPDAutocompleteOriginationInfo *)self readAll:0];
    routePlanningParameters = self->_routePlanningParameters;
    [(GEOPDAutocompleteOriginationRoutePlanningParameters *)routePlanningParameters clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningParameters, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end