@interface OS_REMeshInstanceCollectionStorage
- (void)dealloc;
@end

@implementation OS_REMeshInstanceCollectionStorage

- (void)dealloc
{
  re::DynamicArray<unsigned long>::deinit((uint64_t)&self[17]);
  re::DynamicArray<re::StringID>::deinit((uint64_t)&self[12]);
  re::DynamicArray<re::StringID>::deinit((uint64_t)&self[7]);
  double v3 = re::HashTable<re::StringID,re::DataArrayHandle<re::RigGraphOperatorDefinition>,re::Hash<re::StringID>,re::EqualTo<re::StringID>,false,false>::deinit((uint64_t *)&self[1]);
  v4.receiver = self;
  v4.super_class = (Class)OS_REMeshInstanceCollectionStorage;
  [(OS_REMeshInstanceCollectionStorage *)&v4 dealloc];
}

@end