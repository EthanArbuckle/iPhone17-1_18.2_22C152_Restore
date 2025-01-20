@interface MUUserInteractionARPSuggestion
- (BOOL)didSelectDislike;
- (BOOL)didTapSuggestion;
- (BOOL)disSelectLike;
- (BOOL)hasDidSelectDislike;
- (BOOL)hasDidTapSuggestion;
- (BOOL)hasDisSelectLike;
- (BOOL)hasIsPhotoSuggestion;
- (BOOL)hasIsRatingSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhotoSuggestion;
- (BOOL)isRatingSuggestion;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDidSelectDislike:(BOOL)a3;
- (void)setDidTapSuggestion:(BOOL)a3;
- (void)setDisSelectLike:(BOOL)a3;
- (void)setHasDidSelectDislike:(BOOL)a3;
- (void)setHasDidTapSuggestion:(BOOL)a3;
- (void)setHasDisSelectLike:(BOOL)a3;
- (void)setHasIsPhotoSuggestion:(BOOL)a3;
- (void)setHasIsRatingSuggestion:(BOOL)a3;
- (void)setIsPhotoSuggestion:(BOOL)a3;
- (void)setIsRatingSuggestion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUUserInteractionARPSuggestion

- (void)setIsRatingSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isRatingSuggestion = a3;
}

- (void)setHasIsRatingSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRatingSuggestion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsPhotoSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isPhotoSuggestion = a3;
}

- (void)setHasIsPhotoSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPhotoSuggestion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDidTapSuggestion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didTapSuggestion = a3;
}

- (void)setHasDidTapSuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidTapSuggestion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDidSelectDislike:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_didSelectDislike = a3;
}

- (void)setHasDidSelectDislike:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDidSelectDislike
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDisSelectLike:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_disSelectLike = a3;
}

- (void)setHasDisSelectLike:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDisSelectLike
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUUserInteractionARPSuggestion;
  v4 = [(MUUserInteractionARPSuggestion *)&v8 description];
  v5 = [(MUUserInteractionARPSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isRatingSuggestion];
    [v3 setObject:v7 forKey:@"isRatingSuggestion"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_isPhotoSuggestion];
  [v3 setObject:v8 forKey:@"isPhotoSuggestion"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithBool:self->_didTapSuggestion];
  [v3 setObject:v9 forKey:@"didTapSuggestion"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithBool:self->_didSelectDislike];
  [v3 setObject:v10 forKey:@"didSelectDislike"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithBool:self->_disSelectLike];
    [v3 setObject:v5 forKey:@"disSelectLike"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionARPSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[12] = self->_isRatingSuggestion;
    v4[16] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = self->_isPhotoSuggestion;
  v4[16] |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[9] = self->_didTapSuggestion;
  v4[16] |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[8] = self->_didSelectDislike;
  v4[16] |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v4[10] = self->_disSelectLike;
    v4[16] |= 4u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)result + 12) = self->_isRatingSuggestion;
    *((unsigned char *)result + 16) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 11) = self->_isPhotoSuggestion;
  *((unsigned char *)result + 16) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 9) = self->_didTapSuggestion;
  *((unsigned char *)result + 16) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((unsigned char *)result + 8) = self->_didSelectDislike;
  *((unsigned char *)result + 16) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_6:
  *((unsigned char *)result + 10) = self->_disSelectLike;
  *((unsigned char *)result + 16) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) == 0) {
      goto LABEL_36;
    }
    if (self->_isRatingSuggestion)
    {
      if (!v4[12]) {
        goto LABEL_36;
      }
    }
    else if (v4[12])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_isPhotoSuggestion)
    {
      if (!v4[11]) {
        goto LABEL_36;
      }
    }
    else if (v4[11])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0) {
      goto LABEL_36;
    }
    if (self->_didTapSuggestion)
    {
      if (!v4[9]) {
        goto LABEL_36;
      }
    }
    else if (v4[9])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[16] & 1) == 0) {
      goto LABEL_36;
    }
    if (self->_didSelectDislike)
    {
      if (!v4[8]) {
        goto LABEL_36;
      }
    }
    else if (v4[8])
    {
      goto LABEL_36;
    }
  }
  else if (v4[16])
  {
    goto LABEL_36;
  }
  BOOL v5 = (v4[16] & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) != 0)
    {
      if (self->_disSelectLike)
      {
        if (!v4[10]) {
          goto LABEL_36;
        }
      }
      else if (v4[10])
      {
        goto LABEL_36;
      }
      BOOL v5 = 1;
      goto LABEL_37;
    }
LABEL_36:
    BOOL v5 = 0;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_isRatingSuggestion;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isPhotoSuggestion;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_didTapSuggestion;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_didSelectDislike;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_disSelectLike;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[16];
  if ((v5 & 0x10) != 0)
  {
    self->_isRatingSuggestion = v4[12];
    *(unsigned char *)&self->_has |= 0x10u;
    BOOL v5 = v4[16];
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[16] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isPhotoSuggestion = v4[11];
  *(unsigned char *)&self->_has |= 8u;
  BOOL v5 = v4[16];
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_didTapSuggestion = v4[9];
  *(unsigned char *)&self->_has |= 2u;
  BOOL v5 = v4[16];
  if (!v5)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_didSelectDislike = v4[8];
  *(unsigned char *)&self->_has |= 1u;
  if ((v4[16] & 4) != 0)
  {
LABEL_6:
    self->_disSelectLike = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
}

- (BOOL)isRatingSuggestion
{
  return self->_isRatingSuggestion;
}

- (BOOL)isPhotoSuggestion
{
  return self->_isPhotoSuggestion;
}

- (BOOL)didTapSuggestion
{
  return self->_didTapSuggestion;
}

- (BOOL)didSelectDislike
{
  return self->_didSelectDislike;
}

- (BOOL)disSelectLike
{
  return self->_disSelectLike;
}

@end