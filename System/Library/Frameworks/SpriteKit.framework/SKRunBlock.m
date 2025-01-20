@interface SKRunBlock
+ (BOOL)supportsSecureCoding;
+ (id)runBlock:(id)a3 queue:(id)a4;
- (SKRunBlock)init;
- (SKRunBlock)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
@end

@implementation SKRunBlock

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRunBlock)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKRunBlock;
  v2 = [(SKAction *)&v7 init];
  v3 = v2;
  if (v2)
  {
    id block = v2->_block;
    v2->_id block = 0;

    queue = v3->_queue;
    v3->_queue = 0;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKRunBlock;
  [(SKAction *)&v5 encodeWithCoder:v4];
  NSLog(&cfstr_SkactionRunBlo.isa);
}

- (SKRunBlock)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKRunBlock;
  objc_super v5 = [(SKAction *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    id block = v5->_block;
    v5->_id block = 0;
  }
  NSLog(&cfstr_SkactionRunBlo_0.isa);

  return v6;
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  id v11 = a3;
  if (![(SKAction *)self finished])
  {
    id block = (void (**)(void))self->_block;
    if (block)
    {
      queue = self->_queue;
      if (queue) {
        dispatch_async(queue, block);
      }
      else {
        ((void (**)(id))block)[2](self->_block);
      }
    }
    v8 = [(SKAction *)self caction];
    v8->var12 = 0;
    objc_super v9 = (SKCNode *)[v11 _backingNode];
    v10.n128_f64[0] = a4;
    SKCAction::didFinishWithTargetAtTime(v8, v9, v10);
  }
}

+ (id)runBlock:(id)a3 queue:(id)a4
{
  id v5 = a3;
  v6 = (OS_dispatch_queue *)a4;
  objc_super v7 = objc_alloc_init(SKRunBlock);
  uint64_t v8 = [v5 copy];
  id block = v7->_block;
  v7->_id block = (id)v8;

  queue = v7->_queue;
  v7->_queue = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end