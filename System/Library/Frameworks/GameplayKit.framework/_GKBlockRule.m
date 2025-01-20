@interface _GKBlockRule
- (BOOL)evaluatePredicateWithSystem:(id)a3;
- (_GKBlockRule)initWithPredicate:(id)a3 action:(id)a4;
- (void)performActionWithSystem:(id)a3;
@end

@implementation _GKBlockRule

- (_GKBlockRule)initWithPredicate:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GKBlockRule;
  v8 = [(_GKBlockRule *)&v14 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x237DF8110](v6);
    id predicate = v8->_predicate;
    v8->_id predicate = (id)v9;

    uint64_t v11 = MEMORY[0x237DF8110](v7);
    id action = v8->_action;
    v8->_id action = (id)v11;
  }
  return v8;
}

- (BOOL)evaluatePredicateWithSystem:(id)a3
{
  id predicate = (uint64_t (**)(id, id))self->_predicate;
  if (predicate) {
    LOBYTE(predicate) = predicate[2](predicate, a3);
  }
  return (char)predicate;
}

- (void)performActionWithSystem:(id)a3
{
  id action = (void (**)(id, id))self->_action;
  if (action) {
    action[2](action, a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong(&self->_predicate, 0);
}

@end