@interface SGM2NLEventInBanner
- (BOOL)hasActionType;
- (BOOL)hasAddedAttendeesCount;
- (BOOL)hasCalendarAppUsageLevel;
- (BOOL)hasConfidenceScore;
- (BOOL)hasDateAdj;
- (BOOL)hasDaysFromStartDate;
- (BOOL)hasDuraAdj;
- (BOOL)hasEventType;
- (BOOL)hasExtractionLevel;
- (BOOL)hasInterface;
- (BOOL)hasKey;
- (BOOL)hasLanguageID;
- (BOOL)hasLocationAdj;
- (BOOL)hasMailAppUsageLevel;
- (BOOL)hasMessagesAppUsageLevel;
- (BOOL)hasParticipantCount;
- (BOOL)hasSignificantSender;
- (BOOL)hasTitleAdj;
- (BOOL)hasTitleSource;
- (BOOL)hasUsedBubblesCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)addedAttendeesCount;
- (NSString)calendarAppUsageLevel;
- (NSString)eventType;
- (NSString)key;
- (NSString)languageID;
- (id)actionTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateAdjAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)duraAdjAsString:(int)a3;
- (id)extractionLevelAsString:(int)a3;
- (id)interfaceAsString:(int)a3;
- (id)locationAdjAsString:(int)a3;
- (id)mailAppUsageLevelAsString:(int)a3;
- (id)messagesAppUsageLevelAsString:(int)a3;
- (id)significantSenderAsString:(int)a3;
- (id)titleAdjAsString:(int)a3;
- (id)titleSourceAsString:(int)a3;
- (int)StringAsActionType:(id)a3;
- (int)StringAsDateAdj:(id)a3;
- (int)StringAsDuraAdj:(id)a3;
- (int)StringAsExtractionLevel:(id)a3;
- (int)StringAsInterface:(id)a3;
- (int)StringAsLocationAdj:(id)a3;
- (int)StringAsMailAppUsageLevel:(id)a3;
- (int)StringAsMessagesAppUsageLevel:(id)a3;
- (int)StringAsSignificantSender:(id)a3;
- (int)StringAsTitleAdj:(id)a3;
- (int)StringAsTitleSource:(id)a3;
- (int)actionType;
- (int)dateAdj;
- (int)duraAdj;
- (int)extractionLevel;
- (int)interface;
- (int)locationAdj;
- (int)mailAppUsageLevel;
- (int)messagesAppUsageLevel;
- (int)significantSender;
- (int)titleAdj;
- (int)titleSource;
- (unint64_t)hash;
- (unsigned)confidenceScore;
- (unsigned)daysFromStartDate;
- (unsigned)participantCount;
- (unsigned)usedBubblesCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionType:(int)a3;
- (void)setAddedAttendeesCount:(id)a3;
- (void)setCalendarAppUsageLevel:(id)a3;
- (void)setConfidenceScore:(unsigned int)a3;
- (void)setDateAdj:(int)a3;
- (void)setDaysFromStartDate:(unsigned int)a3;
- (void)setDuraAdj:(int)a3;
- (void)setEventType:(id)a3;
- (void)setExtractionLevel:(int)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasDateAdj:(BOOL)a3;
- (void)setHasDaysFromStartDate:(BOOL)a3;
- (void)setHasDuraAdj:(BOOL)a3;
- (void)setHasExtractionLevel:(BOOL)a3;
- (void)setHasInterface:(BOOL)a3;
- (void)setHasLocationAdj:(BOOL)a3;
- (void)setHasMailAppUsageLevel:(BOOL)a3;
- (void)setHasMessagesAppUsageLevel:(BOOL)a3;
- (void)setHasParticipantCount:(BOOL)a3;
- (void)setHasSignificantSender:(BOOL)a3;
- (void)setHasTitleAdj:(BOOL)a3;
- (void)setHasTitleSource:(BOOL)a3;
- (void)setHasUsedBubblesCount:(BOOL)a3;
- (void)setInterface:(int)a3;
- (void)setKey:(id)a3;
- (void)setLanguageID:(id)a3;
- (void)setLocationAdj:(int)a3;
- (void)setMailAppUsageLevel:(int)a3;
- (void)setMessagesAppUsageLevel:(int)a3;
- (void)setParticipantCount:(unsigned int)a3;
- (void)setSignificantSender:(int)a3;
- (void)setTitleAdj:(int)a3;
- (void)setTitleSource:(int)a3;
- (void)setUsedBubblesCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2NLEventInBanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_calendarAppUsageLevel, 0);

  objc_storeStrong((id *)&self->_addedAttendeesCount, 0);
}

