@interface GEOPDPublisherSuggestionParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPublisherSuggestionParameters

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"viewportInfo";
    }
    else {
      v7 = @"viewport_info";
    }
    v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [GEOPDViewportInfo alloc];
      if (a3) {
        v10 = [(GEOPDViewportInfo *)v9 initWithJSON:v8];
      }
      else {
        v10 = [(GEOPDViewportInfo *)v9 initWithDictionary:v8];
      }
      v11 = v10;
      -[GEOPDPublisherSuggestionParameters setViewportInfo:](v6, v10);
    }
    if (a3) {
      v12 = @"requestLocalTimestamp";
    }
    else {
      v12 = @"request_local_timestamp";
    }
    v13 = [v5 objectForKeyedSubscript:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      *(unsigned char *)(v6 + 32) |= 1u;
      *(void *)(v6 + 16) = v14;
    }
  }
  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = *(id *)(a1 + 24);
    uint64_t v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        v8 = @"viewportInfo";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        v8 = @"viewport_info";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 32))
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v10 = @"requestLocalTimestamp";
      }
      else {
        v10 = @"request_local_timestamp";
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
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__GEOPDPublisherSuggestionParameters__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

void __64__GEOPDPublisherSuggestionParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  v4 = *(void **)(a1 + 24);
  id v5 = (void *)v3[3];
  if (v4)
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = v3;
    objc_msgSend(v4, "mergeFrom:");
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v6 = v3;
    -[GEOPDPublisherSuggestionParameters setViewportInfo:](a1, v5);
  }
  v3 = v6;
LABEL_7:
  if (v3[4])
  {
    *(void *)(a1 + 16) = v3[2];
    *(unsigned char *)(a1 + 32) |= 1u;
  }
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = *(void **)(result + 8);
    *(void *)(result + 8) = 0;

    v3 = *(void **)(v1 + 24);
    return [v3 clearUnknownFields:1];
  }
  return result;
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPublisherSuggestionParameters;
  id v4 = [(GEOPDPublisherSuggestionParameters *)&v8 description];
  id v5 = [(GEOPDPublisherSuggestionParameters *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPublisherSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPublisherSuggestionParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPublisherSuggestionParametersReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_viewportInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 16) = self->_requestLocalTimestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 3))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_requestLocalTimestamp == *((double *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOPDViewportInfo *)self->_viewportInfo hash];
  if (*(unsigned char *)&self->_flags)
  {
    double requestLocalTimestamp = self->_requestLocalTimestamp;
    double v6 = -requestLocalTimestamp;
    if (requestLocalTimestamp >= 0.0) {
      double v6 = self->_requestLocalTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end