@interface AXSS_PunctuationEntry
+ (id)fetchRequest;
@end

@implementation AXSS_PunctuationEntry

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationEntry"];
}

@end