- (void)setCalendarAppUsageLevel:(id)a3
{
}

- (NSString)calendarAppUsageLevel
{
  return self->_calendarAppUsageLevel;
}

- (void)setAddedAttendeesCount:(id)a3
{
}

- (NSString)addedAttendeesCount
{
  return self->_addedAttendeesCount;
}

- (unsigned)usedBubblesCount
{
  return self->_usedBubblesCount;
}

- (unsigned)participantCount
{
  return self->_participantCount;
}

- (unsigned)confidenceScore
{
  return self->_confidenceScore;
}

- (unsigned)daysFromStartDate
{
  return self->_daysFromStartDate;
}

- (void)setLanguageID:(id)a3
{
}

- (NSString)languageID
{
  return self->_languageID;
}

- (void)setEventType:(id)a3
{
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 8))
  {
    -[SGM2NLEventInBanner setKey:](self, "setKey:");
    id v4 = v8;
  }
  __int16 v5 = *((_WORD *)v4 + 56);
  if ((v5 & 0x40) != 0)
  {
    self->_interface = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v5 = *((_WORD *)v4 + 56);
  }
  if (v5)
  {
    self->_actionType = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[SGM2NLEventInBanner setEventType:](self, "setEventType:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[SGM2NLEventInBanner setLanguageID:](self, "setLanguageID:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 8) != 0)
  {
    self->_daysFromStartDate = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 56);
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_confidenceScore = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_significantSender = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_participantCount = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_extractionLevel = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_usedBubblesCount = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_titleSource = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_titleAdj = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_dateAdj = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 56);
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_43:
  self->_duraAdj = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 56) & 0x80) != 0)
  {
LABEL_22:
    self->_locationAdj = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_23:
  if (*((void *)v4 + 2))
  {
    -[SGM2NLEventInBanner setAddedAttendeesCount:](self, "setAddedAttendeesCount:");
    id v4 = v8;
  }
  if (*((void *)v4 + 3))
  {
    -[SGM2NLEventInBanner setCalendarAppUsageLevel:](self, "setCalendarAppUsageLevel:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((v7 & 0x100) != 0)
  {
    self->_mailAppUsageLevel = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v7 = *((_WORD *)v4 + 56);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_messagesAppUsageLevel = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x200u;
  }
}

- (unint64_t)hash
{
  NSUInteger v26 = [(NSString *)self->_key hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v25 = 2654435761 * self->_interface;
    if (has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if (has)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_actionType;
      goto LABEL_6;
    }
  }
  uint64_t v24 = 0;
LABEL_6:
  NSUInteger v23 = [(NSString *)self->_eventType hash];
  NSUInteger v22 = [(NSString *)self->_languageID hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 8) != 0)
  {
    uint64_t v21 = 2654435761 * self->_daysFromStartDate;
    if ((v4 & 2) != 0)
    {
LABEL_8:
      uint64_t v20 = 2654435761 * self->_confidenceScore;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_9;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((v4 & 2) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    uint64_t v19 = 2654435761 * self->_significantSender;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v18 = 2654435761 * self->_participantCount;
    if ((v4 & 0x20) != 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v18 = 0;
  if ((v4 & 0x20) != 0)
  {
LABEL_11:
    uint64_t v16 = 2654435761 * self->_extractionLevel;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v16 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    uint64_t v5 = 2654435761 * self->_usedBubblesCount;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_13:
    uint64_t v6 = 2654435761 * self->_titleSource;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v7 = 2654435761 * self->_titleAdj;
    if ((v4 & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v7 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_15:
    uint64_t v8 = 2654435761 * self->_dateAdj;
    if ((v4 & 0x10) != 0) {
      goto LABEL_16;
    }
LABEL_27:
    uint64_t v9 = 0;
    if ((v4 & 0x80) != 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v8 = 0;
  if ((v4 & 0x10) == 0) {
    goto LABEL_27;
  }
LABEL_16:
  uint64_t v9 = 2654435761 * self->_duraAdj;
  if ((v4 & 0x80) != 0)
  {
LABEL_17:
    uint64_t v10 = 2654435761 * self->_locationAdj;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v10 = 0;
LABEL_29:
  NSUInteger v11 = [(NSString *)self->_addedAttendeesCount hash];
  NSUInteger v12 = [(NSString *)self->_calendarAppUsageLevel hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v13 = 2654435761 * self->_mailAppUsageLevel;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_31;
    }
LABEL_33:
    uint64_t v14 = 0;
    return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v14 = 2654435761 * self->_messagesAppUsageLevel;
  return v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_87;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_87;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 56);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_interface != *((_DWORD *)v4 + 15)) {
      goto LABEL_87;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
LABEL_87:
    BOOL v14 = 0;
    goto LABEL_88;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_actionType != *((_DWORD *)v4 + 2)) {
      goto LABEL_87;
    }
  }
  else if (v7)
  {
    goto LABEL_87;
  }
  eventType = self->_eventType;
  if ((unint64_t)eventType | *((void *)v4 + 6) && !-[NSString isEqual:](eventType, "isEqual:")) {
    goto LABEL_87;
  }
  languageID = self->_languageID;
  if ((unint64_t)languageID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](languageID, "isEqual:")) {
      goto LABEL_87;
    }
  }
  __int16 v10 = (__int16)self->_has;
  __int16 v11 = *((_WORD *)v4 + 56);
  if ((v10 & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_daysFromStartDate != *((_DWORD *)v4 + 10)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_confidenceScore != *((_DWORD *)v4 + 8)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x800) == 0 || self->_significantSender != *((_DWORD *)v4 + 24)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x800) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x400) == 0 || self->_participantCount != *((_DWORD *)v4 + 23)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_extractionLevel != *((_DWORD *)v4 + 14)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x4000) == 0 || self->_usedBubblesCount != *((_DWORD *)v4 + 27)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x4000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x2000) == 0 || self->_titleSource != *((_DWORD *)v4 + 26)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x2000) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x1000) == 0 || self->_titleAdj != *((_DWORD *)v4 + 25)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x1000) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_dateAdj != *((_DWORD *)v4 + 9)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_duraAdj != *((_DWORD *)v4 + 11)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  if ((v10 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_locationAdj != *((_DWORD *)v4 + 20)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  addedAttendeesCount = self->_addedAttendeesCount;
  if ((unint64_t)addedAttendeesCount | *((void *)v4 + 2)
    && !-[NSString isEqual:](addedAttendeesCount, "isEqual:"))
  {
    goto LABEL_87;
  }
  calendarAppUsageLevel = self->_calendarAppUsageLevel;
  if ((unint64_t)calendarAppUsageLevel | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](calendarAppUsageLevel, "isEqual:")) {
      goto LABEL_87;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x100) == 0 || self->_mailAppUsageLevel != *((_DWORD *)v4 + 21)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 56) & 0x100) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 56) & 0x200) == 0 || self->_messagesAppUsageLevel != *((_DWORD *)v4 + 22)) {
      goto LABEL_87;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = (*((_WORD *)v4 + 56) & 0x200) == 0;
  }
