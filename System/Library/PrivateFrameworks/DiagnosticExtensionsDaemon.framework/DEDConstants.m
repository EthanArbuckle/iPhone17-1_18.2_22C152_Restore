@interface DEDConstants
+ (id)DEDAddEmptyFile;
+ (id)DEDExtensionAttachmentsParamBundleIDKey;
+ (id)DEDExtensionCompressOnAttach;
+ (id)DEDExtensionHostAppKey;
+ (id)allPlatforms;
+ (id)processName;
@end

@implementation DEDConstants

+ (id)allPlatforms
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"ios", @"homepod", @"macos", @"watchos", @"tvos", @"unspecified", @"visionos", 0);
}

+ (id)DEDExtensionHostAppKey
{
  return @"DEExtensionHostAppKey";
}

+ (id)DEDExtensionAttachmentsParamBundleIDKey
{
  return @"DEExtensionAttachmentsParamBundleIDKey";
}

+ (id)DEDExtensionCompressOnAttach
{
  return @"DEDExtensionCompressOnAttach";
}

+ (id)DEDAddEmptyFile
{
  return @"DEDExtensionAddsStubFile";
}

+ (id)processName
{
  if (processName_onceToken != -1) {
    dispatch_once(&processName_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)processName_processName;
  return v2;
}

void __27__DEDConstants_processName__block_invoke()
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v0 = [v3 processName];
  v1 = (void *)v0;
  if (v0) {
    v2 = (__CFString *)v0;
  }
  else {
    v2 = @"Unknown";
  }
  objc_storeStrong((id *)&processName_processName, v2);
}

@end