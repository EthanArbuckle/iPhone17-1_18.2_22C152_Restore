@interface GEOPDSearchClientBehavior
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_BYTE)_initWithDictionary:(int)a3 isJSON:;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(unsigned char *)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchClientBehavior

- (void)mergeFrom:(unsigned char *)a1
{
  v3 = a2;
  char v4 = v3[20];
  if ((v4 & 2) != 0)
  {
    a1[17] = v3[17];
    a1[20] |= 2u;
    char v4 = v3[20];
  }
  if (v4)
  {
    a1[16] = v3[16];
    a1[20] |= 1u;
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchClientBehavior;
  char v4 = [(GEOPDSearchClientBehavior *)&v8 description];
  v5 = [(GEOPDSearchClientBehavior *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchClientBehavior _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    char v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
      if (a2) {
        v7 = @"shouldEnableRedoSearch";
      }
      else {
        v7 = @"should_enable_redo_search";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 20);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v9 = @"shouldAllowManualRedoButton";
      }
      else {
        v9 = @"should_allow_manual_redo_button";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __55__GEOPDSearchClientBehavior__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchClientBehavior _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDSearchClientBehavior__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (_BYTE)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  v6 = (unsigned char *)[a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"shouldEnableRedoSearch";
    }
    else {
      v7 = @"should_enable_redo_search";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v9 = [v8 BOOLValue];
      v6[20] |= 2u;
      v6[17] = v9;
    }

    if (a3) {
      id v10 = @"shouldAllowManualRedoButton";
    }
    else {
      id v10 = @"should_allow_manual_redo_button";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v12 = [v11 BOOLValue];
      v6[20] |= 1u;
      v6[16] = v12;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchClientBehaviorReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v4 + 17) = self->_shouldEnableRedoSearch;
    *(unsigned char *)(v4 + 20) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v4 + 16) = self->_shouldAllowManualRedoButton;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_shouldEnableRedoSearch)
    {
      if (!v4[17]) {
        goto LABEL_12;
      }
    }
    else if (v4[17])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[20] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[20])
    {
      if (self->_shouldAllowManualRedoButton)
      {
        if (!v4[16]) {
          goto LABEL_12;
        }
      }
      else if (v4[16])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_shouldEnableRedoSearch;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_shouldAllowManualRedoButton;
  return v3 ^ v2;
}

- (void).cxx_destruct
{
}

@end