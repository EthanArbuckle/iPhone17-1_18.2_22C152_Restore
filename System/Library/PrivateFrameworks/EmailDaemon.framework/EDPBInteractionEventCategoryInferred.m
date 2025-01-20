@interface EDPBInteractionEventCategoryInferred
- (BOOL)hasAccountId;
- (BOOL)hasCategoryType;
- (BOOL)hasConversationId;
- (BOOL)hasFeaturesImportant;
- (BOOL)hasFeaturesPromotion;
- (BOOL)hasMailboxId;
- (BOOL)hasMailboxType;
- (BOOL)hasMessageId;
- (BOOL)hasModelId;
- (BOOL)hasModelVersion;
- (BOOL)hasPositive;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)positive;
- (BOOL)readFrom:(id)a3;
- (EDPBModelFeaturesImportant)featuresImportant;
- (EDPBModelFeaturesPromotion)featuresPromotion;
- (double)score;
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
- (unsigned)modelId;
- (unsigned)modelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setCategoryType:(int)a3;
- (void)setConversationId:(int64_t)a3;
- (void)setFeaturesImportant:(id)a3;
- (void)setFeaturesPromotion:(id)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasCategoryType:(BOOL)a3;
- (void)setHasConversationId:(BOOL)a3;
- (void)setHasMailboxId:(BOOL)a3;
- (void)setHasMailboxType:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasModelId:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasPositive:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setMailboxId:(int64_t)a3;
- (void)setMailboxType:(int)a3;
- (void)setMessageId:(int64_t)a3;
- (void)setModelId:(unsigned int)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setPositive:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventCategoryInferred

- (void)setAccountId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAccountId
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMailboxId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_mailboxId = a3;
}

- (void)setHasMailboxId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMailboxId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)mailboxType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_mailboxType;
  }
  else {
    return 0;
  }
}

- (void)setMailboxType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_mailboxType = a3;
}

- (void)setHasMailboxType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMailboxType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)mailboxTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6C03F00[a3];
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
  *(_WORD *)&self->_has |= 2u;
  self->_conversationId = a3;
}

- (void)setHasConversationId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConversationId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMessageId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_messageId = a3;
}

- (void)setHasMessageId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMessageId
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPositive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_positive = a3;
}

- (void)setHasPositive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPositive
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)categoryType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_categoryType;
  }
  else {
    return 0;
  }
}

- (void)setCategoryType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_categoryType = a3;
}

- (void)setHasCategoryType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCategoryType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)categoryTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6C03F48[a3];
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

- (void)setModelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_modelId = a3;
}

- (void)setHasModelId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasModelId
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_modelVersion = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasModelVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasFeaturesImportant
{
  return self->_featuresImportant != 0;
}

- (BOOL)hasFeaturesPromotion
{
  return self->_featuresPromotion != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventCategoryInferred;
  int v4 = [(EDPBInteractionEventCategoryInferred *)&v8 description];
  v5 = [(EDPBInteractionEventCategoryInferred *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_accountId];
    [v3 setObject:v5 forKey:@"account_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_mailboxId];
    [v3 setObject:v6 forKey:@"mailbox_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    uint64_t mailboxType = self->_mailboxType;
    if (mailboxType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mailboxType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6C03F00[mailboxType];
    }
    [v3 setObject:v8 forKey:@"mailbox_type"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_conversationId];
    [v3 setObject:v9 forKey:@"conversation_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_messageId];
    [v3 setObject:v10 forKey:@"message_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_score];
    [v3 setObject:v11 forKey:@"score"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_positive];
    [v3 setObject:v12 forKey:@"positive"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t categoryType = self->_categoryType;
    if (categoryType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_categoryType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E6C03F48[categoryType];
    }
    [v3 setObject:v14 forKey:@"category_type"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_modelId];
    [v3 setObject:v15 forKey:@"model_id"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    v16 = [NSNumber numberWithUnsignedInt:self->_modelVersion];
    [v3 setObject:v16 forKey:@"model_version"];
  }
  featuresImportant = self->_featuresImportant;
  if (featuresImportant)
  {
    v18 = [(EDPBModelFeaturesImportant *)featuresImportant dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"features_important"];
  }
  featuresPromotion = self->_featuresPromotion;
  if (featuresPromotion)
  {
    v20 = [(EDPBModelFeaturesPromotion *)featuresPromotion dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"features_promotion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventCategoryInferredReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteSint64Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_featuresImportant) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_featuresPromotion) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_accountId;
    *((_WORD *)v4 + 44) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_mailboxId;
  *((_WORD *)v4 + 44) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 18) = self->_mailboxType;
  *((_WORD *)v4 + 44) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[2] = self->_conversationId;
  *((_WORD *)v4 + 44) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[4] = self->_messageId;
  *((_WORD *)v4 + 44) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[5] = *(void *)&self->_score;
  *((_WORD *)v4 + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 84) = self->_positive;
  *((_WORD *)v4 + 44) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 12) = self->_categoryType;
  *((_WORD *)v4 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_27:
  *((_DWORD *)v4 + 19) = self->_modelId;
  *((_WORD *)v4 + 44) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 20) = self->_modelVersion;
    *((_WORD *)v4 + 44) |= 0x100u;
  }
LABEL_12:
  id v6 = v4;
  if (self->_featuresImportant) {
    objc_msgSend(v4, "setFeaturesImportant:");
  }
  if (self->_featuresPromotion) {
    objc_msgSend(v6, "setFeaturesPromotion:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_accountId;
    *(_WORD *)(v5 + 88) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 24) = self->_mailboxId;
  *(_WORD *)(v5 + 88) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 72) = self->_mailboxType;
  *(_WORD *)(v5 + 88) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(void *)(v5 + 16) = self->_conversationId;
  *(_WORD *)(v5 + 88) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(void *)(v5 + 32) = self->_messageId;
  *(_WORD *)(v5 + 88) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 40) = self->_score;
  *(_WORD *)(v5 + 88) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(v5 + 84) = self->_positive;
  *(_WORD *)(v5 + 88) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *(_DWORD *)(v5 + 76) = self->_modelId;
    *(_WORD *)(v5 + 88) |= 0x80u;
    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v5 + 48) = self->_categoryType;
  *(_WORD *)(v5 + 88) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x100) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 80) = self->_modelVersion;
    *(_WORD *)(v5 + 88) |= 0x100u;
  }
LABEL_12:
  id v8 = [(EDPBModelFeaturesImportant *)self->_featuresImportant copyWithZone:a3];
  v9 = (void *)v6[7];
  v6[7] = v8;

  id v10 = [(EDPBModelFeaturesPromotion *)self->_featuresPromotion copyWithZone:a3];
  v11 = (void *)v6[8];
  v6[8] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 44);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_59;
    }
  }
  else if (v6)
  {
    goto LABEL_59;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mailboxId != *((void *)v4 + 3)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_mailboxType != *((_DWORD *)v4 + 18)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_conversationId != *((void *)v4 + 2)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_messageId != *((void *)v4 + 4)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_score != *((double *)v4 + 5)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x200) != 0)
    {
      if (self->_positive)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_59;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_40;
      }
    }