LABEL_88:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_interface;
    *(_WORD *)(v5 + 112) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_actionType;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_eventType copyWithZone:a3];
  __int16 v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_languageID copyWithZone:a3];
  NSUInteger v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_daysFromStartDate;
    *(_WORD *)(v5 + 112) |= 8u;
    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_7:
      if ((v13 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 32) = self->_confidenceScore;
  *(_WORD *)(v5 + 112) |= 2u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_8:
    if ((v13 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 96) = self->_significantSender;
  *(_WORD *)(v5 + 112) |= 0x800u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_9:
    if ((v13 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 92) = self->_participantCount;
  *(_WORD *)(v5 + 112) |= 0x400u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_10:
    if ((v13 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 56) = self->_extractionLevel;
  *(_WORD *)(v5 + 112) |= 0x20u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x4000) == 0)
  {
LABEL_11:
    if ((v13 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 108) = self->_usedBubblesCount;
  *(_WORD *)(v5 + 112) |= 0x4000u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x2000) == 0)
  {
LABEL_12:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 104) = self->_titleSource;
  *(_WORD *)(v5 + 112) |= 0x2000u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_13:
    if ((v13 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 100) = self->_titleAdj;
  *(_WORD *)(v5 + 112) |= 0x1000u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_14:
    if ((v13 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 36) = self->_dateAdj;
  *(_WORD *)(v5 + 112) |= 4u;
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_15:
    if ((v13 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_31:
  *(_DWORD *)(v5 + 44) = self->_duraAdj;
  *(_WORD *)(v5 + 112) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 80) = self->_locationAdj;
    *(_WORD *)(v5 + 112) |= 0x80u;
  }
LABEL_17:
  uint64_t v14 = [(NSString *)self->_addedAttendeesCount copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  uint64_t v16 = [(NSString *)self->_calendarAppUsageLevel copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_mailAppUsageLevel;
    *(_WORD *)(v5 + 112) |= 0x100u;
    __int16 v18 = (__int16)self->_has;
  }
  if ((v18 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_messagesAppUsageLevel;
    *(_WORD *)(v5 + 112) |= 0x200u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_interface;
    *((_WORD *)v4 + 56) |= 0x40u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_actionType;
    *((_WORD *)v4 + 56) |= 1u;
  }
  if (self->_eventType)
  {
    objc_msgSend(v8, "setEventType:");
    id v4 = v8;
  }
  if (self->_languageID)
  {
    objc_msgSend(v8, "setLanguageID:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_daysFromStartDate;
    *((_WORD *)v4 + 56) |= 8u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 8) = self->_confidenceScore;
  *((_WORD *)v4 + 56) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 24) = self->_significantSender;
  *((_WORD *)v4 + 56) |= 0x800u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 23) = self->_participantCount;
  *((_WORD *)v4 + 56) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 14) = self->_extractionLevel;
  *((_WORD *)v4 + 56) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 27) = self->_usedBubblesCount;
  *((_WORD *)v4 + 56) |= 0x4000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 26) = self->_titleSource;
  *((_WORD *)v4 + 56) |= 0x2000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 25) = self->_titleAdj;
  *((_WORD *)v4 + 56) |= 0x1000u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 9) = self->_dateAdj;
  *((_WORD *)v4 + 56) |= 4u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_43:
  *((_DWORD *)v4 + 11) = self->_duraAdj;
  *((_WORD *)v4 + 56) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_22:
    *((_DWORD *)v4 + 20) = self->_locationAdj;
    *((_WORD *)v4 + 56) |= 0x80u;
  }
