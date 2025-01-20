@interface SCNActionRunBlock
+ (BOOL)supportsSecureCoding;
+ (id)runBlock:(id)a3 queue:(id)a4;
- (BOOL)isCustom;
- (SCNActionRunBlock)init;
- (SCNActionRunBlock)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithTarget:(id)a3 forTime:(double)a4;
@end

@implementation SCNActionRunBlock

- (SCNActionRunBlock)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunBlock;
  result = [(SCNAction *)&v3 init];
  if (result)
  {
    result->_block = 0;
    result->_queue = 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRunBlock;
  [(SCNAction *)&v3 encodeWithCoder:a3];
  NSLog(&cfstr_ScnactionRunBl.isa);
}

- (BOOL)isCustom
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCNActionRunBlock)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionRunBlock;
  objc_super v3 = [(SCNAction *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v3->_block = 0;
  }
  NSLog(&cfstr_ScnactionRunBl_0.isa);
  return v4;
}

- (void)dealloc
{
  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNActionRunBlock;
  [(SCNAction *)&v4 dealloc];
}

- (void)updateWithTarget:(id)a3 forTime:(double)a4
{
  if (![(SCNAction *)self finished])
  {
    id block = (void (**)(id, id))self->_block;
    if (block)
    {
      queue = self->_queue;
      if (queue)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __46__SCNActionRunBlock_updateWithTarget_forTime___block_invoke;
        v11[3] = &unk_264005FA0;
        v11[4] = self;
        v11[5] = a3;
        dispatch_async(queue, v11);
      }
      else
      {
        block[2](self->_block, a3);
      }
    }
    v9 = [(SCNAction *)self caction];
    v9->var11 = 0;
    v10.n128_f64[0] = a4;
    SCNCAction::didFinishWithTargetAtTime(v9, (SCNNode *)a3, v10);
  }
}

uint64_t __46__SCNActionRunBlock_updateWithTarget_forTime___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

+ (id)runBlock:(id)a3 queue:(id)a4
{
  objc_super v6 = objc_alloc_init(SCNActionRunBlock);
  v6->_id block = (id)[a3 copy];
  v6->_queue = (OS_dispatch_queue *)a4;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionRunBlock;
  objc_super v4 = [(SCNAction *)&v6 copyWithZone:a3];
  v4[2] = [self->_block copy];
  v4[3] = self->_queue;
  return v4;
}

- (id)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return v2;
}

@end