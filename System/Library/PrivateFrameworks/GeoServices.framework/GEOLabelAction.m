@interface GEOLabelAction
+ (BOOL)isValid:(id)a3;
- (BOOL)hasArtworkAction;
- (BOOL)hasDetailTextAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLabelAction)initWithDictionary:(id)a3;
- (GEOLabelAction)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)artworkActionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detailTextActionAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsArtworkAction:(id)a3;
- (int)StringAsDetailTextAction:(id)a3;
- (int)artworkAction;
- (int)detailTextAction;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkAction:(int)a3;
- (void)setDetailTextAction:(int)a3;
- (void)setHasArtworkAction:(BOOL)a3;
- (void)setHasDetailTextAction:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLabelAction

- (int)detailTextAction
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_detailTextAction;
  }
  else {
    return 0;
  }
}

- (void)setDetailTextAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_detailTextAction = a3;
}

- (void)setHasDetailTextAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDetailTextAction
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)detailTextActionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E02D8[a3];
  }

  return v3;
}

- (int)StringAsDetailTextAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALWAYS_SHOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SHOW_WHEN_SELECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIDE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)artworkAction
{
  if (*(unsigned char *)&self->_flags) {
    return self->_artworkAction;
  }
  else {
    return 0;
  }
}

- (void)setArtworkAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_artworkAction = a3;
}

- (void)setHasArtworkAction:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArtworkAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)artworkActionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E02D8[a3];
  }

  return v3;
}

- (int)StringAsArtworkAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ALWAYS_SHOW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SHOW_WHEN_SELECTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HIDE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLabelAction;
  int v4 = [(GEOLabelAction *)&v8 description];
  v5 = [(GEOLabelAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLabelAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 20);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E02D8[v6];
      }
      if (a2) {
        objc_super v8 = @"detailTextAction";
      }
      else {
        objc_super v8 = @"detail_text_action";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      uint64_t v9 = *(int *)(a1 + 16);
      if (v9 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53E02D8[v9];
      }
      if (a2) {
        v11 = @"artworkAction";
      }
      else {
        v11 = @"artwork_action";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __44__GEOLabelAction__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLabelAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOLabelAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOLabelAction)initWithDictionary:(id)a3
{
  return (GEOLabelAction *)-[GEOLabelAction _initWithDictionary:isJSON:](self, a3, 0);
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
        uint64_t v6 = @"detailTextAction";
      }
      else {
        uint64_t v6 = @"detail_text_action";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        if ([v8 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v9 = 0;
        }
        else if ([v8 isEqualToString:@"ALWAYS_SHOW"])
        {
          uint64_t v9 = 1;
        }
        else if ([v8 isEqualToString:@"SHOW_WHEN_SELECTED"])
        {
          uint64_t v9 = 2;
        }
        else if ([v8 isEqualToString:@"HIDE"])
        {
          uint64_t v9 = 3;
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setDetailTextAction:v9];
LABEL_20:

      if (a3) {
        id v10 = @"artworkAction";
      }
      else {
        id v10 = @"artwork_action";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"UNKNOWN"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"ALWAYS_SHOW"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"SHOW_WHEN_SELECTED"])
        {
          uint64_t v13 = 2;
        }
        else if ([v12 isEqualToString:@"HIDE"])
        {
          uint64_t v13 = 3;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_37:

          goto LABEL_38;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setArtworkAction:v13];
      goto LABEL_37;
    }
  }
LABEL_38:

  return a1;
}

- (GEOLabelAction)initWithJSON:(id)a3
{
  return (GEOLabelAction *)-[GEOLabelAction _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLabelActionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLabelActionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLabelAction *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[5] = self->_detailTextAction;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[4] = self->_artworkAction;
    *((unsigned char *)v5 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 20) = self->_detailTextAction;
    *(unsigned char *)(v4 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_artworkAction;
    *(unsigned char *)(v4 + 24) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOLabelAction *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_detailTextAction != *((_DWORD *)v4 + 5)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_artworkAction != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLabelAction *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_detailTextAction;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_artworkAction;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (int *)a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_detailTextAction = v5[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
  }
  if (v4)
  {
    self->_artworkAction = v5[4];
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
    [(GEOLabelAction *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end