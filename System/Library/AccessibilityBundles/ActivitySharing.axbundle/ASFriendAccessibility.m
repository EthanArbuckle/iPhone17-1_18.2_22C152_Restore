@interface ASFriendAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (ASFriendAccessibility)initWithActivitySnapshots:(id)a3 friendAchievements:(id)a4 friendWorkouts:(id)a5 contact:(id)a6 competitions:(id)a7;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation ASFriendAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASFriend";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASFriend" hasInstanceVariable:@"_competitions" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASFriend", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASFriend", @"initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", "@", "@", "@", "@", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)ASFriendAccessibility;
  [(ASFriendAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ASFriendAccessibility *)self safeStringForKey:@"displayName"];
  if ([v3 length])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v4 = [(ASFriendAccessibility *)self safeArrayForKey:@"_competitions", 0];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) _accessibilitySetRetainedValue:v3 forKey:@"kAXFriendDisplayNameForCompetition"];
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (ASFriendAccessibility)initWithActivitySnapshots:(id)a3 friendAchievements:(id)a4 friendWorkouts:(id)a5 contact:(id)a6 competitions:(id)a7
{
  v9.receiver = self;
  v9.super_class = (Class)ASFriendAccessibility;
  uint64_t v7 = [(ASFriendAccessibility *)&v9 initWithActivitySnapshots:a3 friendAchievements:a4 friendWorkouts:a5 contact:a6 competitions:a7];
  [(ASFriendAccessibility *)v7 _accessibilityLoadAccessibilityInformation];

  return v7;
}

@end