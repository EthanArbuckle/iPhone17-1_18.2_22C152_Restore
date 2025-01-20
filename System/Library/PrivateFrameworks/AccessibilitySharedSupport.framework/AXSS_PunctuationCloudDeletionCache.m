@interface AXSS_PunctuationCloudDeletionCache
+ (id)fetchRequest;
@end

@implementation AXSS_PunctuationCloudDeletionCache

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AXSS_PunctuationCloudDeletionCache"];
}

@end