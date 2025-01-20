@interface SGMIMetricsRegexSignatureStats
+ (Class)statsType;
- (BOOL)hasLocale;
- (BOOL)hasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (BOOL)hasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (BOOL)hasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (BOOL)hasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (BOOL)hasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
- (BOOL)hasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
- (BOOL)hasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
- (BOOL)hasTrialMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stats;
- (NSString)locale;
- (SGMIMetricsTrialMetadata)trialMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)statsCount;
- (unsigned)numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (unsigned)numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (unsigned)numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (unsigned)numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
- (unsigned)totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
- (unsigned)totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
- (unsigned)totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
- (void)addStats:(id)a3;
- (void)clearStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setHasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setStats:(id)a3;
- (void)setTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(unsigned int)a3;
- (void)setTrialMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsRegexSignatureStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMetadata, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (unsigned)numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
}

- (unsigned)totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
}

- (unsigned)totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
}

- (unsigned)totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20
{
  return self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
}

- (void)setStats:(id)a3
{
}

- (NSMutableArray)stats
{
  return self->_stats;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setTrialMetadata:(id)a3
{
}

- (SGMIMetricsTrialMetadata)trialMetadata
{
  return self->_trialMetadata;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  trialMetadata = self->_trialMetadata;
  uint64_t v6 = *((void *)v4 + 7);
  if (trialMetadata)
  {
    if (v6) {
      -[SGMIMetricsTrialMetadata mergeFrom:](trialMetadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SGMIMetricsRegexSignatureStats setTrialMetadata:](self, "setTrialMetadata:");
  }
  if (*((void *)v4 + 1)) {
    -[SGMIMetricsRegexSignatureStats setLocale:](self, "setLocale:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SGMIMetricsRegexSignatureStats addStats:](self, "addStats:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v4 + 64);
  if ((v12 & 0x10) != 0)
  {
    self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v12 = *((unsigned char *)v4 + 64);
    if ((v12 & 0x40) == 0)
    {
LABEL_17:
      if ((v12 & 0x20) == 0) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) == 0)
  {
    goto LABEL_17;
  }
  self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 0x40u;
  char v12 = *((unsigned char *)v4 + 64);
  if ((v12 & 0x20) == 0)
  {
LABEL_18:
    if ((v12 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x20u;
  char v12 = *((unsigned char *)v4 + 64);
  if ((v12 & 4) == 0)
  {
LABEL_19:
    if ((v12 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v12 = *((unsigned char *)v4 + 64);
  if ((v12 & 1) == 0)
  {
LABEL_20:
    if ((v12 & 8) == 0) {
      goto LABEL_21;
    }
LABEL_29:
    self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
    if ((*((unsigned char *)v4 + 64) & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_28:
  self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  char v12 = *((unsigned char *)v4 + 64);
  if ((v12 & 8) != 0) {
    goto LABEL_29;
  }
LABEL_21:
  if ((v12 & 2) != 0)
  {
LABEL_22:
    self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_23:
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata hash];
  NSUInteger v4 = [(NSString *)self->_locale hash];
  uint64_t v5 = [(NSMutableArray *)self->_stats hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v6 = 2654435761 * self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v8 = 2654435761 * self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v9 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    uint64_t v10 = 2654435761 * self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_13:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v11 = 2654435761 * self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v12 = 2654435761 * self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  trialMetadata = self->_trialMetadata;
  if ((unint64_t)trialMetadata | *((void *)v4 + 7))
  {
    if (!-[SGMIMetricsTrialMetadata isEqual:](trialMetadata, "isEqual:")) {
      goto LABEL_42;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_42;
    }
  }
  stats = self->_stats;
  if ((unint64_t)stats | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](stats, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0
      || self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 10))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
LABEL_42:
    BOOL v8 = 0;
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) == 0
      || self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 12))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0
      || self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 11))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0
      || self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 6))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_42;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0
      || self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 4))
    {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0
      || self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 7))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_42;
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0
      || self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 != *((_DWORD *)v4 + 5))
    {
      goto LABEL_42;
    }
    BOOL v8 = 1;
  }
LABEL_43:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SGMIMetricsTrialMetadata *)self->_trialMetadata copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = self->_stats;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addStats:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    *(unsigned char *)(v5 + 64) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_10:
      if ((has & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 48) = self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
  *(unsigned char *)(v5 + 64) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 44) = self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
  *(unsigned char *)(v5 + 64) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 24) = self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
