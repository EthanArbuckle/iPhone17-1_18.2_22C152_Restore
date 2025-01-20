@interface WFFitnessWorkoutActivityTypeContentItem
+ (id)countDescription;
+ (id)itemWithActivityType:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
- (id)activityType;
- (id)activityTypeIdentifier;
@end

@implementation WFFitnessWorkoutActivityTypeContentItem

- (id)activityTypeIdentifier
{
  v2 = [(WFFitnessWorkoutActivityTypeContentItem *)self activityType];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (id)activityType
{
  v3 = +[WFObjectType typeWithClass:getFIUIWorkoutActivityTypeClass()];
  v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  v5 = [v4 firstObject];
  v6 = [v5 object];

  return v6;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Activities");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Workout Activity Types", @"Workout Activity Types");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Workout Activity Type", @"Workout Activity Type");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  getFIUIWorkoutActivityTypeClass();
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)itemWithActivityType:(id)a3
{
  return +[WFContentItem itemWithObject:a3];
}

@end