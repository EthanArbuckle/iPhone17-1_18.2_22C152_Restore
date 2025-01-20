@interface CalDatabaseCopyAuxDatabaseForPersonaID
@end

@implementation CalDatabaseCopyAuxDatabaseForPersonaID

uint64_t ___CalDatabaseCopyAuxDatabaseForPersonaID_block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(sqlite3_stmt **)(a2 + 8);
  CStringFromCFString = (const char *)CalCreateCStringFromCFString(*(const __CFString **)(a1 + 32));
  v4 = (void (__cdecl *)(void *))MEMORY[0x1E4F14838];
  return sqlite3_bind_text(v2, 1, CStringFromCFString, -1, v4);
}

@end