LABEL_23:
  if (self->_addedAttendeesCount)
  {
    objc_msgSend(v8, "setAddedAttendeesCount:");
    id v4 = v8;
  }
  if (self->_calendarAppUsageLevel)
  {
    objc_msgSend(v8, "setCalendarAppUsageLevel:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_mailAppUsageLevel;
    *((_WORD *)v4 + 56) |= 0x100u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_messagesAppUsageLevel;
    *((_WORD *)v4 + 56) |= 0x200u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_eventType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_languageID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_14:
    if ((v6 & 0x400) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) == 0)
  {
LABEL_15:
    if ((v6 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_16:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x2000) == 0)
  {
LABEL_18:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_19:
    if ((v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
LABEL_23:
  if (self->_addedAttendeesCount)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_calendarAppUsageLevel)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2NLEventInBannerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t interface = self->_interface;
    if (interface >= 0x14)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_interface);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = off_1E5B8E580[interface];
    }
    [v4 setObject:v8 forKey:@"interface"];

    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    uint64_t actionType = self->_actionType;
    if (actionType >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_actionType);
      __int16 v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      __int16 v10 = off_1E5B8E620[actionType];
    }
    [v4 setObject:v10 forKey:@"actionType"];
  }
  eventType = self->_eventType;
  if (eventType) {
    [v4 setObject:eventType forKey:@"eventType"];
  }
  languageID = self->_languageID;
  if (languageID) {
    [v4 setObject:languageID forKey:@"languageID"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 8) != 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:self->_daysFromStartDate];
    [v4 setObject:v14 forKey:@"daysFromStartDate"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_19:
      if ((v13 & 0x800) == 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_19;
  }
  v15 = [NSNumber numberWithUnsignedInt:self->_confidenceScore];
  [v4 setObject:v15 forKey:@"confidenceScore"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) == 0)
  {
LABEL_20:
    if ((v13 & 0x400) == 0) {
      goto LABEL_21;
    }
    goto LABEL_35;
  }
