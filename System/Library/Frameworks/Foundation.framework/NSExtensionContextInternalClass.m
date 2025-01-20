@interface NSExtensionContextInternalClass
@end

@implementation NSExtensionContextInternalClass

uint64_t ___NSExtensionContextInternalClass_block_invoke()
{
  if (softLinkEXGetExtensionContextInternalClass) {
    uint64_t result = softLinkEXGetExtensionContextInternalClass();
  }
  else {
    uint64_t result = 0;
  }
  qword_1EB1ED388 = result;
  return result;
}

@end