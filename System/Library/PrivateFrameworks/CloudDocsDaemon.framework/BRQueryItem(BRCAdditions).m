@interface BRQueryItem(BRCAdditions)
- (id)asFileProviderItem;
- (unint64_t)_isAppLibraryTrashFolder;
@end

@implementation BRQueryItem(BRCAdditions)

- (unint64_t)_isAppLibraryTrashFolder
{
  return ((unint64_t)*(unsigned int *)(a1 + (int)*MEMORY[0x1E4F595D0]) >> 30) & 1;
}

- (id)asFileProviderItem
{
  if ([a1 isDead] & 1) != 0 || (objc_msgSend(a1, "_isAppLibraryTrashFolder")) {
    id v2 = 0;
  }
  else {
    id v2 = a1;
  }
  return v2;
}

@end