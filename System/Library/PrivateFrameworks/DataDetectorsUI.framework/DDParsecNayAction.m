@interface DDParsecNayAction
- (BOOL)hasUserInterface;
- (id)localizedName;
- (int)interactionType;
- (unint64_t)relevancy;
@end

@implementation DDParsecNayAction

- (id)localizedName
{
  return @"Report as irrelevant (Internal)";
}

- (unint64_t)relevancy
{
  return 2;
}

- (int)interactionType
{
  return 0;
}

- (BOOL)hasUserInterface
{
  return 0;
}

@end