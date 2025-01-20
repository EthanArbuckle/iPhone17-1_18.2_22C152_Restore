@interface _ATXNotificationGroupBaseRanker
+ (id)rankerId;
- (id)_initialGroupComparisonValue:(id)a3;
- (id)rankNotificationGroups:(id)a3 modeId:(id)a4;
- (int64_t)compareGroups:(id)a3 group2:(id)a4;
@end

@implementation _ATXNotificationGroupBaseRanker

- (id)_initialGroupComparisonValue:(id)a3
{
  uint64_t v3 = [a3 isCommunicationGroup];
  v4 = NSNumber;

  return (id)[v4 numberWithUnsignedInteger:v3];
}

- (int64_t)compareGroups:(id)a3 group2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_ATXNotificationGroupBaseRanker *)self _initialGroupComparisonValue:v7];
  v9 = [(_ATXNotificationGroupBaseRanker *)self _initialGroupComparisonValue:v6];
  int64_t v10 = [v8 compare:v9];

  if (!v10)
  {
    v11 = NSNumber;
    [v7 priority];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    v13 = NSNumber;
    [v6 priority];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    int64_t v10 = [v12 compare:v14];
  }
  return v10;
}

- (id)rankNotificationGroups:(id)a3 modeId:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___ATXNotificationGroupBaseRanker_rankNotificationGroups_modeId___block_invoke;
  v6[3] = &unk_1E5D09618;
  v6[4] = self;
  v4 = objc_msgSend(a3, "sortedArrayUsingComparator:", v6, a4);

  return v4;
}

+ (id)rankerId
{
  return @"_ATXNotificationGroupBaseRanker";
}

@end