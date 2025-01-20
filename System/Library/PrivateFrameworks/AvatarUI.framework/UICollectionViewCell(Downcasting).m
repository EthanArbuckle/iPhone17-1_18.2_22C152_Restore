@interface UICollectionViewCell(Downcasting)
- (uint64_t)downcastWithCellHandler:()Downcasting listCellHandler:;
@end

@implementation UICollectionViewCell(Downcasting)

- (uint64_t)downcastWithCellHandler:()Downcasting listCellHandler:
{
  if (a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, result);
  }
  return result;
}

@end