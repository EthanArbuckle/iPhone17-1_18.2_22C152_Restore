@interface CKDatabase(OperationAnalytics)
+ (uint64_t)hd_removeOperationObserver:()OperationAnalytics;
+ (void)hd_addOperationObserver:()OperationAnalytics queue:;
- (void)hd_addOperation:()OperationAnalytics;
@end

@implementation CKDatabase(OperationAnalytics)

+ (void)hd_addOperationObserver:()OperationAnalytics queue:
{
  uint64_t v5 = _MergedGlobals_204;
  id v6 = a4;
  id v7 = a3;
  id v9 = v7;
  if (v5 == -1)
  {
    id v8 = v7;
  }
  else
  {
    dispatch_once(&_MergedGlobals_204, &__block_literal_global_103);
    id v8 = v9;
  }
  [(id)qword_1EBA18BF8 registerObserver:v8 queue:v6];
}

+ (uint64_t)hd_removeOperationObserver:()OperationAnalytics
{
  return objc_msgSend((id)qword_1EBA18BF8, "unregisterObserver:");
}

- (void)hd_addOperation:()OperationAnalytics
{
  id v4 = a3;
  [a1 addOperation:v4];
  uint64_t v5 = (void *)qword_1EBA18BF8;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CKDatabase_OperationAnalytics__hd_addOperation___block_invoke;
  v7[3] = &unk_1E6300678;
  v7[4] = a1;
  id v8 = v4;
  id v6 = v4;
  [v5 notifyObservers:v7];
}

@end