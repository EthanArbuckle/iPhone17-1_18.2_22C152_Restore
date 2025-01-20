@interface NSFileManager(protobuf)
- (id)blt_contactImagesDirectory;
- (void)blt_contactImagesDirectory;
@end

@implementation NSFileManager(protobuf)

- (id)blt_contactImagesDirectory
{
  v0 = BLTFileURLInPairingPath(@"ContactImages");
  if (v0)
  {
    v1 = [MEMORY[0x263F08850] defaultManager];
    id v7 = 0;
    char v2 = [v1 createDirectoryAtURL:v0 withIntermediateDirectories:1 attributes:0 error:&v7];
    id v3 = v7;

    if ((v2 & 1) == 0)
    {
      v4 = blt_general_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[NSFileManager(protobuf) blt_contactImagesDirectory]();
      }
    }
    id v5 = v0;
  }
  return v0;
}

- (void)blt_contactImagesDirectory
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Error %@ when creating contact icons directory: %@");
}

@end