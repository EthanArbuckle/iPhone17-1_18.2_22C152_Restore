@interface VOVoice
+ (id)fetchRequest;
@end

@implementation VOVoice

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"VOVoice"];
}

@end