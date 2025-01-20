@interface BCS
@end

@implementation BCS

uint64_t __BCS_LOG_CHANNEL_PREFIXBarcodeScanner_block_invoke()
{
  BCS_LOG_CHANNEL_PREFIXBarcodeScanner_log = (uint64_t)os_log_create("com.apple.BarcodeScanner", "BarcodeScanner");

  return MEMORY[0x270F9A758]();
}

uint64_t __BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle_block_invoke()
{
  BCS_LOG_CHANNEL_PREFIXBarcodeScannerLifeCycle_log = (uint64_t)os_log_create("com.apple.BarcodeScanner.LifeCycle", "BarcodeScannerLifeCycle");

  return MEMORY[0x270F9A758]();
}

@end