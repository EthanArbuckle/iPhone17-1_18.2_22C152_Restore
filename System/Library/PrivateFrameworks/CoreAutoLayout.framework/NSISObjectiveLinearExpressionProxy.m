@interface NSISObjectiveLinearExpressionProxy
- (BOOL)restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(id *)a3;
- (NSISObjectiveLinearExpressionProxy)initWithEngine:(id)a3;
- (unint64_t)variableCount;
- (void)addVar:(id)a3 priority:(double)a4 times:(double)a5;
- (void)removeVar:(id)a3;
- (void)replaceVar:(id)a3 withExpression:(id *)a4 processVarNewToReceiver:(id)a5 processVarDroppedFromReceiver:(id)a6;
@end

@implementation NSISObjectiveLinearExpressionProxy

- (NSISObjectiveLinearExpressionProxy)initWithEngine:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSISObjectiveLinearExpressionProxy;
  v4 = [(NSISObjectiveLinearExpressionProxy *)&v6 init];
  if (v4) {
    v4->_expression = (NSISObjectiveLinearExpression *)-[NSISObjectiveLinearExpression initWithEngine:]([NSISObjectiveLinearExpression alloc], (uint64_t)a3);
  }
  return v4;
}

- (void)addVar:(id)a3 priority:(double)a4 times:(double)a5
{
}

- (void)removeVar:(id)a3
{
}

- (void)replaceVar:(id)a3 withExpression:(id *)a4 processVarNewToReceiver:(id)a5 processVarDroppedFromReceiver:(id)a6
{
}

- (BOOL)restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:(id *)a3
{
  return -[NSISObjectiveLinearExpression restrictedVarWithCoefficientOfLargestNegativeMagnitudeOutVar:]((uint64_t)self->_expression, a3);
}

- (unint64_t)variableCount
{
  return -[NSISObjectiveLinearExpression variableCount]((uint64_t)self->_expression);
}

@end