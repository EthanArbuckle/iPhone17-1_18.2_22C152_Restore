@interface NSString(SPExtras)
- (uint64_t)_sp_stringByEncodingIllegalFilenameCharacters;
@end

@implementation NSString(SPExtras)

- (uint64_t)_sp_stringByEncodingIllegalFilenameCharacters
{
  if (_sp_stringByEncodingIllegalFilenameCharacters_onceToken != -1) {
    dispatch_once(&_sp_stringByEncodingIllegalFilenameCharacters_onceToken, &__block_literal_global);
  }
  uint64_t v2 = _sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent;

  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
}

@end