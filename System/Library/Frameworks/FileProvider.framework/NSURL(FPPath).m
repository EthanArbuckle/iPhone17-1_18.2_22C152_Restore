@interface NSURL(FPPath)
- (uint64_t)fp_pathComponentDisplayMetadata;
@end

@implementation NSURL(FPPath)

- (uint64_t)fp_pathComponentDisplayMetadata
{
  return MEMORY[0x1E4F1CBF0];
}

@end