@interface _CNCombinedBufferingStrategy
- (_CNCombinedBufferingStrategy)initWithStrategies:(id)a3;
- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5;
- (void)bufferDidSendResults:(id)a3;
- (void)eachStrategy:(id)a3;
@end

@implementation _CNCombinedBufferingStrategy

- (_CNCombinedBufferingStrategy)initWithStrategies:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNCombinedBufferingStrategy;
  v5 = [(_CNCombinedBufferingStrategy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    strategies = v5->_strategies;
    v5->_strategies = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)eachStrategy:(id)a3
{
}

- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69___CNCombinedBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke;
  v14[3] = &unk_1E56A26B0;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_CNCombinedBufferingStrategy *)self eachStrategy:v14];
}

- (void)bufferDidSendResults:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53___CNCombinedBufferingStrategy_bufferDidSendResults___block_invoke;
  v6[3] = &unk_1E56A26D8;
  id v7 = v4;
  id v5 = v4;
  [(_CNCombinedBufferingStrategy *)self eachStrategy:v6];
}

- (void).cxx_destruct
{
}

@end