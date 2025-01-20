@interface BMPBSocialHighlightFeedbackEvent
- (BMPBRankableSocialHighlight)highlight;
- (BOOL)hasClientIdentifier;
- (BOOL)hasClientVariant;
- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate;
- (BOOL)hasFeedbackType;
- (BOOL)hasHighlight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (double)feedbackCreationSecondsSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackTypeAsString:(int)a3;
- (int)StringAsFeedbackType:(id)a3;
- (int)feedbackType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVariant:(id)a3;
- (void)setFeedbackCreationSecondsSinceReferenceDate:(double)a3;
- (void)setFeedbackType:(int)a3;
- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setHighlight:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSocialHighlightFeedbackEvent

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (int)feedbackType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_feedbackType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedbackType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7C10[a3];
  }

  return v3;
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Displayed"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UserInteracted"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Hide"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AppButton"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ActivityButton"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ConsumptionStarted"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ConsumptionFinished"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ItemDetailViewed"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ParentDetailViewed"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AppReply"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ConsumedExternally"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setFeedbackCreationSecondsSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedbackCreationSecondsSinceReferenceDate = a3;
}

- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasHighlight
{
  return self->_highlight != 0;
}

- (BOOL)hasClientVariant
{
  return self->_clientVariant != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSocialHighlightFeedbackEvent;
  int v4 = [(BMPBSocialHighlightFeedbackEvent *)&v8 description];
  v5 = [(BMPBSocialHighlightFeedbackEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t feedbackType = self->_feedbackType;
    if (feedbackType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D7C10[feedbackType];
    }
    [v4 setObject:v8 forKey:@"feedbackType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_feedbackCreationSecondsSinceReferenceDate];
    [v4 setObject:v9 forKey:@"feedbackCreationSecondsSinceReferenceDate"];
  }
  highlight = self->_highlight;
  if (highlight)
  {
    v11 = [(BMPBRankableSocialHighlight *)highlight dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"highlight"];
  }
  clientVariant = self->_clientVariant;
  if (clientVariant) {
    [v4 setObject:clientVariant forKey:@"clientVariant"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSocialHighlightFeedbackEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_highlight)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_clientVariant)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_clientIdentifier)
  {
    objc_msgSend(v4, "setClientIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_feedbackType;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_feedbackCreationSecondsSinceReferenceDate;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_highlight)
  {
    objc_msgSend(v6, "setHighlight:");
    id v4 = v6;
  }
  if (self->_clientVariant)
  {
    objc_msgSend(v6, "setClientVariant:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_feedbackType;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_feedbackCreationSecondsSinceReferenceDate;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  id v9 = [(BMPBRankableSocialHighlight *)self->_highlight copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_clientVariant copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_feedbackType != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_feedbackCreationSecondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_18;
  }
  highlight = self->_highlight;
  if ((unint64_t)highlight | *((void *)v4 + 5)
    && !-[BMPBRankableSocialHighlight isEqual:](highlight, "isEqual:"))
  {
    goto LABEL_18;
  }
  clientVariant = self->_clientVariant;
  if ((unint64_t)clientVariant | *((void *)v4 + 3)) {
    char v8 = -[NSString isEqual:](clientVariant, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_feedbackType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double feedbackCreationSecondsSinceReferenceDate = self->_feedbackCreationSecondsSinceReferenceDate;
  double v6 = -feedbackCreationSecondsSinceReferenceDate;
  if (feedbackCreationSecondsSinceReferenceDate >= 0.0) {
    double v6 = self->_feedbackCreationSecondsSinceReferenceDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  unint64_t v10 = v4 ^ v3 ^ v9 ^ [(BMPBRankableSocialHighlight *)self->_highlight hash];
  return v10 ^ [(NSString *)self->_clientVariant hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[BMPBSocialHighlightFeedbackEvent setClientIdentifier:](self, "setClientIdentifier:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t feedbackType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if (v5)
  {
    self->_double feedbackCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  highlight = self->_highlight;
  uint64_t v7 = *((void *)v4 + 5);
  if (highlight)
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[BMPBRankableSocialHighlight mergeFrom:](highlight, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_13;
    }
    -[BMPBSocialHighlightFeedbackEvent setHighlight:](self, "setHighlight:");
  }
  id v4 = v8;
LABEL_13:
  if (*((void *)v4 + 3)) {
    -[BMPBSocialHighlightFeedbackEvent setClientVariant:](self, "setClientVariant:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (double)feedbackCreationSecondsSinceReferenceDate
{
  return self->_feedbackCreationSecondsSinceReferenceDate;
}

- (BMPBRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void)setClientVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_clientVariant, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end