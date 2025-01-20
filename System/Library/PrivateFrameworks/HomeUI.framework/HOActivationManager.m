@interface HOActivationManager
+ (id)sharedInstance;
- (HOActivationManager)init;
- (NSDate)lastEnteredForegroundDate;
- (void)_enteredForeground:(id)a3;
- (void)setLastEnteredForegroundDate:(id)a3;
@end

@implementation HOActivationManager

+ (id)sharedInstance
{
  if (_MergedGlobals_628 != -1) {
    dispatch_once(&_MergedGlobals_628, &__block_literal_global_3_2);
  }
  v2 = (void *)qword_1EBA478C0;

  return v2;
}

void __37__HOActivationManager_sharedInstance__block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EBA478C0;
  qword_1EBA478C0 = v0;
}

- (HOActivationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HOActivationManager;
  v2 = [(HOActivationManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [(HOActivationManager *)v2 setLastEnteredForegroundDate:v3];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__enteredForeground_ name:*MEMORY[0x1E4F43708] object:0];
  }
  return v2;
}

- (void)_enteredForeground:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(HOActivationManager *)self setLastEnteredForegroundDate:v4];
}

- (NSDate)lastEnteredForegroundDate
{
  return self->_lastEnteredForegroundDate;
}

- (void)setLastEnteredForegroundDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end