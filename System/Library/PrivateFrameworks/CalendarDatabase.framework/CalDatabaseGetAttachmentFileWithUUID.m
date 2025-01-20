@interface CalDatabaseGetAttachmentFileWithUUID
@end

@implementation CalDatabaseGetAttachmentFileWithUUID

uint64_t ___CalDatabaseGetAttachmentFileWithUUID_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(sqlite3_stmt **)(a2 + 8);
  v3 = (const char *)[*(id *)(a1 + 32) UTF8String];
  return sqlite3_bind_text(v2, 1, v3, -1, 0);
}

uint64_t ___CalDatabaseGetAttachmentFileWithUUID_block_invoke_2(uint64_t a1, const void *a2, unsigned char *a3)
{
  uint64_t v6 = _CalCalendarItemGetDescription((uint64_t)a2);
  if (v6 && [*(id *)(a1 + 40) isEqualToString:v6])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFRetain(a2);
    *a3 = 1;
  }
  return MEMORY[0x1F41817F8]();
}

@end