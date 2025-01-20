@interface GEOUserPreferences
+ (BOOL)isValid:(id)a3;
+ (Class)evChargingPreferencesType;
- (BOOL)avoidHighways;
- (BOOL)avoidTolls;
- (BOOL)hasAvoidHighways;
- (BOOL)hasAvoidTolls;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOUserPreferences)initWithDictionary:(id)a3;
- (GEOUserPreferences)initWithJSON:(id)a3;
- (NSMutableArray)evChargingPreferences;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)evChargingPreferencesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)evChargingPreferencesCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addEvChargingPreferences:(id)a3;
- (void)clearEvChargingPreferences;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
- (void)setEvChargingPreferences:(id)a3;
- (void)setHasAvoidHighways:(BOOL)a3;
- (void)setHasAvoidTolls:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOUserPreferences

- (void)setAvoidTolls:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_avoidTolls = a3;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_avoidHighways = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingPreferences, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_evChargingPreferences;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 25) = self->_avoidTolls;
    *((unsigned char *)v5 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((unsigned char *)v5 + 24) = self->_avoidHighways;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_evChargingPreferences;
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
        [v6 addEvChargingPreferences:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAvoidTolls
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAvoidHighways
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)evChargingPreferences
{
  return self->_evChargingPreferences;
}

- (void)setEvChargingPreferences:(id)a3
{
}

- (void)clearEvChargingPreferences
{
}

- (void)addEvChargingPreferences:(id)a3
{
  id v4 = a3;
  evChargingPreferences = self->_evChargingPreferences;
  id v8 = v4;
  if (!evChargingPreferences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_evChargingPreferences;
    self->_evChargingPreferences = v6;

    id v4 = v8;
    evChargingPreferences = self->_evChargingPreferences;
  }
  [(NSMutableArray *)evChargingPreferences addObject:v4];
}

- (unint64_t)evChargingPreferencesCount
{
  return [(NSMutableArray *)self->_evChargingPreferences count];
}

- (id)evChargingPreferencesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_evChargingPreferences objectAtIndex:a3];
}

+ (Class)evChargingPreferencesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOUserPreferences;
  id v4 = [(GEOUserPreferences *)&v8 description];
  v5 = [(GEOUserPreferences *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOUserPreferences _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
      if (a2) {
        uint64_t v7 = @"avoidTolls";
      }
      else {
        uint64_t v7 = @"avoid_tolls";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        uint64_t v9 = @"avoidHighways";
      }
      else {
        uint64_t v9 = @"avoid_highways";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 16) count])
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = *(id *)(a1 + 16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            long long v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v13);
      }

      if (a2) {
        long long v18 = @"evChargingPreferences";
      }
      else {
        long long v18 = @"ev_charging_preferences";
      }
      [v4 setObject:v10 forKey:v18];
    }
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      uint64_t v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __48__GEOUserPreferences__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOUserPreferences _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOUserPreferences__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOUserPreferences)initWithDictionary:(id)a3
{
  return (GEOUserPreferences *)-[GEOUserPreferences _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"avoidTolls";
      }
      else {
        v6 = @"avoid_tolls";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"avoidHighways";
      }
      else {
        objc_super v8 = @"avoid_highways";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        id v10 = @"evChargingPreferences";
      }
      else {
        id v10 = @"ev_charging_preferences";
      }
      id v11 = [v5 objectForKeyedSubscript:v10];
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
                long long v18 = [GEOEVChargingPreference alloc];
                if (a3) {
                  uint64_t v19 = [(GEOEVChargingPreference *)v18 initWithJSON:v17];
                }
                else {
                  uint64_t v19 = [(GEOEVChargingPreference *)v18 initWithDictionary:v17];
                }
                uint64_t v20 = (void *)v19;
                [a1 addEvChargingPreferences:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v14);
        }

        id v11 = v22;
      }
    }
  }

  return a1;
}

- (GEOUserPreferences)initWithJSON:(id)a3
{
  return (GEOUserPreferences *)-[GEOUserPreferences _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOUserPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOUserPreferencesReadAllFrom((uint64_t)self, a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOUserPreferences *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[25] = self->_avoidTolls;
    v9[28] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v9[24] = self->_avoidHighways;
    v9[28] |= 1u;
  }
  if ([(GEOUserPreferences *)self evChargingPreferencesCount])
  {
    [v9 clearEvChargingPreferences];
    unint64_t v5 = [(GEOUserPreferences *)self evChargingPreferencesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        objc_super v8 = [(GEOUserPreferences *)self evChargingPreferencesAtIndex:i];
        [v9 addEvChargingPreferences:v8];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOUserPreferences *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_14;
    }
    if (self->_avoidTolls)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_20;
    }
LABEL_14:
    char v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 28) & 1) == 0) {
    goto LABEL_14;
  }
  if (!self->_avoidHighways)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_14;
  }
LABEL_20:
  evChargingPreferences = self->_evChargingPreferences;
  if ((unint64_t)evChargingPreferences | *((void *)v4 + 2)) {
    char v5 = -[NSMutableArray isEqual:](evChargingPreferences, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  [(GEOUserPreferences *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_avoidTolls;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSMutableArray *)self->_evChargingPreferences hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_avoidHighways;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_evChargingPreferences hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_avoidTolls = *((unsigned char *)v4 + 25);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_avoidHighways = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_flags |= 1u;
  }
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
        -[GEOUserPreferences addEvChargingPreferences:](self, "addEvChargingPreferences:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
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
    [(GEOUserPreferences *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_evChargingPreferences;
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

@end