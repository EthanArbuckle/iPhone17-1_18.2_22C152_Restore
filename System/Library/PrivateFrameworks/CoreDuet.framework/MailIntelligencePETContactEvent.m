@interface MailIntelligencePETContactEvent
- (BOOL)hasCallAvgDur;
- (BOOL)hasCallBirthday;
- (BOOL)hasCallDurEveFri;
- (BOOL)hasCallDurEveSat;
- (BOOL)hasCallDurEveSun;
- (BOOL)hasCallDurEveWeekday;
- (BOOL)hasCallDurMorningFri;
- (BOOL)hasCallDurMorningSat;
- (BOOL)hasCallDurMorningSun;
- (BOOL)hasCallDurMorningWeekday;
- (BOOL)hasCallDurNightFri;
- (BOOL)hasCallDurNightSat;
- (BOOL)hasCallDurNightSun;
- (BOOL)hasCallDurNightWeekday;
- (BOOL)hasCallDurNoonFri;
- (BOOL)hasCallDurNoonSat;
- (BOOL)hasCallDurNoonSun;
- (BOOL)hasCallDurNoonWeekday;
- (BOOL)hasCallEveFri;
- (BOOL)hasCallEveSat;
- (BOOL)hasCallEveSun;
- (BOOL)hasCallEveWeekday;
- (BOOL)hasCallLongEveFri;
- (BOOL)hasCallLongEveSat;
- (BOOL)hasCallLongEveSun;
- (BOOL)hasCallLongEveWeekday;
- (BOOL)hasCallLongMorningFri;
- (BOOL)hasCallLongMorningSat;
- (BOOL)hasCallLongMorningSun;
- (BOOL)hasCallLongMorningWeekday;
- (BOOL)hasCallLongNightFri;
- (BOOL)hasCallLongNightSat;
- (BOOL)hasCallLongNightSun;
- (BOOL)hasCallLongNightWeekday;
- (BOOL)hasCallLongNoonFri;
- (BOOL)hasCallLongNoonSat;
- (BOOL)hasCallLongNoonSun;
- (BOOL)hasCallLongNoonWeekday;
- (BOOL)hasCallLongRatio;
- (BOOL)hasCallMaxDur;
- (BOOL)hasCallMorningFri;
- (BOOL)hasCallMorningSat;
- (BOOL)hasCallMorningSun;
- (BOOL)hasCallMorningWeekday;
- (BOOL)hasCallNightFri;
- (BOOL)hasCallNightSat;
- (BOOL)hasCallNightSun;
- (BOOL)hasCallNightWeekday;
- (BOOL)hasCallNoonFri;
- (BOOL)hasCallNoonSat;
- (BOOL)hasCallNoonSun;
- (BOOL)hasCallNoonWeekday;
- (BOOL)hasCallOutgoingRatio;
- (BOOL)hasCallTotal;
- (BOOL)hasCallTotalDur;
- (BOOL)hasContactEmergency;
- (BOOL)hasContactEmergencyFamily;
- (BOOL)hasContactFamilyName;
- (BOOL)hasContactFamilyRelation;
- (BOOL)hasContactFavorite;
- (BOOL)hasContactInAirDrop;
- (BOOL)hasContactInAirDropAtHome;
- (BOOL)hasContactInFMFFavorite;
- (BOOL)hasContactInFMFFollowingMe;
- (BOOL)hasContactInFMFSharingWithMe;
- (BOOL)hasContactInHome;
- (BOOL)hasContactInPhotos;
- (BOOL)hasContactParent;
- (BOOL)hasContactRelation;
- (BOOL)hasFirstPartyMsgEveFri;
- (BOOL)hasFirstPartyMsgEveSat;
- (BOOL)hasFirstPartyMsgEveSun;
- (BOOL)hasFirstPartyMsgEveWeekday;
- (BOOL)hasFirstPartyMsgMorningFri;
- (BOOL)hasFirstPartyMsgMorningSat;
- (BOOL)hasFirstPartyMsgMorningSun;
- (BOOL)hasFirstPartyMsgMorningWeekday;
- (BOOL)hasFirstPartyMsgNightFri;
- (BOOL)hasFirstPartyMsgNightSat;
- (BOOL)hasFirstPartyMsgNightSun;
- (BOOL)hasFirstPartyMsgNightWeekday;
- (BOOL)hasFirstPartyMsgNoonFri;
- (BOOL)hasFirstPartyMsgNoonSat;
- (BOOL)hasFirstPartyMsgNoonSun;
- (BOOL)hasFirstPartyMsgNoonWeekday;
- (BOOL)hasFirstPartyMsgOutgoingRatio;
- (BOOL)hasFirstPartyMsgTotal;
- (BOOL)hasThirdPartyMsgEveFri;
- (BOOL)hasThirdPartyMsgEveSat;
- (BOOL)hasThirdPartyMsgEveSun;
- (BOOL)hasThirdPartyMsgEveWeekday;
- (BOOL)hasThirdPartyMsgMorningFri;
- (BOOL)hasThirdPartyMsgMorningSat;
- (BOOL)hasThirdPartyMsgMorningSun;
- (BOOL)hasThirdPartyMsgMorningWeekday;
- (BOOL)hasThirdPartyMsgNightFri;
- (BOOL)hasThirdPartyMsgNightSat;
- (BOOL)hasThirdPartyMsgNightSun;
- (BOOL)hasThirdPartyMsgNightWeekday;
- (BOOL)hasThirdPartyMsgNoonFri;
- (BOOL)hasThirdPartyMsgNoonSat;
- (BOOL)hasThirdPartyMsgNoonSun;
- (BOOL)hasThirdPartyMsgNoonWeekday;
- (BOOL)hasThirdPartyMsgTotal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contactRelation;
- (double)callAvgDur;
- (double)callDurEveFri;
- (double)callDurEveSat;
- (double)callDurEveSun;
- (double)callDurEveWeekday;
- (double)callDurMorningFri;
- (double)callDurMorningSat;
- (double)callDurMorningSun;
- (double)callDurMorningWeekday;
- (double)callDurNightFri;
- (double)callDurNightSat;
- (double)callDurNightSun;
- (double)callDurNightWeekday;
- (double)callDurNoonFri;
- (double)callDurNoonSat;
- (double)callDurNoonSun;
- (double)callDurNoonWeekday;
- (double)callEveFri;
- (double)callEveSat;
- (double)callEveSun;
- (double)callEveWeekday;
- (double)callLongEveFri;
- (double)callLongEveSat;
- (double)callLongEveSun;
- (double)callLongEveWeekday;
- (double)callLongMorningFri;
- (double)callLongMorningSat;
- (double)callLongMorningSun;
- (double)callLongMorningWeekday;
- (double)callLongNightFri;
- (double)callLongNightSat;
- (double)callLongNightSun;
- (double)callLongNightWeekday;
- (double)callLongNoonFri;
- (double)callLongNoonSat;
- (double)callLongNoonSun;
- (double)callLongNoonWeekday;
- (double)callLongRatio;
- (double)callMaxDur;
- (double)callMorningFri;
- (double)callMorningSat;
- (double)callMorningSun;
- (double)callMorningWeekday;
- (double)callNightFri;
- (double)callNightSat;
- (double)callNightSun;
- (double)callNightWeekday;
- (double)callNoonFri;
- (double)callNoonSat;
- (double)callNoonSun;
- (double)callNoonWeekday;
- (double)callOutgoingRatio;
- (double)callTotalDur;
- (double)firstPartyMsgEveFri;
- (double)firstPartyMsgEveSat;
- (double)firstPartyMsgEveSun;
- (double)firstPartyMsgEveWeekday;
- (double)firstPartyMsgMorningFri;
- (double)firstPartyMsgMorningSat;
- (double)firstPartyMsgMorningSun;
- (double)firstPartyMsgMorningWeekday;
- (double)firstPartyMsgNightFri;
- (double)firstPartyMsgNightSat;
- (double)firstPartyMsgNightSun;
- (double)firstPartyMsgNightWeekday;
- (double)firstPartyMsgNoonFri;
- (double)firstPartyMsgNoonSat;
- (double)firstPartyMsgNoonSun;
- (double)firstPartyMsgNoonWeekday;
- (double)firstPartyMsgOutgoingRatio;
- (double)thirdPartyMsgEveFri;
- (double)thirdPartyMsgEveSat;
- (double)thirdPartyMsgEveSun;
- (double)thirdPartyMsgEveWeekday;
- (double)thirdPartyMsgMorningFri;
- (double)thirdPartyMsgMorningSat;
- (double)thirdPartyMsgMorningSun;
- (double)thirdPartyMsgMorningWeekday;
- (double)thirdPartyMsgNightFri;
- (double)thirdPartyMsgNightSat;
- (double)thirdPartyMsgNightSun;
- (double)thirdPartyMsgNightWeekday;
- (double)thirdPartyMsgNoonFri;
- (double)thirdPartyMsgNoonSat;
- (double)thirdPartyMsgNoonSun;
- (double)thirdPartyMsgNoonWeekday;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)callTotal;
- (unint64_t)firstPartyMsgTotal;
- (unint64_t)hash;
- (unint64_t)mailIntelligenceContactId;
- (unint64_t)thirdPartyMsgTotal;
- (unsigned)callBirthday;
- (unsigned)contactEmergency;
- (unsigned)contactEmergencyFamily;
- (unsigned)contactFamilyName;
- (unsigned)contactFamilyRelation;
- (unsigned)contactFavorite;
- (unsigned)contactInAirDrop;
- (unsigned)contactInAirDropAtHome;
- (unsigned)contactInFMFFavorite;
- (unsigned)contactInFMFFollowingMe;
- (unsigned)contactInFMFSharingWithMe;
- (unsigned)contactInHome;
- (unsigned)contactInPhotos;
- (unsigned)contactParent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallAvgDur:(double)a3;
- (void)setCallBirthday:(unsigned int)a3;
- (void)setCallDurEveFri:(double)a3;
- (void)setCallDurEveSat:(double)a3;
- (void)setCallDurEveSun:(double)a3;
- (void)setCallDurEveWeekday:(double)a3;
- (void)setCallDurMorningFri:(double)a3;
- (void)setCallDurMorningSat:(double)a3;
- (void)setCallDurMorningSun:(double)a3;
- (void)setCallDurMorningWeekday:(double)a3;
- (void)setCallDurNightFri:(double)a3;
- (void)setCallDurNightSat:(double)a3;
- (void)setCallDurNightSun:(double)a3;
- (void)setCallDurNightWeekday:(double)a3;
- (void)setCallDurNoonFri:(double)a3;
- (void)setCallDurNoonSat:(double)a3;
- (void)setCallDurNoonSun:(double)a3;
- (void)setCallDurNoonWeekday:(double)a3;
- (void)setCallEveFri:(double)a3;
- (void)setCallEveSat:(double)a3;
- (void)setCallEveSun:(double)a3;
- (void)setCallEveWeekday:(double)a3;
- (void)setCallLongEveFri:(double)a3;
- (void)setCallLongEveSat:(double)a3;
- (void)setCallLongEveSun:(double)a3;
- (void)setCallLongEveWeekday:(double)a3;
- (void)setCallLongMorningFri:(double)a3;
- (void)setCallLongMorningSat:(double)a3;
- (void)setCallLongMorningSun:(double)a3;
- (void)setCallLongMorningWeekday:(double)a3;
- (void)setCallLongNightFri:(double)a3;
- (void)setCallLongNightSat:(double)a3;
- (void)setCallLongNightSun:(double)a3;
- (void)setCallLongNightWeekday:(double)a3;
- (void)setCallLongNoonFri:(double)a3;
- (void)setCallLongNoonSat:(double)a3;
- (void)setCallLongNoonSun:(double)a3;
- (void)setCallLongNoonWeekday:(double)a3;
- (void)setCallLongRatio:(double)a3;
- (void)setCallMaxDur:(double)a3;
- (void)setCallMorningFri:(double)a3;
- (void)setCallMorningSat:(double)a3;
- (void)setCallMorningSun:(double)a3;
- (void)setCallMorningWeekday:(double)a3;
- (void)setCallNightFri:(double)a3;
- (void)setCallNightSat:(double)a3;
- (void)setCallNightSun:(double)a3;
- (void)setCallNightWeekday:(double)a3;
- (void)setCallNoonFri:(double)a3;
- (void)setCallNoonSat:(double)a3;
- (void)setCallNoonSun:(double)a3;
- (void)setCallNoonWeekday:(double)a3;
- (void)setCallOutgoingRatio:(double)a3;
- (void)setCallTotal:(unint64_t)a3;
- (void)setCallTotalDur:(double)a3;
- (void)setContactEmergency:(unsigned int)a3;
- (void)setContactEmergencyFamily:(unsigned int)a3;
- (void)setContactFamilyName:(unsigned int)a3;
- (void)setContactFamilyRelation:(unsigned int)a3;
- (void)setContactFavorite:(unsigned int)a3;
- (void)setContactInAirDrop:(unsigned int)a3;
- (void)setContactInAirDropAtHome:(unsigned int)a3;
- (void)setContactInFMFFavorite:(unsigned int)a3;
- (void)setContactInFMFFollowingMe:(unsigned int)a3;
- (void)setContactInFMFSharingWithMe:(unsigned int)a3;
- (void)setContactInHome:(unsigned int)a3;
- (void)setContactInPhotos:(unsigned int)a3;
- (void)setContactParent:(unsigned int)a3;
- (void)setContactRelation:(id)a3;
- (void)setFirstPartyMsgEveFri:(double)a3;
- (void)setFirstPartyMsgEveSat:(double)a3;
- (void)setFirstPartyMsgEveSun:(double)a3;
- (void)setFirstPartyMsgEveWeekday:(double)a3;
- (void)setFirstPartyMsgMorningFri:(double)a3;
- (void)setFirstPartyMsgMorningSat:(double)a3;
- (void)setFirstPartyMsgMorningSun:(double)a3;
- (void)setFirstPartyMsgMorningWeekday:(double)a3;
- (void)setFirstPartyMsgNightFri:(double)a3;
- (void)setFirstPartyMsgNightSat:(double)a3;
- (void)setFirstPartyMsgNightSun:(double)a3;
- (void)setFirstPartyMsgNightWeekday:(double)a3;
- (void)setFirstPartyMsgNoonFri:(double)a3;
- (void)setFirstPartyMsgNoonSat:(double)a3;
- (void)setFirstPartyMsgNoonSun:(double)a3;
- (void)setFirstPartyMsgNoonWeekday:(double)a3;
- (void)setFirstPartyMsgOutgoingRatio:(double)a3;
- (void)setFirstPartyMsgTotal:(unint64_t)a3;
- (void)setHasCallAvgDur:(BOOL)a3;
- (void)setHasCallBirthday:(BOOL)a3;
- (void)setHasCallDurEveFri:(BOOL)a3;
- (void)setHasCallDurEveSat:(BOOL)a3;
- (void)setHasCallDurEveSun:(BOOL)a3;
- (void)setHasCallDurEveWeekday:(BOOL)a3;
- (void)setHasCallDurMorningFri:(BOOL)a3;
- (void)setHasCallDurMorningSat:(BOOL)a3;
- (void)setHasCallDurMorningSun:(BOOL)a3;
- (void)setHasCallDurMorningWeekday:(BOOL)a3;
- (void)setHasCallDurNightFri:(BOOL)a3;
- (void)setHasCallDurNightSat:(BOOL)a3;
- (void)setHasCallDurNightSun:(BOOL)a3;
- (void)setHasCallDurNightWeekday:(BOOL)a3;
- (void)setHasCallDurNoonFri:(BOOL)a3;
- (void)setHasCallDurNoonSat:(BOOL)a3;
- (void)setHasCallDurNoonSun:(BOOL)a3;
- (void)setHasCallDurNoonWeekday:(BOOL)a3;
- (void)setHasCallEveFri:(BOOL)a3;
- (void)setHasCallEveSat:(BOOL)a3;
- (void)setHasCallEveSun:(BOOL)a3;
- (void)setHasCallEveWeekday:(BOOL)a3;
- (void)setHasCallLongEveFri:(BOOL)a3;
- (void)setHasCallLongEveSat:(BOOL)a3;
- (void)setHasCallLongEveSun:(BOOL)a3;
- (void)setHasCallLongEveWeekday:(BOOL)a3;
- (void)setHasCallLongMorningFri:(BOOL)a3;
- (void)setHasCallLongMorningSat:(BOOL)a3;
- (void)setHasCallLongMorningSun:(BOOL)a3;
- (void)setHasCallLongMorningWeekday:(BOOL)a3;
- (void)setHasCallLongNightFri:(BOOL)a3;
- (void)setHasCallLongNightSat:(BOOL)a3;
- (void)setHasCallLongNightSun:(BOOL)a3;
- (void)setHasCallLongNightWeekday:(BOOL)a3;
- (void)setHasCallLongNoonFri:(BOOL)a3;
- (void)setHasCallLongNoonSat:(BOOL)a3;
- (void)setHasCallLongNoonSun:(BOOL)a3;
- (void)setHasCallLongNoonWeekday:(BOOL)a3;
- (void)setHasCallLongRatio:(BOOL)a3;
- (void)setHasCallMaxDur:(BOOL)a3;
- (void)setHasCallMorningFri:(BOOL)a3;
- (void)setHasCallMorningSat:(BOOL)a3;
- (void)setHasCallMorningSun:(BOOL)a3;
- (void)setHasCallMorningWeekday:(BOOL)a3;
- (void)setHasCallNightFri:(BOOL)a3;
- (void)setHasCallNightSat:(BOOL)a3;
- (void)setHasCallNightSun:(BOOL)a3;
- (void)setHasCallNightWeekday:(BOOL)a3;
- (void)setHasCallNoonFri:(BOOL)a3;
- (void)setHasCallNoonSat:(BOOL)a3;
- (void)setHasCallNoonSun:(BOOL)a3;
- (void)setHasCallNoonWeekday:(BOOL)a3;
- (void)setHasCallOutgoingRatio:(BOOL)a3;
- (void)setHasCallTotal:(BOOL)a3;
- (void)setHasCallTotalDur:(BOOL)a3;
- (void)setHasContactEmergency:(BOOL)a3;
- (void)setHasContactEmergencyFamily:(BOOL)a3;
- (void)setHasContactFamilyName:(BOOL)a3;
- (void)setHasContactFamilyRelation:(BOOL)a3;
- (void)setHasContactFavorite:(BOOL)a3;
- (void)setHasContactInAirDrop:(BOOL)a3;
- (void)setHasContactInAirDropAtHome:(BOOL)a3;
- (void)setHasContactInFMFFavorite:(BOOL)a3;
- (void)setHasContactInFMFFollowingMe:(BOOL)a3;
- (void)setHasContactInFMFSharingWithMe:(BOOL)a3;
- (void)setHasContactInHome:(BOOL)a3;
- (void)setHasContactInPhotos:(BOOL)a3;
- (void)setHasContactParent:(BOOL)a3;
- (void)setHasFirstPartyMsgEveFri:(BOOL)a3;
- (void)setHasFirstPartyMsgEveSat:(BOOL)a3;
- (void)setHasFirstPartyMsgEveSun:(BOOL)a3;
- (void)setHasFirstPartyMsgEveWeekday:(BOOL)a3;
- (void)setHasFirstPartyMsgMorningFri:(BOOL)a3;
- (void)setHasFirstPartyMsgMorningSat:(BOOL)a3;
- (void)setHasFirstPartyMsgMorningSun:(BOOL)a3;
- (void)setHasFirstPartyMsgMorningWeekday:(BOOL)a3;
- (void)setHasFirstPartyMsgNightFri:(BOOL)a3;
- (void)setHasFirstPartyMsgNightSat:(BOOL)a3;
- (void)setHasFirstPartyMsgNightSun:(BOOL)a3;
- (void)setHasFirstPartyMsgNightWeekday:(BOOL)a3;
- (void)setHasFirstPartyMsgNoonFri:(BOOL)a3;
- (void)setHasFirstPartyMsgNoonSat:(BOOL)a3;
- (void)setHasFirstPartyMsgNoonSun:(BOOL)a3;
- (void)setHasFirstPartyMsgNoonWeekday:(BOOL)a3;
- (void)setHasFirstPartyMsgOutgoingRatio:(BOOL)a3;
- (void)setHasFirstPartyMsgTotal:(BOOL)a3;
- (void)setHasThirdPartyMsgEveFri:(BOOL)a3;
- (void)setHasThirdPartyMsgEveSat:(BOOL)a3;
- (void)setHasThirdPartyMsgEveSun:(BOOL)a3;
- (void)setHasThirdPartyMsgEveWeekday:(BOOL)a3;
- (void)setHasThirdPartyMsgMorningFri:(BOOL)a3;
- (void)setHasThirdPartyMsgMorningSat:(BOOL)a3;
- (void)setHasThirdPartyMsgMorningSun:(BOOL)a3;
- (void)setHasThirdPartyMsgMorningWeekday:(BOOL)a3;
- (void)setHasThirdPartyMsgNightFri:(BOOL)a3;
- (void)setHasThirdPartyMsgNightSat:(BOOL)a3;
- (void)setHasThirdPartyMsgNightSun:(BOOL)a3;
- (void)setHasThirdPartyMsgNightWeekday:(BOOL)a3;
- (void)setHasThirdPartyMsgNoonFri:(BOOL)a3;
- (void)setHasThirdPartyMsgNoonSat:(BOOL)a3;
- (void)setHasThirdPartyMsgNoonSun:(BOOL)a3;
- (void)setHasThirdPartyMsgNoonWeekday:(BOOL)a3;
- (void)setHasThirdPartyMsgTotal:(BOOL)a3;
- (void)setMailIntelligenceContactId:(unint64_t)a3;
- (void)setThirdPartyMsgEveFri:(double)a3;
- (void)setThirdPartyMsgEveSat:(double)a3;
- (void)setThirdPartyMsgEveSun:(double)a3;
- (void)setThirdPartyMsgEveWeekday:(double)a3;
- (void)setThirdPartyMsgMorningFri:(double)a3;
- (void)setThirdPartyMsgMorningSat:(double)a3;
- (void)setThirdPartyMsgMorningSun:(double)a3;
- (void)setThirdPartyMsgMorningWeekday:(double)a3;
- (void)setThirdPartyMsgNightFri:(double)a3;
- (void)setThirdPartyMsgNightSat:(double)a3;
- (void)setThirdPartyMsgNightSun:(double)a3;
- (void)setThirdPartyMsgNightWeekday:(double)a3;
- (void)setThirdPartyMsgNoonFri:(double)a3;
- (void)setThirdPartyMsgNoonSat:(double)a3;
- (void)setThirdPartyMsgNoonSun:(double)a3;
- (void)setThirdPartyMsgNoonWeekday:(double)a3;
- (void)setThirdPartyMsgTotal:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MailIntelligencePETContactEvent

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  p_has = &self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_firstPartyMsgTotal];
    [v3 setObject:v6 forKey:@"firstPartyMsgTotal"];

    uint64_t v5 = *((void *)&self->_has + 1);
  }
  uint64_t v7 = *(void *)p_has;
  if ((v5 & 0x40) != 0)
  {
    v15 = [NSNumber numberWithDouble:self->_firstPartyMsgOutgoingRatio];
    [v3 setObject:v15 forKey:@"firstPartyMsgOutgoingRatio"];

    uint64_t v7 = *(void *)p_has;
    uint64_t v5 = *((void *)&self->_has + 1);
    if ((*(void *)p_has & 0x2000000000000000) == 0)
    {
LABEL_5:
      if ((v7 & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_112;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = [NSNumber numberWithDouble:self->_firstPartyMsgMorningWeekday];
  [v3 setObject:v16 forKey:@"firstPartyMsgMorningWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_113;
  }
LABEL_112:
  v17 = [NSNumber numberWithDouble:self->_firstPartyMsgMorningFri];
  [v3 setObject:v17 forKey:@"firstPartyMsgMorningFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000000000) == 0)
  {
LABEL_7:
    if ((v7 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_114;
  }
LABEL_113:
  v18 = [NSNumber numberWithDouble:self->_firstPartyMsgMorningSat];
  [v3 setObject:v18 forKey:@"firstPartyMsgMorningSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_115;
  }
LABEL_114:
  v19 = [NSNumber numberWithDouble:self->_firstPartyMsgMorningSun];
  [v3 setObject:v19 forKey:@"firstPartyMsgMorningSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_116;
  }
LABEL_115:
  v20 = [NSNumber numberWithDouble:self->_firstPartyMsgNoonWeekday];
  [v3 setObject:v20 forKey:@"firstPartyMsgNoonWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_117;
  }
LABEL_116:
  v21 = [NSNumber numberWithDouble:self->_firstPartyMsgNoonFri];
  [v3 setObject:v21 forKey:@"firstPartyMsgNoonFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_118;
  }
LABEL_117:
  v22 = [NSNumber numberWithDouble:self->_firstPartyMsgNoonSat];
  [v3 setObject:v22 forKey:@"firstPartyMsgNoonSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x200000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_119;
  }
LABEL_118:
  v23 = [NSNumber numberWithDouble:self->_firstPartyMsgNoonSun];
  [v3 setObject:v23 forKey:@"firstPartyMsgNoonSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000000000) == 0)
  {
LABEL_13:
    if ((v7 & 0x40000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_120;
  }
LABEL_119:
  v24 = [NSNumber numberWithDouble:self->_firstPartyMsgEveWeekday];
  [v3 setObject:v24 forKey:@"firstPartyMsgEveWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x80000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_121;
  }
LABEL_120:
  v25 = [NSNumber numberWithDouble:self->_firstPartyMsgEveFri];
  [v3 setObject:v25 forKey:@"firstPartyMsgEveFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000000000) == 0)
  {
LABEL_15:
    if ((v7 & 0x100000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_122;
  }
LABEL_121:
  v26 = [NSNumber numberWithDouble:self->_firstPartyMsgEveSat];
  [v3 setObject:v26 forKey:@"firstPartyMsgEveSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000000000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_123;
  }
LABEL_122:
  v27 = [NSNumber numberWithDouble:self->_firstPartyMsgEveSun];
  [v3 setObject:v27 forKey:@"firstPartyMsgEveSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000000000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_124;
  }
LABEL_123:
  v28 = [NSNumber numberWithDouble:self->_firstPartyMsgNightWeekday];
  [v3 setObject:v28 forKey:@"firstPartyMsgNightWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_125;
  }
LABEL_124:
  v29 = [NSNumber numberWithDouble:self->_firstPartyMsgNightFri];
  [v3 setObject:v29 forKey:@"firstPartyMsgNightFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_126;
  }
LABEL_125:
  v30 = [NSNumber numberWithDouble:self->_firstPartyMsgNightSat];
  [v3 setObject:v30 forKey:@"firstPartyMsgNightSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_127;
  }
LABEL_126:
  v31 = [NSNumber numberWithDouble:self->_firstPartyMsgNightSun];
  [v3 setObject:v31 forKey:@"firstPartyMsgNightSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_128;
  }
LABEL_127:
  v32 = [NSNumber numberWithUnsignedLongLong:self->_thirdPartyMsgTotal];
  [v3 setObject:v32 forKey:@"thirdPartyMsgTotal"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_129;
  }
LABEL_128:
  v33 = [NSNumber numberWithDouble:self->_thirdPartyMsgMorningWeekday];
  [v3 setObject:v33 forKey:@"thirdPartyMsgMorningWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_130;
  }
LABEL_129:
  v34 = [NSNumber numberWithDouble:self->_thirdPartyMsgMorningFri];
  [v3 setObject:v34 forKey:@"thirdPartyMsgMorningFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_131;
  }
LABEL_130:
  v35 = [NSNumber numberWithDouble:self->_thirdPartyMsgMorningSat];
  [v3 setObject:v35 forKey:@"thirdPartyMsgMorningSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_132;
  }
LABEL_131:
  v36 = [NSNumber numberWithDouble:self->_thirdPartyMsgMorningSun];
  [v3 setObject:v36 forKey:@"thirdPartyMsgMorningSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_133;
  }
LABEL_132:
  v37 = [NSNumber numberWithDouble:self->_thirdPartyMsgNoonWeekday];
  [v3 setObject:v37 forKey:@"thirdPartyMsgNoonWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_134;
  }
LABEL_133:
  v38 = [NSNumber numberWithDouble:self->_thirdPartyMsgNoonFri];
  [v3 setObject:v38 forKey:@"thirdPartyMsgNoonFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_135;
  }
LABEL_134:
  v39 = [NSNumber numberWithDouble:self->_thirdPartyMsgNoonSat];
  [v3 setObject:v39 forKey:@"thirdPartyMsgNoonSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_136;
  }
LABEL_135:
  v40 = [NSNumber numberWithDouble:self->_thirdPartyMsgNoonSun];
  [v3 setObject:v40 forKey:@"thirdPartyMsgNoonSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_30:
    if ((v5 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_137;
  }
LABEL_136:
  v41 = [NSNumber numberWithDouble:self->_thirdPartyMsgEveWeekday];
  [v3 setObject:v41 forKey:@"thirdPartyMsgEveWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_31:
    if ((v5 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_138;
  }
LABEL_137:
  v42 = [NSNumber numberWithDouble:self->_thirdPartyMsgEveFri];
  [v3 setObject:v42 forKey:@"thirdPartyMsgEveFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_32:
    if ((v5 & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_139;
  }
LABEL_138:
  v43 = [NSNumber numberWithDouble:self->_thirdPartyMsgEveSat];
  [v3 setObject:v43 forKey:@"thirdPartyMsgEveSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_140;
  }
LABEL_139:
  v44 = [NSNumber numberWithDouble:self->_thirdPartyMsgEveSun];
  [v3 setObject:v44 forKey:@"thirdPartyMsgEveSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_141;
  }
LABEL_140:
  v45 = [NSNumber numberWithDouble:self->_thirdPartyMsgNightWeekday];
  [v3 setObject:v45 forKey:@"thirdPartyMsgNightWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_142;
  }
LABEL_141:
  v46 = [NSNumber numberWithDouble:self->_thirdPartyMsgNightFri];
  [v3 setObject:v46 forKey:@"thirdPartyMsgNightFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_143;
  }
LABEL_142:
  v47 = [NSNumber numberWithDouble:self->_thirdPartyMsgNightSat];
  [v3 setObject:v47 forKey:@"thirdPartyMsgNightSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((v7 & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_144;
  }
LABEL_143:
  v48 = [NSNumber numberWithDouble:self->_thirdPartyMsgNightSun];
  [v3 setObject:v48 forKey:@"thirdPartyMsgNightSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_145;
  }
LABEL_144:
  v49 = [NSNumber numberWithUnsignedLongLong:self->_callTotal];
  [v3 setObject:v49 forKey:@"callTotal"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_146;
  }
LABEL_145:
  v50 = [NSNumber numberWithUnsignedInt:self->_callBirthday];
  [v3 setObject:v50 forKey:@"callBirthday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x20000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_147;
  }
LABEL_146:
  v51 = [NSNumber numberWithUnsignedInt:self->_contactFavorite];
  [v3 setObject:v51 forKey:@"contactFavorite"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_148;
  }
LABEL_147:
  v52 = [NSNumber numberWithDouble:self->_callTotalDur];
  [v3 setObject:v52 forKey:@"callTotalDur"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_149;
  }
LABEL_148:
  v53 = [NSNumber numberWithDouble:self->_callLongRatio];
  [v3 setObject:v53 forKey:@"callLongRatio"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((v7 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_150;
  }
LABEL_149:
  v54 = [NSNumber numberWithDouble:self->_callOutgoingRatio];
  [v3 setObject:v54 forKey:@"callOutgoingRatio"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 1) == 0)
  {
LABEL_44:
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_151;
  }
LABEL_150:
  v55 = [NSNumber numberWithDouble:self->_callAvgDur];
  [v3 setObject:v55 forKey:@"callAvgDur"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_152;
  }
LABEL_151:
  v56 = [NSNumber numberWithDouble:self->_callMaxDur];
  [v3 setObject:v56 forKey:@"callMaxDur"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_153;
  }
LABEL_152:
  v57 = [NSNumber numberWithDouble:self->_callMorningWeekday];
  [v3 setObject:v57 forKey:@"callMorningWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000) == 0)
  {
LABEL_47:
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_154;
  }
LABEL_153:
  v58 = [NSNumber numberWithDouble:self->_callMorningFri];
  [v3 setObject:v58 forKey:@"callMorningFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_155;
  }
LABEL_154:
  v59 = [NSNumber numberWithDouble:self->_callMorningSat];
  [v3 setObject:v59 forKey:@"callMorningSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000000) == 0)
  {
LABEL_49:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_156;
  }
LABEL_155:
  v60 = [NSNumber numberWithDouble:self->_callMorningSun];
  [v3 setObject:v60 forKey:@"callMorningSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((v7 & 0x800000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_157;
  }
LABEL_156:
  v61 = [NSNumber numberWithDouble:self->_callNoonWeekday];
  [v3 setObject:v61 forKey:@"callNoonWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_158;
  }
LABEL_157:
  v62 = [NSNumber numberWithDouble:self->_callNoonFri];
  [v3 setObject:v62 forKey:@"callNoonFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_159;
  }
LABEL_158:
  v63 = [NSNumber numberWithDouble:self->_callNoonSat];
  [v3 setObject:v63 forKey:@"callNoonSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_160;
  }
LABEL_159:
  v64 = [NSNumber numberWithDouble:self->_callNoonSun];
  [v3 setObject:v64 forKey:@"callNoonSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000) == 0)
  {
LABEL_54:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_161;
  }
LABEL_160:
  v65 = [NSNumber numberWithDouble:self->_callEveWeekday];
  [v3 setObject:v65 forKey:@"callEveWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000) == 0)
  {
LABEL_55:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_162;
  }
LABEL_161:
  v66 = [NSNumber numberWithDouble:self->_callEveFri];
  [v3 setObject:v66 forKey:@"callEveFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000) == 0)
  {
LABEL_56:
    if ((v7 & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_163;
  }
LABEL_162:
  v67 = [NSNumber numberWithDouble:self->_callEveSat];
  [v3 setObject:v67 forKey:@"callEveSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000) == 0)
  {
LABEL_57:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_164;
  }
LABEL_163:
  v68 = [NSNumber numberWithDouble:self->_callEveSun];
  [v3 setObject:v68 forKey:@"callEveSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v7 & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_165;
  }
LABEL_164:
  v69 = [NSNumber numberWithDouble:self->_callNightWeekday];
  [v3 setObject:v69 forKey:@"callNightWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000000) == 0)
  {
LABEL_59:
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_166;
  }
LABEL_165:
  v70 = [NSNumber numberWithDouble:self->_callNightFri];
  [v3 setObject:v70 forKey:@"callNightFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000000) == 0)
  {
LABEL_60:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_167;
  }
LABEL_166:
  v71 = [NSNumber numberWithDouble:self->_callNightSat];
  [v3 setObject:v71 forKey:@"callNightSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000000) == 0)
  {
LABEL_61:
    if ((v7 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_168;
  }
LABEL_167:
  v72 = [NSNumber numberWithDouble:self->_callNightSun];
  [v3 setObject:v72 forKey:@"callNightSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100) == 0)
  {
LABEL_62:
    if ((v7 & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_169;
  }
LABEL_168:
  v73 = [NSNumber numberWithDouble:self->_callDurMorningWeekday];
  [v3 setObject:v73 forKey:@"callDurMorningWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20) == 0)
  {
LABEL_63:
    if ((v7 & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_170;
  }
LABEL_169:
  v74 = [NSNumber numberWithDouble:self->_callDurMorningFri];
  [v3 setObject:v74 forKey:@"callDurMorningFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40) == 0)
  {
LABEL_64:
    if ((v7 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_171;
  }
LABEL_170:
  v75 = [NSNumber numberWithDouble:self->_callDurMorningSat];
  [v3 setObject:v75 forKey:@"callDurMorningSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80) == 0)
  {
LABEL_65:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_172;
  }
LABEL_171:
  v76 = [NSNumber numberWithDouble:self->_callDurMorningSun];
  [v3 setObject:v76 forKey:@"callDurMorningSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000) == 0)
  {
LABEL_66:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_173;
  }
LABEL_172:
  v77 = [NSNumber numberWithDouble:self->_callDurNoonWeekday];
  [v3 setObject:v77 forKey:@"callDurNoonWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000) == 0)
  {
LABEL_67:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_174;
  }
LABEL_173:
  v78 = [NSNumber numberWithDouble:self->_callDurNoonFri];
  [v3 setObject:v78 forKey:@"callDurNoonFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000) == 0)
  {
LABEL_68:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_175;
  }
LABEL_174:
  v79 = [NSNumber numberWithDouble:self->_callDurNoonSat];
  [v3 setObject:v79 forKey:@"callDurNoonSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000) == 0)
  {
LABEL_69:
    if ((v7 & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_176;
  }
LABEL_175:
  v80 = [NSNumber numberWithDouble:self->_callDurNoonSun];
  [v3 setObject:v80 forKey:@"callDurNoonSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10) == 0)
  {
LABEL_70:
    if ((v7 & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_177;
  }
LABEL_176:
  v81 = [NSNumber numberWithDouble:self->_callDurEveWeekday];
  [v3 setObject:v81 forKey:@"callDurEveWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 2) == 0)
  {
LABEL_71:
    if ((v7 & 4) == 0) {
      goto LABEL_72;
    }
    goto LABEL_178;
  }
LABEL_177:
  v82 = [NSNumber numberWithDouble:self->_callDurEveFri];
  [v3 setObject:v82 forKey:@"callDurEveFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 4) == 0)
  {
LABEL_72:
    if ((v7 & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_179;
  }
LABEL_178:
  v83 = [NSNumber numberWithDouble:self->_callDurEveSat];
  [v3 setObject:v83 forKey:@"callDurEveSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 8) == 0)
  {
LABEL_73:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_180;
  }
LABEL_179:
  v84 = [NSNumber numberWithDouble:self->_callDurEveSun];
  [v3 setObject:v84 forKey:@"callDurEveSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000) == 0)
  {
LABEL_74:
    if ((v7 & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_181;
  }
LABEL_180:
  v85 = [NSNumber numberWithDouble:self->_callDurNightWeekday];
  [v3 setObject:v85 forKey:@"callDurNightWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200) == 0)
  {
LABEL_75:
    if ((v7 & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_182;
  }
LABEL_181:
  v86 = [NSNumber numberWithDouble:self->_callDurNightFri];
  [v3 setObject:v86 forKey:@"callDurNightFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400) == 0)
  {
LABEL_76:
    if ((v7 & 0x800) == 0) {
      goto LABEL_77;
    }
    goto LABEL_183;
  }
LABEL_182:
  v87 = [NSNumber numberWithDouble:self->_callDurNightSat];
  [v3 setObject:v87 forKey:@"callDurNightSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800) == 0)
  {
LABEL_77:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_184;
  }
LABEL_183:
  v88 = [NSNumber numberWithDouble:self->_callDurNightSun];
  [v3 setObject:v88 forKey:@"callDurNightSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000) == 0)
  {
LABEL_78:
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_185;
  }
LABEL_184:
  v89 = [NSNumber numberWithDouble:self->_callLongMorningWeekday];
  [v3 setObject:v89 forKey:@"callLongMorningWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000) == 0)
  {
LABEL_79:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_186;
  }
LABEL_185:
  v90 = [NSNumber numberWithDouble:self->_callLongMorningFri];
  [v3 setObject:v90 forKey:@"callLongMorningFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000) == 0)
  {
LABEL_80:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_187;
  }
LABEL_186:
  v91 = [NSNumber numberWithDouble:self->_callLongMorningSat];
  [v3 setObject:v91 forKey:@"callLongMorningSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000) == 0)
  {
LABEL_81:
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_188;
  }
LABEL_187:
  v92 = [NSNumber numberWithDouble:self->_callLongMorningSun];
  [v3 setObject:v92 forKey:@"callLongMorningSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000) == 0)
  {
LABEL_82:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_189;
  }
LABEL_188:
  v93 = [NSNumber numberWithDouble:self->_callLongNoonWeekday];
  [v3 setObject:v93 forKey:@"callLongNoonWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000) == 0)
  {
LABEL_83:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_190;
  }
LABEL_189:
  v94 = [NSNumber numberWithDouble:self->_callLongNoonFri];
  [v3 setObject:v94 forKey:@"callLongNoonFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000) == 0)
  {
LABEL_84:
    if ((v7 & 0x800000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_191;
  }
LABEL_190:
  v95 = [NSNumber numberWithDouble:self->_callLongNoonSat];
  [v3 setObject:v95 forKey:@"callLongNoonSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000) == 0)
  {
LABEL_85:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_192;
  }
LABEL_191:
  v96 = [NSNumber numberWithDouble:self->_callLongNoonSun];
  [v3 setObject:v96 forKey:@"callLongNoonSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000) == 0)
  {
LABEL_86:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_193;
  }
LABEL_192:
  v97 = [NSNumber numberWithDouble:self->_callLongEveWeekday];
  [v3 setObject:v97 forKey:@"callLongEveWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000) == 0)
  {
LABEL_87:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_194;
  }
LABEL_193:
  v98 = [NSNumber numberWithDouble:self->_callLongEveFri];
  [v3 setObject:v98 forKey:@"callLongEveFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000) == 0)
  {
LABEL_88:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_195;
  }
LABEL_194:
  v99 = [NSNumber numberWithDouble:self->_callLongEveSat];
  [v3 setObject:v99 forKey:@"callLongEveSat"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000) == 0)
  {
LABEL_89:
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_196;
  }
LABEL_195:
  v100 = [NSNumber numberWithDouble:self->_callLongEveSun];
  [v3 setObject:v100 forKey:@"callLongEveSun"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_197;
  }
LABEL_196:
  v101 = [NSNumber numberWithDouble:self->_callLongNightWeekday];
  [v3 setObject:v101 forKey:@"callLongNightWeekday"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_198;
  }
LABEL_197:
  v102 = [NSNumber numberWithDouble:self->_callLongNightFri];
  [v3 setObject:v102 forKey:@"callLongNightFri"];

  uint64_t v7 = *(void *)p_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_199;
  }
LABEL_198:
  v103 = [NSNumber numberWithDouble:self->_callLongNightSat];
  [v3 setObject:v103 forKey:@"callLongNightSat"];

  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000) == 0)
  {
LABEL_93:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
LABEL_199:
  v104 = [NSNumber numberWithDouble:self->_callLongNightSun];
  [v3 setObject:v104 forKey:@"callLongNightSun"];

  if ((*((void *)&self->_has + 1) & 0x20000000) != 0)
  {
LABEL_94:
    v8 = [NSNumber numberWithUnsignedInt:self->_contactFamilyRelation];
    [v3 setObject:v8 forKey:@"contactFamilyRelation"];
  }
LABEL_95:
  contactRelation = self->_contactRelation;
  if (contactRelation) {
    [v3 setObject:contactRelation forKey:@"contactRelation"];
  }
  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x10000000) != 0)
  {
    v105 = [NSNumber numberWithUnsignedInt:self->_contactFamilyName];
    [v3 setObject:v105 forKey:@"contactFamilyName"];

    uint64_t v10 = *((void *)&self->_has + 1);
    if ((v10 & 0x4000000000) == 0)
    {
LABEL_99:
      if ((v10 & 0x4000000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_203;
    }
  }
  else if ((v10 & 0x4000000000) == 0)
  {
    goto LABEL_99;
  }
  v106 = [NSNumber numberWithUnsignedInt:self->_contactParent];
  [v3 setObject:v106 forKey:@"contactParent"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_100:
    if ((v10 & 0x8000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_204;
  }
LABEL_203:
  v107 = [NSNumber numberWithUnsignedInt:self->_contactEmergency];
  [v3 setObject:v107 forKey:@"contactEmergency"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x8000000) == 0)
  {
LABEL_101:
    if ((v10 & 0x1000000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_205;
  }
LABEL_204:
  v108 = [NSNumber numberWithUnsignedInt:self->_contactEmergencyFamily];
  [v3 setObject:v108 forKey:@"contactEmergencyFamily"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x1000000000) == 0)
  {
LABEL_102:
    if ((v10 & 0x2000000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_206;
  }
LABEL_205:
  v109 = [NSNumber numberWithUnsignedInt:self->_contactInHome];
  [v3 setObject:v109 forKey:@"contactInHome"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x2000000000) == 0)
  {
LABEL_103:
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_207;
  }
LABEL_206:
  v110 = [NSNumber numberWithUnsignedInt:self->_contactInPhotos];
  [v3 setObject:v110 forKey:@"contactInPhotos"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x80000000) == 0)
  {
LABEL_104:
    if ((v10 & 0x100000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_208;
  }
LABEL_207:
  v111 = [NSNumber numberWithUnsignedInt:self->_contactInAirDrop];
  [v3 setObject:v111 forKey:@"contactInAirDrop"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v10 & 0x400000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_209;
  }
LABEL_208:
  v112 = [NSNumber numberWithUnsignedInt:self->_contactInAirDropAtHome];
  [v3 setObject:v112 forKey:@"contactInAirDropAtHome"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x400000000) == 0)
  {
LABEL_106:
    if ((v10 & 0x800000000) == 0) {
      goto LABEL_107;
    }
LABEL_210:
    v114 = [NSNumber numberWithUnsignedInt:self->_contactInFMFSharingWithMe];
    [v3 setObject:v114 forKey:@"contactInFMFSharingWithMe"];

    if ((*((void *)&self->_has + 1) & 0x200000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_209:
  v113 = [NSNumber numberWithUnsignedInt:self->_contactInFMFFollowingMe];
  [v3 setObject:v113 forKey:@"contactInFMFFollowingMe"];

  uint64_t v10 = *((void *)&self->_has + 1);
  if ((v10 & 0x800000000) != 0) {
    goto LABEL_210;
  }
LABEL_107:
  if ((v10 & 0x200000000) != 0)
  {
LABEL_108:
    v11 = [NSNumber numberWithUnsignedInt:self->_contactInFMFFavorite];
    [v3 setObject:v11 forKey:@"contactInFMFFavorite"];
  }
LABEL_109:
  v12 = [NSNumber numberWithUnsignedLongLong:self->_mailIntelligenceContactId];
  [v3 setObject:v12 forKey:@"mailIntelligenceContactId"];

  id v13 = v3;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_520;
  }
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  uint64_t v7 = *((void *)v4 + 99);
  uint64_t v8 = *((void *)v4 + 100);
  if ((v5 & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_firstPartyMsgTotal != *((void *)v4 + 72)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_firstPartyMsgOutgoingRatio != *((double *)v4 + 71)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v7 & 0x2000000000000000) == 0 || self->_firstPartyMsgMorningWeekday != *((double *)v4 + 62)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x2000000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v7 & 0x400000000000000) == 0 || self->_firstPartyMsgMorningFri != *((double *)v4 + 59)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x400000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v7 & 0x800000000000000) == 0 || self->_firstPartyMsgMorningSat != *((double *)v4 + 60)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x800000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v7 & 0x1000000000000000) == 0 || self->_firstPartyMsgMorningSun != *((double *)v4 + 61)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x1000000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_firstPartyMsgNoonWeekday != *((double *)v4 + 70)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_firstPartyMsgNoonFri != *((double *)v4 + 67)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_firstPartyMsgNoonSat != *((double *)v4 + 68)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_firstPartyMsgNoonSun != *((double *)v4 + 69)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v7 & 0x200000000000000) == 0 || self->_firstPartyMsgEveWeekday != *((double *)v4 + 58)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x200000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v7 & 0x40000000000000) == 0 || self->_firstPartyMsgEveFri != *((double *)v4 + 55)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x40000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x80000000000000) != 0)
  {
    if ((v7 & 0x80000000000000) == 0 || self->_firstPartyMsgEveSat != *((double *)v4 + 56)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x80000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v7 & 0x100000000000000) == 0 || self->_firstPartyMsgEveSun != *((double *)v4 + 57)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x100000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_firstPartyMsgNightWeekday != *((double *)v4 + 66)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v7 & 0x4000000000000000) == 0 || self->_firstPartyMsgNightFri != *((double *)v4 + 63)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x4000000000000000) != 0)
  {
    goto LABEL_520;
  }
  if (has < 0)
  {
    if ((v7 & 0x8000000000000000) == 0 || self->_firstPartyMsgNightSat != *((double *)v4 + 64)) {
      goto LABEL_520;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_520;
  }
  if (v5)
  {
    if ((v8 & 1) == 0 || self->_firstPartyMsgNightSun != *((double *)v4 + 65)) {
      goto LABEL_520;
    }
  }
  else if (v8)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_thirdPartyMsgTotal != *((void *)v4 + 90)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_thirdPartyMsgMorningWeekday != *((double *)v4 + 81)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_thirdPartyMsgMorningFri != *((double *)v4 + 78)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x2000) != 0)
  {
    if ((v8 & 0x2000) == 0 || self->_thirdPartyMsgMorningSat != *((double *)v4 + 79)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x2000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_thirdPartyMsgMorningSun != *((double *)v4 + 80)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_thirdPartyMsgNoonWeekday != *((double *)v4 + 89)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x100000) != 0)
  {
    if ((v8 & 0x100000) == 0 || self->_thirdPartyMsgNoonFri != *((double *)v4 + 86)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x100000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_thirdPartyMsgNoonSat != *((double *)v4 + 87)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_thirdPartyMsgNoonSun != *((double *)v4 + 88)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_thirdPartyMsgEveWeekday != *((double *)v4 + 77)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_thirdPartyMsgEveFri != *((double *)v4 + 74)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_thirdPartyMsgEveSat != *((double *)v4 + 75)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_thirdPartyMsgEveSun != *((double *)v4 + 76)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_thirdPartyMsgNightWeekday != *((double *)v4 + 85)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x80000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_thirdPartyMsgNightFri != *((double *)v4 + 82)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_thirdPartyMsgNightSat != *((double *)v4 + 83)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_thirdPartyMsgNightSun != *((double *)v4 + 84)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v7 & 0x10000000000000) == 0 || self->_callTotal != *((void *)v4 + 53)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x10000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_callBirthday != *((_DWORD *)v4 + 182)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_contactFavorite != *((_DWORD *)v4 + 187)) {
      goto LABEL_520;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v7 & 0x20000000000000) == 0 || self->_callTotalDur != *((double *)v4 + 54)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x20000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0 || self->_callLongRatio != *((double *)v4 + 38)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v7 & 0x8000000000000) == 0 || self->_callOutgoingRatio != *((double *)v4 + 52)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x8000000000000) != 0)
  {
    goto LABEL_520;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_callAvgDur != *((double *)v4 + 1)) {
      goto LABEL_520;
    }
  }
  else if (v7)
  {
    goto LABEL_520;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_callMaxDur != *((double *)v4 + 39)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_callMorningWeekday != *((double *)v4 + 43)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_callMorningFri != *((double *)v4 + 40)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_callMorningSat != *((double *)v4 + 41)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_callMorningSun != *((double *)v4 + 42)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v7 & 0x4000000000000) == 0 || self->_callNoonWeekday != *((double *)v4 + 51)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x4000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_callNoonFri != *((double *)v4 + 48)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_callNoonSat != *((double *)v4 + 49)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v7 & 0x2000000000000) == 0 || self->_callNoonSun != *((double *)v4 + 50)) {
      goto LABEL_520;
    }
  }
  else if ((v7 & 0x2000000000000) != 0)
  {
    goto LABEL_520;
  }
  uint64_t v10 = *((void *)v4 + 99);
  uint64_t v9 = *((void *)v4 + 100);
  if ((has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_callEveWeekday != *((double *)v4 + 21)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_callEveFri != *((double *)v4 + 18)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_callEveSat != *((double *)v4 + 19)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_callEveSun != *((double *)v4 + 20)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v10 & 0x400000000000) == 0 || self->_callNightWeekday != *((double *)v4 + 47)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x400000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v10 & 0x80000000000) == 0 || self->_callNightFri != *((double *)v4 + 44)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x80000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v10 & 0x100000000000) == 0 || self->_callNightSat != *((double *)v4 + 45)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x100000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v10 & 0x200000000000) == 0 || self->_callNightSun != *((double *)v4 + 46)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x200000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_callDurMorningWeekday != *((double *)v4 + 9)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_callDurMorningFri != *((double *)v4 + 6)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_callDurMorningSat != *((double *)v4 + 7)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_callDurMorningSun != *((double *)v4 + 8)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v10 & 0x10000) == 0 || self->_callDurNoonWeekday != *((double *)v4 + 17)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x10000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_callDurNoonFri != *((double *)v4 + 14)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_callDurNoonSat != *((double *)v4 + 15)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_callDurNoonSun != *((double *)v4 + 16)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_callDurEveWeekday != *((double *)v4 + 5)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_callDurEveFri != *((double *)v4 + 2)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_callDurEveSat != *((double *)v4 + 3)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_callDurEveSun != *((double *)v4 + 4)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_callDurNightWeekday != *((double *)v4 + 13)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_callDurNightFri != *((double *)v4 + 10)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_callDurNightSat != *((double *)v4 + 11)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_callDurNightSun != *((double *)v4 + 12)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) == 0 || self->_callLongMorningWeekday != *((double *)v4 + 29)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x10000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0 || self->_callLongMorningFri != *((double *)v4 + 26)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v10 & 0x4000000) == 0 || self->_callLongMorningSat != *((double *)v4 + 27)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x4000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v10 & 0x8000000) == 0 || self->_callLongMorningSun != *((double *)v4 + 28)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x8000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_callLongNoonWeekday != *((double *)v4 + 37)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_callLongNoonFri != *((double *)v4 + 34)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_callLongNoonSat != *((double *)v4 + 35)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_callLongNoonSun != *((double *)v4 + 36)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_callLongEveWeekday != *((double *)v4 + 25)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_callLongEveFri != *((double *)v4 + 22)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_callLongEveSat != *((double *)v4 + 23)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_callLongEveSun != *((double *)v4 + 24)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_callLongNightWeekday != *((double *)v4 + 33)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v10 & 0x20000000) == 0 || self->_callLongNightFri != *((double *)v4 + 30)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x20000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_callLongNightSat != *((double *)v4 + 31)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_520;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_callLongNightSun != *((double *)v4 + 32)) {
      goto LABEL_520;
    }
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v5 & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0 || self->_contactFamilyRelation != *((_DWORD *)v4 + 186)) {
      goto LABEL_520;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_520;
  }
  contactRelation = self->_contactRelation;
  if ((unint64_t)contactRelation | *((void *)v4 + 98)
    && !-[NSString isEqual:](contactRelation, "isEqual:"))
  {
    goto LABEL_520;
  }
  uint64_t v12 = *((void *)&self->_has + 1);
  uint64_t v13 = *((void *)v4 + 100);
  if ((v12 & 0x10000000) != 0)
  {
    if ((v13 & 0x10000000) == 0 || self->_contactFamilyName != *((_DWORD *)v4 + 185)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x10000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x4000000000) != 0)
  {
    if ((v13 & 0x4000000000) == 0 || self->_contactParent != *((_DWORD *)v4 + 195)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x4000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x4000000) != 0)
  {
    if ((v13 & 0x4000000) == 0 || self->_contactEmergency != *((_DWORD *)v4 + 183)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x4000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x8000000) != 0)
  {
    if ((v13 & 0x8000000) == 0 || self->_contactEmergencyFamily != *((_DWORD *)v4 + 184)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x8000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x1000000000) != 0)
  {
    if ((v13 & 0x1000000000) == 0 || self->_contactInHome != *((_DWORD *)v4 + 193)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x1000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x2000000000) != 0)
  {
    if ((v13 & 0x2000000000) == 0 || self->_contactInPhotos != *((_DWORD *)v4 + 194)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x2000000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x80000000) != 0)
  {
    if ((v13 & 0x80000000) == 0 || self->_contactInAirDrop != *((_DWORD *)v4 + 188)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x80000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x100000000) != 0)
  {
    if ((v13 & 0x100000000) == 0 || self->_contactInAirDropAtHome != *((_DWORD *)v4 + 189)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x100000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x400000000) != 0)
  {
    if ((v13 & 0x400000000) == 0 || self->_contactInFMFFollowingMe != *((_DWORD *)v4 + 191)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x400000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x800000000) != 0)
  {
    if ((v13 & 0x800000000) == 0 || self->_contactInFMFSharingWithMe != *((_DWORD *)v4 + 192)) {
      goto LABEL_520;
    }
  }
  else if ((v13 & 0x800000000) != 0)
  {
    goto LABEL_520;
  }
  if ((v12 & 0x200000000) == 0)
  {
    if ((v13 & 0x200000000) == 0) {
      goto LABEL_519;
    }
LABEL_520:
    BOOL v14 = 0;
    goto LABEL_521;
  }
  if ((v13 & 0x200000000) == 0 || self->_contactInFMFFavorite != *((_DWORD *)v4 + 190)) {
    goto LABEL_520;
  }
LABEL_519:
  BOOL v14 = self->_mailIntelligenceContactId == *((void *)v4 + 73);
LABEL_521:

  return v14;
}

- (void)setFirstPartyMsgTotal:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x80uLL;
  self->_firstPartyMsgTotal = a3;
}

- (void)setHasFirstPartyMsgTotal:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasFirstPartyMsgTotal
{
  return *((unsigned __int8 *)&self->_has + 8) >> 7;
}

- (void)setFirstPartyMsgOutgoingRatio:(double)a3
{
  *((void *)&self->_has + 1) |= 0x40uLL;
  self->_firstPartyMsgOutgoingRatio = a3;
}

- (void)setHasFirstPartyMsgOutgoingRatio:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasFirstPartyMsgOutgoingRatio
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setFirstPartyMsgMorningWeekday:(double)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_firstPartyMsgMorningWeekday = a3;
}

- (void)setHasFirstPartyMsgMorningWeekday:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setFirstPartyMsgMorningFri:(double)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_firstPartyMsgMorningFri = a3;
}

- (void)setHasFirstPartyMsgMorningFri:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningFri
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setFirstPartyMsgMorningSat:(double)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_firstPartyMsgMorningSat = a3;
}

- (void)setHasFirstPartyMsgMorningSat:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setFirstPartyMsgMorningSun:(double)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_firstPartyMsgMorningSun = a3;
}

- (void)setHasFirstPartyMsgMorningSun:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setFirstPartyMsgNoonWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 0x20uLL;
  self->_firstPartyMsgNoonWeekday = a3;
}

- (void)setHasFirstPartyMsgNoonWeekday:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setFirstPartyMsgNoonFri:(double)a3
{
  *((void *)&self->_has + 1) |= 4uLL;
  self->_firstPartyMsgNoonFri = a3;
}

- (void)setHasFirstPartyMsgNoonFri:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setFirstPartyMsgNoonSat:(double)a3
{
  *((void *)&self->_has + 1) |= 8uLL;
  self->_firstPartyMsgNoonSat = a3;
}

- (void)setHasFirstPartyMsgNoonSat:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasFirstPartyMsgNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setFirstPartyMsgNoonSun:(double)a3
{
  *((void *)&self->_has + 1) |= 0x10uLL;
  self->_firstPartyMsgNoonSun = a3;
}

- (void)setHasFirstPartyMsgNoonSun:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasFirstPartyMsgNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setFirstPartyMsgEveWeekday:(double)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_firstPartyMsgEveWeekday = a3;
}

- (void)setHasFirstPartyMsgEveWeekday:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setFirstPartyMsgEveFri:(double)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_firstPartyMsgEveFri = a3;
}

- (void)setHasFirstPartyMsgEveFri:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveFri
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setFirstPartyMsgEveSat:(double)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_firstPartyMsgEveSat = a3;
}

- (void)setHasFirstPartyMsgEveSat:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveSat
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setFirstPartyMsgEveSun:(double)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_firstPartyMsgEveSun = a3;
}

- (void)setHasFirstPartyMsgEveSun:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgEveSun
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setFirstPartyMsgNightWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 2uLL;
  self->_firstPartyMsgNightWeekday = a3;
}

- (void)setHasFirstPartyMsgNightWeekday:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasFirstPartyMsgNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setFirstPartyMsgNightFri:(double)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_firstPartyMsgNightFri = a3;
}

- (void)setHasFirstPartyMsgNightFri:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasFirstPartyMsgNightFri
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (void)setFirstPartyMsgNightSat:(double)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_firstPartyMsgNightSat = a3;
}

- (void)setHasFirstPartyMsgNightSat:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasFirstPartyMsgNightSat
{
  return *((unsigned __int8 *)&self->_has + 7) >> 7;
}

- (void)setFirstPartyMsgNightSun:(double)a3
{
  *((void *)&self->_has + 1) |= 1uLL;
  self->_firstPartyMsgNightSun = a3;
}

- (void)setHasFirstPartyMsgNightSun:(BOOL)a3
{
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasFirstPartyMsgNightSun
{
  return *((unsigned char *)&self->_has + 8) & 1;
}

- (void)setThirdPartyMsgTotal:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x1000000uLL;
  self->_thirdPartyMsgTotal = a3;
}

- (void)setHasThirdPartyMsgTotal:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgTotal
{
  return *((unsigned char *)&self->_has + 11) & 1;
}

- (void)setThirdPartyMsgMorningWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 0x8000uLL;
  self->_thirdPartyMsgMorningWeekday = a3;
}

- (void)setHasThirdPartyMsgMorningWeekday:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningWeekday
{
  return *((unsigned __int8 *)&self->_has + 9) >> 7;
}

- (void)setThirdPartyMsgMorningFri:(double)a3
{
  *((void *)&self->_has + 1) |= 0x1000uLL;
  self->_thirdPartyMsgMorningFri = a3;
}

- (void)setHasThirdPartyMsgMorningFri:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningFri
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 4) & 1;
}

- (void)setThirdPartyMsgMorningSat:(double)a3
{
  *((void *)&self->_has + 1) |= 0x2000uLL;
  self->_thirdPartyMsgMorningSat = a3;
}

- (void)setHasThirdPartyMsgMorningSat:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 5) & 1;
}

- (void)setThirdPartyMsgMorningSun:(double)a3
{
  *((void *)&self->_has + 1) |= 0x4000uLL;
  self->_thirdPartyMsgMorningSun = a3;
}

- (void)setHasThirdPartyMsgMorningSun:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 6) & 1;
}

- (void)setThirdPartyMsgNoonWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 0x800000uLL;
  self->_thirdPartyMsgNoonWeekday = a3;
}

- (void)setHasThirdPartyMsgNoonWeekday:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonWeekday
{
  return *((unsigned __int8 *)&self->_has + 10) >> 7;
}

- (void)setThirdPartyMsgNoonFri:(double)a3
{
  *((void *)&self->_has + 1) |= 0x100000uLL;
  self->_thirdPartyMsgNoonFri = a3;
}

- (void)setHasThirdPartyMsgNoonFri:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 4) & 1;
}

- (void)setThirdPartyMsgNoonSat:(double)a3
{
  *((void *)&self->_has + 1) |= 0x200000uLL;
  self->_thirdPartyMsgNoonSat = a3;
}

- (void)setHasThirdPartyMsgNoonSat:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 5) & 1;
}

- (void)setThirdPartyMsgNoonSun:(double)a3
{
  *((void *)&self->_has + 1) |= 0x400000uLL;
  self->_thirdPartyMsgNoonSun = a3;
}

- (void)setHasThirdPartyMsgNoonSun:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 6) & 1;
}

- (void)setThirdPartyMsgEveWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 0x800uLL;
  self->_thirdPartyMsgEveWeekday = a3;
}

- (void)setHasThirdPartyMsgEveWeekday:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 3) & 1;
}

- (void)setThirdPartyMsgEveFri:(double)a3
{
  *((void *)&self->_has + 1) |= 0x100uLL;
  self->_thirdPartyMsgEveFri = a3;
}

- (void)setHasThirdPartyMsgEveFri:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveFri
{
  return *((unsigned char *)&self->_has + 9) & 1;
}

- (void)setThirdPartyMsgEveSat:(double)a3
{
  *((void *)&self->_has + 1) |= 0x200uLL;
  self->_thirdPartyMsgEveSat = a3;
}

- (void)setHasThirdPartyMsgEveSat:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveSat
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 1) & 1;
}

- (void)setThirdPartyMsgEveSun:(double)a3
{
  *((void *)&self->_has + 1) |= 0x400uLL;
  self->_thirdPartyMsgEveSun = a3;
}

- (void)setHasThirdPartyMsgEveSun:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasThirdPartyMsgEveSun
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 2) & 1;
}

- (void)setThirdPartyMsgNightWeekday:(double)a3
{
  *((void *)&self->_has + 1) |= 0x80000uLL;
  self->_thirdPartyMsgNightWeekday = a3;
}

- (void)setHasThirdPartyMsgNightWeekday:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 3) & 1;
}

- (void)setThirdPartyMsgNightFri:(double)a3
{
  *((void *)&self->_has + 1) |= 0x10000uLL;
  self->_thirdPartyMsgNightFri = a3;
}

- (void)setHasThirdPartyMsgNightFri:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightFri
{
  return *((unsigned char *)&self->_has + 10) & 1;
}

- (void)setThirdPartyMsgNightSat:(double)a3
{
  *((void *)&self->_has + 1) |= 0x20000uLL;
  self->_thirdPartyMsgNightSat = a3;
}

- (void)setHasThirdPartyMsgNightSat:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightSat
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 1) & 1;
}

- (void)setThirdPartyMsgNightSun:(double)a3
{
  *((void *)&self->_has + 1) |= 0x40000uLL;
  self->_thirdPartyMsgNightSun = a3;
}

- (void)setHasThirdPartyMsgNightSun:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasThirdPartyMsgNightSun
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
}

- (void)setCallTotal:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_callTotal = a3;
}

- (void)setHasCallTotal:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTotal
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setCallBirthday:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x2000000uLL;
  self->_callBirthday = a3;
}

- (void)setHasCallBirthday:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasCallBirthday
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 1) & 1;
}

- (void)setContactFavorite:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x40000000uLL;
  self->_contactFavorite = a3;
}

- (void)setHasContactFavorite:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasContactFavorite
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 6) & 1;
}

- (void)setCallTotalDur:(double)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_callTotalDur = a3;
}

- (void)setHasCallTotalDur:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallTotalDur
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setCallLongRatio:(double)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_callLongRatio = a3;
}

- (void)setHasCallLongRatio:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongRatio
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCallOutgoingRatio:(double)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_callOutgoingRatio = a3;
}

- (void)setHasCallOutgoingRatio:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallOutgoingRatio
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setCallAvgDur:(double)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_callAvgDur = a3;
}

- (void)setHasCallAvgDur:(BOOL)a3
{
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasCallAvgDur
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setCallMaxDur:(double)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_callMaxDur = a3;
}

- (void)setHasCallMaxDur:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMaxDur
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setCallMorningWeekday:(double)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_callMorningWeekday = a3;
}

- (void)setHasCallMorningWeekday:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCallMorningFri:(double)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_callMorningFri = a3;
}

- (void)setHasCallMorningFri:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningFri
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCallMorningSat:(double)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_callMorningSat = a3;
}

- (void)setHasCallMorningSat:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningSat
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setCallMorningSun:(double)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_callMorningSun = a3;
}

