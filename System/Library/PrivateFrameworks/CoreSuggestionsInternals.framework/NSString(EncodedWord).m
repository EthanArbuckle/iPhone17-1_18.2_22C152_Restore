@interface NSString(EncodedWord)
- (id)sg_stringWithDecodedEncodedWords;
@end

@implementation NSString(EncodedWord)

- (id)sg_stringWithDecodedEncodedWords
{
  v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "sg_decodeEncodedWords");
  return v1;
}

@end