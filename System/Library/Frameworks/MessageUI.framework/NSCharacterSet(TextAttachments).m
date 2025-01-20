@interface NSCharacterSet(TextAttachments)
+ (id)textAttachmentCharacterSet;
@end

@implementation NSCharacterSet(TextAttachments)

+ (id)textAttachmentCharacterSet
{
  __int16 v3 = -4;
  v0 = [NSString stringWithCharacters:&v3 length:1];
  v1 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v0];

  return v1;
}

@end