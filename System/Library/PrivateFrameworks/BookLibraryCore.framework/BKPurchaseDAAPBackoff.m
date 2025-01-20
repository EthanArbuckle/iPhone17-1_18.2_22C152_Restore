@interface BKPurchaseDAAPBackoff
- (BOOL)failureIntervals:(unint64_t)a3;
- (BOOL)hasBackedOff;
- (NSDate)backoffUntil;
- (int64_t)failureCount;
- (void)clear;
- (void)setBackoffUntil:(id)a3;
- (void)setFailureCount:(int64_t)a3;
@end

@implementation BKPurchaseDAAPBackoff

- (BOOL)hasBackedOff
{
  v5 = objc_msgSend_backoffUntil(self, a2, v2, v3);

  if (!v5) {
    return 1;
  }
  v9 = objc_msgSend_backoffUntil(self, v6, v7, v8);
  v13 = objc_msgSend_date(MEMORY[0x263EFF910], v10, v11, v12);
  BOOL v16 = objc_msgSend_compare_(v9, v14, (uint64_t)v13, v15) == -1;

  return v16;
}

- (BOOL)failureIntervals:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_failureCount(self, a2, a3, v3);
  objc_msgSend_setFailureCount_(self, v7, v6 + a3, v8);
  if (objc_msgSend_failureCount(self, v9, v10, v11) >= 4)
  {
    uint64_t v15 = objc_msgSend_failureCount(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_failureCount(self, v16, v17, v18);
    v23 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x263EFF910], v20, v21, v22, (double)(unint64_t)((60 * v15 - 120) * (v19 - 2)));
    objc_msgSend_setBackoffUntil_(self, v24, (uint64_t)v23, v25);
  }

  return objc_msgSend_hasBackedOff(self, v12, v13, v14);
}

- (void)clear
{
  objc_msgSend_setFailureCount_(self, a2, 0, v2);

  objc_msgSend_setBackoffUntil_(self, v4, 0, v5);
}

- (NSDate)backoffUntil
{
  return self->_backoffUntil;
}

- (void)setBackoffUntil:(id)a3
{
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (void).cxx_destruct
{
}

@end