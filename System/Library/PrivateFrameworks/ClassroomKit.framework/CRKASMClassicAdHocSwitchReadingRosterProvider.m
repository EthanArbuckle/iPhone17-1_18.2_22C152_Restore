@interface CRKASMClassicAdHocSwitchReadingRosterProvider
+ (id)currentUserProviderObservedKeyPaths;
- (BOOL)isClassicAdHocModeEnabledForUser:(id)a3;
- (BOOL)isPopulated;
- (BOOL)overridingIsPopulatedToYES;
- (CRKASMClassicAdHocSwitchReadingRosterProvider)initWithClassKitFacade:(id)a3 rosterProviderGenerator:(id)a4;
- (CRKASMSuspendableRosterProvider)suspendableProvider;
- (CRKClassKitCurrentUserProvider)currentUserProvider;
- (NSNumber)previousValueOfAdHocModeEnabled;
- (void)currentUserDidChange;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overrideIsPopulatedToYES;
- (void)processAdHocModeEnabled:(BOOL)a3;
- (void)setOverridingIsPopulatedToYES:(BOOL)a3;
- (void)setPreviousValueOfAdHocModeEnabled:(id)a3;
- (void)startObservingCurrentUserProvider;
- (void)stopObservingCurrentUserProvider;
@end

@implementation CRKASMClassicAdHocSwitchReadingRosterProvider

- (void)dealloc
{
  [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self stopObservingCurrentUserProvider];
  v3.receiver = self;
  v3.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  [(CRKASMClassicAdHocSwitchReadingRosterProvider *)&v3 dealloc];
}

- (CRKASMClassicAdHocSwitchReadingRosterProvider)initWithClassKitFacade:(id)a3 rosterProviderGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[CRKASMSuspendableRosterProvider alloc] initWithGenerator:v7];

  v14.receiver = self;
  v14.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  v9 = [(CRKASMRosterProviderDecoratorBase *)&v14 initWithRosterProvider:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suspendableProvider, v8);
    v11 = [[CRKClassKitCurrentUserProvider alloc] initWithClassKitFacade:v6];
    currentUserProvider = v10->_currentUserProvider;
    v10->_currentUserProvider = v11;

    [(CRKASMClassicAdHocSwitchReadingRosterProvider *)v10 startObservingCurrentUserProvider];
    [(CRKASMClassicAdHocSwitchReadingRosterProvider *)v10 currentUserDidChange];
  }

  return v10;
}

+ (id)currentUserProviderObservedKeyPaths
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"currentUser";
  v4[1] = @"currentUserFetched";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)startObservingCurrentUserProvider
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self currentUserProvider];
        [v9 addObserver:self forKeyPath:v8 options:0 context:@"CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)stopObservingCurrentUserProvider
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self currentUserProvider];
        [v9 removeObserver:self forKeyPath:v8 context:@"CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKASMClassicAdHocSwitchReadingRosterProviderObservationContext")
  {
    [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self currentUserDidChange];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
    -[CRKASMClassicAdHocSwitchReadingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)currentUserDidChange
{
  objc_super v3 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self currentUserProvider];
  int v4 = [v3 currentUserFetched];

  if (v4)
  {
    uint64_t v5 = NSNumber;
    uint64_t v6 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self currentUserProvider];
    uint64_t v7 = [v6 currentUser];
    uint64_t v11 = objc_msgSend(v5, "numberWithBool:", -[CRKASMClassicAdHocSwitchReadingRosterProvider isClassicAdHocModeEnabledForUser:](self, "isClassicAdHocModeEnabledForUser:", v7));

    uint64_t v8 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self previousValueOfAdHocModeEnabled];
    if (v8 | v11)
    {
      uint64_t v9 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self previousValueOfAdHocModeEnabled];
      char v10 = [v9 isEqual:v11];

      if ((v10 & 1) == 0)
      {
        [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self setPreviousValueOfAdHocModeEnabled:v11];
        -[CRKASMClassicAdHocSwitchReadingRosterProvider processAdHocModeEnabled:](self, "processAdHocModeEnabled:", [(id)v11 BOOLValue]);
      }
    }
  }
}

- (BOOL)isClassicAdHocModeEnabledForUser:(id)a3
{
  if ([a3 classroomClassicAdHocModeEnabled]) {
    return 1;
  }
  int v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"CRKForceClassicAdHocModeInsteadOfASMMode"];

  return v5;
}

- (void)processAdHocModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = _CRKLogASM_13();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom classic ad-hoc mode is enabled in ASM. Suspending roster provider.", buf, 2u);
    }

    uint64_t v7 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self suspendableProvider];
    [v7 suspend];

    [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self overrideIsPopulatedToYES];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom classic ad-hoc mode is NOT enabled in ASM. Resuming roster provider.", v9, 2u);
    }

    uint64_t v8 = [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self suspendableProvider];
    [v8 resume];
  }
}

- (void)overrideIsPopulatedToYES
{
  if (![(CRKASMClassicAdHocSwitchReadingRosterProvider *)self overridingIsPopulatedToYES])
  {
    if ([(CRKASMClassicAdHocSwitchReadingRosterProvider *)self isPopulated])
    {
      [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self setOverridingIsPopulatedToYES:1];
    }
    else
    {
      [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self willChangeValueForKey:@"populated"];
      [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self setOverridingIsPopulatedToYES:1];
      [(CRKASMClassicAdHocSwitchReadingRosterProvider *)self didChangeValueForKey:@"populated"];
    }
  }
}

- (BOOL)isPopulated
{
  if ([(CRKASMClassicAdHocSwitchReadingRosterProvider *)self overridingIsPopulatedToYES]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRKASMClassicAdHocSwitchReadingRosterProvider;
  return [(CRKASMRosterProviderDecoratorBase *)&v4 isPopulated];
}

- (CRKASMSuspendableRosterProvider)suspendableProvider
{
  return self->_suspendableProvider;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (NSNumber)previousValueOfAdHocModeEnabled
{
  return self->_previousValueOfAdHocModeEnabled;
}

- (void)setPreviousValueOfAdHocModeEnabled:(id)a3
{
}

- (BOOL)overridingIsPopulatedToYES
{
  return self->_overridingIsPopulatedToYES;
}

- (void)setOverridingIsPopulatedToYES:(BOOL)a3
{
  self->_overridingIsPopulatedToYES = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousValueOfAdHocModeEnabled, 0);
  objc_storeStrong((id *)&self->_currentUserProvider, 0);

  objc_storeStrong((id *)&self->_suspendableProvider, 0);
}

@end