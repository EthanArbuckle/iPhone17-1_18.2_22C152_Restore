@interface CHGetUserLibraryDirectoryURL
@end

@implementation CHGetUserLibraryDirectoryURL

void ____CHGetUserLibraryDirectoryURL_block_invoke()
{
  if (__CHGetUserHomeDirectoryURL_onceToken != -1) {
    dispatch_once(&__CHGetUserHomeDirectoryURL_onceToken, &__block_literal_global_21);
  }
  id v2 = (id)__CHGetUserHomeDirectoryURL_sDirectoryURL;
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];
  v1 = (void *)__CHGetUserLibraryDirectoryURL_sDirectoryURL;
  __CHGetUserLibraryDirectoryURL_sDirectoryURL = v0;
}

@end