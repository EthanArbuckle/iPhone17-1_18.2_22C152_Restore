@interface OSMRelevanceEngineFeatures
+ (id)hasOngoingEventFeature;
+ (id)isMusicPlayingFeature;
+ (id)isNotGroupMessageFeature;
+ (id)isSenderFavoriteFeature;
+ (id)isSenderInContactsFeature;
+ (id)mediaTypeFeature;
+ (id)motionActivityFeature;
+ (id)numberOfInteractionsInLastDayFeature;
+ (id)numberOfInteractionsInLastFortnightFeature;
+ (id)numberOfInteractionsInLastHalfHourFeature;
+ (id)numberOfInteractionsInLastHourFeature;
+ (id)numberOfInteractionsInLastMinuteFeature;
+ (id)numberOfInteractionsInLastMonthFeature;
+ (id)numberOfInteractionsInLastSixHoursFeature;
+ (id)numberOfInteractionsInLastWeekFeature;
+ (id)numberOfInteractionsOlderThanLastMonthFeature;
+ (id)timeSinceMostRecentInteractionFeature;
+ (id)timeSinceNegativeFeedbackFeature;
@end

@implementation OSMRelevanceEngineFeatures

+ (id)timeSinceNegativeFeedbackFeature
{
  return +[REFeature featureWithName:@"TimeSinceLastNegativeFeedback" featureType:2];
}

+ (id)numberOfInteractionsOlderThanLastMonthFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsOlderThanLastMonth" featureType:2];
}

+ (id)numberOfInteractionsInLastMonthFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastMonth" featureType:2];
}

+ (id)numberOfInteractionsInLastFortnightFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastFortnight" featureType:2];
}

+ (id)numberOfInteractionsInLastWeekFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastWeek" featureType:2];
}

+ (id)numberOfInteractionsInLastDayFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastDay" featureType:2];
}

+ (id)numberOfInteractionsInLastSixHoursFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastSixHours" featureType:2];
}

+ (id)numberOfInteractionsInLastHourFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastHour" featureType:2];
}

+ (id)numberOfInteractionsInLastHalfHourFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastHalfHour" featureType:2];
}

+ (id)numberOfInteractionsInLastMinuteFeature
{
  return +[REFeature featureWithName:@"NumberOfInteractionsInLastMinute" featureType:2];
}

+ (id)timeSinceMostRecentInteractionFeature
{
  return +[REFeature featureWithName:@"TimeSinceMoseRecentInteraction" featureType:2];
}

+ (id)mediaTypeFeature
{
  return +[REFeature featureWithName:@"MediaType" featureType:1];
}

+ (id)isMusicPlayingFeature
{
  return +[REFeature featureWithName:@"isMusicPlaying" featureType:1];
}

+ (id)motionActivityFeature
{
  return +[REFeature featureWithName:@"MotionActivity" featureType:1];
}

+ (id)hasOngoingEventFeature
{
  return +[REFeature featureWithName:@"HasOngoingEvent" featureType:1];
}

+ (id)isNotGroupMessageFeature
{
  return +[REFeature featureWithName:@"IsNotGroupMessage" featureType:1];
}

+ (id)isSenderFavoriteFeature
{
  return +[REFeature featureWithName:@"IsSenderFavorite" featureType:1];
}

+ (id)isSenderInContactsFeature
{
  return +[REFeature featureWithName:@"IsSenderInContacts" featureType:1];
}

@end