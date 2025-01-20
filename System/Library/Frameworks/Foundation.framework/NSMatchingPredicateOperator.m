@interface NSMatchingPredicateOperator
- (BOOL)_shouldEscapeForLike;
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (NSMatchingPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5;
- (SEL)selector;
- (id)symbol;
- (void)_clearContext;
- (void)dealloc;
@end

@implementation NSMatchingPredicateOperator

- (NSMatchingPredicateOperator)initWithOperatorType:(unint64_t)a3 modifier:(unint64_t)a4 variant:(unint64_t)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSMatchingPredicateOperator;
  result = [(NSStringPredicateOperator *)&v6 initWithOperatorType:a3 modifier:a4 variant:a5];
  if (result) {
    result->_regexContext = 0;
  }
  return result;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL v4 = 0;
  if (!a3 || !a4) {
    return v4;
  }
  if ([&stru_1ECA5C228 isEqual:a4]) {
    return 0;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = +[NSString stringWithFormat:@"Can't create a regex expression from object %@.", a4];
    goto LABEL_16;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = +[NSString stringWithFormat:@"Can't do regex matching on object %@.", a3];
LABEL_16:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
  }
  OSSpinLockLock(&self->_contextLock);
  regexContext = self->_regexContext;
  if (regexContext)
  {
    if (regexContext->var0 && ([regexContext->var0 isEqual:a4] & 1) == 0) {
      [(NSMatchingPredicateOperator *)self _clearContext];
    }
  }
  else
  {
    v9 = ($1CE8F269E3F9829EF91048F8D16FEC75 *)malloc_type_calloc(1uLL, 0x18uLL, 0x1080040CC6EE3FDuLL);
    self->_regexContext = v9;
    v9->var0 = 0;
    v9->var1 = 0;
  }
  BOOL v4 = +[_NSPredicateOperatorUtilities doRegexForString:a3 pattern:a4 likeProtect:[(NSMatchingPredicateOperator *)self _shouldEscapeForLike] flags:[(NSStringPredicateOperator *)self flags] context:self->_regexContext];
  OSSpinLockUnlock(&self->_contextLock);
  return v4;
}

- (BOOL)_shouldEscapeForLike
{
  return 0;
}

- (void)_clearContext
{
  regexContext = self->_regexContext;
  var1 = (URegularExpression *)regexContext->var1;
  if (var1)
  {
    uregex_close(var1);
    self->_regexContext->var1 = 0;
    regexContext = self->_regexContext;
  }
  if (regexContext->var0)
  {
    CFRelease(regexContext->var0);
    self->_regexContext->var0 = 0;
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (self->_regexContext)
  {
    [(NSMatchingPredicateOperator *)self _clearContext];
    free(self->_regexContext);
    self->_regexContext = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NSMatchingPredicateOperator;
  [(NSMatchingPredicateOperator *)&v3 dealloc];
}

- (id)symbol
{
  id v2 = [(NSStringPredicateOperator *)self _modifierString];

  return (id)[@"MATCHES" stringByAppendingString:v2];
}

- (SEL)selector
{
  return sel_matches_;
}

@end