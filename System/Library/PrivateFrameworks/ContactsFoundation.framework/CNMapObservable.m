@interface CNMapObservable
+ (id)observableWithBlock:(id)a3;
@end

@implementation CNMapObservable

+ (id)observableWithBlock:(id)a3
{
  id v3 = a3;
  v4 = [(_CNBlockObservable *)[CNMapObservable alloc] initWithBlock:v3];

  v5 = [(CNObservable *)v4 pipelineDescription:&__block_literal_global_35];

  return v5;
}

uint64_t __39__CNMapObservable_observableWithBlock___block_invoke()
{
  return [NSString stringWithFormat:@"Map Observable"];
}

@end