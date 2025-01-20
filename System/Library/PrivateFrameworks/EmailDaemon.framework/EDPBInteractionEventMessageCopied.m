@interface EDPBInteractionEventMessageCopied
- (BOOL)hasAccountId;
- (BOOL)hasConversationId;
- (BOOL)hasFromMailboxId;
- (BOOL)hasFromMailboxType;
- (BOOL)hasMessageId;
- (BOOL)hasToMailboxId;
- (BOOL)hasToMailboxType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fromMailboxTypeAsString:(int)a3;
- (id)toMailboxTypeAsString:(int)a3;
- (int)StringAsFromMailboxType:(id)a3;
- (int)StringAsToMailboxType:(id)a3;
- (int)fromMailboxType;
- (int)toMailboxType;
- (int64_t)accountId;
- (int64_t)conversationId;
- (int64_t)fromMailboxId;
- (int64_t)messageId;
- (int64_t)toMailboxId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setConversationId:(int64_t)a3;
- (void)setFromMailboxId:(int64_t)a3;
- (void)setFromMailboxType:(int)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasConversationId:(BOOL)a3;
- (void)setHasFromMailboxId:(BOOL)a3;
- (void)setHasFromMailboxType:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasToMailboxId:(BOOL)a3;
- (void)setHasToMailboxType:(BOOL)a3;
- (void)setMessageId:(int64_t)a3;
- (void)setToMailboxId:(int64_t)a3;
- (void)setToMailboxType:(int)a3;
- (void)withHasher:(id)a3 setMessage:(id)a4 mailbox:(id)a5;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventMessageCopied

- (void)withHasher:(id)a3 setMessage:(id)a4 mailbox:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 account];
  -[EDPBInteractionEventMessageCopied setAccountId:](self, "setAccountId:", [v19 hashedAccountID:v10]);

  -[EDPBInteractionEventMessageCopied setConversationId:](self, "setConversationId:", objc_msgSend(v19, "hashedConversationID:", objc_msgSend(v8, "conversationID")));
  v11 = [v8 messageIDHeader];
  v12 = objc_msgSend(v11, "ec_messageIDSubstring");
  -[EDPBInteractionEventMessageCopied setMessageId:](self, "setMessageId:", [v19 hashedString:v12]);

  v13 = [v8 mailbox];
  -[EDPBInteractionEventMessageCopied setFromMailboxId:](self, "setFromMailboxId:", [v19 hashedMailboxID:v13]);

  v14 = [v8 mailbox];
  unint64_t v15 = [v14 type] - 1;
  if (v15 > 6) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = dword_1DB640540[v15];
  }
  [(EDPBInteractionEventMessageCopied *)self setFromMailboxType:v16];

  -[EDPBInteractionEventMessageCopied setToMailboxId:](self, "setToMailboxId:", [v19 hashedMailboxID:v9]);
  unint64_t v17 = [v9 type] - 1;
  if (v17 > 6) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = dword_1DB640540[v17];
  }
  [(EDPBInteractionEventMessageCopied *)self setToMailboxType:v18];
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
  *(unsigned char *)&self->_has |= 8u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMessageId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFromMailboxId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fromMailboxId = a3;
}

- (void)setHasFromMailboxId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFromMailboxId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)fromMailboxType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_fromMailboxType;
  }
  else {
    return 0;
  }
}

- (void)setFromMailboxType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_fromMailboxType = a3;
}

- (void)setHasFromMailboxType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFromMailboxType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)fromMailboxTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C04100[a3];
  }

  return v3;
}

- (int)StringAsFromMailboxType:(id)a3
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

- (void)setToMailboxId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_toMailboxId = a3;
}

- (void)setHasToMailboxId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasToMailboxId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)toMailboxType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_toMailboxType;
  }
  else {
    return 0;
  }
}

- (void)setToMailboxType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_toMailboxType = a3;
}

- (void)setHasToMailboxType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasToMailboxType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)toMailboxTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C04100[a3];
  }

  return v3;
}

- (int)StringAsToMailboxType:(id)a3
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMessageCopied;
  int v4 = [(EDPBInteractionEventMessageCopied *)&v8 description];
  v5 = [(EDPBInteractionEventMessageCopied *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_accountId];
    [v3 setObject:v5 forKey:@"account_id"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_conversationId];
    [v3 setObject:v6 forKey:@"conversation_id"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_messageId];
    [v3 setObject:v7 forKey:@"message_id"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_fromMailboxId];
    [v3 setObject:v8 forKey:@"from_mailbox_id"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t fromMailboxType = self->_fromMailboxType;
    if (fromMailboxType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fromMailboxType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E6C04100[fromMailboxType];
    }
    [v3 setObject:v10 forKey:@"from_mailbox_type"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_toMailboxId];
    [v3 setObject:v11 forKey:@"to_mailbox_id"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    uint64_t toMailboxType = self->_toMailboxType;
    if (toMailboxType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_toMailboxType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E6C04100[toMailboxType];
    }
    [v3 setObject:v13 forKey:@"to_mailbox_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMessageCopiedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_conversationId;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[4] = self->_messageId;
  *((unsigned char *)v4 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[3] = self->_fromMailboxId;
  *((unsigned char *)v4 + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 12) = self->_fromMailboxType;
  *((unsigned char *)v4 + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[5] = self->_toMailboxId;
  *((unsigned char *)v4 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 13) = self->_toMailboxType;
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_conversationId;
  *((unsigned char *)result + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 4) = self->_messageId;
  *((unsigned char *)result + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_fromMailboxId;
  *((unsigned char *)result + 56) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_fromMailboxType;
  *((unsigned char *)result + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 5) = self->_toMailboxId;
  *((unsigned char *)result + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 13) = self->_toMailboxType;
  *((unsigned char *)result + 56) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_conversationId != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_messageId != *((void *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_fromMailboxId != *((void *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x20) == 0 || self->_fromMailboxType != *((_DWORD *)v4 + 12)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x10) == 0 || self->_toMailboxId != *((void *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 56) & 0x40) == 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 0x40) == 0 || self->_toMailboxType != *((_DWORD *)v4 + 13)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_accountId;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_conversationId;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_messageId;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_fromMailboxId;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_fromMailboxType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_toMailboxId;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_toMailboxType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
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
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_conversationId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_messageId = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_fromMailboxId = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_uint64_t fromMailboxType = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_toMailboxId = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 56) & 0x40) != 0)
  {
LABEL_8:
    self->_uint64_t toMailboxType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_9:
}

- (int64_t)accountId
{
  return self->_accountId;
}

- (int64_t)conversationId
{
  return self->_conversationId;
}

- (int64_t)messageId
{
  return self->_messageId;
}

- (int64_t)fromMailboxId
{
  return self->_fromMailboxId;
}

- (int64_t)toMailboxId
{
  return self->_toMailboxId;
}

@end