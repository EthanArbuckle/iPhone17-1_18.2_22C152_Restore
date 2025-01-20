@interface DRSUploadSessionRecordMO
+ (id)fetchRequest;
@end

@implementation DRSUploadSessionRecordMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"DRSUploadSessionRecordMO"];
}

@end