LABEL_31:
  uint64_t significantSender = self->_significantSender;
  if (significantSender >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_significantSender);
    uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = off_1E5B8E668[significantSender];
  }
  [v4 setObject:v17 forKey:@"significantSender"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x400) == 0)
  {
LABEL_21:
    if ((v13 & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_36;
  }
LABEL_35:
  __int16 v18 = [NSNumber numberWithUnsignedInt:self->_participantCount];
  [v4 setObject:v18 forKey:@"participantCount"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) == 0)
  {
LABEL_22:
    if ((v13 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_40;
  }
LABEL_36:
  uint64_t extractionLevel = self->_extractionLevel;
  if (extractionLevel >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extractionLevel);
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v20 = off_1E5B8E680[extractionLevel];
  }
  [v4 setObject:v20 forKey:@"extractionLevel"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x4000) == 0)
  {
LABEL_23:
    if ((v13 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v21 = [NSNumber numberWithUnsignedInt:self->_usedBubblesCount];
  [v4 setObject:v21 forKey:@"usedBubblesCount"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x2000) == 0)
  {
LABEL_24:
    if ((v13 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_45;
  }
LABEL_41:
  uint64_t titleSource = self->_titleSource;
  if (titleSource >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_titleSource);
    NSUInteger v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v23 = off_1E5B8E6B0[titleSource];
  }
  [v4 setObject:v23 forKey:@"titleSource"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x1000) == 0)
  {
LABEL_25:
    if ((v13 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_49;
  }
LABEL_45:
  uint64_t titleAdj = self->_titleAdj;
  if (titleAdj >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_titleAdj);
    uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v25 = off_1E5B8E6D0[titleAdj];
  }
  [v4 setObject:v25 forKey:@"titleAdj"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) == 0)
  {
LABEL_26:
    if ((v13 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
LABEL_49:
  uint64_t dateAdj = self->_dateAdj;
  if (dateAdj >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dateAdj);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = off_1E5B8E6F8[dateAdj];
  }
  [v4 setObject:v27 forKey:@"dateAdj"];

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) == 0)
  {
LABEL_27:
    if ((v13 & 0x80) == 0) {
      goto LABEL_61;
    }
    goto LABEL_57;
  }
LABEL_53:
  uint64_t duraAdj = self->_duraAdj;
  if (duraAdj >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_duraAdj);
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = off_1E5B8E748[duraAdj];
  }
  [v4 setObject:v29 forKey:@"duraAdj"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_57:
    uint64_t locationAdj = self->_locationAdj;
    if (locationAdj >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_locationAdj);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E5B8E778[locationAdj];
    }
    [v4 setObject:v31 forKey:@"locationAdj"];
  }
LABEL_61:
  addedAttendeesCount = self->_addedAttendeesCount;
  if (addedAttendeesCount) {
    [v4 setObject:addedAttendeesCount forKey:@"addedAttendeesCount"];
  }
  calendarAppUsageLevel = self->_calendarAppUsageLevel;
  if (calendarAppUsageLevel) {
    [v4 setObject:calendarAppUsageLevel forKey:@"calendarAppUsageLevel"];
  }
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x100) != 0)
  {
    uint64_t mailAppUsageLevel = self->_mailAppUsageLevel;
    if (mailAppUsageLevel >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mailAppUsageLevel);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_1E5B8E7A0[mailAppUsageLevel];
    }
    [v4 setObject:v36 forKey:@"mailAppUsageLevel"];

    __int16 v34 = (__int16)self->_has;
  }
  if ((v34 & 0x200) != 0)
  {
    uint64_t messagesAppUsageLevel = self->_messagesAppUsageLevel;
    if (messagesAppUsageLevel >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messagesAppUsageLevel);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E5B8E7A0[messagesAppUsageLevel];
    }
    [v4 setObject:v38 forKey:@"messagesAppUsageLevel"];
  }
  id v39 = v4;

  return v39;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2NLEventInBanner;
  id v4 = [(SGM2NLEventInBanner *)&v8 description];
  uint64_t v5 = [(SGM2NLEventInBanner *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsMessagesAppUsageLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMAppUsageLevelNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelLow"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelMedium"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelHigh"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)messagesAppUsageLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E7A0[a3];
  }

  return v3;
}

