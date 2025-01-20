@interface LNRelevantContext
+ (BOOL)supportsSecureCoding;
- (LNRelevantContext)init;
- (LNRelevantContext)initWithCoder:(id)a3;
- (LNRelevantContext)initWithPriority:(int64_t)a3;
- (NSArray)conditions;
- (NSString)analyticsDescription;
- (id)_init;
- (id)asCondition;
- (int64_t)priority;
@end

@implementation LNRelevantContext

- (int64_t)priority
{
  return self->_priority;
}

- (id)asCondition
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = NSStringFromSelector(a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v2 raise:v3, @"Invoking %@ on abstract base class %@", v4, v6 format];

  return 0;
}

- (NSString)analyticsDescription
{
  return (NSString *)@"<anonymous context>";
}

- (LNRelevantContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LNRelevantContext;
  return [(LNRelevantContext *)&v4 init];
}

- (LNRelevantContext)initWithPriority:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNRelevantContext;
  result = [(LNRelevantContext *)&v6 init];
  if (result)
  {
    int64_t v5 = 2;
    if ((unint64_t)(a3 - 1) < 2) {
      int64_t v5 = a3;
    }
    result->_priority = v5;
  }
  return result;
}

- (id)_init
{
  return [(LNRelevantContext *)self initWithPriority:2];
}

- (LNRelevantContext)init
{
  int v3 = [(LNRelevantContext *)self isMemberOfClass:objc_opt_class()];
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  if (v3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"LNRelevantContext cannot be initialized directly with -init, initialize a subclass instead." format];
  }
  else
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"%@ cannot be initialized directly with -init, use the designated initializer instead.", v7 format];
  }
  return (LNRelevantContext *)[(LNRelevantContext *)self _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)conditions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(LNRelevantContext *)self asCondition];
  v5[0] = v2;
  int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

@end