LABEL_22:
    *(_DWORD *)(v5 + 28) = self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *(unsigned char *)(v5 + 64) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
LABEL_21:
  *(_DWORD *)(v5 + 16) = self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *(unsigned char *)(v5 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if ((has & 2) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 20) = self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_trialMetadata) {
    objc_msgSend(v9, "setTrialMetadata:");
  }
  if (self->_locale) {
    objc_msgSend(v9, "setLocale:");
  }
  if ([(SGMIMetricsRegexSignatureStats *)self statsCount])
  {
    [v9 clearStats];
    unint64_t v4 = [(SGMIMetricsRegexSignatureStats *)self statsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SGMIMetricsRegexSignatureStats *)self statsAtIndex:i];
        [v9 addStats:v7];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20;
    *((unsigned char *)v9 + 64) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_11:
      if ((has & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v9 + 12) = self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20;
  *((unsigned char *)v9 + 64) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v9 + 11) = self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20;
  *((unsigned char *)v9 + 64) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v9 + 6) = self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *((unsigned char *)v9 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v9 + 4) = self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *((unsigned char *)v9 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_25:
  *((_DWORD *)v9 + 7) = self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
  *((unsigned char *)v9 + 64) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_16:
    *((_DWORD *)v9 + 5) = self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20;
    *((unsigned char *)v9 + 64) |= 2u;
  }
LABEL_17:
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_trialMetadata) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v5 = self->_stats;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_14:
      if ((has & 0x20) == 0) {
        goto LABEL_15;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_26;
  }
LABEL_18:
  if ((has & 2) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint32Field();
LABEL_20:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsRegexSignatureStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  trialMetadata = self->_trialMetadata;
  if (trialMetadata)
  {
    unint64_t v5 = [(SGMIMetricsTrialMetadata *)trialMetadata dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"trialMetadata"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  if ([(NSMutableArray *)self->_stats count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_stats, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v8 = self->_stats;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"stats"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v17 = [NSNumber numberWithUnsignedInt:self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20];
    [v3 setObject:v17 forKey:@"totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_16:
      if ((has & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20, (void)v23);
  [v3 setObject:v18 forKey:@"totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
LABEL_27:
  long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20, (void)v23);
  [v3 setObject:v19 forKey:@"totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_18:
    if ((has & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_29;
  }
LABEL_28:
  long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20, (void)v23);
  [v3 setObject:v20 forKey:@"numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_19:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_30;
  }
LABEL_29:
  long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20, (void)v23);
  [v3 setObject:v21 forKey:@"numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_20:
    if ((has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_30:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20, (void)v23);
  [v3 setObject:v22 forKey:@"numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_21:
    long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20, (void)v23);
    [v3 setObject:v15 forKey:@"numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20"];
  }
LABEL_22:
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsRegexSignatureStats;
  id v4 = [(SGMIMetricsRegexSignatureStats *)&v8 description];
  unint64_t v5 = [(SGMIMetricsRegexSignatureStats *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNumberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfPredictedAttachmentOnLargeOutgoingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setNumberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfPredictedAttachmentOnLargeIncomingMailsWithAttachmentRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setTotalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_totalNumberOfEmailsProcessedForFollowUpDetectionRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setTotalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_totalNumberOfEmailsProcessedForRecipientDetectionRoundedToClosestMultipleOf20 = a3;
}

- (BOOL)hasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setTotalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalNumberOfEmailsProcessedForAttachmentDetectionRoundedToClosestMultipleOf20 = a3;
}

- (id)statsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stats objectAtIndex:a3];
}

- (unint64_t)statsCount
{
  return [(NSMutableArray *)self->_stats count];
}

- (void)addStats:(id)a3
{
  id v4 = a3;
  stats = self->_stats;
  id v8 = v4;
  if (!stats)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_stats;
    self->_stats = v6;

    id v4 = v8;
    stats = self->_stats;
  }
  [(NSMutableArray *)stats addObject:v4];
}

- (void)clearStats
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasTrialMetadata
{
  return self->_trialMetadata != 0;
}

+ (Class)statsType
{
  return (Class)objc_opt_class();
}

@end