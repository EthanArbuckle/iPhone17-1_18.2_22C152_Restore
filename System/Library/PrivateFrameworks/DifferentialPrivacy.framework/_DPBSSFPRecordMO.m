@interface _DPBSSFPRecordMO
+ (id)fetchRequest;
@end

@implementation _DPBSSFPRecordMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"BSSFPRecord"];
}

@end