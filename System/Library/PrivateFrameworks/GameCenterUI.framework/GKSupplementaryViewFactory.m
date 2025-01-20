@interface GKSupplementaryViewFactory
+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5;
+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6;
- (Class)reusableViewClass;
- (GKSupplementaryViewFactory)initWithClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6;
- (SEL)configurator;
- (SEL)selector;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)target;
- (void)setReusableViewClass:(Class)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation GKSupplementaryViewFactory

+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5
{
  id v7 = a4;
  v8 = [[GKSupplementaryViewFactory alloc] initWithClass:a3 target:v7 configurator:a5 userData:0];

  return v8;
}

+ (id)factoryForClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = [[GKSupplementaryViewFactory alloc] initWithClass:a3 target:v10 configurator:a5 userData:v9];

  return v11;
}

- (GKSupplementaryViewFactory)initWithClass:(Class)a3 target:(id)a4 configurator:(SEL)a5 userData:(id)a6
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKSupplementaryViewFactory;
  id v10 = [(GKSupplementaryViewFactory *)&v17 init];
  if (v10)
  {
    if (v9 && a5 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = NSString;
      v12 = [NSString stringWithFormat:@"Assertion failed"];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewDataSource.m"];
      id v14 = [v13 lastPathComponent];
      v15 = [v11 stringWithFormat:@"%@ ([target respondsToSelector:selector])\n[%s (%s:%d)]", v12, "-[GKSupplementaryViewFactory initWithClass:target:configurator:userData:]", objc_msgSend(v14, "UTF8String"), 169];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
    }
    objc_storeStrong((id *)&v10->_reusableViewClass, a3);
    objc_storeWeak(&v10->_target, v9);
    v10->_configurator = a5;
  }

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = [a3 _gkDequeueSupplementaryViewForClass:self->_reusableViewClass ofKind:a4 forIndexPath:v8];
  id v10 = [(GKSupplementaryViewFactory *)self target];
  if (v10)
  {
    SEL configurator = self->_configurator;

    if (configurator)
    {
      v12 = [(GKSupplementaryViewFactory *)self target];
      objc_msgSend(v12, self->_configurator, v9, v8);
    }
  }

  return v9;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (Class)reusableViewClass
{
  return self->_reusableViewClass;
}

- (void)setReusableViewClass:(Class)a3
{
}

- (SEL)configurator
{
  return self->_configurator;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusableViewClass, 0);

  objc_destroyWeak(&self->_target);
}

@end