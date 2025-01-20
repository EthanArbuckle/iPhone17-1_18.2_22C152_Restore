@interface PFCloudKitErrorLog
- (PFCloudKitErrorLog)init;
- (id)description;
- (void)dealloc;
@end

@implementation PFCloudKitErrorLog

- (PFCloudKitErrorLog)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitErrorLog;
  v2 = [(PFCloudKitErrorLog *)&v4 init];
  if (v2) {
    v2->_entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  self->_entries = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitErrorLog;
  [(PFCloudKitErrorLog *)&v3 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitErrorLog;
  objc_super v3 = objc_msgSend(-[PFCloudKitErrorLog description](&v7, sel_description), "mutableCopy");
  entries = self->_entries;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PFCloudKitErrorLog_description__block_invoke;
  v6[3] = &unk_1E544DAB0;
  v6[4] = v3;
  [(NSMutableArray *)entries enumerateObjectsUsingBlock:v6];
  return v3;
}

uint64_t __33__PFCloudKitErrorLog_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    uint64_t v3 = *(void *)(a2 + 16);
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return [v2 appendFormat:@"\n%@: %@", v3, v4];
}

@end