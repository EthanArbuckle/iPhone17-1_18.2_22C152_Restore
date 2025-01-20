@interface BSSimpleAssertion
- (BOOL)isValid;
- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5;
- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6;
- (NSString)description;
- (NSString)identifier;
- (NSString)reason;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BSSimpleAssertion

- (void)invalidate
{
  queue = self->_queue;
  if (queue) {
    BSDispatchQueueAssert(queue);
  }
  if ([(BSAtomicSignal *)self->_invalidated signal])
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    id invalidationBlock = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSSimpleAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidated, 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v3 = [(BSSimpleAssertion *)self succinctDescriptionBuilder];
  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled") ^ 1, @"valid");
  return v3;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(BSAtomicSignal *)self->_invalidated hasBeenSignalled])
  {
    id v4 = [NSString stringWithFormat:@"Client code must invalidate <%@:%p> (%@: %@) before dealloc", objc_opt_class(), self, self->_identifier, self->_reason];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"BSSimpleAssertion.m";
      __int16 v17 = 1024;
      int v18 = 57;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v4 UTF8String];
    __break(0);
    JUMPOUT(0x18AACD110);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSSimpleAssertion;
  [(BSSimpleAssertion *)&v8 dealloc];
}

- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 27, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_10:
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 29, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 28, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_11:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 30, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];

LABEL_5:
  v29.receiver = self;
  v29.super_class = (Class)BSSimpleAssertion;
  __int16 v15 = [(BSSimpleAssertion *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    reason = v15->_reason;
    v15->_reason = (NSString *)v18;

    uint64_t v20 = objc_opt_new();
    invalidated = v15->_invalidated;
    v15->_invalidated = (BSAtomicSignal *)v20;

    objc_storeStrong((id *)&v15->_queue, a5);
    uint64_t v22 = [v14 copy];
    id invalidationBlock = v15->_invalidationBlock;
    v15->_id invalidationBlock = (id)v22;
  }
  return v15;
}

- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 44, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 43, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"BSSimpleAssertion.m", 45, @"Invalid parameter not satisfying: %@", @"invalidationBlock" object file lineNumber description];

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)BSSimpleAssertion;
  id v12 = [(BSSimpleAssertion *)&v25 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    uint64_t v17 = objc_opt_new();
    invalidated = v12->_invalidated;
    v12->_invalidated = (BSAtomicSignal *)v17;

    uint64_t v19 = [v11 copy];
    id invalidationBlock = v12->_invalidationBlock;
    v12->_id invalidationBlock = (id)v19;
  }
  return v12;
}

- (NSString)description
{
  return (NSString *)[(BSSimpleAssertion *)self descriptionWithMultilinePrefix:0];
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isValid
{
  return ![(BSAtomicSignal *)self->_invalidated hasBeenSignalled];
}

- (id)succinctDescription
{
  v2 = [(BSSimpleAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end