- (void)setHasCallMorningSun:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCallNoonWeekday:(double)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_callNoonWeekday = a3;
}

- (void)setHasCallNoonWeekday:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setCallNoonFri:(double)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_callNoonFri = a3;
}

- (void)setHasCallNoonFri:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonFri
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setCallNoonSat:(double)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_callNoonSat = a3;
}

- (void)setHasCallNoonSat:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonSat
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setCallNoonSun:(double)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_callNoonSun = a3;
}

- (void)setHasCallNoonSun:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setCallEveWeekday:(double)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_callEveWeekday = a3;
}

- (void)setHasCallEveWeekday:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasCallEveWeekday
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCallEveFri:(double)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_callEveFri = a3;
}

- (void)setHasCallEveFri:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasCallEveFri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCallEveSat:(double)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_callEveSat = a3;
}

- (void)setHasCallEveSat:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasCallEveSat
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCallEveSun:(double)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_callEveSun = a3;
}

- (void)setHasCallEveSun:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasCallEveSun
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setCallNightWeekday:(double)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_callNightWeekday = a3;
}

- (void)setHasCallNightWeekday:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCallNightFri:(double)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_callNightFri = a3;
}

- (void)setHasCallNightFri:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightFri
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setCallNightSat:(double)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_callNightSat = a3;
}

