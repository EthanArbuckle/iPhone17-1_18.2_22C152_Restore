@interface AXSS_PunctuationContext
+ (id)fetchRequest;
@end

@implementation AXSS_PunctuationContext

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationContext"];
}

@end