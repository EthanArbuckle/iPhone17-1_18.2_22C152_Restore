@interface INRelevanceProvider
+ (BOOL)supportsSecureCoding;
- (INRelevanceProvider)init;
- (INRelevanceProvider)initWithCoder:(id)a3;
- (id)_init;
@end

@implementation INRelevanceProvider

- (INRelevanceProvider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRelevanceProvider;
  return [(INRelevanceProvider *)&v4 init];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)INRelevanceProvider;
  return [(INRelevanceProvider *)&v3 init];
}

- (INRelevanceProvider)init
{
  int v3 = [(INRelevanceProvider *)self isMemberOfClass:objc_opt_class()];
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  if (v3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"INRelevanceProvider cannot be initialized directly with -init, initialize a subclass instead." format];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v4 raise:v5, @"%@ cannot be initialized directly with -init, use the designated initializer instead.", v7 format];
  }

  return (INRelevanceProvider *)[(INRelevanceProvider *)self _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end