- (void)setHasCallNightSat:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightSat
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setCallNightSun:(double)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_callNightSun = a3;
}

- (void)setHasCallNightSun:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasCallNightSun
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setCallDurMorningWeekday:(double)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_callDurMorningWeekday = a3;
}

- (void)setHasCallDurMorningWeekday:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCallDurMorningWeekday
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCallDurMorningFri:(double)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_callDurMorningFri = a3;
}

- (void)setHasCallDurMorningFri:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasCallDurMorningFri
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCallDurMorningSat:(double)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_callDurMorningSat = a3;
}

- (void)setHasCallDurMorningSat:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasCallDurMorningSat
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCallDurMorningSun:(double)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_callDurMorningSun = a3;
}

- (void)setHasCallDurMorningSun:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasCallDurMorningSun
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCallDurNoonWeekday:(double)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_callDurNoonWeekday = a3;
}

- (void)setHasCallDurNoonWeekday:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasCallDurNoonWeekday
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCallDurNoonFri:(double)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_callDurNoonFri = a3;
}

- (void)setHasCallDurNoonFri:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasCallDurNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCallDurNoonSat:(double)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_callDurNoonSat = a3;
}

- (void)setHasCallDurNoonSat:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasCallDurNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCallDurNoonSun:(double)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_callDurNoonSun = a3;
}

- (void)setHasCallDurNoonSun:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasCallDurNoonSun
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCallDurEveWeekday:(double)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_callDurEveWeekday = a3;
}

- (void)setHasCallDurEveWeekday:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasCallDurEveWeekday
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCallDurEveFri:(double)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_callDurEveFri = a3;
}

- (void)setHasCallDurEveFri:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasCallDurEveFri
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCallDurEveSat:(double)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_callDurEveSat = a3;
}

- (void)setHasCallDurEveSat:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasCallDurEveSat
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCallDurEveSun:(double)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_callDurEveSun = a3;
}

- (void)setHasCallDurEveSun:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasCallDurEveSun
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCallDurNightWeekday:(double)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_callDurNightWeekday = a3;
}

- (void)setHasCallDurNightWeekday:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasCallDurNightWeekday
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCallDurNightFri:(double)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_callDurNightFri = a3;
}

- (void)setHasCallDurNightFri:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasCallDurNightFri
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCallDurNightSat:(double)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_callDurNightSat = a3;
}

- (void)setHasCallDurNightSat:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasCallDurNightSat
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCallDurNightSun:(double)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_callDurNightSun = a3;
}

- (void)setHasCallDurNightSun:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasCallDurNightSun
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCallLongMorningWeekday:(double)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_callLongMorningWeekday = a3;
}

- (void)setHasCallLongMorningWeekday:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningWeekday
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setCallLongMorningFri:(double)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_callLongMorningFri = a3;
}

- (void)setHasCallLongMorningFri:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningFri
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCallLongMorningSat:(double)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_callLongMorningSat = a3;
}

- (void)setHasCallLongMorningSat:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningSat
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCallLongMorningSun:(double)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_callLongMorningSun = a3;
}

- (void)setHasCallLongMorningSun:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasCallLongMorningSun
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setCallLongNoonWeekday:(double)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_callLongNoonWeekday = a3;
}

- (void)setHasCallLongNoonWeekday:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonWeekday
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCallLongNoonFri:(double)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_callLongNoonFri = a3;
}

- (void)setHasCallLongNoonFri:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonFri
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setCallLongNoonSat:(double)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_callLongNoonSat = a3;
}

- (void)setHasCallLongNoonSat:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonSat
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setCallLongNoonSun:(double)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_callLongNoonSun = a3;
}

- (void)setHasCallLongNoonSun:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNoonSun
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setCallLongEveWeekday:(double)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_callLongEveWeekday = a3;
}

- (void)setHasCallLongEveWeekday:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasCallLongEveWeekday
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setCallLongEveFri:(double)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_callLongEveFri = a3;
}

- (void)setHasCallLongEveFri:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasCallLongEveFri
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCallLongEveSat:(double)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_callLongEveSat = a3;
}

- (void)setHasCallLongEveSat:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasCallLongEveSat
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCallLongEveSun:(double)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_callLongEveSun = a3;
}

- (void)setHasCallLongEveSun:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasCallLongEveSun
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setCallLongNightWeekday:(double)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_callLongNightWeekday = a3;
}

- (void)setHasCallLongNightWeekday:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightWeekday
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setCallLongNightFri:(double)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_callLongNightFri = a3;
}

- (void)setHasCallLongNightFri:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightFri
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setCallLongNightSat:(double)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_callLongNightSat = a3;
}

- (void)setHasCallLongNightSat:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightSat
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setCallLongNightSun:(double)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_callLongNightSun = a3;
}

- (void)setHasCallLongNightSun:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_uint64_t has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasCallLongNightSun
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setContactFamilyRelation:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x20000000uLL;
  self->_contactFamilyRelation = a3;
}

- (void)setHasContactFamilyRelation:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasContactFamilyRelation
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 5) & 1;
}

- (BOOL)hasContactRelation
{
  return self->_contactRelation != 0;
}

- (void)setContactFamilyName:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x10000000uLL;
  self->_contactFamilyName = a3;
}

- (void)setHasContactFamilyName:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasContactFamilyName
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 4) & 1;
}

- (void)setContactParent:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x4000000000uLL;
  self->_contactParent = a3;
}

- (void)setHasContactParent:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasContactParent
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 6) & 1;
}

- (void)setContactEmergency:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x4000000uLL;
  self->_contactEmergency = a3;
}

- (void)setHasContactEmergency:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasContactEmergency
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 2) & 1;
}

- (void)setContactEmergencyFamily:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x8000000uLL;
  self->_contactEmergencyFamily = a3;
}

- (void)setHasContactEmergencyFamily:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasContactEmergencyFamily
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 3) & 1;
}

- (void)setContactInHome:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x1000000000uLL;
  self->_contactInHome = a3;
}

- (void)setHasContactInHome:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInHome
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 4) & 1;
}

- (void)setContactInPhotos:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x2000000000uLL;
  self->_contactInPhotos = a3;
}

- (void)setHasContactInPhotos:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasContactInPhotos
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 5) & 1;
}

- (void)setContactInAirDrop:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x80000000uLL;
  self->_contactInAirDrop = a3;
}

- (void)setHasContactInAirDrop:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasContactInAirDrop
{
  return *((unsigned __int8 *)&self->_has + 11) >> 7;
}

- (void)setContactInAirDropAtHome:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x100000000uLL;
  self->_contactInAirDropAtHome = a3;
}

- (void)setHasContactInAirDropAtHome:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasContactInAirDropAtHome
{
  return *((unsigned char *)&self->_has + 12) & 1;
}

- (void)setContactInFMFFollowingMe:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x400000000uLL;
  self->_contactInFMFFollowingMe = a3;
}

- (void)setHasContactInFMFFollowingMe:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFFollowingMe
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 2) & 1;
}

- (void)setContactInFMFSharingWithMe:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x800000000uLL;
  self->_contactInFMFSharingWithMe = a3;
}

- (void)setHasContactInFMFSharingWithMe:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFSharingWithMe
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 3) & 1;
}

- (void)setContactInFMFFavorite:(unsigned int)a3
{
  *((void *)&self->_has + 1) |= 0x200000000uLL;
  self->_contactInFMFFavorite = a3;
}

- (void)setHasContactInFMFFavorite:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasContactInFMFFavorite
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 1) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MailIntelligencePETContactEvent;
  id v4 = [(MailIntelligencePETContactEvent *)&v8 description];
  uint64_t v5 = [(MailIntelligencePETContactEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return MailIntelligencePETContactEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_uint64_t has = &self->_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  id v9 = v4;
  if ((v6 & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t v6 = *((void *)&self->_has + 1);
  }
  uint64_t v7 = *(void *)p_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v7 = *(void *)p_has;
    uint64_t v6 = *((void *)&self->_has + 1);
    if ((*(void *)p_has & 0x2000000000000000) == 0)
    {
LABEL_5:
      if ((v7 & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_114;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((v7 & 0x800000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000000000) == 0)
  {
LABEL_7:
    if ((v7 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000000000) == 0)
  {
LABEL_8:
    if ((v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x20) == 0)
  {
LABEL_9:
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v7 & 0x200000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000000000) == 0)
  {
LABEL_13:
    if ((v7 & 0x40000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000000000) == 0)
  {
LABEL_14:
    if ((v7 & 0x80000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000000000) == 0)
  {
LABEL_15:
    if ((v7 & 0x100000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000000000) == 0)
  {
LABEL_16:
    if ((v6 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x4000000000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v7 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000000000) == 0)
  {
LABEL_19:
    if ((v6 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 1) == 0)
  {
LABEL_20:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x8000) == 0)
  {
LABEL_22:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x1000) == 0)
  {
LABEL_23:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x2000) == 0)
  {
LABEL_24:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x4000) == 0)
  {
LABEL_25:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x800000) == 0)
  {
LABEL_26:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x100000) == 0)
  {
LABEL_27:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x200000) == 0)
  {
LABEL_28:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x400000) == 0)
  {
LABEL_29:
    if ((v6 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x800) == 0)
  {
LABEL_30:
    if ((v6 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x100) == 0)
  {
LABEL_31:
    if ((v6 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x200) == 0)
  {
LABEL_32:
    if ((v6 & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x400) == 0)
  {
LABEL_33:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x80000) == 0)
  {
LABEL_34:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x10000) == 0)
  {
LABEL_35:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x20000) == 0)
  {
LABEL_36:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x40000) == 0)
  {
LABEL_37:
    if ((v7 & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_40:
    if ((v7 & 0x20000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000000000) == 0)
  {
LABEL_41:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000000) == 0)
  {
LABEL_42:
    if ((v7 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((v7 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 1) == 0)
  {
LABEL_44:
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000000) == 0)
  {
LABEL_47:
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v7 & 0x20000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000000) == 0)
  {
LABEL_49:
    if ((v7 & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((v7 & 0x800000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000000) == 0)
  {
LABEL_51:
    if ((v7 & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v7 & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000) == 0)
  {
LABEL_54:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000) == 0)
  {
LABEL_55:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000) == 0)
  {
LABEL_56:
    if ((v7 & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000) == 0)
  {
LABEL_57:
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v7 & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000000) == 0)
  {
LABEL_59:
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000000) == 0)
  {
LABEL_60:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000000) == 0)
  {
LABEL_61:
    if ((v7 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100) == 0)
  {
LABEL_62:
    if ((v7 & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20) == 0)
  {
LABEL_63:
    if ((v7 & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40) == 0)
  {
LABEL_64:
    if ((v7 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80) == 0)
  {
LABEL_65:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000) == 0)
  {
LABEL_66:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000) == 0)
  {
LABEL_67:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000) == 0)
  {
LABEL_68:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000) == 0)
  {
LABEL_69:
    if ((v7 & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10) == 0)
  {
LABEL_70:
    if ((v7 & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 2) == 0)
  {
LABEL_71:
    if ((v7 & 4) == 0) {
      goto LABEL_72;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 4) == 0)
  {
LABEL_72:
    if ((v7 & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 8) == 0)
  {
LABEL_73:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000) == 0)
  {
LABEL_74:
    if ((v7 & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200) == 0)
  {
LABEL_75:
    if ((v7 & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400) == 0)
  {
LABEL_76:
    if ((v7 & 0x800) == 0) {
      goto LABEL_77;
    }
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800) == 0)
  {
LABEL_77:
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x10000000) == 0)
  {
LABEL_78:
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x2000000) == 0)
  {
LABEL_79:
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x4000000) == 0)
  {
LABEL_80:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x8000000) == 0)
  {
LABEL_81:
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000000) == 0)
  {
LABEL_82:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000000) == 0)
  {
LABEL_83:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000000) == 0)
  {
LABEL_84:
    if ((v7 & 0x800000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000000) == 0)
  {
LABEL_85:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x1000000) == 0)
  {
LABEL_86:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x200000) == 0)
  {
LABEL_87:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x400000) == 0)
  {
LABEL_88:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x800000) == 0)
  {
LABEL_89:
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_198;
  }
