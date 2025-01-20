@interface _HKCFGExpression
- (BOOL)isPrivate;
- (id)_label;
- (unint64_t)_minimumLength;
- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4;
- (void)setIsPrivate:(BOOL)a3;
@end

@implementation _HKCFGExpression

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void)setIsPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (void)_tryNodesWithContext:(id)a3 solutionTest:(id)a4
{
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

- (id)_label
{
  return 0;
}

- (unint64_t)_minimumLength
{
  return 0;
}

@end