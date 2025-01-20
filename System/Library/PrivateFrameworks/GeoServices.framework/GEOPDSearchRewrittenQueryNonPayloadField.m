@interface GEOPDSearchRewrittenQueryNonPayloadField
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchRewrittenQueryNonPayloadField

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchRewrittenQueryNonPayloadField;
  v4 = [(GEOPDSearchRewrittenQueryNonPayloadField *)&v8 description];
  v5 = [(GEOPDSearchRewrittenQueryNonPayloadField *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchRewrittenQueryNonPayloadField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_46;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 0x20) != 0)
  {
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 27)];
    if (a2) {
      v7 = @"hasNumericSplit";
    }
    else {
      v7 = @"has_numeric_split";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 32);
  }
  if ((v5 & 4) != 0)
  {
    v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
    if (a2) {
      v14 = @"hasCamelCase";
    }
    else {
      v14 = @"has_camel_case";
    }
    [v4 setObject:v13 forKey:v14];

    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0) {
        goto LABEL_10;
      }
LABEL_28:
      v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      if (a2) {
        v18 = @"hasSynonymCounterpart";
      }
      else {
        v18 = @"has_synonym_counterPart";
      }
      [v4 setObject:v17 forKey:v18];

      if ((*(unsigned char *)(a1 + 32) & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_11;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  if (a2) {
    v16 = @"hasDirectionsIntent";
  }
  else {
    v16 = @"has_directions_intent";
  }
  [v4 setObject:v15 forKey:v16];

  char v5 = *(unsigned char *)(a1 + 32);
  if ((v5 & 0x40) != 0) {
    goto LABEL_28;
  }
LABEL_10:
  if ((v5 & 0x10) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 26)];
    if (a2) {
      v9 = @"hasEmojiRewrite";
    }
    else {
      v9 = @"has_emoji_rewrite";
    }
    [v4 setObject:v8 forKey:v9];
  }
LABEL_15:
  if (*(void *)(a1 + 8)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  char v10 = *(unsigned char *)(a1 + 32);
  if (v10)
  {
    uint64_t v11 = *(int *)(a1 + 16);
    if (v11 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53E2950[v11];
    }
    if (a2) {
      v19 = @"pipelineType";
    }
    else {
      v19 = @"pipeline_type";
    }
    [v4 setObject:v12 forKey:v19];

    char v10 = *(unsigned char *)(a1 + 32);
  }
  if ((v10 & 2) != 0)
  {
    uint64_t v20 = *(int *)(a1 + 20);
    if (v20 >= 0x17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E53E2970[v20];
    }
    if (a2) {
      v22 = @"rewrittenQueryType";
    }
    else {
      v22 = @"rewritten_query_type";
    }
    [v4 setObject:v21 forKey:v22];
  }
LABEL_46:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchRewrittenQueryNonPayloadField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchRewrittenQueryNonPayloadFieldReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  if (self->_rewrittenQuery) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_flags;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_flags;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v5[27] = self->_hasNumericSplit;
    v5[32] |= 0x20u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[24] = self->_hasCamelCase;
  v5[32] |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v5[25] = self->_hasDirectionsIntent;
  v5[32] |= 8u;
  char flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  v5[28] = self->_hasSynonymCounterpart;
  v5[32] |= 0x40u;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    v5[26] = self->_hasEmojiRewrite;
    v5[32] |= 0x10u;
  }
LABEL_7:
  uint64_t v8 = [(NSString *)self->_rewrittenQuery copyWithZone:a3];
  v9 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v8;

  char v10 = (char)self->_flags;
  if (v10)
  {
    *((_DWORD *)v6 + 4) = self->_pipelineType;
    v6[32] |= 1u;
    char v10 = (char)self->_flags;
  }
  if ((v10 & 2) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_rewrittenQueryType;
    v6[32] |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
  if ((flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0) {
      goto LABEL_54;
    }
    if (self->_hasNumericSplit)
    {
      if (!*((unsigned char *)v4 + 27)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 27))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_54;
    }
    if (self->_hasCamelCase)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_54;
    }
    if (self->_hasDirectionsIntent)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x40) == 0) {
      goto LABEL_54;
    }
    if (self->_hasSynonymCounterpart)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x40) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0) {
      goto LABEL_54;
    }
    if (self->_hasEmojiRewrite)
    {
      if (!*((unsigned char *)v4 + 26)) {
        goto LABEL_54;
      }
    }
    else if (*((unsigned char *)v4 + 26))
    {
      goto LABEL_54;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_54;
  }
  rewrittenQuery = self->_rewrittenQuery;
  if (!((unint64_t)rewrittenQuery | *((void *)v4 + 1))) {
    goto LABEL_45;
  }
  if (!-[NSString isEqual:](rewrittenQuery, "isEqual:"))
  {
LABEL_54:
    BOOL v8 = 0;
    goto LABEL_55;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 32);
LABEL_45:
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_pipelineType != *((_DWORD *)v4 + 4)) {
      goto LABEL_54;
    }
  }
  else if (v6)
  {
    goto LABEL_54;
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_rewrittenQueryType != *((_DWORD *)v4 + 5)) {
      goto LABEL_54;
    }
    BOOL v8 = 1;
  }
LABEL_55:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    uint64_t v3 = 2654435761 * self->_hasNumericSplit;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_hasCamelCase;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_hasDirectionsIntent;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x40) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasSynonymCounterpart;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_hasEmojiRewrite;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
LABEL_12:
  NSUInteger v8 = [(NSString *)self->_rewrittenQuery hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v9 = 2654435761 * self->_pipelineType;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_14;
    }
LABEL_16:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  uint64_t v10 = 2654435761 * self->_rewrittenQueryType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v8;
}

- (void).cxx_destruct
{
}

@end