- (BOOL)hasMessagesAppUsageLevel
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasMessagesAppUsageLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setMessagesAppUsageLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_uint64_t messagesAppUsageLevel = a3;
}

- (int)messagesAppUsageLevel
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_messagesAppUsageLevel;
  }
  else {
    return 0;
  }
}

- (int)StringAsMailAppUsageLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMAppUsageLevelNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelLow"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelMedium"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMAppUsageLevelHigh"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)mailAppUsageLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E7A0[a3];
  }

  return v3;
}

- (BOOL)hasMailAppUsageLevel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasMailAppUsageLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setMailAppUsageLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_uint64_t mailAppUsageLevel = a3;
}

- (int)mailAppUsageLevel
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_mailAppUsageLevel;
  }
  else {
    return 0;
  }
}

- (BOOL)hasCalendarAppUsageLevel
{
  return self->_calendarAppUsageLevel != 0;
}

- (BOOL)hasAddedAttendeesCount
{
  return self->_addedAttendeesCount != 0;
}

- (int)StringAsLocationAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventLocationAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventLocationAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventLocationAdjModified"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventLocationAdjAdded"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventLocationAdjRemoved"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)locationAdjAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E778[a3];
  }

  return v3;
}

- (BOOL)hasLocationAdj
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasLocationAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setLocationAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_uint64_t locationAdj = a3;
}

- (int)locationAdj
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_locationAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsDuraAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventDurationAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjLessThan30Min"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdj30To60Min"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdj1To2Hours"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjMoreThan2Hours"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)duraAdjAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E748[a3];
  }

  return v3;
}

- (BOOL)hasDuraAdj
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasDuraAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setDuraAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uint64_t duraAdj = a3;
}

- (int)duraAdj
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_duraAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsDateAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventDateAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjChangedDay"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime2hPlus"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime2h"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime1h"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime1h"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime2h"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime2hPlus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjChangedDayAndTime"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dateAdjAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E6F8[a3];
  }

  return v3;
}

- (BOOL)hasDateAdj
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasDateAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setDateAdj:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uint64_t dateAdj = a3;
}

