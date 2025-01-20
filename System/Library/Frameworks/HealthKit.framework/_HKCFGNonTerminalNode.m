@interface _HKCFGNonTerminalNode
+ (id)nodeWithChildren:(id)a3 rule:(id)a4 rangeOfString:(_NSRange)a5;
- (_HKCFGReplacementRule)rule;
- (id)evaluate;
@end

@implementation _HKCFGNonTerminalNode

+ (id)nodeWithChildren:(id)a3 rule:(id)a4 rangeOfString:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", location, length);
  uint64_t v12 = [v10 copy];

  v13 = (void *)v11[3];
  v11[3] = v12;

  v14 = (void *)v11[5];
  v11[5] = v9;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_nodes, 0);
}

- (id)evaluate
{
  id value = self->_value;
  if (!value)
  {
    v4 = [(_HKCFGReplacementRule *)self->_rule nodeEvaluator];
    v5 = ((void (**)(void, NSArray *))v4)[2](v4, self->_nodes);
    id v6 = self->_value;
    self->_id value = v5;

    id value = self->_value;
  }

  return value;
}

- (_HKCFGReplacementRule)rule
{
  return self->_rule;
}

@end