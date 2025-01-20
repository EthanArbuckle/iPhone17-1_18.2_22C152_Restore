@interface HFEventBuilder
+ (id)eventBuilderForEvent:(id)a3;
- (HFEventBuilder)init;
- (HFEventBuilder)initWithEvent:(id)a3;
- (NSString)eventType;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (unint64_t)hash;
@end

@implementation HFEventBuilder

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v5 = [[HFComparisonResult alloc] initWithObjectA:self objectB:v4];

  return v5;
}

+ (id)eventBuilderForEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (id v4 = (objc_class *)objc_opt_class()) == 0)
  {
    v5 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "No HFEventBuilder can handle the event: %@", (uint8_t *)&v8, 0xCu);
    }

    id v4 = 0;
  }
  v6 = (void *)[[v4 alloc] initWithEvent:v3];

  return v6;
}

- (HFEventBuilder)init
{
  return [(HFEventBuilder *)self initWithEvent:0];
}

- (HFEventBuilder)initWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HFEventBuilder;
  return [(HFEventBuilder *)&v4 init];
}

- (id)buildNewEventsFromCurrentState
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFEventBuilder.m", 68, @"%s is an abstract method that must be overriden by subclass %@", "-[HFEventBuilder buildNewEventsFromCurrentState]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"HFEventBuilder.m", 74, @"%s is an abstract method that must be overriden by subclass %@", "-[HFEventBuilder naturalLanguageNameWithOptions:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)comparisonKey
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
}

@end