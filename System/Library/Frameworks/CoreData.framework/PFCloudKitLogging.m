@interface PFCloudKitLogging
+ (void)setCatastrophicLoggingLevel;
- (PFCloudKitLogging)init;
- (void)dealloc;
@end

@implementation PFCloudKitLogging

- (PFCloudKitLogging)init
{
  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitLogging;
  v2 = [(PFCloudKitLogging *)&v7 init];
  if (v2)
  {
    __ckLoggingOverride = 16;
    v3 = (void *)MEMORY[0x18C127630]();
    uint64_t v4 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, @"com.apple.CoreData.CloudKitDebug");
    switch(v4)
    {
      case 1:
        uint64_t v5 = 4;
        break;
      case 2:
        uint64_t v5 = 3;
        break;
      case 3:
        uint64_t v5 = 1;
        break;
      default:
        uint64_t v5 = 16;
        break;
    }
    __ckLoggingOverride = v5;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PFCloudKitLogging;
  [(PFCloudKitLogging *)&v2 dealloc];
}

+ (void)setCatastrophicLoggingLevel
{
  __ckLoggingOverride = 1;
}

@end