@interface NSBundle
@end

@implementation NSBundle

uint64_t __46__NSBundle_GC__GameControllerFoundationBundle__block_invoke()
{
  GameControllerFoundationBundle_Bundle = +[NSBundle bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

Class __45__NSBundle_GC__GameControllerFrameworkBundle__block_invoke()
{
  Class result = NSClassFromString((NSString *)@"GCController");
  if (result)
  {
    GameControllerFrameworkBundle_Bundle = +[NSBundle bundleForClass:result];
    return (Class)MEMORY[0x270F9A758]();
  }
  return result;
}

@end