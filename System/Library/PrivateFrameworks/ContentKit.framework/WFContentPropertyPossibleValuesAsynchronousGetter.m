@interface WFContentPropertyPossibleValuesAsynchronousGetter
- (BOOL)isAsynchronous;
- (NSString)description;
- (WFContentPropertyPossibleValuesAsynchronousGetter)initWithAsynchronousGetter:(id)a3;
- (void)getValuesWithCompletionBlock:(id)a3;
@end

@implementation WFContentPropertyPossibleValuesAsynchronousGetter

- (void).cxx_destruct
{
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _Block_copy(self->_getter);
  v7 = [v3 stringWithFormat:@"<%@ %p> asynchronous getter with block %@", v5, self, v6];

  return (NSString *)v7;
}

- (void)getValuesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  getter = self->_getter;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__WFContentPropertyPossibleValuesAsynchronousGetter_getValuesWithCompletionBlock___block_invoke;
  v8[3] = &unk_264288B40;
  id v9 = v4;
  v6 = (void (*)(void *, void *))getter[2];
  id v7 = v4;
  v6(getter, v8);
}

uint64_t __82__WFContentPropertyPossibleValuesAsynchronousGetter_getValuesWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (WFContentPropertyPossibleValuesAsynchronousGetter)initWithAsynchronousGetter:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPropertyPossibleValuesAsynchronousGetter;
  v5 = [(WFContentPropertyPossibleValuesAsynchronousGetter *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id getter = v5->_getter;
    v5->_id getter = v6;

    v8 = v5;
  }

  return v5;
}

@end