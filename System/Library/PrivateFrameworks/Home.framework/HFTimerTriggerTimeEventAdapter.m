@interface HFTimerTriggerTimeEventAdapter
+ (id)adapterWithEventBuilder:(id)a3;
- (HFTimeEventBuilder)eventBuilder;
- (HFTimerTriggerTimeEventAdapter)init;
- (HFTimerTriggerTimeEventAdapter)initWithEventBuilder:(id)a3;
- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5;
- (id)updateTrigger:(id)a3;
- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5;
@end

@implementation HFTimerTriggerTimeEventAdapter

+ (id)adapterWithEventBuilder:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = HFTimerTriggerSignificantTimeEventAdapter;
LABEL_5:
    v5 = (void *)[[v4 alloc] initWithEventBuilder:v3];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = HFTimerTriggerCalendarEventAdapter;
    goto LABEL_5;
  }
  NSLog(&cfstr_UnexpectedEven_1.isa, v3);
  v5 = 0;
LABEL_7:

  return v5;
}

- (HFTimerTriggerTimeEventAdapter)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithEventBuilder_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTimerTriggerTimeEventAdapter.m", 31, @"%s is unavailable; use %@ instead",
    "-[HFTimerTriggerTimeEventAdapter init]",
    v5);

  return 0;
}

- (HFTimerTriggerTimeEventAdapter)initWithEventBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFTimerTriggerTimeEventAdapter;
  v6 = [(HFTimerTriggerTimeEventAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_eventBuilder, a3);
  }

  return v7;
}

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2, self, @"HFTimerTriggerTimeEventAdapter.m", 44, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTimerTriggerTimeEventAdapter createTriggerWithName:timeZone:recurrences:]", objc_opt_class() object file lineNumber description];

  v8 = (void *)MEMORY[0x263F58190];
  objc_super v9 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
  v10 = [v8 futureWithError:v9];

  return v10;
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2, self, @"HFTimerTriggerTimeEventAdapter.m", 50, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTimerTriggerTimeEventAdapter updateTriggerBuilder:recurrences:inHome:]", objc_opt_class() object file lineNumber description];
}

- (id)updateTrigger:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFTimerTriggerTimeEventAdapter.m", 55, @"%s is an abstract method that must be overriden by subclass %@", "-[HFTimerTriggerTimeEventAdapter updateTrigger:]", objc_opt_class() object file lineNumber description];

  v6 = (void *)MEMORY[0x263F58190];
  id v7 = objc_msgSend(MEMORY[0x263F087E8], "na_genericError");
  v8 = [v6 futureWithError:v7];

  return v8;
}

- (HFTimeEventBuilder)eventBuilder
{
  return self->_eventBuilder;
}

- (void).cxx_destruct
{
}

@end