@interface GEOPDSSearchLocationParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)setSearchTransportHint:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchLocationParameters

- (void)setSearchTransportHint:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchLocationParameters;
  id v4 = [(GEOPDSSearchLocationParameters *)&v8 description];
  v5 = [(GEOPDSSearchLocationParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchLocationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      int v5 = *(_DWORD *)(a1 + 24);
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = @"SEARCH_LOCATION_PARAMETERS_TYPE_TRANSPORT_HINT";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v6 = @"SEARCH_LOCATION_PARAMETERS_TYPE_UNKNOWN";
      }
      if (a2) {
        v7 = @"searchLocationParametersType";
      }
      else {
        v7 = @"search_location_parameters_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    id v8 = *(id *)(a1 + 16);
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"searchTransportHint";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"search_transport_hint";
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
        v19[2] = __60__GEOPDSSearchLocationParameters__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSSearchLocationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDSSearchLocationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"searchLocationParametersType";
      }
      else {
        v6 = @"search_location_parameters_type";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"SEARCH_LOCATION_PARAMETERS_TYPE_UNKNOWN"]) {
          int v9 = 0;
        }
        else {
          int v9 = [v8 isEqualToString:@"SEARCH_LOCATION_PARAMETERS_TYPE_TRANSPORT_HINT"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        int v9 = [v7 intValue];
      }
      *(unsigned char *)(a1 + 28) |= 1u;
      *(_DWORD *)(a1 + 24) = v9;
LABEL_14:

      if (a3) {
        id v10 = @"searchTransportHint";
      }
      else {
        id v10 = @"search_transport_hint";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_46;
      }
      v12 = [GEOPDSTransportHint alloc];
      if (!v12)
      {
LABEL_45:
        -[GEOPDSSearchLocationParameters setSearchTransportHint:](a1, v12);

LABEL_46:
        goto LABEL_47;
      }
      id v13 = v11;
      v12 = [(GEOPDSTransportHint *)v12 init];
      if (!v12)
      {
LABEL_44:

        goto LABEL_45;
      }
      if (a3) {
        v14 = @"transportType";
      }
      else {
        v14 = @"transport_type";
      }
      v15 = [v13 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"AUTOMOBILE"])
        {
          int v17 = 0;
        }
        else if ([v16 isEqualToString:@"TRANSIT"])
        {
          int v17 = 1;
        }
        else if ([v16 isEqualToString:@"WALKING"])
        {
          int v17 = 2;
        }
        else if ([v16 isEqualToString:@"BICYCLE"])
        {
          int v17 = 3;
        }
        else if ([v16 isEqualToString:@"UNKNOWN_TRANSPORT_TYPE"])
        {
          int v17 = 4;
        }
        else if ([v16 isEqualToString:@"FERRY"])
        {
          int v17 = 5;
        }
        else if ([v16 isEqualToString:@"RIDESHARE"])
        {
          int v17 = 6;
        }
        else
        {
          int v17 = 0;
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
        int v17 = [v15 intValue];
      }
      *(unsigned char *)&v12->_flags |= 1u;
      v12->_transportType = v17;
      goto LABEL_43;
    }
  }
LABEL_47:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchLocationParametersReadAllFrom((uint64_t)self, a3);
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
  if (self->_searchTransportHint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_searchLocationParametersType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEOPDSTransportHint *)self->_searchTransportHint copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_searchLocationParametersType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  searchTransportHint = self->_searchTransportHint;
  if ((unint64_t)searchTransportHint | *((void *)v4 + 2)) {
    char v6 = -[GEOPDSTransportHint isEqual:](searchTransportHint, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v2 = 2654435761 * self->_searchLocationParametersType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(GEOPDSTransportHint *)self->_searchTransportHint hash] ^ v2;
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3[7])
    {
      *(_DWORD *)(a1 + 24) = v3[6];
      *(unsigned char *)(a1 + 28) |= 1u;
    }
    uint64_t v5 = *(void *)(a1 + 16);
    char v6 = (void *)*((void *)v4 + 2);
    if (v5)
    {
      if (v6) {
        -[GEOPDSTransportHint mergeFrom:](v5, v6);
      }
    }
    else if (v6)
    {
      -[GEOPDSSearchLocationParameters setSearchTransportHint:](a1, v6);
    }
  }

  return MEMORY[0x1F4181820]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      if (v5)
      {
        char v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTransportHint, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end