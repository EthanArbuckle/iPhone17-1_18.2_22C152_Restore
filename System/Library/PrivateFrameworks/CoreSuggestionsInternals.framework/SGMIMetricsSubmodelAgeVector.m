@interface SGMIMetricsSubmodelAgeVector
- (BOOL)hasConversationAge;
- (BOOL)hasDomainFromSenderAge;
- (BOOL)hasPersonCCRecipientsAge;
- (BOOL)hasPersonFromSenderAge;
- (BOOL)hasPersonFromSenderInDyadicConversationAge;
- (BOOL)hasPersonToRecipientsAge;
- (BOOL)hasSubjectContentAge;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)conversationAge;
- (float)domainFromSenderAge;
- (float)personCCRecipientsAge;
- (float)personFromSenderAge;
- (float)personFromSenderInDyadicConversationAge;
- (float)personToRecipientsAge;
- (float)subjectContentAge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationAge:(float)a3;
- (void)setDomainFromSenderAge:(float)a3;
- (void)setHasConversationAge:(BOOL)a3;
- (void)setHasDomainFromSenderAge:(BOOL)a3;
- (void)setHasPersonCCRecipientsAge:(BOOL)a3;
- (void)setHasPersonFromSenderAge:(BOOL)a3;
- (void)setHasPersonFromSenderInDyadicConversationAge:(BOOL)a3;
- (void)setHasPersonToRecipientsAge:(BOOL)a3;
- (void)setHasSubjectContentAge:(BOOL)a3;
- (void)setPersonCCRecipientsAge:(float)a3;
- (void)setPersonFromSenderAge:(float)a3;
- (void)setPersonFromSenderInDyadicConversationAge:(float)a3;
- (void)setPersonToRecipientsAge:(float)a3;
- (void)setSubjectContentAge:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsSubmodelAgeVector

- (float)conversationAge
{
  return self->_conversationAge;
}

- (float)domainFromSenderAge
{
  return self->_domainFromSenderAge;
}

- (float)personCCRecipientsAge
{
  return self->_personCCRecipientsAge;
}

- (float)personToRecipientsAge
{
  return self->_personToRecipientsAge;
}

- (float)subjectContentAge
{
  return self->_subjectContentAge;
}

- (float)personFromSenderInDyadicConversationAge
{
  return self->_personFromSenderInDyadicConversationAge;
}

