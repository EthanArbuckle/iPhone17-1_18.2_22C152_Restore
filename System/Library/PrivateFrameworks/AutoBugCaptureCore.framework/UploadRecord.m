@interface UploadRecord
+ (id)fetchRequest;
- (NSMutableArray)fileURLs;
- (void)setFileURLs:(id)a3;
@end

@implementation UploadRecord

- (NSMutableArray)fileURLs
{
  return self->fileURLs;
}

- (void)setFileURLs:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"UploadRecord"];
}

@end