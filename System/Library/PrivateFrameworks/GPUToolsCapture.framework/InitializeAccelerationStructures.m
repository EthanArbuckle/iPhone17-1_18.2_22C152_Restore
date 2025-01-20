@interface InitializeAccelerationStructures
@end

@implementation InitializeAccelerationStructures

void __InitializeAccelerationStructures_block_invoke(id a1)
{
  id v1 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:5 capacity:1024];
  v2 = (void *)s_accelerationStructuresByStreamRef;
  s_accelerationStructuresByStreamRef = (uint64_t)v1;

  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1024];
  v4 = (void *)s_accelerationStructureGPUResourceIDToStreamRef;
  s_accelerationStructureGPUResourceIDToStreamRef = (uint64_t)v3;

  s_accelerationStructuresLock = 0;
}

@end