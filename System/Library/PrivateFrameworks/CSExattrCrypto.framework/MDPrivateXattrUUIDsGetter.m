@interface MDPrivateXattrUUIDsGetter
@end

@implementation MDPrivateXattrUUIDsGetter

uint64_t ___MDPrivateXattrUUIDsGetter_block_invoke()
{
  CFUUIDRef v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x71u, 0x9Fu, 0xB8u, 0xCAu, 0x18u, 0x13u, 0x49u, 0xB0u, 0x8Bu, 0x20u, 0x36u, 0x5Eu, 0xEBu, 0xC3u, 0xEDu, 0x57u);
  CFUUIDGetUUIDBytes(v0);
  uint64_t result = xpc_create_with_format();
  _MDPrivateXattrUUIDsGetter_uuids = result;
  return result;
}

@end