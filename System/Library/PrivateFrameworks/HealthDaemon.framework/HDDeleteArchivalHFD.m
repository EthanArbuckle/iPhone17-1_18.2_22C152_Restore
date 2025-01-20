@interface HDDeleteArchivalHFD
@end

@implementation HDDeleteArchivalHFD

uint64_t ___HDDeleteArchivalHFD_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSQLiteMigrationArchive:");
}

@end