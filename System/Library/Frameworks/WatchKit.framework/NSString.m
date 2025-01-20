@interface NSString
@end

@implementation NSString

void __67__NSString_SPExtras___sp_stringByEncodingIllegalFilenameCharacters__block_invoke()
{
  id v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"/%"];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)_sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent;
  _sp_stringByEncodingIllegalFilenameCharacters_characterSetExcludingSlashAndPercent = v0;
}

@end