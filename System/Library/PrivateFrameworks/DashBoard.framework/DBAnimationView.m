@interface DBAnimationView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (NSArray)keysToAnimate;
- (void)setKeysToAnimate:(id)a3;
@end

@implementation DBAnimationView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBAnimationView;
  if ([(DBAnimationView *)&v8 _shouldAnimatePropertyWithKey:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(DBAnimationView *)self keysToAnimate];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (NSArray)keysToAnimate
{
  return self->_keysToAnimate;
}

- (void)setKeysToAnimate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end