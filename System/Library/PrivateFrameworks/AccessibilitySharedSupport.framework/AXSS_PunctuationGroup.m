@interface AXSS_PunctuationGroup
+ (id)fetchRequest;
@end

@implementation AXSS_PunctuationGroup

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationGroup"];
}

@end