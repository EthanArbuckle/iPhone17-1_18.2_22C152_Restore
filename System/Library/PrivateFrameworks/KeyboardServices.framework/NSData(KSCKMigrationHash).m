@interface NSData(KSCKMigrationHash)
- (uint64_t)_hashCKMigration;
@end

@implementation NSData(KSCKMigrationHash)

- (uint64_t)_hashCKMigration
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  if (v4 >= 0) {
    return v4;
  }
  else {
    return -v4;
  }
}

@end