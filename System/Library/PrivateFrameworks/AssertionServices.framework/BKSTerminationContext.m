@interface BKSTerminationContext
+ (id)context;
+ (id)terminationAssertionContext;
- (BOOL)_isEqualToTerminationContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)explanation;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)exceptionCode;
- (void)setExceptionCode:(int64_t)a3;
- (void)setExplanation:(id)a3;
@end

@implementation BKSTerminationContext

+ (id)terminationAssertionContext
{
  v2 = objc_alloc_init(BKSTerminationContext);
  [(BKSTerminationContext *)v2 setExplanation:@"Termination assertion"];
  [(BKSTerminationContext *)v2 setExceptionCode:3735905538];
  return v2;
}

+ (id)context
{
  v2 = objc_alloc_init(BKSTerminationContext);
  return v2;
}

- (BOOL)_isEqualToTerminationContext:(id)a3
{
  id v4 = a3;
  int64_t exceptionCode = self->_exceptionCode;
  if (exceptionCode == [v4 exceptionCode])
  {
    explanation = self->_explanation;
    v7 = [v4 explanation];
    BOOL v8 = [(NSString *)explanation isEqualToString:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(BKSTerminationContext *)self _isEqualToTerminationContext:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[BKSTerminationContext allocWithZone:a3] init];
  [(BKSTerminationContext *)v4 setExceptionCode:self->_exceptionCode];
  [(BKSTerminationContext *)v4 setExplanation:self->_explanation];
  return v4;
}

- (int64_t)exceptionCode
{
  return self->_exceptionCode;
}

- (void)setExceptionCode:(int64_t)a3
{
  self->_int64_t exceptionCode = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end