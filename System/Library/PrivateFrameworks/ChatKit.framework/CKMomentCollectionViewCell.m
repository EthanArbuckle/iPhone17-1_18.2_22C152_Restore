@interface CKMomentCollectionViewCell
+ (id)reuseIdentifier;
- (CKFullScreenEffect)effect;
- (NSMutableArray)effectViews;
- (void)addEffectView:(id)a3;
- (void)animate;
- (void)prepareForReuse;
- (void)setEffect:(id)a3;
- (void)setEffectViews:(id)a3;
- (void)setupEffectIfNeeded;
- (void)stopAnimation;
@end

@implementation CKMomentCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKMomentCollectionViewCell";
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)CKMomentCollectionViewCell;
  [(CKMomentCollectionViewCell *)&v6 prepareForReuse];
  v3 = [(CKMomentCollectionViewCell *)self contentView];
  v4 = [v3 subviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  v5 = [(CKMomentCollectionViewCell *)self effectViews];
  [v5 removeAllObjects];

  [(CKMomentCollectionViewCell *)self setEffect:0];
}

- (void)addEffectView:(id)a3
{
  id v4 = a3;
  v5 = [(CKMomentCollectionViewCell *)self effectViews];

  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F1CA48] array];
    [(CKMomentCollectionViewCell *)self setEffectViews:v6];
  }
  v7 = [(CKMomentCollectionViewCell *)self contentView];
  [v7 addSubview:v4];

  id v8 = [(CKMomentCollectionViewCell *)self effectViews];
  [v8 addObject:v4];
}

- (void)setupEffectIfNeeded
{
  id v10 = [(CKMomentCollectionViewCell *)self effect];
  v3 = [(CKMomentCollectionViewCell *)self effectViews];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    -[CKMomentCollectionViewCell setClipsToBounds:](self, "setClipsToBounds:", [v10 effectIsDark]);
    if ([v10 layerCount])
    {
      unint64_t v5 = 0;
      int v6 = -2;
      do
      {
        id v7 = objc_alloc((Class)[v10 effectViewClass]);
        [(CKMomentCollectionViewCell *)self bounds];
        id v8 = objc_msgSend(v7, "initWithFrame:");
        [v8 setUserInteractionEnabled:0];
        [(CKMomentCollectionViewCell *)self addEffectView:v8];
        if (v5)
        {
          if (v5 == [v10 layerCount] - 1) {
            unint64_t v9 = 3;
          }
          else {
            unint64_t v9 = v6 / (unint64_t)([v10 layerCount] - 2) + 1;
          }
        }
        else
        {
          unint64_t v9 = 0;
        }
        [v8 setZIndex:v9];

        ++v5;
        v6 += 2;
      }
      while ([v10 layerCount] > v5);
    }
  }
}

- (void)animate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CKMomentCollectionViewCell *)self effectViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) startAnimation];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stopAnimation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CKMomentCollectionViewCell *)self effectViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) stopAnimation];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (CKFullScreenEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (NSMutableArray)effectViews
{
  return self->_effectViews;
}

- (void)setEffectViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectViews, 0);

  objc_storeStrong((id *)&self->_effect, 0);
}

@end