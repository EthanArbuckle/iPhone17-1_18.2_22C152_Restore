@interface NSPredicate
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateWithBlock:(void *)block;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat argumentArray:(NSArray *)arguments;
+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList;
+ (NSPredicate)predicateWithValue:(BOOL)value;
+ (__CFLocale)retainedLocale;
+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4;
+ (void)initialize;
- (BOOL)_allowsEvaluation;
- (BOOL)evaluateWithObject:(id)object;
- (BOOL)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings;
- (NSPredicate)initWithCoder:(id)a3;
- (NSPredicate)predicateWithSubstitutionVariables:(NSDictionary *)variables;
- (NSString)predicateFormat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)generateMetadataDescription;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)allowEvaluation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSPredicate

- (BOOL)_allowsEvaluation
{
  return (*(unsigned char *)&self->_predicateFlags & 1) == 0;
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat
{
  va_start(va, predicateFormat);
  return (NSPredicate *)objc_msgSend(a1, "predicateWithFormat:arguments:", predicateFormat, va, va);
}

- (BOOL)evaluateWithObject:(id)object
{
  return [(NSPredicate *)self evaluateWithObject:object substitutionVariables:0];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be encoded by non-keyed archivers" userInfo:0]);
  }
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat arguments:(va_list)argList
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = argList;
  v5 = (void *)MEMORY[0x185308110](a1, a2);
  [(id)_qfqp_GlobalLock lock];
  v6 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, 0, v9);
  [(id)_qfqp_GlobalLock unlock];
  v7 = v6;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_exception_throw(v6);
    }
  }
  return v6;
}

- (void)allowEvaluation
{
  *(_DWORD *)&self->_predicateFlags &= ~1u;
}

- (NSPredicate)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPredicates and NSExpressions cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  v5 = [(NSPredicate *)self init];
  if (v5 && [a3 requiresSecureCoding]) {
    *(_DWORD *)&v5->_predicateFlags |= 1u;
  }
  return v5;
}

+ (void)initialize
{
  if (!_qfqp_GlobalLock)
  {
    _qfqp_GlobalLock = objc_alloc_init(NSRecursiveLock);
    _qfqp2_InitializedGlobalData();
  }
}

+ (NSPredicate)predicateWithValue:(BOOL)value
{
  v3 = &off_1E51F4378;
  if (!value) {
    v3 = off_1E51F3C98;
  }
  id v4 = objc_alloc_init(*v3);

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateWithFormat:(NSString *)predicateFormat argumentArray:(NSArray *)arguments
{
  v6 = (void *)MEMORY[0x185308110](a1, a2);
  [(id)_qfqp_GlobalLock lock];
  v7 = (NSPredicate *)_qfqp2_performParsing(predicateFormat, arguments, 0);
  [(id)_qfqp_GlobalLock unlock];
  v8 = v7;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_exception_throw(v7);
    }
  }
  return v7;
}

+ (NSPredicate)predicateWithBlock:(void *)block
{
  v3 = [[NSBlockPredicate alloc] initWithBlock:block];

  return (NSPredicate *)v3;
}

- (id)generateMetadataDescription
{
  v2 = +[NSString stringWithFormat:@"Unknown kind of NSPredicate given to NSMetadataQuery (%@)", self];
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v2 userInfo:0]);
}

+ (id)newStringFrom:(id)a3 usingUnicodeTransforms:(unint64_t)a4
{
  return +[_NSPredicateOperatorUtilities newStringFrom:a3 usingUnicodeTransforms:a4];
}

+ (__CFLocale)retainedLocale
{
  return +[_NSPredicateOperatorUtilities retainedLocale];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)evaluateWithObject:(id)object substitutionVariables:(NSDictionary *)bindings
{
  v6 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  v6 = NSClassFromString((NSString *)@"NSPredicate");

  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (NSPredicate)predicateWithSubstitutionVariables:(NSDictionary *)variables
{
  if (!variables) {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Cannot substitute a nil substitution dictionary.", 0, v3, v4));
  }
  return self;
}

- (NSString)predicateFormat
{
  uint64_t v4 = NSClassFromString((NSString *)@"NSPredicate");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

@end