@interface EKEvent(IpsosExtendedStorage)
- (double)ipsos_confidence;
- (double)ipsos_duration;
- (double)ipsos_experimentalConfidence;
- (id)ipsos_betterDescription;
- (id)ipsos_dataFeatures;
- (id)ipsos_eventClassificationType;
- (id)ipsos_messageUnit;
- (uint64_t)ipsos_allDayPreferred;
- (uint64_t)ipsos_disableTimeAdjustment;
- (uint64_t)ipsos_eventAttributes;
- (uint64_t)ipsos_eventStatus;
- (uint64_t)ipsos_isDateTimeTenseDependent;
- (uint64_t)ipsos_isEndTimeApproximate;
- (uint64_t)ipsos_isEventTimeOnlyAndReferrengingToSentDate;
- (uint64_t)ipsos_isTimeApproximate;
- (uint64_t)ipsos_isTimeOffset;
- (uint64_t)ipsos_timeNeedsMeridianGuess;
- (uint64_t)ipsos_usedBubblesCount;
- (uint64_t)ipsos_usesDefaultClassificationTypeStartTime;
- (void)setIpsos_allDayPreferred:()IpsosExtendedStorage;
- (void)setIpsos_confidence:()IpsosExtendedStorage;
- (void)setIpsos_dataFeatures:()IpsosExtendedStorage;
- (void)setIpsos_disableTimeAdjustment:()IpsosExtendedStorage;
- (void)setIpsos_eventAttributes:()IpsosExtendedStorage;
- (void)setIpsos_eventClassificationType:()IpsosExtendedStorage;
- (void)setIpsos_eventStatus:()IpsosExtendedStorage;
- (void)setIpsos_experimentalConfidence:()IpsosExtendedStorage;
- (void)setIpsos_isDateTimeTenseDependent:()IpsosExtendedStorage;
- (void)setIpsos_isEndTimeApproximate:()IpsosExtendedStorage;
- (void)setIpsos_isEventTimeOnlyAndReferrengingToSentDate:()IpsosExtendedStorage;
- (void)setIpsos_isTimeApproximate:()IpsosExtendedStorage;
- (void)setIpsos_isTimeOffset:()IpsosExtendedStorage;
- (void)setIpsos_messageUnit:()IpsosExtendedStorage;
- (void)setIpsos_timeNeedsMeridianGuess:()IpsosExtendedStorage;
- (void)setIpsos_usedBubblesCount:()IpsosExtendedStorage;
- (void)setIpsos_usesDefaultClassificationTypeStartTime:()IpsosExtendedStorage;
@end

@implementation EKEvent(IpsosExtendedStorage)

- (uint64_t)ipsos_isTimeApproximate
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_isTimeApproximateKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_isTimeApproximate:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_isTimeApproximateKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_isEndTimeApproximate
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_isEndTimeApproximateKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_isEndTimeApproximate:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_isEndTimeApproximateKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_usesDefaultClassificationTypeStartTime
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_usesDefaultClassificationTypeStartTimeKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_usesDefaultClassificationTypeStartTime:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_usesDefaultClassificationTypeStartTimeKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_timeNeedsMeridianGuess
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_timeNeedsMeridianGuessKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_timeNeedsMeridianGuess:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_timeNeedsMeridianGuessKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_isDateTimeTenseDependent
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_isDateTimeTenseDependentKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_isDateTimeTenseDependent:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_isDateTimeTenseDependentKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_isEventTimeOnlyAndReferrengingToSentDate
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_isEventTimeOnlyAndReferrengingToSentDateKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_isEventTimeOnlyAndReferrengingToSentDate:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_isEventTimeOnlyAndReferrengingToSentDateKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_isTimeOffset
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_isTimeOffsetKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_isTimeOffset:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_isTimeOffsetKey", v2, (void *)0x301);
}

- (id)ipsos_eventClassificationType
{
  return objc_getAssociatedObject(a1, @"ipsos_eventClassificationTypeKey");
}

