@interface _DPPTRecordMO
+ (id)fetchRequest;
@end

@implementation _DPPTRecordMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PTRecord"];
}

@end