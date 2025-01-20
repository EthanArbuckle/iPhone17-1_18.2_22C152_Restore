@interface HKArchiveCreator
@end

@implementation HKArchiveCreator

uint64_t __70___HKArchiveCreator_archiveContentsOfDirectoryAtURL_archiveURL_error___block_invoke(uint64_t a1)
{
  return 0;
}

uint64_t __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = 0;
  uint64_t v5 = 0;
  v6 = (void *)MEMORY[0x1E4F14B00];
  while (!v4)
  {
    v7 = (void *)MEMORY[0x19F395970]();
    v8 = [*(id *)(a1 + 32) readDataOfLength:*v6];
    uint64_t v9 = [v8 length];
    BOOL v4 = v9 == 0;
    if (v9)
    {
      id v10 = v8;
      v5 += objc_msgSend(v3, "writeData:ofLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    }
  }

  return v5;
}

uint64_t __52___HKArchiveCreator_addDataToArchive_pathInArchive___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v5, "writeData:ofLength:", objc_msgSend(v4, "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));

  return v6;
}

void __52___HKArchiveCreator_addFileToArchive_pathInArchive___block_invoke_cold_1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_19C023000, log, OS_LOG_TYPE_FAULT, "%@: Reading from file failed: %@", buf, 0x16u);
}

@end