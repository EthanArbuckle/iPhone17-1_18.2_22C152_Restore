@interface BLSHOSInterfaceProviderAbortContext
- (BLSHOSInterfaceProviderAbortContext)initWithWatchdogType:(unint64_t)a3 cbDisplayMode:(int64_t)a4 cbFlipbookState:(int64_t)a5 caDisplayState:(int64_t)a6 completedCADisplayState:(int64_t)a7 suppressionServiceActive:(BOOL)a8 flipbookTransparent:(BOOL)a9 deviceSupportsAlwaysOn:(BOOL)a10 deviceSupportsAlwaysOnFlipbook:(BOOL)a11 kernelSpecialMode:(BOOL)a12 displayStateClientSupported:(BOOL)a13 backlightDimmedFactor:(float)a14;
- (BOOL)wantsPanic;
- (BOOL)wantsWaitPastFireForCompletionAndTailspin;
- (NSString)abortReasonString;
- (NSString)description;
- (double)panicDelay;
- (unint64_t)abortReason;
- (void)setSleepImminentAbortReason;
@end

@implementation BLSHOSInterfaceProviderAbortContext

- (BLSHOSInterfaceProviderAbortContext)initWithWatchdogType:(unint64_t)a3 cbDisplayMode:(int64_t)a4 cbFlipbookState:(int64_t)a5 caDisplayState:(int64_t)a6 completedCADisplayState:(int64_t)a7 suppressionServiceActive:(BOOL)a8 flipbookTransparent:(BOOL)a9 deviceSupportsAlwaysOn:(BOOL)a10 deviceSupportsAlwaysOnFlipbook:(BOOL)a11 kernelSpecialMode:(BOOL)a12 displayStateClientSupported:(BOOL)a13 backlightDimmedFactor:(float)a14
{
  v22.receiver = self;
  v22.super_class = (Class)BLSHOSInterfaceProviderAbortContext;
  result = [(BLSHOSInterfaceProviderAbortContext *)&v22 init];
  if (result)
  {
    result->_watchdogType = a3;
    result->_cbDisplayMode = a4;
    result->_cbFlipbookState = a5;
    result->_caDisplayState = a6;
    result->_completedCADisplayState = a7;
    result->_suppressionServiceActive = a8;
    result->_flipbookTransparent = a9;
    result->_deviceSupportsAlwaysOn = a10;
    result->_deviceSupportsAlwaysOnFlipbook = a11;
    result->_kernelSpecialMode = a12;
    result->_displayStateClientSupported = a13;
    result->_backlightDimmedFactor = a14;
    if (a3 <= 2) {
      result->_abortReason = qword_21FD8B1F8[a3];
    }
  }
  return result;
}

- (NSString)abortReasonString
{
  unint64_t v2 = self->_abortReason - 11;
  if (v2 > 0xA) {
    return (NSString *)@"OSIP_UNKNOWN";
  }
  else {
    return &off_264532358[v2]->isa;
  }
}

- (double)panicDelay
{
  double result = 30.0;
  if ((self->_abortReason & 0xFFFFFFFFFFFFFFFELL) == 0x14) {
    return 0.0;
  }
  return result;
}

- (BOOL)wantsPanic
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t abortReason = self->_abortReason;
  if (abortReason > 0x15) {
    goto LABEL_16;
  }
  if (((1 << abortReason) & 0x205000) != 0)
  {
    v6 = bls_diagnostics_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = self->_abortReason;
      v8 = [(BLSHOSInterfaceProviderAbortContext *)self abortReasonString];
      *(_DWORD *)buf = 134218242;
      unint64_t v21 = v10;
      __int16 v22 = 2114;
      v23 = v8;
      v9 = "_abortReason=%llu (%{public}@) wantsPanic:YES";
      goto LABEL_9;
    }
LABEL_10:
    LOBYTE(v5) = 1;
