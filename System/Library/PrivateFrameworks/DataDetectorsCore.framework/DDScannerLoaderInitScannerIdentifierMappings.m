@interface DDScannerLoaderInitScannerIdentifierMappings
@end

@implementation DDScannerLoaderInitScannerIdentifierMappings

CFDictionaryRef ____DDScannerLoaderInitScannerIdentifierMappings_block_invoke()
{
  v0 = (const void **)malloc_type_malloc(0x20uLL, 0x6004044C4A2DFuLL);
  scannerTypesToScannerIdentifiers = (uint64_t)v0;
  *v0 = @"com.apple.datadetectors.scanner.standard";
  v0[1] = @"com.apple.datadetectors.scanner.urlifier";
  v0[2] = @"com.apple.datadetectors.scanner.iCal";
  v0[3] = @"com.apple.datadetectors.scanner.test";
  CFDictionaryRef result = CFDictionaryCreate(0, v0, (const void **)&__DDScannerLoaderInitScannerIdentifierMappings_keys, 4, MEMORY[0x1E4F1D530], 0);
  scannerIdentifiersToScannerTypes = (uint64_t)result;
  return result;
}

@end