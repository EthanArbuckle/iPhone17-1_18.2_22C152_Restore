@interface SGMIMetricsSubmodelsProbabilities
- (BOOL)hasAttachmentsProbability;
- (BOOL)hasConversationProbability;
- (BOOL)hasDomainFromSenderProbability;
- (BOOL)hasListIdProbability;
- (BOOL)hasMailboxProbability;
- (BOOL)hasMailboxTypeProbability;
- (BOOL)hasPersonCCRecipientsProbability;
- (BOOL)hasPersonFromSenderInDyadicConversationProbability;
- (BOOL)hasPersonFromSenderProbability;
- (BOOL)hasPersonToRecipientsProbability;
- (BOOL)hasStandardMailRulesProbability;
- (BOOL)hasSubjectContentProbability;
- (BOOL)hasSubjectCountStatsProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)attachmentsProbability;
- (float)conversationProbability;
- (float)domainFromSenderProbability;
- (float)listIdProbability;
- (float)mailboxProbability;
- (float)mailboxTypeProbability;
- (float)personCCRecipientsProbability;
- (float)personFromSenderInDyadicConversationProbability;
- (float)personFromSenderProbability;
- (float)personToRecipientsProbability;
- (float)standardMailRulesProbability;
- (float)subjectContentProbability;
- (float)subjectCountStatsProbability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttachmentsProbability:(float)a3;
- (void)setConversationProbability:(float)a3;
- (void)setDomainFromSenderProbability:(float)a3;
- (void)setHasAttachmentsProbability:(BOOL)a3;
- (void)setHasConversationProbability:(BOOL)a3;
- (void)setHasDomainFromSenderProbability:(BOOL)a3;
- (void)setHasListIdProbability:(BOOL)a3;
- (void)setHasMailboxProbability:(BOOL)a3;
- (void)setHasMailboxTypeProbability:(BOOL)a3;
- (void)setHasPersonCCRecipientsProbability:(BOOL)a3;
- (void)setHasPersonFromSenderInDyadicConversationProbability:(BOOL)a3;
- (void)setHasPersonFromSenderProbability:(BOOL)a3;
- (void)setHasPersonToRecipientsProbability:(BOOL)a3;
- (void)setHasStandardMailRulesProbability:(BOOL)a3;
- (void)setHasSubjectContentProbability:(BOOL)a3;
- (void)setHasSubjectCountStatsProbability:(BOOL)a3;
- (void)setListIdProbability:(float)a3;
- (void)setMailboxProbability:(float)a3;
- (void)setMailboxTypeProbability:(float)a3;
- (void)setPersonCCRecipientsProbability:(float)a3;
- (void)setPersonFromSenderInDyadicConversationProbability:(float)a3;
- (void)setPersonFromSenderProbability:(float)a3;
- (void)setPersonToRecipientsProbability:(float)a3;
- (void)setStandardMailRulesProbability:(float)a3;
- (void)setSubjectContentProbability:(float)a3;
- (void)setSubjectCountStatsProbability:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsSubmodelsProbabilities

- (float)mailboxTypeProbability
{
  return self->_mailboxTypeProbability;
}

- (float)mailboxProbability
{
  return self->_mailboxProbability;
}

- (float)standardMailRulesProbability
{
  return self->_standardMailRulesProbability;
}

- (float)subjectCountStatsProbability
{
  return self->_subjectCountStatsProbability;
}

- (float)attachmentsProbability
{
  return self->_attachmentsProbability;
}

- (float)listIdProbability
{
  return self->_listIdProbability;
}

- (float)conversationProbability
{
  return self->_conversationProbability;
}

- (float)domainFromSenderProbability
{
  return self->_domainFromSenderProbability;
}

- (float)personCCRecipientsProbability
{
  return self->_personCCRecipientsProbability;
}

- (float)personToRecipientsProbability
{
  return self->_personToRecipientsProbability;
}

- (float)subjectContentProbability
{
  return self->_subjectContentProbability;
}

- (float)personFromSenderInDyadicConversationProbability
{
  return self->_personFromSenderInDyadicConversationProbability;
}

