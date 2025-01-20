@interface DDScannerList
- (uint64_t)activateScanner:(uint64_t)a1;
@end

@implementation DDScannerList

- (uint64_t)activateScanner:(uint64_t)a1
{
  id v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 64);
    if (v4)
    {
      [v4 addObject:v3];
    }
    else
    {
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v3, 0);
      v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScanners, 0);
  objc_storeStrong((id *)&self->_scannerCache, 0);
  objc_storeStrong((id *)&self->_waitQueue, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_hash, 0);
}

@end