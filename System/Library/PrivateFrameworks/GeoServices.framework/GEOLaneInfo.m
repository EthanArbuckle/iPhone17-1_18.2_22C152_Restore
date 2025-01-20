@interface GEOLaneInfo
+ (BOOL)isValid:(id)a3;
+ (Class)arrowType;
- (BOOL)hasHov;
- (BOOL)hasPreferredForMultipleManeuvers;
- (BOOL)hasSupportsManeuver;
- (BOOL)hov;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferredForMultipleManeuvers;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsManeuver;
- (GEOLaneInfo)initWithDictionary:(id)a3;
- (GEOLaneInfo)initWithJSON:(id)a3;
- (NSMutableArray)arrows;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)arrowAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)arrowsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addArrow:(id)a3;
- (void)clearArrows;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArrows:(id)a3;
- (void)setHasHov:(BOOL)a3;
- (void)setHasPreferredForMultipleManeuvers:(BOOL)a3;
- (void)setHasSupportsManeuver:(BOOL)a3;
- (void)setHov:(BOOL)a3;
- (void)setPreferredForMultipleManeuvers:(BOOL)a3;
- (void)setSupportsManeuver:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLaneInfo

- (BOOL)supportsManeuver
{
  return self->_supportsManeuver;
}

- (void)setSupportsManeuver:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_supportsManeuver = a3;
}

- (void)setHasSupportsManeuver:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSupportsManeuver
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)preferredForMultipleManeuvers
{
  return self->_preferredForMultipleManeuvers;
}

- (void)setPreferredForMultipleManeuvers:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_preferredForMultipleManeuvers = a3;
}

- (void)setHasPreferredForMultipleManeuvers:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasPreferredForMultipleManeuvers
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)hov
{
  return self->_hov;
}

- (void)setHov:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_hov = a3;
}

- (void)setHasHov:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHov
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)arrows
{
  return self->_arrows;
}

- (void)setArrows:(id)a3
{
}

- (void)clearArrows
{
}

- (void)addArrow:(id)a3
{
  id v4 = a3;
  arrows = self->_arrows;
  id v8 = v4;
  if (!arrows)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_arrows;
    self->_arrows = v6;

    id v4 = v8;
    arrows = self->_arrows;
  }
  [(NSMutableArray *)arrows addObject:v4];
}

- (unint64_t)arrowsCount
{
  return [(NSMutableArray *)self->_arrows count];
}

- (id)arrowAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_arrows objectAtIndex:a3];
}

+ (Class)arrowType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLaneInfo;
  id v4 = [(GEOLaneInfo *)&v8 description];
  v5 = [(GEOLaneInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaneInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_22;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_29:
    v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
    if (a2) {
      v25 = @"preferredForMultipleManeuvers";
    }
    else {
      v25 = @"preferred_for_multiple_maneuvers";
    }
    [v4 setObject:v24 forKey:v25];

    if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 26)];
  if (a2) {
    v23 = @"supportsManeuver";
  }
  else {
    v23 = @"supports_maneuver";
  }
  [v4 setObject:v22 forKey:v23];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_29;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"hov"];
  }
LABEL_6:
  if ([*(id *)(a1 + 16) count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v8 = *(id *)(a1 + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (a2) {
            [v13 jsonRepresentation];
          }
          else {
          v14 = [v13 dictionaryRepresentation];
          }
          [v7 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"arrow"];
  }
  v15 = *(void **)(a1 + 8);
  if (v15)
  {
    v16 = [v15 dictionaryRepresentation];
    v17 = v16;
    if (a2)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __41__GEOLaneInfo__dictionaryRepresentation___block_invoke;
      v26[3] = &unk_1E53D8860;
      id v19 = v18;
      id v27 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v26];
      id v20 = v19;

      v17 = v20;
    }
    [v4 setObject:v17 forKey:@"Unknown Fields"];
  }
LABEL_22:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLaneInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLaneInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLaneInfo)initWithDictionary:(id)a3
{
  return (GEOLaneInfo *)-[GEOLaneInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"supportsManeuver";
      }
      else {
        v6 = @"supports_maneuver";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsManeuver:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        id v8 = @"preferredForMultipleManeuvers";
      }
      else {
        id v8 = @"preferred_for_multiple_maneuvers";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPreferredForMultipleManeuvers:", objc_msgSend(v9, "BOOLValue"));
      }

      id v10 = [v5 objectForKeyedSubscript:@"hov"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHov:", objc_msgSend(v10, "BOOLValue"));
      }

      uint64_t v11 = [v5 objectForKeyedSubscript:@"arrow"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v22 = v11;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v18 = [GEOLaneArrowhead alloc];
                if (a3) {
                  uint64_t v19 = [(GEOLaneArrowhead *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOLaneArrowhead *)v18 initWithDictionary:v17];
                }
                id v20 = (void *)v19;
                [a1 addArrow:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        uint64_t v11 = v22;
      }
    }
  }

  return a1;
}

- (GEOLaneInfo)initWithJSON:(id)a3
{
  return (GEOLaneInfo *)-[GEOLaneInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaneInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaneInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_arrows;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOLaneInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    v9[25] = self->_preferredForMultipleManeuvers;
    v9[28] |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v9[26] = self->_supportsManeuver;
  v9[28] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    v9[24] = self->_hov;
    v9[28] |= 1u;
  }
LABEL_5:
  if ([(GEOLaneInfo *)self arrowsCount])
  {
    [v9 clearArrows];
    unint64_t v5 = [(GEOLaneInfo *)self arrowsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLaneInfo *)self arrowAtIndex:i];
        [v9 addArrow:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v5 + 26) = self->_supportsManeuver;
    *((unsigned char *)v5 + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 25) = self->_preferredForMultipleManeuvers;
  *((unsigned char *)v5 + 28) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *((unsigned char *)v5 + 24) = self->_hov;
    *((unsigned char *)v5 + 28) |= 1u;
  }
LABEL_5:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_arrows;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addArrow:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOLaneInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_22;
    }
    if (self->_supportsManeuver)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_preferredForMultipleManeuvers)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_28;
    }
LABEL_22:
    char v5 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 28) & 1) == 0) {
    goto LABEL_22;
  }
  if (!self->_hov)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_28;
    }
    goto LABEL_22;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_22;
  }
LABEL_28:
  arrows = self->_arrows;
  if ((unint64_t)arrows | *((void *)v4 + 2)) {
    char v5 = -[NSMutableArray isEqual:](arrows, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLaneInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_arrows hash];
  }
  uint64_t v3 = 2654435761 * self->_supportsManeuver;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_preferredForMultipleManeuvers;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_hov;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_arrows hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_supportsManeuver = *((unsigned char *)v4 + 26);
    *(unsigned char *)&self->_flags |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_preferredForMultipleManeuvers = *((unsigned char *)v4 + 25);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_4:
    self->_hov = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLaneInfo addArrow:](self, "addArrow:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLaneInfo *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_arrows;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrows, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end