LABEL_197:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x100000000) == 0)
  {
LABEL_90:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_199;
  }
LABEL_198:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x20000000) == 0)
  {
LABEL_91:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_200;
  }
LABEL_199:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = *(void *)p_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x40000000) == 0)
  {
LABEL_92:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_201;
  }
LABEL_200:
  PBDataWriterWriteDoubleField();
  uint64_t v6 = *((void *)&self->_has + 1);
  if ((*(void *)p_has & 0x80000000) == 0)
  {
LABEL_93:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
LABEL_201:
  PBDataWriterWriteDoubleField();
  if ((*((void *)&self->_has + 1) & 0x20000000) != 0) {
LABEL_94:
  }
    PBDataWriterWriteUint32Field();
LABEL_95:
  if (self->_contactRelation) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x10000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v8 = *((void *)&self->_has + 1);
    if ((v8 & 0x4000000000) == 0)
    {
LABEL_99:
      if ((v8 & 0x4000000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_205;
    }
  }
  else if ((v8 & 0x4000000000) == 0)
  {
    goto LABEL_99;
  }
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x4000000) == 0)
  {
LABEL_100:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_206;
  }
LABEL_205:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_101:
    if ((v8 & 0x1000000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_207;
  }
LABEL_206:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_102:
    if ((v8 & 0x2000000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_208;
  }
LABEL_207:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_103:
    if ((v8 & 0x80000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_209;
  }
LABEL_208:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x80000000) == 0)
  {
LABEL_104:
    if ((v8 & 0x100000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_210;
  }
LABEL_209:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v8 & 0x400000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_211;
  }
LABEL_210:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x400000000) == 0)
  {
LABEL_106:
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_212;
  }
LABEL_211:
  PBDataWriterWriteUint32Field();
  uint64_t v8 = *((void *)&self->_has + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_107:
    if ((v8 & 0x200000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_212:
  PBDataWriterWriteUint32Field();
  if ((*((void *)&self->_has + 1) & 0x200000000) != 0) {
LABEL_108:
  }
    PBDataWriterWriteUint32Field();
LABEL_109:
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80) != 0)
  {
    v4[72] = self->_firstPartyMsgTotal;
    v4[100] |= 0x80uLL;
    uint64_t v5 = *((void *)&self->_has + 1);
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v5 & 0x40) != 0)
  {
    v4[71] = *(void *)&self->_firstPartyMsgOutgoingRatio;
    v4[100] |= 0x40uLL;
    uint64_t has = (uint64_t)self->_has;
    uint64_t v5 = *((void *)&self->_has + 1);
    if ((has & 0x2000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_114;
    }
  }
  else if ((has & 0x2000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v4[62] = *(void *)&self->_firstPartyMsgMorningWeekday;
  v4[99] |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_115;
  }
LABEL_114:
  v4[59] = *(void *)&self->_firstPartyMsgMorningFri;
  v4[99] |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_116;
  }
LABEL_115:
  v4[60] = *(void *)&self->_firstPartyMsgMorningSat;
  v4[99] |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_117;
  }
LABEL_116:
  v4[61] = *(void *)&self->_firstPartyMsgMorningSun;
  v4[99] |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_118;
  }
LABEL_117:
  v4[70] = *(void *)&self->_firstPartyMsgNoonWeekday;
  v4[100] |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_119;
  }
LABEL_118:
  v4[67] = *(void *)&self->_firstPartyMsgNoonFri;
  v4[100] |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_120;
  }
LABEL_119:
  v4[68] = *(void *)&self->_firstPartyMsgNoonSat;
  v4[100] |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_121;
  }
LABEL_120:
  v4[69] = *(void *)&self->_firstPartyMsgNoonSun;
  v4[100] |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_122;
  }
LABEL_121:
  v4[58] = *(void *)&self->_firstPartyMsgEveWeekday;
  v4[99] |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_123;
  }
LABEL_122:
  v4[55] = *(void *)&self->_firstPartyMsgEveFri;
  v4[99] |= 0x40000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_124;
  }
LABEL_123:
  v4[56] = *(void *)&self->_firstPartyMsgEveSat;
  v4[99] |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_125;
  }
LABEL_124:
  v4[57] = *(void *)&self->_firstPartyMsgEveSun;
  v4[99] |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_126;
  }
LABEL_125:
  v4[66] = *(void *)&self->_firstPartyMsgNightWeekday;
  v4[100] |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_127;
  }
LABEL_126:
  v4[63] = *(void *)&self->_firstPartyMsgNightFri;
  v4[99] |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_128;
  }
LABEL_127:
  v4[64] = *(void *)&self->_firstPartyMsgNightSat;
  v4[99] |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_129;
  }
LABEL_128:
  v4[65] = *(void *)&self->_firstPartyMsgNightSun;
  v4[100] |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_130;
  }
LABEL_129:
  v4[90] = self->_thirdPartyMsgTotal;
  v4[100] |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_131;
  }
LABEL_130:
  v4[81] = *(void *)&self->_thirdPartyMsgMorningWeekday;
  v4[100] |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_132;
  }
LABEL_131:
  v4[78] = *(void *)&self->_thirdPartyMsgMorningFri;
  v4[100] |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_133;
  }
LABEL_132:
  v4[79] = *(void *)&self->_thirdPartyMsgMorningSat;
  v4[100] |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x4000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_134;
  }
LABEL_133:
  v4[80] = *(void *)&self->_thirdPartyMsgMorningSun;
  v4[100] |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_135;
  }
LABEL_134:
  v4[89] = *(void *)&self->_thirdPartyMsgNoonWeekday;
  v4[100] |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_136;
  }
LABEL_135:
  v4[86] = *(void *)&self->_thirdPartyMsgNoonFri;
  v4[100] |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_137;
  }
LABEL_136:
  v4[87] = *(void *)&self->_thirdPartyMsgNoonSat;
  v4[100] |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_138;
  }
LABEL_137:
  v4[88] = *(void *)&self->_thirdPartyMsgNoonSun;
  v4[100] |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_30:
    if ((v5 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_139;
  }
LABEL_138:
  v4[77] = *(void *)&self->_thirdPartyMsgEveWeekday;
  v4[100] |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_31:
    if ((v5 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_140;
  }
LABEL_139:
  v4[74] = *(void *)&self->_thirdPartyMsgEveFri;
  v4[100] |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_32:
    if ((v5 & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_141;
  }
LABEL_140:
  v4[75] = *(void *)&self->_thirdPartyMsgEveSat;
  v4[100] |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_142;
  }
LABEL_141:
  v4[76] = *(void *)&self->_thirdPartyMsgEveSun;
  v4[100] |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_143;
  }
LABEL_142:
  v4[85] = *(void *)&self->_thirdPartyMsgNightWeekday;
  v4[100] |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_144;
  }
LABEL_143:
  v4[82] = *(void *)&self->_thirdPartyMsgNightFri;
  v4[100] |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_145;
  }
LABEL_144:
  v4[83] = *(void *)&self->_thirdPartyMsgNightSat;
  v4[100] |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_146;
  }
LABEL_145:
  v4[84] = *(void *)&self->_thirdPartyMsgNightSun;
  v4[100] |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_147;
  }
LABEL_146:
  v4[53] = self->_callTotal;
  v4[99] |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((_DWORD *)v4 + 182) = self->_callBirthday;
  v4[100] |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_40:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((_DWORD *)v4 + 187) = self->_contactFavorite;
  v4[100] |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_41:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_150;
  }
LABEL_149:
  v4[54] = *(void *)&self->_callTotalDur;
  v4[99] |= 0x20000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_42:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_151;
  }
LABEL_150:
  v4[38] = *(void *)&self->_callLongRatio;
  v4[99] |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((has & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_152;
  }
LABEL_151:
  v4[52] = *(void *)&self->_callOutgoingRatio;
  v4[99] |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_44:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_153;
  }
LABEL_152:
  v4[1] = *(void *)&self->_callAvgDur;
  v4[99] |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_154;
  }
LABEL_153:
  v4[39] = *(void *)&self->_callMaxDur;
  v4[99] |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_46:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_155;
  }
LABEL_154:
  v4[43] = *(void *)&self->_callMorningWeekday;
  v4[99] |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_47:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_156;
  }
LABEL_155:
  v4[40] = *(void *)&self->_callMorningFri;
  v4[99] |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_157;
  }
LABEL_156:
  v4[41] = *(void *)&self->_callMorningSat;
  v4[99] |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_158;
  }
LABEL_157:
  v4[42] = *(void *)&self->_callMorningSun;
  v4[99] |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_159;
  }
LABEL_158:
  v4[51] = *(void *)&self->_callNoonWeekday;
  v4[99] |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_160;
  }
LABEL_159:
  v4[48] = *(void *)&self->_callNoonFri;
  v4[99] |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_161;
  }
LABEL_160:
  v4[49] = *(void *)&self->_callNoonSat;
  v4[99] |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_162;
  }
LABEL_161:
  v4[50] = *(void *)&self->_callNoonSun;
  v4[99] |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_54:
    if ((has & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_163;
  }
LABEL_162:
  v4[21] = *(void *)&self->_callEveWeekday;
  v4[99] |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_55:
    if ((has & 0x40000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_164;
  }
LABEL_163:
  v4[18] = *(void *)&self->_callEveFri;
  v4[99] |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_56:
    if ((has & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_165;
  }
LABEL_164:
  v4[19] = *(void *)&self->_callEveSat;
  v4[99] |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_57:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_166;
  }
LABEL_165:
  v4[20] = *(void *)&self->_callEveSun;
  v4[99] |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_58:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_167;
  }
LABEL_166:
  v4[47] = *(void *)&self->_callNightWeekday;
  v4[99] |= 0x400000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_59:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_168;
  }
LABEL_167:
  v4[44] = *(void *)&self->_callNightFri;
  v4[99] |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_60:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_169;
  }
LABEL_168:
  v4[45] = *(void *)&self->_callNightSat;
  v4[99] |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_61:
    if ((has & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_170;
  }
LABEL_169:
  v4[46] = *(void *)&self->_callNightSun;
  v4[99] |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_171;
  }
LABEL_170:
  v4[9] = *(void *)&self->_callDurMorningWeekday;
  v4[99] |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_172;
  }
LABEL_171:
  v4[6] = *(void *)&self->_callDurMorningFri;
  v4[99] |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_173;
  }
LABEL_172:
  v4[7] = *(void *)&self->_callDurMorningSat;
  v4[99] |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_65:
    if ((has & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_174;
  }
LABEL_173:
  v4[8] = *(void *)&self->_callDurMorningSun;
  v4[99] |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_66:
    if ((has & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_175;
  }
LABEL_174:
  v4[17] = *(void *)&self->_callDurNoonWeekday;
  v4[99] |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_67:
    if ((has & 0x4000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_176;
  }
LABEL_175:
  v4[14] = *(void *)&self->_callDurNoonFri;
  v4[99] |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_68:
    if ((has & 0x8000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_177;
  }
LABEL_176:
  v4[15] = *(void *)&self->_callDurNoonSat;
  v4[99] |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_178;
  }
LABEL_177:
  v4[16] = *(void *)&self->_callDurNoonSun;
  v4[99] |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_179;
  }
LABEL_178:
  v4[5] = *(void *)&self->_callDurEveWeekday;
  v4[99] |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 2) == 0)
  {
LABEL_71:
    if ((has & 4) == 0) {
      goto LABEL_72;
    }
    goto LABEL_180;
  }
LABEL_179:
  v4[2] = *(void *)&self->_callDurEveFri;
  v4[99] |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_72:
    if ((has & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_181;
  }
LABEL_180:
  v4[3] = *(void *)&self->_callDurEveSat;
  v4[99] |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_73:
    if ((has & 0x1000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_182;
  }
LABEL_181:
  v4[4] = *(void *)&self->_callDurEveSun;
  v4[99] |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_74:
    if ((has & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_183;
  }
LABEL_182:
  v4[13] = *(void *)&self->_callDurNightWeekday;
  v4[99] |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_75:
    if ((has & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_184;
  }
LABEL_183:
  v4[10] = *(void *)&self->_callDurNightFri;
  v4[99] |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_76:
    if ((has & 0x800) == 0) {
      goto LABEL_77;
    }
    goto LABEL_185;
  }
LABEL_184:
  v4[11] = *(void *)&self->_callDurNightSat;
  v4[99] |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_77:
    if ((has & 0x10000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_186;
  }
LABEL_185:
  v4[12] = *(void *)&self->_callDurNightSun;
  v4[99] |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_78:
    if ((has & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_187;
  }
LABEL_186:
  v4[29] = *(void *)&self->_callLongMorningWeekday;
  v4[99] |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_79:
    if ((has & 0x4000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_188;
  }
LABEL_187:
  v4[26] = *(void *)&self->_callLongMorningFri;
  v4[99] |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_80:
    if ((has & 0x8000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_189;
  }
LABEL_188:
  v4[27] = *(void *)&self->_callLongMorningSat;
  v4[99] |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_81:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_190;
  }
LABEL_189:
  v4[28] = *(void *)&self->_callLongMorningSun;
  v4[99] |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_82:
    if ((has & 0x200000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_191;
  }
LABEL_190:
  v4[37] = *(void *)&self->_callLongNoonWeekday;
  v4[99] |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_83:
    if ((has & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_192;
  }
LABEL_191:
  v4[34] = *(void *)&self->_callLongNoonFri;
  v4[99] |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_84:
    if ((has & 0x800000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_193;
  }
LABEL_192:
  v4[35] = *(void *)&self->_callLongNoonSat;
  v4[99] |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_85:
    if ((has & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_194;
  }
LABEL_193:
  v4[36] = *(void *)&self->_callLongNoonSun;
  v4[99] |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_86:
    if ((has & 0x200000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_195;
  }
LABEL_194:
  v4[25] = *(void *)&self->_callLongEveWeekday;
  v4[99] |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_87:
    if ((has & 0x400000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_196;
  }
LABEL_195:
  v4[22] = *(void *)&self->_callLongEveFri;
  v4[99] |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_88:
    if ((has & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_197;
  }
LABEL_196:
  v4[23] = *(void *)&self->_callLongEveSat;
  v4[99] |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_89:
    if ((has & 0x100000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_198;
  }
LABEL_197:
  v4[24] = *(void *)&self->_callLongEveSun;
  v4[99] |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_90:
    if ((has & 0x20000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_199;
  }
LABEL_198:
  v4[33] = *(void *)&self->_callLongNightWeekday;
  v4[99] |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_91:
    if ((has & 0x40000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_200;
  }
LABEL_199:
  v4[30] = *(void *)&self->_callLongNightFri;
  v4[99] |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_92:
    if ((has & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_201;
  }
LABEL_200:
  v4[31] = *(void *)&self->_callLongNightSat;
  v4[99] |= 0x40000000uLL;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 0x80000000) == 0)
  {
LABEL_93:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
LABEL_201:
  v4[32] = *(void *)&self->_callLongNightSun;
  v4[99] |= 0x80000000uLL;
  if ((*((void *)&self->_has + 1) & 0x20000000) != 0)
  {
LABEL_94:
    *((_DWORD *)v4 + 186) = self->_contactFamilyRelation;
    v4[100] |= 0x20000000uLL;
  }
LABEL_95:
  if (self->_contactRelation)
  {
    uint64_t v8 = v4;
    objc_msgSend(v4, "setContactRelation:");
    id v4 = v8;
  }
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x10000000) != 0)
  {
    *((_DWORD *)v4 + 185) = self->_contactFamilyName;
    v4[100] |= 0x10000000uLL;
    uint64_t v7 = *((void *)&self->_has + 1);
    if ((v7 & 0x4000000000) == 0)
    {
LABEL_99:
      if ((v7 & 0x4000000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_205;
    }
  }
  else if ((v7 & 0x4000000000) == 0)
  {
    goto LABEL_99;
  }
  *((_DWORD *)v4 + 195) = self->_contactParent;
  v4[100] |= 0x4000000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_206;
  }
LABEL_205:
  *((_DWORD *)v4 + 183) = self->_contactEmergency;
  v4[100] |= 0x4000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_207;
  }
LABEL_206:
  *((_DWORD *)v4 + 184) = self->_contactEmergencyFamily;
  v4[100] |= 0x8000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_102:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_208;
  }
LABEL_207:
  *((_DWORD *)v4 + 193) = self->_contactInHome;
  v4[100] |= 0x1000000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_103:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_209;
  }
LABEL_208:
  *((_DWORD *)v4 + 194) = self->_contactInPhotos;
  v4[100] |= 0x2000000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_104:
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_210;
  }
LABEL_209:
  *((_DWORD *)v4 + 188) = self->_contactInAirDrop;
  v4[100] |= 0x80000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_211;
  }
LABEL_210:
  *((_DWORD *)v4 + 189) = self->_contactInAirDropAtHome;
  v4[100] |= 0x100000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_106:
    if ((v7 & 0x800000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_212;
  }
LABEL_211:
  *((_DWORD *)v4 + 191) = self->_contactInFMFFollowingMe;
  v4[100] |= 0x400000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x800000000) == 0)
  {
LABEL_107:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_212:
  *((_DWORD *)v4 + 192) = self->_contactInFMFSharingWithMe;
  v4[100] |= 0x800000000uLL;
  if ((*((void *)&self->_has + 1) & 0x200000000) != 0)
  {
LABEL_108:
    *((_DWORD *)v4 + 190) = self->_contactInFMFFavorite;
    v4[100] |= 0x200000000uLL;
  }
LABEL_109:
  v4[73] = self->_mailIntelligenceContactId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x80) != 0)
  {
    *(void *)(v5 + 576) = self->_firstPartyMsgTotal;
    *(void *)(v5 + 800) |= 0x80uLL;
    uint64_t v7 = *((void *)&self->_has + 1);
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v7 & 0x40) != 0)
  {
    *(double *)(v5 + 568) = self->_firstPartyMsgOutgoingRatio;
    *(void *)(v5 + 800) |= 0x40uLL;
    uint64_t has = (uint64_t)self->_has;
    uint64_t v7 = *((void *)&self->_has + 1);
    if ((has & 0x2000000000000000) == 0)
    {
LABEL_5:
      if ((has & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_110;
    }
  }
  else if ((has & 0x2000000000000000) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 496) = self->_firstPartyMsgMorningWeekday;
  *(void *)(v5 + 792) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_111;
  }
LABEL_110:
  *(double *)(v5 + 472) = self->_firstPartyMsgMorningFri;
  *(void *)(v5 + 792) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_7:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_112;
  }
LABEL_111:
  *(double *)(v5 + 480) = self->_firstPartyMsgMorningSat;
  *(void *)(v5 + 792) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_113;
  }
LABEL_112:
  *(double *)(v5 + 488) = self->_firstPartyMsgMorningSun;
  *(void *)(v5 + 792) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_9:
    if ((v7 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_114;
  }
LABEL_113:
  *(double *)(v5 + 560) = self->_firstPartyMsgNoonWeekday;
  *(void *)(v5 + 800) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(double *)(v5 + 536) = self->_firstPartyMsgNoonFri;
  *(void *)(v5 + 800) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 8) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(double *)(v5 + 544) = self->_firstPartyMsgNoonSat;
  *(void *)(v5 + 800) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_117;
  }
LABEL_116:
  *(double *)(v5 + 552) = self->_firstPartyMsgNoonSun;
  *(void *)(v5 + 800) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_13:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_118;
  }
LABEL_117:
  *(double *)(v5 + 464) = self->_firstPartyMsgEveWeekday;
  *(void *)(v5 + 792) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_119;
  }
LABEL_118:
  *(double *)(v5 + 440) = self->_firstPartyMsgEveFri;
  *(void *)(v5 + 792) |= 0x40000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_120;
  }
LABEL_119:
  *(double *)(v5 + 448) = self->_firstPartyMsgEveSat;
  *(void *)(v5 + 792) |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_121;
  }
LABEL_120:
  *(double *)(v5 + 456) = self->_firstPartyMsgEveSun;
  *(void *)(v5 + 792) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 2) == 0)
  {
LABEL_17:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_122;
  }
LABEL_121:
  *(double *)(v5 + 528) = self->_firstPartyMsgNightWeekday;
  *(void *)(v5 + 800) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_123;
  }
LABEL_122:
  *(double *)(v5 + 504) = self->_firstPartyMsgNightFri;
  *(void *)(v5 + 792) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_19:
    if ((v7 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_124;
  }
LABEL_123:
  *(double *)(v5 + 512) = self->_firstPartyMsgNightSat;
  *(void *)(v5 + 792) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 1) == 0)
  {
LABEL_20:
    if ((v7 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_125;
  }
LABEL_124:
  *(double *)(v5 + 520) = self->_firstPartyMsgNightSun;
  *(void *)(v5 + 800) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_126;
  }
LABEL_125:
  *(void *)(v5 + 720) = self->_thirdPartyMsgTotal;
  *(void *)(v5 + 800) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x8000) == 0)
  {
LABEL_22:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_127;
  }
LABEL_126:
  *(double *)(v5 + 648) = self->_thirdPartyMsgMorningWeekday;
  *(void *)(v5 + 800) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x1000) == 0)
  {
LABEL_23:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_128;
  }
LABEL_127:
  *(double *)(v5 + 624) = self->_thirdPartyMsgMorningFri;
  *(void *)(v5 + 800) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x2000) == 0)
  {
LABEL_24:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_129;
  }
LABEL_128:
  *(double *)(v5 + 632) = self->_thirdPartyMsgMorningSat;
  *(void *)(v5 + 800) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x4000) == 0)
  {
LABEL_25:
    if ((v7 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_130;
  }
LABEL_129:
  *(double *)(v5 + 640) = self->_thirdPartyMsgMorningSun;
  *(void *)(v5 + 800) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x800000) == 0)
  {
LABEL_26:
    if ((v7 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_131;
  }
LABEL_130:
  *(double *)(v5 + 712) = self->_thirdPartyMsgNoonWeekday;
  *(void *)(v5 + 800) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x100000) == 0)
  {
LABEL_27:
    if ((v7 & 0x200000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_132;
  }
LABEL_131:
  *(double *)(v5 + 688) = self->_thirdPartyMsgNoonFri;
  *(void *)(v5 + 800) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x200000) == 0)
  {
LABEL_28:
    if ((v7 & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_133;
  }
LABEL_132:
  *(double *)(v5 + 696) = self->_thirdPartyMsgNoonSat;
  *(void *)(v5 + 800) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x400000) == 0)
  {
LABEL_29:
    if ((v7 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_134;
  }
LABEL_133:
  *(double *)(v5 + 704) = self->_thirdPartyMsgNoonSun;
  *(void *)(v5 + 800) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x800) == 0)
  {
LABEL_30:
    if ((v7 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_135;
  }
LABEL_134:
  *(double *)(v5 + 616) = self->_thirdPartyMsgEveWeekday;
  *(void *)(v5 + 800) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_31:
    if ((v7 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_136;
  }
LABEL_135:
  *(double *)(v5 + 592) = self->_thirdPartyMsgEveFri;
  *(void *)(v5 + 800) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_32:
    if ((v7 & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_137;
  }
LABEL_136:
  *(double *)(v5 + 600) = self->_thirdPartyMsgEveSat;
  *(void *)(v5 + 800) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_33:
    if ((v7 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(double *)(v5 + 608) = self->_thirdPartyMsgEveSun;
  *(void *)(v5 + 800) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x80000) == 0)
  {
LABEL_34:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_139;
  }
LABEL_138:
  *(double *)(v5 + 680) = self->_thirdPartyMsgNightWeekday;
  *(void *)(v5 + 800) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x10000) == 0)
  {
LABEL_35:
    if ((v7 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_140;
  }
LABEL_139:
  *(double *)(v5 + 656) = self->_thirdPartyMsgNightFri;
  *(void *)(v5 + 800) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x20000) == 0)
  {
LABEL_36:
    if ((v7 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_141;
  }
LABEL_140:
  *(double *)(v5 + 664) = self->_thirdPartyMsgNightSat;
  *(void *)(v5 + 800) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x40000) == 0)
  {
LABEL_37:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_142;
  }
LABEL_141:
  *(double *)(v5 + 672) = self->_thirdPartyMsgNightSun;
  *(void *)(v5 + 800) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_143;
  }
LABEL_142:
  *(void *)(v5 + 424) = self->_callTotal;
  *(void *)(v5 + 792) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_144;
  }
LABEL_143:
  *(_DWORD *)(v5 + 728) = self->_callBirthday;
  *(void *)(v5 + 800) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((v7 & 0x40000000) == 0)
  {
LABEL_40:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_145;
  }
LABEL_144:
  *(_DWORD *)(v5 + 748) = self->_contactFavorite;
  *(void *)(v5 + 800) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_41:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_146;
  }
LABEL_145:
  *(double *)(v5 + 432) = self->_callTotalDur;
  *(void *)(v5 + 792) |= 0x20000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_42:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_147;
  }
LABEL_146:
  *(double *)(v5 + 304) = self->_callLongRatio;
  *(void *)(v5 + 792) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((has & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_148;
  }
LABEL_147:
  *(double *)(v5 + 416) = self->_callOutgoingRatio;
  *(void *)(v5 + 792) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_44:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_149;
  }
LABEL_148:
  *(double *)(v5 + 8) = self->_callAvgDur;
  *(void *)(v5 + 792) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_45:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_150;
  }
LABEL_149:
  *(double *)(v5 + 312) = self->_callMaxDur;
  *(void *)(v5 + 792) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_46:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_151;
  }
LABEL_150:
  *(double *)(v5 + 344) = self->_callMorningWeekday;
  *(void *)(v5 + 792) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_47:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_152;
  }
LABEL_151:
  *(double *)(v5 + 320) = self->_callMorningFri;
  *(void *)(v5 + 792) |= 0x8000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_48:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_153;
  }
LABEL_152:
  *(double *)(v5 + 328) = self->_callMorningSat;
  *(void *)(v5 + 792) |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_49:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_154;
  }
LABEL_153:
  *(double *)(v5 + 336) = self->_callMorningSun;
  *(void *)(v5 + 792) |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_155;
  }
LABEL_154:
  *(double *)(v5 + 408) = self->_callNoonWeekday;
  *(void *)(v5 + 792) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_51:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_156;
  }
LABEL_155:
  *(double *)(v5 + 384) = self->_callNoonFri;
  *(void *)(v5 + 792) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_157;
  }
