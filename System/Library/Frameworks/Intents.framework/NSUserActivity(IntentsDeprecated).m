@interface NSUserActivity(IntentsDeprecated)
+ (uint64_t)deleteAllInteractions;
+ (uint64_t)deleteInteractionsWithGroupIdentifier:()IntentsDeprecated;
+ (uint64_t)deleteInteractionsWithIdentifiers:()IntentsDeprecated;
@end

@implementation NSUserActivity(IntentsDeprecated)

+ (uint64_t)deleteInteractionsWithGroupIdentifier:()IntentsDeprecated
{
  return +[INInteraction deleteInteractionsWithGroupIdentifier:a3 completion:0];
}

+ (uint64_t)deleteInteractionsWithIdentifiers:()IntentsDeprecated
{
  return +[INInteraction deleteInteractionsWithIdentifiers:a3 completion:0];
}

+ (uint64_t)deleteAllInteractions
{
  return +[INInteraction deleteAllInteractionsWithCompletion:0];
}

@end