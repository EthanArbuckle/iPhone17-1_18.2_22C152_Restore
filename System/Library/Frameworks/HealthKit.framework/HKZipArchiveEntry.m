@interface HKZipArchiveEntry
@end

@implementation HKZipArchiveEntry

id __67___HKZipArchiveEntry__enumerateLinesInCurrentEntryWithError_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t data = archive_read_data();
  if (data < 0)
  {
    [(id)objc_opt_class() _assignReadError:a2 archive:*(void *)(a1 + 40)];
    v5 = 0;
  }
  else if (data)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v7);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v5;
}

@end