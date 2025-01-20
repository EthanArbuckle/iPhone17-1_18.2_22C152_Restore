@interface HUQuickControlCollectionView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (HUQuickControlCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (HUScrollGestureRecognitionResolver)scrollGestureResolver;
@end

@implementation HUQuickControlCollectionView

- (HUQuickControlCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlCollectionView;
  v4 = -[HUQuickControlCollectionView initWithFrame:collectionViewLayout:](&v10, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_alloc_init(HUScrollGestureRecognitionResolver);
    scrollGestureResolver = v4->_scrollGestureResolver;
    v4->_scrollGestureResolver = v5;

    [(HUScrollGestureRecognitionResolver *)v4->_scrollGestureResolver setConflictingGestureActivationDelay:0.0];
    v7 = v4->_scrollGestureResolver;
    v8 = [(HUQuickControlCollectionView *)v4 panGestureRecognizer];
    [(HUScrollGestureRecognitionResolver *)v7 addPanGestureRecognizer:v8];

    [(HUQuickControlCollectionView *)v4 setDirectionalLockEnabled:1];
  }
  return v4;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  if ([v4 isDescendantOfView:self])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlCollectionView;
    BOOL v5 = [(HUQuickControlCollectionView *)&v7 touchesShouldCancelInContentView:v4];
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUQuickControlCollectionView *)self panGestureRecognizer];
  if (v9 == v7)
  {
    objc_super v10 = [v8 view];
    int v11 = [v10 isDescendantOfView:self];

    if (v11)
    {
      v12 = [(HUQuickControlCollectionView *)self scrollGestureResolver];
      [v12 addConflictingGestureRecognizer:v8];

      BOOL v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (objc_msgSend((id)+[HUQuickControlCollectionView superclass](HUQuickControlCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUQuickControlCollectionView;
    BOOL v13 = [(HUQuickControlCollectionView *)&v15 gestureRecognizer:v7 shouldRecognizeSimultaneouslyWithGestureRecognizer:v8];
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_8:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HUQuickControlCollectionView *)self panGestureRecognizer];
  if (v9 != v7) {
    goto LABEL_6;
  }
  objc_super v10 = [v8 view];
  if (([v10 isDescendantOfView:self] & 1) == 0)
  {

    id v9 = v7;
LABEL_6:

    goto LABEL_7;
  }
  int v11 = [v8 view];
  char v12 = objc_msgSend(v11, "hu_isDescendantOfPickerView");

  if (v12)
  {
    BOOL v13 = 1;
    goto LABEL_10;
  }
LABEL_7:
  if (objc_msgSend((id)+[HUQuickControlCollectionView superclass](HUQuickControlCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUQuickControlCollectionView;
    BOOL v13 = [(HUQuickControlCollectionView *)&v15 gestureRecognizer:v7 shouldRequireFailureOfGestureRecognizer:v8];
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_10:

  return v13;
}

- (HUScrollGestureRecognitionResolver)scrollGestureResolver
{
  return self->_scrollGestureResolver;
}

- (void).cxx_destruct
{
}

@end