@interface GEOLPRLPRFillRule
+ (BOOL)isValid:(id)a3;
- (BOOL)hasFillType;
- (BOOL)hasFrLicensePlateStructure;
- (BOOL)hasFromChar;
- (BOOL)hasToChar;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLPRFillRule)init;
- (GEOLPRLPRFillRule)initWithData:(id)a3;
- (GEOLPRLPRFillRule)initWithDictionary:(id)a3;
- (GEOLPRLPRFillRule)initWithJSON:(id)a3;
- (GEOLPRLicensePlateStructure)frLicensePlateStructure;
- (GEOLPRTargetChar)fromChar;
- (GEOLPRTargetChar)toChar;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fillTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsFillType:(id)a3;
- (int)fillType;
- (unint64_t)hash;
- (unint64_t)plateTypeIndexesCount;
- (unsigned)plateTypeIndexes;
- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFrLicensePlateStructure;
- (void)_readFromChar;
- (void)_readPlateTypeIndexes;
- (void)_readToChar;
- (void)addPlateTypeIndexes:(unsigned int)a3;
- (void)clearPlateTypeIndexes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFillType:(int)a3;
- (void)setFrLicensePlateStructure:(id)a3;
- (void)setFromChar:(id)a3;
- (void)setHasFillType:(BOOL)a3;
- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setToChar:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLPRFillRule

- (GEOLPRLPRFillRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLPRFillRule;
  v2 = [(GEOLPRLPRFillRule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLPRFillRule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLPRFillRule;
  v3 = [(GEOLPRLPRFillRule *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOLPRLPRFillRule;
  [(GEOLPRLPRFillRule *)&v3 dealloc];
}

- (void)_readPlateTypeIndexes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlateTypeIndexes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)plateTypeIndexesCount
{
  return self->_plateTypeIndexes.count;
}

- (unsigned)plateTypeIndexes
{
  return self->_plateTypeIndexes.list;
}

- (void)clearPlateTypeIndexes
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  PBRepeatedUInt32Clear();
}

- (void)addPlateTypeIndexes:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (unsigned)plateTypeIndexesAtIndex:(unint64_t)a3
{
  -[GEOLPRLPRFillRule _readPlateTypeIndexes]((uint64_t)self);
  p_plateTypeIndexes = &self->_plateTypeIndexes;
  unint64_t count = self->_plateTypeIndexes.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_plateTypeIndexes->list[a3];
}

- (void)setPlateTypeIndexes:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;

  MEMORY[0x1F4147400](&self->_plateTypeIndexes, a3, a4);
}

- (void)_readFromChar
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFromChar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFromChar
{
  return self->_fromChar != 0;
}

- (GEOLPRTargetChar)fromChar
{
  -[GEOLPRLPRFillRule _readFromChar]((uint64_t)self);
  fromChar = self->_fromChar;

  return fromChar;
}

- (void)setFromChar:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_fromChar, a3);
}

- (void)_readToChar
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToChar_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasToChar
{
  return self->_toChar != 0;
}

- (GEOLPRTargetChar)toChar
{
  -[GEOLPRLPRFillRule _readToChar]((uint64_t)self);
  toChar = self->_toChar;

  return toChar;
}

- (void)setToChar:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_toChar, a3);
}

- (int)fillType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_fillType;
  }
  else {
    return 1;
  }
}

- (void)setFillType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_fillType = a3;
}

- (void)setHasFillType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasFillType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)fillTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DDB18[a3 - 1];
  }

  return v3;
}

