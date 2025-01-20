@interface MCInstallerReader
+ (id)sharedReader;
+ (void)_setSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4;
- (id)pathsToInstalledProfilesWithFilterFlags:(int)a3;
@end

@implementation MCInstallerReader

+ (id)sharedReader
{
  if (sharedReader_once != -1) {
    dispatch_once(&sharedReader_once, &__block_literal_global_25);
  }
  v2 = (void *)sharedReader_obj_0;
  return v2;
}

uint64_t __33__MCInstallerReader_sharedReader__block_invoke()
{
  sharedReader_obj_0 = objc_alloc_init(MCInstallerReader);
  return MEMORY[0x1F41817F8]();
}

- (id)pathsToInstalledProfilesWithFilterFlags:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[MCManifest sharedManifest];
  v5 = [v4 identifiersOfProfilesWithFilterFlags:v3];

  if ([v5 count])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      v8 = [v5 objectAtIndex:v6];
      if ((v3 & 8) != 0)
      {
        v9 = (void *)__userProfileStorageDirectory;
        if (!__userProfileStorageDirectory)
        {
          uint64_t v13 = MCUserProfileStorageDirectory();
          v12 = (void *)__userProfileStorageDirectory;
          __userProfileStorageDirectory = v13;
          v11 = &__userProfileStorageDirectory;
          goto LABEL_8;
        }
      }
      else
      {
        v9 = (void *)__systemProfileStorageDirectory;
        if (!__systemProfileStorageDirectory)
        {
          uint64_t v10 = MCSystemProfileStorageDirectory();
          v11 = &__systemProfileStorageDirectory;
          v12 = (void *)__systemProfileStorageDirectory;
          __systemProfileStorageDirectory = v10;
LABEL_8:

          v9 = (void *)*v11;
        }
      }
      id v14 = v9;
      v15 = [v8 MCHashedFilenameWithExtension:@"stub"];
      v16 = [v14 stringByAppendingPathComponent:v15];
      [v5 replaceObjectAtIndex:v6 withObject:v16];

      uint64_t v6 = v7;
    }
    while ([v5 count] > (unint64_t)v7++);
  }
  return v5;
}

+ (void)_setSystemProfileStorageDirectory:(id)a3 userProfileStorageDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = (void *)__systemProfileStorageDirectory;
  __systemProfileStorageDirectory = (uint64_t)v5;
  id v9 = v5;

  v8 = (void *)__userProfileStorageDirectory;
  __userProfileStorageDirectory = (uint64_t)v6;
}

@end