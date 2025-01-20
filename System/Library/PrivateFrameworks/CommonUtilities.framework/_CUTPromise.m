@interface _CUTPromise
- (BOOL)done;
- (CUTResult)result;
- (OS_dispatch_group)group;
- (OS_dispatch_queue)queue;
- (_CUTPromise)initWithQueue:(id)a3;
- (void)_fulfillWithResult:(id)a3;
- (void)registerResultBlock:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setGroup:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation _CUTPromise

- (_CUTPromise)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CUTPromise;
  v6 = [(CUTUnsafePromise *)&v11 _init];
  v7 = v6;
  if (v6)
  {
    *((unsigned char *)v6 + 24) = 0;
    objc_storeStrong(v6 + 1, a3);
    dispatch_group_t v8 = dispatch_group_create();
    id v9 = v7[2];
    v7[2] = v8;

    dispatch_group_enter((dispatch_group_t)v7[2]);
  }

  return (_CUTPromise *)v7;
}

- (void)_fulfillWithResult:(id)a3
{
  id v5 = a3;
  v6 = [(_CUTPromise *)self queue];
  dispatch_assert_queue_V2(v6);

  if ([(_CUTPromise *)self done])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_CUTPromise.m", 28, @"Invalid parameter not satisfying: %@", @"!self.done" object file lineNumber description];
  }
  [(_CUTPromise *)self setDone:1];
  [(_CUTPromise *)self setResult:v5];

  dispatch_group_t v8 = [(_CUTPromise *)self group];
  dispatch_group_leave(v8);
}

- (void)registerResultBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(_CUTPromise *)self group];
  v6 = [(_CUTPromise *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A355A988;
  v8[3] = &unk_1E5AFEC60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, v8);
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (CUTResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end