@interface GEOTransitLeg
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSectionOptionIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitLeg)initWithDictionary:(id)a3;
- (GEOTransitLeg)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)restrictedToSectionIndexAtIndex:(unint64_t)a3;
- (int)restrictedToSectionIndexs;
- (int)sectionOptionIndex;
- (unint64_t)hash;
- (unint64_t)restrictedToSectionIndexsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addRestrictedToSectionIndex:(int)a3;
- (void)clearRestrictedToSectionIndexs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasSectionOptionIndex:(BOOL)a3;
- (void)setRestrictedToSectionIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setSectionOptionIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitLeg

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitLeg;
  [(GEOTransitLeg *)&v3 dealloc];
}

- (int)sectionOptionIndex
{
  return self->_sectionOptionIndex;
}

- (void)setSectionOptionIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_sectionOptionIndex = a3;
}

- (void)setHasSectionOptionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSectionOptionIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unint64_t)restrictedToSectionIndexsCount
{
  return self->_restrictedToSectionIndexs.count;
}

- (int)restrictedToSectionIndexs
{
  return self->_restrictedToSectionIndexs.list;
}

- (void)clearRestrictedToSectionIndexs
{
}

- (void)addRestrictedToSectionIndex:(int)a3
{
}

- (int)restrictedToSectionIndexAtIndex:(unint64_t)a3
{
  p_restrictedToSectionIndexs = &self->_restrictedToSectionIndexs;
  unint64_t count = self->_restrictedToSectionIndexs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_restrictedToSectionIndexs->list[a3];
}

- (void)setRestrictedToSectionIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitLeg;
  v4 = [(GEOTransitLeg *)&v8 description];
  v5 = [(GEOTransitLeg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitLeg _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 44))
    {
      v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
      if (a2) {
        v6 = @"sectionOptionIndex";
      }
      else {
        v6 = @"section_option_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 24))
    {
      uint64_t v7 = PBRepeatedInt32NSArray();
      if (a2) {
        objc_super v8 = @"restrictedToSectionIndex";
      }
      else {
        objc_super v8 = @"restricted_to_section_index";
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
        v16[2] = __43__GEOTransitLeg__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitLeg _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOTransitLeg__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOTransitLeg)initWithDictionary:(id)a3
{
  return (GEOTransitLeg *)-[GEOTransitLeg _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"sectionOptionIndex";
      }
      else {
        v6 = @"section_option_index";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSectionOptionIndex:", objc_msgSend(v7, "intValue"));
      }

      if (a3) {
        objc_super v8 = @"restrictedToSectionIndex";
      }
      else {
        objc_super v8 = @"restricted_to_section_index";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRestrictedToSectionIndex:", objc_msgSend(v15, "intValue", (void)v17));
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v12);
        }
      }
    }
  }

  return a1;
}

- (GEOTransitLeg)initWithJSON:(id)a3
{
  return (GEOTransitLeg *)-[GEOTransitLeg _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitLegIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitLegReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_restrictedToSectionIndexs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_restrictedToSectionIndexs.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = a3;
  [(GEOTransitLeg *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v7[10] = self->_sectionOptionIndex;
    *((unsigned char *)v7 + 44) |= 1u;
  }
  if ([(GEOTransitLeg *)self restrictedToSectionIndexsCount])
  {
    [v7 clearRestrictedToSectionIndexs];
    unint64_t v4 = [(GEOTransitLeg *)self restrictedToSectionIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addRestrictedToSectionIndex:", -[GEOTransitLeg restrictedToSectionIndexAtIndex:](self, "restrictedToSectionIndexAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (id *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 40) = self->_sectionOptionIndex;
    *(unsigned char *)(v4 + 44) |= 1u;
  }
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOTransitLeg *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_sectionOptionIndex != *((_DWORD *)v4 + 10)) {
      goto LABEL_8;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOTransitLeg *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_sectionOptionIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  return PBRepeatedInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v7 = (int *)a3;
  [v7 readAll:0];
  if (v7[11])
  {
    self->_sectionOptionIndex = v7[10];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v7 restrictedToSectionIndexsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOTransitLeg addRestrictedToSectionIndex:](self, "addRestrictedToSectionIndex:", [v7 restrictedToSectionIndexAtIndex:i]);
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
    [(GEOTransitLeg *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end