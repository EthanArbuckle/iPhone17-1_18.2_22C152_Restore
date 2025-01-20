@interface AAFKeybagLockAssertion
+ (id)lock;
+ (id)lockWithError:(id *)a3;
- (void)unlock;
@end

@implementation AAFKeybagLockAssertion

+ (id)lock
{
  return (id)[a1 lockWithError:0];
}

+ (id)lockWithError:(id *)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(AAFKeybagLockAssertion);
  v16[0] = @"MKBAssertionKey";
  v16[1] = @"MKBAssertionTimeout";
  v17[0] = @"RemoteProfile";
  v17[1] = &unk_1F3940728;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v10 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v6 = (uint64_t (*)(void *, id *))getMKBDeviceLockAssertionSymbolLoc_ptr;
  v15 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!getMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getMKBDeviceLockAssertionSymbolLoc_block_invoke;
    v11[3] = &unk_1E6CFA9C0;
    v11[4] = &v12;
    __getMKBDeviceLockAssertionSymbolLoc_block_invoke((uint64_t)v11);
    v6 = (uint64_t (*)(void *, id *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
    -[AAFAnalyticsTransportInProcessRTC initWithClientType:clientBundleId:clientName:]();
    __break(1u);
  }
  uint64_t v7 = v6(v5, &v10);
  if (v10)
  {
    v8 = _AAFLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[AAFKeybagLockAssertion lockWithError:]((uint64_t *)&v10, v8);
    }

    if (a3) {
      *a3 = v10;
    }
    else {
      CFRelease(v10);
    }
  }
  if (v7)
  {
    v4->_assertionRef = (__MKBAssertion *)v7;
  }
  else
  {

    v4 = 0;
  }

  return v4;
}

- (void)unlock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = _AAFLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DD937000, v3, OS_LOG_TYPE_DEFAULT, "Releasing device lock assertion", v5, 2u);
  }

  assertionRef = v2->_assertionRef;
  if (assertionRef)
  {
    CFRelease(assertionRef);
    v2->_assertionRef = 0;
  }
  objc_sync_exit(v2);
}

+ (void)lockWithError:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion: %@", (uint8_t *)&v3, 0xCu);
}

@end