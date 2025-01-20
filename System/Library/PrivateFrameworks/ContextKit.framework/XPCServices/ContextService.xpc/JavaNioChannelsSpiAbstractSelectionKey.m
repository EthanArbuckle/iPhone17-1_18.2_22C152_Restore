@interface JavaNioChannelsSpiAbstractSelectionKey
+ (const)__metadata;
- (BOOL)isValid;
- (JavaNioChannelsSpiAbstractSelectionKey)init;
- (void)cancel;
@end

@implementation JavaNioChannelsSpiAbstractSelectionKey

- (JavaNioChannelsSpiAbstractSelectionKey)init
{
  self->isValid_ = 1;
  return self;
}

- (BOOL)isValid
{
  return self->isValid_;
}

- (void)cancel
{
  if (self->isValid_)
  {
    self->isValid_ = 0;
    id v3 = [(JavaNioChannelsSelectionKey *)self selector];
    objc_opt_class();
    if (!v3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    [v3 cancelWithJavaNioChannelsSelectionKey:self];
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041AAC0;
}

@end