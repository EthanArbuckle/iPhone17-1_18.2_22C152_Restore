@interface NSInflectionRule
+ (BOOL)canInflectLanguage:(NSString *)language;
+ (BOOL)canInflectPreferredLocalization;
+ (BOOL)supportsSecureCoding;
+ (NSInflectionRule)automaticRule;
- (NSInflectionRule)initWithCoder:(id)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSInflectionRule

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSInflectionRule;
  return [(NSInflectionRule *)&v3 init];
}

+ (NSInflectionRule)automaticRule
{
  if (qword_1EB1EC790 != -1) {
    dispatch_once(&qword_1EB1EC790, &__block_literal_global_61);
  }
  return (NSInflectionRule *)_MergedGlobals_3_0;
}

id __33__NSInflectionRule_automaticRule__block_invoke()
{
  id result = [[_NSInflectionRuleAutomatic alloc] _init];
  _MergedGlobals_3_0 = (uint64_t)result;
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

- (NSInflectionRule)initWithCoder:(id)a3
{
  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

+ (BOOL)supportsSecureCoding
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v4);
}

+ (BOOL)canInflectPreferredLocalization
{
  id v3 = [(NSArray *)[+[NSBundle mainBundle] preferredLocalizations] firstObject];
  if (v3)
  {
    LOBYTE(v3) = [a1 canInflectLanguage:v3];
  }
  return (char)v3;
}

+ (BOOL)canInflectLanguage:(NSString *)language
{
  BOOL v4 = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  if (v4)
  {
    LOBYTE(v4) = _NSRequiresMorphunInflectionForLanguageIdentifier(language);
  }
  return v4;
}

@end