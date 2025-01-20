@interface CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore
@end

@implementation CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore

CFStringRef ___CalDatabaseCopyOfAllEventsCreatedFromSuggestionsInStore_block_invoke(uint64_t a1, uint64_t a2)
{
  CFStringRef result = *(const __CFString **)(a1 + 32);
  if (result)
  {
    v3 = *(sqlite3_stmt **)(a2 + 8);
    CStringFromCFString = (const char *)CalCreateCStringFromCFString(result);
    v5 = (void (__cdecl *)(void *))MEMORY[0x1E4F14838];
    return (const __CFString *)sqlite3_bind_text(v3, 1, CStringFromCFString, -1, v5);
  }
  return result;
}

@end