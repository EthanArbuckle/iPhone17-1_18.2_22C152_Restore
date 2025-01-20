@interface ACXIDSReplyContext
- (ACXIDSReplyContext)initWithTimeout:(double)a3 queue:(id)a4 logDescription:(id)a5 sentID:(id)a6 replyHandler:(id)a7 completion:(id)a8;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timeoutTimer;
- (id)completion;
- (id)replyBlock;
- (void)runReplyHandlerWithMessage:(id)a3 error:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplyBlock:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation ACXIDSReplyContext

- (ACXIDSReplyContext)initWithTimeout:(double)a3 queue:(id)a4 logDescription:(id)a5 sentID:(id)a6 replyHandler:(id)a7 completion:(id)a8
{
  v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ACXIDSReplyContext;
  v19 = [(ACXIDSReplyContext *)&v30 init];
  if (v19)
  {
    id v20 = [v17 copy];
    [(ACXIDSReplyContext *)v19 setReplyBlock:v20];

    id v21 = [v18 copy];
    [(ACXIDSReplyContext *)v19 setCompletion:v21];

    [(ACXIDSReplyContext *)v19 setQueue:v14];
    v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
    dispatch_time_t v23 = dispatch_time(0, 1000000000 * (unint64_t)a3);
    dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100018614;
    handler[3] = &unk_10008CA40;
    id v27 = v15;
    id v28 = v16;
    v24 = v19;
    v29 = v24;
    dispatch_source_set_event_handler(v22, handler);
    [(ACXIDSReplyContext *)v24 setTimeoutTimer:v22];
    dispatch_resume(v22);
  }
  return v19;
}

- (void)runReplyHandlerWithMessage:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ACXIDSReplyContext *)self replyBlock];
  ((void (**)(void, id, id))v8)[2](v8, v7, v6);

  [(ACXIDSReplyContext *)self setReplyBlock:0];
  v9 = [(ACXIDSReplyContext *)self completion];
  v9[2]();

  [(ACXIDSReplyContext *)self setCompletion:0];
  v10 = [(ACXIDSReplyContext *)self timeoutTimer];
  dispatch_source_cancel(v10);

  [(ACXIDSReplyContext *)self setTimeoutTimer:0];
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (id)replyBlock
{
  return self->_replyBlock;
}

- (void)setReplyBlock:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_replyBlock, 0);

  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end