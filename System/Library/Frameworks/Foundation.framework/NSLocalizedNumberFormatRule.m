@interface NSLocalizedNumberFormatRule
+ (BOOL)supportsSecureCoding;
+ (id)automatic;
- (NSLocalizedNumberFormatRule)initWithCoder:(id)a3;
- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSLocalizedNumberFormatRule

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSLocalizedNumberFormatRule;
  return [(NSLocalizedNumberFormatRule *)&v3 init];
}

+ (id)automatic
{
  if (_MergedGlobals_134 != -1) {
    dispatch_once(&_MergedGlobals_134, &__block_literal_global_60);
  }
  return (id)qword_1EB1ED988;
}

id __40__NSLocalizedNumberFormatRule_automatic__block_invoke()
{
  id result = [[_NSLocalizedNumberFormatRuleAutomatic alloc] _init];
  qword_1EB1ED988 = (uint64_t)result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSLocalizedNumberFormatRule)initWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v4);
}

- (id)_formattedString:(id)a3 withStringLocale:(id)a4 andDisplayLocale:(id)a5
{
  v7 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

@end