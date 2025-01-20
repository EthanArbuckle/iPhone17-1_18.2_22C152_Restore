@interface SGMIMetricsSubmodelsStats
- (BOOL)hasAttachmentsStats;
- (BOOL)hasConversationStats;
- (BOOL)hasDomainFromSenderStats;
- (BOOL)hasListIdStats;
- (BOOL)hasMailboxStats;
- (BOOL)hasMailboxTypeStats;
- (BOOL)hasPersonCCRecipientsStats;
- (BOOL)hasPersonFromSenderInDyadicConversationStats;
- (BOOL)hasPersonFromSenderStats;
- (BOOL)hasPersonToRecipientsStats;
- (BOOL)hasStandardMailRulesStats;
- (BOOL)hasSubjectContentStats;
- (BOOL)hasSubjectCountStatsStats;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SGMIMetricsSubmodelStats)attachmentsStats;
- (SGMIMetricsSubmodelStats)conversationStats;
- (SGMIMetricsSubmodelStats)domainFromSenderStats;
- (SGMIMetricsSubmodelStats)listIdStats;
- (SGMIMetricsSubmodelStats)mailboxStats;
- (SGMIMetricsSubmodelStats)mailboxTypeStats;
- (SGMIMetricsSubmodelStats)personCCRecipientsStats;
- (SGMIMetricsSubmodelStats)personFromSenderInDyadicConversationStats;
- (SGMIMetricsSubmodelStats)personFromSenderStats;
- (SGMIMetricsSubmodelStats)personToRecipientsStats;
- (SGMIMetricsSubmodelStats)standardMailRulesStats;
- (SGMIMetricsSubmodelStats)subjectContentStats;
- (SGMIMetricsSubmodelStats)subjectCountStatsStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentsStats:(id)a3;
- (void)setConversationStats:(id)a3;
- (void)setDomainFromSenderStats:(id)a3;
- (void)setListIdStats:(id)a3;
- (void)setMailboxStats:(id)a3;
- (void)setMailboxTypeStats:(id)a3;
- (void)setPersonCCRecipientsStats:(id)a3;
- (void)setPersonFromSenderInDyadicConversationStats:(id)a3;
- (void)setPersonFromSenderStats:(id)a3;
- (void)setPersonToRecipientsStats:(id)a3;
- (void)setStandardMailRulesStats:(id)a3;
- (void)setSubjectContentStats:(id)a3;
- (void)setSubjectCountStatsStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsSubmodelsStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectCountStatsStats, 0);
  objc_storeStrong((id *)&self->_subjectContentStats, 0);
  objc_storeStrong((id *)&self->_standardMailRulesStats, 0);
  objc_storeStrong((id *)&self->_personToRecipientsStats, 0);
  objc_storeStrong((id *)&self->_personFromSenderStats, 0);
  objc_storeStrong((id *)&self->_personFromSenderInDyadicConversationStats, 0);
  objc_storeStrong((id *)&self->_personCCRecipientsStats, 0);
  objc_storeStrong((id *)&self->_mailboxTypeStats, 0);
  objc_storeStrong((id *)&self->_mailboxStats, 0);
  objc_storeStrong((id *)&self->_listIdStats, 0);
  objc_storeStrong((id *)&self->_domainFromSenderStats, 0);
  objc_storeStrong((id *)&self->_conversationStats, 0);
  objc_storeStrong((id *)&self->_attachmentsStats, 0);
}

- (void)setMailboxTypeStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)mailboxTypeStats
{
  return self->_mailboxTypeStats;
}

- (void)setMailboxStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)mailboxStats
{
  return self->_mailboxStats;
}

- (void)setStandardMailRulesStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)standardMailRulesStats
{
  return self->_standardMailRulesStats;
}

- (void)setSubjectCountStatsStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)subjectCountStatsStats
{
  return self->_subjectCountStatsStats;
}

