@interface IECondition
- (BOOL)value;
- (NSArray)children;
- (NSString)conditionId;
- (NSString)expression;
- (void)setChildren:(id)a3;
- (void)setConditionId:(id)a3;
- (void)setExpression:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation IECondition

- (NSString)conditionId
{
  return self->_conditionId;
}

- (void)setConditionId:(id)a3
{
}

- (NSString)expression
{
  return self->_expression;
}

- (void)setExpression:(id)a3
{
}

- (BOOL)value
{
  return self->_value;
}

- (void)setValue:(BOOL)a3
{
  self->_value = a3;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_expression, 0);

  objc_storeStrong((id *)&self->_conditionId, 0);
}

@end