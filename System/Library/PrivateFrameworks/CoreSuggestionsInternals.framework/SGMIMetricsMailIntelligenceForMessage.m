@interface SGMIMetricsMailIntelligenceForMessage
+ (Class)mailAttachmentHistogramType;
- (BOOL)hasActive;
- (BOOL)hasBackground;
- (BOOL)hasHoursSinceReference;
- (BOOL)hasLang;
- (BOOL)hasLocale;
- (BOOL)hasNbCharactersInMailSubject;
- (BOOL)hasNbTokensInMailSubject;
- (BOOL)hasPreviousInteractionFromUserOnConversationInMinutes;
- (BOOL)hasPreviousInteractionOnConversationInMinutes;
- (BOOL)hasSenderConnectionScore;
- (BOOL)hasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)mailAttachmentHistograms;
- (NSString)lang;
- (NSString)locale;
- (SGMIMetricsInferenceAndGroundTruth)active;
- (SGMIMetricsInferenceAndGroundTruth)background;
- (float)senderConnectionScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mailAttachmentHistogramAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mailAttachmentHistogramsCount;
- (unsigned)hoursSinceReference;
- (unsigned)nbCharactersInMailSubject;
- (unsigned)nbTokensInMailSubject;
- (unsigned)previousInteractionFromUserOnConversationInMinutes;
- (unsigned)previousInteractionOnConversationInMinutes;
- (unsigned)timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
- (void)addMailAttachmentHistogram:(id)a3;
- (void)clearMailAttachmentHistograms;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActive:(id)a3;
- (void)setBackground:(id)a3;
- (void)setHasHoursSinceReference:(BOOL)a3;
- (void)setHasNbCharactersInMailSubject:(BOOL)a3;
- (void)setHasNbTokensInMailSubject:(BOOL)a3;
- (void)setHasPreviousInteractionFromUserOnConversationInMinutes:(BOOL)a3;
- (void)setHasPreviousInteractionOnConversationInMinutes:(BOOL)a3;
- (void)setHasSenderConnectionScore:(BOOL)a3;
- (void)setHasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(BOOL)a3;
- (void)setHoursSinceReference:(unsigned int)a3;
- (void)setLang:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMailAttachmentHistograms:(id)a3;
- (void)setNbCharactersInMailSubject:(unsigned int)a3;
- (void)setNbTokensInMailSubject:(unsigned int)a3;
- (void)setPreviousInteractionFromUserOnConversationInMinutes:(unsigned int)a3;
- (void)setPreviousInteractionOnConversationInMinutes:(unsigned int)a3;
- (void)setSenderConnectionScore:(float)a3;
- (void)setTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsMailIntelligenceForMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAttachmentHistograms, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_active, 0);
}

- (void)setBackground:(id)a3
{
}

- (SGMIMetricsInferenceAndGroundTruth)background
{
  return self->_background;
}

- (void)setActive:(id)a3
{
}

- (SGMIMetricsInferenceAndGroundTruth)active
{
  return self->_active;
}

- (unsigned)previousInteractionFromUserOnConversationInMinutes
{
  return self->_previousInteractionFromUserOnConversationInMinutes;
}

- (unsigned)previousInteractionOnConversationInMinutes
{
  return self->_previousInteractionOnConversationInMinutes;
}

- (unsigned)nbTokensInMailSubject
{
  return self->_nbTokensInMailSubject;
}

- (unsigned)nbCharactersInMailSubject
{
  return self->_nbCharactersInMailSubject;
}

- (void)setMailAttachmentHistograms:(id)a3
{
}

- (NSMutableArray)mailAttachmentHistograms
{
  return self->_mailAttachmentHistograms;
}

- (float)senderConnectionScore
{
  return self->_senderConnectionScore;
}

- (unsigned)timeDifferenceFromReceptionToSaliencyInferenceInSeconds
{
  return self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
}

- (void)setLang:(id)a3
{
}