- (int)dateAdj
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_dateAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsTitleAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventStringAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjPrefixAdded"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjSuffixAdded"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjReplaced"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)titleAdjAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E6D0[a3];
  }

  return v3;
}

- (BOOL)hasTitleAdj
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setHasTitleAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (void)setTitleAdj:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_uint64_t titleAdj = a3;
}

- (int)titleAdj
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    return self->_titleAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsTitleSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventTitleSourceNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventTitleSourceSubject"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventTitleSourceTemplate"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventTitleSourceMLModel"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)titleSourceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E6B0[a3];
  }

  return v3;
}

- (BOOL)hasTitleSource
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setHasTitleSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (void)setTitleSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_uint64_t titleSource = a3;
}

- (int)titleSource
{
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    return self->_titleSource;
  }
  else {
    return 0;
  }
}

- (BOOL)hasUsedBubblesCount
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasUsedBubblesCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (void)setUsedBubblesCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_usedBubblesCount = a3;
}

- (int)StringAsExtractionLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMNLEventExtractionLevelNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMNLEventExtractionLevelFullEvent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMNLEventExtractionLevelTypeOnly"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMNLEventExtractionLevelNone"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMNLEventExtractionLevelFullEventWithTitleGeneration"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMNLEventExtractionLevelTypeOnlyWithTitleGeneration"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)extractionLevelAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E680[a3];
  }

  return v3;
}

- (BOOL)hasExtractionLevel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasExtractionLevel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setExtractionLevel:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_uint64_t extractionLevel = a3;
}

- (int)extractionLevel
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_extractionLevel;
  }
  else {
    return 0;
  }
}

- (BOOL)hasParticipantCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasParticipantCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setParticipantCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_participantCount = a3;
}

- (int)StringAsSignificantSender:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMBoolOptionFalse"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMBoolOptionTrue"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMBoolOptionNA"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)significantSenderAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E668[a3];
  }

  return v3;
}

- (BOOL)hasSignificantSender
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasSignificantSender:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setSignificantSender:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_uint64_t significantSender = a3;
}

- (int)significantSender
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_significantSender;
  }
  else {
    return 0;
  }
}

- (BOOL)hasConfidenceScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setConfidenceScore:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_confidenceScore = a3;
}

- (BOOL)hasDaysFromStartDate
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasDaysFromStartDate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setDaysFromStartDate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_daysFromStartDate = a3;
}

- (BOOL)hasLanguageID
{
  return self->_languageID != 0;
}

- (BOOL)hasEventType
{
  return self->_eventType != 0;
}

- (int)StringAsActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMNLEventActionTypeDissected"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeHarvested"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeFiltered"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeFound"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeShown"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeEngaged"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeConfirmed"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeRejected"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMNLEventActionTypeDismissed"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)actionTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E620[a3];
  }

  return v3;
}

- (BOOL)hasActionType
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasActionType:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setActionType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uint64_t actionType = a3;
}

- (int)actionType
{
  if (*(_WORD *)&self->_has) {
    return self->_actionType;
  }
  else {
    return 0;
  }
}

- (int)StringAsInterface:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMNLEventInterfaceSuggestd"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMail"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMailBanner"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMailDDLink"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessages"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessagesBanner"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMessagesDDLink"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendar"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarNotification"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarInbox"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarEventDetails"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarCanvas"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarWidget"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarWidgetUpNext"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarZKW"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceCalendarAutocomplete"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMaps"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceMapsWidget"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceTTLNotification"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SGMNLEventInterfaceSpotlight"])
  {
    int v4 = 19;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)interfaceAsString:(int)a3
{
  if (a3 >= 0x14)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E580[a3];
  }

  return v3;
}

- (BOOL)hasInterface
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasInterface:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setInterface:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_uint64_t interface = a3;
}

- (int)interface
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_interface;
  }
  else {
    return 0;
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"NLEventInBanner";
  }
}

@end