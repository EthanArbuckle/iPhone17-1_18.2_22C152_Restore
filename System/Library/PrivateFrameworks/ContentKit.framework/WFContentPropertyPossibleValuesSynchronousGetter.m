@interface WFContentPropertyPossibleValuesSynchronousGetter
- (BOOL)isAsynchronous;
- (NSString)description;
- (WFContentPropertyPossibleValuesSynchronousGetter)initWithSynchronousGetter:(id)a3;
- (void)getValuesWithCompletionBlock:(id)a3;
@end

@implementation WFContentPropertyPossibleValuesSynchronousGetter

- (void).cxx_destruct
{
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _Block_copy(self->_getter);
  v7 = [v3 stringWithFormat:@"<%@ %p> synchronous getter with block %@", v5, self, v6];

  return (NSString *)v7;
}

- (void)getValuesWithCompletionBlock:(id)a3
{
  getter = self->_getter;
  v5 = (void (*)(void *))getter[2];
  id v6 = a3;
  v5(getter);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v6, v7);
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (WFContentPropertyPossibleValuesSynchronousGetter)initWithSynchronousGetter:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPropertyPossibleValuesSynchronousGetter;
  v5 = [(WFContentPropertyPossibleValuesSynchronousGetter *)&v10 init];
  if (v5)
  {
    id v6 = _Block_copy(v4);
    id getter = v5->_getter;
    v5->_id getter = v6;

    v8 = v5;
  }

  return v5;
}

@end