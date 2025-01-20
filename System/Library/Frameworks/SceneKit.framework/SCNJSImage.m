@interface SCNJSImage
+ (id)SCNJSExportProtocol;
+ (id)imageWithPath:(id)a3;
+ (id)imageWithURL:(id)a3;
@end

@implementation SCNJSImage

+ (id)imageWithURL:(id)a3
{
  return (id)[MEMORY[0x263F1C6B0] imageWithContentsOfFile:a3];
}

+ (id)imageWithPath:(id)a3
{
  return (id)[MEMORY[0x263F1C6B0] imageWithContentsOfFile:a3];
}

+ (id)SCNJSExportProtocol
{
  return &unk_26C009768;
}

@end