- (void)setAttachmentsStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)attachmentsStats
{
  return self->_attachmentsStats;
}

- (void)setListIdStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)listIdStats
{
  return self->_listIdStats;
}

- (void)setConversationStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)conversationStats
{
  return self->_conversationStats;
}

- (void)setDomainFromSenderStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)domainFromSenderStats
{
  return self->_domainFromSenderStats;
}

- (void)setPersonCCRecipientsStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)personCCRecipientsStats
{
  return self->_personCCRecipientsStats;
}

- (void)setPersonToRecipientsStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)personToRecipientsStats
{
  return self->_personToRecipientsStats;
}

- (void)setSubjectContentStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)subjectContentStats
{
  return self->_subjectContentStats;
}

- (void)setPersonFromSenderInDyadicConversationStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)personFromSenderInDyadicConversationStats
{
  return self->_personFromSenderInDyadicConversationStats;
}

- (void)setPersonFromSenderStats:(id)a3
{
}

- (SGMIMetricsSubmodelStats)personFromSenderStats
{
  return self->_personFromSenderStats;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  personFromSenderStats = self->_personFromSenderStats;
  v31 = v4;
  uint64_t v6 = v4[9];
  if (personFromSenderStats)
  {
    if (v6) {
      -[SGMIMetricsSubmodelStats mergeFrom:](personFromSenderStats, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SGMIMetricsSubmodelsStats setPersonFromSenderStats:](self, "setPersonFromSenderStats:");
  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  uint64_t v8 = v31[8];
  if (personFromSenderInDyadicConversationStats)
  {
    if (v8) {
      -[SGMIMetricsSubmodelStats mergeFrom:](personFromSenderInDyadicConversationStats, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SGMIMetricsSubmodelsStats setPersonFromSenderInDyadicConversationStats:](self, "setPersonFromSenderInDyadicConversationStats:");
  }
  subjectContentStats = self->_subjectContentStats;
  uint64_t v10 = v31[12];
  if (subjectContentStats)
  {
    if (v10) {
      -[SGMIMetricsSubmodelStats mergeFrom:](subjectContentStats, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SGMIMetricsSubmodelsStats setSubjectContentStats:](self, "setSubjectContentStats:");
  }
  personToRecipientsStats = self->_personToRecipientsStats;
  uint64_t v12 = v31[10];
  if (personToRecipientsStats)
  {
    if (v12) {
      -[SGMIMetricsSubmodelStats mergeFrom:](personToRecipientsStats, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[SGMIMetricsSubmodelsStats setPersonToRecipientsStats:](self, "setPersonToRecipientsStats:");
  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  uint64_t v14 = v31[7];
  if (personCCRecipientsStats)
  {
    if (v14) {
      -[SGMIMetricsSubmodelStats mergeFrom:](personCCRecipientsStats, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SGMIMetricsSubmodelsStats setPersonCCRecipientsStats:](self, "setPersonCCRecipientsStats:");
  }
  domainFromSenderStats = self->_domainFromSenderStats;
  uint64_t v16 = v31[3];
  if (domainFromSenderStats)
  {
    if (v16) {
      -[SGMIMetricsSubmodelStats mergeFrom:](domainFromSenderStats, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SGMIMetricsSubmodelsStats setDomainFromSenderStats:](self, "setDomainFromSenderStats:");
  }
  conversationStats = self->_conversationStats;
  uint64_t v18 = v31[2];
  if (conversationStats)
  {
    if (v18) {
      -[SGMIMetricsSubmodelStats mergeFrom:](conversationStats, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[SGMIMetricsSubmodelsStats setConversationStats:](self, "setConversationStats:");
  }
  listIdStats = self->_listIdStats;
  uint64_t v20 = v31[4];
  if (listIdStats)
  {
    if (v20) {
      -[SGMIMetricsSubmodelStats mergeFrom:](listIdStats, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[SGMIMetricsSubmodelsStats setListIdStats:](self, "setListIdStats:");
  }
  attachmentsStats = self->_attachmentsStats;
  uint64_t v22 = v31[1];
  if (attachmentsStats)
  {
    if (v22) {
      -[SGMIMetricsSubmodelStats mergeFrom:](attachmentsStats, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[SGMIMetricsSubmodelsStats setAttachmentsStats:](self, "setAttachmentsStats:");
  }
  subjectCountStatsStats = self->_subjectCountStatsStats;
  uint64_t v24 = v31[13];
  if (subjectCountStatsStats)
  {
    if (v24) {
      -[SGMIMetricsSubmodelStats mergeFrom:](subjectCountStatsStats, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[SGMIMetricsSubmodelsStats setSubjectCountStatsStats:](self, "setSubjectCountStatsStats:");
  }
  standardMailRulesStats = self->_standardMailRulesStats;
  uint64_t v26 = v31[11];
  if (standardMailRulesStats)
  {
    if (v26) {
      -[SGMIMetricsSubmodelStats mergeFrom:](standardMailRulesStats, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[SGMIMetricsSubmodelsStats setStandardMailRulesStats:](self, "setStandardMailRulesStats:");
  }
  mailboxStats = self->_mailboxStats;
  uint64_t v28 = v31[5];
  if (mailboxStats)
  {
    if (v28) {
      -[SGMIMetricsSubmodelStats mergeFrom:](mailboxStats, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[SGMIMetricsSubmodelsStats setMailboxStats:](self, "setMailboxStats:");
  }
  mailboxTypeStats = self->_mailboxTypeStats;
  uint64_t v30 = v31[6];
  if (mailboxTypeStats)
  {
    if (v30) {
      -[SGMIMetricsSubmodelStats mergeFrom:](mailboxTypeStats, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[SGMIMetricsSubmodelsStats setMailboxTypeStats:](self, "setMailboxTypeStats:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SGMIMetricsSubmodelStats *)self->_personFromSenderStats hash];
  unint64_t v4 = [(SGMIMetricsSubmodelStats *)self->_personFromSenderInDyadicConversationStats hash] ^ v3;
  unint64_t v5 = [(SGMIMetricsSubmodelStats *)self->_subjectContentStats hash];
  unint64_t v6 = v4 ^ v5 ^ [(SGMIMetricsSubmodelStats *)self->_personToRecipientsStats hash];
  unint64_t v7 = [(SGMIMetricsSubmodelStats *)self->_personCCRecipientsStats hash];
  unint64_t v8 = v7 ^ [(SGMIMetricsSubmodelStats *)self->_domainFromSenderStats hash];
  unint64_t v9 = v6 ^ v8 ^ [(SGMIMetricsSubmodelStats *)self->_conversationStats hash];
  unint64_t v10 = [(SGMIMetricsSubmodelStats *)self->_listIdStats hash];
  unint64_t v11 = v10 ^ [(SGMIMetricsSubmodelStats *)self->_attachmentsStats hash];
  unint64_t v12 = v11 ^ [(SGMIMetricsSubmodelStats *)self->_subjectCountStatsStats hash];
  unint64_t v13 = v9 ^ v12 ^ [(SGMIMetricsSubmodelStats *)self->_standardMailRulesStats hash];
  unint64_t v14 = [(SGMIMetricsSubmodelStats *)self->_mailboxStats hash];
  return v13 ^ v14 ^ [(SGMIMetricsSubmodelStats *)self->_mailboxTypeStats hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  personFromSenderStats = self->_personFromSenderStats;
  if ((unint64_t)personFromSenderStats | v4[9])
  {
    if (!-[SGMIMetricsSubmodelStats isEqual:](personFromSenderStats, "isEqual:")) {
      goto LABEL_28;
    }
  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  if ((unint64_t)personFromSenderInDyadicConversationStats | v4[8]
    && !-[SGMIMetricsSubmodelStats isEqual:](personFromSenderInDyadicConversationStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  subjectContentStats = self->_subjectContentStats;
  if ((unint64_t)subjectContentStats | v4[12]
    && !-[SGMIMetricsSubmodelStats isEqual:](subjectContentStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  personToRecipientsStats = self->_personToRecipientsStats;
  if ((unint64_t)personToRecipientsStats | v4[10]
    && !-[SGMIMetricsSubmodelStats isEqual:](personToRecipientsStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  if ((unint64_t)personCCRecipientsStats | v4[7]
    && !-[SGMIMetricsSubmodelStats isEqual:](personCCRecipientsStats, "isEqual:"))
  {
    goto LABEL_28;
  }
  if (((domainFromSenderStats = self->_domainFromSenderStats, !((unint64_t)domainFromSenderStats | v4[3]))
     || -[SGMIMetricsSubmodelStats isEqual:](domainFromSenderStats, "isEqual:"))
    && ((conversationStats = self->_conversationStats, !((unint64_t)conversationStats | v4[2]))
     || -[SGMIMetricsSubmodelStats isEqual:](conversationStats, "isEqual:"))
    && ((listIdStats = self->_listIdStats, !((unint64_t)listIdStats | v4[4]))
     || -[SGMIMetricsSubmodelStats isEqual:](listIdStats, "isEqual:"))
    && ((attachmentsStats = self->_attachmentsStats, !((unint64_t)attachmentsStats | v4[1]))
     || -[SGMIMetricsSubmodelStats isEqual:](attachmentsStats, "isEqual:"))
    && ((subjectCountStatsStats = self->_subjectCountStatsStats, !((unint64_t)subjectCountStatsStats | v4[13]))
     || -[SGMIMetricsSubmodelStats isEqual:](subjectCountStatsStats, "isEqual:"))
    && ((standardMailRulesStats = self->_standardMailRulesStats, !((unint64_t)standardMailRulesStats | v4[11]))
     || -[SGMIMetricsSubmodelStats isEqual:](standardMailRulesStats, "isEqual:"))
    && ((mailboxStats = self->_mailboxStats, !((unint64_t)mailboxStats | v4[5]))
     || -[SGMIMetricsSubmodelStats isEqual:](mailboxStats, "isEqual:")))
  {
    mailboxTypeStats = self->_mailboxTypeStats;
    if ((unint64_t)mailboxTypeStats | v4[6]) {
      char v18 = -[SGMIMetricsSubmodelStats isEqual:](mailboxTypeStats, "isEqual:");
    }
    else {
      char v18 = 1;
    }
  }
  else
  {
LABEL_28:
    char v18 = 0;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SGMIMetricsSubmodelStats *)self->_personFromSenderStats copyWithZone:a3];
  unint64_t v7 = (void *)v5[9];
  v5[9] = v6;

  id v8 = [(SGMIMetricsSubmodelStats *)self->_personFromSenderInDyadicConversationStats copyWithZone:a3];
  unint64_t v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(SGMIMetricsSubmodelStats *)self->_subjectContentStats copyWithZone:a3];
  unint64_t v11 = (void *)v5[12];
  v5[12] = v10;

  id v12 = [(SGMIMetricsSubmodelStats *)self->_personToRecipientsStats copyWithZone:a3];
  unint64_t v13 = (void *)v5[10];
  v5[10] = v12;

  id v14 = [(SGMIMetricsSubmodelStats *)self->_personCCRecipientsStats copyWithZone:a3];
  v15 = (void *)v5[7];
  v5[7] = v14;

  id v16 = [(SGMIMetricsSubmodelStats *)self->_domainFromSenderStats copyWithZone:a3];
  v17 = (void *)v5[3];
  v5[3] = v16;

  id v18 = [(SGMIMetricsSubmodelStats *)self->_conversationStats copyWithZone:a3];
  v19 = (void *)v5[2];
  v5[2] = v18;

  id v20 = [(SGMIMetricsSubmodelStats *)self->_listIdStats copyWithZone:a3];
  v21 = (void *)v5[4];
  v5[4] = v20;

  id v22 = [(SGMIMetricsSubmodelStats *)self->_attachmentsStats copyWithZone:a3];
  v23 = (void *)v5[1];
  v5[1] = v22;

  id v24 = [(SGMIMetricsSubmodelStats *)self->_subjectCountStatsStats copyWithZone:a3];
  v25 = (void *)v5[13];
  v5[13] = v24;

  id v26 = [(SGMIMetricsSubmodelStats *)self->_standardMailRulesStats copyWithZone:a3];
  v27 = (void *)v5[11];
  v5[11] = v26;

  id v28 = [(SGMIMetricsSubmodelStats *)self->_mailboxStats copyWithZone:a3];
  v29 = (void *)v5[5];
  v5[5] = v28;

  id v30 = [(SGMIMetricsSubmodelStats *)self->_mailboxTypeStats copyWithZone:a3];
  v31 = (void *)v5[6];
  v5[6] = v30;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personFromSenderStats)
  {
    objc_msgSend(v4, "setPersonFromSenderStats:");
    id v4 = v5;
  }
  if (self->_personFromSenderInDyadicConversationStats)
  {
    objc_msgSend(v5, "setPersonFromSenderInDyadicConversationStats:");
    id v4 = v5;
  }
  if (self->_subjectContentStats)
  {
    objc_msgSend(v5, "setSubjectContentStats:");
    id v4 = v5;
  }
  if (self->_personToRecipientsStats)
  {
    objc_msgSend(v5, "setPersonToRecipientsStats:");
    id v4 = v5;
  }
  if (self->_personCCRecipientsStats)
  {
    objc_msgSend(v5, "setPersonCCRecipientsStats:");
    id v4 = v5;
  }
  if (self->_domainFromSenderStats)
  {
    objc_msgSend(v5, "setDomainFromSenderStats:");
    id v4 = v5;
  }
  if (self->_conversationStats)
  {
    objc_msgSend(v5, "setConversationStats:");
    id v4 = v5;
  }
  if (self->_listIdStats)
  {
    objc_msgSend(v5, "setListIdStats:");
    id v4 = v5;
  }
  if (self->_attachmentsStats)
  {
    objc_msgSend(v5, "setAttachmentsStats:");
    id v4 = v5;
  }
  if (self->_subjectCountStatsStats)
  {
    objc_msgSend(v5, "setSubjectCountStatsStats:");
    id v4 = v5;
  }
  if (self->_standardMailRulesStats)
  {
    objc_msgSend(v5, "setStandardMailRulesStats:");
    id v4 = v5;
  }
  if (self->_mailboxStats)
  {
    objc_msgSend(v5, "setMailboxStats:");
    id v4 = v5;
  }
  if (self->_mailboxTypeStats)
  {
    objc_msgSend(v5, "setMailboxTypeStats:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personFromSenderStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_personFromSenderInDyadicConversationStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subjectContentStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_personToRecipientsStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_personCCRecipientsStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_domainFromSenderStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_conversationStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_listIdStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_attachmentsStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_subjectCountStatsStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_standardMailRulesStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mailboxStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_mailboxTypeStats)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  personFromSenderStats = self->_personFromSenderStats;
  if (personFromSenderStats)
  {
    id v5 = [(SGMIMetricsSubmodelStats *)personFromSenderStats dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"personFromSenderStats"];
  }
  personFromSenderInDyadicConversationStats = self->_personFromSenderInDyadicConversationStats;
  if (personFromSenderInDyadicConversationStats)
  {
    unint64_t v7 = [(SGMIMetricsSubmodelStats *)personFromSenderInDyadicConversationStats dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"personFromSenderInDyadicConversationStats"];
  }
  subjectContentStats = self->_subjectContentStats;
  if (subjectContentStats)
  {
    unint64_t v9 = [(SGMIMetricsSubmodelStats *)subjectContentStats dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"subjectContentStats"];
  }
  personToRecipientsStats = self->_personToRecipientsStats;
  if (personToRecipientsStats)
  {
    unint64_t v11 = [(SGMIMetricsSubmodelStats *)personToRecipientsStats dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"personToRecipientsStats"];
  }
  personCCRecipientsStats = self->_personCCRecipientsStats;
  if (personCCRecipientsStats)
  {
    unint64_t v13 = [(SGMIMetricsSubmodelStats *)personCCRecipientsStats dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"personCCRecipientsStats"];
  }
  domainFromSenderStats = self->_domainFromSenderStats;
  if (domainFromSenderStats)
  {
    v15 = [(SGMIMetricsSubmodelStats *)domainFromSenderStats dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"domainFromSenderStats"];
  }
  conversationStats = self->_conversationStats;
  if (conversationStats)
  {
    v17 = [(SGMIMetricsSubmodelStats *)conversationStats dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"conversationStats"];
  }
  listIdStats = self->_listIdStats;
  if (listIdStats)
  {
    v19 = [(SGMIMetricsSubmodelStats *)listIdStats dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"listIdStats"];
  }
  attachmentsStats = self->_attachmentsStats;
  if (attachmentsStats)
  {
    v21 = [(SGMIMetricsSubmodelStats *)attachmentsStats dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"attachmentsStats"];
  }
  subjectCountStatsStats = self->_subjectCountStatsStats;
  if (subjectCountStatsStats)
  {
    v23 = [(SGMIMetricsSubmodelStats *)subjectCountStatsStats dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"subjectCountStatsStats"];
  }
  standardMailRulesStats = self->_standardMailRulesStats;
  if (standardMailRulesStats)
  {
    v25 = [(SGMIMetricsSubmodelStats *)standardMailRulesStats dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"standardMailRulesStats"];
  }
  mailboxStats = self->_mailboxStats;
  if (mailboxStats)
  {
    v27 = [(SGMIMetricsSubmodelStats *)mailboxStats dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"mailboxStats"];
  }
  mailboxTypeStats = self->_mailboxTypeStats;
  if (mailboxTypeStats)
  {
    v29 = [(SGMIMetricsSubmodelStats *)mailboxTypeStats dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"mailboxTypeStats"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsSubmodelsStats;
  id v4 = [(SGMIMetricsSubmodelsStats *)&v8 description];
  id v5 = [(SGMIMetricsSubmodelsStats *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMailboxTypeStats
{
  return self->_mailboxTypeStats != 0;
}

- (BOOL)hasMailboxStats
{
  return self->_mailboxStats != 0;
}

- (BOOL)hasStandardMailRulesStats
{
  return self->_standardMailRulesStats != 0;
}

- (BOOL)hasSubjectCountStatsStats
{
  return self->_subjectCountStatsStats != 0;
}

- (BOOL)hasAttachmentsStats
{
  return self->_attachmentsStats != 0;
}

- (BOOL)hasListIdStats
{
  return self->_listIdStats != 0;
}

- (BOOL)hasConversationStats
{
  return self->_conversationStats != 0;
}

- (BOOL)hasDomainFromSenderStats
{
  return self->_domainFromSenderStats != 0;
}

- (BOOL)hasPersonCCRecipientsStats
{
  return self->_personCCRecipientsStats != 0;
}

- (BOOL)hasPersonToRecipientsStats
{
  return self->_personToRecipientsStats != 0;
}

- (BOOL)hasSubjectContentStats
{
  return self->_subjectContentStats != 0;
}

- (BOOL)hasPersonFromSenderInDyadicConversationStats
{
  return self->_personFromSenderInDyadicConversationStats != 0;
}

- (BOOL)hasPersonFromSenderStats
{
  return self->_personFromSenderStats != 0;
}

@end