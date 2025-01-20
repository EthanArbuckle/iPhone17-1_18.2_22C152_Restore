@interface AXVisionIntentHandler
- (NPSDomainAccessor)domainAccessor;
- (void)handleToggleAudioDescriptions:(id)a3 completion:(id)a4;
- (void)handleToggleReduceMotion:(id)a3 completion:(id)a4;
- (void)resolveOperationForToggleAudioDescriptions:(id)a3 withCompletion:(id)a4;
- (void)resolveOperationForToggleReduceMotion:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleAudioDescriptions:(id)a3 withCompletion:(id)a4;
- (void)resolveStateForToggleReduceMotion:(id)a3 withCompletion:(id)a4;
- (void)setDomainAccessor:(id)a3;
- (void)setGizmoPref:(id)a3 forKey:(id)a4 domain:(id)a5;
@end

@implementation AXVisionIntentHandler

- (void)handleToggleAudioDescriptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  if ([v5 operation] == (id)1 && !objc_msgSend(v5, "state"))
  {
    v13 = AXLogSiriShortcuts();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000C1B8((uint64_t)v5, v13);
    }

    v10 = [AXToggleAudioDescriptionsIntentResponse alloc];
    uint64_t v11 = 5;
  }
  else
  {
    if ([v5 operation] == (id)2)
    {
      CFBooleanRef v7 = (const __CFBoolean *)MAAudibleMediaPrefCopyPreferDescriptiveVideo();
      BOOL v8 = CFBooleanGetValue(v7) == 0;
    }
    else
    {
      BOOL v8 = [v5 state] == (id)1;
    }
    uint64_t v9 = v8;
    +[NSNumber numberWithBool:v9];
    MAAudibleMediaPrefSetPreferDescriptiveVideo();
    v10 = [AXToggleAudioDescriptionsIntentResponse alloc];
    uint64_t v11 = 4;
  }
  v12 = [(AXToggleAudioDescriptionsIntentResponse *)v10 initWithCode:v11 userActivity:0];
  v6[2](v6, v12);
}

- (void)resolveOperationForToggleAudioDescriptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleAudioDescriptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)handleToggleReduceMotion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([v6 operation] != (id)1 || objc_msgSend(v6, "state"))
  {
    if ([v6 operation] == (id)2)
    {
      int v8 = _AXSReduceMotionEnabled();
      _AXSSetReduceMotionEnabled();
      if (v8)
      {
LABEL_5:
        BOOL v9 = 1;
LABEL_8:
        uint64_t v11 = +[NSNumber numberWithBool:v9];
        [(AXVisionIntentHandler *)self setGizmoPref:v11 forKey:@"ReduceMotionAutoplayMessagesEffectsEnabled" domain:kAXSAccessibilityPreferenceDomain];

        v12 = [AXToggleReduceMotionIntentResponse alloc];
        uint64_t v13 = 4;
        goto LABEL_9;
      }
    }
    else
    {
      id v10 = [v6 state];
      _AXSSetReduceMotionEnabled();
      if (v10 != (id)1) {
        goto LABEL_5;
      }
    }
    BOOL v9 = _AXSReduceMotionAutoplayMessagesEffectsEnabled() != 0;
    goto LABEL_8;
  }
  v15 = AXLogSiriShortcuts();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10000C1B8((uint64_t)v6, v15);
  }

  v12 = [AXToggleReduceMotionIntentResponse alloc];
  uint64_t v13 = 5;
LABEL_9:
  v14 = [(AXToggleReduceMotionIntentResponse *)v12 initWithCode:v13 userActivity:0];
  v7[2](v7, v14);
}

- (void)resolveOperationForToggleReduceMotion:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXOperationResolutionResult successWithResolvedOperation:](AXOperationResolutionResult, "successWithResolvedOperation:", [a3 operation]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)resolveStateForToggleReduceMotion:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  +[AXStateResolutionResult successWithResolvedState:](AXStateResolutionResult, "successWithResolvedState:", [a3 state]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)setGizmoPref:(id)a3 forKey:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v12 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:v10];
    uint64_t v13 = self->_domainAccessor;
    self->_domainAccessor = v12;

    domainAccessor = self->_domainAccessor;
  }
  [(NPSDomainAccessor *)domainAccessor setObject:v8 forKey:v9];
  id v14 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  v15 = objc_opt_new();
  id v18 = v9;
  v16 = +[NSArray arrayWithObjects:&v18 count:1];
  v17 = +[NSSet setWithArray:v16];
  [v15 synchronizeNanoDomain:v10 keys:v17];
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end