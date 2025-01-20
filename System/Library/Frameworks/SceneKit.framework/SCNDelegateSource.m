@interface SCNDelegateSource
- (BOOL)isOpaque;
- (id)delegate;
- (id)textureSource;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SCNDelegateSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNDelegateSource;
  [(SCNDelegateSource *)&v3 dealloc];
}

- (id)textureSource
{
  objc_super v3 = objc_alloc_init(SCNTextureDelegateSource);
  [(SCNTextureDelegateSource *)v3 setDelegate:[(SCNDelegateSource *)self delegate]];
  return v3;
}

- (BOOL)isOpaque
{
  id v2 = [(SCNDelegateSource *)self delegate];

  return [v2 isOpaque];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

@end