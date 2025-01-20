@interface ACDManagedObjectModel
@end

@implementation ACDManagedObjectModel

void ___ACDManagedObjectModel_block_invoke()
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v0 = [v3 URLForResource:@"accounts" withExtension:@"momd"];
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v0];
  v2 = (void *)_ACDManagedObjectModel_managedObjectModel;
  _ACDManagedObjectModel_managedObjectModel = v1;
}

@end