LABEL_156:
  *(double *)(v5 + 392) = self->_callNoonSat;
  *(void *)(v5 + 792) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((has & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_158;
  }
LABEL_157:
  *(double *)(v5 + 400) = self->_callNoonSun;
  *(void *)(v5 + 792) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_54:
    if ((has & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_159;
  }
LABEL_158:
  *(double *)(v5 + 168) = self->_callEveWeekday;
  *(void *)(v5 + 792) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_55:
    if ((has & 0x40000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_160;
  }
LABEL_159:
  *(double *)(v5 + 144) = self->_callEveFri;
  *(void *)(v5 + 792) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_56:
    if ((has & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_161;
  }
LABEL_160:
  *(double *)(v5 + 152) = self->_callEveSat;
  *(void *)(v5 + 792) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_57:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_162;
  }
LABEL_161:
  *(double *)(v5 + 160) = self->_callEveSun;
  *(void *)(v5 + 792) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_58:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_163;
  }
LABEL_162:
  *(double *)(v5 + 376) = self->_callNightWeekday;
  *(void *)(v5 + 792) |= 0x400000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_59:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_164;
  }
LABEL_163:
  *(double *)(v5 + 352) = self->_callNightFri;
  *(void *)(v5 + 792) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_60:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_165;
  }
LABEL_164:
  *(double *)(v5 + 360) = self->_callNightSat;
  *(void *)(v5 + 792) |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_61:
    if ((has & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_166;
  }
LABEL_165:
  *(double *)(v5 + 368) = self->_callNightSun;
  *(void *)(v5 + 792) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_167;
  }
LABEL_166:
  *(double *)(v5 + 72) = self->_callDurMorningWeekday;
  *(void *)(v5 + 792) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_168;
  }
LABEL_167:
  *(double *)(v5 + 48) = self->_callDurMorningFri;
  *(void *)(v5 + 792) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_169;
  }
LABEL_168:
  *(double *)(v5 + 56) = self->_callDurMorningSat;
  *(void *)(v5 + 792) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_65:
    if ((has & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_170;
  }
LABEL_169:
  *(double *)(v5 + 64) = self->_callDurMorningSun;
  *(void *)(v5 + 792) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_66:
    if ((has & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_171;
  }
LABEL_170:
  *(double *)(v5 + 136) = self->_callDurNoonWeekday;
  *(void *)(v5 + 792) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_67:
    if ((has & 0x4000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_172;
  }
LABEL_171:
  *(double *)(v5 + 112) = self->_callDurNoonFri;
  *(void *)(v5 + 792) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_68:
    if ((has & 0x8000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_173;
  }
LABEL_172:
  *(double *)(v5 + 120) = self->_callDurNoonSat;
  *(void *)(v5 + 792) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_174;
  }
LABEL_173:
  *(double *)(v5 + 128) = self->_callDurNoonSun;
  *(void *)(v5 + 792) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_175;
  }
LABEL_174:
  *(double *)(v5 + 40) = self->_callDurEveWeekday;
  *(void *)(v5 + 792) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 2) == 0)
  {
LABEL_71:
    if ((has & 4) == 0) {
      goto LABEL_72;
    }
    goto LABEL_176;
  }
