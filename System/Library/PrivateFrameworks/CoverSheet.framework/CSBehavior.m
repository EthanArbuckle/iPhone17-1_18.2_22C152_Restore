@interface CSBehavior
+ (id)behavior;
+ (id)behaviorForProvider:(id)a3;
- (BOOL)areRestrictedCapabilities:(unint64_t)a3;
- (BOOL)isEqualToBehavior:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)notificationBehavior;
- (int64_t)proximityDetectionMode;
- (int64_t)scrollingStrategy;
- (unint64_t)hash;
- (unint64_t)restrictedCapabilities;
- (void)addRestrictedCapabilities:(unint64_t)a3;
- (void)removeRestrictedCapabilities:(unint64_t)a3;
- (void)reset;
- (void)setIdleTimerDuration:(int64_t)a3;
- (void)setIdleTimerMode:(int64_t)a3;
- (void)setIdleWarnMode:(int64_t)a3;
- (void)setNotificationBehavior:(int64_t)a3;
- (void)setProximityDetectionMode:(int64_t)a3;
- (void)setRestrictedCapabilities:(unint64_t)a3;
- (void)setScrollingStrategy:(int64_t)a3;
- (void)unionBehavior:(id)a3;
@end

@implementation CSBehavior

- (void)setIdleWarnMode:(int64_t)a3
{
  self->_idleWarnMode = a3;
}

- (void)setIdleTimerDuration:(int64_t)a3
{
  self->_idleTimerDuration = a3;
}

- (void)setIdleTimerMode:(int64_t)a3
{
  self->_idleTimerMode = a3;
}

- (void)addRestrictedCapabilities:(unint64_t)a3
{
  self->_restrictedCapabilities |= a3;
}

- (void)unionBehavior:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int64_t notificationBehavior = self->_notificationBehavior;
    id v27 = v4;
    uint64_t v6 = [v4 notificationBehavior];
    if (notificationBehavior <= v6) {
      int64_t v7 = v6;
    }
    else {
      int64_t v7 = notificationBehavior;
    }
    self->_int64_t notificationBehavior = v7;
    unint64_t restrictedCapabilities = self->_restrictedCapabilities;
    self->_unint64_t restrictedCapabilities = [v27 restrictedCapabilities] | restrictedCapabilities;
    int64_t scrollingStrategy = self->_scrollingStrategy;
    uint64_t v10 = [v27 scrollingStrategy];
    if (scrollingStrategy <= v10) {
      int64_t v11 = v10;
    }
    else {
      int64_t v11 = scrollingStrategy;
    }
    self->_int64_t scrollingStrategy = v11;
    int64_t proximityDetectionMode = self->_proximityDetectionMode;
    uint64_t v13 = [v27 proximityDetectionMode];
    if (proximityDetectionMode <= v13) {
      int64_t v14 = v13;
    }
    else {
      int64_t v14 = proximityDetectionMode;
    }
    self->_int64_t proximityDetectionMode = v14;
    id v15 = v27;
    char v16 = objc_opt_respondsToSelector();
    if (v16) {
      v17 = v15;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    if (v16)
    {
      uint64_t v19 = [v15 idleTimerDuration];
      int64_t idleTimerDuration = self->_idleTimerDuration;
      int64_t idleTimerMode = self->_idleTimerMode;
      if (idleTimerDuration <= v19) {
        int64_t idleTimerDuration = v19;
      }
      self->_int64_t idleTimerDuration = idleTimerDuration;
      uint64_t v22 = [v15 idleTimerMode];
      if (idleTimerMode <= v22) {
        int64_t v23 = v22;
      }
      else {
        int64_t v23 = idleTimerMode;
      }
      self->_int64_t idleTimerMode = v23;
      int64_t idleWarnMode = self->_idleWarnMode;
      uint64_t v25 = [v15 idleWarnMode];
      if (idleWarnMode <= v25) {
        int64_t v26 = v25;
      }
      else {
        int64_t v26 = idleWarnMode;
      }
      self->_int64_t idleWarnMode = v26;
    }

    id v4 = v27;
  }
}

