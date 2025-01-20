@interface JavaNioPipeImpl
+ (const)__metadata;
- (JavaNioPipeImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)sink;
- (id)source;
- (void)dealloc;
@end

@implementation JavaNioPipeImpl

- (JavaNioPipeImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (id)sink
{
  return self->sink_;
}

- (id)source
{
  return self->source_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioPipeImpl;
  [(JavaNioPipeImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FBA18;
}

@end