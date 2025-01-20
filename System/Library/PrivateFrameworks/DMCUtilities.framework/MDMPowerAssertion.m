@interface MDMPowerAssertion
+ (id)_currentAssertions;
+ (id)_dateFormatter;
+ (id)assertionDescriptions;
- (MDMPowerAssertion)initWithReason:(id)a3;
- (NSDate)creationDate;
- (UMUserSwitchBlockingTask)blockingTask;
- (id)description;
- (void)dealloc;
- (void)setBlockingTask:(id)a3;
@end

@implementation MDMPowerAssertion

- (MDMPowerAssertion)initWithReason:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MDMPowerAssertion;
  v5 = [(DMCPowerAssertion *)&v16 initWithReason:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    if (+[DMCMultiUserModeUtilities isSharediPad])
    {
      uint64_t v8 = [DMCUMUserSwitchBlockingTaskClass() taskWithName:@"MDMBlockingTask" reason:v4];
      blockingTask = v5->_blockingTask;
      v5->_blockingTask = (UMUserSwitchBlockingTask *)v8;

      [(UMUserSwitchBlockingTask *)v5->_blockingTask begin];
    }
    else
    {
      v10 = DMCLogObjects()[2];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v4;
        _os_log_impl(&dword_1A7863000, v10, OS_LOG_TYPE_DEFAULT, "Starting MDM power assertion with reason: %{public}@", buf, 0xCu);
      }
    }
  }
  v11 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MDMPowerAssertion_initWithReason___block_invoke;
  block[3] = &unk_1E5CFD920;
  v12 = v5;
  v15 = v12;
  dispatch_sync(v11, block);

  return v12;
}

void __36__MDMPowerAssertion_initWithReason___block_invoke(uint64_t a1)
{
  id v2 = +[MDMPowerAssertion _currentAssertions];
  [v2 addPointer:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[DMCMultiUserModeUtilities isSharediPad])
  {
    [(UMUserSwitchBlockingTask *)self->_blockingTask end];
  }
  else
  {
    v3 = DMCLogObjects()[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      v5 = [(DMCProcessAssertion *)self reason];
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_impl(&dword_1A7863000, v4, OS_LOG_TYPE_DEFAULT, "Ending MDM power assertion with reason: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v6 = _assertionQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MDMPowerAssertion_dealloc__block_invoke;
  block[3] = &unk_1E5CFD920;
  void block[4] = self;
  dispatch_sync(v6, block);

  v7.receiver = self;
  v7.super_class = (Class)MDMPowerAssertion;
  [(DMCPowerAssertion *)&v7 dealloc];
}

void __28__MDMPowerAssertion_dealloc__block_invoke(uint64_t a1)
{
  id v7 = +[MDMPowerAssertion _currentAssertions];
  uint64_t v2 = [v7 count];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [v7 pointerAtIndex:v4];
      uint64_t v6 = v5;
      if (v5 == *(void **)(a1 + 32)) {
        break;
      }

      if (v3 == ++v4) {
        goto LABEL_7;
      }
    }
    [v7 removePointerAtIndex:v4];
  }
LABEL_7:
}

+ (id)assertionDescriptions
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = _assertionQueue();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __42__MDMPowerAssertion_assertionDescriptions__block_invoke;
  uint64_t v11 = &unk_1E5CFE078;
  id v12 = v3;
  id v13 = a1;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return v6;
}

void __42__MDMPowerAssertion_assertionDescriptions__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_currentAssertions", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (v7)
        {
          uint64_t v8 = *(void **)(a1 + 32);
          uint64_t v9 = [v7 description];
          [v8 addObject:v9];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v3 _dateFormatter];
  uint64_t v5 = [(MDMPowerAssertion *)self creationDate];
  uint64_t v6 = [v4 stringFromDate:v5];

  id v7 = NSString;
  uint64_t v8 = [(DMCProcessAssertion *)self reason];
  uint64_t v9 = [v7 stringWithFormat:@"<%@: %p {\n\tReason  : %@\n\tCreated : %@\n}>", v3, self, v8, v6];

  return v9;
}

+ (id)_currentAssertions
{
  if (_currentAssertions_onceToken != -1) {
    dispatch_once(&_currentAssertions_onceToken, &__block_literal_global_50_0);
  }
  uint64_t v2 = (void *)_currentAssertions_currentAssertions;
  return v2;
}

uint64_t __39__MDMPowerAssertion__currentAssertions__block_invoke()
{
  _currentAssertions_currentAssertions = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  return MEMORY[0x1F41817F8]();
}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_53);
  }
  uint64_t v2 = (void *)_dateFormatter_dateFormatter;
  return v2;
}

uint64_t __35__MDMPowerAssertion__dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_dateFormatter_dateFormatter;
  _dateFormatter_dateFormatter = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(id)_dateFormatter_dateFormatter setLocale:v2];

  uint64_t v3 = (void *)_dateFormatter_dateFormatter;
  return [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSZZZ"];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (UMUserSwitchBlockingTask)blockingTask
{
  return self->_blockingTask;
}

- (void)setBlockingTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingTask, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end