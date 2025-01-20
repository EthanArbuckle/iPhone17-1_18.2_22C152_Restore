@interface NSMutableArray(PHAssetResource)
- (unint64_t)vcp_sortBySize;
@end

@implementation NSMutableArray(PHAssetResource)

- (unint64_t)vcp_sortBySize
{
  unint64_t result = [a1 count];
  if (result >= 2)
  {
    return [a1 sortUsingComparator:&__block_literal_global_4];
  }
  return result;
}

@end