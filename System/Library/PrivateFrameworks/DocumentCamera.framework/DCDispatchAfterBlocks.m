@interface DCDispatchAfterBlocks
- (DCDispatchAfterBlocks)initWithIdentifier:(id)a3;
- (NSCopying)identifier;
- (void)cancelAll;
- (void)dealloc;
- (void)dispatchAfter:(double)a3 withBlock:(id)a4;
- (void)performBlock:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation DCDispatchAfterBlocks

- (DCDispatchAfterBlocks)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DCDispatchAfterBlocks;
  v5 = [(DCDispatchAfterBlocks *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DCDispatchAfterBlocks *)v5 setIdentifier:v4];
  }

  return v6;
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)DCDispatchAfterBlocks;
  [(DCDispatchAfterBlocks *)&v3 dealloc];
}

- (void)dispatchAfter:(double)a3 withBlock:(id)a4
{
  id v7 = (id)[a4 copy];
  v6 = (void *)MEMORY[0x21D44FA30]();
  [(DCDispatchAfterBlocks *)self performSelector:sel_performBlock_ withObject:v6 afterDelay:a3];
}

- (void)performBlock:(id)a3
{
}

- (void)cancelAll
{
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end