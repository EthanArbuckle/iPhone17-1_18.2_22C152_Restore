@interface _CDMailIntelligencePETDataCollectionUtilities
+ (id)prepareContactEventFromEventDic:(id)a3;
@end

@implementation _CDMailIntelligencePETDataCollectionUtilities

+ (id)prepareContactEventFromEventDic:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(MailIntelligencePETContactEvent);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqualToString:", @"contactRelation", (void)v13))
        {
          v11 = [v5 objectForKey:v10];
          [(MailIntelligencePETContactEvent *)v4 setContactRelation:v11];
        }
        else
        {
          v11 = [v5 valueForKey:v10];
          if ([v10 isEqualToString:@"firstPartyMsgTotal"])
          {
            -[MailIntelligencePETContactEvent setFirstPartyMsgTotal:](v4, "setFirstPartyMsgTotal:", (int)[v11 intValue]);
          }
          else if ([v10 isEqualToString:@"firstPartyMsgOutgoingRatio"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgOutgoingRatio:](v4, "setFirstPartyMsgOutgoingRatio:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgMorningWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningWeekday:](v4, "setFirstPartyMsgMorningWeekday:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgMorningFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningFri:](v4, "setFirstPartyMsgMorningFri:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgMorningSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningSat:](v4, "setFirstPartyMsgMorningSat:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgMorningSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgMorningSun:](v4, "setFirstPartyMsgMorningSun:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNoonWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonWeekday:](v4, "setFirstPartyMsgNoonWeekday:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNoonFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonFri:](v4, "setFirstPartyMsgNoonFri:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNoonSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonSat:](v4, "setFirstPartyMsgNoonSat:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNoonSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNoonSun:](v4, "setFirstPartyMsgNoonSun:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgEveWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveWeekday:](v4, "setFirstPartyMsgEveWeekday:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgEveFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveFri:](v4, "setFirstPartyMsgEveFri:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgEveSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveSat:](v4, "setFirstPartyMsgEveSat:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgEveSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgEveSun:](v4, "setFirstPartyMsgEveSun:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNightWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightWeekday:](v4, "setFirstPartyMsgNightWeekday:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNightFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightFri:](v4, "setFirstPartyMsgNightFri:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNightSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightSat:](v4, "setFirstPartyMsgNightSat:");
          }
          else if ([v10 isEqualToString:@"firstPartyMsgNightSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setFirstPartyMsgNightSun:](v4, "setFirstPartyMsgNightSun:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgTotal"])
          {
            -[MailIntelligencePETContactEvent setThirdPartyMsgTotal:](v4, "setThirdPartyMsgTotal:", (int)[v11 intValue]);
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgMorningWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningWeekday:](v4, "setThirdPartyMsgMorningWeekday:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgMorningFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningFri:](v4, "setThirdPartyMsgMorningFri:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgMorningSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningSat:](v4, "setThirdPartyMsgMorningSat:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgMorningSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgMorningSun:](v4, "setThirdPartyMsgMorningSun:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNoonWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonWeekday:](v4, "setThirdPartyMsgNoonWeekday:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNoonFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonFri:](v4, "setThirdPartyMsgNoonFri:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNoonSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonSat:](v4, "setThirdPartyMsgNoonSat:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNoonSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNoonSun:](v4, "setThirdPartyMsgNoonSun:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgEveWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveWeekday:](v4, "setThirdPartyMsgEveWeekday:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgEveFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveFri:](v4, "setThirdPartyMsgEveFri:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgEveSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveSat:](v4, "setThirdPartyMsgEveSat:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgEveSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgEveSun:](v4, "setThirdPartyMsgEveSun:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNightWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightWeekday:](v4, "setThirdPartyMsgNightWeekday:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNightFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightFri:](v4, "setThirdPartyMsgNightFri:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNightSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightSat:](v4, "setThirdPartyMsgNightSat:");
          }
          else if ([v10 isEqualToString:@"thirdPartyMsgNightSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setThirdPartyMsgNightSun:](v4, "setThirdPartyMsgNightSun:");
          }
          else if ([v10 isEqualToString:@"callTotal"])
          {
            -[MailIntelligencePETContactEvent setCallTotal:](v4, "setCallTotal:", (int)[v11 intValue]);
          }
          else if ([v10 isEqualToString:@"callBirthday"])
          {
            -[MailIntelligencePETContactEvent setCallBirthday:](v4, "setCallBirthday:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactFavorite"])
          {
            -[MailIntelligencePETContactEvent setContactFavorite:](v4, "setContactFavorite:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"callTotalDur"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallTotalDur:](v4, "setCallTotalDur:");
          }
          else if ([v10 isEqualToString:@"callLongRatio"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongRatio:](v4, "setCallLongRatio:");
          }
          else if ([v10 isEqualToString:@"callOutgoingRatio"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallOutgoingRatio:](v4, "setCallOutgoingRatio:");
          }
          else if ([v10 isEqualToString:@"callAvgDur"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallAvgDur:](v4, "setCallAvgDur:");
          }
          else if ([v10 isEqualToString:@"callMaxDur"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallMaxDur:](v4, "setCallMaxDur:");
          }
          else if ([v10 isEqualToString:@"callMorningWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallMorningWeekday:](v4, "setCallMorningWeekday:");
          }
          else if ([v10 isEqualToString:@"callMorningFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallMorningFri:](v4, "setCallMorningFri:");
          }
          else if ([v10 isEqualToString:@"callMorningSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallMorningSat:](v4, "setCallMorningSat:");
          }
          else if ([v10 isEqualToString:@"callMorningSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallMorningSun:](v4, "setCallMorningSun:");
          }
          else if ([v10 isEqualToString:@"callNoonWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNoonWeekday:](v4, "setCallNoonWeekday:");
          }
          else if ([v10 isEqualToString:@"callNoonFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNoonFri:](v4, "setCallNoonFri:");
          }
          else if ([v10 isEqualToString:@"callNoonSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNoonSat:](v4, "setCallNoonSat:");
          }
          else if ([v10 isEqualToString:@"callNoonSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNoonSun:](v4, "setCallNoonSun:");
          }
          else if ([v10 isEqualToString:@"callEveWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallEveWeekday:](v4, "setCallEveWeekday:");
          }
          else if ([v10 isEqualToString:@"callEveFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallEveFri:](v4, "setCallEveFri:");
          }
          else if ([v10 isEqualToString:@"callEveSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallEveSat:](v4, "setCallEveSat:");
          }
          else if ([v10 isEqualToString:@"callEveSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallEveSun:](v4, "setCallEveSun:");
          }
          else if ([v10 isEqualToString:@"callNightWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNightWeekday:](v4, "setCallNightWeekday:");
          }
          else if ([v10 isEqualToString:@"callNightFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNightFri:](v4, "setCallNightFri:");
          }
          else if ([v10 isEqualToString:@"callNightSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNightSat:](v4, "setCallNightSat:");
          }
          else if ([v10 isEqualToString:@"callNightSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallNightSun:](v4, "setCallNightSun:");
          }
          else if ([v10 isEqualToString:@"callDurMorningWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurMorningWeekday:](v4, "setCallDurMorningWeekday:");
          }
          else if ([v10 isEqualToString:@"callDurMorningFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurMorningFri:](v4, "setCallDurMorningFri:");
          }
          else if ([v10 isEqualToString:@"callDurMorningSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurMorningSat:](v4, "setCallDurMorningSat:");
          }
          else if ([v10 isEqualToString:@"callDurMorningSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurMorningSun:](v4, "setCallDurMorningSun:");
          }
          else if ([v10 isEqualToString:@"callDurNoonWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNoonWeekday:](v4, "setCallDurNoonWeekday:");
          }
          else if ([v10 isEqualToString:@"callDurNoonFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNoonFri:](v4, "setCallDurNoonFri:");
          }
          else if ([v10 isEqualToString:@"callDurNoonSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNoonSat:](v4, "setCallDurNoonSat:");
          }
          else if ([v10 isEqualToString:@"callDurNoonSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNoonSun:](v4, "setCallDurNoonSun:");
          }
          else if ([v10 isEqualToString:@"callDurEveWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurEveWeekday:](v4, "setCallDurEveWeekday:");
          }
          else if ([v10 isEqualToString:@"callDurEveFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurEveFri:](v4, "setCallDurEveFri:");
          }
          else if ([v10 isEqualToString:@"callDurEveSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurEveSat:](v4, "setCallDurEveSat:");
          }
          else if ([v10 isEqualToString:@"callDurEveSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurEveSun:](v4, "setCallDurEveSun:");
          }
          else if ([v10 isEqualToString:@"callDurNightWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNightWeekday:](v4, "setCallDurNightWeekday:");
          }
          else if ([v10 isEqualToString:@"callDurNightFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNightFri:](v4, "setCallDurNightFri:");
          }
          else if ([v10 isEqualToString:@"callDurNightSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNightSat:](v4, "setCallDurNightSat:");
          }
          else if ([v10 isEqualToString:@"callDurNightSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallDurNightSun:](v4, "setCallDurNightSun:");
          }
          else if ([v10 isEqualToString:@"callLongMorningWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongMorningWeekday:](v4, "setCallLongMorningWeekday:");
          }
          else if ([v10 isEqualToString:@"callLongMorningFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongMorningFri:](v4, "setCallLongMorningFri:");
          }
          else if ([v10 isEqualToString:@"callLongMorningSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongMorningSat:](v4, "setCallLongMorningSat:");
          }
          else if ([v10 isEqualToString:@"callLongMorningSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongMorningSun:](v4, "setCallLongMorningSun:");
          }
          else if ([v10 isEqualToString:@"callLongNoonWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNoonWeekday:](v4, "setCallLongNoonWeekday:");
          }
          else if ([v10 isEqualToString:@"callLongNoonFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNoonFri:](v4, "setCallLongNoonFri:");
          }
          else if ([v10 isEqualToString:@"callLongNoonSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNoonSat:](v4, "setCallLongNoonSat:");
          }
          else if ([v10 isEqualToString:@"callLongNoonSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNoonSun:](v4, "setCallLongNoonSun:");
          }
          else if ([v10 isEqualToString:@"callLongEveWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongEveWeekday:](v4, "setCallLongEveWeekday:");
          }
          else if ([v10 isEqualToString:@"callLongEveFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongEveFri:](v4, "setCallLongEveFri:");
          }
          else if ([v10 isEqualToString:@"callLongEveSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongEveSat:](v4, "setCallLongEveSat:");
          }
          else if ([v10 isEqualToString:@"callLongEveSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongEveSun:](v4, "setCallLongEveSun:");
          }
          else if ([v10 isEqualToString:@"callLongNightWeekday"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNightWeekday:](v4, "setCallLongNightWeekday:");
          }
          else if ([v10 isEqualToString:@"callLongNightFri"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNightFri:](v4, "setCallLongNightFri:");
          }
          else if ([v10 isEqualToString:@"callLongNightSat"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNightSat:](v4, "setCallLongNightSat:");
          }
          else if ([v10 isEqualToString:@"callLongNightSun"])
          {
            [v11 doubleValue];
            -[MailIntelligencePETContactEvent setCallLongNightSun:](v4, "setCallLongNightSun:");
          }
          else if ([v10 isEqualToString:@"contactFamilyRelation"])
          {
            -[MailIntelligencePETContactEvent setContactFamilyRelation:](v4, "setContactFamilyRelation:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactFamilyName"])
          {
            -[MailIntelligencePETContactEvent setContactFamilyName:](v4, "setContactFamilyName:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactParent"])
          {
            -[MailIntelligencePETContactEvent setContactParent:](v4, "setContactParent:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactEmergency"])
          {
            -[MailIntelligencePETContactEvent setContactEmergency:](v4, "setContactEmergency:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactEmergencyFamily"])
          {
            -[MailIntelligencePETContactEvent setContactEmergencyFamily:](v4, "setContactEmergencyFamily:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInHome"])
          {
            -[MailIntelligencePETContactEvent setContactInHome:](v4, "setContactInHome:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInPhotos"])
          {
            -[MailIntelligencePETContactEvent setContactInPhotos:](v4, "setContactInPhotos:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInAirDrop"])
          {
            -[MailIntelligencePETContactEvent setContactInAirDrop:](v4, "setContactInAirDrop:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInAirDropAtHome"])
          {
            -[MailIntelligencePETContactEvent setContactInAirDropAtHome:](v4, "setContactInAirDropAtHome:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInFMFFollowingMe"])
          {
            -[MailIntelligencePETContactEvent setContactInFMFFollowingMe:](v4, "setContactInFMFFollowingMe:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInFMFSharingWithMe"])
          {
            -[MailIntelligencePETContactEvent setContactInFMFSharingWithMe:](v4, "setContactInFMFSharingWithMe:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"contactInFMFFavorite"])
          {
            -[MailIntelligencePETContactEvent setContactInFMFFavorite:](v4, "setContactInFMFFavorite:", [v11 unsignedIntValue]);
          }
          else if ([v10 isEqualToString:@"mailIntelligenceContactId"])
          {
            -[MailIntelligencePETContactEvent setMailIntelligenceContactId:](v4, "setMailIntelligenceContactId:", [v11 unsignedLongLongValue]);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

@end