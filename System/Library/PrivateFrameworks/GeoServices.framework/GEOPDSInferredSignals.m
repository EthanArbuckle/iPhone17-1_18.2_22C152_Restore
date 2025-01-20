@interface GEOPDSInferredSignals
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (unint64_t)hash;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)setInferredInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSInferredSignals

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inferredInfo, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setInferredInfo:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSInferredSignals;
  id v4 = [(GEOPDSInferredSignals *)&v8 description];
  v5 = [(GEOPDSInferredSignals *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSInferredSignals _dictionaryRepresentation:]((uint64_t)self, 0);
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
        objc_super v8 = @"inferredInfo";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"inferred_info";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __51__GEOPDSInferredSignals__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPDSInferredSignals _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOPDSInferredSignals__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"inferredInfo";
      }
      else {
        v6 = @"inferred_info";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDSInferredInfo alloc];
        if (v8) {
          v9 = (void *)-[GEOPDSInferredInfo _initWithDictionary:isJSON:](v8, v7, a3);
        }
        else {
          v9 = 0;
        }
        -[GEOPDSInferredSignals setInferredInfo:]((uint64_t)a1, v9);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSInferredSignalsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_inferredInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDSInferredInfo *)self->_inferredInfo copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    inferredInfo = self->_inferredInfo;
    if ((unint64_t)inferredInfo | v4[2]) {
      char v6 = -[GEOPDSInferredInfo isEqual:](inferredInfo, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(GEOPDSInferredInfo *)self->_inferredInfo hash];
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = (void *)v3[2];
    if (v4)
    {
      if (v5) {
        -[GEOPDSInferredInfo mergeFrom:](v4, v5);
      }
    }
    else if (v5)
    {
      -[GEOPDSInferredSignals setInferredInfo:](a1, v5);
    }
  }

  return MEMORY[0x1F4181820]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 16);
      -[GEOPDSInferredInfo clearUnknownFields:](v5, 1);
    }
  }
}

@end