- (BOOL)isEqualToBehavior:(id)a3
{
  id v4 = (CSBehavior *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if ([(CSBehavior *)v4 isMemberOfClass:objc_opt_class()] {
         && (int64_t notificationBehavior = self->_notificationBehavior,
  }
             notificationBehavior == [(CSBehavior *)v4 notificationBehavior])
         && (int64_t idleTimerDuration = self->_idleTimerDuration,
             idleTimerDuration == [(CSBehavior *)v4 idleTimerDuration])
         && (int64_t idleTimerMode = self->_idleTimerMode, idleTimerMode == [(CSBehavior *)v4 idleTimerMode])
         && (int64_t idleWarnMode = self->_idleWarnMode, idleWarnMode == [(CSBehavior *)v4 idleWarnMode])
         && (int64_t scrollingStrategy = self->_scrollingStrategy,
             scrollingStrategy == [(CSBehavior *)v4 scrollingStrategy])
         && (unint64_t restrictedCapabilities = self->_restrictedCapabilities,
             restrictedCapabilities == [(CSBehavior *)v4 restrictedCapabilities]))
  {
    int64_t proximityDetectionMode = self->_proximityDetectionMode;
    BOOL v12 = proximityDetectionMode == [(CSBehavior *)v4 proximityDetectionMode];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int64_t)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (int64_t)notificationBehavior
{
  return self->_notificationBehavior;
}

+ (id)behavior
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (unint64_t)restrictedCapabilities
{
  return self->_restrictedCapabilities;
}

- (int64_t)proximityDetectionMode
{
  return self->_proximityDetectionMode;
}

- (int64_t)idleWarnMode
{
  return self->_idleWarnMode;
}

- (int64_t)idleTimerMode
{
  return self->_idleTimerMode;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->_int64_t notificationBehavior = a3;
}

- (void)setScrollingStrategy:(int64_t)a3
{
  self->_int64_t scrollingStrategy = a3;
}

+ (id)behaviorForProvider:(id)a3
{
  id v4 = a3;
  v5 = [a1 behavior];
  objc_msgSend(v5, "setNotificationBehavior:", objc_msgSend(v4, "notificationBehavior"));
  objc_msgSend(v5, "setRestrictedCapabilities:", objc_msgSend(v4, "restrictedCapabilities"));
  objc_msgSend(v5, "setScrollingStrategy:", objc_msgSend(v4, "scrollingStrategy"));
  objc_msgSend(v5, "setProximityDetectionMode:", objc_msgSend(v4, "proximityDetectionMode"));
  id v6 = v4;
  if (objc_opt_respondsToSelector()) {
    int64_t v7 = v6;
  }
  else {
    int64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    objc_msgSend(v5, "setIdleTimerDuration:", objc_msgSend(v8, "idleTimerDuration"));
    objc_msgSend(v5, "setIdleTimerMode:", objc_msgSend(v8, "idleTimerMode"));
    uint64_t v9 = [v8 idleWarnMode];
  }
  else
  {
    [v5 setIdleTimerDuration:0];
    [v5 setIdleTimerMode:0];
    uint64_t v9 = 0;
  }
  [v5 setIdleWarnMode:v9];

  return v5;
}

- (void)reset
{
  self->_int64_t proximityDetectionMode = 0;
  *(_OWORD *)&self->_unint64_t restrictedCapabilities = 0u;
  *(_OWORD *)&self->_int64_t idleWarnMode = 0u;
  *(_OWORD *)&self->_int64_t idleTimerDuration = 0u;
}

- (BOOL)areRestrictedCapabilities:(unint64_t)a3
{
  return (a3 & ~[(CSBehavior *)self restrictedCapabilities]) == 0;
}

- (void)removeRestrictedCapabilities:(unint64_t)a3
{
  self->_restrictedCapabilities &= ~a3;
}

- (unint64_t)hash
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(CSBehavior *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)succinctDescription
{
  id v2 = [(CSBehavior *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = NSStringFromIdleTimerDuration();
  id v5 = (id)[v3 appendObject:v4 withName:@"idleTimerDuration"];

  id v6 = NSStringFromSBFIdleTimerMode();
  id v7 = (id)[v3 appendObject:v6 withName:@"idleTimerMode"];

  id v8 = NSStringFromIdleWarnMode();
  id v9 = (id)[v3 appendObject:v8 withName:@"idleWarnMode"];

  unint64_t scrollingStrategy = self->_scrollingStrategy;
  if (scrollingStrategy > 3) {
    int64_t v11 = @"(none)";
  }
  else {
    int64_t v11 = off_1E6AD9A60[scrollingStrategy];
  }
  id v12 = (id)[v3 appendObject:v11 withName:@"scrollingStrategy"];
  unint64_t notificationBehavior = self->_notificationBehavior;
  if (notificationBehavior > 4) {
    int64_t v14 = @"(none)";
  }
  else {
    int64_t v14 = off_1E6AD9A80[notificationBehavior];
  }
  id v15 = (id)[v3 appendObject:v14 withName:@"notificationBehavior"];
  char v16 = NSStringFromCoverSheetCapability(self->_restrictedCapabilities);
  id v17 = (id)[v3 appendObject:v16 withName:@"restrictedCapabilities"];

  unint64_t proximityDetectionMode = self->_proximityDetectionMode;
  if (proximityDetectionMode > 2) {
    uint64_t v19 = @"(none)";
  }
  else {
    uint64_t v19 = off_1E6AD9AA8[proximityDetectionMode];
  }
  id v20 = (id)[v3 appendObject:v19 withName:@"proxMode"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSBehavior *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)setRestrictedCapabilities:(unint64_t)a3
{
  self->_unint64_t restrictedCapabilities = a3;
}

- (void)setProximityDetectionMode:(int64_t)a3
{
  self->_unint64_t proximityDetectionMode = a3;
}

@end