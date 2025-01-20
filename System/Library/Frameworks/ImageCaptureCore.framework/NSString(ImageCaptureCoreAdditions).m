@interface NSString(ImageCaptureCoreAdditions)
+ (id)stringFromOSType:()ImageCaptureCoreAdditions;
- (id)asciiString;
@end

@implementation NSString(ImageCaptureCoreAdditions)

+ (id)stringFromOSType:()ImageCaptureCoreAdditions
{
  if (a3)
  {
    unsigned int v6 = bswap32(a3);
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v6 length:4];
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:30];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)asciiString
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 0, 128);
  v3 = [v2 invertedSet];
  v4 = [a1 componentsSeparatedByCharactersInSet:v3];
  v5 = [v4 componentsJoinedByString:@" "];

  if ([v5 length])
  {
    if ((unint64_t)[v5 length] < 0x13) {
      goto LABEL_6;
    }
    unsigned int v6 = objc_msgSend(v5, "substringWithRange:", 0, 18);
    v7 = [v6 stringByAppendingString:@".."];

    v5 = v6;
  }
  else
  {
    v7 = @"{empty}";
  }

  v5 = v7;
LABEL_6:

  return v5;
}

@end