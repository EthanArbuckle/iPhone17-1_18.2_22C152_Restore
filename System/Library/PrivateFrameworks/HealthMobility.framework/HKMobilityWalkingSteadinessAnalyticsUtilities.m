@interface HKMobilityWalkingSteadinessAnalyticsUtilities
+ (id)payloadStringForWalkingSteadinessClassification:(int64_t)a3;
+ (id)payloadStringForWalkingSteadinessNotificationClassificationWithValue:(int64_t)a3;
+ (id)payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:(id)a3;
+ (id)payloadStringForWalkingSteadinessNotificationTypeWithValue:(int64_t)a3;
@end

@implementation HKMobilityWalkingSteadinessAnalyticsUtilities

+ (id)payloadStringForWalkingSteadinessClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E6D4CF68 + a3 - 1);
  }
}

+ (id)payloadStringForWalkingSteadinessNotificationClassificationWithValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "payloadStringForWalkingSteadinessClassification:", qword_1E0B1FE50[a3 - 1], v3);
  }
  return v5;
}

+ (id)payloadStringForWalkingSteadinessNotificationTypeWithValue:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E6D4CF80 + a3 - 1);
  }
}

+ (id)payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F446E0]])
  {
    uint64_t v4 = @"dismiss";
  }
  else if ([v3 isEqual:*MEMORY[0x1E4F446D0]])
  {
    uint64_t v4 = @"view data";
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end