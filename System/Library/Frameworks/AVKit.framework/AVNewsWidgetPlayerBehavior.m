@interface AVNewsWidgetPlayerBehavior
+ (Class)behaviorContextClass;
- (AVNewsWidgetPlayerBehavior)init;
- (AVNewsWidgetPlayerBehaviorContext)behaviorContext;
- (id)playerForContentTransitionType:(int64_t)a3;
- (void)dealloc;
- (void)setBehaviorContext:(id)a3;
@end

@implementation AVNewsWidgetPlayerBehavior

- (void).cxx_destruct
{
}

- (void)setBehaviorContext:(id)a3
{
}

- (AVNewsWidgetPlayerBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVNewsWidgetPlayerBehaviorContext *)WeakRetained;
}

- (id)playerForContentTransitionType:(int64_t)a3
{
  return 0;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "-[AVNewsWidgetPlayerBehavior dealloc]";
    __int16 v7 = 1024;
    int v8 = 40;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVNewsWidgetPlayerBehavior;
  [(AVNewsWidgetPlayerBehavior *)&v4 dealloc];
}

- (AVNewsWidgetPlayerBehavior)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)AVNewsWidgetPlayerBehavior;
  v2 = [(AVNewsWidgetPlayerBehavior *)&v7 init];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 136315394;
    __int16 v9 = "-[AVNewsWidgetPlayerBehavior init]";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s subclass: %@", buf, 0x16u);
  }
  return v2;
}

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

@end