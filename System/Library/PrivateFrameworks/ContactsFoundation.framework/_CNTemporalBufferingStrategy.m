@interface _CNTemporalBufferingStrategy
- (CNCancelable)sendToken;
- (_CNTemporalBufferingStrategy)initWithTimeInterval:(double)a3 scheduler:(id)a4;
- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5;
- (void)bufferDidSendResults:(id)a3;
- (void)setSendToken:(id)a3;
@end

@implementation _CNTemporalBufferingStrategy

- (_CNTemporalBufferingStrategy)initWithTimeInterval:(double)a3 scheduler:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNTemporalBufferingStrategy;
  v8 = [(_CNTemporalBufferingStrategy *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_interval = a3;
    objc_storeStrong((id *)&v8->_scheduler, a4);
    v10 = v9;
  }

  return v9;
}

- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(_CNTemporalBufferingStrategy *)self sendToken];

  if (!v9)
  {
    scheduler = self->_scheduler;
    double interval = self->_interval;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __69___CNTemporalBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke;
    v16 = &unk_1E569F310;
    id v17 = v7;
    id v18 = v8;
    objc_super v12 = [(CNScheduler *)scheduler afterDelay:&v13 performBlock:interval];
    -[_CNTemporalBufferingStrategy setSendToken:](self, "setSendToken:", v12, v13, v14, v15, v16);
  }
}

- (void)bufferDidSendResults:(id)a3
{
  v4 = [(_CNTemporalBufferingStrategy *)self sendToken];
  [v4 cancel];

  [(_CNTemporalBufferingStrategy *)self setSendToken:0];
}

- (CNCancelable)sendToken
{
  return (CNCancelable *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendToken, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end