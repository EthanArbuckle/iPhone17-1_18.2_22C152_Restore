@interface VOLanguage
+ (id)fetchRequest;
@end

@implementation VOLanguage

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VOLanguage"];
}

@end