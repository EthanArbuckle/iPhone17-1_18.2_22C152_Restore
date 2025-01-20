@interface ATXPBExecutableReferenceEntry
- (BOOL)hasClientModelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldClearOnEngagement;
- (BOOL)shouldPurge;
- (BOOL)suggestionIsHidden;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)clientModelId;
- (uint64_t)hasDate;
- (uint64_t)hasShouldClearOnEngagement;
- (uint64_t)hasShouldPurge;
- (uint64_t)hasSuggestionIsHidden;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result;
- (uint64_t)setHasShouldPurge:(uint64_t)result;
- (uint64_t)setHasSuggestionIsHidden:(uint64_t)result;
- (uint64_t)setShouldClearOnEngagement:(uint64_t)result;
- (uint64_t)setShouldPurge:(uint64_t)result;
- (uint64_t)setSuggestionIsHidden:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setClientModelId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBExecutableReferenceEntry

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return *(unsigned char *)(result + 28) & 1;
  }
  return result;
}

- (BOOL)hasClientModelId
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)setShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 2u;
    *(unsigned char *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasShouldClearOnEngagement
{
  if (result) {
    return (*(unsigned __int8 *)(result + 28) >> 1) & 1;
  }
  return result;
}

- (uint64_t)setShouldPurge:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 4u;
    *(unsigned char *)(result + 25) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldPurge:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasShouldPurge
{
  if (result) {
    return (*(unsigned __int8 *)(result + 28) >> 2) & 1;
  }
  return result;
}

- (uint64_t)setSuggestionIsHidden:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 28) |= 8u;
    *(unsigned char *)(result + 26) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionIsHidden:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 28) = *(unsigned char *)(result + 28) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionIsHidden
{
  if (result) {
    return (*(unsigned __int8 *)(result + 28) >> 3) & 1;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBExecutableReferenceEntry;
  v4 = [(ATXPBExecutableReferenceEntry *)&v8 description];
  v5 = [(ATXPBExecutableReferenceEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v4 forKey:@"date"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v3 setObject:clientModelId forKey:@"clientModelId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_shouldClearOnEngagement];
    [v3 setObject:v9 forKey:@"shouldClearOnEngagement"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v10 = [NSNumber numberWithBool:self->_shouldPurge];
  [v3 setObject:v10 forKey:@"shouldPurge"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    v7 = [NSNumber numberWithBool:self->_suggestionIsHidden];
    [v3 setObject:v7 forKey:@"suggestionIsHidden"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBExecutableReferenceEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_clientModelId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 28))
    {
      v3[1] = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 28) |= 1u;
    }
    v4 = *(void **)(a1 + 16);
    if (v4)
    {
      v6 = v3;
      -[ATXPBExecutableReferenceEntry setClientModelId:]((uint64_t)v3, v4);
      v3 = v6;
    }
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 2) != 0)
    {
      *((unsigned char *)v3 + 24) = *(unsigned char *)(a1 + 24);
      *((unsigned char *)v3 + 28) |= 2u;
      char v5 = *(unsigned char *)(a1 + 28);
      if ((v5 & 4) == 0)
      {
LABEL_8:
        if ((v5 & 8) == 0) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)(a1 + 28) & 4) == 0)
    {
      goto LABEL_8;
    }
    *((unsigned char *)v3 + 25) = *(unsigned char *)(a1 + 25);
    *((unsigned char *)v3 + 28) |= 4u;
    if ((*(unsigned char *)(a1 + 28) & 8) != 0)
    {
LABEL_9:
      *((unsigned char *)v3 + 26) = *(unsigned char *)(a1 + 26);
      *((unsigned char *)v3 + 28) |= 8u;
    }
  }
LABEL_10:
}

- (void)setClientModelId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_clientModelId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(unsigned char *)(v6 + 25) = self->_shouldPurge;
    *(unsigned char *)(v6 + 28) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(unsigned char *)(v6 + 24) = self->_shouldClearOnEngagement;
  *(unsigned char *)(v6 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v6 + 26) = self->_suggestionIsHidden;
    *(unsigned char *)(v6 + 28) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_28;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_28;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_28;
    }
    if (self->_shouldClearOnEngagement)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_shouldPurge)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_28;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) != 0)
    {
      if (self->_suggestionIsHidden)
      {
        if (!*((unsigned char *)v4 + 26)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 26))
      {
        goto LABEL_28;
      }
      BOOL v7 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v7 = 0;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v5 = -date;
    if (date >= 0.0) {
      double v5 = self->_date;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_clientModelId hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_shouldClearOnEngagement;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_shouldPurge;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_suggestionIsHidden;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (a1)
  {
    if (*((unsigned char *)v3 + 28))
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 28) |= 1u;
    }
    id v4 = (void *)v3[2];
    if (v4)
    {
      long double v6 = v3;
      objc_storeStrong((id *)(a1 + 16), v4);
      unint64_t v3 = v6;
    }
    char v5 = *((unsigned char *)v3 + 28);
    if ((v5 & 2) != 0)
    {
      *(unsigned char *)(a1 + 24) = *((unsigned char *)v3 + 24);
      *(unsigned char *)(a1 + 28) |= 2u;
      char v5 = *((unsigned char *)v3 + 28);
      if ((v5 & 4) == 0)
      {
LABEL_8:
        if ((v5 & 8) == 0) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else if ((*((unsigned char *)v3 + 28) & 4) == 0)
    {
      goto LABEL_8;
    }
    *(unsigned char *)(a1 + 25) = *((unsigned char *)v3 + 25);
    *(unsigned char *)(a1 + 28) |= 4u;
    if ((*((unsigned char *)v3 + 28) & 8) != 0)
    {
LABEL_9:
      *(unsigned char *)(a1 + 26) = *((unsigned char *)v3 + 26);
      *(unsigned char *)(a1 + 28) |= 8u;
    }
  }
LABEL_10:
}

- (double)date
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)clientModelId
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)shouldClearOnEngagement
{
  if (result) {
    return *(unsigned char *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)shouldPurge
{
  if (result) {
    return *(unsigned char *)(result + 25) != 0;
  }
  return result;
}

- (BOOL)suggestionIsHidden
{
  if (result) {
    return *(unsigned char *)(result + 26) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end