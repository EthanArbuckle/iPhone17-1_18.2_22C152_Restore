@interface DNDAppConfigurationTargetContentIdentifierPrefixMO
+ (id)fetchRequest;
@end

@implementation DNDAppConfigurationTargetContentIdentifierPrefixMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AppConfigurationTargetContentIdentifierPrefix"];
}

@end