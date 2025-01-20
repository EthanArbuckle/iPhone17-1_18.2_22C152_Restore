@interface EDPBInteractionEventCategoryMarked
- (BOOL)hasAccountId;
- (BOOL)hasCategoryType;
- (BOOL)hasConversationId;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxType;
- (BOOL)hasMessageId;
- (BOOL)hasPositive;
- (BOOL)hasRemoveAllUserOverrides;
- (BOOL)isEqual:(id)a3;
- (BOOL)positive;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeAllUserOverrides;
- (id)categoryTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mailboxTypeAsString:(int)a3;
- (int)StringAsCategoryType:(id)a3;
- (int)StringAsMailboxType:(id)a3;
- (int)categoryType;
- (int)mailboxType;
- (int64_t)accountId;
- (int64_t)conversationId;
- (int64_t)mailboxId;
- (int64_t)messageId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setCategoryType:(int)a3;
- (void)setConversationId:(int64_t)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasCategoryType:(BOOL)a3;
- (void)setHasConversationId:(BOOL)a3;
- (void)setHasMailboxId:(BOOL)a3;
- (void)setHasMailboxType:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasPositive:(BOOL)a3;
- (void)setHasRemoveAllUserOverrides:(BOOL)a3;
- (void)setMailboxId:(int64_t)a3;
- (void)setMailboxType:(int)a3;
- (void)setMessageId:(int64_t)a3;
- (void)setPositive:(BOOL)a3;
- (void)setRemoveAllUserOverrides:(BOOL)a3;
- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventCategoryMarked

- (void)withHasher:(id)a3 setMessage:(id)a4 data:(id)a5
{
  id v16 = a5;
  _EDPBBaseMessageFieldsFill(a3, self, a4);
  v8 = [v16 objectForKeyedSubscript:@"value"];
  v9 = v8;
  if (v8)
  {
    if ([v8 isEqualToString:@"revert"])
    {
      [(EDPBInteractionEventCategoryMarked *)self setRemoveAllUserOverrides:1];
    }
    else
    {
      id v10 = v9;
      int v11 = [v10 hasPrefix:@"not_"];
      if (v11) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 0;
      }
      v13 = [v10 substringFromIndex:v12];
      uint64_t v14 = EMCategoryTypeFromString();

      if (v14) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = 0;
      }

      [(EDPBInteractionEventCategoryMarked *)self setCategoryType:v15];
      [(EDPBInteractionEventCategoryMarked *)self setPositive:v11 ^ 1u];
    }
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
  *(unsigned char *)&self->_has |= 4u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMailboxId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
    char v3 = off_1E6C03F70[a3];
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

- (int)categoryType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_categoryType;
  }
  else {
    return 0;
  }
}

- (void)setCategoryType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_categoryType = a3;
}

- (void)setHasCategoryType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCategoryType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)categoryTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6C03FB8[a3];
  }

  return v3;
}

- (int)StringAsCategoryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNDEFINED_CATEGORY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IMPORTANT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SOCIAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COMMERCE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LIST"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPositive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_positive = a3;
}

- (void)setHasPositive:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPositive
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRemoveAllUserOverrides:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_removeAllUserOverrides = a3;
}

