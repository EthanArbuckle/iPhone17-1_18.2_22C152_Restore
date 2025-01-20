@interface _DPPrioRecordMO
+ (id)fetchRequest;
@end

@implementation _DPPrioRecordMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"PrioRecord"];
}

@end