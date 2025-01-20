@interface CAMLedger
+ (id)sharedInstance;
- (CAMLedger)init;
- (int64_t)footprint;
- (void)dealloc;
@end

@implementation CAMLedger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

uint64_t __27__CAMLedger_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CAMLedger);
  uint64_t v1 = sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (CAMLedger)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v11[0].receiver = self;
  v11[0].super_class = (Class)CAMLedger;
  v2 = [(objc_super *)v11 init];
  if (v2)
  {
    long long v12 = 0u;
    memset(&v11[1], 0, 32);
    getpid();
    if (!ledger())
    {
      int v3 = DWORD2(v12);
      v2->_ledgerCount = *((void *)&v12 + 1);
      v4 = (char *)malloc_type_malloc(96 * v3, 0x1000040565EDBD2uLL);
      if (v4)
      {
        v5 = v4;
        if (ledger()) {
          goto LABEL_9;
        }
        v2->_footprintLedgerIndex = -1;
        uint64_t v6 = *((void *)&v12 + 1);
        if (*((uint64_t *)&v12 + 1) < 1) {
          goto LABEL_9;
        }
        uint64_t v7 = 0;
        v8 = v5;
        while (strcmp(v8, "phys_footprint"))
        {
          ++v7;
          v8 += 96;
          if (v6 == v7) {
            goto LABEL_9;
          }
        }
        v2->_footprintLedgerIndex = v7;
        v9 = (ledger_entry_info *)malloc_type_malloc(48 * SLODWORD(v2->_ledgerCount), 0x1000040EED21634uLL);
        v2->_ledgerEntries = v9;
        if (!v9)
        {
LABEL_9:

          v2 = 0;
        }
        free(v5);
      }
      else
      {

        return 0;
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  ledgerEntries = self->_ledgerEntries;
  if (ledgerEntries) {
    free(ledgerEntries);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMLedger;
  [(CAMLedger *)&v4 dealloc];
}

- (int64_t)footprint
{
  if (ledger()) {
    return -1;
  }
  else {
    return self->_ledgerEntries[self->_footprintLedgerIndex].var0;
  }
}

@end