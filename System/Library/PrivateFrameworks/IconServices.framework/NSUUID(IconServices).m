@interface NSUUID(IconServices)
+ (uint64_t)_IS_UUIDByXORingUUIDs:()IconServices;
+ (uint64_t)_IS_UUIDWithBytes:()IconServices size:;
+ (uint64_t)_IS_UUIDWithData:()IconServices;
+ (uint64_t)_IS_UUIDWithInt64:()IconServices;
+ (uint64_t)_IS_UUIDWithOSType:()IconServices;
+ (uint64_t)_IS_UUIDWithString:()IconServices;
+ (uint64_t)_IS_nullUUID;
@end

@implementation NSUUID(IconServices)

+ (uint64_t)_IS_UUIDWithData:()IconServices
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithData:");
}

+ (uint64_t)_IS_UUIDWithString:()IconServices
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithString:");
}

+ (uint64_t)_IS_UUIDWithInt64:()IconServices
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithInt64:");
}

+ (uint64_t)_IS_UUIDWithOSType:()IconServices
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithOSType:");
}

+ (uint64_t)_IS_nullUUID
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID");
}

+ (uint64_t)_IS_UUIDWithBytes:()IconServices size:
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:");
}

+ (uint64_t)_IS_UUIDByXORingUUIDs:()IconServices
{
  return objc_msgSend(MEMORY[0x1E4F29128], "_IS_UUIDByXORingUUIDs:");
}

@end