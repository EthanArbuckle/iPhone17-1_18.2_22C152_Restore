@interface HFAnalytics
+ (Class)eventClassForEventType:(unint64_t)a3;
+ (id)eventNameForEventType:(unint64_t)a3;
+ (void)_sendEvent:(id)a3;
+ (void)sendEvent:(unint64_t)a3;
+ (void)sendEvent:(unint64_t)a3 withData:(id)a4;
@end

@implementation HFAnalytics

uint64_t __26__HFAnalytics__sendEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) payload];
}

+ (void)sendEvent:(unint64_t)a3 withData:(id)a4
{
  id v8 = a4;
  v6 = (objc_class *)[a1 eventClassForEventType:a3];
  if (v6)
  {
    v7 = (void *)[[v6 alloc] initWithData:v8];
    [a1 _sendEvent:v7];
  }
}

+ (Class)eventClassForEventType:(unint64_t)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HFAnalytics_eventClassForEventType___block_invoke;
  v7[3] = &__block_descriptor_40_e5__8__0l_0;
  v7[4] = a3;
  v3 = __38__HFAnalytics_eventClassForEventType___block_invoke(v7);
  if ([v3 isSubclassOfClass:objc_opt_class()])
  {
    v4 = v3;
  }
  else
  {
    v5 = NSStringFromClass((Class)v3);
    NSLog(&cfstr_InvalidAnalyti.isa, v5);

    v4 = 0;
  }
  return (Class)v4;
}

void *__38__HFAnalytics_eventClassForEventType___block_invoke(void *a1)
{
  if (a1[4] <= 0x39uLL)
  {
    a1 = objc_opt_class();
  }
  return a1;
}

+ (void)_sendEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = HFLogForCategory(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Sending analytics event: %@", buf, 0xCu);
  }

  v5 = [v3 name];
  v7 = v3;
  id v6 = v3;
  AnalyticsSendEventLazy();
}

+ (id)eventNameForEventType:(unint64_t)a3
{
  if (a3 - 1 > 0x38) {
    return @"com.apple.Home.AppForegroundDuration";
  }
  else {
    return off_264099A58[a3 - 1];
  }
}

+ (void)sendEvent:(unint64_t)a3
{
}

@end