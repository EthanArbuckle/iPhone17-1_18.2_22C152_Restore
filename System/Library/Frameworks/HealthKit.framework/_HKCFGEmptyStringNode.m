@interface _HKCFGEmptyStringNode
+ (id)nodeWithEvaluator:(id)a3;
- (id)evaluate;
@end

@implementation _HKCFGEmptyStringNode

+ (id)nodeWithEvaluator:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", 0, 0);
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)evaluate
{
  return (id)(*((uint64_t (**)(void))self->_evaluator + 2))();
}

- (void).cxx_destruct
{
}

@end