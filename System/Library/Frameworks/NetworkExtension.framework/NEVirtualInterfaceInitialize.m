@interface NEVirtualInterfaceInitialize
@end

@implementation NEVirtualInterfaceInitialize

uint64_t ____NEVirtualInterfaceInitialize_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kNEVirtualInterfaceTypeID = result;
  return result;
}

@end