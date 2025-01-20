@interface AMUIPosterPhotosAppearanceTransitionCoordinator
- (unint64_t)visibleSnapshotLayers;
- (void)setPosterViewController:(id)a3 progress:(double)a4;
@end

@implementation AMUIPosterPhotosAppearanceTransitionCoordinator

- (void)setPosterViewController:(id)a3 progress:(double)a4
{
  id v5 = [a3 _posterViewController];
  [v5 setOpacity:2 forLayers:a4];
}

- (unint64_t)visibleSnapshotLayers
{
  return 3;
}

@end