@interface EDPBInteractionEventMessageViewEnd
- (BOOL)hasAccountId;
- (BOOL)hasConversationId;
- (BOOL)hasDuration;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxType;
- (BOOL)hasMessageId;
- (BOOL)hasScrolledToEnd;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)scrolledToEnd;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mailboxTypeAsString:(int)a3;
- (int)StringAsMailboxType:(id)a3;
- (int)mailboxType;
- (int64_t)accountId;
- (int64_t)conversationId;
- (int64_t)mailboxId;
- (int64_t)messageId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setConversationId:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasConversationId:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasMailboxId:(BOOL)a3;
- (void)setHasMailboxType:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasScrolledToEnd:(BOOL)a3;
- (void)setMailboxId:(int64_t)a3;
- (void)setMailboxType:(int)a3;
- (void)setMessageId:(int64_t)a3;
- (void)setScrolledToEnd:(BOOL)a3;
- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventMessageViewEnd

- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  _EDPBBaseMessageFieldsFill(v16, self, v8);
  v10 = [v9 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = [v9 objectForKeyedSubscript:@"duration"];
    [v12 doubleValue];
    -[EDPBInteractionEventMessageViewEnd setDuration:](self, "setDuration:");
  }
  v13 = [v9 objectForKeyedSubscript:@"scrolled_to_end"];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    v15 = [v9 objectForKeyedSubscript:@"scrolled_to_end"];
    -[EDPBInteractionEventMessageViewEnd setScrolledToEnd:](self, "setScrolledToEnd:", [v15 BOOLValue]);
  }
}

- (void)setAccountId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccountId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMailboxId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMailboxId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)mailboxType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_mailboxType;
  }
  else {
    return 0;
  }
}

- (void)setMailboxType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_mailboxType = a3;
}

- (void)setHasMailboxType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMailboxType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)mailboxTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C041D8[a3];
  }

  return v3;
}

- (int)StringAsMailboxType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNDEFINED_MAILBOX_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INBOX"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARCHIVE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SENT"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRASH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"JUNK"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"DRAFTS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OUTBOX"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setConversationId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_conversationId = a3;
}

- (void)setHasConversationId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConversationId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMessageId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMessageId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setScrolledToEnd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_scrolledToEnd = a3;
}

- (void)setHasScrolledToEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasScrolledToEnd
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMessageViewEnd;
  int v4 = [(EDPBInteractionEventMessageViewEnd *)&v8 description];
  v5 = [(EDPBInteractionEventMessageViewEnd *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_accountId];
    [v3 setObject:v5 forKey:@"account_id"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_mailboxId];
    [v3 setObject:v6 forKey:@"mailbox_id"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t mailboxType = self->_mailboxType;
    if (mailboxType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mailboxType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6C041D8[mailboxType];
    }
    [v3 setObject:v8 forKey:@"mailbox_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    id v9 = [NSNumber numberWithLongLong:self->_conversationId];
    [v3 setObject:v9 forKey:@"conversation_id"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_messageId];
    [v3 setObject:v10 forKey:@"message_id"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v11 forKey:@"duration"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_scrolledToEnd];
    [v3 setObject:v12 forKey:@"scrolled_to_end"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageViewEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_accountId;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_mailboxId;
  *((unsigned char *)v4 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 12) = self->_mailboxType;
  *((unsigned char *)v4 + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[2] = self->_conversationId;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[5] = self->_messageId;
  *((unsigned char *)v4 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[3] = *(void *)&self->_duration;
  *((unsigned char *)v4 + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 52) = self->_scrolledToEnd;
    *((unsigned char *)v4 + 56) |= 0x40u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_accountId;
    *((unsigned char *)result + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_mailboxId;
  *((unsigned char *)result + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 12) = self->_mailboxType;
  *((unsigned char *)result + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 2) = self->_conversationId;
  *((unsigned char *)result + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_messageId;
  *((unsigned char *)result + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 3) = *(void *)&self->_duration;
  *((unsigned char *)result + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_8:
  *((unsigned char *)result + 52) = self->_scrolledToEnd;
  *((unsigned char *)result + 56) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_mailboxId != *((void *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_mailboxType != *((_DWORD *)v4 + 12)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_conversationId != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_messageId != *((void *)v4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_duration != *((double *)v4 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_34;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0)
    {
LABEL_34:
      BOOL v5 = 0;
      goto LABEL_35;
    }
    if (self->_scrolledToEnd)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_34;
    }
    BOOL v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_accountId;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_mailboxId;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_mailboxType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_conversationId;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_messageId;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double duration = self->_duration;
  double v10 = -duration;
  if (duration >= 0.0) {
    double v10 = self->_duration;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_19:
  if ((has & 0x40) != 0) {
    uint64_t v14 = 2654435761 * self->_scrolledToEnd;
  }
  else {
    uint64_t v14 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_accountId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t mailboxType = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_conversationId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_messageId = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_double duration = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
LABEL_8:
    self->_scrolledToEnd = *((unsigned char *)v4 + 52);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_9:
}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)mailboxId
{
  return self->_mailboxId;
}

- (int64_t)conversationId
{
  return self->_conversationId;
}

- (int64_t)messageId
{
  return self->_messageId;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

@end