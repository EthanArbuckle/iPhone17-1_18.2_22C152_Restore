@interface MsdosFileItem
- (unint64_t)maxFileSize;
- (void)waitForWrites;
@end

@implementation MsdosFileItem

- (unint64_t)maxFileSize
{
  return 0xFFFFFFFFLL;
}

- (void)waitForWrites
{
  v2 = self;
  while ([(FileItem *)self writeCounter])
  {
    usleep(0x64u);
    self = v2;
  }
}

@end