@interface GEOTransitSectionOption
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDefaultSectionIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitSectionOption)initWithDictionary:(id)a3;
- (GEOTransitSectionOption)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)sectionsCount;
- (unsigned)defaultSectionIndex;
- (unsigned)sectionAtIndex:(unint64_t)a3;
- (unsigned)sections;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSection:(unsigned int)a3;
- (void)clearSections;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDefaultSectionIndex:(unsigned int)a3;
- (void)setHasDefaultSectionIndex:(BOOL)a3;
- (void)setSections:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSectionOption

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSectionOption;
  [(GEOTransitSectionOption *)&v3 dealloc];
}

- (unint64_t)sectionsCount
{
  return self->_sections.count;
}

- (unsigned)sections
{
  return self->_sections.list;
}

- (void)clearSections
{
}

- (void)addSection:(unsigned int)a3
{
}

- (unsigned)sectionAtIndex:(unint64_t)a3
{
  p_sections = &self->_sections;
  unint64_t count = self->_sections.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_sections->list[a3];
}

- (void)setSections:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unsigned)defaultSectionIndex
{
  return self->_defaultSectionIndex;
}

- (void)setDefaultSectionIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_defaultSectionIndex = a3;
}

- (void)setHasDefaultSectionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDefaultSectionIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSectionOption;
  v4 = [(GEOTransitSectionOption *)&v8 description];
  v5 = [(GEOTransitSectionOption *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSectionOption _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      v5 = PBRepeatedUInt32NSArray();
      [v4 setObject:v5 forKey:@"section"];
    }
    if (*(unsigned char *)(a1 + 44))
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
      if (a2) {
        uint64_t v7 = @"defaultSectionIndex";
      }
      else {
        uint64_t v7 = @"default_section_index";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __53__GEOTransitSectionOption__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOTransitSectionOption _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOTransitSectionOption__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitSectionOption)initWithDictionary:(id)a3
{
  return (GEOTransitSectionOption *)-[GEOTransitSectionOption _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"section"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v17;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v17 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addSection:", objc_msgSend(v12, "unsignedIntValue", (void)v16));
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v9);
        }
      }
      if (a3) {
        id v13 = @"defaultSectionIndex";
      }
      else {
        id v13 = @"default_section_index";
      }
      v14 = objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v16);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDefaultSectionIndex:", objc_msgSend(v14, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTransitSectionOption)initWithJSON:(id)a3
{
  return (GEOTransitSectionOption *)-[GEOTransitSectionOption _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSectionOptionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSectionOptionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_sections.count)
  {
    PBDataWriterPlaceMark();
    if (self->_sections.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_sections.count);
    }
    PBDataWriterRecallMark();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOTransitSectionOption *)self readAll:0];
  if ([(GEOTransitSectionOption *)self sectionsCount])
  {
    [v7 clearSections];
    unint64_t v4 = [(GEOTransitSectionOption *)self sectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addSection:", -[GEOTransitSectionOption sectionAtIndex:](self, "sectionAtIndex:", i));
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v7 + 10) = self->_defaultSectionIndex;
    *((unsigned char *)v7 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 40) = self->_defaultSectionIndex;
    *(unsigned char *)(v4 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  [(GEOTransitSectionOption *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) != 0 && self->_defaultSectionIndex == *((_DWORD *)v4 + 10))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  [(GEOTransitSectionOption *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_defaultSectionIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (unsigned int *)a3;
  [v7 readAll:0];
  uint64_t v4 = [v7 sectionsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOTransitSectionOption addSection:](self, "addSection:", [v7 sectionAtIndex:i]);
  }
  if (v7[11])
  {
    self->_defaultSectionIndex = v7[10];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOTransitSectionOption *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end