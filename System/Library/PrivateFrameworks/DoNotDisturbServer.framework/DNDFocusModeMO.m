@interface DNDFocusModeMO
+ (id)fetchRequest;
@end

@implementation DNDFocusModeMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"FocusMode"];
}

@end