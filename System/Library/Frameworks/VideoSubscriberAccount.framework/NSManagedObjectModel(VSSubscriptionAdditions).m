@interface NSManagedObjectModel(VSSubscriptionAdditions)
+ (id)vs_subscriptionModelForVersion:()VSSubscriptionAdditions;
@end

@implementation NSManagedObjectModel(VSSubscriptionAdditions)

+ (id)vs_subscriptionModelForVersion:()VSSubscriptionAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C120]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = objc_msgSend(MEMORY[0x1E4F1C0A8], "vs_subscriptionEntityForVersion:", a3);
  [v5 addObject:v6];
  [v4 setEntities:v5];

  return v4;
}

@end