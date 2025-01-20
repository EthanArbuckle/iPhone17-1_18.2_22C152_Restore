@interface XRFollowUpBlock
- (XRFollowUpBlock)initWithBlock:(id)a3 operation:(id)a4;
- (void)go;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation XRFollowUpBlock

- (XRFollowUpBlock)initWithBlock:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XRFollowUpBlock;
  v8 = [(XRFollowUpBlock *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x237DC1050](v6);
    id block = v8->_block;
    v8->_id block = (id)v9;

    objc_storeStrong((id *)&v8->_op, a4);
  }

  return v8;
}

- (void)go
{
  objc_storeStrong((id *)&self->_myselfOrNil, self);
  v8 = self->_op;
  [v8 addObserver:self forKeyPath:@"isFinished" options:1 context:(void *)qword_2687A9970];
  if ([v8 isFinished:v4 withTransitionContext:v5 completion:v6] == YES) {
    sub_23457B374(self);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ((void *)qword_2687A9970 == a6)
  {
    id v14 = v8;
    id v9 = v8;
    if ([v9 isFinishedWithTransitionContext:v10 completion:v11] == YES) {
      sub_23457B374(self);
    }

    id v8 = v14;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myselfOrNil, 0);
  objc_storeStrong((id *)&self->_op, 0);

  objc_storeStrong(&self->_block, 0);
}

@end