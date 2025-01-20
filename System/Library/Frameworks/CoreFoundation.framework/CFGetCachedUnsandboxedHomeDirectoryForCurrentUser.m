@interface CFGetCachedUnsandboxedHomeDirectoryForCurrentUser
@end

@implementation CFGetCachedUnsandboxedHomeDirectoryForCurrentUser

void *___CFGetCachedUnsandboxedHomeDirectoryForCurrentUser_block_invoke()
{
  result = _CFUnsandboxedHomeDirectoryForCurrentUser();
  _CFGetCachedUnsandboxedHomeDirectoryForCurrentUser_unsandboxedHomePath = (uint64_t)result;
  return result;
}

@end