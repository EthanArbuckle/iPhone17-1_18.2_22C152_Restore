@interface AXImageMonitor
@end

@implementation AXImageMonitor

void __AXImageMonitor_dyld_image_callback_block_invoke(uint64_t a1)
{
  id v3 = (id)[[NSString alloc] initWithCString:*(void *)(a1 + 32) encoding:_NSDefaultFileSystemEncoding()];
  free(*(void **)(a1 + 32));
  v2 = +[_AXDyldImageMonitor sharedInstance];
  [v2 _dyldDidAddImage:v3];
}

@end