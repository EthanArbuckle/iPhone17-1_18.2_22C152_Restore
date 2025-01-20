@interface SFAddToPhotosLibraryCommand(_CPCommandType)
- (uint64_t)_cpCommandType;
@end

@implementation SFAddToPhotosLibraryCommand(_CPCommandType)

- (uint64_t)_cpCommandType
{
  return 36;
}

@end