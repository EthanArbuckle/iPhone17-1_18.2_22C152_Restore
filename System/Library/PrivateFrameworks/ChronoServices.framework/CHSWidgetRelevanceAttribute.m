@interface CHSWidgetRelevanceAttribute
+ (BOOL)supportsSecureCoding;
- (CHSWidgetRelevanceAttribute)init;
- (id)_init;
@end

@implementation CHSWidgetRelevanceAttribute

- (CHSWidgetRelevanceAttribute)init
{
  int v3 = [(CHSWidgetRelevanceAttribute *)self isMemberOfClass:objc_opt_class()];
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  if (v3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"CHSWidgetRelevanceAttribute cannot be initialized directly with -init, initialize a subclass instead." format];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"%@ cannot be initialized directly with -init, use the designated initializer instead.", v7 format];
  }
  return (CHSWidgetRelevanceAttribute *)[(CHSWidgetRelevanceAttribute *)self _init];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetRelevanceAttribute;
  return [(CHSWidgetRelevanceAttribute *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end