@interface MKFCloudSyncMetadata
+ (id)fetchRequest;
- (void)willSave;
@end

@implementation MKFCloudSyncMetadata

- (void)willSave
{
  v3.receiver = self;
  v3.super_class = (Class)MKFCloudSyncMetadata;
  [(MKFCloudSyncMetadata *)&v3 willSave];
  if (([(MKFCloudSyncMetadata *)self unique] & 1) == 0) {
    [(MKFCloudSyncMetadata *)self setUnique:1];
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"CloudSyncMetadata"];
}

@end