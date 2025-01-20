@interface PFUbiquityRecordsExporter
@end

@implementation PFUbiquityRecordsExporter

void __87___PFUbiquityRecordsExporter_cleanUpFromRolledbackPendingTransaction_withNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a2, *(void *)(*(void *)(a1 + 40) + 8) + 40) & 1) == 0)
  {
    v4 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) code] == 4)
      {
        if (+[PFUbiquityLogging canLogMessageAtLevel:3]) {
          NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  %@\nLooks like log file was never written: %@", "-[_PFUbiquityRecordsExporter cleanUpFromRolledbackPendingTransaction:withNotification:]_block_invoke", 236, *(void *)(a1 + 32), a2);
        }
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
      }
    }
  }
}

void __130___PFUbiquityRecordsExporter_createDictionaryForObjectsInSaveNotification_forTransactionOfType_withExportContext_andSaveSnapshot___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", a2, &v2) & 1) == 0)
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:0]) {
      NSLog((NSString *)@"%s(%d): CoreData: Ubiquity:  Unable to delete ubiquitous external reference file during aborted transaction: %@\n User Info: %@", "-[_PFUbiquityRecordsExporter createDictionaryForObjectsInSaveNotification:forTransactionOfType:withExportContext:andSaveSnapshot:]_block_invoke", 681, v2, [v2 userInfo]);
    }
  }
}

uint64_t __49___PFUbiquityRecordsExporter_scheduleTempLogMove__block_invoke(uint64_t a1)
{
  return -[_PFUbiquityRecordsExporter moveLogsFromTempDirectory](*(void *)(a1 + 32));
}

@end