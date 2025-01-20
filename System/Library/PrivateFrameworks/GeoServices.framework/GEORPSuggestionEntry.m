@interface GEORPSuggestionEntry
+ (BOOL)isValid:(id)a3;
+ (Class)displayLineType;
- (BOOL)hasServerSearchCompletionEntryIndex;
- (BOOL)hasServerSearchCompletionSectionIndex;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPSuggestionEntry)initWithDictionary:(id)a3;
- (GEORPSuggestionEntry)initWithJSON:(id)a3;
- (NSMutableArray)displayLines;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayLineAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)displayLinesCount;
- (unint64_t)hash;
- (unsigned)serverSearchCompletionEntryIndex;
- (unsigned)serverSearchCompletionSectionIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addDisplayLine:(id)a3;
- (void)clearDisplayLines;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayLines:(id)a3;
- (void)setHasServerSearchCompletionEntryIndex:(BOOL)a3;
- (void)setHasServerSearchCompletionSectionIndex:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setServerSearchCompletionEntryIndex:(unsigned int)a3;
- (void)setServerSearchCompletionSectionIndex:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPSuggestionEntry

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E6E88[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUGGESTION_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_SERVER_SEARCH_COMPLETION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_ADDRESS_BOOK_CONTACT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_ROUTINE_SUGGESTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_HISTORY_DIRECTIONS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_HISTORY_PLACE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_HISTORY_SEARCH"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_RECENT_CONTACT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_TYPE_SEARCH_SUGGESTION"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)displayLines
{
  return self->_displayLines;
}

- (void)setDisplayLines:(id)a3
{
}

- (void)clearDisplayLines
{
}

- (void)addDisplayLine:(id)a3
{
  id v4 = a3;
  displayLines = self->_displayLines;
  id v8 = v4;
  if (!displayLines)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_displayLines;
    self->_displayLines = v6;

    id v4 = v8;
    displayLines = self->_displayLines;
  }
  [(NSMutableArray *)displayLines addObject:v4];
}

- (unint64_t)displayLinesCount
{
  return [(NSMutableArray *)self->_displayLines count];
}

- (id)displayLineAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_displayLines objectAtIndex:a3];
}

+ (Class)displayLineType
{
  return (Class)objc_opt_class();
}

- (unsigned)serverSearchCompletionSectionIndex
{
  return self->_serverSearchCompletionSectionIndex;
}

- (void)setServerSearchCompletionSectionIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_serverSearchCompletionSectionIndex = a3;
}

- (void)setHasServerSearchCompletionSectionIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasServerSearchCompletionSectionIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)serverSearchCompletionEntryIndex
{
  return self->_serverSearchCompletionEntryIndex;
}

- (void)setServerSearchCompletionEntryIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_serverSearchCompletionEntryIndex = a3;
}

- (void)setHasServerSearchCompletionEntryIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasServerSearchCompletionEntryIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPSuggestionEntry;
  id v4 = [(GEORPSuggestionEntry *)&v8 description];
  v5 = [(GEORPSuggestionEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 28) & 4) != 0)
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 9)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E6E88[v5];
      }
      [v4 setObject:v6 forKey:@"type"];
    }
    if (*(void *)(a1 + 8))
    {
      v7 = [(id)a1 displayLines];
      if (a2) {
        objc_super v8 = @"displayLine";
      }
      else {
        objc_super v8 = @"display_line";
      }
      [v4 setObject:v7 forKey:v8];
    }
    char v9 = *(unsigned char *)(a1 + 28);
    if ((v9 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v11 = @"serverSearchCompletionSectionIndex";
      }
      else {
        v11 = @"server_search_completion_section_index";
      }
      [v4 setObject:v10 forKey:v11];

      char v9 = *(unsigned char *)(a1 + 28);
    }
    if (v9)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v13 = @"serverSearchCompletionEntryIndex";
      }
      else {
        v13 = @"server_search_completion_entry_index";
      }
      [v4 setObject:v12 forKey:v13];
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
  return -[GEORPSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPSuggestionEntry)initWithDictionary:(id)a3
{
  return (GEORPSuggestionEntry *)-[GEORPSuggestionEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_52;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_52;
  }
  v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"SUGGESTION_TYPE_NONE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_SERVER_SEARCH_COMPLETION"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_ADDRESS_BOOK_CONTACT"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_ROUTINE_SUGGESTION"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_HISTORY_DIRECTIONS"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_HISTORY_PLACE"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_HISTORY_SEARCH"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_RECENT_CONTACT"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"SUGGESTION_TYPE_SEARCH_SUGGESTION"])
    {
      uint64_t v8 = 8;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_26:
    [a1 setType:v8];
  }

  if (a3) {
    char v9 = @"displayLine";
  }
  else {
    char v9 = @"display_line";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = objc_msgSend(v16, "copy", (void)v23);
            [a1 addDisplayLine:v17];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }
  }
  if (a3) {
    v18 = @"serverSearchCompletionSectionIndex";
  }
  else {
    v18 = @"server_search_completion_section_index";
  }
  v19 = objc_msgSend(v5, "objectForKeyedSubscript:", v18, (void)v23);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setServerSearchCompletionSectionIndex:", objc_msgSend(v19, "unsignedIntValue"));
  }

  if (a3) {
    v20 = @"serverSearchCompletionEntryIndex";
  }
  else {
    v20 = @"server_search_completion_entry_index";
  }
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setServerSearchCompletionEntryIndex:", objc_msgSend(v21, "unsignedIntValue"));
  }

LABEL_52:
  return a1;
}

- (GEORPSuggestionEntry)initWithJSON:(id)a3
{
  return (GEORPSuggestionEntry *)-[GEORPSuggestionEntry _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPSuggestionEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPSuggestionEntryReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_displayLines;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  char v9 = a3;
  [(GEORPSuggestionEntry *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    v9[6] = self->_type;
    *((unsigned char *)v9 + 28) |= 4u;
  }
  if ([(GEORPSuggestionEntry *)self displayLinesCount])
  {
    [v9 clearDisplayLines];
    unint64_t v4 = [(GEORPSuggestionEntry *)self displayLinesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPSuggestionEntry *)self displayLineAtIndex:i];
        [v9 addDisplayLine:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[5] = self->_serverSearchCompletionSectionIndex;
    *((unsigned char *)v9 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v9[4] = self->_serverSearchCompletionEntryIndex;
    *((unsigned char *)v9 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 4u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_displayLines;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addDisplayLine:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_serverSearchCompletionSectionIndex;
    *(unsigned char *)(v6 + 28) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v6 + 16) = self->_serverSearchCompletionEntryIndex;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPSuggestionEntry *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 28);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  displayLines = self->_displayLines;
  if ((unint64_t)displayLines | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](displayLines, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_serverSearchCompletionSectionIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_19;
  }
  BOOL v8 = (v6 & 1) == 0;
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_serverSearchCompletionEntryIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPSuggestionEntry *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_displayLines hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_serverSearchCompletionSectionIndex;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_serverSearchCompletionEntryIndex;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 4u;
  }
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
        -[GEORPSuggestionEntry addDisplayLine:](self, "addDisplayLine:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 28);
  if ((v10 & 2) != 0)
  {
    self->_serverSearchCompletionSectionIndex = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v4 + 28);
  }
  if (v10)
  {
    self->_serverSearchCompletionEntryIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end