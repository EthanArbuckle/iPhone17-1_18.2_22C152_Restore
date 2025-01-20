@interface GEOSuggestionItem
+ (BOOL)isValid:(id)a3;
- (BOOL)eventuallyVisible;
- (BOOL)hasEventuallyVisible;
- (BOOL)hasInitiallyVisible;
- (BOOL)hasSuggestionString;
- (BOOL)hasTappingCount;
- (BOOL)initiallyVisible;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSuggestionItem)initWithDictionary:(id)a3;
- (GEOSuggestionItem)initWithJSON:(id)a3;
- (NSString)suggestionString;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)tappingCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventuallyVisible:(BOOL)a3;
- (void)setHasEventuallyVisible:(BOOL)a3;
- (void)setHasInitiallyVisible:(BOOL)a3;
- (void)setHasTappingCount:(BOOL)a3;
- (void)setInitiallyVisible:(BOOL)a3;
- (void)setSuggestionString:(id)a3;
- (void)setTappingCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSuggestionItem

- (BOOL)hasSuggestionString
{
  return self->_suggestionString != 0;
}

- (NSString)suggestionString
{
  return self->_suggestionString;
}

- (void)setSuggestionString:(id)a3
{
}

- (BOOL)initiallyVisible
{
  return self->_initiallyVisible;
}

- (void)setInitiallyVisible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_initiallyVisible = a3;
}

- (void)setHasInitiallyVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasInitiallyVisible
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)eventuallyVisible
{
  return self->_eventuallyVisible;
}

- (void)setEventuallyVisible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_eventuallyVisible = a3;
}

- (void)setHasEventuallyVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEventuallyVisible
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (int)tappingCount
{
  return self->_tappingCount;
}

- (void)setTappingCount:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_tappingCount = a3;
}

- (void)setHasTappingCount:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTappingCount
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSuggestionItem;
  v4 = [(GEOSuggestionItem *)&v8 description];
  v5 = [(GEOSuggestionItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSuggestionItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 suggestionString];
  if (v5)
  {
    if (a2) {
      v6 = @"suggestionString";
    }
    else {
      v6 = @"suggestion_string";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 24);
  if ((v7 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
    if (a2) {
      v11 = @"eventuallyVisible";
    }
    else {
      v11 = @"eventually_visible";
    }
    [v4 setObject:v10 forKey:v11];

    if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
  if (a2) {
    v9 = @"initiallyVisible";
  }
  else {
    v9 = @"initially_visible";
  }
  [v4 setObject:v8 forKey:v9];

  char v7 = *(unsigned char *)(a1 + 24);
  if ((v7 & 2) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if (v7)
  {
LABEL_19:
    v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v13 = @"tappingCount";
    }
    else {
      v13 = @"tapping_count";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSuggestionItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSuggestionItem)initWithDictionary:(id)a3
{
  return (GEOSuggestionItem *)-[GEOSuggestionItem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"suggestionString";
      }
      else {
        v6 = @"suggestion_string";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSuggestionString:v8];
      }
      if (a3) {
        v9 = @"initiallyVisible";
      }
      else {
        v9 = @"initially_visible";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setInitiallyVisible:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"eventuallyVisible";
      }
      else {
        v11 = @"eventually_visible";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setEventuallyVisible:", objc_msgSend(v12, "BOOLValue"));
      }

      if (a3) {
        v13 = @"tappingCount";
      }
      else {
        v13 = @"tapping_count";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappingCount:", objc_msgSend(v14, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOSuggestionItem)initWithJSON:(id)a3
{
  return (GEOSuggestionItem *)-[GEOSuggestionItem _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSuggestionItemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSuggestionItemReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_suggestionString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOSuggestionItem *)self readAll:0];
  if (self->_suggestionString) {
    objc_msgSend(v5, "setSuggestionString:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *((unsigned char *)v5 + 21) = self->_initiallyVisible;
    *((unsigned char *)v5 + 24) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v5 + 20) = self->_eventuallyVisible;
  *((unsigned char *)v5 + 24) |= 2u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_6:
    *((_DWORD *)v5 + 4) = self->_tappingCount;
    *((unsigned char *)v5 + 24) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_suggestionString copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 20) = self->_eventuallyVisible;
    *(unsigned char *)(v5 + 24) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 21) = self->_initiallyVisible;
  *(unsigned char *)(v5 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_tappingCount;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOSuggestionItem *)self readAll:1];
  [v4 readAll:1];
  suggestionString = self->_suggestionString;
  if ((unint64_t)suggestionString | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](suggestionString, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_24;
    }
    if (self->_initiallyVisible)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) != 0)
    {
      if (self->_eventuallyVisible)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v6 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_tappingCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
    BOOL v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOSuggestionItem *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_suggestionString hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_initiallyVisible;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_eventuallyVisible;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_tappingCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 1)) {
    -[GEOSuggestionItem setSuggestionString:](self, "setSuggestionString:");
  }
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 4) != 0)
  {
    self->_initiallyVisible = *((unsigned char *)v5 + 21);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_eventuallyVisible = *((unsigned char *)v5 + 20);
  *(unsigned char *)&self->_flags |= 2u;
  if (*((unsigned char *)v5 + 24))
  {
LABEL_6:
    self->_tappingCount = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end