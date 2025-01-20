@interface LSEmptyPropertyList
@end

@implementation LSEmptyPropertyList

void __38___LSEmptyPropertyList_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_LSEmptyPropertyList);
  v1 = (void *)+[_LSEmptyPropertyList sharedInstance]::result;
  +[_LSEmptyPropertyList sharedInstance]::result = (uint64_t)v0;
}

@end