@interface SD
@end

@implementation SD

void ___SD_Initialize_framework_block_invoke()
{
  pthread_key_init_np();
  pthread_key_init_np();
  queue = MEMORY[0x263EF83A0];
  if (!dispatch_queue_get_specific(MEMORY[0x263EF83A0], "com.apple.CoreData.NSManagedObjectContext.mainQueue"))
  {
    Class context = objc_getClass("NSManagedObjectContext");
    if (context) {
      dispatch_queue_set_specific(queue, "com.apple.CoreData.NSManagedObjectContext.mainQueue", context, 0);
    }
  }
}

@end