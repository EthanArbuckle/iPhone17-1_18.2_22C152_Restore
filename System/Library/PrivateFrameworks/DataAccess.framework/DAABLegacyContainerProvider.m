@interface DAABLegacyContainerProvider
@end

@implementation DAABLegacyContainerProvider

__CFArray *__94___DAABLegacyContainerProvider_mergeAllRecordsIntoContainer_shouldInsertChangeHistoryRecords___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 68)) {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  }
  else {
    Mutable = 0;
  }
  if (*(uint64_t *)(a1 + 40) >= 1)
  {
    CFIndex v4 = 0;
    os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 5);
    a2.n128_u64[0] = 67240448;
    __n128 v16 = a2;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v4);
      ABRecordID RecordID = ABRecordGetRecordID(ValueAtIndex);
      if (*(_DWORD *)(a1 + 64) != RecordID)
      {
        ABRecordID v8 = RecordID;
        if (*(unsigned char *)(a1 + 68))
        {
          CFArrayRef v9 = ABAddressBookCopyArrayOfAllPeopleInSource((ABAddressBookRef)[*(id *)(a1 + 32) addressBook], ValueAtIndex);
          if (v9)
          {
            CFArrayRef v10 = v9;
            v22.length = CFArrayGetCount(v9);
            v22.location = 0;
            CFArrayAppendArray(Mutable, v10, v22);
            CFRelease(v10);
          }
          CFArrayRef v11 = ABAddressBookCopyArrayOfAllGroupsInSource((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook", *(_OWORD *)&v16), ValueAtIndex);
          if (v11)
          {
            CFArrayRef v12 = v11;
            v23.length = CFArrayGetCount(v11);
            v23.location = 0;
            CFArrayAppendArray(Mutable, v12, v23);
            CFRelease(v12);
          }
        }
        v13 = DALoggingwithCategory();
        if (os_log_type_enabled(v13, v5))
        {
          int v14 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = v16.n128_u32[0];
          ABRecordID v18 = v8;
          __int16 v19 = 1026;
          int v20 = v14;
          _os_log_impl(&dword_1BA384000, v13, v5, "[mergeAllRecords] Moving all records from source ID %{public}d into source ID %{public}d ", buf, 0xEu);
        }

        [*(id *)(a1 + 32) addressBook];
        ABAddressBookMoveAllRecordsInSourceToSource();
      }
      ++v4;
    }
    while (v4 < *(void *)(a1 + 40));
  }
  return Mutable;
}

@end