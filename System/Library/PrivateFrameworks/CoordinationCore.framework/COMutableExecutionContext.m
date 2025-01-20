@interface COMutableExecutionContext
- (id)copyWithZone:(_NSZone *)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation COMutableExecutionContext

- (void)setObject:(id)a3 forKey:(id)a4
{
  context = a3;
  id v6 = a4;
  if (![v6 isEqualToString:@"dispatchQueue"]
    || ([MEMORY[0x263EFF9D0] null],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [context isEqual:v7],
        v7,
        (v8 & 1) == 0))
  {
    if ([v6 isEqualToString:@"dispatchQueue"]) {
      dispatch_queue_set_specific(context, "queueSpecificInfo", context, 0);
    }
    v9 = [(COExecutionContext *)self metadata];
    v10 = (void *)[v9 mutableCopy];

    [v10 setObject:context forKey:v6];
    [(COExecutionContext *)self setMetadata:v10];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [COExecutionContext alloc];
  v5 = [(COExecutionContext *)self metadata];
  id v6 = [(COExecutionContext *)v4 initWithMetadata:v5];

  return v6;
}

@end