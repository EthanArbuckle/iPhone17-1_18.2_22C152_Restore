@interface CPLPowerAssertion
+ (BOOL)hasEnoughPower;
+ (id)powerAssertionStatus;
+ (void)_doProtected:(id)a3;
+ (void)_releaseAssertion;
+ (void)_retainAssertion;
+ (void)disableSleep;
+ (void)enableSleep;
+ (void)setHasEnoughPower:(BOOL)a3;
@end

@implementation CPLPowerAssertion

+ (id)powerAssertionStatus
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1008;
  v9 = __Block_byref_object_dispose__1009;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CPLPowerAssertion_powerAssertionStatus__block_invoke;
  v4[3] = &unk_1E60A6F28;
  v4[5] = a2;
  v4[6] = a1;
  v4[4] = &v5;
  [a1 _doProtected:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __41__CPLPowerAssertion_powerAssertionStatus__block_invoke(uint64_t result)
{
  v1 = (void *)result;
  double v2 = *(double *)&_powerAssertionStartTime;
  if (*(double *)&_powerAssertionStartTime <= 0.0)
  {
    if (*(double *)&_lastPowerAssertionRelease <= 0.0) {
      return result;
    }
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)&_lastPowerAssertionRelease];
    v6 = NSString;
    uint64_t v7 = _lastPowerAssertionDuration;
    v8 = +[CPLDateFormatter stringFromDateAgo:v17 now:0];
    uint64_t v9 = [v6 stringWithFormat:@"Last power assertion held for %0.1fs %@", v7, v8];
    uint64_t v10 = *(void *)(v1[4] + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    int v3 = _invalidPowerAssertion;
    if ((_invalidPowerAssertion & 1) == 0 && !_powerAssertionId)
    {
      if (!_CPLSilentLogging)
      {
        v12 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Power assertion should be present", buf, 2u);
        }
      }
      v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v2);
      uint64_t v15 = v1[5];
      uint64_t v14 = v1[6];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m"];
      [v13 handleFailureInMethod:v15 object:v14 file:v16 lineNumber:168 description:@"Power assertion should be present"];

      abort();
    }
    v4 = NSString;
    double v5 = CFAbsoluteTimeGetCurrent() - *(double *)&_powerAssertionStartTime;
    if (v3) {
      objc_msgSend(v4, "stringWithFormat:", @"Power assertion held for %0.1fs - failed to get valid power assertion", *(void *)&v5);
    }
    else {
    *(void *)(*(void *)(v1[4] + 8) + 40) = objc_msgSend(v4, "stringWithFormat:", @"Power assertion held for %0.1fs", *(void *)&v5);
    }
  }
  return MEMORY[0x1F41817F8]();
}

+ (void)setHasEnoughPower:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CPLPowerAssertion_setHasEnoughPower___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  BOOL v4 = a3;
  v3[4] = a1;
  [a1 _doProtected:v3];
}

uint64_t __39__CPLPowerAssertion_setHasEnoughPower___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 != _hasPower)
  {
    _hasPower = *(unsigned char *)(result + 40);
    if (_powerAssertionCount)
    {
      double v2 = *(void **)(result + 32);
      if (v1) {
        return [v2 _retainAssertion];
      }
      else {
        return [v2 _releaseAssertion];
      }
    }
  }
  return result;
}

+ (BOOL)hasEnoughPower
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__CPLPowerAssertion_hasEnoughPower__block_invoke;
  v4[3] = &unk_1E60A69C0;
  v4[4] = &v5;
  [a1 _doProtected:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __35__CPLPowerAssertion_hasEnoughPower__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = _hasPower;
  return result;
}

+ (void)enableSleep
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__CPLPowerAssertion_enableSleep__block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = a2;
  v2[5] = a1;
  [a1 _doProtected:v2];
}

uint64_t __32__CPLPowerAssertion_enableSleep__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!_powerAssertionCount)
  {
    if (!_CPLSilentLogging)
    {
      BOOL v4 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = NSStringFromSelector(*(SEL *)(v1 + 32));
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
      }
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(v1 + 32);
    uint64_t v8 = *(void *)(v1 + 40);
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m"];
    uint64_t v10 = NSStringFromSelector(*(SEL *)(v1 + 32));
    [v6 handleFailureInMethod:v7, v8, v9, 132, @"%@ has been called too many times", v10 object file lineNumber description];

    abort();
  }
  if (--_powerAssertionCount) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = _hasPower == 0;
  }
  if (!v2)
  {
    int v3 = *(void **)(result + 40);
    return [v3 _releaseAssertion];
  }
  return result;
}

+ (void)disableSleep
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__CPLPowerAssertion_disableSleep__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 _doProtected:v2];
}

uint64_t __33__CPLPowerAssertion_disableSleep__block_invoke(uint64_t result)
{
  if (_powerAssertionCount++) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = _hasPower == 0;
  }
  if (!v2) {
    return [*(id *)(result + 32) _retainAssertion];
  }
  return result;
}

