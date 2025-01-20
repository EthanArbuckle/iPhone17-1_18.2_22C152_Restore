@interface NSBlockPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (NSBlockPredicate)initWithBlock:(id)a3;
- (NSBlockPredicate)initWithCoder:(id)a3;
- (NSBlockPredicate)predicateWithSubstitutionVariables:(id)a3;
- (id)_predicateBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)predicateFormat;
- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBlockPredicate

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(NSPredicate *)self _allowsEvaluation]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This predicate has evaluation disabled" userInfo:0]);
  }
  v7 = (void *)MEMORY[0x185308110]();
  if (!a4 || (v13 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v14 = (objc_class *)objc_opt_class();
    v13 = (id *)&v17;
    object_setClass(&v17, v14);
    *(void *)&long long v18 = a4;
  }
  char v15 = (*((uint64_t (**)(id, id, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void))self->_block
         + 2))(self->_block, a3, a4, v8, v9, v10, v11, v12, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1));
  if (v13 != a4) {

  }
  return v15;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBlockPredicate;
  [(NSBlockPredicate *)&v3 dealloc];
}

- (NSBlockPredicate)initWithBlock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSBlockPredicate;
  uint64_t v4 = [(NSBlockPredicate *)&v6 init];
  if (v4) {
    v4->_block = (id)[a3 copy];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSBlockPredicate)initWithCoder:(id)a3
{
  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSBlockPredicate cannot be encoded or decoded" userInfo:0]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id block = self->_block;

  return (id)[v4 initWithBlock:block];
}

- (id)predicateFormat
{
  return +[NSString stringWithFormat:@"BLOCKPREDICATE(%p)", self->_block];
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
}

- (NSBlockPredicate)predicateWithSubstitutionVariables:(id)a3
{
  objc_super v3 = (void *)[(NSBlockPredicate *)self copy];

  return (NSBlockPredicate *)v3;
}

- (id)_predicateBlock
{
  return self->_block;
}

@end