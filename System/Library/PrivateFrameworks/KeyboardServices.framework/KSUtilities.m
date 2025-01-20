@interface KSUtilities
@end

@implementation KSUtilities

void __33___KSUtilities_keyboardDirectory__block_invoke()
{
  uint64_t v0 = _homeDirectory();
  v1 = (void *)keyboardDirectory_dir;
  keyboardDirectory_dir = v0;

  uint64_t v2 = [(id)keyboardDirectory_dir stringByAppendingPathComponent:@"/Library/Keyboard"];
  v3 = (void *)keyboardDirectory_dir;
  keyboardDirectory_dir = v2;
}

void __41___KSUtilities_keyboardServicesDirectory__block_invoke()
{
  uint64_t v0 = _homeDirectory();
  v1 = (void *)keyboardServicesDirectory_dir;
  keyboardServicesDirectory_dir = v0;

  uint64_t v2 = [(id)keyboardServicesDirectory_dir stringByAppendingPathComponent:@"/Library/KeyboardServices"];
  v3 = (void *)keyboardServicesDirectory_dir;
  keyboardServicesDirectory_dir = v2;

  char v11 = 1;
  v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:keyboardServicesDirectory_dir isDirectory:&v11];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    id v10 = 0;
    [v6 createDirectoryAtPath:keyboardServicesDirectory_dir withIntermediateDirectories:0 attributes:0 error:&v10];
    id v7 = v10;

    if (v7)
    {
      uint64_t v8 = keyboardServicesDirectory_dir;
      v9 = [v7 localizedDescription];
      NSLog(&cfstr_CouldNotCreate.isa, v8, v9);
    }
  }
}

@end