LABEL_59:
    char v9 = 0;
    goto LABEL_60;
  }
  if ((*((_WORD *)v4 + 44) & 0x200) != 0) {
    goto LABEL_59;
  }
LABEL_40:
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_categoryType != *((_DWORD *)v4 + 12)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_59;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_modelId != *((_DWORD *)v4 + 19)) {
      goto LABEL_59;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_59;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0 || self->_modelVersion != *((_DWORD *)v4 + 20)) {
      goto LABEL_59;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_59;
  }
  featuresImportant = self->_featuresImportant;
  if ((unint64_t)featuresImportant | *((void *)v4 + 7)
    && !-[EDPBModelFeaturesImportant isEqual:](featuresImportant, "isEqual:"))
  {
    goto LABEL_59;
  }
  featuresPromotion = self->_featuresPromotion;
  if ((unint64_t)featuresPromotion | *((void *)v4 + 8)) {
    char v9 = -[EDPBModelFeaturesPromotion isEqual:](featuresPromotion, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_60:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v4 = 2654435761 * self->_accountId;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_mailboxId;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_mailboxType;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_conversationId;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v8 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v13 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_messageId;
  if ((has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  double score = self->_score;
  double v10 = -score;
  if (score >= 0.0) {
    double v10 = self->_score;
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
  if ((has & 0x200) != 0)
  {
    uint64_t v14 = 2654435761 * self->_positive;
    if ((has & 0x20) != 0)
    {
LABEL_21:
      uint64_t v15 = 2654435761 * self->_categoryType;
      if ((has & 0x80) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v16 = 0;
      if ((has & 0x100) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v17 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v15 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v16 = 2654435761 * self->_modelId;
  if ((has & 0x100) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v17 = 2654435761 * self->_modelVersion;
LABEL_28:
  unint64_t v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(EDPBModelFeaturesImportant *)self->_featuresImportant hash];
  return v18 ^ [(EDPBModelFeaturesPromotion *)self->_featuresPromotion hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 44);
  if (v6)
  {
    self->_accountId = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = *((_WORD *)v4 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_mailboxId = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uint64_t mailboxType = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_conversationId = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_messageId = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double score = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x200) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_positive = *((unsigned char *)v4 + 84);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_uint64_t categoryType = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 0x80) == 0)
  {
LABEL_10:
    if ((v6 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_modelId = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
LABEL_11:
    self->_modelVersion = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_12:
  featuresImportant = self->_featuresImportant;
  long double v11 = v5;
  uint64_t v8 = v5[7];
  if (featuresImportant)
  {
    if (v8) {
      -[EDPBModelFeaturesImportant mergeFrom:](featuresImportant, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[EDPBInteractionEventCategoryInferred setFeaturesImportant:](self, "setFeaturesImportant:");
  }
  featuresPromotion = self->_featuresPromotion;
  uint64_t v10 = v11[8];
  if (featuresPromotion)
  {
    if (v10) {
      -[EDPBModelFeaturesPromotion mergeFrom:](featuresPromotion, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[EDPBInteractionEventCategoryInferred setFeaturesPromotion:](self, "setFeaturesPromotion:");
  }
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

- (double)score
{
  return self->_score;
}

- (BOOL)positive
{
  return self->_positive;
}

- (unsigned)modelId
{
  return self->_modelId;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (EDPBModelFeaturesImportant)featuresImportant
{
  return self->_featuresImportant;
}

- (void)setFeaturesImportant:(id)a3
{
}

- (EDPBModelFeaturesPromotion)featuresPromotion
{
  return self->_featuresPromotion;
}

- (void)setFeaturesPromotion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresPromotion, 0);

  objc_storeStrong((id *)&self->_featuresImportant, 0);
}

@end