- (void)setIpsos_eventClassificationType:()IpsosExtendedStorage
{
}

- (id)ipsos_dataFeatures
{
  return objc_getAssociatedObject(a1, @"ipsos_dataFeaturesKey");
}

- (void)setIpsos_dataFeatures:()IpsosExtendedStorage
{
}

- (id)ipsos_messageUnit
{
  return objc_getAssociatedObject(a1, @"ipsos_messageUnitKey");
}

- (void)setIpsos_messageUnit:()IpsosExtendedStorage
{
}

- (uint64_t)ipsos_allDayPreferred
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_allDayPreferredKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_allDayPreferred:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_allDayPreferredKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_disableTimeAdjustment
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_disableTimeAdjustmentKey");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setIpsos_disableTimeAdjustment:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_disableTimeAdjustmentKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_usedBubblesCount
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_usedBubblesCountKey");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setIpsos_usedBubblesCount:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_usedBubblesCountKey", v2, (void *)0x301);
}

- (double)ipsos_duration
{
  id v2 = [a1 endDate];
  v3 = [a1 startDate];
  [v2 timeIntervalSinceDate:v3];
  double v5 = v4;

  return v5;
}

- (double)ipsos_confidence
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_confidenceKey");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (void)setIpsos_confidence:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_confidenceKey", v2, (void *)0x301);
}

- (double)ipsos_experimentalConfidence
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_experimentalConfidenceKey");
  [v1 doubleValue];
  double v3 = v2;

  return v3;
}

- (void)setIpsos_experimentalConfidence:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_experimentalConfidenceKey", v2, (void *)0x301);
}

- (uint64_t)ipsos_eventStatus
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_eventStatus");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setIpsos_eventStatus:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_eventStatus", v2, (void *)0x301);
}

- (uint64_t)ipsos_eventAttributes
{
  v1 = objc_getAssociatedObject(a1, @"ipsos_eventAttributesKey");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setIpsos_eventAttributes:()IpsosExtendedStorage
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"ipsos_eventAttributesKey", v2, (void *)0x301);
}

- (id)ipsos_betterDescription
{
  uint64_t v2 = objc_msgSend(a1, "ipsos_eventStatus");
  double v3 = @"None";
  double v4 = @"Confirmed";
  if (v2 != 2) {
    double v4 = @"None";
  }
  if (v2 == 1) {
    double v5 = @"Proposed";
  }
  else {
    double v5 = v4;
  }
  v23 = v5;
  v24 = NSString;
  uint64_t v6 = [a1 description];
  v7 = [a1 startDate];
  v8 = [a1 endDate];
  int v9 = [a1 isAllDay];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v22 = v10;
  v11 = [a1 timeZone];
  v12 = objc_msgSend(a1, "ipsos_eventClassificationType");
  if (v12)
  {
    v21 = objc_msgSend(a1, "ipsos_eventClassificationType");
    double v3 = [v21 identifier];
  }
  v13 = @"_";
  if (objc_msgSend(a1, "ipsos_isTimeApproximate")) {
    v14 = @"A";
  }
  else {
    v14 = @"_";
  }
  if (objc_msgSend(a1, "ipsos_isDateTimeTenseDependent")) {
    v15 = @"T";
  }
  else {
    v15 = @"_";
  }
  if (objc_msgSend(a1, "ipsos_isEventTimeOnlyAndReferrengingToSentDate")) {
    v13 = @"S";
  }
  objc_msgSend(a1, "ipsos_confidence");
  v20 = v14;
  v16 = (void *)v6;
  v18 = [v24 stringWithFormat:@"%@ startDate:%@ endDate:%@ allDay:%@ TZ:%@ type:%@ [%@%@%@] status:%@ confidence:%.02f", v6, v7, v8, v22, v11, v3, v20, v15, v13, v23, v17];
  if (v12)
  {
  }
  return v18;
}

@end