- (NSString)lang
{
  return self->_lang;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (unsigned)hoursSinceReference
{
  return self->_hoursSinceReference;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if (v4[20])
  {
    self->_hoursSinceReference = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[SGMIMetricsMailIntelligenceForMessage setLocale:](self, "setLocale:");
  }
  if (*((void *)v5 + 4)) {
    -[SGMIMetricsMailIntelligenceForMessage setLang:](self, "setLang:");
  }
  char v6 = *((unsigned char *)v5 + 80);
  if ((v6 & 0x40) != 0)
  {
    self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds = *((_DWORD *)v5 + 19);
    *(unsigned char *)&self->_has |= 0x40u;
    char v6 = *((unsigned char *)v5 + 80);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_senderConnectionScore = *((float *)v5 + 18);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *((id *)v5 + 6);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SGMIMetricsMailIntelligenceForMessage addMailAttachmentHistogram:](self, "addMailAttachmentHistogram:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  char v12 = *((unsigned char *)v5 + 80);
  if ((v12 & 2) != 0)
  {
    self->_nbCharactersInMailSubject = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 2u;
    char v12 = *((unsigned char *)v5 + 80);
    if ((v12 & 4) == 0)
    {
LABEL_20:
      if ((v12 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v5 + 80) & 4) == 0)
  {
    goto LABEL_20;
  }
  self->_nbTokensInMailSubject = *((_DWORD *)v5 + 15);
  *(unsigned char *)&self->_has |= 4u;
  char v12 = *((unsigned char *)v5 + 80);
  if ((v12 & 0x10) == 0)
  {
LABEL_21:
    if ((v12 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_28:
  self->_previousInteractionOnConversationInMinutes = *((_DWORD *)v5 + 17);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v5 + 80) & 8) != 0)
  {
LABEL_22:
    self->_previousInteractionFromUserOnConversationInMinutes = *((_DWORD *)v5 + 16);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_23:
  active = self->_active;
  uint64_t v14 = *((void *)v5 + 1);
  if (active)
  {
    if (v14) {
      -[SGMIMetricsInferenceAndGroundTruth mergeFrom:](active, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[SGMIMetricsMailIntelligenceForMessage setActive:](self, "setActive:");
  }
  background = self->_background;
  uint64_t v16 = *((void *)v5 + 2);
  if (background)
  {
    if (v16) {
      -[SGMIMetricsInferenceAndGroundTruth mergeFrom:](background, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[SGMIMetricsMailIntelligenceForMessage setBackground:](self, "setBackground:");
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_hoursSinceReference;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_locale hash];
  NSUInteger v5 = [(NSString *)self->_lang hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v6 = 2654435761 * self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  float senderConnectionScore = self->_senderConnectionScore;
  float v8 = -senderConnectionScore;
  if (senderConnectionScore >= 0.0) {
    float v8 = self->_senderConnectionScore;
  }
  float v9 = floorf(v8 + 0.5);
  float v10 = (float)(v8 - v9) * 1.8447e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
LABEL_14:
  uint64_t v12 = [(NSMutableArray *)self->_mailAttachmentHistograms hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v13 = 2654435761 * self->_nbCharactersInMailSubject;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_16:
      uint64_t v14 = 2654435761 * self->_nbTokensInMailSubject;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v15 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v16 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v15 = 2654435761 * self->_previousInteractionOnConversationInMinutes;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_previousInteractionFromUserOnConversationInMinutes;
LABEL_23:
  NSUInteger v17 = v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12 ^ v13;
  unint64_t v18 = v14 ^ v15 ^ v16 ^ [(SGMIMetricsInferenceAndGroundTruth *)self->_active hash];
  return v17 ^ v18 ^ [(SGMIMetricsInferenceAndGroundTruth *)self->_background hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_hoursSinceReference != *((_DWORD *)v4 + 6)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_48;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 5) && !-[NSString isEqual:](locale, "isEqual:")) {
    goto LABEL_48;
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](lang, "isEqual:")) {
      goto LABEL_48;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 80);
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x40) == 0
      || self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds != *((_DWORD *)v4 + 19))
    {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x40) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x20) == 0 || self->_senderConnectionScore != *((float *)v4 + 18)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  mailAttachmentHistograms = self->_mailAttachmentHistograms;
  if ((unint64_t)mailAttachmentHistograms | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](mailAttachmentHistograms, "isEqual:"))
    {
LABEL_48:
      char v12 = 0;
      goto LABEL_49;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 80);
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_nbCharactersInMailSubject != *((_DWORD *)v4 + 14)) {
      goto LABEL_48;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_nbTokensInMailSubject != *((_DWORD *)v4 + 15)) {
      goto LABEL_48;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_previousInteractionOnConversationInMinutes != *((_DWORD *)v4 + 17)) {
      goto LABEL_48;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_previousInteractionFromUserOnConversationInMinutes != *((_DWORD *)v4 + 16)) {
      goto LABEL_48;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_48;
  }
  active = self->_active;
  if ((unint64_t)active | *((void *)v4 + 1)
    && !-[SGMIMetricsInferenceAndGroundTruth isEqual:](active, "isEqual:"))
  {
    goto LABEL_48;
  }
  background = self->_background;
  if ((unint64_t)background | *((void *)v4 + 2)) {
    char v12 = -[SGMIMetricsInferenceAndGroundTruth isEqual:](background, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_49:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_hoursSinceReference;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_locale copyWithZone:a3];
  char v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  uint64_t v9 = [(NSString *)self->_lang copyWithZone:a3];
  float v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    *(unsigned char *)(v6 + 80) |= 0x40u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(float *)(v6 + 72) = self->_senderConnectionScore;
    *(unsigned char *)(v6 + 80) |= 0x20u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  char v12 = self->_mailAttachmentHistograms;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        NSUInteger v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v6 addMailAttachmentHistogram:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  char v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_nbCharactersInMailSubject;
    *(unsigned char *)(v6 + 80) |= 2u;
    char v18 = (char)self->_has;
    if ((v18 & 4) == 0)
    {
LABEL_16:
      if ((v18 & 0x10) == 0) {
        goto LABEL_17;
      }
LABEL_22:
      *(_DWORD *)(v6 + 68) = self->_previousInteractionOnConversationInMinutes;
      *(unsigned char *)(v6 + 80) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  *(_DWORD *)(v6 + 60) = self->_nbTokensInMailSubject;
  *(unsigned char *)(v6 + 80) |= 4u;
  char v18 = (char)self->_has;
  if ((v18 & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_17:
  if ((v18 & 8) != 0)
  {
LABEL_18:
    *(_DWORD *)(v6 + 64) = self->_previousInteractionFromUserOnConversationInMinutes;
    *(unsigned char *)(v6 + 80) |= 8u;
  }
LABEL_19:
  id v19 = -[SGMIMetricsInferenceAndGroundTruth copyWithZone:](self->_active, "copyWithZone:", a3, (void)v24);
  long long v20 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v19;

  id v21 = [(SGMIMetricsInferenceAndGroundTruth *)self->_background copyWithZone:a3];
  uint64_t v22 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v21;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_hoursSinceReference;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  char v12 = v4;
  if (self->_locale)
  {
    objc_msgSend(v4, "setLocale:");
    id v4 = v12;
  }
  if (self->_lang)
  {
    objc_msgSend(v12, "setLang:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v4[19] = self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds;
    *((unsigned char *)v4 + 80) |= 0x40u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v4[18] = LODWORD(self->_senderConnectionScore);
    *((unsigned char *)v4 + 80) |= 0x20u;
  }
  if ([(SGMIMetricsMailIntelligenceForMessage *)self mailAttachmentHistogramsCount])
  {
    [v12 clearMailAttachmentHistograms];
    unint64_t v6 = [(SGMIMetricsMailIntelligenceForMessage *)self mailAttachmentHistogramsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SGMIMetricsMailIntelligenceForMessage *)self mailAttachmentHistogramAtIndex:i];
        [v12 addMailAttachmentHistogram:v9];
      }
    }
  }
  char v10 = (char)self->_has;
  unint64_t v11 = v12;
  if ((v10 & 2) != 0)
  {
    v12[14] = self->_nbCharactersInMailSubject;
    *((unsigned char *)v12 + 80) |= 2u;
    char v10 = (char)self->_has;
    if ((v10 & 4) == 0)
    {
LABEL_17:
      if ((v10 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  v12[15] = self->_nbTokensInMailSubject;
  *((unsigned char *)v12 + 80) |= 4u;
  char v10 = (char)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_18:
    if ((v10 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_29:
  v12[17] = self->_previousInteractionOnConversationInMinutes;
  *((unsigned char *)v12 + 80) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_19:
    v12[16] = self->_previousInteractionFromUserOnConversationInMinutes;
    *((unsigned char *)v12 + 80) |= 8u;
  }
LABEL_20:
  if (self->_active)
  {
    objc_msgSend(v12, "setActive:");
    unint64_t v11 = v12;
  }
  if (self->_background)
  {
    objc_msgSend(v12, "setBackground:");
    unint64_t v11 = v12;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (self->_lang) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteFloatField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v6 = self->_mailAttachmentHistograms;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v11 = (char)self->_has;
    if ((v11 & 4) == 0)
    {
LABEL_20:
      if ((v11 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  char v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_21:
    if ((v11 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_22:
  }
    PBDataWriterWriteUint32Field();
LABEL_23:
  if (self->_active) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_background) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsMailIntelligenceForMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_hoursSinceReference];
    [v3 setObject:v5 forKey:@"hoursSinceReference"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  lang = self->_lang;
  if (lang) {
    [v3 setObject:lang forKey:@"lang"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInt:self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds];
    [v3 setObject:v9 forKey:@"timeDifferenceFromReceptionToSaliencyInferenceInSeconds"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(float *)&double v4 = self->_senderConnectionScore;
    char v10 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v10 forKey:@"senderConnectionScore"];
  }
  if ([(NSMutableArray *)self->_mailAttachmentHistograms count])
  {
    char v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_mailAttachmentHistograms, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v12 = self->_mailAttachmentHistograms;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"mailAttachmentHistogram"];
  }
  char v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    long long v25 = [NSNumber numberWithUnsignedInt:self->_nbCharactersInMailSubject];
    [v3 setObject:v25 forKey:@"nbCharactersInMailSubject"];

    char v18 = (char)self->_has;
    if ((v18 & 4) == 0)
    {
LABEL_22:
      if ((v18 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_22;
  }
  long long v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_nbTokensInMailSubject, (void)v28);
  [v3 setObject:v26 forKey:@"nbTokensInMailSubject"];

  char v18 = (char)self->_has;
  if ((v18 & 0x10) == 0)
  {
LABEL_23:
    if ((v18 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_34:
  long long v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_previousInteractionOnConversationInMinutes, (void)v28);
  [v3 setObject:v27 forKey:@"previousInteractionOnConversationInMinutes"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_24:
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_previousInteractionFromUserOnConversationInMinutes, (void)v28);
    [v3 setObject:v19 forKey:@"previousInteractionFromUserOnConversationInMinutes"];
  }
LABEL_25:
  active = self->_active;
  if (active)
  {
    id v21 = [(SGMIMetricsInferenceAndGroundTruth *)active dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"active"];
  }
  background = self->_background;
  if (background)
  {
    v23 = [(SGMIMetricsInferenceAndGroundTruth *)background dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"background"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsMailIntelligenceForMessage;
  double v4 = [(SGMIMetricsMailIntelligenceForMessage *)&v8 description];
  uint64_t v5 = [(SGMIMetricsMailIntelligenceForMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBackground
{
  return self->_background != 0;
}

- (BOOL)hasActive
{
  return self->_active != 0;
}

- (BOOL)hasPreviousInteractionFromUserOnConversationInMinutes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPreviousInteractionFromUserOnConversationInMinutes:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPreviousInteractionFromUserOnConversationInMinutes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_previousInteractionFromUserOnConversationInMinutes = a3;
}

- (BOOL)hasPreviousInteractionOnConversationInMinutes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasPreviousInteractionOnConversationInMinutes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setPreviousInteractionOnConversationInMinutes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_previousInteractionOnConversationInMinutes = a3;
}

- (BOOL)hasNbTokensInMailSubject
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNbTokensInMailSubject:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNbTokensInMailSubject:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nbTokensInMailSubject = a3;
}

- (BOOL)hasNbCharactersInMailSubject
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNbCharactersInMailSubject:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNbCharactersInMailSubject:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_nbCharactersInMailSubject = a3;
}

- (id)mailAttachmentHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mailAttachmentHistograms objectAtIndex:a3];
}

- (unint64_t)mailAttachmentHistogramsCount
{
  return [(NSMutableArray *)self->_mailAttachmentHistograms count];
}

- (void)addMailAttachmentHistogram:(id)a3
{
  id v4 = a3;
  mailAttachmentHistograms = self->_mailAttachmentHistograms;
  id v8 = v4;
  if (!mailAttachmentHistograms)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_mailAttachmentHistograms;
    self->_mailAttachmentHistograms = v6;

    id v4 = v8;
    mailAttachmentHistograms = self->_mailAttachmentHistograms;
  }
  [(NSMutableArray *)mailAttachmentHistograms addObject:v4];
}

- (void)clearMailAttachmentHistograms
{
}

- (BOOL)hasSenderConnectionScore
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasSenderConnectionScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setSenderConnectionScore:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float senderConnectionScore = a3;
}

- (BOOL)hasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setTimeDifferenceFromReceptionToSaliencyInferenceInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_timeDifferenceFromReceptionToSaliencyInferenceInSeconds = a3;
}

- (BOOL)hasLang
{
  return self->_lang != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasHoursSinceReference
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHoursSinceReference:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHoursSinceReference:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hoursSinceReference = a3;
}

+ (Class)mailAttachmentHistogramType
{
  return (Class)objc_opt_class();
}

@end