@interface GEOTransitExitPlanInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLabel;
- (BOOL)hasNumberOfCars;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)label;
- (GEOTransitExitPlanInfo)init;
- (GEOTransitExitPlanInfo)initWithData:(id)a3;
- (GEOTransitExitPlanInfo)initWithDictionary:(id)a3;
- (GEOTransitExitPlanInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)selectedCarIndexsCount;
- (unsigned)numberOfCars;
- (unsigned)selectedCarIndexAtIndex:(unint64_t)a3;
- (unsigned)selectedCarIndexs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLabel;
- (void)_readSelectedCarIndexs;
- (void)addSelectedCarIndex:(unsigned int)a3;
- (void)clearSelectedCarIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasNumberOfCars:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNumberOfCars:(unsigned int)a3;
- (void)setSelectedCarIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitExitPlanInfo

- (GEOTransitExitPlanInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitExitPlanInfo;
  v2 = [(GEOTransitExitPlanInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitExitPlanInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitExitPlanInfo;
  v3 = [(GEOTransitExitPlanInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitExitPlanInfo;
  [(GEOTransitExitPlanInfo *)&v3 dealloc];
}

- (unsigned)numberOfCars
{
  return self->_numberOfCars;
}

- (void)setNumberOfCars:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_numberOfCars = a3;
}

- (void)setHasNumberOfCars:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasNumberOfCars
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSelectedCarIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitExitPlanInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSelectedCarIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)selectedCarIndexsCount
{
  return self->_selectedCarIndexs.count;
}

- (unsigned)selectedCarIndexs
{
  return self->_selectedCarIndexs.list;
}

- (void)clearSelectedCarIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt32Clear();
}

- (void)addSelectedCarIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)selectedCarIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitExitPlanInfo _readSelectedCarIndexs]((uint64_t)self);
  p_selectedCarIndexs = &self->_selectedCarIndexs;
  unint64_t count = self->_selectedCarIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_selectedCarIndexs->list[a3];
}

- (void)setSelectedCarIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_selectedCarIndexs, a3, a4);
}

- (void)_readLabel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitExitPlanInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (GEOFormattedString)label
{
  -[GEOTransitExitPlanInfo _readLabel]((uint64_t)self);
  label = self->_label;

  return label;
}

- (void)setLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_label, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitExitPlanInfo;
  v4 = [(GEOTransitExitPlanInfo *)&v8 description];
  v5 = [(GEOTransitExitPlanInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitExitPlanInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 72))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v6 = @"numberOfCars";
      }
      else {
        objc_super v6 = @"number_of_cars";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      objc_super v7 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v8 = @"selectedCarIndex";
      }
      else {
        objc_super v8 = @"selected_car_index";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 label];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"label"];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __52__GEOTransitExitPlanInfo__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitExitPlanInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOTransitExitPlanInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOTransitExitPlanInfo)initWithDictionary:(id)a3
{
  return (GEOTransitExitPlanInfo *)-[GEOTransitExitPlanInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"numberOfCars";
      }
      else {
        objc_super v6 = @"number_of_cars";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNumberOfCars:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"selectedCarIndex";
      }
      else {
        objc_super v8 = @"selected_car_index";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addSelectedCarIndex:", objc_msgSend(v15, "unsignedIntValue", (void)v21));
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v12);
        }
      }
      id v16 = [v5 objectForKeyedSubscript:@"label"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v18 = [(GEOFormattedString *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOFormattedString *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        objc_msgSend(a1, "setLabel:", v18, (void)v21);
      }
    }
  }

  return a1;
}

- (GEOTransitExitPlanInfo)initWithJSON:(id)a3
{
  return (GEOTransitExitPlanInfo *)-[GEOTransitExitPlanInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_907;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_908;
    }
    GEOTransitExitPlanInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOFormattedString *)self->_label readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitExitPlanInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitExitPlanInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitExitPlanInfoIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitExitPlanInfo *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    id v5 = v9;
    if (self->_selectedCarIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_selectedCarIndexs.count);
    }
    if (self->_label)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOTransitExitPlanInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v7 + 17) = self->_numberOfCars;
    *((unsigned char *)v7 + 72) |= 1u;
  }
  if ([(GEOTransitExitPlanInfo *)self selectedCarIndexsCount])
  {
    [v7 clearSelectedCarIndexs];
    unint64_t v4 = [(GEOTransitExitPlanInfo *)self selectedCarIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSelectedCarIndex:", -[GEOTransitExitPlanInfo selectedCarIndexAtIndex:](self, "selectedCarIndexAtIndex:", i));
    }
  }
  if (self->_label) {
    objc_msgSend(v7, "setLabel:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTransitExitPlanInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitExitPlanInfo *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_numberOfCars;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  PBRepeatedUInt32Copy();
  id v9 = [(GEOFormattedString *)self->_label copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOTransitExitPlanInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_numberOfCars != *((_DWORD *)v4 + 17)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_10;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_10:
    char v6 = 0;
    goto LABEL_11;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 6)) {
    char v6 = -[GEOFormattedString isEqual:](label, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  [(GEOTransitExitPlanInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_numberOfCars;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt32Hash() ^ v3;
  return v4 ^ [(GEOFormattedString *)self->_label hash];
}

- (void)mergeFrom:(id)a3
{
  id v10 = (unsigned int *)a3;
  [v10 readAll:0];
  if (v10[18])
  {
    self->_numberOfCars = v10[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v10 selectedCarIndexsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOTransitExitPlanInfo addSelectedCarIndex:](self, "addSelectedCarIndex:", [v10 selectedCarIndexAtIndex:i]);
  }
  label = self->_label;
  id v8 = v10;
  uint64_t v9 = *((void *)v10 + 6);
  if (label)
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOFormattedString mergeFrom:](label, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    -[GEOTransitExitPlanInfo setLabel:](self, "setLabel:");
  }
  id v8 = v10;
LABEL_12:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitExitPlanInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_912);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitExitPlanInfo *)self readAll:0];
    label = self->_label;
    [(GEOFormattedString *)label clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end