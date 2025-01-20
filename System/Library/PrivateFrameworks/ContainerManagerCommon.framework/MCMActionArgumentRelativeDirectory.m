@interface MCMActionArgumentRelativeDirectory
- (id)fileURL;
@end

@implementation MCMActionArgumentRelativeDirectory

- (id)fileURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(MCMActionArgumentBase *)self string];
  v4 = [v2 fileURLWithPath:v3 isDirectory:1 relativeToURL:0];

  return v4;
}

@end