@interface INProcessGetInstanceUUID
@end

@implementation INProcessGetInstanceUUID

void ___INProcessGetInstanceUUID_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  if (xpc_get_instance())
  {
    uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
    v1 = (void *)_INProcessGetInstanceUUID_instanceUUID;
    _INProcessGetInstanceUUID_instanceUUID = v0;
  }
}

@end