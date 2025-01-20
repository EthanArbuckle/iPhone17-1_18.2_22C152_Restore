@interface NSBlockInvocation
- (SEL)selector;
- (void)invoke;
- (void)invokeSuper;
- (void)invokeUsingIMP:(void *)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation NSBlockInvocation

- (void)invoke
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  v2.receiver = self;
  v2.super_class = (Class)NSBlockInvocation;
  [(NSInvocation *)&v2 invoke];
}

- (SEL)selector
{
  SEL result = (SEL)[self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void)setSelector:(SEL)a3
{
}

- (void)invokeUsingIMP:(void *)a3
{
}

- (void)invokeSuper
{
}

@end