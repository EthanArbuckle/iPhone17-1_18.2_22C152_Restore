@interface ASTBundle
@end

@implementation ASTBundle

void __ASTBundle_block_invoke(id a1)
{
  v1 = NSOpenStepRootDirectory();
  id v4 = [v1 stringByAppendingString:@"System/Library/CoreServices/AssistiveTouch.app"];

  uint64_t v2 = +[NSBundle bundleWithPath:v4];
  v3 = (void *)ASTBundle__astBundle;
  ASTBundle__astBundle = v2;

  if (!ASTBundle__astBundle) {
    _AXAssert();
  }
}

@end