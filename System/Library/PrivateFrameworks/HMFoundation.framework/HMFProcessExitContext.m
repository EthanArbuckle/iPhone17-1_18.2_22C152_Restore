@interface HMFProcessExitContext
+ (BOOL)onceCompareAndSetTimestamp:(id)a3 toStoredValueWithKey:(id)a4 inStore:(id)a5;
+ (id)lastExitContext;
- (BOOL)isCrash;
- (BOOL)isJetsam;
- (BOOL)isStale;
- (HMFProcessExitContext)initWithRBSProcessExitContext:(id)a3 processName:(id)a4 userDefaultsStore:(id)a5 resetStoreReadToken:(BOOL)a6;
- (HMFProcessExitContext)initWithUserDefaultsStore:(id)a3 processLastRecordedExitTimeKey:(id)a4 resetStoreReadToken:(BOOL)a5 timestamp:(id)a6 osReasonDomain:(int64_t)a7 osReasonCode:(unint64_t)a8 isCrash:(BOOL)a9 isJetsam:(BOOL)a10 errorRepresentation:(id)a11;
- (NSDate)timestamp;
- (NSError)errorRepresentation;
- (int64_t)OSReasonDomain;
- (int64_t)crashReasonCode;
- (int64_t)jetsamReasonCode;
- (unint64_t)OSReasonCode;
@end

@implementation HMFProcessExitContext

+ (id)lastExitContext
{
  v2 = [MEMORY[0x1E4F963E8] currentProcess];
  v3 = [v2 lastExitContext];

  v4 = [HMFProcessExitContext alloc];
  v5 = [MEMORY[0x1E4F963E8] currentProcess];
  v6 = [v5 name];
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v8 = [(HMFProcessExitContext *)v4 initWithRBSProcessExitContext:v3 processName:v6 userDefaultsStore:v7 resetStoreReadToken:0];

  return v8;
}

+ (BOOL)onceCompareAndSetTimestamp:(id)a3 toStoredValueWithKey:(id)a4 inStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__HMFProcessExitContext_onceCompareAndSetTimestamp_toStoredValueWithKey_inStore___block_invoke;
  block[3] = &unk_1E5957CF8;
  id v17 = v9;
  id v18 = v8;
  id v19 = v7;
  uint64_t v10 = qword_1EB4EED00;
  id v11 = v7;
  id v12 = v8;
  id v13 = v9;
  if (v10 != -1) {
    dispatch_once(&qword_1EB4EED00, block);
  }
  char v14 = _MergedGlobals_60;

  return v14;
}

void __81__HMFProcessExitContext_onceCompareAndSetTimestamp_toStoredValueWithKey_inStore___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (v2 && [v2 isEqualToDate:*(void *)(a1 + 48)]) {
    _MergedGlobals_60 = 1;
  }
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

- (HMFProcessExitContext)initWithRBSProcessExitContext:(id)a3 processName:(id)a4 userDefaultsStore:(id)a5 resetStoreReadToken:(BOOL)a6
{
  if (a3)
  {
    id v8 = a3;
    BOOL v25 = a6;
    id v9 = a5;
    id v10 = v8;
    v24 = [@"HMFProcessExitContextLast_" stringByAppendingString:a4];
    v23 = [v10 timestamp];
    v26 = [v10 status];
    uint64_t v22 = [v26 domain];
    id v11 = [v10 status];
    uint64_t v12 = [v11 code];
    id v13 = [v10 status];
    LOBYTE(v8) = [v13 isCrash];
    char v14 = [v10 status];
    char v15 = [v14 isJetsam];
    v16 = [v10 status];

    id v17 = [v16 error];
    BYTE1(v21) = v15;
    LOBYTE(v21) = (_BYTE)v8;
    id v18 = -[HMFProcessExitContext initWithUserDefaultsStore:processLastRecordedExitTimeKey:resetStoreReadToken:timestamp:osReasonDomain:osReasonCode:isCrash:isJetsam:errorRepresentation:](self, "initWithUserDefaultsStore:processLastRecordedExitTimeKey:resetStoreReadToken:timestamp:osReasonDomain:osReasonCode:isCrash:isJetsam:errorRepresentation:", v9, v24, v25, v23, v22, v12, v21, v17);

    self = v18;
    id v19 = self;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (HMFProcessExitContext)initWithUserDefaultsStore:(id)a3 processLastRecordedExitTimeKey:(id)a4 resetStoreReadToken:(BOOL)a5 timestamp:(id)a6 osReasonDomain:(int64_t)a7 osReasonCode:(unint64_t)a8 isCrash:(BOOL)a9 isJetsam:(BOOL)a10 errorRepresentation:(id)a11
{
  BOOL v14 = a5;
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a11;
  v23.receiver = self;
  v23.super_class = (Class)HMFProcessExitContext;
  uint64_t v21 = [(HMFProcessExitContext *)&v23 init];
  if (v21)
  {
    if (v14) {
      qword_1EB4EED00 = 0;
    }
    if (v18) {
      v21->_isStale = [(id)objc_opt_class() onceCompareAndSetTimestamp:v19 toStoredValueWithKey:v18 inStore:v17];
    }
    objc_storeStrong((id *)&v21->_timestamp, a6);
    v21->_isCrash = a9;
    v21->_OSReasonDomain = a7;
    v21->_OSReasonCode = a8;
    if (a9) {
      v21->_crashReasonCode = [v20 code];
    }
    v21->_isJetsam = a10;
    if (a10) {
      v21->_jetsamReasonCode = [v20 code];
    }
    objc_storeStrong((id *)&v21->_errorRepresentation, a11);
  }

  return v21;
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (BOOL)isCrash
{
  return self->_isCrash;
}

- (int64_t)crashReasonCode
{
  return self->_crashReasonCode;
}

- (BOOL)isJetsam
{
  return self->_isJetsam;
}

- (int64_t)jetsamReasonCode
{
  return self->_jetsamReasonCode;
}

- (NSError)errorRepresentation
{
  return self->_errorRepresentation;
}

- (int64_t)OSReasonDomain
{
  return self->_OSReasonDomain;
}

- (unint64_t)OSReasonCode
{
  return self->_OSReasonCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorRepresentation, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end