- (void)setHasRemoveAllUserOverrides:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasRemoveAllUserOverrides
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventCategoryMarked;
  int v4 = [(EDPBInteractionEventCategoryMarked *)&v8 description];
  v5 = [(EDPBInteractionEventCategoryMarked *)self dictionaryRepresentation];
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
  if ((has & 4) != 0)
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
      objc_super v8 = off_1E6C03F70[mailboxType];
    }
    [v3 setObject:v8 forKey:@"mailbox_type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_conversationId];
    [v3 setObject:v9 forKey:@"conversation_id"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    id v10 = [NSNumber numberWithLongLong:self->_messageId];
    [v3 setObject:v10 forKey:@"message_id"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t categoryType = self->_categoryType;
    if (categoryType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_categoryType);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = off_1E6C03FB8[categoryType];
    }
    [v3 setObject:v12 forKey:@"category_type"];

    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_positive];
    [v3 setObject:v13 forKey:@"positive"];

    char has = (char)self->_has;
  }
  if (has < 0)
  {
    uint64_t v14 = [NSNumber numberWithBool:self->_removeAllUserOverrides];
    [v3 setObject:v14 forKey:@"remove_all_user_overrides"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventCategoryMarkedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has < 0) {
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
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_mailboxId;
  *((unsigned char *)v4 + 52) |= 4u;
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
  *((_DWORD *)v4 + 11) = self->_mailboxType;
  *((unsigned char *)v4 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[2] = self->_conversationId;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[4] = self->_messageId;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    *((unsigned char *)v4 + 48) = self->_positive;
    *((unsigned char *)v4 + 52) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  *((_DWORD *)v4 + 10) = self->_categoryType;
  *((unsigned char *)v4 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  *((unsigned char *)v4 + 49) = self->_removeAllUserOverrides;
  *((unsigned char *)v4 + 52) |= 0x80u;
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_accountId;
    *((unsigned char *)result + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = self->_mailboxId;
  *((unsigned char *)result + 52) |= 4u;
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
  *((_DWORD *)result + 11) = self->_mailboxType;
  *((unsigned char *)result + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 2) = self->_conversationId;
  *((unsigned char *)result + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 4) = self->_messageId;
  *((unsigned char *)result + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_categoryType;
  *((unsigned char *)result + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      return result;
    }
LABEL_17:
    *((unsigned char *)result + 49) = self->_removeAllUserOverrides;
    *((unsigned char *)result + 52) |= 0x80u;
    return result;
  }
LABEL_16:
  *((unsigned char *)result + 48) = self->_positive;
  *((unsigned char *)result + 52) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    goto LABEL_17;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[52] & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (v4[52])
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[52] & 4) == 0 || self->_mailboxId != *((void *)v4 + 3)) {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[52] & 0x20) == 0 || self->_mailboxType != *((_DWORD *)v4 + 11)) {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[52] & 2) == 0 || self->_conversationId != *((void *)v4 + 2)) {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[52] & 8) == 0 || self->_messageId != *((void *)v4 + 4)) {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[52] & 0x10) == 0 || self->_categoryType != *((_DWORD *)v4 + 10)) {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[52] & 0x40) == 0) {
      goto LABEL_42;
    }
    if (self->_positive)
    {
      if (!v4[48]) {
        goto LABEL_42;
      }
    }
    else if (v4[48])
    {
      goto LABEL_42;
    }
  }
  else if ((v4[52] & 0x40) != 0)
  {
    goto LABEL_42;
  }
  BOOL v5 = v4[52] >= 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if (v4[52] < 0)
    {
      if (self->_removeAllUserOverrides)
      {
        if (!v4[49]) {
          goto LABEL_42;
        }
      }
      else if (v4[49])
      {
        goto LABEL_42;
      }
      BOOL v5 = 1;
      goto LABEL_43;
    }
LABEL_42:
    BOOL v5 = 0;
  }
LABEL_43:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_accountId;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_mailboxId;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_mailboxType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_conversationId;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_messageId;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_categoryType;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_positive;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_removeAllUserOverrides;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_accountId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t mailboxType = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_conversationId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_messageId = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    self->_positive = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 0x40u;
    if ((*((unsigned char *)v4 + 52) & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  self->_uint64_t categoryType = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v5 & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  self->_removeAllUserOverrides = *((unsigned char *)v4 + 49);
  *(unsigned char *)&self->_has |= 0x80u;
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

- (BOOL)positive
{
  return self->_positive;
}

- (BOOL)removeAllUserOverrides
{
  return self->_removeAllUserOverrides;
}

@end