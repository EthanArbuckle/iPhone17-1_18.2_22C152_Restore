@interface BLTPBHandleDidPlayLightsAndSirensReplyRequest
- (BOOL)didPlayLightsAndSirens;
- (BOOL)hasDate;
- (BOOL)hasDidPlayLightsAndSirens;
- (BOOL)hasPhoneSectionID;
- (BOOL)hasPublisherMatchID;
- (BOOL)hasReplyToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)phoneSectionID;
- (NSString)publisherMatchID;
- (NSString)replyToken;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setDidPlayLightsAndSirens:(BOOL)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasDidPlayLightsAndSirens:(BOOL)a3;
- (void)setPhoneSectionID:(id)a3;
- (void)setPublisherMatchID:(id)a3;
- (void)setReplyToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBHandleDidPlayLightsAndSirensReplyRequest

- (void)setDidPlayLightsAndSirens:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didPlayLightsAndSirens = a3;
}

- (void)setHasDidPlayLightsAndSirens:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidPlayLightsAndSirens
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPublisherMatchID
{
  return self->_publisherMatchID != 0;
}

- (BOOL)hasPhoneSectionID
{
  return self->_phoneSectionID != 0;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasReplyToken
{
  return self->_replyToken != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBHandleDidPlayLightsAndSirensReplyRequest;
  v4 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)&v8 description];
  v5 = [(BLTPBHandleDidPlayLightsAndSirensReplyRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_didPlayLightsAndSirens];
    [v3 setObject:v4 forKey:@"didPlayLightsAndSirens"];
  }
  publisherMatchID = self->_publisherMatchID;
  if (publisherMatchID) {
    [v3 setObject:publisherMatchID forKey:@"publisherMatchID"];
  }
  phoneSectionID = self->_phoneSectionID;
  if (phoneSectionID) {
    [v3 setObject:phoneSectionID forKey:@"phoneSectionID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v7 forKey:@"date"];
  }
  replyToken = self->_replyToken;
  if (replyToken) {
    [v3 setObject:replyToken forKey:@"replyToken"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBHandleDidPlayLightsAndSirensReplyRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_publisherMatchID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneSectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_replyToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[40] = self->_didPlayLightsAndSirens;
    v4[44] |= 2u;
  }
  id v5 = v4;
  if (self->_publisherMatchID)
  {
    objc_msgSend(v4, "setPublisherMatchID:");
    id v4 = v5;
  }
  if (self->_phoneSectionID)
  {
    objc_msgSend(v5, "setPhoneSectionID:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_date;
    v4[44] |= 1u;
  }
  if (self->_replyToken)
  {
    objc_msgSend(v5, "setReplyToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_didPlayLightsAndSirens;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_publisherMatchID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_phoneSectionID copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_date;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_replyToken copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_didPlayLightsAndSirens)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_21;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_10;
      }
    }
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  publisherMatchID = self->_publisherMatchID;
  if ((unint64_t)publisherMatchID | *((void *)v4 + 3)
    && !-[NSString isEqual:](publisherMatchID, "isEqual:"))
  {
    goto LABEL_21;
  }
  phoneSectionID = self->_phoneSectionID;
  if ((unint64_t)phoneSectionID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](phoneSectionID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  replyToken = self->_replyToken;
  if ((unint64_t)replyToken | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](replyToken, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_didPlayLightsAndSirens;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_publisherMatchID hash];
  NSUInteger v5 = [(NSString *)self->_phoneSectionID hash];
  if (*(unsigned char *)&self->_has)
  {
    double date = self->_date;
    double v8 = -date;
    if (date >= 0.0) {
      double v8 = self->_date;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_replyToken hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_didPlayLightsAndSirens = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPublisherMatchID:](self, "setPublisherMatchID:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setPhoneSectionID:](self, "setPhoneSectionID:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_double date = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[BLTPBHandleDidPlayLightsAndSirensReplyRequest setReplyToken:](self, "setReplyToken:");
    id v4 = v5;
  }
}

- (BOOL)didPlayLightsAndSirens
{
  return self->_didPlayLightsAndSirens;
}

- (NSString)publisherMatchID
{
  return self->_publisherMatchID;
}

- (void)setPublisherMatchID:(id)a3
{
}

- (NSString)phoneSectionID
{
  return self->_phoneSectionID;
}

- (void)setPhoneSectionID:(id)a3
{
}

- (double)date
{
  return self->_date;
}

- (NSString)replyToken
{
  return self->_replyToken;
}

- (void)setReplyToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyToken, 0);
  objc_storeStrong((id *)&self->_publisherMatchID, 0);
  objc_storeStrong((id *)&self->_phoneSectionID, 0);
}

@end