LABEL_175:
  *(double *)(v5 + 16) = self->_callDurEveFri;
  *(void *)(v5 + 792) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_72:
    if ((has & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_177;
  }
LABEL_176:
  *(double *)(v5 + 24) = self->_callDurEveSat;
  *(void *)(v5 + 792) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_73:
    if ((has & 0x1000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_178;
  }
LABEL_177:
  *(double *)(v5 + 32) = self->_callDurEveSun;
  *(void *)(v5 + 792) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_74:
    if ((has & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_179;
  }
LABEL_178:
  *(double *)(v5 + 104) = self->_callDurNightWeekday;
  *(void *)(v5 + 792) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_75:
    if ((has & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_180;
  }
LABEL_179:
  *(double *)(v5 + 80) = self->_callDurNightFri;
  *(void *)(v5 + 792) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_76:
    if ((has & 0x800) == 0) {
      goto LABEL_77;
    }
    goto LABEL_181;
  }
LABEL_180:
  *(double *)(v5 + 88) = self->_callDurNightSat;
  *(void *)(v5 + 792) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_77:
    if ((has & 0x10000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_182;
  }
LABEL_181:
  *(double *)(v5 + 96) = self->_callDurNightSun;
  *(void *)(v5 + 792) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_78:
    if ((has & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_183;
  }
LABEL_182:
  *(double *)(v5 + 232) = self->_callLongMorningWeekday;
  *(void *)(v5 + 792) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_79:
    if ((has & 0x4000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_184;
  }
LABEL_183:
  *(double *)(v5 + 208) = self->_callLongMorningFri;
  *(void *)(v5 + 792) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_80:
    if ((has & 0x8000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_185;
  }
LABEL_184:
  *(double *)(v5 + 216) = self->_callLongMorningSat;
  *(void *)(v5 + 792) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_81:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_186;
  }
LABEL_185:
  *(double *)(v5 + 224) = self->_callLongMorningSun;
  *(void *)(v5 + 792) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_82:
    if ((has & 0x200000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_187;
  }
LABEL_186:
  *(double *)(v5 + 296) = self->_callLongNoonWeekday;
  *(void *)(v5 + 792) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_83:
    if ((has & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_188;
  }
LABEL_187:
  *(double *)(v5 + 272) = self->_callLongNoonFri;
  *(void *)(v5 + 792) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_84:
    if ((has & 0x800000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_189;
  }
LABEL_188:
  *(double *)(v5 + 280) = self->_callLongNoonSat;
  *(void *)(v5 + 792) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_85:
    if ((has & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_190;
  }
LABEL_189:
  *(double *)(v5 + 288) = self->_callLongNoonSun;
  *(void *)(v5 + 792) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_86:
    if ((has & 0x200000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_191;
  }
LABEL_190:
  *(double *)(v5 + 200) = self->_callLongEveWeekday;
  *(void *)(v5 + 792) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_87:
    if ((has & 0x400000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_192;
  }
LABEL_191:
  *(double *)(v5 + 176) = self->_callLongEveFri;
  *(void *)(v5 + 792) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_88:
    if ((has & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_193;
  }
LABEL_192:
  *(double *)(v5 + 184) = self->_callLongEveSat;
  *(void *)(v5 + 792) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_89:
    if ((has & 0x100000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_194;
  }
LABEL_193:
  *(double *)(v5 + 192) = self->_callLongEveSun;
  *(void *)(v5 + 792) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_90:
    if ((has & 0x20000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_195;
  }
LABEL_194:
  *(double *)(v5 + 264) = self->_callLongNightWeekday;
  *(void *)(v5 + 792) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_91:
    if ((has & 0x40000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_196;
  }
LABEL_195:
  *(double *)(v5 + 240) = self->_callLongNightFri;
  *(void *)(v5 + 792) |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_92:
    if ((has & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_197;
  }
LABEL_196:
  *(double *)(v5 + 248) = self->_callLongNightSat;
  *(void *)(v5 + 792) |= 0x40000000uLL;
  uint64_t v7 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 0x80000000) == 0)
  {
LABEL_93:
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
LABEL_197:
  *(double *)(v5 + 256) = self->_callLongNightSun;
  *(void *)(v5 + 792) |= 0x80000000uLL;
  if ((*((void *)&self->_has + 1) & 0x20000000) != 0)
  {
LABEL_94:
    *(_DWORD *)(v5 + 744) = self->_contactFamilyRelation;
    *(void *)(v5 + 800) |= 0x20000000uLL;
  }
LABEL_95:
  uint64_t v9 = [(NSString *)self->_contactRelation copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 784);
  *(void *)(v6 + 784) = v9;

  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x10000000) != 0)
  {
    *(_DWORD *)(v6 + 740) = self->_contactFamilyName;
    *(void *)(v6 + 800) |= 0x10000000uLL;
    uint64_t v11 = *((void *)&self->_has + 1);
    if ((v11 & 0x4000000000) == 0)
    {
LABEL_97:
      if ((v11 & 0x4000000) == 0) {
        goto LABEL_98;
      }
      goto LABEL_201;
    }
  }
  else if ((v11 & 0x4000000000) == 0)
  {
    goto LABEL_97;
  }
  *(_DWORD *)(v6 + 780) = self->_contactParent;
  *(void *)(v6 + 800) |= 0x4000000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x4000000) == 0)
  {
LABEL_98:
    if ((v11 & 0x8000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_202;
  }
LABEL_201:
  *(_DWORD *)(v6 + 732) = self->_contactEmergency;
  *(void *)(v6 + 800) |= 0x4000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x8000000) == 0)
  {
LABEL_99:
    if ((v11 & 0x1000000000) == 0) {
      goto LABEL_100;
    }
    goto LABEL_203;
  }
LABEL_202:
  *(_DWORD *)(v6 + 736) = self->_contactEmergencyFamily;
  *(void *)(v6 + 800) |= 0x8000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x1000000000) == 0)
  {
LABEL_100:
    if ((v11 & 0x2000000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_204;
  }
LABEL_203:
  *(_DWORD *)(v6 + 772) = self->_contactInHome;
  *(void *)(v6 + 800) |= 0x1000000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x2000000000) == 0)
  {
LABEL_101:
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_205;
  }
LABEL_204:
  *(_DWORD *)(v6 + 776) = self->_contactInPhotos;
  *(void *)(v6 + 800) |= 0x2000000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_102:
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_206;
  }
LABEL_205:
  *(_DWORD *)(v6 + 752) = self->_contactInAirDrop;
  *(void *)(v6 + 800) |= 0x80000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_103:
    if ((v11 & 0x400000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_207;
  }
LABEL_206:
  *(_DWORD *)(v6 + 756) = self->_contactInAirDropAtHome;
  *(void *)(v6 + 800) |= 0x100000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x400000000) == 0)
  {
LABEL_104:
    if ((v11 & 0x800000000) == 0) {
      goto LABEL_105;
    }
LABEL_208:
    *(_DWORD *)(v6 + 768) = self->_contactInFMFSharingWithMe;
    *(void *)(v6 + 800) |= 0x800000000uLL;
    if ((*((void *)&self->_has + 1) & 0x200000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
LABEL_207:
  *(_DWORD *)(v6 + 764) = self->_contactInFMFFollowingMe;
  *(void *)(v6 + 800) |= 0x400000000uLL;
  uint64_t v11 = *((void *)&self->_has + 1);
  if ((v11 & 0x800000000) != 0) {
    goto LABEL_208;
  }
LABEL_105:
  if ((v11 & 0x200000000) != 0)
  {
LABEL_106:
    *(_DWORD *)(v6 + 760) = self->_contactInFMFFavorite;
    *(void *)(v6 + 800) |= 0x200000000uLL;
  }
LABEL_107:
  *(void *)(v6 + 584) = self->_mailIntelligenceContactId;
  id v12 = (id)v6;

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x80) != 0) {
    unint64_t v537 = 2654435761u * self->_firstPartyMsgTotal;
  }
  else {
    unint64_t v537 = 0;
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v3 & 0x40) != 0)
  {
    double firstPartyMsgOutgoingRatio = self->_firstPartyMsgOutgoingRatio;
    double v7 = -firstPartyMsgOutgoingRatio;
    if (firstPartyMsgOutgoingRatio >= 0.0) {
      double v7 = self->_firstPartyMsgOutgoingRatio;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    double firstPartyMsgMorningWeekday = self->_firstPartyMsgMorningWeekday;
    double v12 = -firstPartyMsgMorningWeekday;
    if (firstPartyMsgMorningWeekday >= 0.0) {
      double v12 = self->_firstPartyMsgMorningWeekday;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 0x400000000000000) != 0)
  {
    double firstPartyMsgMorningFri = self->_firstPartyMsgMorningFri;
    double v17 = -firstPartyMsgMorningFri;
    if (firstPartyMsgMorningFri >= 0.0) {
      double v17 = self->_firstPartyMsgMorningFri;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((has & 0x800000000000000) != 0)
  {
    double firstPartyMsgMorningSat = self->_firstPartyMsgMorningSat;
    double v22 = -firstPartyMsgMorningSat;
    if (firstPartyMsgMorningSat >= 0.0) {
      double v22 = self->_firstPartyMsgMorningSat;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    double firstPartyMsgMorningSun = self->_firstPartyMsgMorningSun;
    double v27 = -firstPartyMsgMorningSun;
    if (firstPartyMsgMorningSun >= 0.0) {
      double v27 = self->_firstPartyMsgMorningSun;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((v3 & 0x20) != 0)
  {
    double firstPartyMsgNoonWeekday = self->_firstPartyMsgNoonWeekday;
    double v32 = -firstPartyMsgNoonWeekday;
    if (firstPartyMsgNoonWeekday >= 0.0) {
      double v32 = self->_firstPartyMsgNoonWeekday;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  if ((v3 & 4) != 0)
  {
    double firstPartyMsgNoonFri = self->_firstPartyMsgNoonFri;
    double v37 = -firstPartyMsgNoonFri;
    if (firstPartyMsgNoonFri >= 0.0) {
      double v37 = self->_firstPartyMsgNoonFri;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  unint64_t v533 = v35;
  if ((v3 & 8) != 0)
  {
    double firstPartyMsgNoonSat = self->_firstPartyMsgNoonSat;
    double v42 = -firstPartyMsgNoonSat;
    if (firstPartyMsgNoonSat >= 0.0) {
      double v42 = self->_firstPartyMsgNoonSat;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  unint64_t v532 = v40;
  if ((v3 & 0x10) != 0)
  {
    double firstPartyMsgNoonSun = self->_firstPartyMsgNoonSun;
    double v47 = -firstPartyMsgNoonSun;
    if (firstPartyMsgNoonSun >= 0.0) {
      double v47 = self->_firstPartyMsgNoonSun;
    }
    long double v48 = floor(v47 + 0.5);
    double v49 = (v47 - v48) * 1.84467441e19;
    unint64_t v45 = 2654435761u * (unint64_t)fmod(v48, 1.84467441e19);
    if (v49 >= 0.0)
    {
      if (v49 > 0.0) {
        v45 += (unint64_t)v49;
      }
    }
    else
    {
      v45 -= (unint64_t)fabs(v49);
    }
  }
  else
  {
    unint64_t v45 = 0;
  }
  unint64_t v531 = v45;
  if ((has & 0x200000000000000) != 0)
  {
    double firstPartyMsgEveWeekday = self->_firstPartyMsgEveWeekday;
    double v52 = -firstPartyMsgEveWeekday;
    if (firstPartyMsgEveWeekday >= 0.0) {
      double v52 = self->_firstPartyMsgEveWeekday;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  unint64_t v530 = v50;
  if ((has & 0x40000000000000) != 0)
  {
    double firstPartyMsgEveFri = self->_firstPartyMsgEveFri;
    double v57 = -firstPartyMsgEveFri;
    if (firstPartyMsgEveFri >= 0.0) {
      double v57 = self->_firstPartyMsgEveFri;
    }
    long double v58 = floor(v57 + 0.5);
    double v59 = (v57 - v58) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0) {
        v55 += (unint64_t)v59;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    unint64_t v55 = 0;
  }
  unint64_t v529 = v55;
  if ((has & 0x80000000000000) != 0)
  {
    double firstPartyMsgEveSat = self->_firstPartyMsgEveSat;
    double v62 = -firstPartyMsgEveSat;
    if (firstPartyMsgEveSat >= 0.0) {
      double v62 = self->_firstPartyMsgEveSat;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v60 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v60 += (unint64_t)v64;
      }
    }
    else
    {
      v60 -= (unint64_t)fabs(v64);
    }
  }
  else
  {
    unint64_t v60 = 0;
  }
  unint64_t v528 = v60;
  if ((has & 0x100000000000000) != 0)
  {
    double firstPartyMsgEveSun = self->_firstPartyMsgEveSun;
    double v67 = -firstPartyMsgEveSun;
    if (firstPartyMsgEveSun >= 0.0) {
      double v67 = self->_firstPartyMsgEveSun;
    }
    long double v68 = floor(v67 + 0.5);
    double v69 = (v67 - v68) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0) {
        v65 += (unint64_t)v69;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    unint64_t v65 = 0;
  }
  unint64_t v527 = v65;
  if ((v3 & 2) != 0)
  {
    double firstPartyMsgNightWeekday = self->_firstPartyMsgNightWeekday;
    double v72 = -firstPartyMsgNightWeekday;
    if (firstPartyMsgNightWeekday >= 0.0) {
      double v72 = self->_firstPartyMsgNightWeekday;
    }
    long double v73 = floor(v72 + 0.5);
    double v74 = (v72 - v73) * 1.84467441e19;
    unint64_t v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
    if (v74 >= 0.0)
    {
      if (v74 > 0.0) {
        v70 += (unint64_t)v74;
      }
    }
    else
    {
      v70 -= (unint64_t)fabs(v74);
    }
  }
  else
  {
    unint64_t v70 = 0;
  }
  unint64_t v526 = v70;
  if ((has & 0x4000000000000000) != 0)
  {
    double firstPartyMsgNightFri = self->_firstPartyMsgNightFri;
    double v77 = -firstPartyMsgNightFri;
    if (firstPartyMsgNightFri >= 0.0) {
      double v77 = self->_firstPartyMsgNightFri;
    }
    long double v78 = floor(v77 + 0.5);
    double v79 = (v77 - v78) * 1.84467441e19;
    unint64_t v75 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
    if (v79 >= 0.0)
    {
      if (v79 > 0.0) {
        v75 += (unint64_t)v79;
      }
    }
    else
    {
      v75 -= (unint64_t)fabs(v79);
    }
  }
  else
  {
    unint64_t v75 = 0;
  }
  unint64_t v525 = v75;
  if (has < 0)
  {
    double firstPartyMsgNightSat = self->_firstPartyMsgNightSat;
    double v82 = -firstPartyMsgNightSat;
    if (firstPartyMsgNightSat >= 0.0) {
      double v82 = self->_firstPartyMsgNightSat;
    }
    long double v83 = floor(v82 + 0.5);
    double v84 = (v82 - v83) * 1.84467441e19;
    unint64_t v80 = 2654435761u * (unint64_t)fmod(v83, 1.84467441e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0) {
        v80 += (unint64_t)v84;
      }
    }
    else
    {
      v80 -= (unint64_t)fabs(v84);
    }
  }
  else
  {
    unint64_t v80 = 0;
  }
  unint64_t v524 = v80;
  if (v3)
  {
    double firstPartyMsgNightSun = self->_firstPartyMsgNightSun;
    double v87 = -firstPartyMsgNightSun;
    if (firstPartyMsgNightSun >= 0.0) {
      double v87 = self->_firstPartyMsgNightSun;
    }
    long double v88 = floor(v87 + 0.5);
    double v89 = (v87 - v88) * 1.84467441e19;
    unint64_t v85 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
    if (v89 >= 0.0)
    {
      if (v89 > 0.0) {
        v85 += (unint64_t)v89;
      }
    }
    else
    {
      v85 -= (unint64_t)fabs(v89);
    }
  }
  else
  {
    unint64_t v85 = 0;
  }
  unint64_t v523 = v85;
  if ((v3 & 0x1000000) != 0)
  {
    unint64_t v522 = 2654435761u * self->_thirdPartyMsgTotal;
    if ((v3 & 0x8000) != 0) {
      goto LABEL_142;
    }
LABEL_147:
    unint64_t v94 = 0;
    goto LABEL_150;
  }
  unint64_t v522 = 0;
  if ((v3 & 0x8000) == 0) {
    goto LABEL_147;
  }
LABEL_142:
  double thirdPartyMsgMorningWeekday = self->_thirdPartyMsgMorningWeekday;
  double v91 = -thirdPartyMsgMorningWeekday;
  if (thirdPartyMsgMorningWeekday >= 0.0) {
    double v91 = self->_thirdPartyMsgMorningWeekday;
  }
  long double v92 = floor(v91 + 0.5);
  double v93 = (v91 - v92) * 1.84467441e19;
  unint64_t v94 = 2654435761u * (unint64_t)fmod(v92, 1.84467441e19);
  if (v93 >= 0.0)
  {
    if (v93 > 0.0) {
      v94 += (unint64_t)v93;
    }
  }
  else
  {
    v94 -= (unint64_t)fabs(v93);
  }
LABEL_150:
  unint64_t v521 = v94;
  if ((v3 & 0x1000) != 0)
  {
    double thirdPartyMsgMorningFri = self->_thirdPartyMsgMorningFri;
    double v97 = -thirdPartyMsgMorningFri;
    if (thirdPartyMsgMorningFri >= 0.0) {
      double v97 = self->_thirdPartyMsgMorningFri;
    }
    long double v98 = floor(v97 + 0.5);
    double v99 = (v97 - v98) * 1.84467441e19;
    unint64_t v95 = 2654435761u * (unint64_t)fmod(v98, 1.84467441e19);
    if (v99 >= 0.0)
    {
      if (v99 > 0.0) {
        v95 += (unint64_t)v99;
      }
    }
    else
    {
      v95 -= (unint64_t)fabs(v99);
    }
  }
  else
  {
    unint64_t v95 = 0;
  }
  unint64_t v520 = v95;
  if ((v3 & 0x2000) != 0)
  {
    double thirdPartyMsgMorningSat = self->_thirdPartyMsgMorningSat;
    double v102 = -thirdPartyMsgMorningSat;
    if (thirdPartyMsgMorningSat >= 0.0) {
      double v102 = self->_thirdPartyMsgMorningSat;
    }
    long double v103 = floor(v102 + 0.5);
    double v104 = (v102 - v103) * 1.84467441e19;
    unint64_t v100 = 2654435761u * (unint64_t)fmod(v103, 1.84467441e19);
    if (v104 >= 0.0)
    {
      if (v104 > 0.0) {
        v100 += (unint64_t)v104;
      }
    }
    else
    {
      v100 -= (unint64_t)fabs(v104);
    }
  }
  else
  {
    unint64_t v100 = 0;
  }
  unint64_t v519 = v100;
  if ((v3 & 0x4000) != 0)
  {
    double thirdPartyMsgMorningSun = self->_thirdPartyMsgMorningSun;
    double v107 = -thirdPartyMsgMorningSun;
    if (thirdPartyMsgMorningSun >= 0.0) {
      double v107 = self->_thirdPartyMsgMorningSun;
    }
    long double v108 = floor(v107 + 0.5);
    double v109 = (v107 - v108) * 1.84467441e19;
    unint64_t v105 = 2654435761u * (unint64_t)fmod(v108, 1.84467441e19);
    if (v109 >= 0.0)
    {
      if (v109 > 0.0) {
        v105 += (unint64_t)v109;
      }
    }
    else
    {
      v105 -= (unint64_t)fabs(v109);
    }
  }
  else
  {
    unint64_t v105 = 0;
  }
  unint64_t v518 = v105;
  if ((v3 & 0x800000) != 0)
  {
    double thirdPartyMsgNoonWeekday = self->_thirdPartyMsgNoonWeekday;
    double v112 = -thirdPartyMsgNoonWeekday;
    if (thirdPartyMsgNoonWeekday >= 0.0) {
      double v112 = self->_thirdPartyMsgNoonWeekday;
    }
    long double v113 = floor(v112 + 0.5);
    double v114 = (v112 - v113) * 1.84467441e19;
    unint64_t v110 = 2654435761u * (unint64_t)fmod(v113, 1.84467441e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0) {
        v110 += (unint64_t)v114;
      }
    }
    else
    {
      v110 -= (unint64_t)fabs(v114);
    }
  }
  else
  {
    unint64_t v110 = 0;
  }
  unint64_t v517 = v110;
  if ((v3 & 0x100000) != 0)
  {
    double thirdPartyMsgNoonFri = self->_thirdPartyMsgNoonFri;
    double v117 = -thirdPartyMsgNoonFri;
    if (thirdPartyMsgNoonFri >= 0.0) {
      double v117 = self->_thirdPartyMsgNoonFri;
    }
    long double v118 = floor(v117 + 0.5);
    double v119 = (v117 - v118) * 1.84467441e19;
    unint64_t v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0) {
        v115 += (unint64_t)v119;
      }
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    unint64_t v115 = 0;
  }
  unint64_t v516 = v115;
  if ((v3 & 0x200000) != 0)
  {
    double thirdPartyMsgNoonSat = self->_thirdPartyMsgNoonSat;
    double v122 = -thirdPartyMsgNoonSat;
    if (thirdPartyMsgNoonSat >= 0.0) {
      double v122 = self->_thirdPartyMsgNoonSat;
    }
    long double v123 = floor(v122 + 0.5);
    double v124 = (v122 - v123) * 1.84467441e19;
    unint64_t v120 = 2654435761u * (unint64_t)fmod(v123, 1.84467441e19);
    if (v124 >= 0.0)
    {
      if (v124 > 0.0) {
        v120 += (unint64_t)v124;
      }
    }
    else
    {
      v120 -= (unint64_t)fabs(v124);
    }
  }
  else
  {
    unint64_t v120 = 0;
  }
  unint64_t v515 = v120;
  if ((v3 & 0x400000) != 0)
  {
    double thirdPartyMsgNoonSun = self->_thirdPartyMsgNoonSun;
    double v127 = -thirdPartyMsgNoonSun;
    if (thirdPartyMsgNoonSun >= 0.0) {
      double v127 = self->_thirdPartyMsgNoonSun;
    }
    long double v128 = floor(v127 + 0.5);
    double v129 = (v127 - v128) * 1.84467441e19;
    unint64_t v125 = 2654435761u * (unint64_t)fmod(v128, 1.84467441e19);
    if (v129 >= 0.0)
    {
      if (v129 > 0.0) {
        v125 += (unint64_t)v129;
      }
    }
    else
    {
      v125 -= (unint64_t)fabs(v129);
    }
  }
  else
  {
    unint64_t v125 = 0;
  }
  unint64_t v514 = v125;
  if ((v3 & 0x800) != 0)
  {
    double thirdPartyMsgEveWeekday = self->_thirdPartyMsgEveWeekday;
    double v132 = -thirdPartyMsgEveWeekday;
    if (thirdPartyMsgEveWeekday >= 0.0) {
      double v132 = self->_thirdPartyMsgEveWeekday;
    }
    long double v133 = floor(v132 + 0.5);
    double v134 = (v132 - v133) * 1.84467441e19;
    unint64_t v130 = 2654435761u * (unint64_t)fmod(v133, 1.84467441e19);
    if (v134 >= 0.0)
    {
      if (v134 > 0.0) {
        v130 += (unint64_t)v134;
      }
    }
    else
    {
      v130 -= (unint64_t)fabs(v134);
    }
  }
  else
  {
    unint64_t v130 = 0;
  }
  unint64_t v513 = v130;
  if ((v3 & 0x100) != 0)
  {
    double thirdPartyMsgEveFri = self->_thirdPartyMsgEveFri;
    double v137 = -thirdPartyMsgEveFri;
    if (thirdPartyMsgEveFri >= 0.0) {
      double v137 = self->_thirdPartyMsgEveFri;
    }
    long double v138 = floor(v137 + 0.5);
    double v139 = (v137 - v138) * 1.84467441e19;
    unint64_t v135 = 2654435761u * (unint64_t)fmod(v138, 1.84467441e19);
    if (v139 >= 0.0)
    {
      if (v139 > 0.0) {
        v135 += (unint64_t)v139;
      }
    }
    else
    {
      v135 -= (unint64_t)fabs(v139);
    }
  }
  else
  {
    unint64_t v135 = 0;
  }
  unint64_t v512 = v135;
  if ((v3 & 0x200) != 0)
  {
    double thirdPartyMsgEveSat = self->_thirdPartyMsgEveSat;
    double v142 = -thirdPartyMsgEveSat;
    if (thirdPartyMsgEveSat >= 0.0) {
      double v142 = self->_thirdPartyMsgEveSat;
    }
    long double v143 = floor(v142 + 0.5);
    double v144 = (v142 - v143) * 1.84467441e19;
    unint64_t v140 = 2654435761u * (unint64_t)fmod(v143, 1.84467441e19);
    if (v144 >= 0.0)
    {
      if (v144 > 0.0) {
        v140 += (unint64_t)v144;
      }
    }
    else
    {
      v140 -= (unint64_t)fabs(v144);
    }
  }
  else
  {
    unint64_t v140 = 0;
  }
  unint64_t v511 = v140;
  if ((v3 & 0x400) != 0)
  {
    double thirdPartyMsgEveSun = self->_thirdPartyMsgEveSun;
    double v147 = -thirdPartyMsgEveSun;
    if (thirdPartyMsgEveSun >= 0.0) {
      double v147 = self->_thirdPartyMsgEveSun;
    }
    long double v148 = floor(v147 + 0.5);
    double v149 = (v147 - v148) * 1.84467441e19;
    unint64_t v145 = 2654435761u * (unint64_t)fmod(v148, 1.84467441e19);
    if (v149 >= 0.0)
    {
      if (v149 > 0.0) {
        v145 += (unint64_t)v149;
      }
    }
    else
    {
      v145 -= (unint64_t)fabs(v149);
    }
  }
  else
  {
    unint64_t v145 = 0;
  }
  unint64_t v510 = v145;
  if ((v3 & 0x80000) != 0)
  {
    double thirdPartyMsgNightWeekday = self->_thirdPartyMsgNightWeekday;
    double v152 = -thirdPartyMsgNightWeekday;
    if (thirdPartyMsgNightWeekday >= 0.0) {
      double v152 = self->_thirdPartyMsgNightWeekday;
    }
    long double v153 = floor(v152 + 0.5);
    double v154 = (v152 - v153) * 1.84467441e19;
    unint64_t v150 = 2654435761u * (unint64_t)fmod(v153, 1.84467441e19);
    if (v154 >= 0.0)
    {
      if (v154 > 0.0) {
        v150 += (unint64_t)v154;
      }
    }
    else
    {
      v150 -= (unint64_t)fabs(v154);
    }
  }
  else
  {
    unint64_t v150 = 0;
  }
  unint64_t v509 = v150;
  if ((v3 & 0x10000) != 0)
  {
    double thirdPartyMsgNightFri = self->_thirdPartyMsgNightFri;
    double v157 = -thirdPartyMsgNightFri;
    if (thirdPartyMsgNightFri >= 0.0) {
      double v157 = self->_thirdPartyMsgNightFri;
    }
    long double v158 = floor(v157 + 0.5);
    double v159 = (v157 - v158) * 1.84467441e19;
    unint64_t v155 = 2654435761u * (unint64_t)fmod(v158, 1.84467441e19);
    if (v159 >= 0.0)
    {
      if (v159 > 0.0) {
        v155 += (unint64_t)v159;
      }
    }
    else
    {
      v155 -= (unint64_t)fabs(v159);
    }
  }
  else
  {
    unint64_t v155 = 0;
  }
  unint64_t v508 = v155;
  if ((v3 & 0x20000) != 0)
  {
    double thirdPartyMsgNightSat = self->_thirdPartyMsgNightSat;
    double v162 = -thirdPartyMsgNightSat;
    if (thirdPartyMsgNightSat >= 0.0) {
      double v162 = self->_thirdPartyMsgNightSat;
    }
    long double v163 = floor(v162 + 0.5);
    double v164 = (v162 - v163) * 1.84467441e19;
    unint64_t v160 = 2654435761u * (unint64_t)fmod(v163, 1.84467441e19);
    if (v164 >= 0.0)
    {
      if (v164 > 0.0) {
        v160 += (unint64_t)v164;
      }
    }
    else
    {
      v160 -= (unint64_t)fabs(v164);
    }
  }
  else
  {
    unint64_t v160 = 0;
  }
  unint64_t v507 = v160;
  if ((v3 & 0x40000) != 0)
  {
    double thirdPartyMsgNightSun = self->_thirdPartyMsgNightSun;
    double v167 = -thirdPartyMsgNightSun;
    if (thirdPartyMsgNightSun >= 0.0) {
      double v167 = self->_thirdPartyMsgNightSun;
    }
    long double v168 = floor(v167 + 0.5);
    double v169 = (v167 - v168) * 1.84467441e19;
    unint64_t v165 = 2654435761u * (unint64_t)fmod(v168, 1.84467441e19);
    if (v169 >= 0.0)
    {
      if (v169 > 0.0) {
        v165 += (unint64_t)v169;
      }
    }
    else
    {
      v165 -= (unint64_t)fabs(v169);
    }
  }
  else
  {
    unint64_t v165 = 0;
  }
  unint64_t v506 = v165;
  if ((has & 0x10000000000000) != 0)
  {
    unint64_t v505 = 2654435761u * self->_callTotal;
    if ((v3 & 0x2000000) != 0)
    {
LABEL_272:
      uint64_t v504 = 2654435761 * self->_callBirthday;
      if ((v3 & 0x40000000) != 0) {
        goto LABEL_273;
      }
LABEL_280:
      uint64_t v503 = 0;
      if ((has & 0x20000000000000) != 0) {
        goto LABEL_274;
      }
LABEL_281:
      unint64_t v174 = 0;
      goto LABEL_284;
    }
  }
  else
  {
    unint64_t v505 = 0;
    if ((v3 & 0x2000000) != 0) {
      goto LABEL_272;
    }
  }
  uint64_t v504 = 0;
  if ((v3 & 0x40000000) == 0) {
    goto LABEL_280;
  }
LABEL_273:
  uint64_t v503 = 2654435761 * self->_contactFavorite;
  if ((has & 0x20000000000000) == 0) {
    goto LABEL_281;
  }
LABEL_274:
  double callTotalDur = self->_callTotalDur;
  double v171 = -callTotalDur;
  if (callTotalDur >= 0.0) {
    double v171 = self->_callTotalDur;
  }
  long double v172 = floor(v171 + 0.5);
  double v173 = (v171 - v172) * 1.84467441e19;
  unint64_t v174 = 2654435761u * (unint64_t)fmod(v172, 1.84467441e19);
  if (v173 >= 0.0)
  {
    if (v173 > 0.0) {
      v174 += (unint64_t)v173;
    }
  }
  else
  {
    v174 -= (unint64_t)fabs(v173);
  }
LABEL_284:
  unint64_t v502 = v174;
  if ((has & 0x2000000000) != 0)
  {
    double callLongRatio = self->_callLongRatio;
    double v177 = -callLongRatio;
    if (callLongRatio >= 0.0) {
      double v177 = self->_callLongRatio;
    }
    long double v178 = floor(v177 + 0.5);
    double v179 = (v177 - v178) * 1.84467441e19;
    unint64_t v175 = 2654435761u * (unint64_t)fmod(v178, 1.84467441e19);
    if (v179 >= 0.0)
    {
      if (v179 > 0.0) {
        v175 += (unint64_t)v179;
      }
    }
    else
    {
      v175 -= (unint64_t)fabs(v179);
    }
  }
  else
  {
    unint64_t v175 = 0;
  }
  unint64_t v501 = v175;
  if ((has & 0x8000000000000) != 0)
  {
    double callOutgoingRatio = self->_callOutgoingRatio;
    double v182 = -callOutgoingRatio;
    if (callOutgoingRatio >= 0.0) {
      double v182 = self->_callOutgoingRatio;
    }
    long double v183 = floor(v182 + 0.5);
    double v184 = (v182 - v183) * 1.84467441e19;
    unint64_t v180 = 2654435761u * (unint64_t)fmod(v183, 1.84467441e19);
    if (v184 >= 0.0)
    {
      if (v184 > 0.0) {
        v180 += (unint64_t)v184;
      }
    }
    else
    {
      v180 -= (unint64_t)fabs(v184);
    }
  }
  else
  {
    unint64_t v180 = 0;
  }
  unint64_t v500 = v180;
  if (has)
  {
    double callAvgDur = self->_callAvgDur;
    double v187 = -callAvgDur;
    if (callAvgDur >= 0.0) {
      double v187 = self->_callAvgDur;
    }
    long double v188 = floor(v187 + 0.5);
    double v189 = (v187 - v188) * 1.84467441e19;
    unint64_t v185 = 2654435761u * (unint64_t)fmod(v188, 1.84467441e19);
    if (v189 >= 0.0)
    {
      if (v189 > 0.0) {
        v185 += (unint64_t)v189;
      }
    }
    else
    {
      v185 -= (unint64_t)fabs(v189);
    }
  }
  else
  {
    unint64_t v185 = 0;
  }
  unint64_t v499 = v185;
  if ((has & 0x4000000000) != 0)
  {
    double callMaxDur = self->_callMaxDur;
    double v192 = -callMaxDur;
    if (callMaxDur >= 0.0) {
      double v192 = self->_callMaxDur;
    }
    long double v193 = floor(v192 + 0.5);
    double v194 = (v192 - v193) * 1.84467441e19;
    unint64_t v190 = 2654435761u * (unint64_t)fmod(v193, 1.84467441e19);
    if (v194 >= 0.0)
    {
      if (v194 > 0.0) {
        v190 += (unint64_t)v194;
      }
    }
    else
    {
      v190 -= (unint64_t)fabs(v194);
    }
  }
  else
  {
    unint64_t v190 = 0;
  }
  unint64_t v498 = v190;
  if ((has & 0x40000000000) != 0)
  {
    double callMorningWeekday = self->_callMorningWeekday;
    double v197 = -callMorningWeekday;
    if (callMorningWeekday >= 0.0) {
      double v197 = self->_callMorningWeekday;
    }
    long double v198 = floor(v197 + 0.5);
    double v199 = (v197 - v198) * 1.84467441e19;
    unint64_t v195 = 2654435761u * (unint64_t)fmod(v198, 1.84467441e19);
    if (v199 >= 0.0)
    {
      if (v199 > 0.0) {
        v195 += (unint64_t)v199;
      }
    }
    else
    {
      v195 -= (unint64_t)fabs(v199);
    }
  }
  else
  {
    unint64_t v195 = 0;
  }
  unint64_t v497 = v195;
  if ((has & 0x8000000000) != 0)
  {
    double callMorningFri = self->_callMorningFri;
    double v202 = -callMorningFri;
    if (callMorningFri >= 0.0) {
      double v202 = self->_callMorningFri;
    }
    long double v203 = floor(v202 + 0.5);
    double v204 = (v202 - v203) * 1.84467441e19;
    unint64_t v200 = 2654435761u * (unint64_t)fmod(v203, 1.84467441e19);
    if (v204 >= 0.0)
    {
      if (v204 > 0.0) {
        v200 += (unint64_t)v204;
      }
    }
    else
    {
      v200 -= (unint64_t)fabs(v204);
    }
  }
  else
  {
    unint64_t v200 = 0;
  }
  unint64_t v496 = v200;
  if ((has & 0x10000000000) != 0)
  {
    double callMorningSat = self->_callMorningSat;
    double v207 = -callMorningSat;
    if (callMorningSat >= 0.0) {
      double v207 = self->_callMorningSat;
    }
    long double v208 = floor(v207 + 0.5);
    double v209 = (v207 - v208) * 1.84467441e19;
    unint64_t v205 = 2654435761u * (unint64_t)fmod(v208, 1.84467441e19);
    if (v209 >= 0.0)
    {
      if (v209 > 0.0) {
        v205 += (unint64_t)v209;
      }
    }
    else
    {
      v205 -= (unint64_t)fabs(v209);
    }
  }
  else
  {
    unint64_t v205 = 0;
  }
  unint64_t v495 = v205;
  if ((has & 0x20000000000) != 0)
  {
    double callMorningSun = self->_callMorningSun;
    double v212 = -callMorningSun;
    if (callMorningSun >= 0.0) {
      double v212 = self->_callMorningSun;
    }
    long double v213 = floor(v212 + 0.5);
    double v214 = (v212 - v213) * 1.84467441e19;
    unint64_t v210 = 2654435761u * (unint64_t)fmod(v213, 1.84467441e19);
    if (v214 >= 0.0)
    {
      if (v214 > 0.0) {
        v210 += (unint64_t)v214;
      }
    }
    else
    {
      v210 -= (unint64_t)fabs(v214);
    }
  }
  else
  {
    unint64_t v210 = 0;
  }
  unint64_t v494 = v210;
  if ((has & 0x4000000000000) != 0)
  {
    double callNoonWeekday = self->_callNoonWeekday;
    double v217 = -callNoonWeekday;
    if (callNoonWeekday >= 0.0) {
      double v217 = self->_callNoonWeekday;
    }
    long double v218 = floor(v217 + 0.5);
    double v219 = (v217 - v218) * 1.84467441e19;
    unint64_t v215 = 2654435761u * (unint64_t)fmod(v218, 1.84467441e19);
    if (v219 >= 0.0)
    {
      if (v219 > 0.0) {
        v215 += (unint64_t)v219;
      }
    }
    else
    {
      v215 -= (unint64_t)fabs(v219);
    }
  }
  else
  {
    unint64_t v215 = 0;
  }
  unint64_t v493 = v215;
  if ((has & 0x800000000000) != 0)
  {
    double callNoonFri = self->_callNoonFri;
    double v222 = -callNoonFri;
    if (callNoonFri >= 0.0) {
      double v222 = self->_callNoonFri;
    }
    long double v223 = floor(v222 + 0.5);
    double v224 = (v222 - v223) * 1.84467441e19;
    unint64_t v220 = 2654435761u * (unint64_t)fmod(v223, 1.84467441e19);
    if (v224 >= 0.0)
    {
      if (v224 > 0.0) {
        v220 += (unint64_t)v224;
      }
    }
    else
    {
      v220 -= (unint64_t)fabs(v224);
    }
  }
  else
  {
    unint64_t v220 = 0;
  }
  unint64_t v492 = v220;
  if ((has & 0x1000000000000) != 0)
  {
    double callNoonSat = self->_callNoonSat;
    double v227 = -callNoonSat;
    if (callNoonSat >= 0.0) {
      double v227 = self->_callNoonSat;
    }
    long double v228 = floor(v227 + 0.5);
    double v229 = (v227 - v228) * 1.84467441e19;
    unint64_t v225 = 2654435761u * (unint64_t)fmod(v228, 1.84467441e19);
    if (v229 >= 0.0)
    {
      if (v229 > 0.0) {
        v225 += (unint64_t)v229;
      }
    }
    else
    {
      v225 -= (unint64_t)fabs(v229);
    }
  }
  else
  {
    unint64_t v225 = 0;
  }
  unint64_t v491 = v225;
  if ((has & 0x2000000000000) != 0)
  {
    double callNoonSun = self->_callNoonSun;
    double v232 = -callNoonSun;
    if (callNoonSun >= 0.0) {
      double v232 = self->_callNoonSun;
    }
    long double v233 = floor(v232 + 0.5);
    double v234 = (v232 - v233) * 1.84467441e19;
    unint64_t v230 = 2654435761u * (unint64_t)fmod(v233, 1.84467441e19);
    if (v234 >= 0.0)
    {
      if (v234 > 0.0) {
        v230 += (unint64_t)v234;
      }
    }
    else
    {
      v230 -= (unint64_t)fabs(v234);
    }
  }
  else
  {
    unint64_t v230 = 0;
  }
  unint64_t v490 = v230;
  if ((has & 0x100000) != 0)
  {
    double callEveWeekday = self->_callEveWeekday;
    double v237 = -callEveWeekday;
    if (callEveWeekday >= 0.0) {
      double v237 = self->_callEveWeekday;
    }
    long double v238 = floor(v237 + 0.5);
    double v239 = (v237 - v238) * 1.84467441e19;
    unint64_t v235 = 2654435761u * (unint64_t)fmod(v238, 1.84467441e19);
    if (v239 >= 0.0)
    {
      if (v239 > 0.0) {
        v235 += (unint64_t)v239;
      }
    }
    else
    {
      v235 -= (unint64_t)fabs(v239);
    }
  }
  else
  {
    unint64_t v235 = 0;
  }
  unint64_t v489 = v235;
  if ((has & 0x20000) != 0)
  {
    double callEveFri = self->_callEveFri;
    double v242 = -callEveFri;
    if (callEveFri >= 0.0) {
      double v242 = self->_callEveFri;
    }
    long double v243 = floor(v242 + 0.5);
    double v244 = (v242 - v243) * 1.84467441e19;
    unint64_t v240 = 2654435761u * (unint64_t)fmod(v243, 1.84467441e19);
    if (v244 >= 0.0)
    {
      if (v244 > 0.0) {
        v240 += (unint64_t)v244;
      }
    }
    else
    {
      v240 -= (unint64_t)fabs(v244);
    }
  }
  else
  {
    unint64_t v240 = 0;
  }
  unint64_t v488 = v240;
  if ((has & 0x40000) != 0)
  {
    double callEveSat = self->_callEveSat;
    double v247 = -callEveSat;
    if (callEveSat >= 0.0) {
      double v247 = self->_callEveSat;
    }
    long double v248 = floor(v247 + 0.5);
    double v249 = (v247 - v248) * 1.84467441e19;
    unint64_t v245 = 2654435761u * (unint64_t)fmod(v248, 1.84467441e19);
    if (v249 >= 0.0)
    {
      if (v249 > 0.0) {
        v245 += (unint64_t)v249;
      }
    }
    else
    {
      v245 -= (unint64_t)fabs(v249);
    }
  }
  else
  {
    unint64_t v245 = 0;
  }
  unint64_t v487 = v245;
  if ((has & 0x80000) != 0)
  {
    double callEveSun = self->_callEveSun;
    double v252 = -callEveSun;
    if (callEveSun >= 0.0) {
      double v252 = self->_callEveSun;
    }
    long double v253 = floor(v252 + 0.5);
    double v254 = (v252 - v253) * 1.84467441e19;
    unint64_t v250 = 2654435761u * (unint64_t)fmod(v253, 1.84467441e19);
    if (v254 >= 0.0)
    {
      if (v254 > 0.0) {
        v250 += (unint64_t)v254;
      }
    }
    else
    {
      v250 -= (unint64_t)fabs(v254);
    }
  }
  else
  {
    unint64_t v250 = 0;
  }
  unint64_t v486 = v250;
  if ((has & 0x400000000000) != 0)
  {
    double callNightWeekday = self->_callNightWeekday;
    double v257 = -callNightWeekday;
    if (callNightWeekday >= 0.0) {
      double v257 = self->_callNightWeekday;
    }
    long double v258 = floor(v257 + 0.5);
    double v259 = (v257 - v258) * 1.84467441e19;
    unint64_t v255 = 2654435761u * (unint64_t)fmod(v258, 1.84467441e19);
    if (v259 >= 0.0)
    {
      if (v259 > 0.0) {
        v255 += (unint64_t)v259;
      }
    }
    else
    {
      v255 -= (unint64_t)fabs(v259);
    }
  }
  else
  {
    unint64_t v255 = 0;
  }
  unint64_t v485 = v255;
  if ((has & 0x80000000000) != 0)
  {
    double callNightFri = self->_callNightFri;
    double v262 = -callNightFri;
    if (callNightFri >= 0.0) {
      double v262 = self->_callNightFri;
    }
    long double v263 = floor(v262 + 0.5);
    double v264 = (v262 - v263) * 1.84467441e19;
    unint64_t v260 = 2654435761u * (unint64_t)fmod(v263, 1.84467441e19);
    if (v264 >= 0.0)
    {
      if (v264 > 0.0) {
        v260 += (unint64_t)v264;
      }
    }
    else
    {
      v260 -= (unint64_t)fabs(v264);
    }
  }
  else
  {
    unint64_t v260 = 0;
  }
  unint64_t v484 = v260;
  if ((has & 0x100000000000) != 0)
  {
    double callNightSat = self->_callNightSat;
    double v267 = -callNightSat;
    if (callNightSat >= 0.0) {
      double v267 = self->_callNightSat;
    }
    long double v268 = floor(v267 + 0.5);
    double v269 = (v267 - v268) * 1.84467441e19;
    unint64_t v265 = 2654435761u * (unint64_t)fmod(v268, 1.84467441e19);
    if (v269 >= 0.0)
    {
      if (v269 > 0.0) {
        v265 += (unint64_t)v269;
      }
    }
    else
    {
      v265 -= (unint64_t)fabs(v269);
    }
  }
  else
  {
    unint64_t v265 = 0;
  }
  unint64_t v483 = v265;
  if ((has & 0x200000000000) != 0)
  {
    double callNightSun = self->_callNightSun;
    double v272 = -callNightSun;
    if (callNightSun >= 0.0) {
      double v272 = self->_callNightSun;
    }
    long double v273 = floor(v272 + 0.5);
    double v274 = (v272 - v273) * 1.84467441e19;
    unint64_t v270 = 2654435761u * (unint64_t)fmod(v273, 1.84467441e19);
    if (v274 >= 0.0)
    {
      if (v274 > 0.0) {
        v270 += (unint64_t)v274;
      }
    }
    else
    {
      v270 -= (unint64_t)fabs(v274);
    }
  }
  else
  {
    unint64_t v270 = 0;
  }
  unint64_t v482 = v270;
  if ((has & 0x100) != 0)
  {
    double callDurMorningWeekday = self->_callDurMorningWeekday;
    double v277 = -callDurMorningWeekday;
    if (callDurMorningWeekday >= 0.0) {
      double v277 = self->_callDurMorningWeekday;
    }
    long double v278 = floor(v277 + 0.5);
    double v279 = (v277 - v278) * 1.84467441e19;
    unint64_t v275 = 2654435761u * (unint64_t)fmod(v278, 1.84467441e19);
    if (v279 >= 0.0)
    {
      if (v279 > 0.0) {
        v275 += (unint64_t)v279;
      }
    }
    else
    {
      v275 -= (unint64_t)fabs(v279);
    }
  }
  else
  {
    unint64_t v275 = 0;
  }
  unint64_t v481 = v275;
  if ((has & 0x20) != 0)
  {
    double callDurMorningFri = self->_callDurMorningFri;
    double v282 = -callDurMorningFri;
    if (callDurMorningFri >= 0.0) {
      double v282 = self->_callDurMorningFri;
    }
    long double v283 = floor(v282 + 0.5);
    double v284 = (v282 - v283) * 1.84467441e19;
    unint64_t v280 = 2654435761u * (unint64_t)fmod(v283, 1.84467441e19);
    if (v284 >= 0.0)
    {
      if (v284 > 0.0) {
        v280 += (unint64_t)v284;
      }
    }
    else
    {
      v280 -= (unint64_t)fabs(v284);
    }
  }
  else
  {
    unint64_t v280 = 0;
  }
  unint64_t v480 = v280;
  if ((has & 0x40) != 0)
  {
    double callDurMorningSat = self->_callDurMorningSat;
    double v287 = -callDurMorningSat;
    if (callDurMorningSat >= 0.0) {
      double v287 = self->_callDurMorningSat;
    }
    long double v288 = floor(v287 + 0.5);
    double v289 = (v287 - v288) * 1.84467441e19;
    unint64_t v285 = 2654435761u * (unint64_t)fmod(v288, 1.84467441e19);
    if (v289 >= 0.0)
    {
      if (v289 > 0.0) {
        v285 += (unint64_t)v289;
      }
    }
    else
    {
      v285 -= (unint64_t)fabs(v289);
    }
  }
  else
  {
    unint64_t v285 = 0;
  }
  unint64_t v479 = v285;
  if ((has & 0x80) != 0)
  {
    double callDurMorningSun = self->_callDurMorningSun;
    double v292 = -callDurMorningSun;
    if (callDurMorningSun >= 0.0) {
      double v292 = self->_callDurMorningSun;
    }
    long double v293 = floor(v292 + 0.5);
    double v294 = (v292 - v293) * 1.84467441e19;
    unint64_t v290 = 2654435761u * (unint64_t)fmod(v293, 1.84467441e19);
    if (v294 >= 0.0)
    {
      if (v294 > 0.0) {
        v290 += (unint64_t)v294;
      }
    }
    else
    {
      v290 -= (unint64_t)fabs(v294);
    }
  }
  else
  {
    unint64_t v290 = 0;
  }
  unint64_t v478 = v290;
  if ((has & 0x10000) != 0)
  {
    double callDurNoonWeekday = self->_callDurNoonWeekday;
    double v297 = -callDurNoonWeekday;
    if (callDurNoonWeekday >= 0.0) {
      double v297 = self->_callDurNoonWeekday;
    }
    long double v298 = floor(v297 + 0.5);
    double v299 = (v297 - v298) * 1.84467441e19;
    unint64_t v295 = 2654435761u * (unint64_t)fmod(v298, 1.84467441e19);
    if (v299 >= 0.0)
    {
      if (v299 > 0.0) {
        v295 += (unint64_t)v299;
      }
    }
    else
    {
      v295 -= (unint64_t)fabs(v299);
    }
  }
  else
  {
    unint64_t v295 = 0;
  }
  unint64_t v477 = v295;
  if ((has & 0x2000) != 0)
  {
    double callDurNoonFri = self->_callDurNoonFri;
    double v302 = -callDurNoonFri;
    if (callDurNoonFri >= 0.0) {
      double v302 = self->_callDurNoonFri;
    }
    long double v303 = floor(v302 + 0.5);
    double v304 = (v302 - v303) * 1.84467441e19;
    unint64_t v300 = 2654435761u * (unint64_t)fmod(v303, 1.84467441e19);
    if (v304 >= 0.0)
    {
      if (v304 > 0.0) {
        v300 += (unint64_t)v304;
      }
    }
    else
    {
      v300 -= (unint64_t)fabs(v304);
    }
  }
  else
  {
    unint64_t v300 = 0;
  }
  unint64_t v476 = v300;
  if ((has & 0x4000) != 0)
  {
    double callDurNoonSat = self->_callDurNoonSat;
    double v307 = -callDurNoonSat;
    if (callDurNoonSat >= 0.0) {
      double v307 = self->_callDurNoonSat;
    }
    long double v308 = floor(v307 + 0.5);
    double v309 = (v307 - v308) * 1.84467441e19;
    unint64_t v305 = 2654435761u * (unint64_t)fmod(v308, 1.84467441e19);
    if (v309 >= 0.0)
    {
      if (v309 > 0.0) {
        v305 += (unint64_t)v309;
      }
    }
    else
    {
      v305 -= (unint64_t)fabs(v309);
    }
  }
  else
  {
    unint64_t v305 = 0;
  }
  unint64_t v475 = v305;
  if ((has & 0x8000) != 0)
  {
    double callDurNoonSun = self->_callDurNoonSun;
    double v312 = -callDurNoonSun;
    if (callDurNoonSun >= 0.0) {
      double v312 = self->_callDurNoonSun;
    }
    long double v313 = floor(v312 + 0.5);
    double v314 = (v312 - v313) * 1.84467441e19;
    unint64_t v310 = 2654435761u * (unint64_t)fmod(v313, 1.84467441e19);
    if (v314 >= 0.0)
    {
      if (v314 > 0.0) {
        v310 += (unint64_t)v314;
      }
    }
    else
    {
      v310 -= (unint64_t)fabs(v314);
    }
  }
  else
  {
    unint64_t v310 = 0;
  }
  unint64_t v474 = v310;
  if ((has & 0x10) != 0)
  {
    double callDurEveWeekday = self->_callDurEveWeekday;
    double v317 = -callDurEveWeekday;
    if (callDurEveWeekday >= 0.0) {
      double v317 = self->_callDurEveWeekday;
    }
    long double v318 = floor(v317 + 0.5);
    double v319 = (v317 - v318) * 1.84467441e19;
    unint64_t v315 = 2654435761u * (unint64_t)fmod(v318, 1.84467441e19);
    if (v319 >= 0.0)
    {
      if (v319 > 0.0) {
        v315 += (unint64_t)v319;
      }
    }
    else
    {
      v315 -= (unint64_t)fabs(v319);
    }
  }
  else
  {
    unint64_t v315 = 0;
  }
  unint64_t v473 = v315;
  if ((has & 2) != 0)
  {
    double callDurEveFri = self->_callDurEveFri;
    double v322 = -callDurEveFri;
    if (callDurEveFri >= 0.0) {
      double v322 = self->_callDurEveFri;
    }
    long double v323 = floor(v322 + 0.5);
    double v324 = (v322 - v323) * 1.84467441e19;
    unint64_t v320 = 2654435761u * (unint64_t)fmod(v323, 1.84467441e19);
    if (v324 >= 0.0)
    {
      if (v324 > 0.0) {
        v320 += (unint64_t)v324;
      }
    }
    else
    {
      v320 -= (unint64_t)fabs(v324);
    }
  }
  else
  {
    unint64_t v320 = 0;
  }
  unint64_t v472 = v320;
  if ((has & 4) != 0)
  {
    double callDurEveSat = self->_callDurEveSat;
    double v327 = -callDurEveSat;
    if (callDurEveSat >= 0.0) {
      double v327 = self->_callDurEveSat;
    }
    long double v328 = floor(v327 + 0.5);
    double v329 = (v327 - v328) * 1.84467441e19;
    unint64_t v325 = 2654435761u * (unint64_t)fmod(v328, 1.84467441e19);
    if (v329 >= 0.0)
    {
      if (v329 > 0.0) {
        v325 += (unint64_t)v329;
      }
    }
    else
    {
      v325 -= (unint64_t)fabs(v329);
    }
  }
  else
  {
    unint64_t v325 = 0;
  }
  unint64_t v471 = v325;
  if ((has & 8) != 0)
  {
    double callDurEveSun = self->_callDurEveSun;
    double v332 = -callDurEveSun;
    if (callDurEveSun >= 0.0) {
      double v332 = self->_callDurEveSun;
    }
    long double v333 = floor(v332 + 0.5);
    double v334 = (v332 - v333) * 1.84467441e19;
    unint64_t v330 = 2654435761u * (unint64_t)fmod(v333, 1.84467441e19);
    if (v334 >= 0.0)
    {
      if (v334 > 0.0) {
        v330 += (unint64_t)v334;
      }
    }
    else
    {
      v330 -= (unint64_t)fabs(v334);
    }
  }
  else
  {
    unint64_t v330 = 0;
  }
  unint64_t v470 = v330;
  if ((has & 0x1000) != 0)
  {
    double callDurNightWeekday = self->_callDurNightWeekday;
    double v337 = -callDurNightWeekday;
    if (callDurNightWeekday >= 0.0) {
      double v337 = self->_callDurNightWeekday;
    }
    long double v338 = floor(v337 + 0.5);
    double v339 = (v337 - v338) * 1.84467441e19;
    unint64_t v335 = 2654435761u * (unint64_t)fmod(v338, 1.84467441e19);
    if (v339 >= 0.0)
    {
      if (v339 > 0.0) {
        v335 += (unint64_t)v339;
      }
    }
    else
    {
      v335 -= (unint64_t)fabs(v339);
    }
  }
  else
  {
    unint64_t v335 = 0;
  }
  unint64_t v469 = v335;
  if ((has & 0x200) != 0)
  {
    double callDurNightFri = self->_callDurNightFri;
    double v342 = -callDurNightFri;
    if (callDurNightFri >= 0.0) {
      double v342 = self->_callDurNightFri;
    }
    long double v343 = floor(v342 + 0.5);
    double v344 = (v342 - v343) * 1.84467441e19;
    unint64_t v340 = 2654435761u * (unint64_t)fmod(v343, 1.84467441e19);
    if (v344 >= 0.0)
    {
      if (v344 > 0.0) {
        v340 += (unint64_t)v344;
      }
    }
    else
    {
      v340 -= (unint64_t)fabs(v344);
    }
  }
  else
  {
    unint64_t v340 = 0;
  }
  unint64_t v468 = v340;
  if ((has & 0x400) != 0)
  {
    double callDurNightSat = self->_callDurNightSat;
    double v347 = -callDurNightSat;
    if (callDurNightSat >= 0.0) {
      double v347 = self->_callDurNightSat;
    }
    long double v348 = floor(v347 + 0.5);
    double v349 = (v347 - v348) * 1.84467441e19;
    unint64_t v345 = 2654435761u * (unint64_t)fmod(v348, 1.84467441e19);
    if (v349 >= 0.0)
    {
      if (v349 > 0.0) {
        v345 += (unint64_t)v349;
      }
    }
    else
    {
      v345 -= (unint64_t)fabs(v349);
    }
  }
  else
  {
    unint64_t v345 = 0;
  }
  unint64_t v467 = v345;
  if ((has & 0x800) != 0)
  {
    double callDurNightSun = self->_callDurNightSun;
    double v352 = -callDurNightSun;
    if (callDurNightSun >= 0.0) {
      double v352 = self->_callDurNightSun;
    }
    long double v353 = floor(v352 + 0.5);
    double v354 = (v352 - v353) * 1.84467441e19;
    unint64_t v350 = 2654435761u * (unint64_t)fmod(v353, 1.84467441e19);
    if (v354 >= 0.0)
    {
      if (v354 > 0.0) {
        v350 += (unint64_t)v354;
      }
    }
    else
    {
      v350 -= (unint64_t)fabs(v354);
    }
  }
  else
  {
    unint64_t v350 = 0;
  }
  unint64_t v466 = v350;
  if ((has & 0x10000000) != 0)
  {
    double callLongMorningWeekday = self->_callLongMorningWeekday;
    double v357 = -callLongMorningWeekday;
    if (callLongMorningWeekday >= 0.0) {
      double v357 = self->_callLongMorningWeekday;
    }
    long double v358 = floor(v357 + 0.5);
    double v359 = (v357 - v358) * 1.84467441e19;
    unint64_t v355 = 2654435761u * (unint64_t)fmod(v358, 1.84467441e19);
    if (v359 >= 0.0)
    {
      if (v359 > 0.0) {
        v355 += (unint64_t)v359;
      }
    }
    else
    {
      v355 -= (unint64_t)fabs(v359);
    }
  }
  else
  {
    unint64_t v355 = 0;
  }
  unint64_t v465 = v355;
  if ((has & 0x2000000) != 0)
  {
    double callLongMorningFri = self->_callLongMorningFri;
    double v362 = -callLongMorningFri;
    if (callLongMorningFri >= 0.0) {
      double v362 = self->_callLongMorningFri;
    }
    long double v363 = floor(v362 + 0.5);
    double v364 = (v362 - v363) * 1.84467441e19;
    unint64_t v360 = 2654435761u * (unint64_t)fmod(v363, 1.84467441e19);
    if (v364 >= 0.0)
    {
      if (v364 > 0.0) {
        v360 += (unint64_t)v364;
      }
    }
    else
    {
      v360 -= (unint64_t)fabs(v364);
    }
  }
  else
  {
    unint64_t v360 = 0;
  }
  unint64_t v464 = v360;
  if ((has & 0x4000000) != 0)
  {
    double callLongMorningSat = self->_callLongMorningSat;
    double v367 = -callLongMorningSat;
    if (callLongMorningSat >= 0.0) {
      double v367 = self->_callLongMorningSat;
    }
    long double v368 = floor(v367 + 0.5);
    double v369 = (v367 - v368) * 1.84467441e19;
    unint64_t v365 = 2654435761u * (unint64_t)fmod(v368, 1.84467441e19);
    if (v369 >= 0.0)
    {
      if (v369 > 0.0) {
        v365 += (unint64_t)v369;
      }
    }
    else
    {
      v365 -= (unint64_t)fabs(v369);
    }
  }
  else
  {
    unint64_t v365 = 0;
  }
  unint64_t v463 = v365;
  if ((has & 0x8000000) != 0)
  {
    double callLongMorningSun = self->_callLongMorningSun;
    double v372 = -callLongMorningSun;
    if (callLongMorningSun >= 0.0) {
      double v372 = self->_callLongMorningSun;
    }
    long double v373 = floor(v372 + 0.5);
    double v374 = (v372 - v373) * 1.84467441e19;
    unint64_t v370 = 2654435761u * (unint64_t)fmod(v373, 1.84467441e19);
    if (v374 >= 0.0)
    {
      if (v374 > 0.0) {
        v370 += (unint64_t)v374;
      }
    }
    else
    {
      v370 -= (unint64_t)fabs(v374);
    }
  }
  else
  {
    unint64_t v370 = 0;
  }
  unint64_t v462 = v370;
  if ((has & 0x1000000000) != 0)
  {
    double callLongNoonWeekday = self->_callLongNoonWeekday;
    double v377 = -callLongNoonWeekday;
    if (callLongNoonWeekday >= 0.0) {
      double v377 = self->_callLongNoonWeekday;
    }
    long double v378 = floor(v377 + 0.5);
    double v379 = (v377 - v378) * 1.84467441e19;
    unint64_t v375 = 2654435761u * (unint64_t)fmod(v378, 1.84467441e19);
    if (v379 >= 0.0)
    {
      if (v379 > 0.0) {
        v375 += (unint64_t)v379;
      }
    }
    else
    {
      v375 -= (unint64_t)fabs(v379);
    }
  }
  else
  {
    unint64_t v375 = 0;
  }
  unint64_t v461 = v375;
  if ((has & 0x200000000) != 0)
  {
    double callLongNoonFri = self->_callLongNoonFri;
    double v382 = -callLongNoonFri;
    if (callLongNoonFri >= 0.0) {
      double v382 = self->_callLongNoonFri;
    }
    long double v383 = floor(v382 + 0.5);
    double v384 = (v382 - v383) * 1.84467441e19;
    unint64_t v380 = 2654435761u * (unint64_t)fmod(v383, 1.84467441e19);
    if (v384 >= 0.0)
    {
      if (v384 > 0.0) {
        v380 += (unint64_t)v384;
      }
    }
    else
    {
      v380 -= (unint64_t)fabs(v384);
    }
  }
  else
  {
    unint64_t v380 = 0;
  }
  unint64_t v460 = v380;
  if ((has & 0x400000000) != 0)
  {
    double callLongNoonSat = self->_callLongNoonSat;
    double v387 = -callLongNoonSat;
    if (callLongNoonSat >= 0.0) {
      double v387 = self->_callLongNoonSat;
    }
    long double v388 = floor(v387 + 0.5);
    double v389 = (v387 - v388) * 1.84467441e19;
    unint64_t v385 = 2654435761u * (unint64_t)fmod(v388, 1.84467441e19);
    if (v389 >= 0.0)
    {
      if (v389 > 0.0) {
        v385 += (unint64_t)v389;
      }
    }
    else
    {
      v385 -= (unint64_t)fabs(v389);
    }
  }
  else
  {
    unint64_t v385 = 0;
  }
  unint64_t v459 = v385;
  if ((has & 0x800000000) != 0)
  {
    double callLongNoonSun = self->_callLongNoonSun;
    double v392 = -callLongNoonSun;
    if (callLongNoonSun >= 0.0) {
      double v392 = self->_callLongNoonSun;
    }
    long double v393 = floor(v392 + 0.5);
    double v394 = (v392 - v393) * 1.84467441e19;
    unint64_t v390 = 2654435761u * (unint64_t)fmod(v393, 1.84467441e19);
    if (v394 >= 0.0)
    {
      if (v394 > 0.0) {
        v390 += (unint64_t)v394;
      }
    }
    else
    {
      v390 -= (unint64_t)fabs(v394);
    }
  }
  else
  {
    unint64_t v390 = 0;
  }
  unint64_t v458 = v390;
  if ((has & 0x1000000) != 0)
  {
    double callLongEveWeekday = self->_callLongEveWeekday;
    double v397 = -callLongEveWeekday;
    if (callLongEveWeekday >= 0.0) {
      double v397 = self->_callLongEveWeekday;
    }
    long double v398 = floor(v397 + 0.5);
    double v399 = (v397 - v398) * 1.84467441e19;
    unint64_t v395 = 2654435761u * (unint64_t)fmod(v398, 1.84467441e19);
    if (v399 >= 0.0)
    {
      if (v399 > 0.0) {
        v395 += (unint64_t)v399;
      }
    }
    else
    {
      v395 -= (unint64_t)fabs(v399);
    }
  }
  else
  {
    unint64_t v395 = 0;
  }
  unint64_t v457 = v395;
  if ((has & 0x200000) != 0)
  {
    double callLongEveFri = self->_callLongEveFri;
    double v402 = -callLongEveFri;
    if (callLongEveFri >= 0.0) {
      double v402 = self->_callLongEveFri;
    }
    long double v403 = floor(v402 + 0.5);
    double v404 = (v402 - v403) * 1.84467441e19;
    unint64_t v400 = 2654435761u * (unint64_t)fmod(v403, 1.84467441e19);
    if (v404 >= 0.0)
    {
      if (v404 > 0.0) {
        v400 += (unint64_t)v404;
      }
    }
    else
    {
      v400 -= (unint64_t)fabs(v404);
    }
  }
  else
  {
    unint64_t v400 = 0;
  }
  unint64_t v456 = v400;
  if ((has & 0x400000) != 0)
  {
    double callLongEveSat = self->_callLongEveSat;
    double v407 = -callLongEveSat;
    if (callLongEveSat >= 0.0) {
      double v407 = self->_callLongEveSat;
    }
    long double v408 = floor(v407 + 0.5);
    double v409 = (v407 - v408) * 1.84467441e19;
    unint64_t v405 = 2654435761u * (unint64_t)fmod(v408, 1.84467441e19);
    if (v409 >= 0.0)
    {
      if (v409 > 0.0) {
        v405 += (unint64_t)v409;
      }
    }
    else
    {
      v405 -= (unint64_t)fabs(v409);
    }
  }
  else
  {
    unint64_t v405 = 0;
  }
  unint64_t v455 = v405;
  unint64_t v536 = v5;
  if ((has & 0x800000) != 0)
  {
    double callLongEveSun = self->_callLongEveSun;
    double v412 = -callLongEveSun;
    if (callLongEveSun >= 0.0) {
      double v412 = self->_callLongEveSun;
    }
    long double v413 = floor(v412 + 0.5);
    double v414 = (v412 - v413) * 1.84467441e19;
    unint64_t v410 = 2654435761u * (unint64_t)fmod(v413, 1.84467441e19);
    if (v414 >= 0.0)
    {
      if (v414 > 0.0) {
        v410 += (unint64_t)v414;
      }
    }
    else
    {
      v410 -= (unint64_t)fabs(v414);
    }
  }
  else
  {
    unint64_t v410 = 0;
  }
  unint64_t v534 = v25;
  unint64_t v535 = v20;
  if ((has & 0x100000000) != 0)
  {
    double callLongNightWeekday = self->_callLongNightWeekday;
    double v417 = -callLongNightWeekday;
    if (callLongNightWeekday >= 0.0) {
      double v417 = self->_callLongNightWeekday;
    }
    long double v418 = floor(v417 + 0.5);
    double v419 = (v417 - v418) * 1.84467441e19;
    unint64_t v415 = 2654435761u * (unint64_t)fmod(v418, 1.84467441e19);
    if (v419 >= 0.0)
    {
      if (v419 > 0.0) {
        v415 += (unint64_t)v419;
      }
    }
    else
    {
      v415 -= (unint64_t)fabs(v419);
    }
  }
  else
  {
    unint64_t v415 = 0;
  }
  unint64_t v420 = v10;
  unint64_t v453 = v410;
  if ((has & 0x20000000) != 0)
  {
    double callLongNightFri = self->_callLongNightFri;
    double v424 = -callLongNightFri;
    if (callLongNightFri >= 0.0) {
      double v424 = self->_callLongNightFri;
    }
    long double v425 = floor(v424 + 0.5);
    double v426 = (v424 - v425) * 1.84467441e19;
    unint64_t v422 = 2654435761u * (unint64_t)fmod(v425, 1.84467441e19);
    unint64_t v421 = v30;
    if (v426 >= 0.0)
    {
      if (v426 > 0.0) {
        v422 += (unint64_t)v426;
      }
    }
    else
    {
      v422 -= (unint64_t)fabs(v426);
    }
  }
  else
  {
    unint64_t v421 = v30;
    unint64_t v422 = 0;
  }
  unint64_t v427 = v15;
  if ((has & 0x40000000) != 0)
  {
    double callLongNightSat = self->_callLongNightSat;
    double v430 = -callLongNightSat;
    if (callLongNightSat >= 0.0) {
      double v430 = self->_callLongNightSat;
    }
    long double v431 = floor(v430 + 0.5);
    double v432 = (v430 - v431) * 1.84467441e19;
    unint64_t v428 = 2654435761u * (unint64_t)fmod(v431, 1.84467441e19);
    if (v432 >= 0.0)
    {
      if (v432 > 0.0) {
        v428 += (unint64_t)v432;
      }
    }
    else
    {
      v428 -= (unint64_t)fabs(v432);
    }
  }
  else
  {
    unint64_t v428 = 0;
  }
  if ((has & 0x80000000) != 0)
  {
    double callLongNightSun = self->_callLongNightSun;
    double v435 = -callLongNightSun;
    if (callLongNightSun >= 0.0) {
      double v435 = self->_callLongNightSun;
    }
    long double v436 = floor(v435 + 0.5);
    double v437 = (v435 - v436) * 1.84467441e19;
    unint64_t v433 = 2654435761u * (unint64_t)fmod(v436, 1.84467441e19);
    if (v437 >= 0.0)
    {
      if (v437 > 0.0) {
        v433 += (unint64_t)v437;
      }
    }
    else
    {
      v433 -= (unint64_t)fabs(v437);
    }
  }
  else
  {
    unint64_t v433 = 0;
  }
  if ((v3 & 0x20000000) != 0) {
    uint64_t v438 = 2654435761 * self->_contactFamilyRelation;
  }
  else {
    uint64_t v438 = 0;
  }
  NSUInteger v439 = [(NSString *)self->_contactRelation hash];
  uint64_t v440 = *((void *)&self->_has + 1);
  if ((v440 & 0x10000000) != 0)
  {
    uint64_t v441 = 2654435761 * self->_contactFamilyName;
    if ((v440 & 0x4000000000) != 0)
    {
LABEL_705:
      uint64_t v442 = 2654435761 * self->_contactParent;
      if ((v440 & 0x4000000) != 0) {
        goto LABEL_706;
      }
      goto LABEL_717;
    }
  }
  else
  {
    uint64_t v441 = 0;
    if ((v440 & 0x4000000000) != 0) {
      goto LABEL_705;
    }
  }
  uint64_t v442 = 0;
  if ((v440 & 0x4000000) != 0)
  {
LABEL_706:
    uint64_t v443 = 2654435761 * self->_contactEmergency;
    if ((v440 & 0x8000000) != 0) {
      goto LABEL_707;
    }
    goto LABEL_718;
  }
LABEL_717:
  uint64_t v443 = 0;
  if ((v440 & 0x8000000) != 0)
  {
LABEL_707:
    uint64_t v444 = 2654435761 * self->_contactEmergencyFamily;
    if ((v440 & 0x1000000000) != 0) {
      goto LABEL_708;
    }
    goto LABEL_719;
  }
LABEL_718:
  uint64_t v444 = 0;
  if ((v440 & 0x1000000000) != 0)
  {
LABEL_708:
    uint64_t v445 = 2654435761 * self->_contactInHome;
    if ((v440 & 0x2000000000) != 0) {
      goto LABEL_709;
    }
    goto LABEL_720;
  }
LABEL_719:
  uint64_t v445 = 0;
  if ((v440 & 0x2000000000) != 0)
  {
LABEL_709:
    uint64_t v446 = 2654435761 * self->_contactInPhotos;
    if ((v440 & 0x80000000) != 0) {
      goto LABEL_710;
    }
    goto LABEL_721;
  }
LABEL_720:
  uint64_t v446 = 0;
  if ((v440 & 0x80000000) != 0)
  {
LABEL_710:
    uint64_t v447 = 2654435761 * self->_contactInAirDrop;
    if ((v440 & 0x100000000) != 0) {
      goto LABEL_711;
    }
    goto LABEL_722;
  }
LABEL_721:
  uint64_t v447 = 0;
  if ((v440 & 0x100000000) != 0)
  {
LABEL_711:
    uint64_t v448 = 2654435761 * self->_contactInAirDropAtHome;
    if ((v440 & 0x400000000) != 0) {
      goto LABEL_712;
    }
    goto LABEL_723;
  }
LABEL_722:
  uint64_t v448 = 0;
  if ((v440 & 0x400000000) != 0)
  {
LABEL_712:
    uint64_t v449 = 2654435761 * self->_contactInFMFFollowingMe;
    if ((v440 & 0x800000000) != 0) {
      goto LABEL_713;
    }
LABEL_724:
    uint64_t v450 = 0;
    if ((v440 & 0x200000000) != 0) {
      goto LABEL_714;
    }
LABEL_725:
    uint64_t v451 = 0;
    return v536 ^ v537 ^ v420 ^ v427 ^ v535 ^ v534 ^ v421 ^ v533 ^ v532 ^ v531 ^ v530 ^ v529 ^ v528 ^ v527 ^ v526 ^ v525 ^ v524 ^ v523 ^ v522 ^ v521 ^ v520 ^ v519 ^ v518 ^ v517 ^ v516 ^ v515 ^ v514 ^ v513 ^ v512 ^ v511 ^ v510 ^ v509 ^ v508 ^ v507 ^ v506 ^ v505 ^ v504 ^ v503 ^ v502 ^ v501 ^ v500 ^ v499 ^ v498 ^ v497 ^ v496 ^ v495 ^ v494 ^ v493 ^ v492 ^ v491 ^ v490 ^ v489 ^ v488 ^ v487 ^ v486 ^ v485 ^ v484 ^ v483 ^ v482 ^ v481 ^ v480 ^ v479 ^ v478 ^ v477 ^ v476 ^ v475 ^ v474 ^ v473 ^ v472 ^ v471 ^ v470 ^ v469 ^ v468 ^ v467 ^ v466 ^ v465 ^ v464 ^ v463 ^ v462 ^ v461 ^ v460 ^ v459 ^ v458 ^ v457 ^ v456 ^ v455 ^ v454 ^ v415 ^ v422 ^ v428 ^ v433 ^ v438 ^ v439 ^ v441 ^ v442 ^ v443 ^ v444 ^ v445 ^ v446 ^ v447 ^ v448 ^ v449 ^ v450 ^ v451 ^ (2654435761u * self->_mailIntelligenceContactId);
  }
LABEL_723:
  uint64_t v449 = 0;
  if ((v440 & 0x800000000) == 0) {
    goto LABEL_724;
  }
LABEL_713:
  uint64_t v450 = 2654435761 * self->_contactInFMFSharingWithMe;
  if ((v440 & 0x200000000) == 0) {
    goto LABEL_725;
  }
LABEL_714:
  uint64_t v451 = 2654435761 * self->_contactInFMFFavorite;
  return v536 ^ v537 ^ v420 ^ v427 ^ v535 ^ v534 ^ v421 ^ v533 ^ v532 ^ v531 ^ v530 ^ v529 ^ v528 ^ v527 ^ v526 ^ v525 ^ v524 ^ v523 ^ v522 ^ v521 ^ v520 ^ v519 ^ v518 ^ v517 ^ v516 ^ v515 ^ v514 ^ v513 ^ v512 ^ v511 ^ v510 ^ v509 ^ v508 ^ v507 ^ v506 ^ v505 ^ v504 ^ v503 ^ v502 ^ v501 ^ v500 ^ v499 ^ v498 ^ v497 ^ v496 ^ v495 ^ v494 ^ v493 ^ v492 ^ v491 ^ v490 ^ v489 ^ v488 ^ v487 ^ v486 ^ v485 ^ v484 ^ v483 ^ v482 ^ v481 ^ v480 ^ v479 ^ v478 ^ v477 ^ v476 ^ v475 ^ v474 ^ v473 ^ v472 ^ v471 ^ v470 ^ v469 ^ v468 ^ v467 ^ v466 ^ v465 ^ v464 ^ v463 ^ v462 ^ v461 ^ v460 ^ v459 ^ v458 ^ v457 ^ v456 ^ v455 ^ v454 ^ v415 ^ v422 ^ v428 ^ v433 ^ v438 ^ v439 ^ v441 ^ v442 ^ v443 ^ v444 ^ v445 ^ v446 ^ v447 ^ v448 ^ v449 ^ v450 ^ v451 ^ (2654435761u * self->_mailIntelligenceContactId);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x80) != 0)
  {
    self->_firstPartyMsgTotal = *((void *)v4 + 72);
    *((void *)&self->_has + 1) |= 0x80uLL;
    uint64_t v5 = *((void *)v4 + 100);
  }
  uint64_t v6 = *((void *)v4 + 99);
  if ((v5 & 0x40) != 0)
  {
    self->_double firstPartyMsgOutgoingRatio = *((double *)v4 + 71);
    *((void *)&self->_has + 1) |= 0x40uLL;
    uint64_t v6 = *((void *)v4 + 99);
    uint64_t v5 = *((void *)v4 + 100);
    if ((v6 & 0x2000000000000000) == 0)
    {
LABEL_5:
      if ((v6 & 0x400000000000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_114;
    }
  }
  else if ((v6 & 0x2000000000000000) == 0)
  {
    goto LABEL_5;
  }
  self->_double firstPartyMsgMorningWeekday = *((double *)v4 + 62);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x400000000000000) == 0)
  {
LABEL_6:
    if ((v6 & 0x800000000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_double firstPartyMsgMorningFri = *((double *)v4 + 59);
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x800000000000000) == 0)
  {
LABEL_7:
    if ((v6 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_double firstPartyMsgMorningSat = *((double *)v4 + 60);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x1000000000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_double firstPartyMsgMorningSun = *((double *)v4 + 61);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_double firstPartyMsgNoonWeekday = *((double *)v4 + 70);
  *((void *)&self->_has + 1) |= 0x20uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_double firstPartyMsgNoonFri = *((double *)v4 + 67);
  *((void *)&self->_has + 1) |= 4uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_double firstPartyMsgNoonSat = *((double *)v4 + 68);
  *((void *)&self->_has + 1) |= 8uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x200000000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_double firstPartyMsgNoonSun = *((double *)v4 + 69);
  *((void *)&self->_has + 1) |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x200000000000000) == 0)
  {
LABEL_13:
    if ((v6 & 0x40000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_double firstPartyMsgEveWeekday = *((double *)v4 + 58);
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x40000000000000) == 0)
  {
LABEL_14:
    if ((v6 & 0x80000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_double firstPartyMsgEveFri = *((double *)v4 + 55);
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x80000000000000) == 0)
  {
LABEL_15:
    if ((v6 & 0x100000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_double firstPartyMsgEveSat = *((double *)v4 + 56);
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x100000000000000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_double firstPartyMsgEveSun = *((double *)v4 + 57);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v6 & 0x4000000000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_double firstPartyMsgNightWeekday = *((double *)v4 + 66);
  *((void *)&self->_has + 1) |= 2uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x4000000000000000) == 0)
  {
LABEL_18:
    if ((v6 & 0x8000000000000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_double firstPartyMsgNightFri = *((double *)v4 + 63);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x8000000000000000) == 0)
  {
LABEL_19:
    if ((v5 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_double firstPartyMsgNightSat = *((double *)v4 + 64);
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 1) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_double firstPartyMsgNightSun = *((double *)v4 + 65);
  *((void *)&self->_has + 1) |= 1uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_thirdPartyMsgTotal = *((void *)v4 + 90);
  *((void *)&self->_has + 1) |= 0x1000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x8000) == 0)
  {
LABEL_22:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_double thirdPartyMsgMorningWeekday = *((double *)v4 + 81);
  *((void *)&self->_has + 1) |= 0x8000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x1000) == 0)
  {
LABEL_23:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_double thirdPartyMsgMorningFri = *((double *)v4 + 78);
  *((void *)&self->_has + 1) |= 0x1000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x2000) == 0)
  {
LABEL_24:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_double thirdPartyMsgMorningSat = *((double *)v4 + 79);
  *((void *)&self->_has + 1) |= 0x2000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x4000) == 0)
  {
LABEL_25:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_double thirdPartyMsgMorningSun = *((double *)v4 + 80);
  *((void *)&self->_has + 1) |= 0x4000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x800000) == 0)
  {
LABEL_26:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_double thirdPartyMsgNoonWeekday = *((double *)v4 + 89);
  *((void *)&self->_has + 1) |= 0x800000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x100000) == 0)
  {
LABEL_27:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_double thirdPartyMsgNoonFri = *((double *)v4 + 86);
  *((void *)&self->_has + 1) |= 0x100000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x200000) == 0)
  {
LABEL_28:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_double thirdPartyMsgNoonSat = *((double *)v4 + 87);
  *((void *)&self->_has + 1) |= 0x200000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x400000) == 0)
  {
LABEL_29:
    if ((v5 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_double thirdPartyMsgNoonSun = *((double *)v4 + 88);
  *((void *)&self->_has + 1) |= 0x400000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x800) == 0)
  {
LABEL_30:
    if ((v5 & 0x100) == 0) {
      goto LABEL_31;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_double thirdPartyMsgEveWeekday = *((double *)v4 + 77);
  *((void *)&self->_has + 1) |= 0x800uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x100) == 0)
  {
LABEL_31:
    if ((v5 & 0x200) == 0) {
      goto LABEL_32;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_double thirdPartyMsgEveFri = *((double *)v4 + 74);
  *((void *)&self->_has + 1) |= 0x100uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x200) == 0)
  {
LABEL_32:
    if ((v5 & 0x400) == 0) {
      goto LABEL_33;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_double thirdPartyMsgEveSat = *((double *)v4 + 75);
  *((void *)&self->_has + 1) |= 0x200uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x400) == 0)
  {
LABEL_33:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_double thirdPartyMsgEveSun = *((double *)v4 + 76);
  *((void *)&self->_has + 1) |= 0x400uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x80000) == 0)
  {
LABEL_34:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_double thirdPartyMsgNightWeekday = *((double *)v4 + 85);
  *((void *)&self->_has + 1) |= 0x80000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x10000) == 0)
  {
LABEL_35:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_double thirdPartyMsgNightFri = *((double *)v4 + 82);
  *((void *)&self->_has + 1) |= 0x10000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x20000) == 0)
  {
LABEL_36:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_double thirdPartyMsgNightSat = *((double *)v4 + 83);
  *((void *)&self->_has + 1) |= 0x20000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x40000) == 0)
  {
LABEL_37:
    if ((v6 & 0x10000000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_double thirdPartyMsgNightSun = *((double *)v4 + 84);
  *((void *)&self->_has + 1) |= 0x40000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x10000000000000) == 0)
  {
LABEL_38:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_callTotal = *((void *)v4 + 53);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_39:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_callBirthday = *((_DWORD *)v4 + 182);
  *((void *)&self->_has + 1) |= 0x2000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_40:
    if ((v6 & 0x20000000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_contactFavorite = *((_DWORD *)v4 + 187);
  *((void *)&self->_has + 1) |= 0x40000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x20000000000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x2000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_double callTotalDur = *((double *)v4 + 54);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x8000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_double callLongRatio = *((double *)v4 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x8000000000000) == 0)
  {
LABEL_43:
    if ((v6 & 1) == 0) {
      goto LABEL_44;
    }
    goto LABEL_152;
  }
LABEL_151:
  self->_double callOutgoingRatio = *((double *)v4 + 52);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 1) == 0)
  {
LABEL_44:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_153;
  }
LABEL_152:
  self->_double callAvgDur = *((double *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x40000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_double callMaxDur = *((double *)v4 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x40000000000) == 0)
  {
LABEL_46:
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_double callMorningWeekday = *((double *)v4 + 43);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x8000000000) == 0)
  {
LABEL_47:
    if ((v6 & 0x10000000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_double callMorningFri = *((double *)v4 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x10000000000) == 0)
  {
LABEL_48:
    if ((v6 & 0x20000000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_157;
  }
LABEL_156:
  self->_double callMorningSat = *((double *)v4 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x20000000000) == 0)
  {
LABEL_49:
    if ((v6 & 0x4000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_158;
  }
LABEL_157:
  self->_double callMorningSun = *((double *)v4 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_50:
    if ((v6 & 0x800000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_159;
  }
LABEL_158:
  self->_double callNoonWeekday = *((double *)v4 + 51);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x800000000000) == 0)
  {
LABEL_51:
    if ((v6 & 0x1000000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_160;
  }
LABEL_159:
  self->_double callNoonFri = *((double *)v4 + 48);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x1000000000000) == 0)
  {
LABEL_52:
    if ((v6 & 0x2000000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_double callNoonSat = *((double *)v4 + 49);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_53:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_double callNoonSun = *((double *)v4 + 50);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x100000) == 0)
  {
LABEL_54:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_double callEveWeekday = *((double *)v4 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x20000) == 0)
  {
LABEL_55:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_double callEveFri = *((double *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x40000) == 0)
  {
LABEL_56:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_double callEveSat = *((double *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x80000) == 0)
  {
LABEL_57:
    if ((v6 & 0x400000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_166;
  }
LABEL_165:
  self->_double callEveSun = *((double *)v4 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x400000000000) == 0)
  {
LABEL_58:
    if ((v6 & 0x80000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_167;
  }
LABEL_166:
  self->_double callNightWeekday = *((double *)v4 + 47);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x80000000000) == 0)
  {
LABEL_59:
    if ((v6 & 0x100000000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_168;
  }
LABEL_167:
  self->_double callNightFri = *((double *)v4 + 44);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x100000000000) == 0)
  {
LABEL_60:
    if ((v6 & 0x200000000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_double callNightSat = *((double *)v4 + 45);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x200000000000) == 0)
  {
LABEL_61:
    if ((v6 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_double callNightSun = *((double *)v4 + 46);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x100) == 0)
  {
LABEL_62:
    if ((v6 & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_double callDurMorningWeekday = *((double *)v4 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x20) == 0)
  {
LABEL_63:
    if ((v6 & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_double callDurMorningFri = *((double *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x40) == 0)
  {
LABEL_64:
    if ((v6 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_173;
  }
LABEL_172:
  self->_double callDurMorningSat = *((double *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x80) == 0)
  {
LABEL_65:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_174;
  }
LABEL_173:
  self->_double callDurMorningSun = *((double *)v4 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x10000) == 0)
  {
LABEL_66:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_175;
  }
LABEL_174:
  self->_double callDurNoonWeekday = *((double *)v4 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x2000) == 0)
  {
LABEL_67:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_176;
  }
LABEL_175:
  self->_double callDurNoonFri = *((double *)v4 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x4000) == 0)
  {
LABEL_68:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_177;
  }
LABEL_176:
  self->_double callDurNoonSat = *((double *)v4 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x8000) == 0)
  {
LABEL_69:
    if ((v6 & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_178;
  }
LABEL_177:
  self->_double callDurNoonSun = *((double *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x10) == 0)
  {
LABEL_70:
    if ((v6 & 2) == 0) {
      goto LABEL_71;
    }
    goto LABEL_179;
  }
LABEL_178:
  self->_double callDurEveWeekday = *((double *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 2) == 0)
  {
LABEL_71:
    if ((v6 & 4) == 0) {
      goto LABEL_72;
    }
    goto LABEL_180;
  }
LABEL_179:
  self->_double callDurEveFri = *((double *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 4) == 0)
  {
LABEL_72:
    if ((v6 & 8) == 0) {
      goto LABEL_73;
    }
    goto LABEL_181;
  }
LABEL_180:
  self->_double callDurEveSat = *((double *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 8) == 0)
  {
LABEL_73:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_182;
  }
LABEL_181:
  self->_double callDurEveSun = *((double *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x1000) == 0)
  {
LABEL_74:
    if ((v6 & 0x200) == 0) {
      goto LABEL_75;
    }
    goto LABEL_183;
  }
LABEL_182:
  self->_double callDurNightWeekday = *((double *)v4 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x200) == 0)
  {
LABEL_75:
    if ((v6 & 0x400) == 0) {
      goto LABEL_76;
    }
    goto LABEL_184;
  }
LABEL_183:
  self->_double callDurNightFri = *((double *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x400) == 0)
  {
LABEL_76:
    if ((v6 & 0x800) == 0) {
      goto LABEL_77;
    }
    goto LABEL_185;
  }
LABEL_184:
  self->_double callDurNightSat = *((double *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x800) == 0)
  {
LABEL_77:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_186;
  }
LABEL_185:
  self->_double callDurNightSun = *((double *)v4 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_78:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_187;
  }
LABEL_186:
  self->_double callLongMorningWeekday = *((double *)v4 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_79:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_188;
  }
LABEL_187:
  self->_double callLongMorningFri = *((double *)v4 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_80:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_189;
  }
LABEL_188:
  self->_double callLongMorningSat = *((double *)v4 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_81:
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_190;
  }
LABEL_189:
  self->_double callLongMorningSun = *((double *)v4 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x1000000000) == 0)
  {
LABEL_82:
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_191;
  }
LABEL_190:
  self->_double callLongNoonWeekday = *((double *)v4 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x200000000) == 0)
  {
LABEL_83:
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_192;
  }
LABEL_191:
  self->_double callLongNoonFri = *((double *)v4 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x400000000) == 0)
  {
LABEL_84:
    if ((v6 & 0x800000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_193;
  }
LABEL_192:
  self->_double callLongNoonSat = *((double *)v4 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x800000000) == 0)
  {
LABEL_85:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_194;
  }
LABEL_193:
  self->_double callLongNoonSun = *((double *)v4 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_86:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_195;
  }
LABEL_194:
  self->_double callLongEveWeekday = *((double *)v4 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x200000) == 0)
  {
LABEL_87:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_196;
  }
LABEL_195:
  self->_double callLongEveFri = *((double *)v4 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x400000) == 0)
  {
LABEL_88:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_197;
  }
LABEL_196:
  self->_double callLongEveSat = *((double *)v4 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x800000) == 0)
  {
LABEL_89:
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_198;
  }
LABEL_197:
  self->_double callLongEveSun = *((double *)v4 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_90:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_199;
  }
LABEL_198:
  self->_double callLongNightWeekday = *((double *)v4 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_91:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_200;
  }
LABEL_199:
  self->_double callLongNightFri = *((double *)v4 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v6 = *((void *)v4 + 99);
  uint64_t v5 = *((void *)v4 + 100);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_92:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_201;
  }
LABEL_200:
  self->_double callLongNightSat = *((double *)v4 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 100);
  if ((*((void *)v4 + 99) & 0x80000000) == 0)
  {
LABEL_93:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_94;
  }
LABEL_201:
  self->_double callLongNightSun = *((double *)v4 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  if ((*((void *)v4 + 100) & 0x20000000) != 0)
  {
LABEL_94:
    self->_contactFamilyRelation = *((_DWORD *)v4 + 186);
    *((void *)&self->_has + 1) |= 0x20000000uLL;
  }
LABEL_95:
  if (*((void *)v4 + 98))
  {
    id v8 = v4;
    -[MailIntelligencePETContactEvent setContactRelation:](self, "setContactRelation:");
    id v4 = v8;
  }
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x10000000) != 0)
  {
    self->_contactFamilyName = *((_DWORD *)v4 + 185);
    *((void *)&self->_has + 1) |= 0x10000000uLL;
    uint64_t v7 = *((void *)v4 + 100);
    if ((v7 & 0x4000000000) == 0)
    {
LABEL_99:
      if ((v7 & 0x4000000) == 0) {
        goto LABEL_100;
      }
      goto LABEL_205;
    }
  }
  else if ((v7 & 0x4000000000) == 0)
  {
    goto LABEL_99;
  }
  self->_contactParent = *((_DWORD *)v4 + 195);
  *((void *)&self->_has + 1) |= 0x4000000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x4000000) == 0)
  {
LABEL_100:
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_206;
  }
LABEL_205:
  self->_contactEmergency = *((_DWORD *)v4 + 183);
  *((void *)&self->_has + 1) |= 0x4000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x8000000) == 0)
  {
LABEL_101:
    if ((v7 & 0x1000000000) == 0) {
      goto LABEL_102;
    }
    goto LABEL_207;
  }
LABEL_206:
  self->_contactEmergencyFamily = *((_DWORD *)v4 + 184);
  *((void *)&self->_has + 1) |= 0x8000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x1000000000) == 0)
  {
LABEL_102:
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_103;
    }
    goto LABEL_208;
  }
LABEL_207:
  self->_contactInHome = *((_DWORD *)v4 + 193);
  *((void *)&self->_has + 1) |= 0x1000000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x2000000000) == 0)
  {
LABEL_103:
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_104;
    }
    goto LABEL_209;
  }
LABEL_208:
  self->_contactInPhotos = *((_DWORD *)v4 + 194);
  *((void *)&self->_has + 1) |= 0x2000000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x80000000) == 0)
  {
LABEL_104:
    if ((v7 & 0x100000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_210;
  }
LABEL_209:
  self->_contactInAirDrop = *((_DWORD *)v4 + 188);
  *((void *)&self->_has + 1) |= 0x80000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x100000000) == 0)
  {
LABEL_105:
    if ((v7 & 0x400000000) == 0) {
      goto LABEL_106;
    }
    goto LABEL_211;
  }
LABEL_210:
  self->_contactInAirDropAtHome = *((_DWORD *)v4 + 189);
  *((void *)&self->_has + 1) |= 0x100000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x400000000) == 0)
  {
LABEL_106:
    if ((v7 & 0x800000000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_212;
  }
LABEL_211:
  self->_contactInFMFFollowingMe = *((_DWORD *)v4 + 191);
  *((void *)&self->_has + 1) |= 0x400000000uLL;
  uint64_t v7 = *((void *)v4 + 100);
  if ((v7 & 0x800000000) == 0)
  {
LABEL_107:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_108;
  }
LABEL_212:
  self->_contactInFMFSharingWithMe = *((_DWORD *)v4 + 192);
  *((void *)&self->_has + 1) |= 0x800000000uLL;
  if ((*((void *)v4 + 100) & 0x200000000) != 0)
  {
LABEL_108:
    self->_contactInFMFFavorite = *((_DWORD *)v4 + 190);
    *((void *)&self->_has + 1) |= 0x200000000uLL;
  }
LABEL_109:
  self->_mailIntelligenceContactId = *((void *)v4 + 73);
}

- (unint64_t)firstPartyMsgTotal
{
  return self->_firstPartyMsgTotal;
}

- (double)firstPartyMsgOutgoingRatio
{
  return self->_firstPartyMsgOutgoingRatio;
}

- (double)firstPartyMsgMorningWeekday
{
  return self->_firstPartyMsgMorningWeekday;
}

- (double)firstPartyMsgMorningFri
{
  return self->_firstPartyMsgMorningFri;
}

- (double)firstPartyMsgMorningSat
{
  return self->_firstPartyMsgMorningSat;
}

- (double)firstPartyMsgMorningSun
{
  return self->_firstPartyMsgMorningSun;
}

- (double)firstPartyMsgNoonWeekday
{
  return self->_firstPartyMsgNoonWeekday;
}

- (double)firstPartyMsgNoonFri
{
  return self->_firstPartyMsgNoonFri;
}

- (double)firstPartyMsgNoonSat
{
  return self->_firstPartyMsgNoonSat;
}

- (double)firstPartyMsgNoonSun
{
  return self->_firstPartyMsgNoonSun;
}

- (double)firstPartyMsgEveWeekday
{
  return self->_firstPartyMsgEveWeekday;
}

- (double)firstPartyMsgEveFri
{
  return self->_firstPartyMsgEveFri;
}

- (double)firstPartyMsgEveSat
{
  return self->_firstPartyMsgEveSat;
}

- (double)firstPartyMsgEveSun
{
  return self->_firstPartyMsgEveSun;
}

- (double)firstPartyMsgNightWeekday
{
  return self->_firstPartyMsgNightWeekday;
}

- (double)firstPartyMsgNightFri
{
  return self->_firstPartyMsgNightFri;
}

- (double)firstPartyMsgNightSat
{
  return self->_firstPartyMsgNightSat;
}

- (double)firstPartyMsgNightSun
{
  return self->_firstPartyMsgNightSun;
}

- (unint64_t)thirdPartyMsgTotal
{
  return self->_thirdPartyMsgTotal;
}

- (double)thirdPartyMsgMorningWeekday
{
  return self->_thirdPartyMsgMorningWeekday;
}

- (double)thirdPartyMsgMorningFri
{
  return self->_thirdPartyMsgMorningFri;
}

- (double)thirdPartyMsgMorningSat
{
  return self->_thirdPartyMsgMorningSat;
}

- (double)thirdPartyMsgMorningSun
{
  return self->_thirdPartyMsgMorningSun;
}

- (double)thirdPartyMsgNoonWeekday
{
  return self->_thirdPartyMsgNoonWeekday;
}

- (double)thirdPartyMsgNoonFri
{
  return self->_thirdPartyMsgNoonFri;
}

- (double)thirdPartyMsgNoonSat
{
  return self->_thirdPartyMsgNoonSat;
}

- (double)thirdPartyMsgNoonSun
{
  return self->_thirdPartyMsgNoonSun;
}

- (double)thirdPartyMsgEveWeekday
{
  return self->_thirdPartyMsgEveWeekday;
}

- (double)thirdPartyMsgEveFri
{
  return self->_thirdPartyMsgEveFri;
}

- (double)thirdPartyMsgEveSat
{
  return self->_thirdPartyMsgEveSat;
}

- (double)thirdPartyMsgEveSun
{
  return self->_thirdPartyMsgEveSun;
}

- (double)thirdPartyMsgNightWeekday
{
  return self->_thirdPartyMsgNightWeekday;
}

- (double)thirdPartyMsgNightFri
{
  return self->_thirdPartyMsgNightFri;
}

- (double)thirdPartyMsgNightSat
{
  return self->_thirdPartyMsgNightSat;
}

- (double)thirdPartyMsgNightSun
{
  return self->_thirdPartyMsgNightSun;
}

- (unint64_t)callTotal
{
  return self->_callTotal;
}

- (unsigned)callBirthday
{
  return self->_callBirthday;
}

- (unsigned)contactFavorite
{
  return self->_contactFavorite;
}

- (double)callTotalDur
{
  return self->_callTotalDur;
}

- (double)callLongRatio
{
  return self->_callLongRatio;
}

- (double)callOutgoingRatio
{
  return self->_callOutgoingRatio;
}

- (double)callAvgDur
{
  return self->_callAvgDur;
}

- (double)callMaxDur
{
  return self->_callMaxDur;
}

- (double)callMorningWeekday
{
  return self->_callMorningWeekday;
}

- (double)callMorningFri
{
  return self->_callMorningFri;
}

- (double)callMorningSat
{
  return self->_callMorningSat;
}

- (double)callMorningSun
{
  return self->_callMorningSun;
}

- (double)callNoonWeekday
{
  return self->_callNoonWeekday;
}

- (double)callNoonFri
{
  return self->_callNoonFri;
}

- (double)callNoonSat
{
  return self->_callNoonSat;
}

- (double)callNoonSun
{
  return self->_callNoonSun;
}

- (double)callEveWeekday
{
  return self->_callEveWeekday;
}

- (double)callEveFri
{
  return self->_callEveFri;
}

- (double)callEveSat
{
  return self->_callEveSat;
}

- (double)callEveSun
{
  return self->_callEveSun;
}

- (double)callNightWeekday
{
  return self->_callNightWeekday;
}

- (double)callNightFri
{
  return self->_callNightFri;
}

- (double)callNightSat
{
  return self->_callNightSat;
}

- (double)callNightSun
{
  return self->_callNightSun;
}

- (double)callDurMorningWeekday
{
  return self->_callDurMorningWeekday;
}

- (double)callDurMorningFri
{
  return self->_callDurMorningFri;
}

- (double)callDurMorningSat
{
  return self->_callDurMorningSat;
}

- (double)callDurMorningSun
{
  return self->_callDurMorningSun;
}

- (double)callDurNoonWeekday
{
  return self->_callDurNoonWeekday;
}

- (double)callDurNoonFri
{
  return self->_callDurNoonFri;
}

- (double)callDurNoonSat
{
  return self->_callDurNoonSat;
}

- (double)callDurNoonSun
{
  return self->_callDurNoonSun;
}

- (double)callDurEveWeekday
{
  return self->_callDurEveWeekday;
}

- (double)callDurEveFri
{
  return self->_callDurEveFri;
}

- (double)callDurEveSat
{
  return self->_callDurEveSat;
}

- (double)callDurEveSun
{
  return self->_callDurEveSun;
}

- (double)callDurNightWeekday
{
  return self->_callDurNightWeekday;
}

- (double)callDurNightFri
{
  return self->_callDurNightFri;
}

- (double)callDurNightSat
{
  return self->_callDurNightSat;
}

- (double)callDurNightSun
{
  return self->_callDurNightSun;
}

- (double)callLongMorningWeekday
{
  return self->_callLongMorningWeekday;
}

- (double)callLongMorningFri
{
  return self->_callLongMorningFri;
}

- (double)callLongMorningSat
{
  return self->_callLongMorningSat;
}

- (double)callLongMorningSun
{
  return self->_callLongMorningSun;
}

- (double)callLongNoonWeekday
{
  return self->_callLongNoonWeekday;
}

- (double)callLongNoonFri
{
  return self->_callLongNoonFri;
}

- (double)callLongNoonSat
{
  return self->_callLongNoonSat;
}

- (double)callLongNoonSun
{
  return self->_callLongNoonSun;
}

- (double)callLongEveWeekday
{
  return self->_callLongEveWeekday;
}

- (double)callLongEveFri
{
  return self->_callLongEveFri;
}

- (double)callLongEveSat
{
  return self->_callLongEveSat;
}

- (double)callLongEveSun
{
  return self->_callLongEveSun;
}

- (double)callLongNightWeekday
{
  return self->_callLongNightWeekday;
}

- (double)callLongNightFri
{
  return self->_callLongNightFri;
}

- (double)callLongNightSat
{
  return self->_callLongNightSat;
}

- (double)callLongNightSun
{
  return self->_callLongNightSun;
}

- (unsigned)contactFamilyRelation
{
  return self->_contactFamilyRelation;
}

- (NSString)contactRelation
{
  return self->_contactRelation;
}

- (void)setContactRelation:(id)a3
{
}

- (unsigned)contactFamilyName
{
  return self->_contactFamilyName;
}

- (unsigned)contactParent
{
  return self->_contactParent;
}

- (unsigned)contactEmergency
{
  return self->_contactEmergency;
}

- (unsigned)contactEmergencyFamily
{
  return self->_contactEmergencyFamily;
}

- (unsigned)contactInHome
{
  return self->_contactInHome;
}

- (unsigned)contactInPhotos
{
  return self->_contactInPhotos;
}

- (unsigned)contactInAirDrop
{
  return self->_contactInAirDrop;
}

- (unsigned)contactInAirDropAtHome
{
  return self->_contactInAirDropAtHome;
}

- (unsigned)contactInFMFFollowingMe
{
  return self->_contactInFMFFollowingMe;
}

- (unsigned)contactInFMFSharingWithMe
{
  return self->_contactInFMFSharingWithMe;
}

- (unsigned)contactInFMFFavorite
{
  return self->_contactInFMFFavorite;
}

- (unint64_t)mailIntelligenceContactId
{
  return self->_mailIntelligenceContactId;
}

- (void)setMailIntelligenceContactId:(unint64_t)a3
{
  self->_mailIntelligenceContactId = a3;
}

- (void).cxx_destruct
{
}

@end