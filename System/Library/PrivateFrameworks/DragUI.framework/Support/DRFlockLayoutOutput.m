@interface DRFlockLayoutOutput
- (BOOL)animatesFlockItemSizeAlongsidePreviewTransition;
- (BOOL)reduceBadgeAnimationSpring;
- (BOOL)shouldHideFlock;
- (DRFlockBadgeLayout)badgeLayout;
- (NSArray)allViews;
- (NSArray)itemLayouts;
- (NSArray)itemViews;
- (NSArray)previewAndImageComponents;
- (NSArray)shownItemModels;
- (UIView)badgeView;
- (double)orientationRotation;
- (unint64_t)touchesCount;
- (void)setAllViews:(id)a3;
- (void)setAnimatesFlockItemSizeAlongsidePreviewTransition:(BOOL)a3;
- (void)setBadgeLayout:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setItemLayouts:(id)a3;
- (void)setItemViews:(id)a3;
- (void)setOrientationRotation:(double)a3;
- (void)setPreviewAndImageComponents:(id)a3;
- (void)setReduceBadgeAnimationSpring:(BOOL)a3;
- (void)setShouldHideFlock:(BOOL)a3;
- (void)setShownItemModels:(id)a3;
- (void)setTouchesCount:(unint64_t)a3;
@end

@implementation DRFlockLayoutOutput

- (NSArray)allViews
{
  return self->_allViews;
}

- (void)setAllViews:(id)a3
{
}

- (NSArray)itemViews
{
  return self->_itemViews;
}

- (void)setItemViews:(id)a3
{
}

- (NSArray)itemLayouts
{
  return self->_itemLayouts;
}

- (void)setItemLayouts:(id)a3
{
}

- (NSArray)shownItemModels
{
  return self->_shownItemModels;
}

- (void)setShownItemModels:(id)a3
{
}

- (NSArray)previewAndImageComponents
{
  return self->_previewAndImageComponents;
}

- (void)setPreviewAndImageComponents:(id)a3
{
}

- (DRFlockBadgeLayout)badgeLayout
{
  return self->_badgeLayout;
}

- (void)setBadgeLayout:(id)a3
{
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (double)orientationRotation
{
  return self->_orientationRotation;
}

- (void)setOrientationRotation:(double)a3
{
  self->_orientationRotation = a3;
}

- (unint64_t)touchesCount
{
  return self->_touchesCount;
}

- (void)setTouchesCount:(unint64_t)a3
{
  self->_touchesCount = a3;
}

- (BOOL)reduceBadgeAnimationSpring
{
  return self->_reduceBadgeAnimationSpring;
}

- (void)setReduceBadgeAnimationSpring:(BOOL)a3
{
  self->_reduceBadgeAnimationSpring = a3;
}

- (BOOL)animatesFlockItemSizeAlongsidePreviewTransition
{
  return self->_animatesFlockItemSizeAlongsidePreviewTransition;
}

- (void)setAnimatesFlockItemSizeAlongsidePreviewTransition:(BOOL)a3
{
  self->_animatesFlockItemSizeAlongsidePreviewTransition = a3;
}

- (BOOL)shouldHideFlock
{
  return self->_shouldHideFlock;
}

- (void)setShouldHideFlock:(BOOL)a3
{
  self->_shouldHideFlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeLayout, 0);
  objc_storeStrong((id *)&self->_previewAndImageComponents, 0);
  objc_storeStrong((id *)&self->_shownItemModels, 0);
  objc_storeStrong((id *)&self->_itemLayouts, 0);
  objc_storeStrong((id *)&self->_itemViews, 0);
  objc_storeStrong((id *)&self->_allViews, 0);
}

@end