LABEL_19:

    return v5;
  }
  if (((1 << abortReason) & 0x2800) == 0)
  {
    if (abortReason == 20)
    {
      v6 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
      v18 = @"panicOnCoreAnimationWatchdog";
      uint64_t v19 = MEMORY[0x263EFFA88];
      v11 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v6 registerDefaults:v11];

      if ([v6 BOOLForKey:@"panicOnCoreAnimationWatchdog"])
      {
        v12 = bls_diagnostics_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v13 = self->_abortReason;
          v14 = [(BLSHOSInterfaceProviderAbortContext *)self abortReasonString];
          *(_DWORD *)buf = 134218242;
          unint64_t v21 = v13;
          __int16 v22 = 2114;
          v23 = v14;
          _os_log_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEFAULT, "_abortReason=%llu (%{public}@) com.apple.BacklightServices panicOnCoreAnimationWatchdog:YES wantsPanic:YES", buf, 0x16u);
        }
        goto LABEL_10;
      }
LABEL_18:
      LOBYTE(v5) = 0;
      goto LABEL_19;
    }
LABEL_16:
    v6 = bls_diagnostics_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v15 = self->_abortReason;
      v16 = [(BLSHOSInterfaceProviderAbortContext *)self abortReasonString];
      *(_DWORD *)buf = 134218242;
      unint64_t v21 = v15;
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEFAULT, "_abortReason=%llu (%{public}@) wantsPanic:NO", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.BacklightServices"];
  int v5 = [v4 BOOLForKey:@"panicOnCoreBrightnessWatchdog"];

  if (v5)
  {
    v6 = bls_diagnostics_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = self->_abortReason;
      v8 = [(BLSHOSInterfaceProviderAbortContext *)self abortReasonString];
      *(_DWORD *)buf = 134218242;
      unint64_t v21 = v7;
      __int16 v22 = 2114;
      v23 = v8;
      v9 = "_abortReason=%llu (%{public}@) com.apple.BacklightServices panicOnCoreBrightnessWatchdog:YES wantsPanic:YES";
LABEL_9:
      _os_log_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)wantsWaitPastFireForCompletionAndTailspin
{
  return ((self->_abortReason - 11) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setSleepImminentAbortReason
{
  unint64_t abortReason = self->_abortReason;
  switch(abortReason)
  {
    case 0xBuLL:
      unint64_t v3 = 12;
      break;
    case 0x14uLL:
      unint64_t v3 = 21;
      break;
    case 0xDuLL:
      unint64_t v3 = 14;
      break;
    default:
      return;
  }
  self->_unint64_t abortReason = v3;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = v3;
  unint64_t watchdogType = self->_watchdogType;
  if (watchdogType > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_2645323B0[watchdogType];
  }
  [v3 appendString:v6 withName:@"watchdogType"];
  unint64_t v7 = NSStringFromCBDisplayMode_bls(self->_cbDisplayMode);
  [v4 appendString:v7 withName:@"cbDisplayMode"];

  v8 = NSStringFromCBFlipbookState_bls(self->_cbFlipbookState);
  [v4 appendString:v8 withName:@"cbFlipbookState"];

  int64_t caDisplayState = self->_caDisplayState;
  int64_t completedCADisplayState = self->_completedCADisplayState;
  v11 = NSStringFromCADisplayState();
  if (caDisplayState == completedCADisplayState)
  {
    v12 = @"caDisplayState";
  }
  else
  {
    [v4 appendString:v11 withName:@"pendingCADisplayState"];

    v11 = NSStringFromCADisplayState();
    v12 = @"completedCADisplayState";
  }
  [v4 appendString:v11 withName:v12];

  id v13 = (id)[v4 appendBool:self->_suppressionServiceActive withName:@"suppressionServiceActive"];
  id v14 = (id)[v4 appendBool:self->_flipbookTransparent withName:@"flipbookTransparent"];
  id v15 = (id)[v4 appendBool:self->_deviceSupportsAlwaysOn withName:@"supportsAlwaysOn"];
  id v16 = (id)[v4 appendBool:self->_deviceSupportsAlwaysOnFlipbook withName:@"supportsFlipbook"];
  id v17 = (id)[v4 appendBool:self->_kernelSpecialMode withName:@"kernelSpecialMode"];
  id v18 = (id)[v4 appendBool:self->_displayStateClientSupported withName:@"displayStateClientSupported"];
  id v19 = (id)[v4 appendFloat:@"backlightDimmedFactor" withName:self->_backlightDimmedFactor];
  v20 = [v4 build];

  return (NSString *)v20;
}

- (unint64_t)abortReason
{
  return self->_abortReason;
}

@end