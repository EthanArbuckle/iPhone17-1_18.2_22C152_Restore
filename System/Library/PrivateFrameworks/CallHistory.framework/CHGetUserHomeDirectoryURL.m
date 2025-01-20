@interface CHGetUserHomeDirectoryURL
@end

@implementation CHGetUserHomeDirectoryURL

uint64_t ____CHGetUserHomeDirectoryURL_block_invoke()
{
  if (__CHGetUserName_onceToken != -1) {
    dispatch_once(&__CHGetUserName_onceToken, &__block_literal_global_23);
  }
  uint64_t result = CFCopyHomeDirectoryURLForUser();
  __CHGetUserHomeDirectoryURL_sDirectoryURL = result;
  return result;
}

@end