- (int)StringAsFillType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ALPHABET_OR_NUMERIC"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ALPHABET"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NUMERIC"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLPRFillRule;
  int v4 = [(GEOLPRLPRFillRule *)&v8 description];
  v5 = [(GEOLPRLPRFillRule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLPRFillRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"plateTypeIndexes";
      }
      else {
        objc_super v6 = @"plate_type_indexes";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 fromChar];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"fromChar";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"from_char";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 toChar];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"toChar";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"to_char";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if (*(unsigned char *)(a1 + 80))
    {
      unsigned int v15 = *(_DWORD *)(a1 + 76) - 1;
      if (v15 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 76));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DDB18[v15];
      }
      if (a2) {
        v17 = @"fillType";
      }
      else {
        v17 = @"fill_type";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 frLicensePlateStructure];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"frLicensePlateStructure";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"fr_license_plate_structure";
      }
      [v4 setObject:v20 forKey:v21];
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
  return -[GEOLPRLPRFillRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLPRFillRule)initWithDictionary:(id)a3
{
  return (GEOLPRLPRFillRule *)-[GEOLPRLPRFillRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_57;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_57;
  }
  if (a3) {
    objc_super v6 = @"plateTypeIndexes";
  }
  else {
    objc_super v6 = @"plate_type_indexes";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(a1, "addPlateTypeIndexes:", objc_msgSend(v13, "unsignedIntValue", (void)v34));
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v10);
    }
  }
  if (a3) {
    v14 = @"fromChar";
  }
  else {
    v14 = @"from_char";
  }
  unsigned int v15 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, (void)v34);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [GEOLPRTargetChar alloc];
    if (a3) {
      uint64_t v17 = [(GEOLPRTargetChar *)v16 initWithJSON:v15];
    }
    else {
      uint64_t v17 = [(GEOLPRTargetChar *)v16 initWithDictionary:v15];
    }
    v18 = (void *)v17;
    [a1 setFromChar:v17];
  }
  if (a3) {
    v19 = @"toChar";
  }
  else {
    v19 = @"to_char";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [GEOLPRTargetChar alloc];
    if (a3) {
      uint64_t v22 = [(GEOLPRTargetChar *)v21 initWithJSON:v20];
    }
    else {
      uint64_t v22 = [(GEOLPRTargetChar *)v21 initWithDictionary:v20];
    }
    v23 = (void *)v22;
    [a1 setToChar:v22];
  }
  if (a3) {
    v24 = @"fillType";
  }
  else {
    v24 = @"fill_type";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"ALPHABET_OR_NUMERIC"])
    {
      uint64_t v27 = 1;
    }
    else if ([v26 isEqualToString:@"ALPHABET"])
    {
      uint64_t v27 = 2;
    }
    else if ([v26 isEqualToString:@"NUMERIC"])
    {
      uint64_t v27 = 3;
    }
    else
    {
      uint64_t v27 = 1;
    }

    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = [v25 intValue];
LABEL_47:
    [a1 setFillType:v27];
  }

  if (a3) {
    v28 = @"frLicensePlateStructure";
  }
  else {
    v28 = @"fr_license_plate_structure";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GEOLPRLicensePlateStructure alloc];
    if (a3) {
      uint64_t v31 = [(GEOLPRLicensePlateStructure *)v30 initWithJSON:v29];
    }
    else {
      uint64_t v31 = [(GEOLPRLicensePlateStructure *)v30 initWithDictionary:v29];
    }
    v32 = (void *)v31;
    [a1 setFrLicensePlateStructure:v31];
  }
LABEL_57:

  return a1;
}

