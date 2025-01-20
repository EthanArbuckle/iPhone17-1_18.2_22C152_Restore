@interface GEOPDAirportEntityPlaceLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAirportEntityPlaceLookupParameters)init;
- (GEOPDAirportEntityPlaceLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)setAirportCode:(uint64_t)a1;
- (void)setGateCode:(uint64_t)a1;
- (void)setTerminalCode:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAirportEntityPlaceLookupParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_153;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_154;
      }
      GEOPDAirportEntityPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOPDAirportEntityPlaceLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAirportEntityPlaceLookupParameters;
  v2 = [(GEOPDAirportEntityPlaceLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAirportEntityPlaceLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAirportEntityPlaceLookupParameters;
  v3 = [(GEOPDAirportEntityPlaceLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setAirportCode:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setTerminalCode:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setGateCode:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAirportEntityPlaceLookupParameters;
  id v4 = [(GEOPDAirportEntityPlaceLookupParameters *)&v8 description];
  id v5 = [(GEOPDAirportEntityPlaceLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAirportEntityPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAirportEntityPlaceLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDAirportEntityPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAirportCode_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"airportCode";
      }
      else {
        objc_super v8 = @"airport_code";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDAirportEntityPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTerminalCode_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        v12 = @"terminalCode";
      }
      else {
        v12 = @"terminal_code";
      }
      [v4 setObject:v11 forKey:v12];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOPDAirportEntityPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGateCode_tags);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v15 = *(id *)(a1 + 32);
    if (v15)
    {
      if (a2) {
        v16 = @"gateCode";
      }
      else {
        v16 = @"gate_code";
      }
      [v4 setObject:v15 forKey:v16];
    }

    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __69__GEOPDAirportEntityPlaceLookupParameters__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDAirportEntityPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __69__GEOPDAirportEntityPlaceLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDAirportEntityPlaceLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_airportCode) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_terminalCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_gateCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_airportCode copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_terminalCode copyWithZone:a3];
    id v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_gateCode copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAirportEntityPlaceLookupParametersReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)self, 1),
         -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)v4, 1),
         airportCode = self->_airportCode,
         !((unint64_t)airportCode | v4[3]))
     || -[NSString isEqual:](airportCode, "isEqual:"))
    && ((terminalCode = self->_terminalCode, !((unint64_t)terminalCode | v4[5]))
     || -[NSString isEqual:](terminalCode, "isEqual:")))
  {
    gateCode = self->_gateCode;
    if ((unint64_t)gateCode | v4[4]) {
      char v8 = -[NSString isEqual:](gateCode, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDAirportEntityPlaceLookupParameters readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_airportCode hash];
  NSUInteger v4 = [(NSString *)self->_terminalCode hash] ^ v3;
  return v4 ^ [(NSString *)self->_gateCode hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminalCode, 0);
  objc_storeStrong((id *)&self->_gateCode, 0);
  objc_storeStrong((id *)&self->_airportCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end