@interface CKDURLSessionPool
+ (id)backgroundSessionConnectionPoolName;
+ (id)sharedURLSessionPool;
- (id)initInternal;
- (int)backgroundSessionConnectionPoolLimit;
- (void)_updateBackgroundSessionConnectionPoolLimit;
@end

@implementation CKDURLSessionPool

+ (id)sharedURLSessionPool
{
  if (qword_1EBBD00D0 != -1) {
    dispatch_once(&qword_1EBBD00D0, &unk_1F2044890);
  }
  v2 = (void *)qword_1EBBD00C8;
  return v2;
}

+ (id)backgroundSessionConnectionPoolName
{
  return @"com.apple.cloudkit.BackgroundConnectionPool";
}

- (id)initInternal
{
  v7.receiver = self;
  v7.super_class = (Class)CKDURLSessionPool;
  v2 = [(CKDURLSessionPool *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend__updateBackgroundSessionConnectionPoolLimit(v2, v3, v4);
  }
  return v5;
}

- (void)_updateBackgroundSessionConnectionPoolLimit
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_sharedOptions(MEMORY[0x1E4F19E98], a2, v2);
  int v6 = objc_msgSend_backgroundSessionConnectionPoolLimitWithDefaultValue_(v4, v5, 6);

  if (v6)
  {
    v9 = objc_msgSend_scheduler(MEMORY[0x1E4F5FA50], v7, v8);
    v11 = objc_msgSend_groupWithName_maxConcurrent_(MEMORY[0x1E4F5FA30], v10, @"com.apple.cloudkit.BackgroundConnectionPool", v6);
    objc_msgSend_createActivityGroup_(v9, v12, (uint64_t)v11);
  }
  v13 = self;
  objc_sync_enter(v13);
  v13->_backgroundSessionConnectionPoolLimit = v6;
  objc_sync_exit(v13);

  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v14 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = v6;
    __int16 v16 = 2114;
    v17 = @"com.apple.cloudkit.BackgroundConnectionPool";
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Updated the connection pool limit (%d) for \"%{public}@\"", (uint8_t *)v15, 0x12u);
  }
}

- (int)backgroundSessionConnectionPoolLimit
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int backgroundSessionConnectionPoolLimit = v2->_backgroundSessionConnectionPoolLimit;
  objc_sync_exit(v2);

  return backgroundSessionConnectionPoolLimit;
}

@end