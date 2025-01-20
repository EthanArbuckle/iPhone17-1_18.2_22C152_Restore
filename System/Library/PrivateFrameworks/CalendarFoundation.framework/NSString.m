@interface NSString
@end

@implementation NSString

void __49__NSString_CalClassAdditions__stringByURLQuoting__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"?"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByURLQuoting_allowedCharacters;
  stringByURLQuoting_allowedCharacters = v1;
}

void __71__NSString_CalClassAdditions__stringByURLEscapingAllReservedCharacters__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@":/?#[]@!$&’()*+,;=%"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByURLEscapingAllReservedCharacters_allowedCharacters;
  stringByURLEscapingAllReservedCharacters_allowedCharacters = v1;
}

void __54__NSString_CalClassAdditions__stringByEncodingSlashes__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)stringByEncodingSlashes_allowedCharacters;
  stringByEncodingSlashes_allowedCharacters = v1;
}

uint64_t __46__NSString_CalClassAdditions__CalSafeFilename__block_invoke()
{
  CalSafeFilename_disallowedCharacters = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"/\\?%*|\"<>:"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __51__NSString_CalClassAdditions__CalAutoCommentPrefix__block_invoke()
{
  CalAutoCommentPrefix_prefix = objc_msgSend(NSString, "stringWithFormat:", @"%C🗓%C ", 8203, 8203);

  return MEMORY[0x1F41817F8]();
}

@end