+ (void)_releaseAssertion
{
  if ((_invalidPowerAssertion & 1) != 0 || _powerAssertionId)
  {
    double v2 = CFAbsoluteTimeGetCurrent() - *(double *)&_powerAssertionStartTime;
    if (v2 >= 10.0)
    {
      _lastPowerAssertionRelease = CFAbsoluteTimeGetCurrent();
      *(double *)&_lastPowerAssertionDuration = *(double *)&_lastPowerAssertionRelease
                                              - *(double *)&_powerAssertionStartTime;
      _powerAssertionStartTime = 0;
      if (_invalidPowerAssertion == 1)
      {
        _invalidPowerAssertion = 0;
      }
      else
      {
        if (!_powerAssertionId)
        {
          if (!_CPLSilentLogging)
          {
            uint64_t v7 = __CPLGenericOSLogDomain();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_ERROR, "Power assertion should be present", buf, 2u);
            }
          }
          uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v9 = [NSString stringWithUTF8String:"void releasePowerAssertion(void)"];
          uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m"];
          [v8 handleFailureInFunction:v9 file:v10 lineNumber:58 description:@"Power assertion should be present"];

          abort();
        }
        IOPMAssertionRelease(_powerAssertionId);
        _powerAssertionId = 0;
      }
    }
    else
    {
      uint64_t v3 = _powerAssertionAge;
      double v4 = 10.0 - v2;
      double v5 = 1.0e10;
      if (v4 < 10.0) {
        double v5 = v4 * 1000000000.0;
      }
      dispatch_time_t v6 = dispatch_walltime(0, (uint64_t)v5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__CPLPowerAssertion__releaseAssertion__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v3;
      dispatch_after(v6, (dispatch_queue_t)_powerAssertionQueue, block);
    }
  }
}

void __38__CPLPowerAssertion__releaseAssertion__block_invoke(uint64_t a1)
{
  if (_powerAssertionAge == *(void *)(a1 + 32) && ((_invalidPowerAssertion & 1) != 0 || _powerAssertionId))
  {
    _lastPowerAssertionRelease = CFAbsoluteTimeGetCurrent();
    *(double *)&_lastPowerAssertionDuration = *(double *)&_lastPowerAssertionRelease
                                            - *(double *)&_powerAssertionStartTime;
    _powerAssertionStartTime = 0;
    if (_invalidPowerAssertion == 1)
    {
      _invalidPowerAssertion = 0;
    }
    else
    {
      if (!_powerAssertionId)
      {
        if (!_CPLSilentLogging)
        {
          uint64_t v1 = __CPLGenericOSLogDomain();
          if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)double v5 = 0;
            _os_log_impl(&dword_1B4CAC000, v1, OS_LOG_TYPE_ERROR, "Power assertion should be present", v5, 2u);
          }
        }
        double v2 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v3 = [NSString stringWithUTF8String:"void releasePowerAssertion(void)"];
        double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLPowerAssertion.m"];
        [v2 handleFailureInFunction:v3 file:v4 lineNumber:58 description:@"Power assertion should be present"];

        abort();
      }
      IOPMAssertionRelease(_powerAssertionId);
      _powerAssertionId = 0;
    }
  }
}

+ (void)_retainAssertion
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((_invalidPowerAssertion & 1) == 0 && !_powerAssertionId)
  {
    IOReturn v2 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"cloudphotod", 0, @"Photos syncing iCloud Photos", 0, 3600.0, @"TimeoutActionTurnOff", (IOPMAssertionID *)&_powerAssertionId);
    if (v2)
    {
      if (!_CPLSilentLogging)
      {
        IOReturn v3 = v2;
        double v4 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          int v5 = 134217984;
          uint64_t v6 = v3;
          _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "Failed to create a power assertion: %ld", (uint8_t *)&v5, 0xCu);
        }
      }
      _invalidPowerAssertion = 1;
      _powerAssertionId = 0;
    }
    else
    {
      _invalidPowerAssertion = 0;
    }
    _powerAssertionStartTime = CFAbsoluteTimeGetCurrent();
  }
  ++_powerAssertionAge;
}

+ (void)_doProtected:(id)a3
{
  uint64_t v3 = _doProtected__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    int v5 = v4;
  }
  else
  {
    dispatch_once(&_doProtected__onceToken, &__block_literal_global_1048);
    int v5 = v6;
  }
  dispatch_sync((dispatch_queue_t)_powerAssertionQueue, v5);
}

void __34__CPLPowerAssertion__doProtected___block_invoke()
{
  IOReturn v2 = CPLCopyDefaultSerialQueueAttributes();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cpl.powerassert", v2);
  uint64_t v1 = (void *)_powerAssertionQueue;
  _powerAssertionQueue = (uint64_t)v0;
}

@end