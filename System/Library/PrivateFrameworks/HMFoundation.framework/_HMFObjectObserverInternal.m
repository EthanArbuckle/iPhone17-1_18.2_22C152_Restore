@interface _HMFObjectObserverInternal
- (id)deallocationBlock;
- (void)dealloc;
- (void)setDeallocationBlock:(id)a3;
@end

@implementation _HMFObjectObserverInternal

- (void)dealloc
{
  deallocationBlock = (void (**)(id, SEL))self->_deallocationBlock;
  if (deallocationBlock) {
    deallocationBlock[2](deallocationBlock, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)_HMFObjectObserverInternal;
  [(_HMFObjectObserverInternal *)&v4 dealloc];
}

- (void)setDeallocationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)deallocationBlock
{
  return self->_deallocationBlock;
}

@end