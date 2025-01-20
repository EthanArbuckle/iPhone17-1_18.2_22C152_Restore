@interface NSBundle
@end

@implementation NSBundle

void __44__NSBundle_DoNotDisturb__dnd_locationBundle__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = BSSystemRootDirectory();
  v6[0] = v1;
  v6[1] = @"System";
  v6[2] = @"Library";
  v6[3] = @"LocationBundles";
  v6[4] = @"DoNotDisturb.bundle";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v3 = [v0 fileURLWithPathComponents:v2];

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
  v5 = (void *)dnd_locationBundle_bundle;
  dnd_locationBundle_bundle = v4;
}

void __60__NSBundle_DoNotDisturb__dnd_doNotDisturbLocalizationBundle__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = BSSystemRootDirectory();
  v6[0] = v1;
  v6[1] = @"System";
  v6[2] = @"Library";
  v6[3] = @"PrivateFrameworks";
  v6[4] = @"DoNotDisturb.framework";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v3 = [v0 fileURLWithPathComponents:v2];

  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
  v5 = (void *)dnd_doNotDisturbLocalizationBundle_bundle;
  dnd_doNotDisturbLocalizationBundle_bundle = v4;
}

@end