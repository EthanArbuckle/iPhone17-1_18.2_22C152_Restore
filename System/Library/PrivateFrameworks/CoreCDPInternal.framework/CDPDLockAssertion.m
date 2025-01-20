@interface CDPDLockAssertion
+ (id)lock;
+ (id)lockWithError:(id *)a3;
- (void)unlock;
@end

@implementation CDPDLockAssertion

+ (id)lock
{
  return (id)[a1 lockWithError:0];
}

+ (id)lockWithError:(id *)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(CDPDLockAssertion);
  v16[0] = @"MKBAssertionKey";
  v16[1] = @"MKBAssertionTimeout";
  v17[0] = @"RemoteProfile";
  v17[1] = &unk_26C9D3100;
  v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v10 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  v6 = (uint64_t (*)(void *, id *))getMKBDeviceLockAssertionSymbolLoc_ptr;
  v15 = getMKBDeviceLockAssertionSymbolLoc_ptr;
  if (!getMKBDeviceLockAssertionSymbolLoc_ptr)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getMKBDeviceLockAssertionSymbolLoc_block_invoke;
    v11[3] = &unk_2643305C0;
    v11[4] = &v12;
    __getMKBDeviceLockAssertionSymbolLoc_block_invoke((uint64_t)v11);
    v6 = (uint64_t (*)(void *, id *))v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (!v6)
  {
    -[CDPDBuddyStateObserver eventReceived:eventValue:]();
    __break(1u);
  }
  uint64_t v7 = v6(v5, &v10);
  if (v10)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CDPDLockAssertion lockWithError:]((uint64_t *)&v10, v8);
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
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Releasing device lock assertion", v1, 2u);
}

+ (void)lockWithError:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to take device lock assertion: %@", (uint8_t *)&v3, 0xCu);
}

@end