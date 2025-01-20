@interface AXElementTransactionLogging
+ (id)sharedLogger;
+ (id)transactionSummary;
- (AXElementTransactionLogging)init;
- (id)_appNameForUIElement:(__AXUIElement *)a3 pid:(int)a4;
- (unint64_t)willFetchAttribute:(int64_t)a3 forElement:(__AXUIElement *)a4;
- (void)failedTransaction:(unint64_t)a3;
- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4;
- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4 amortization:(double)a5;
@end

@implementation AXElementTransactionLogging

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_117);
  }
  v2 = (void *)sharedLogger___sharedLogger;
  return v2;
}

uint64_t __43__AXElementTransactionLogging_sharedLogger__block_invoke()
{
  sharedLogger___sharedLogger = objc_alloc_init(AXElementTransactionLogging);
  return MEMORY[0x1F41817F8]();
}

- (AXElementTransactionLogging)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXElementTransactionLogging;
  v2 = [(AXElementTransactionLogging *)&v8 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  pendingTransactions = v2->_pendingTransactions;
  v2->_pendingTransactions = (NSMutableDictionary *)v3;

  dispatch_queue_t v5 = dispatch_queue_create("AXElementTransactionLogging", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v5;

  return v2;
}

+ (id)transactionSummary
{
  v2 = +[AXProfileDatabase sharedDatabase];
  uint64_t v3 = [v2 transactionSummary];

  return v3;
}

- (unint64_t)willFetchAttribute:(int64_t)a3 forElement:(__AXUIElement *)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_super v8 = self;
  objc_sync_enter(v8);
  ++willFetchAttribute_forElement____transactionID;
  objc_sync_exit(v8);

  if (a4)
  {
    CFRetain(a4);
    queue = v8->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__AXElementTransactionLogging_willFetchAttribute_forElement___block_invoke;
    v11[3] = &unk_1E62207E8;
    v11[5] = a3;
    v11[6] = a4;
    *(CFAbsoluteTime *)&v11[7] = Current;
    v11[4] = v8;
    dispatch_async(queue, v11);
  }
  return willFetchAttribute_forElement____transactionID;
}

void __61__AXElementTransactionLogging_willFetchAttribute_forElement___block_invoke(uint64_t a1)
{
  id v4 = (id)objc_opt_new();
  [v4 setAttribute:*(void *)(a1 + 40)];
  [v4 setElement:*(void *)(a1 + 48)];
  [v4 setStart:*(double *)(a1 + 56)];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:willFetchAttribute_forElement____transactionID];
  [v2 setObject:v4 forKey:v3];
}

- (id)_appNameForUIElement:(__AXUIElement *)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  pidsToBundleIDs = self->_pidsToBundleIDs;
  objc_super v8 = [NSNumber numberWithInt:*(void *)&a4];
  v9 = [(NSMutableDictionary *)pidsToBundleIDs objectForKey:v8];

  if (v9 || (value = 0, AXUIElementCopyAttributeValue(a3, (CFStringRef)0xBBB, &value)) || (CFTypeRef v12 = value) == 0)
  {
    v10 = &stru_1F141B5A8;
  }
  else
  {
    v13 = self->_pidsToBundleIDs;
    v14 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)v13 setObject:v12 forKey:v14];

    v10 = (__CFString *)value;
  }
  return v10;
}

- (void)failedTransaction:(unint64_t)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AXElementTransactionLogging_failedTransaction___block_invoke;
  block[3] = &unk_1E6220810;
  block[4] = self;
  block[5] = a3;
  *(CFAbsoluteTime *)&block[6] = Current;
  dispatch_async(queue, block);
}

void __49__AXElementTransactionLogging_failedTransaction___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    dispatch_queue_t v5 = objc_opt_new();
    [v5 setType:1];
    objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attribute"));
    if ([v4 element])
    {
      pid_t pid = 0;
      AXUIElementGetPid((AXUIElementRef)[v4 element], &pid);
      [v5 setPid:pid];
      uint64_t v6 = _AXUIElementIDForElement([v4 element]);
      objc_msgSend(v5, "setUid:", v6, v7);
      objc_super v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v4 element];
      v10 = [v8 _appNameForUIElement:v9 pid:pid];
      [v5 setAppName:v10];
    }
    double v11 = *(double *)(a1 + 48);
    [v4 start];
    [v5 setDuration:v11 - v12];
    [v5 setValueSize:0];
    [v5 setValueHash:0];
    v13 = +[AXProfileDatabase sharedDatabase];
    [v13 registerEntry:v5];

    uint64_t v14 = *(void *)(a1 + 40);
    v15 = *(void **)(*(void *)(a1 + 32) + 8);
    v16 = [NSNumber numberWithUnsignedInteger:v14];
    [v15 removeObjectForKey:v16];
  }
}

- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4
{
}

- (void)finishedTransaction:(unint64_t)a3 withValue:(void *)a4 amortization:(double)a5
{
  if (a4)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFHashCode v10 = CFHash(a4);
    CFTypeID v11 = CFGetTypeID(a4);
    if (v11 == CFStringGetTypeID())
    {
      CFAttributedStringRef Length = (const __CFAttributedString *)CFStringGetLength((CFStringRef)a4);
    }
    else if (AXIsAXAttributedString())
    {
      CFAttributedStringRef Length = (const __CFAttributedString *)AXGetCFAttributedStringFromAXAttributedString(a4);
      if (Length) {
        CFAttributedStringRef Length = (const __CFAttributedString *)CFAttributedStringGetLength(Length);
      }
    }
    else
    {
      CFAttributedStringRef Length = 0;
    }
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__AXElementTransactionLogging_finishedTransaction_withValue_amortization___block_invoke;
    v14[3] = &unk_1E6220838;
    v14[4] = self;
    v14[5] = a3;
    *(CFAbsoluteTime *)&v14[6] = Current;
    *(double *)&v14[7] = a5;
    v14[8] = Length;
    v14[9] = v10;
    dispatch_async(queue, v14);
  }
}

void __74__AXElementTransactionLogging_finishedTransaction_withValue_amortization___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    dispatch_queue_t v5 = objc_opt_new();
    [v5 setType:0];
    objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attribute"));
    if ([v4 element])
    {
      pid_t pid = 0;
      AXUIElementGetPid((AXUIElementRef)[v4 element], &pid);
      [v5 setPid:pid];
      uint64_t v6 = _AXUIElementIDForElement([v4 element]);
      objc_msgSend(v5, "setUid:", v6, v7);
      objc_super v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v4 element];
      CFHashCode v10 = [v8 _appNameForUIElement:v9 pid:pid];
      [v5 setAppName:v10];

      CFRelease((CFTypeRef)[v4 element]);
    }
    double v11 = *(double *)(a1 + 48);
    [v4 start];
    [v5 setDuration:(v11 - v12) * *(double *)(a1 + 56)];
    [v5 setValueSize:*(void *)(a1 + 64)];
    [v5 setValueHash:*(void *)(a1 + 72)];
    v13 = +[AXProfileDatabase sharedDatabase];
    [v13 registerEntry:v5];

    uint64_t v14 = *(void *)(a1 + 40);
    v15 = *(void **)(*(void *)(a1 + 32) + 8);
    v16 = [NSNumber numberWithUnsignedInteger:v14];
    [v15 removeObjectForKey:v16];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pidsToBundleIDs, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
}

@end