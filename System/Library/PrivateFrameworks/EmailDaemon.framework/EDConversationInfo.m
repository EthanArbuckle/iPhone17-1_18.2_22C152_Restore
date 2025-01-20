@interface EDConversationInfo
+ (id)fetchRequest;
@end

@implementation EDConversationInfo

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ConversationInfo"];
}

@end