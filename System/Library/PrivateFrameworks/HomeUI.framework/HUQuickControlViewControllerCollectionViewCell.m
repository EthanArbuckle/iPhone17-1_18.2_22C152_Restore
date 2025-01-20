@interface HUQuickControlViewControllerCollectionViewCell
+ (unint64_t)quickControlSizeForItemSize:(unint64_t)a3;
- (HUQuickControlCollectionViewLayoutAttributes)activeLayoutAttributes;
- (void)_updateContentViewControllerForActiveLayoutAttributes;
- (void)applyLayoutAttributes:(id)a3;
- (void)setActiveLayoutAttributes:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation HUQuickControlViewControllerCollectionViewCell

+ (unint64_t)quickControlSizeForItemSize:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 3;
  }
  else {
    return 3 - a3;
  }
}

- (void)_updateContentViewControllerForActiveLayoutAttributes
{
  v3 = objc_opt_class();
  v4 = [(HUQuickControlViewControllerCollectionViewCell *)self activeLayoutAttributes];
  uint64_t v5 = objc_msgSend(v3, "quickControlSizeForItemSize:", objc_msgSend(v4, "itemSize"));
  v6 = [(HUViewControllerCollectionViewCell *)self viewController];
  v7 = [v6 contentViewController];
  [v7 setControlSize:v5];

  id v10 = [(HUQuickControlViewControllerCollectionViewCell *)self activeLayoutAttributes];
  uint64_t v8 = [v10 titlePosition];
  v9 = [(HUViewControllerCollectionViewCell *)self viewController];
  [v9 setTitlePosition:v8];
}

- (void)setActiveLayoutAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_activeLayoutAttributes, a3);

  [(HUQuickControlViewControllerCollectionViewCell *)self _updateContentViewControllerForActiveLayoutAttributes];
}

- (void)setViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlViewControllerCollectionViewCell;
  [(HUViewControllerCollectionViewCell *)&v4 setViewController:a3];
  [(HUQuickControlViewControllerCollectionViewCell *)self _updateContentViewControllerForActiveLayoutAttributes];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlViewControllerCollectionViewCell;
  [(HUQuickControlViewControllerCollectionViewCell *)&v8 applyLayoutAttributes:v4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  [(HUQuickControlViewControllerCollectionViewCell *)self setActiveLayoutAttributes:v7];
}

- (HUQuickControlCollectionViewLayoutAttributes)activeLayoutAttributes
{
  return self->_activeLayoutAttributes;
}

- (void).cxx_destruct
{
}

@end