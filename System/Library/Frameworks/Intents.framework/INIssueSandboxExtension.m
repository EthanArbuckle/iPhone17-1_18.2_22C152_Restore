@interface INIssueSandboxExtension
@end

@implementation INIssueSandboxExtension

uint64_t ___INIssueSandboxExtension_block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 path];
  [v2 fileSystemRepresentation];
  uint64_t v3 = sandbox_extension_issue_file();

  return v3;
}

@end