- (float)personFromSenderAge
{
  return self->_personFromSenderAge;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_personFromSenderAge = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_personFromSenderInDyadicConversationAge = *((float *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_subjectContentAge = *((float *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_personToRecipientsAge = *((float *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_personCCRecipientsAge = *((float *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_domainFromSenderAge = *((float *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_8:
    self->_conversationAge = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float personFromSenderAge = self->_personFromSenderAge;
    float v6 = -personFromSenderAge;
    if (personFromSenderAge >= 0.0) {
      float v6 = self->_personFromSenderAge;
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
  if ((has & 0x10) != 0)
  {
    float personFromSenderInDyadicConversationAge = self->_personFromSenderInDyadicConversationAge;
    float v11 = -personFromSenderInDyadicConversationAge;
    if (personFromSenderInDyadicConversationAge >= 0.0) {
      float v11 = self->_personFromSenderInDyadicConversationAge;
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
  if ((has & 0x40) != 0)
  {
    float subjectContentAge = self->_subjectContentAge;
    float v16 = -subjectContentAge;
    if (subjectContentAge >= 0.0) {
      float v16 = self->_subjectContentAge;
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
  if ((has & 0x20) != 0)
  {
    float personToRecipientsAge = self->_personToRecipientsAge;
    float v21 = -personToRecipientsAge;
    if (personToRecipientsAge >= 0.0) {
      float v21 = self->_personToRecipientsAge;
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
  if ((has & 4) != 0)
  {
    float personCCRecipientsAge = self->_personCCRecipientsAge;
    float v26 = -personCCRecipientsAge;
    if (personCCRecipientsAge >= 0.0) {
      float v26 = self->_personCCRecipientsAge;
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
  if ((has & 2) != 0)
  {
    float domainFromSenderAge = self->_domainFromSenderAge;
    float v31 = -domainFromSenderAge;
    if (domainFromSenderAge >= 0.0) {
      float v31 = self->_domainFromSenderAge;
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
  if (has)
  {
    float conversationAge = self->_conversationAge;
    float v36 = -conversationAge;
    if (conversationAge >= 0.0) {
      float v36 = self->_conversationAge;
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
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_personFromSenderAge != *((float *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_36:
    BOOL v5 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_personFromSenderInDyadicConversationAge != *((float *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0 || self->_subjectContentAge != *((float *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_personToRecipientsAge != *((float *)v4 + 7)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_personCCRecipientsAge != *((float *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_domainFromSenderAge != *((float *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_36;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_conversationAge != *((float *)v4 + 2)) {
      goto LABEL_36;
    }
    BOOL v5 = 1;
  }
LABEL_37:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_personFromSenderAge);
    *((unsigned char *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = LODWORD(self->_personFromSenderInDyadicConversationAge);
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 8) = LODWORD(self->_subjectContentAge);
  *((unsigned char *)result + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = LODWORD(self->_personToRecipientsAge);
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 4) = LODWORD(self->_personCCRecipientsAge);
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 3) = LODWORD(self->_domainFromSenderAge);
  *((unsigned char *)result + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 2) = LODWORD(self->_conversationAge);
  *((unsigned char *)result + 36) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = LODWORD(self->_personFromSenderAge);
    *((unsigned char *)v4 + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = LODWORD(self->_personFromSenderInDyadicConversationAge);
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[8] = LODWORD(self->_subjectContentAge);
  *((unsigned char *)v4 + 36) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[7] = LODWORD(self->_personToRecipientsAge);
  *((unsigned char *)v4 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[4] = LODWORD(self->_personCCRecipientsAge);
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[3] = LODWORD(self->_domainFromSenderAge);
  *((unsigned char *)v4 + 36) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    v4[2] = LODWORD(self->_conversationAge);
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_9:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteFloatField();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelAgeVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_personFromSenderAge;
    float v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"personFromSenderAge"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_personFromSenderInDyadicConversationAge;
  unint64_t v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"personFromSenderInDyadicConversationAge"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(float *)&double v4 = self->_subjectContentAge;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"subjectContentAge"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(float *)&double v4 = self->_personToRecipientsAge;
  float v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"personToRecipientsAge"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(float *)&double v4 = self->_personCCRecipientsAge;
  float v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"personCCRecipientsAge"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *(float *)&double v4 = self->_domainFromSenderAge;
  float v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"domainFromSenderAge"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *(float *)&double v4 = self->_conversationAge;
    float v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"conversationAge"];
  }
LABEL_9:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsSubmodelAgeVector;
  double v4 = [(SGMIMetricsSubmodelAgeVector *)&v8 description];
  id v5 = [(SGMIMetricsSubmodelAgeVector *)self dictionaryRepresentation];
  float v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasConversationAge
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConversationAge:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConversationAge:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float conversationAge = a3;
}

- (BOOL)hasDomainFromSenderAge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDomainFromSenderAge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDomainFromSenderAge:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float domainFromSenderAge = a3;
}

- (BOOL)hasPersonCCRecipientsAge
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPersonCCRecipientsAge:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPersonCCRecipientsAge:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float personCCRecipientsAge = a3;
}

- (BOOL)hasPersonToRecipientsAge
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasPersonToRecipientsAge:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setPersonToRecipientsAge:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float personToRecipientsAge = a3;
}

- (BOOL)hasSubjectContentAge
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasSubjectContentAge:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setSubjectContentAge:(float)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_float subjectContentAge = a3;
}

- (BOOL)hasPersonFromSenderInDyadicConversationAge
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasPersonFromSenderInDyadicConversationAge:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setPersonFromSenderInDyadicConversationAge:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float personFromSenderInDyadicConversationAge = a3;
}

- (BOOL)hasPersonFromSenderAge
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPersonFromSenderAge:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPersonFromSenderAge:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float personFromSenderAge = a3;
}

@end