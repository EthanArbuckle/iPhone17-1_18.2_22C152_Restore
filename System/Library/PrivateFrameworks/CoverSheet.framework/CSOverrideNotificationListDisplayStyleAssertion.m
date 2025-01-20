@interface CSOverrideNotificationListDisplayStyleAssertion
- (BOOL)hideNotificationCount;
- (CSOverrideNotificationListDisplayStyleAssertion)initWithNotificationListDisplayStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5 invalidationHandler:(id)a6;
- (NSString)description;
- (NSString)reason;
- (id)invalidationHandler;
- (int64_t)displayStyle;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setHideNotificationCount:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setReason:(id)a3;
@end

@implementation CSOverrideNotificationListDisplayStyleAssertion

- (CSOverrideNotificationListDisplayStyleAssertion)initWithNotificationListDisplayStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5 invalidationHandler:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"CSOverrideNotificationListDisplayStyleAssertion.m", 24, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"CSOverrideNotificationListDisplayStyleAssertion.m", 25, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)CSOverrideNotificationListDisplayStyleAssertion;
  v14 = [(CSOverrideNotificationListDisplayStyleAssertion *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_displayStyle = a3;
    v14->_hideNotificationCount = a4;
    uint64_t v16 = [v11 copy];
    reason = v15->_reason;
    v15->_reason = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    id invalidationHandler = v15->_invalidationHandler;
    v15->_id invalidationHandler = (id)v18;

    v20 = SBLogDashBoard();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1D839D000, v20, OS_LOG_TYPE_DEFAULT, "Acquired notification list display style override assertion: %{public}@", buf, 0xCu);
    }
  }
  return v15;
}

- (void)dealloc
{
  [(CSOverrideNotificationListDisplayStyleAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSOverrideNotificationListDisplayStyleAssertion;
  [(CSOverrideNotificationListDisplayStyleAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_invalidationHandler)
  {
    objc_super v3 = SBLogDashBoard();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating notification list display style override assertion: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    (*((void (**)(void))self->_invalidationHandler + 2))();
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (void)cancel
{
  self->_id invalidationHandler = 0;
  MEMORY[0x1F41817F8]();
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:self->_displayStyle];
  objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; displayStyle: %@; hideNotificationCount: %d, reason: %@>",
    objc_opt_class(),
    self,
    v3,
    self->_hideNotificationCount,
  v4 = self->_reason);

  return (NSString *)v4;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(int64_t)a3
{
  self->_displayStyle = a3;
}

- (BOOL)hideNotificationCount
{
  return self->_hideNotificationCount;
}

- (void)setHideNotificationCount:(BOOL)a3
{
  self->_hideNotificationCount = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end