- (GEOLPRLPRFillRule)initWithJSON:(id)a3
{
  return (GEOLPRLPRFillRule *)-[GEOLPRLPRFillRule _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_261;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_262;
    }
    GEOLPRLPRFillRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLPRTargetChar *)self->_fromChar readAll:1];
    [(GEOLPRTargetChar *)self->_toChar readAll:1];
    [(GEOLPRLicensePlateStructure *)self->_frLicensePlateStructure readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLPRFillRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLPRFillRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOLPRLPRFillRuleIsDirty((uint64_t)self))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_15;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLPRFillRule *)self readAll:0];
  id v5 = v9;
  if (self->_plateTypeIndexes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      ++v6;
    }
    while (v6 < self->_plateTypeIndexes.count);
  }
  if (self->_fromChar)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if (self->_toChar)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v5 = v9;
  }
  if (self->_frLicensePlateStructure)
  {
    PBDataWriterWriteSubmessage();
LABEL_15:
    id v5 = v9;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = (id *)a3;
  [(GEOLPRLPRFillRule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLPRLPRFillRule *)self plateTypeIndexesCount])
  {
    [v8 clearPlateTypeIndexes];
    unint64_t v4 = [(GEOLPRLPRFillRule *)self plateTypeIndexesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addPlateTypeIndexes:", -[GEOLPRLPRFillRule plateTypeIndexesAtIndex:](self, "plateTypeIndexesAtIndex:", i));
    }
  }
  if (self->_fromChar) {
    objc_msgSend(v8, "setFromChar:");
  }
  objc_super v7 = v8;
  if (self->_toChar)
  {
    objc_msgSend(v8, "setToChar:");
    objc_super v7 = v8;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v7 + 19) = self->_fillType;
    *((unsigned char *)v7 + 80) |= 1u;
  }
  if (self->_frLicensePlateStructure)
  {
    objc_msgSend(v8, "setFrLicensePlateStructure:");
    objc_super v7 = v8;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRLPRFillRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLPRFillRule *)self readAll:0];
  PBRepeatedUInt32Copy();
  id v9 = [(GEOLPRTargetChar *)self->_fromChar copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOLPRTargetChar *)self->_toChar copyWithZone:a3];
  v12 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 76) = self->_fillType;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  id v13 = [(GEOLPRLicensePlateStructure *)self->_frLicensePlateStructure copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOLPRLPRFillRule *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_14;
  }
  fromChar = self->_fromChar;
  if ((unint64_t)fromChar | *((void *)v4 + 6))
  {
    if (!-[GEOLPRTargetChar isEqual:](fromChar, "isEqual:")) {
      goto LABEL_14;
    }
  }
  toChar = self->_toChar;
  if ((unint64_t)toChar | *((void *)v4 + 7))
  {
    if (!-[GEOLPRTargetChar isEqual:](toChar, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_fillType != *((_DWORD *)v4 + 19)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_14:
    char v8 = 0;
    goto LABEL_15;
  }
  frLicensePlateStructure = self->_frLicensePlateStructure;
  if ((unint64_t)frLicensePlateStructure | *((void *)v4 + 5)) {
    char v8 = -[GEOLPRLicensePlateStructure isEqual:](frLicensePlateStructure, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLPRLPRFillRule *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  unint64_t v4 = [(GEOLPRTargetChar *)self->_fromChar hash];
  unint64_t v5 = [(GEOLPRTargetChar *)self->_toChar hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_fillType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOLPRLicensePlateStructure *)self->_frLicensePlateStructure hash];
}

- (void)mergeFrom:(id)a3
{
  v14 = a3;
  [v14 readAll:0];
  uint64_t v4 = [v14 plateTypeIndexesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOLPRLPRFillRule addPlateTypeIndexes:](self, "addPlateTypeIndexes:", [v14 plateTypeIndexesAtIndex:i]);
  }
  fromChar = self->_fromChar;
  char v8 = v14;
  uint64_t v9 = v14[6];
  if (fromChar)
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOLPRTargetChar mergeFrom:](fromChar, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_10;
    }
    -[GEOLPRLPRFillRule setFromChar:](self, "setFromChar:");
  }
  char v8 = v14;
LABEL_10:
  toChar = self->_toChar;
  uint64_t v11 = v8[7];
  if (toChar)
  {
    if (!v11) {
      goto LABEL_16;
    }
    -[GEOLPRTargetChar mergeFrom:](toChar, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_16;
    }
    -[GEOLPRLPRFillRule setToChar:](self, "setToChar:");
  }
  char v8 = v14;
LABEL_16:
  if (v8[10])
  {
    self->_fillType = *((_DWORD *)v8 + 19);
    *(unsigned char *)&self->_flags |= 1u;
  }
  frLicensePlateStructure = self->_frLicensePlateStructure;
  uint64_t v13 = v8[5];
  if (frLicensePlateStructure)
  {
    if (!v13) {
      goto LABEL_24;
    }
    -[GEOLPRLicensePlateStructure mergeFrom:](frLicensePlateStructure, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_24;
    }
    -[GEOLPRLPRFillRule setFrLicensePlateStructure:](self, "setFrLicensePlateStructure:");
  }
  char v8 = v14;
LABEL_24:
}

- (void)_readFrLicensePlateStructure
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLPRFillRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFrLicensePlateStructure_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFrLicensePlateStructure
{
  return self->_frLicensePlateStructure != 0;
}

- (GEOLPRLicensePlateStructure)frLicensePlateStructure
{
  -[GEOLPRLPRFillRule _readFrLicensePlateStructure]((uint64_t)self);
  frLicensePlateStructure = self->_frLicensePlateStructure;

  return frLicensePlateStructure;
}

- (void)setFrLicensePlateStructure:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_frLicensePlateStructure, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toChar, 0);
  objc_storeStrong((id *)&self->_fromChar, 0);
  objc_storeStrong((id *)&self->_frLicensePlateStructure, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end