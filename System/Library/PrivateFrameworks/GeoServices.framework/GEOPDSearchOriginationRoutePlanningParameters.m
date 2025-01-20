@interface GEOPDSearchOriginationRoutePlanningParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setPreviousLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchOriginationRoutePlanningParameters

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (!a1) {
    goto LABEL_10;
  }
  v4 = *(void **)(a1 + 16);
  v5 = (void *)v3[2];
  if (v4)
  {
    if (!v5) {
      goto LABEL_8;
    }
    v6 = v3;
    objc_msgSend(v4, "mergeFrom:");
  }
  else
  {
    if (!v5) {
      goto LABEL_8;
    }
    v6 = v3;
    -[GEOPDSearchOriginationRoutePlanningParameters setPreviousLocation:](a1, v5);
  }
  v3 = v6;
LABEL_8:
  if (*((unsigned char *)v3 + 28))
  {
    *(unsigned char *)(a1 + 24) = *((unsigned char *)v3 + 24);
    *(unsigned char *)(a1 + 28) |= 1u;
  }
LABEL_10:
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      v5 = *(void **)(a1 + 16);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void)setPreviousLocation:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchOriginationRoutePlanningParameters;
  id v4 = [(GEOPDSearchOriginationRoutePlanningParameters *)&v8 description];
  v5 = [(GEOPDSearchOriginationRoutePlanningParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 16);
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"previousLocation";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"previous_location";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        v10 = @"isEditServerRecommendedStop";
      }
      else {
        v10 = @"is_edit_server_recommended_stop";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __75__GEOPDSearchOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOPDSearchOriginationRoutePlanningParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __75__GEOPDSearchOriginationRoutePlanningParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchOriginationRoutePlanningParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_previousLocation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOLatLng *)self->_previousLocation copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 24) = self->_isEditServerRecommendedStop;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  previousLocation = self->_previousLocation;
  if ((unint64_t)previousLocation | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](previousLocation, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_isEditServerRecommendedStop)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOLatLng *)self->_previousLocation hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_isEditServerRecommendedStop;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLocation, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end