@interface GEOPDPlaceSummaryLayoutLine
+ (BOOL)isValid:(id)a3;
+ (Class)unitType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsDynamicContextLine;
- (BOOL)hasShouldOmitSpacingDelimiter;
- (BOOL)isDynamicContextLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldOmitSpacingDelimiter;
- (GEOPDPlaceSummaryLayoutLine)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutLine)initWithJSON:(id)a3;
- (NSMutableArray)units;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)unitAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)unitsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addUnit:(id)a3;
- (void)clearUnits;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDynamicContextLine:(BOOL)a3;
- (void)setHasShouldOmitSpacingDelimiter:(BOOL)a3;
- (void)setIsDynamicContextLine:(BOOL)a3;
- (void)setShouldOmitSpacingDelimiter:(BOOL)a3;
- (void)setUnits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutLine

- (NSMutableArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
}

- (void)clearUnits
{
}

- (void)addUnit:(id)a3
{
  id v4 = a3;
  units = self->_units;
  id v8 = v4;
  if (!units)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_units;
    self->_units = v6;

    id v4 = v8;
    units = self->_units;
  }
  [(NSMutableArray *)units addObject:v4];
}

- (unint64_t)unitsCount
{
  return [(NSMutableArray *)self->_units count];
}

- (id)unitAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_units objectAtIndex:a3];
}

+ (Class)unitType
{
  return (Class)objc_opt_class();
}

- (BOOL)isDynamicContextLine
{
  return self->_isDynamicContextLine;
}

- (void)setIsDynamicContextLine:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isDynamicContextLine = a3;
}

- (void)setHasIsDynamicContextLine:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsDynamicContextLine
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)shouldOmitSpacingDelimiter
{
  return self->_shouldOmitSpacingDelimiter;
}

- (void)setShouldOmitSpacingDelimiter:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_shouldOmitSpacingDelimiter = a3;
}

- (void)setHasShouldOmitSpacingDelimiter:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasShouldOmitSpacingDelimiter
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutLine;
  id v4 = [(GEOPDPlaceSummaryLayoutLine *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutLine *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutLine _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v6 = *(id *)(a1 + 8);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v19);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v19);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"unit"];
    }
    char v13 = *(unsigned char *)(a1 + 20);
    if (v13)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v15 = @"isDynamicContextLine";
      }
      else {
        v15 = @"is_dynamic_context_line";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v15, (void)v19);

      char v13 = *(unsigned char *)(a1 + 20);
    }
    if ((v13 & 2) != 0)
    {
      v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
      if (a2) {
        v17 = @"shouldOmitSpacingDelimiter";
      }
      else {
        v17 = @"should_omit_spacing_delimiter";
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v17, (void)v19);
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
  return -[GEOPDPlaceSummaryLayoutLine _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutLine)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutLine *)-[GEOPDPlaceSummaryLayoutLine _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"unit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v21 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v13 = [GEOPDPlaceSummaryLayoutUnit alloc];
                if (a3) {
                  uint64_t v14 = [(GEOPDPlaceSummaryLayoutUnit *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOPDPlaceSummaryLayoutUnit *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addUnit:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v9);
        }

        id v6 = v21;
      }

      if (a3) {
        v16 = @"isDynamicContextLine";
      }
      else {
        v16 = @"is_dynamic_context_line";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsDynamicContextLine:", objc_msgSend(v17, "BOOLValue"));
      }

      if (a3) {
        v18 = @"shouldOmitSpacingDelimiter";
      }
      else {
        v18 = @"should_omit_spacing_delimiter";
      }
      long long v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldOmitSpacingDelimiter:", objc_msgSend(v19, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutLine)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutLine *)-[GEOPDPlaceSummaryLayoutLine _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutLineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutLineReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_units;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_units;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  BOOL v9 = a3;
  [(GEOPDPlaceSummaryLayoutLine *)self readAll:0];
  if ([(GEOPDPlaceSummaryLayoutLine *)self unitsCount])
  {
    [v9 clearUnits];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutLine *)self unitsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryLayoutLine *)self unitAtIndex:i];
        [v9 addUnit:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v9[16] = self->_isDynamicContextLine;
    v9[20] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v9[17] = self->_shouldOmitSpacingDelimiter;
    v9[20] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_units;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [v5 addUnit:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    v5[16] = self->_isDynamicContextLine;
    v5[20] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[17] = self->_shouldOmitSpacingDelimiter;
    v5[20] |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPDPlaceSummaryLayoutLine *)self readAll:1];
  [v4 readAll:1];
  units = self->_units;
  if ((unint64_t)units | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](units, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_isDynamicContextLine)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_shouldOmitSpacingDelimiter)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 17))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutLine *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_units hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_isDynamicContextLine;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_shouldOmitSpacingDelimiter;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDPlaceSummaryLayoutLine addUnit:](self, "addUnit:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 20);
  if (v10)
  {
    self->_isDynamicContextLine = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v4 + 20);
  }
  if ((v10 & 2) != 0)
  {
    self->_shouldOmitSpacingDelimiter = *((unsigned char *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end