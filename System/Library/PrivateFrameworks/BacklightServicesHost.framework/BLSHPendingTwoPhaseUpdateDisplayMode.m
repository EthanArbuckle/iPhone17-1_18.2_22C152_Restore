@interface BLSHPendingTwoPhaseUpdateDisplayMode
- (BLSHPendingTwoPhaseUpdateDisplayMode)next;
- (BLSHPendingTwoPhaseUpdateDisplayMode)previous;
- (BOOL)isFullyCompleted;
- (BOOL)isStarted;
- (BOOL)isTwoPhaseUpdate;
- (id)_inProgressOperation:(NSObject *)a1;
- (id)_inProgressOperationFromSelfFirst:(id)a1;
- (id)description;
- (id)first;
- (id)inProgressOperation;
- (id)last;
- (id)rampOperation;
- (void)setNext:(id)a3;
- (void)setPrevious:(id)a3;
@end

@implementation BLSHPendingTwoPhaseUpdateDisplayMode

- (BOOL)isFullyCompleted
{
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self first];
  if ([v3 isCompleted])
  {
    v4 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self last];
    char v5 = [v4 isCompleted];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_inProgressOperation:(NSObject *)a1
{
  if (a1)
  {
    if (a2)
    {
      v3 = [a1 first];
      if (v3 == a1)
      {
        v4 = -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperationFromSelfFirst:](a1, 1);
      }
      else
      {
        v8.receiver = a1;
        v8.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
        v4 = [&v8 inProgressOperation];
        char v5 = bls_backlight_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:]();
        }
      }
    }
    else
    {
      v7.receiver = a1;
      v7.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
      v4 = [&v7 inProgressOperation];
      v3 = bls_backlight_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:]();
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_inProgressOperationFromSelfFirst:(id)a1
{
  id v2 = a1;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
    uint64_t v4 = objc_msgSendSuper2(&v13, sel_inProgressOperation);
    if (v4)
    {
      char v5 = (void *)v4;
      v6 = bls_backlight_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v15 = a2;
        __int16 v16 = 2048;
        v17 = v5;
        __int16 v18 = 2114;
        id v19 = v2;
        _os_log_debug_impl(&dword_21FCFC000, v6, OS_LOG_TYPE_DEBUG, "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from super self:%{public}@", buf, 0x1Cu);
      }

      id v2 = v5;
      goto LABEL_16;
    }
    objc_super v7 = [v2 last];
    if (!v7)
    {
      v11 = bls_backlight_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        [(BLSHPendingTwoPhaseUpdateDisplayMode *)a2 _inProgressOperationFromSelfFirst:v11];
      }

      id v2 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:](v7, 0);
      v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v15 = a2;
        __int16 v16 = 2048;
        v17 = v8;
        __int16 v18 = 2114;
        id v19 = v2;
        v10 = "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from [last _inProgressOperation:NO] self:%{public}@";
LABEL_21:
        _os_log_debug_impl(&dword_21FCFC000, v9, OS_LOG_TYPE_DEBUG, v10, buf, 0x1Cu);
      }
    }
    else
    {
      objc_super v8 = [v7 inProgressOperation];
      v9 = bls_backlight_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        int v15 = a2;
        __int16 v16 = 2048;
        v17 = v8;
        __int16 v18 = 2114;
        id v19 = v2;
        v10 = "_inProgressOperation: checkFirst:%{BOOL}u first==self returning %p from last self:%{public}@";
        goto LABEL_21;
      }
    }

    id v2 = v8;
LABEL_15:

LABEL_16:
  }

  return v2;
}

- (id)inProgressOperation
{
  return -[BLSHPendingTwoPhaseUpdateDisplayMode _inProgressOperation:](&self->super.super, 1);
}

- (BOOL)isTwoPhaseUpdate
{
  return 1;
}

- (BOOL)isStarted
{
  v7.receiver = self;
  v7.super_class = (Class)BLSHPendingTwoPhaseUpdateDisplayMode;
  if (![(BLSHPendingUpdateDisplayMode *)&v7 isStarted]) {
    return 0;
  }
  if (![(BLSHPendingUpdateDisplayMode *)self isCompleted]) {
    return 1;
  }
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  char v5 = [v3 isStarted];

  return v5;
}

- (id)first
{
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self previous];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (id)last
{
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (id)rampOperation
{
  v3 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self previous];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  }
  v6 = v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  BOOL v5 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self isStarted];
  if (WeakRetained) {
    v6 = @"started";
  }
  else {
    v6 = @"bothStarted";
  }
  id v7 = (id)[v3 appendBool:v5 withName:v6];
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHPendingUpdateDisplayMode isCompleted](self, "isCompleted"), @"completed");
  v9 = NSStringFromBLSBacklightDisplayMode([(BLSHPendingUpdateDisplayMode *)self targetDisplayMode]);
  [v3 appendString:v9 withName:@"target"];

  id v10 = (id)[v3 appendPointer:WeakRetained withName:@"previous"];
  v11 = [(BLSHPendingTwoPhaseUpdateDisplayMode *)self next];
  id v12 = (id)[v3 appendObject:v11 withName:@"next"];

  objc_super v13 = [v3 build];

  return v13;
}

- (BLSHPendingTwoPhaseUpdateDisplayMode)previous
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);

  return (BLSHPendingTwoPhaseUpdateDisplayMode *)WeakRetained;
}

- (void)setPrevious:(id)a3
{
}

- (BLSHPendingTwoPhaseUpdateDisplayMode)next
{
  return (BLSHPendingTwoPhaseUpdateDisplayMode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);

  objc_destroyWeak((id *)&self->_previous);
}

- (void)_inProgressOperation:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_21FCFC000, v0, v1, "_inProgressOperation: checkFirst:%{BOOL}u first!=self returning %p from super self:%{public}@", 0x104000302);
}

- (void)_inProgressOperation:.cold.2()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4(&dword_21FCFC000, v0, v1, "_inProgressOperation: checkFirst:%{BOOL}u returning %p from super self:%{public}@", 67109634);
}

- (void)_inProgressOperationFromSelfFirst:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109634;
  HIDWORD(v3) = a1 & 1;
  LODWORD(v4) = 138543104;
  HIDWORD(v4) = a2;
  OUTLINED_FUNCTION_0_4(&dword_21FCFC000, a2, a3, "_inProgressOperation: checkFirst:%{BOOL}u first==self last==nil returning %p from super self:%{public}@", v3, 2048, v4, HIDWORD(a2));
}

@end