- (float)personFromSenderProbability
{
  return self->_personFromSenderProbability;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
  {
    self->_personFromSenderProbability = *((float *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_personFromSenderInDyadicConversationProbability = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_subjectContentProbability = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_personToRecipientsProbability = *((float *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_personCCRecipientsProbability = *((float *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_domainFromSenderProbability = *((float *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_conversationProbability = *((float *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_listIdProbability = *((float *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_attachmentsProbability = *((float *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_subjectCountStatsProbability = *((float *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_standardMailRulesProbability = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  self->_mailboxProbability = *((float *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 30) & 0x20) != 0)
  {
LABEL_14:
    self->_mailboxTypeProbability = *((float *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_15:
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    float personFromSenderProbability = self->_personFromSenderProbability;
    float v6 = -personFromSenderProbability;
    if (personFromSenderProbability >= 0.0) {
      float v6 = self->_personFromSenderProbability;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x80) != 0)
  {
    float personFromSenderInDyadicConversationProbability = self->_personFromSenderInDyadicConversationProbability;
    float v11 = -personFromSenderInDyadicConversationProbability;
    if (personFromSenderInDyadicConversationProbability >= 0.0) {
      float v11 = self->_personFromSenderInDyadicConversationProbability;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x800) != 0)
  {
    float subjectContentProbability = self->_subjectContentProbability;
    float v16 = -subjectContentProbability;
    if (subjectContentProbability >= 0.0) {
      float v16 = self->_subjectContentProbability;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x200) != 0)
  {
    float personToRecipientsProbability = self->_personToRecipientsProbability;
    float v21 = -personToRecipientsProbability;
    if (personToRecipientsProbability >= 0.0) {
      float v21 = self->_personToRecipientsProbability;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x40) != 0)
  {
    float personCCRecipientsProbability = self->_personCCRecipientsProbability;
    float v26 = -personCCRecipientsProbability;
    if (personCCRecipientsProbability >= 0.0) {
      float v26 = self->_personCCRecipientsProbability;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 4) != 0)
  {
    float domainFromSenderProbability = self->_domainFromSenderProbability;
    float v31 = -domainFromSenderProbability;
    if (domainFromSenderProbability >= 0.0) {
      float v31 = self->_domainFromSenderProbability;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 2) != 0)
  {
    float conversationProbability = self->_conversationProbability;
    float v36 = -conversationProbability;
    if (conversationProbability >= 0.0) {
      float v36 = self->_conversationProbability;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v77 = v4;
  if ((has & 8) != 0)
  {
    float listIdProbability = self->_listIdProbability;
    float v41 = -listIdProbability;
    if (listIdProbability >= 0.0) {
      float v41 = self->_listIdProbability;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v76 = v9;
  if (has)
  {
    float attachmentsProbability = self->_attachmentsProbability;
    float v46 = -attachmentsProbability;
    if (attachmentsProbability >= 0.0) {
      float v46 = self->_attachmentsProbability;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v74 = v34;
  unint64_t v75 = v14;
  if ((has & 0x1000) != 0)
  {
    float subjectCountStatsProbability = self->_subjectCountStatsProbability;
    float v51 = -subjectCountStatsProbability;
    if (subjectCountStatsProbability >= 0.0) {
      float v51 = self->_subjectCountStatsProbability;
    }
    float v52 = floorf(v51 + 0.5);
    float v53 = (float)(v51 - v52) * 1.8447e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v73 = v44;
  unint64_t v54 = v19;
  unint64_t v55 = v39;
  if ((has & 0x400) != 0)
  {
    float standardMailRulesProbability = self->_standardMailRulesProbability;
    float v59 = -standardMailRulesProbability;
    if (standardMailRulesProbability >= 0.0) {
      float v59 = self->_standardMailRulesProbability;
    }
    float v60 = floorf(v59 + 0.5);
    float v61 = (float)(v59 - v60) * 1.8447e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmodf(v60, 1.8447e19);
    unint64_t v56 = v29;
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabsf(v61);
    }
  }
  else
  {
    unint64_t v56 = v29;
    unint64_t v57 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float mailboxProbability = self->_mailboxProbability;
    float v64 = -mailboxProbability;
    if (mailboxProbability >= 0.0) {
      float v64 = self->_mailboxProbability;
    }
    float v65 = floorf(v64 + 0.5);
    float v66 = (float)(v64 - v65) * 1.8447e19;
    unint64_t v62 = 2654435761u * (unint64_t)fmodf(v65, 1.8447e19);
    if (v66 >= 0.0)
    {
      if (v66 > 0.0) {
        v62 += (unint64_t)v66;
      }
    }
    else
    {
      v62 -= (unint64_t)fabsf(v66);
    }
  }
  else
  {
    unint64_t v62 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float mailboxTypeProbability = self->_mailboxTypeProbability;
    float v69 = -mailboxTypeProbability;
    if (mailboxTypeProbability >= 0.0) {
      float v69 = self->_mailboxTypeProbability;
    }
    float v70 = floorf(v69 + 0.5);
    float v71 = (float)(v69 - v70) * 1.8447e19;
    unint64_t v67 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
    if (v71 >= 0.0)
    {
      if (v71 > 0.0) {
        v67 += (unint64_t)v71;
      }
    }
    else
    {
      v67 -= (unint64_t)fabsf(v71);
    }
  }
  else
  {
    unint64_t v67 = 0;
  }
  return v76 ^ v77 ^ v75 ^ v54 ^ v24 ^ v56 ^ v74 ^ v55 ^ v73 ^ v49 ^ v57 ^ v62 ^ v67;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_personFromSenderProbability != *((float *)v4 + 10)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
LABEL_67:
    BOOL v7 = 0;
    goto LABEL_68;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_personFromSenderInDyadicConversationProbability != *((float *)v4 + 9)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_subjectContentProbability != *((float *)v4 + 13)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_personToRecipientsProbability != *((float *)v4 + 11)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_personCCRecipientsProbability != *((float *)v4 + 8)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_domainFromSenderProbability != *((float *)v4 + 4)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_conversationProbability != *((float *)v4 + 3)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_listIdProbability != *((float *)v4 + 5)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_67;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_attachmentsProbability != *((float *)v4 + 2)) {
      goto LABEL_67;
    }
  }
  else if (v6)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x1000) == 0 || self->_subjectCountStatsProbability != *((float *)v4 + 14)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x1000) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_standardMailRulesProbability != *((float *)v4 + 12)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mailboxProbability != *((float *)v4 + 6)) {
      goto LABEL_67;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_mailboxTypeProbability != *((float *)v4 + 7)) {
      goto LABEL_67;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x20) == 0;
  }
LABEL_68:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = LODWORD(self->_personFromSenderProbability);
    *((_WORD *)result + 30) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = LODWORD(self->_personFromSenderInDyadicConversationProbability);
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 13) = LODWORD(self->_subjectContentProbability);
  *((_WORD *)result + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 11) = LODWORD(self->_personToRecipientsProbability);
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = LODWORD(self->_personCCRecipientsProbability);
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 4) = LODWORD(self->_domainFromSenderProbability);
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 3) = LODWORD(self->_conversationProbability);
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = LODWORD(self->_listIdProbability);
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 2) = LODWORD(self->_attachmentsProbability);
  *((_WORD *)result + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 14) = LODWORD(self->_subjectCountStatsProbability);
  *((_WORD *)result + 30) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 12) = LODWORD(self->_standardMailRulesProbability);
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 6) = LODWORD(self->_mailboxProbability);
  *((_WORD *)result + 30) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_14:
  *((_DWORD *)result + 7) = LODWORD(self->_mailboxTypeProbability);
  *((_WORD *)result + 30) |= 0x20u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = LODWORD(self->_personFromSenderProbability);
    *((_WORD *)v4 + 30) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = LODWORD(self->_personFromSenderInDyadicConversationProbability);
  *((_WORD *)v4 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[13] = LODWORD(self->_subjectContentProbability);
  *((_WORD *)v4 + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[11] = LODWORD(self->_personToRecipientsProbability);
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[8] = LODWORD(self->_personCCRecipientsProbability);
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[4] = LODWORD(self->_domainFromSenderProbability);
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[3] = LODWORD(self->_conversationProbability);
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[5] = LODWORD(self->_listIdProbability);
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[2] = LODWORD(self->_attachmentsProbability);
  *((_WORD *)v4 + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[14] = LODWORD(self->_subjectCountStatsProbability);
  *((_WORD *)v4 + 30) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[12] = LODWORD(self->_standardMailRulesProbability);
  *((_WORD *)v4 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v4[6] = LODWORD(self->_mailboxProbability);
  *((_WORD *)v4 + 30) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    v4[7] = LODWORD(self->_mailboxTypeProbability);
    *((_WORD *)v4 + 30) |= 0x20u;
  }
LABEL_15:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_14:
  }
    PBDataWriterWriteFloatField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelsProbabilitiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(float *)&double v4 = self->_personFromSenderProbability;
    float v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"personFromSenderProbability"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_personFromSenderInDyadicConversationProbability;
  unint64_t v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"personFromSenderInDyadicConversationProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(float *)&double v4 = self->_subjectContentProbability;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"subjectContentProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(float *)&double v4 = self->_personToRecipientsProbability;
  float v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"personToRecipientsProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(float *)&double v4 = self->_personCCRecipientsProbability;
  float v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"personCCRecipientsProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(float *)&double v4 = self->_domainFromSenderProbability;
  float v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"domainFromSenderProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(float *)&double v4 = self->_conversationProbability;
  unint64_t v14 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v14 forKey:@"conversationProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&double v4 = self->_listIdProbability;
  v15 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v15 forKey:@"listIdProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(float *)&double v4 = self->_attachmentsProbability;
  float v16 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v16 forKey:@"attachmentsProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(float *)&double v4 = self->_subjectCountStatsProbability;
  float v17 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v17 forKey:@"subjectCountStatsProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(float *)&double v4 = self->_standardMailRulesProbability;
  float v18 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v18 forKey:@"standardMailRulesProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  *(float *)&double v4 = self->_mailboxProbability;
  unint64_t v19 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v19 forKey:@"mailboxProbability"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *(float *)&double v4 = self->_mailboxTypeProbability;
    __int16 v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"mailboxTypeProbability"];
  }
LABEL_15:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsSubmodelsProbabilities;
  double v4 = [(SGMIMetricsSubmodelsProbabilities *)&v8 description];
  id v5 = [(SGMIMetricsSubmodelsProbabilities *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMailboxTypeProbability
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasMailboxTypeProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setMailboxTypeProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float mailboxTypeProbability = a3;
}

- (BOOL)hasMailboxProbability
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasMailboxProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setMailboxProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_float mailboxProbability = a3;
}

- (BOOL)hasStandardMailRulesProbability
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasStandardMailRulesProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setStandardMailRulesProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_float standardMailRulesProbability = a3;
}

- (BOOL)hasSubjectCountStatsProbability
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasSubjectCountStatsProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setSubjectCountStatsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_float subjectCountStatsProbability = a3;
}

- (BOOL)hasAttachmentsProbability
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAttachmentsProbability:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setAttachmentsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_float attachmentsProbability = a3;
}

- (BOOL)hasListIdProbability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasListIdProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setListIdProbability:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float listIdProbability = a3;
}

- (BOOL)hasConversationProbability
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasConversationProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setConversationProbability:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float conversationProbability = a3;
}

- (BOOL)hasDomainFromSenderProbability
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasDomainFromSenderProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setDomainFromSenderProbability:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float domainFromSenderProbability = a3;
}

- (BOOL)hasPersonCCRecipientsProbability
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasPersonCCRecipientsProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setPersonCCRecipientsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_float personCCRecipientsProbability = a3;
}

- (BOOL)hasPersonToRecipientsProbability
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasPersonToRecipientsProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setPersonToRecipientsProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_float personToRecipientsProbability = a3;
}

- (BOOL)hasSubjectContentProbability
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasSubjectContentProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setSubjectContentProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_float subjectContentProbability = a3;
}

- (BOOL)hasPersonFromSenderInDyadicConversationProbability
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasPersonFromSenderInDyadicConversationProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setPersonFromSenderInDyadicConversationProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float personFromSenderInDyadicConversationProbability = a3;
}

- (BOOL)hasPersonFromSenderProbability
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasPersonFromSenderProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setPersonFromSenderProbability:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float personFromSenderProbability = a3;
}

@end