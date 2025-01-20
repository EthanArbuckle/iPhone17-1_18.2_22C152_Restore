@interface TDRecognitionObjectProduction
+ (id)fetchRequest;
@end

@implementation TDRecognitionObjectProduction

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TDRecognitionObjectProduction"];
}

@end